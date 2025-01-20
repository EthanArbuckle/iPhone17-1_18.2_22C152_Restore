uint64_t sub_10000544C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005690(&qword_10003F600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t GlobalPreferences.semAllowList.getter()
{
  v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 objectForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000544C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    sub_100005690(&qword_10003F608);
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_10000888C((uint64_t)v7);
  }
  if (qword_10003F320 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void sub_1000055F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  v7 = *(void (**)(id, id, id))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, v8, v9);
  swift_release();
}

uint64_t sub_100005690(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000056D4()
{
  unint64_t result = qword_100040160;
  if (!qword_100040160)
  {
    sub_100016A1C((uint64_t *)&unk_100040B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040160);
  }
  return result;
}

uint64_t sub_100005730(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100005778(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000057BC(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = __CocoaSet.contains(_:)();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40)),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_100007FBC(0, &qword_100040C90);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = static NSObject.== infix(_:_:)();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

unint64_t sub_10000591C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100007EA0(a1, v4);
}

void sub_100005960(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (void **)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *unint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
LABEL_45:
    __break(1u);
    return;
  }
  id v11 = [a2 state];
  if (v11)
  {
    char v12 = v11;
    id v13 = [v11 assertions];
    if (!v13) {
      goto LABEL_42;
    }
    unint64_t v14 = v13;
    uint64_t v15 = sub_100007FBC(0, &qword_100040CE8);
    sub_100005DC4();
    uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    unsigned int v17 = [v12 taskState];
    uint64_t v41 = a1;
    uint64_t v42 = v2;
    v40 = v12;
    unsigned int v44 = v17;
    uint64_t v47 = v15;
    if ((v16 & 0xC000000000000001) != 0)
    {
      __CocoaSet.makeIterator()();
      Set.Iterator.init(_cocoa:)();
      uint64_t v16 = v51;
      uint64_t v48 = v52;
      uint64_t v18 = v53;
      uint64_t v19 = v54;
      unint64_t v20 = v55;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v21 = -1 << *(unsigned char *)(v16 + 32);
      uint64_t v22 = *(void *)(v16 + 56);
      uint64_t v48 = v16 + 56;
      uint64_t v18 = ~v21;
      uint64_t v23 = -v21;
      if (v23 < 64) {
        uint64_t v24 = ~(-1 << v23);
      }
      else {
        uint64_t v24 = -1;
      }
      unint64_t v20 = v24 & v22;
    }
    BOOL v45 = 0;
    uint64_t v43 = v18;
    int64_t v25 = (unint64_t)(v18 + 64) >> 6;
    v39 = (void *)0x8000000100032860;
    v46 = (char *)&type metadata for Swift.AnyObject + 8;
    while (1)
    {
      uint64_t v26 = v19;
      if (v16 < 0)
      {
        uint64_t v29 = __CocoaSet.Iterator.next()();
        if (!v29) {
          goto LABEL_38;
        }
        uint64_t v49 = v29;
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v30 = v50;
        swift_unknownObjectRelease();
        if (!v30) {
          goto LABEL_38;
        }
      }
      else
      {
        if (v20)
        {
          unint64_t v27 = __clz(__rbit64(v20));
          v20 &= v20 - 1;
          unint64_t v28 = v27 | (v19 << 6);
        }
        else
        {
          int64_t v31 = v19 + 1;
          if (__OFADD__(v19, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          if (v31 >= v25) {
            goto LABEL_38;
          }
          unint64_t v32 = *(void *)(v48 + 8 * v31);
          ++v19;
          if (!v32)
          {
            uint64_t v19 = v26 + 2;
            if (v26 + 2 >= v25) {
              goto LABEL_38;
            }
            unint64_t v32 = *(void *)(v48 + 8 * v19);
            if (!v32)
            {
              uint64_t v19 = v26 + 3;
              if (v26 + 3 >= v25) {
                goto LABEL_38;
              }
              unint64_t v32 = *(void *)(v48 + 8 * v19);
              if (!v32)
              {
                uint64_t v19 = v26 + 4;
                if (v26 + 4 >= v25) {
                  goto LABEL_38;
                }
                unint64_t v32 = *(void *)(v48 + 8 * v19);
                if (!v32)
                {
                  uint64_t v33 = v26 + 5;
                  while (v25 != v33)
                  {
                    unint64_t v32 = *(void *)(v48 + 8 * v33++);
                    if (v32)
                    {
                      uint64_t v19 = v33 - 1;
                      goto LABEL_30;
                    }
                  }
LABEL_38:
                  sub_10002C03C();
                  if (v44 == 4)
                  {
                    uint64_t v37 = v41;
                    char v38 = (*(unsigned char *)(v41 + 47) ^ 1) & v45;
                  }
                  else
                  {
                    char v38 = 0;
                    uint64_t v37 = v41;
                  }
                  char v12 = v40;
                  *(unsigned char *)(v37 + 48) = v38 & 1;
                  sub_100005E2C();
LABEL_42:

                  return;
                }
              }
            }
          }
LABEL_30:
          unint64_t v20 = (v32 - 1) & v32;
          unint64_t v28 = __clz(__rbit64(v32)) + (v19 << 6);
        }
        id v30 = *(id *)(*(void *)(v16 + 48) + 8 * v28);
        if (!v30) {
          goto LABEL_38;
        }
      }
      id v34 = [v30 domain:v39];
      if (v34)
      {
        v35 = v34;
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        if (v45)
        {
          BOOL v45 = 1;
        }
        else
        {
          v36._countAndFlagsBits = 0xD00000000000002ELL;
          v36._object = v39;
          BOOL v45 = String.hasPrefix(_:)(v36);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
      }
    }
  }
}

unint64_t sub_100005DC4()
{
  unint64_t result = qword_100040CF0;
  if (!qword_100040CF0)
  {
    sub_100007FBC(255, &qword_100040CE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040CF0);
  }
  return result;
}

uint64_t sub_100005E2C()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v64 - v6;
  uint64_t v8 = type metadata accessor for DispatchPredicate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char **)((char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v12 = *(void **)((char *)v0 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *id v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  id v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
    goto LABEL_41;
  }
  unint64_t v14 = (void *)((char *)v0 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses);
  swift_beginAccess();
  unint64_t v15 = *v14;
  BOOL v16 = (*v14 & 0xC000000000000001) == 0;
  v69 = v0;
  v70 = v14;
  uint64_t v66 = v2;
  uint64_t v67 = v1;
  v64 = v7;
  v65 = v5;
  if (v16)
  {
    uint64_t v21 = -1 << *(unsigned char *)(v15 + 32);
    uint64_t v18 = ~v21;
    uint64_t v22 = *(void *)(v15 + 64);
    unint64_t v71 = v15 + 64;
    uint64_t v23 = -v21;
    if (v23 < 64) {
      uint64_t v24 = ~(-1 << v23);
    }
    else {
      uint64_t v24 = -1;
    }
    unint64_t v19 = v24 & v22;
    unint64_t v20 = v15;
  }
  else
  {
    uint64_t v17 = __CocoaDictionary.makeIterator()();
    unint64_t v71 = 0;
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    unint64_t v20 = v17 | 0x8000000000000000;
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  uint64_t v68 = v18;
  id v11 = (void *)((unint64_t)(v18 + 64) >> 6);
  while (1)
  {
    uint64_t v26 = v25;
    if ((v20 & 0x8000000000000000) == 0) {
      break;
    }
    uint64_t v29 = __CocoaDictionary.Iterator.next()();
    if (!v29) {
      goto LABEL_35;
    }
    int64_t v31 = v30;
    v72 = (void *)v29;
    sub_100007FBC(0, &qword_100040C90);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v32 = v73;
    swift_unknownObjectRelease();
    v72 = v31;
    type metadata accessor for EmbeddedGameProcess();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v33 = v73;
    swift_unknownObjectRelease();
    uint64_t v25 = v26;
    if (!v32) {
      goto LABEL_35;
    }
LABEL_30:

    int v38 = v33[48];
    swift_release();
    if (v38 == 1)
    {
      sub_10002C03C();
      uint64_t v39 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction;
      id v11 = v69;
      if (*(void *)((char *)v69 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction)) {
        goto LABEL_40;
      }
      uint64_t v40 = Logger.daemon.unsafeMutableAddressor();
      uint64_t v42 = v66;
      uint64_t v41 = v67;
      uint64_t v43 = v64;
      (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v64, v40, v67);
      unsigned int v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Foreground games identified - holding transaction", v46, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v41);
      *(void *)((char *)v11 + v39) = os_transaction_create();
      goto LABEL_39;
    }
  }
  if (v19)
  {
    unint64_t v27 = __clz(__rbit64(v19));
    v19 &= v19 - 1;
    unint64_t v28 = v27 | (v25 << 6);
    goto LABEL_29;
  }
  uint64_t v34 = v25 + 1;
  if (__OFADD__(v25, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v34 >= (uint64_t)v11) {
    goto LABEL_35;
  }
  unint64_t v35 = *(void *)(v71 + 8 * v34);
  ++v25;
  if (v35) {
    goto LABEL_28;
  }
  uint64_t v25 = v26 + 2;
  if (v26 + 2 >= (uint64_t)v11) {
    goto LABEL_35;
  }
  unint64_t v35 = *(void *)(v71 + 8 * v25);
  if (v35) {
    goto LABEL_28;
  }
  uint64_t v25 = v26 + 3;
  if (v26 + 3 >= (uint64_t)v11) {
    goto LABEL_35;
  }
  unint64_t v35 = *(void *)(v71 + 8 * v25);
  if (v35) {
    goto LABEL_28;
  }
  uint64_t v25 = v26 + 4;
  if (v26 + 4 >= (uint64_t)v11) {
    goto LABEL_35;
  }
  unint64_t v35 = *(void *)(v71 + 8 * v25);
  if (v35)
  {
LABEL_28:
    unint64_t v19 = (v35 - 1) & v35;
    unint64_t v28 = __clz(__rbit64(v35)) + (v25 << 6);
LABEL_29:
    uint64_t v37 = 8 * v28;
    uint64_t v33 = *(unsigned __int8 **)(*(void *)(v20 + 56) + v37);
    id v32 = *(id *)(*(void *)(v20 + 48) + v37);
    swift_retain();
    if (!v32) {
      goto LABEL_35;
    }
    goto LABEL_30;
  }
  Swift::String v36 = (void *)(v26 + 5);
  while (v11 != v36)
  {
    unint64_t v35 = *(void *)(v71 + 8 * (void)v36);
    Swift::String v36 = (void *)((char *)v36 + 1);
    if (v35)
    {
      uint64_t v25 = (uint64_t)v36 - 1;
      goto LABEL_28;
    }
  }
LABEL_35:
  id v11 = v69;
  sub_10002C03C();
  uint64_t v47 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction;
  if (!*(void *)((char *)v11 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction)) {
    goto LABEL_40;
  }
  uint64_t v48 = Logger.daemon.unsafeMutableAddressor();
  v50 = v65;
  uint64_t v49 = v66;
  uint64_t v51 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v48, v67);
  uint64_t v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "Foreground games no longer identified - releasing transaction", v54, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v51);
  *(void *)((char *)v11 + v47) = 0;
LABEL_39:
  swift_unknownObjectRelease();
LABEL_40:
  if (qword_10003F328 != -1) {
    goto LABEL_46;
  }
LABEL_41:
  swift_retain();
  unint64_t v55 = GlobalPreferences.gameModeEnabledList.getter();
  swift_release();
  __int16 v76 = 0;
  __int16 v75 = 0;
  char v74 = 0;
  v72 = &_swiftEmptyArrayStorage;
  v73 = (unsigned __int8 *)&_swiftEmptyArrayStorage;
  unint64_t v56 = swift_bridgeObjectRetain();
  v57 = sub_1000065F0(v56);
  swift_bridgeObjectRelease();
  if (qword_10003F358 != -1) {
    swift_once();
  }
  v58 = v11;
  swift_bridgeObjectRetain();
  v59 = (void *)swift_retain();
  unint64_t v60 = sub_100016F8C(v59, (uint64_t)v58, (unsigned char *)&v76 + 1, &v75, &v72, v55, &v73, (unsigned char *)&v75 + 1, &v76, &v74);
  swift_release();

  swift_bridgeObjectRelease_n();
  unint64_t v62 = (unint64_t)v72;
  unint64_t v61 = (unint64_t)v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10001F954(v60 & 1, HIDWORD(v60) & 1, v61, v62, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002151C(BYTE3(v60), (unint64_t)v57, 0);
  sub_100021EFC((v60 >> 8) & 1, (unint64_t)v57, 0);
  sub_1000069B0((v60 >> 16) & 1, (unint64_t)v57, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *sub_1000065F0(unint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = __CocoaDictionary.count.getter();
    if (v2) {
      goto LABEL_3;
    }
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = &_swiftEmptyArrayStorage;
  }
  else
  {
    sub_100005690(&qword_100040688);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1000066F0((uint64_t)&v8, v3 + 4, v2, a1);
  unint64_t result = (void *)sub_10002C03C();
  if (v6 == v2) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000066F0(uint64_t result, void *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    unint64_t result = __CocoaDictionary.makeIterator()();
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v4 = result | 0x8000000000000000;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    int64_t v11 = 0;
    a3 = 0;
LABEL_45:
    *uint64_t v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v11;
    v7[4] = v10;
    return a3;
  }
  uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v8 = a4 + 64;
  uint64_t v20 = ~v19;
  uint64_t v21 = -v19;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v10 = v22 & *(void *)(a4 + 64);
  uint64_t v9 = v20;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v23 = v9;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v24 = (unint64_t)(v9 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!__CocoaDictionary.Iterator.next()())
    {
      a3 = v12;
LABEL_44:
      uint64_t v9 = v23;
      goto LABEL_45;
    }
    swift_unknownObjectRelease();
    type metadata accessor for EmbeddedGameProcess();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v15 = v25;
    unint64_t result = swift_unknownObjectRelease();
    if (!v25) {
      goto LABEL_43;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3) {
      goto LABEL_44;
    }
  }
  if (v10)
  {
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v14 = v13 | (v11 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v16 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v16);
  if (v17) {
    goto LABEL_23;
  }
  v11 += 2;
  if (v16 + 1 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17)
  {
LABEL_16:
    int64_t v16 = v11;
LABEL_23:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
LABEL_7:
    uint64_t v15 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    unint64_t result = swift_retain();
    if (!v15) {
      goto LABEL_43;
    }
    goto LABEL_8;
  }
  int64_t v18 = v16 + 2;
  if (v16 + 2 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
LABEL_22:
    int64_t v16 = v18;
    goto LABEL_23;
  }
  int64_t v11 = v16 + 3;
  if (v16 + 3 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16 + 2;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v16 + 4;
  if (v16 + 4 >= v24)
  {
LABEL_39:
    unint64_t v10 = 0;
LABEL_43:
    a3 = v12;
    goto LABEL_44;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17) {
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v24)
    {
      unint64_t v10 = 0;
      int64_t v11 = v24 - 1;
      goto LABEL_43;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

void sub_1000069B0(int a1, unint64_t a2, int a3)
{
  uint64_t v7 = type metadata accessor for DynamicSplitterStatus.Config();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  int64_t v16 = (char *)&v100 - v15;
  uint64_t v17 = sub_100005690(&qword_100040128);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  __chkstk_darwin(v18);
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter) == 1)
  {
    uint64_t v111 = v11;
    uint64_t v102 = v20;
    v105 = (char *)&v100 - v19;
    int v110 = a3;
    v101 = v16;
    uint64_t v104 = v3;
    uint64_t v21 = (unsigned char *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig);
    swift_beginAccess();
    int v108 = *v21;
    v109 = (int *)v7;
    uint64_t v22 = *(void *)&v21[*(int *)(v7 + 32)];
    LODWORD(v115) = a1;
    *uint64_t v21 = a1 & 1;
    v118[0] = &_swiftEmptyArrayStorage;
    uint64_t v107 = v22;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v116 = v23;
      if (!v23) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v23 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v116 = v23;
      if (!v23) {
        goto LABEL_16;
      }
    }
    if (v23 < 1)
    {
      __break(1u);
      goto LABEL_92;
    }
    if ((a2 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(unsigned char *)(specialized _ArrayBuffer._getElementSlowPath(_:)() + 49) == 1)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          uint64_t v23 = v116;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(unsigned char *)(*(void *)(a2 + 8 * j + 32) + 49) == 1)
        {
          swift_retain();
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          uint64_t v23 = v116;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
      }
    }
LABEL_16:
    swift_bridgeObjectRelease();
    unint64_t v26 = (unint64_t)v118[0];
    v114 = v21;
    if (((unint64_t)v118[0] & 0x8000000000000000) != 0
      || ((unint64_t)v118[0] & 0x4000000000000000) != 0)
    {
      swift_retain();
      uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
    }
    else
    {
      uint64_t v27 = *((void *)v118[0] + 2);
      swift_retain();
    }
    v106 = v9;
    uint64_t v112 = v10;
    v113 = v14;
    unint64_t v103 = a2;
    if (!v27)
    {
      uint64_t v29 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_35;
    }
    if (v27 >= 1)
    {
      uint64_t v28 = 0;
      uint64_t v29 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        if ((v26 & 0xC000000000000001) != 0)
        {
          uint64_t v30 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v30 = *(void *)(v26 + 8 * v28 + 32);
          swift_retain();
        }
        id v31 = [*(id *)(v30 + 16) bundle];
        if (v31
          && (id v32 = v31,
              id v33 = [v31 identifier],
              v32,
              v33))
        {
          uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v36 = v35;
          swift_release();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v29 = sub_10002C9E8(0, *((void *)v29 + 2) + 1, 1, v29);
          }
          unint64_t v38 = *((void *)v29 + 2);
          unint64_t v37 = *((void *)v29 + 3);
          if (v38 >= v37 >> 1) {
            uint64_t v29 = sub_10002C9E8((char *)(v37 > 1), v38 + 1, 1, v29);
          }
          *((void *)v29 + 2) = v38 + 1;
          uint64_t v39 = &v29[16 * v38];
          *((void *)v39 + 4) = v34;
          *((void *)v39 + 5) = v36;
        }
        else
        {
          swift_release();
        }
        ++v28;
      }
      while (v27 != v28);
LABEL_35:
      swift_release_n();
      int v40 = v108 ^ v115;
      uint64_t v41 = v109;
      uint64_t v42 = (uint64_t)v114;
      *(void *)&v114[v109[8]] = v29;
      swift_bridgeObjectRelease();
      if (qword_10003F358 != -1) {
        swift_once();
      }
      uint64_t v43 = &off_10003F000;
      unsigned int v44 = (void *)swift_retain();
      uint64_t v45 = sub_100012E94(v44);
      swift_release();
      *(void *)(v42 + v41[10]) = v45;
      uint64_t v46 = v111;
      int v47 = v110;
      if (v40)
      {
        if (v115)
        {
          swift_bridgeObjectRelease();
          uint64_t v48 = (uint64_t)v105;
          Date.init()();
          uint64_t v49 = type metadata accessor for Date();
          v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56);
          v50(v48, 0, 1, v49);
          swift_beginAccess();
          sub_10002C108(v48, v42 + v41[5]);
          uint64_t v51 = v42 + v41[6];
          sub_10002C0AC(v51, &qword_100040128);
          v50(v51, 1, 1, v49);
          swift_endAccess();
LABEL_43:
          unint64_t v56 = self;
          v118[0] = 0;
          id v57 = [v56 createClient:v118];
          id v58 = v118[0];
          uint64_t v59 = v112;
          if (!v57)
          {
            id v67 = v118[0];
            _convertNSErrorToError(_:)();

            swift_willThrow();
LABEL_63:
            uint64_t v75 = Logger.daemon.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v113, v75, v59);
            swift_errorRetain();
            swift_errorRetain();
            __int16 v76 = Logger.logObject.getter();
            os_log_type_t v77 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v76, v77))
            {
              v78 = (uint8_t *)swift_slowAlloc();
              uint64_t v79 = swift_slowAlloc();
              uint64_t v116 = 0;
              v80 = (void *)v79;
              *(_DWORD *)v78 = 138543362;
              swift_errorRetain();
              uint64_t v81 = v46;
              uint64_t v82 = v59;
              v83 = (void *)_swift_stdlib_bridgeErrorToNSError();
              v118[0] = v83;
              uint64_t v43 = &off_10003F000;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              void *v80 = v83;
              uint64_t v59 = v82;
              uint64_t v46 = v81;
              uint64_t v42 = (uint64_t)v114;
              swift_errorRelease();
              swift_errorRelease();
              _os_log_impl((void *)&_mh_execute_header, v76, v77, "Unable to set DPS: %{public}@", v78, 0xCu);
              sub_100005690((uint64_t *)&unk_10003FCA0);
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
            (*(void (**)(char *, uint64_t))(v46 + 8))(v113, v59);
            goto LABEL_69;
          }
          unint64_t v60 = v57;
          if ((v40 | v47))
          {
            v118[0] = 0;
            id v61 = v58;
            unsigned int v62 = [v60 setGameMode:v115 & 1 options:0 error:v118];
            id v63 = v118[0];
            if (!v62)
            {
              id v74 = v118[0];
              _convertNSErrorToError(_:)();

              goto LABEL_62;
            }
            v118[0] = 0;
            id v64 = v63;
            id v65 = [v60 isInGameMode:v118];
            if (v118[0])
            {
              id v66 = v118[0];
LABEL_62:
              swift_willThrow();
              swift_unknownObjectRelease();
              goto LABEL_63;
            }
            v94 = v65;
            uint64_t v95 = Logger.daemon.unsafeMutableAddressor();
            v96 = v101;
            (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v101, v95, v59);
            v97 = Logger.logObject.getter();
            os_log_type_t v98 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v97, v98))
            {
              v99 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)v99 = 134349056;
              v118[0] = v94;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              _os_log_impl((void *)&_mh_execute_header, v97, v98, "Set DPS to %{public}lu", v99, 0xCu);
              v96 = v101;
              swift_slowDealloc();
            }

            (*(void (**)(char *, uint64_t))(v46 + 8))(v96, v112);
          }
          else
          {
            id v68 = v118[0];
          }
          unint64_t v69 = v103;
          char v70 = v115;
          if (!v116)
          {
            swift_unknownObjectRelease();
LABEL_68:
            uint64_t v43 = &off_10003F000;
LABEL_69:
            sub_10002BFD4(v42, (uint64_t)v106, (uint64_t (*)(void))&type metadata accessor for DynamicSplitterStatus.Config);
            id v84 = objc_allocWithZone((Class)type metadata accessor for DynamicSplitterStatus());
            v85 = (void *)DynamicSplitterStatus.init(config:)();
            uint64_t v86 = (uint64_t)v43[483];
            v87 = *(void **)(v86 + 16);
            swift_retain();
            [v87 lock];
            uint64_t v116 = (uint64_t)v85;
            sub_10001573C(v86, v85, v118);
            [v87 unlock];
            unint64_t v88 = (unint64_t)v118[0];
            if ((unint64_t)v118[0] >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v89 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
              if (v89)
              {
LABEL_71:
                if (v89 >= 1)
                {
                  uint64_t v115 = v86;
                  for (uint64_t k = 0; k != v89; ++k)
                  {
                    if ((v88 & 0xC000000000000001) != 0) {
                      specialized _ArrayBuffer._getElementSlowPath(_:)();
                    }
                    else {
                      swift_retain();
                    }
                    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
                    if (Strong)
                    {
                      id v92 = [*(id *)(Strong + 16) remoteObjectProxy];
                      _bridgeAnyObjectToAny(_:)();
                      swift_unknownObjectRelease();
                      sub_100005690(&qword_100040CE0);
                      if (swift_dynamicCast())
                      {
                        [v117 updateStatus:0 :0 :0 :v116];
                        swift_release();
                        swift_unknownObjectRelease();
                      }
                      else
                      {
                        swift_release();
                      }
                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      swift_release();
                    }
                  }
                  goto LABEL_89;
                }
                goto LABEL_93;
              }
            }
            else
            {
              uint64_t v89 = *(void *)(((unint64_t)v118[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
              if (v89) {
                goto LABEL_71;
              }
            }
LABEL_89:
            swift_release();
            swift_bridgeObjectRelease();

            return;
          }
          if (v116 < 1) {
            goto LABEL_94;
          }
          swift_bridgeObjectRetain();
          unint64_t v71 = 0;
          while (1)
          {
            if ((v69 & 0xC000000000000001) != 0)
            {
              uint64_t v73 = specialized _ArrayBuffer._getElementSlowPath(_:)();
              if ((v70 & 1) == 0) {
                goto LABEL_59;
              }
            }
            else
            {
              uint64_t v73 = *(void *)(v69 + 8 * (void)v71 + 32);
              swift_retain();
              if ((v70 & 1) == 0)
              {
LABEL_59:
                int v72 = 0;
                goto LABEL_54;
              }
            }
            int v72 = *(unsigned __int8 *)(v73 + 49);
LABEL_54:
            unint64_t v71 = (char *)v71 + 1;
            sub_100007754(v72, v73, v60);
            swift_release();
            if ((void *)v116 == v71)
            {
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_68;
            }
          }
        }
        uint64_t v52 = v102;
        sub_10002C044(v42 + v41[5], v102);
        uint64_t v53 = type metadata accessor for Date();
        uint64_t v54 = *(void *)(v53 - 8);
        int v55 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53);
        sub_10002C0AC(v52, &qword_100040128);
        if (v55 != 1)
        {
          uint64_t v93 = (uint64_t)v105;
          Date.init()();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v93, 0, 1, v53);
          swift_beginAccess();
          sub_10002C108(v93, v42 + v41[6]);
          *(void *)(v42 + v41[9]) = v107;
          swift_endAccess();
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
  }
}

uint64_t sub_100007754(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v57[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = __chkstk_darwin(v10);
  uint64_t v15 = &v57[-v14];
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter) == 1)
  {
    uint64_t v16 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState;
    uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState);
    swift_beginAccess();
    uint64_t v18 = *(void *)(v17 + 16);
    if (*(void *)(v18 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_100007E28(a2);
      if (v20)
      {
        uint64_t v21 = *(void *)(v18 + 56);
        uint64_t v64 = v4;
        uint64_t v22 = v15;
        uint64_t v23 = v12;
        int64_t v24 = a3;
        uint64_t v25 = v8;
        uint64_t v26 = v16;
        int v27 = *(unsigned __int8 *)(v21 + v19);
        swift_release();
        uint64_t result = swift_bridgeObjectRelease();
        BOOL v28 = v27 == (a1 & 1);
        uint64_t v16 = v26;
        uint64_t v8 = v25;
        a3 = v24;
        uint64_t v12 = v23;
        uint64_t v15 = v22;
        uint64_t v4 = v64;
        if (v28) {
          return result;
        }
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
    LODWORD(v64) = a1;
    uint64_t v29 = *(void **)(a2 + 16);
    id v30 = [v29 pid];
    if (v30 == -1)
    {
LABEL_27:
      uint64_t v55 = *(void *)(v4 + v16);
      swift_beginAccess();
      swift_retain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v65 = *(void *)(v55 + 16);
      *(void *)(v55 + 16) = 0x8000000000000000;
      sub_10000846C(v64 & 1, a2, isUniquelyReferenced_nonNull_native);
      *(void *)(v55 + 16) = v65;
      swift_release();
      swift_bridgeObjectRelease();
      swift_endAccess();
      return swift_release();
    }
    id v31 = v30;
    uint64_t v62 = v16;
    id v32 = [v29 name];
    uint64_t v63 = v9;
    if (v32
      || (id v35 = [v29 bundle]) != 0
      && (v36 = v35, id v32 = [v35 identifier], v36, v32))
    {
      uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v34 = v33;
    }
    else
    {
      uint64_t v61 = 1701667175;
      unint64_t v34 = 0xE400000000000000;
    }
    v66[0] = 0;
    if ([a3 setGameModeOnProcess:v64 & 1 targetProcess:v31 options:0 error:v66])
    {
      id v37 = v66[0];
      uint64_t v38 = Logger.daemon.unsafeMutableAddressor();
      uint64_t v39 = v63;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v63 + 16))(v15, v38, v8);
      swift_bridgeObjectRetain();
      int v40 = Logger.logObject.getter();
      os_log_type_t v41 = static os_log_type_t.info.getter();
      int v42 = v41;
      unint64_t v60 = v40;
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v59 = (void *)swift_slowAlloc();
        v66[0] = v59;
        *(_DWORD *)uint64_t v43 = 136446466;
        if (v64) {
          uint64_t v44 = 0x64656C62616E45;
        }
        else {
          uint64_t v44 = 0x64656C6261736944;
        }
        int v58 = v42;
        if (v64) {
          unint64_t v45 = 0xE700000000000000;
        }
        else {
          unint64_t v45 = 0xE800000000000000;
        }
        uint64_t v65 = sub_100008130(v44, v45, (uint64_t *)v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_100008130(v61, v34, (uint64_t *)v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        uint64_t v46 = v60;
        _os_log_impl((void *)&_mh_execute_header, v60, (os_log_type_t)v58, "%{public}s DPS for %{public}s", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(unsigned char *, uint64_t))(v39 + 8))(v15, v8);
      uint64_t v16 = v62;
      goto LABEL_27;
    }
    id v47 = v66[0];
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v48 = Logger.daemon.unsafeMutableAddressor();
    uint64_t v49 = v63;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v63 + 16))(v12, v48, v8);
    swift_errorRetain();
    swift_errorRetain();
    v50 = Logger.logObject.getter();
    os_log_type_t v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 138543362;
      swift_errorRetain();
      uint64_t v54 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v66[0] = v54;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v53 = v54;
      uint64_t v49 = v63;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Unable to set DPS for game: %{public}@", v52, 0xCu);
      sub_100005690((uint64_t *)&unk_10003FCA0);
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
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v49 + 8))(v12, v8);
  }
  return result;
}

unint64_t sub_100007E28(uint64_t a1)
{
  Hasher.init(_seed:)();
  id v2 = *(id *)(a1 + 16);
  NSObject.hash(into:)();

  Swift::Int v3 = Hasher._finalize()();

  return sub_100007FF8(a1, v3);
}

