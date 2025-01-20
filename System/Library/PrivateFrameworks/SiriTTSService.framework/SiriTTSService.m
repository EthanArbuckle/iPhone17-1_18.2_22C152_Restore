void *sub_100004780(uint64_t a1)
{
  unsigned char *v1;
  void *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  char *v22;
  int64_t v23;
  unsigned char *v24;
  int64_t v26;

  if (qword_100039550 != -1) {
LABEL_34:
  }
    swift_once();
  objc_msgSend((id)qword_100039628, "lock", v22);
  if (qword_100039548 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v1 = off_100039620;
  v2 = (void *)qword_100039628;
  swift_bridgeObjectRetain();
  [v2 unlock];
  v3 = 0;
  v22 = v1 + 64;
  v4 = 1 << v1[32];
  v5 = -1;
  if (v4 < 64) {
    v5 = ~(-1 << v4);
  }
  v6 = v5 & *((void *)v1 + 8);
  v23 = (unint64_t)(v4 + 63) >> 6;
  v24 = v1;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v26 = v3;
      v10 = v9 | (v3 << 6);
      goto LABEL_23;
    }
    v11 = __OFADD__(v3, 1);
    v12 = v3 + 1;
    if (v11)
    {
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v12 >= v23) {
      goto LABEL_31;
    }
    v13 = *(void *)&v22[8 * v12];
    if (!v13) {
      break;
    }
LABEL_22:
    v6 = (v13 - 1) & v13;
    v26 = v12;
    v10 = __clz(__rbit64(v13)) + (v12 << 6);
LABEL_23:
    v15 = *(void *)(*((void *)v24 + 7) + 8 * v10);
    v16 = *(void **)(v15 + 40);
    swift_retain();
    [v16 lock];
    v17 = *(void **)(v15 + 32);
    if (v17)
    {
      v18 = v17;
      v19 = TaskOperation.delegate.getter();
      swift_unknownObjectRelease();
      if (v19 == a1)
      {
        v20 = v18;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    swift_beginAccess();
    swift_unknownObjectRetain();
    v7 = swift_bridgeObjectRetain();
    v8 = sub_10000BA70(v7, a1);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    sub_10000A2C4((unint64_t)v8, (unint64_t *)&type metadata accessor for TaskOperation, &qword_100039760, &qword_100039758, (uint64_t *)sub_10001D554);
    [v16 unlock];
    sub_10000A2C4((unint64_t)&_swiftEmptyArrayStorage, (unint64_t *)&type metadata accessor for TaskOperation, &qword_100039760, &qword_100039758, (uint64_t *)sub_10001D554);
    swift_release();
    v3 = v26;
  }
  v14 = v12 + 1;
  if (v12 + 1 >= v23) {
    goto LABEL_31;
  }
  v13 = *(void *)&v22[8 * v14];
  if (v13) {
    goto LABEL_21;
  }
  v14 = v12 + 2;
  if (v12 + 2 >= v23) {
    goto LABEL_31;
  }
  v13 = *(void *)&v22[8 * v14];
  if (v13)
  {
LABEL_21:
    v12 = v14;
    goto LABEL_22;
  }
  v14 = v12 + 3;
  if (v12 + 3 < v23)
  {
    v13 = *(void *)&v22[8 * v14];
    if (!v13)
    {
      while (1)
      {
        v12 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_33;
        }
        if (v12 >= v23) {
          goto LABEL_31;
        }
        v13 = *(void *)&v22[8 * v12];
        ++v14;
        if (v13) {
          goto LABEL_22;
        }
      }
    }
    goto LABEL_21;
  }
LABEL_31:
  swift_release();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100004C08(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000066B4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1, (void (*)(void))&type metadata accessor for SynthesisVoice, &qword_100039770, &qword_100039768, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10001D5C0);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return specialized Array._endMutation()();
}

id sub_100004E6C(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate] = a1;
  type metadata accessor for Preferences();
  uint64_t v4 = v2;
  swift_unknownObjectRetain();
  *(void *)&v4[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_preferences] = static Preferences.shared.getter();
  uint64_t v5 = &v4[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_entitlements];
  uint64_t v6 = type metadata accessor for Entitlements();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  type metadata accessor for TrialAssetProvider();
  swift_allocObject();
  *(void *)&v4[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_trialAssetProvider] = TrialAssetProvider.init()();
  if (qword_100039560 != -1) {
    swift_once();
  }
  *(void *)&v4[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_subscriptionService] = qword_10003A0D8;
  swift_retain();

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for DaemonXPCHandler(0);
  id v8 = objc_msgSendSuper2(&v10, "init");
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v8;
}

unint64_t sub_100005114()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v36 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v32 - v5;
  static Logger.service.getter();
  uint64_t v7 = v0;
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  v37 = v7;
  if (v10)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    v38 = v7;
    uint64_t v12 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v35 = v37;

    uint64_t v7 = v37;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalidate DaemonXPCHandler, %@", v11, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v8 = v7;
  }

  BOOL v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v35 = (void *)(v2 + 8);
  v13(v6, v1);
  unint64_t result = (unint64_t)sub_100004780(*(uint64_t *)((char *)&v7->isa
                                                      + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate));
  unint64_t v15 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v16 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v16 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v16) {
      goto LABEL_13;
    }
  }
  if (v16 < 1)
  {
    __break(1u);
    goto LABEL_21;
  }
  for (uint64_t i = 0; i != v16; ++i)
  {
    if ((v15 & 0xC000000000000001) != 0) {
      id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v18 = *(id *)(v15 + 8 * i + 32);
    }
    v19 = v18;
    [v18 cancel];
  }
LABEL_13:
  v34 = v13;
  unint64_t result = swift_bridgeObjectRelease();
  uint64_t v20 = OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession;
  v21 = v37;
  if (!*(Class *)((char *)&v37->isa + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession)) {
    return result;
  }
  type metadata accessor for EngineCachingService();
  static EngineCachingService.shared.getter();
  unint64_t result = dispatch thunk of EngineCachingService.activeSessionCount.modify();
  uint64_t v23 = *v22 - 1;
  if (__OFSUB__(*v22, 1))
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v33 = v1;
  uint64_t *v22 = v23;
  ((void (*)(NSObject **, void))result)(&v38, 0);
  swift_release();
  static Logger.service.getter();
  v24 = v21;
  v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138412546;
    v38 = v24;
    v29 = v24;
    uint64_t v32 = v20;
    v30 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v28 = v24;

    *(_WORD *)(v27 + 12) = 2048;
    uint64_t v20 = v32;
    static EngineCachingService.shared.getter();
    uint64_t v31 = dispatch thunk of EngineCachingService.activeSessionCount.getter();
    swift_release();
    v38 = v31;
    v21 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "DaemonXPCHandler %@ invalidated, total active session count: %ld", (uint8_t *)v27, 0x16u);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    v25 = v24;
  }

  v34(v36, v33);
  *(Class *)((char *)&v21->isa + v20) = 0;
  return swift_unknownObjectRelease();
}

unint64_t sub_1000055E0(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  id v8 = a1;
  os_log_type_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v17 = a2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = v5;
    uint64_t v12 = (uint8_t *)v11;
    unint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v18 = v8;
    BOOL v13 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v15 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "XPC connection invalidated, %@", v12, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v16;
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_100005114();
}

uint64_t sub_1000057F0(void *a1)
{
  uint64_t v2 = type metadata accessor for Entitlements();
  uint64_t v59 = *(void *)(v2 - 8);
  uint64_t v60 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v57 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v58 = (char *)&v55 - v5;
  uint64_t v6 = (void *)type metadata accessor for Logger();
  uint64_t v7 = *(v6 - 1);
  __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  v61 = a1;
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v56 = v6;
    uint64_t v14 = (void *)v13;
    *(_DWORD *)uint64_t v12 = 138412290;
    uint64_t v55 = v7;
    unint64_t v15 = v61;
    aBlock = (void **)&v61->isa;
    uint64_t v16 = v61;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v14 = v15;
    uint64_t v7 = v55;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received new connection, %@", v12, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    uint64_t v6 = v56;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v10 = v61;
  }

  (*(void (**)(char *, void *))(v7 + 8))(v9, v6);
  v56 = self;
  id v17 = [v56 interfaceWithProtocol:&OBJC_PROTOCOL____TtP14SiriTTSService14DaemonProtocol_];
  uint64_t v18 = static DaemonXPCAllowedTypeSets.PreviewRequestTypes.getter();
  sub_1000060FC(v18);
  swift_bridgeObjectRelease();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:isa forSelector:"speakWithPreviewRequest:reply:" argumentIndex:0 ofReply:0];

  uint64_t v20 = static DaemonXPCAllowedTypeSets.AudioRequestTypes.getter();
  sub_1000060FC(v20);
  swift_bridgeObjectRelease();
  Class v21 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:v21 forSelector:"speakWithAudioRequest:reply:" argumentIndex:0 ofReply:0];

  uint64_t v22 = static DaemonXPCAllowedTypeSets.SpeechRequestTypes.getter();
  sub_1000060FC(v22);
  swift_bridgeObjectRelease();
  Class v23 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:v23 forSelector:"speakWithSpeechRequest:reply:" argumentIndex:0 ofReply:0];

  uint64_t v24 = static DaemonXPCAllowedTypeSets.AllRequestsTypes.getter();
  sub_1000060FC(v24);
  swift_bridgeObjectRelease();
  Class v25 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:v25 forSelector:"cancelWithRequest:" argumentIndex:0 ofReply:0];

  uint64_t v26 = static DaemonXPCAllowedTypeSets.PhonemeRequestTypes.getter();
  sub_1000060FC(v26);
  swift_bridgeObjectRelease();
  Class v27 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:v27 forSelector:"textToPhonemeWithRequest:reply:" argumentIndex:0 ofReply:0];

  sub_100006560((uint64_t *)&unk_100039E30);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10002F170;
  uint64_t v29 = sub_100006524(0, &qword_100039F10);
  *(void *)(v28 + 56) = sub_100006560(&qword_100039F18);
  *(void *)(v28 + 32) = v29;
  uint64_t v30 = type metadata accessor for SynthesisVoice();
  uint64_t v31 = sub_100006560(&qword_100039F20);
  *(void *)(v28 + 88) = v31;
  *(void *)(v28 + 64) = v30;
  sub_100006524(0, &qword_100039F28);
  uint64_t v32 = NSSet.init(arrayLiteral:)();
  sub_100006524(0, &qword_100039F30);
  sub_1000065AC();
  uint64_t v33 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1000060FC(v33);
  swift_bridgeObjectRelease();
  Class v34 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:v34 forSelector:"subscribeWithVoices:clientId:accessoryId:reply:" argumentIndex:0 ofReply:0];

  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_10002EE70;
  *(void *)(v35 + 56) = v31;
  *(void *)(v35 + 32) = v30;
  v36 = NSSet.init(arrayLiteral:)();
  uint64_t v37 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1000060FC(v37);
  swift_bridgeObjectRelease();
  Class v38 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setClasses:v38 forSelector:"queryPhaticCapabilityWithVoice:reply:" argumentIndex:0 ofReply:0];

  v39 = v61;
  [v61 setExportedInterface:v17];
  v56 = [v56 interfaceWithProtocol:&OBJC_PROTOCOL____TtP14SiriTTSService22DaemonDelegateProtocol_];
  [v39 setRemoteObjectInterface:v56];
  v40 = v39;
  v41 = v58;
  Entitlements.init(connection:)();
  v66 = sub_100019638;
  uint64_t v67 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v63 = 1107296256;
  v64 = sub_10001986C;
  v65 = &unk_100035E80;
  v42 = _Block_copy(&aBlock);
  id v43 = [v40 remoteObjectProxyWithErrorHandler:v42];
  _Block_release(v42);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100006560((uint64_t *)&unk_100039E00);
  swift_dynamicCast();
  uint64_t v45 = v59;
  uint64_t v44 = v60;
  uint64_t v46 = (uint64_t)v57;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v57, v41, v60);
  id v47 = objc_allocWithZone((Class)type metadata accessor for DaemonXPCHandler(0));
  uint64_t v48 = swift_unknownObjectRetain();
  id v49 = sub_100004E6C(v48, v46);
  swift_unknownObjectRelease();
  [v40 setExportedObject:v49];
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v40;
  *(void *)(v50 + 24) = v49;
  v66 = sub_100006930;
  uint64_t v67 = v50;
  aBlock = _NSConcreteStackBlock;
  uint64_t v63 = 1107296256;
  v64 = sub_1000068EC;
  v65 = &unk_100035ED0;
  v51 = _Block_copy(&aBlock);
  v52 = v40;
  id v53 = v49;
  swift_release();
  [v52 setInvalidationHandler:v51];
  _Block_release(v51);
  [v52 resume];

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v41, v44);
  return 1;
}

uint64_t sub_1000060FC(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (__CocoaSet.count.getter()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = &_swiftEmptySetSingleton;
    if (v2) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v30 = v1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v1 + 56);
    swift_bridgeObjectRetain();
    uint64_t result = swift_retain();
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  sub_100006560(&qword_100039F40);
  uint64_t v3 = (void *)static _SetStorage.allocate(capacity:)();
  if (!v2) {
    goto LABEL_7;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  __CocoaSet.makeIterator()();
  sub_100006524(0, &qword_100039F30);
  sub_1000065AC();
  uint64_t result = Set.Iterator.init(_cocoa:)();
  uint64_t v1 = v34;
  uint64_t v30 = v35;
  uint64_t v5 = v36;
  uint64_t v6 = v37;
  unint64_t v7 = v38;
LABEL_11:
  int64_t v29 = (unint64_t)(v5 + 64) >> 6;
  os_log_type_t v11 = (char *)(v3 + 7);
  while (v1 < 0)
  {
    uint64_t v16 = __CocoaSet.Iterator.next()();
    if (!v16) {
      goto LABEL_45;
    }
    *(void *)&long long v31 = v16;
    sub_100006524(0, &qword_100039F30);
    swift_dynamicCast();
LABEL_36:
    sub_100006524(0, &qword_100039F30);
    swift_dynamicCast();
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v22 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)&v11[8 * (v23 >> 6)]) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)&v11[8 * (v23 >> 6)])) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_46;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)&v11[8 * v24];
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)&v11[(v12 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v12;
    uint64_t v13 = v3[6] + 40 * v12;
    *(_OWORD *)uint64_t v13 = v31;
    *(_OWORD *)(v13 + 16) = v32;
    *(void *)(v13 + 32) = v33;
    ++v3[2];
  }
  if (v7)
  {
    unint64_t v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v15 = v14 | (v6 << 6);
LABEL_35:
    id v21 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    goto LABEL_36;
  }
  int64_t v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v29) {
      goto LABEL_45;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v17);
    uint64_t v19 = v6 + 1;
    if (!v18)
    {
      uint64_t v19 = v6 + 2;
      if (v6 + 2 >= v29) {
        goto LABEL_45;
      }
      unint64_t v18 = *(void *)(v30 + 8 * v19);
      if (!v18)
      {
        uint64_t v19 = v6 + 3;
        if (v6 + 3 >= v29) {
          goto LABEL_45;
        }
        unint64_t v18 = *(void *)(v30 + 8 * v19);
        if (!v18)
        {
          uint64_t v19 = v6 + 4;
          if (v6 + 4 >= v29) {
            goto LABEL_45;
          }
          unint64_t v18 = *(void *)(v30 + 8 * v19);
          if (!v18)
          {
            uint64_t v19 = v6 + 5;
            if (v6 + 5 >= v29) {
              goto LABEL_45;
            }
            unint64_t v18 = *(void *)(v30 + 8 * v19);
            if (!v18)
            {
              uint64_t v20 = v6 + 6;
              while (v29 != v20)
              {
                unint64_t v18 = *(void *)(v30 + 8 * v20++);
                if (v18)
                {
                  uint64_t v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_1000065A4();
              return (uint64_t)v3;
            }
          }
        }
      }
    }
LABEL_34:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v19 << 6);
    uint64_t v6 = v19;
    goto LABEL_35;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_100006524(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006560(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000065A4()
{
  return swift_release();
}

unint64_t sub_1000065AC()
{
  unint64_t result = qword_100039F38;
  if (!qword_100039F38)
  {
    sub_100006524(255, &qword_100039F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039F38);
  }
  return result;
}

uint64_t sub_100006614()
{
  return swift_release();
}

uint64_t sub_10000661C()
{
  return swift_release();
}

uint64_t sub_100006624()
{
  return swift_release();
}

uint64_t sub_10000662C()
{
  return swift_release();
}

uint64_t sub_100006634()
{
  return swift_release();
}

uint64_t sub_10000663C()
{
  return swift_release();
}

uint64_t sub_100006644(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006654(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006664(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006674(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006684(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006694(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000066B4(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_10000BDC4(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = sub_100006560(a6);
          uint64_t v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          id v24 = *v23;
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000068EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

unint64_t sub_100006930()
{
  return sub_1000055E0(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100006938(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for DaemonXPCHandler(uint64_t a1)
{
  return sub_100006938(a1, (uint64_t *)&unk_100039D90);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v119 = *(void *)(v3 - 8);
  uint64_t v120 = v3;
  __chkstk_darwin(v3);
  v105 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v117 = *(void *)(v5 - 8);
  uint64_t v118 = v5;
  __chkstk_darwin(v5);
  v116 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTimeInterval();
  uint64_t v111 = *(void *)(v7 - 8);
  uint64_t v112 = v7;
  __chkstk_darwin(v7);
  v110 = (uint64_t *)((char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for DispatchTime();
  uint64_t v114 = *(void *)(v9 - 8);
  uint64_t v115 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  v109 = (char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v113 = (char *)&v100 - v12;
  uint64_t v108 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v107 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  v106 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006560((uint64_t *)&unk_10003A090);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v102 = (uint64_t)&v100 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v103 = (char *)&v100 - v17;
  uint64_t v18 = type metadata accessor for Logger();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  v104 = (char *)&v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  v121 = (char *)&v100 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  unint64_t v26 = (char *)&v100 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  int64_t v29 = (char *)&v100 - v28;
  __chkstk_darwin(v27);
  long long v31 = (char *)&v100 - v30;
  static Logger.service.getter();
  long long v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "sirittsd starting...", v34, 2u);
    swift_slowDealloc();
  }

  uint64_t v35 = *(char **)(v19 + 8);
  ((void (*)(char *, uint64_t))v35)(v31, v18);
  static Logger.service.getter();
  uint64_t v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.info.getter();
  uint64_t v38 = v18;
  if (os_log_type_enabled(v36, v37))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "sirittsd entering sandbox...", v39, 2u);
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v35)(v29, v18);
  sub_10002CE88();
  static Logger.service.getter();
  v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Getting group container access...", v42, 2u);
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v35)(v26, v18);
  sub_1000078C4(v14, qword_10003A0A0);
  uint64_t v43 = sub_100007928(v14, (uint64_t)qword_10003A0A0);
  id v44 = [self defaultManager];
  NSString v45 = String._bridgeToObjectiveC()();
  id v46 = [v44 containerURLForSecurityApplicationGroupIdentifier:v45];

  if (v46)
  {
    uint64_t v47 = (uint64_t)v103;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v48 = type metadata accessor for URL();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 0, 1, v48);
  }
  else
  {
    uint64_t v49 = type metadata accessor for URL();
    uint64_t v47 = (uint64_t)v103;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v103, 1, 1, v49);
  }
  uint64_t v50 = v121;
  sub_100007960(v47, v43);
  static Logger.service.getter();
  v51 = Logger.logObject.getter();
  os_log_type_t v52 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v103 = v35;
    uint64_t v101 = v38;
    id v53 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v53 = 136315138;
    uint64_t v54 = v102;
    sub_10000815C(v43, v102);
    uint64_t v55 = type metadata accessor for URL();
    uint64_t v56 = *(void *)(v55 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v54, 1, v55) == 1)
    {
      sub_1000081C4(v54);
      object = (void *)0xE400000000000000;
      uint64_t countAndFlagsBits = 1819047278;
    }
    else
    {
      Swift::String v61 = URL.path(percentEncoded:)(1);
      uint64_t countAndFlagsBits = v61._countAndFlagsBits;
      object = v61._object;
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
    }
    v122 = (void *)sub_100007B04(countAndFlagsBits, (unint64_t)object, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Group container URL: %s", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v59 = v121;
    uint64_t v38 = v101;
    uint64_t v60 = v101;
    uint64_t v35 = v103;
  }
  else
  {

    uint64_t v59 = v50;
    uint64_t v60 = v38;
  }
  ((void (*)(char *, uint64_t))v35)(v59, v60);
  v62 = v105;
  uint64_t v63 = v104;
  qword_10003A0B8 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for DaemonXPCListener()) init];
  (*(void (**)(void))((swift_isaMask & *(void *)qword_10003A0B8) + 0x58))();
  static Logger.service.getter();
  v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v66 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "sirittsd is ready to serve...", v66, 2u);
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v35)(v63, v38);
  sub_100006560(&qword_100039530);
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_10002EDE0;
  updated = (char *)Activity.voiceUpdateActivity.unsafeMutableAddressor();
  uint64_t v69 = *((void *)updated + 3);
  long long v70 = *(_OWORD *)(updated + 8);
  *(void *)(v67 + 32) = *(void *)updated;
  *(_OWORD *)(v67 + 40) = v70;
  *(void *)(v67 + 56) = v69;
  swift_bridgeObjectRetain();
  swift_retain();
  v71 = (char *)Activity.cleanUpActivity.unsafeMutableAddressor();
  uint64_t v72 = *((void *)v71 + 3);
  long long v73 = *(_OWORD *)(v71 + 8);
  *(void *)(v67 + 64) = *(void *)v71;
  *(_OWORD *)(v67 + 72) = v73;
  *(void *)(v67 + 88) = v72;
  swift_bridgeObjectRetain();
  swift_retain();
  v74 = (char *)Activity.weeklyVoiceUpdateActivity.unsafeMutableAddressor();
  uint64_t v75 = *((void *)v74 + 3);
  long long v76 = *(_OWORD *)(v74 + 8);
  *(void *)(v67 + 96) = *(void *)v74;
  *(_OWORD *)(v67 + 104) = v76;
  *(void *)(v67 + 120) = v75;
  swift_bridgeObjectRetain();
  swift_retain();
  v77 = (char *)Activity.neuralCompiling.unsafeMutableAddressor();
  uint64_t v78 = *((void *)v77 + 3);
  long long v79 = *(_OWORD *)(v77 + 8);
  *(void *)(v67 + 128) = *(void *)v77;
  *(_OWORD *)(v67 + 136) = v79;
  *(void *)(v67 + 152) = v78;
  swift_bridgeObjectRetain();
  swift_retain();
  v80 = (char *)Activity.postInstall.unsafeMutableAddressor();
  uint64_t v81 = *((void *)v80 + 3);
  long long v82 = *(_OWORD *)(v80 + 8);
  *(void *)(v67 + 160) = *(void *)v80;
  *(_OWORD *)(v67 + 168) = v82;
  *(void *)(v67 + 184) = v81;
  qword_10003A0C0 = v67;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  Activity.checkIn()();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_retain();
  Activity.checkIn()();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_retain();
  Activity.checkIn()();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_retain();
  Activity.checkIn()();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_retain();
  Activity.checkIn()();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000079C8();
  uint64_t v83 = v107;
  v84 = v106;
  uint64_t v85 = v108;
  (*(void (**)(char *, void, uint64_t))(v107 + 104))(v106, enum case for DispatchQoS.QoSClass.background(_:), v108);
  v121 = (char *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v85);
  v86 = v109;
  static DispatchTime.now()();
  v88 = v110;
  uint64_t v87 = v111;
  void *v110 = 5;
  uint64_t v89 = v112;
  (*(void (**)(void *, void, uint64_t))(v87 + 104))(v88, enum case for DispatchTimeInterval.seconds(_:), v112);
  v90 = v113;
  + infix(_:_:)();
  (*(void (**)(void *, uint64_t))(v87 + 8))(v88, v89);
  uint64_t v91 = v115;
  v92 = *(void (**)(char *, uint64_t))(v114 + 8);
  v92(v86, v115);
  aBlock[4] = (uint64_t)sub_100007850;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000068EC;
  aBlock[3] = (uint64_t)&unk_100035460;
  v93 = _Block_copy(aBlock);
  v94 = v116;
  static DispatchQoS.unspecified.getter();
  v122 = &_swiftEmptyArrayStorage;
  sub_100007A08();
  sub_100006560(&qword_100039538);
  sub_100007A60();
  v95 = v62;
  uint64_t v96 = v120;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v97 = v121;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v93);

  (*(void (**)(char *, uint64_t))(v119 + 8))(v95, v96);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v94, v118);
  v92(v90, v91);
  id v98 = [self currentRunLoop];
  [v98 run];

  return 0;
}

uint64_t sub_100007850()
{
  type metadata accessor for BackgroundLoader();
  swift_allocObject();
  uint64_t v0 = BackgroundLoader.init()();
  (*(void (**)(uint64_t))(*(void *)v0 + 128))(v0);
  return swift_release();
}

uint64_t *sub_1000078C4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007928(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006560((uint64_t *)&unk_10003A090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000079C8()
{
  unint64_t result = qword_100039750;
  if (!qword_100039750)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100039750);
  }
  return result;
}

unint64_t sub_100007A08()
{
  unint64_t result = qword_1000397A0;
  if (!qword_1000397A0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000397A0);
  }
  return result;
}

unint64_t sub_100007A60()
{
  unint64_t result = qword_1000397B0;
  if (!qword_1000397B0)
  {
    sub_100007ABC(&qword_100039538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000397B0);
  }
  return result;
}

uint64_t sub_100007ABC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007B04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007BD8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008274((uint64_t)v12, *a3);
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
      sub_100008274((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008224((uint64_t)v12);
  return v7;
}

uint64_t sub_100007BD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100007D94(a5, a6);
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

uint64_t sub_100007D94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007E2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000800C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000800C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007E2C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007FA4(v2, 0);
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

void *sub_100007FA4(uint64_t a1, uint64_t a2)
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
  sub_100006560(&qword_10003A050);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000800C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006560(&qword_10003A050);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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

uint64_t sub_10000815C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006560((uint64_t *)&unk_10003A090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000081C4(uint64_t a1)
{
  uint64_t v2 = sub_100006560((uint64_t *)&unk_10003A090);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008224(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008274(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000082D4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t variable initialization expression of BackgroundLoader.backgroundQueue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  sub_1000079C8();
  static DispatchQoS.background.getter();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_1000084DC();
  sub_100006560((uint64_t *)&unk_10003A080);
  sub_100008534();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

unint64_t sub_1000084DC()
{
  unint64_t result = qword_100039EE0;
  if (!qword_100039EE0)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039EE0);
  }
  return result;
}

unint64_t sub_100008534()
{
  unint64_t result = qword_100039EF0;
  if (!qword_100039EF0)
  {
    sub_100007ABC((uint64_t *)&unk_10003A080);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039EF0);
  }
  return result;
}

uint64_t variable initialization expression of BackgroundLoader.voiceUpdateObserver()
{
  return 0;
}

uint64_t type metadata accessor for HomeManager()
{
  return self;
}

void type metadata accessor for AFPowerContextOption()
{
  if (!qword_100039610)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100039610);
    }
  }
}

void sub_100008614()
{
  unk_10003A0D6 = -4864;
}

void *sub_100008644()
{
  unint64_t result = (void *)sub_10000866C((uint64_t)&_swiftEmptyArrayStorage);
  off_100039620 = result;
  return result;
}

unint64_t sub_10000866C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006560(&qword_100039748);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_10000A728(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_100008788(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006560(&qword_100039778);
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
    sub_10000BBEC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000A728(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000BC54(&v17, (_OWORD *)(v3[7] + 32 * result));
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

id sub_1000088B4()
{
  id result = [objc_allocWithZone((Class)NSRecursiveLock) init];
  qword_100039628 = (uint64_t)result;
  return result;
}

void *sub_1000088E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchQoS();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[3] = &_swiftEmptyArrayStorage;
  v0[4] = 0;
  v0[5] = [objc_allocWithZone((Class)NSRecursiveLock) init];
  sub_1000079C8();
  static OS_dispatch_queue.synthesisQoS.getter();
  static OS_dispatch_queue.platformSynthesisPriority.getter();
  uint64_t v6 = static OS_dispatch_queue.synthesisQueue(label:qos:priority:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v1[2] = v6;
  return v1;
}

id sub_100008A28(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v33 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)v1[5];
  [v7 lock];
  uint64_t v8 = (void *)TaskOperation.request.getter();
  uint64_t v36 = &OBJC_PROTOCOL___SiriTTSAudibleRequestProtocol;
  uint64_t v9 = swift_dynamicCastObjCProtocolConditional();

  char v10 = v2 + 3;
  if (!v9)
  {
    swift_beginAccess();
    id v16 = a1;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_15:
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      goto LABEL_22;
    }
LABEL_36:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_15;
  }
  swift_beginAccess();
  uint64_t v11 = *v10;
  if ((unint64_t)*v10 >> 62)
  {
LABEL_29:
    swift_bridgeObjectRetain();
    unint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    if (v12)
    {
LABEL_4:
      uint64_t v30 = (void *)v4;
      long long v31 = v7;
      uint64_t v29 = v5;
      long long v32 = v2;
      unint64_t v4 = v11 & 0xC000000000000001;
      uint64_t v5 = v11 & 0xFFFFFFFFFFFFFF8;
      uint64_t v7 = (void *)(v11 + 32);
      while (1)
      {
        if (__OFSUB__(v12--, 1))
        {
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
        if (v4)
        {
          id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v12 & 0x8000000000000000) != 0) {
            goto LABEL_27;
          }
          if (v12 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_28;
          }
          id v14 = *((id *)v7 + v12);
        }
        uint64_t v15 = v14;
        uint64_t v2 = (void *)TaskOperation.request.getter();
        uint64_t v35 = &OBJC_PROTOCOL___SiriTTSAudibleRequestProtocol;
        if (swift_dynamicCastObjCProtocolConditional()) {
          break;
        }

        if (!v12)
        {
          swift_bridgeObjectRelease();
          unint64_t v12 = -1;
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();

LABEL_17:
      uint64_t v7 = v31;
      uint64_t v2 = v32;
      uint64_t v5 = v29;
      unint64_t v4 = (unint64_t)v30;
      uint64_t v17 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_32;
      }
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = 0;
  if (__OFADD__(-1, 1))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_18:
  swift_beginAccess();
  if (!((unint64_t)*v10 >> 62))
  {
    uint64_t v18 = *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v19 = a1;
    if (v18 >= v17) {
      goto LABEL_20;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
LABEL_33:
  id v26 = a1;
  swift_bridgeObjectRetain();
  uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v27 < v17) {
    goto LABEL_34;
  }
LABEL_20:
  if (v17 < 0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  sub_1000121BC(v17, v17, (uint64_t)a1);
LABEL_22:
  swift_endAccess();
  static Logger.service.getter();
  uint64_t v20 = a1;
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = (void *)swift_slowAlloc();
    long long v31 = v7;
    long long v32 = v2;
    *(_DWORD *)uint64_t v23 = 138412290;
    uint64_t v34 = v20;
    uint64_t v24 = v20;
    uint64_t v7 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v30 = v20;

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Enqueued task: %@", v23, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v21 = v20;
  }

  (*(void (**)(char *, unint64_t))(v5 + 8))(v33, v4);
  sub_100008EC0();
  return [v7 unlock];
}

id *sub_100008EC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(v2 - 1);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v55 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)(v0 + 40);
  [v9 lock];
  char v10 = (id **)(v0 + 24);
  swift_beginAccess();
  uint64_t v11 = *(id **)(v1 + 24);
  if (!((unint64_t)v11 >> 62))
  {
    unint64_t v12 = *(void **)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_3;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    return (id *)[v9 unlock];
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = (void *)_CocoaArrayWrapper.endIndex.getter();
  if (!v12) {
    goto LABEL_34;
  }
LABEL_3:
  if (((unint64_t)v11 & 0xC000000000000001) != 0)
  {
    id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_38;
    }
    id v13 = v11[4];
  }
  unint64_t v12 = v13;
  swift_bridgeObjectRelease();
  id v14 = *(void **)(v1 + 32);
  uint64_t v53 = v3;
  uint64_t v54 = v5;
  uint64_t v52 = v6;
  if (v14)
  {
    id v51 = v2;
    id v15 = v14;
    id v16 = (void *)TaskOperation.request.getter();
    os_log_type_t v65 = &OBJC_PROTOCOL___SiriTTSAudibleRequestProtocol;
    uint64_t v17 = swift_dynamicCastObjCProtocolConditional();

    uint64_t v18 = (void *)TaskOperation.request.getter();
    v64 = &OBJC_PROTOCOL___SiriTTSAudibleRequestProtocol;
    uint64_t v19 = swift_dynamicCastObjCProtocolConditional();

    if (!v17)
    {

      return (id *)[v9 unlock];
    }
    id v20 = (id)TaskOperation.request.getter();
    uint64_t v63 = &OBJC_PROTOCOL___SiriTTSAudibleRequestProtocol;
    if (!swift_dynamicCastObjCProtocolConditional())
    {

      return (id *)[v9 unlock];
    }
    if (v19)
    {
      swift_getObjectType();
      if (AudibleRequestProtocol.immediate.getter()) {
        [v15 cancel];
      }

      return (id *)[v9 unlock];
    }
    long long v32 = v15;
    [v15 cancel];
    uint64_t v33 = TaskOperation.queue.getter();
    if (v33)
    {
      uint64_t v34 = (void *)v33;
      id v50 = v20;
      uint64_t v35 = TaskOperation.queue.getter();
      if (v35)
      {
        uint64_t v49 = (void *)v35;
        uint64_t v36 = swift_allocObject();
        *(void *)(v36 + 16) = v34;
        Swift::String v61 = sub_10000BCDC;
        uint64_t v62 = v36;
        aBlock = _NSConcreteStackBlock;
        uint64_t v58 = 1107296256;
        uint64_t v59 = sub_1000068EC;
        uint64_t v60 = &unk_100035648;
        os_log_type_t v37 = _Block_copy(&aBlock);
        id v38 = v34;
        static DispatchQoS.unspecified.getter();
        uint64_t v56 = &_swiftEmptyArrayStorage;
        sub_100007A08();
        sub_100006560(&qword_100039538);
        v39 = v32;
        sub_10000BDC4((unint64_t *)&qword_1000397B0, &qword_100039538);
        v40 = v54;
        id v41 = v51;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        v42 = v49;
        OS_dispatch_queue.async(group:qos:flags:execute:)();

        _Block_release(v37);
        (*(void (**)(char *, id))(v53 + 8))(v40, v41);
LABEL_24:
        (*(void (**)(char *, uint64_t))(v55 + 8))(v8, v52);
        swift_release();
        return (id *)[v9 unlock];
      }
      sub_100006560(&qword_100039798);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_10002EE70;
      static DispatchWorkItemFlags.detached.getter();
      aBlock = (void **)v43;
      sub_100007A08();
      sub_100006560(&qword_100039538);
      sub_10000BDC4((unint64_t *)&qword_1000397B0, &qword_100039538);
      dispatch thunk of SetAlgebra.init<A>(_:)();
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = v34;
      Swift::String v61 = sub_10000BC9C;
      uint64_t v62 = v44;
      aBlock = _NSConcreteStackBlock;
      uint64_t v58 = 1107296256;
      uint64_t v59 = sub_1000068EC;
      uint64_t v60 = &unk_1000355F8;
      _Block_copy(&aBlock);
      type metadata accessor for DispatchWorkItem();
      swift_allocObject();
      id v20 = v34;
      DispatchWorkItem.init(flags:block:)();
      swift_release();
      OS_dispatch_queue.async(execute:)();
      swift_release();
    }
    return (id *)[v9 unlock];
  }
  swift_beginAccess();
  uint64_t v11 = *v10;
  if (!((unint64_t)*v10 >> 62))
  {
    if (*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_15;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
LABEL_38:
  swift_bridgeObjectRetain();
  uint64_t v45 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v45) {
    goto LABEL_39;
  }
LABEL_15:
  uint64_t v11 = *v10;
  if (!((unint64_t)*v10 >> 62))
  {
    if (*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_17;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_40:
  swift_bridgeObjectRetain();
  uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v46) {
    goto LABEL_41;
  }
LABEL_17:
  if (((unint64_t)v11 & 0xC000000000000001) != 0)
  {
LABEL_42:
    id result = (id *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_20;
  }
  if (!*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_44:
    swift_bridgeObjectRetain();
    uint64_t v47 = _CocoaArrayWrapper.endIndex.getter();
    id result = (id *)swift_bridgeObjectRelease();
    if (v47) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
  id result = (id *)v11[4];
LABEL_20:
  uint64_t v11 = result;
  if ((unint64_t)*v10 >> 62) {
    goto LABEL_44;
  }
  if (*(void *)(((unint64_t)*v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_22:
    sub_100012AE4(0, 1);
    swift_endAccess();

    os_log_type_t v22 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = v12;
    id v23 = v12;

    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v23;
    *(void *)(v24 + 24) = v1;
    id v25 = v23;
    swift_retain();
    id v51 = v25;
    uint64_t v26 = TaskOperation.queue.getter();
    if (!v26)
    {
      sub_100006560(&qword_100039798);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_10002EE70;
      static DispatchWorkItemFlags.detached.getter();
      aBlock = (void **)v31;
      sub_100007A08();
      sub_100006560(&qword_100039538);
      sub_10000BDC4((unint64_t *)&qword_1000397B0, &qword_100039538);
      dispatch thunk of SetAlgebra.init<A>(_:)();
      Swift::String v61 = sub_10000BD5C;
      uint64_t v62 = v24;
      aBlock = _NSConcreteStackBlock;
      uint64_t v58 = 1107296256;
      uint64_t v59 = sub_1000068EC;
      uint64_t v60 = &unk_100035698;
      _Block_copy(&aBlock);
      type metadata accessor for DispatchWorkItem();
      swift_allocObject();
      swift_retain();
      DispatchWorkItem.init(flags:block:)();
      swift_release();
      OS_dispatch_queue.async(execute:)();
      swift_release();
      swift_release();

      return (id *)[v9 unlock];
    }
    uint64_t v27 = (void *)v26;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_10000BD5C;
    *(void *)(v28 + 24) = v24;
    Swift::String v61 = sub_10000BD9C;
    uint64_t v62 = v28;
    aBlock = _NSConcreteStackBlock;
    uint64_t v58 = 1107296256;
    uint64_t v59 = sub_1000068EC;
    uint64_t v60 = &unk_1000356E8;
    uint64_t v29 = _Block_copy(&aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v56 = &_swiftEmptyArrayStorage;
    sub_100007A08();
    sub_100006560(&qword_100039538);
    sub_10000BDC4((unint64_t *)&qword_1000397B0, &qword_100039538);
    uint64_t v30 = v54;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v29);

    swift_release();
    (*(void (**)(char *, void *))(v53 + 8))(v30, v2);
    goto LABEL_24;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_100009954(void *a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v3 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  __chkstk_darwin(v3);
  v57 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v54 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v52 - v10;
  __chkstk_darwin(v9);
  id v13 = (char *)&v52 - v12;
  static Logger.service.getter();
  id v14 = a1;
  id v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v61 = v5;
  uint64_t v56 = v11;
  if (v17)
  {
    uint64_t v60 = v6;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138412290;
    uint64_t v63 = v14;
    id v20 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v19 = v14;

    uint64_t v6 = v60;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Starting task: %@)", v18, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    uint64_t v5 = v61;
    swift_slowDealloc();
    uint64_t v11 = v56;
    swift_slowDealloc();
  }
  else
  {

    id v15 = v14;
  }

  id v23 = *(void (**)(void, void))(v6 + 8);
  uint64_t v21 = v6 + 8;
  os_log_type_t v22 = v23;
  v23(v13, v5);
  [v14 start];
  static Logger.service.getter();
  uint64_t v24 = v14;
  id v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v53 = v22;
    uint64_t v60 = v21;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v62 = (uint64_t)v24;
    uint64_t v63 = v52;
    *(_DWORD *)uint64_t v27 = 138412546;
    uint64_t v29 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v28 = v24;

    *(_WORD *)(v27 + 12) = 2080;
    uint64_t v30 = (void *)dispatch thunk of TaskOperation.error.getter();
    if (v30)
    {
      uint64_t v31 = v30;
      id v32 = [v30 localizedDescription];

      uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v35 = v34;
    }
    else
    {
      unint64_t v35 = 0xE700000000000000;
      uint64_t v33 = 0x73736563637573;
    }
    uint64_t v62 = sub_100007B04(v33, v35, (uint64_t *)&v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Task finished: %@, error: %s", (uint8_t *)v27, 0x16u);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v36 = v56;
    uint64_t v5 = v61;
    uint64_t v37 = v61;
    os_log_type_t v22 = v53;
  }
  else
  {

    uint64_t v36 = v11;
    uint64_t v37 = v5;
  }
  v22(v36, v37);
  id v38 = (void *)dispatch thunk of TaskOperation.error.getter();
  v39 = v38;
  if (v38)
  {
    id v40 = [v38 code];
  }
  else
  {
    id v40 = 0;
  }
  v42 = v57;
  uint64_t v41 = v58;
  uint64_t v43 = v59;
  (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, enum case for TTSError.TTSErrorCode.waitDequeueTimeout(_:), v59);
  uint64_t v44 = TTSError.TTSErrorCode.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
  if (v39 && v40 == (id)v44)
  {
    static Logger.service.getter();
    uint64_t v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Encountered hang, exit sirittsd now.", v51, 2u);
      swift_slowDealloc();
    }

    v22(v54, v5);
    exit(1);
  }
  uint64_t v45 = v55;
  uint64_t v46 = *(void **)(v55 + 40);
  [v46 lock];
  uint64_t v47 = *(void **)(v45 + 32);
  *(void *)(v45 + 32) = 0;

  return sub_100008EC0([v46 unlock]);
}

uint64_t sub_100009FAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100009FD4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  v6[4] = a2;
  v6[5] = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100009FAC;
  v6[3] = a3;
  uint64_t v4 = _Block_copy(v6);
  swift_release();
  dispatch_sync(a1, v4);
  _Block_release(v4);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result) {
    __break(1u);
  }
  return result;
}

void *sub_10000A09C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 40);
  [v4 lock];
  uint64_t v5 = *(void **)(v1 + 32);
  if (v5
    && (id v6 = v5,
        uint64_t v7 = (void *)TaskOperation.request.getter(),
        v6,
        uint64_t v8 = dispatch thunk of BaseRequest.requestCreatedTime.getter(),
        v7,
        v8 == a1))
  {
    uint64_t v9 = *(void **)(v2 + 32);
    id v10 = v9;
  }
  else
  {
    swift_beginAccess();
    unint64_t v11 = *(void *)(v2 + 24);
    if (v11 >> 62) {
      goto LABEL_21;
    }
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v12)
    {
      while (1)
      {
        id v13 = (v11 & 0xC000000000000001) != 0
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : *(id *)(v11 + 32);
        uint64_t v9 = v13;
        id v14 = (void *)TaskOperation.request.getter();
        uint64_t v15 = dispatch thunk of BaseRequest.requestCreatedTime.getter();

        if (v15 == a1) {
          break;
        }

        if (v12 != 1)
        {
          uint64_t v16 = 5;
          while (1)
          {
            id v17 = (v11 & 0xC000000000000001) != 0
                ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                : *(id *)(v11 + 8 * v16);
            uint64_t v9 = v17;
            uint64_t v18 = v16 - 3;
            if (__OFADD__(v16 - 4, 1)) {
              break;
            }
            uint64_t v19 = (void *)TaskOperation.request.getter();
            uint64_t v20 = dispatch thunk of BaseRequest.requestCreatedTime.getter();

            if (v20 == a1) {
              goto LABEL_9;
            }

            ++v16;
            if (v18 == v12) {
              goto LABEL_18;
            }
          }
          __break(1u);
LABEL_21:
          swift_bridgeObjectRetain_n();
          uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
          if (v12) {
            continue;
          }
        }
        goto LABEL_18;
      }
LABEL_9:
      swift_bridgeObjectRelease_n();
    }
    else
    {
LABEL_18:
      swift_bridgeObjectRelease_n();
      uint64_t v9 = 0;
    }
  }
  [v4 unlock];
  return v9;
}

uint64_t sub_10000A288(unint64_t a1)
{
  return sub_10000A2C4(a1, (unint64_t *)&type metadata accessor for SynthesisVoiceSubscription, &qword_100039790, &qword_100039788, (uint64_t *)sub_10001D5C0);
}

uint64_t sub_10000A2C4(unint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v5 >> 62))
  {
    uint64_t v12 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v13 = v12 + v11;
    if (!__OFADD__(v12, v11)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v13 = v23 + v11;
  if (__OFADD__(v23, v11)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v14 = *v5;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v5 = v14;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v14 & 0x8000000000000000) == 0 && (v14 & 0x4000000000000000) == 0)
    {
      uint64_t v16 = v14 & 0xFFFFFFFFFFFFFF8;
      if (v13 <= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  uint64_t v24 = v11;
  uint64_t v11 = (uint64_t)a2;
  a2 = a3;
  a3 = (unint64_t *)a4;
  a4 = a5;
  if (v14 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v5 = v17;
    uint64_t v16 = v17 & 0xFFFFFFFFFFFFFF8;
    a5 = a4;
    a4 = (uint64_t *)a3;
    a3 = a2;
    a2 = (unint64_t *)v11;
    uint64_t v11 = v24;
LABEL_11:
    uint64_t result = sub_1000066B4(v16 + 8 * *(void *)(v16 + 16) + 32, (*(void *)(v16 + 24) >> 1) - *(void *)(v16 + 16), a1, (void (*)(void))a2, a3, a4, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))a5);
    if (v19 >= v11) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v19 >= 1)
  {
    uint64_t v20 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v21 = __OFADD__(v20, v19);
    uint64_t v22 = v20 + v19;
    if (v21)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
  }
  swift_bridgeObjectRelease();
  return specialized Array._endMutation()();
}

uint64_t sub_10000A4E8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10000B540(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return specialized Array._endMutation()();
}

uint64_t sub_10000A6B4()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for TaskQueue()
{
  return self;
}

unint64_t sub_10000A728(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_10000A7E4(a1, a2, v4);
}

unint64_t sub_10000A7A0(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();
  return sub_10000A8C8(a1, v2);
}

unint64_t sub_10000A7E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000A8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000A964(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006560(&qword_100039748);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000AC7C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006560(&qword_1000397C8);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_unknownObjectRetain();
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000AF34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000A728(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000B1E4();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000A964(v15, a4 & 1);
  unint64_t v21 = sub_10000A728(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *int64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B0A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10000A7A0(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10000B39C();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_10000AC7C(result, a3 & 1);
  uint64_t result = sub_10000A7A0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_100006560(&qword_1000397C0);
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *sub_10000B1E4()
{
  uint64_t v1 = v0;
  sub_100006560(&qword_100039748);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000B39C()
{
  uint64_t v1 = v0;
  sub_100006560(&qword_1000397C8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000B540(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000BDC4(&qword_1000397D8, &qword_1000397D0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100006560(&qword_1000397D0);
          unint64_t v12 = sub_10001D628(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for VoiceAsset();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10000B764(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100006560(&qword_1000397C8);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_10000A7A0(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_unknownObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_unknownObjectRetain();
    unint64_t result = sub_10000A7A0(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B864(uint64_t a1, uint64_t a2)
{
  if (qword_100039550 != -1) {
    swift_once();
  }
  [(id)qword_100039628 lock];
  if (qword_100039548 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = off_100039620;
  if (*((void *)off_100039620 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_10000A728(a1, a2);
    if (v6)
    {
LABEL_10:
      uint64_t v10 = *(void *)(v4[7] + 8 * v5);
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease();
      [(id)qword_100039628 unlock];
      return v10;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  type metadata accessor for TaskQueue();
  swift_allocObject();
  swift_bridgeObjectRetain();
  char v7 = sub_1000088E8();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = off_100039620;
  off_100039620 = (_UNKNOWN *)0x8000000000000000;
  sub_10000AF34((uint64_t)v7, a1, a2, isUniquelyReferenced_nonNull_native);
  off_100039620 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v4 = off_100039620;
  if (*((void *)off_100039620 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_10000A728(a1, a2);
    if (v9) {
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_endAccess();
  __break(1u);
  return result;
}

void *sub_10000BA70(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_15;
        }
        uint64_t v10 = TaskOperation.delegate.getter();
        swift_unknownObjectRelease();
        if (v10 == a2)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v5;
        if (v9 == v4) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v5 < *(void *)(v6 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v7 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000BBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006560(&qword_100039780);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000BC54(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000BC64()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BC9C()
{
  return sub_100009FD4(*(NSObject **)(v0 + 16), (uint64_t)nullsub_1, (uint64_t)&unk_100035738);
}

uint64_t sub_10000BCDC()
{
  return sub_100009FD4(*(NSObject **)(v0 + 16), (uint64_t)nullsub_1, (uint64_t)&unk_100035710);
}

uint64_t sub_10000BD1C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BD5C()
{
  return sub_100009954(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000BD64()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BD9C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000BDC4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007ABC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for HomeHubManagementClient()
{
  return self;
}

id sub_10000BE58()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for DaemonSession()) init];
  qword_1000398E0 = (uint64_t)result;
  return result;
}

uint64_t BackgroundLoader.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  BackgroundLoader.init()();
  return v0;
}

uint64_t BackgroundLoader.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  v12[0] = sub_1000079C8();
  static DispatchQoS.background.getter();
  v12[1] = &_swiftEmptyArrayStorage;
  sub_10000CFE8((unint64_t *)&qword_100039EE0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100006560((uint64_t *)&unk_10003A080);
  sub_10000D030((unint64_t *)&qword_100039EF0, (uint64_t *)&unk_10003A080);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  *(void *)(v0 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v0 + 24) = 0;
  id v8 = [self defaultCenter];
  unint64_t v9 = (void *)static NSNotificationName.voiceAssetChanged.getter();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  uint64_t v10 = NSNotificationCenter.addObserver(event:callback:)();

  swift_release_n();
  *(void *)(v1 + 24) = v10;
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_10000C1A4()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C1DC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    BackgroundLoader.loadMainSiriVoice()();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000C234()
{
  return sub_10000C1DC();
}

uint64_t BackgroundLoader.deinit()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    uint64_t v2 = self;
    swift_unknownObjectRetain();
    id v3 = [v2 defaultCenter];
    [v3 removeObserver:v1];
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  return v0;
}

uint64_t BackgroundLoader.__deallocating_deinit()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    uint64_t v2 = self;
    swift_unknownObjectRetain();
    id v3 = [v2 defaultCenter];
    [v3 removeObserver:v1];
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

Swift::Void __swiftcall BackgroundLoader.loadMainSiriVoice()()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v60 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for DispatchQoS();
  uint64_t v59 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v58 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  BOOL v11 = (char *)&v52 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v52 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v52 - v15;
  id v17 = [self sharedPreferences];
  id v18 = [v17 outputVoice];

  if (v18)
  {
    id v19 = [v18 languageCode];
    if (v19)
    {
      int64_t v20 = v19;
      uint64_t v56 = v1;
      uint64_t v57 = v0;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v21 = [v18 name];
      if (v21)
      {
        int64_t v22 = v21;
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        if (static Features.lowInactiveMemory.getter())
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          static Logger.service.getter();
          unint64_t v23 = Logger.logObject.getter();
          os_log_type_t v24 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v23, v24))
          {
            BOOL v25 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)BOOL v25 = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, v24, "Skip loading Siri voice in background due to low inactive memory requirement", v25, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
        }
        else
        {
          id v32 = objc_allocWithZone((Class)type metadata accessor for SynthesisVoice());
          int64_t v33 = (void *)SynthesisVoice.init(language:name:)();
          id v34 = objc_allocWithZone((Class)type metadata accessor for SynthesisRequest());
          id v35 = v33;
          char v36 = (void *)SynthesisRequest.init(text:voice:)();
          static Logger.service.getter();
          uint64_t v37 = v35;
          id v38 = Logger.logObject.getter();
          os_log_type_t v39 = static os_log_type_t.default.getter();
          int v40 = v39;
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v55 = v36;
            uint64_t v41 = (uint8_t *)swift_slowAlloc();
            uint64_t v42 = swift_slowAlloc();
            int v54 = v40;
            uint64_t v43 = (void *)v42;
            uint64_t v53 = v41;
            *(_DWORD *)uint64_t v41 = 138412290;
            uint64_t v52 = v41 + 4;
            aBlock[0] = v37;
            uint64_t v44 = v37;
            char v36 = v55;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *uint64_t v43 = v37;

            _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v54, "Loading Siri voice %@ in sirittsd", v53, 0xCu);
            sub_100006560(&qword_1000397B8);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            id v38 = v37;
          }

          (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
          uint64_t v45 = swift_allocObject();
          *(void *)(v45 + 16) = v36;
          *(void *)(v45 + 24) = v37;
          aBlock[4] = sub_10000CFE0;
          aBlock[5] = v45;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1000068EC;
          aBlock[3] = &unk_1000357C0;
          uint64_t v46 = _Block_copy(aBlock);
          uint64_t v47 = v37;
          id v48 = v36;
          uint64_t v49 = v58;
          static DispatchQoS.unspecified.getter();
          uint64_t v62 = &_swiftEmptyArrayStorage;
          sub_10000CFE8((unint64_t *)&qword_1000397A0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
          sub_100006560(&qword_100039538);
          sub_10000D030((unint64_t *)&qword_1000397B0, &qword_100039538);
          os_log_type_t v50 = v60;
          uint64_t v51 = v57;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.async(group:qos:flags:execute:)();

          _Block_release(v46);
          (*(void (**)(char *, uint64_t))(v56 + 8))(v50, v51);
          (*(void (**)(char *, uint64_t))(v59 + 8))(v49, v61);
          swift_release();
        }
        return;
      }
      swift_bridgeObjectRelease();
    }
    static Logger.service.getter();
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Can't get current Siri voice, skip background voice loading", v31, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  }
  else
  {
    static Logger.service.getter();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Can't get current Siri voice, skip background voice loading", v28, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t sub_10000CB34(uint64_t a1, void *a2)
{
  if (qword_100039558 != -1) {
    swift_once();
  }
  *(void *)(swift_allocObject() + 16) = a2;
  id v3 = a2;
  dispatch thunk of DaemonSession.prewarm(request:didFinish:)();
  return swift_release();
}

uint64_t sub_10000CBEC(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  if (a1)
  {
    swift_errorRetain();
    static Logger.service.getter();
    swift_errorRetain();
    swift_errorRetain();
    BOOL v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v24 = v4;
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      uint64_t v25 = sub_100007B04(v14, v15, (uint64_t *)&v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error prewarming in sirittsd, %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v24);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    static Logger.service.getter();
    id v17 = a2;
    id v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v24 = v4;
      int64_t v20 = (uint8_t *)swift_slowAlloc();
      id v21 = (void *)swift_slowAlloc();
      uint64_t v23 = v5;
      *(_DWORD *)int64_t v20 = 138412290;
      uint64_t v26 = v17;
      int64_t v22 = v17;
      uint64_t v5 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v21 = v17;

      uint64_t v4 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Loaded Siri voice %@ in sirittsd", v20, 0xCu);
      sub_100006560(&qword_1000397B8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v18 = v17;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
}

uint64_t sub_10000CFA0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CFE0()
{
  return sub_10000CB34(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000CFE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000D030(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007ABC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for BackgroundLoader()
{
  return self;
}

uint64_t sub_10000D0A4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D0DC(uint64_t a1)
{
  return sub_10000CBEC(a1, *(void **)(v1 + 16));
}

uint64_t AFPowerContextOption.description.getter(unint64_t a1)
{
  if (a1 > 2) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return *(void *)&aUnconstrreduce[8 * a1];
  }
}

uint64_t sub_10000D124()
{
  return AFPowerContextOption.description.getter(*v0);
}

uint64_t sub_10000D12C()
{
  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for SiriSynthesisProfile()
{
  return self;
}

uint64_t sub_10000D160()
{
  return 0;
}

uint64_t sub_10000D16C()
{
  return *(void *)(*(void *)v0 + 16);
}

unint64_t sub_10000D17C()
{
  return *(unsigned int *)(*(void *)v0 + 28) | ((unint64_t)*(unsigned __int8 *)(*(void *)v0 + 32) << 32);
}

uint64_t sub_10000D1A0()
{
  type metadata accessor for SubscriptionService();
  swift_allocObject();
  uint64_t result = sub_10000D1DC();
  qword_10003A0D8 = result;
  return result;
}

uint64_t sub_10000D1DC()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_100006524(0, (unint64_t *)&qword_100039750);
  static DispatchQoS.default.getter();
  v6[1] = 0;
  sub_1000139EC(&qword_100039BB0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  dispatch thunk of OptionSet.init(rawValue:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)(v0 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v0 + 120) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 128) = [objc_allocWithZone((Class)NSLock) init];
  type metadata accessor for Preferences();
  *(void *)(v0 + 24) = static Preferences.shared.getter();
  type metadata accessor for TrialAssetProvider();
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  swift_allocObject();
  *(void *)(v0 + 112) = TrialAssetProvider.init()();
  return v0;
}

uint64_t sub_10000D45C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v50 = a1;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v55 = *(void *)(v9 - 8);
  uint64_t v56 = v9;
  __chkstk_darwin(v9);
  uint64_t v53 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for DispatchQoS();
  uint64_t v52 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v51 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  uint64_t v20 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v20 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v20)
  {
    (*(void (**)(char *, void, uint64_t))(v16 + 104))((char *)&v45 - v18, enum case for TTSError.TTSErrorCode.unknown(_:), v15);
    type metadata accessor for TTSError();
    sub_1000139EC(&qword_100039BD0, (void (*)(uint64_t))&type metadata accessor for TTSError);
    swift_allocError();
    TTSError.init(code:description:)();
    return swift_willThrow();
  }
  if (!a5) {
    goto LABEL_8;
  }
  uint64_t v21 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v21 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v21)
  {
    uint64_t v28 = swift_allocBox();
    uint64_t v35 = v34;
    uint64_t v36 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 1, 1, v36);
    a4 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v46 = v19;
    uint64_t v48 = a2;
    uint64_t v47 = swift_allocBox();
    uint64_t v23 = v22;
    uint64_t v24 = type metadata accessor for UUID();
    uint64_t v25 = *(void *)(v24 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, v24);
    if (a5)
    {
      swift_bridgeObjectRetain_n();
      UUID.init(uuidString:)();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v14, 1, v24) == 1)
      {
        swift_bridgeObjectRelease();
        sub_100013A98((uint64_t)v14, &qword_100039BC0);
        uint64_t v26 = v48;
      }
      else
      {
        sub_100013A98((uint64_t)v14, &qword_100039BC0);
        sub_100013A34(v57 + 32, (uint64_t)&aBlock, &qword_100039BB8);
        uint64_t v26 = v48;
        if (v62) {
          abort();
        }
        sub_100013A98((uint64_t)&aBlock, &qword_100039BB8);
        swift_bridgeObjectRelease();
      }
      (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v46, enum case for TTSError.TTSErrorCode.unknown(_:), v15);
      aBlock = 0;
      unint64_t v60 = 0xE000000000000000;
      _StringGuts.grow(_:)(77);
      v29._object = (void *)0x80000001000307A0;
      v29._uint64_t countAndFlagsBits = 0xD000000000000010;
      String.append(_:)(v29);
      v30._uint64_t countAndFlagsBits = v26;
      v30._object = (void *)a3;
      String.append(_:)(v30);
      v31._uint64_t countAndFlagsBits = 0xD000000000000038;
      v31._object = (void *)0x80000001000307C0;
      String.append(_:)(v31);
      v32._uint64_t countAndFlagsBits = a4;
      v32._object = (void *)a5;
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      v33._uint64_t countAndFlagsBits = 39;
      v33._object = (void *)0xE100000000000000;
      String.append(_:)(v33);
      type metadata accessor for TTSError();
      sub_1000139EC(&qword_100039BD0, (void (*)(uint64_t))&type metadata accessor for TTSError);
      swift_allocError();
      TTSError.init(code:description:)();
      swift_willThrow();
      return swift_release();
    }
    uint64_t v28 = v47;
    a2 = v48;
  }
  swift_bridgeObjectRetain();
  unint64_t v37 = v50;
  id v38 = sub_10001318C(v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v39 = v57;
  uint64_t v49 = *(void *)(v57 + 16);
  int v40 = (void *)swift_allocObject();
  v40[2] = v39;
  v40[3] = a2;
  v40[4] = a3;
  v40[5] = a4;
  v40[6] = 0;
  v40[7] = v38;
  v40[8] = v28;
  v40[9] = v37;
  uint64_t v63 = sub_1000139D8;
  v64 = v40;
  aBlock = _NSConcreteStackBlock;
  unint64_t v60 = 1107296256;
  uint64_t v61 = sub_1000068EC;
  uint64_t v62 = &unk_100035A20;
  uint64_t v41 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v42 = v51;
  static DispatchQoS.unspecified.getter();
  uint64_t v58 = &_swiftEmptyArrayStorage;
  sub_1000139EC((unint64_t *)&qword_1000397A0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006560(&qword_100039538);
  sub_100007A60();
  uint64_t v43 = v53;
  uint64_t v44 = v56;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v41);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v42, v54);
  swift_release();
  return swift_release();
}

uint64_t sub_10000DC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v84 = a8;
  uint64_t v13 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v13 - 8);
  v90 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = type metadata accessor for UUID();
  uint64_t v82 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v78 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = swift_projectBox();
  uint64_t v79 = a1;
  uint64_t v16 = *(void *)(a1 + 24);
  unint64_t v17 = dispatch thunk of Preferences.voiceSubscriptions.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v76 = a2;
  uint64_t v18 = sub_100012DC4(v17, a2, a3, a4, a5);
  swift_bridgeObjectRelease();
  uint64_t v77 = a3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v97 = v18;
  unint64_t v19 = swift_bridgeObjectRetain();
  sub_10000A288(v19);
  unint64_t v96 = v17;
  uint64_t v80 = v16;
  unint64_t v20 = dispatch thunk of Preferences.previousVoiceSubscriptions.getter();
  unint64_t v21 = v20;
  if (v20 >> 62) {
    goto LABEL_47;
  }
  uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v23 = (uint64_t)v90;
  if (v22)
  {
LABEL_3:
    unint64_t v24 = 0;
    unint64_t v88 = v21;
    unint64_t v89 = v21 & 0xC000000000000001;
    unint64_t v85 = v21 + 32;
    uint64_t v86 = v21 & 0xFFFFFFFFFFFFFF8;
    uint64_t v87 = v22;
    while (1)
    {
      if (v89)
      {
        id v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v24 >= *(void *)(v86 + 16)) {
          goto LABEL_46;
        }
        id v26 = *(id *)(v85 + 8 * v24);
      }
      os_log_type_t v27 = v26;
      BOOL v28 = __OFADD__(v24, 1);
      unint64_t v29 = v24 + 1;
      if (v28) {
        goto LABEL_45;
      }
      unint64_t v91 = v29;
      unint64_t v30 = v96;
      if (v96 >> 62) {
        break;
      }
      uint64_t v31 = *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v31) {
        goto LABEL_14;
      }
LABEL_40:
      swift_bridgeObjectRelease_n();
      id v58 = v27;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
LABEL_6:
      uint64_t v23 = (uint64_t)v90;
      unint64_t v24 = v91;
      uint64_t v25 = v87;
      unint64_t v21 = v88;

      if (v24 == v25) {
        goto LABEL_48;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
    if (!v31) {
      goto LABEL_40;
    }
LABEL_14:
    unint64_t v32 = v30 & 0xC000000000000001;
    uint64_t v33 = 4;
    unint64_t v92 = v30 & 0xC000000000000001;
    uint64_t v93 = v31;
    while (1)
    {
      unint64_t v21 = v33 - 4;
      if (v32) {
        id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v34 = *(id *)(v30 + 8 * v33);
      }
      uint64_t v35 = v34;
      uint64_t v36 = v33 - 3;
      if (__OFADD__(v21, 1))
      {
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t v23 = (uint64_t)v90;
        if (!v22) {
          break;
        }
        goto LABEL_3;
      }
      uint64_t v37 = dispatch thunk of SynthesisVoiceSubscription.accessoryId.getter();
      uint64_t v39 = v38;
      uint64_t v40 = dispatch thunk of SynthesisVoiceSubscription.accessoryId.getter();
      if (v39)
      {
        if (!v41) {
          goto LABEL_15;
        }
        if (v37 == v40 && v39 == v41)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v42 & 1) == 0)
          {

            goto LABEL_16;
          }
        }
      }
      else if (v41)
      {
LABEL_15:

        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      uint64_t v43 = dispatch thunk of SynthesisVoiceSubscription.clientId.getter();
      uint64_t v45 = v44;
      if (v43 == dispatch thunk of SynthesisVoiceSubscription.clientId.getter() && v45 == v46)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v47 & 1) == 0)
        {

          unint64_t v32 = v92;
          uint64_t v31 = v93;
          goto LABEL_16;
        }
      }
      unint64_t v48 = v30;
      uint64_t v49 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      uint64_t v50 = dispatch thunk of SynthesisVoice.language.getter();
      uint64_t v52 = v51;

      uint64_t v53 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      uint64_t v54 = dispatch thunk of SynthesisVoice.language.getter();
      uint64_t v56 = v55;

      if (v50 == v54 && v52 == v56)
      {
        swift_bridgeObjectRelease_n();

LABEL_5:
        swift_bridgeObjectRelease_n();
        goto LABEL_6;
      }
      char v57 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v30 = v48;
      unint64_t v32 = v92;
      uint64_t v31 = v93;
      if (v57) {
        goto LABEL_5;
      }
LABEL_16:
      ++v33;
      if (v36 == v31) {
        goto LABEL_40;
      }
    }
  }
LABEL_48:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  dispatch thunk of Preferences.previousVoiceSubscriptions.setter();
  swift_bridgeObjectRetain();
  dispatch thunk of Preferences.voiceSubscriptions.setter();
  uint64_t v59 = v81;
  swift_beginAccess();
  sub_100013A34(v59, v23, &qword_100039BC0);
  uint64_t v60 = v82;
  uint64_t v61 = v83;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v23, 1, v83) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100013A98(v23, &qword_100039BC0);
    return sub_10000E4A0();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 32))(v78, v23, v61);
  if ((v76 != 0xD00000000000001BLL || v77 != 0x8000000100030830)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v60 + 8))(v78, v61);
LABEL_71:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_10000E4A0();
  }
  unint64_t v62 = v84;
  if (!(v84 >> 62))
  {
    uint64_t v63 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v63) {
      goto LABEL_55;
    }
    goto LABEL_70;
  }
LABEL_69:
  swift_bridgeObjectRetain();
  uint64_t v63 = _CocoaArrayWrapper.endIndex.getter();
  if (!v63)
  {
LABEL_70:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v78, v83);
    goto LABEL_71;
  }
LABEL_55:
  unint64_t v64 = v62 & 0xC000000000000001;
  uint64_t v65 = 4;
  while (1)
  {
    if (v64) {
      id v66 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v66 = *(id *)(v62 + 8 * v65);
    }
    uint64_t v67 = v66;
    uint64_t v68 = v65 - 3;
    if (__OFADD__(v65 - 4, 1))
    {
      __break(1u);
      goto LABEL_69;
    }
    uint64_t v69 = dispatch thunk of SynthesisVoice.name.getter();
    if (v70)
    {
      uint64_t v71 = v69;
      unint64_t v72 = v70;
      swift_bridgeObjectRelease();
      uint64_t v73 = HIBYTE(v72) & 0xF;
      if ((v72 & 0x2000000000000000) == 0) {
        uint64_t v73 = v71 & 0xFFFFFFFFFFFFLL;
      }
      if (v73) {
        break;
      }
    }

    ++v65;
    unint64_t v62 = v84;
    if (v68 == v63) {
      goto LABEL_70;
    }
  }
  swift_bridgeObjectRelease();
  sub_100013A34(v79 + 72, (uint64_t)v94, &qword_100039BD8);
  if (v95)
  {
    dispatch thunk of SynthesisVoice.language.getter();
    dispatch thunk of SynthesisVoice.name.getter();
    if (!v75) {
      __break(1u);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    abort();
  }

  (*(void (**)(char *, uint64_t))(v82 + 8))(v78, v83);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100013A98((uint64_t)v94, &qword_100039BD8);
  return sub_10000E4A0();
}

uint64_t sub_10000E4A0()
{
  return sub_100010244((uint64_t)sub_1000137BC, (uint64_t)&unk_100035908);
}

id sub_10000E4C0(uint64_t a1)
{
  uint64_t v48 = type metadata accessor for DownloadOption();
  uint64_t v2 = *(void *)(v48 - 8);
  uint64_t v3 = __chkstk_darwin(v48);
  uint64_t v45 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v44 = (char *)v36 - v5;
  uint64_t v43 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  id v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = dispatch thunk of Preferences.voiceSubscriptions.getter();
  uint64_t v10 = *(void **)(a1 + 128);
  [v10 lock];
  uint64_t v46 = a1;
  sub_10000EB50(a1, v9);
  id result = [v10 unlock];
  if (!(v9 >> 62))
  {
    uint64_t v13 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_3;
    }
LABEL_18:
    return (id)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
  id result = (id)swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_18;
  }
LABEL_3:
  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v47 = *(void *)(v46 + 112);
    unint64_t v38 = v9 & 0xC000000000000001;
    char v42 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v15 = (void (**)(char *, uint64_t))(v2 + 8);
    *(void *)&long long v12 = 138543618;
    long long v37 = v12;
    v36[1] = (char *)&type metadata for Any + 8;
    unint64_t v40 = v9;
    uint64_t v41 = v8;
    uint64_t v39 = v13;
    do
    {
      if (v38) {
        id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v18 = *(id *)(v9 + 8 * v14 + 32);
      }
      unint64_t v19 = v18;
      static Logger.service.getter();
      id v20 = v19;
      unint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc();
        unint64_t v24 = (void *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = v37;
        *(void *)(v23 + 4) = v20;
        void *v24 = v20;
        *(_WORD *)(v23 + 12) = 2082;
        uint64_t v25 = dispatch thunk of SynthesisVoiceSubscription.clientId.getter();
        *(void *)(v23 + 14) = sub_100007B04(v25, v26, &v49);

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Updating subscription: [%{public}@, clientId: %{public}s)]", (uint8_t *)v23, 0x16u);
        sub_100006560(&qword_1000397B8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*v42)(v8, v43);
      os_log_type_t v27 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      if (static MobileGestalt.isWatch.getter())
      {
        type metadata accessor for InternalSettings();
        static InternalSettings.shared.getter();
        dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter();
        swift_release();
      }
      BOOL v28 = v44;
      DownloadOption.init(allowExpensiveData:allowDiscretionary:)();
      uint64_t v29 = swift_allocObject();
      uint64_t v30 = v46;
      *(void *)(v29 + 16) = v46;
      *(void *)(v29 + 24) = v20;
      *(void *)(swift_allocObject() + 16) = v20;
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = v30;
      *(void *)(v31 + 24) = v20;
      id v32 = v20;
      swift_retain_n();
      id v33 = v32;
      dispatch thunk of TrialAssetProvider.downloadVoice(_:option:downloadingAsset:progress:completion:)();

      swift_release();
      swift_release();
      swift_release();
      id v34 = *v15;
      (*v15)(v28, v48);
      uint64_t v35 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      dispatch thunk of SynthesisVoice.language.getter();

      if (static MobileGestalt.isWatch.getter())
      {
        type metadata accessor for InternalSettings();
        static InternalSettings.shared.getter();
        dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter();
        swift_release();
      }
      ++v14;
      uint64_t v16 = v45;
      DownloadOption.init(allowExpensiveData:allowDiscretionary:)();
      *(void *)(swift_allocObject() + 16) = v33;
      *(void *)(swift_allocObject() + 16) = v33;
      id v17 = v33;
      dispatch thunk of TrialAssetProvider.downloadResource(language:option:progress:completion:)();

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      v34(v16, v48);
      unint64_t v9 = v40;
      id v8 = v41;
    }
    while (v39 != v14);
    return (id)swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000EB50(uint64_t a1, unint64_t a2)
{
  uint64_t v29 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_bridgeObjectRetain();
  id v8 = sub_10001330C(v7, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)v8 + 2);
  if (v10)
  {
    v23[0] = v8;
    v23[1] = v2;
    uint64_t v11 = (uint64_t)(v8 + 32);
    long long v12 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v13 = &v28;
    *(void *)&long long v9 = 138412290;
    long long v24 = v9;
    uint64_t v25 = v6;
    do
    {
      sub_10001386C(v11, &v27);
      static Logger.service.getter();
      sub_10001386C((uint64_t)&v27, v26);
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = v12;
        id v17 = v13;
        uint64_t v18 = swift_slowAlloc();
        unint64_t v19 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = v24;
        id v20 = v26[0];
        *(id *)(v18 + 4) = v26[0];
        void *v19 = v20;
        id v21 = v20;
        sub_1000138F0(v26);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Cancel downloading of removed voice %@", (uint8_t *)v18, 0xCu);
        sub_100006560(&qword_1000397B8);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v13 = v17;
        long long v12 = v16;
        uint64_t v6 = v25;
        swift_slowDealloc();
      }
      else
      {
        sub_1000138F0(v26);
      }

      (*v12)(v6, v29);
      dispatch thunk of TrialAssetProvider.cancelDownloading(_:)();
      sub_1000138F0(&v27);
      v11 += 40;
      --v10;
    }
    while (v10);
  }
  return swift_bridgeObjectRelease();
}

void *sub_10000EDFC@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = a2;
  if (a2 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = *a1;
      unint64_t v36 = v3 & 0xC000000000000001;
      uint64_t v6 = 4;
      uint64_t v34 = v4;
      unint64_t v35 = v3;
      do
      {
        if (v36) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v7 = *(id *)(v3 + 8 * v6);
        }
        id v8 = v7;
        uint64_t v9 = v6 - 3;
        if (__OFADD__(v6 - 4, 1))
        {
          __break(1u);
          goto LABEL_28;
        }
        uint64_t v10 = v5;
        uint64_t v11 = dispatch thunk of SynthesisVoice.language.getter();
        uint64_t v13 = v12;
        uint64_t v14 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
        uint64_t v15 = dispatch thunk of SynthesisVoice.language.getter();
        uint64_t v17 = v16;

        if (v11 == v15 && v13 == v17)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {

            uint64_t v5 = v10;
            goto LABEL_5;
          }
        }
        unint64_t v19 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
        uint64_t v20 = dispatch thunk of SynthesisVoice.name.getter();
        uint64_t v22 = v21;

        uint64_t v5 = v10;
        if (v22)
        {
          uint64_t v23 = dispatch thunk of SynthesisVoice.name.getter();
          if (!v24)
          {

            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
          if (v20 == v23 && v22 == v24)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v25 & 1) == 0)
            {

              goto LABEL_5;
            }
          }
        }
        unint64_t v26 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
        dispatch thunk of SynthesisVoice.type.getter();

        uint64_t v27 = SynthesisVoice.VoiceType.rawValue.getter();
        if (v27 == SynthesisVoice.VoiceType.rawValue.getter())
        {

LABEL_26:
          id result = (void *)swift_bridgeObjectRelease();
          *(void *)(a3 + 32) = 0;
          *(_OWORD *)a3 = 0u;
          *(_OWORD *)(a3 + 16) = 0u;
          return result;
        }
        uint64_t v28 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
        dispatch thunk of SynthesisVoice.type.getter();

        dispatch thunk of SynthesisVoice.type.getter();
        uint64_t v29 = SynthesisVoice.VoiceType.rawValue.getter();
        uint64_t v30 = SynthesisVoice.VoiceType.rawValue.getter();

        if (v29 == v30) {
          goto LABEL_26;
        }
LABEL_5:
        ++v6;
        unint64_t v3 = v35;
      }
      while (v9 != v34);
    }
  }
  swift_bridgeObjectRelease();
  return sub_10001386C((uint64_t)a1, (void *)a3);
}

id sub_10000F0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 128);
  [v4 lock];
  uint64_t v5 = dispatch thunk of SynthesisVoiceSubscription.voice.getter();
  sub_100008274(a1, (uint64_t)v15 + 8);
  *(void *)&v15[0] = v5;
  uint64_t v6 = (char **)(a2 + 120);
  swift_beginAccess();
  id v7 = *(char **)(a2 + 120);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 120) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v7 = sub_10001B7FC(0, *((void *)v7 + 2) + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  unint64_t v10 = *((void *)v7 + 2);
  unint64_t v9 = *((void *)v7 + 3);
  if (v10 >= v9 >> 1)
  {
    id v7 = sub_10001B7FC((char *)(v9 > 1), v10 + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  *((void *)v7 + 2) = v10 + 1;
  uint64_t v11 = &v7[40 * v10];
  long long v12 = v15[0];
  long long v13 = v15[1];
  *((void *)v11 + 8) = v16;
  *((_OWORD *)v11 + 2) = v12;
  *((_OWORD *)v11 + 3) = v13;
  swift_endAccess();
  return [v4 unlock];
}

uint64_t sub_10000F1F8(void *a1, float a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  id v8 = a1;
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = v4;
    uint64_t v12 = v11;
    long long v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218242;
    double v17 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2112;
    uint64_t v14 = dispatch thunk of SynthesisVoiceSubscription.voice.getter();
    double v17 = *(double *)&v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *long long v13 = v14;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Voice downloading progress: %f, voice: [%@]", (uint8_t *)v12, 0x16u);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v16;
    swift_slowDealloc();
  }
  else
  {

    unint64_t v9 = v8;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_10000F410(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v54 = a1;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v51 = *(void *)(v7 - 8);
  uint64_t v52 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  os_log_type_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v50 = (char *)&v47 - v11;
  id v53 = *(id *)(a3 + 128);
  [v53 lock];
  uint64_t v12 = (char **)(a3 + 120);
  swift_beginAccess();
  long long v13 = *(void **)(a3 + 120);
  uint64_t v14 = v13[2];
  if (v14)
  {
    uint64_t v48 = a2;
    uint64_t v49 = v10;
    sub_100006524(0, &qword_100039F30);
    swift_bridgeObjectRetain();
    unint64_t v15 = 0;
    uint64_t v16 = 9;
    while (1)
    {
      sub_10001386C((uint64_t)&v13[v16 - 5], v56);
      double v17 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      char v18 = static NSObject.== infix(_:_:)();

      sub_1000138F0(v56);
      if (v18) {
        break;
      }
      ++v15;
      v16 += 5;
      if (v14 == v15)
      {
        swift_bridgeObjectRelease();
        unint64_t v15 = *((void *)*v12 + 2);
        int64_t v19 = v15;
        os_log_type_t v10 = v49;
        a2 = v48;
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    int64_t v19 = v15 + 1;
    if (!__OFADD__(v15, 1))
    {
      uint64_t v20 = *v12;
      unint64_t v21 = *((void *)*v12 + 2);
      if (v19 == v21)
      {
LABEL_9:
        os_log_type_t v10 = v49;
        a2 = v48;
        if (v19 >= (uint64_t)v15) {
          goto LABEL_10;
        }
      }
      else
      {
        unint64_t v41 = v15 + 1;
        while (v41 < v21)
        {
          sub_10001386C((uint64_t)&v20[v16 * 8], v56);
          long long v13 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
          char v42 = static NSObject.== infix(_:_:)();

          sub_1000138F0(v56);
          if ((v42 & 1) == 0)
          {
            if (v41 != v15)
            {
              if ((v15 & 0x8000000000000000) != 0) {
                goto LABEL_44;
              }
              uint64_t v43 = *v12;
              unint64_t v44 = *((void *)*v12 + 2);
              if (v15 >= v44) {
                goto LABEL_45;
              }
              sub_10001386C((uint64_t)&v43[40 * v15 + 32], v56);
              if (v41 >= v44) {
                goto LABEL_46;
              }
              sub_10001386C((uint64_t)&v43[v16 * 8], v55);
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *uint64_t v12 = v43;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                uint64_t v43 = sub_100012AD0((uint64_t)v43);
                *uint64_t v12 = v43;
              }
              if (v15 >= *((void *)v43 + 2)) {
                goto LABEL_47;
              }
              sub_100013928((uint64_t)v55, (uint64_t)&v43[40 * v15 + 32]);
              if (v41 >= *((void *)*v12 + 2)) {
                goto LABEL_48;
              }
              sub_100013928((uint64_t)v56, (uint64_t)&(*v12)[v16 * 8]);
            }
            if (__OFADD__(v15++, 1)) {
              goto LABEL_43;
            }
          }
          int64_t v19 = v41 + 1;
          if (__OFADD__(v41, 1)) {
            goto LABEL_42;
          }
          uint64_t v20 = *v12;
          unint64_t v21 = *((void *)*v12 + 2);
          ++v41;
          v16 += 5;
          if (v19 == v21) {
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_51;
  }
  unint64_t v15 = 0;
  int64_t v19 = 0;
LABEL_10:
  sub_10001360C(v15, v19);
  swift_endAccess();
  [v53 unlock];
  uint64_t v22 = v54;
  if (v54 || !a2)
  {
    static Logger.service.getter();
    id v30 = a4;
    swift_errorRetain();
    long long v13 = v30;
    swift_errorRetain();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v31, v32))
    {
      swift_errorRelease();
      swift_errorRelease();

      goto LABEL_24;
    }
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    id v53 = (id)swift_slowAlloc();
    v56[0] = v53;
    *(_DWORD *)uint64_t v33 = 136315394;
    if (v22)
    {
      swift_getErrorValue();
      uint64_t v35 = Error.localizedDescription.getter();
      v55[0] = sub_100007B04(v35, v36, (uint64_t *)v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v33 + 12) = 2112;
      uint64_t v37 = dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      v55[0] = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v34 = v37;

      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Voice failed downloading, error: %s, voice: [%@]", (uint8_t *)v33, 0x16u);
      sub_100006560(&qword_1000397B8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_24:
      (*(void (**)(char *, uint64_t))(v51 + 8))(v10, v52);
      return;
    }
LABEL_51:

    __break(1u);
    return;
  }
  swift_retain();
  uint64_t v23 = v50;
  static Logger.service.getter();
  uint64_t v24 = a4;
  char v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138412290;
    uint64_t v29 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
    v56[0] = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v28 = v29;

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Voice finished downloading, voice: [%@].", v27, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    char v25 = v24;
  }
  uint64_t v39 = v51;
  uint64_t v38 = v52;

  (*(void (**)(char *, uint64_t))(v39 + 8))(v23, v38);
  type metadata accessor for NeuralUtils();
  if ((static NeuralUtils.isANECompilationPlatform.getter() & 1) != 0
    && (static MobileGestalt.isWatch.getter() & 1) == 0)
  {
    VoiceAsset.path.getter();
    char v40 = static NeuralUtils.isNeuralVoiceReady(voicePath:)();
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0) {
      Activity.registerOneOff()();
    }
  }
  swift_release();
}

uint64_t sub_10000FB68(void *a1, float a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  id v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v5;
    uint64_t v12 = v11;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v12 = 134218242;
    double v23 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    long long v13 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
    uint64_t v14 = dispatch thunk of SynthesisVoice.language.getter();
    uint64_t v20 = v4;
    uint64_t v15 = v14;
    unint64_t v17 = v16;

    double v23 = COERCE_DOUBLE(sub_100007B04(v15, v17, &v24));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Resource downloading progress: %f, language: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v7, v20);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000FDD0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v33 - v9;
  if (a1)
  {
    static Logger.service.getter();
    id v11 = a2;
    swift_errorRetain();
    id v12 = v11;
    swift_errorRetain();
    long long v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v38 = v35;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v36 = v4;
      swift_getErrorValue();
      LODWORD(v34) = v15;
      uint64_t v17 = Error.localizedDescription.getter();
      uint64_t v37 = sub_100007B04(v17, v18, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v16 + 12) = 2080;
      uint64_t v19 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      uint64_t v20 = dispatch thunk of SynthesisVoice.language.getter();
      uint64_t v21 = v5;
      unint64_t v23 = v22;

      uint64_t v37 = sub_100007B04(v20, v23, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v34, "Resource failed downloading, error: %s, language: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v36);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    static Logger.service.getter();
    id v25 = a2;
    os_log_type_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v36 = v4;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v35 = v5;
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v34 = v28 + 4;
      uint64_t v29 = (void *)dispatch thunk of SynthesisVoiceSubscription.voice.getter();
      uint64_t v30 = dispatch thunk of SynthesisVoice.language.getter();
      unint64_t v32 = v31;

      uint64_t v37 = sub_100007B04(v30, v32, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Resource finished downloading, language: %s.", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v10, v36);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }
}

uint64_t sub_100010224()
{
  return sub_100010244((uint64_t)sub_100013184, (uint64_t)&unk_1000358E0);
}

uint64_t sub_100010244(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[4] = a1;
  uint64_t v17 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000068EC;
  aBlock[3] = a2;
  long long v13 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v15[1] = &_swiftEmptyArrayStorage;
  sub_1000139EC((unint64_t *)&qword_1000397A0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006560(&qword_100039538);
  sub_100007A60();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_1000104B0(uint64_t a1)
{
  *(void *)&long long v138 = a1;
  uint64_t v147 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v147 - 8);
  uint64_t v3 = __chkstk_darwin(v147);
  v135 = (char *)&v134 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (uint64_t)&v134 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  v144 = (char *)&v134 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  id v12 = (char *)&v134 - v11;
  __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v134 - v13;
  static Logger.service.getter();
  int v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Running subscription clean up", v17, 2u);
    swift_slowDealloc();
  }

  v145 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v146 = v2 + 8;
  v145(v14, v147);
  uint64_t v18 = v138;
  sub_100013A34(v138 + 32, (uint64_t)&v149, &qword_100039BB8);
  unint64_t v137 = v7;
  if (v150)
  {
    sub_100013784(&v149, (uint64_t)v148);
    *(void *)&long long v143 = *(void *)(v18 + 24);
    unint64_t v19 = dispatch thunk of Preferences.voiceSubscriptions.getter();
    unint64_t v20 = v19;
    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v21 = result;
      if (result)
      {
LABEL_6:
        if (v21 >= 1)
        {
          uint64_t v7 = 0;
          unint64_t v23 = &_swiftEmptyArrayStorage;
          do
          {
            if ((v20 & 0xC000000000000001) != 0) {
              id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v25 = *(id *)(v20 + 8 * v7 + 32);
            }
            os_log_type_t v26 = v25;
            unint64_t v1 = dispatch thunk of SynthesisVoiceSubscription.accessoryId.getter();
            uint64_t v28 = v27;

            if (v28)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v23 = sub_10001B920(0, v23[2] + 1, 1, v23);
              }
              unint64_t v30 = v23[2];
              unint64_t v29 = v23[3];
              if (v30 >= v29 >> 1) {
                unint64_t v23 = sub_10001B920((void *)(v29 > 1), v30 + 1, 1, v23);
              }
              void v23[2] = v30 + 1;
              uint64_t v24 = &v23[2 * v30];
              v24[4] = v1;
              v24[5] = v28;
            }
            ++v7;
          }
          while (v21 != v7);
          goto LABEL_21;
        }
        goto LABEL_186;
      }
    }
    else
    {
      uint64_t v21 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v21) {
        goto LABEL_6;
      }
    }
    unint64_t v23 = &_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n();
    uint64_t v31 = sub_10001EA24((uint64_t)v23);
    uint64_t v32 = swift_bridgeObjectRelease();
    __chkstk_darwin(v32);
    *(&v134 - 2) = (uint64_t)v148;
    uint64_t v33 = sub_1000124A8((uint64_t)sub_10001379C, (uint64_t)(&v134 - 4), v31);
    uint64_t v136 = 0;
    int64_t v35 = 0;
    uint64_t v36 = *(void *)(v33 + 56);
    uint64_t v141 = v33 + 56;
    uint64_t v37 = 1 << *(unsigned char *)(v33 + 32);
    uint64_t v38 = -1;
    if (v37 < 64) {
      uint64_t v38 = ~(-1 << v37);
    }
    unint64_t v39 = v38 & v36;
    int64_t v142 = (unint64_t)(v37 + 63) >> 6;
    *(void *)&long long v34 = 136315138;
    long long v140 = v34;
    v139 = (char *)&type metadata for Any + 8;
    while (1)
    {
      if (v39)
      {
        unint64_t v40 = __clz(__rbit64(v39));
        v39 &= v39 - 1;
        unint64_t v41 = v40 | (v35 << 6);
      }
      else
      {
        int64_t v42 = v35 + 1;
        if (__OFADD__(v35, 1))
        {
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
          goto LABEL_148;
        }
        if (v42 >= v142) {
          goto LABEL_44;
        }
        unint64_t v43 = *(void *)(v141 + 8 * v42);
        ++v35;
        if (!v43)
        {
          int64_t v35 = v42 + 1;
          if (v42 + 1 >= v142) {
            goto LABEL_44;
          }
          unint64_t v43 = *(void *)(v141 + 8 * v35);
          if (!v43)
          {
            int64_t v35 = v42 + 2;
            if (v42 + 2 >= v142) {
              goto LABEL_44;
            }
            unint64_t v43 = *(void *)(v141 + 8 * v35);
            if (!v43)
            {
              int64_t v44 = v42 + 3;
              if (v44 >= v142)
              {
LABEL_44:
                swift_release();
                sub_100008224((uint64_t)v148);
                goto LABEL_45;
              }
              unint64_t v43 = *(void *)(v141 + 8 * v44);
              if (!v43)
              {
                while (1)
                {
                  int64_t v35 = v44 + 1;
                  if (__OFADD__(v44, 1)) {
                    break;
                  }
                  if (v35 >= v142) {
                    goto LABEL_44;
                  }
                  unint64_t v43 = *(void *)(v141 + 8 * v35);
                  ++v44;
                  if (v43) {
                    goto LABEL_41;
                  }
                }
LABEL_148:
                __break(1u);
LABEL_149:
                swift_bridgeObjectRetain();
                uint64_t v52 = _CocoaArrayWrapper.endIndex.getter();
                swift_bridgeObjectRelease();
                goto LABEL_47;
              }
              int64_t v35 = v44;
            }
          }
        }
LABEL_41:
        unint64_t v39 = (v43 - 1) & v43;
        unint64_t v41 = __clz(__rbit64(v43)) + (v35 << 6);
      }
      uint64_t v45 = (uint64_t *)(*(void *)(v33 + 48) + 16 * v41);
      uint64_t v47 = *v45;
      unint64_t v46 = v45[1];
      swift_bridgeObjectRetain();
      static Logger.service.getter();
      swift_bridgeObjectRetain_n();
      uint64_t v48 = Logger.logObject.getter();
      os_log_type_t v49 = static os_log_type_t.default.getter();
      uint64_t v7 = v49;
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = swift_slowAlloc();
        unint64_t v1 = swift_slowAlloc();
        *(void *)&long long v149 = v1;
        *(_DWORD *)uint64_t v50 = v140;
        swift_bridgeObjectRetain();
        *(void *)(v50 + 4) = sub_100007B04(v47, v46, (uint64_t *)&v149);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v7, "Clearing auto-downloaded asset preferences for accessory %s", (uint8_t *)v50, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v145(v12, v147);
      dispatch thunk of Preferences.clearSubscriptions(accessoryId:)();
      swift_bridgeObjectRelease();
    }
  }
  sub_100013A98((uint64_t)&v149, &qword_100039BB8);
  uint64_t v136 = 0;
LABEL_45:
  unint64_t v51 = dispatch thunk of Preferences.voiceSubscriptions.getter();
  unint64_t v39 = v51;
  uint64_t v7 = v51 >> 62;
  if (v51 >> 62) {
    goto LABEL_149;
  }
  uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_47:
  unint64_t v53 = (unint64_t)&_swiftEmptyArrayStorage;
  if (v52)
  {
    v148[0] = (uint64_t)&_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    if (v52 < 0) {
      goto LABEL_180;
    }
    uint64_t v54 = 0;
    do
    {
      if ((v39 & 0xC000000000000001) != 0) {
        id v55 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v55 = *(id *)(v39 + 8 * v54 + 32);
      }
      uint64_t v56 = v55;
      ++v54;
      dispatch thunk of SynthesisVoiceSubscription.voice.getter();

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v52 != v54);
    unint64_t v53 = v148[0];
  }
  if (v53 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v57 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v57 = *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v58 = &_swiftEmptyArrayStorage;
  if (v57)
  {
    v148[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10001BDA8(0, v57 & ~(v57 >> 63), 0);
    if (v57 < 0) {
      goto LABEL_181;
    }
    int64_t v142 = v7;
    *(void *)&long long v143 = v39;
    uint64_t v59 = 0;
    id v58 = (void *)v148[0];
    unint64_t v1 = v53 & 0xC000000000000001;
    unint64_t v60 = v53;
    do
    {
      if (v1) {
        id v61 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v61 = *(id *)(v53 + 8 * v59 + 32);
      }
      unint64_t v62 = v61;
      uint64_t v63 = dispatch thunk of SynthesisVoice.language.getter();
      uint64_t v65 = v64;

      v148[0] = (uint64_t)v58;
      unint64_t v67 = v58[2];
      unint64_t v66 = v58[3];
      if (v67 >= v66 >> 1)
      {
        sub_10001BDA8(v66 > 1, v67 + 1, 1);
        id v58 = (void *)v148[0];
      }
      ++v59;
      v58[2] = v67 + 1;
      uint64_t v68 = &v58[2 * v67];
      v68[4] = v63;
      v68[5] = v65;
      unint64_t v53 = v60;
    }
    while (v57 != v59);
    unint64_t v39 = v143;
    uint64_t v7 = v142;
  }
  uint64_t v69 = sub_10001EA24((uint64_t)v58);
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v71 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v71 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v134 = v69;
  if (v71)
  {
    if (v71 < 1) {
      goto LABEL_182;
    }
    uint64_t v7 = 0;
    *(void *)&long long v70 = 138543362;
    long long v143 = v70;
    do
    {
      if ((v39 & 0xC000000000000001) != 0) {
        id v73 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v73 = *(id *)(v39 + 8 * v7 + 32);
      }
      v74 = v73;
      static Logger.service.getter();
      uint64_t v75 = v74;
      unint64_t v72 = Logger.logObject.getter();
      os_log_type_t v76 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v72, v76))
      {
        uint64_t v77 = swift_slowAlloc();
        uint64_t v78 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v77 = v143;
        *(void *)(v77 + 4) = v75;
        *uint64_t v78 = v75;
        _os_log_impl((void *)&_mh_execute_header, v72, v76, "Subscription %{public}@", (uint8_t *)v77, 0xCu);
        sub_100006560(&qword_1000397B8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        unint64_t v72 = v75;
      }
      ++v7;

      v145(v144, v147);
    }
    while (v71 != v7);
  }
  swift_bridgeObjectRelease();
  uint64_t v79 = v138;
  swift_retain();
  unint64_t v1 = (unint64_t)sub_100013478(v53);
  swift_bridgeObjectRelease();
  swift_release();
  v144 = *(char **)(v79 + 112);
  unint64_t v80 = dispatch thunk of TrialAssetProvider.listVoiceAssets(_:)();
  unint64_t v81 = v80;
  if (v80 >> 62) {
    uint64_t v82 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v82 = *(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v39 = v137;
  if (v82)
  {
    v148[0] = (uint64_t)&_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    if (v82 < 0) {
      goto LABEL_183;
    }
    uint64_t v83 = 0;
    do
    {
      if ((v81 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      ++v83;
      VoiceAsset.voice.getter();
      swift_release();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v82 != v83);
    uint64_t v7 = v148[0];
    swift_bridgeObjectRelease();
    if (!((unint64_t)v7 >> 62))
    {
LABEL_90:
      uint64_t v85 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v85) {
        goto LABEL_91;
      }
      goto LABEL_132;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = (uint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_90;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v85 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v85)
  {
LABEL_91:
    *(void *)&long long v143 = v85;
    if (v1 >> 62) {
      goto LABEL_184;
    }
    uint64_t v86 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_93:
    unint64_t v87 = 0;
    unint64_t v88 = v7 & 0xC000000000000001;
    uint64_t v141 = v7 & 0xFFFFFFFFFFFFFF8;
    *(void *)&long long v140 = v7 + 32;
    int64_t v142 = v1 & 0xC000000000000001;
    *(void *)&long long v84 = 138543362;
    long long v138 = v84;
    v139 = (char *)v7;
    do
    {
      if (v88)
      {
        id v90 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v87 >= *(void *)(v141 + 16)) {
          goto LABEL_146;
        }
        id v90 = *(id *)(v140 + 8 * v87);
      }
      unint64_t v91 = v90;
      if (__OFADD__(v87++, 1))
      {
        __break(1u);
        goto LABEL_144;
      }
      if (v86)
      {
        if (v142)
        {
          swift_bridgeObjectRetain();
          id v94 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v93 = *(void **)(v1 + 32);
          swift_bridgeObjectRetain();
          id v94 = v93;
        }
        uint64_t v95 = v94;
        type metadata accessor for SynthesisVoice();
        char v96 = static NSObject.== infix(_:_:)();

        if (v96)
        {
LABEL_106:

          swift_bridgeObjectRelease();
LABEL_107:
          uint64_t v85 = v143;
          continue;
        }
        if (v86 != 1)
        {
          if (v142)
          {
            specialized _ArrayBuffer._getElementSlowPath(_:)();
            char v101 = static NSObject.== infix(_:_:)();
            swift_unknownObjectRelease();
            if (v101) {
              goto LABEL_106;
            }
            if (v86 != 2)
            {
              uint64_t v102 = 2;
              while (1)
              {
                specialized _ArrayBuffer._getElementSlowPath(_:)();
                unint64_t v39 = v102 + 1;
                if (__OFADD__(v102, 1)) {
                  goto LABEL_145;
                }
                uint64_t v7 = static NSObject.== infix(_:_:)();
                swift_unknownObjectRelease();
                if (v7) {
                  goto LABEL_128;
                }
                ++v102;
                if (v39 == v86) {
                  goto LABEL_127;
                }
              }
            }
          }
          else
          {
            id v103 = *(id *)(v1 + 40);
            char v104 = static NSObject.== infix(_:_:)();

            if (v104) {
              goto LABEL_106;
            }
            if (v86 != 2)
            {
              uint64_t v7 = 6;
              while (1)
              {
                unint64_t v39 = v7 - 3;
                if (__OFADD__(v7 - 4, 1)) {
                  goto LABEL_147;
                }
                id v105 = *(id *)(v1 + 8 * v7);
                char v106 = static NSObject.== infix(_:_:)();

                if (v106)
                {
LABEL_128:

                  swift_bridgeObjectRelease();
                  unint64_t v39 = v137;
                  uint64_t v7 = (uint64_t)v139;
                  goto LABEL_107;
                }
                ++v7;
                if (v39 == v86)
                {
LABEL_127:
                  swift_bridgeObjectRelease();
                  unint64_t v39 = v137;
                  uint64_t v7 = (uint64_t)v139;
                  goto LABEL_110;
                }
              }
            }
          }
        }
        swift_bridgeObjectRelease();
LABEL_110:
        uint64_t v85 = v143;
      }
      static Logger.service.getter();
      v97 = v91;
      unint64_t v89 = Logger.logObject.getter();
      os_log_type_t v98 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v89, v98))
      {
        uint64_t v99 = swift_slowAlloc();
        uint64_t v100 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v99 = v138;
        *(void *)(v99 + 4) = v97;
        *uint64_t v100 = v97;
        _os_log_impl((void *)&_mh_execute_header, v89, v98, "Remove not-in-use voice %{public}@", (uint8_t *)v99, 0xCu);
        sub_100006560(&qword_1000397B8);
        swift_arrayDestroy();
        uint64_t v7 = (uint64_t)v139;
        swift_slowDealloc();
        uint64_t v85 = v143;
        swift_slowDealloc();
      }
      else
      {

        unint64_t v89 = v97;
      }

      v145((char *)v39, v147);
      dispatch thunk of TrialAssetProvider.removeVoices(_:immediately:)();
    }
    while (v87 != v85);
  }
LABEL_132:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v107 = dispatch thunk of TrialAssetProvider.listResources()();
  unint64_t v108 = v107;
  if (!(v107 >> 62))
  {
    uint64_t v7 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_134;
    }
LABEL_153:
    swift_bridgeObjectRelease();
    v110 = &_swiftEmptyArrayStorage;
LABEL_154:
    uint64_t v118 = v135;
    uint64_t v119 = v134;
    *(void *)&long long v143 = v110[2];
    if (!(void)v143)
    {
LABEL_178:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    unint64_t v1 = 0;
    int64_t v142 = (int64_t)(v110 + 4);
    uint64_t v141 = v134 + 56;
    *(void *)&long long v117 = 136446210;
    long long v140 = v117;
    v139 = (char *)&type metadata for Any + 8;
    while (1)
    {
      if (v1 >= v110[2])
      {
        __break(1u);
LABEL_180:
        __break(1u);
LABEL_181:
        __break(1u);
LABEL_182:
        __break(1u);
LABEL_183:
        __break(1u);
LABEL_184:
        swift_bridgeObjectRetain();
        uint64_t v85 = v143;
        uint64_t v86 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        goto LABEL_93;
      }
      uint64_t v120 = (uint64_t *)(v142 + 16 * v1);
      uint64_t v121 = *v120;
      unint64_t v39 = v120[1];
      if (*(void *)(v119 + 16))
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v122 = Hasher._finalize()();
        uint64_t v123 = -1 << *(unsigned char *)(v119 + 32);
        unint64_t v124 = v122 & ~v123;
        if ((*(void *)(v141 + ((v124 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v124))
        {
          uint64_t v125 = *(void *)(v119 + 48);
          v126 = (void *)(v125 + 16 * v124);
          BOOL v127 = *v126 == v121 && v126[1] == v39;
          if (v127 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_158;
          }
          uint64_t v128 = ~v123;
          while (1)
          {
            unint64_t v124 = (v124 + 1) & v128;
            if (((*(void *)(v141 + ((v124 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v124) & 1) == 0) {
              break;
            }
            v129 = (void *)(v125 + 16 * v124);
            BOOL v130 = *v129 == v121 && v129[1] == v39;
            if (v130 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_158;
            }
          }
        }
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      static Logger.service.getter();
      swift_bridgeObjectRetain_n();
      v131 = Logger.logObject.getter();
      uint64_t v7 = (uint64_t)v118;
      os_log_type_t v132 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v131, v132))
      {
        uint64_t v133 = swift_slowAlloc();
        v148[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v133 = v140;
        swift_bridgeObjectRetain();
        *(void *)(v133 + 4) = sub_100007B04(v121, v39, v148);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v131, v132, "Remove not-in-use resource of language %{public}s", (uint8_t *)v133, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v145((char *)v7, v147);
      uint64_t v118 = (char *)v7;
      dispatch thunk of TrialAssetProvider.removeResource(language:immediately:)();
LABEL_158:
      ++v1;
      swift_bridgeObjectRelease();
      if (v1 == (void)v143) {
        goto LABEL_178;
      }
    }
  }
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  if (!v7) {
    goto LABEL_153;
  }
LABEL_134:
  v148[0] = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t result = sub_10001BDA8(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    uint64_t v109 = 0;
    v110 = (void *)v148[0];
    do
    {
      if ((v108 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t v111 = (void *)ResourceAsset.resource.getter();
      unint64_t v39 = dispatch thunk of SynthesisResource.language.getter();
      uint64_t v113 = v112;
      swift_release();

      v148[0] = (uint64_t)v110;
      unint64_t v115 = v110[2];
      unint64_t v114 = v110[3];
      if (v115 >= v114 >> 1)
      {
        sub_10001BDA8(v114 > 1, v115 + 1, 1);
        v110 = (void *)v148[0];
      }
      ++v109;
      v110[2] = v115 + 1;
      v116 = &v110[2 * v115];
      v116[4] = v39;
      v116[5] = v113;
    }
    while (v7 != v109);
    swift_bridgeObjectRelease();
    goto LABEL_154;
  }
  __break(1u);
LABEL_186:
  __break(1u);
  return result;
}

BOOL sub_1000117F4(void *a1)
{
  uint64_t v2 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = a1[1];
  if ((v5 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(v5) & 0xF;
  }
  else {
    uint64_t v6 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    UUID.init(uuidString:)();
    uint64_t v7 = type metadata accessor for UUID();
    int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v4, 1, v7);
    sub_100013A98((uint64_t)v4, &qword_100039BC0);
    if (v8 != 1) {
      abort();
    }
  }
  return v6 != 0;
}

uint64_t sub_1000118F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for DispatchQoS();
  uint64_t v13 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  int v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(v4 + 16);
  os_log_type_t v16 = (void *)swift_allocObject();
  v16[2] = v4;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a4;
  aBlock[4] = sub_1000121AC;
  void aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000068EC;
  aBlock[3] = &unk_1000358B8;
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_1000139EC((unint64_t *)&qword_1000397A0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006560(&qword_100039538);
  sub_100007A60();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  return swift_release();
}

uint64_t sub_100011BB4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t))
{
  unint64_t v7 = dispatch thunk of Preferences.voiceSubscriptions.getter();
  if (a3)
  {
    swift_bridgeObjectRetain();
    int v8 = sub_100012FD8(v7, a2, a3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v7 = (unint64_t)v8;
  }
  a4(v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100011C60()
{
  swift_release();
  sub_100013A98(v0 + 32, &qword_100039BB8);
  sub_100013A98(v0 + 72, &qword_100039BD8);
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for SubscriptionService()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for SubscriptionService.DownloadingVoiceAsset(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SubscriptionService.DownloadingVoiceAsset(id *a1)
{
  uint64_t v1 = (uint64_t)(a1 + 1);

  return sub_100008224(v1);
}

void *initializeWithCopy for SubscriptionService.DownloadingVoiceAsset(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *a1 = *(void *)a2;
  uint64_t v4 = a1 + 1;
  uint64_t v5 = a2 + 8;
  uint64_t v6 = *(void *)(a2 + 32);
  a1[4] = v6;
  unint64_t v7 = **(void (***)(void *, uint64_t, uint64_t))(v6 - 8);
  id v8 = v3;
  v7(v4, v5, v6);
  return a1;
}

void **assignWithCopy for SubscriptionService.DownloadingVoiceAsset(void **a1, void **a2)
{
  uint64_t v4 = (uint64_t *)(a2 + 1);
  uint64_t v3 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  uint64_t v6 = (uint64_t *)(a1 + 1);
  id v7 = v3;

  sub_100011E38(v6, v4);
  return a1;
}

uint64_t *sub_100011E38(uint64_t *result, uint64_t *a2)
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

__n128 initializeWithTake for SubscriptionService.DownloadingVoiceAsset(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SubscriptionService.DownloadingVoiceAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  sub_100008224(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionService.DownloadingVoiceAsset(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SubscriptionService.DownloadingVoiceAsset(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionService.DownloadingVoiceAsset()
{
  return &type metadata for SubscriptionService.DownloadingVoiceAsset;
}

uint64_t sub_100012164()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000121AC()
{
  return sub_100011BB4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(unint64_t))(v0 + 40));
}

uint64_t sub_1000121BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    if (!(*v4 >> 62))
    {
      if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v22 < v5) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v8 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v7 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v10 = v23 + v7;
    if (!__OFADD__(v23, v7)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v4 >> 62) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v10 = v9 + v7;
  if (__OFADD__(v9, v7)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v11 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v11;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v11 & 0x8000000000000000) != 0
    || (v11 & 0x4000000000000000) != 0
    || (uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8, v10 > *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v11 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      *uint64_t v4 = v11;
      uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v14 = (void *)(v13 + 32 + 8 * v6);
  type metadata accessor for TaskOperation();
  swift_arrayDestroy();
  if (v7)
  {
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v16 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_17:
        if (v16 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v14 + 1);
        uint64_t v18 = (char *)(v13 + 32 + 8 * v5);
        if (v14 + 1 != (void *)v18 || v17 >= &v18[8 * v16]) {
          memmove(v17, v18, 8 * v16);
        }
        if (!(v11 >> 62))
        {
          uint64_t v19 = *(void *)(v13 + 16);
          uint64_t v20 = v19 + v7;
          if (!__OFADD__(v19, v7))
          {
LABEL_23:
            *(void *)(v13 + 16) = v20;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v20 = v25 + v7;
        if (!__OFADD__(v25, v7)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(v13 + 16);
      uint64_t v16 = v15 - v5;
      if (!__OFSUB__(v15, v5)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:
  *uint64_t v14 = v3;
  return specialized Array._endMutation()();
}

uint64_t sub_1000124A8(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t (*)(void *))isStackAllocationSafe;
  char v6 = *(unsigned char *)(a3 + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    uint64_t v9 = sub_10001262C((uint64_t)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a3, v5);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    uint64_t v9 = sub_10001262C((uint64_t)v10, v7, a3, v5);
    swift_release();
    swift_slowDealloc();
  }
  return v9;
}

uint64_t sub_10001262C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  uint64_t v20 = (unint64_t *)result;
  int64_t v7 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v24 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v11 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v12 = v11 | (v7 << 6);
LABEL_17:
    uint64_t v16 = (void *)(*(void *)(a3 + 48) + 16 * v12);
    uint64_t v17 = v16[1];
    v23[0] = *v16;
    v23[1] = v17;
    swift_bridgeObjectRetain();
    char v18 = a4(v23);
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      return result;
    }
    if (v18)
    {
      *(unint64_t *)((char *)v20 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = __OFADD__(v21++, 1);
      if (v13) {
        goto LABEL_30;
      }
    }
  }
  BOOL v13 = __OFADD__(v7++, 1);
  if (v13)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v24) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v22 + 8 * v7);
  if (v14)
  {
LABEL_16:
    unint64_t v10 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_17;
  }
  int64_t v15 = v7 + 1;
  if (v7 + 1 >= v24) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v22 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 2;
  if (v7 + 2 >= v24) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v22 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 3;
  if (v7 + 3 >= v24)
  {
LABEL_26:
    swift_retain();
    return sub_100012838(v20, a2, v21, a3);
  }
  unint64_t v14 = *(void *)(v22 + 8 * v15);
  if (v14)
  {
LABEL_15:
    int64_t v7 = v15;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v24) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v22 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100012838(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100006560(&qword_100039F00);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
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
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
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
      goto LABEL_36;
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

char *sub_100012AD0(uint64_t a1)
{
  return sub_10001B7FC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100012AE4(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v18 < v2) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v8 = v19 + v5;
    if (!__OFADD__(v19, v5)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v3 >> 62) {
    goto LABEL_32;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v9 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      *uint64_t v3 = v9;
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  type metadata accessor for TaskOperation();
  swift_arrayDestroy();
  if (v5)
  {
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v13 = v20 - v2;
      if (!__OFSUB__(v20, v2))
      {
LABEL_17:
        if (v13 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        uint64_t v14 = (const void *)(v11 + 32 + 8 * v2);
        if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v14 + 8 * v13) {
          memmove((void *)(v11 + 32 + 8 * v4), v14, 8 * v13);
        }
        if (!(v9 >> 62))
        {
          uint64_t v15 = *(void *)(v11 + 16);
          uint64_t v16 = v15 + v5;
          if (!__OFADD__(v15, v5))
          {
LABEL_23:
            *(void *)(v11 + 16) = v16;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v16 = v21 + v5;
        if (!__OFADD__(v21, v5)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v12 = *(void *)(v11 + 16);
      uint64_t v13 = v12 - v2;
      if (!__OFSUB__(v12, v2)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:
  return specialized Array._endMutation()();
}

void *sub_100012DC4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >> 62) {
    goto LABEL_27;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8)
  {
    while (1)
    {
      unint64_t v9 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_11:
        uint64_t v11 = v10;
        unint64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_26;
        }
        if (dispatch thunk of SynthesisVoiceSubscription.clientId.getter() == a2 && v13 == a3)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v14 & 1) == 0) {
            goto LABEL_6;
          }
        }
        uint64_t v15 = dispatch thunk of SynthesisVoiceSubscription.accessoryId.getter();
        if (a5)
        {
          if (v16)
          {
            if (v15 == a4 && v16 == a5)
            {

              swift_bridgeObjectRelease();
              goto LABEL_7;
            }
            char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v17)
            {
LABEL_22:

              goto LABEL_7;
            }
          }
        }
        else
        {
          if (!v16) {
            goto LABEL_22;
          }
          swift_bridgeObjectRelease();
        }
LABEL_6:
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
LABEL_7:
        ++v9;
        if (v12 == v8) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v9 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      if (!v8) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_11;
  }
  return &_swiftEmptyArrayStorage;
}

void *sub_100012FD8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      unint64_t v7 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        unint64_t v9 = v8;
        unint64_t v10 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_18;
        }
        if (dispatch thunk of SynthesisVoiceSubscription.clientId.getter() == a2 && v11 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_14:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          goto LABEL_5;
        }
        char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v12) {
          goto LABEL_14;
        }

LABEL_5:
        ++v7;
        if (v10 == v6) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v7 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      if (!v6) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v8 = *(id *)(a1 + 8 * v7 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100013184()
{
  return sub_1000104B0(v0);
}

void *sub_10001318C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      ++v4;
      objc_allocWithZone((Class)type metadata accessor for SynthesisVoiceSubscription());
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      SynthesisVoiceSubscription.init(voice:clientId:accessoryId:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      if (v2 == v4) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_10001330C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  id v5 = (uint64_t *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    sub_10000EDFC(v5, a2, (uint64_t)v14);
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6;
    }
    if (*(void *)&v14[0])
    {
      long long v11 = v14[0];
      long long v12 = v14[1];
      uint64_t v13 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_10001B7FC(0, *((void *)v6 + 2) + 1, 1, v6);
      }
      unint64_t v8 = *((void *)v6 + 2);
      unint64_t v7 = *((void *)v6 + 3);
      if (v8 >= v7 >> 1) {
        uint64_t v6 = sub_10001B7FC((char *)(v7 > 1), v8 + 1, 1, v6);
      }
      *((void *)v6 + 2) = v8 + 1;
      unint64_t v9 = &v6[40 * v8];
      *((void *)v9 + 8) = v13;
      *((_OWORD *)v9 + 2) = v11;
      *((_OWORD *)v9 + 3) = v12;
    }
    else
    {
      sub_100013A98((uint64_t)v14, &qword_100039BC8);
    }
    v5 += 5;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  return v6;
}

void *sub_100013478(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v3);
      id v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      if (dispatch thunk of TrialAssetProvider.findVoice(_:)())
      {
        VoiceAsset.voice.getter();

        swift_release();
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
      }
      ++v3;
      if (v6 == v2) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_17:
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10001360C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  id v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    id v4 = sub_10001B7FC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = *((void *)v4 + 2);
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = &v4[40 * a2 + 32];
    if (a1 != a2 || &v4[40 * a1 + 32] >= &v16[40 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[40 * a1 + 32], v16, 40 * v15);
    }
    uint64_t v17 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      *((void *)v4 + 2) = v18;
LABEL_20:
      void *v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100013784(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

BOOL sub_10001379C(void *a1)
{
  return sub_1000117F4(a1);
}

id sub_1000137BC()
{
  return sub_10000E4C0(v0);
}

id sub_1000137C8(uint64_t a1)
{
  return sub_10000F0CC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000137D0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100013808(float a1)
{
  return sub_10000F1F8(*(void **)(v1 + 16), a1);
}

uint64_t sub_100013814()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100013854(uint64_t a1, uint64_t a2)
{
  sub_10000F410(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10001385C(float a1)
{
  return sub_10000FB68(*(void **)(v1 + 16), a1);
}

uint64_t sub_100013864(uint64_t a1)
{
  return sub_10000FDD0(a1, *(void **)(v1 + 16));
}

void *sub_10001386C(uint64_t a1, void *a2)
{
  long long v3 = *(void **)a1;
  *a2 = *(void *)a1;
  id v4 = a2 + 1;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = *(void *)(a1 + 32);
  a2[4] = v6;
  uint64_t v7 = **(void (***)(void *, uint64_t, uint64_t))(v6 - 8);
  id v8 = v3;
  v7(v4, v5, v6);
  return a2;
}

id *sub_1000138F0(id *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 1);

  sub_100008224(v2);
  return a1;
}

uint64_t sub_100013928(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  *(void *)a2 = *(void *)a1;

  sub_100008224(a2 + 8);
  long long v5 = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 8) = v5;
  return a2;
}

uint64_t sub_100013978()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000139D8()
{
  return sub_10000DC2C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

uint64_t sub_1000139EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013A34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006560(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013A98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006560(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100013B14()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  uint64_t v5 = *(void **)(v0 + 32);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 valueForKey:v6];

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_1000143A0((uint64_t)v18, (uint64_t)v19);
  if (v20)
  {
    if (swift_dynamicCast())
    {
      static String.Encoding.utf8.getter();
      uint64_t v8 = String.data(using:allowLossyConversion:)();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v10 >> 60 != 15)
      {
        int64_t v11 = self;
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        *(void *)&v18[0] = 0;
        id v13 = [v11 JSONObjectWithData:isa options:0 error:v18];

        id v14 = *(id *)&v18[0];
        if (v13)
        {
          _bridgeAnyObjectToAny(_:)();
          sub_100014600(v8, v10);
          swift_unknownObjectRelease();
          sub_100006560((uint64_t *)&unk_100039CC0);
          if (swift_dynamicCast()) {
            return *(void *)&v18[0];
          }
        }
        else
        {
          uint64_t v16 = v14;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          sub_100014600(v8, v10);
          swift_errorRelease();
        }
      }
    }
  }
  else
  {
    sub_100014408((uint64_t)v19);
  }
  return 0;
}

uint64_t sub_100013DD0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t result = sub_100013B14();
  if (!result)
  {
    *a1 = 0u;
    a1[1] = 0u;
    return result;
  }
  uint64_t v4 = result;
  if (*(void *)(v1 + 24))
  {
    uint64_t v5 = *(void *)(v1 + 16);
    uint64_t v6 = *(void *)(v1 + 24);
    if (*(void *)(result + 16)) {
      goto LABEL_4;
    }
LABEL_8:
    *a1 = 0u;
    a1[1] = 0u;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  uint64_t v6 = 0xE700000000000000;
  uint64_t v5 = 0x746C7561666564;
  if (!*(void *)(result + 16)) {
    goto LABEL_8;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_10000A728(v5, v6);
  if (v8)
  {
    sub_100008274(*(void *)(v4 + 56) + 32 * v7, (uint64_t)a1);
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013EBC()
{
  return sub_100013F44(0xD000000000000012, 0x80000001000308B0, (uint64_t)sub_10001451C, (void (*)(uint64_t *__return_ptr))sub_100014534);
}

uint64_t sub_100013F00()
{
  return sub_100013F44(0xD000000000000010, 0x8000000100030890, (uint64_t)sub_10001451C, (void (*)(uint64_t *__return_ptr))sub_100014534);
}

uint64_t sub_100013F44(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  sub_100013DD0(&v15);
  if (!v16)
  {
    sub_100014408((uint64_t)&v15);
    return 0;
  }
  sub_10000BC54(&v15, v17);
  sub_100008274((uint64_t)v17, (uint64_t)&v15);
  uint64_t v5 = swift_dynamicCast();
  if (!v5)
  {
    sub_100008224((uint64_t)v17);
    if (swift_dynamicCast())
    {
      uint64_t v11 = v13;
      sub_100008224((uint64_t)&v15);
      return v11;
    }
    sub_100008224((uint64_t)&v15);
    return 0;
  }
  uint64_t v6 = __chkstk_darwin(v5);
  if ((v14 & 0x1000000000000000) != 0 || !(v14 & 0x2000000000000000 | v7 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    __chkstk_darwin(v6);
    if ((v14 & 0x2000000000000000) != 0)
    {
      if (v8 > 0x20u || ((0x100003E01uLL >> v8) & 1) == 0) {
        _swift_stdlib_strtod_clocale();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v8 & 0x1000000000000000) != 0)
      {
        uint64_t v9 = (v14 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v10 = v8 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v9 = _StringObject.sharedUTF8.getter();
      }
      sub_1000144BC(v9, v10, a4);
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v11 = 0;
  sub_100008224((uint64_t)v17);
  sub_100008224((uint64_t)&v15);
  return v11;
}

uint64_t sub_100014198()
{
  uint64_t v1 = *(void **)(v0 + 32);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1000143A0((uint64_t)v8, (uint64_t)v9);
  if (!v9[3])
  {
    sub_100014408((uint64_t)v9);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  v9[0] = v6;
  v9[1] = v7;
  *(void *)&v8[0] = 44;
  *((void *)&v8[0] + 1) = 0xE100000000000000;
  sub_100014468();
  uint64_t v4 = StringProtocol.components<A>(separatedBy:)();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000142C8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for OspreyServerConfig()
{
  return self;
}

uint64_t sub_10001432C()
{
  return sub_100013EBC();
}

uint64_t sub_100014354()
{
  return sub_100013F00();
}

uint64_t sub_10001437C()
{
  return sub_100014198();
}

uint64_t sub_1000143A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006560(&qword_100039CB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014408(uint64_t a1)
{
  uint64_t v2 = sub_100006560(&qword_100039CB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100014468()
{
  unint64_t result = qword_100039CB8;
  if (!qword_100039CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039CB8);
  }
  return result;
}

uint64_t sub_1000144BC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_10001451C@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_10001454C(a1, a2);
}

void *sub_100014534@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000145BC(a1);
}

unsigned char *sub_10001454C@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_1000145BC@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_100014600(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100014614(a1, a2);
  }
  return a1;
}

uint64_t sub_100014614(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001466C(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t sub_100014734(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  Hasher.init(_seed:)();
  Swift::UInt v3 = SynthesisVoice.VoiceType.rawValue.getter();
  Hasher._combine(_:)(v3);
  Swift::Int v4 = Hasher._finalize()();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = SynthesisVoice.VoiceType.rawValue.getter();
  if (v8 == SynthesisVoice.VoiceType.rawValue.getter()) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = SynthesisVoice.VoiceType.rawValue.getter();
    BOOL v13 = v12 == SynthesisVoice.VoiceType.rawValue.getter();
    uint64_t result = v13;
    if (v13) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

id DaemonXPCListener.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

char *DaemonXPCListener.init()()
{
  id v1 = v0;
  static Constants.MachServiceName.getter();
  id v2 = objc_allocWithZone((Class)NSXPCListener);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithMachServiceName:v3];

  *(void *)&v1[OBJC_IVAR____TtC13SiriTTSDaemon17DaemonXPCListener_listener] = v4;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for DaemonXPCListener();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, "init");
  [*(id *)&v5[OBJC_IVAR____TtC13SiriTTSDaemon17DaemonXPCListener_listener] setDelegate:v5];
  return v5;
}

uint64_t type metadata accessor for DaemonXPCListener()
{
  return self;
}

id DaemonXPCListener.__deallocating_deinit()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC13SiriTTSDaemon17DaemonXPCListener_listener];
  [v1 setDelegate:0];
  [v1 invalidate];
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for DaemonXPCListener();
  return objc_msgSendSuper2(&v3, "dealloc");
}

Swift::Void __swiftcall DaemonXPCListener.resume()()
{
  [*(id *)(v0 + OBJC_IVAR____TtC13SiriTTSDaemon17DaemonXPCListener_listener) resume];
}

uint64_t sub_100014AA4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  objc_super v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = sub_100006560(&qword_100039FE0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TTSError();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  swift_errorRetain();
  sub_100006560(&qword_100039E40);
  int v17 = swift_dynamicCast();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if (!v17)
  {
    v18(v12, 1, 1, v13);
    sub_100013A98((uint64_t)v12, &qword_100039FE0);
    return 0;
  }
  v18(v12, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  uint64_t v19 = *(void *)(v1 + *(int *)(type metadata accessor for WorkflowFactory.TTSErrorHandler(0) + 20));
  swift_bridgeObjectRetain();
  TTSError.code.getter();
  uint64_t v38 = *(void *)(v19 + 16);
  if (!v38)
  {
    uint64_t v22 = 0;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_18:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return v22;
  }
  int64_t v35 = v16;
  unint64_t v32 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v37 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
  v37(v7, v19 + v32, v3);
  sub_100028E28(&qword_100039FE8, (void (*)(uint64_t))&type metadata accessor for TTSError.TTSErrorCode);
  swift_bridgeObjectRetain();
  char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v33 = v4;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v34 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  unint64_t v39 = v21;
  v21(v7, v3);
  if (v20)
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = 1;
    uint64_t v16 = v35;
LABEL_17:
    v39(v9, v3);
    goto LABEL_18;
  }
  uint64_t v31 = v19;
  if (v38 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = 0;
LABEL_16:
    uint64_t v16 = v35;
    goto LABEL_17;
  }
  uint64_t v29 = v14;
  uint64_t v30 = v13;
  uint64_t v36 = v9;
  uint64_t v23 = *(void *)(v33 + 72);
  unint64_t v24 = v31 + v23 + v32;
  uint64_t v25 = 1;
  while (1)
  {
    uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v37)(v7, v24, v3);
    uint64_t v27 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    char v28 = dispatch thunk of static Equatable.== infix(_:_:)();
    v39(v7, v3);
    if (v28)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = 1;
      goto LABEL_15;
    }
    ++v25;
    v24 += v23;
    if (v27 == v38)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = 0;
LABEL_15:
      uint64_t v9 = v36;
      uint64_t v14 = v29;
      uint64_t v13 = v30;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100014F34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100006560(&qword_100039E10);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_100014FA4()
{
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  type metadata accessor for RequestPreprocessAction();
  swift_allocObject();
  swift_retain();
  RequestPreprocessAction.init(pool:)();
  swift_allocObject();
  uint64_t v0 = WorkflowNode.init(action:)();
  type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  RequestParsingAction.init(pool:)();
  swift_allocObject();
  uint64_t v1 = WorkflowNode.init(action:)();
  type metadata accessor for OspreyTTSAction();
  swift_allocObject();
  swift_retain();
  OspreyTTSAction.init(pool:)();
  swift_allocObject();
  uint64_t v2 = WorkflowNode.init(action:)();
  sub_100006560(&qword_100039E28);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10002F120;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  v5._rawValue = (void *)v3;
  specialized Array._endMutation()();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100006560(&qword_100039E10);
  DirectedAcyclicGraph.chain(nodes:)(v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_1000151CC()
{
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  type metadata accessor for RequestPreprocessAction();
  swift_allocObject();
  swift_retain();
  RequestPreprocessAction.init(pool:)();
  swift_allocObject();
  uint64_t v6 = WorkflowNode.init(action:)();
  type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  RequestParsingAction.init(pool:)();
  swift_allocObject();
  uint64_t v0 = WorkflowNode.init(action:)();
  type metadata accessor for VoiceSelectionAction();
  swift_allocObject();
  swift_retain();
  VoiceSelectionAction.init(pool:)();
  swift_allocObject();
  uint64_t v5 = WorkflowNode.init(action:)();
  type metadata accessor for CacheReadingAction();
  swift_allocObject();
  swift_retain();
  CacheReadingAction.init(pool:)();
  swift_allocObject();
  uint64_t v1 = WorkflowNode.init(action:)();
  type metadata accessor for HasAudioCondition();
  swift_allocObject();
  HasAudioCondition.init()();
  swift_allocObject();
  WorkflowNode.init(condition:)();
  type metadata accessor for SynthesisEngineSelectionAction();
  swift_allocObject();
  swift_retain();
  SynthesisEngineSelectionAction.init(pool:)();
  swift_allocObject();
  WorkflowNode.init(action:)();
  type metadata accessor for DeviceSynthesisAction();
  swift_allocObject();
  swift_retain();
  DeviceSynthesisAction.init(pool:)();
  swift_allocObject();
  WorkflowNode.init(action:)();
  type metadata accessor for SynthesisBufferingAction();
  swift_allocObject();
  swift_retain();
  SynthesisBufferingAction.init(pool:)();
  swift_allocObject();
  WorkflowNode.init(action:)();
  type metadata accessor for IsNaturalVoiceCondition();
  swift_allocObject();
  swift_retain();
  IsNaturalVoiceCondition.init(pool:)();
  swift_allocObject();
  WorkflowNode.init(condition:)();
  type metadata accessor for OpusEncodingAction();
  swift_allocObject();
  swift_retain();
  OpusEncodingAction.init(pool:)();
  swift_allocObject();
  WorkflowNode.init(action:)();
  type metadata accessor for PassThroughAction();
  swift_allocObject();
  PassThroughAction.init()();
  swift_allocObject();
  uint64_t v2 = WorkflowNode.init(action:)();
  sub_100006560(&qword_100039E28);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10002F130;
  *(void *)(v3 + 32) = v6;
  *(void *)(v3 + 40) = v0;
  *(void *)(v3 + 48) = v5;
  *(void *)(v3 + 56) = v1;
  v7._rawValue = (void *)v3;
  specialized Array._endMutation()();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100006560(&qword_100039E10);
  DirectedAcyclicGraph.chain(nodes:)(v7);
  swift_bridgeObjectRelease();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  swift_retain();
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
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
  return v2;
}

uint64_t sub_1000157E0()
{
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  RequestParsingAction.init(pool:)();
  swift_allocObject();
  uint64_t v0 = WorkflowNode.init(action:)();
  type metadata accessor for InlineStreamingAction();
  swift_allocObject();
  swift_retain();
  InlineStreamingAction.init(pool:)();
  swift_allocObject();
  uint64_t v1 = WorkflowNode.init(action:)();
  sub_100006560(&qword_100039E28);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10002F140;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  v4._rawValue = (void *)v2;
  specialized Array._endMutation()();
  swift_retain();
  swift_retain();
  sub_100006560(&qword_100039E10);
  DirectedAcyclicGraph.chain(nodes:)(v4);
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_100015994@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_100006560(&qword_100039E10);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  Swift::OpaquePointer v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = sub_1000151CC();
  if (a1)
  {
    uint64_t v11 = type metadata accessor for AudioPlaybackAction();
    swift_allocObject();
    swift_retain();
    swift_retain();
    uint64_t v12 = AudioPlaybackAction.init(pool:)();
    uint64_t v34 = v11;
    int64_t v35 = &protocol witness table for AudioPlaybackAction;
    uint64_t v33 = v12;
    type metadata accessor for WorkflowNode();
    swift_allocObject();
    uint64_t v32 = WorkflowNode.init(action:)();
    uint64_t v33 = v10;
    swift_retain();
    DirectedAcyclicGraph.connect(fromNode:toNode:)();
    swift_release();
    swift_release();
  }
  else
  {
    swift_retain();
  }
  uint64_t v13 = type metadata accessor for AudioDumpAction();
  swift_allocObject();
  swift_retain();
  uint64_t v14 = AudioDumpAction.init(pool:)();
  dispatch thunk of AudioDumpAction.diagnosticTag.setter();
  uint64_t v34 = v13;
  int64_t v35 = &protocol witness table for AudioDumpAction;
  uint64_t v33 = v14;
  type metadata accessor for WorkflowNode();
  swift_allocObject();
  swift_retain();
  uint64_t v30 = WorkflowNode.init(action:)();
  uint64_t v32 = v30;
  uint64_t v33 = v10;
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  sub_100006560(&qword_100039E88);
  uint64_t v15 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v28 = v10;
  uint64_t v29 = v7;
  uint64_t v17 = v16;
  uint64_t v18 = v3;
  uint64_t v19 = *(void *)(v16 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10002F150;
  unint64_t v22 = v21 + v20;
  uint64_t v27 = v9;
  uint64_t v23 = *(void (**)(unint64_t, void, uint64_t))(v17 + 104);
  v23(v22, enum case for TTSError.TTSErrorCode.inlineStreamTimeout(_:), v15);
  v23(v22 + v19, enum case for TTSError.TTSErrorCode.ospreyNetworkTimeout(_:), v15);
  v23(v22 + 2 * v19, enum case for TTSError.TTSErrorCode.ospreyInvalidAudioFormat(_:), v15);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v27, v18);
  uint64_t v24 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v31, v29, v18);
  uint64_t result = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  *(void *)(v24 + *(int *)(result + 20)) = v21;
  return result;
}

uint64_t sub_100015D68@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  LODWORD(v49) = a1;
  uint64_t v54 = a3;
  uint64_t v48 = sub_100006560(&qword_100039E10);
  uint64_t v52 = *(void *)(v48 - 8);
  uint64_t v4 = __chkstk_darwin(v48);
  unint64_t v53 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v55 = (char *)v47 - v6;
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  uint64_t v7 = type metadata accessor for RetryTextModificationAction();
  swift_allocObject();
  swift_retain();
  uint64_t v8 = RetryTextModificationAction.init(pool:)();
  uint64_t v59 = v7;
  unint64_t v60 = &protocol witness table for RetryTextModificationAction;
  id v58 = (void *)v8;
  swift_allocObject();
  uint64_t v56 = WorkflowNode.init(action:)();
  uint64_t v9 = type metadata accessor for RequestPreprocessAction();
  swift_allocObject();
  swift_retain();
  uint64_t v10 = RequestPreprocessAction.init(pool:)();
  uint64_t v59 = v9;
  unint64_t v60 = &protocol witness table for RequestPreprocessAction;
  id v58 = (void *)v10;
  swift_allocObject();
  uint64_t v11 = WorkflowNode.init(action:)();
  uint64_t v12 = type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  uint64_t v13 = RequestParsingAction.init(pool:)();
  uint64_t v59 = v12;
  unint64_t v60 = &protocol witness table for RequestParsingAction;
  id v58 = (void *)v13;
  swift_allocObject();
  uint64_t v14 = WorkflowNode.init(action:)();
  uint64_t v15 = type metadata accessor for VoiceSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v16 = VoiceSelectionAction.init(pool:)();
  uint64_t v59 = v15;
  unint64_t v60 = &protocol witness table for VoiceSelectionAction;
  id v58 = (void *)v16;
  swift_allocObject();
  uint64_t v17 = WorkflowNode.init(action:)();
  uint64_t v18 = type metadata accessor for SynthesisEngineSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v19 = SynthesisEngineSelectionAction.init(pool:)();
  uint64_t v59 = v18;
  unint64_t v60 = &protocol witness table for SynthesisEngineSelectionAction;
  id v58 = (void *)v19;
  swift_allocObject();
  uint64_t v20 = WorkflowNode.init(action:)();
  uint64_t v21 = type metadata accessor for DeviceSynthesisAction();
  swift_allocObject();
  swift_retain();
  uint64_t v22 = DeviceSynthesisAction.init(pool:)();
  uint64_t v59 = v21;
  unint64_t v60 = &protocol witness table for DeviceSynthesisAction;
  id v58 = (void *)v22;
  swift_allocObject();
  uint64_t v23 = WorkflowNode.init(action:)();
  uint64_t v24 = type metadata accessor for SynthesisBufferingAction();
  swift_allocObject();
  v47[0] = a2;
  swift_retain();
  uint64_t v25 = SynthesisBufferingAction.init(pool:)();
  uint64_t v59 = v24;
  unint64_t v60 = &protocol witness table for SynthesisBufferingAction;
  id v58 = (void *)v25;
  swift_allocObject();
  uint64_t v26 = WorkflowNode.init(action:)();
  sub_100006560(&qword_100039E28);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_10002F160;
  *(void *)(v27 + 32) = v56;
  *(void *)(v27 + 40) = v11;
  *(void *)(v27 + 48) = v14;
  *(void *)(v27 + 56) = v17;
  *(void *)(v27 + 64) = v20;
  *(void *)(v27 + 72) = v23;
  *(void *)(v27 + 80) = v26;
  id v58 = (void *)v27;
  specialized Array._endMutation()();
  v28._rawValue = v58;
  swift_retain();
  uint64_t v51 = v11;
  swift_retain();
  uint64_t v50 = v14;
  swift_retain();
  v47[3] = v17;
  swift_retain();
  v47[2] = v20;
  swift_retain();
  v47[1] = v23;
  swift_retain();
  swift_retain();
  uint64_t v29 = v48;
  uint64_t v30 = v55;
  DirectedAcyclicGraph.chain(nodes:)(v28);
  swift_bridgeObjectRelease();
  if (v49)
  {
    uint64_t v31 = type metadata accessor for AudioPlaybackAction();
    swift_allocObject();
    swift_retain();
    uint64_t v32 = AudioPlaybackAction.init(pool:)();
    uint64_t v59 = v31;
    unint64_t v60 = &protocol witness table for AudioPlaybackAction;
    id v58 = (void *)v32;
    swift_allocObject();
    uint64_t v57 = WorkflowNode.init(action:)();
    id v58 = (void *)v26;
    DirectedAcyclicGraph.connect(fromNode:toNode:)();
    swift_release();
  }
  uint64_t v33 = type metadata accessor for AudioDumpAction();
  swift_allocObject();
  swift_retain();
  uint64_t v34 = AudioDumpAction.init(pool:)();
  dispatch thunk of AudioDumpAction.diagnosticTag.setter();
  uint64_t v59 = v33;
  unint64_t v60 = &protocol witness table for AudioDumpAction;
  id v58 = (void *)v34;
  swift_allocObject();
  swift_retain();
  uint64_t v49 = WorkflowNode.init(action:)();
  uint64_t v57 = v49;
  id v58 = (void *)v26;
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  uint64_t v36 = v52;
  int64_t v35 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v53, v30, v29);
  sub_100006560(&qword_100039E88);
  uint64_t v37 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v38 = *(void *)(v37 - 8);
  v47[0] = v26;
  uint64_t v39 = v38;
  uint64_t v40 = *(void *)(v38 + 72);
  unint64_t v41 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_10002F170;
  unint64_t v43 = v42 + v41;
  int64_t v44 = *(void (**)(unint64_t, void, uint64_t))(v39 + 104);
  v44(v43, enum case for TTSError.TTSErrorCode.inlineStreamNetworkStall(_:), v37);
  v44(v43 + v40, enum case for TTSError.TTSErrorCode.ospreyNetworkStall(_:), v37);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v55, v29);
  uint64_t v45 = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v54, v35, v29);
  uint64_t result = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  *(void *)(v45 + *(int *)(result + 20)) = v42;
  return result;
}

uint64_t sub_100016480(uint64_t a1, uint64_t a2)
{
  uint64_t v159 = a2;
  v152 = (void *)a1;
  uint64_t v143 = type metadata accessor for OSSignpostError();
  uint64_t v142 = *(void *)(v143 - 8);
  uint64_t v2 = __chkstk_darwin(v143);
  uint64_t v136 = (char *)&v132 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v135 = (char *)&v132 - v4;
  uint64_t v5 = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  uint64_t v140 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v146 = (uint64_t)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v145 = (uint64_t)&v132 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v139 = (uint64_t)&v132 - v11;
  __chkstk_darwin(v10);
  uint64_t v138 = (uint64_t)&v132 - v12;
  uint64_t v168 = sub_100006560(&qword_100039E10);
  uint64_t v166 = *(void *)(v168 - 8);
  __chkstk_darwin(v168);
  v151 = (char *)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = type metadata accessor for Logger();
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  os_log_type_t v132 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006560(&qword_100039E78);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v157 = (uint64_t)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  v158 = (char *)&v132 - v19;
  __chkstk_darwin(v18);
  uint64_t v169 = (uint64_t)&v132 - v20;
  uint64_t v21 = type metadata accessor for OSSignpostID();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v150 = (char *)&v132 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  unint64_t v137 = (char *)&v132 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v132 - v28;
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v132 - v30;
  uint64_t v164 = type metadata accessor for OSSignposter();
  uint64_t v167 = *(void *)(v164 - 8);
  uint64_t v32 = __chkstk_darwin(v164);
  long long v149 = (char *)&v132 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v147 = (char *)&v132 - v35;
  __chkstk_darwin(v34);
  uint64_t v37 = (char *)&v132 - v36;
  static Signpost.signposter.getter();
  static OSSignpostID.exclusive.getter();
  uint64_t v38 = OSSignposter.logHandle.getter();
  os_signpost_type_t v39 = static os_signpost_type_t.begin.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    v161 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
    unint64_t v40 = (v22 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v161(v29, v31, v21);
    unint64_t v41 = v29;
    uint64_t v42 = v22;
    unint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v43 = 0;
    os_signpost_id_t v44 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, v39, v44, "TTS build speech workflow", "", v43, 2u);
    uint64_t v22 = v42;
    uint64_t v29 = v41;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v41, v21);
    uint64_t v45 = v161;
  }
  else
  {

    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
    unint64_t v40 = (v22 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  v161 = v45;
  unint64_t v141 = v40;
  v45(v29, v31, v21);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  uint64_t v163 = OSSignpostIntervalState.init(id:isOpen:)();
  unint64_t v46 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v160 = v21;
  uint64_t v156 = v22 + 8;
  v154 = v46;
  v46(v31, v21);
  uint64_t v47 = v167 + 8;
  v153 = *(void (**)(char *, uint64_t))(v167 + 8);
  v153(v37, v164);
  uint64_t v48 = v166;
  uint64_t v49 = v166 + 56;
  uint64_t v50 = v168;
  uint64_t v51 = v169;
  v148 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v166 + 56);
  v148(v169, 1, 1, v168);
  type metadata accessor for InternalSettings();
  uint64_t v52 = v159;
  unint64_t v53 = v165;
  dispatch thunk of ObjectPool.find<A>()();
  v155 = v29;
  uint64_t v167 = v47;
  uint64_t v144 = v49;
  if (v53)
  {
    swift_errorRelease();
    uint64_t v54 = 0;
  }
  else
  {
    uint64_t v162 = 0;
    char v55 = dispatch thunk of InternalSettings.disableInlineStreamTTS.getter();
    if (v55 != 2 && (v55 & 1) != 0)
    {
      uint64_t v83 = v132;
      static Logger.service.getter();
      long long v84 = Logger.logObject.getter();
      os_log_type_t v85 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v84, v85))
      {
        uint64_t v86 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v86 = 0;
        _os_log_impl((void *)&_mh_execute_header, v84, v85, "Disable inline streaming due to internal settings", v86, 2u);
        uint64_t v50 = v168;
        swift_slowDealloc();
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v83, v134);
      uint64_t v56 = 0;
      goto LABEL_11;
    }
    swift_release();
    uint64_t v54 = v162;
  }
  type metadata accessor for InlineStreamingStorage();
  dispatch thunk of ObjectPool.find<A>()();
  if (v54)
  {
    swift_errorRelease();
    uint64_t v56 = 0;
    uint64_t v162 = 0;
LABEL_11:
    v165 = (unint64_t *)&_swiftEmptyArrayStorage;
    goto LABEL_20;
  }
  uint64_t v162 = 0;
  type metadata accessor for SpeechRequest();
  SynthesizingRequestProtocol.text.getter();
  uint64_t v57 = (void *)dispatch thunk of InlineStreamingStorage.findSignal(matchingText:)();
  swift_bridgeObjectRelease();

  if (v57)
  {
    id v58 = v151;
    uint64_t v56 = sub_1000157E0();
    sub_100013A98(v51, &qword_100039E78);
    uint64_t v59 = v58;
    uint64_t v60 = v168;
    (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v51, v59, v168);
    v148(v51, 0, 1, v60);
    sub_100015994(1, v138);
    id v61 = (unint64_t *)sub_10001BA30(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    unint64_t v63 = v61[2];
    unint64_t v62 = v61[3];
    v165 = v61;
    if (v63 >= v62 >> 1) {
      v165 = (unint64_t *)sub_10001BA30(v62 > 1, v63 + 1, 1, (unint64_t)v165);
    }
    uint64_t v64 = v165;
    v165[2] = v63 + 1;
    unint64_t v65 = (*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80);
    uint64_t v66 = *(void *)(v140 + 72);
    sub_100028F0C(v138, (uint64_t)v64 + v65 + v66 * v63);
    sub_100015D68(1, v52, v139);
    unint64_t v68 = v64[2];
    unint64_t v67 = v64[3];
    if (v68 >= v67 >> 1) {
      v165 = (unint64_t *)sub_10001BA30(v67 > 1, v68 + 1, 1, (unint64_t)v165);
    }
    uint64_t v69 = v165;
    uint64_t v48 = v166;
    v165[2] = v68 + 1;
    sub_100028F0C(v139, (uint64_t)v69 + v65 + v68 * v66);
    swift_release();
    uint64_t v51 = v169;
  }
  else
  {
    swift_release();
    uint64_t v56 = 0;
    v165 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  uint64_t v50 = v168;
LABEL_20:
  uint64_t v70 = (uint64_t)v158;
  sub_100013A34(v51, (uint64_t)v158, &qword_100039E78);
  uint64_t v166 = *(void *)(v48 + 48);
  int v71 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v166)(v70, 1, v50);
  sub_100013A98(v70, &qword_100039E78);
  if (v71 == 1)
  {
    unint64_t v72 = v152;
    uint64_t v73 = sub_10001D868((uint64_t)v152, v52, (void (*)(void))&type metadata accessor for SpeechRequest);
    if (sub_10001DA64(v72, v73, v52, (void (*)(void))&type metadata accessor for SpeechRequest))
    {
      v74 = v151;
      uint64_t v75 = sub_100014FA4();
      swift_release();
      sub_100013A98(v51, &qword_100039E78);
      uint64_t v76 = v168;
      (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v51, v74, v168);
      v148(v51, 0, 1, v76);
      if (v73)
      {
        swift_retain();
        uint64_t v77 = (void *)VoiceAsset.voice.getter();
        swift_release();
        uint64_t v78 = v77;
        dispatch thunk of SynthesisVoice.footprint.getter();

        uint64_t v79 = SynthesisVoice.Footprint.rawValue.getter();
        if (v79 == SynthesisVoice.Footprint.rawValue.getter()
          || (dispatch thunk of SynthesisVoice.type.getter(),
              uint64_t v80 = SynthesisVoice.VoiceType.rawValue.getter(),
              v80 == SynthesisVoice.VoiceType.rawValue.getter()))
        {
          if (sub_100017A6C())
          {
            dispatch thunk of OspreyBuiltInConfig.timeout.getter();
            dispatch thunk of OspreyBuiltInConfig.timeout.setter();
            swift_release();
          }
        }
      }
      else
      {
        uint64_t v78 = 0;
      }
      sub_100015994(1, v145);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v165 = (unint64_t *)sub_10001BA30(0, v165[2] + 1, 1, (unint64_t)v165);
      }
      unint64_t v88 = v165[2];
      unint64_t v87 = v165[3];
      v158 = v78;
      uint64_t v56 = v75;
      if (v88 >= v87 >> 1) {
        v165 = (unint64_t *)sub_10001BA30(v87 > 1, v88 + 1, 1, (unint64_t)v165);
      }
      unint64_t v89 = v165;
      v165[2] = v88 + 1;
      unint64_t v90 = (*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80);
      uint64_t v91 = *(void *)(v140 + 72);
      sub_100028F0C(v145, (uint64_t)v89 + v90 + v91 * v88);
      sub_100015D68(1, v52, v146);
      unint64_t v93 = v89[2];
      unint64_t v92 = v89[3];
      if (v93 >= v92 >> 1) {
        v165 = (unint64_t *)sub_10001BA30(v92 > 1, v93 + 1, 1, (unint64_t)v165);
      }
      id v94 = v165;
      v165[2] = v93 + 1;
      sub_100028F0C(v146, (uint64_t)v94 + v90 + v93 * v91);

      swift_release();
      LODWORD(v158) = 0;
      uint64_t v50 = v168;
    }
    else
    {
      unint64_t v81 = v151;
      uint64_t v82 = sub_1000151CC();
      swift_release();
      swift_release();
      sub_100013A98(v51, &qword_100039E78);
      uint64_t v50 = v168;
      (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v51, v81, v168);
      LODWORD(v158) = 1;
      v148(v51, 0, 1, v50);
      uint64_t v56 = v82;
    }
  }
  else
  {
    LODWORD(v158) = 0;
  }
  uint64_t v95 = type metadata accessor for AudioPlaybackAction();
  swift_allocObject();
  swift_retain();
  uint64_t v96 = AudioPlaybackAction.init(pool:)();
  uint64_t v171 = v95;
  v172 = &protocol witness table for AudioPlaybackAction;
  uint64_t v170 = v96;
  type metadata accessor for WorkflowNode();
  swift_allocObject();
  uint64_t v97 = WorkflowNode.init(action:)();
  if (!v56)
  {
    __break(1u);
    goto LABEL_58;
  }
  uint64_t v170 = v56;
  v152 = (void *)v97;
  uint64_t v173 = v97;
  uint64_t v98 = v169;
  uint64_t v99 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v166;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v166)(v169, 1, v50) == 1)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  uint64_t v100 = type metadata accessor for AudioDumpAction();
  swift_allocObject();
  swift_retain();
  uint64_t v101 = AudioDumpAction.init(pool:)();
  uint64_t v171 = v100;
  v172 = &protocol witness table for AudioDumpAction;
  uint64_t v170 = v101;
  swift_allocObject();
  uint64_t v102 = WorkflowNode.init(action:)();
  uint64_t v170 = v56;
  v151 = (char *)v102;
  uint64_t v173 = v102;
  if (v99(v98, 1, v50) == 1)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  if (v158)
  {
    uint64_t v103 = type metadata accessor for SynthesisCacheWritingAction();
    swift_allocObject();
    swift_retain();
    uint64_t v104 = SynthesisCacheWritingAction.init(pool:)();
    uint64_t v171 = v103;
    v172 = &protocol witness table for SynthesisCacheWritingAction;
    uint64_t v170 = v104;
    swift_allocObject();
    uint64_t v105 = WorkflowNode.init(action:)();
    uint64_t v106 = type metadata accessor for OpusEncodingAction();
    swift_allocObject();
    swift_retain();
    uint64_t v107 = OpusEncodingAction.init(pool:)();
    uint64_t v171 = v106;
    v172 = &protocol witness table for OpusEncodingAction;
    uint64_t v170 = v107;
    swift_allocObject();
    uint64_t v108 = WorkflowNode.init(action:)();
    uint64_t v170 = v56;
    uint64_t v173 = v108;
    uint64_t v110 = v168;
    uint64_t v109 = v169;
    uint64_t v111 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v166;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v166)(v169, 1, v168) == 1)
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    DirectedAcyclicGraph.connect(fromNode:toNode:)();
    uint64_t v170 = v108;
    uint64_t v173 = v105;
    if (v111(v109, 1, v110) == 1)
    {
LABEL_62:
      swift_retain();
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    DirectedAcyclicGraph.connect(fromNode:toNode:)();
    swift_release();
    swift_release();
  }
  sub_100006524(0, &qword_100039E18);
  uint64_t v112 = v162;
  dispatch thunk of ObjectPool.find<A>()();
  if (v112) {
    swift_errorRelease();
  }
  uint64_t v113 = v157;
  unint64_t v114 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v166;
  sub_100013A34(v169, v157, &qword_100039E78);
  if (v114(v113, 1, v168) == 1)
  {
LABEL_60:
    swift_release();
    __break(1u);
    goto LABEL_61;
  }
  sub_100017BB4((uint64_t)v165);
  swift_bridgeObjectRelease();
  type metadata accessor for Workflow();
  swift_allocObject();
  uint64_t v115 = Workflow.init(graph:notification:errorHandlers:)();
  v116 = v155;
  swift_release();
  swift_release();
  swift_release();
  sub_100013A98(v169, &qword_100039E78);
  long long v117 = v147;
  static Signpost.signposter.getter();
  uint64_t v118 = OSSignposter.logHandle.getter();
  uint64_t v119 = v137;
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v120 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    uint64_t v168 = v115;
    swift_retain();
    uint64_t v121 = v135;
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v122 = v142;
    uint64_t v123 = v143;
    if ((*(unsigned int (**)(char *, uint64_t))(v142 + 88))(v121, v143) == enum case for OSSignpostError.doubleEnd(_:))
    {
      unint64_t v124 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v122 + 8))(v121, v123);
      unint64_t v124 = "";
    }
    uint64_t v125 = v160;
    v161(v116, v119, v160);
    v126 = v116;
    BOOL v127 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v127 = 0;
    os_signpost_id_t v128 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v118, v120, v128, "TTS build speech workflow", v124, v127, 2u);
    swift_slowDealloc();

    v129 = v119;
    BOOL v130 = v154;
    v154(v129, v125);
    v153(v147, v164);
    v130(v126, v125);
    uint64_t v115 = v168;
  }
  else
  {

    v154(v119, v160);
    v153(v117, v164);
  }
  swift_release();
  return v115;
}

uint64_t sub_100017A6C()
{
  sub_100006560(&qword_100039E60);
  dispatch thunk of ObjectPool.find<A>()();
  sub_100013784(&v5, (uint64_t)v8);
  sub_100029170((uint64_t)v8, (uint64_t)&v5);
  type metadata accessor for OspreyChainedConfigs();
  char v0 = swift_dynamicCast();
  if (v0)
  {
    uint64_t v1 = OspreyChainedConfigs.configs.getter();
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      sub_100029170(v1 + 40 * v2 - 8, (uint64_t)&v5);
    }
    else
    {
      uint64_t v7 = 0;
      long long v5 = 0u;
      long long v6 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_100008224((uint64_t)v8);
    if (*((void *)&v6 + 1))
    {
      type metadata accessor for OspreyBuiltInConfig();
      if (swift_dynamicCast()) {
        return v4;
      }
    }
    else
    {
      sub_100013A98((uint64_t)&v5, &qword_100039EA8);
    }
  }
  else
  {
    sub_100008224((uint64_t)v8);
  }
  return 0;
}

unint64_t *sub_100017BB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10001BDC8(0, v6, 0);
    uint64_t v7 = v17;
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v9 = *(void *)(v3 + 72);
    do
    {
      sub_100028F70(v8, (uint64_t)v5);
      uint64_t v17 = v7;
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_10001BDC8(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v17;
      }
      uint64_t v15 = v2;
      uint64_t v16 = sub_100028E28(&qword_100039E90, (void (*)(uint64_t))type metadata accessor for WorkflowFactory.TTSErrorHandler);
      uint64_t v12 = sub_100028FD4((uint64_t *)&v14);
      sub_100028F70((uint64_t)v5, (uint64_t)v12);
      void v7[2] = v11 + 1;
      sub_100013784(&v14, (uint64_t)&v7[5 * v11 + 4]);
      sub_100029038((uint64_t)v5);
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_100017D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v151 = a2;
  uint64_t v136 = (void *)a1;
  uint64_t v130 = type metadata accessor for OSSignpostError();
  uint64_t v129 = *(void *)(v130 - 8);
  uint64_t v2 = __chkstk_darwin(v130);
  unint64_t v124 = (char *)&v118 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v121 = (char *)&v118 - v4;
  uint64_t v5 = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  uint64_t v126 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v123 = (uint64_t)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v125 = (uint64_t)&v118 - v8;
  uint64_t v153 = sub_100006560(&qword_100039E10);
  uint64_t v145 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  v135 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = type metadata accessor for Logger();
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v122 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006560(&qword_100039E78);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v147 = (uint64_t)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v142 = (uint64_t)&v118 - v15;
  __chkstk_darwin(v14);
  uint64_t v152 = (uint64_t)&v118 - v16;
  uint64_t v17 = type metadata accessor for OSSignpostID();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v138 = (char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v133 = (char *)&v118 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v118 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v118 - v26;
  uint64_t v28 = type metadata accessor for OSSignposter();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v149 = v28;
  uint64_t v150 = v29;
  uint64_t v30 = __chkstk_darwin(v28);
  unint64_t v137 = (char *)&v118 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  os_log_type_t v132 = (char *)&v118 - v33;
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v118 - v34;
  static Signpost.signposter.getter();
  static OSSignpostID.exclusive.getter();
  uint64_t v36 = OSSignposter.logHandle.getter();
  os_signpost_type_t v37 = static os_signpost_type_t.begin.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    uint64_t v144 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    unint64_t v38 = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v144(v25, v27, v17);
    os_signpost_type_t v39 = v25;
    uint64_t v40 = v18;
    unint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v41 = 0;
    os_signpost_id_t v42 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, v37, v42, "TTS build synthesis workflow", "", v41, 2u);
    uint64_t v18 = v40;
    uint64_t v25 = v39;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v18 + 8))(v39, v17);
    unint64_t v43 = v144;
  }
  else
  {

    unint64_t v43 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    unint64_t v38 = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v144 = v43;
  unint64_t v128 = v38;
  v43(v25, v27, v17);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  BOOL v127 = v25;
  uint64_t v148 = OSSignpostIntervalState.init(id:isOpen:)();
  os_signpost_id_t v44 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v143 = v18 + 8;
  uint64_t v140 = v44;
  uint64_t v141 = v17;
  v44(v27, v17);
  uint64_t v45 = v150 + 8;
  unint64_t v46 = *(void (**)(char *, uint64_t))(v150 + 8);
  v46(v35, v149);
  uint64_t v47 = v145;
  uint64_t v48 = v145 + 56;
  uint64_t v134 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v145 + 56);
  v134(v152, 1, 1, v153);
  type metadata accessor for InternalSettings();
  uint64_t v49 = v151;
  uint64_t v50 = v146;
  dispatch thunk of ObjectPool.find<A>()();
  uint64_t v150 = v45;
  uint64_t v139 = v46;
  uint64_t v131 = v48;
  if (v50)
  {
    swift_errorRelease();
LABEL_9:
    type metadata accessor for InlineStreamingStorage();
    dispatch thunk of ObjectPool.find<A>()();
    type metadata accessor for SynthesisRequest();
    SynthesizingRequestProtocol.text.getter();
    uint64_t v52 = (void *)dispatch thunk of InlineStreamingStorage.findSignal(matchingText:)();
    swift_bridgeObjectRelease();

    if (v52)
    {
      unint64_t v53 = v135;
      uint64_t v54 = sub_1000157E0();
      uint64_t v55 = v152;
      sub_100013A98(v152, &qword_100039E78);
      uint64_t v56 = v53;
      uint64_t v57 = v153;
      (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v55, v56, v153);
      v134(v55, 0, 1, v57);
      sub_100015994(0, v125);
      id v58 = (void *)sub_10001BA30(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
      unint64_t v60 = v58[2];
      unint64_t v59 = v58[3];
      uint64_t v146 = v58;
      if (v60 >= v59 >> 1) {
        uint64_t v146 = (void *)sub_10001BA30(v59 > 1, v60 + 1, 1, (unint64_t)v146);
      }
      uint64_t v61 = v54;
      unint64_t v62 = v146;
      *((void *)v146 + 2) = v60 + 1;
      sub_100028F0C(v125, (uint64_t)v62+ ((*(unsigned __int8 *)(v126 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80))+ *(void *)(v126 + 72) * v60);
      swift_release();
    }
    else
    {
      swift_release();
      uint64_t v61 = 0;
      uint64_t v146 = &_swiftEmptyArrayStorage;
    }
    uint64_t v49 = v151;
    goto LABEL_18;
  }
  char v51 = dispatch thunk of InternalSettings.disableInlineStreamTTS.getter();
  if (v51 == 2 || (v51 & 1) == 0)
  {
    swift_release();
    goto LABEL_9;
  }
  static Logger.service.getter();
  unint64_t v63 = Logger.logObject.getter();
  os_log_type_t v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    unint64_t v65 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v65 = 0;
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "Disable inline streaming due to internal settings", v65, 2u);
    uint64_t v49 = v151;
    swift_slowDealloc();
  }

  swift_release();
  (*(void (**)(char *, uint64_t))(v119 + 8))(v122, v120);
  uint64_t v61 = 0;
  uint64_t v146 = &_swiftEmptyArrayStorage;
LABEL_18:
  uint64_t v66 = v153;
  uint64_t v67 = v142;
  sub_100013A34(v152, v142, &qword_100039E78);
  unint64_t v68 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
  unsigned int v69 = v68(v67, 1, v66);
  sub_100013A98(v67, &qword_100039E78);
  if (v69 != 1)
  {
    int v80 = 0;
    uint64_t v81 = v61;
LABEL_27:
    uint64_t v76 = v68;
    goto LABEL_28;
  }
  uint64_t v70 = v136;
  uint64_t v71 = sub_10001D868((uint64_t)v136, v49, (void (*)(void))&type metadata accessor for SynthesisRequest);
  if ((sub_10001DA64(v70, v71, v49, (void (*)(void))&type metadata accessor for SynthesisRequest) & 1) == 0)
  {
    uint64_t v82 = v135;
    uint64_t v83 = sub_1000151CC();
    swift_release();
    swift_release();
    uint64_t v84 = v152;
    sub_100013A98(v152, &qword_100039E78);
    (*(void (**)(uint64_t, char *, uint64_t))(v145 + 32))(v84, v82, v66);
    uint64_t v85 = v66;
    int v80 = 1;
    v134(v84, 0, 1, v85);
    uint64_t v81 = v83;
    goto LABEL_27;
  }
  unint64_t v72 = v135;
  uint64_t v142 = sub_100014FA4();
  swift_release();
  uint64_t v73 = v152;
  sub_100013A98(v152, &qword_100039E78);
  (*(void (**)(uint64_t, char *, uint64_t))(v145 + 32))(v73, v72, v66);
  v134(v73, 0, 1, v66);
  uint64_t v74 = v123;
  sub_100015994(0, v123);
  uint64_t v75 = v146;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v75 = (void *)sub_10001BA30(0, v75[2] + 1, 1, (unint64_t)v75);
  }
  uint64_t v76 = v68;
  unint64_t v78 = v75[2];
  unint64_t v77 = v75[3];
  if (v78 >= v77 >> 1) {
    uint64_t v75 = (void *)sub_10001BA30(v77 > 1, v78 + 1, 1, (unint64_t)v75);
  }
  v75[2] = v78 + 1;
  unint64_t v79 = (*(unsigned __int8 *)(v126 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80);
  uint64_t v146 = v75;
  sub_100028F0C(v74, (uint64_t)v75 + v79 + *(void *)(v126 + 72) * v78);
  swift_release();
  int v80 = 0;
  uint64_t v81 = v142;
LABEL_28:
  uint64_t v86 = type metadata accessor for AudioDumpAction();
  swift_allocObject();
  swift_retain();
  uint64_t v87 = AudioDumpAction.init(pool:)();
  uint64_t v155 = v86;
  uint64_t v156 = &protocol witness table for AudioDumpAction;
  uint64_t v154 = v87;
  type metadata accessor for WorkflowNode();
  swift_allocObject();
  uint64_t v88 = WorkflowNode.init(action:)();
  if (!v81)
  {
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v154 = v81;
  uint64_t v145 = v88;
  uint64_t v157 = v88;
  uint64_t v89 = v152;
  if (v76(v152, 1, v153) == 1)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  DirectedAcyclicGraph.connect(fromNode:toNode:)();
  if (v80)
  {
    uint64_t v90 = type metadata accessor for SynthesisCacheWritingAction();
    swift_allocObject();
    swift_retain();
    uint64_t v91 = SynthesisCacheWritingAction.init(pool:)();
    uint64_t v155 = v90;
    uint64_t v156 = &protocol witness table for SynthesisCacheWritingAction;
    uint64_t v154 = v91;
    swift_allocObject();
    uint64_t v92 = WorkflowNode.init(action:)();
    uint64_t v93 = type metadata accessor for OpusEncodingAction();
    swift_allocObject();
    swift_retain();
    uint64_t v94 = OpusEncodingAction.init(pool:)();
    uint64_t v155 = v93;
    uint64_t v156 = &protocol witness table for OpusEncodingAction;
    uint64_t v89 = v152;
    uint64_t v154 = v94;
    swift_allocObject();
    uint64_t v95 = WorkflowNode.init(action:)();
    uint64_t v154 = v81;
    uint64_t v157 = v95;
    uint64_t v96 = v153;
    if (v76(v89, 1, v153) == 1)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    DirectedAcyclicGraph.connect(fromNode:toNode:)();
    uint64_t v154 = v95;
    uint64_t v157 = v92;
    if (v76(v89, 1, v96) == 1)
    {
LABEL_46:
      swift_retain();
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    DirectedAcyclicGraph.connect(fromNode:toNode:)();
    swift_release();
    swift_release();
  }
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.find<A>()();
  uint64_t v97 = v147;
  uint64_t v98 = v153;
  sub_100013A34(v89, v147, &qword_100039E78);
  if (v76(v97, 1, v98) == 1)
  {
LABEL_44:
    swift_release();
    __break(1u);
    goto LABEL_45;
  }
  sub_100017BB4((uint64_t)v146);
  swift_bridgeObjectRelease();
  type metadata accessor for Workflow();
  swift_allocObject();
  uint64_t v153 = Workflow.init(graph:notification:errorHandlers:)();
  swift_release();
  swift_release();
  sub_100013A98(v89, &qword_100039E78);
  uint64_t v99 = v132;
  static Signpost.signposter.getter();
  uint64_t v100 = OSSignposter.logHandle.getter();
  uint64_t v101 = v133;
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v102 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    uint64_t v103 = v127;
    swift_retain();
    uint64_t v104 = v121;
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v105 = v129;
    uint64_t v106 = v130;
    os_signpost_type_t v107 = v102;
    if ((*(unsigned int (**)(char *, uint64_t))(v129 + 88))(v104, v130) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v108 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v105 + 8))(v104, v106);
      uint64_t v108 = "";
    }
    uint64_t v109 = v132;
    uint64_t v110 = v103;
    uint64_t v111 = v133;
    uint64_t v112 = v141;
    v144(v103, v133, v141);
    uint64_t v113 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v113 = 0;
    os_signpost_id_t v114 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v100, v107, v114, "TTS build synthesis workflow", v108, v113, 2u);
    swift_slowDealloc();

    uint64_t v115 = v111;
    v116 = v140;
    v140(v115, v112);
    v139(v109, v149);
    v116(v110, v112);
  }
  else
  {

    v140(v101, v141);
    v139(v99, v149);
  }
  swift_release();
  return v153;
}

uint64_t sub_100019098(void *a1, uint64_t a2)
{
  unint64_t v43 = a1;
  uint64_t v36 = sub_100006560(&qword_100039E10);
  uint64_t v41 = *(void *)(v36 - 8);
  uint64_t v3 = __chkstk_darwin(v36);
  uint64_t v40 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_signpost_id_t v44 = (char *)v35 - v5;
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  uint64_t v6 = type metadata accessor for RequestPreprocessAction();
  swift_allocObject();
  swift_retain();
  uint64_t v7 = RequestPreprocessAction.init(pool:)();
  uint64_t v46 = v6;
  uint64_t v47 = &protocol witness table for RequestPreprocessAction;
  uint64_t v45 = (void *)v7;
  swift_allocObject();
  uint64_t v8 = WorkflowNode.init(action:)();
  uint64_t v9 = type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  uint64_t v10 = RequestParsingAction.init(pool:)();
  uint64_t v46 = v9;
  uint64_t v47 = &protocol witness table for RequestParsingAction;
  uint64_t v45 = (void *)v10;
  swift_allocObject();
  uint64_t v11 = WorkflowNode.init(action:)();
  uint64_t v12 = type metadata accessor for VoiceSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v13 = VoiceSelectionAction.init(pool:)();
  uint64_t v46 = v12;
  uint64_t v47 = &protocol witness table for VoiceSelectionAction;
  uint64_t v45 = (void *)v13;
  swift_allocObject();
  uint64_t v14 = WorkflowNode.init(action:)();
  uint64_t v15 = type metadata accessor for SynthesisEngineSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v16 = SynthesisEngineSelectionAction.init(pool:)();
  uint64_t v46 = v15;
  uint64_t v47 = &protocol witness table for SynthesisEngineSelectionAction;
  uint64_t v45 = (void *)v16;
  swift_allocObject();
  uint64_t v17 = WorkflowNode.init(action:)();
  uint64_t v18 = type metadata accessor for SynthesisPrewarmAction();
  swift_allocObject();
  swift_retain();
  uint64_t v19 = SynthesisPrewarmAction.init(pool:)();
  uint64_t v46 = v18;
  uint64_t v47 = &protocol witness table for SynthesisPrewarmAction;
  uint64_t v45 = (void *)v19;
  swift_allocObject();
  uint64_t v20 = WorkflowNode.init(action:)();
  sub_100006560(&qword_100039E28);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10002F180;
  *(void *)(v21 + 32) = v8;
  *(void *)(v21 + 40) = v11;
  *(void *)(v21 + 48) = v14;
  *(void *)(v21 + 56) = v17;
  *(void *)(v21 + 64) = v20;
  uint64_t v45 = (void *)v21;
  specialized Array._endMutation()();
  v22._rawValue = v45;
  uint64_t v38 = v8;
  swift_retain();
  uint64_t v42 = v11;
  swift_retain();
  uint64_t v37 = v14;
  swift_retain();
  v35[1] = v17;
  swift_retain();
  swift_retain();
  uint64_t v23 = v36;
  DirectedAcyclicGraph.chain(nodes:)(v22);
  swift_bridgeObjectRelease();
  type metadata accessor for SynthesisRequest();
  uint64_t v24 = v43;
  SynthesizingRequestProtocol.privacySensitive.getter();
  SynthesizingRequestProtocol.privacySensitive.setter();
  uint64_t v25 = sub_10001D868((uint64_t)v24, a2, (void (*)(void))&type metadata accessor for SynthesisRequest);
  if (v25)
  {
    if (sub_10001DA64(v24, v25, a2, (void (*)(void))&type metadata accessor for SynthesisRequest))
    {
      uint64_t v26 = v23;
      uint64_t v27 = type metadata accessor for OspreyTTSPrewarmAction();
      swift_allocObject();
      swift_retain();
      uint64_t v28 = OspreyTTSPrewarmAction.init(pool:)();
      uint64_t v46 = v27;
      uint64_t v47 = &protocol witness table for OspreyTTSPrewarmAction;
      uint64_t v45 = (void *)v28;
      swift_allocObject();
      uint64_t v29 = WorkflowNode.init(action:)();
      uint64_t v45 = (void *)v42;
      uint64_t v48 = v29;
      DirectedAcyclicGraph.connect(fromNode:toNode:)();
      uint64_t v23 = v26;
      swift_release();
    }
    swift_release();
  }
  SynthesizingRequestProtocol.privacySensitive.setter();
  sub_100006524(0, &qword_100039E18);
  uint64_t v30 = v39;
  dispatch thunk of ObjectPool.find<A>()();
  if (v30) {
    swift_errorRelease();
  }
  uint64_t v31 = v41;
  uint64_t v32 = v44;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v40, v44, v23);
  type metadata accessor for Workflow();
  swift_allocObject();
  uint64_t v33 = Workflow.init(graph:notification:errorHandlers:)();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v23);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v33;
}

Swift::Bool __swiftcall DaemonXPCListener.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_1000057F0(shouldAcceptNewConnection.super.isa);
}

uint64_t sub_100019638()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v0;
    uint64_t v7 = (uint8_t *)v6;
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = Error.localizedDescription.getter();
    uint64_t v13 = sub_100007B04(v8, v9, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "XPC connection error from Daemon to Framework, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v12);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

void sub_10001986C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000198D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OspreyServerConfig();
  uint64_t v7 = (void *)swift_allocObject();
  type metadata accessor for CKKnowledgeStore();
  swift_bridgeObjectRetain();
  uint64_t v8 = dispatch thunk of static CKKnowledgeStore.userDefaultsKnowledgeStore()();
  v7[3] = a2;
  v7[4] = v8;
  void v7[2] = a1;
  uint64_t v9 = type metadata accessor for OspreyBuiltInConfig();
  swift_allocObject();
  uint64_t v10 = OspreyBuiltInConfig.init()();
  sub_100006560(&qword_100039EC0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10002F170;
  *(void *)(v11 + 56) = v6;
  uint64_t v12 = sub_100028E28((unint64_t *)&unk_100039EC8, (void (*)(uint64_t))type metadata accessor for OspreyServerConfig);
  *(void *)(v11 + 32) = v7;
  *(void *)(v11 + 96) = v9;
  *(void *)(v11 + 104) = &protocol witness table for OspreyBuiltInConfig;
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 72) = v10;
  uint64_t v13 = type metadata accessor for OspreyChainedConfigs();
  swift_allocObject();
  swift_retain();
  swift_retain();
  uint64_t v14 = OspreyChainedConfigs.init(configs:)();
  a3[3] = v13;
  a3[4] = (uint64_t)&protocol witness table for OspreyChainedConfigs;
  swift_release();
  uint64_t result = swift_release();
  *a3 = v14;
  return result;
}

void sub_100019A3C()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for DispatchTimeInterval();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v5 = (char **)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - v11;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  aBlock[4] = sub_100028EC8;
  void aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000068EC;
  aBlock[3] = &unk_100035CC8;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = v13;
  swift_release();
  [v26 pingWithReply:v15];
  _Block_release(v15);
  static DispatchTime.now()();
  *os_log_type_t v5 = 1;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchTimeInterval.seconds(_:), v2);
  + infix(_:_:)();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  OS_dispatch_semaphore.wait(timeout:)();
  v17(v12, v6);
  if (static DispatchTimeoutResult.== infix(_:_:)())
  {
  }
  else
  {
    uint64_t v18 = v23;
    static Logger.service.getter();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Unable to get reply from client in time.", v21, 2u);
      swift_slowDealloc();
      Swift::OpaquePointer v22 = v16;
    }
    else
    {
      Swift::OpaquePointer v22 = v19;
      uint64_t v19 = v16;
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v25);
  }
}

void sub_100019EA0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100019F1C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v70 = a2;
  uint64_t v71 = a3;
  uint64_t v74 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  os_log_type_t v64 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006560(&qword_100039E10);
  uint64_t v76 = *(void *)(v11 - 8);
  uint64_t v77 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v75 = (char *)&v64 - v15;
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  os_log_type_t v20 = a1;
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  unint64_t v72 = v10;
  uint64_t v73 = v6;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    id v69 = v4;
    uint64_t v66 = (void *)v25;
    unint64_t v68 = v14;
    *(_DWORD *)uint64_t v24 = 138543362;
    aBlock[0]._rawValue = v20;
    id v26 = v20;
    uint64_t v67 = v16;
    uint64_t v27 = v20;
    uint64_t v28 = v26;
    uint64_t v14 = v68;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v66 = v27;

    os_log_type_t v20 = v27;
    uint64_t v16 = v67;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Received #PreviewRequest %{public}@", v24, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v21 = v20;
  }

  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  type metadata accessor for ObjectPool();
  swift_allocObject();
  uint64_t v29 = ObjectPool.init()();
  id v30 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  aBlock[0]._rawValue = v30;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for InternalSettings();
  aBlock[0]._rawValue = (void *)static InternalSettings.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  uint64_t v31 = v75;
  DirectedAcyclicGraph.init()();
  sub_100006560(&qword_100039E28);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_10002F140;
  uint64_t v33 = type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  uint64_t v34 = (void *)RequestParsingAction.init(pool:)();
  unint64_t v79 = (void *)v33;
  int v80 = (uint64_t (*)())&protocol witness table for RequestParsingAction;
  aBlock[0]._rawValue = v34;
  swift_allocObject();
  *(void *)(v32 + 32) = WorkflowNode.init(action:)();
  uint64_t v35 = type metadata accessor for AudioPlaybackAction();
  swift_allocObject();
  swift_retain();
  uint64_t v67 = v29;
  uint64_t v36 = (void *)AudioPlaybackAction.init(pool:)();
  unint64_t v79 = (void *)v35;
  int v80 = (uint64_t (*)())&protocol witness table for AudioPlaybackAction;
  aBlock[0]._rawValue = v36;
  swift_allocObject();
  *(void *)(v32 + 40) = WorkflowNode.init(action:)();
  aBlock[0]._rawValue = (void *)v32;
  specialized Array._endMutation()();
  uint64_t v37 = v77;
  DirectedAcyclicGraph.chain(nodes:)(aBlock[0]);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v14, v31, v37);
  type metadata accessor for Workflow();
  swift_allocObject();
  id v38 = v30;
  id v69 = v30;
  uint64_t v39 = Workflow.init(graph:notification:errorHandlers:)();
  uint64_t v40 = type metadata accessor for DelegateHandler();
  swift_allocObject();
  uint64_t v41 = v20;
  id v42 = v38;
  swift_unknownObjectRetain();
  uint64_t v43 = DelegateHandler.init(notificationCenter:delegate:request:)();
  uint64_t v44 = type metadata accessor for AudioHandler();
  swift_allocObject();
  id v45 = v42;
  uint64_t v46 = AudioHandler.init(notificationCenter:)();
  uint64_t v47 = swift_allocObject();
  sub_100006560((uint64_t *)&unk_100039E30);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10002F170;
  *(void *)(v48 + 32) = v43;
  *(void *)(v48 + 88) = v44;
  *(void *)(v48 + 56) = v40;
  *(void *)(v48 + 64) = v46;
  *(void *)(v47 + 16) = v48;
  id v49 = objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  swift_retain_n();
  v41;
  id v65 = v45;
  swift_unknownObjectRetain();
  uint64_t v66 = (void *)v43;
  swift_retain();
  swift_retain();
  unint64_t v68 = (char *)v39;
  uint64_t v50 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  char v51 = (void *)swift_allocObject();
  uint64_t v52 = v71;
  v51[2] = v70;
  v51[3] = v52;
  v51[4] = v50;
  v51[5] = v47;
  int v80 = sub_10001F4A0;
  uint64_t v81 = v51;
  aBlock[0]._rawValue = _NSConcreteStackBlock;
  aBlock[1]._rawValue = (void *)1107296256;
  aBlock[2]._rawValue = sub_1000068EC;
  unint64_t v79 = &unk_100035A98;
  unint64_t v53 = _Block_copy(aBlock);
  id v54 = v50;
  swift_retain();
  swift_retain();
  sub_10001F4C0((uint64_t)sub_10001F4A0);
  swift_release();
  [v54 setCompletionBlock:v53];
  _Block_release(v53);

  swift_release();
  uint64_t v55 = (uint64_t)v72;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v57 = v73;
  uint64_t v56 = v74;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v55, 1, v74))
  {
    sub_100013A98(v55, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    uint64_t v59 = qword_10003A0C8;
    uint64_t v58 = unk_10003A0D0;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v60 = v55;
    uint64_t v61 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v64, v60, v56);
    sub_100013A98(v60, &qword_100039BC0);
    uint64_t v59 = UUID.uuidString.getter();
    uint64_t v58 = v62;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v61, v56);
  }
  sub_10000B864(v59, v58);
  swift_bridgeObjectRelease();
  sub_100008A28(v54);
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  swift_release();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v77);
  return swift_release();
}

uint64_t sub_10001A8A0(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)dispatch thunk of TaskOperation.error.getter();
  a1();

  swift_beginAccess();
  *(void *)(a4 + 16) = &_swiftEmptyArrayStorage;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001A9C8(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = (NSString *)static NSNotificationName.taskCompletion.getter();
  NSNotificationCenter.post(event:)(v8);

  sub_100019A3C();
  uint64_t v9 = (void *)dispatch thunk of TaskOperation.error.getter();
  a3();

  swift_beginAccess();
  *(void *)(a6 + 16) = &_swiftEmptyArrayStorage;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001AA9C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (void *)(a7 + 16);
  if (a1) {
    [a1 updateState:0];
  }
  uint64_t v11 = (NSString *)static NSNotificationName.taskCompletion.getter();
  NSNotificationCenter.post(event:)(v11);

  sub_100019A3C();
  uint64_t v12 = (void *)dispatch thunk of TaskOperation.error.getter();
  a4();

  swift_beginAccess();
  *uint64_t v10 = &_swiftEmptyArrayStorage;
  uint64_t result = swift_bridgeObjectRelease();
  if ((a9 & 1) == 0) {
    return sandbox_extension_release();
  }
  return result;
}

uint64_t sub_10001ABF4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = (NSString *)static NSNotificationName.taskCompletion.getter();
  NSNotificationCenter.post(event:)(v11);

  sub_100019A3C();
  uint64_t v12 = (void *)dispatch thunk of TaskOperation.error.getter();
  a3();

  swift_beginAccess();
  *(void *)(a6 + 16) = &_swiftEmptyArrayStorage;
  uint64_t result = swift_bridgeObjectRelease();
  if ((a8 & 1) == 0) {
    return sandbox_extension_release();
  }
  return result;
}

void sub_10001ACFC(uint64_t a1, uint64_t a2, double a3)
{
  if (a1) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, double))(a2 + 16))(a2, a3);
}

uint64_t sub_10001AD70(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_beginAccess();
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001ADD0(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  [a1 removeObserver:a2];
  swift_beginAccess();
  uint64_t v11 = *(void *)(a5 + 16);
  uint64_t v10 = *(void *)(a5 + 24);
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)dispatch thunk of TaskOperation.error.getter();
  a3(v11, v10, v12);
  swift_bridgeObjectRelease();

  swift_beginAccess();
  *(void *)(a7 + 16) = &_swiftEmptyArrayStorage;
  return swift_bridgeObjectRelease();
}

void sub_10001AEC4(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

void sub_10001AF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    NSString v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, NSString))(a4 + 16))(a4, v6);
}

void sub_10001B29C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SynthesisVoiceSubscription();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

uint64_t sub_10001B368(void *a1, uint64_t a2, uint64_t a3, const void *a4, void (*a5)(char *, void *))
{
  uint64_t v9 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  id v15 = a1;
  a5(v11, v12);
  _Block_release(v12);
  _Block_release(v12);

  return sub_100013A98((uint64_t)v11, &qword_100039BC0);
}

void sub_10001B644(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, void *))
{
  id v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v8);
  _Block_release(v8);
  _Block_release(v8);
}

id sub_10001B770()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DaemonXPCHandler(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001B7A8@<X0>(void *a1@<X8>)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for DaemonXPCHandler(0));
  id v3 = sub_10001F1C4();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

char *sub_10001B7FC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006560(&qword_100039F08);
      id v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
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
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10001E838(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10001B920(void *result, int64_t a2, char a3, void *a4)
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
      sub_100006560(&qword_100039EF8);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = &_swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage + 4;
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
    sub_10001E930(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001BA30(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006560(&qword_100039E80);
  uint64_t v10 = *(void *)(type metadata accessor for WorkflowFactory.TTSErrorHandler(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for WorkflowFactory.TTSErrorHandler(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001EB30(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_10001BC98(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006560((uint64_t *)&unk_100039E30);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001F9CC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001BDA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001BDE8(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_10001BDC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001BF54(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_10001BDE8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006560(&qword_100039EF8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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

uint64_t sub_10001BF54(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006560(&qword_100039E98);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_100006560(&qword_100039EA0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001C0F8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
      size_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *id v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10001C9B0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *id v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10001C2A8(Swift::Int *a1, Swift::Int a2)
{
  id v3 = v2;
  uint64_t v6 = *v2;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  Swift::UInt v7 = SynthesisVoice.VoiceType.rawValue.getter();
  Hasher._combine(_:)(v7);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *id v3 = 0x8000000000000000;
    sub_10001CB4C(a2, v10, isUniquelyReferenced_nonNull_native);
    *id v3 = v16;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v11 = SynthesisVoice.VoiceType.rawValue.getter();
  if (v11 != SynthesisVoice.VoiceType.rawValue.getter())
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v13 = SynthesisVoice.VoiceType.rawValue.getter();
    }
    while (v13 != SynthesisVoice.VoiceType.rawValue.getter());
  }
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v3 + 48) + 8 * v10);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_10001C410()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006560(&qword_100039F00);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_10001C6F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006560((uint64_t *)&unk_100039E50);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      Hasher.init(_seed:)();
      Swift::UInt v20 = SynthesisVoice.VoiceType.rawValue.getter();
      Hasher._combine(_:)(v20);
      uint64_t result = Hasher._finalize()();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_10001C9B0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_10001C410();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10001CCCC();
      goto LABEL_22;
    }
    sub_10001D018();
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
    unint64_t v15 = (void *)(v14 + 16 * a3);
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
        int64_t v18 = (void *)(v14 + 16 * a3);
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
  Swift::Int *v21 = v8;
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

Swift::Int sub_10001CB4C(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10001C6F0();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_10001CE80();
      goto LABEL_14;
    }
    sub_10001D2C8();
  }
  uint64_t v9 = *v3;
  Hasher.init(_seed:)();
  Swift::UInt v10 = SynthesisVoice.VoiceType.rawValue.getter();
  Hasher._combine(_:)(v10);
  uint64_t result = Hasher._finalize()();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v12 = SynthesisVoice.VoiceType.rawValue.getter();
    uint64_t result = SynthesisVoice.VoiceType.rawValue.getter();
    if (v12 == result)
    {
LABEL_13:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        uint64_t v14 = SynthesisVoice.VoiceType.rawValue.getter();
        uint64_t result = SynthesisVoice.VoiceType.rawValue.getter();
        if (v14 == result) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v15 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v15 + 48) + 8 * a2) = v6;
  uint64_t v16 = *(void *)(v15 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    *(void *)(v15 + 16) = v18;
  }
  return result;
}

void *sub_10001CCCC()
{
  uint64_t v1 = v0;
  sub_100006560(&qword_100039F00);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    BOOL v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10001CE80()
{
  uint64_t v1 = v0;
  sub_100006560((uint64_t *)&unk_100039E50);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10001D018()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006560(&qword_100039F00);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10001D2C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006560((uint64_t *)&unk_100039E50);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    Hasher.init(_seed:)();
    Swift::UInt v20 = SynthesisVoice.VoiceType.rawValue.getter();
    Hasher._combine(_:)(v20);
    uint64_t result = Hasher._finalize()();
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t (*sub_10001D554(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001D6D8(v6, a2, a3);
  return sub_10001D5BC;
}

uint64_t (*sub_10001D5C0(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001D760(v6, a2, a3);
  return sub_10001D5BC;
}

uint64_t (*sub_10001D628(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001D7E0(v6, a2, a3);
  return sub_10001D5BC;
}

void sub_10001D690(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10001D6D8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_10001D758;
  }
  __break(1u);
  return result;
}

void sub_10001D758(id *a1)
{
}

void (*sub_10001D760(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1000299C0;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_10001D7E0(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_10001D860;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001D860()
{
  return swift_release();
}

uint64_t sub_10001D868(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  type metadata accessor for RequestPreprocessAction();
  dispatch thunk of static RequestPreprocessAction.processLanguage(for:)();
  type metadata accessor for VoiceSelectionAction();
  dispatch thunk of ObjectPool.find<A>()();
  a3(0);
  uint64_t v4 = (void *)SynthesizingRequestProtocol.voice.getter();
  SynthesizingRequestProtocol.disableCompactVoice.getter();
  dispatch thunk of BaseRequest.requestCreatedTime.getter();
  uint64_t v5 = dispatch thunk of VoiceSelectionAction.selectVoiceAsset(_:disableCompactVoice:requestId:)();

  swift_retain();
  uint64_t v6 = (void *)VoiceAsset.voice.getter();
  swift_release();
  uint64_t v7 = (void *)SynthesizingRequestProtocol.voice.getter();
  dispatch thunk of SynthesisVoice.name.getter();
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_release();
  }
  else if (v6)
  {
    id v10 = v6;
    dispatch thunk of SynthesisVoice.footprint.getter();
    uint64_t v11 = SynthesisVoice.Footprint.rawValue.getter();
    if (v11 == SynthesisVoice.Footprint.rawValue.getter()
      || (dispatch thunk of SynthesisVoice.footprint.getter(),
          uint64_t v12 = SynthesisVoice.Footprint.rawValue.getter(),
          v12 == SynthesisVoice.Footprint.rawValue.getter()))
    {
      unint64_t v13 = (void *)SynthesizingRequestProtocol.voice.getter();
      dispatch thunk of SynthesisVoice.name.getter();
      dispatch thunk of SynthesisVoice.name.setter();
    }
    swift_release();
  }
  else
  {
    swift_release();
  }
  return v5;
}

uint64_t sub_10001DA64(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v107 = a2;
  uint64_t v108 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v108 - 8);
  uint64_t v7 = __chkstk_darwin(v108);
  uint64_t v9 = (char *)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  os_signpost_type_t v102 = (char *)&v98 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v101 = (char *)&v98 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v99 = (char *)&v98 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v100 = (char *)&v98 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v106 = (char *)&v98 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v104 = (char *)&v98 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v103 = (char *)&v98 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  BOOL v26 = (char *)&v98 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  int64_t v29 = (char *)&v98 - v28;
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v98 - v30;
  uint64_t v105 = type metadata accessor for InternalSettings();
  dispatch thunk of ObjectPool.find<A>()();
  uint64_t v98 = v6;
  char v44 = dispatch thunk of InternalSettings.disableServerTTS.getter();
  if (v44)
  {
    static Logger.service.getter();
    uint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v47, v48))
    {
      id v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Disable Osprey since internal settings set disableServerTTS", v49, 2u);
      swift_slowDealloc();
    }

    swift_release();
    (*(void (**)(char *, uint64_t))(v98 + 8))(v31, v108);
    return 0;
  }
  char v45 = dispatch thunk of InternalSettings.forceServerTTS.getter();
  if (v45 == 2 || (v45 & 1) == 0)
  {
    swift_release();
    uint64_t v46 = v98;
    a4(0);
    if (SynthesizingRequestProtocol.forceOspreyTTS.getter())
    {
      static Logger.service.getter();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Prefer Osprey since request set forceOspreyTTS", v34, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v46 + 8))(v26, v108);
      return 1;
    }
    uint64_t v36 = (void *)SynthesizingRequestProtocol.voice.getter();
    dispatch thunk of SynthesisVoice.name.getter();
    uint64_t v38 = v37;

    swift_bridgeObjectRelease();
    if (!v38)
    {
      uint64_t v39 = (void *)SynthesizingRequestProtocol.voice.getter();
      dispatch thunk of SynthesisVoice.gender.getter();

      uint64_t v40 = SynthesisVoice.VoiceGender.rawValue.getter();
      if (v40 == SynthesisVoice.VoiceGender.rawValue.getter())
      {
        static Logger.service.getter();
        uint64_t v41 = Logger.logObject.getter();
        os_log_type_t v42 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "Disable Osprey since unspecific voice parameter", v43, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v108);
        return 0;
      }
    }
    if (SynthesizingRequestProtocol.privacySensitive.getter()) {
      return 0;
    }
    sub_100006560(&qword_100039E60);
    dispatch thunk of ObjectPool.find<A>()();
    sub_100013784(&v110, (uint64_t)v111);
    sub_100029094(v111, v112);
    uint64_t v50 = dispatch thunk of OspreyConfigProviding.allowedAppIdentifiers.getter();
    if (v50
      && (char v51 = (void *)v50,
          uint64_t v52 = dispatch thunk of BaseRequest.clientBundleId.getter(),
          char v54 = sub_10001466C(v52, v53, v51),
          swift_bridgeObjectRelease(),
          swift_bridgeObjectRelease(),
          (v54 & 1) == 0))
    {
      uint64_t v81 = v103;
      static Logger.service.getter();
      id v82 = a1;
      uint64_t v83 = Logger.logObject.getter();
      os_log_type_t v84 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v83, v84))
      {
        uint64_t v85 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v110 = swift_slowAlloc();
        *(_DWORD *)uint64_t v85 = 136446210;
        uint64_t v86 = dispatch thunk of BaseRequest.clientBundleId.getter();
        uint64_t v109 = sub_100007B04(v86, v87, (uint64_t *)&v110);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v83, v84, "Client %{public}s is not allowed to use Osprey", v85, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v46 + 8))(v81, v108);
    }
    else
    {
      sub_100008224((uint64_t)v111);
      type metadata accessor for PreinstalledAudioStorage();
      dispatch thunk of ObjectPool.find<A>()();
      uint64_t v66 = (void *)dispatch thunk of PreinstalledAudioStorage.find(request:)();

      if (v66)
      {
        uint64_t v67 = v104;
        static Logger.service.getter();
        unint64_t v68 = Logger.logObject.getter();
        os_log_type_t v69 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v68, v69))
        {
LABEL_40:

          swift_release();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v67, v108);
          return 0;
        }
        uint64_t v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v70 = 0;
        uint64_t v71 = "Disable Osprey since preinstalled audio is found";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v68, v69, v71, v70, 2u);
        swift_slowDealloc();
        goto LABEL_40;
      }
      swift_release();
      if (SynthesizingRequestProtocol.minimizeDeviceUsage.getter())
      {
        uint64_t v55 = v106;
        static Logger.service.getter();
        uint64_t v56 = Logger.logObject.getter();
        os_log_type_t v57 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v58 = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, v57, "Prefer Osprey since request set minimizeDeviceUsage", v58, 2u);
          swift_slowDealloc();
        }

LABEL_28:
        (*(void (**)(char *, uint64_t))(v46 + 8))(v55, v108);
        return 1;
      }
      dispatch thunk of ObjectPool.find<A>()();
      char v79 = dispatch thunk of InternalSettings.ignorePowerAndThermalState.getter();
      uint64_t v80 = v107;
      if (v79 != 2 && (v79 & 1) != 0)
      {
        uint64_t v67 = v100;
        static Logger.service.getter();
        unint64_t v68 = Logger.logObject.getter();
        os_log_type_t v69 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v68, v69)) {
          goto LABEL_40;
        }
        uint64_t v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v70 = 0;
        uint64_t v71 = "Prefer device synthesis, ignoring thermal condition";
        goto LABEL_39;
      }
      swift_release();
      if (!v80) {
        return 1;
      }
      swift_retain();
      uint64_t v59 = (void *)VoiceAsset.voice.getter();
      dispatch thunk of SynthesisVoice.type.getter();

      uint64_t v60 = SynthesisVoice.VoiceType.rawValue.getter();
      if (v60 == SynthesisVoice.VoiceType.rawValue.getter())
      {
        type metadata accessor for NeuralUtils();
        if (static NeuralUtils.isH12Platform.getter())
        {
          id v61 = [self processInfo];
          id v62 = [v61 thermalState];

          if (v62 == (id)3)
          {
            uint64_t v55 = v99;
            static Logger.service.getter();
            unint64_t v63 = Logger.logObject.getter();
            os_log_type_t v64 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v63, v64))
            {
              id v65 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v65 = 0;
              _os_log_impl((void *)&_mh_execute_header, v63, v64, "Prefer Osprey due thermal critical on H12 platform", v65, 2u);
              swift_slowDealloc();
            }

            swift_release();
            goto LABEL_28;
          }
        }
      }
      swift_release();
      swift_retain();
      uint64_t v75 = (void *)VoiceAsset.voice.getter();
      dispatch thunk of SynthesisVoice.type.getter();

      uint64_t v76 = SynthesisVoice.VoiceType.rawValue.getter();
      if (v76 != SynthesisVoice.VoiceType.rawValue.getter())
      {
        uint64_t v77 = (void *)VoiceAsset.voice.getter();
        dispatch thunk of SynthesisVoice.type.getter();

        uint64_t v78 = SynthesisVoice.VoiceType.rawValue.getter();
        if (v78 != SynthesisVoice.VoiceType.rawValue.getter())
        {
          swift_release();
          return 1;
        }
      }
      sub_100006560(&qword_100039EB0);
      dispatch thunk of ObjectPool.find<A>()();
      sub_100013784(&v110, (uint64_t)v111);
      sub_100029094(v111, v112);
      VoiceAsset.path.getter();
      dispatch thunk of NeuralVoiceUtilities.currentSampleRate(voicePath:)();
      float v89 = v88;
      swift_bridgeObjectRelease();
      if (v89 < 16000.0)
      {
        uint64_t v90 = v102;
        static Logger.service.getter();
        uint64_t v91 = Logger.logObject.getter();
        os_log_type_t v92 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v93 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v93 = 134217984;
          *(double *)&long long v110 = v89;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "Prefer osprey synthesis due to low neural voice sampling rate: %f", v93, 0xCu);
          swift_slowDealloc();
        }

        swift_release();
        (*(void (**)(char *, uint64_t))(v46 + 8))(v90, v108);
        sub_100008224((uint64_t)v111);
        return 1;
      }
      uint64_t v94 = v101;
      static Logger.service.getter();
      uint64_t v95 = Logger.logObject.getter();
      os_log_type_t v96 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v95, v96))
      {
        uint64_t v97 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v97 = 134217984;
        *(double *)&long long v110 = v89;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v95, v96, "Prefer device synthesis due to high neural voice sampling rate: %f", v97, 0xCu);
        swift_slowDealloc();
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v94, v108);
    }
    sub_100008224((uint64_t)v111);
    return 0;
  }
  static Logger.service.getter();
  unint64_t v72 = Logger.logObject.getter();
  os_log_type_t v73 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v72, v73))
  {
    uint64_t v74 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v74 = 0;
    _os_log_impl((void *)&_mh_execute_header, v72, v73, "Prefer Osprey since internal settings set forceServerTTS", v74, 2u);
    swift_slowDealloc();
  }

  swift_release();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v29, v108);
  return 1;
}

uint64_t sub_10001E838(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001E930(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10001EA24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10001C0F8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10001EABC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_100028BF0();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 32);
    do
    {
      Swift::Int v5 = *v4++;
      sub_10001C2A8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_10001EB30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for WorkflowFactory.TTSErrorHandler(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001EC88()
{
  uint64_t v27 = sub_100006560(&qword_100039E10);
  uint64_t v29 = *(void *)(v27 - 8);
  uint64_t v0 = __chkstk_darwin(v27);
  uint64_t v36 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v26 - v2;
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  uint64_t v4 = type metadata accessor for RequestPreprocessAction();
  swift_allocObject();
  swift_retain();
  uint64_t v5 = RequestPreprocessAction.init(pool:)();
  uint64_t v34 = v4;
  uint64_t v35 = &protocol witness table for RequestPreprocessAction;
  os_log_type_t v33 = (void *)v5;
  swift_allocObject();
  uint64_t v6 = WorkflowNode.init(action:)();
  uint64_t v7 = type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  uint64_t v8 = RequestParsingAction.init(pool:)();
  uint64_t v34 = v7;
  uint64_t v35 = &protocol witness table for RequestParsingAction;
  os_log_type_t v33 = (void *)v8;
  swift_allocObject();
  uint64_t v9 = WorkflowNode.init(action:)();
  uint64_t v10 = type metadata accessor for VoiceSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v11 = VoiceSelectionAction.init(pool:)();
  uint64_t v34 = v10;
  uint64_t v35 = &protocol witness table for VoiceSelectionAction;
  os_log_type_t v33 = (void *)v11;
  swift_allocObject();
  uint64_t v12 = WorkflowNode.init(action:)();
  uint64_t v13 = type metadata accessor for SynthesisEngineSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v14 = SynthesisEngineSelectionAction.init(pool:)();
  uint64_t v34 = v13;
  uint64_t v35 = &protocol witness table for SynthesisEngineSelectionAction;
  os_log_type_t v33 = (void *)v14;
  swift_allocObject();
  uint64_t v15 = WorkflowNode.init(action:)();
  uint64_t v16 = type metadata accessor for DeviceSynthesisAction();
  swift_allocObject();
  swift_retain();
  uint64_t v17 = DeviceSynthesisAction.init(pool:)();
  uint64_t v34 = v16;
  uint64_t v35 = &protocol witness table for DeviceSynthesisAction;
  os_log_type_t v33 = (void *)v17;
  swift_allocObject();
  uint64_t v18 = WorkflowNode.init(action:)();
  sub_100006560(&qword_100039E28);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10002F180;
  *(void *)(v19 + 32) = v6;
  *(void *)(v19 + 40) = v9;
  *(void *)(v19 + 48) = v12;
  *(void *)(v19 + 56) = v15;
  *(void *)(v19 + 64) = v18;
  os_log_type_t v33 = (void *)v19;
  specialized Array._endMutation()();
  v20._rawValue = v33;
  uint64_t v31 = v6;
  swift_retain();
  uint64_t v30 = v9;
  swift_retain();
  uint64_t v28 = v12;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v21 = v27;
  DirectedAcyclicGraph.chain(nodes:)(v20);
  swift_bridgeObjectRelease();
  sub_100006524(0, &qword_100039E18);
  uint64_t v22 = v32;
  dispatch thunk of ObjectPool.find<A>()();
  if (v22) {
    swift_errorRelease();
  }
  uint64_t v23 = v29;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v36, v3, v21);
  type metadata accessor for Workflow();
  swift_allocObject();
  uint64_t v24 = Workflow.init(graph:notification:errorHandlers:)();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v21);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v24;
}

uint64_t sub_10001F104()
{
  return type metadata accessor for DaemonXPCHandler(0);
}

uint64_t sub_10001F10C()
{
  uint64_t result = type metadata accessor for Entitlements();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10001F1C4()
{
  uint64_t v1 = type metadata accessor for Entitlements();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession] = 0;
  uint64_t v5 = v0;
  sub_100006560((uint64_t *)&unk_100039E00);
  dispatch thunk of ObjectPool.find<A>()();
  *(void *)&v5[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate] = v9;
  type metadata accessor for Preferences();
  dispatch thunk of ObjectPool.find<A>()();
  *(void *)&v5[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_preferences] = v9;
  dispatch thunk of ObjectPool.find<A>()();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v5[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_entitlements], v4, v1);
  type metadata accessor for TrialAssetProvider();
  dispatch thunk of ObjectPool.find<A>()();
  *(void *)&v5[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_trialAssetProvider] = v9;
  type metadata accessor for SubscriptionService();
  dispatch thunk of ObjectPool.find<A>()();
  *(void *)&v5[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_subscriptionService] = v9;

  uint64_t v6 = (objc_class *)type metadata accessor for DaemonXPCHandler(0);
  v8.receiver = v5;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t sub_10001F464()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F4A0()
{
  return sub_10001A8A0(*(void (**)(void))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_10001F4C0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void (*sub_10001F4D0(char a1, char *a2, uint64_t a3))(NSObject **, void)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v39 - v11;
  uint64_t v13 = OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession;
  uint64_t v14 = *(void *)&a2[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession];
  if ((a1 & 1) == 0)
  {
    if (v14)
    {
      uint64_t v26 = type metadata accessor for EngineCachingService();
      static EngineCachingService.shared.getter();
      uint64_t result = (void (*)(NSObject **, void))dispatch thunk of EngineCachingService.activeSessionCount.modify();
      uint64_t v28 = *v27 - 1;
      if (!__OFSUB__(*v27, 1))
      {
        uint64_t v42 = v26;
        *uint64_t v27 = v28;
        result(&v46, 0);
        swift_release();
        static Logger.service.getter();
        uint64_t v29 = a2;
        uint64_t v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.default.getter();
        int v32 = v31;
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v33 = swift_slowAlloc();
          uint64_t v45 = v6;
          uint64_t v34 = v33;
          uint64_t v35 = (void *)swift_slowAlloc();
          uint64_t v41 = v35;
          *(_DWORD *)uint64_t v34 = 138412546;
          uint64_t v43 = a3;
          uint64_t v44 = v7;
          uint64_t v46 = v29;
          v39[0] = v34 + 4;
          v39[1] = &v47;
          uint64_t v36 = v29;
          int v40 = v32;
          uint64_t v37 = v36;
          a3 = v43;
          uint64_t v7 = v44;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v35 = v29;

          *(_WORD *)(v34 + 12) = 2048;
          static EngineCachingService.shared.getter();
          uint64_t v38 = dispatch thunk of EngineCachingService.activeSessionCount.getter();
          swift_release();
          uint64_t v46 = v38;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v40, "DaemonXPCHandler %@ sets inactive, total active session count: %ld", (uint8_t *)v34, 0x16u);
          sub_100006560(&qword_1000397B8);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v6 = v45;
          swift_slowDealloc();
        }
        else
        {

          uint64_t v30 = v29;
        }

        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        *(void *)&a2[v13] = 0;
        swift_unknownObjectRelease();
        return (void (*)(NSObject **, void))(*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
      }
      __break(1u);
      goto LABEL_16;
    }
    return (void (*)(NSObject **, void))(*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
  }
  if (v14) {
    return (void (*)(NSObject **, void))(*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
  }
  uint64_t v44 = v7;
  uint64_t v45 = v6;
  *(void *)&a2[v13] = os_transaction_create();
  swift_unknownObjectRelease();
  uint64_t v15 = type metadata accessor for EngineCachingService();
  static EngineCachingService.shared.getter();
  uint64_t result = (void (*)(NSObject **, void))dispatch thunk of EngineCachingService.activeSessionCount.modify();
  if (!__OFADD__(*v17, 1))
  {
    ++*v17;
    result(&v46, 0);
    swift_release();
    static Logger.service.getter();
    uint64_t v18 = a2;
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v43 = a3;
      uint64_t v22 = v21;
      uint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412546;
      uint64_t v42 = v15;
      uint64_t v46 = v18;
      uint64_t v24 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v23 = v18;

      *(_WORD *)(v22 + 12) = 2048;
      static EngineCachingService.shared.getter();
      uint64_t v25 = dispatch thunk of EngineCachingService.activeSessionCount.getter();
      swift_release();
      uint64_t v46 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "DaemonXPCHandler %@ sets active, total active session count: %ld", (uint8_t *)v22, 0x16u);
      sub_100006560(&qword_1000397B8);
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v43;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v19 = v18;
    }

    (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v45);
    return (void (*)(NSObject **, void))(*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_10001F9CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
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
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001FAC4(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v62 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v9 - 8);
  os_log_type_t v69 = (char *)v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  unint64_t v68 = *(void (***)(char *, void, uint64_t))(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v67 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v65);
  uint64_t v66 = (char *)v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v13 - 8);
  unint64_t v63 = (char *)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = *(void (***)(void, void))(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = swift_allocObject();
  *(void *)(v72 + 16) = a3;
  _Block_copy(a3);
  static Logger.service.getter();
  id v19 = a1;
  os_log_type_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v70 = v7;
  uint64_t v71 = v6;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v61 = a2;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v58 = swift_slowAlloc();
    *(void *)&long long aBlock = v58;
    uint64_t v60 = v16;
    *(_DWORD *)uint64_t v24 = 136446210;
    v57[1] = v24 + 4;
    id v25 = [v19 description];
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v59 = v15;
    uint64_t v27 = v26;
    unint64_t v29 = v28;

    uint64_t v73 = sub_100007B04(v27, v29, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Received #PrewarmRequest %{public}s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (**)(char *, uint64_t))v60)[1](v18, v59);
  }
  else
  {

    ((void (**)(char *, uint64_t))v16)[1](v18, v15);
  }
  type metadata accessor for ObjectPool();
  swift_allocObject();
  uint64_t v30 = ObjectPool.init()();
  type metadata accessor for Entitlements();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for InternalSettings();
  *(void *)&long long aBlock = static InternalSettings.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for TrialAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = TrialAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for LocalAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = LocalAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for VocalizerCustomVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = VocalizerCustomVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for PreinstalledVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = PreinstalledVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for BuiltInVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = BuiltInVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for OspreyClient();
  *(void *)&long long aBlock = static OspreyClient.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for OspreyChainedConfigs();
  uint64_t v31 = dispatch thunk of BaseRequest.clientBundleId.getter();
  sub_1000198D4(v31, v32, (uint64_t *)&aBlock);
  swift_bridgeObjectRelease();
  sub_100006560(&qword_100039E60);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  sub_100008224((uint64_t)&aBlock);
  type metadata accessor for EngineCachingService();
  *(void *)&long long aBlock = static EngineCachingService.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  id v33 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  *(void *)&long long aBlock = v33;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_retain();
  uint64_t v34 = sub_100019098(v19, v30);
  swift_release();
  uint64_t v60 = (void (**)(void, void))v19;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v61 = v34;
  swift_retain();
  uint64_t v36 = os_transaction_create();
  if (v36)
  {
    uint64_t v37 = v36;
    ObjectType = (void *)swift_getObjectType();
    *(void *)&long long aBlock = v37;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v35 + 16) = &_swiftEmptyArrayStorage;
    uint64_t v39 = (char *)&_swiftEmptyArrayStorage;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v39 = sub_10001BC98(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1, (char *)&_swiftEmptyArrayStorage);
      *(void *)(v35 + 16) = v39;
    }
    unint64_t v41 = *((void *)v39 + 2);
    unint64_t v40 = *((void *)v39 + 3);
    if (v41 >= v40 >> 1)
    {
      uint64_t v39 = sub_10001BC98((char *)(v40 > 1), v41 + 1, 1, v39);
      *(void *)(v35 + 16) = v39;
    }
    *((void *)v39 + 2) = v41 + 1;
    sub_10000BC54(&aBlock, &v39[32 * v41 + 32]);
    swift_unknownObjectRelease();
  }
  sub_100006524(0, (unint64_t *)&qword_100039750);
  static DispatchQoS.unspecified.getter();
  *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
  sub_100028E28((unint64_t *)&qword_100039EE0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100006560((uint64_t *)&unk_10003A080);
  sub_100008534();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v68[13](v67, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v64);
  uint64_t v42 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  uint64_t v43 = v60;
  swift_unknownObjectRetain();
  unint64_t v68 = (void (**)(char *, void, uint64_t))v33;
  uint64_t v67 = v42;
  uint64_t v44 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  uint64_t v45 = (void *)swift_allocObject();
  uint64_t v46 = v72;
  v45[2] = sub_100029968;
  v45[3] = v46;
  v45[4] = v44;
  v45[5] = v35;
  uint64_t v77 = sub_100029964;
  uint64_t v78 = v45;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v75 = sub_1000068EC;
  ObjectType = &unk_100035E58;
  uint64_t v47 = _Block_copy(&aBlock);
  id v48 = v44;
  swift_retain();
  swift_retain();
  sub_10001F4C0((uint64_t)sub_100029964);
  swift_release();
  [v48 setCompletionBlock:v47];
  _Block_release(v47);

  swift_release();
  uint64_t v49 = (uint64_t)v69;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v51 = v70;
  uint64_t v50 = v71;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v49, 1, v71))
  {
    sub_100013A98(v49, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    sub_10000B864(qword_10003A0C8, unk_10003A0D0);
  }
  else
  {
    uint64_t v52 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v62, v49, v50);
    sub_100013A98(v49, &qword_100039BC0);
    uint64_t v53 = UUID.uuidString.getter();
    uint64_t v55 = v54;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v50);
    sub_10000B864(v53, v55);
    swift_bridgeObjectRelease();
  }
  sub_100008A28(v48);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1000206DC(void *a1, char *a2, const void *a3)
{
  uint64_t v160 = a2;
  id v147 = a1;
  uint64_t v142 = type metadata accessor for OSSignpostError();
  uint64_t v141 = *(void *)(v142 - 8);
  uint64_t v4 = __chkstk_darwin(v142);
  uint64_t v134 = (char *)&v128 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v133 = (char *)&v128 - v6;
  uint64_t v137 = type metadata accessor for UUID();
  uint64_t v136 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  os_log_type_t v132 = (char *)&v128 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v8 - 8);
  v135 = (char *)&v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_100006560(&qword_100039E10);
  uint64_t v157 = *(void *)(v158 - 8);
  uint64_t v10 = __chkstk_darwin(v158);
  uint64_t v150 = (char *)&v128 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v156 = (char *)&v128 - v12;
  uint64_t v149 = type metadata accessor for Logger();
  uint64_t v148 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  v161 = (char *)&v128 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for OSSignpostID();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v145 = (char *)&v128 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v138 = (char *)&v128 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  BOOL v22 = (char *)&v128 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v128 - v23;
  uint64_t v25 = type metadata accessor for OSSignposter();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v162 = v25;
  uint64_t v163 = v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v146 = (char *)&v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v143 = (char *)&v128 - v30;
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)&v128 - v31;
  uint64_t v154 = swift_allocObject();
  *(void *)(v154 + 16) = a3;
  uint64_t v144 = (uint64_t)a3;
  _Block_copy(a3);
  static Signpost.signposter.getter();
  static OSSignpostID.exclusive.getter();
  id v33 = OSSignposter.logHandle.getter();
  os_signpost_type_t v34 = static os_signpost_type_t.begin.getter();
  char v35 = OS_os_log.signpostsEnabled.getter();
  uint64_t v159 = v22;
  if (v35)
  {
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    unint64_t v37 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v36(v22, v24, v14);
    uint64_t v38 = v15;
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    os_signpost_id_t v40 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, v34, v40, "TTS enqueue audio task", "", v39, 2u);
    uint64_t v15 = v38;
    BOOL v22 = v159;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
  }
  else
  {

    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    unint64_t v37 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v140 = v36;
  unint64_t v139 = v37;
  v36(v22, v24, v14);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  uint64_t v153 = OSSignpostIntervalState.init(id:isOpen:)();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v15 + 8);
  unint64_t v41 = (char *)(v15 + 8);
  uint64_t v152 = v42;
  v42(v24, v14);
  uint64_t v43 = v163 + 8;
  uint64_t v151 = *(void (**)(char *, uint64_t))(v163 + 8);
  v151(v32, v162);
  static Logger.service.getter();
  uint64_t v44 = v147;
  uint64_t v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.default.getter();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v155 = v14;
  uint64_t v163 = v43;
  id v147 = v44;
  if (v47)
  {
    id v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = (void *)swift_slowAlloc();
    *(_DWORD *)id v48 = 138543362;
    *(void *)&long long aBlock = v44;
    uint64_t v50 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v49 = v44;

    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Received #AudioRequest %{public}@", v48, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v45 = v44;
  }
  uint64_t v51 = v156;

  (*(void (**)(char *, uint64_t))(v148 + 8))(v161, v149);
  type metadata accessor for ObjectPool();
  swift_allocObject();
  uint64_t v52 = ObjectPool.init()();
  id v53 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  *(void *)&long long aBlock = v53;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for Entitlements();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  uint64_t v54 = type metadata accessor for InternalSettings();
  *(void *)&long long aBlock = static InternalSettings.shared.getter();
  v161 = (char *)v54;
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  sub_100006560(&qword_100039E28);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_10002F140;
  uint64_t v56 = type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  uint64_t v57 = RequestParsingAction.init(pool:)();
  *((void *)&v165 + 1) = v56;
  uint64_t v166 = (uint64_t (*)())&protocol witness table for RequestParsingAction;
  *(void *)&long long aBlock = v57;
  swift_allocObject();
  *(void *)(v55 + 32) = WorkflowNode.init(action:)();
  uint64_t v58 = type metadata accessor for AudioPlaybackAction();
  swift_allocObject();
  swift_retain();
  uint64_t v59 = AudioPlaybackAction.init(pool:)();
  *((void *)&v165 + 1) = v58;
  uint64_t v166 = (uint64_t (*)())&protocol witness table for AudioPlaybackAction;
  *(void *)&long long aBlock = v59;
  swift_allocObject();
  *(void *)(v55 + 40) = WorkflowNode.init(action:)();
  *(void *)&long long aBlock = v55;
  specialized Array._endMutation()();
  uint64_t v60 = v158;
  DirectedAcyclicGraph.chain(nodes:)((Swift::OpaquePointer)aBlock);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v157 + 16))(v150, v51, v60);
  type metadata accessor for Workflow();
  swift_allocObject();
  id v61 = v53;
  uint64_t v150 = (char *)Workflow.init(graph:notification:errorHandlers:)();
  uint64_t v144 = v52;
  uint64_t v145 = v41;
  id v62 = *(void **)&v160[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate];
  uint64_t v146 = (char *)type metadata accessor for DelegateHandler();
  swift_allocObject();
  id v63 = v147;
  id v64 = v61;
  swift_unknownObjectRetain();
  id v131 = v62;
  id v130 = v63;
  uint64_t v149 = DelegateHandler.init(notificationCenter:delegate:request:)();
  uint64_t v65 = type metadata accessor for CoreAnalyticsSynthesisHandler();
  long long aBlock = 0u;
  long long v165 = 0u;
  uint64_t v166 = 0;
  swift_allocObject();
  id v66 = v64;
  uint64_t v148 = CoreAnalyticsSynthesisHandler.init(notificationCenter:coreAnalyticsService:)();
  uint64_t v67 = type metadata accessor for SignpostHandler();
  swift_allocObject();
  id v68 = v66;
  id v147 = (id)SignpostHandler.init(notificationCenter:)();
  os_log_type_t v69 = self;
  id v70 = v68;
  id v71 = [v69 sharedAnalytics];
  id v72 = [v71 defaultMessageStream];

  uint64_t v73 = type metadata accessor for SiriAnalyticsHandler();
  swift_allocObject();
  uint64_t v74 = SiriAnalyticsHandler.init(notificationCenter:service:powerLogger:logSynthesisEvents:)();
  uint64_t v75 = type metadata accessor for AudioHandler();
  swift_allocObject();
  id v129 = v70;
  uint64_t v76 = AudioHandler.init(notificationCenter:)();
  uint64_t v77 = swift_allocObject();
  sub_100006560((uint64_t *)&unk_100039E30);
  uint64_t v78 = swift_allocObject();
  *(_OWORD *)(v78 + 16) = xmmword_10002EDE0;
  *(void *)(v78 + 32) = v149;
  uint64_t v79 = v148;
  *(void *)(v78 + 56) = v146;
  *(void *)(v78 + 64) = v79;
  *(void *)(v78 + 88) = v65;
  uint64_t v80 = v77;
  *(void *)(v78 + 96) = v147;
  *(void *)(v78 + 120) = v67;
  *(void *)(v78 + 128) = v74;
  *(void *)(v78 + 184) = v75;
  *(void *)(v78 + 152) = v73;
  *(void *)(v78 + 160) = v76;
  *(void *)(v77 + 16) = v78;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v134 = (char *)v74;
  swift_retain();
  uint64_t v146 = (char *)v76;
  swift_retain();
  uint64_t v81 = os_transaction_create();
  uint64_t v82 = v154;
  uint64_t v83 = v160;
  if (v81)
  {
    uint64_t v84 = v81;
    *((void *)&v165 + 1) = swift_getObjectType();
    *(void *)&long long aBlock = v84;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v80 + 16) = v78;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v78 = (uint64_t)sub_10001BC98(0, *(void *)(v78 + 16) + 1, 1, (char *)v78);
      *(void *)(v80 + 16) = v78;
    }
    unint64_t v87 = *(void *)(v78 + 16);
    unint64_t v86 = *(void *)(v78 + 24);
    if (v87 >= v86 >> 1)
    {
      uint64_t v78 = (uint64_t)sub_10001BC98((char *)(v86 > 1), v87 + 1, 1, (char *)v78);
      *(void *)(v80 + 16) = v78;
    }
    *(void *)(v78 + 16) = v87 + 1;
    sub_10000BC54(&aBlock, (_OWORD *)(v78 + 32 * v87 + 32));
    swift_unknownObjectRelease();
  }
  static InternalSettings.shared.getter();
  char v88 = dispatch thunk of InternalSettings.enableDiagnostic.getter();
  swift_release();
  float v89 = v129;
  if (v88)
  {
    uint64_t v90 = type metadata accessor for DiagnosticService();
    swift_allocObject();
    id v91 = v89;
    uint64_t v92 = DiagnosticService.init(notification:)();
    *((void *)&v165 + 1) = v90;
    *(void *)&long long aBlock = v92;
    uint64_t v93 = *(char **)(v80 + 16);
    char v94 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v80 + 16) = v93;
    if ((v94 & 1) == 0)
    {
      uint64_t v93 = sub_10001BC98(0, *((void *)v93 + 2) + 1, 1, v93);
      *(void *)(v80 + 16) = v93;
    }
    unint64_t v96 = *((void *)v93 + 2);
    unint64_t v95 = *((void *)v93 + 3);
    if (v96 >= v95 >> 1)
    {
      uint64_t v93 = sub_10001BC98((char *)(v95 > 1), v96 + 1, 1, v93);
      *(void *)(v80 + 16) = v93;
    }
    *((void *)v93 + 2) = v96 + 1;
    sub_10000BC54(&aBlock, &v93[32 * v96 + 32]);
  }
  id v97 = objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  id v130 = v130;
  id v98 = v89;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v99 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  uint64_t v100 = (void *)swift_allocObject();
  v100[2] = v98;
  v100[3] = v83;
  v100[4] = sub_100029968;
  v100[5] = v82;
  v100[6] = v99;
  v100[7] = v80;
  uint64_t v166 = sub_100029240;
  uint64_t v167 = v100;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v165 = sub_1000068EC;
  *((void *)&v165 + 1) = &unk_100035DB8;
  uint64_t v101 = (char *)v80;
  os_signpost_type_t v102 = _Block_copy(&aBlock);
  id v103 = v99;
  id v131 = v98;
  id v104 = v103;
  id v105 = v83;
  swift_retain();
  v161 = v101;
  swift_retain();
  sub_10001F4C0((uint64_t)sub_100029240);
  swift_release();
  [v104 setCompletionBlock:v102];
  _Block_release(v102);

  swift_release();
  uint64_t v106 = (uint64_t)v135;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v107 = v136;
  uint64_t v108 = v137;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v136 + 48))(v106, 1, v137))
  {
    sub_100013A98(v106, &qword_100039BC0);
    uint64_t v109 = v138;
    if (qword_100039540 != -1) {
      swift_once();
    }
    sub_10000B864(qword_10003A0C8, unk_10003A0D0);
    uint64_t v110 = v157;
  }
  else
  {
    uint64_t v111 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v132, v106, v108);
    sub_100013A98(v106, &qword_100039BC0);
    uint64_t v112 = UUID.uuidString.getter();
    uint64_t v114 = v113;
    (*(void (**)(char *, uint64_t))(v107 + 8))(v111, v108);
    sub_10000B864(v112, v114);
    swift_bridgeObjectRelease();
    uint64_t v110 = v157;
    uint64_t v109 = v138;
  }
  sub_100008A28(v104);
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v156, v158);
  swift_release();
  uint64_t v115 = v143;
  static Signpost.signposter.getter();
  v116 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v117 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    swift_retain();
    uint64_t v118 = v133;
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v119 = v141;
    uint64_t v120 = v142;
    if ((*(unsigned int (**)(char *, uint64_t))(v141 + 88))(v118, v142) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v121 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v119 + 8))(v118, v120);
      uint64_t v121 = "";
    }
    uint64_t v122 = v159;
    uint64_t v123 = v155;
    v140(v159, v109, v155);
    unint64_t v124 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v124 = 0;
    os_signpost_id_t v125 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v116, v117, v125, "TTS enqueue audio task", v121, v124, 2u);
    swift_slowDealloc();

    uint64_t v126 = v152;
    v152(v109, v123);
    v151(v143, v162);
    v126(v122, v123);
  }
  else
  {

    v152(v109, v155);
    v151(v115, v162);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_100021E34(void *a1, char *a2, const void *a3)
{
  uint64_t v173 = a2;
  id v164 = a1;
  uint64_t v154 = type metadata accessor for UUID();
  uint64_t v153 = *(void *)(v154 - 8);
  __chkstk_darwin(v154);
  uint64_t v148 = (char *)&v139 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v5 - 8);
  uint64_t v152 = (char *)&v139 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = type metadata accessor for OSSignpostError();
  uint64_t v159 = *(void *)(v160 - 8);
  uint64_t v7 = __chkstk_darwin(v160);
  uint64_t v150 = (char *)&v139 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v151 = (char *)&v139 - v9;
  uint64_t v10 = (void *)type metadata accessor for Logger();
  uint64_t v168 = (void (**)(char *, id))*(v10 - 1);
  id v169 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v149 = (char *)&v139 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v171 = (char *)&v139 - v13;
  uint64_t v14 = type metadata accessor for OSSignpostID();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v156 = (char *)&v139 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v163 = (char *)&v139 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  BOOL v22 = (char *)&v139 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v139 - v23;
  uint64_t v25 = type metadata accessor for OSSignposter();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v174 = v25;
  uint64_t v175 = v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v155 = (char *)&v139 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  v161 = (char *)&v139 - v30;
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)&v139 - v31;
  uint64_t v170 = swift_allocObject();
  *(void *)(v170 + 16) = a3;
  uint64_t v162 = a3;
  _Block_copy(a3);
  static Signpost.signposter.getter();
  static OSSignpostID.exclusive.getter();
  id v33 = OSSignposter.logHandle.getter();
  os_signpost_type_t v34 = static os_signpost_type_t.begin.getter();
  char v35 = OS_os_log.signpostsEnabled.getter();
  v172 = v22;
  if (v35)
  {
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    unint64_t v37 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v36(v22, v24, v14);
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    os_signpost_id_t v39 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, v34, v39, "TTS enqueue speech task", "", v38, 2u);
    BOOL v22 = v172;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
  }
  else
  {

    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    unint64_t v37 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v40 = v14;
  uint64_t v158 = (void (*)(char *, char *, const void *))v36;
  unint64_t v157 = v37;
  v36(v22, v24, v14);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  uint64_t v41 = OSSignpostIntervalState.init(id:isOpen:)();
  uint64_t v166 = *(void (**)(char *, uint64_t))(v15 + 8);
  v166(v24, v14);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v175 + 8);
  v175 += 8;
  long long v165 = v42;
  v42(v32, v174);
  uint64_t v43 = v171;
  static Logger.service.getter();
  uint64_t v44 = (const void *)v40;
  id v45 = v164;
  os_log_type_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.default.getter();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v49 = (char *)(v15 + 8);
  uint64_t v167 = v41;
  if (v48)
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    id v164 = (id)swift_slowAlloc();
    *(void *)&long long aBlock = v164;
    *(_DWORD *)uint64_t v50 = 136446210;
    uint64_t v147 = (uint64_t)(v50 + 4);
    uint64_t v51 = v44;
    id v52 = [v45 description];
    id v53 = v49;
    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v56 = v55;

    uint64_t v44 = v51;
    uint64_t v57 = v54;
    uint64_t v49 = v53;
    uint64_t v176 = sub_100007B04(v57, v56, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Received #SpeechRequest %{public}s", v50, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v168[1](v171, v169);
  }
  else
  {

    v168[1](v43, v169);
  }
  type metadata accessor for ObjectPool();
  swift_allocObject();
  uint64_t v58 = ObjectPool.init()();
  id v59 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  *(void *)&long long aBlock = v59;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for Entitlements();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  uint64_t v60 = type metadata accessor for InternalSettings();
  *(void *)&long long aBlock = static InternalSettings.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for InlineStreamingStorage();
  *(void *)&long long aBlock = static InlineStreamingStorage.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for TrialAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = TrialAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for LocalAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = LocalAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for VocalizerCustomVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = VocalizerCustomVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for PreinstalledVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = PreinstalledVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for BuiltInVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = BuiltInVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for OspreyClient();
  *(void *)&long long aBlock = static OspreyClient.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for OspreyChainedConfigs();
  uint64_t v61 = dispatch thunk of BaseRequest.clientBundleId.getter();
  sub_1000198D4(v61, v62, (uint64_t *)&aBlock);
  swift_bridgeObjectRelease();
  sub_100006560(&qword_100039E60);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  sub_100008224((uint64_t)&aBlock);
  uint64_t v63 = type metadata accessor for SiriSynthesisProfile();
  uint64_t v64 = swift_allocObject();
  *(_DWORD *)(v64 + 28) = 0;
  *(unsigned char *)(v64 + 32) = 1;
  *(void *)(v64 + 16) = 0x4014000000000000;
  *(unsigned char *)(v64 + 24) = 0;
  sub_100006524(0, (unint64_t *)&qword_100039750);
  uint64_t v65 = static OS_dispatch_queue.appSynthesisPriority(request:)();
  *(_DWORD *)(v64 + 28) = v65;
  *(unsigned char *)(v64 + 32) = BYTE4(v65) & 1;
  *((void *)&v178 + 1) = v63;
  uint64_t v179 = sub_100028E28(&qword_100039E68, (void (*)(uint64_t))type metadata accessor for SiriSynthesisProfile);
  *(void *)&long long aBlock = v64;
  swift_retain();
  sub_100006560(&qword_100039E70);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  sub_100008224((uint64_t)&aBlock);
  type metadata accessor for EngineCachingService();
  *(void *)&long long aBlock = static EngineCachingService.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for CacheStorage();
  uint64_t v66 = static CacheStorage.sharedSynthesisCache.getter();
  if (v66)
  {
    *(void *)&long long aBlock = v66;
    dispatch thunk of ObjectPool.inject<A>(object:)();
    swift_release();
  }
  type metadata accessor for PreinstalledAudioStorage();
  *(void *)&long long aBlock = static PreinstalledAudioStorage.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  swift_retain();
  uint64_t v67 = (void *)sub_100016480((uint64_t)v45, v58);
  uint64_t v146 = v60;
  v161 = v49;
  uint64_t v162 = v44;
  swift_release();
  uint64_t v68 = *(void *)&v173[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate];
  uint64_t v163 = (char *)type metadata accessor for DelegateHandler();
  swift_allocObject();
  id v69 = v45;
  id v164 = v67;
  swift_retain();
  id v70 = v59;
  swift_unknownObjectRetain();
  uint64_t v144 = v68;
  id v143 = v69;
  uint64_t v171 = (char *)DelegateHandler.init(notificationCenter:delegate:request:)();
  uint64_t v151 = (char *)type metadata accessor for CoreAnalyticsSynthesisHandler();
  long long aBlock = 0u;
  long long v178 = 0u;
  uint64_t v179 = 0;
  swift_allocObject();
  id v71 = v70;
  uint64_t v72 = CoreAnalyticsSynthesisHandler.init(notificationCenter:coreAnalyticsService:)();
  uint64_t v147 = type metadata accessor for SignpostHandler();
  swift_allocObject();
  id v73 = v71;
  uint64_t v74 = SignpostHandler.init(notificationCenter:)();
  uint64_t v75 = self;
  id v76 = v73;
  id v77 = [v75 sharedAnalytics];
  id v78 = [v77 defaultMessageStream];

  uint64_t v79 = type metadata accessor for SiriAnalyticsHandler();
  swift_allocObject();
  uint64_t v80 = SiriAnalyticsHandler.init(notificationCenter:service:powerLogger:logSynthesisEvents:)();
  uint64_t v81 = type metadata accessor for AudioHandler();
  swift_allocObject();
  id v142 = v76;
  uint64_t v82 = AudioHandler.init(notificationCenter:)();
  uint64_t v83 = swift_allocObject();
  sub_100006560((uint64_t *)&unk_100039E30);
  uint64_t v84 = swift_allocObject();
  *(_OWORD *)(v84 + 16) = xmmword_10002EDE0;
  *(void *)(v84 + 32) = v171;
  *(void *)(v84 + 56) = v163;
  *(void *)(v84 + 64) = v72;
  *(void *)(v84 + 88) = v151;
  *(void *)(v84 + 96) = v74;
  *(void *)(v84 + 120) = v147;
  *(void *)(v84 + 128) = v80;
  *(void *)(v84 + 184) = v81;
  *(void *)(v84 + 152) = v79;
  *(void *)(v84 + 160) = v82;
  *(void *)(v83 + 16) = v84;
  swift_retain();
  uint64_t v151 = (char *)v72;
  swift_retain();
  uint64_t v147 = v74;
  swift_retain();
  uint64_t v145 = v80;
  swift_retain();
  uint64_t v163 = (char *)v82;
  swift_retain();
  uint64_t v85 = os_transaction_create();
  if (v85)
  {
    uint64_t v86 = v85;
    *((void *)&v178 + 1) = swift_getObjectType();
    *(void *)&long long aBlock = v86;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v83 + 16) = v84;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v84 = (uint64_t)sub_10001BC98(0, *(void *)(v84 + 16) + 1, 1, (char *)v84);
      *(void *)(v83 + 16) = v84;
    }
    unint64_t v89 = *(void *)(v84 + 16);
    unint64_t v88 = *(void *)(v84 + 24);
    if (v89 >= v88 >> 1)
    {
      uint64_t v84 = (uint64_t)sub_10001BC98((char *)(v88 > 1), v89 + 1, 1, (char *)v84);
      *(void *)(v83 + 16) = v84;
    }
    *(void *)(v84 + 16) = v89 + 1;
    sub_10000BC54(&aBlock, (_OWORD *)(v84 + 32 * v89 + 32));
    swift_unknownObjectRelease();
  }
  static InternalSettings.shared.getter();
  char v90 = dispatch thunk of InternalSettings.enableDiagnostic.getter();
  swift_release();
  id v91 = v143;
  uint64_t v92 = v142;
  if (v90)
  {
    uint64_t v93 = type metadata accessor for DiagnosticService();
    swift_allocObject();
    id v94 = v92;
    uint64_t v95 = DiagnosticService.init(notification:)();
    *((void *)&v178 + 1) = v93;
    *(void *)&long long aBlock = v95;
    unint64_t v96 = *(char **)(v83 + 16);
    char v97 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v83 + 16) = v96;
    if ((v97 & 1) == 0)
    {
      unint64_t v96 = sub_10001BC98(0, *((void *)v96 + 2) + 1, 1, v96);
      *(void *)(v83 + 16) = v96;
    }
    unint64_t v99 = *((void *)v96 + 2);
    unint64_t v98 = *((void *)v96 + 3);
    if (v99 >= v98 >> 1)
    {
      unint64_t v96 = sub_10001BC98((char *)(v98 > 1), v99 + 1, 1, v96);
      *(void *)(v83 + 16) = v96;
    }
    *((void *)v96 + 2) = v99 + 1;
    sub_10000BC54(&aBlock, &v96[32 * v99 + 32]);
  }
  dispatch thunk of BaseRequest.sandboxToken.getter();
  uint64_t v101 = v100;
  uint64_t v141 = v64;
  uint64_t v140 = v83;
  if (v100)
  {
    String.utf8CString.getter();
    swift_bridgeObjectRelease();
    uint64_t v101 = sandbox_extension_consume();
    swift_release();
    if (v101 != -1)
    {
      char v102 = 0;
      goto LABEL_28;
    }
    static Logger.service.getter();
    id v103 = Logger.logObject.getter();
    os_log_type_t v104 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v103, v104))
    {
      id v105 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v105 = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, v104, "Unable to consume sandbox extension", v105, 2u);
      swift_slowDealloc();
    }

    v168[1](v149, v169);
    uint64_t v101 = 0;
  }
  char v102 = 1;
LABEL_28:
  uint64_t v106 = (char *)[objc_allocWithZone((Class)ResourceHint) initWithResourceType:10 andState:1];
  uint64_t v149 = v106;
  id v107 = objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  uint64_t v168 = v91;
  id v108 = v92;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v109 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  uint64_t v110 = swift_allocObject();
  *(void *)(v110 + 16) = v106;
  *(void *)(v110 + 24) = v108;
  uint64_t v111 = v173;
  *(void *)(v110 + 32) = v173;
  *(void *)(v110 + 40) = sub_100029968;
  *(void *)(v110 + 48) = v170;
  *(void *)(v110 + 56) = v109;
  *(void *)(v110 + 64) = v140;
  *(void *)(v110 + 72) = v101;
  *(unsigned char *)(v110 + 80) = v102;
  uint64_t v179 = (uint64_t)sub_100029138;
  uint64_t v180 = v110;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v178 = sub_1000068EC;
  *((void *)&v178 + 1) = &unk_100035D40;
  uint64_t v112 = _Block_copy(&aBlock);
  id v113 = v109;
  id v169 = v108;
  id v114 = v113;
  uint64_t v115 = v149;
  id v116 = v111;
  swift_retain();
  swift_retain();
  sub_10001F4C0((uint64_t)sub_100029138);
  swift_release();
  [v114 setCompletionBlock:v112];
  _Block_release(v112);

  swift_release();
  uint64_t v117 = (uint64_t)v152;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v118 = v153;
  uint64_t v119 = v154;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v153 + 48))(v117, 1, v154))
  {
    sub_100013A98(v117, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    sub_10000B864(qword_10003A0C8, unk_10003A0D0);
    sub_100008A28(v114);
    swift_release();

    swift_release();
  }
  else
  {
    uint64_t v120 = v148;
    (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))(v148, v117, v119);
    sub_100013A98(v117, &qword_100039BC0);
    uint64_t v121 = UUID.uuidString.getter();
    uint64_t v123 = v122;
    (*(void (**)(char *, uint64_t))(v118 + 8))(v120, v119);
    sub_10000B864(v121, v123);
    swift_bridgeObjectRelease();
    sub_100008A28(v114);
    swift_release();
    swift_release();
  }
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  unint64_t v124 = v155;
  static Signpost.signposter.getter();
  os_signpost_id_t v125 = OSSignposter.logHandle.getter();
  uint64_t v126 = v156;
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v127 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    swift_retain();
    uint64_t v128 = v150;
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v129 = v159;
    uint64_t v130 = v160;
    int v131 = (*(uint64_t (**)(char *, uint64_t))(v159 + 88))(v128, v160);
    os_log_type_t v132 = v162;
    if (v131 == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v133 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v129 + 8))(v128, v130);
      uint64_t v133 = "";
    }
    uint64_t v134 = v172;
    v158(v172, v126, v132);
    v135 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v135 = 0;
    os_signpost_id_t v136 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v125, v127, v136, "TTS enqueue speech task", v133, v135, 2u);
    swift_slowDealloc();

    uint64_t v137 = (void (*)(char *, const void *))v166;
    v166(v126, (uint64_t)v132);
    v165(v124, v174);
    v137(v134, v132);
  }
  else
  {

    v166(v126, (uint64_t)v162);
    v165(v124, v174);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_100023620(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_t v51 = (os_log_t)((char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v5 - 8);
  id v52 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for Logger();
  uint64_t v7 = *(void (**)(void, void))(v54 - 8);
  uint64_t v8 = __chkstk_darwin(v54);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v46 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  static Logger.service.getter();
  uint64_t v16 = a1;
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    id v53 = v7;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v50 = v13;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v49 = v10;
    os_log_type_t v47 = (void *)v21;
    *(_DWORD *)uint64_t v20 = 138412290;
    uint64_t v48 = v3;
    uint64_t v55 = (uint64_t)v16;
    BOOL v22 = v16;
    uint64_t v23 = v16;
    uint64_t v7 = v53;
    uint64_t v3 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v47 = v22;

    uint64_t v16 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Cancelling #Request %@", v20, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    uint64_t v10 = v49;
    swift_slowDealloc();
    uint64_t v13 = v50;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v17 = v16;
  }

  id v53 = (void (*)(void, void))*((void *)v7 + 1);
  v53(v15, v54);
  uint64_t v24 = (uint64_t)v52;
  dispatch thunk of BaseRequest.accessoryId.getter();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v24, 1, v2))
  {
    sub_100013A98(v24, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10000B864(qword_10003A0C8, unk_10003A0D0);
  }
  else
  {
    os_log_t v26 = v51;
    (*(void (**)(os_log_t, uint64_t, uint64_t))(v3 + 16))(v51, v24, v2);
    sub_100013A98(v24, &qword_100039BC0);
    uint64_t v27 = UUID.uuidString.getter();
    uint64_t v29 = v28;
    (*(void (**)(os_log_t, uint64_t))(v3 + 8))(v26, v2);
    uint64_t v25 = sub_10000B864(v27, v29);
    swift_bridgeObjectRelease();
  }
  uint64_t v30 = dispatch thunk of BaseRequest.requestCreatedTime.getter();
  uint64_t v31 = sub_10000A09C(v30);
  if (v31)
  {
    uint64_t v32 = v31;
    [v31 cancel];
    static Logger.service.getter();
    id v33 = v32;
    os_signpost_type_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      unint64_t v37 = (void *)swift_slowAlloc();
      os_log_t v51 = v34;
      id v52 = (char *)v25;
      *(_DWORD *)uint64_t v36 = 138412290;
      uint64_t v55 = (uint64_t)v33;
      id v38 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v37 = v32;

      os_log_t v39 = v51;
      _os_log_impl((void *)&_mh_execute_header, v51, v35, "Requested cancellation of task %@", v36, 0xCu);
      sub_100006560(&qword_1000397B8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    static Logger.service.getter();
    uint64_t v40 = v16;
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = v10;
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 134217984;
      uint64_t v55 = dispatch thunk of BaseRequest.requestCreatedTime.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v41, v42, "No task found for request of id %llu", v44, 0xCu);
      swift_slowDealloc();
      swift_release();

      uint64_t v13 = v43;
    }
    else
    {

      swift_release();
      uint64_t v13 = v10;
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v53)(v13, v54);
}

uint64_t sub_100023CB8(void *a1, char *a2, const void *a3)
{
  v161 = a2;
  id v154 = a1;
  uint64_t v143 = type metadata accessor for UUID();
  uint64_t v142 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  uint64_t v138 = (char *)v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v5 - 8);
  uint64_t v141 = (char *)v136 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = type metadata accessor for OSSignpostError();
  uint64_t v149 = *(void *)(v150 - 8);
  uint64_t v7 = __chkstk_darwin(v150);
  uint64_t v145 = (char *)v136 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v139 = (char *)v136 - v9;
  uint64_t v10 = (void *)type metadata accessor for Logger();
  uint64_t v159 = (void (**)(char *, id))*(v10 - 1);
  id v160 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v137 = (char *)v136 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v163 = (char *)v136 - v13;
  uint64_t v14 = type metadata accessor for OSSignpostID();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v146 = (char *)v136 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v152 = (char *)v136 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  BOOL v22 = (char *)v136 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)v136 - v23;
  uint64_t v25 = type metadata accessor for OSSignposter();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v165 = v25;
  uint64_t v166 = v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v144 = (char *)v136 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v153 = (char *)v136 - v30;
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)v136 - v31;
  uint64_t v162 = swift_allocObject();
  *(void *)(v162 + 16) = a3;
  uint64_t v151 = (uint64_t)a3;
  _Block_copy(a3);
  static Signpost.signposter.getter();
  static OSSignpostID.exclusive.getter();
  id v33 = OSSignposter.logHandle.getter();
  os_signpost_type_t v34 = static os_signpost_type_t.begin.getter();
  char v35 = OS_os_log.signpostsEnabled.getter();
  id v164 = v22;
  if (v35)
  {
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    unint64_t v37 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v36(v22, v24, v14);
    id v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v38 = 0;
    os_signpost_id_t v39 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, v34, v39, "TTS enqueue synthesis task", "", v38, 2u);
    BOOL v22 = v164;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
  }
  else
  {

    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    unint64_t v37 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v40 = v14;
  uint64_t v148 = v36;
  unint64_t v147 = v37;
  v36(v22, v24, v14);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  uint64_t v157 = OSSignpostIntervalState.init(id:isOpen:)();
  uint64_t v156 = *(void (**)(char *, uint64_t))(v15 + 8);
  v156(v24, v14);
  uint64_t v41 = v166 + 8;
  uint64_t v155 = *(void (**)(char *, uint64_t))(v166 + 8);
  v155(v32, v165);
  os_log_type_t v42 = v163;
  static Logger.service.getter();
  id v43 = v154;
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.default.getter();
  BOOL v46 = os_log_type_enabled(v44, v45);
  uint64_t v158 = v15 + 8;
  id v154 = v43;
  if (v46)
  {
    os_log_type_t v47 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long aBlock = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v47 = 136446210;
    uint64_t v140 = v47 + 4;
    id v48 = [v43 description];
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v166 = v41;
    unint64_t v51 = v50;

    uint64_t v167 = sub_100007B04(v49, v51, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v41 = v166;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Received #SynthesisRequest %{public}s", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v159[1](v163, v160);
  }
  else
  {

    v159[1](v42, v160);
  }
  id v52 = v161;
  type metadata accessor for ObjectPool();
  swift_allocObject();
  uint64_t v53 = ObjectPool.init()();
  id v54 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  *(void *)&long long aBlock = v54;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for Entitlements();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  uint64_t v55 = type metadata accessor for InternalSettings();
  *(void *)&long long aBlock = static InternalSettings.shared.getter();
  uint64_t v140 = (uint8_t *)v55;
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for InlineStreamingStorage();
  *(void *)&long long aBlock = static InlineStreamingStorage.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for TrialAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = TrialAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for LocalAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = LocalAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for VocalizerCustomVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = VocalizerCustomVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for PreinstalledVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = PreinstalledVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for BuiltInVoiceProvider();
  swift_allocObject();
  *(void *)&long long aBlock = BuiltInVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for OspreyClient();
  *(void *)&long long aBlock = static OspreyClient.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for OspreyChainedConfigs();
  id v56 = v154;
  uint64_t v57 = dispatch thunk of BaseRequest.clientBundleId.getter();
  sub_1000198D4(v57, v58, (uint64_t *)&aBlock);
  swift_bridgeObjectRelease();
  sub_100006560(&qword_100039E60);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  sub_100008224((uint64_t)&aBlock);
  uint64_t v59 = type metadata accessor for SiriSynthesisProfile();
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = 0;
  *(unsigned char *)(v60 + 24) = 1;
  *(_DWORD *)(v60 + 28) = 0;
  *(unsigned char *)(v60 + 32) = 1;
  *((void *)&v169 + 1) = v59;
  uint64_t v170 = sub_100028E28(&qword_100039E68, (void (*)(uint64_t))type metadata accessor for SiriSynthesisProfile);
  *(void *)&long long aBlock = v60;
  sub_100006560(&qword_100039E70);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  sub_100008224((uint64_t)&aBlock);
  type metadata accessor for EngineCachingService();
  *(void *)&long long aBlock = static EngineCachingService.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for CacheStorage();
  uint64_t v61 = static CacheStorage.sharedSynthesisCache.getter();
  if (v61)
  {
    *(void *)&long long aBlock = v61;
    dispatch thunk of ObjectPool.inject<A>(object:)();
    swift_release();
  }
  type metadata accessor for PreinstalledAudioStorage();
  *(void *)&long long aBlock = static PreinstalledAudioStorage.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  swift_retain();
  uint64_t v62 = sub_100017D7C((uint64_t)v56, v53);
  uint64_t v166 = v41;
  uint64_t v151 = v40;
  swift_release();
  uint64_t v63 = *(void *)&v52[OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate];
  uint64_t v64 = type metadata accessor for DelegateHandler();
  swift_allocObject();
  id v65 = v56;
  uint64_t v153 = (char *)v62;
  swift_retain();
  id v66 = v54;
  swift_unknownObjectRetain();
  v136[1] = v63;
  v136[0] = v65;
  id v154 = (id)DelegateHandler.init(notificationCenter:delegate:request:)();
  uint64_t v67 = type metadata accessor for CoreAnalyticsSynthesisHandler();
  long long aBlock = 0u;
  long long v169 = 0u;
  uint64_t v170 = 0;
  swift_allocObject();
  id v68 = v66;
  uint64_t v152 = (char *)CoreAnalyticsSynthesisHandler.init(notificationCenter:coreAnalyticsService:)();
  id v69 = self;
  id v70 = v68;
  id v71 = [v69 sharedAnalytics];
  id v72 = [v71 defaultMessageStream];

  uint64_t v73 = type metadata accessor for SiriAnalyticsHandler();
  swift_allocObject();
  uint64_t v74 = SiriAnalyticsHandler.init(notificationCenter:service:powerLogger:logSynthesisEvents:)();
  uint64_t v75 = type metadata accessor for SignpostHandler();
  swift_allocObject();
  id v76 = v70;
  uint64_t v77 = SignpostHandler.init(notificationCenter:)();
  uint64_t v78 = swift_allocObject();
  sub_100006560((uint64_t *)&unk_100039E30);
  uint64_t v79 = swift_allocObject();
  *(_OWORD *)(v79 + 16) = xmmword_10002F190;
  *(void *)(v79 + 32) = v154;
  uint64_t v80 = v152;
  *(void *)(v79 + 56) = v64;
  *(void *)(v79 + 64) = v80;
  *(void *)(v79 + 88) = v67;
  *(void *)(v79 + 96) = v74;
  *(void *)(v79 + 152) = v75;
  *(void *)(v79 + 120) = v73;
  *(void *)(v79 + 128) = v77;
  uint64_t v163 = (char *)v78;
  *(void *)(v78 + 16) = v79;
  swift_retain();
  swift_retain();
  swift_retain();
  v136[2] = v77;
  swift_retain();
  uint64_t v81 = os_transaction_create();
  if (v81)
  {
    uint64_t v82 = v81;
    *((void *)&v169 + 1) = swift_getObjectType();
    *(void *)&long long aBlock = v82;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *((void *)v163 + 2) = v79;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v79 = (uint64_t)sub_10001BC98(0, *(void *)(v79 + 16) + 1, 1, (char *)v79);
      *((void *)v163 + 2) = v79;
    }
    unint64_t v85 = *(void *)(v79 + 16);
    unint64_t v84 = *(void *)(v79 + 24);
    if (v85 >= v84 >> 1)
    {
      uint64_t v79 = (uint64_t)sub_10001BC98((char *)(v84 > 1), v85 + 1, 1, (char *)v79);
      *((void *)v163 + 2) = v79;
    }
    *(void *)(v79 + 16) = v85 + 1;
    sub_10000BC54(&aBlock, (_OWORD *)(v79 + 32 * v85 + 32));
    swift_unknownObjectRelease();
  }
  static InternalSettings.shared.getter();
  char v86 = dispatch thunk of InternalSettings.enableDiagnostic.getter();
  swift_release();
  unint64_t v87 = (void *)v136[0];
  if (v86)
  {
    uint64_t v88 = type metadata accessor for DiagnosticService();
    swift_allocObject();
    id v89 = v76;
    uint64_t v90 = DiagnosticService.init(notification:)();
    *((void *)&v169 + 1) = v88;
    *(void *)&long long aBlock = v90;
    id v91 = v163;
    uint64_t v92 = (char *)*((void *)v163 + 2);
    char v93 = swift_isUniquelyReferenced_nonNull_native();
    *((void *)v91 + 2) = v92;
    if ((v93 & 1) == 0)
    {
      uint64_t v92 = sub_10001BC98(0, *((void *)v92 + 2) + 1, 1, v92);
      *((void *)v163 + 2) = v92;
    }
    unint64_t v95 = *((void *)v92 + 2);
    unint64_t v94 = *((void *)v92 + 3);
    if (v95 >= v94 >> 1)
    {
      uint64_t v92 = sub_10001BC98((char *)(v94 > 1), v95 + 1, 1, v92);
      *((void *)v163 + 2) = v92;
    }
    *((void *)v92 + 2) = v95 + 1;
    sub_10000BC54(&aBlock, &v92[32 * v95 + 32]);
  }
  dispatch thunk of BaseRequest.sandboxToken.getter();
  uint64_t v139 = (char *)v74;
  if (v96)
  {
    String.utf8CString.getter();
    swift_bridgeObjectRelease();
    uint64_t v97 = sandbox_extension_consume();
    swift_release();
    if (v97 != -1)
    {
      char v98 = 0;
      goto LABEL_28;
    }
    unint64_t v99 = v137;
    static Logger.service.getter();
    uint64_t v100 = Logger.logObject.getter();
    os_log_type_t v101 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v100, v101))
    {
      char v102 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v102 = 0;
      _os_log_impl((void *)&_mh_execute_header, v100, v101, "Unable to consume sandbox extension", v102, 2u);
      unint64_t v99 = v137;
      swift_slowDealloc();
    }

    v159[1](v99, v160);
  }
  uint64_t v97 = 0;
  char v98 = 1;
LABEL_28:
  id v103 = objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  uint64_t v159 = v87;
  id v104 = v76;
  swift_unknownObjectRetain();
  id v105 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  uint64_t v106 = swift_allocObject();
  id v107 = v161;
  uint64_t v108 = v162;
  *(void *)(v106 + 16) = v104;
  *(void *)(v106 + 24) = v107;
  *(void *)(v106 + 32) = sub_100028E20;
  *(void *)(v106 + 40) = v108;
  uint64_t v109 = v163;
  *(void *)(v106 + 48) = v105;
  *(void *)(v106 + 56) = v109;
  *(void *)(v106 + 64) = v97;
  *(unsigned char *)(v106 + 72) = v98;
  uint64_t v170 = (uint64_t)sub_100028E78;
  uint64_t v171 = v106;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v169 = sub_1000068EC;
  *((void *)&v169 + 1) = &unk_100035C78;
  uint64_t v110 = _Block_copy(&aBlock);
  id v111 = v105;
  id v160 = v104;
  id v112 = v111;
  id v113 = v107;
  swift_retain();
  swift_retain();
  sub_10001F4C0((uint64_t)sub_100028E78);
  swift_release();
  [v112 setCompletionBlock:v110];
  _Block_release(v110);

  swift_release();
  uint64_t v114 = (uint64_t)v141;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v115 = v142;
  uint64_t v116 = v143;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v142 + 48))(v114, 1, v143))
  {
    sub_100013A98(v114, &qword_100039BC0);
    uint64_t v117 = v144;
    if (qword_100039540 != -1) {
      swift_once();
    }
    sub_10000B864(qword_10003A0C8, unk_10003A0D0);
    uint64_t v118 = v145;
  }
  else
  {
    uint64_t v119 = v138;
    (*(void (**)(char *, uint64_t, uint64_t))(v115 + 16))(v138, v114, v116);
    sub_100013A98(v114, &qword_100039BC0);
    uint64_t v120 = UUID.uuidString.getter();
    uint64_t v122 = v121;
    (*(void (**)(char *, uint64_t))(v115 + 8))(v119, v116);
    sub_10000B864(v120, v122);
    swift_bridgeObjectRelease();
    uint64_t v118 = v145;
    uint64_t v117 = v144;
  }
  sub_100008A28(v112);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  static Signpost.signposter.getter();
  uint64_t v123 = OSSignposter.logHandle.getter();
  unint64_t v124 = v146;
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v125 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v126 = v149;
    uint64_t v127 = v150;
    int v128 = (*(uint64_t (**)(char *, uint64_t))(v149 + 88))(v118, v150);
    uint64_t v129 = v151;
    if (v128 == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v130 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v126 + 8))(v118, v127);
      uint64_t v130 = "";
    }
    int v131 = v164;
    v148(v164, v124, v129);
    os_log_type_t v132 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v132 = 0;
    os_signpost_id_t v133 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v123, v125, v133, "TTS enqueue synthesis task", v130, v132, 2u);
    swift_slowDealloc();

    uint64_t v134 = v156;
    v156(v124, v129);
    v155(v117, v165);
    v134(v131, v129);
  }
  else
  {

    v156(v124, v151);
    v155(v117, v165);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_1000253CC(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  __chkstk_darwin(v5);
  unint64_t v50 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = a3;
  _Block_copy(a3);
  static Logger.service.getter();
  id v14 = a1;
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  unint64_t v51 = v9;
  if (v17)
  {
    uint64_t v49 = v10;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *(_DWORD *)uint64_t v18 = 136446210;
    BOOL v46 = v18;
    id v19 = objc_msgSend(v14, "description", v18 + 4);
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v47 = v11;
    uint64_t v21 = v20;
    unint64_t v23 = v22;

    uint64_t v55 = sub_100007B04(v21, v23, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received #DurationEstimation %{public}s", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v49);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  type metadata accessor for ObjectPool();
  swift_allocObject();
  ObjectPool.init()();
  id v24 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  aBlock[0] = (uint64_t)v24;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for BuiltInVoiceProvider();
  swift_allocObject();
  aBlock[0] = BuiltInVoiceProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  swift_retain();
  uint64_t v25 = sub_10001EC88();
  swift_release();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = 0;
  swift_retain();
  uint64_t v27 = (void *)static NSNotificationName.synthesisEnded.getter();
  swift_retain();
  uint64_t v28 = NSNotificationCenter.addObserver<A>(event:callback:)();

  swift_release();
  id v29 = objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  BOOL v46 = (uint8_t *)v14;
  swift_unknownObjectRetain();
  id v30 = v24;
  uint64_t v49 = v25;
  uint64_t v31 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  uint64_t v32 = (void *)swift_allocObject();
  v32[2] = v30;
  v32[3] = v28;
  uint64_t v33 = v54;
  v32[4] = sub_100028D08;
  v32[5] = v33;
  v32[6] = v26;
  aBlock[4] = (uint64_t)sub_100028DB0;
  void aBlock[5] = (uint64_t)v32;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000068EC;
  Swift::OpaquePointer aBlock[3] = (uint64_t)&unk_100035C00;
  os_signpost_type_t v34 = _Block_copy(aBlock);
  uint64_t v47 = v26;
  swift_retain();
  id v35 = v30;
  id v36 = v31;
  uint64_t v48 = v28;
  swift_unknownObjectRetain();
  swift_retain();
  sub_10001F4C0((uint64_t)sub_100028DB0);
  swift_release();
  [v36 setCompletionBlock:v34];
  _Block_release(v34);

  swift_release();
  uint64_t v37 = (uint64_t)v51;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v39 = v52;
  uint64_t v38 = v53;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v37, 1, v53))
  {
    sub_100013A98(v37, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    sub_10000B864(qword_10003A0C8, unk_10003A0D0);
  }
  else
  {
    uint64_t v40 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v50, v37, v38);
    sub_100013A98(v37, &qword_100039BC0);
    uint64_t v41 = UUID.uuidString.getter();
    uint64_t v43 = v42;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v38);
    sub_10000B864(v41, v43);
    swift_bridgeObjectRelease();
  }
  sub_100008A28(v36);
  swift_release();

  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100025B60(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v82 = a2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v84 = *(void *)(v5 - 8);
  uint64_t v85 = v5;
  __chkstk_darwin(v5);
  uint64_t v80 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = type metadata accessor for TTSError.TTSErrorCode();
  id v88 = *(id *)(v90 - 8);
  __chkstk_darwin(v90);
  unint64_t v87 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = type metadata accessor for TTSError();
  id v89 = *(id *)(v91 - 8);
  __chkstk_darwin(v91);
  char v86 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006560(&qword_100039E10);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  unint64_t v94 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  BOOL v17 = (char *)&v76 - v16;
  uint64_t v18 = type metadata accessor for Logger();
  uint64_t v95 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a3;
  uint64_t v92 = a3;
  _Block_copy(a3);
  static Logger.service.getter();
  id v22 = a1;
  unint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v96 = v21;
  uint64_t v83 = v9;
  id v81 = v22;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v93 = v13;
    uint64_t v27 = (uint8_t *)v26;
    uint64_t v78 = swift_slowAlloc();
    *(void *)&long long aBlock = v78;
    uint64_t v77 = v27;
    *(_DWORD *)uint64_t v27 = 136446210;
    id v28 = objc_msgSend(v22, "description", v27 + 4);
    uint64_t v79 = v18;
    id v29 = v17;
    uint64_t v30 = v12;
    id v31 = v28;
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v34 = v33;

    uint64_t v12 = v30;
    BOOL v17 = v29;
    uint64_t v97 = sub_100007B04(v32, v34, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Received #TextToPhoneme %{public}s", v77, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v13 = v93;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v95 + 8))(v20, v79);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v95 + 8))(v20, v18);
  }
  type metadata accessor for ObjectPool();
  swift_allocObject();
  ObjectPool.init()();
  id v35 = [objc_allocWithZone((Class)NSNotificationCenter) init];
  *(void *)&long long aBlock = v35;
  sub_100006524(0, &qword_100039E18);
  dispatch thunk of ObjectPool.inject<A>(object:)();
  type metadata accessor for InternalSettings();
  *(void *)&long long aBlock = static InternalSettings.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for TrialAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = TrialAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for LocalAssetProvider();
  swift_allocObject();
  *(void *)&long long aBlock = LocalAssetProvider.init()();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  type metadata accessor for EngineCachingService();
  *(void *)&long long aBlock = static EngineCachingService.shared.getter();
  dispatch thunk of ObjectPool.inject<A>(object:)();
  swift_release();
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = 0;
  *(void *)(v36 + 24) = 0;
  uint64_t v37 = (void *)static NSNotificationName.phonemesGenerated.getter();
  swift_retain();
  uint64_t v95 = NSNotificationCenter.addObserver<A>(event:callback:)();

  swift_release();
  type metadata accessor for WorkflowNode();
  sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
  DirectedAcyclicGraph.init()();
  sub_100006560(&qword_100039E28);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_10002F130;
  uint64_t v39 = type metadata accessor for RequestPreprocessAction();
  swift_allocObject();
  swift_retain();
  uint64_t v40 = RequestPreprocessAction.init(pool:)();
  ObjectType = (void *)v39;
  os_log_type_t v101 = (uint64_t (*)())&protocol witness table for RequestPreprocessAction;
  *(void *)&long long aBlock = v40;
  swift_allocObject();
  *(void *)(v38 + 32) = WorkflowNode.init(action:)();
  uint64_t v41 = type metadata accessor for RequestParsingAction();
  swift_allocObject();
  swift_retain();
  uint64_t v42 = RequestParsingAction.init(pool:)();
  ObjectType = (void *)v41;
  os_log_type_t v101 = (uint64_t (*)())&protocol witness table for RequestParsingAction;
  *(void *)&long long aBlock = v42;
  swift_allocObject();
  *(void *)(v38 + 40) = WorkflowNode.init(action:)();
  uint64_t v43 = type metadata accessor for VoiceSelectionAction();
  swift_allocObject();
  swift_retain();
  uint64_t v44 = VoiceSelectionAction.init(pool:)();
  ObjectType = (void *)v43;
  os_log_type_t v101 = (uint64_t (*)())&protocol witness table for VoiceSelectionAction;
  *(void *)&long long aBlock = v44;
  swift_allocObject();
  *(void *)(v38 + 48) = WorkflowNode.init(action:)();
  uint64_t v45 = type metadata accessor for TextToPhonemeAction();
  swift_allocObject();
  swift_retain();
  uint64_t v46 = TextToPhonemeAction.init(pool:)();
  ObjectType = (void *)v45;
  os_log_type_t v101 = (uint64_t (*)())&protocol witness table for TextToPhonemeAction;
  *(void *)&long long aBlock = v46;
  swift_allocObject();
  *(void *)(v38 + 56) = WorkflowNode.init(action:)();
  *(void *)&long long aBlock = v38;
  specialized Array._endMutation()();
  DirectedAcyclicGraph.chain(nodes:)((Swift::OpaquePointer)aBlock);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v94, v17, v12);
  type metadata accessor for Workflow();
  swift_allocObject();
  uint64_t v47 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v48 = Workflow.init(graph:notification:errorHandlers:)();
  uint64_t v93 = v13;
  unint64_t v94 = (char *)v36;
  uint64_t v49 = swift_allocObject();
  *(void *)(v49 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v50 = os_transaction_create();
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = v48;
    ObjectType = (void *)swift_getObjectType();
    *(void *)&long long aBlock = v51;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v49 + 16) = &_swiftEmptyArrayStorage;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v47 = sub_10001BC98(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1, (char *)&_swiftEmptyArrayStorage);
      *(void *)(v49 + 16) = v47;
    }
    unint64_t v55 = *((void *)v47 + 2);
    unint64_t v54 = *((void *)v47 + 3);
    if (v55 >= v54 >> 1)
    {
      uint64_t v47 = sub_10001BC98((char *)(v54 > 1), v55 + 1, 1, v47);
      *(void *)(v49 + 16) = v47;
    }
    *((void *)v47 + 2) = v55 + 1;
    sub_10000BC54(&aBlock, &v47[32 * v55 + 32]);
    swift_unknownObjectRelease();
    uint64_t v48 = v52;
  }
  uint64_t v91 = (uint64_t)v17;
  uint64_t v92 = (const void *)v12;
  id v56 = objc_allocWithZone((Class)type metadata accessor for TaskOperation());
  id v88 = v81;
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v90 = v48;
  uint64_t v57 = (void *)TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
  uint64_t v58 = (char *)swift_allocObject();
  uint64_t v59 = v49;
  uint64_t v60 = v35;
  uint64_t v62 = v94;
  uint64_t v61 = v95;
  *((void *)v58 + 2) = v35;
  *((void *)v58 + 3) = v61;
  uint64_t v63 = v96;
  *((void *)v58 + 4) = sub_100028C4C;
  *((void *)v58 + 5) = v63;
  *((void *)v58 + 6) = v62;
  *((void *)v58 + 7) = v57;
  *((void *)v58 + 8) = v59;
  os_log_type_t v101 = sub_100028CF4;
  char v102 = v58;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  unint64_t v99 = sub_1000068EC;
  ObjectType = &unk_100035B60;
  uint64_t v64 = _Block_copy(&aBlock);
  unint64_t v87 = v102;
  id v65 = v57;
  swift_retain();
  id v66 = v65;
  id v89 = v60;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_10001F4C0((uint64_t)sub_100028CF4);
  swift_release();
  [v66 setCompletionBlock:v64];
  _Block_release(v64);

  swift_release();
  uint64_t v67 = (uint64_t)v83;
  dispatch thunk of BaseRequest.accessoryId.getter();
  uint64_t v69 = v84;
  uint64_t v68 = v85;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v67, 1, v85))
  {
    sub_100013A98(v67, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    sub_10000B864(qword_10003A0C8, unk_10003A0D0);
  }
  else
  {
    id v70 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v80, v67, v68);
    sub_100013A98(v67, &qword_100039BC0);
    uint64_t v71 = UUID.uuidString.getter();
    uint64_t v73 = v72;
    (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v68);
    sub_10000B864(v71, v73);
    swift_bridgeObjectRelease();
  }
  uint64_t v74 = v91;
  sub_100008A28(v66);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, const void *))(v93 + 8))(v74, v92);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100026964(void *a1, const char *a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  uint64_t v10 = a1;
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    id v22 = a3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = a2;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138412290;
    unint64_t v23 = v10;
    uint64_t v15 = v10;
    uint64_t v21 = v6;
    uint64_t v16 = v15;
    a3 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v19 = v10;

    uint64_t v6 = v21;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v20, v14, 0xCu);
    sub_100006560(&qword_1000397B8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v11 = v10;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for InlineStreamingStorage();
  static InlineStreamingStorage.shared.getter();
  a3(v10);
  return swift_release();
}

uint64_t sub_100026B98(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v45 = a6;
  uint64_t v46 = a4;
  unint64_t v47 = a5;
  uint64_t v44 = a2;
  uint64_t v10 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v41 = v10;
  __chkstk_darwin(v10);
  uint64_t v39 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TTSError();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v42 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v43 = (char *)&v33 - v16;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v36 = v13;
    uint64_t v24 = v23;
    uint64_t v34 = swift_slowAlloc();
    v49[0] = v34;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v35 = v17;
    type metadata accessor for SynthesisVoice();
    uint64_t v38 = a7;
    swift_bridgeObjectRetain();
    uint64_t v25 = Array.description.getter();
    uint64_t v37 = v12;
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    uint64_t v48 = sub_100007B04(v25, v27, v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v28 = v44;
    uint64_t v48 = sub_100007B04(v44, a3, v49);
    a7 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Received #VoiceSubscription %{public}s for clientId: %{public}s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v35);
    uint64_t v29 = v46;
    unint64_t v30 = v47;
    uint64_t v31 = v28;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    uint64_t v29 = v46;
    unint64_t v30 = v47;
    uint64_t v31 = v44;
  }
  sub_10000D45C(a1, v31, a3, v29, v30);
  return (*(uint64_t (**)(uint64_t, void))(a7 + 16))(a7, 0);
}

uint64_t sub_100027128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TTSError.TTSErrorCode();
  __chkstk_darwin(v3);
  uint64_t v4 = type metadata accessor for TTSError();
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  type metadata accessor for VoiceSelectionAction();
  static VoiceSelectionAction.defaultSetupAction()();
  dispatch thunk of VoiceSelectionAction.selectVoiceAsset(_:disableCompactVoice:requestId:)();
  uint64_t v6 = (void *)VoiceAsset.voice.getter();
  (*(void (**)(uint64_t, void *, void))(a2 + 16))(a2, v6, 0);
  swift_release();

  return swift_release();
}

uint64_t sub_100027498(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __chkstk_darwin(v3);
  type metadata accessor for VoiceSelectionAction();
  static VoiceSelectionAction.defaultSetupAction()();
  dispatch thunk of VoiceSelectionAction.selectVoiceAsset(_:disableCompactVoice:requestId:)();
  uint64_t v4 = self;
  VoiceAsset.path.getter();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 hasPhaticResponsesWithVoicePath:v5];

  swift_release();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v6);
  return swift_release();
}

uint64_t sub_100027784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013A34(a1, (uint64_t)v6, &qword_100039BC0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100013A98((uint64_t)v6, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_10003A0C8;
    uint64_t v9 = unk_10003A0D0;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v10 = UUID.uuidString.getter();
    uint64_t v9 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v12 = sub_10000B864(v10, v9);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void **)(v12 + 40);
  [v13 lock];
  uint64_t v14 = *(void **)(v12 + 32);
  id v15 = v14;
  [v13 unlock];
  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v16 = (void *)TaskOperation.request.getter();
  v18[1] = &OBJC_PROTOCOL___SiriTTSAudibleRequestProtocol;
  if (!swift_dynamicCastObjCProtocolConditional())
  {

LABEL_10:
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, 0);
    return swift_release();
  }

  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 1);
  return swift_release();
}

uint64_t sub_1000279AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AudioPower();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013A34(a1, (uint64_t)v10, &qword_100039BC0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_100013A98((uint64_t)v10, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_10003A0C8;
    uint64_t v13 = unk_10003A0D0;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v14 = UUID.uuidString.getter();
    uint64_t v13 = v15;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  uint64_t v16 = sub_10000B864(v14, v13);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void **)(v16 + 40);
  [v17 lock];
  uint64_t v18 = *(void **)(v16 + 32);
  id v19 = v18;
  [v17 unlock];
  if (v18)
  {
    if (TaskOperation.audioHandler.getter())
    {
      AudioHandler.audioPower.getter();
      AudioPower.averagePower.getter();
      float v21 = v20;
      AudioPower.peakPower.getter();
      (*(void (**)(uint64_t, float, float))(a2 + 16))(a2, v21, v22);
      swift_release();
      swift_release();

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  static AudioPower.silenceAudioPower.getter();
  float v25 = v24;
  static AudioPower.silenceAudioPower.getter();
  (*(void (**)(uint64_t, float, float))(a2 + 16))(a2, v25, v26);
  return swift_release();
}

void sub_100027C9C(uint64_t a1, uint64_t a2, Swift::Float a3, Swift::Double a4)
{
  uint64_t v48 = a2;
  uint64_t v46 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v7 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TTSError();
  uint64_t v47 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v45 - v14;
  uint64_t v16 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013A34(a1, (uint64_t)v18, &qword_100039BC0);
  uint64_t v19 = type metadata accessor for UUID();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_100013A98((uint64_t)v18, &qword_100039BC0);
    if (qword_100039540 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_10003A0C8;
    uint64_t v21 = unk_10003A0D0;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v22 = UUID.uuidString.getter();
    uint64_t v21 = v23;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);
  }
  uint64_t v24 = v10;
  uint64_t v25 = sub_10000B864(v22, v21);
  swift_bridgeObjectRelease();
  float v26 = *(void **)(v25 + 40);
  [v26 lock];
  uint64_t v27 = *(void **)(v25 + 32);
  id v28 = v27;
  [v26 unlock];
  if (!v27)
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for TTSError.TTSErrorCode.unknown(_:), v46);
    TTSError.init(code:description:)();
    TTSError.nsError()(v35);
    uint64_t v37 = v36;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v24);
    uint64_t v38 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v38);
    swift_release();
LABEL_13:

    return;
  }
  if (!TaskOperation.audioHandler.getter())
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for TTSError.TTSErrorCode.unknown(_:), v46);
    TTSError.init(code:description:)();
    TTSError.nsError()(v39);
    uint64_t v37 = v40;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v24);
    uint64_t v38 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v38);
    swift_release();

    goto LABEL_13;
  }
  AudioHandler.adjust(volume:rampTime:)(a3, a4);
  if (v29)
  {
    uint64_t v49 = v29;
    swift_errorRetain();
    sub_100006560(&qword_100039E40);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      uint64_t v30 = v47;
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v15, v13, v24);
      TTSError.nsError()(v31);
      uint64_t v33 = v32;
      uint64_t v34 = (void *)_convertErrorToNSError(_:)();
      (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v34);

      swift_release();
      swift_release();

      (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v24);
      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for TTSError.TTSErrorCode.unknown(_:), v46);
    swift_getErrorValue();
    Error.localizedDescription.getter();
    TTSError.init(code:description:)();
    TTSError.nsError()(v41);
    uint64_t v43 = v42;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v24);
    uint64_t v44 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v44);

    swift_errorRelease();
  }
  else
  {
    (*(void (**)(uint64_t, void))(v48 + 16))(v48, 0);
  }
  swift_release();

  swift_release();
}

void sub_1000283D4(void *a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v3 = type metadata accessor for TTSError.TTSErrorCode();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v28 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TTSError();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  type metadata accessor for VoiceSelectionAction();
  static VoiceSelectionAction.defaultSetupAction()();
  uint64_t v11 = dispatch thunk of VoiceSelectionAction.selectVoiceAsset(_:disableCompactVoice:requestId:)();
  uint64_t v26 = v6;
  uint64_t v12 = sub_10001EABC((uint64_t)&off_100035568);
  uint64_t v27 = v11;
  uint64_t v13 = VoiceAsset.voice.getter();
  uint64_t v14 = dispatch thunk of SynthesisVoice.type.getter();

  LOBYTE(v13) = sub_100014734(v14, v12);
  swift_bridgeObjectRelease();
  if (v13)
  {
    type metadata accessor for NeuralUtils();
    VoiceAsset.path.getter();
    char v15 = static NeuralUtils.isANEModelCompiled(voicePath:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, void, void))(v29 + 16))(v29, v15 & 1, 0);
    swift_release();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v28, enum case for TTSError.TTSErrorCode.unknown(_:), v3);
    unint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
    _StringGuts.grow(_:)(48);
    swift_bridgeObjectRelease();
    unint64_t v30 = 0xD00000000000002ELL;
    unint64_t v31 = 0x8000000100030A60;
    id v16 = [a1 description];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    v20._uint64_t countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    TTSError.init(code:description:)();
    TTSError.nsError()(v21);
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v26);
    uint64_t v24 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v24);
    swift_release();
    swift_release();
  }
}

uint64_t sub_1000288C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v11 - v5;
  type metadata accessor for CacheStorage();
  if (static CacheStorage.sharedSynthesisCache.getter())
  {
    dispatch thunk of CacheStorage.reset()();
    static Logger.service.getter();
    uint64_t v7 = Logger.logObject.getter();
    uint64_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v8, "Synthesis Cache Cleared", v9, 2u);
      swift_slowDealloc();
    }

    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return (*(uint64_t (**)(uint64_t, void))(a1 + 16))(a1, 0);
}

unint64_t sub_100028BF0()
{
  unint64_t result = qword_100039E48;
  if (!qword_100039E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039E48);
  }
  return result;
}

void sub_100028C44(uint64_t a1)
{
  sub_10001B29C(a1, *(void *)(v1 + 16));
}

void sub_100028C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10001AF58(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100028C54()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028C8C(uint64_t *a1)
{
  return sub_10001AD70(a1, v1);
}

uint64_t sub_100028C94()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100028CF4()
{
  return sub_10001ADD0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t, uint64_t, void *))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64));
}

void sub_100028D08(uint64_t a1, double a2)
{
  sub_10001ACFC(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100028D10()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028D20(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = v2;
  return result;
}

uint64_t sub_100028D60()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100028DB0()
{
  uint64_t v1 = *(uint64_t (**)(void, double))(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  [*(id *)(v0 + 16) removeObserver:*(void *)(v0 + 24)];
  swift_beginAccess();
  return v1(0, *(double *)(v2 + 16));
}

void sub_100028E20(uint64_t a1)
{
  sub_100019EA0(a1, *(void *)(v1 + 16));
}

uint64_t sub_100028E28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100028E70()
{
  return sub_1000291DC(73);
}

uint64_t sub_100028E78()
{
  return sub_10001ABF4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
}

uint64_t sub_100028E90()
{
  return _swift_deallocObject(v0, 24, 7);
}

Swift::Int sub_100028EC8()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t type metadata accessor for WorkflowFactory.TTSErrorHandler(uint64_t a1)
{
  return sub_100006938(a1, (uint64_t *)&unk_100039FA0);
}

uint64_t sub_100028F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100028F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100028FD4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100029038(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WorkflowFactory.TTSErrorHandler(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100029094(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000290D8()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 81, 7);
}

uint64_t sub_100029138()
{
  return sub_10001AA9C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(void))(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
}

uint64_t sub_100029170(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000291D4()
{
  return sub_1000291DC(64);
}

uint64_t sub_1000291DC(uint64_t a1)
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_100029240()
{
  return sub_10001A9C8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_100029250()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002928C()
{
  swift_release();

  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000292D4()
{
  return _swift_deallocObject(v0, 32, 7);
}

ValueMetadata *type metadata accessor for WorkflowFactory()
{
  return &type metadata for WorkflowFactory;
}

uint64_t *sub_100029324(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100006560(&qword_100039E10);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000293F8(uint64_t a1)
{
  uint64_t v2 = sub_100006560(&qword_100039E10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100029470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006560(&qword_100039E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000294F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006560(&qword_100039E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100029584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006560(&qword_100039E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100029604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006560(&qword_100039E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002968C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000296A0);
}

uint64_t sub_1000296A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006560(&qword_100039E10);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100029764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100029778);
}

uint64_t sub_100029778(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100006560(&qword_100039E10);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_100029838()
{
  sub_1000298D0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000298D0()
{
  if (!qword_100039FB0)
  {
    type metadata accessor for WorkflowNode();
    sub_100028E28(&qword_100039E20, (void (*)(uint64_t))&type metadata accessor for WorkflowNode);
    unint64_t v0 = type metadata accessor for DirectedAcyclicGraph();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100039FB0);
    }
  }
}

void *Activity.neuralCompiling.unsafeMutableAddressor()
{
  return &static Activity.neuralCompiling;
}

Swift::Void __swiftcall Activity.registerOneOff()()
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  unint64_t v6 = v1;
  uint64_t v7 = v0;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = 0x5F66664F656E6F5FLL;
  unint64_t v36 = 0xE800000000000000;
  UUID.init()();
  uint64_t v15 = UUID.uuidString.getter();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v18._uint64_t countAndFlagsBits = v15;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  uint64_t v19 = v35;
  Swift::String v20 = (void *)v36;
  uint64_t v35 = v7;
  unint64_t v36 = v6;
  swift_bridgeObjectRetain();
  v21._uint64_t countAndFlagsBits = v19;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  uint64_t v23 = v35;
  unint64_t v22 = v36;
  uint64_t v35 = 0;
  LOWORD(v36) = 512;
  uint64_t v37 = 0;
  char v38 = 1;
  uint64_t v39 = XPC_ACTIVITY_PRIORITY_UTILITY;
  uint64_t v40 = 0;
  char v41 = 1;
  __int16 v42 = 514;
  uint64_t v24 = (void *)sub_100029DF4();
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = v23;
  v25[3] = v22;
  v25[4] = v7;
  v25[5] = v6;
  v25[6] = v5;
  v25[7] = v4;
  aBlock[4] = (uint64_t)sub_10002C6C8;
  void aBlock[5] = (uint64_t)v25;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10002ACC0;
  Swift::OpaquePointer aBlock[3] = (uint64_t)&unk_100035FE8;
  uint64_t v26 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  uint64_t v27 = String.utf8CString.getter();
  xpc_activity_register((const char *)(v27 + 32), v24, v26);
  swift_release();
  _Block_release(v26);
  static Logger.service.getter();
  swift_bridgeObjectRetain();
  id v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    unint64_t v30 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v30 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_100007B04(v23, v22, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Registered one-off activity %{public}s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v32);
}

uint64_t sub_100029DF4()
{
  unint64_t v1 = sub_10000B764(&_swiftEmptyArrayStorage);
  sub_10002CDC4(v0, (uint64_t)v31, &qword_10003A058);
  sub_10002CDC4((uint64_t)v31, (uint64_t)&value, &qword_10003A058);
  if ((v33 & 1) == 0)
  {
    xpc_object_t v2 = xpc_int64_create(value);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v38 = v1;
    sub_10000B0A4((uint64_t)v2, (uint64_t)XPC_ACTIVITY_DELAY, isUniquelyReferenced_nonNull_native);
    unint64_t v1 = v38;
    swift_bridgeObjectRelease();
  }
  sub_10002CDC4(v0 + 9, (uint64_t)&v30, &qword_10003A060);
  sub_10002CDC4((uint64_t)&v30, (uint64_t)&v34, &qword_10003A060);
  if (v34 != 2)
  {
    xpc_object_t v4 = xpc_BOOL_create(v34 & 1);
    char v5 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v38 = v1;
    sub_10000B0A4((uint64_t)v4, (uint64_t)XPC_ACTIVITY_REPEATING, v5);
    unint64_t v1 = v38;
    swift_bridgeObjectRelease();
  }
  sub_10002CDC4(v0 + 16, (uint64_t)v29, &qword_10003A058);
  sub_10002CDC4((uint64_t)v29, (uint64_t)&v35, &qword_10003A058);
  if ((v36 & 1) == 0)
  {
    xpc_object_t v6 = xpc_int64_create(v35);
    char v7 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v38 = v1;
    sub_10000B0A4((uint64_t)v6, (uint64_t)XPC_ACTIVITY_GRACE_PERIOD, v7);
    unint64_t v1 = v38;
    swift_bridgeObjectRelease();
  }
  sub_10002CDC4(v0 + 32, (uint64_t)v28, &qword_10003A068);
  sub_10002CDC4((uint64_t)v28, (uint64_t)&v37, &qword_10003A068);
  if (v37)
  {
    xpc_object_t v8 = xpc_string_create(v37);
    char v9 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v38 = v1;
    sub_10000B0A4((uint64_t)v8, (uint64_t)XPC_ACTIVITY_PRIORITY, v9);
    unint64_t v1 = v38;
    swift_bridgeObjectRelease();
  }
  sub_10002CDC4(v0 + 40, (uint64_t)v27, &qword_10003A058);
  uint64_t result = sub_10002CDC4((uint64_t)v27, (uint64_t)&v38, &qword_10003A058);
  if ((v39 & 1) == 0)
  {
    uint64_t v11 = XPC_ACTIVITY_RANDOM_INITIAL_DELAY;
    if (!XPC_ACTIVITY_RANDOM_INITIAL_DELAY)
    {
      __break(1u);
      goto LABEL_20;
    }
    xpc_object_t v12 = xpc_int64_create(v38);
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_10000B0A4((uint64_t)v12, v11, v13);
    swift_bridgeObjectRelease();
  }
  sub_10002CDC4(v0 + 49, (uint64_t)&v26, &qword_10003A060);
  uint64_t result = sub_10002CDC4((uint64_t)&v26, (uint64_t)&v40, &qword_10003A060);
  if (v40 != 2)
  {
    uint64_t v14 = XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY;
    if (XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY)
    {
      xpc_object_t v15 = xpc_BOOL_create(v40 & 1);
      char v16 = swift_isUniquelyReferenced_nonNull_native();
      sub_10000B0A4((uint64_t)v15, v14, v16);
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_15:
  sub_10002CDC4(v0 + 50, (uint64_t)&v25, &qword_10003A060);
  uint64_t result = sub_10002CDC4((uint64_t)&v25, (uint64_t)&v41, &qword_10003A060);
  if (v41 == 2)
  {
LABEL_18:
    uint64_t v20 = swift_bridgeObjectRetain();
    Swift::String v21 = (const char *const *)sub_10002C948(v20, &qword_10003A078, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))sub_10002CC30);
    swift_bridgeObjectRelease();
    uint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v23 = (xpc_object_t *)sub_10002C948(v22, &qword_10003A070, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))sub_10002CA34);
    swift_bridgeObjectRelease();
    xpc_object_t v24 = xpc_dictionary_create(v21 + 4, v23 + 4, *(void *)(v1 + 16));
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return (uint64_t)v24;
  }
  uint64_t v17 = XPC_ACTIVITY_POST_INSTALL;
  if (XPC_ACTIVITY_POST_INSTALL)
  {
    xpc_object_t v18 = xpc_BOOL_create(v41 & 1);
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    sub_10000B0A4((uint64_t)v18, v17, v19);
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

Swift::Void __swiftcall Activity.checkIn()()
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  unint64_t v6 = v1;
  uint64_t v7 = v0;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  xpc_object_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v20 = v5;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v19 = v8;
    xpc_object_t v15 = (uint8_t *)v14;
    aBlock[0] = swift_slowAlloc();
    uint64_t v21 = v4;
    *(_DWORD *)xpc_object_t v15 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_100007B04(v7, v6, aBlock);
    uint64_t v5 = v20;
    uint64_t v4 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Checking in activity %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  char v16 = (void *)swift_allocObject();
  v16[2] = v7;
  v16[3] = v6;
  v16[4] = v5;
  v16[5] = v4;
  aBlock[4] = (uint64_t)sub_10002C758;
  void aBlock[5] = (uint64_t)v16;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10002ACC0;
  Swift::OpaquePointer aBlock[3] = (uint64_t)&unk_100036038;
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  uint64_t v18 = String.utf8CString.getter();
  xpc_activity_register((const char *)(v18 + 32), XPC_ACTIVITY_CHECK_IN, v17);
  swift_release();
  _Block_release(v17);
}

uint64_t sub_10002A548(_xpc_activity_s *a1, uint64_t a2, unint64_t a3, void (*a4)(_xpc_activity_s *), uint64_t a5)
{
  uint64_t v50 = a2;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v51 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  xpc_object_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  xpc_object_t v15 = (char *)&v46 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v46 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v46 - v19;
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state == 2)
  {
    uint64_t v47 = a4;
    static Logger.service.getter();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    os_log_type_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.default.getter();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v49 = v9;
    if (v31)
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v48 = a5;
      char v33 = (uint8_t *)v32;
      uint64_t v53 = swift_slowAlloc();
      *(_DWORD *)char v33 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_100007B04(v50, a3, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Running activity %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      uint64_t v9 = v49;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
    char v40 = *(void (**)(char *, uint64_t))(v51 + 8);
    v40(v18, v9);
    v47(a1);
    static Logger.service.getter();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    char v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_100007B04(v50, a3, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Finished activity %{public}s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v44 = v15;
      uint64_t v45 = v49;
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      uint64_t v44 = v15;
      uint64_t v45 = v9;
    }
    return ((uint64_t (*)(char *, uint64_t))v40)(v44, v45);
  }
  else
  {
    xpc_activity_state_t v22 = state;
    if (state)
    {
      static Logger.service.getter();
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      char v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        uint64_t v48 = a5;
        uint64_t v37 = v36;
        uint64_t v38 = swift_slowAlloc();
        uint64_t v52 = v22;
        uint64_t v53 = v38;
        *(_DWORD *)uint64_t v37 = 134218242;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v37 + 12) = 2082;
        uint64_t v39 = v51;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_100007B04(v50, a3, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Unexpected activity state %ld for %{public}s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v12, v9);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v12, v9);
      }
    }
    else
    {
      static Logger.service.getter();
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      uint64_t v23 = Logger.logObject.getter();
      uint64_t v24 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v23, (os_log_type_t)v24))
      {
        uint64_t v25 = v51;
        char v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v49 = v9;
        uint64_t v53 = v27;
        *(_DWORD *)char v26 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_100007B04(v50, a3, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v24, "Checked in activity %{public}s", v26, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v20, v49);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v20, v9);
      }
    }
  }
}

uint64_t sub_10002ACC0(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_10002AD20(_xpc_activity_s *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void), uint64_t a7)
{
  uint64_t v43 = a2;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  xpc_object_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v38 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v38 - v19;
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state == 2)
  {
    uint64_t v41 = a7;
    static Logger.service.getter();
    swift_bridgeObjectRetain_n();
    xpc_activity_state_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v42 = v12;
    if (v24)
    {
      uint64_t v40 = v11;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v39 = a6;
      char v26 = (uint8_t *)v25;
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)char v26 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_100007B04(v43, a3, &v45);
      uint64_t v11 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Running activity %{public}s", v26, 0xCu);
      swift_arrayDestroy();
      uint64_t v12 = v42;
      swift_slowDealloc();
      a6 = v39;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    char v34 = *(void (**)(char *, uint64_t))(v12 + 8);
    v34(v20, v11);
    a6(a1);
    static Logger.service.getter();
    swift_bridgeObjectRetain_n();
    os_log_type_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_100007B04(v43, a3, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Finished activity %{public}s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return ((uint64_t (*)(char *, uint64_t))v34)(v18, v11);
  }
  else
  {
    xpc_activity_state_t v27 = state;
    static Logger.service.getter();
    swift_bridgeObjectRetain_n();
    id v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = v12;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v44 = v27;
      uint64_t v45 = v32;
      *(_DWORD *)uint64_t v31 = 134218242;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_100007B04(v43, a3, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Unexpected activity state %ld for %{public}s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v15, v11);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }
  }
}

uint64_t sub_10002B280()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  sub_1000079C8();
  static DispatchQoS.utility.getter();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_1000084DC();
  sub_100006560((uint64_t *)&unk_10003A080);
  sub_100008534();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  qword_10003A108 = result;
  return result;
}

uint64_t sub_10002B480()
{
  if (qword_100039560 != -1) {
    swift_once();
  }
  return sub_10000E4A0();
}

void *Activity.voiceUpdateActivity.unsafeMutableAddressor()
{
  return &static Activity.voiceUpdateActivity;
}

unint64_t static Activity.voiceUpdateActivity.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_10002B518()
{
  uint64_t v0 = sub_100006560((uint64_t *)&unk_10003A090);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v30 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v28 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InternalSettings();
  static InternalSettings.shared.getter();
  char v15 = dispatch thunk of InternalSettings.disableAssetCleaning.getter();
  swift_release();
  if (v15)
  {
    static Logger.service.getter();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = v3;
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "InternalSettings disableAssetCleaning is enabled, will skip asset cleanUp.", v18, 2u);
      uint64_t v3 = v27;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    if (qword_100039560 != -1) {
      swift_once();
    }
    sub_100010224();
  }
  uint64_t v19 = v29;
  type metadata accessor for CacheStorage();
  if (static CacheStorage.sharedSynthesisCache.getter())
  {
    dispatch thunk of CacheStorage.trim(LRULimit:)();
    swift_release();
  }
  if (static CacheStorage.sharedModelCache.getter())
  {
    static Date.now.getter();
    static Date.- infix(_:_:)();
    uint64_t v20 = v3;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v19 + 8);
    v21(v8, v5);
    dispatch thunk of CacheStorage.trim(beforeDate:)();
    swift_release();
    v21(v10, v5);
    uint64_t v3 = v20;
  }
  type metadata accessor for AudioDumpAction();
  static AudioDumpAction.DiagnosticsDir.getter();
  uint64_t v22 = v30;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v2, 1, v3) == 1) {
    return sub_1000081C4((uint64_t)v2);
  }
  BOOL v24 = v28;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v2, v3);
  id v25 = [self defaultManager];
  static Date.now.getter();
  static Date.- infix(_:_:)();
  char v26 = *(void (**)(char *, uint64_t))(v19 + 8);
  v26(v8, v5);
  NSFileManager.removeItems(inDirectory:olderThan:)();

  v26(v10, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v3);
}

void *Activity.cleanUpActivity.unsafeMutableAddressor()
{
  return &static Activity.cleanUpActivity;
}

unint64_t static Activity.cleanUpActivity.getter()
{
  return 0xD00000000000001ALL;
}

void *Activity.weeklyVoiceUpdateActivity.unsafeMutableAddressor()
{
  return &static Activity.weeklyVoiceUpdateActivity;
}

unint64_t static Activity.weeklyVoiceUpdateActivity.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_10002BA60(uint64_t a1)
{
  type metadata accessor for NeuralUtils();
  uint64_t result = static NeuralUtils.isANECompilationPlatform.getter();
  if (result)
  {
    if (qword_100039568 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_10003A108;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a1;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_10002CE60;
    *(void *)(v5 + 24) = v4;
    v8[4] = sub_10000BD9C;
    v8[5] = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    _OWORD v8[2] = sub_100009FAC;
    v8[3] = &unk_100036130;
    uint64_t v6 = _Block_copy(v8);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

void sub_10002BBFC(_xpc_activity_s *a1)
{
  xpc_activity_t v61 = a1;
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v60 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v68 = (char *)&v56 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v62 = (char *)&v56 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v56 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v56 - v12;
  id v14 = objc_allocWithZone((Class)type metadata accessor for SynthesisVoice());
  char v15 = (void *)SynthesisVoice.init(language:name:)();
  dispatch thunk of SynthesisVoice.type.setter();
  unint64_t v73 = (unint64_t)&_swiftEmptyArrayStorage;
  type metadata accessor for InternalSettings();
  static InternalSettings.shared.getter();
  char v16 = dispatch thunk of InternalSettings.enableLocalVoices.getter();
  swift_release();
  if (v16)
  {
    type metadata accessor for LocalAssetProvider();
    swift_allocObject();
    LocalAssetProvider.init()();
    id v17 = v15;
    unint64_t v18 = dispatch thunk of LocalAssetProvider.listVoiceAssets(_:)();
    swift_release();

    sub_10000A4E8(v18);
  }
  type metadata accessor for TrialAssetProvider();
  swift_allocObject();
  TrialAssetProvider.init()();
  id v19 = v15;
  unint64_t v20 = dispatch thunk of TrialAssetProvider.listVoiceAssets(_:)();
  swift_release();
  id v58 = v19;

  sub_10000A4E8(v20);
  unint64_t v21 = v73;
  uint64_t v22 = v62;
  if (v73 >> 62)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v23 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v23)
    {
LABEL_5:
      uint64_t v57 = v11;
      uint64_t v24 = type metadata accessor for NeuralUtils();
      uint64_t v69 = 0;
      uint64_t v70 = v24;
      uint64_t v11 = 0;
      uint64_t v71 = (void (**)(char *, uint64_t))(v2 + 8);
      *(void *)&long long v25 = 136446210;
      long long v64 = v25;
      uint64_t v59 = (char *)&type metadata for Any + 8;
      uint64_t v65 = v1;
      uint64_t v66 = v23;
      uint64_t v63 = v13;
      unint64_t v67 = v21;
      while (1)
      {
        char v26 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
          goto LABEL_32;
        }
        uint64_t v2 = *(void *)(v21 + 8 * (void)v11 + 32);
        swift_retain();
        VoiceAsset.path.getter();
        char v27 = static NeuralUtils.isANEModelCompiled(voicePath:)();
        swift_bridgeObjectRelease();
        if (v27)
        {
          static Logger.service.getter();
          swift_retain_n();
          id v28 = Logger.logObject.getter();
          os_log_type_t v29 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v28, v29))
          {
            uint64_t v30 = swift_slowAlloc();
            v72[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v30 = v64;
            uint64_t v31 = VoiceAsset.path.getter();
            *(void *)(v30 + 4) = sub_100007B04(v31, v32, v72);
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "Neural voice is already compiled: '%{public}s'", (uint8_t *)v30, 0xCu);
            swift_arrayDestroy();
            uint64_t v13 = v63;
            swift_slowDealloc();
            uint64_t v1 = v65;
            swift_slowDealloc();
            swift_release();
          }
          else
          {

            swift_release_n();
          }
          (*v71)(v13, v1);
        }
        else
        {
          if (xpc_activity_should_defer(v61))
          {
            swift_bridgeObjectRelease();
            uint64_t v52 = v57;
            static Logger.service.getter();
            uint64_t v53 = Logger.logObject.getter();
            os_log_type_t v54 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v53, v54))
            {
              unint64_t v55 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v55 = 0;
              _os_log_impl((void *)&_mh_execute_header, v53, v54, "com.apple.sirittsd.neuralCompiling is requested to be deferred.", v55, 2u);
              swift_slowDealloc();
            }

            (*v71)(v52, v1);
            xpc_activity_set_state(v61, 3);
            swift_release();

            return;
          }
          static Logger.service.getter();
          swift_retain_n();
          char v33 = Logger.logObject.getter();
          os_log_type_t v34 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v33, v34))
          {
            uint64_t v35 = swift_slowAlloc();
            v72[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v35 = v64;
            uint64_t v36 = VoiceAsset.path.getter();
            *(void *)(v35 + 4) = sub_100007B04(v36, v37, v72);
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "Triggered compiling neural voice '%{public}s'", (uint8_t *)v35, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v1 = v65;
            swift_slowDealloc();
          }
          else
          {

            swift_release_n();
          }
          uint64_t v38 = *v71;
          (*v71)(v22, v1);
          uint64_t v39 = v69;
          VoiceAsset.path.getter();
          static NeuralUtils.compileANEModel(voicePath:)();
          if (v39)
          {
            swift_bridgeObjectRelease();
            uint64_t v40 = v60;
            static Logger.service.getter();
            swift_retain_n();
            uint64_t v41 = Logger.logObject.getter();
            os_log_type_t v42 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v41, v42))
            {
              uint64_t v43 = swift_slowAlloc();
              uint64_t v44 = swift_slowAlloc();
              uint64_t v69 = v39;
              v72[0] = v44;
              *(_DWORD *)uint64_t v43 = v64;
              uint64_t v45 = VoiceAsset.path.getter();
              *(void *)(v43 + 4) = sub_100007B04(v45, v46, v72);
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v41, v42, "Error during compiling neural voice: %{public}s", (uint8_t *)v43, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              uint64_t v1 = v65;
              swift_slowDealloc();
              swift_errorRelease();
            }
            else
            {
              swift_errorRelease();

              swift_release_n();
            }
            v38(v40, v1);
          }
          else
          {
            swift_bridgeObjectRelease();
            notify_post("com.apple.voiceservices.notification.voice-update");
          }
          uint64_t v22 = v62;
          uint64_t v69 = 0;
          static Logger.service.getter();
          swift_retain_n();
          uint64_t v47 = Logger.logObject.getter();
          os_log_type_t v48 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v47, v48))
          {
            uint64_t v49 = swift_slowAlloc();
            v72[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v49 = v64;
            uint64_t v50 = VoiceAsset.path.getter();
            *(void *)(v49 + 4) = sub_100007B04(v50, v51, v72);
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "Neural voice finished compiling '%{public}s'", (uint8_t *)v49, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v1 = v65;
            swift_slowDealloc();
            swift_release();
          }
          else
          {

            swift_release_n();
          }
          v38(v68, v1);
          uint64_t v13 = v63;
        }
        unint64_t v21 = v67;
        ++v11;
        if (v26 == (char *)v66)
        {

          swift_bridgeObjectRelease();
          return;
        }
      }
    }
  }

  swift_bridgeObjectRelease();
}

unint64_t static Activity.neuralCompiling.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_10002C5B8()
{
  if (qword_100039560 != -1) {
    swift_once();
  }
  dispatch thunk of TrialAssetProvider.downloadNamespace()();
  sub_10000E4A0();
  type metadata accessor for CacheStorage();
  uint64_t result = static CacheStorage.sharedModelCache.getter();
  if (result)
  {
    dispatch thunk of CacheStorage.reset()();
    return swift_release();
  }
  return result;
}

uint64_t sub_10002C680()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002C6C8(_xpc_activity_s *a1)
{
  return sub_10002AD20(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void (**)(void))(v1 + 48), *(void *)(v1 + 56));
}

void *Activity.postInstall.unsafeMutableAddressor()
{
  return &static Activity.postInstall;
}

unint64_t static Activity.postInstall.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_10002C718()
{
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002C758(_xpc_activity_s *a1)
{
  return sub_10002A548(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(_xpc_activity_s *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t destroy for Activity()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for Activity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for Activity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for Activity(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Activity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Activity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Activity(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Activity()
{
  return &type metadata for Activity;
}

void *sub_10002C948(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t *, void *, uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006560(a2);
  uint64_t v6 = (void *)swift_allocObject();
  int64_t v7 = j__malloc_size(v6);
  uint64_t v8 = v7 - 32;
  if (v7 < 32) {
    uint64_t v8 = v7 - 25;
  }
  void v6[2] = v3;
  v6[3] = 2 * (v8 >> 3);
  uint64_t v9 = a3(&v11, v6 + 4, v3, a1);
  swift_bridgeObjectRetain();
  sub_1000065A4();
  if (v9 != v3)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v6;
}

uint64_t sub_10002CA34(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
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
  uint64_t v11 = a2;
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
    *uint64_t v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    __n128 result = swift_unknownObjectRetain();
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

void *sub_10002CC30(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *__n128 result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10002CDC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006560(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002CE28()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002CE60()
{
  sub_10002BBFC(*(_xpc_activity_s **)(v0 + 16));
}

uint64_t sub_10002CE68()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002CE88()
{
  uint64_t v0 = os_log_create("com.apple.siri.tts", "sandbox");
  bzero(v3, 0x400uLL);
  if ((!_set_user_dir_suffix() || !confstr(65537, v3, 0x400uLL))
    && os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = *__error();
    v2[0] = 67109120;
    v2[1] = v1;
    _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v2, 8u);
  }
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Date.- infix(_:_:)()
{
  return static Date.- infix(_:_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t dispatch thunk of static CKKnowledgeStore.userDefaultsKnowledgeStore()()
{
  return dispatch thunk of static CKKnowledgeStore.userDefaultsKnowledgeStore()();
}

uint64_t type metadata accessor for CKKnowledgeStore()
{
  return type metadata accessor for CKKnowledgeStore();
}

uint64_t SiriAnalyticsHandler.init(notificationCenter:service:powerLogger:logSynthesisEvents:)()
{
  return SiriAnalyticsHandler.init(notificationCenter:service:powerLogger:logSynthesisEvents:)();
}

uint64_t type metadata accessor for SiriAnalyticsHandler()
{
  return type metadata accessor for SiriAnalyticsHandler();
}

uint64_t AudioPower.peakPower.getter()
{
  return AudioPower.peakPower.getter();
}

uint64_t AudioPower.averagePower.getter()
{
  return AudioPower.averagePower.getter();
}

uint64_t static AudioPower.silenceAudioPower.getter()
{
  return static AudioPower.silenceAudioPower.getter();
}

uint64_t type metadata accessor for AudioPower()
{
  return type metadata accessor for AudioPower();
}

uint64_t dispatch thunk of ObjectPool.find<A>()()
{
  return dispatch thunk of ObjectPool.find<A>()();
}

uint64_t dispatch thunk of ObjectPool.inject<A>(object:)()
{
  return dispatch thunk of ObjectPool.inject<A>(object:)();
}

uint64_t ObjectPool.init()()
{
  return ObjectPool.init()();
}

uint64_t type metadata accessor for ObjectPool()
{
  return type metadata accessor for ObjectPool();
}

uint64_t VoiceAsset.path.getter()
{
  return VoiceAsset.path.getter();
}

uint64_t VoiceAsset.voice.getter()
{
  return VoiceAsset.voice.getter();
}

uint64_t type metadata accessor for VoiceAsset()
{
  return type metadata accessor for VoiceAsset();
}

uint64_t dispatch thunk of BaseRequest.accessoryId.getter()
{
  return dispatch thunk of BaseRequest.accessoryId.getter();
}

uint64_t dispatch thunk of BaseRequest.sandboxToken.getter()
{
  return dispatch thunk of BaseRequest.sandboxToken.getter();
}

uint64_t dispatch thunk of BaseRequest.clientBundleId.getter()
{
  return dispatch thunk of BaseRequest.clientBundleId.getter();
}

uint64_t dispatch thunk of BaseRequest.requestCreatedTime.getter()
{
  return dispatch thunk of BaseRequest.requestCreatedTime.getter();
}

uint64_t static NeuralUtils.isNeuralVoiceReady(voicePath:)()
{
  return static NeuralUtils.isNeuralVoiceReady(voicePath:)();
}

uint64_t static NeuralUtils.isH12Platform.getter()
{
  return static NeuralUtils.isH12Platform.getter();
}

uint64_t static NeuralUtils.compileANEModel(voicePath:)()
{
  return static NeuralUtils.compileANEModel(voicePath:)();
}

uint64_t static NeuralUtils.isANEModelCompiled(voicePath:)()
{
  return static NeuralUtils.isANEModelCompiled(voicePath:)();
}

uint64_t static NeuralUtils.isANECompilationPlatform.getter()
{
  return static NeuralUtils.isANECompilationPlatform.getter();
}

uint64_t static NeuralUtils.shared.getter()
{
  return static NeuralUtils.shared.getter();
}

uint64_t type metadata accessor for NeuralUtils()
{
  return type metadata accessor for NeuralUtils();
}

uint64_t dispatch thunk of Preferences.clearSubscriptions(accessoryId:)()
{
  return dispatch thunk of Preferences.clearSubscriptions(accessoryId:)();
}

uint64_t dispatch thunk of Preferences.voiceSubscriptions.getter()
{
  return dispatch thunk of Preferences.voiceSubscriptions.getter();
}

uint64_t dispatch thunk of Preferences.voiceSubscriptions.setter()
{
  return dispatch thunk of Preferences.voiceSubscriptions.setter();
}

uint64_t dispatch thunk of Preferences.previousVoiceSubscriptions.getter()
{
  return dispatch thunk of Preferences.previousVoiceSubscriptions.getter();
}

uint64_t dispatch thunk of Preferences.previousVoiceSubscriptions.setter()
{
  return dispatch thunk of Preferences.previousVoiceSubscriptions.setter();
}

uint64_t static Preferences.shared.getter()
{
  return static Preferences.shared.getter();
}

uint64_t type metadata accessor for Preferences()
{
  return type metadata accessor for Preferences();
}

uint64_t AudioHandler.audioPower.getter()
{
  return AudioHandler.audioPower.getter();
}

uint64_t AudioHandler.init(notificationCenter:)()
{
  return AudioHandler.init(notificationCenter:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioHandler.adjust(volume:rampTime:)(Swift::Float volume, Swift::Double rampTime)
{
}

uint64_t type metadata accessor for AudioHandler()
{
  return type metadata accessor for AudioHandler();
}

uint64_t static CacheStorage.sharedModelCache.getter()
{
  return static CacheStorage.sharedModelCache.getter();
}

uint64_t static CacheStorage.sharedSynthesisCache.getter()
{
  return static CacheStorage.sharedSynthesisCache.getter();
}

uint64_t dispatch thunk of CacheStorage.trim(beforeDate:)()
{
  return dispatch thunk of CacheStorage.trim(beforeDate:)();
}

uint64_t dispatch thunk of CacheStorage.trim(LRULimit:)()
{
  return dispatch thunk of CacheStorage.trim(LRULimit:)();
}

uint64_t dispatch thunk of CacheStorage.reset()()
{
  return dispatch thunk of CacheStorage.reset()();
}

uint64_t type metadata accessor for CacheStorage()
{
  return type metadata accessor for CacheStorage();
}

uint64_t Entitlements.init(connection:)()
{
  return Entitlements.init(connection:)();
}

uint64_t type metadata accessor for Entitlements()
{
  return type metadata accessor for Entitlements();
}

uint64_t static OspreyClient.shared.getter()
{
  return static OspreyClient.shared.getter();
}

uint64_t type metadata accessor for OspreyClient()
{
  return type metadata accessor for OspreyClient();
}

uint64_t WorkflowNode.init(action:)()
{
  return WorkflowNode.init(action:)();
}

uint64_t WorkflowNode.init(condition:)()
{
  return WorkflowNode.init(condition:)();
}

uint64_t type metadata accessor for WorkflowNode()
{
  return type metadata accessor for WorkflowNode();
}

uint64_t dispatch thunk of DaemonSession.prewarm(request:didFinish:)()
{
  return dispatch thunk of DaemonSession.prewarm(request:didFinish:)();
}

uint64_t type metadata accessor for DaemonSession()
{
  return type metadata accessor for DaemonSession();
}

uint64_t static MobileGestalt.isWatch.getter()
{
  return static MobileGestalt.isWatch.getter();
}

uint64_t ResourceAsset.resource.getter()
{
  return ResourceAsset.resource.getter();
}

uint64_t type metadata accessor for SpeechRequest()
{
  return type metadata accessor for SpeechRequest();
}

uint64_t TaskOperation.audioHandler.getter()
{
  return TaskOperation.audioHandler.getter();
}

uint64_t dispatch thunk of TaskOperation.error.getter()
{
  return dispatch thunk of TaskOperation.error.getter();
}

uint64_t TaskOperation.queue.getter()
{
  return TaskOperation.queue.getter();
}

uint64_t TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)()
{
  return TaskOperation.init(request:workflow:delegate:audioHandler:notification:queue:)();
}

uint64_t TaskOperation.request.getter()
{
  return TaskOperation.request.getter();
}

uint64_t TaskOperation.delegate.getter()
{
  return TaskOperation.delegate.getter();
}

uint64_t type metadata accessor for TaskOperation()
{
  return type metadata accessor for TaskOperation();
}

uint64_t DownloadOption.init(allowExpensiveData:allowDiscretionary:)()
{
  return DownloadOption.init(allowExpensiveData:allowDiscretionary:)();
}

uint64_t type metadata accessor for DownloadOption()
{
  return type metadata accessor for DownloadOption();
}

uint64_t SynthesisVoice.VoiceType.rawValue.getter()
{
  return SynthesisVoice.VoiceType.rawValue.getter();
}

uint64_t SynthesisVoice.VoiceGender.rawValue.getter()
{
  return SynthesisVoice.VoiceGender.rawValue.getter();
}

uint64_t dispatch thunk of SynthesisVoice.name.getter()
{
  return dispatch thunk of SynthesisVoice.name.getter();
}

uint64_t dispatch thunk of SynthesisVoice.name.setter()
{
  return dispatch thunk of SynthesisVoice.name.setter();
}

uint64_t dispatch thunk of SynthesisVoice.type.getter()
{
  return dispatch thunk of SynthesisVoice.type.getter();
}

uint64_t dispatch thunk of SynthesisVoice.type.setter()
{
  return dispatch thunk of SynthesisVoice.type.setter();
}

uint64_t dispatch thunk of SynthesisVoice.gender.getter()
{
  return dispatch thunk of SynthesisVoice.gender.getter();
}

uint64_t SynthesisVoice.init(language:name:)()
{
  return SynthesisVoice.init(language:name:)();
}

uint64_t dispatch thunk of SynthesisVoice.language.getter()
{
  return dispatch thunk of SynthesisVoice.language.getter();
}

uint64_t SynthesisVoice.Footprint.rawValue.getter()
{
  return SynthesisVoice.Footprint.rawValue.getter();
}

uint64_t dispatch thunk of SynthesisVoice.footprint.getter()
{
  return dispatch thunk of SynthesisVoice.footprint.getter();
}

uint64_t type metadata accessor for SynthesisVoice()
{
  return type metadata accessor for SynthesisVoice();
}

uint64_t dispatch thunk of AudioDumpAction.diagnosticTag.setter()
{
  return dispatch thunk of AudioDumpAction.diagnosticTag.setter();
}

uint64_t static AudioDumpAction.DiagnosticsDir.getter()
{
  return static AudioDumpAction.DiagnosticsDir.getter();
}

uint64_t AudioDumpAction.init(pool:)()
{
  return AudioDumpAction.init(pool:)();
}

uint64_t type metadata accessor for AudioDumpAction()
{
  return type metadata accessor for AudioDumpAction();
}

uint64_t DelegateHandler.init(notificationCenter:delegate:request:)()
{
  return DelegateHandler.init(notificationCenter:delegate:request:)();
}

uint64_t type metadata accessor for DelegateHandler()
{
  return type metadata accessor for DelegateHandler();
}

uint64_t OspreyTTSAction.init(pool:)()
{
  return OspreyTTSAction.init(pool:)();
}

uint64_t type metadata accessor for OspreyTTSAction()
{
  return type metadata accessor for OspreyTTSAction();
}

uint64_t SignpostHandler.init(notificationCenter:)()
{
  return SignpostHandler.init(notificationCenter:)();
}

uint64_t type metadata accessor for SignpostHandler()
{
  return type metadata accessor for SignpostHandler();
}

uint64_t dispatch thunk of InternalSettings.forceServerTTS.getter()
{
  return dispatch thunk of InternalSettings.forceServerTTS.getter();
}

uint64_t dispatch thunk of InternalSettings.disableServerTTS.getter()
{
  return dispatch thunk of InternalSettings.disableServerTTS.getter();
}

uint64_t dispatch thunk of InternalSettings.enableDiagnostic.getter()
{
  return dispatch thunk of InternalSettings.enableDiagnostic.getter();
}

uint64_t dispatch thunk of InternalSettings.enableLocalVoices.getter()
{
  return dispatch thunk of InternalSettings.enableLocalVoices.getter();
}

uint64_t dispatch thunk of InternalSettings.disableAssetCleaning.getter()
{
  return dispatch thunk of InternalSettings.disableAssetCleaning.getter();
}

uint64_t dispatch thunk of InternalSettings.disableInlineStreamTTS.getter()
{
  return dispatch thunk of InternalSettings.disableInlineStreamTTS.getter();
}

uint64_t dispatch thunk of InternalSettings.ignorePowerAndThermalState.getter()
{
  return dispatch thunk of InternalSettings.ignorePowerAndThermalState.getter();
}

uint64_t dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter()
{
  return dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter();
}

uint64_t static InternalSettings.shared.getter()
{
  return static InternalSettings.shared.getter();
}

uint64_t type metadata accessor for InternalSettings()
{
  return type metadata accessor for InternalSettings();
}

uint64_t SynthesisRequest.init(text:voice:)()
{
  return SynthesisRequest.init(text:voice:)();
}

uint64_t type metadata accessor for SynthesisRequest()
{
  return type metadata accessor for SynthesisRequest();
}

uint64_t DiagnosticService.init(notification:)()
{
  return DiagnosticService.init(notification:)();
}

uint64_t type metadata accessor for DiagnosticService()
{
  return type metadata accessor for DiagnosticService();
}

uint64_t HasAudioCondition.init()()
{
  return HasAudioCondition.init()();
}

uint64_t type metadata accessor for HasAudioCondition()
{
  return type metadata accessor for HasAudioCondition();
}

uint64_t PassThroughAction.init()()
{
  return PassThroughAction.init()();
}

uint64_t type metadata accessor for PassThroughAction()
{
  return type metadata accessor for PassThroughAction();
}

uint64_t dispatch thunk of SynthesisResource.language.getter()
{
  return dispatch thunk of SynthesisResource.language.getter();
}

uint64_t CacheReadingAction.init(pool:)()
{
  return CacheReadingAction.init(pool:)();
}

uint64_t type metadata accessor for CacheReadingAction()
{
  return type metadata accessor for CacheReadingAction();
}

uint64_t dispatch thunk of LocalAssetProvider.listVoiceAssets(_:)()
{
  return dispatch thunk of LocalAssetProvider.listVoiceAssets(_:)();
}

uint64_t LocalAssetProvider.init()()
{
  return LocalAssetProvider.init()();
}

uint64_t type metadata accessor for LocalAssetProvider()
{
  return type metadata accessor for LocalAssetProvider();
}

uint64_t OpusEncodingAction.init(pool:)()
{
  return OpusEncodingAction.init(pool:)();
}

uint64_t type metadata accessor for OpusEncodingAction()
{
  return type metadata accessor for OpusEncodingAction();
}

uint64_t dispatch thunk of TrialAssetProvider.listVoices(_:)()
{
  return dispatch thunk of TrialAssetProvider.listVoices(_:)();
}

uint64_t dispatch thunk of TrialAssetProvider.removeVoices(_:immediately:)()
{
  return dispatch thunk of TrialAssetProvider.removeVoices(_:immediately:)();
}

uint64_t dispatch thunk of TrialAssetProvider.downloadVoice(_:option:downloadingAsset:progress:completion:)()
{
  return dispatch thunk of TrialAssetProvider.downloadVoice(_:option:downloadingAsset:progress:completion:)();
}

uint64_t dispatch thunk of TrialAssetProvider.listResources()()
{
  return dispatch thunk of TrialAssetProvider.listResources()();
}

uint64_t dispatch thunk of TrialAssetProvider.removeResource(language:immediately:)()
{
  return dispatch thunk of TrialAssetProvider.removeResource(language:immediately:)();
}

uint64_t dispatch thunk of TrialAssetProvider.listVoiceAssets(_:)()
{
  return dispatch thunk of TrialAssetProvider.listVoiceAssets(_:)();
}

uint64_t dispatch thunk of TrialAssetProvider.downloadResource(language:option:progress:completion:)()
{
  return dispatch thunk of TrialAssetProvider.downloadResource(language:option:progress:completion:)();
}

uint64_t dispatch thunk of TrialAssetProvider.cancelDownloading(_:)()
{
  return dispatch thunk of TrialAssetProvider.cancelDownloading(_:)();
}

uint64_t dispatch thunk of TrialAssetProvider.downloadNamespace()()
{
  return dispatch thunk of TrialAssetProvider.downloadNamespace()();
}

uint64_t dispatch thunk of TrialAssetProvider.findVoice(_:)()
{
  return dispatch thunk of TrialAssetProvider.findVoice(_:)();
}

uint64_t TrialAssetProvider.init()()
{
  return TrialAssetProvider.init()();
}

uint64_t type metadata accessor for TrialAssetProvider()
{
  return type metadata accessor for TrialAssetProvider();
}

uint64_t AudioPlaybackAction.init(pool:)()
{
  return AudioPlaybackAction.init(pool:)();
}

uint64_t type metadata accessor for AudioPlaybackAction()
{
  return type metadata accessor for AudioPlaybackAction();
}

uint64_t dispatch thunk of OspreyBuiltInConfig.timeout.getter()
{
  return dispatch thunk of OspreyBuiltInConfig.timeout.getter();
}

uint64_t dispatch thunk of OspreyBuiltInConfig.timeout.setter()
{
  return dispatch thunk of OspreyBuiltInConfig.timeout.setter();
}

uint64_t OspreyBuiltInConfig.init()()
{
  return OspreyBuiltInConfig.init()();
}

uint64_t type metadata accessor for OspreyBuiltInConfig()
{
  return type metadata accessor for OspreyBuiltInConfig();
}

uint64_t TextToPhonemeAction.init(pool:)()
{
  return TextToPhonemeAction.init(pool:)();
}

uint64_t type metadata accessor for TextToPhonemeAction()
{
  return type metadata accessor for TextToPhonemeAction();
}

uint64_t BuiltInVoiceProvider.init()()
{
  return BuiltInVoiceProvider.init()();
}

uint64_t type metadata accessor for BuiltInVoiceProvider()
{
  return type metadata accessor for BuiltInVoiceProvider();
}

Swift::Void __swiftcall DirectedAcyclicGraph.chain(nodes:)(Swift::OpaquePointer nodes)
{
}

uint64_t DirectedAcyclicGraph.connect(fromNode:toNode:)()
{
  return DirectedAcyclicGraph.connect(fromNode:toNode:)();
}

uint64_t DirectedAcyclicGraph.init()()
{
  return DirectedAcyclicGraph.init()();
}

uint64_t type metadata accessor for DirectedAcyclicGraph()
{
  return type metadata accessor for DirectedAcyclicGraph();
}

uint64_t dispatch thunk of EngineCachingService.activeSessionCount.modify()
{
  return dispatch thunk of EngineCachingService.activeSessionCount.modify();
}

uint64_t dispatch thunk of EngineCachingService.activeSessionCount.getter()
{
  return dispatch thunk of EngineCachingService.activeSessionCount.getter();
}

uint64_t static EngineCachingService.shared.getter()
{
  return static EngineCachingService.shared.getter();
}

uint64_t type metadata accessor for EngineCachingService()
{
  return type metadata accessor for EngineCachingService();
}

uint64_t dispatch thunk of NeuralVoiceUtilities.currentSampleRate(voicePath:)()
{
  return dispatch thunk of NeuralVoiceUtilities.currentSampleRate(voicePath:)();
}

uint64_t OspreyChainedConfigs.init(configs:)()
{
  return OspreyChainedConfigs.init(configs:)();
}

uint64_t OspreyChainedConfigs.configs.getter()
{
  return OspreyChainedConfigs.configs.getter();
}

uint64_t type metadata accessor for OspreyChainedConfigs()
{
  return type metadata accessor for OspreyChainedConfigs();
}

uint64_t RequestParsingAction.init(pool:)()
{
  return RequestParsingAction.init(pool:)();
}

uint64_t type metadata accessor for RequestParsingAction()
{
  return type metadata accessor for RequestParsingAction();
}

uint64_t static VoiceSelectionAction.defaultSetupAction()()
{
  return static VoiceSelectionAction.defaultSetupAction()();
}

uint64_t dispatch thunk of VoiceSelectionAction.selectVoiceAsset(_:disableCompactVoice:requestId:)()
{
  return dispatch thunk of VoiceSelectionAction.selectVoiceAsset(_:disableCompactVoice:requestId:)();
}

uint64_t VoiceSelectionAction.init(pool:)()
{
  return VoiceSelectionAction.init(pool:)();
}

uint64_t type metadata accessor for VoiceSelectionAction()
{
  return type metadata accessor for VoiceSelectionAction();
}

uint64_t DeviceSynthesisAction.init(pool:)()
{
  return DeviceSynthesisAction.init(pool:)();
}

uint64_t type metadata accessor for DeviceSynthesisAction()
{
  return type metadata accessor for DeviceSynthesisAction();
}

uint64_t InlineStreamingAction.init(pool:)()
{
  return InlineStreamingAction.init(pool:)();
}

uint64_t type metadata accessor for InlineStreamingAction()
{
  return type metadata accessor for InlineStreamingAction();
}

uint64_t dispatch thunk of OspreyConfigProviding.allowedAppIdentifiers.getter()
{
  return dispatch thunk of OspreyConfigProviding.allowedAppIdentifiers.getter();
}

uint64_t AudibleRequestProtocol.immediate.getter()
{
  return AudibleRequestProtocol.immediate.getter();
}

uint64_t dispatch thunk of InlineStreamingStorage.findSignal(matchingText:)()
{
  return dispatch thunk of InlineStreamingStorage.findSignal(matchingText:)();
}

uint64_t static InlineStreamingStorage.shared.getter()
{
  return static InlineStreamingStorage.shared.getter();
}

uint64_t type metadata accessor for InlineStreamingStorage()
{
  return type metadata accessor for InlineStreamingStorage();
}

uint64_t OspreyTTSPrewarmAction.init(pool:)()
{
  return OspreyTTSPrewarmAction.init(pool:)();
}

uint64_t type metadata accessor for OspreyTTSPrewarmAction()
{
  return type metadata accessor for OspreyTTSPrewarmAction();
}

uint64_t SynthesisPrewarmAction.init(pool:)()
{
  return SynthesisPrewarmAction.init(pool:)();
}

uint64_t type metadata accessor for SynthesisPrewarmAction()
{
  return type metadata accessor for SynthesisPrewarmAction();
}

uint64_t IsNaturalVoiceCondition.init(pool:)()
{
  return IsNaturalVoiceCondition.init(pool:)();
}

uint64_t type metadata accessor for IsNaturalVoiceCondition()
{
  return type metadata accessor for IsNaturalVoiceCondition();
}

uint64_t dispatch thunk of static RequestPreprocessAction.processLanguage(for:)()
{
  return dispatch thunk of static RequestPreprocessAction.processLanguage(for:)();
}

uint64_t RequestPreprocessAction.init(pool:)()
{
  return RequestPreprocessAction.init(pool:)();
}

uint64_t type metadata accessor for RequestPreprocessAction()
{
  return type metadata accessor for RequestPreprocessAction();
}

uint64_t static DaemonXPCAllowedTypeSets.AllRequestsTypes.getter()
{
  return static DaemonXPCAllowedTypeSets.AllRequestsTypes.getter();
}

uint64_t static DaemonXPCAllowedTypeSets.AudioRequestTypes.getter()
{
  return static DaemonXPCAllowedTypeSets.AudioRequestTypes.getter();
}

uint64_t static DaemonXPCAllowedTypeSets.SpeechRequestTypes.getter()
{
  return static DaemonXPCAllowedTypeSets.SpeechRequestTypes.getter();
}

uint64_t static DaemonXPCAllowedTypeSets.PhonemeRequestTypes.getter()
{
  return static DaemonXPCAllowedTypeSets.PhonemeRequestTypes.getter();
}

uint64_t static DaemonXPCAllowedTypeSets.PreviewRequestTypes.getter()
{
  return static DaemonXPCAllowedTypeSets.PreviewRequestTypes.getter();
}

uint64_t dispatch thunk of PreinstalledAudioStorage.find(request:)()
{
  return dispatch thunk of PreinstalledAudioStorage.find(request:)();
}

uint64_t static PreinstalledAudioStorage.shared.getter()
{
  return static PreinstalledAudioStorage.shared.getter();
}

uint64_t type metadata accessor for PreinstalledAudioStorage()
{
  return type metadata accessor for PreinstalledAudioStorage();
}

uint64_t SynthesisBufferingAction.init(pool:)()
{
  return SynthesisBufferingAction.init(pool:)();
}

uint64_t type metadata accessor for SynthesisBufferingAction()
{
  return type metadata accessor for SynthesisBufferingAction();
}

uint64_t dispatch thunk of PreinstalledVoiceProvider.listVoices(_:)()
{
  return dispatch thunk of PreinstalledVoiceProvider.listVoices(_:)();
}

uint64_t PreinstalledVoiceProvider.init()()
{
  return PreinstalledVoiceProvider.init()();
}

uint64_t type metadata accessor for PreinstalledVoiceProvider()
{
  return type metadata accessor for PreinstalledVoiceProvider();
}

uint64_t dispatch thunk of SynthesisVoiceSubscription.accessoryId.getter()
{
  return dispatch thunk of SynthesisVoiceSubscription.accessoryId.getter();
}

uint64_t SynthesisVoiceSubscription.init(voice:clientId:accessoryId:)()
{
  return SynthesisVoiceSubscription.init(voice:clientId:accessoryId:)();
}

uint64_t dispatch thunk of SynthesisVoiceSubscription.voice.getter()
{
  return dispatch thunk of SynthesisVoiceSubscription.voice.getter();
}

uint64_t dispatch thunk of SynthesisVoiceSubscription.clientId.getter()
{
  return dispatch thunk of SynthesisVoiceSubscription.clientId.getter();
}

uint64_t type metadata accessor for SynthesisVoiceSubscription()
{
  return type metadata accessor for SynthesisVoiceSubscription();
}

uint64_t RetryTextModificationAction.init(pool:)()
{
  return RetryTextModificationAction.init(pool:)();
}

uint64_t type metadata accessor for RetryTextModificationAction()
{
  return type metadata accessor for RetryTextModificationAction();
}

uint64_t SynthesisCacheWritingAction.init(pool:)()
{
  return SynthesisCacheWritingAction.init(pool:)();
}

uint64_t type metadata accessor for SynthesisCacheWritingAction()
{
  return type metadata accessor for SynthesisCacheWritingAction();
}

uint64_t SynthesizingRequestProtocol.forceOspreyTTS.getter()
{
  return SynthesizingRequestProtocol.forceOspreyTTS.getter();
}

uint64_t SynthesizingRequestProtocol.privacySensitive.getter()
{
  return SynthesizingRequestProtocol.privacySensitive.getter();
}

uint64_t SynthesizingRequestProtocol.privacySensitive.setter()
{
  return SynthesizingRequestProtocol.privacySensitive.setter();
}

uint64_t SynthesizingRequestProtocol.disableCompactVoice.getter()
{
  return SynthesizingRequestProtocol.disableCompactVoice.getter();
}

uint64_t SynthesizingRequestProtocol.minimizeDeviceUsage.getter()
{
  return SynthesizingRequestProtocol.minimizeDeviceUsage.getter();
}

uint64_t SynthesizingRequestProtocol.text.getter()
{
  return SynthesizingRequestProtocol.text.getter();
}

uint64_t SynthesizingRequestProtocol.voice.getter()
{
  return SynthesizingRequestProtocol.voice.getter();
}

uint64_t VocalizerCustomVoiceProvider.init()()
{
  return VocalizerCustomVoiceProvider.init()();
}

uint64_t type metadata accessor for VocalizerCustomVoiceProvider()
{
  return type metadata accessor for VocalizerCustomVoiceProvider();
}

uint64_t CoreAnalyticsSynthesisHandler.init(notificationCenter:coreAnalyticsService:)()
{
  return CoreAnalyticsSynthesisHandler.init(notificationCenter:coreAnalyticsService:)();
}

uint64_t type metadata accessor for CoreAnalyticsSynthesisHandler()
{
  return type metadata accessor for CoreAnalyticsSynthesisHandler();
}

uint64_t SynthesisEngineSelectionAction.init(pool:)()
{
  return SynthesisEngineSelectionAction.init(pool:)();
}

uint64_t type metadata accessor for SynthesisEngineSelectionAction()
{
  return type metadata accessor for SynthesisEngineSelectionAction();
}

uint64_t static Logger.service.getter()
{
  return static Logger.service.getter();
}

uint64_t static Features.lowInactiveMemory.getter()
{
  return static Features.lowInactiveMemory.getter();
}

uint64_t static Signpost.signposter.getter()
{
  return static Signpost.signposter.getter();
}

uint64_t TTSError.TTSErrorCode.rawValue.getter()
{
  return TTSError.TTSErrorCode.rawValue.getter();
}

uint64_t type metadata accessor for TTSError.TTSErrorCode()
{
  return type metadata accessor for TTSError.TTSErrorCode();
}

uint64_t TTSError.init(code:description:)()
{
  return TTSError.init(code:description:)();
}

uint64_t TTSError.code.getter()
{
  return TTSError.code.getter();
}

void __swiftcall TTSError.nsError()(NSError *__return_ptr retstr)
{
}

uint64_t type metadata accessor for TTSError()
{
  return type metadata accessor for TTSError();
}

uint64_t Workflow.init(graph:notification:errorHandlers:)()
{
  return Workflow.init(graph:notification:errorHandlers:)();
}

uint64_t type metadata accessor for Workflow()
{
  return type metadata accessor for Workflow();
}

uint64_t static Constants.MachServiceName.getter()
{
  return static Constants.MachServiceName.getter();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t static DispatchWorkItemFlags.detached.getter()
{
  return static DispatchWorkItemFlags.detached.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.default.getter()
{
  return static DispatchQoS.default.getter();
}

uint64_t static DispatchQoS.utility.getter()
{
  return static DispatchQoS.utility.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
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

uint64_t Array.description.getter()
{
  return Array.description.getter();
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

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t NSFileManager.removeItems(inDirectory:olderThan:)()
{
  return NSFileManager.removeItems(inDirectory:olderThan:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.synthesisQoS.getter()
{
  return static OS_dispatch_queue.synthesisQoS.getter();
}

uint64_t static OS_dispatch_queue.synthesisQueue(label:qos:priority:)()
{
  return static OS_dispatch_queue.synthesisQueue(label:qos:priority:)();
}

uint64_t static OS_dispatch_queue.appSynthesisPriority(request:)()
{
  return static OS_dispatch_queue.appSynthesisPriority(request:)();
}

uint64_t static OS_dispatch_queue.platformSynthesisPriority.getter()
{
  return static OS_dispatch_queue.platformSynthesisPriority.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.async(execute:)()
{
  return OS_dispatch_queue.async(execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static NSNotificationName.synthesisEnded.getter()
{
  return static NSNotificationName.synthesisEnded.getter();
}

uint64_t static NSNotificationName.taskCompletion.getter()
{
  return static NSNotificationName.taskCompletion.getter();
}

uint64_t static NSNotificationName.phonemesGenerated.getter()
{
  return static NSNotificationName.phonemesGenerated.getter();
}

uint64_t static NSNotificationName.voiceAssetChanged.getter()
{
  return static NSNotificationName.voiceAssetChanged.getter();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t NSNotificationCenter.addObserver<A>(event:callback:)()
{
  return NSNotificationCenter.addObserver<A>(event:callback:)();
}

uint64_t NSNotificationCenter.addObserver(event:callback:)()
{
  return NSNotificationCenter.addObserver(event:callback:)();
}

Swift::Void __swiftcall NSNotificationCenter.post(event:)(NSNotificationName event)
{
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t NSSet.init(arrayLiteral:)()
{
  return NSSet.init(arrayLiteral:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
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

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
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

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}