unint64_t sub_100007EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100007FBC(0, &qword_100040C90);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100007FBC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100007FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100007FBC(0, (unint64_t *)&unk_100040B70);
    swift_retain();
    char v6 = static NSObject.== infix(_:_:)();
    swift_release();
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = ~v4;
      for (unint64_t i = (i + 1) & v7; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v7)
      {
        swift_retain();
        char v8 = static NSObject.== infix(_:_:)();
        swift_release();
        if (v8) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100008130(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000082B0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008254((uint64_t)v12, *a3);
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
      sub_100008254((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008204((uint64_t)v12);
  return v7;
}

uint64_t sub_100008204(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008254(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000082B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000085C8(a5, a6);
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

uint64_t sub_10000846C(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100007E28(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10000E45C();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000D6E0(result, a3 & 1);
  uint64_t result = sub_100007E28(a2);
  if ((v14 & 1) != (v17 & 1))
  {
LABEL_17:
    type metadata accessor for EmbeddedGameProcess();
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v10 = result;
  uint64_t v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  *(void *)(v16[6] + 8 * v10) = a2;
  *(unsigned char *)(v16[7] + v10) = a1 & 1;
  uint64_t v18 = v16[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v20;

  return swift_retain();
}

uint64_t sub_1000085C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008660(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000283A8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000283A8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008660(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000087D8(v2, 0);
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

void *sub_1000087D8(uint64_t a1, uint64_t a2)
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
  sub_100005690((uint64_t *)&unk_100040B90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008840()
{
  return swift_release();
}

uint64_t sub_100008848()
{
  return swift_release();
}

uint64_t sub_100008850()
{
  return swift_release();
}

uint64_t sub_100008858(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008868(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008878(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000888C(uint64_t a1)
{
  uint64_t v2 = sub_100005690(&qword_10003F600);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000088EC(uint64_t a1, uint64_t a2, void *a3)
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
  char v9 = a3 + 7;
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

uint64_t type metadata accessor for EmbeddedGameProcess()
{
  return self;
}

unint64_t sub_1000089D8()
{
  unint64_t result = qword_100040D00;
  if (!qword_100040D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040D00);
  }
  return result;
}

const char *sub_100008A2C()
{
  if (*v0) {
    return "universalGamePolicySupport";
  }
  else {
    return "gameModeNotifications";
  }
}

const char *sub_100008A5C()
{
  return "GamePolicy";
}

uint64_t sub_100008A70()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  else {
    return MGIsDeviceOneOfType();
  }
}

uint64_t sub_100008F78()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  else {
    return MGIsDeviceOneOfType();
  }
}

uint64_t sub_1000094D0()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  else {
    return MGIsDeviceOneOfType();
  }
}

uint64_t sub_100009ACC()
{
  return MGIsDeviceOneOfType();
}

uint64_t sub_10000A048()
{
  return MGIsDeviceOneOfType();
}

void sub_10000A628(unsigned int a1)
{
  uint64_t v4 = 0;
  size_t v3 = 8;
  uint64_t v2 = a1;
  if (sysctlbyname("kern.console_mode", &v4, &v3, &v2, 8uLL) == -1)
  {
    uint64_t v1 = __error();
    NSLog(@"kern.console_mode failed with error: %d", *v1);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for GamePolicyDaemon();
  swift_allocObject();
  qword_100041180 = sub_10000AA0C();
  sub_10000A72C(qword_100041180 + 16, (uint64_t)v5);
  uint64_t v3 = v6;
  if (!v6)
  {
    sub_10000A794((uint64_t)v5);
    dispatch_main();
  }
  uint64_t v4 = v7;
  sub_10000A7F4(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  sub_100008204((uint64_t)v5);
  dispatch_main();
}

uint64_t sub_10000A72C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005690(&qword_10003F360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A794(uint64_t a1)
{
  uint64_t v2 = sub_100005690(&qword_10003F360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10000A7F4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t variable initialization expression of GlobalPreferences.gameModeEnabledListKey()
{
  return 0xD000000000000013;
}

unint64_t variable initialization expression of GlobalPreferences.gameModeLastBannerDatesKey()
{
  return 0xD000000000000017;
}

void *variable initialization expression of GamePolicyMobileAssetRetriever.completionHandlers()
{
  return &_swiftEmptyArrayStorage;
}

id variable initialization expression of GamePolicyMobileAssetRetriever.lock()
{
  id v0 = objc_allocWithZone((Class)NSLock);

  return [v0 init];
}

uint64_t GamePolicyMobileAsset.compatibilityVersion.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t GamePolicyMobileAsset.contentVersion.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t GamePolicyMobileAsset.contentRevision.getter()
{
  return *(void *)(v0 + 64);
}

id GamePolicyMobileAsset.maAsset.getter()
{
  return *(id *)(v0 + 72);
}

uint64_t GamePolicyMobileAsset.description.getter()
{
  id v1 = [*(id *)(v0 + 72) description];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t GamePolicyMobileAsset.deinit()
{
  return v0;
}

uint64_t GamePolicyMobileAsset.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t sub_10000A98C()
{
  id v1 = [*(id *)(*(void *)v0 + 72) description];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t type metadata accessor for GamePolicyMobileAsset()
{
  return self;
}

uint64_t sub_10000AA0C()
{
  if (_set_user_dir_suffix())
  {
    uint64_t v1 = type metadata accessor for GamePolicyDaemon_iOS();
    swift_allocObject();
    v3[3] = v1;
    v3[4] = &off_100039588;
    v3[0] = sub_10001D73C();
    sub_10000ABBC((uint64_t)v3, v0 + 16);
    return v0;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000AAD8()
{
  sub_10000A794(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for GamePolicyDaemon()
{
  return self;
}

uint64_t sub_10000AB34()
{
  sub_10000A72C(*v0 + 16, (uint64_t)v4);
  uint64_t v1 = v5;
  if (!v5) {
    return sub_10000A794((uint64_t)v4);
  }
  uint64_t v2 = v6;
  sub_10000A7F4(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  return sub_100008204((uint64_t)v4);
}

uint64_t sub_10000ABBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005690(&qword_10003F360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *GlobalPreferences.defaultIgnoreDeviceRestrictions.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultIgnoreDeviceRestrictions;
}

uint64_t static GlobalPreferences.defaultIgnoreDeviceRestrictions.getter()
{
  return static GlobalPreferences.defaultIgnoreDeviceRestrictions;
}

uint64_t static GlobalPreferences.defaultIgnoreDeviceRestrictions.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static GlobalPreferences.defaultIgnoreDeviceRestrictions = a1;
  return result;
}

uint64_t (*static GlobalPreferences.defaultIgnoreDeviceRestrictions.modify())()
{
  return j_j__swift_endAccess;
}

void sub_10000AD14()
{
  static GlobalPreferences.defaultSEMAllowList = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t *GlobalPreferences.defaultSEMAllowList.unsafeMutableAddressor()
{
  if (qword_10003F320 != -1) {
    swift_once();
  }
  return &static GlobalPreferences.defaultSEMAllowList;
}

uint64_t static GlobalPreferences.defaultSEMAllowList.getter()
{
  if (qword_10003F320 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static GlobalPreferences.defaultSEMAllowList.setter(uint64_t a1)
{
  if (qword_10003F320 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static GlobalPreferences.defaultSEMAllowList = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static GlobalPreferences.defaultSEMAllowList.modify())()
{
  if (qword_10003F320 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultGameModeEnablementStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultGameModeEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultGameModeEnablementStrategy.getter()
{
  return static GlobalPreferences.defaultGameModeEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultGameModeEnablementStrategy.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static GlobalPreferences.defaultGameModeEnablementStrategy = a1;
  return result;
}

uint64_t (*static GlobalPreferences.defaultGameModeEnablementStrategy.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultSEMEnablementStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultSEMEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultSEMEnablementStrategy.getter()
{
  return static GlobalPreferences.defaultSEMEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultSEMEnablementStrategy.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static GlobalPreferences.defaultSEMEnablementStrategy = a1;
  return result;
}

uint64_t (*static GlobalPreferences.defaultSEMEnablementStrategy.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultDynamicSplitterEnablementStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultDynamicSplitterEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultDynamicSplitterEnablementStrategy.getter()
{
  return static GlobalPreferences.defaultDynamicSplitterEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultDynamicSplitterEnablementStrategy.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static GlobalPreferences.defaultDynamicSplitterEnablementStrategy = a1;
  return result;
}

uint64_t (*static GlobalPreferences.defaultDynamicSplitterEnablementStrategy.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy;
}

uint64_t static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.getter()
{
  return static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy;
}

uint64_t static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy = a1;
  return result;
}

uint64_t (*static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000B2B8()
{
  type metadata accessor for GlobalPreferences();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 24) = 0xD000000000000013;
  *(void *)(v0 + 32) = 0x8000000100030730;
  *(void *)(v0 + 40) = 0xD000000000000017;
  *(void *)(v0 + 48) = 0x8000000100030750;
  id result = [objc_allocWithZone((Class)NSUserDefaults) init];
  *(void *)(v0 + 16) = result;
  off_10003F5F8 = (_UNKNOWN *)v0;
  return result;
}

id GlobalPreferences.ignoreDeviceRestrictions.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10000888C((uint64_t)v7);
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v1 BOOLForKey:v4];
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_10000888C((uint64_t)v7);
    swift_beginAccess();
    return (id)static GlobalPreferences.defaultIgnoreDeviceRestrictions;
  }
  return v5;
}

void GlobalPreferences.ignoreDeviceRestrictions.setter(char a1)
{
}

void (*GlobalPreferences.ignoreDeviceRestrictions.modify(uint64_t a1))(unsigned __int8 *a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = GlobalPreferences.ignoreDeviceRestrictions.getter() & 1;
  return sub_10000B4A8;
}

void sub_10000B4A8(unsigned __int8 *a1)
{
  uint64_t v1 = a1[8];
  NSString v2 = *(void **)(*(void *)a1 + 16);
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 setBool:v1 forKey:v3];
}

void GlobalPreferences.semAllowList.setter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setObject:isa forKey:v3];
}

void (*GlobalPreferences.semAllowList.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.semAllowList.getter();
  return sub_10000B60C;
}

void sub_10000B60C(uint64_t a1, char a2)
{
  NSString v2 = *(void **)(*(void *)(a1 + 8) + 16);
  if (a2)
  {
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 setObject:isa forKey:v3];
    swift_bridgeObjectRelease();
  }
  else
  {
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 setObject:isa forKey:v3];
  }
}

uint64_t GlobalPreferences.modelManagerGameAssertionPolicyStrategy.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10000888C((uint64_t)v7);
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v1 integerForKey:v4];

    if ((unint64_t)v5 < 4) {
      return (uint64_t)v5;
    }
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_10000888C((uint64_t)v7);
  }
  swift_beginAccess();
  return static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy;
}

void GlobalPreferences.modelManagerGameAssertionPolicyStrategy.setter(uint64_t a1)
{
}

void (*GlobalPreferences.modelManagerGameAssertionPolicyStrategy.modify(uint64_t *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.modelManagerGameAssertionPolicyStrategy.getter();
  return sub_10000B888;
}

void sub_10000B888(uint64_t *a1)
{
}

id GlobalPreferences.firstLanuchBannerShown.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 BOOLForKey:v2];

  return v3;
}

void GlobalPreferences.firstLanuchBannerShown.setter(char a1)
{
}

void sub_10000B920(char a1)
{
  id v3 = *(void **)(v1 + 16);
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setBool:a1 & 1 forKey:v4];
}

void (*GlobalPreferences.firstLanuchBannerShown.modify(uint64_t a1))(uint64_t a1)
{
  id v3 = *(void **)(v1 + 16);
  *(void *)a1 = v3;
  NSString v4 = String._bridgeToObjectiveC()();
  LOBYTE(v3) = [v3 BOOLForKey:v4];

  *(unsigned char *)(a1 + 8) = (_BYTE)v3;
  return sub_10000BA14;
}

void sub_10000BA14(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(unsigned __int8 *)(a1 + 8);
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setBool:v2 forKey:v3];
}

id GlobalPreferences.gameModeEnablementStrategy.getter()
{
  return sub_10000BBF8(0xD00000000000001ALL, 0x8000000100030AE0, (uint64_t)&static GlobalPreferences.defaultGameModeEnablementStrategy);
}

void GlobalPreferences.gameModeEnablementStrategy.setter(uint64_t a1)
{
}

void (*GlobalPreferences.gameModeEnablementStrategy.modify(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.gameModeEnablementStrategy.getter();
  return sub_10000BB14;
}

void sub_10000BB14(uint64_t *a1)
{
}

id GlobalPreferences.semEnablementStrategy.getter()
{
  return sub_10000BBF8(0xD000000000000015, 0x8000000100030B00, (uint64_t)&static GlobalPreferences.defaultSEMEnablementStrategy);
}

void GlobalPreferences.semEnablementStrategy.setter(uint64_t a1)
{
}

void (*GlobalPreferences.semEnablementStrategy.modify(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.semEnablementStrategy.getter();
  return sub_10000BBB8;
}

void sub_10000BBB8(uint64_t *a1)
{
}

id GlobalPreferences.dynamicSplitterEnablementStrategy.getter()
{
  return sub_10000BBF8(0xD000000000000021, 0x8000000100030B20, (uint64_t)&static GlobalPreferences.defaultDynamicSplitterEnablementStrategy);
}

id sub_10000BBF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(v3 + 16);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 valueForKey:v6];

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10000888C((uint64_t)v11);
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = [v5 integerForKey:v8];

    if ((unint64_t)v9 < 3) {
      return v9;
    }
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    sub_10000888C((uint64_t)v11);
  }
  swift_beginAccess();
  return *(id *)a3;
}

void GlobalPreferences.dynamicSplitterEnablementStrategy.setter(uint64_t a1)
{
}

void sub_10000BD08(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setInteger:a1 forKey:v4];
}

void (*GlobalPreferences.dynamicSplitterEnablementStrategy.modify(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.dynamicSplitterEnablementStrategy.getter();
  return sub_10000BDB8;
}

void sub_10000BDB8(uint64_t *a1)
{
}

void sub_10000BDD4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void **)(a1[1] + 16);
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 setInteger:v1 forKey:v3];
}

unint64_t GlobalPreferences.gameModeEnabledList.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000544C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    sub_100005690(&qword_10003F610);
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_10000888C((uint64_t)v7);
  }
  return sub_10000C124((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_10000BF18(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005690(&qword_10003F7E8);
  NSString v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  NSString v4 = (unsigned char *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 1);
    char v6 = *v4;
    uint64_t v7 = swift_retain();
    unint64_t result = sub_100007E28(v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    *(unsigned char *)(v2[7] + result) = v6;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 16;
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

unint64_t sub_10000C018(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005690(&qword_10003F7F0);
  NSString v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  NSString v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_retain();
    unint64_t result = sub_10000591C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

unint64_t sub_10000C124(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005690(&qword_10003F800);
  NSString v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  NSString v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000CF70(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
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

unint64_t sub_10000C238(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005690(&qword_10003F7F8);
  NSString v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  NSString v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000CF70(v5, v6);
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

void GlobalPreferences.gameModeEnabledList.setter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setValue:isa forKey:v3];
}

void (*GlobalPreferences.gameModeEnabledList.modify(unint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.gameModeEnabledList.getter();
  return sub_10000C42C;
}

void sub_10000C42C(uint64_t a1, char a2)
{
  NSString v2 = *(void **)(*(void *)(a1 + 8) + 16);
  if (a2)
  {
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 setValue:isa forKey:v3];
    swift_bridgeObjectRelease();
  }
  else
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 setValue:isa forKey:v3];
  }
}

Swift::Bool_optional __swiftcall GlobalPreferences.gameModeEnabled(bundleIdentifier:)(Swift::String bundleIdentifier)
{
  object = bundleIdentifier._object;
  uint64_t countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  swift_bridgeObjectRetain();
  unint64_t v3 = GlobalPreferences.gameModeEnabledList.getter();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10000CF70(countAndFlagsBits, (uint64_t)object), (v5 & 1) != 0))
  {
    v6.value = *(unsigned char *)(*(void *)(v3 + 56) + v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (Swift::Bool_optional)2;
  }
  return v6;
}

Swift::Void __swiftcall GlobalPreferences.setGameModeEnabled(_:bundleIdentifier:)(Swift::Bool _, Swift::String bundleIdentifier)
{
  object = bundleIdentifier._object;
  uint64_t countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  GlobalPreferences.gameModeEnabledList.getter();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10000DCB8(_, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(v2 + 16);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  [v7 setValue:isa forKey:v9];
}

Swift::Void __swiftcall GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(Swift::Bool _, Swift::OpaquePointer bundleIdentifiers)
{
  char v5 = (void *)GlobalPreferences.gameModeEnabledList.getter();
  uint64_t v6 = *((void *)bundleIdentifiers._rawValue + 2);
  if (!v6)
  {
LABEL_17:
    int64_t v24 = *(void **)(v2 + 16);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v26 = String._bridgeToObjectiveC()();
    [v24 setValue:isa forKey:v26];

    return;
  }
  Swift::Bool v7 = _;
  swift_bridgeObjectRetain();
  char v8 = (uint64_t *)((char *)bundleIdentifiers._rawValue + 40);
  while (1)
  {
    uint64_t v10 = *(v8 - 1);
    uint64_t v9 = *v8;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v13 = sub_10000CF70(v10, v9);
    uint64_t v14 = v5[2];
    BOOL v15 = (v12 & 1) == 0;
    uint64_t v16 = v14 + v15;
    if (__OFADD__(v14, v15)) {
      break;
    }
    char v17 = v12;
    if (v5[3] >= v16)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v12) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_10000E100();
        if (v17) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_10000D0CC(v16, isUniquelyReferenced_nonNull_native);
      unint64_t v18 = sub_10000CF70(v10, v9);
      if ((v17 & 1) != (v19 & 1)) {
        goto LABEL_22;
      }
      unint64_t v13 = v18;
      if (v17)
      {
LABEL_3:
        *(unsigned char *)(v5[7] + v13) = v7;
        goto LABEL_4;
      }
    }
    v5[(v13 >> 6) + 8] |= 1 << v13;
    uint64_t v20 = (uint64_t *)(v5[6] + 16 * v13);
    *uint64_t v20 = v10;
    v20[1] = v9;
    *(unsigned char *)(v5[7] + v13) = v7;
    uint64_t v21 = v5[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_21;
    }
    v5[2] = v23;
    swift_bridgeObjectRetain();
LABEL_4:
    v8 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v6)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

double GlobalPreferences.gameModeOnBannerDefaultTime.getter()
{
  unint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000544C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_10000888C((uint64_t)v7);
  }
  return 480.0;
}

double GlobalPreferences.gameModeOffBannerDefaultTime.getter()
{
  unint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000544C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_10000888C((uint64_t)v7);
  }
  return 480.0;
}

unint64_t GlobalPreferences.gameModeLastBannerDates.getter()
{
  unint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000544C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    sub_100005690(&qword_10003F618);
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_10000888C((uint64_t)v7);
  }
  return sub_10000C238((uint64_t)&_swiftEmptyArrayStorage);
}

void GlobalPreferences.gameModeLastBannerDates.setter()
{
  unint64_t v1 = *(void **)(v0 + 16);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setValue:isa forKey:v3];
}

void (*GlobalPreferences.gameModeLastBannerDates.modify(unint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = GlobalPreferences.gameModeLastBannerDates.getter();
  return sub_10000CC58;
}

void sub_10000CC58(uint64_t a1, char a2)
{
  NSString v2 = *(void **)(*(void *)(a1 + 8) + 16);
  if (a2)
  {
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 setValue:isa forKey:v3];
    swift_bridgeObjectRelease();
  }
  else
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 setValue:isa forKey:v3];
  }
}

uint64_t GlobalPreferences.gameModeLastBannerDate(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  if (*(void *)(GlobalPreferences.gameModeLastBannerDates.getter() + 16)) {
    sub_10000CF70(a1, a2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return Date.init(timeIntervalSinceReferenceDate:)();
}

void GlobalPreferences.setGameModeLastBannerDate(_:bundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GlobalPreferences.gameModeLastBannerDates.getter();
  swift_bridgeObjectRetain();
  Date.timeIntervalSinceReferenceDate.getter();
  double v7 = v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10000DE24(a2, a3, isUniquelyReferenced_nonNull_native, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void **)(v3 + 16);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v11 = String._bridgeToObjectiveC()();
  [v9 setValue:isa forKey:v11];
}

uint64_t GlobalPreferences.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t GlobalPreferences.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 56, 7);
}

unint64_t sub_10000CF70(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000CFE8(a1, a2, v4);
}

unint64_t sub_10000CFE8(uint64_t a1, uint64_t a2, uint64_t a3)
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
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000D0CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005690(&qword_10003F800);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    BOOL v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  BOOL v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *BOOL v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000D3D8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005690(&qword_10003F7F8);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000D6E0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005690(&qword_10003F7E8);
  char v35 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v2;
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v34 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v34 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v33;
          if ((v35 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v34 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v34 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = *(void *)(*(void *)(v5 + 48) + 8 * v21);
    char v31 = *(unsigned char *)(*(void *)(v5 + 56) + v21);
    if ((v35 & 1) == 0) {
      swift_retain();
    }
    Hasher.init(_seed:)();
    id v15 = *(id *)(v30 + 16);
    NSObject.hash(into:)();

    uint64_t result = Hasher._finalize()();
    uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v12 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v12 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v18 == v27;
        if (v18 == v27) {
          unint64_t v18 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v18);
      }
      while (v29 == -1);
      unint64_t v19 = __clz(__rbit64(~v29)) + (v18 << 6);
    }
    *(void *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    *(void *)(*(void *)(v7 + 48) + 8 * v19) = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v19) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v23, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000D9E0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005690(&qword_10003F7F0);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    char v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_retain();
    }
    uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000DCB8(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000CF70(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10000E100();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(unsigned char *)(v18[7] + v12) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000D0CC(result, a4 & 1);
  uint64_t result = sub_10000CF70(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a2;
  v20[1] = a3;
  *(unsigned char *)(v18[7] + v12) = a1 & 1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000DE24(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000CF70(a1, a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10000E2AC();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000D3D8(result, a3 & 1);
  uint64_t result = sub_10000CF70(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a1;
  v20[1] = a2;
  *(double *)(v18[7] + 8 * v12) = a4;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

id sub_10000DF8C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_10000591C((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000E600();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000D9E0(v12, a3 & 1);
  unint64_t v18 = sub_10000591C((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_100007FBC(0, &qword_100040C90);
    id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;

  return a2;
}

void *sub_10000E100()
{
  unint64_t v1 = v0;
  sub_100005690(&qword_10003F800);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    char v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *char v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000E2AC()
{
  unint64_t v1 = v0;
  sub_100005690(&qword_10003F7F8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_10000E45C()
{
  unint64_t v1 = v0;
  sub_100005690(&qword_10003F7E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
    id result = (void *)swift_retain();
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

void *sub_10000E600()
{
  unint64_t v1 = v0;
  sub_100005690(&qword_10003F7F0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for GlobalPreferences()
{
  return self;
}

uint64_t sub_10000E7D4()
{
  return 1;
}

Swift::Int sub_10000E7DC()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E834()
{
  return String.hash(into:)();
}

Swift::Int sub_10000E850()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E8A4@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100038DB0, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_10000E8F8(void *a1@<X8>)
{
  *a1 = 0xD000000000000031;
  a1[1] = 0x8000000100030670;
}

uint64_t sub_10000E918()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for ConfigurationBundle()
{
  return self;
}

uint64_t getEnumTagSinglePayload for ConfigurationBundleType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ConfigurationBundleType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000EA6CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000EA94()
{
  return 0;
}

ValueMetadata *type metadata accessor for ConfigurationBundleType()
{
  return &type metadata for ConfigurationBundleType;
}

unint64_t sub_10000EAB4()
{
  unint64_t result = qword_10003F8C8;
  if (!qword_10003F8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F8C8);
  }
  return result;
}

uint64_t sub_10000EB08()
{
  _StringGuts.grow(_:)(44);
  swift_bridgeObjectRelease();
  type metadata accessor for GamingMetadataModel();
  sub_100005690(&qword_10003FBC8);
  v0._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._object = (void *)0x8000000100030E80;
  v1._uint64_t countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v1);
  swift_retain();
  sub_100005690(&qword_10003FBD0);
  v2._uint64_t countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._object = (void *)0x8000000100030EA0;
  v3._uint64_t countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v3);
  swift_retain();
  sub_100005690(&qword_10003FBD8);
  v4._uint64_t countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._uint64_t countAndFlagsBits = 8194604;
  v5._object = (void *)0xE300000000000000;
  String.append(_:)(v5);
  return 60;
}

uint64_t sub_10000EC5C()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for GamingMetadataModel()
{
  return self;
}

uint64_t sub_10000ECC0()
{
  return 0x6C65646F4DLL;
}

uint64_t sub_10000ECD4()
{
  return sub_10000EB08();
}

uint64_t sub_10000ECF8()
{
  _StringGuts.grow(_:)(123);
  v0._uint64_t countAndFlagsBits = 60;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  type metadata accessor for GamingMetadataModel.Policy();
  sub_100005690(&qword_10003FBC0);
  v1._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = 0xD000000000000014;
  v2._object = (void *)0x8000000100030DE0;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  sub_100005690(&qword_10003F608);
  v3._uint64_t countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4._object = (void *)0x8000000100030E00;
  v4._uint64_t countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v4);
  swift_bridgeObjectRetain();
  v5._uint64_t countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0xD000000000000023;
  v6._object = (void *)0x8000000100030E20;
  String.append(_:)(v6);
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = Array.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 0xD000000000000024;
  v8._object = (void *)0x8000000100030E50;
  String.append(_:)(v8);
  swift_bridgeObjectRetain();
  v9._uint64_t countAndFlagsBits = Array.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = 8194604;
  v10._object = (void *)0xE300000000000000;
  String.append(_:)(v10);
  return 0;
}

uint64_t sub_10000EF20()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for GamingMetadataModel.Policy()
{
  return self;
}

uint64_t sub_10000EF94()
{
  return 0x7963696C6F50;
}

uint64_t sub_10000EFA8()
{
  return sub_10000ECF8();
}

uint64_t sub_10000EFCC()
{
  _StringGuts.grow(_:)(70);
  v1._uint64_t countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  type metadata accessor for GamingMetadataModel.Launcher();
  sub_100005690(&qword_10003FBB8);
  v2._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 0x202020200A7B203ELL;
  v3._object = (void *)0xEF203D20656D616ELL;
  String.append(_:)(v3);
  uint64_t v4 = v0[2];
  Swift::String v5 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v6._uint64_t countAndFlagsBits = v4;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._object = (void *)0x8000000100030DA0;
  v7._uint64_t countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v7);
  uint64_t v8 = v0[4];
  Swift::String v9 = (void *)v0[5];
  swift_bridgeObjectRetain();
  v10._uint64_t countAndFlagsBits = v8;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 0xD000000000000019;
  v11._object = (void *)0x8000000100030DC0;
  String.append(_:)(v11);
  uint64_t v13 = v0[6];
  unint64_t v12 = (void *)v0[7];
  swift_bridgeObjectRetain();
  v14._uint64_t countAndFlagsBits = v13;
  v14._object = v12;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._uint64_t countAndFlagsBits = 8194604;
  v15._object = (void *)0xE300000000000000;
  String.append(_:)(v15);
  return 0;
}

uint64_t sub_10000F150()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for GamingMetadataModel.Launcher()
{
  return self;
}

uint64_t sub_10000F1BC()
{
  return 0x726568636E75614CLL;
}

uint64_t sub_10000F1D4()
{
  return sub_10000EFCC();
}

uint64_t sub_10000F1F8(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  Swift::String v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  Swift::String v9 = (char *)&v39 - v8;
  kGamePolicyToolEntitlement.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [a1 valueForEntitlement:v10];

  if (v11)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v47, 0, sizeof(v47));
  }
  sub_10000544C((uint64_t)v47, (uint64_t)&aBlock);
  if (!v43)
  {
    sub_10000888C((uint64_t)&aBlock);
    goto LABEL_11;
  }
  sub_100007FBC(0, (unint64_t *)&unk_10003FC90);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    uint64_t v31 = Logger.toolCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v31, v3);
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Unable to accept incoming tool connection for unentitled process.", v34, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return 0;
  }
  id v12 = v46;
  if (([v46 BOOLValue] & 1) == 0)
  {
    uint64_t v35 = Logger.toolCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v35, v3);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unable to accept incoming tool connection for unentitled process.", v38, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    return 0;
  }
  uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_queue);
  type metadata accessor for GamePolicyToolProxy();
  Swift::String v14 = (void *)swift_allocObject();
  v14[5] = 0;
  swift_unknownObjectWeakInit();
  v14[2] = a1;
  v14[3] = v13;
  v14[5] = &off_100038F90;
  swift_unknownObjectWeakAssign();
  Swift::String v15 = self;
  id v16 = a1;
  id v17 = v13;
  id v18 = [v15 interfaceWithProtocol:&OBJC_PROTOCOL____TtP10GamePolicy20GamePolicyToolClient_];
  [v16 setRemoteObjectInterface:v18];

  id v19 = [v15 interfaceWithProtocol:&OBJC_PROTOCOL____TtP10GamePolicy20GamePolicyToolServer_];
  [v16 setExportedInterface:v19];

  [v16 setExportedObject:v14];
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = v16;
  uint64_t v44 = sub_100010890;
  uint64_t v45 = v21;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v41 = 1107296256;
  int v42 = sub_100005778;
  uint64_t v43 = &unk_100039088;
  int64_t v22 = _Block_copy(&aBlock);
  id v23 = v16;
  swift_release();
  [v23 setInvalidationHandler:v22];
  _Block_release(v22);
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = v23;
  uint64_t v44 = sub_100010928;
  uint64_t v45 = v25;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v41 = 1107296256;
  int v42 = sub_100005778;
  uint64_t v43 = &unk_1000390D8;
  char v26 = _Block_copy(&aBlock);
  id v27 = v23;
  swift_release();
  [v27 setInterruptionHandler:v26];
  _Block_release(v26);
  BOOL v28 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock);
  [v28 lock];
  uint64_t v29 = (void *)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies);
  swift_beginAccess();
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  [v28 unlock];
  [v27 resume];
  swift_release();

  return 1;
}

uint64_t sub_10000F860(void *a1)
{
  kGamePolicyPrivilegedToolEntitlement.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [a1 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v30, 0, sizeof(v30));
  }
  sub_10000544C((uint64_t)v30, (uint64_t)&aBlock);
  if (!v26)
  {
    sub_10000888C((uint64_t)&aBlock);
    return 0;
  }
  sub_100007FBC(0, (unint64_t *)&unk_10003FC90);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v5 = v29;
  if (([v29 BOOLValue] & 1) == 0)
  {

    return 0;
  }
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_queue);
  type metadata accessor for GamePolicyPrivilegedToolProxy();
  Swift::String v7 = (void *)swift_allocObject();
  v7[5] = 0;
  swift_unknownObjectWeakInit();
  _OWORD v7[2] = a1;
  v7[3] = v6;
  v7[5] = &off_100038F88;
  v7[6] = 0;
  swift_unknownObjectWeakAssign();
  id v8 = a1;
  id v9 = v6;
  Class isa = GamePolicyPrivilegedToolClientInterface()().super.isa;
  [v8 setRemoteObjectInterface:isa];

  Class v11 = GamePolicyPrivilegedToolServerInterface()().super.isa;
  [v8 setExportedInterface:v11];

  [v8 setExportedObject:v7];
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v8;
  id v27 = sub_100010344;
  uint64_t v28 = v13;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_100005778;
  char v26 = &unk_100038FE8;
  Swift::String v14 = _Block_copy(&aBlock);
  id v15 = v8;
  swift_release();
  [v15 setInvalidationHandler:v14];
  _Block_release(v14);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v15;
  id v27 = sub_10001039C;
  uint64_t v28 = v17;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_100005778;
  char v26 = &unk_100039038;
  id v18 = _Block_copy(&aBlock);
  id v19 = v15;
  swift_release();
  [v19 setInterruptionHandler:v18];
  _Block_release(v18);
  uint64_t v20 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock);
  [v20 lock];
  uint64_t v21 = (void *)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies);
  swift_beginAccess();
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  [v20 unlock];
  [v19 resume];
  swift_release();

  return 1;
}

void sub_10000FCA0(uint64_t a1, void *a2, const char *a3, void *a4, uint64_t (*a5)(uint64_t), void (*a6)(uint64_t, uint64_t))
{
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  Swift::String v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = (char *)Strong;
    id v27 = a5;
    uint64_t v28 = a6;
    uint64_t v17 = Logger.toolCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
    id v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, a3, v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v21 = OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock;
    [*(id *)&v16[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock] lock];
    int64_t v22 = (uint64_t *)&v16[*a4];
    swift_beginAccess();
    id v23 = a2;
    uint64_t v24 = sub_100010518(v22, (uint64_t)v23, v27);

    if ((unint64_t)*v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v25 = *(void *)((*v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v25 < v24)
    {
      __break(1u);
    }
    else
    {
      v28(v24, v25);
      swift_endAccess();
      [*(id *)&v16[v21] unlock];
    }
  }
}

void sub_10000FF18(uint64_t a1, void *a2, const char *a3, void *a4, uint64_t (*a5)(uint64_t), void (*a6)(uint64_t, uint64_t))
{
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  Swift::String v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = (char *)Strong;
    id v27 = a2;
    uint64_t v28 = a5;
    uint64_t v17 = Logger.toolCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
    id v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, a3, v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v21 = OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock;
    [*(id *)&v16[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock] lock];
    int64_t v22 = (uint64_t *)&v16[*a4];
    swift_beginAccess();
    id v23 = v27;
    uint64_t v24 = sub_100010518(v22, (uint64_t)v23, v28);

    if ((unint64_t)*v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v25 >= v24) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v25 = *(void *)((*v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v25 >= v24)
      {
LABEL_6:
        a6(v24, v25);
        swift_endAccess();
        [*(id *)&v16[v21] unlock];
        [v23 invalidate];

        return;
      }
    }
    __break(1u);
  }
}

id sub_100010244()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyToolCoordinator();
  return [super dealloc];
}

uint64_t type metadata accessor for GamePolicyToolCoordinator()
{
  return self;
}

uint64_t sub_100010308()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100010344()
{
  sub_10000FCA0(*(void *)(v0 + 16), *(void **)(v0 + 24), "Privileged tool connection invalidated.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies, (uint64_t (*)(uint64_t))sub_10001B128, (void (*)(uint64_t, uint64_t))sub_10001B378);
}

void sub_10001039C()
{
  sub_10000FF18(*(void *)(v0 + 16), *(void **)(v0 + 24), "Privileged tool connection interrupted.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies, (uint64_t (*)(uint64_t))sub_10001B128, (void (*)(uint64_t, uint64_t))sub_10001B378);
}

uint64_t sub_1000103F0(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
    return 0;
  }
LABEL_13:
  swift_bridgeObjectRetain();
  uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v2) {
    return 0;
  }
LABEL_3:
  sub_100007FBC(0, (unint64_t *)&unk_100040B70);
  for (uint64_t i = 0; ; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      swift_retain();
    }
    char v4 = static NSObject.== infix(_:_:)();
    swift_release();
    if (v4) {
      break;
    }
    uint64_t v5 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v5 == v2) {
      return 0;
    }
  }
  return i;
}

uint64_t sub_100010518(uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000103F0(v5);
  char v8 = v7;
  uint64_t v9 = v3;
  swift_bridgeObjectRelease();
  if (v3) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if ((unint64_t)*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v10 != v22) {
        goto LABEL_6;
      }
    }
    else if (v10 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      sub_100007FBC(0, (unint64_t *)&unk_100040B70);
      unint64_t v10 = v6 + 5;
      uint64_t v24 = v9;
      while (1)
      {
        unint64_t v11 = v10 - 4;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v11 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v11 >= *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_45;
          }
          swift_retain();
        }
        char v12 = static NSObject.== infix(_:_:)();
        swift_release();
        if ((v12 & 1) == 0) {
          break;
        }
LABEL_32:
        BOOL v18 = __OFADD__(v11, 1);
        unint64_t v19 = v10 - 3;
        if (v18) {
          goto LABEL_46;
        }
        if ((unint64_t)*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v20 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v10;
        if (v19 == v20) {
          return v6;
        }
      }
      if (v11 == v6)
      {
LABEL_31:
        BOOL v18 = __OFADD__(v6++, 1);
        if (v18) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      uint64_t v13 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v13 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v14 = *(void *)(v13 + 8 * v10);
          swift_retain();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v9 = *(void *)(v13 + 8 * v6 + 32);
        swift_retain();
        if ((v13 & 0xC000000000000001) == 0) {
          goto LABEL_17;
        }
      }
      uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v13 = *a1;
LABEL_20:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v13;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v13 < 0 || (v13 & 0x4000000000000000) != 0)
      {
        uint64_t v13 = a3(v13);
        *a1 = v13;
      }
      *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;
      swift_release();
      specialized Array._endMutation()();
      uint64_t v16 = *a1;
      int v17 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v16;
      if (!v17 || v16 < 0 || (v16 & 0x4000000000000000) != 0)
      {
        uint64_t v16 = a3(v16);
        *a1 = v16;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v11 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * v10) = v9;
      swift_release();
      specialized Array._endMutation()();
      uint64_t v9 = v24;
      goto LABEL_31;
    }
    return v6;
  }
  if (!((unint64_t)*a1 >> 62)) {
    return *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v23;
}

void sub_100010890()
{
  sub_10000FCA0(*(void *)(v0 + 16), *(void **)(v0 + 24), "Tool connection invalidated.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies, (uint64_t (*)(uint64_t))sub_10001B128, (void (*)(uint64_t, uint64_t))sub_10001B340);
}

uint64_t sub_1000108E8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100010928()
{
  sub_10000FF18(*(void *)(v0 + 16), *(void **)(v0 + 24), "Tool connection interrupted.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies, (uint64_t (*)(uint64_t))sub_10001B128, (void (*)(uint64_t, uint64_t))sub_10001B340);
}

uint64_t sub_10001097C(void *a1)
{
  uint64_t v38 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v38 - 8);
  uint64_t v3 = __chkstk_darwin(v38);
  unint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v7 = (char *)&v36 - v6;
  id v8 = [a1 serviceName];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    if (v10 == 0xD00000000000001ALL && v12 == 0x8000000100030FA0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v13)
    {
LABEL_6:
      if ((sub_10000F1F8(a1) & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  id v14 = [a1 serviceName];
  if (!v14) {
    goto LABEL_16;
  }
  id v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  if (v16 == 0xD000000000000025 && v18 == 0x8000000100030F70)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if ((sub_10000F860(a1) & 1) == 0)
  {
LABEL_16:
    uint64_t v28 = Logger.toolCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v28, v38);
    id v29 = a1;
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138412290;
      uint64_t v39 = v29;
      uint64_t v36 = v5;
      os_log_type_t v33 = v29;
      uint64_t v37 = v2;
      uint64_t v34 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v32 = v29;

      uint64_t v2 = v37;
      _os_log_impl((void *)&_mh_execute_header, v22, v30, "GamePolicyToolCoordinator: rejecting incoming connection %@", v31, 0xCu);
      sub_100005690((uint64_t *)&unk_10003FCA0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      uint64_t v27 = 0;
      char v7 = v36;
    }
    else
    {

      uint64_t v27 = 0;
      uint64_t v22 = v29;
      char v7 = v5;
    }
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v20 = Logger.toolCoordinator.unsafeMutableAddressor();
  uint64_t v37 = v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v20, v38);
  uint64_t v21 = a1;
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 138412290;
    uint64_t v39 = v21;
    uint64_t v26 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v25 = v21;

    _os_log_impl((void *)&_mh_execute_header, v22, v23, "GamePolicyToolCoordinator: accepting incoming connection %@", v24, 0xCu);
    sub_100005690((uint64_t *)&unk_10003FCA0);
    uint64_t v27 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v27 = 1;
    uint64_t v22 = v21;
  }
  uint64_t v2 = v37;
LABEL_21:

  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v38);
  return v27;
}

uint64_t sub_100010E58()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = Logger.toolCoordinator.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  char v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "GamePolicyToolProxy: ping!", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = [*(id *)(v1 + 16) remoteObjectProxy];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100005690(&qword_10003FD88);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    [v12[1] pong];
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001106C()
{
  sub_1000110D8(v0 + 32);

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for GamePolicyToolProxy()
{
  return self;
}

uint64_t sub_1000110D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011100()
{
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease();
  type metadata accessor for GamingMetadataDBBundle();
  sub_100005690(&qword_10003FE58);
  v1._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = 30240;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  v3._uint64_t countAndFlagsBits = Version.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._object = (void *)0x8000000100031090;
  v4._uint64_t countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v4);
  if (*(void *)(v0 + 56) >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  v5._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 62;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  return 60;
}

uint64_t sub_100011260()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for GamingMetadataDBBundle()
{
  return self;
}

uint64_t sub_1000112CC()
{
  return sub_100011100();
}

uint64_t sub_1000112F0()
{
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease();
  _s10DescriptorCMa();
  sub_100005690(&qword_10003FF10);
  v1._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = 0x6669746E65646920;
  v2._object = (void *)0xEC0000003D726569;
  String.append(_:)(v2);
  uint64_t v3 = v0[2];
  Swift::String v4 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v5._uint64_t countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x8000000100031110;
  v6._uint64_t countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v6);
  if (v0[4] >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 62;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 60;
}

uint64_t sub_100011468()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t _s10DescriptorCMa()
{
  return self;
}

uint64_t sub_1000114CC()
{
  return sub_1000112F0();
}

Swift::Int sub_1000114F0()
{
  return Hasher._finalize()();
}

void sub_100011534()
{
}

Swift::Int sub_10001155C()
{
  return Hasher._finalize()();
}

const char *sub_10001159C()
{
  return "modelManagerGameAssertion";
}

uint64_t sub_1000115B0()
{
  sub_1000110D8(v0 + 16);

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for GamePolicyCoordinatorObserver()
{
  return self;
}

NSString sub_10001160C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000411B8 = (uint64_t)result;
  return result;
}

NSString sub_100011644()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000411C0 = (uint64_t)result;
  return result;
}

NSString sub_10001167C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000411C8 = (uint64_t)result;
  return result;
}

NSString sub_1000116B4()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000411D0 = (uint64_t)result;
  return result;
}

NSString sub_1000116EC()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000411D8 = (uint64_t)result;
  return result;
}

__n128 sub_100011728@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v4 = *(void **)(a1 + 16);
  [v4 lock];
  swift_beginAccess();
  Swift::String v5 = *(void **)(a1 + 48);
  Swift::String v6 = *(void **)(a1 + 56);
  Swift::String v7 = *(void **)(a1 + 64);
  __n128 v23 = *(__n128 *)(a1 + 72);
  unint64_t v8 = *(void *)(a1 + 88);
  unint64_t v9 = *(void *)(a1 + 96);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  [v4 unlock];

  a2->n128_u64[0] = (unint64_t)v18;
  a2->n128_u64[1] = (unint64_t)v19;
  a2[1].n128_u64[0] = (unint64_t)v20;
  a2[1].n128_u64[1] = (unint64_t)v21;
  __n128 result = v23;
  a2[2] = v23;
  a2[3].n128_u64[0] = v8;
  a2[3].n128_u64[1] = v9;
  return result;
}

id sub_100011860(uint64_t a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = *(void **)(a1 + 16);
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 48);
  Swift::String v4 = *(void **)(a1 + 56);
  Swift::String v5 = *(void **)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  [v2 unlock];

  return v10;
}

void sub_100011950(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  __chkstk_darwin(v4);
  uint64_t v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  id v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (void *)a1[2];
  [v9 lock];
  swift_beginAccess();
  id v10 = (void *)a1[5];
  id v11 = (void *)a1[6];
  id v12 = (void *)a1[7];
  id v13 = (void *)a1[8];
  uint64_t v14 = a1[9];
  a1[9] = a2;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  id v22 = v18;
  [v9 unlock];
  if (v14 != a2)
  {
    uint64_t v23 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v44);
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    id v40 = v19;
    if (v26)
    {
      id v38 = v21;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      id v39 = v20;
      uint64_t v45 = a2;
      v46[0] = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v29 = String.init<A>(describing:)();
      id v37 = v22;
      uint64_t v45 = sub_100008130(v29, v30, v46);
      id v21 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v22 = v37;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Updating game mode enablement strategy to %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      id v20 = v39;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v44);
    if (qword_10003F328 != -1) {
      swift_once();
    }
    uint64_t v31 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v32 = String._bridgeToObjectiveC()();
    [v31 setInteger:a2 forKey:v32];
    swift_release();

    if (qword_10003F330 != -1) {
      swift_once();
    }
    v46[3] = (uint64_t)&type metadata for ModeEnablementStrategy;
    v46[0] = a2;
    id v33 = (id)qword_1000411B8;
    uint64_t v34 = v41;
    Notification.init(name:object:userInfo:)();
    id v35 = [self defaultCenter];
    Class isa = Notification._bridgeToObjectiveC()().super.isa;
    [v35 postNotification:isa];

    (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v43);
    id v19 = v40;
  }
}

void sub_100011DE0(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  __chkstk_darwin(v4);
  uint64_t v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  id v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (void *)a1[2];
  [v9 lock];
  swift_beginAccess();
  id v10 = (void *)a1[5];
  id v11 = (void *)a1[6];
  id v12 = (void *)a1[7];
  id v13 = (void *)a1[8];
  uint64_t v14 = a1[11];
  a1[11] = a2;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  id v22 = v18;
  [v9 unlock];
  if (v14 != a2)
  {
    uint64_t v23 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v44);
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    id v40 = v19;
    if (v26)
    {
      id v38 = v21;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      id v39 = v20;
      uint64_t v45 = a2;
      v46[0] = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v29 = String.init<A>(describing:)();
      id v37 = v22;
      uint64_t v45 = sub_100008130(v29, v30, v46);
      id v21 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v22 = v37;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Updating dynamic splitter enablement strategy to %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      id v20 = v39;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v44);
    if (qword_10003F328 != -1) {
      swift_once();
    }
    uint64_t v31 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v32 = String._bridgeToObjectiveC()();
    [v31 setInteger:a2 forKey:v32];
    swift_release();

    if (qword_10003F348 != -1) {
      swift_once();
    }
    v46[3] = (uint64_t)&type metadata for ModeEnablementStrategy;
    v46[0] = a2;
    id v33 = (id)qword_1000411D0;
    uint64_t v34 = v41;
    Notification.init(name:object:userInfo:)();
    id v35 = [self defaultCenter];
    Class isa = Notification._bridgeToObjectiveC()().super.isa;
    [v35 postNotification:isa];

    (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v43);
    id v19 = v40;
  }
}

void sub_100012270(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  __chkstk_darwin(v4);
  uint64_t v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  id v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (void *)a1[2];
  [v9 lock];
  swift_beginAccess();
  id v10 = (void *)a1[5];
  id v11 = (void *)a1[6];
  id v12 = (void *)a1[7];
  id v13 = (void *)a1[8];
  uint64_t v14 = a1[10];
  a1[10] = a2;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  id v22 = v18;
  [v9 unlock];
  if (v14 != a2)
  {
    uint64_t v23 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v44);
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    id v40 = v19;
    if (v26)
    {
      id v38 = v21;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      id v39 = v20;
      uint64_t v45 = a2;
      v46[0] = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v29 = String.init<A>(describing:)();
      id v37 = v22;
      uint64_t v45 = sub_100008130(v29, v30, v46);
      id v21 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v22 = v37;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Updating sustained execution mode enablement strategy to %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      id v20 = v39;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v44);
    if (qword_10003F328 != -1) {
      swift_once();
    }
    uint64_t v31 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v32 = String._bridgeToObjectiveC()();
    [v31 setInteger:a2 forKey:v32];
    swift_release();

    if (qword_10003F340 != -1) {
      swift_once();
    }
    v46[3] = (uint64_t)&type metadata for ModeEnablementStrategy;
    v46[0] = a2;
    id v33 = (id)qword_1000411C8;
    uint64_t v34 = v41;
    Notification.init(name:object:userInfo:)();
    id v35 = [self defaultCenter];
    Class isa = Notification._bridgeToObjectiveC()().super.isa;
    [v35 postNotification:isa];

    (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v43);
    id v19 = v40;
  }
}

void sub_100012700(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  __chkstk_darwin(v4);
  uint64_t v43 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  id v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (void *)a1[2];
  [v9 lock];
  swift_beginAccess();
  id v10 = (void *)a1[5];
  id v11 = (void *)a1[6];
  id v12 = (void *)a1[7];
  id v13 = (void *)a1[8];
  uint64_t v14 = a1[12];
  a1[12] = a2;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  id v22 = v18;
  [v9 unlock];
  if (v14 == a2)
  {
  }
  else
  {
    uint64_t v23 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v46);
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    id v42 = v20;
    if (v26)
    {
      id v40 = v21;
      uint64_t v27 = swift_slowAlloc();
      id v41 = v19;
      uint64_t v28 = (uint8_t *)v27;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v47 = a2;
      v48[0] = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      uint64_t v30 = String.init<A>(describing:)();
      id v39 = v22;
      uint64_t v47 = sub_100008130(v30, v31, v48);
      id v21 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v22 = v39;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Updating game mode ModelManager policy strategy to %{public}s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v19 = v41;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v46);
    if (qword_10003F328 != -1) {
      swift_once();
    }
    NSString v32 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v33 = String._bridgeToObjectiveC()();
    [v32 setInteger:a2 forKey:v33];
    swift_release();

    if (qword_10003F338 != -1) {
      swift_once();
    }
    v48[3] = (uint64_t)&type metadata for ModelManagerPolicyStrategy;
    v48[0] = a2;
    id v34 = (id)qword_1000411C0;
    id v35 = v43;
    Notification.init(name:object:userInfo:)();
    id v36 = [self defaultCenter];
    Class isa = Notification._bridgeToObjectiveC()().super.isa;
    [v36 postNotification:isa];

    id v38 = v42;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v35, v45);
  }
}

id sub_100012BB4(uint64_t a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = *(void **)(a1 + 16);
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void **)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  id v13 = v10;
  id v14 = v9;
  [v2 unlock];

  return v13;
}

id sub_100012CA8(uint64_t a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = *(void **)(a1 + 16);
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void **)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v7;
  id v11 = v6;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [v2 unlock];

  return v12;
}

id sub_100012D9C(uint64_t a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = *(void **)(a1 + 16);
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void **)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  [v2 unlock];

  return v13;
}

uint64_t sub_100012E98(void *a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = (void *)a1[2];
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = (void *)a1[7];
  id v6 = (void *)a1[8];
  uint64_t v7 = a1[9];
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  [v2 unlock];

  return v7;
}

uint64_t sub_100012F88(void *a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = (void *)a1[2];
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = (void *)a1[7];
  id v6 = (void *)a1[8];
  uint64_t v7 = a1[10];
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  [v2 unlock];

  return v7;
}

uint64_t sub_100013078(void *a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = (void *)a1[2];
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = (void *)a1[7];
  id v6 = (void *)a1[8];
  uint64_t v7 = a1[11];
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  [v2 unlock];

  return v7;
}

uint64_t sub_10001316C(void *a1)
{
  type metadata accessor for Notification();
  type metadata accessor for Logger();
  Swift::String v2 = (void *)a1[2];
  [v2 lock];
  swift_beginAccess();
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = (void *)a1[7];
  id v6 = (void *)a1[8];
  uint64_t v7 = a1[12];
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  [v2 unlock];

  return v7;
}

uint64_t sub_10001325C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (void *)(a1 + 32);
  swift_beginAccess();
  swift_retain();
  unint64_t v10 = swift_bridgeObjectRetain();
  char v11 = sub_100018080(v10, a2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
    swift_retain_n();
    id v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v22 = v2;
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v23[0] = v21;
      id v20 = v16;
      *(_DWORD *)id v16 = 136446210;
      id v19 = v16 + 4;
      uint64_t v24 = a2;
      type metadata accessor for GamePolicyCoordinatorObserver();
      swift_retain();
      uint64_t v17 = String.init<A>(describing:)();
      uint64_t v24 = sub_100008130(v17, v18, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "registerObserver: %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_beginAccess();
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_100013578(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (uint64_t *)(a1 + 32);
  swift_beginAccess();
  swift_retain();
  unint64_t v10 = swift_bridgeObjectRetain();
  char v11 = sub_100018080(v10, a2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (v11)
  {
    uint64_t v13 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
    swift_retain_n();
    id v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v24 = v2;
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v25[0] = v23;
      uint64_t v22 = v16;
      *(_DWORD *)id v16 = 136446210;
      uint64_t v21 = v16 + 4;
      uint64_t v26 = a2;
      type metadata accessor for GamePolicyCoordinatorObserver();
      swift_retain();
      uint64_t v17 = String.init<A>(describing:)();
      uint64_t v26 = sub_100008130(v17, v18, v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "unregisterObserver: %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_beginAccess();
    swift_retain();
    uint64_t v19 = sub_100016C70(v9, a2);
    uint64_t result = swift_release();
    if ((unint64_t)*v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v20 >= v19) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v20 = *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v20 >= v19)
      {
LABEL_7:
        sub_10001B35C(v19, v20);
        return swift_endAccess();
      }
    }
    __break(1u);
  }
  return result;
}

void *sub_1000138C8()
{
  type metadata accessor for GamePolicyCoordinator();
  swift_allocObject();
  uint64_t result = sub_100013904();
  off_10003FF18 = result;
  return result;
}

void *sub_100013904()
{
  uint64_t v1 = type metadata accessor for DynamicSplitterStatus.Config();
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v60 = (uint64_t)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v62 = (char *)&v51 - v4;
  uint64_t v5 = type metadata accessor for SustainedExecutionStatus.Config();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v58 = (uint64_t)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v61 = (char *)&v51 - v8;
  uint64_t v9 = type metadata accessor for ModelManagerGameAssertionStatus.Config();
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v59 = (uint64_t)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v64 = (uint64_t)&v51 - v12;
  uint64_t v13 = sub_100005690(&qword_100040128);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  id v57 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v55 = (char *)&v51 - v16;
  uint64_t v17 = type metadata accessor for GameModeStatus.Config();
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v56 = (uint64_t)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v63 = (uint64_t)&v51 - v20;
  uint64_t v21 = type metadata accessor for String.Encoding();
  uint64_t v53 = *(void *)(v21 - 8);
  id v54 = (id)v21;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v24 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v26 = (char *)&v51 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v27);
  uint64_t v28 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v28 - 8);
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)NSLock) init];
  unint64_t v51 = sub_1000169DC();
  static DispatchQoS.unspecified.getter();
  uint64_t v65 = &_swiftEmptyArrayStorage;
  sub_100018188((unint64_t *)&qword_100040138, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005690(&qword_100040140);
  sub_1000181D0((unint64_t *)&qword_100040148, &qword_100040140);
  uint64_t v29 = (void *)v0;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v26, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v52);
  *(void *)(v0 + 24) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v0 + 32) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 104) = 0;
  int out_token = 0;
  uint64_t v65 = (void *)0xD00000000000003DLL;
  unint64_t v66 = 0x8000000100031240;
  static String.Encoding.utf8.getter();
  sub_100016A64();
  uint64_t v30 = StringProtocol.cString(using:)();
  (*(void (**)(char *, id))(v53 + 8))(v23, v54);
  swift_bridgeObjectRelease();
  if (v30) {
    unint64_t v31 = (const char *)(v30 + 32);
  }
  else {
    unint64_t v31 = 0;
  }
  notify_register_check(v31, &out_token);
  swift_bridgeObjectRelease();
  *(_DWORD *)(v0 + 112) = out_token;
  if (qword_10003F328 != -1) {
    swift_once();
  }
  swift_retain();
  id v54 = GlobalPreferences.gameModeEnablementStrategy.getter();
  swift_release();
  uint64_t v32 = type metadata accessor for Date();
  NSString v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
  id v34 = v55;
  v33(v55, 1, 1, v32);
  id v35 = v57;
  v33(v57, 1, 1, v32);
  GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
  swift_retain();
  uint64_t v53 = GlobalPreferences.modelManagerGameAssertionPolicyStrategy.getter();
  swift_release();
  v33(v34, 1, 1, v32);
  v33(v35, 1, 1, v32);
  ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)();
  swift_retain();
  uint64_t v52 = (uint64_t)GlobalPreferences.semEnablementStrategy.getter();
  swift_release();
  v33(v34, 1, 1, v32);
  v33(v35, 1, 1, v32);
  uint64_t v36 = (uint64_t)v61;
  SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
  swift_retain();
  unint64_t v51 = (unint64_t)GlobalPreferences.dynamicSplitterEnablementStrategy.getter();
  swift_release();
  v33(v34, 1, 1, v32);
  v33(v35, 1, 1, v32);
  uint64_t v37 = (uint64_t)v62;
  DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
  uint64_t v38 = v63;
  sub_100016AB8(v63, v56, (uint64_t (*)(void))&type metadata accessor for GameModeStatus.Config);
  id v39 = objc_allocWithZone((Class)type metadata accessor for GameModeStatus());
  uint64_t v40 = GameModeStatus.init(config:)();
  sub_100016AB8(v36, v58, (uint64_t (*)(void))&type metadata accessor for SustainedExecutionStatus.Config);
  id v41 = objc_allocWithZone((Class)type metadata accessor for SustainedExecutionStatus());
  uint64_t v42 = SustainedExecutionStatus.init(config:)();
  sub_100016AB8(v37, v60, (uint64_t (*)(void))&type metadata accessor for DynamicSplitterStatus.Config);
  id v43 = objc_allocWithZone((Class)type metadata accessor for DynamicSplitterStatus());
  uint64_t v44 = DynamicSplitterStatus.init(config:)();
  uint64_t v45 = v64;
  sub_100016AB8(v64, v59, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  id v46 = objc_allocWithZone((Class)type metadata accessor for ModelManagerGameAssertionStatus());
  uint64_t v47 = ModelManagerGameAssertionStatus.init(config:)();
  sub_100016B20(v37, (uint64_t (*)(void))&type metadata accessor for DynamicSplitterStatus.Config);
  sub_100016B20(v36, (uint64_t (*)(void))&type metadata accessor for SustainedExecutionStatus.Config);
  sub_100016B20(v45, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  sub_100016B20(v38, (uint64_t (*)(void))&type metadata accessor for GameModeStatus.Config);
  v29[5] = v40;
  v29[6] = v42;
  v29[7] = v44;
  v29[8] = v47;
  uint64_t v48 = v52;
  v29[9] = v54;
  v29[10] = v48;
  uint64_t v49 = v53;
  v29[11] = v51;
  v29[12] = v49;
  return v29;
}

uint64_t sub_1000142D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for String.Encoding();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005690(&qword_100040168);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 104);
  if (v9)
  {
    *(void *)(v1 + 104) = 0;
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    _OWORD v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    swift_retain();
    sub_1000145DC((uint64_t)v8, (uint64_t)&unk_1000401E0, (uint64_t)v11);
    swift_release();
    int v12 = *(_DWORD *)(v1 + 112);
    if (v12)
    {
      notify_set_state(v12, 0);
      v20[0] = 0xD00000000000003DLL;
      v20[1] = 0x8000000100031240;
      static String.Encoding.utf8.getter();
      sub_100016A64();
      uint64_t v13 = StringProtocol.cString(using:)();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      swift_bridgeObjectRelease();
      if (v13) {
        uint64_t v14 = (const char *)(v13 + 32);
      }
      else {
        uint64_t v14 = 0;
      }
      notify_post(v14);
      swift_bridgeObjectRelease();
    }
    swift_release();
  }
  int v15 = *(_DWORD *)(v1 + 112);
  if (v15) {
    notify_cancel(v15);
  }

  swift_bridgeObjectRelease();
  uint64_t v16 = *(void **)(v1 + 40);
  uint64_t v17 = *(void **)(v1 + 48);
  uint64_t v18 = *(void **)(v1 + 56);

  swift_release();
  return v1;
}

uint64_t sub_100014548()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018C5C;
  return Assertion.invalidate()();
}

uint64_t sub_1000145DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000188B4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100014780()
{
  sub_1000142D4();

  return _swift_deallocClassInstance(v0, 116, 7);
}

uint64_t type metadata accessor for GamePolicyCoordinator()
{
  return self;
}

uint64_t sub_1000147D8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v10 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = a2;
  uint64_t v11 = a2;

  if (v11[direct field offset for GameModeStatus.enabled] == 1) {
    static os_signpost_type_t.begin.getter();
  }
  else {
    static os_signpost_type_t.end.getter();
  }
  id v12 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess();
  *a3 = *(void *)(a1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10001496C(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v21 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)v1[2];
  [v9 lock];
  swift_beginAccess();
  uint64_t v10 = (void *)v1[8];
  v1[8] = a1;
  id v22 = a1;

  swift_beginAccess();
  unint64_t v11 = v1[4];
  swift_bridgeObjectRetain();
  [v9 unlock];
  aBlock[4] = sub_100018184;
  uint64_t v25 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005778;
  aBlock[3] = &unk_100039198;
  id v12 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  id v23 = &_swiftEmptyArrayStorage;
  sub_100018188(&qword_100040158, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005690((uint64_t *)&unk_100040B80);
  sub_1000181D0((unint64_t *)&qword_100040160, (uint64_t *)&unk_100040B80);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
  uint64_t result = swift_release();
  if (!(v11 >> 62))
  {
    uint64_t v14 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v14) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if ((v11 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v17 = [*(id *)(Strong + 16) remoteObjectProxy];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100005690(&qword_100040CE0);
        if (swift_dynamicCast())
        {
          [v23 updateStatus:0 :v22 :0 :0];
          swift_unknownObjectRelease();
        }
        swift_unknownObjectRelease();
      }
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GamePolicyCoordinator.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for GamePolicyCoordinator.State(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for GamePolicyCoordinator.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  return a1;
}

uint64_t assignWithCopy for GamePolicyCoordinator.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  long long v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 24);
  uint64_t v14 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v13;
  id v15 = v13;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for GamePolicyCoordinator.State(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for GamePolicyCoordinator.State(uint64_t a1, _OWORD *a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  long long v6 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for GamePolicyCoordinator.State(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GamePolicyCoordinator.State(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyCoordinator.State()
{
  return &type metadata for GamePolicyCoordinator.State;
}

uint64_t sub_10001503C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005690(&qword_100040168);
  __chkstk_darwin(v2 - 8);
  long long v4 = &v39[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for ModelManagerGameAssertionStatus.Config();
  __chkstk_darwin(v5 - 8);
  long long v7 = &v39[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for DispatchPredicate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = &v39[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v12 = (void *)v1[3];
  *id v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  id v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    id v15 = (void *)v1[2];
    [v15 lock];
    swift_beginAccess();
    uint64_t v16 = (void *)v1[8];
    id v17 = *(void (**)(void))((swift_isaMask & *v16) + 0xB8);
    uint64_t v18 = v16;
    v17();

    [v15 unlock];
    uint64_t v40 = &type metadata for GamePolicyCoordinatorFF;
    unint64_t v41 = sub_100018220();
    LOBYTE(v18) = isFeatureEnabled(_:)();
    sub_100008204((uint64_t)v39);
    if ((v18 & 1) == 0 || (int v19 = *v7, v19 == 2))
    {
      uint64_t v20 = v1[13];
      if (!v20) {
        return sub_100016B20((uint64_t)v7, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
      }
      v1[13] = 0;
      uint64_t v21 = type metadata accessor for TaskPriority();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
      id v22 = (void *)swift_allocObject();
      v22[2] = 0;
      v22[3] = 0;
      v22[4] = v20;
      swift_retain();
      sub_1000145DC((uint64_t)v4, (uint64_t)&unk_100040180, (uint64_t)v22);
      swift_release();
      sub_1000158D0();
LABEL_25:
      swift_release();
      return sub_100016B20((uint64_t)v7, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
    }
    int v23 = v19 & 1;
    uint64_t v24 = v1[13];
    if (v24)
    {
      swift_retain();
      uint64_t v25 = Assertion.policy.getter();
      uint64_t v27 = v26;
      v28._uint64_t countAndFlagsBits = v25;
      v28._object = v27;
      Swift::Int v29 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100038DE8, v28);
      swift_bridgeObjectRelease();
      if (v29)
      {
        if (v29 != 1) {
          goto LABEL_25;
        }
        unint64_t v30 = 0x4D656D6147414141;
        unint64_t v31 = 0xEB0000000065646FLL;
      }
      else
      {
        unint64_t v30 = 0xD000000000000010;
        unint64_t v31 = 0x80000001000306B0;
      }
      if (v23) {
        unint64_t v32 = 0x4D656D6147414141;
      }
      else {
        unint64_t v32 = 0xD000000000000010;
      }
      if (v23) {
        unint64_t v33 = 0xEB0000000065646FLL;
      }
      else {
        unint64_t v33 = 0x80000001000306B0;
      }
      if (v30 == v32 && v31 == v33)
      {
        swift_bridgeObjectRelease_n();
LABEL_22:
        sub_100016B20((uint64_t)v7, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
        return swift_release();
      }
      char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_22;
      }
      v1[13] = 0;
      swift_release();
      uint64_t v35 = type metadata accessor for TaskPriority();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v4, 1, 1, v35);
      uint64_t v36 = (void *)swift_allocObject();
      v36[2] = 0;
      v36[3] = 0;
      v36[4] = v24;
      sub_1000145DC((uint64_t)v4, (uint64_t)&unk_1000401A0, (uint64_t)v36);
      swift_release();
    }
    uint64_t v37 = type metadata accessor for TaskPriority();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v4, 1, 1, v37);
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = 0;
    *(void *)(v38 + 24) = 0;
    *(unsigned char *)(v38 + 32) = v23;
    *(void *)(v38 + 40) = v1;
    swift_retain();
    sub_1000145DC((uint64_t)v4, (uint64_t)&unk_100040190, v38);
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000155A8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v10 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = a2;
  id v11 = a2;

  if (v11[direct field offset for SustainedExecutionStatus.enabled] == 1) {
    static os_signpost_type_t.begin.getter();
  }
  else {
    static os_signpost_type_t.end.getter();
  }
  id v12 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess();
  *a3 = *(void *)(a1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10001573C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v10 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = a2;
  id v11 = a2;

  if (v11[direct field offset for DynamicSplitterStatus.enabled] == 1) {
    static os_signpost_type_t.begin.getter();
  }
  else {
    static os_signpost_type_t.end.getter();
  }
  id v12 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess();
  *a3 = *(void *)(a1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000158D0()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  long long v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (void *)((char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v0 + 24);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  int v12 = *(_DWORD *)(v0 + 112);
  if (v12)
  {
    if (*(void *)(v0 + 104))
    {
      swift_retain();
      uint64_t v13 = Assertion.policy.getter();
      id v15 = v14;
      v16._uint64_t countAndFlagsBits = v13;
      v16._object = v15;
      Swift::Int v17 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100038DE8, v16);
      swift_bridgeObjectRelease();
      if (!v17)
      {
        int v18 = v12;
        uint64_t v19 = 1;
        goto LABEL_8;
      }
      if (v17 == 1)
      {
        int v18 = v12;
        uint64_t v19 = 2;
LABEL_8:
        notify_set_state(v18, v19);
        swift_release();
LABEL_11:
        v22[0] = 0xD00000000000003DLL;
        v22[1] = 0x8000000100031240;
        static String.Encoding.utf8.getter();
        sub_100016A64();
        uint64_t v20 = StringProtocol.cString(using:)();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
        swift_bridgeObjectRelease();
        if (v20) {
          uint64_t v21 = (const char *)(v20 + 32);
        }
        else {
          uint64_t v21 = 0;
        }
        notify_post(v21);
        return swift_bridgeObjectRelease();
      }
      swift_release();
    }
    notify_set_state(v12, 0);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_100015B60(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 128) = a5;
  *(unsigned char *)(v5 + 208) = a4;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  *(void *)(v5 + 136) = v7;
  *(void *)(v5 + 144) = *(void *)(v7 - 8);
  *(void *)(v5 + 152) = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DispatchQoS();
  *(void *)(v5 + 160) = v8;
  *(void *)(v5 + 168) = *(void *)(v8 - 8);
  *(void *)(v5 + 176) = swift_task_alloc();
  BOOL v9 = (a4 & 1) == 0;
  if (a4) {
    unint64_t v10 = 0x4D656D6147414141;
  }
  else {
    unint64_t v10 = 0xD000000000000010;
  }
  if (v9) {
    unint64_t v11 = 0x80000001000306B0;
  }
  else {
    unint64_t v11 = 0xEB0000000065646FLL;
  }
  type metadata accessor for Assertion();
  int v12 = (void *)swift_task_alloc();
  *(void *)(v5 + 184) = v12;
  *int v12 = v5;
  v12[1] = sub_100015D2C;
  return Assertion.__allocating_init(policy:description:)(v10, v11, 0xD000000000000015, 0x8000000100030A10);
}

uint64_t sub_100015D2C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1000160CC;
  }
  else
  {
    *(void *)(v4 + 200) = a1;
    uint64_t v5 = sub_100015E54;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100015E54()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  uint64_t v12 = v0[21];
  uint64_t v13 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v11 = v0[18];
  char v4 = v0[26] & 1;
  uint64_t v10 = v0[19];
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v1;
  *(unsigned char *)(v6 + 32) = v4;
  v0[12] = sub_1000186F0;
  v0[13] = v6;
  v0[8] = _NSConcreteStackBlock;
  v0[9] = 1107296256;
  v0[10] = sub_100005778;
  v0[11] = &unk_1000392D8;
  uint64_t v7 = _Block_copy(v0 + 8);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v0[15] = &_swiftEmptyArrayStorage;
  sub_100018188(&qword_100040158, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005690((uint64_t *)&unk_100040B80);
  sub_1000181D0((unint64_t *)&qword_100040160, (uint64_t *)&unk_100040B80);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  swift_release();
  _Block_release(v7);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v13);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000160CC()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[22];
  uint64_t v11 = v0[21];
  uint64_t v12 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v10 = v0[18];
  uint64_t v9 = v0[19];
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v4;
  v0[6] = sub_100018678;
  v0[7] = v5;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100005778;
  v0[5] = &unk_100039288;
  uint64_t v6 = _Block_copy(v0 + 2);
  swift_errorRetain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v0[14] = &_swiftEmptyArrayStorage;
  sub_100018188(&qword_100040158, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005690((uint64_t *)&unk_100040B80);
  sub_1000181D0((unint64_t *)&qword_100040160, (uint64_t *)&unk_100040B80);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v6);
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v3);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v12);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100016338(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + 16;
  uint64_t v8 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v16[1] = v7;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v3;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138543362;
    swift_errorRetain();
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v18 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v13 = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to create ModelManager assertion: %{public}@", v12, 0xCu);
    sub_100005690((uint64_t *)&unk_10003FCA0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v17;
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000158D0();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000165A0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_100005690(&qword_100040168);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result + 104);
    *(void *)(result + 104) = a2;
    swift_retain();
    sub_1000158D0();
    sub_10001503C();
    if (!v10) {
      return swift_release();
    }
    swift_retain();
    uint64_t v11 = Assertion.policy.getter();
    uint64_t v13 = v12;
    v14._uint64_t countAndFlagsBits = v11;
    v14._object = v13;
    Swift::Int v15 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100038DE8, v14);
    swift_bridgeObjectRelease();
    if (v15)
    {
      if (v15 != 1) {
        goto LABEL_9;
      }
      if ((a3 & 1) == 0)
      {
        *(void *)(v9 + 104) = v10;
        swift_retain();
        swift_release();
        uint64_t v16 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
        uint64_t v17 = (void *)swift_allocObject();
        v17[2] = 0;
        v17[3] = 0;
        v17[4] = a2;
        swift_retain();
        sub_1000145DC((uint64_t)v7, (uint64_t)&unk_1000401C0, (uint64_t)v17);
        swift_release();
        sub_1000158D0();
        goto LABEL_9;
      }
    }
    uint64_t v18 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v7, 1, 1, v18);
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = 0;
    v19[3] = 0;
    v19[4] = v10;
    sub_1000145DC((uint64_t)v7, (uint64_t)&unk_1000401B0, (uint64_t)v19);
LABEL_9:
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100016808(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000168E4;
  return v6(a1);
}

uint64_t sub_1000168E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1000169DC()
{
  unint64_t result = qword_100040130;
  if (!qword_100040130)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100040130);
  }
  return result;
}

uint64_t sub_100016A1C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100016A64()
{
  unint64_t result = qword_100040150;
  if (!qword_100040150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040150);
  }
  return result;
}

uint64_t sub_100016AB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100016B20(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100016B80(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }
      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1)) {
        break;
      }
      if (++v5 == v4) {
        return 0;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100016C70(uint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_100016B80(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if ((unint64_t)*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v9 != v22) {
        goto LABEL_6;
      }
    }
    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        uint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0) {
          break;
        }
        if ((v11 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_45;
        }
        if (*(void *)(v12 + 8 * i) != a2) {
          goto LABEL_11;
        }
LABEL_31:
        uint64_t v9 = i - 3;
        if (__OFADD__(v11, 1)) {
          goto LABEL_46;
        }
        if ((unint64_t)*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v18 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v18) {
          return v6;
        }
      }
      uint64_t v19 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      swift_unknownObjectRelease();
      if (v19 == a2) {
        goto LABEL_31;
      }
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_31;
      }
      uint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v14 = *(void *)(v9 + 8 * i);
          swift_retain();
          goto LABEL_19;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v13 = *(void *)(v9 + 8 * v6 + 32);
        swift_retain();
        if ((v9 & 0xC000000000000001) == 0) {
          goto LABEL_16;
        }
      }
      uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v9 = *a1;
LABEL_19:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v9 < 0 || (v9 & 0x4000000000000000) != 0)
      {
        uint64_t v9 = sub_10001B128(v9);
        *a1 = v9;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;
      swift_release();
      specialized Array._endMutation()();
      uint64_t v9 = *a1;
      int v16 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v16 || v9 < 0 || (v9 & 0x4000000000000000) != 0)
      {
        uint64_t v9 = sub_10001B128(v9);
        *a1 = v9;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * i) = v13;
      swift_release();
      specialized Array._endMutation()();
      goto LABEL_30;
    }
    return v6;
  }
  unint64_t v20 = *a1;
  if (!(v20 >> 62)) {
    return *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_100016F8C(void *a1, uint64_t a2, unsigned char *a3, unsigned char *a4, void *a5, uint64_t a6, void *a7, unsigned char *a8, unsigned char *a9, char *a10)
{
  v124 = a7;
  v123 = (void *)a6;
  v122 = a5;
  v119 = a4;
  id v117 = a3;
  uint64_t v116 = a2;
  unint64_t v115 = (unint64_t)a9;
  v113 = a10;
  uint64_t v125 = type metadata accessor for Notification();
  uint64_t v127 = *(void *)(v125 - 8);
  __chkstk_darwin(v125 - 8);
  v126 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)type metadata accessor for Logger();
  uint64_t v102 = *(v13 - 1);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v107 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v121 = (char *)&v100 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v101 = (char *)&v100 - v19;
  __chkstk_darwin(v18);
  unint64_t v103 = (char *)&v100 - v20;
  uint64_t v21 = (void *)a1[2];
  [v21 lock];
  swift_beginAccess();
  uint64_t v22 = (void *)a1[5];
  uint64_t v23 = (void *)a1[6];
  uint64_t v25 = (void *)a1[7];
  uint64_t v24 = (void *)a1[8];
  uint64_t v26 = a1[9];
  uint64_t v104 = (void *)a1[10];
  v105 = (void *)a1[11];
  v106 = (void *)a1[12];
  swift_beginAccess();
  id v120 = v22;
  id v118 = v23;
  id v114 = v25;
  id v111 = v24;
  sub_100023130(a1 + 5, v116, v117, v119, v122, (uint64_t)v123, v124, a8, &v129, (unsigned char *)v115, v113);
  swift_endAccess();
  uint64_t v27 = (void *)a1[5];
  Swift::String v28 = (void *)a1[6];
  Swift::Int v29 = (void *)a1[7];
  unint64_t v30 = (void *)a1[8];
  uint64_t v31 = a1[9];
  v122 = (void *)a1[10];
  v123 = (void *)a1[11];
  v124 = (void *)a1[12];
  id v117 = v27;
  v113 = v28;
  id v110 = v29;
  id v109 = v30;
  uint64_t v32 = v102;
  [v21 unlock];
  uint64_t v108 = v129;
  LODWORD(v119) = BYTE1(v129);
  LODWORD(v116) = BYTE2(v129);
  unint64_t v115 = BYTE3(v129);
  unint64_t v33 = &stru_10003E000;
  char v34 = &stru_10003E000;
  int v112 = BYTE4(v129);
  if (v26 != v31)
  {
    uint64_t v35 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, void *))(v32 + 16))(v103, v35, v13);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      v129 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 136446210;
      v128 = (void *)v31;
      uint64_t v39 = String.init<A>(describing:)();
      v128 = (void *)sub_100008130(v39, v40, (uint64_t *)&v129);
      char v34 = &stru_10003E000;
      unint64_t v33 = &stru_10003E000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Updating game mode enablement strategy to %{public}s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, void *))(v32 + 8))(v103, v13);
    if (qword_10003F328 != -1) {
      swift_once();
    }
    unint64_t v41 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v42 = String._bridgeToObjectiveC()();
    [v41 setInteger:v31 forKey:v42];
    swift_release();

    if (qword_10003F330 != -1) {
      swift_once();
    }
    v130 = &type metadata for ModeEnablementStrategy;
    v129 = (void *)v31;
    id v43 = (id)qword_1000411B8;
    uint64_t v44 = v126;
    Notification.init(name:object:userInfo:)();
    id v45 = [self (SEL)v33[84].imp];
    Class isa = Notification._bridgeToObjectiveC()().super.isa;
    [v45 v34[85].name isa];

    (*(void (**)(char *, uint64_t))(v127 + 8))(v44, v125);
  }
  uint64_t v47 = v122;
  if (v104 != v122)
  {
    uint64_t v48 = Logger.policyCoordinator.unsafeMutableAddressor();
    uint64_t v49 = v101;
    (*(void (**)(char *, uint64_t, void *))(v32 + 16))(v101, v48, v13);
    v50 = Logger.logObject.getter();
    os_log_type_t v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      v129 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136446210;
      v128 = v47;
      uint64_t v53 = String.init<A>(describing:)();
      v128 = (void *)sub_100008130(v53, v54, (uint64_t *)&v129);
      char v34 = &stru_10003E000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Updating sustained execution mode enablement strategy to %{public}s", v52, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, void *))(v32 + 8))(v101, v13);
    }
    else
    {

      (*(void (**)(char *, void *))(v32 + 8))(v49, v13);
    }
    if (qword_10003F328 != -1) {
      swift_once();
    }
    uint64_t v55 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v56 = String._bridgeToObjectiveC()();
    id v57 = v55;
    uint64_t v58 = v122;
    [v57 setInteger:v122 forKey:v56];
    swift_release();

    if (qword_10003F340 != -1) {
      swift_once();
    }
    v130 = &type metadata for ModeEnablementStrategy;
    v129 = v58;
    id v59 = (id)qword_1000411C8;
    uint64_t v60 = v126;
    Notification.init(name:object:userInfo:)();
    id v61 = [self (SEL)v33[84].imp];
    Class v62 = Notification._bridgeToObjectiveC()().super.isa;
    [v61 v34[85].name:v62];

    (*(void (**)(char *, uint64_t))(v127 + 8))(v60, v125);
  }
  uint64_t v63 = v121;
  if (v105 != v123)
  {
    uint64_t v64 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, void *))(v32 + 16))(v63, v64, v13);
    uint64_t v65 = v63;
    unint64_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      v122 = v13;
      id v68 = (uint8_t *)swift_slowAlloc();
      v129 = (void *)swift_slowAlloc();
      *(_DWORD *)id v68 = 136446210;
      v128 = v123;
      uint64_t v69 = String.init<A>(describing:)();
      v128 = (void *)sub_100008130(v69, v70, (uint64_t *)&v129);
      unint64_t v71 = v122;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Updating dynamic splitter enablement strategy to %{public}s", v68, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v13 = v71;
      (*(void (**)(char *, void *))(v32 + 8))(v121, v71);
    }
    else
    {

      (*(void (**)(char *, void *))(v32 + 8))(v65, v13);
    }
    if (qword_10003F328 != -1) {
      swift_once();
    }
    int v72 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v73 = String._bridgeToObjectiveC()();
    id v74 = v72;
    uint64_t v75 = (uint64_t)v123;
    [v74 setInteger:v123 forKey:v73];
    swift_release();

    if (qword_10003F348 != -1) {
      swift_once();
    }
    v130 = &type metadata for ModeEnablementStrategy;
    v129 = (void *)v75;
    id v76 = (id)qword_1000411D0;
    os_log_type_t v77 = v126;
    Notification.init(name:object:userInfo:)();
    id v78 = [self (SEL)v33[84].imp];
    Class v79 = Notification._bridgeToObjectiveC()().super.isa;
    [v78 v34[85].name:v79];

    (*(void (**)(char *, uint64_t))(v127 + 8))(v77, v125);
  }
  v80 = v107;
  if (v106 == v124)
  {
  }
  else
  {
    uint64_t v81 = Logger.policyCoordinator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, void *))(v32 + 16))(v80, v81, v13);
    uint64_t v82 = Logger.logObject.getter();
    os_log_type_t v83 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v82, v83))
    {
      v122 = v13;
      id v84 = (uint8_t *)swift_slowAlloc();
      v129 = (void *)swift_slowAlloc();
      *(_DWORD *)id v84 = 136446210;
      v128 = v124;
      uint64_t v85 = String.init<A>(describing:)();
      v128 = (void *)sub_100008130(v85, v86, (uint64_t *)&v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "Updating game mode ModelManager policy strategy to %{public}s", v84, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, void *))(v32 + 8))(v80, v122);
      char v34 = &stru_10003E000;
    }
    else
    {

      (*(void (**)(char *, void *))(v32 + 8))(v80, v13);
    }
    if (qword_10003F328 != -1) {
      swift_once();
    }
    v87 = (void *)*((void *)off_10003F5F8 + 2);
    swift_retain();
    NSString v88 = String._bridgeToObjectiveC()();
    uint64_t v89 = v87;
    v90 = v124;
    [v89 setInteger:v124 forKey:v88];
    swift_release();

    if (qword_10003F338 != -1) {
      swift_once();
    }
    v130 = &type metadata for ModelManagerPolicyStrategy;
    v129 = v90;
    id v91 = (id)qword_1000411C0;
    id v92 = v126;
    Notification.init(name:object:userInfo:)();
    id v93 = [self (SEL)v33[84].imp];
    Class v94 = Notification._bridgeToObjectiveC()().super.isa;
    [v93 v34[85].name v94];

    (*(void (**)(char *, uint64_t))(v127 + 8))(v92, v125);
  }
  uint64_t v95 = &_mh_execute_header;
  if (!v112) {
    uint64_t v95 = 0;
  }
  unint64_t v96 = (unint64_t)v95 | (v115 << 24);
  uint64_t v97 = 0x10000;
  if (!v116) {
    uint64_t v97 = 0;
  }
  uint64_t v98 = 256;
  if (!v119) {
    uint64_t v98 = 0;
  }
  return v96 | v97 | v98 | v108;
}

uint64_t sub_100018080(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = 0;
      while ((a1 & 0xC000000000000001) == 0)
      {
        if (__OFADD__(v5, 1)) {
          goto LABEL_13;
        }
        uint64_t v9 = *(void *)(a1 + 32 + 8 * v5++);
        if (v9 == a2)
        {
LABEL_11:
          swift_bridgeObjectRelease();
          return 1;
        }
LABEL_4:
        if (v5 == v4) {
          goto LABEL_15;
        }
      }
      uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      if (!__OFADD__(v5++, 1)) {
        break;
      }
      __break(1u);
LABEL_13:
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      if (!v4) {
        goto LABEL_15;
      }
    }
    uint64_t v8 = v6;
    swift_unknownObjectRelease();
    if (v8 == a2) {
      goto LABEL_11;
    }
    goto LABEL_4;
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100018188(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000181D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016A1C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100018220()
{
  unint64_t result = qword_100040170;
  if (!qword_100040170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100040170);
  }
  return result;
}

uint64_t sub_100018278()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018350;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018C5C;
  return Assertion.invalidate()();
}

uint64_t sub_100018350()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100018444()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100018484(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100018C5C;
  return sub_100015B60(a1, v4, v5, v6, v7);
}

uint64_t sub_10001854C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018C5C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018C5C;
  return Assertion.invalidate()();
}

uint64_t sub_100018624()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001865C()
{
  return sub_10001869C((void (*)(void))&_swift_errorRelease, 32);
}

uint64_t sub_100018678()
{
  return sub_100016338(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100018680()
{
  return sub_10001869C((void (*)(void))&_swift_release, 33);
}

uint64_t sub_10001869C(void (*a1)(void), uint64_t a2)
{
  a1(*(void *)(v2 + 16));
  swift_release();

  return _swift_deallocObject(v2, a2, 7);
}

uint64_t sub_1000186F0()
{
  return sub_1000165A0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_100018700()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018C5C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018C5C;
  return Assertion.invalidate()();
}

uint64_t sub_1000187DC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018C5C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018C5C;
  return Assertion.invalidate()();
}

uint64_t sub_1000188B4(uint64_t a1)
{
  uint64_t v2 = sub_100005690(&qword_100040168);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018914()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001894C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100018350;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000401C8 + dword_1000401C8);
  return v6(a1, v4);
}

uint64_t sub_100018A08()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100018A48()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018C5C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018C5C;
  return Assertion.invalidate()();
}

unsigned char *storeEnumTagSinglePayload for GamePolicyCoordinatorFF(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100018BBCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyCoordinatorFF()
{
  return &type metadata for GamePolicyCoordinatorFF;
}

unint64_t sub_100018BF8()
{
  unint64_t result = qword_1000401E8;
  if (!qword_1000401E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000401E8);
  }
  return result;
}

uint64_t sub_100018C60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100018CD8()
{
  sub_100018C60();

  return _swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for GamingMetadataOnDiskDB()
{
  return self;
}

uint64_t sub_100018D30()
{
  uint64_t v1 = *(void *)(v0 + 48);
  if (v1)
  {
    uint64_t v2 = qword_10003F358;
    swift_retain();
    if (v2 != -1) {
      swift_once();
    }
    int v3 = off_10003FF18;
    unsigned int v4 = (void *)*((void *)off_10003FF18 + 2);
    swift_retain();
    [v4 lock];
    sub_100013578((uint64_t)v3, v1);
    [v4 unlock];
    swift_release();
    swift_release();
  }

  sub_1000110D8(v0 + 32);
  swift_release();

  return _swift_deallocClassInstance(v0, 56, 7);
}

void sub_100018E34()
{
  type metadata accessor for GamePolicyCoordinatorObserver();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v1 + 24) = &off_100039448;
  swift_unknownObjectWeakAssign();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  swift_release();
  if (qword_10003F358 != -1) {
    swift_once();
  }
  uint64_t v2 = off_10003FF18;
  int v3 = (void *)*((void *)off_10003FF18 + 2);
  swift_retain();
  [v3 lock];
  sub_10001325C((uint64_t)v2, v1);
  [v3 unlock];
  swift_release();
  uint64_t v4 = swift_retain();
  sub_100011724(v15, v4);
  swift_release();
  uint64_t v5 = (void *)v15[0];
  char v6 = (void *)v15[1];
  uint64_t v8 = (void *)v15[2];
  uint64_t v7 = (void *)v15[3];
  id v9 = [*(id *)(v0 + 16) remoteObjectProxy];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100005690(&qword_100040CE0);
  if (swift_dynamicCast())
  {
    id v10 = v5;
    id v11 = v7;
    id v12 = v6;
    id v13 = v8;
    [v14 updateStatus:v10 :v11 :v12 :v13];

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_1000193DC(int a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, uint64_t, void *))
{
  char v6 = _Block_copy(aBlock);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  _Block_copy(v6);
  swift_retain();
  a5(v7, v9, v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_1000194E4(uint64_t a1, uint64_t a2, char a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v9 = 0;
  id v5 = [(id)swift_getObjCClassFromMetadata() bundleRecordWithBundleIdentifier:v4 allowPlaceholder:a3 & 1 error:&v9];

  if (v5)
  {
    id v6 = v9;
  }
  else
  {
    id v7 = v9;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_1000195CC(void *a1, char a2)
{
  if (qword_10003F358 != -1) {
    swift_once();
  }
  uint64_t v4 = swift_retain();
  sub_100011724(v14, v4);
  swift_release();
  id v5 = &_swiftEmptyArrayStorage;
  if (a1) {
    id v6 = a1;
  }
  else {
    id v6 = &_swiftEmptyArrayStorage;
  }
  if (a2) {
    id v5 = (void *)swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_10001AC98((uint64_t)v5);
  uint64_t v7 = sub_10001C044((uint64_t)v6);
  swift_bridgeObjectRelease();
  switch(v15)
  {
    case 2:
      if (*(void *)(v7 + 16)) {
        goto LABEL_17;
      }
LABEL_16:
      sub_100005690(&qword_100040688);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_10002EFC0;
      id v9 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusBundleInfo());
      *(void *)(v8 + 32) = GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)();
      specialized Array._endMutation()();
LABEL_17:
      sub_10001C274((uint64_t)v14);
      swift_retain();
      id v10 = sub_10001C0DC(v7, v14);
      swift_release();
      sub_10001C2B8((uint64_t)v14);
      swift_bridgeObjectRelease();
      sub_10001AACC((unint64_t)v10);
      id v11 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusInfo());
      uint64_t v12 = GameModeCCUIStatusInfo.init(state:bundles:)();
      sub_10001C2B8((uint64_t)v14);
      return v12;
    case 1:
      if (*(void *)(v7 + 16)) {
        goto LABEL_17;
      }
      goto LABEL_16;
    case 0:
      goto LABEL_17;
  }
  uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return result;
}

uint64_t sub_100019914@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  sub_1000088EC(*a1, v5, *(void **)(a2[3] + direct field offset for ModelManagerGameAssertionStatus.aaaBundleIdentifiers));
  if (qword_10003F328 != -1) {
    swift_once();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  unint64_t v7 = GlobalPreferences.gameModeEnabledList.getter();
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_10000CF70(v6, v5), (v9 & 1) != 0))
  {
    char v10 = *(unsigned char *)(*(void *)(v7 + 56) + v8);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = *a2;
  if ((sub_1000088EC(v6, v5, *(void **)(*a2 + direct field offset for GameModeStatus.gameBundleIdentifiers)) & 1) == 0) {
    sub_1000088EC(v6, v5, *(void **)(v11 + direct field offset for GameModeStatus.previousGameBundleIdentifiers));
  }
LABEL_10:
  sub_10001BF10(v6, v5);
  id v12 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusBundleInfo());
  swift_bridgeObjectRetain();
  uint64_t result = GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)();
  *a3 = result;
  return result;
}

uint64_t sub_100019E50(uint64_t a1, int a2, uint64_t a3, int a4, void *aBlock, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, void *))
{
  char v9 = _Block_copy(aBlock);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v9);
  swift_retain();
  a6(a3, v10, v12, a1, v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001A06C(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100040710 + dword_100040710);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10001A114;
  return v4();
}

uint64_t sub_10001A114(unsigned int a1)
{
  int v3 = *(void (***)(void, void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  v3[2](v3, a1 & 1, (a1 >> 8) & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10001A3C8(char a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  uint64_t v6 = (uint64_t (*)(char))((char *)&dword_1000406E8 + dword_1000406E8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001A47C;
  return v6(a1);
}

uint64_t sub_10001A47C(char a1)
{
  int v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10001A5BC(int a1, int a2, void *aBlock, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v6 = qword_10003F358;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = swift_retain();
  unint64_t v8 = (void *)a4(v7);
  swift_release();
  v5[2](v5, v8);

  _Block_release(v5);

  return swift_release();
}

uint64_t sub_10001A69C(int a1, int a2, uint64_t a3, void *aBlock, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v8 = qword_10003F358;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = swift_retain();
  a5(v9, a3);
  swift_release();
  v7[2](v7, 1);
  _Block_release(v7);

  return swift_release();
}

uint64_t type metadata accessor for GamePolicyPrivilegedToolProxy()
{
  return self;
}

uint64_t sub_10001A790(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100018C5C;
  return v6();
}

uint64_t sub_10001A85C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100018C5C;
  return v7();
}

uint64_t sub_10001A928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000188B4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001AACC(unint64_t a1)
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
    uint64_t result = sub_10001ADEC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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

uint64_t sub_10001AC98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_10002C9E8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001ADEC(unint64_t a1, uint64_t a2, unint64_t a3)
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
        sub_10001C2FC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005690(&qword_100040690);
          BOOL v12 = sub_10001AFF0(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
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
    type metadata accessor for GameModeCCUIStatusBundleInfo();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*sub_10001AFF0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001B0A0(v6, a2, a3);
  return sub_10001B058;
}

void sub_10001B058(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10001B0A0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_10001B120;
  }
  __break(1u);
  return result;
}

void sub_10001B120(id *a1)
{
}

uint64_t sub_10001B12C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

char *sub_10001B1A8(uint64_t a1)
{
  return sub_10002C9E8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10001B1BC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_10001B25C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001B340(uint64_t a1, uint64_t a2)
{
  return sub_10001B390(a1, a2, 0, (void (*)(void))type metadata accessor for GamePolicyToolProxy);
}

uint64_t sub_10001B35C(uint64_t a1, uint64_t a2)
{
  return sub_10001B390(a1, a2, 0, (void (*)(void))type metadata accessor for GamePolicyCoordinatorObserver);
}

uint64_t sub_10001B378(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_10001B390(a1, a2, a3, (void (*)(void))type metadata accessor for GamePolicyPrivilegedToolProxy);
}

uint64_t sub_10001B390(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v9 = a4;
    unint64_t v7 = a3;
    uint64_t v4 = a2;
    uint64_t v6 = a1;
    uint64_t v8 = *v5;
    if (!((unint64_t)*v5 >> 62))
    {
      if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v24 < v4) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v8 = v4 - v6;
  if (__OFSUB__(v4, v6))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  unint64_t v10 = (void (*)(void))(v6 - v4);
  if (__OFSUB__(0, v8))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v12 = (uint64_t)v10 + v25;
    if (!__OFADD__(v25, v10)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if ((unint64_t)*v5 >> 62) {
    goto LABEL_32;
  }
  uint64_t v11 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v12 = v11 - v8;
  if (__OFADD__(v11, v10)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v13 = *v5;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v5 = v13;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v13 & 0x8000000000000000) != 0
    || (v13 & 0x4000000000000000) != 0
    || (uint64_t v15 = v13 & 0xFFFFFFFFFFFFFF8, v12 > *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    uint64_t v28 = v6;
    uint64_t v8 = (uint64_t)v10;
    unint64_t v10 = v7;
    unint64_t v7 = v9;
    if (!(v13 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      *unint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      uint64_t v15 = *v5 & 0xFFFFFFFFFFFFFF8;
      unint64_t v9 = v7;
      unint64_t v7 = v10;
      unint64_t v10 = (void (*)(void))v8;
      uint64_t v6 = v28;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v16 = v15 + 32;
  uint64_t v17 = (char *)(v15 + 32 + 8 * v6);
  v9(v7);
  swift_arrayDestroy();
  if (v10)
  {
    if ((unint64_t)*v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v19 = v26 - v4;
      if (!__OFSUB__(v26, v4))
      {
LABEL_17:
        if (v19 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        uint64_t v20 = (char *)(v16 + 8 * v4);
        if (v6 != v4 || v17 >= &v20[8 * v19]) {
          memmove(v17, v20, 8 * v19);
        }
        if (!((unint64_t)*v5 >> 62))
        {
          uint64_t v21 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v22 = (uint64_t)v10 + v21;
          if (!__OFADD__(v21, v10))
          {
LABEL_23:
            *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v22 = (uint64_t)v10 + v27;
        if (!__OFADD__(v27, v10)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v19 = v18 - v4;
      if (!__OFSUB__(v18, v4)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:

  return specialized Array._endMutation()();
}

void sub_10001B6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10003F328 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v6 = GlobalPreferences.semAllowList.getter();
  swift_release();
  if ((sub_1000088EC(a1, a2, (void *)v6) & 1) == 0)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = (uint64_t)sub_10002C9E8(0, *(void *)(v6 + 16) + 1, 1, (char *)v6);
    }
    unint64_t v8 = *(void *)(v6 + 16);
    unint64_t v7 = *(void *)(v6 + 24);
    if (v8 >= v7 >> 1) {
      uint64_t v6 = (uint64_t)sub_10002C9E8((char *)(v7 > 1), v8 + 1, 1, (char *)v6);
    }
    *(void *)(v6 + 16) = v8 + 1;
    uint64_t v9 = v6 + 16 * v8;
    *(void *)(v9 + 32) = a1;
    *(void *)(v9 + 40) = a2;
  }
  unint64_t v10 = (void *)*((void *)off_10003F5F8 + 2);
  swift_retain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  [v10 setObject:isa forKey:v12];
  swift_release();

  unint64_t v13 = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a3 + 16))(a3, v13);
  swift_bridgeObjectRelease();
}

uint64_t sub_10001B8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  for (unint64_t i = (void *)(a1 + 40); ; i += 2)
  {
    BOOL v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      break;
    }
    if (v3 == ++v6) {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_10001B944(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *v2;
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
    uint64_t v4 = sub_10002C9E8(isUniquelyReferenced_nonNull_native, v11, 1, v4);
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
    uint64_t v16 = &v4[16 * a2 + 32];
    if (a1 != a2 || &v4[16 * a1 + 32] >= &v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[16 * a1 + 32], v16, 16 * v15);
    }
    uint64_t v17 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      *((void *)v4 + 2) = v18;
LABEL_20:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10001BAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10003F328 != -1) {
LABEL_32:
  }
    swift_once();
  uint64_t v6 = &off_10003F000;
  swift_retain();
  uint64_t v7 = (void *)GlobalPreferences.semAllowList.getter();
  swift_release();
  if ((sub_1000088EC(a1, a2, v7) & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v8 = sub_10001B8B0((uint64_t)v7, a1, a2);
  if (v9) {
    goto LABEL_9;
  }
  uint64_t v10 = v8;
  uint64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
LABEL_36:
    __break(1u);
    return;
  }
  uint64_t v26 = a3;
  unint64_t v12 = v7[2];
  if (v11 != v12)
  {
    uint64_t v17 = 2 * v8;
    unint64_t v13 = v8 + 1;
    while (1)
    {
      if (v11 < 0)
      {
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (v13 >= v12) {
        goto LABEL_31;
      }
      uint64_t v19 = &v7[v17];
      BOOL v20 = v7[v17 + 6] == a1 && v7[v17 + 7] == a2;
      if (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        if (v13 != v10)
        {
          if (v10 >= v12) {
            goto LABEL_34;
          }
          uint64_t v21 = (id *)&v7[2 * v10 + 4];
          id v22 = v21[1];
          id v28 = *v21;
          a3 = v19[6];
          uint64_t v23 = v19[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v7 = sub_10001B1A8((uint64_t)v7);
          }
          uint64_t v24 = &v7[2 * v10];
          v24[4] = a3;
          v24[5] = v23;
          swift_bridgeObjectRelease();
          if (v13 >= v7[2]) {
            goto LABEL_35;
          }
          uint64_t v25 = &v7[v17];
          v25[6] = v28;
          v25[7] = v22;
          swift_bridgeObjectRelease();
        }
        if (__OFADD__(v10++, 1)) {
          break;
        }
      }
      ++v13;
      unint64_t v12 = v7[2];
      v17 += 2;
      if (v13 == v12) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  unint64_t v13 = v8 + 1;
LABEL_7:
  a3 = v26;
  uint64_t v6 = &off_10003F000;
  if ((uint64_t)v13 >= v10) {
    goto LABEL_10;
  }
  __break(1u);
LABEL_9:
  uint64_t v10 = v7[2];
  unint64_t v13 = v10;
LABEL_10:
  sub_10001B944(v10, v13);
LABEL_11:
  BOOL v14 = (void *)*((void *)v6[191] + 2);
  swift_retain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v16 = String._bridgeToObjectiveC()();
  [v14 setObject:isa forKey:v16];
  swift_release();

  uint64_t v27 = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a3 + 16))(a3, v27);
  swift_bridgeObjectRelease();
}

void sub_10001BD90(uint64_t a1)
{
  if (qword_10003F320 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = qword_10003F328;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)*((void *)off_10003F5F8 + 2);
  swift_bridgeObjectRetain();
  swift_retain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  [v3 setObject:isa forKey:v5];
  swift_release();

  Class v6 = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a1 + 16))(a1, v6);
  swift_bridgeObjectRelease();
}

uint64_t sub_10001BF10(uint64_t a1, uint64_t a2)
{
  sub_10001C364();
  swift_bridgeObjectRetain();
  id v4 = sub_1000194E4(a1, a2, 0);
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (!v5)
  {
    uint64_t v10 = 9666786;
LABEL_6:

    return v10;
  }
  Class v6 = (void *)v5;
  id v4 = v4;
  id v7 = [v6 applicationState];
  unsigned int v8 = [v7 isValid];

  if (!v8)
  {
    uint64_t v10 = 9666786;

    goto LABEL_6;
  }
  id v9 = [v6 localizedName];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v10;
}

uint64_t sub_10001C044(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100029338(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *sub_10001C0DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v4)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t result = (void *)sub_10001B1BC(a1);
    int64_t v6 = (int64_t)result;
    int v8 = v7;
    char v10 = v9 & 1;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(a1 + 56 + (((unint64_t)v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_13;
      }
      if (*(_DWORD *)(a1 + 36) != v8) {
        goto LABEL_14;
      }
      uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v6);
      uint64_t v12 = v11[1];
      v16[0] = *v11;
      v16[1] = v12;
      swift_bridgeObjectRetain();
      sub_100019914(v16, a2, &v17);
      swift_bridgeObjectRelease();
      if (v2) {
        return (void *)swift_release();
      }
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t result = (void *)sub_10001B25C(v6, v8, v10 & 1, a1);
      int64_t v6 = (int64_t)result;
      int v8 = v13;
      char v10 = v14 & 1;
      if (!--v4)
      {
        sub_10001C358((uint64_t)result, v13, v14 & 1);
        return v18;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C274(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(id *)a1;
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  return a1;
}

uint64_t sub_10001C2B8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 16);

  return a1;
}

unint64_t sub_10001C2FC()
{
  unint64_t result = qword_100040698;
  if (!qword_100040698)
  {
    sub_100016A1C(&qword_100040690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040698);
  }
  return result;
}

uint64_t sub_10001C358(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10001C364()
{
  unint64_t result = qword_1000406A0;
  if (!qword_1000406A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000406A0);
  }
  return result;
}

uint64_t sub_10001C3A4()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001C3E4()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_100018350;
  id v5 = (uint64_t (*)(char, void *))((char *)&dword_1000406A8 + dword_1000406A8);
  return v5(v2, v3);
}

uint64_t sub_10001C49C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_100018C5C;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000406B8 + dword_1000406B8);
  return v6(v2, v3, v4);
}

uint64_t sub_10001C560(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100018C5C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000406C8 + dword_1000406C8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10001C62C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C664(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100018350;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000406D8 + dword_1000406D8);
  return v6(a1, v4);
}

void *sub_10001C71C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 4;
    while (1)
    {
      uint64_t v8 = (a1 & 0xC000000000000001) != 0
         ? (void *)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v7);
      char v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      if ((*(uint64_t (**)(void))((swift_isaMask & *v8) + 0x80))() == a2 && v11 == a3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_20;
      }

      ++v7;
      if (v10 == v6)
      {
        char v9 = 0;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  char v9 = 0;
LABEL_20:
  swift_bridgeObjectRelease();
  return v9;
}

void sub_10001C89C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void (**aBlock)(void, void))
{
  if ((unint64_t)(a1 - 1) < 2)
  {
    if (qword_10003F328 != -1) {
      swift_once();
    }
    sub_100005690(&qword_100040718);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002EFD0;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(a1 == 2, (Swift::OpaquePointer)inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_release();
    id v10 = [self defaultCenter];
    if (qword_10003F350 != -1) {
      swift_once();
    }
    [v10 postNotificationName:qword_1000411D8 object:0];

    goto LABEL_9;
  }
  if (!a1 || a1 == 3)
  {
LABEL_9:
    sub_100005690(&qword_100040718);
    uint64_t v11 = swift_initStackObject();
    *(_OWORD *)(v11 + 16) = xmmword_10002EFD0;
    *(void *)(v11 + 32) = a2;
    *(void *)(v11 + 40) = a3;
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_1000195CC((void *)v11, 1);
    swift_setDeallocating();
    swift_arrayDestroy();
    ((void (**)(void, void *))aBlock)[2](aBlock, v12);

    return;
  }
  _Block_release(aBlock);
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
}

void sub_10001CAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100005690(&qword_100040718);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002EFD0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_1000195CC((void *)inited, 0);
  swift_setDeallocating();
  uint64_t v9 = swift_arrayDestroy();
  unint64_t v10 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v8) + 0x60))(v9);

  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10001C71C(v10, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_bridgeObjectRelease();
  if (v11)
  {
    char v13 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v11) + 0x118))(v12);
  }
  else
  {
    char v13 = 0;
  }
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v13);
}

void sub_10001CC54(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void (**aBlock)(void, void))
{
  if ((unint64_t)(a1 - 1) < 2)
  {
    if (qword_10003F328 != -1) {
      swift_once();
    }
    sub_100005690(&qword_100040718);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002EFD0;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(a1 == 2, (Swift::OpaquePointer)inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_release();
    id v10 = [self defaultCenter];
    if (qword_10003F350 != -1) {
      swift_once();
    }
    [v10 postNotificationName:qword_1000411D8 object:0];

    goto LABEL_9;
  }
  if (!a1 || a1 == 3)
  {
LABEL_9:
    sub_100005690(&qword_100040718);
    uint64_t v11 = swift_initStackObject();
    *(_OWORD *)(v11 + 16) = xmmword_10002EFD0;
    *(void *)(v11 + 32) = a2;
    *(void *)(v11 + 40) = a3;
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_1000195CC((void *)v11, 1);
    swift_setDeallocating();
    uint64_t v13 = swift_arrayDestroy();
    char v14 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v12) + 0x80))(v13);

    ((void (**)(void, void *))aBlock)[2](aBlock, v14);
    return;
  }
  _Block_release(aBlock);
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
}

uint64_t sub_10001CED4()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_10001CF90, 0, 0);
}

uint64_t sub_10001CF90()
{
  if (qword_10003F358 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_10001185C(v4);
  swift_release();
  uint64_t v6 = (*(void **)((char *)&v5->isa + direct field offset for GameModeStatus.gameBundleIdentifiers))[2];
  int v7 = *((unsigned __int8 *)&v5->isa + direct field offset for GameModeStatus.enabled);
  uint64_t v8 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109376;
    *(_DWORD *)(v0 + 40) = v6 != 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 8) = 1024;
    *(_DWORD *)(v0 + 44) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "requestGameMode(%{BOOL}d %{BOOL}d)", (uint8_t *)v11, 0xEu);
    swift_slowDealloc();
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = v5;
    uint64_t v5 = v9;
  }

  (*(void (**)(void, void))(*(void *)(v0 + 24) + 8))(*(void *)(v0 + 32), *(void *)(v0 + 16));
  swift_task_dealloc();
  if (v7) {
    int v13 = 256;
  }
  else {
    int v13 = 0;
  }
  char v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14(v13 | (v6 != 0));
}

uint64_t sub_10001D1B0(char a1)
{
  *(unsigned char *)(v1 + 52) = a1;
  uint64_t v2 = type metadata accessor for Logger();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = *(void *)(v2 - 8);
  *(void *)(v1 + 40) = swift_task_alloc();
  return _swift_task_switch(sub_10001D270, 0, 0);
}

uint64_t sub_10001D270()
{
  uint64_t v27 = v0;
  if (qword_10003F358 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = swift_retain();
  uint64_t v5 = (char *)sub_10001185C(v4);
  swift_release();
  v6._rawValue = *(void **)&v5[direct field offset for GameModeStatus.gameBundleIdentifiers];
  swift_bridgeObjectRetain();
  uint64_t v7 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v7, v1);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void *)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 40);
  uint64_t v13 = *(void *)(v0 + 24);
  if (v10)
  {
    uint64_t v24 = *(void *)(v0 + 40);
    uint64_t v25 = v5;
    int v14 = *(unsigned __int8 *)(v0 + 52);
    uint64_t v23 = *(void *)(v0 + 24);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 67109378;
    *(_DWORD *)(v0 + 48) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v15 + 8) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v16 = Array.description.getter();
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = sub_100008130(v16, v18, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v5 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "gameModeEnabled:(%{BOOL}d for:%s", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  }
  if (qword_10003F328 != -1) {
    swift_once();
  }
  char v19 = *(unsigned char *)(v0 + 52);
  swift_retain();
  GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(v19, v6);
  swift_bridgeObjectRelease();
  swift_release();
  id v20 = [self defaultCenter];
  if (qword_10003F350 != -1) {
    swift_once();
  }
  [v20 postNotificationName:qword_1000411D8 object:0];

  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v21(1);
}

uint64_t sub_10001D608()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001D648()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100018C5C;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_1000406F0 + dword_1000406F0);
  return v4(v2);
}

uint64_t sub_10001D6FC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001D73C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  __chkstk_darwin(v2);
  uint64_t v39 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v8);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v9 - 8);
  sub_1000169DC();
  static DispatchQoS.unspecified.getter();
  unint64_t v41 = &_swiftEmptyArrayStorage;
  sub_10001DE78();
  sub_100005690(&qword_100040140);
  sub_10001DED0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v4);
  BOOL v10 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v1 + 16) = v10;
  *(void *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 48) = 2;
  uint64_t v11 = (objc_class *)type metadata accessor for GamePolicyToolCoordinator();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  uint64_t v13 = OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock;
  id v14 = objc_allocWithZone((Class)NSLock);
  id v15 = v10;
  uint64_t v16 = v12;
  unint64_t v17 = v14;
  uint64_t v18 = v37;
  *(void *)&v12[v13] = [v17 init];
  uint64_t v19 = v38;
  *(void *)&v16[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies] = &_swiftEmptyArrayStorage;
  *(void *)&v16[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies] = &_swiftEmptyArrayStorage;
  *(void *)&v16[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_queue] = v15;
  id v20 = v15;

  v40.receiver = v16;
  v40.super_class = v11;
  uint64_t v21 = v39;
  id v22 = [super init];

  *(void *)(v1 + 24) = v22;
  id v23 = objc_allocWithZone((Class)NSXPCListener);
  NSString v24 = String._bridgeToObjectiveC()();
  id v25 = [v23 initWithMachServiceName:v24];

  *(void *)(v1 + 32) = v25;
  [v25 setDelegate:*(void *)(v1 + 24)];
  [v25 resume];
  uint64_t v26 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v26, v19);
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    Swift::Int v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::Int v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "GamePolicyDaemon has initialized!", v29, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v19);
  if (sub_10001DC38()) {
    goto LABEL_7;
  }
  if (qword_10003F328 != -1) {
    swift_once();
  }
  swift_retain();
  unsigned __int8 v30 = GlobalPreferences.ignoreDeviceRestrictions.getter();
  swift_release();
  if (v30)
  {
LABEL_7:
    uint64_t v31 = *(void **)(v1 + 16);
    id v32 = objc_allocWithZone((Class)type metadata accessor for EmbeddedGameProcessMonitor());
    id v33 = v31;
    id v34 = sub_10002B04C((uint64_t)v33);

    uint64_t v35 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = v34;
  }
  return v1;
}

uint64_t sub_10001DC38()
{
  int v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 2) {
    return v1 & 1;
  }
  uint64_t result = sub_100008A70();
  *(unsigned char *)(v0 + 48) = result;
  return result;
}

void sub_10001DC6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "startup", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  BOOL v10 = *(void **)(v1 + 40);
  if (v10)
  {
    id v11 = v10;
    sub_100024AC4();
  }
}

uint64_t sub_10001DDE0()
{
  return _swift_deallocClassInstance(v0, 49, 7);
}

uint64_t type metadata accessor for GamePolicyDaemon_iOS()
{
  return self;
}

void sub_10001DE54()
{
}

unint64_t sub_10001DE78()
{
  unint64_t result = qword_100040138;
  if (!qword_100040138)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040138);
  }
  return result;
}

unint64_t sub_10001DED0()
{
  unint64_t result = qword_100040148;
  if (!qword_100040148)
  {
    sub_100016A1C(&qword_100040140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040148);
  }
  return result;
}

uint64_t sub_10001DF2C(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_10000591C((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void *)(*(void *)(a2 + 56) + 8 * v6);
        swift_retain();
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = __CocoaDictionary.lookup(_:)();

  if (!v4) {
    return 0;
  }
  type metadata accessor for EmbeddedGameProcess();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v9;
  swift_unknownObjectRelease();
  return v5;
}

BOOL sub_10001DFF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001E00C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001E054()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001E080()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10001E0C4()
{
  NSString v1 = String._bridgeToObjectiveC()();
  sub_100007FBC(0, (unint64_t *)&unk_10003FC90);
  id v2 = [v0 objectForKey:v1 ofClass:swift_getObjCClassFromMetadata()];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000544C((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_10002C0AC((uint64_t)v7, &qword_10003F600);
    return 2;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 2;
  }
  id v3 = [v5 BOOLValue];

  return (uint64_t)v3;
}

uint64_t sub_10001E1D4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for OSSignpostID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005690(&qword_100040CA0);
  __chkstk_darwin(v8 - 8);
  BOOL v10 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)(v2 + 47) = 0;
  Swift::Int v11 = sub_10002BBF8((uint64_t)&off_100038E38);
  swift_arrayDestroy();
  *(void *)(v2 + 56) = v11;
  *(void *)(v2 + 16) = a1;
  id v12 = a1;
  [v12 auditToken];
  long long v107 = v112;
  long long v108 = v111;
  uint64_t v13 = self;
  v110[0] = 0;
  long long v111 = v108;
  long long v112 = v107;
  id v14 = [v13 bundleRecordForAuditToken:&v111 error:v110];
  id v15 = v110[0];
  if (!v14)
  {
    id v31 = v110[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    goto LABEL_10;
  }
  uint64_t v16 = v14;
  self;
  unint64_t v17 = (void *)swift_dynamicCastObjCClass();
  id v18 = v15;
  if (!v17 || (id v19 = [v17 bundleIdentifier]) == 0)
  {

LABEL_10:
    swift_bridgeObjectRelease();
    type metadata accessor for EmbeddedGameProcess();
    swift_deallocPartialClassInstance();
    return 0;
  }
  id v20 = v19;
  v106 = v7;
  uint64_t v103 = v5;
  uint64_t v104 = v4;
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  uint64_t v101 = v21;
  *(void *)(v2 + 24) = v21;
  *(void *)(v2 + 32) = v23;
  swift_bridgeObjectRetain();
  id v105 = [v17 infoDictionary];
  *(void *)&long long v108 = [v17 entitlements];
  id v24 = [v17 requiredDeviceCapabilities];
  sub_100007FBC(0, (unint64_t *)&unk_10003FC90);
  uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v25 + 16) && (unint64_t v26 = sub_10000CF70(0xD00000000000001ELL, 0x8000000100032470), (v27 & 1) != 0))
  {
    id v28 = *(id *)(*(void *)(v25 + 56) + 8 * v26);
    swift_bridgeObjectRelease();
    unsigned __int8 v29 = [v28 BOOLValue];

    if (v29)
    {
      unsigned __int8 v30 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v32 = [v17 requiredDeviceCapabilities];
  uint64_t v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v33 + 16) && (unint64_t v34 = sub_10000CF70(0xD00000000000001FLL, 0x8000000100032490), (v35 & 1) != 0))
  {
    id v36 = *(id *)(*(void *)(v33 + 56) + 8 * v34);
    swift_bridgeObjectRelease();
    unsigned __int8 v30 = [v36 BOOLValue];
  }
  else
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v30 = 0;
  }
LABEL_16:
  *(unsigned char *)(v2 + 40) = v30;
  char v37 = 1;
  if ((sub_10001E0C4() & 1) == 0)
  {
    if (qword_10003F328 != -1) {
      swift_once();
    }
    swift_retain();
    uint64_t v38 = (void *)GlobalPreferences.semAllowList.getter();
    swift_release();
    char v37 = sub_1000088EC(v101, v23, v38);
    swift_bridgeObjectRelease();
  }
  *(unsigned char *)(v2 + 42) = v37 & 1;
  *(unsigned char *)(v2 + 46) = 1;
  id v39 = [v17 iTunesMetadata];
  id v40 = [v39 genreIdentifier];

  LOBYTE(v107) = sub_10001E0C4() & 1;
  LODWORD(v107) = v107;
  char v41 = sub_10001E0C4();
  if (v41 == 2)
  {
    BOOL v42 = 0;
    *(unsigned char *)(v2 + 43) = 1;
    if (v40 != (id)6014)
    {
      BOOL v43 = 0;
      if (v40) {
        goto LABEL_29;
      }
    }
  }
  else
  {
    BOOL v43 = v41 != 0;
    *(unsigned char *)(v2 + 43) = 1;
    if (v40 && v40 != (id)6014)
    {
      LOBYTE(v42) = 0;
      goto LABEL_29;
    }
    BOOL v42 = v41 != 0;
  }
  BOOL v43 = v42;
  if (v107) {
    LOBYTE(v42) = 1;
  }
LABEL_29:
  *(unsigned char *)(v2 + 44) = v42;
  int v44 = *(unsigned __int8 *)(v2 + 42);
  id v102 = v12;
  if (v44 == 1)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v45) = 1;
    *(unsigned char *)(v2 + 41) = 1;
    goto LABEL_45;
  }
  BOOL v100 = v43;
  char v46 = sub_10001EE90(v101, v23, *(void *)(v2 + 56));
  swift_bridgeObjectRelease();
  if (v46) {
    goto LABEL_32;
  }
  if (v40 != (id)6014 && v40) {
    goto LABEL_43;
  }
  char v47 = sub_10001E0C4();
  if (v47 != 2)
  {
    *(unsigned char *)(v2 + 41) = v47;
    LOBYTE(v45) = v47 != 0;
    goto LABEL_44;
  }
  int v45 = *(unsigned __int8 *)(v2 + 40);
  if (v45 == 1)
  {
    *(unsigned char *)(v2 + 41) = 1;
    goto LABEL_44;
  }
  if (v40 != (id)6014) {
    goto LABEL_43;
  }
  id v48 = [v17 SDKVersion];
  if (!v48) {
    goto LABEL_43;
  }
  uint64_t v49 = v48;
  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v52 = v51;

  *(void *)&long long v111 = v50;
  *((void *)&v111 + 1) = v52;
  v110[0] = (id)808335409;
  v110[1] = (id)0xE400000000000000;
  uint64_t v53 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v10, 1, 1, v53);
  sub_100016A64();
  uint64_t v54 = StringProtocol.compare<A>(_:options:range:locale:)();
  sub_10002C0AC((uint64_t)v10, &qword_100040CA0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v54 != -1)
  {
LABEL_43:
    LOBYTE(v45) = 0;
    *(unsigned char *)(v2 + 41) = 0;
    goto LABEL_44;
  }
  if ((sub_10001E0C4() & 1) == 0)
  {
    uint64_t v98 = sub_10002BDF0((uint64_t)&off_100038E88);
    id v74 = [v17 iTunesMetadata];
    id v75 = [v74 subgenres];

    sub_100005690(&qword_100040CC0);
    uint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v77 = v76;
    int64_t v78 = *(void *)(v76 + 16);
    if (!v78)
    {
      swift_bridgeObjectRelease();
      id v84 = &_swiftEmptyArrayStorage;
LABEL_74:
      uint64_t v87 = v84[2];
      uint64_t v88 = v98;
      if (!v87)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        LOBYTE(v45) = 0;
        *(unsigned char *)(v2 + 41) = 0;
        goto LABEL_44;
      }
      uint64_t v89 = 0;
      v99 = (char *)(v84 + 4);
      uint64_t v101 = *(void *)(v98 + 16);
      uint64_t v90 = v98 + 56;
      do
      {
        if (v101)
        {
          uint64_t v91 = *(void *)&v99[8 * v89];
          uint64_t v92 = static Hasher._hash(seed:_:)();
          uint64_t v93 = -1 << *(unsigned char *)(v88 + 32);
          unint64_t v94 = v92 & ~v93;
          if ((*(void *)(v90 + ((v94 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v94))
          {
            uint64_t v95 = *(void *)(v88 + 48);
            if (*(void *)(v95 + 8 * v94) == v91)
            {
LABEL_83:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_32;
            }
            uint64_t v96 = ~v93;
            while (1)
            {
              unint64_t v94 = (v94 + 1) & v96;
              if (((*(void *)(v90 + ((v94 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v94) & 1) == 0) {
                break;
              }
              if (*(void *)(v95 + 8 * v94) == v91) {
                goto LABEL_83;
              }
            }
          }
        }
        ++v89;
      }
      while (v89 != v87);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
    v110[0] = &_swiftEmptyArrayStorage;
    sub_10002902C(0, v78, 0);
    uint64_t v79 = 0;
    uint64_t v101 = (uint64_t)&type metadata for Any + 8;
    while (1)
    {
      uint64_t v80 = *(void *)(v77 + 8 * v79 + 32);
      if (!*(void *)(v80 + 16)) {
        goto LABEL_66;
      }
      swift_bridgeObjectRetain();
      unint64_t v81 = sub_10000CF70(0x644965726E6567, 0xE700000000000000);
      if ((v82 & 1) == 0) {
        break;
      }
      sub_100008254(*(void *)(v80 + 56) + 32 * v81, (uint64_t)&v111);
      if ((swift_dynamicCast() & 1) == 0) {
        break;
      }
      uint64_t v83 = v109;
      swift_bridgeObjectRelease();
LABEL_67:
      id v84 = v110[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002902C(0, v84[2] + 1, 1);
        id v84 = v110[0];
      }
      unint64_t v86 = v84[2];
      unint64_t v85 = v84[3];
      if (v86 >= v85 >> 1)
      {
        sub_10002902C(v85 > 1, v86 + 1, 1);
        id v84 = v110[0];
      }
      ++v79;
      v84[2] = v86 + 1;
      v84[v86 + 4] = v83;
      if (v78 == v79)
      {
        swift_bridgeObjectRelease();
        goto LABEL_74;
      }
    }
    swift_bridgeObjectRelease();
LABEL_66:
    uint64_t v83 = 0;
    goto LABEL_67;
  }
LABEL_32:
  LOBYTE(v45) = 1;
  *(unsigned char *)(v2 + 41) = 1;
LABEL_44:
  LOBYTE(v43) = v100;
LABEL_45:
  BOOL v55 = v43;
  if (v107) {
    char v56 = 1;
  }
  else {
    char v56 = v43;
  }
  *(unsigned char *)(v2 + 45) = v45 & v56;
  static os_signpost_type_t.begin.getter();
  id v57 = (id *)Logger.stateTracking.unsafeMutableAddressor();
  uint64_t v58 = *(void **)(v2 + 16);
  id v59 = *v57;
  if (([v58 pid] & 0x80000000) == 0)
  {
    OSSignpostID.init(_:)();
    sub_100005690(&qword_100040CA8);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_10002F0D0;
    id v61 = [v17 bundleIdentifier];
    if (v61)
    {
      Class v62 = v61;
      uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v65 = v64;
    }
    else
    {
      uint64_t v63 = 0;
      unint64_t v65 = 0;
    }
    *(void *)(v60 + 56) = &type metadata for String;
    *(void *)(v60 + 64) = sub_10002BD9C();
    uint64_t v66 = 0x6E776F6E6B6E753CLL;
    if (v65) {
      uint64_t v66 = v63;
    }
    unint64_t v67 = 0xE90000000000003ELL;
    if (v65) {
      unint64_t v67 = v65;
    }
    *(void *)(v60 + 32) = v66;
    *(void *)(v60 + 40) = v67;
    char v68 = *(unsigned char *)(v2 + 40);
    *(void *)(v60 + 96) = &type metadata for Bool;
    *(void *)(v60 + 104) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 72) = v68;
    *(void *)(v60 + 136) = &type metadata for Bool;
    *(void *)(v60 + 144) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 112) = v107;
    *(void *)(v60 + 176) = &type metadata for Bool;
    *(void *)(v60 + 184) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 152) = v55;
    char v69 = *(unsigned char *)(v2 + 42);
    *(void *)(v60 + 216) = &type metadata for Bool;
    *(void *)(v60 + 224) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 192) = v69;
    *(void *)(v60 + 256) = &type metadata for Bool;
    *(void *)(v60 + 264) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 232) = 1;
    char v70 = *(unsigned char *)(v2 + 44);
    *(void *)(v60 + 296) = &type metadata for Bool;
    *(void *)(v60 + 304) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 272) = v70;
    char v71 = *(unsigned char *)(v2 + 45);
    *(void *)(v60 + 336) = &type metadata for Bool;
    *(void *)(v60 + 344) = &protocol witness table for Bool;
    *(unsigned char *)(v60 + 312) = v71;
    int v72 = v106;
    os_signpost(_:dso:log:name:signpostID:_:_:)();

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v72, v104);
    return v2;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001EE90(uint64_t a1, uint64_t a2, uint64_t a3)
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
      Swift::Int v11 = (void *)(v10 + 16 * v8);
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
          uint64_t v16 = (void *)(v10 + 16 * v15);
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

uint64_t sub_10001EFC8()
{
  uint64_t v1 = type metadata accessor for OSSignpostID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.end.getter();
  uint64_t v5 = (id *)Logger.stateTracking.unsafeMutableAddressor();
  Swift::Int v6 = *(void **)(v0 + 16);
  id v7 = *v5;
  if (([v6 pid] & 0x80000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    OSSignpostID.init(_:)();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v0;
  }
  return result;
}

uint64_t sub_10001F164()
{
  sub_10001EFC8();

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t sub_10001F198()
{
  _StringGuts.grow(_:)(29);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = 978143008;
  v2._object = (void *)0xE400000000000000;
  String.append(_:)(v2);
  if (*(unsigned char *)(v0 + 41)) {
    uint64_t v3 = 1702195828;
  }
  else {
    uint64_t v3 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 41)) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0x3A53504420;
  v6._object = (void *)0xE500000000000000;
  String.append(_:)(v6);
  v7._uint64_t countAndFlagsBits = 1702195828;
  v7._object = (void *)0xE400000000000000;
  String.append(_:)(v7);
  v8._uint64_t countAndFlagsBits = 0x3A4D455320;
  v8._object = (void *)0xE500000000000000;
  String.append(_:)(v8);
  if (*(unsigned char *)(v0 + 42)) {
    uint64_t v9 = 1702195828;
  }
  else {
    uint64_t v9 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 42)) {
    unint64_t v10 = 0xE400000000000000;
  }
  else {
    unint64_t v10 = 0xE500000000000000;
  }
  unint64_t v11 = v10;
  String.append(_:)(*(Swift::String *)&v9);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = 0x3A414D4D20;
  v12._object = (void *)0xE500000000000000;
  String.append(_:)(v12);
  v13._uint64_t countAndFlagsBits = 1702195828;
  v13._object = (void *)0xE400000000000000;
  String.append(_:)(v13);
  return v1;
}

Swift::Int sub_10001F2F4()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = *(id *)(v1 + 16);
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

void sub_10001F348()
{
  id v1 = *(id *)(*(void *)v0 + 16);
  NSObject.hash(into:)();
}

Swift::Int sub_10001F3A4()
{
  Hasher.init(_seed:)();
  id v1 = *(id *)(*(void *)v0 + 16);
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t sub_10001F3F4()
{
  return sub_10001F198();
}

uint64_t sub_10001F418()
{
  return static NSObject.== infix(_:_:)() & 1;
}

uint64_t sub_10001F470()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for GameModeState()
{
  return self;
}

id sub_10001F4D0()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v6 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken];
  swift_beginAccess();
  if (*v6) {
    notify_cancel(*v6);
  }
  Swift::String v7 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken];
  swift_beginAccess();
  if (*v7) {
    notify_cancel(*v7);
  }
  Swift::String v8 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken];
  swift_beginAccess();
  if (*v8) {
    notify_cancel(*v8);
  }
  uint64_t v9 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken];
  swift_beginAccess();
  if (*v9) {
    notify_cancel(*v9);
  }
  uint64_t v10 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
  unint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    Swift::String v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "com.apple.GamePolicyAngel.notification.service Shutdown", v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection;
  unint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection];
  if (v15)
  {
    [v15 invalidate];
    uint64_t v16 = *(void **)&v1[v14];
  }
  else
  {
    uint64_t v16 = 0;
  }
  *(void *)&v1[v14] = 0;

  BOOL v17 = (objc_class *)type metadata accessor for EmbeddedGameProcessMonitor();
  v19.receiver = v1;
  v19.super_class = v17;
  return [super dealloc];
}

uint64_t sub_10001F900()
{
  return type metadata accessor for EmbeddedGameProcessMonitor();
}

uint64_t type metadata accessor for EmbeddedGameProcessMonitor()
{
  uint64_t result = qword_100040B58;
  if (!qword_100040B58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001F954(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v204 = a4;
  uint64_t v10 = (int *)type metadata accessor for GameModeStatus.Config();
  __chkstk_darwin(v10);
  uint64_t v196 = (uint64_t)&v174 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = type metadata accessor for Date();
  uint64_t v194 = *(void *)(v195 - 8);
  uint64_t v12 = __chkstk_darwin(v195);
  v181 = (char *)&v174 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v182 = (char *)&v174 - v15;
  __chkstk_darwin(v14);
  v190 = (char *)&v174 - v16;
  uint64_t v186 = type metadata accessor for OSSignpostID();
  uint64_t v184 = *(void *)(v186 - 8);
  __chkstk_darwin(v186);
  v185 = (char *)&v174 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = type metadata accessor for String.Encoding();
  uint64_t v192 = *(void *)(v193 - 8);
  __chkstk_darwin(v193);
  v191 = (char *)&v174 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = type metadata accessor for Logger();
  uint64_t v19 = *(void *)(v199 - 8);
  uint64_t v20 = __chkstk_darwin(v199);
  uint64_t v22 = (char *)&v174 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  v183 = (uint8_t *)&v174 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v203 = (uint8_t *)&v174 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v180 = (char *)&v174 - v28;
  __chkstk_darwin(v27);
  v197 = (char *)&v174 - v29;
  uint64_t v30 = sub_100005690(&qword_100040128);
  uint64_t v31 = __chkstk_darwin(v30 - 8);
  uint64_t v33 = (char *)&v174 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  if (*((unsigned char *)v5 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsGameMode) != 1) {
    return;
  }
  v175 = (char *)&v174 - v34;
  uint64_t v189 = v19;
  char v35 = (char *)v5 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig;
  swift_beginAccess();
  int v179 = *v35;
  int v178 = v35[v10[8]];
  id v36 = *(uint8_t **)&v35[v10[11]];
  unsigned char *v35 = a1 & 1;
  uint64_t v37 = v10[8];
  v202 = v35;
  v35[v37] = a2 & 1;
  v198 = v5;
  v174 = v22;
  v177 = v36;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v39 = &_swiftEmptyArrayStorage;
  uint64_t v201 = a1;
  v200 = v10;
  uint64_t v188 = a2;
  int v187 = a5;
  if (v38)
  {
    unint64_t v208 = (unint64_t)&_swiftEmptyArrayStorage;
    sub_10002904C(0, v38 & ~(v38 >> 63), 0);
    if (v38 < 0)
    {
      __break(1u);
      goto LABEL_161;
    }
    id v39 = (void *)v208;
    if ((a3 & 0xC000000000000001) != 0)
    {
      uint64_t v40 = 0;
      do
      {
        uint64_t v41 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v42 = *(void *)(v41 + 24);
        uint64_t v43 = *(void *)(v41 + 32);
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        unint64_t v208 = (unint64_t)v39;
        unint64_t v45 = v39[2];
        unint64_t v44 = v39[3];
        if (v45 >= v44 >> 1)
        {
          sub_10002904C(v44 > 1, v45 + 1, 1);
          id v39 = (void *)v208;
        }
        ++v40;
        v39[2] = v45 + 1;
        char v46 = (char *)&v39[2 * v45];
        *((void *)v46 + 4) = v42;
        *((void *)v46 + 5) = v43;
      }
      while (v38 != v40);
    }
    else
    {
      unint64_t v47 = a3 + 32;
      do
      {
        uint64_t v49 = *(void *)(*(void *)v47 + 24);
        uint64_t v48 = *(void *)(*(void *)v47 + 32);
        unint64_t v208 = (unint64_t)v39;
        unint64_t v51 = v39[2];
        unint64_t v50 = v39[3];
        swift_bridgeObjectRetain();
        if (v51 >= v50 >> 1)
        {
          sub_10002904C(v50 > 1, v51 + 1, 1);
          id v39 = (void *)v208;
        }
        v39[2] = v51 + 1;
        uint64_t v52 = (char *)&v39[2 * v51];
        *((void *)v52 + 4) = v49;
        *((void *)v52 + 5) = v48;
        v47 += 8;
        --v38;
      }
      while (v38);
    }
    LOBYTE(a1) = v201;
    uint64_t v10 = v200;
    LODWORD(a2) = v188;
    a5 = v187;
  }
  uint64_t v53 = (uint64_t)v202;
  *(void *)&v202[v10[11]] = v39;
  swift_bridgeObjectRelease();
  if (qword_10003F358 != -1) {
    swift_once();
  }
  uint64_t v54 = (void *)swift_retain();
  uint64_t v55 = sub_100012E8C(v54);
  swift_release();
  *(void *)(v53 + v10[13]) = v55;
  unint64_t v56 = v204;
  unint64_t v176 = v204 >> 62;
  if (v204 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v57 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v57 = *(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v58 = &_swiftEmptyArrayStorage;
  if (v57)
  {
    unint64_t v208 = (unint64_t)&_swiftEmptyArrayStorage;
    sub_10002904C(0, v57 & ~(v57 >> 63), 0);
    if ((v57 & 0x8000000000000000) == 0)
    {
      uint64_t v58 = (void *)v208;
      if ((v56 & 0xC000000000000001) != 0)
      {
        uint64_t v59 = 0;
        do
        {
          uint64_t v60 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v61 = *(void *)(v60 + 24);
          uint64_t v62 = *(void *)(v60 + 32);
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          unint64_t v208 = (unint64_t)v58;
          unint64_t v64 = v58[2];
          unint64_t v63 = v58[3];
          if (v64 >= v63 >> 1)
          {
            sub_10002904C(v63 > 1, v64 + 1, 1);
            uint64_t v58 = (void *)v208;
          }
          ++v59;
          v58[2] = v64 + 1;
          unint64_t v65 = &v58[2 * v64];
          v65[4] = v61;
          v65[5] = v62;
        }
        while (v57 != v59);
      }
      else
      {
        unint64_t v66 = v56 + 32;
        do
        {
          uint64_t v67 = *(void *)(*(void *)v66 + 24);
          uint64_t v68 = *(void *)(*(void *)v66 + 32);
          unint64_t v208 = (unint64_t)v58;
          unint64_t v70 = v58[2];
          unint64_t v69 = v58[3];
          swift_bridgeObjectRetain();
          if (v70 >= v69 >> 1)
          {
            sub_10002904C(v69 > 1, v70 + 1, 1);
            uint64_t v58 = (void *)v208;
          }
          v58[2] = v70 + 1;
          char v71 = &v58[2 * v70];
          v71[4] = v67;
          v71[5] = v68;
          v66 += 8;
          --v57;
        }
        while (v57);
      }
      LOBYTE(a1) = v201;
      uint64_t v10 = v200;
      LODWORD(a2) = v188;
      a5 = v187;
      goto LABEL_34;
    }
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }
LABEL_34:
  char v72 = v179 ^ a1;
  int v73 = v178 ^ a2;
  uint64_t v74 = (uint64_t)v202;
  id v75 = *(void **)&v202[v10[9]];
  int v76 = sub_1000282E0(v75, v58);
  if (v76)
  {
    swift_bridgeObjectRelease();
    uint64_t v77 = v197;
    if (v72)
    {
      if ((a1 & 1) == 0)
      {
LABEL_37:
        uint64_t v78 = (uint64_t)v202;
        sub_10002C044((uint64_t)&v202[v10[5]], (uint64_t)v33);
        uint64_t v79 = v194;
        uint64_t v80 = v195;
        int v81 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v194 + 48))(v33, 1, v195);
        sub_10002C0AC((uint64_t)v33, &qword_100040128);
        if (v81 != 1)
        {
          uint64_t v89 = (uint64_t)v175;
          Date.init()();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v79 + 56))(v89, 0, 1, v80);
          swift_beginAccess();
          sub_10002C108(v89, v78 + v10[6]);
          *(void *)(v78 + v10[12]) = v177;
          swift_endAccess();
        }
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      uint64_t v82 = (uint64_t)v175;
      Date.init()();
      uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v194 + 56);
      uint64_t v84 = v195;
      v83(v82, 0, 1, v195);
      uint64_t v85 = (uint64_t)v202;
      swift_beginAccess();
      sub_10002C108(v82, v85 + v10[5]);
      uint64_t v86 = v85 + v10[6];
      sub_10002C0AC(v86, &qword_100040128);
      v83(v86, 1, 1, v84);
      swift_endAccess();
LABEL_49:
      uint64_t v33 = (char *)v199;
      uint64_t v88 = v189;
      int v178 = v73;
      int v179 = v76 ^ 1;
      goto LABEL_50;
    }
    swift_bridgeObjectRelease();
    uint64_t v87 = v203;
    if ((a5 & 1) == 0)
    {
      long long v108 = v198;
      uint64_t v33 = (char *)v199;
      if ((v73 & 1) == 0) {
        goto LABEL_124;
      }
      int v179 = 0;
      goto LABEL_78;
    }
    int v178 = v73;
    int v179 = 0;
  }
  else
  {
    *(void *)(v74 + v10[10]) = v75;
    swift_bridgeObjectRetain();
    uint64_t v10 = v200;
    swift_bridgeObjectRelease();
    *(void *)(v74 + v10[9]) = v58;
    swift_bridgeObjectRelease();
    if (v72)
    {
      uint64_t v77 = v197;
      if ((a1 & 1) == 0) {
        goto LABEL_37;
      }
      goto LABEL_41;
    }
    swift_bridgeObjectRelease();
    uint64_t v87 = v203;
    uint64_t v77 = v197;
    if ((a5 & 1) == 0)
    {
      long long v108 = v198;
      uint64_t v33 = (char *)v199;
      if ((v73 & 1) == 0) {
        goto LABEL_100;
      }
      int v179 = 1;
      goto LABEL_78;
    }
    int v178 = v73;
    int v179 = 1;
  }
  uint64_t v33 = (char *)v199;
  uint64_t v88 = v189;
LABEL_50:
  uint64_t v87 = (uint8_t *)Logger.daemon.unsafeMutableAddressor();
  v197 = *(char **)(v88 + 16);
  ((void (*)(char *, uint8_t *, char *))v197)(v77, v87, v33);
  uint64_t v90 = Logger.logObject.getter();
  os_log_type_t v91 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v90, v91))
  {
    uint64_t v92 = (uint8_t *)swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    v177 = v87;
    *(_DWORD *)uint64_t v92 = 136446210;
    unint64_t v208 = v93;
    if (v201) {
      uint64_t v94 = 0x64656C62616E65;
    }
    else {
      uint64_t v94 = 0x64656C6261736964;
    }
    if (v201) {
      unint64_t v95 = 0xE700000000000000;
    }
    else {
      unint64_t v95 = 0xE800000000000000;
    }
    uint64_t v207 = sub_100008130(v94, v95, (uint64_t *)&v208);
    a5 = v187;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v33 = (char *)v199;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v90, v91, "Game mode %{public}s.", v92, 0xCu);
    swift_arrayDestroy();
    uint64_t v10 = v200;
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v96 = *(void (**)(char *, char *))(v88 + 8);
    uint64_t v87 = v177;
    v96(v77, v33);
  }
  else
  {

    uint64_t v96 = *(void (**)(char *, char *))(v88 + 8);
    v96(v77, v33);
  }
  v210 = &type metadata for GamePolicyFF;
  unint64_t v211 = sub_1000089D8();
  LOBYTE(v208) = 0;
  char v97 = isFeatureEnabled(_:)();
  sub_100008204((uint64_t)&v208);
  if (v97)
  {
    char v98 = v201;
    sub_10000A628(v201 & 1);
    v99 = v198;
    BOOL v100 = (int *)((char *)v198 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken);
    swift_beginAccess();
    if (*v100)
    {
      notify_set_state(*v100, v98 & 1);
      uint64_t v101 = *(uint64_t *)((char *)v99
                        + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification
                        + 8);
      unint64_t v208 = *(unint64_t *)((char *)v99
                                 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification);
      uint64_t v209 = v101;
      swift_bridgeObjectRetain();
      id v102 = v191;
      static String.Encoding.utf8.getter();
      sub_100016A64();
      uint64_t v103 = StringProtocol.cString(using:)();
      (*(void (**)(char *, uint64_t))(v192 + 8))(v102, v193);
      swift_bridgeObjectRelease();
      if (v103) {
        uint64_t v104 = (const char *)(v103 + 32);
      }
      else {
        uint64_t v104 = 0;
      }
      notify_post(v104);
      swift_bridgeObjectRelease();
      uint64_t v87 = (uint8_t *)(v184 + 8);
      if (v98) {
        static os_signpost_type_t.begin.getter();
      }
      else {
        static os_signpost_type_t.end.getter();
      }
      id v109 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
      id v110 = v185;
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:)();

      (*(void (**)(char *, uint64_t))v87)(v110, v186);
    }
    else
    {
      id v105 = v180;
      ((void (*)(char *, uint8_t *, char *))v197)(v180, v87, v33);
      v106 = Logger.logObject.getter();
      os_log_type_t v107 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v106, v107))
      {
        uint64_t v87 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v87 = 0;
        _os_log_impl((void *)&_mh_execute_header, v106, v107, "Unable to post game mode darwin notification - token is invalid!", v87, 2u);
        swift_slowDealloc();
      }

      v96(v105, v33);
    }
    uint64_t v10 = v200;
  }
  if (((v178 | a5) & 1) == 0)
  {
    long long v108 = v198;
    goto LABEL_99;
  }
  long long v108 = v198;
  uint64_t v87 = v203;
LABEL_78:
  uint64_t v111 = Logger.daemon.unsafeMutableAddressor();
  uint64_t v112 = v189;
  v113 = *(void (**)(uint8_t *, uint64_t, char *))(v189 + 16);
  v113(v87, v111, v33);
  id v114 = Logger.logObject.getter();
  os_log_type_t v115 = static os_log_type_t.default.getter();
  BOOL v116 = os_log_type_enabled(v114, v115);
  v197 = (char *)v113;
  if (v116)
  {
    uint64_t v87 = (uint8_t *)swift_slowAlloc();
    uint64_t v117 = swift_slowAlloc();
    *(_DWORD *)uint64_t v87 = 136446210;
    unint64_t v208 = v117;
    if (v201) {
      uint64_t v118 = 0x64656C62616E65;
    }
    else {
      uint64_t v118 = 0x64656C6261736964;
    }
    if (v201) {
      unint64_t v119 = 0xE700000000000000;
    }
    else {
      unint64_t v119 = 0xE800000000000000;
    }
    uint64_t v207 = sub_100008130(v118, v119, (uint64_t *)&v208);
    uint64_t v33 = (char *)v199;
    uint64_t v10 = v200;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v114, v115, "Jettison Camera S2R %{public}s.", v87, 0xCu);
    swift_arrayDestroy();
    long long v108 = v198;
    swift_slowDealloc();
    swift_slowDealloc();

    id v120 = *(void (**)(uint8_t *, char *))(v112 + 8);
    v120(v203, v33);
  }
  else
  {

    id v120 = *(void (**)(uint8_t *, char *))(v112 + 8);
    v120(v87, v33);
  }
  v121 = (int *)((char *)v108
               + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken);
  swift_beginAccess();
  char v122 = v188;
  if (*v121)
  {
    notify_set_state(*v121, v188 & 1);
    uint64_t v123 = *(uint64_t *)((char *)v108
                      + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification
                      + 8);
    unint64_t v208 = *(unint64_t *)((char *)v108
                               + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification);
    uint64_t v209 = v123;
    swift_bridgeObjectRetain();
    v124 = v191;
    static String.Encoding.utf8.getter();
    sub_100016A64();
    uint64_t v125 = StringProtocol.cString(using:)();
    (*(void (**)(char *, uint64_t))(v192 + 8))(v124, v193);
    swift_bridgeObjectRelease();
    if (v125) {
      v126 = (const char *)(v125 + 32);
    }
    else {
      v126 = 0;
    }
    notify_post(v126);
    swift_bridgeObjectRelease();
    uint64_t v87 = (uint8_t *)(v184 + 8);
    if (v122) {
      static os_signpost_type_t.begin.getter();
    }
    else {
      static os_signpost_type_t.end.getter();
    }
    id v127 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
    v128 = v185;
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(char *, uint64_t))v87)(v128, v186);
  }
  else
  {
    v129 = v183;
    ((void (*)(uint8_t *, uint64_t, char *))v197)(v183, v111, v33);
    v130 = Logger.logObject.getter();
    os_log_type_t v131 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v130, v131))
    {
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v87 = 0;
      _os_log_impl((void *)&_mh_execute_header, v130, v131, "Unable to post game mode camera jettison S2R darwin notification - token is invalid!", v87, 2u);
      swift_slowDealloc();
    }

    v120(v129, v33);
  }
LABEL_99:
  if ((v179 & 1) == 0) {
    goto LABEL_124;
  }
LABEL_100:
  if (!v176)
  {
    uint64_t v132 = *(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v132) {
      goto LABEL_102;
    }
LABEL_110:
    swift_bridgeObjectRelease();
    goto LABEL_124;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_110;
  }
LABEL_102:
  uint64_t v133 = v204;
  if ((v204 & 0xC000000000000001) != 0) {
    goto LABEL_163;
  }
  char v134 = v201;
  if (!*(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_165;
  }
  uint64_t v135 = *(void *)(v204 + 32);
  swift_retain();
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v87 = *(uint8_t **)(v135 + 24);
    uint64_t v133 = *(void *)(v135 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    Date.init()();
    long long v108 = &off_10003F000;
    if (v134)
    {
      if (qword_10003F328 != -1) {
        swift_once();
      }
      swift_retain();
      double v136 = GlobalPreferences.gameModeOnBannerDefaultTime.getter();
    }
    else
    {
      if (qword_10003F328 != -1) {
        swift_once();
      }
      swift_retain();
      double v136 = GlobalPreferences.gameModeOffBannerDefaultTime.getter();
    }
    double v137 = v136;
    swift_release();
    if (v137 <= 0.0) {
      goto LABEL_168;
    }
    if (qword_10003F328 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    swift_retain();
    if (*(void *)(GlobalPreferences.gameModeLastBannerDates.getter() + 16)) {
      sub_10000CF70((uint64_t)v87, v133);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v138 = v181;
    Date.init(timeIntervalSinceReferenceDate:)();
    swift_release();
    v139 = v182;
    static Date.+ infix(_:_:)();
    v140 = *(void (**)(char *, uint64_t))(v194 + 8);
    uint64_t v141 = v195;
    v140(v138, v195);
    LOBYTE(v138) = static Date.< infix(_:_:)();
    v140(v139, v141);
    if (v138)
    {
LABEL_168:
      if (qword_10003F328 != -1) {
LABEL_165:
      }
        swift_once();
      v142 = v108[191];
      swift_retain();
      unint64_t Banner = GlobalPreferences.gameModeLastBannerDates.getter();
      swift_bridgeObjectRetain();
      v144 = v190;
      Date.timeIntervalSinceReferenceDate.getter();
      double v146 = v145;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v208 = Banner;
      sub_10000DE24((uint64_t)v87, v133, isUniquelyReferenced_nonNull_native, v146);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v148 = (void *)v142[2];
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      NSString v150 = String._bridgeToObjectiveC()();
      [v148 setValue:isa forKey:v150];
      swift_release();

      long long v108 = v198;
      sub_1000269B8((uint64_t)v87, v133, 1, v201 & 1, 0);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v194 + 8))(v144, v195);
    }
    else
    {
      v140(v190, v195);
      swift_bridgeObjectRelease();
      long long v108 = v198;
    }
    uint64_t v10 = v200;
LABEL_124:
    sub_10002BFD4((uint64_t)v202, v196, (uint64_t (*)(void))&type metadata accessor for GameModeStatus.Config);
    id v151 = objc_allocWithZone((Class)type metadata accessor for GameModeStatus());
    v152 = (uint8_t *)GameModeStatus.init(config:)();
    v153 = (char *)off_10003FF18;
    v154 = (void *)*((void *)off_10003FF18 + 2);
    swift_retain();
    [v154 lock];
    v197 = v153;
    v203 = v152;
    sub_1000147D8((uint64_t)v153, v152, &v208);
    [v154 unlock];
    unint64_t v155 = v208;
    if (v208 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v156 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v156)
      {
LABEL_142:
        swift_release();
        goto LABEL_143;
      }
    }
    else
    {
      uint64_t v156 = *(void *)((v208 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v156) {
        goto LABEL_142;
      }
    }
    if (v156 >= 1) {
      break;
    }
LABEL_162:
    __break(1u);
LABEL_163:
    uint64_t v135 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    char v134 = v201;
  }
  for (uint64_t i = 0; i != v156; ++i)
  {
    if ((v155 & 0xC000000000000001) != 0) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      swift_retain();
    }
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v159 = [*(id *)(Strong + 16) remoteObjectProxy];
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100005690(&qword_100040CE0);
      if (swift_dynamicCast())
      {
        [v205 updateStatus:v203 :0 :0 :0];
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
  }
  swift_release();
  long long v108 = v198;
  uint64_t v33 = (char *)v199;
  uint64_t v10 = v200;
LABEL_143:
  swift_bridgeObjectRelease();
  char v160 = v201;
  if ((unint64_t)(*(void *)&v202[v10[13]] - 1) < 2) {
    goto LABEL_148;
  }
  if (!v176)
  {
    if (!*(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_149;
    }
    goto LABEL_148;
  }
  swift_bridgeObjectRetain();
  uint64_t v161 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v161) {
LABEL_148:
  }
    char v160 = 1;
LABEL_149:
  v210 = &type metadata for GamePolicyFF;
  unint64_t v211 = sub_1000089D8();
  LOBYTE(v208) = 0;
  char v162 = isFeatureEnabled(_:)();
  sub_100008204((uint64_t)&v208);
  if ((v162 & 1) == 0)
  {
LABEL_155:

    return;
  }
  v163 = (int *)((char *)v108 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken);
  swift_beginAccess();
  if (*v163)
  {
    notify_set_state(*v163, v160 & 1);
    uint64_t v164 = *(uint64_t *)((char *)v108
                      + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification
                      + 8);
    id v205 = *(_UNKNOWN **)((char *)v108
                        + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification);
    uint64_t v206 = v164;
    swift_bridgeObjectRetain();
    v165 = v191;
    static String.Encoding.utf8.getter();
    sub_100016A64();
    uint64_t v166 = StringProtocol.cString(using:)();
    (*(void (**)(char *, uint64_t))(v192 + 8))(v165, v193);
    swift_bridgeObjectRelease();
    if (v166) {
      v167 = (const char *)(v166 + 32);
    }
    else {
      v167 = 0;
    }
    notify_post(v167);
    swift_bridgeObjectRelease();
    goto LABEL_155;
  }
  uint64_t v168 = Logger.daemon.unsafeMutableAddressor();
  uint64_t v169 = v189;
  v170 = v174;
  (*(void (**)(char *, uint64_t, char *))(v189 + 16))(v174, v168, v33);
  v171 = Logger.logObject.getter();
  os_log_type_t v172 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v171, v172))
  {
    v173 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v173 = 0;
    _os_log_impl((void *)&_mh_execute_header, v171, v172, "Unable to post game mode available darwin notification - token is invalid!", v173, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, char *))(v169 + 8))(v170, v33);
}

uint64_t sub_10002151C(unsigned __int8 a1, unint64_t a2, char a3)
{
  unint64_t v87 = a2;
  uint64_t v6 = type metadata accessor for ModelManagerGameAssertionStatus.Config();
  __chkstk_darwin(v6);
  Swift::String v8 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005690(&qword_100040128);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v79 - v14;
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsModelManagerGameAssertion) == 1)
  {
    int v16 = a1;
    uint64_t v17 = (unsigned char *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig);
    uint64_t result = swift_beginAccess();
    int v18 = *v17;
    if (v18 == 2)
    {
      int v19 = a1 == 2;
      if (a1 != 2) {
        goto LABEL_28;
      }
    }
    else
    {
      if (a1 == 2)
      {
        int v19 = 0;
        goto LABEL_28;
      }
      if (v18) {
        unint64_t v20 = 0x4D656D6147414141;
      }
      else {
        unint64_t v20 = 0xD000000000000010;
      }
      if (v18) {
        unint64_t v21 = 0xEB0000000065646FLL;
      }
      else {
        unint64_t v21 = 0x80000001000306B0;
      }
      if (a1) {
        unint64_t v22 = 0x4D656D6147414141;
      }
      else {
        unint64_t v22 = 0xD000000000000010;
      }
      if (a1) {
        unint64_t v23 = 0xEB0000000065646FLL;
      }
      else {
        unint64_t v23 = 0x80000001000306B0;
      }
      if (v20 == v22 && v21 == v23)
      {
        uint64_t result = swift_bridgeObjectRelease_n();
        if ((a3 & 1) == 0) {
          return result;
        }
        int v19 = 1;
LABEL_28:
        int v83 = v19;
        int v84 = v16;
        uint64_t v25 = *(void *)&v17[*(int *)(v6 + 36)];
        *uint64_t v17 = v16;
        unint64_t v88 = (unint64_t)&_swiftEmptyArrayStorage;
        unint64_t v26 = v87;
        uint64_t v82 = v25;
        if (v87 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t result = _CocoaArrayWrapper.endIndex.getter();
          uint64_t v27 = result;
          if (!result) {
            goto LABEL_42;
          }
        }
        else
        {
          uint64_t v27 = *(void *)((v87 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          uint64_t result = swift_bridgeObjectRetain();
          if (!v27) {
            goto LABEL_42;
          }
        }
        if (v27 < 1)
        {
          __break(1u);
          goto LABEL_104;
        }
        if ((v26 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(unsigned char *)(specialized _ArrayBuffer._getElementSlowPath(_:)() + 44) == 1)
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
              specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized ContiguousArray._endMutation()();
            }
            else
            {
              swift_unknownObjectRelease();
            }
          }
        }
        else
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(unsigned char *)(*(void *)(v26 + 8 * j + 32) + 44) == 1)
            {
              swift_retain();
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
              specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized ContiguousArray._endMutation()();
              unint64_t v26 = v87;
            }
          }
        }
LABEL_42:
        swift_bridgeObjectRelease();
        uint64_t v79 = v15;
        uint64_t v85 = v17;
        uint64_t v86 = (int *)v6;
        unint64_t v30 = v88;
        if ((v88 & 0x8000000000000000) != 0 || (v88 & 0x4000000000000000) != 0)
        {
          swift_retain();
          uint64_t result = _CocoaArrayWrapper.endIndex.getter();
          uint64_t v31 = result;
        }
        else
        {
          uint64_t v31 = *(void *)(v88 + 16);
          uint64_t result = swift_retain();
        }
        uint64_t v32 = (char *)&_swiftEmptyArrayStorage;
        uint64_t v33 = &stru_10003E000;
        uint64_t v80 = v12;
        int v81 = v8;
        if (!v31)
        {
LABEL_60:
          swift_release_n();
          *(void *)&v85[v86[8]] = v32;
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v88 = (unint64_t)&_swiftEmptyArrayStorage;
          if (!v27) {
            goto LABEL_73;
          }
          if (v27 >= 1)
          {
            unint64_t v45 = v87;
            if ((v87 & 0xC000000000000001) != 0)
            {
              swift_bridgeObjectRetain();
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(unsigned char *)(specialized _ArrayBuffer._getElementSlowPath(_:)() + 50) == 1)
                {
                  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                  specialized ContiguousArray._endMutation()();
                }
                else
                {
                  swift_unknownObjectRelease();
                }
              }
            }
            else
            {
              swift_bridgeObjectRetain();
              for (uint64_t m = 0; m != v27; ++m)
              {
                if (*(unsigned char *)(*(void *)(v45 + 8 * m + 32) + 50) == 1)
                {
                  swift_retain();
                  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                  specialized ContiguousArray._endMutation()();
                  unint64_t v45 = v87;
                }
              }
            }
            swift_bridgeObjectRelease();
LABEL_73:
            unint64_t v48 = v88;
            if ((v88 & 0x8000000000000000) != 0 || (v88 & 0x4000000000000000) != 0)
            {
              swift_retain();
              uint64_t result = _CocoaArrayWrapper.endIndex.getter();
              uint64_t v49 = result;
              int v50 = v84;
              if (result)
              {
LABEL_76:
                if (v49 >= 1)
                {
                  uint64_t v51 = 0;
                  uint64_t v52 = (char *)&_swiftEmptyArrayStorage;
                  do
                  {
                    if ((v48 & 0xC000000000000001) != 0)
                    {
                      uint64_t v53 = specialized _ArrayBuffer._getElementSlowPath(_:)();
                    }
                    else
                    {
                      uint64_t v53 = *(void *)(v48 + 8 * v51 + 32);
                      swift_retain();
                    }
                    id v54 = [*(id *)(v53 + 16) v33[103].name:v79];
                    if (v54
                      && (uint64_t v55 = v54,
                          id v56 = [v54 identifier],
                          v55,
                          v56))
                    {
                      uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                      uint64_t v59 = v58;
                      swift_release();

                      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                        uint64_t v52 = sub_10002C9E8(0, *((void *)v52 + 2) + 1, 1, v52);
                      }
                      unint64_t v61 = *((void *)v52 + 2);
                      unint64_t v60 = *((void *)v52 + 3);
                      if (v61 >= v60 >> 1) {
                        uint64_t v52 = sub_10002C9E8((char *)(v60 > 1), v61 + 1, 1, v52);
                      }
                      *((void *)v52 + 2) = v61 + 1;
                      uint64_t v62 = &v52[16 * v61];
                      *((void *)v62 + 4) = v57;
                      *((void *)v62 + 5) = v59;
                      uint64_t v33 = &stru_10003E000;
                    }
                    else
                    {
                      swift_release();
                    }
                    ++v51;
                  }
                  while (v49 != v51);
LABEL_93:
                  swift_release_n();
                  uint64_t v64 = (uint64_t)v85;
                  unint64_t v63 = v86;
                  *(void *)&v85[v86[9]] = v52;
                  swift_bridgeObjectRelease();
                  if (qword_10003F358 != -1) {
                    swift_once();
                  }
                  uint64_t v65 = swift_retain();
                  uint64_t v66 = sub_100013168(v65);
                  swift_release();
                  *(void *)(v64 + v63[11]) = v66;
                  uint64_t v67 = (uint64_t)v80;
                  uint64_t v68 = (uint64_t)v81;
                  if ((v83 & 1) == 0)
                  {
                    if (v50 != 2)
                    {
                      swift_bridgeObjectRelease();
                      uint64_t v73 = (uint64_t)v79;
                      Date.init()();
                      uint64_t v74 = type metadata accessor for Date();
                      id v75 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56);
                      v75(v73, 0, 1, v74);
                      swift_beginAccess();
                      sub_10002C108(v73, v64 + v63[5]);
                      uint64_t v76 = v64 + v63[6];
                      sub_10002C0AC(v76, &qword_100040128);
                      v75(v76, 1, 1, v74);
                      swift_endAccess();
                      goto LABEL_101;
                    }
                    sub_10002C044(v64 + v63[5], (uint64_t)v80);
                    uint64_t v69 = type metadata accessor for Date();
                    uint64_t v70 = *(void *)(v69 - 8);
                    int v71 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v67, 1, v69);
                    sub_10002C0AC(v67, &qword_100040128);
                    if (v71 != 1)
                    {
                      uint64_t v72 = (uint64_t)v79;
                      Date.init()();
                      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v70 + 56))(v72, 0, 1, v69);
                      swift_beginAccess();
                      sub_10002C108(v72, v64 + v63[6]);
                      *(void *)(v64 + v63[10]) = v82;
                      swift_endAccess();
                    }
                  }
                  swift_bridgeObjectRelease();
LABEL_101:
                  sub_10002BFD4(v64, v68, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
                  id v77 = objc_allocWithZone((Class)type metadata accessor for ModelManagerGameAssertionStatus());
                  uint64_t v78 = (void *)ModelManagerGameAssertionStatus.init(config:)();
                  swift_retain();
                  sub_10001496C(v78);

                  return swift_release();
                }
LABEL_106:
                __break(1u);
                return result;
              }
            }
            else
            {
              uint64_t v49 = *(void *)(v88 + 16);
              uint64_t result = swift_retain();
              int v50 = v84;
              if (v49) {
                goto LABEL_76;
              }
            }
            uint64_t v52 = (char *)&_swiftEmptyArrayStorage;
            goto LABEL_93;
          }
LABEL_105:
          __break(1u);
          goto LABEL_106;
        }
        if (v31 >= 1)
        {
          for (uint64_t n = 0; n != v31; ++n)
          {
            if ((v30 & 0xC000000000000001) != 0)
            {
              uint64_t v35 = specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else
            {
              uint64_t v35 = *(void *)(v30 + 8 * n + 32);
              swift_retain();
            }
            id v36 = [[*(id *)(v35 + 16) v33[103].name:v79];
            if (v36
              && (uint64_t v37 = v36,
                  id v38 = [v36 identifier],
                  v37,
                  v38))
            {
              uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v41 = v40;
              swift_release();

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v32 = sub_10002C9E8(0, *((void *)v32 + 2) + 1, 1, v32);
              }
              unint64_t v43 = *((void *)v32 + 2);
              unint64_t v42 = *((void *)v32 + 3);
              if (v43 >= v42 >> 1) {
                uint64_t v32 = sub_10002C9E8((char *)(v42 > 1), v43 + 1, 1, v32);
              }
              *((void *)v32 + 2) = v43 + 1;
              unint64_t v44 = &v32[16 * v43];
              *((void *)v44 + 4) = v39;
              *((void *)v44 + 5) = v41;
              uint64_t v33 = &stru_10003E000;
            }
            else
            {
              swift_release();
            }
          }
          goto LABEL_60;
        }
LABEL_104:
        __break(1u);
        goto LABEL_105;
      }
      int v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v19 & 1) == 0) {
        goto LABEL_28;
      }
    }
    if ((a3 & 1) == 0) {
      return result;
    }
    goto LABEL_28;
  }
  return result;
}

void sub_100021EFC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v136 = type metadata accessor for SustainedExecutionStatus.Config();
  __chkstk_darwin(v136);
  uint64_t v132 = (char *)&v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for OSSignpostID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v116 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = type metadata accessor for String.Encoding();
  uint64_t v129 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  v128 = (char *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = type metadata accessor for Logger();
  uint64_t v133 = *(void *)(v135 - 8);
  uint64_t v13 = __chkstk_darwin(v135);
  char v134 = (char *)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  os_log_type_t v131 = (char *)&v116 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  int v19 = (char *)&v116 - v18;
  __chkstk_darwin(v17);
  uint64_t v125 = (char *)&v116 - v20;
  uint64_t v21 = sub_100005690(&qword_100040128);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v126 = (uint64_t)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  id v127 = (char *)&v116 - v24;
  double v137 = v3;
  if (v3[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsSustainedExecutionMode] == 1)
  {
    uint64_t v25 = &v137[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig];
    swift_beginAccess();
    unsigned int v124 = *v25 ^ a1;
    if (v124 & 1) != 0 || (a3)
    {
      uint64_t v117 = v19;
      uint64_t v118 = v9;
      unint64_t v119 = v11;
      uint64_t v26 = *(void *)&v25[*(int *)(v136 + 32)];
      uint64_t v121 = a1;
      char v122 = v25;
      *uint64_t v25 = a1 & 1;
      v139[0] = &_swiftEmptyArrayStorage;
      uint64_t v120 = v26;
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
        if (!v27) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v27 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!v27) {
          goto LABEL_18;
        }
      }
      if (v27 < 1)
      {
        __break(1u);
        goto LABEL_103;
      }
      if ((a2 & 0xC000000000000001) != 0)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(unsigned char *)(specialized _ArrayBuffer._getElementSlowPath(_:)() + 49) == 1)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
          }
          else
          {
            swift_unknownObjectRelease();
          }
        }
      }
      else
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(unsigned char *)(*(void *)(a2 + 8 * j + 32) + 49) == 1)
          {
            swift_retain();
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
          }
        }
      }
LABEL_18:
      swift_bridgeObjectRelease();
      unint64_t v30 = (unint64_t)v139[0];
      if (((unint64_t)v139[0] & 0x8000000000000000) != 0
        || ((unint64_t)v139[0] & 0x4000000000000000) != 0)
      {
        swift_retain();
        uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
      }
      else
      {
        uint64_t v31 = *((void *)v139[0] + 2);
        swift_retain();
      }
      uint64_t v123 = 0;
      uint64_t v116 = v8;
      if (!v31)
      {
        uint64_t v33 = (char *)&_swiftEmptyArrayStorage;
        goto LABEL_37;
      }
      if (v31 >= 1)
      {
        uint64_t v32 = 0;
        uint64_t v33 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if ((v30 & 0xC000000000000001) != 0)
          {
            uint64_t v34 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v34 = *(void *)(v30 + 8 * v32 + 32);
            swift_retain();
          }
          id v35 = [*(id *)(v34 + 16) bundle:v116];
          if (v35
            && (id v36 = v35,
                id v37 = [v35 identifier],
                v36,
                v37))
          {
            uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v40 = v39;
            swift_release();

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v33 = sub_10002C9E8(0, *((void *)v33 + 2) + 1, 1, v33);
            }
            unint64_t v42 = *((void *)v33 + 2);
            unint64_t v41 = *((void *)v33 + 3);
            if (v42 >= v41 >> 1) {
              uint64_t v33 = sub_10002C9E8((char *)(v41 > 1), v42 + 1, 1, v33);
            }
            *((void *)v33 + 2) = v42 + 1;
            unint64_t v43 = &v33[16 * v42];
            *((void *)v43 + 4) = v38;
            *((void *)v43 + 5) = v40;
          }
          else
          {
            swift_release();
          }
          ++v32;
        }
        while (v31 != v32);
LABEL_37:
        swift_release_n();
        unint64_t v44 = (int *)v136;
        uint64_t v45 = (uint64_t)v122;
        *(void *)&v122[*(int *)(v136 + 32)] = v33;
        uint64_t v46 = v45;
        swift_bridgeObjectRelease();
        if (qword_10003F358 != -1) {
          swift_once();
        }
        unint64_t v47 = (void *)swift_retain();
        uint64_t v48 = sub_100012E90(v47);
        swift_release();
        *(void *)(v46 + v44[10]) = v48;
        uint64_t v49 = v133;
        char v50 = v124;
        if (v124)
        {
          uint64_t v51 = (uint64_t)v132;
          if (v121)
          {
            swift_bridgeObjectRelease();
            uint64_t v52 = (uint64_t)v127;
            Date.init()();
            uint64_t v53 = type metadata accessor for Date();
            id v54 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56);
            v54(v52, 0, 1, v53);
            swift_beginAccess();
            sub_10002C108(v52, v46 + v44[5]);
            uint64_t v55 = v46 + v44[6];
            sub_10002C0AC(v55, &qword_100040128);
            v54(v55, 1, 1, v53);
            swift_endAccess();
          }
          else
          {
            uint64_t v106 = v126;
            sub_10002C044(v46 + v44[5], v126);
            uint64_t v107 = type metadata accessor for Date();
            uint64_t v108 = *(void *)(v107 - 8);
            int v109 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v108 + 48))(v106, 1, v107);
            sub_10002C0AC(v106, &qword_100040128);
            if (v109 != 1)
            {
              uint64_t v110 = (uint64_t)v127;
              Date.init()();
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v108 + 56))(v110, 0, 1, v107);
              swift_beginAccess();
              sub_10002C108(v110, v46 + v44[6]);
              *(void *)(v46 + v44[9]) = v120;
              swift_endAccess();
            }
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v51 = (uint64_t)v132;
        }
        id v56 = self;
        v139[0] = 0;
        id v57 = [v56 createClient:v139];
        id v58 = v139[0];
        if (v57)
        {
          uint64_t v59 = v57;
          v139[0] = 0;
          id v60 = v58;
          unsigned int v61 = [v59 setSustainableMode:v121 & 1 options:0 error:v139];
          id v62 = v139[0];
          if (v61)
          {
            v139[0] = 0;
            id v63 = v62;
            id v64 = [v59 isInSustainableMode:v139];
            if (!v139[0])
            {
              if (v50)
              {
                uint64_t v111 = v64;
                uint64_t v112 = Logger.daemon.unsafeMutableAddressor();
                uint64_t v69 = v135;
                (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v125, v112, v135);
                v113 = Logger.logObject.getter();
                os_log_type_t v114 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v113, v114))
                {
                  os_log_type_t v115 = (uint8_t *)swift_slowAlloc();
                  *(_DWORD *)os_log_type_t v115 = 134349056;
                  uint64_t v46 = (uint64_t)v122;
                  v139[0] = v111;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  _os_log_impl((void *)&_mh_execute_header, v113, v114, "Set sustained execution mode to %{public}lu", v115, 0xCu);
                  uint64_t v69 = v135;
                  swift_slowDealloc();
                  swift_unknownObjectRelease();
                }
                else
                {

                  swift_unknownObjectRelease();
                }
                id v75 = v137;
                (*(void (**)(char *, uint64_t))(v49 + 8))(v125, v69);
              }
              else
              {
                swift_unknownObjectRelease();
                uint64_t v69 = v135;
                id v75 = v137;
              }
LABEL_54:
              uint64_t v76 = (int *)&v75[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken];
              swift_beginAccess();
              if (*v76)
              {
                char v77 = v121;
                notify_set_state(*v76, v121 & 1);
                uint64_t v78 = *(void **)&v75[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification + 8];
                v139[0] = *(id *)&v75[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification];
                v139[1] = v78;
                swift_bridgeObjectRetain();
                uint64_t v79 = v128;
                static String.Encoding.utf8.getter();
                sub_100016A64();
                uint64_t v80 = StringProtocol.cString(using:)();
                (*(void (**)(char *, uint64_t))(v129 + 8))(v79, v130);
                swift_bridgeObjectRelease();
                if (v80) {
                  int v81 = (const char *)(v80 + 32);
                }
                else {
                  int v81 = 0;
                }
                notify_post(v81);
                swift_bridgeObjectRelease();
                uint64_t v82 = Logger.daemon.unsafeMutableAddressor();
                int v83 = v117;
                (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v117, v82, v69);
                int v84 = Logger.logObject.getter();
                os_log_type_t v85 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v84, v85))
                {
                  uint64_t v86 = (uint8_t *)swift_slowAlloc();
                  unint64_t v87 = (void *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v86 = 136446210;
                  v139[0] = v87;
                  if (v77) {
                    uint64_t v88 = 0x64656C62616E65;
                  }
                  else {
                    uint64_t v88 = 0x64656C6261736964;
                  }
                  if (v77) {
                    unint64_t v89 = 0xE700000000000000;
                  }
                  else {
                    unint64_t v89 = 0xE800000000000000;
                  }
                  id v138 = (id)sub_100008130(v88, v89, (uint64_t *)v139);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  uint64_t v46 = (uint64_t)v122;
                  swift_bridgeObjectRelease();
                  _os_log_impl((void *)&_mh_execute_header, v84, v85, "Sustained execution mode %{public}s.", v86, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  (*(void (**)(char *, uint64_t))(v133 + 8))(v83, v135);
                }
                else
                {

                  (*(void (**)(char *, uint64_t))(v49 + 8))(v83, v69);
                }
                uint64_t v94 = v119;
                unint64_t v95 = (void (**)(char *, uint64_t))(v118 + 8);
                if (v77) {
                  static os_signpost_type_t.begin.getter();
                }
                else {
                  static os_signpost_type_t.end.getter();
                }
                id v96 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
                static OSSignpostID.exclusive.getter();
                os_signpost(_:dso:log:name:signpostID:)();

                (*v95)(v94, v116);
              }
              else
              {
                uint64_t v90 = Logger.daemon.unsafeMutableAddressor();
                (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v131, v90, v69);
                os_log_type_t v91 = Logger.logObject.getter();
                os_log_type_t v92 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v91, v92))
                {
                  uint64_t v93 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v93 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v91, v92, "Unable to post game mode darwin notification - token is invalid!", v93, 2u);
                  uint64_t v69 = v135;
                  swift_slowDealloc();
                }

                (*(void (**)(char *, uint64_t))(v49 + 8))(v131, v69);
              }
              sub_10002BFD4(v46, v51, (uint64_t (*)(void))&type metadata accessor for SustainedExecutionStatus.Config);
              id v97 = objc_allocWithZone((Class)type metadata accessor for SustainedExecutionStatus());
              char v98 = (char *)SustainedExecutionStatus.init(config:)();
              v99 = off_10003FF18;
              BOOL v100 = (void *)*((void *)off_10003FF18 + 2);
              swift_retain();
              [v100 lock];
              double v137 = v98;
              sub_1000155A8((uint64_t)v99, v98, v139);
              [v100 unlock];
              unint64_t v101 = (unint64_t)v139[0];
              if ((unint64_t)v139[0] >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v102 = _CocoaArrayWrapper.endIndex.getter();
                swift_bridgeObjectRelease();
                if (v102)
                {
LABEL_76:
                  uint64_t v136 = (uint64_t)v99;
                  if (v102 >= 1)
                  {
                    for (uint64_t k = 0; k != v102; ++k)
                    {
                      if ((v101 & 0xC000000000000001) != 0) {
                        specialized _ArrayBuffer._getElementSlowPath(_:)();
                      }
                      else {
                        swift_retain();
                      }
                      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
                      if (Strong)
                      {
                        id v105 = [*(id *)(Strong + 16) remoteObjectProxy];
                        _bridgeAnyObjectToAny(_:)();
                        swift_unknownObjectRelease();
                        sub_100005690(&qword_100040CE0);
                        if (swift_dynamicCast())
                        {
                          [v138 updateStatus:0 :0 :v137 :0];
                          swift_release();
                          swift_unknownObjectRelease();
                        }
                        else
                        {
                          swift_release();
                        }
                        swift_unknownObjectRelease();
                      }
                      else
                      {
                        swift_release();
                      }
                    }
                    goto LABEL_100;
                  }
LABEL_104:
                  __break(1u);
                }
              }
              else
              {
                uint64_t v102 = *(void *)(((unint64_t)v139[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
                if (v102) {
                  goto LABEL_76;
                }
              }
LABEL_100:
              swift_release();
              swift_bridgeObjectRelease();

              return;
            }
            id v65 = v139[0];
          }
          else
          {
            id v67 = v139[0];
            _convertNSErrorToError(_:)();
          }
          swift_willThrow();
          swift_unknownObjectRelease();
        }
        else
        {
          id v66 = v139[0];
          _convertNSErrorToError(_:)();

          swift_willThrow();
        }
        uint64_t v123 = 0;
        uint64_t v68 = Logger.daemon.unsafeMutableAddressor();
        uint64_t v69 = v135;
        (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v134, v68, v135);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v70 = Logger.logObject.getter();
        os_log_type_t v71 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v70, v71))
        {
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          uint64_t v73 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v72 = 138543362;
          swift_errorRetain();
          uint64_t v74 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v139[0] = v74;
          uint64_t v46 = (uint64_t)v122;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v73 = v74;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v70, v71, "Unable to set sustained execution mode: %{public}@", v72, 0xCu);
          sub_100005690((uint64_t *)&unk_10003FCA0);
          swift_arrayDestroy();
          uint64_t v69 = v135;
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
        id v75 = v137;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v134, v69);
        goto LABEL_54;
      }
LABEL_103:
      __break(1u);
      goto LABEL_104;
    }
  }
}

uint64_t sub_100023130@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, unsigned char *a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, void *a7@<X6>, unsigned char *a8@<X7>, unsigned char *a9@<X8>, unsigned char *a10, char *a11)
{
  uint64_t v102 = a8;
  int v109 = a7;
  v99 = a5;
  uint64_t v100 = a6;
  uint64_t v104 = a3;
  uint64_t v90 = a9;
  uint64_t v103 = a11;
  unint64_t v101 = a10;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  os_log_type_t v91 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  int v19 = (char *)&v87 - v18;
  unint64_t v89 = a1;
  uint64_t v107 = a1[4];
  uint64_t v20 = (unint64_t *)(a2 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses);
  swift_beginAccess();
  unint64_t v21 = *v20;
  if ((*v20 & 0xC000000000000001) != 0)
  {
    uint64_t v22 = __CocoaDictionary.makeIterator()();
    unint64_t v110 = 0;
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    unint64_t v25 = v22 | 0x8000000000000000;
  }
  else
  {
    uint64_t v26 = -1 << *(unsigned char *)(v21 + 32);
    uint64_t v23 = ~v26;
    uint64_t v27 = *(void *)(v21 + 64);
    unint64_t v110 = v21 + 64;
    uint64_t v28 = -v26;
    if (v28 < 64) {
      uint64_t v29 = ~(-1 << v28);
    }
    else {
      uint64_t v29 = -1;
    }
    unint64_t v24 = v29 & v27;
    unint64_t v25 = v21;
  }
  swift_bridgeObjectRetain();
  uint64_t v30 = 0;
  uint64_t v106 = v25 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v88 = v23;
  int64_t v108 = (unint64_t)(v23 + 64) >> 6;
  char v98 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  id v97 = (void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v94 = (uint64_t *)&v115;
  *(void *)&long long v31 = 136315138;
  long long v93 = v31;
  os_log_type_t v92 = (char *)&type metadata for Any + 8;
  *(void *)&long long v31 = 67109378;
  long long v87 = v31;
  id v105 = (char *)&type metadata for Swift.AnyObject + 8;
  unint64_t v95 = a4;
  uint64_t v112 = v14;
  id v96 = v19;
  unint64_t v32 = v25;
  unint64_t v111 = v25;
  while (1)
  {
    if ((v32 & 0x8000000000000000) != 0)
    {
      uint64_t v35 = __CocoaDictionary.Iterator.next()();
      if (!v35) {
        goto LABEL_60;
      }
      uint64_t v37 = v36;
      uint64_t v114 = v35;
      sub_100007FBC(0, &qword_100040C90);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v38 = v115;
      swift_unknownObjectRelease();
      uint64_t v114 = v37;
      type metadata accessor for EmbeddedGameProcess();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v39 = (uint64_t)v115;
      swift_unknownObjectRelease();
      uint64_t v34 = v30;
      uint64_t v113 = v24;
      uint64_t v14 = v112;
      if (!v38) {
        goto LABEL_60;
      }
      goto LABEL_30;
    }
    if (v24)
    {
      uint64_t v113 = (v24 - 1) & v24;
      unint64_t v33 = __clz(__rbit64(v24)) | (v30 << 6);
      uint64_t v34 = v30;
      goto LABEL_29;
    }
    int64_t v40 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
      __break(1u);
      goto LABEL_90;
    }
    if (v40 >= v108) {
      goto LABEL_60;
    }
    unint64_t v41 = *(void *)(v110 + 8 * v40);
    uint64_t v34 = v30 + 1;
    if (!v41)
    {
      uint64_t v34 = v30 + 2;
      if (v30 + 2 >= v108) {
        goto LABEL_60;
      }
      unint64_t v41 = *(void *)(v110 + 8 * v34);
      if (!v41)
      {
        uint64_t v34 = v30 + 3;
        if (v30 + 3 >= v108) {
          goto LABEL_60;
        }
        unint64_t v41 = *(void *)(v110 + 8 * v34);
        if (!v41)
        {
          uint64_t v34 = v30 + 4;
          if (v30 + 4 >= v108) {
            goto LABEL_60;
          }
          unint64_t v41 = *(void *)(v110 + 8 * v34);
          if (!v41) {
            break;
          }
        }
      }
    }
LABEL_28:
    uint64_t v113 = (v41 - 1) & v41;
    unint64_t v33 = __clz(__rbit64(v41)) + (v34 << 6);
LABEL_29:
    uint64_t v43 = 8 * v33;
    uint64_t v39 = *(void *)(*(void *)(v32 + 56) + v43);
    id v38 = *(id *)(*(void *)(v32 + 48) + v43);
    swift_retain();
    if (!v38) {
      goto LABEL_60;
    }
LABEL_30:

    if (*(unsigned char *)(v39 + 48))
    {
      if (*(unsigned char *)(v39 + 42) == 1) {
        *uint64_t v104 = 1;
      }
      *a4 = 1;
      if (*(unsigned char *)(v39 + 41) == 1)
      {
        swift_retain();
        unint64_t v44 = v99;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((*v44 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v44 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        uint64_t v45 = v100;
        if (*(void *)(v100 + 16))
        {
          uint64_t v46 = *(void *)(v39 + 24);
          uint64_t v47 = *(void *)(v39 + 32);
          swift_bridgeObjectRetain();
          unint64_t v48 = sub_10000CF70(v46, v47);
          if (v49)
          {
            int v50 = *(unsigned __int8 *)(*(void *)(v45 + 56) + v48);
            swift_bridgeObjectRelease();
            uint64_t v51 = Logger.daemon.unsafeMutableAddressor();
            uint64_t v52 = v91;
            (*v98)(v91, v51, v14);
            swift_retain();
            uint64_t v53 = Logger.logObject.getter();
            os_log_type_t v54 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v53, v54))
            {
              uint64_t v55 = swift_slowAlloc();
              os_log_type_t v115 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v55 = v87;
              *(_DWORD *)(v55 + 4) = v50;
              *(_WORD *)(v55 + 8) = 2080;
              uint64_t v56 = *(void *)(v39 + 24);
              unint64_t v57 = *(void *)(v39 + 32);
              swift_bridgeObjectRetain();
              *(void *)(v55 + 10) = sub_100008130(v56, v57, (uint64_t *)&v115);
              swift_release();
              a4 = v95;
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v53, v54, "Known Game Mode state: %{BOOL}d for: %s", (uint8_t *)v55, 0x12u);
              swift_arrayDestroy();
              uint64_t v14 = v112;
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              swift_release();
            }
            (*v97)(v52, v14);
            *(unsigned char *)(v39 + 49) = v50;
            int v19 = v96;
            if (!v50) {
              goto LABEL_50;
            }
            goto LABEL_47;
          }
          swift_bridgeObjectRelease();
        }
        uint64_t v58 = Logger.daemon.unsafeMutableAddressor();
        (*v98)(v19, v58, v14);
        swift_retain();
        uint64_t v59 = Logger.logObject.getter();
        os_log_type_t v60 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v59, v60))
        {
          unsigned int v61 = (uint8_t *)swift_slowAlloc();
          os_log_type_t v115 = (void *)swift_slowAlloc();
          *(_DWORD *)unsigned int v61 = v93;
          uint64_t v62 = *(void *)(v39 + 24);
          unint64_t v63 = *(void *)(v39 + 32);
          swift_bridgeObjectRetain();
          uint64_t v114 = sub_100008130(v62, v63, (uint64_t *)&v115);
          uint64_t v14 = v112;
          a4 = v95;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          int v19 = v96;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v59, v60, "Unknown Game Mode state for: %s", v61, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_release();
        }
        (*v97)(v19, v14);
        if (qword_10003F328 != -1) {
          swift_once();
        }
        id v64 = off_10003F5F8;
        uint64_t v65 = *(void *)(v39 + 24);
        uint64_t v66 = *(void *)(v39 + 32);
        swift_retain();
        swift_bridgeObjectRetain();
        unint64_t v67 = GlobalPreferences.gameModeEnabledList.getter();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        os_log_type_t v115 = (void *)v67;
        sub_10000DCB8(1, v65, v66, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v69 = (void *)v64[2];
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        NSString v71 = String._bridgeToObjectiveC()();
        [v69 setValue:isa forKey:v71];
        swift_release();
        swift_bridgeObjectRelease();

        *(unsigned char *)(v39 + 49) = 1;
LABEL_47:
        swift_retain();
        uint64_t v72 = v109;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((*v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
LABEL_50:
      if (*(unsigned char *)(v39 + 44) == 1)
      {
        *(unsigned char *)(v39 + 50) = 1;
        *uint64_t v102 = 1;
      }
      unint64_t v32 = v111;
      if (*(unsigned char *)(v39 + 49) == 1 && v107 != 2)
      {
        *(unsigned char *)(v39 + 50) = 1;
        unsigned char *v101 = 1;
      }
      int v73 = *(unsigned __int8 *)(v39 + 45);
      swift_release();
      uint64_t v30 = v34;
      unint64_t v74 = v113;
      unint64_t v24 = v113;
      if (v73 == 1)
      {
        *uint64_t v103 = 1;
        uint64_t v30 = v34;
        unint64_t v24 = v74;
      }
    }
    else
    {
      *(_WORD *)(v39 + 49) = 0;
      swift_release();
      uint64_t v30 = v34;
      unint64_t v24 = v113;
    }
  }
  uint64_t v42 = v30 + 5;
  while (v108 != v42)
  {
    unint64_t v41 = *(void *)(v110 + 8 * v42++);
    if (v41)
    {
      uint64_t v34 = v42 - 1;
      goto LABEL_28;
    }
  }
LABEL_60:
  uint64_t result = sub_10002C03C();
  if (!(*v109 >> 62))
  {
    uint64_t v76 = *(void *)((*v109 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_62;
  }
LABEL_90:
  swift_bridgeObjectRetain();
  uint64_t v76 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_62:
  BOOL v79 = (v76 > 0 || v107 == 1) && v107 != 2;
  char v80 = 2;
  switch(v89[7])
  {
    case 0:
      if (*v102) {
        goto LABEL_73;
      }
      if (*v101) {
        char v80 = 0;
      }
      else {
        char v80 = 2;
      }
      break;
    case 1:
      break;
    case 2:
      char v80 = 0;
      break;
    case 3:
LABEL_73:
      char v80 = 1;
      break;
    default:
      os_log_type_t v115 = (void *)v89[7];
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x100023C5CLL);
  }
  uint64_t v81 = v89[5];
  BOOL v82 = ((*v104 & 1) != 0 || v81 == 1) && v81 != 2;
  uint64_t v83 = v89[6];
  if ((*a4 & 1) == 0 && v83 != 1)
  {
    BOOL v84 = 0;
    char v85 = 0;
    if (!v79) {
      goto LABEL_88;
    }
LABEL_87:
    char v85 = *v103;
    goto LABEL_88;
  }
  BOOL v84 = v83 != 2;
  if (v79) {
    goto LABEL_87;
  }
  char v85 = 0;
LABEL_88:
  uint64_t v86 = v90;
  unsigned char *v90 = v79;
  v86[1] = v82;
  v86[2] = v84;
  v86[3] = v80;
  v86[4] = v85;
  return result;
}

void sub_100023C6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for GameModeStatus.Config();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (void *)((char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if (v9)
  {
    if (qword_10003F358 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v11 = (void *)swift_retain();
  uint64_t v12 = sub_100012E8C(v11);
  swift_release();
  uint64_t v13 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig;
  swift_beginAccess();
  *(void *)(v13 + *(int *)(v2 + 52)) = v12;
  sub_10002BFD4(v13, (uint64_t)v4, (uint64_t (*)(void))&type metadata accessor for GameModeStatus.Config);
  id v14 = objc_allocWithZone((Class)type metadata accessor for GameModeStatus());
  uint64_t v15 = (void *)GameModeStatus.init(config:)();
  uint64_t v16 = off_10003FF18;
  uint64_t v17 = (void *)*((void *)off_10003FF18 + 2);
  swift_retain();
  [v17 lock];
  id v24 = v15;
  sub_1000147D8((uint64_t)v16, v15, v26);
  [v17 unlock];
  uint64_t v18 = v26[0];
  if (!(v26[0] >> 62))
  {
    uint64_t v19 = *(void *)((v26[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v19) {
      goto LABEL_5;
    }
LABEL_21:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100005E2C();

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_21;
  }
LABEL_5:
  if (v19 >= 1)
  {
    v23[0] = v16;
    v23[1] = v1;
    for (uint64_t i = 0; i != v19; ++i)
    {
      if ((v18 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v22 = [*(id *)(Strong + 16) remoteObjectProxy:v23[0]];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100005690(&qword_100040CE0);
        if (swift_dynamicCast())
        {
          [v25 updateStatus:v24 :0 :0 :0];
          swift_release();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_release();
        }
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
    goto LABEL_21;
  }
  __break(1u);
}

void sub_100024070()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ModelManagerGameAssertionStatus.Config();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (qword_10003F358 != -1) {
LABEL_5:
  }
    swift_once();
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_100013168(v11);
  swift_release();
  uint64_t v13 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig;
  swift_beginAccess();
  *(void *)(v13 + *(int *)(v2 + 44)) = v12;
  sub_10002BFD4(v13, (uint64_t)v4, (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  id v14 = objc_allocWithZone((Class)type metadata accessor for ModelManagerGameAssertionStatus());
  uint64_t v15 = (void *)ModelManagerGameAssertionStatus.init(config:)();
  swift_retain();
  sub_10001496C(v15);
  swift_release();
  sub_100005E2C();
}

void sub_1000242BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SustainedExecutionStatus.Config();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (void *)((char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if (v9)
  {
    if (qword_10003F358 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v11 = (void *)swift_retain();
  uint64_t v12 = sub_100012E90(v11);
  swift_release();
  uint64_t v13 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig;
  swift_beginAccess();
  *(void *)(v13 + *(int *)(v2 + 40)) = v12;
  sub_10002BFD4(v13, (uint64_t)v4, (uint64_t (*)(void))&type metadata accessor for SustainedExecutionStatus.Config);
  id v14 = objc_allocWithZone((Class)type metadata accessor for SustainedExecutionStatus());
  uint64_t v15 = (void *)SustainedExecutionStatus.init(config:)();
  uint64_t v16 = off_10003FF18;
  uint64_t v17 = (void *)*((void *)off_10003FF18 + 2);
  swift_retain();
  [v17 lock];
  id v24 = v15;
  sub_1000155A8((uint64_t)v16, v15, v26);
  [v17 unlock];
  uint64_t v18 = v26[0];
  if (!(v26[0] >> 62))
  {
    uint64_t v19 = *(void *)((v26[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v19) {
      goto LABEL_5;
    }
LABEL_21:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100005E2C();

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_21;
  }
LABEL_5:
  if (v19 >= 1)
  {
    v23[0] = v16;
    v23[1] = v1;
    for (uint64_t i = 0; i != v19; ++i)
    {
      if ((v18 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v22 = [*(id *)(Strong + 16) remoteObjectProxy:v23[0]];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100005690(&qword_100040CE0);
        if (swift_dynamicCast())
        {
          [v25 updateStatus:0 :0 :v24 :0];
          swift_release();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_release();
        }
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
    goto LABEL_21;
  }
  __break(1u);
}

void sub_1000246C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DynamicSplitterStatus.Config();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (void *)((char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if (v9)
  {
    if (qword_10003F358 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v11 = (void *)swift_retain();
  uint64_t v12 = sub_100012E94(v11);
  swift_release();
  uint64_t v13 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig;
  swift_beginAccess();
  *(void *)(v13 + *(int *)(v2 + 40)) = v12;
  sub_10002BFD4(v13, (uint64_t)v4, (uint64_t (*)(void))&type metadata accessor for DynamicSplitterStatus.Config);
  id v14 = objc_allocWithZone((Class)type metadata accessor for DynamicSplitterStatus());
  uint64_t v15 = (void *)DynamicSplitterStatus.init(config:)();
  uint64_t v16 = off_10003FF18;
  uint64_t v17 = (void *)*((void *)off_10003FF18 + 2);
  swift_retain();
  [v17 lock];
  id v24 = v15;
  sub_10001573C((uint64_t)v16, v15, v26);
  [v17 unlock];
  uint64_t v18 = v26[0];
  if (!(v26[0] >> 62))
  {
    uint64_t v19 = *(void *)((v26[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v19) {
      goto LABEL_5;
    }
LABEL_21:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100005E2C();

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_21;
  }
LABEL_5:
  if (v19 >= 1)
  {
    v23[0] = v16;
    v23[1] = v1;
    for (uint64_t i = 0; i != v19; ++i)
    {
      if ((v18 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v22 = [*(id *)(Strong + 16) remoteObjectProxy:v23[0]];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100005690(&qword_100040CE0);
        if (swift_dynamicCast())
        {
          [v25 updateStatus:0 :0 :0 :v24];
          swift_release();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_release();
        }
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t sub_100024AC4()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v61 = *(void *)(v1 - 8);
  uint64_t v62 = v1;
  __chkstk_darwin(v1);
  uint64_t v59 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for DispatchQoS();
  uint64_t v58 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  unint64_t v57 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = self;
  id v5 = [v4 defaultCenter];
  if (qword_10003F330 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1000411B8;
  uint64_t v7 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue];
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v68 = sub_100028E38;
  uint64_t v69 = v9;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_100025498;
  unint64_t v67 = &unk_100039718;
  id v10 = _Block_copy(&aBlock);
  id v11 = v8;
  swift_release();
  id v12 = [v5 addObserverForName:v6 object:0 queue:v11 usingBlock:v10];
  _Block_release(v10);
  swift_unknownObjectRelease();

  id v13 = [v4 defaultCenter];
  if (qword_10003F338 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1000411C0;
  uint64_t v15 = *(void **)&v0[v7];
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v68 = sub_100028E70;
  uint64_t v69 = v16;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_100025498;
  unint64_t v67 = &unk_100039740;
  uint64_t v17 = _Block_copy(&aBlock);
  id v18 = v15;
  swift_release();
  id v19 = [v13 addObserverForName:v14 object:0 queue:v18 usingBlock:v17];
  _Block_release(v17);
  swift_unknownObjectRelease();

  id v20 = [v4 defaultCenter];
  if (qword_10003F340 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_1000411C8;
  id v22 = *(void **)&v0[v7];
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v68 = sub_100028EA8;
  uint64_t v69 = v23;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_100025498;
  unint64_t v67 = &unk_100039768;
  id v24 = _Block_copy(&aBlock);
  id v25 = v22;
  swift_release();
  id v26 = [v20 addObserverForName:v21 object:0 queue:v25 usingBlock:v24];
  _Block_release(v24);
  swift_unknownObjectRelease();

  id v27 = [v4 defaultCenter];
  if (qword_10003F348 != -1) {
    swift_once();
  }
  uint64_t v28 = qword_1000411D0;
  uint64_t v29 = *(void **)&v0[v7];
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v68 = sub_100028EE0;
  uint64_t v69 = v30;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_100025498;
  unint64_t v67 = &unk_100039790;
  long long v31 = _Block_copy(&aBlock);
  id v32 = v29;
  swift_release();
  id v33 = [v27 addObserverForName:v28 object:0 queue:v32 usingBlock:v31];
  _Block_release(v31);
  swift_unknownObjectRelease();

  id v34 = [v4 defaultCenter];
  if (qword_10003F350 != -1) {
    swift_once();
  }
  uint64_t v35 = qword_1000411D8;
  uint64_t v36 = *(void **)&v0[v7];
  uint64_t v37 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v68 = sub_100028F18;
  uint64_t v69 = v37;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_100025498;
  unint64_t v67 = &unk_1000397B8;
  id v38 = _Block_copy(&aBlock);
  id v39 = v36;
  swift_release();
  id v40 = [v34 addObserverForName:v35 object:0 queue:v39 usingBlock:v38];
  _Block_release(v38);
  swift_unknownObjectRelease();

  unint64_t v41 = *(void **)&v0[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue];
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v0;
  uint64_t v68 = sub_100028F88;
  uint64_t v69 = v42;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_100005778;
  unint64_t v67 = &unk_100039808;
  uint64_t v43 = _Block_copy(&aBlock);
  id v44 = v41;
  uint64_t v45 = v0;
  uint64_t v46 = v57;
  static DispatchQoS.unspecified.getter();
  unint64_t v63 = &_swiftEmptyArrayStorage;
  sub_100005730(&qword_100040158, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005690((uint64_t *)&unk_100040B80);
  sub_1000056D4();
  uint64_t v47 = v59;
  uint64_t v48 = v62;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v43);

  (*(void (**)(char *, uint64_t))(v61 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v46, v60);
  swift_release();
  char v49 = *(void **)&v45[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_processMonitor];
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v45;
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = sub_100028F90;
  *(void *)(v51 + 24) = v50;
  uint64_t v68 = sub_100028FA8;
  uint64_t v69 = v51;
  aBlocuint64_t k = _NSConcreteStackBlock;
  uint64_t v65 = 1107296256;
  uint64_t v66 = (uint64_t (*)(uint64_t))sub_10001F4CC;
  unint64_t v67 = &unk_100039880;
  uint64_t v52 = _Block_copy(&aBlock);
  uint64_t v53 = v45;
  id v54 = v49;
  swift_retain();
  swift_release();
  [v54 updateConfiguration:v52];

  _Block_release(v52);
  LOBYTE(v52) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v52) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100025498(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_10002558C(uint64_t a1, void (*a2)(void))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    a2();
  }
}

uint64_t sub_1000255E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = (void *)result;
    id v21 = *(id *)(result + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);

    uint64_t v16 = swift_allocObject();
    uint64_t v22 = v10;
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();

    aBlock[4] = a3;
    void aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005778;
    aBlock[3] = a4;
    id v18 = _Block_copy(aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v23 = &_swiftEmptyArrayStorage;
    sub_100005730(&qword_100040158, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005690((uint64_t *)&unk_100040B80);
    sub_1000056D4();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    id v19 = v21;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1000258F8()
{
  uint64_t v0 = type metadata accessor for DispatchPredicate();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (void *)Strong;
    uint64_t v6 = *(void **)(Strong + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
    *uint64_t v3 = v6;
    (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchPredicate.onQueue(_:), v0);
    id v7 = v6;
    LOBYTE(v6) = _dispatchPreconditionTest(_:)();
    (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v0);
    if (v6)
    {
      sub_100005E2C();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100025A44()
{
  if (qword_10003F358 != -1) {
    swift_once();
  }
  uint64_t v0 = swift_retain();
  sub_100011724(v10, v0);
  swift_release();
  uint64_t v1 = (void *)v10[1];
  id v9 = (id)v10[0];
  uint64_t v2 = (void *)v10[2];
  uint64_t v3 = (void *)v10[3];
  uint64_t v4 = v10[5];
  uint64_t v5 = v10[6];
  uint64_t v6 = v11;
  BOOL v7 = v11 != 2;
  sub_10001F954(v10[4] == 1, 0, (unint64_t)&_swiftEmptyArrayStorage, (unint64_t)&_swiftEmptyArrayStorage, 1);
  if (v6 == 3) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = 2 * v7;
  }
  sub_10002151C(v8, (unint64_t)&_swiftEmptyArrayStorage, 1);
  sub_100021EFC(v4 == 1, (unint64_t)&_swiftEmptyArrayStorage, 1);
  sub_1000069B0(v5 == 1, (unint64_t)&_swiftEmptyArrayStorage, 1);
}

void sub_100025B7C(void *a1, uint64_t a2)
{
  sub_100005690(&qword_100040688);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10002EFC0;
  *(void *)(v4 + 32) = [self predicateMatchingProcessTypeApplication];
  specialized Array._endMutation()();
  sub_100007FBC(0, &qword_100040C88);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [a1 setPredicates:isa, v4];

  [a1 setStateDescriptor:*(void *)(a2 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_assertionDescriptor)];
  [a1 setEvents:1];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_100028FD0;
  v8[5] = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000055F0;
  v8[3] = &unk_1000398A8;
  BOOL v7 = _Block_copy(v8);
  swift_release();
  [a1 setUpdateHandler:v7];
  _Block_release(v7);
}

uint64_t sub_100025D38(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = (void *)result;
    id v16 = *(id *)(result + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);

    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = a4;
    v17[3] = a2;
    v17[4] = a3;
    aBlock[4] = sub_100029020;
    void aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005778;
    aBlock[3] = &unk_1000398F8;
    id v18 = _Block_copy(aBlock);
    swift_retain();
    id v19 = a2;
    id v20 = a3;
    static DispatchQoS.unspecified.getter();
    uint64_t v23 = &_swiftEmptyArrayStorage;
    sub_100005730(&qword_100040158, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005690((uint64_t *)&unk_100040B80);
    sub_1000056D4();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
    return swift_release();
  }
  return result;
}

void sub_100026028(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v67 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v67 - v13;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v16 = (char *)Strong;
    id v17 = [a2 identity];
    id v18 = [a3 exitEvent];
    if (v18)
    {

      id v19 = (uint64_t *)&v16[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses];
      swift_beginAccess();
      uint64_t v20 = *v19;
      id v21 = v17;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_10001DF2C(v21, v20);

      swift_bridgeObjectRelease();
      if (v22)
      {
        *(_WORD *)(v22 + 47) = 1;
        uint64_t v23 = self;
        v75[0] = 0;
        id v24 = [v23 createClient:v75];
        if (v24)
        {
          id v25 = v24;
          id v26 = v75[0];
          sub_100007754(0, v22, v25);
          swift_unknownObjectRelease();
        }
        else
        {
          id v34 = v75[0];
          _convertNSErrorToError(_:)();

          swift_willThrow();
          uint64_t v35 = Logger.daemon.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v35, v5);
          swift_errorRetain();
          swift_errorRetain();
          uint64_t v36 = Logger.logObject.getter();
          os_log_type_t v37 = static os_log_type_t.error.getter();
          int v38 = v37;
          if (os_log_type_enabled(v36, v37))
          {
            NSString v71 = v36;
            id v39 = (uint8_t *)swift_slowAlloc();
            uint64_t v40 = swift_slowAlloc();
            LODWORD(v70) = v38;
            unint64_t v41 = (void *)v40;
            uint64_t v72 = v6;
            *(_DWORD *)id v39 = 138543362;
            uint64_t v68 = v39 + 4;
            uint64_t v69 = v39;
            swift_errorRetain();
            uint64_t v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v75[0] = v42;
            uint64_t v6 = v72;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *unint64_t v41 = v42;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v70, "Unable to set game mode for exiting game process %{public}@", v69, 0xCu);
            sub_100005690((uint64_t *)&unk_10003FCA0);
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
          (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        }
        swift_beginAccess();
        swift_retain();
        sub_1000284F8(v22);
        swift_endAccess();
        swift_release();
        swift_release();
      }
      swift_beginAccess();
      uint64_t v43 = (void *)sub_10002AB34(v21);
      swift_endAccess();

      swift_beginAccess();
      id v44 = v21;
      sub_1000285BC((unint64_t)v44);
      swift_endAccess();

      swift_release();
      sub_100005E2C();
    }
    else
    {
      uint64_t v72 = v6;
      id v27 = (uint64_t *)&v16[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses];
      swift_beginAccess();
      uint64_t v28 = *v27;
      swift_bridgeObjectRetain();
      char v29 = sub_1000057BC(v17, v28);
      swift_bridgeObjectRelease();
      if (v29)
      {
      }
      else
      {
        NSString v71 = v27;
        uint64_t v30 = (uint8_t *)&v16[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses];
        swift_beginAccess();
        uint64_t v31 = *(void *)v30;
        id v32 = v17;
        swift_bridgeObjectRetain();
        uint64_t v33 = sub_10001DF2C(v32, v31);

        swift_bridgeObjectRelease();
        if (v33)
        {
          sub_100005960(v33, a3);

          swift_release();
        }
        else
        {
          uint64_t v70 = v30;
          type metadata accessor for EmbeddedGameProcess();
          swift_allocObject();
          uint64_t v45 = sub_10001E1D4(a2);
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = Logger.daemon.unsafeMutableAddressor();
            uint64_t v48 = v72;
            (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v12, v47, v5);
            swift_retain_n();
            char v49 = Logger.logObject.getter();
            os_log_type_t v50 = static os_log_type_t.default.getter();
            int v51 = v50;
            if (os_log_type_enabled(v49, v50))
            {
              LODWORD(v71) = v51;
              uint64_t v52 = (uint8_t *)swift_slowAlloc();
              uint64_t v69 = (uint8_t *)swift_slowAlloc();
              unint64_t v74 = v69;
              uint64_t v68 = v52;
              *(_DWORD *)uint64_t v52 = 136446210;
              unint64_t v67 = v52 + 4;
              swift_retain();
              uint64_t v53 = sub_10001F198();
              unint64_t v55 = v54;
              swift_release();
              uint64_t v73 = sub_100008130(v53, v55, (uint64_t *)&v74);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v71, "Identified game %{public}s", v68, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              (*(void (**)(char *, uint64_t))(v72 + 8))(v12, v5);
            }
            else
            {

              swift_release_n();
              (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v5);
            }
            swift_beginAccess();
            id v63 = v32;
            uint64_t v64 = swift_retain();
            sub_10002870C(v64, v63);
            swift_endAccess();

            sub_100005960(v46, a3);
            swift_release();
          }
          else
          {
            uint64_t v56 = Logger.daemon.unsafeMutableAddressor();
            uint64_t v57 = v72;
            (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v14, v56, v5);
            uint64_t v58 = (uint8_t *)v32;
            uint64_t v59 = Logger.logObject.getter();
            os_log_type_t v60 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v59, v60))
            {
              uint64_t v61 = (uint8_t *)swift_slowAlloc();
              uint64_t v69 = (uint8_t *)swift_slowAlloc();
              uint64_t v70 = v61;
              *(_DWORD *)uint64_t v61 = 138543362;
              unint64_t v74 = v58;
              uint64_t v62 = v58;
              uint64_t v57 = v72;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(void *)uint64_t v69 = v58;

              _os_log_impl((void *)&_mh_execute_header, v59, v60, "Ignoring process %{public}@", v70, 0xCu);
              sub_100005690((uint64_t *)&unk_10003FCA0);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              uint64_t v59 = v58;
            }

            (*(void (**)(char *, uint64_t))(v57 + 8))(v14, v5);
            swift_beginAccess();
            uint64_t v65 = v58;
            sub_1000294E8(&v73, v65);
            uint64_t v66 = (void *)v73;
            swift_endAccess();
          }
        }
      }
    }
  }
}

uint64_t sub_1000269B8(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v6 = v5;
  int v91 = a5;
  int v94 = a3;
  int v95 = a4;
  v90[2] = a2;
  v90[1] = a1;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v96 = (char *)v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v90 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  id v16 = (char *)v90 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  id v19 = (char *)v90 - v18;
  __chkstk_darwin(v17);
  id v21 = (char *)v90 - v20;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v97 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection;
  uint64_t v98 = v8;
  if (*(void *)&v6[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection])
  {
LABEL_2:
    os_log_type_t v92 = v22;
    uint64_t v93 = v23;
    uint64_t v24 = Logger.daemon.unsafeMutableAddressor();
    id v25 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v25(v13, v24, v7);
    id v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 67109376;
      LODWORD(aBlock) = v94 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v28 + 8) = 1024;
      LODWORD(aBlock) = v95 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "showAngelBanner(for: bundleIdentifier, available:%{BOOL}d enabled:%{BOOL}d", (uint8_t *)v28, 0xEu);
      swift_slowDealloc();
    }

    char v29 = *(void (**)(char *, uint64_t))(v98 + 8);
    v98 += 8;
    v29(v13, v7);
    uint64_t v30 = *(void **)&v6[v97];
    if (v30)
    {
      uint64_t v31 = v7;
      sub_100005690(&qword_100040688);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_10002EFC0;
      id v33 = v30;
      NSString v34 = String._bridgeToObjectiveC()();
      NSString v35 = String._bridgeToObjectiveC()();
      id v36 = [self attributeWithDomain:v34 name:v35];

      *(void *)(v32 + 32) = v36;
      *(void *)&v104[0] = v32;
      specialized Array._endMutation()();
      sub_100007FBC(0, (unint64_t *)&unk_100040BA0);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v38 = [v33 remoteTargetWithLaunchingAssertionAttributes:isa];

      if (v38)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v104, 0, 32);
      }
      uint64_t v64 = v96;
      sub_10000544C((uint64_t)v104, (uint64_t)&aBlock);
      uint64_t v7 = v31;
      if (*((void *)&v100 + 1))
      {
        sub_100005690((uint64_t *)&unk_100040BB0);
        if (swift_dynamicCast())
        {
          uint64_t v65 = *(void **)&v104[0];
          NSString v66 = String._bridgeToObjectiveC()();
          sub_100007FBC(0, (unint64_t *)&unk_10003FC90);
          Class v67 = NSNumber.init(BOOLeanLiteral:)(v94 & 1).super.super.isa;
          Class v68 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
          Class v69 = NSNumber.init(BOOLeanLiteral:)(v95 & 1).super.super.isa;
          Class v70 = NSNumber.init(BOOLeanLiteral:)(v91 & 1).super.super.isa;
          [v65 showGameModeBannerWithBundleIdentifier:v66 available:v67 required:v68 enabled:v69 showText:v70];
          swift_unknownObjectRelease();

          return sub_100028D88((uint64_t)v92);
        }
LABEL_22:
        v25(v64, v24, v7);
        NSString v71 = Logger.logObject.getter();
        os_log_type_t v72 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v71, v72))
        {
          uint64_t v73 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, v72, "com.apple.GamePolicyAngel.notification.service Game Mode No Conn", v73, 2u);
          swift_slowDealloc();
        }

        v29(v64, v7);
        return sub_100028D88((uint64_t)v92);
      }
    }
    else
    {
      aBlocuint64_t k = 0u;
      long long v100 = 0u;
      uint64_t v64 = v96;
    }
    sub_10002C0AC((uint64_t)&aBlock, &qword_10003F600);
    goto LABEL_22;
  }
  uint64_t v93 = v7;
  uint64_t v39 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface;
  uint64_t v40 = *(void **)&v6[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface];
  if (!v40)
  {
    NSString v41 = String._bridgeToObjectiveC()();
    id v42 = [self interfaceWithIdentifier:v41];

    uint64_t v43 = self;
    id v44 = [v43 protocolForProtocol:&OBJC_PROTOCOL____TtP11gamepolicyd34GamePolicyAngelNotificationService_];
    [v42 setServer:v44];

    id v45 = [v43 protocolForProtocol:&OBJC_PROTOCOL____TtP11gamepolicyd42GamePolicyAngelNotificationServiceCallback_];
    [v42 setClient:v45];

    [v42 setClientMessagingExpectation:1];
    [v42 copy];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100007FBC(0, &qword_100040C20);
    int v46 = swift_dynamicCast();
    uint64_t v47 = *(void *)&v104[0];
    if (!v46) {
      uint64_t v47 = 0;
    }
    uint64_t v48 = *(void **)&v6[v39];
    *(void *)&v6[v39] = v47;

    uint64_t v8 = v98;
    uint64_t v40 = *(void **)&v6[v39];
    if (!v40)
    {
      uint64_t v80 = Logger.daemon.unsafeMutableAddressor();
      uint64_t v81 = v93;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v16, v80, v93);
      BOOL v82 = Logger.logObject.getter();
      os_log_type_t v83 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v82, v83))
      {
        BOOL v84 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v84 = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "com.apple.GamePolicyAngel.notification.service No interface", v84, 2u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v16, v81);
    }
  }
  os_log_type_t v92 = v40;
  NSString v49 = String._bridgeToObjectiveC()();
  NSString v50 = String._bridgeToObjectiveC()();
  int v51 = [self endpointForMachName:v49 service:v50 instance:0];

  if (!v51)
  {
    uint64_t v74 = Logger.daemon.unsafeMutableAddressor();
    uint64_t v75 = v93;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v19, v74, v93);
    uint64_t v76 = Logger.logObject.getter();
    os_log_type_t v77 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "com.apple.GamePolicyAngel.notification.service No endpoint", v78, 2u);
      uint64_t v8 = v98;
      swift_slowDealloc();
      BOOL v79 = v92;
    }
    else
    {
      BOOL v79 = v76;
      uint64_t v76 = v92;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v19, v75);
  }
  id v52 = [self connectionWithEndpoint:v51];
  uint64_t v53 = v93;
  if (!v52)
  {
LABEL_34:
    uint64_t v85 = Logger.daemon.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v21, v85, v53);
    uint64_t v86 = Logger.logObject.getter();
    os_log_type_t v87 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v88 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v88 = 0;
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "com.apple.GamePolicyAngel.notification.service No connection", v88, 2u);
      uint64_t v8 = v98;
      swift_slowDealloc();
      unint64_t v89 = v51;
    }
    else
    {
      unint64_t v89 = v86;
      uint64_t v86 = v51;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v21, v53);
  }
  unint64_t v54 = v52;
  uint64_t v103 = &OBJC_PROTOCOL___BSServiceConnectionClient;
  uint64_t v55 = swift_dynamicCastObjCProtocolConditional();
  if (!v55)
  {

    goto LABEL_34;
  }
  uint64_t v56 = (void *)v55;
  uint64_t v23 = swift_allocObject();
  uint64_t v57 = v92;
  *(void *)(v23 + 16) = v92;
  *(void *)(v23 + 24) = v6;
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = sub_100028DD8;
  *(void *)(v58 + 24) = v23;
  unint64_t v101 = sub_10002C4E0;
  uint64_t v102 = v58;
  *(void *)&aBlocuint64_t k = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v100 = sub_10001F4CC;
  *((void *)&v100 + 1) = &unk_100039650;
  uint64_t v59 = _Block_copy(&aBlock);
  os_log_type_t v92 = v57;
  id v60 = v54;
  uint64_t v61 = v6;
  swift_retain();
  swift_release();
  [v56 configureConnection:v59];

  _Block_release(v59);
  LOBYTE(v59) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v59 & 1) == 0)
  {
    [v56 activate];
    id v63 = *(void **)&v6[v97];
    *(void *)&v6[v97] = v56;

    uint64_t v22 = sub_100028DD8;
    uint64_t v7 = v93;
    uint64_t v8 = v98;
    goto LABEL_2;
  }
  __break(1u);
  return result;
}

void sub_100027574(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = [self userInitiated];
  [a1 setServiceQuality:v6];

  [a1 setInterface:a2];
  [a1 setInterfaceTarget:a3];
  id v16 = (void (*)())nullsub_1;
  uint64_t v17 = 0;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_1000277D8;
  uint64_t v15 = &unk_100039678;
  uint64_t v7 = _Block_copy(&v12);
  [a1 setActivationHandler:v7];
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v16 = sub_100028E28;
  uint64_t v17 = v8;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_1000277D8;
  uint64_t v15 = &unk_1000396C8;
  uint64_t v9 = _Block_copy(&v12);
  swift_release();
  [a1 setInterruptionHandler:v9];
  _Block_release(v9);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v16 = sub_100028E30;
  uint64_t v17 = v10;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_1000277D8;
  uint64_t v15 = &unk_1000396F0;
  uint64_t v11 = _Block_copy(&v12);
  swift_release();
  [a1 setInvalidationHandler:v11];
  _Block_release(v11);
}

void sub_1000277D8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100027840()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    uint64_t v2 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection;
    uint64_t v3 = *(void **)(Strong + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection);
    if (v3)
    {
      [v3 invalidate];
      id v4 = *(void **)&v1[v2];
    }
    else
    {
      id v4 = 0;
    }
    *(void *)&v1[v2] = 0;
  }
}

void sub_1000278C8()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)&Strong[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection];
    *(void *)&Strong[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection] = 0;
  }
}

uint64_t sub_100027928(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_10002797C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)&v3[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue];
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a1;
  v14[3] = a2;
  uint64_t v14[4] = a3;
  v14[5] = v3;
  aBlock[4] = sub_1000282D4;
  void aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005778;
  aBlock[3] = &unk_1000395D8;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v13;
  swift_bridgeObjectRetain();
  id v17 = a3;
  uint64_t v18 = v3;
  static DispatchQoS.unspecified.getter();
  uint64_t v23 = &_swiftEmptyArrayStorage;
  sub_100005730(&qword_100040158, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005690((uint64_t *)&unk_100040B80);
  sub_1000056D4();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v21);
  return swift_release();
}

uint64_t sub_100027C44(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = Logger.daemon.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_bridgeObjectRetain_n();
  id v13 = a3;
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v31 = a1;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = a4;
    uint64_t v18 = v17;
    unint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v29 = v8;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_100008130(a1, a2, (uint64_t *)&v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 1024;
    unsigned int v19 = [v13 BOOLValue];

    LODWORD(v32) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v14, v15, "setGameModeForBundleIdentifier(%s enabled:%{BOOL}d)", (uint8_t *)v18, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  if (qword_10003F328 != -1) {
    swift_once();
  }
  uint64_t v20 = off_10003F5F8;
  swift_retain();
  char v21 = [v13 BOOLValue];
  unint64_t v22 = GlobalPreferences.gameModeEnabledList.getter();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v33 = v22;
  sub_10000DCB8(v21, v31, a2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = (void *)v20[2];
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v26 = String._bridgeToObjectiveC()();
  [v24 setValue:isa forKey:v26];
  swift_release();

  return sub_100005E2C();
}

uint64_t sub_100028084()
{
  uint64_t result = type metadata accessor for GameModeStatus.Config();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ModelManagerGameAssertionStatus.Config();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for SustainedExecutionStatus.Config();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for DynamicSplitterStatus.Config();
        if (v4 <= 0x3F) {
          return swift_updateClassMetadata2();
        }
      }
    }
  }
  return result;
}

uint64_t sub_100028244(uint64_t a1, uint64_t a2)
{
  return sub_100005730(&qword_100040B68, a2, (void (*)(uint64_t))type metadata accessor for EmbeddedGameProcess);
}

uint64_t sub_10002828C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000282D4()
{
  return sub_100027C44(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1000282E0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000283A8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005690((uint64_t *)&unk_100040B90);
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
  id v13 = a4 + 32;
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

uint64_t sub_1000284F8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100007E28(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 2;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000E45C();
    uint64_t v7 = v10;
  }
  swift_release();
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v7 + 56) + v4);
  sub_1000289F8(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1000285BC(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_10000591C(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v9 = *v2;
      Swift::Int v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_10000E600();
        Swift::Int v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = __CocoaDictionary.lookup(_:)();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = __CocoaDictionary.count.getter();
  Swift::Int v9 = sub_1000287C0(v5, v8);
  swift_retain();
  a1 = sub_10000591C((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_100028BD4(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10002870C(uint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = __CocoaDictionary.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *unint64_t v3 = sub_1000287C0(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  sub_10000DF8C(a1, a2, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000287C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005690(&qword_10003F7F0);
    uint64_t v2 = static _DictionaryStorage.convert(_:capacity:)();
    uint64_t v18 = v2;
    __CocoaDictionary.makeIterator()();
    uint64_t v3 = __CocoaDictionary.Iterator.next()();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100007FBC(0, &qword_100040C90);
      do
      {
        swift_dynamicCast();
        type metadata accessor for EmbeddedGameProcess();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_10000D9E0(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = __CocoaDictionary.Iterator.next()();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

unint64_t sub_1000289F8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    Swift::Int result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(*(void *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        unint64_t v10 = *(void **)(v9 + 16);
        swift_retain();
        id v11 = v10;
        NSObject.hash(into:)();

        Swift::Int v12 = Hasher._finalize()();
        Swift::Int result = swift_release();
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          BOOL v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *BOOL v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          uint64_t v18 = (unsigned char *)(v17 + v3);
          unsigned int v19 = (unsigned char *)(v17 + v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
          {
            *uint64_t v18 = *v19;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_100028BD4(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(a2 + 48);
            uint64_t v17 = (void *)(v16 + 8 * v3);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1) {
              *uint64_t v17 = *v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (void *)(v19 + 8 * v3);
            uint64_t v21 = (void *)(v19 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 1))
            {
              *uint64_t v20 = *v21;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << a1) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
}

uint64_t sub_100028D88(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100028D98()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100028DD8(void *a1)
{
  sub_100027574(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100028DE0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028DF0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100028E28()
{
}

void sub_100028E30()
{
}

uint64_t sub_100028E38(uint64_t a1)
{
  return sub_1000255E8(a1, v1, (uint64_t)sub_10002BFA4, (uint64_t)&unk_1000399C0);
}

uint64_t sub_100028E70(uint64_t a1)
{
  return sub_1000255E8(a1, v1, (uint64_t)sub_10002BF74, (uint64_t)&unk_100039998);
}

uint64_t sub_100028EA8(uint64_t a1)
{
  return sub_1000255E8(a1, v1, (uint64_t)sub_10002BF44, (uint64_t)&unk_100039970);
}

uint64_t sub_100028EE0(uint64_t a1)
{
  return sub_1000255E8(a1, v1, (uint64_t)sub_10002BF14, (uint64_t)&unk_100039948);
}

uint64_t sub_100028F18(uint64_t a1)
{
  return sub_1000255E8(a1, v1, (uint64_t)sub_10002BF0C, (uint64_t)&unk_100039920);
}

uint64_t sub_100028F50()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100028F88()
{
}

void sub_100028F90(void *a1)
{
  sub_100025B7C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100028F98()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028FA8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100028FD0(uint64_t a1, void *a2, void *a3)
{
  return sub_100025D38(a1, a2, a3, v3);
}

uint64_t sub_100028FD8()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100029020()
{
  sub_100026028(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_10002902C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002906C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002904C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000291CC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002906C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005690(&qword_100040CC8);
    Swift::Int v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    Swift::Int v10 = (char *)&_swiftEmptyArrayStorage;
  }
  Swift::Int v13 = v10 + 32;
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

uint64_t sub_1000291CC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005690(&qword_100040718);
    Swift::Int v10 = (char *)swift_allocObject();
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
    Swift::Int v10 = (char *)&_swiftEmptyArrayStorage;
  }
  Swift::Int v13 = v10 + 32;
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

uint64_t sub_100029338(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
    uint64_t v12 = (void *)(v11 + 16 * v10);
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100029F84(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000294E8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100007FBC(0, &qword_100040C90);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100029788(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100029C60();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100029F00((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100007FBC(0, &qword_100040C90);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10002A120((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100029788(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005690(&qword_100040C98);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100007FBC(0, &qword_100040C90);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100029C60();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100029980()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005690(&qword_100040CD8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                  *uint64_t v30 = -1 << v29;
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
      char v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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

uint64_t sub_100029C60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005690(&qword_100040C98);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
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
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
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
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
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

unint64_t sub_100029F00(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

Swift::Int sub_100029F84(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100029980();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_10002A2A8();
      goto LABEL_22;
    }
    sub_10002A608();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  unint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

void sub_10002A120(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100029C60();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10002A45C();
      goto LABEL_14;
    }
    sub_10002A8B8();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100007FBC(0, &qword_100040C90);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_10002A2A8()
{
  uint64_t v1 = v0;
  sub_100005690(&qword_100040CD8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_10002A45C()
{
  uint64_t v1 = v0;
  sub_100005690(&qword_100040C98);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002A608()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005690(&qword_100040CD8);
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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

uint64_t sub_10002A8B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005690(&qword_100040C98);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
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
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
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
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
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

uint64_t sub_10002AB34(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = __CocoaSet.contains(_:)();

    if (v6)
    {
      uint64_t v7 = sub_10002AD0C();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = NSObject._rawHashValue(seed:)(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  sub_100007FBC(0, &qword_100040C90);
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = static NSObject.== infix(_:_:)();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = static NSObject.== infix(_:_:)();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002A45C();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_10002AEA8(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10002AD0C()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = __CocoaSet.count.getter();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_100029788(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = NSObject._rawHashValue(seed:)(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_100007FBC(0, &qword_100040C90);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = static NSObject.== infix(_:_:)();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_10002AEA8(v8);
      if (static NSObject.== infix(_:_:)())
      {
        Swift::Int *v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = static NSObject.== infix(_:_:)();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_10002AEA8(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

id sub_10002B04C(uint64_t a1)
{
  uint64_t v67 = a1;
  type metadata accessor for DynamicSplitterStatus.Config();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v73 = (char *)v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SustainedExecutionStatus.Config();
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v72 = (char *)v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ModelManagerGameAssertionStatus.Config();
  ((void (*)(void))__chkstk_darwin)();
  Class v69 = (char *)v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005690(&qword_100040128);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  NSString v71 = (char *)v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  Class v70 = (char *)v63 - v7;
  uint64_t v8 = type metadata accessor for GameModeStatus.Config();
  __chkstk_darwin(v8 - 8);
  Class v68 = (char *)v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for String.Encoding();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  Swift::Int v13 = (char *)v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses] = &_swiftEmptySetSingleton;
  uint64_t v14 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses;
  id v15 = v1;
  *(void *)&v1[v14] = sub_10000C018((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v16 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState;
  type metadata accessor for GameModeState();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_10000BF18((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&v15[v16] = v17;
  *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction] = 0;
  uint64_t v18 = &v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification];
  NSString v66 = &v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification];
  *(void *)uint64_t v18 = 0xD000000000000031;
  *((void *)v18 + 1) = 0x8000000100032900;
  uint64_t v19 = &v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification];
  *(void *)uint64_t v19 = 0xD000000000000025;
  *((void *)v19 + 1) = 0x8000000100032940;
  BOOL v20 = (void ***)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification];
  *BOOL v20 = (void **)0xD00000000000002FLL;
  v20[1] = (void **)0x8000000100032970;
  uint64_t v21 = (void ***)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification];
  *uint64_t v21 = (void **)0xD000000000000039;
  v21[1] = (void **)0x80000001000329A0;
  unint64_t v22 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken] = 0;
  unint64_t v23 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken] = 0;
  uint64_t v64 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken] = 0;
  uint64_t v65 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken] = 0;
  *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection] = 0;
  *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface] = 0;
  aBlocuint64_t k = (void **)0xD000000000000025;
  unint64_t v76 = 0x8000000100032940;
  static String.Encoding.utf8.getter();
  v63[2] = sub_100016A64();
  uint64_t v24 = StringProtocol.cString(using:)();
  unint64_t v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v63[1] = v11 + 8;
  v25(v13, v10);
  swift_bridgeObjectRelease();
  if (v24) {
    BOOL v26 = (const char *)(v24 + 32);
  }
  else {
    BOOL v26 = 0;
  }
  swift_beginAccess();
  notify_register_check(v26, v22);
  swift_endAccess();
  swift_bridgeObjectRelease();
  unint64_t v27 = (unint64_t)v20[1];
  aBlocuint64_t k = *v20;
  unint64_t v76 = v27;
  swift_bridgeObjectRetain();
  static String.Encoding.utf8.getter();
  uint64_t v28 = StringProtocol.cString(using:)();
  uint64_t v29 = v10;
  v25(v13, v10);
  swift_bridgeObjectRelease();
  if (v28) {
    uint64_t v30 = (const char *)(v28 + 32);
  }
  else {
    uint64_t v30 = 0;
  }
  swift_beginAccess();
  notify_register_check(v30, v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  unint64_t v31 = (unint64_t)v21[1];
  aBlocuint64_t k = *v21;
  unint64_t v76 = v31;
  swift_bridgeObjectRetain();
  static String.Encoding.utf8.getter();
  uint64_t v32 = StringProtocol.cString(using:)();
  v25(v13, v10);
  swift_bridgeObjectRelease();
  if (v32) {
    unint64_t v33 = (const char *)(v32 + 32);
  }
  else {
    unint64_t v33 = 0;
  }
  NSString v34 = v64;
  swift_beginAccess();
  notify_register_check(v33, v34);
  swift_endAccess();
  swift_bridgeObjectRelease();
  unint64_t v35 = *((void *)v66 + 1);
  aBlocuint64_t k = *(void ***)v66;
  unint64_t v76 = v35;
  swift_bridgeObjectRetain();
  static String.Encoding.utf8.getter();
  uint64_t v36 = StringProtocol.cString(using:)();
  v25(v13, v29);
  swift_bridgeObjectRelease();
  if (v36) {
    os_log_type_t v37 = (const char *)(v36 + 32);
  }
  else {
    os_log_type_t v37 = 0;
  }
  id v38 = v65;
  swift_beginAccess();
  notify_register_check(v37, v38);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v39 = (void *)v67;
  *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue] = v67;
  id v40 = objc_allocWithZone((Class)NSOperationQueue);
  id v41 = v39;
  id v42 = [v40 init];
  *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue] = v42;
  uint64_t v43 = &off_10003F000;
  if ((sub_100008F78() & 1) == 0)
  {
    if (qword_10003F328 != -1) {
      goto LABEL_35;
    }
    goto LABEL_16;
  }
  unsigned __int8 v44 = 1;
  while (1)
  {
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsGameMode] = v44 & 1;
    if (sub_1000094D0())
    {
      unsigned __int8 v45 = 1;
    }
    else
    {
      if (v43[101] != (_UNKNOWN *)-1) {
        swift_once();
      }
      swift_retain();
      unsigned __int8 v45 = GlobalPreferences.ignoreDeviceRestrictions.getter();
      swift_release();
    }
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsModelManagerGameAssertion] = v45 & 1;
    if (sub_100009ACC())
    {
      unsigned __int8 v46 = 1;
    }
    else
    {
      if (v43[101] != (_UNKNOWN *)-1) {
        swift_once();
      }
      swift_retain();
      unsigned __int8 v46 = GlobalPreferences.ignoreDeviceRestrictions.getter();
      swift_release();
    }
    uint64_t v67 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter;
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter] = v46 & 1;
    if (sub_10000A048())
    {
      unsigned __int8 v47 = 1;
    }
    else
    {
      if (v43[101] != (_UNKNOWN *)-1) {
        swift_once();
      }
      swift_retain();
      unsigned __int8 v47 = GlobalPreferences.ignoreDeviceRestrictions.getter();
      swift_release();
    }
    uint64_t v43 = (_UNKNOWN **)OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsSustainedExecutionMode;
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsSustainedExecutionMode] = v47 & 1;
    uint64_t v48 = type metadata accessor for Date();
    NSString v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56);
    NSString v50 = v70;
    v49(v70, 1, 1, v48);
    int v51 = v71;
    v49(v71, 1, 1, v48);
    uint64_t v52 = (uint64_t)v68;
    GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
    sub_10002C1D0(v52, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig], (uint64_t (*)(void))&type metadata accessor for GameModeStatus.Config);
    v49(v50, 1, 1, v48);
    v49(v51, 1, 1, v48);
    uint64_t v53 = (uint64_t)v69;
    ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)();
    sub_10002C1D0(v53, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig], (uint64_t (*)(void))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
    v49(v50, 1, 1, v48);
    v49(v51, 1, 1, v48);
    uint64_t v54 = (uint64_t)v72;
    SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
    sub_10002C1D0(v54, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig], (uint64_t (*)(void))&type metadata accessor for SustainedExecutionStatus.Config);
    v49(v50, 1, 1, v48);
    v49(v51, 1, 1, v48);
    uint64_t v55 = (uint64_t)v73;
    DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
    sub_10002C1D0(v55, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig], (uint64_t (*)(void))&type metadata accessor for DynamicSplitterStatus.Config);
    id v56 = [objc_allocWithZone((Class)RBSProcessStateDescriptor) init];
    [v56 setValues:17];
    *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_assertionDescriptor] = v56;
    BOOL v79 = nullsub_1;
    uint64_t v80 = 0;
    aBlocuint64_t k = _NSConcreteStackBlock;
    unint64_t v76 = 1107296256;
    os_log_type_t v77 = sub_10001F4CC;
    uint64_t v78 = &unk_1000399E8;
    uint64_t v57 = _Block_copy(&aBlock);
    uint64_t v58 = self;
    id v59 = v56;
    id v60 = [v58 monitorWithConfiguration:v57];
    _Block_release(v57);
    swift_release();
    LOBYTE(v57) = swift_isEscapingClosureAtFileLocation();

    if ((v57 & 1) == 0) {
      break;
    }
    __break(1u);
LABEL_35:
    swift_once();
LABEL_16:
    swift_retain();
    unsigned __int8 v44 = GlobalPreferences.ignoreDeviceRestrictions.getter();
    swift_release();
  }
  *(void *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_processMonitor] = v60;

  uint64_t v61 = (objc_class *)type metadata accessor for EmbeddedGameProcessMonitor();
  v74.receiver = v15;
  v74.super_class = v61;
  return [super init];
}

Swift::Int sub_10002BBF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100005690(&qword_100040CD8);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_10002BD9C()
{
  unint64_t result = qword_100040CB0;
  if (!qword_100040CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040CB0);
  }
  return result;
}

uint64_t sub_10002BDF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100005690(&qword_100040CD0);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = ~(-1 << *(unsigned char *)(v3 + 32));
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 32 + 8 * v4);
      uint64_t result = static Hasher._hash(seed:_:)();
      unint64_t v9 = result & v6;
      unint64_t v10 = (result & (unint64_t)v6) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v6);
      uint64_t v13 = *(void *)(v3 + 48);
      if ((v12 & v11) != 0)
      {
        while (*(void *)(v13 + 8 * v9) != v7)
        {
          unint64_t v9 = (v9 + 1) & v6;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        *(void *)(v5 + 8 * v10) = v12 | v11;
        *(void *)(v13 + 8 * v9) = v7;
        uint64_t v14 = *(void *)(v3 + 16);
        BOOL v15 = __OFADD__(v14, 1);
        uint64_t v16 = v14 + 1;
        if (v15)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v16;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (uint64_t)&_swiftEmptySetSingleton;
}

void sub_10002BF0C()
{
}

void sub_10002BF14()
{
  sub_10002558C(v0, sub_1000246C0);
}

void sub_10002BF44()
{
  sub_10002558C(v0, sub_1000242BC);
}

void sub_10002BF74()
{
  sub_10002558C(v0, sub_100024070);
}

void sub_10002BFA4()
{
  sub_10002558C(v0, sub_100023C6C);
}

uint64_t sub_10002BFD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002C03C()
{
  return swift_release();
}

uint64_t sub_10002C044(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005690(&qword_100040128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C0AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005690(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002C108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005690(&qword_100040128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C170(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002C1D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for GamePolicyFF(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GamePolicyFF(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GamePolicyFF(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002C3A0);
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

uint64_t sub_10002C3C8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10002C3D0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyFF()
{
  return &type metadata for GamePolicyFF;
}

unint64_t sub_10002C3F0()
{
  unint64_t result = qword_100040D10;
  if (!qword_100040D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040D10);
  }
  return result;
}

BOOL static GamePolicyMobileAssetRetriever.RetrievalError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void GamePolicyMobileAssetRetriever.RetrievalError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

BOOL sub_10002C520(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int _s11gamepolicyd30GamePolicyMobileAssetRetrieverC6StatusC5StateO9hashValueSivg_0(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t GamePolicyMobileAssetRetriever.Status.description.getter()
{
  _StringGuts.grow(_:)(66);
  v0._object = (void *)0x8000000100032A90;
  v0._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._uint64_t countAndFlagsBits = 0x3D726F72726520;
  v1._object = (void *)0xE700000000000000;
  String.append(_:)(v1);
  swift_errorRetain();
  sub_100005690(&qword_100040D20);
  v2._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 0x3D746C7573657220;
  v3._object = (void *)0xE800000000000000;
  String.append(_:)(v3);
  swift_retain();
  sub_100005690(&qword_100040D28);
  v4._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t GamePolicyMobileAssetRetriever.Status.deinit()
{
  swift_errorRelease();
  swift_release();
  return v0;
}

uint64_t GamePolicyMobileAssetRetriever.Status.__deallocating_deinit()
{
  swift_errorRelease();
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_10002C740()
{
  return GamePolicyMobileAssetRetriever.Status.description.getter();
}

uint64_t GamePolicyMobileAssetRetriever.forceCatalogRefresh.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t GamePolicyMobileAssetRetriever.assetType.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GamePolicyMobileAssetRetriever.status.getter()
{
  return swift_retain();
}

id GamePolicyMobileAssetRetriever.registerCompletionHandler(completion:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v3 = v2;
  [*(id *)(v2 + 56) lock];
  if (*(unsigned char *)(*(void *)(v2 + 40) + 16))
  {
    uint64_t v6 = swift_retain();
    a1(v6);
    swift_release();
  }
  else
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    int v8 = (char **)(v3 + 48);
    swift_beginAccess();
    unint64_t v9 = *(char **)(v3 + 48);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v3 + 48) = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v9 = sub_10002CAF8(0, *((void *)v9 + 2) + 1, 1, v9);
      *int v8 = v9;
    }
    unint64_t v12 = *((void *)v9 + 2);
    unint64_t v11 = *((void *)v9 + 3);
    if (v12 >= v11 >> 1)
    {
      unint64_t v9 = sub_10002CAF8((char *)(v11 > 1), v12 + 1, 1, v9);
      *int v8 = v9;
    }
    *((void *)v9 + 2) = v12 + 1;
    uint64_t v13 = &v9[16 * v12];
    *((void *)v13 + 4) = sub_10002C934;
    *((void *)v13 + 5) = v7;
    swift_endAccess();
  }
  return [*(id *)(v3 + 56) unlock];
}

uint64_t sub_10002C8FC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C934(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t GamePolicyMobileAssetRetriever.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t GamePolicyMobileAssetRetriever.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 64, 7);
}

char *sub_10002C9E8(char *result, int64_t a2, char a3, char *a4)
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
      sub_100005690(&qword_100040718);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10002D040(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10002CAF8(char *result, int64_t a2, char a3, char *a4)
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
      sub_100005690(&qword_100040F80);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10002D134(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_10002CC0C()
{
  unint64_t result = qword_100040D30;
  if (!qword_100040D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040D30);
  }
  return result;
}

unint64_t sub_10002CC64()
{
  unint64_t result = qword_100040D38;
  if (!qword_100040D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040D38);
  }
  return result;
}

uint64_t type metadata accessor for GamePolicyMobileAssetRetriever()
{
  return self;
}

uint64_t getEnumTagSinglePayload for GamePolicyMobileAssetRetriever.RetrievalError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GamePolicyMobileAssetRetriever.RetrievalError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002CE38);
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

unsigned char *sub_10002CE60(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyMobileAssetRetriever.RetrievalError()
{
  return &type metadata for GamePolicyMobileAssetRetriever.RetrievalError;
}

uint64_t type metadata accessor for GamePolicyMobileAssetRetriever.Status()
{
  return self;
}

uint64_t getEnumTagSinglePayload for GamePolicyMobileAssetRetriever.Status.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GamePolicyMobileAssetRetriever.Status.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002CFF8);
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

ValueMetadata *type metadata accessor for GamePolicyMobileAssetRetriever.Status.State()
{
  return &type metadata for GamePolicyMobileAssetRetriever.Status.State;
}

ValueMetadata *type metadata accessor for GamePolicyMobileAssetRetriever.Status.Result()
{
  return &type metadata for GamePolicyMobileAssetRetriever.Status.Result;
}

uint64_t sub_10002D040(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10002D134(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100005690(&qword_100040F88);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002D258()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();

  return _swift_deallocClassInstance(v0, 65, 7);
}

uint64_t type metadata accessor for AssetDatabase()
{
  return self;
}

uint64_t sub_10002D2DC()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t _s11PersonalityCMa()
{
  return self;
}

uint64_t sub_10002D338()
{
  _s11PersonalityCMa();
  sub_100005690(&qword_100041178);
  v0._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._uint64_t countAndFlagsBits = 62;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  return 60;
}

NSNotification __swiftcall Notification._bridgeToObjectiveC()()
{
  return (NSNotification)Notification._bridgeToObjectiveC()();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.init(name:object:userInfo:)()
{
  return Notification.init(name:object:userInfo:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)()
{
  return ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)();
}

uint64_t type metadata accessor for ModelManagerGameAssertionStatus.Config()
{
  return type metadata accessor for ModelManagerGameAssertionStatus.Config();
}

uint64_t ModelManagerGameAssertionStatus.init(config:)()
{
  return ModelManagerGameAssertionStatus.init(config:)();
}

uint64_t type metadata accessor for ModelManagerGameAssertionStatus()
{
  return type metadata accessor for ModelManagerGameAssertionStatus();
}

uint64_t kGamePolicyToolEntitlement.unsafeMutableAddressor()
{
  return kGamePolicyToolEntitlement.unsafeMutableAddressor();
}

uint64_t kGamePolicyPrivilegedToolEntitlement.unsafeMutableAddressor()
{
  return kGamePolicyPrivilegedToolEntitlement.unsafeMutableAddressor();
}

uint64_t GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)()
{
  return GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
}

uint64_t type metadata accessor for GameModeStatus.Config()
{
  return type metadata accessor for GameModeStatus.Config();
}

uint64_t GameModeStatus.init(config:)()
{
  return GameModeStatus.init(config:)();
}

uint64_t type metadata accessor for GameModeStatus()
{
  return type metadata accessor for GameModeStatus();
}

uint64_t GameModeCCUIStatusInfo.init(state:bundles:)()
{
  return GameModeCCUIStatusInfo.init(state:bundles:)();
}

uint64_t type metadata accessor for GameModeCCUIStatusInfo()
{
  return type metadata accessor for GameModeCCUIStatusInfo();
}

uint64_t GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)()
{
  return GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)();
}

uint64_t type metadata accessor for GameModeCCUIStatusBundleInfo()
{
  return type metadata accessor for GameModeCCUIStatusBundleInfo();
}

NSXPCInterface __swiftcall GamePolicyPrivilegedToolClientInterface()()
{
  return (NSXPCInterface)GamePolicyPrivilegedToolClientInterface()();
}

NSXPCInterface __swiftcall GamePolicyPrivilegedToolServerInterface()()
{
  return (NSXPCInterface)GamePolicyPrivilegedToolServerInterface()();
}

uint64_t DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)()
{
  return DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
}

uint64_t type metadata accessor for DynamicSplitterStatus.Config()
{
  return type metadata accessor for DynamicSplitterStatus.Config();
}

uint64_t DynamicSplitterStatus.init(config:)()
{
  return DynamicSplitterStatus.init(config:)();
}

uint64_t type metadata accessor for DynamicSplitterStatus()
{
  return type metadata accessor for DynamicSplitterStatus();
}

uint64_t SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)()
{
  return SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)();
}

uint64_t type metadata accessor for SustainedExecutionStatus.Config()
{
  return type metadata accessor for SustainedExecutionStatus.Config();
}

uint64_t SustainedExecutionStatus.init(config:)()
{
  return SustainedExecutionStatus.init(config:)();
}

uint64_t type metadata accessor for SustainedExecutionStatus()
{
  return type metadata accessor for SustainedExecutionStatus();
}

uint64_t Version.description.getter()
{
  return Version.description.getter();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t Assertion.policy.getter()
{
  return Assertion.policy.getter();
}

uint64_t type metadata accessor for Assertion()
{
  return type metadata accessor for Assertion();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignpostID.init(_:)()
{
  return OSSignpostID.init(_:)();
}

uint64_t Logger.stateTracking.unsafeMutableAddressor()
{
  return Logger.stateTracking.unsafeMutableAddressor();
}

uint64_t Logger.toolCoordinator.unsafeMutableAddressor()
{
  return Logger.toolCoordinator.unsafeMutableAddressor();
}

uint64_t Logger.policyCoordinator.unsafeMutableAddressor()
{
  return Logger.policyCoordinator.unsafeMutableAddressor();
}

uint64_t Logger.daemon.unsafeMutableAddressor()
{
  return Logger.daemon.unsafeMutableAddressor();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
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

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
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

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.cString(using:)()
{
  return StringProtocol.cString(using:)();
}

uint64_t StringProtocol.compare<A>(_:options:range:locale:)()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

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

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_main(void)
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_predicateMatching_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatching:];
}