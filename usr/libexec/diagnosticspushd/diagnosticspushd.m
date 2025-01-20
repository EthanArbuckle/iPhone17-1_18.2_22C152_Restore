uint64_t start()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint8_t v5[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Hello World!", v5, 2u);
  }
  v1 = +[DPDBackgroundTaskManager sharedInstance];
  v2 = +[DPDPushManager sharedInstance];
  v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 0;
}

id sub_1000056CC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PushManager()) init];
  qword_100021150 = (uint64_t)result;
  return result;
}

void sub_100005758()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v42 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = &v0[OBJC_IVAR___DPDPushManager_pushTopic];
  *(void *)v5 = 0xD000000000000019;
  *((void *)v5 + 1) = 0x8000000100019590;
  uint64_t v6 = qword_100020A80;
  v7 = v0;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_100007FB4(v2, (uint64_t)qword_100021170);
  v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Registering for pushes...", v10, 2u);
    swift_slowDealloc();
  }

  if (qword_100020A70 != -1) {
    swift_once();
  }
  v11 = *(void **)(qword_100021160 + 16);
  uint64_t v43 = v2;
  if (v11
    && (NSString v12 = String._bridgeToObjectiveC()(),
        id v13 = [v11 stringForKey:v12],
        v12,
        v13))
  {
    v14 = (objc_class *)ObjectType;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v14 = (objc_class *)ObjectType;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_100008A18();
  swift_bridgeObjectRetain();
  v15 = (void *)static OS_dispatch_queue.main.getter();
  id v16 = objc_allocWithZone((Class)APSConnection);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v19 = [v16 initWithEnvironmentName:v17 namedDelegatePort:v18 queue:v15];

  if (v19)
  {
    *(void *)&v7[OBJC_IVAR___DPDPushManager_connection] = v19;

    v46.receiver = v7;
    v46.super_class = v14;
    v20 = (char *)[super init];
    uint64_t v21 = OBJC_IVAR___DPDPushManager_connection;
    v22 = *(void **)&v20[OBJC_IVAR___DPDPushManager_connection];
    v23 = v20;
    [v22 setDelegate:v23];
    sub_100007FEC(&qword_100020BA0);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100017ED0;
    uint64_t v25 = *(void *)&v23[OBJC_IVAR___DPDPushManager_pushTopic + 8];
    *(void *)(v24 + 32) = *(void *)&v23[OBJC_IVAR___DPDPushManager_pushTopic];
    *(void *)(v24 + 40) = v25;
    id v26 = v22;
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v26 _setEnabledTopics:isa];

    uint64_t v28 = v3;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v30 = v42;
    uint64_t v31 = v43;
    v29(v42, v41, v43);
    v14 = v23;
    v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v32, v33))
    {

      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
      return;
    }
    uint64_t v41 = v28;
    v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)v34 = 136315138;
    id v35 = [*(id *)&v20[v21] enabledTopics];
    if (v35)
    {
      v36 = v35;
      static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v37 = Array.description.getter();
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v44 = sub_10000F0D0(v37, v39, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Registered for push topics: %s", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v43);
      return;
    }
  }
  else
  {
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_100005E00@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3 = *a1;
  sub_100007FEC(&qword_100020B90);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100017ED0;
  *(void *)(v4 + 56) = &type metadata for UInt8;
  *(void *)(v4 + 64) = &protocol witness table for UInt8;
  *(unsigned char *)(v4 + 32) = v3;
  uint64_t result = String.init(format:_:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

void *sub_100005E8C(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2 >> 62;
  uint64_t v4 = &_swiftEmptyArrayStorage;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_45;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v5) {
        return v4;
      }
      unint64_t v38 = &_swiftEmptyArrayStorage;
      int64_t v8 = v5 & ~(v5 >> 63);
      sub_100009D34(0, v8, 0);
      uint64_t v9 = a1;
      uint64_t v4 = &_swiftEmptyArrayStorage;
      if (!v3)
      {
        if ((v5 & 0x8000000000000000) == 0)
        {
          uint64_t v10 = 0;
          goto LABEL_14;
        }
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
      }
      if (v3 == 1) {
        uint64_t v10 = (int)a1;
      }
      else {
        uint64_t v10 = *(void *)(a1 + 16);
      }
      if (v5 < 0) {
        goto LABEL_44;
      }
      while (1)
      {
LABEL_14:
        if (!v8)
        {
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
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
          goto LABEL_47;
        }
        int64_t v30 = v8;
        if (v3)
        {
          if (v3 == 1)
          {
            if (v10 < (int)a1 || v10 >= a1 >> 32) {
              goto LABEL_38;
            }
            v11 = v4;
            uint64_t v12 = v2;
            uint64_t v13 = __DataStorage._bytes.getter();
            if (!v13) {
              goto LABEL_48;
            }
            uint64_t v14 = v13;
            uint64_t v15 = __DataStorage._offset.getter();
            uint64_t v16 = v10 - v15;
            if (__OFSUB__(v10, v15)) {
              goto LABEL_41;
            }
          }
          else
          {
            if (v10 < *(void *)(v9 + 16)) {
              goto LABEL_40;
            }
            if (v10 >= *(void *)(v9 + 24)) {
              goto LABEL_42;
            }
            v11 = v4;
            uint64_t v12 = v2;
            uint64_t v18 = __DataStorage._bytes.getter();
            if (!v18) {
              goto LABEL_49;
            }
            uint64_t v14 = v18;
            uint64_t v19 = __DataStorage._offset.getter();
            uint64_t v16 = v10 - v19;
            if (__OFSUB__(v10, v19)) {
              goto LABEL_43;
            }
          }
          char v17 = *(unsigned char *)(v14 + v16);
          uint64_t v2 = v12;
          uint64_t v9 = a1;
        }
        else
        {
          if (v10 >= BYTE6(a2)) {
            goto LABEL_39;
          }
          v11 = v4;
          char v31 = v9;
          int v32 = *(_DWORD *)((char *)&a1 + 1);
          __int16 v33 = *(_WORD *)((char *)&a1 + 5);
          char v34 = HIBYTE(a1);
          int v35 = a2;
          __int16 v36 = WORD2(a2);
          char v17 = *(&v31 + v10);
        }
        char v31 = v17;
        sub_100005E00(&v31, v37);
        if (v2) {
          break;
        }
        uint64_t v20 = v9;
        unint64_t v21 = v3;
        uint64_t v23 = v37[0];
        uint64_t v22 = v37[1];
        uint64_t v4 = v11;
        unint64_t v38 = v11;
        unint64_t v25 = v11[2];
        unint64_t v24 = v11[3];
        if (v25 >= v24 >> 1)
        {
          sub_100009D34(v24 > 1, v25 + 1, 1);
          uint64_t v20 = a1;
          uint64_t v4 = v38;
        }
        v4[2] = v25 + 1;
        id v26 = (char *)&v4[2 * v25];
        *((void *)v26 + 4) = v23;
        *((void *)v26 + 5) = v22;
        ++v10;
        int64_t v8 = v30 - 1;
        --v5;
        unint64_t v3 = v21;
        uint64_t v9 = v20;
        if (!v5) {
          return v4;
        }
      }
      swift_release();
      return v4;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_46;
    case 3uLL:
      return v4;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_10000634C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009790();
  sub_100008434((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  type metadata accessor for CallbackManager();
  swift_initStaticObject();
  long long v8 = *(_OWORD *)(a3 + 88);
  v10[0] = *(_OWORD *)(a3 + 72);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a3 + 104);
  uint64_t v11 = *(void *)(a3 + 120);
  return sub_10000F9CC(0, 0, 0, (uint64_t *)v10);
}

uint64_t sub_100006470(uint64_t a1)
{
  type metadata accessor for CallbackManager();
  swift_initStaticObject();
  long long v2 = *(_OWORD *)(a1 + 88);
  v4[0] = *(_OWORD *)(a1 + 72);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 120);
  return sub_10000F9CC(1, 0, 0, (uint64_t *)v4);
}

id sub_1000064E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for PushManager()
{
  return self;
}

uint64_t sub_10000658C()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000065D8()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_100006630()
{
  return Hasher._finalize()();
}

uint64_t sub_100006698()
{
  return static _CFObject.== infix(_:_:)() & 1;
}

void sub_1000066FC(void *a1)
{
  if (qword_100020A80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007FB4(v2, (uint64_t)qword_100021170);
  id v8 = a1;
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412802;
    if (a1) {
      id v7 = v8;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = a1;

    *(_WORD *)(v5 + 12) = 2080;
    sub_10000F0D0(0xD000000000000027, 0x8000000100019560, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 22) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ %s connected: %{BOOL}d", (uint8_t *)v5, 0x1Cu);
    sub_100007FEC(&qword_100020B58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_1000069D8(void *a1)
{
  if (qword_100020A80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007FB4(v2, (uint64_t)qword_100021170);
  id v8 = a1;
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412546;
    if (a1) {
      id v7 = v8;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = a1;

    *(_WORD *)(v5 + 12) = 2080;
    sub_10000F0D0(0xD00000000000001ALL, 0x8000000100019540, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ %s", (uint8_t *)v5, 0x16u);
    sub_100007FEC(&qword_100020B58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_100006C8C(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15)
  {
    sub_10000891C(a2, a3);
    uint64_t v16 = (uint64_t)sub_100005E8C(a2, a3);
    sub_100007FEC(&qword_100020B80);
    sub_100008974();
    uint64_t v6 = BidirectionalCollection<>.joined(separator:)();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    if (qword_100020A80 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100007FB4(v9, (uint64_t)qword_100021170);
    id v10 = a1;
    swift_bridgeObjectRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412802;
      if (a1) {
        id v14 = v10;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v15 = a1;

      *(_WORD *)(v13 + 12) = 2080;
      sub_10000F0D0(0xD000000000000024, 0x8000000100019510, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v13 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_10000F0D0(v6, v8, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ %s token: %s", (uint8_t *)v13, 0x20u);
      sub_100007FEC(&qword_100020B58);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    sub_100008908(a2, a3);
  }
}

void sub_100006FD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  v110 = (char *)&v99 - v8;
  __chkstk_darwin(v7);
  id v10 = (char *)&v99 - v9;
  if (qword_100020A80 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)sub_100007FB4(v2, (uint64_t)qword_100021170);
  os_log_type_t v12 = *(char **)(v3 + 16);
  id v104 = v11;
  ((void (*)(char *))v12)(v10);
  uint64_t v13 = (char *)(id)a1;
  id v14 = Logger.logObject.getter();
  LODWORD(v103) = static os_log_type_t.default.getter();
  BOOL v15 = os_log_type_enabled(v14, (os_log_type_t)v103);
  uint64_t v108 = v3;
  uint64_t v109 = v2;
  v105 = v6;
  v106 = (void *)(v3 + 16);
  v107 = (void (*)(char *, id, uint64_t))v12;
  if (!v15)
  {

    os_log_type_t v12 = *(char **)(v3 + 8);
    ((void (*)(char *, uint64_t))v12)(v10, v2);
    uint64_t v28 = v111;
    if (a1) {
      goto LABEL_9;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  os_log_t v102 = v14;
  uint64_t v16 = swift_slowAlloc();
  char v17 = swift_slowAlloc();
  *(void *)&long long v125 = v17;
  *(_DWORD *)uint64_t v16 = 136446466;
  if (!a1)
  {
    __break(1u);
    goto LABEL_39;
  }
  os_log_t v101 = v17;
  id v18 = [v13 topic];
  if (!v18)
  {
LABEL_39:

    __break(1u);
    goto LABEL_40;
  }
  a1 = (uint64_t)v18;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  *(void *)&long long v112 = sub_10000F0D0(v19, v21, (uint64_t *)&v125);
  v100 = (char *)&v112 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *(_WORD *)(v16 + 12) = 2082;
  id v22 = [v13 userInfo];
  if (!v22)
  {
LABEL_40:

    __break(1u);
    goto LABEL_41;
  }
  uint64_t v23 = v22;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v24 = Dictionary.description.getter();
  unint64_t v26 = v25;
  swift_bridgeObjectRelease();
  *(void *)&long long v112 = sub_10000F0D0(v24, v26, (uint64_t *)&v125);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  os_log_t v27 = v102;
  _os_log_impl((void *)&_mh_execute_header, v102, (os_log_type_t)v103, "Received push with topic: %{public}s userInfo: %{public}s", (uint8_t *)v16, 0x16u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  uint64_t v2 = v109;
  os_log_type_t v12 = *(char **)(v108 + 8);
  ((void (*)(char *, uint64_t))v12)(v10, v109);
  uint64_t v28 = v111;
LABEL_9:
  id v29 = [v13 topic];
  if (!v29) {
    goto LABEL_17;
  }
  int64_t v30 = v29;
  a1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v31;

  if (a1 == *(void *)&v28[OBJC_IVAR___DPDPushManager_pushTopic]
    && v32 == *(void *)&v28[OBJC_IVAR___DPDPushManager_pushTopic + 8])
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  a1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
LABEL_17:
    v107(v110, v104, v2);
    a1 = v13;
    v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v42, v43))
    {

      ((void (*)(char *, uint64_t))v12)(v110, v2);
      return;
    }
    v111 = v12;
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v125 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 136446210;
    id v45 = [(id)a1 topic];
    if (v45)
    {
      objc_super v46 = v45;
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v49 = v48;

      *(void *)&long long v112 = sub_10000F0D0(v47, v49, (uint64_t *)&v125);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Received push from unknown topic: %{public}s", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v111)(v110, v109);
      return;
    }
    goto LABEL_44;
  }
LABEL_14:
  id v33 = [v13 userInfo];
  if (!v33)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:

    __break(1u);
    goto LABEL_45;
  }
  char v34 = v33;
  v110 = v13;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  int v35 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(void *)&long long v125 = 0;
  id v104 = v35;
  id v37 = [v35 dataWithJSONObject:isa options:0 error:&v125];

  id v38 = (id)v125;
  if (v37)
  {
    uint64_t v39 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = v40;

    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    sub_100008128();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    sub_100008084(v39, v41);
    swift_bridgeObjectRelease();
    swift_release();
    long long v129 = v116;
    long long v130 = v117;
    long long v125 = v112;
    long long v126 = v113;
    long long v131 = v118;
    long long v132 = v119;
    long long v127 = v114;
    long long v128 = v115;
    uint64_t v124 = v116;
    long long v122 = v114;
    long long v123 = v115;
    long long v120 = v112;
    long long v121 = v113;
    if (qword_100020A68 != -1) {
      swift_once();
    }
    uint64_t v85 = swift_allocObject();
    long long v86 = v120;
    *(_OWORD *)(v85 + 40) = v121;
    long long v87 = v123;
    *(_OWORD *)(v85 + 56) = v122;
    v88 = v111;
    *(void *)(v85 + 16) = v111;
    *(_OWORD *)(v85 + 72) = v87;
    *(void *)(v85 + 88) = v124;
    *(_OWORD *)(v85 + 24) = v86;
    long long v89 = v130;
    *(_OWORD *)(v85 + 160) = v129;
    *(_OWORD *)(v85 + 176) = v89;
    long long v90 = v132;
    *(_OWORD *)(v85 + 192) = v131;
    *(_OWORD *)(v85 + 208) = v90;
    long long v91 = v126;
    *(_OWORD *)(v85 + 96) = v125;
    *(_OWORD *)(v85 + 112) = v91;
    long long v92 = v128;
    *(_OWORD *)(v85 + 128) = v127;
    *(_OWORD *)(v85 + 144) = v92;
    v93 = (_OWORD *)swift_allocObject();
    long long v94 = v130;
    v93[5] = v129;
    v93[6] = v94;
    long long v95 = v132;
    v93[7] = v131;
    v93[8] = v95;
    long long v96 = v126;
    v93[1] = v125;
    v93[2] = v96;
    long long v97 = v128;
    v93[3] = v127;
    v93[4] = v97;
    sub_1000082A4((uint64_t)&v125);
    sub_1000082A4((uint64_t)&v125);
    v98 = v88;
    sub_100008338((uint64_t)&v112);
    sub_10000C94C((uint64_t *)&v120, (uint64_t)sub_10000821C, v85, (uint64_t)sub_10000829C, (uint64_t)v93);
    swift_release();
    swift_release();
    sub_1000083A0((uint64_t)&v125);
    return;
  }
  v50 = v38;
  uint64_t v51 = _convertNSErrorToError(_:)();

  swift_willThrow();
  swift_bridgeObjectRelease();
  v111 = v12;
  a1 = (uint64_t)v105;
  if (qword_100020A88 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_100007FB4(v2, (uint64_t)qword_100021188);
  v107((char *)a1, (id)v52, v2);
  v53 = v110;
  swift_errorRetain();
  os_log_type_t v12 = v53;
  swift_errorRetain();
  v54 = Logger.logObject.getter();
  v55 = (char *)v51;
  os_log_type_t v56 = static os_log_type_t.error.getter();
  BOOL v57 = os_log_type_enabled(v54, v56);
  os_log_t v102 = 0;
  uint64_t v103 = v52;
  if (v57)
  {
    os_log_t v101 = v54;
    v110 = v55;
    uint64_t v58 = swift_slowAlloc();
    v106 = (void *)swift_slowAlloc();
    v107 = (void (*)(char *, id, uint64_t))swift_slowAlloc();
    *(void *)&long long v125 = v107;
    *(_DWORD *)uint64_t v58 = 136446466;
    id v59 = [v12 userInfo];
    if (!v59)
    {
LABEL_45:
      swift_errorRelease();

      __break(1u);
      return;
    }
    v60 = v59;
    v100 = (char *)&type metadata for Any + 8;
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v61 = Dictionary.description.getter();
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    *(void *)&long long v112 = sub_10000F0D0(v61, v63, (uint64_t *)&v125);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v58 + 12) = 2114;
    v64 = v110;
    swift_errorRetain();
    uint64_t v65 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)&long long v112 = v65;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v106 = v65;
    swift_errorRelease();
    swift_errorRelease();
    os_log_type_t v66 = v56;
    v67 = v64;
    os_log_t v68 = v101;
    _os_log_impl((void *)&_mh_execute_header, v101, v66, "Failed to decode push payload %{public}s with error: %{public}@", (uint8_t *)v58, 0x16u);
    sub_100007FEC(&qword_100020B58);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = (uint64_t)v107;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v111)(v105, v109);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();

    ((void (*)(uint64_t, uint64_t))v111)(a1, v2);
    v67 = v55;
  }
  id v69 = [v12 userInfo];
  if (!v69) {
    goto LABEL_43;
  }
  v70 = v69;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  Class v71 = Dictionary._bridgeToObjectiveC()().super.isa;
  *(void *)&long long v125 = 0;
  id v72 = [v104 dataWithJSONObject:v71 options:0 error:&v125];

  id v73 = (id)v125;
  if (v72)
  {
    uint64_t v74 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v76 = v75;

    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    sub_100008030();
    os_log_t v77 = v102;
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    sub_100008084(v74, v76);
    swift_bridgeObjectRelease();
    swift_release();
    if (!v77)
    {
      long long v125 = v112;
      long long v126 = v113;
      long long v127 = v114;
      *(void *)&long long v128 = v115;
      type metadata accessor for CallbackManager();
      swift_initStaticObject();
      *(void *)&long long v112 = 0;
      *((void *)&v112 + 1) = 0xE000000000000000;
      _StringGuts.grow(_:)(28);
      v78._object = (void *)0x80000001000194F0;
      v78._countAndFlagsBits = 0xD00000000000001ALL;
      String.append(_:)(v78);
      *(void *)&long long v120 = v67;
      sub_100007FEC(&qword_100020B68);
      _print_unlocked<A, B>(_:_:)();
      sub_10000F9CC(2, v112, *((uint64_t *)&v112 + 1), (uint64_t *)&v125);
      swift_errorRelease();
      swift_bridgeObjectRelease();
      sub_1000080DC((uint64_t)&v125);
      return;
    }
  }
  else
  {
    v79 = v73;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  swift_errorRetain();
  swift_errorRetain();
  v80 = Logger.logObject.getter();
  os_log_type_t v81 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v80, v81))
  {
    v82 = (uint8_t *)swift_slowAlloc();
    v83 = (void *)swift_slowAlloc();
    *(_DWORD *)v82 = 138543362;
    swift_errorRetain();
    uint64_t v84 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)&long long v125 = v84;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v83 = v84;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v80, v81, "Failed to send error callback; missing required IdMS data: %{public}@",
      v82,
      0xCu);
    sub_100007FEC(&qword_100020B58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_100007FB4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007FEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008030()
{
  unint64_t result = qword_100020B60;
  if (!qword_100020B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020B60);
  }
  return result;
}

uint64_t sub_100008084(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000080DC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100008128()
{
  unint64_t result = qword_100020B70;
  if (!qword_100020B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020B70);
  }
  return result;
}

uint64_t sub_10000817C()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 224, 7);
}

uint64_t sub_10000821C()
{
  return sub_10000634C(*(void *)(v0 + 16), v0 + 24, v0 + 96);
}

uint64_t sub_10000822C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 144, 7);
}

uint64_t sub_10000829C()
{
  return sub_100006470(v0 + 16);
}

uint64_t sub_1000082A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008338(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000083A0(uint64_t a1)
{
  return a1;
}

void sub_100008434(uint64_t a1)
{
  if (qword_100020A80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = sub_100007FB4(v2, (uint64_t)qword_100021170);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v28[2] = a1;
    uint64_t v10 = swift_slowAlloc();
    v28[3] = v3;
    uint64_t v11 = (uint8_t *)v10;
    os_log_type_t v12 = (void *)swift_slowAlloc();
    v28[1] = v28;
    id v29 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    sub_1000088BC();
    uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
    v28[4] = sub_10000F0D0(v13, v14, (uint64_t *)&v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Opening URL %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  id v15 = [self defaultWorkspace];
  if (!v15) {
    __break(1u);
  }
  char v17 = v15;
  URL._bridgeToObjectiveC()(v16);
  uint64_t v19 = v18;
  id v29 = 0;
  id v20 = [v17 openURL:v18 configuration:0 error:&v29];

  if (v20)
  {
    id v21 = v29;
  }
  else
  {
    id v22 = v29;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      unint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v25 = 138543362;
      swift_errorRetain();
      os_log_t v27 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v29 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v26 = v27;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to open url: %{public}@", v25, 0xCu);
      sub_100007FEC(&qword_100020B58);
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
}

unint64_t sub_1000088BC()
{
  unint64_t result = qword_100020B78;
  if (!qword_100020B78)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020B78);
  }
  return result;
}

uint64_t sub_100008908(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008084(a1, a2);
  }
  return a1;
}

uint64_t sub_10000891C(uint64_t a1, unint64_t a2)
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

unint64_t sub_100008974()
{
  unint64_t result = qword_100020B88;
  if (!qword_100020B88)
  {
    sub_1000089D0(&qword_100020B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020B88);
  }
  return result;
}

uint64_t sub_1000089D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008A18()
{
  unint64_t result = qword_100020B98;
  if (!qword_100020B98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020B98);
  }
  return result;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void sub_100008A80(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100008AC8()
{
  return sub_100008B30(&qword_100020BB8);
}

uint64_t sub_100008AFC()
{
  return sub_100008B30((unint64_t *)&unk_100020BC0);
}

uint64_t sub_100008B30(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008B74(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v1) {
    return (uint64_t)v2;
  }
  uint64_t v39 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_100009D54(0, v1, 0);
  uint64_t v2 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v4 = sub_10000A184(a1);
  uint64_t v6 = v5;
  uint64_t v7 = a1 + 64;
  uint64_t v34 = type metadata accessor for URLQueryItem();
  uint64_t v8 = *(void *)(v34 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v35 = a1 + 64;
  uint64_t v36 = v9;
  uint64_t v32 = v8 + 32;
  uint64_t v33 = v8;
  uint64_t v29 = a1 + 80;
  int64_t v30 = v1;
  uint64_t v31 = v6;
  while (1)
  {
    uint64_t result = __chkstk_darwin();
    id v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4 < 0 || v4 >= v15 << *(unsigned char *)(a1 + 32)) {
      break;
    }
    unint64_t v19 = (unint64_t)v4 >> 6;
    uint64_t v20 = v15 << v4;
    if ((*(void *)(v7 + 8 * ((unint64_t)v4 >> 6)) & (v15 << v4)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v6) {
      goto LABEL_24;
    }
    uint64_t v37 = v14;
    uint64_t v38 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    URLQueryItem.init(name:value:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v39 = v2;
    unint64_t v22 = v2[2];
    unint64_t v21 = v2[3];
    if (v22 >= v21 >> 1)
    {
      sub_100009D54(v21 > 1, v22 + 1, 1);
      uint64_t v2 = v39;
    }
    v2[2] = v22 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v33 + 32))((unint64_t)v2+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v22, v18, v34);
    int64_t v10 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v7 = v35;
    if (v4 >= v10) {
      goto LABEL_25;
    }
    uint64_t v23 = *(void *)(v35 + 8 * v19);
    if ((v23 & v20) == 0) {
      goto LABEL_26;
    }
    LODWORD(v6) = v31;
    if (*(_DWORD *)(a1 + 36) != v31) {
      goto LABEL_27;
    }
    unint64_t v24 = v23 & (-2 << (v4 & 0x3F));
    if (v24)
    {
      int64_t v10 = __clz(__rbit64(v24)) | v4 & 0xFFFFFFFFFFFFFFC0;
      int64_t v11 = v30;
      uint64_t v12 = v37;
    }
    else
    {
      unint64_t v25 = v19 + 1;
      unint64_t v26 = (unint64_t)(v10 + 63) >> 6;
      int64_t v11 = v30;
      uint64_t v12 = v37;
      if (v19 + 1 < v26)
      {
        unint64_t v27 = *(void *)(v35 + 8 * v25);
        if (v27)
        {
LABEL_20:
          int64_t v10 = __clz(__rbit64(v27)) + (v25 << 6);
        }
        else
        {
          while (v26 - 2 != v19)
          {
            unint64_t v27 = *(void *)(v29 + 8 * v19++);
            if (v27)
            {
              unint64_t v25 = v19 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v4 = v10;
    if (v12 + 1 == v11) {
      return (uint64_t)v2;
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

uint64_t sub_100008E8C()
{
  uint64_t v0 = type metadata accessor for URL();
  sub_10000A120(v0, qword_100020C30);
  uint64_t v1 = sub_100007FB4(v0, (uint64_t)qword_100020C30);
  sub_100007FEC(&qword_100020C58);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  uint64_t v4 = *(void *)(v0 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v3, 1, v0);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1, v3, v0);
  }
  __break(1u);
  return result;
}

void sub_100008FB8()
{
  qword_100020C48 = 25705;
  unk_100020C50 = 0xE200000000000000;
}

uint64_t sub_100008FE0@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  v2._rawValue = &off_10001CA50;
  return sub_100009580(v2, a1, a2);
}

uint64_t sub_100008FEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A9AC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009018@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CA88, v3);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100009070()
{
  return 0;
}

void sub_10000907C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100009088(uint64_t a1)
{
  unint64_t v2 = sub_10000B124();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000090C4(uint64_t a1)
{
  unint64_t v2 = sub_10000B124();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100009100@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10000AD74(a1, v9);
  if (!v2)
  {
    long long v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    long long v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    long long v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    double result = *(double *)&v10;
    long long v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_100009154()
{
  return 1;
}

Swift::Int sub_10000915C()
{
  return Hasher._finalize()();
}

void sub_1000091A0()
{
}

Swift::Int sub_1000091C8()
{
  return Hasher._finalize()();
}

uint64_t sub_100009208(char a1)
{
  return qword_1000187A0[a1];
}

uint64_t sub_10000922C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000BA18(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100009258(uint64_t a1)
{
  unint64_t v2 = sub_10000BCA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100009294(uint64_t a1)
{
  unint64_t v2 = sub_10000BCA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_1000092D0@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000BAAC(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100009324(char *a1, char *a2)
{
  return sub_10000FC48(*a1, *a2);
}

Swift::Int sub_100009330()
{
  return sub_10000FF20();
}

uint64_t sub_100009338()
{
  return sub_1000100F8();
}

Swift::Int sub_100009340()
{
  return sub_10001048C();
}

unint64_t sub_100009348@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000BC54(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100009378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009208(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000093A4()
{
  return sub_100009208(*v0);
}

unint64_t sub_1000093AC@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000BC54(a1);
  *a2 = result;
  return result;
}

void sub_1000093D4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000093E0(uint64_t a1)
{
  unint64_t v2 = sub_10000ACD0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000941C(uint64_t a1)
{
  unint64_t v2 = sub_10000ACD0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100009458@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000A9BC(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1000094B4@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  v2._rawValue = &off_10001CB40;
  return sub_100009580(v2, a1, a2);
}

uint64_t sub_1000094C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000BD48();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000094E8()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100009548(char a1)
{
  return *(void *)&aCategoryaction[8 * a1];
}

uint64_t sub_100009574@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  v2._rawValue = &off_10001CC40;
  return sub_100009580(v2, a1, a2);
}

uint64_t sub_100009580@<X0>(Swift::OpaquePointer cases@<0:X3>, Swift::String *a2@<X0>, BOOL *a3@<X8>)
{
  Swift::Int v4 = _findStringSwitchCase(cases:string:)(cases, *a2);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4 != 0;
  return result;
}

uint64_t sub_1000095D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000BD68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000095F8()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100009658(char *a1, char *a2)
{
  return sub_10000FDFC(*a1, *a2);
}

Swift::Int sub_100009664()
{
  return sub_10001033C();
}

uint64_t sub_100009670()
{
  return sub_10001020C();
}

Swift::Int sub_100009678()
{
  return sub_10001033C();
}

unint64_t sub_100009680@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000BDD8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000096B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009548(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000096DC()
{
  return sub_100009548(*v0);
}

unint64_t sub_1000096E4@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000BDD8(a1);
  *a2 = result;
  return result;
}

void sub_10000970C(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_100009718(uint64_t a1)
{
  unint64_t v2 = sub_10000C2AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100009754(uint64_t a1)
{
  unint64_t v2 = sub_10000C2AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_100009790()
{
  if (*(void *)(v0 + 64)) {
    unint64_t v1 = *(void *)(v0 + 64);
  }
  else {
    unint64_t v1 = sub_10000CD3C((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_100008B74(v1);
  if (qword_100020A60 != -1) {
    swift_once();
  }
  if (*(void *)(v1 + 16)
    && (uint64_t v4 = qword_100020C48,
        uint64_t v3 = unk_100020C50,
        swift_bridgeObjectRetain(),
        sub_10000D580(v4, v3),
        LOBYTE(v4) = v5,
        swift_bridgeObjectRelease(),
        (v4 & 1) != 0))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = type metadata accessor for URLQueryItem();
    v16[1] = v16;
    uint64_t v7 = *(void *)(v6 - 8);
    __chkstk_darwin();
    uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    id result = (id)MobileGestalt_get_current_device();
    if (!result)
    {
      __break(1u);
      return result;
    }
    long long v11 = result;
    id v12 = (id)MobileGestalt_copy_serialNumber_obj();

    if (v12)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    URLQueryItem.init(name:value:)();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v2 = sub_100009ACC(0, *(void *)(v2 + 16) + 1, 1, v2);
    }
    unint64_t v14 = *(void *)(v2 + 16);
    unint64_t v13 = *(void *)(v2 + 24);
    if (v14 >= v13 >> 1) {
      unint64_t v2 = sub_100009ACC(v13 > 1, v14 + 1, 1, v2);
    }
    *(void *)(v2 + 16) = v14 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v2+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v14, v9, v6);
  }
  if (qword_100020A58 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for URL();
  sub_100007FB4(v15, (uint64_t)qword_100020C30);
  URL.appending(queryItems:)();
  return (id)swift_bridgeObjectRelease();
}

__n128 sub_100009A78@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000BE24(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100009ACC(char a1, int64_t a2, char a3, unint64_t a4)
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
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100007FEC(&qword_100020C60);
  uint64_t v10 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(type metadata accessor for URLQueryItem() - 8);
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
    sub_10000A20C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_100009D34(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009D74(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100009D54(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009EE0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100009D74(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007FEC(&qword_100020BA0);
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
  unint64_t v13 = v10 + 32;
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

uint64_t sub_100009EE0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100007FEC(&qword_100020C60);
  uint64_t v10 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t *sub_10000A120(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000A184(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

uint64_t sub_10000A20C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for URLQueryItem() - 8);
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

uint64_t destroy for PushPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PushPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PushPayload(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PushPayload(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for PushPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PushPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PushPayload()
{
  return &type metadata for PushPayload;
}

uint64_t destroy for CallbackData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CallbackData(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CallbackData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CallbackData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CallbackData(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CallbackData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CallbackData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CallbackData()
{
  return &type metadata for CallbackData;
}

uint64_t sub_10000A9AC()
{
  return 7565409;
}

uint64_t sub_10000A9BC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100007FEC(&qword_100020C68);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC8C(a1, a1[3]);
  sub_10000ACD0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000AD24((uint64_t)a1);
  }
  char v30 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v29 = 1;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v11;
  uint64_t v26 = v10;
  char v28 = 2;
  swift_bridgeObjectRetain();
  uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v25 = v13;
  char v27 = 3;
  swift_bridgeObjectRetain();
  uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v16 = v15;
  unint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v23 = v14;
  v17(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_10000AD24((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v18 = v25;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v20 = v26;
  *a2 = v9;
  a2[1] = v20;
  uint64_t v21 = v24;
  a2[2] = v12;
  a2[3] = v21;
  uint64_t v22 = v23;
  a2[4] = v18;
  a2[5] = v22;
  a2[6] = v16;
  return result;
}

void *sub_10000AC8C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000ACD0()
{
  unint64_t result = qword_100020C70;
  if (!qword_100020C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C70);
  }
  return result;
}

uint64_t sub_10000AD24(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000AD74@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  v60 = a2;
  uint64_t v4 = sub_100007FEC(&qword_100020C78);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC8C(a1, a1[3]);
  sub_10000B124();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000AD24((uint64_t)a1);
  }
  sub_10000B178();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v8 = v43;
  uint64_t v36 = v45;
  uint64_t v30 = v46;
  uint64_t v31 = v44;
  uint64_t v32 = v47;
  uint64_t v9 = v49;
  uint64_t v28 = v42;
  uint64_t v29 = v48;
  uint64_t v10 = v50;
  sub_10000B1CC((uint64_t)a1, (uint64_t)v55);
  uint64_t v34 = v10;
  swift_bridgeObjectRetain();
  uint64_t v35 = v8;
  uint64_t v11 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v33 = v9;
  swift_bridgeObjectRetain();
  sub_10000A9BC(v55, (uint64_t *)&v56);
  long long v26 = v57;
  long long v27 = v56;
  long long v25 = v58;
  uint64_t v24 = v59;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = v28;
  uint64_t v14 = v35;
  uint64_t v13 = v36;
  *(void *)&long long v37 = v28;
  *((void *)&v37 + 1) = v35;
  *(void *)&long long v38 = v31;
  *((void *)&v38 + 1) = v36;
  *(void *)&long long v39 = v30;
  *((void *)&v39 + 1) = v11;
  uint64_t v16 = v33;
  uint64_t v15 = v34;
  *(void *)&long long v40 = v29;
  *((void *)&v40 + 1) = v33;
  *(void *)&v41[0] = v34;
  *(_OWORD *)((char *)v41 + 8) = v27;
  *(_OWORD *)((char *)&v41[1] + 8) = v26;
  *(_OWORD *)((char *)&v41[2] + 8) = v25;
  *((void *)&v41[3] + 1) = v24;
  sub_1000082A4((uint64_t)&v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000AD24((uint64_t)a1);
  uint64_t v42 = v12;
  uint64_t v43 = v14;
  uint64_t v44 = v31;
  uint64_t v45 = v13;
  uint64_t v46 = v30;
  uint64_t v47 = v11;
  uint64_t v48 = v29;
  uint64_t v49 = v16;
  long long v51 = v56;
  long long v52 = v57;
  long long v53 = v58;
  uint64_t v50 = v15;
  uint64_t v54 = v59;
  uint64_t result = sub_1000083A0((uint64_t)&v42);
  long long v18 = v41[1];
  unint64_t v19 = v60;
  v60[4] = v41[0];
  v19[5] = v18;
  long long v20 = v41[3];
  v19[6] = v41[2];
  v19[7] = v20;
  long long v21 = v38;
  *unint64_t v19 = v37;
  v19[1] = v21;
  long long v22 = v40;
  v19[2] = v39;
  v19[3] = v22;
  return result;
}

unint64_t sub_10000B124()
{
  unint64_t result = qword_100020C80;
  if (!qword_100020C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C80);
  }
  return result;
}

unint64_t sub_10000B178()
{
  unint64_t result = qword_100020C88;
  if (!qword_100020C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C88);
  }
  return result;
}

uint64_t sub_10000B1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B240()
{
  return 0;
}

ValueMetadata *type metadata accessor for PushPayload.CodingKeys()
{
  return &type metadata for PushPayload.CodingKeys;
}

unsigned char *initializeBufferWithCopyOfBuffer for CallbackData.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CallbackData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CallbackData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000B3C4);
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

ValueMetadata *type metadata accessor for CallbackData.CodingKeys()
{
  return &type metadata for CallbackData.CodingKeys;
}

ValueMetadata *type metadata accessor for AlertPayload.Action()
{
  return &type metadata for AlertPayload.Action;
}

__n128 initializeWithTake for AlertPayload(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for AlertPayload()
{
  return &type metadata for AlertPayload;
}

ValueMetadata *type metadata accessor for AlertPayload.Category()
{
  return &type metadata for AlertPayload.Category;
}

uint64_t initializeBufferWithCopyOfBuffer for APSPayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s16diagnosticspushd12AlertPayloadVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s16diagnosticspushd12AlertPayloadVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s16diagnosticspushd12AlertPayloadVwca_0(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16diagnosticspushd12AlertPayloadVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16diagnosticspushd12AlertPayloadVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10000B6F8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APSPayload()
{
  return &type metadata for APSPayload;
}

unint64_t sub_10000B75C()
{
  unint64_t result = qword_100020C90;
  if (!qword_100020C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C90);
  }
  return result;
}

unint64_t sub_10000B7B4()
{
  unint64_t result = qword_100020C98;
  if (!qword_100020C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C98);
  }
  return result;
}

unint64_t sub_10000B80C()
{
  unint64_t result = qword_100020CA0;
  if (!qword_100020CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CA0);
  }
  return result;
}

unint64_t sub_10000B864()
{
  unint64_t result = qword_100020CA8;
  if (!qword_100020CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CA8);
  }
  return result;
}

unint64_t sub_10000B8BC()
{
  unint64_t result = qword_100020CB0;
  if (!qword_100020CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CB0);
  }
  return result;
}

unint64_t sub_10000B914()
{
  unint64_t result = qword_100020CB8;
  if (!qword_100020CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CB8);
  }
  return result;
}

unint64_t sub_10000B96C()
{
  unint64_t result = qword_100020CC0;
  if (!qword_100020CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CC0);
  }
  return result;
}

unint64_t sub_10000B9C4()
{
  unint64_t result = qword_100020CC8;
  if (!qword_100020CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CC8);
  }
  return result;
}

uint64_t sub_10000BA18(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7472656C61 && a2 == 0xE500000000000000)
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

uint64_t sub_10000BA98()
{
  return 0x7472656C61;
}

uint64_t sub_10000BAAC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100007FEC(&qword_100020CD0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC8C(a1, a1[3]);
  sub_10000BCA0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000AD24((uint64_t)a1);
  }
  sub_10000BCF4();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v15 = v18;
  long long v16 = v17;
  long long v13 = v20;
  long long v14 = v19;
  uint64_t v9 = v21;
  uint64_t result = sub_10000AD24((uint64_t)a1);
  long long v11 = v15;
  *(_OWORD *)a2 = v16;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = v13;
  *(_OWORD *)(a2 + 32) = v14;
  *(_OWORD *)(a2 + 48) = v12;
  *(void *)(a2 + 64) = v9;
  return result;
}

unint64_t sub_10000BC54(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CAC0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

unint64_t sub_10000BCA0()
{
  unint64_t result = qword_100020CD8;
  if (!qword_100020CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CD8);
  }
  return result;
}

unint64_t sub_10000BCF4()
{
  unint64_t result = qword_100020CE0;
  if (!qword_100020CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CE0);
  }
  return result;
}

uint64_t sub_10000BD48()
{
  return 0x74736F6E67616964;
}

uint64_t sub_10000BD68()
{
  return 0x697373655377656ELL;
}

unint64_t sub_10000BD84()
{
  unint64_t result = qword_100020CE8;
  if (!qword_100020CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CE8);
  }
  return result;
}

unint64_t sub_10000BDD8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CB78, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 7) {
    return 7;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000BE24@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100007FEC(&qword_100020CF0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC8C(a1, a1[3]);
  sub_10000C2AC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_10000AD24((uint64_t)a1);
    return v5;
  }
  else
  {
    char v36 = 0;
    sub_10000C300();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    char v35 = 1;
    sub_10000C354();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    char v34 = 2;
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
    char v33 = 3;
    uint64_t v11 = v10;
    swift_bridgeObjectRetain();
    uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v28 = v9;
    uint64_t v12 = v11;
    char v32 = 4;
    uint64_t v14 = v13;
    swift_bridgeObjectRetain();
    uint64_t v25 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v26 = v15;
    char v31 = 5;
    swift_bridgeObjectRetain();
    uint64_t v22 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v17 = v16;
    uint64_t v24 = sub_100007FEC(&qword_100020D10);
    char v30 = 6;
    sub_10000C3A8();
    uint64_t v23 = v17;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v18 = v29;
    swift_bridgeObjectRetain();
    sub_10000AD24((uint64_t)a1);
    swift_bridgeObjectRelease();
    uint64_t v19 = v23;
    swift_bridgeObjectRelease();
    uint64_t v20 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v28;
    a2[1] = v12;
    a2[2] = v27;
    a2[3] = v14;
    a2[4] = v25;
    a2[5] = v20;
    a2[6] = v22;
    a2[7] = v19;
    a2[8] = v18;
  }
  return result;
}

unint64_t sub_10000C2AC()
{
  unint64_t result = qword_100020CF8;
  if (!qword_100020CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CF8);
  }
  return result;
}

unint64_t sub_10000C300()
{
  unint64_t result = qword_100020D00;
  if (!qword_100020D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D00);
  }
  return result;
}

unint64_t sub_10000C354()
{
  unint64_t result = qword_100020D08;
  if (!qword_100020D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D08);
  }
  return result;
}

unint64_t sub_10000C3A8()
{
  unint64_t result = qword_100020D18;
  if (!qword_100020D18)
  {
    sub_1000089D0(&qword_100020D10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D18);
  }
  return result;
}

unint64_t sub_10000C414()
{
  unint64_t result = qword_100020D20;
  if (!qword_100020D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D20);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AlertPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AlertPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000C5C4);
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

uint64_t sub_10000C5EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000C5F4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AlertPayload.CodingKeys()
{
  return &type metadata for AlertPayload.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CallbackBody.Error.Code(unsigned int *a1, int a2)
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

unsigned char *_s16diagnosticspushd12AlertPayloadV8CategoryOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000C6F8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for APSPayload.CodingKeys()
{
  return &type metadata for APSPayload.CodingKeys;
}

unint64_t sub_10000C734()
{
  unint64_t result = qword_100020D28;
  if (!qword_100020D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D28);
  }
  return result;
}

unint64_t sub_10000C78C()
{
  unint64_t result = qword_100020D30;
  if (!qword_100020D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D30);
  }
  return result;
}

unint64_t sub_10000C7E4()
{
  unint64_t result = qword_100020D38;
  if (!qword_100020D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D38);
  }
  return result;
}

unint64_t sub_10000C83C()
{
  unint64_t result = qword_100020D40;
  if (!qword_100020D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D40);
  }
  return result;
}

unint64_t sub_10000C894()
{
  unint64_t result = qword_100020D48;
  if (!qword_100020D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D48);
  }
  return result;
}

unint64_t sub_10000C8EC()
{
  unint64_t result = qword_100020D50;
  if (!qword_100020D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D50);
  }
  return result;
}

uint64_t sub_10000C94C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Class v10 = sub_10000D7E8(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
  uint64_t v24 = *(void *)(v5 + 16);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = a5;
  aBlock[4] = sub_10000D97C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D3E4;
  aBlock[3] = &unk_10001D420;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v10;
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v17 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = &_swiftEmptyArrayStorage;
  sub_10000DA34(&qword_100020DF8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007FEC(&qword_100020E00);
  sub_10000DA7C(&qword_100020E08, &qword_100020E00);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_release();
}

unint64_t sub_10000CC28(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FEC(&qword_100020E28);
  int v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (void *)*(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    id v8 = v5;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000D4AC(v5);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    uint64_t v11 = (void *)(v2[7] + 16 * result);
    void *v11 = v6;
    v11[1] = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v14;
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

unint64_t sub_10000CD3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FEC(&qword_100020E38);
  int v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000D580(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_10000CE60()
{
  type metadata accessor for AlertManager();
  swift_allocObject();
  uint64_t result = sub_10000CE9C();
  qword_100021158 = result;
  return result;
}

uint64_t sub_10000CE9C()
{
  sub_100008A18();
  uint64_t v1 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v1 - 8);
  static DispatchQoS.userInteractive.getter();
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v2);
  v7[1] = &_swiftEmptyArrayStorage;
  sub_10000DA34(&qword_100020E40, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100007FEC(&qword_100020E48);
  sub_10000DA7C(&qword_100020E50, &qword_100020E48);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  __chkstk_darwin(v3);
  (*(void (**)(char *, void))(v5 + 104))((char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  *(void *)(v0 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  return v0;
}

void sub_10000D0BC(void *a1, void (*a2)(void), uint64_t a3, void (*a4)(void))
{
  if (qword_100020A90 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100007FB4(v7, (uint64_t)qword_1000211A0);
  id v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    CFOptionFlags responseFlags = (CFOptionFlags)v8;
    uint64_t v12 = a4;
    id v13 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v21 = v8;

    a4 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Showing alert with options: %@", v11, 0xCu);
    sub_100007FEC(&qword_100020B58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  BOOL v14 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v8);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
  CFOptionFlags v15 = responseFlags & 3;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  if (v15)
  {
    if (v18)
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "User selected alternate button", v19, 2u);
      swift_slowDealloc();
    }

    a4();
  }
  else
  {
    if (v18)
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "User selected default button", v20, 2u);
      swift_slowDealloc();
    }

    a2();
  }
}

uint64_t sub_10000D3E4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000D428()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AlertManager()
{
  return self;
}

uint64_t sub_10000D484(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_10000D4AC(void *a1)
{
  Hasher.init(_seed:)();
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFString(0);
    sub_100008B30(&qword_100020E30);
    id v2 = a1;
    _CFObject.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Swift::Int v3 = Hasher._finalize()();

  return sub_10000D5F8((uint64_t)a1, v3);
}

unint64_t sub_10000D580(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000D704(a1, a2, v4);
}

unint64_t sub_10000D5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = v2;
    uint64_t v8 = ~v4;
    do
    {
      uint64_t v9 = *(void **)(*(void *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFString(0);
          sub_100008B30(&qword_100020E30);
          id v10 = v9;
          char v11 = static _CFObject.== infix(_:_:)();

          if (v11) {
            return v5;
          }
        }
      }
      else if (!a1)
      {
        return v5;
      }
      unint64_t v5 = (v5 + 1) & v8;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_10000D704(uint64_t a1, uint64_t a2, uint64_t a3)
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
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

Class sub_10000D7E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007FEC(&qword_100020E10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100018860;
  *(void *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 48) = a2;
  *(void *)(inited + 56) = kCFUserNotificationAlertMessageKey;
  *(void *)(inited + 80) = kCFUserNotificationDefaultButtonTitleKey;
  *(void *)(inited + 88) = a5;
  *(void *)(inited + 64) = a3;
  *(void *)(inited + 72) = a4;
  *(void *)(inited + 96) = a6;
  *(void *)(inited + 104) = kCFUserNotificationAlternateButtonTitleKey;
  *(void *)(inited + 112) = a7;
  *(void *)(inited + 120) = a8;
  CFStringRef v16 = (id)kCFUserNotificationAlternateButtonTitleKey;
  swift_bridgeObjectRetain();
  CFStringRef v17 = (id)kCFUserNotificationAlertHeaderKey;
  swift_bridgeObjectRetain();
  CFStringRef v18 = (id)kCFUserNotificationAlertMessageKey;
  swift_bridgeObjectRetain();
  CFStringRef v19 = (id)kCFUserNotificationDefaultButtonTitleKey;
  swift_bridgeObjectRetain();
  sub_10000CC28(inited);
  sub_100007FEC(&qword_100020E18);
  sub_10000D9A4();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

uint64_t sub_10000D934()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10000D97C()
{
  sub_10000D0BC(*(void **)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void (**)(void))(v0 + 40));
}

uint64_t sub_10000D98C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D99C()
{
  return swift_release();
}

unint64_t sub_10000D9A4()
{
  unint64_t result = qword_100020E20;
  if (!qword_100020E20)
  {
    sub_1000089D0(&qword_100020E18);
    sub_100008B30(&qword_100020BB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020E20);
  }
  return result;
}

uint64_t sub_10000DA34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000DA7C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000089D0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000DACC()
{
  type metadata accessor for DefaultsManager();
  uint64_t v0 = swift_allocObject();
  id v1 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 initWithSuiteName:v2];

  *(void *)(v0 + 16) = v3;
  qword_100021160 = v0;
}

uint64_t type metadata accessor for DefaultsManager()
{
  return self;
}

id sub_10000DB80()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for BackgroundTaskManager()) init];
  qword_100021168 = (uint64_t)result;
  return result;
}

char *sub_10000DC0C()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  NSString v2 = &v0[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
  *(void *)NSString v2 = 0xD000000000000026;
  *((void *)v2 + 1) = 0x80000001000197D0;
  v26.receiver = v0;
  v26.super_class = ObjectType;
  id v3 = [super init];
  uint64_t v4 = self;
  uint64_t v5 = (char *)v3;
  id v6 = [v4 sharedScheduler];
  uint64_t v7 = (uint64_t *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
  swift_bridgeObjectRetain();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  aBlock[4] = (uint64_t)sub_10000EF8C;
  aBlock[5] = v9;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000EBE8;
  aBlock[3] = (uint64_t)&unk_10001D470;
  id v10 = _Block_copy(aBlock);
  BOOL v11 = v5;
  swift_release();
  unsigned int v12 = [v6 registerForTaskWithIdentifier:v8 usingQueue:0 launchHandler:v10];
  _Block_release(v10);

  if (!v12)
  {
    if (qword_100020AA0 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100007FB4(v21, (uint64_t)qword_1000211D0);
    BOOL v14 = v11;
    CFOptionFlags v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v15, v16))
    {
      CFStringRef v17 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)CFStringRef v17 = 136446210;
      uint64_t v22 = *v7;
      unint64_t v23 = v7[1];
      swift_bridgeObjectRetain();
      sub_10000F0D0(v22, v23, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      uint64_t v20 = "Task %{public}s was not registered successfully";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (qword_100020AA0 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100007FB4(v13, (uint64_t)qword_1000211D0);
  BOOL v14 = v11;
  CFOptionFlags v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v15, v16)) {
    goto LABEL_11;
  }
  CFStringRef v17 = (uint8_t *)swift_slowAlloc();
  aBlock[0] = swift_slowAlloc();
  *(_DWORD *)CFStringRef v17 = 136446210;
  uint64_t v18 = *v7;
  unint64_t v19 = v7[1];
  swift_bridgeObjectRetain();
  sub_10000F0D0(v18, v19, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  uint64_t v20 = "Task %{public}s registered successfully";
LABEL_10:
  _os_log_impl((void *)&_mh_execute_header, v15, v16, v20, v17, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

LABEL_12:
  return v11;
}

uint64_t sub_10000E018(void *a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 0;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_10000F7E4;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D3E4;
  aBlock[3] = &unk_10001D4E8;
  id v6 = _Block_copy(aBlock);
  id v7 = a2;
  swift_retain();
  swift_release();
  [a1 setExpirationHandler:v6];
  _Block_release(v6);
  swift_beginAccess();
  NSString v8 = &DPDPushManager__prots;
  uint64_t v9 = &DPDPushManager__prots;
  if (*(unsigned char *)(v4 + 16) == 1)
  {
    if (qword_100020AA0 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    uint64_t v11 = sub_100007FB4(v10, (uint64_t)qword_1000211D0);
    unsigned int v12 = (char *)v7;
    uint64_t v39 = v11;
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      CFOptionFlags v15 = v12;
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      id v43 = (id)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v16 = 136446210;
      uint64_t v17 = *(void *)&v12[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
      unint64_t v18 = *(void *)&v15[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
      swift_bridgeObjectRetain();
      uint64_t v19 = v17;
      unsigned int v12 = v15;
      sub_10000F0D0(v19, v18, (uint64_t *)&v43);
      uint64_t v9 = &DPDPushManager__prots;
      NSString v8 = &DPDPushManager__prots;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Task %{public}s was expired immediately after being run", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v43 = 0;
    if (objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:", &v43, 0.0, v39))
    {
      id v20 = v43;
    }
    else
    {
      id v41 = a1;
      uint64_t v21 = v12;
      id v22 = v43;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      id v23 = v21;
      swift_errorRetain();
      uint64_t v24 = (char *)v23;
      swift_errorRetain();
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        id v40 = v7;
        uint64_t v28 = (void *)swift_slowAlloc();
        id v43 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136446466;
        uint64_t v29 = *(void *)&v24[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
        unint64_t v30 = *(void *)&v24[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
        swift_bridgeObjectRetain();
        sub_10000F0D0(v29, v30, (uint64_t *)&v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2114;
        swift_errorRetain();
        uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v28 = v42;
        uint64_t v9 = &DPDPushManager__prots;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to expire task %{public}s: %{public}@", (uint8_t *)v27, 0x16u);
        sub_100007FEC(&qword_100020B58);
        swift_arrayDestroy();
        id v7 = v40;
        swift_slowDealloc();
        swift_arrayDestroy();
        NSString v8 = &DPDPushManager__prots;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
      }

      a1 = v41;
      [v41 (SEL)v9[268].count];
      swift_errorRelease();
    }
  }
  if (v8[340].count != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  sub_100007FB4(v31, (uint64_t)qword_1000211D0);
  char v32 = (char *)v7;
  char v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    char v35 = (uint8_t *)swift_slowAlloc();
    id v43 = (id)swift_slowAlloc();
    *(_DWORD *)char v35 = 136446210;
    uint64_t v36 = *(void *)&v32[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
    unint64_t v37 = *(void *)&v32[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
    swift_bridgeObjectRetain();
    sub_10000F0D0(v36, v37, (uint64_t *)&v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Handling task %{public}s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v9 = &DPDPushManager__prots;
    swift_slowDealloc();
  }
  else
  {
  }
  if (qword_100020A50 != -1) {
    swift_once();
  }
  [a1 (SEL)v9[268].count];
  return swift_release();
}

void sub_10000E730(void *a1, uint64_t a2)
{
  if (qword_100020AA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007FB4(v4, (uint64_t)qword_1000211D0);
  uint64_t v5 = a1;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v6, v7))
  {
    NSString v8 = (uint8_t *)swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)NSString v8 = 136446210;
    uint64_t v9 = *(void *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
    unint64_t v10 = *(void *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
    swift_bridgeObjectRetain();
    sub_10000F0D0(v9, v10, v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Task %{public}s expired by DAS", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_beginAccess();
  *(unsigned char *)(a2 + 16) = 1;
  sub_10000E90C();
}

void sub_10000E90C()
{
  if (&class metadata base offset for TapToRadarService) {
    BOOL v1 = &type metadata accessor for TapToRadarService == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1 && &type metadata for TapToRadarService != 0 && &nominal type descriptor for TapToRadarService != 0)
  {
    uint64_t v4 = v0;
    id v5 = [objc_allocWithZone((Class)RadarDraft) init];
    NSString v6 = String._bridgeToObjectiveC()();
    [v5 setTitle:v6];

    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease();
    uint64_t v7 = v4 + OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier;
    uint64_t v8 = *(void *)(v4 + OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier);
    uint64_t v9 = *(void **)(v7 + 8);
    swift_bridgeObjectRetain();
    v10._countAndFlagsBits = v8;
    v10._object = v9;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 0xD00000000000001ALL;
    v11._object = (void *)0x8000000100019A70;
    String.append(_:)(v11);
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v5 setProblemDescription:v12];

    id v13 = objc_allocWithZone((Class)RadarComponent);
    NSString v14 = String._bridgeToObjectiveC()();
    NSString v15 = String._bridgeToObjectiveC()();
    id v16 = [v13 initWithName:v14 version:v15 identifier:429804];

    [v5 setComponent:v16];
    [v5 setClassification:4];
    [v5 setReproducibility:5];
    [v5 setShouldCapturePerformanceTrace:1];
    type metadata accessor for TapToRadarService();
    id v17 = (id)static TapToRadarService.shared.getter();
    TapToRadarService.createDraft(_:processName:displayReason:completion:)();
  }
}

void sub_10000EBE8(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000EC74(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100020AA0 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100007FB4(v1, (uint64_t)qword_1000211D0);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v2))
    {
      id v3 = (uint8_t *)swift_slowAlloc();
      id v4 = (void *)swift_slowAlloc();
      *(_DWORD *)id v3 = 138412290;
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v4 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Failed to create TTR draft: %@", v3, 0xCu);
      sub_100007FEC(&qword_100020B58);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100020AA0 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100007FB4(v5, (uint64_t)qword_1000211D0);
    oslog = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Successfully created TTR draft", v7, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t type metadata accessor for BackgroundTaskManager()
{
  return self;
}

uint64_t sub_10000EF54()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EF8C(void *a1)
{
  return sub_10000E018(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000EF94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EFA4()
{
  return swift_release();
}

uint64_t sub_10000EFAC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000EFBC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000EFF8(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10000F030(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000F058(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000F0D0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000F0D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000F1A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000F738((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000F738((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AD24((uint64_t)v12);
  return v7;
}

uint64_t sub_10000F1A4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000F360(a5, a6);
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

uint64_t sub_10000F360(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000F3F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000F5D8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000F5D8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000F3F8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000F570(v2, 0);
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

void *sub_10000F570(uint64_t a1, uint64_t a2)
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
  sub_100007FEC(&qword_100020F28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000F5D8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007FEC(&qword_100020F28);
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

unsigned char **sub_10000F728(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000F738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000F794()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000F7A4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000F7E4()
{
  sub_10000E730(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10000F7EC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10000F8AC(uint64_t a1)
{
  return sub_10000F954(a1, qword_100021170);
}

uint64_t sub_10000F8C4(uint64_t a1)
{
  return sub_10000F954(a1, qword_100021188);
}

uint64_t sub_10000F8E4(uint64_t a1)
{
  return sub_10000F954(a1, qword_1000211A0);
}

uint64_t sub_10000F900(uint64_t a1)
{
  return sub_10000F954(a1, qword_1000211B8);
}

uint64_t sub_10000F928(uint64_t a1)
{
  return sub_10000F954(a1, qword_1000211D0);
}

uint64_t sub_10000F954(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000A120(v3, a2);
  sub_100007FB4(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000F9CC(char a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = a2;
  sub_100007FEC(&qword_100020FC8);
  ((void (*)(void))__chkstk_darwin)();
  int64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CallbackBody() - 8;
  uint64_t v27 = *(void *)v9;
  uint64_t v10 = *(void *)(v27 + 64);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  NSString v14 = (char *)&v26 - v13;
  uint64_t v15 = a4[6];
  uint64_t v28 = a4[5];
  swift_bridgeObjectRetain();
  static Date.now.getter();
  uint64_t v16 = *a4;
  long long v17 = *(_OWORD *)(a4 + 1);
  long long v30 = *(_OWORD *)(a4 + 3);
  long long v18 = v30;
  long long v31 = v17;
  char *v14 = a1;
  *((void *)v14 + 1) = v26;
  *((void *)v14 + 2) = a3;
  *(void *)&v14[*(int *)(v9 + 36)] = v16;
  *(_OWORD *)&v14[*(int *)(v9 + 40)] = v17;
  *(_OWORD *)&v14[*(int *)(v9 + 44)] = v18;
  uint64_t v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  sub_1000139B8((uint64_t)v14, (uint64_t)v12);
  unint64_t v20 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v21 = (v10 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = 0;
  *(void *)(v22 + 24) = 0;
  sub_100013B68((uint64_t)v12, v22 + v20);
  id v23 = (void *)(v22 + v21);
  uint64_t v24 = v29;
  void *v23 = v28;
  v23[1] = v15;
  *(void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8)) = v24;
  sub_100013E04((uint64_t)&v31);
  sub_100013E04((uint64_t)&v30);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000132F4((uint64_t)v8, (uint64_t)&unk_100020FD8, v22);
  swift_release();
  return sub_100013E30((uint64_t)v14);
}

uint64_t sub_10000FC48(char a1, char a2)
{
  if (qword_100018EA0[a1] == qword_100018EA0[a2] && qword_100018EC0[a1] == qword_100018EC0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10000FCD0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x67736D5F727265;
  }
  else {
    uint64_t v3 = 0x65646F635F727265;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x67736D5F727265;
  }
  else {
    uint64_t v5 = 0x65646F635F727265;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
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

uint64_t sub_10000FD74(char a1, char a2)
{
  if (*(void *)&aUseractiuserac[8 * a1] == *(void *)&aUseractiuserac[8 * a2]
    && *(void *)&aIdmsdataon[8 * a1 + 8] == *(void *)&aIdmsdataon[8 * a2 + 8])
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

uint64_t sub_10000FDFC(char a1, char a2)
{
  if (*(void *)&aCategoryaction_0[8 * a1] == *(void *)&aCategoryaction_0[8 * a2]
    && *(void *)&aDefurlpa_0[8 * a1 + 8] == *(void *)&aDefurlpa_0[8 * a2 + 8])
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

uint64_t sub_10000FE84(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 7629921;
  }
  else {
    uint64_t v3 = 0x746C7561666564;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  if (a2) {
    uint64_t v5 = 7629921;
  }
  else {
    uint64_t v5 = 0x746C7561666564;
  }
  if (a2) {
    unint64_t v6 = 0xE300000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
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

Swift::Int sub_10000FF20()
{
  return Hasher._finalize()();
}

Swift::Int sub_10000FF8C()
{
  return Hasher._finalize()();
}

Swift::Int sub_100010008()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001008C()
{
  return Hasher._finalize()();
}

uint64_t sub_1000100F8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001014C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000101B8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001020C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100010260()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000102C4()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001033C()
{
  return Hasher._finalize()();
}

Swift::Int sub_1000103A4()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001040C()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001048C()
{
  return Hasher._finalize()();
}

uint64_t sub_1000104F4(char a1)
{
  if (a1) {
    return 7629921;
  }
  else {
    return 0x746C7561666564;
  }
}

uint64_t sub_100010524(char *a1, char *a2)
{
  return sub_10000FE84(*a1, *a2);
}

Swift::Int sub_100010530()
{
  return sub_10000FF8C();
}

uint64_t sub_100010538()
{
  return sub_100010260();
}

Swift::Int sub_100010540()
{
  return sub_1000102C4();
}

uint64_t sub_100010548@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  v2._rawValue = &off_10001CC78;
  return sub_100010B5C(v2, a1, a2);
}

uint64_t sub_100010554@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000104F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100010580()
{
  return RawRepresentable<>.encode(to:)();
}

Swift::Int sub_1000105D0()
{
  return Hasher._finalize()();
}

void sub_100010614()
{
}

Swift::Int sub_10001063C()
{
  return Hasher._finalize()();
}

void *sub_10001067C@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != -1;
  return result;
}

void sub_100010690(void *a1@<X8>)
{
  *a1 = -1;
}

uint64_t sub_10001069C()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1000106EC(char a1)
{
  if (a1) {
    return 0x67736D5F727265;
  }
  else {
    return 0x65646F635F727265;
  }
}

uint64_t sub_100010724(void *a1)
{
  uint64_t v3 = sub_100007FEC(&qword_100021110);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC8C(a1, a1[3]);
  sub_100016C14();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v10 = 0;
  sub_100016C68();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    char v9 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001089C(char a1)
{
  return *(void *)&aUseractiuserac[8 * a1];
}

uint64_t sub_1000108BC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100007FEC(&qword_1000210C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC8C(a1, a1[3]);
  sub_100016610();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v10) = *(unsigned char *)v3;
  char v11 = 0;
  sub_100016664();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v2)
  {
    type metadata accessor for CallbackBody();
    LOBYTE(v10) = 1;
    type metadata accessor for Date();
    sub_1000166B8();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    long long v10 = *(_OWORD *)(v3 + 8);
    char v11 = 2;
    sub_100016704();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v10) = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v10) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v10) = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100010B2C(char *a1, char *a2)
{
  return sub_10000FCD0(*a1, *a2);
}

Swift::Int sub_100010B38()
{
  return sub_100010008();
}

uint64_t sub_100010B40()
{
  return sub_10001014C();
}

Swift::Int sub_100010B48()
{
  return sub_10001040C();
}

uint64_t sub_100010B50@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  v2._rawValue = &off_10001CCC8;
  return sub_100010B5C(v2, a1, a2);
}

uint64_t sub_100010B5C@<X0>(Swift::OpaquePointer cases@<0:X3>, Swift::String *a2@<X0>, char *a3@<X8>)
{
  Swift::Int v4 = _findStringSwitchCase(cases:string:)(cases, *a2);
  uint64_t result = swift_bridgeObjectRelease();
  if (v4 == 1) {
    char v6 = 1;
  }
  else {
    char v6 = 2;
  }
  if (!v4) {
    char v6 = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t sub_100010BB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000106EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100010BE4()
{
  return sub_1000106EC(*v0);
}

uint64_t sub_100010BEC@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CCC8, v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100010C50(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100010C5C(uint64_t a1)
{
  unint64_t v2 = sub_100016C14();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100010C98(uint64_t a1)
{
  unint64_t v2 = sub_100016C14();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100010CD4(void *a1)
{
  return sub_100010724(a1);
}

uint64_t sub_100010CF0(char *a1, char *a2)
{
  return sub_10000FD74(*a1, *a2);
}

Swift::Int sub_100010CFC()
{
  return sub_10001008C();
}

uint64_t sub_100010D04()
{
  return sub_1000101B8();
}

Swift::Int sub_100010D0C()
{
  return sub_1000103A4();
}

unint64_t sub_100010D14@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100015248(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100010D44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001089C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100010D70()
{
  return sub_10001089C(*v0);
}

unint64_t sub_100010D78@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100015248(a1);
  *a2 = result;
  return result;
}

void sub_100010DA0(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100010DAC(uint64_t a1)
{
  unint64_t v2 = sub_100016610();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100010DE8(uint64_t a1)
{
  unint64_t v2 = sub_100016610();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100010E24(void *a1)
{
  return sub_1000108BC(a1);
}

uint64_t sub_100010E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[52] = a5;
  v6[53] = a6;
  v6[51] = a4;
  uint64_t v7 = type metadata accessor for Logger();
  v6[54] = v7;
  v6[55] = *(void *)(v7 - 8);
  v6[56] = swift_task_alloc();
  v6[57] = swift_task_alloc();
  return _swift_task_switch(sub_100010F3C, 0, 0);
}

uint64_t sub_100010F3C()
{
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  type metadata accessor for CallbackBody();
  sub_100014150();
  uint64_t v1 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  v0[58] = 0;
  v0[59] = v1;
  v0[60] = v2;
  swift_release();
  uint64_t v3 = type metadata accessor for URL();
  v0[61] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[62] = v4;
  v0[63] = *(void *)(v4 + 64);
  v0[64] = swift_task_alloc();
  v0[65] = *(void *)(*(void *)(sub_100007FEC(&qword_100020C58) - 8) + 64);
  uint64_t v5 = swift_task_alloc();
  v0[66] = v5;
  id v6 = [self sharedBag];
  v0[67] = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    NSString v8 = String._bridgeToObjectiveC()();
    v0[68] = v8;
    v0[2] = v0;
    v0[7] = v5;
    v0[3] = sub_100011394;
    uint64_t v9 = swift_continuation_init();
    v0[15] = _NSConcreteStackBlock;
    v0[16] = 0x40000000;
    v0[17] = sub_100013118;
    v0[18] = &unk_10001D560;
    v0[19] = v9;
    [v7 urlForKey:v8 completion:v0 + 15];
    id v6 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v6);
}

uint64_t sub_100011394()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 552) = v1;
  if (v1) {
    uint64_t v2 = sub_100012C14;
  }
  else {
    uint64_t v2 = sub_1000114D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000114D0()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0[66];
  uint64_t v2 = v0[61];
  uint64_t v3 = v0[62];
  uint64_t v4 = swift_task_alloc();
  sub_100015DD8(v1, v4, &qword_100020C58);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2);
  id v6 = (void *)v0[68];
  uint64_t v7 = (void *)v0[67];
  if (v5 == 1)
  {
    sub_100015D7C(v4, &qword_100020C58);
    swift_task_dealloc();

    swift_task_dealloc();
    swift_task_dealloc();
    if (qword_100020A98 != -1) {
      swift_once();
    }
    sub_100007FB4(v0[54], (uint64_t)qword_1000211B8);
    swift_bridgeObjectRetain_n();
    NSString v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[59];
    unint64_t v11 = v0[60];
    unint64_t v13 = v0[53];
    if (v10)
    {
      uint64_t v14 = v0[52];
      unint64_t v22 = v0[60];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      v0[49] = sub_10000F0D0(v14, v13, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "AKURLBag returned nil URL for key: %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_100008084(v12, v22);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_100008084(v12, v11);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  else
  {
    uint64_t v16 = v0[62];
    (*(void (**)(void, uint64_t, void))(v16 + 32))(v0[64], v4, v0[61]);
    swift_task_dealloc();

    swift_task_dealloc();
    uint64_t v17 = type metadata accessor for URLRequest();
    v0[73] = v17;
    v0[74] = *(void *)(v17 - 8);
    uint64_t v18 = swift_task_alloc();
    v0[75] = v18;
    swift_task_alloc();
    (*(void (**)(void))(v16 + 16))();
    URLRequest.init(url:cachePolicy:timeoutInterval:)();
    swift_task_dealloc();
    uint64_t v19 = (void *)swift_task_alloc();
    v0[76] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_10001193C;
    v19[16] = v18;
    return _swift_task_switch(sub_1000152B4, 0, 0);
  }
}

uint64_t sub_10001193C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 616) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100011A68, 0, 0);
}

uint64_t sub_100011A68()
{
  uint64_t v60 = v0;
  uint64_t v1 = *(void *)(v0 + 472);
  unint64_t v2 = *(void *)(v0 + 480);
  URLRequest.httpMethod.setter();
  swift_bridgeObjectRetain();
  URLRequest.allHTTPHeaderFields.setter();
  sub_10000891C(v1, v2);
  URLRequest.httpBody.setter();
  if (qword_100020A98 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)(v0 + 472);
  unint64_t v3 = *(void *)(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 456);
  uint64_t v6 = *(void *)(v0 + 432);
  uint64_t v7 = *(void *)(v0 + 440);
  uint64_t v8 = sub_100007FB4(v6, (uint64_t)qword_1000211B8);
  *(void *)(v0 + 560) = v8;
  os_log_type_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  *(void *)(v0 + 568) = v9;
  *(void *)(v0 + 576) = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v5, v8, v6);
  sub_10000891C(v4, v3);
  swift_bridgeObjectRetain();
  sub_10000891C(v4, v3);
  BOOL v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v57 = v11;
    uint64_t v54 = (void *)(v0 + 200);
    unint64_t v12 = v2 >> 62;
    v55 = (long long *)(v0 + 160);
    uint64_t v13 = swift_slowAlloc();
    v59[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v14 = Dictionary.debugDescription.getter();
    *(void *)(v0 + 344) = sub_10000F0D0(v14, v15, v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2082;
    switch((int)v12)
    {
      case 1:
        uint64_t v30 = *(void *)(v0 + 472);
        if (v30 >> 32 < (int)v30) {
          __break(1u);
        }
        unint64_t v31 = *(void *)(v0 + 480);
        uint64_t v32 = *(void *)(v0 + 464);
        sub_10000891C(*(void *)(v0 + 472), v31);
        swift_retain();
        uint64_t v20 = sub_100014E14((int)v30, v30 >> 32, v31 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100015090);
        unint64_t v21 = v33;
        sub_100008084(v30, v31);
        if (!v32) {
          goto LABEL_20;
        }
        uint64_t v34 = *(void *)(v0 + 472);
        unint64_t v35 = *(void *)(v0 + 480);
        uint64_t result = sub_100008084(v34, v35);
        break;
      case 2:
        uint64_t v38 = *(void *)(v0 + 472);
        unint64_t v37 = *(void *)(v0 + 480);
        uint64_t v39 = *(void *)(v0 + 464);
        uint64_t v40 = v37 & 0x3FFFFFFFFFFFFFFFLL;
        uint64_t v41 = *(void *)(v38 + 16);
        uint64_t v42 = *(void *)(v38 + 24);
        sub_10000891C(v38, v37);
        swift_retain();
        swift_retain();
        uint64_t v43 = sub_100014E14(v41, v42, v40, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100015090);
        if (!v39)
        {
          uint64_t v20 = v43;
          unint64_t v21 = v44;
          swift_release();
          swift_release();
LABEL_20:
          uint64_t v22 = *(void *)(v0 + 472);
          unint64_t v23 = *(void *)(v0 + 480);
          if (v21) {
            goto LABEL_21;
          }
          *(void *)(v0 + 296) = v22;
          *(void *)(v0 + 304) = v23;
          sub_10000891C(v22, v23);
          sub_100007FEC(&qword_100021000);
          if (swift_dynamicCast())
          {
            sub_100015D00(v55, (uint64_t)v54);
            sub_10000AC8C(v54, *(void *)(v0 + 224));
            if (dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter())
            {
              sub_100008084(*(void *)(v0 + 472), *(void *)(v0 + 480));
              sub_10000AC8C(v54, *(void *)(v0 + 224));
              dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
              uint64_t v20 = *(void *)(v0 + 312);
              unint64_t v21 = *(void *)(v0 + 320);
              sub_10000AD24((uint64_t)v54);
              goto LABEL_22;
            }
            sub_10000AD24((uint64_t)v54);
          }
          else
          {
            *(void *)(v0 + 192) = 0;
            long long *v55 = 0u;
            *(_OWORD *)(v0 + 176) = 0u;
            sub_100015D7C((uint64_t)v55, &qword_100021008);
          }
          uint64_t v17 = *(void *)(v0 + 472);
          unint64_t v16 = *(void *)(v0 + 480);
          uint64_t v18 = sub_100014B20(v17, v16);
          goto LABEL_6;
        }
        sub_100008084(*(void *)(v0 + 472), *(void *)(v0 + 480));
        swift_release();
        uint64_t result = swift_release();
        break;
      case 3:
        uint64_t v46 = *(void *)(v0 + 472);
        unint64_t v45 = *(void *)(v0 + 480);
        uint64_t v47 = *(void *)(v0 + 464);
        *(void *)(v0 + 694) = 0;
        *(void *)(v0 + 700) = 0;
        sub_100015090(v58);
        uint64_t result = sub_100008084(v46, v45);
        if (!v47)
        {
          uint64_t v20 = v58[0];
          unint64_t v21 = v58[1];
          goto LABEL_22;
        }
        break;
      default:
        uint64_t v17 = *(void *)(v0 + 472);
        unint64_t v16 = *(void *)(v0 + 480);
        *(void *)(v0 + 708) = v17;
        *(_WORD *)(v0 + 716) = v16;
        *(unsigned char *)(v0 + 718) = BYTE2(v16);
        *(unsigned char *)(v0 + 719) = BYTE3(v16);
        *(unsigned char *)(v0 + 720) = BYTE4(v16);
        *(unsigned char *)(v0 + 721) = BYTE5(v16);
        uint64_t v18 = static String._fromUTF8Repairing(_:)();
LABEL_6:
        uint64_t v20 = v18;
        unint64_t v21 = v19;
        uint64_t v22 = v17;
        unint64_t v23 = v16;
LABEL_21:
        sub_100008084(v22, v23);
LABEL_22:
        uint64_t v49 = *(void *)(v0 + 472);
        unint64_t v48 = *(void *)(v0 + 480);
        uint64_t v56 = *(void *)(v0 + 456);
        uint64_t v51 = *(void *)(v0 + 432);
        uint64_t v50 = *(void *)(v0 + 440);
        *(void *)(v0 + 368) = sub_10000F0D0(v20, v21, v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100008084(v49, v48);
        sub_100008084(v49, v48);
        _os_log_impl((void *)&_mh_execute_header, v10, v57, "Making URL request\nheaders:\n%s\nbody:\n%{public}s", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
        v29(v56, v51);
        goto LABEL_23;
    }
  }
  else
  {
    uint64_t v25 = *(void *)(v0 + 472);
    unint64_t v24 = *(void *)(v0 + 480);
    uint64_t v26 = *(void *)(v0 + 456);
    uint64_t v27 = *(void *)(v0 + 432);
    uint64_t v28 = *(void *)(v0 + 440);
    swift_bridgeObjectRelease_n();
    sub_100008084(v25, v24);
    sub_100008084(v25, v24);

    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v29(v26, v27);
LABEL_23:
    *(void *)(v0 + 624) = v29;
    *(void *)(v0 + 632) = [self sharedSession];
    long long v52 = (void *)swift_task_alloc();
    *(void *)(v0 + 640) = v52;
    *long long v52 = v0;
    v52[1] = sub_100012250;
    uint64_t v53 = *(void *)(v0 + 600);
    return NSURLSession.data(for:delegate:)(v53, 0);
  }
  return result;
}

uint64_t sub_100012250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[81] = a1;
  v6[82] = a2;
  v6[83] = a3;
  v6[84] = v3;
  swift_task_dealloc();

  if (v3) {
    uint64_t v7 = sub_100012E88;
  }
  else {
    uint64_t v7 = sub_1000123C4;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000123C4()
{
  uint64_t v74 = v0;
  uint64_t v1 = *(void **)(v0 + 664);
  unint64_t v2 = *(void *)(v0 + 656);
  uint64_t v3 = *(void *)(v0 + 648);
  (*(void (**)(void, void, void))(v0 + 568))(*(void *)(v0 + 448), *(void *)(v0 + 560), *(void *)(v0 + 432));
  id v4 = v1;
  sub_10000891C(v3, v2);
  id v5 = v4;
  sub_10000891C(v3, v2);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v68 = v7;
    log = v6;
    long long v58 = (long long *)(v0 + 80);
    v55 = (void *)(v0 + 240);
    uint64_t v8 = *(void **)(v0 + 664);
    uint64_t v9 = *(void *)(v0 + 656) >> 62;
    uint64_t v10 = swift_slowAlloc();
    os_log_type_t v11 = (void *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138543618;
    *(void *)(v0 + 384) = v8;
    id v12 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v11 = v8;

    *(_WORD *)(v10 + 12) = 2082;
    switch(v9)
    {
      case 1:
        uint64_t v28 = *(void *)(v0 + 648);
        if (v28 >> 32 < (int)v28) {
          __break(1u);
        }
        uint64_t v29 = *(void *)(v0 + 672);
        unint64_t v30 = *(void *)(v0 + 656);
        sub_10000891C(*(void *)(v0 + 648), v30);
        swift_retain();
        uint64_t v17 = sub_100014E14((int)v28, v28 >> 32, v30 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100015090);
        unint64_t v18 = v31;
        sub_100008084(v28, v30);
        if (!v29) {
          goto LABEL_18;
        }
        unint64_t v32 = *(void *)(v0 + 656);
        uint64_t v33 = *(void *)(v0 + 648);
        uint64_t result = sub_100008084(v33, v32);
        break;
      case 2:
        uint64_t v35 = *(void *)(v0 + 672);
        unint64_t v36 = *(void *)(v0 + 656);
        uint64_t v37 = *(void *)(v0 + 648);
        uint64_t v38 = v36 & 0x3FFFFFFFFFFFFFFFLL;
        uint64_t v39 = *(void *)(v37 + 16);
        uint64_t v40 = *(void *)(v37 + 24);
        sub_10000891C(v37, v36);
        swift_retain();
        swift_retain();
        uint64_t v41 = sub_100014E14(v39, v40, v38, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100015090);
        if (!v35)
        {
          uint64_t v17 = v41;
          unint64_t v18 = v42;
          swift_release();
          swift_release();
LABEL_18:
          unint64_t v20 = *(void *)(v0 + 656);
          uint64_t v19 = *(void *)(v0 + 648);
          if (v18) {
            goto LABEL_19;
          }
          *(void *)(v0 + 280) = v19;
          *(void *)(v0 + 288) = v20;
          sub_10000891C(v19, v20);
          sub_100007FEC(&qword_100021000);
          if (swift_dynamicCast())
          {
            sub_100015D00(v58, (uint64_t)v55);
            sub_10000AC8C(v55, *(void *)(v0 + 264));
            if (dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter())
            {
              sub_100008084(*(void *)(v0 + 648), *(void *)(v0 + 656));
              sub_10000AC8C(v55, *(void *)(v0 + 264));
              dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
              uint64_t v17 = *(void *)(v0 + 328);
              unint64_t v18 = *(void *)(v0 + 336);
              sub_10000AD24((uint64_t)v55);
              goto LABEL_20;
            }
            sub_10000AD24((uint64_t)v55);
          }
          else
          {
            *(void *)(v0 + 112) = 0;
            *long long v58 = 0u;
            *(_OWORD *)(v0 + 96) = 0u;
            sub_100015D7C((uint64_t)v58, &qword_100021008);
          }
          unint64_t v13 = *(void *)(v0 + 656);
          uint64_t v14 = *(void *)(v0 + 648);
          uint64_t v15 = sub_100014B20(v14, v13);
          goto LABEL_4;
        }
        sub_100008084(*(void *)(v0 + 648), *(void *)(v0 + 656));
        swift_release();
        uint64_t result = swift_release();
        break;
      case 3:
        uint64_t v43 = *(void *)(v0 + 672);
        unint64_t v44 = *(void *)(v0 + 656);
        uint64_t v45 = *(void *)(v0 + 648);
        *(void *)(v0 + 722) = 0;
        *(void *)(v0 + 728) = 0;
        sub_100015090(v72);
        uint64_t result = sub_100008084(v45, v44);
        if (!v43)
        {
          uint64_t v17 = v72[0];
          unint64_t v18 = v72[1];
          goto LABEL_20;
        }
        break;
      default:
        unint64_t v13 = *(void *)(v0 + 656);
        uint64_t v14 = *(void *)(v0 + 648);
        *(void *)(v0 + 680) = v14;
        *(_WORD *)(v0 + 688) = v13;
        *(unsigned char *)(v0 + 690) = BYTE2(v13);
        *(unsigned char *)(v0 + 691) = BYTE3(v13);
        *(unsigned char *)(v0 + 692) = BYTE4(v13);
        *(unsigned char *)(v0 + 693) = BYTE5(v13);
        uint64_t v15 = static String._fromUTF8Repairing(_:)();
LABEL_4:
        uint64_t v17 = v15;
        unint64_t v18 = v16;
        uint64_t v19 = v14;
        unint64_t v20 = v13;
LABEL_19:
        sub_100008084(v19, v20);
LABEL_20:
        unint64_t v46 = *(void *)(v0 + 656);
        uint64_t v47 = *(void *)(v0 + 648);
        uint64_t v56 = *(void **)(v0 + 664);
        os_log_type_t v57 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
        uint64_t v48 = *(void *)(v0 + 592);
        uint64_t v59 = *(void *)(v0 + 584);
        uint64_t v60 = *(void *)(v0 + 600);
        uint64_t v49 = *(void *)(v0 + 496);
        uint64_t v61 = *(void *)(v0 + 488);
        uint64_t v63 = *(void *)(v0 + 512);
        uint64_t v50 = *(void *)(v0 + 472);
        unint64_t v52 = *(void *)(v0 + 480);
        uint64_t v53 = *(void *)(v0 + 432);
        uint64_t v54 = *(void *)(v0 + 448);
        *(void *)(v0 + 376) = sub_10000F0D0(v17, v18, &v73);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100008084(v47, v46);
        sub_100008084(v47, v46);
        _os_log_impl((void *)&_mh_execute_header, log, v68, "URL request completed\nresponse:\n%{public}@\ndata:\n%{public}s", (uint8_t *)v10, 0x16u);
        sub_100007FEC(&qword_100020B58);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_100008084(v47, v46);
        sub_100008084(v50, v52);
        v57(v54, v53);
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v60, v59);
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v63, v61);
        goto LABEL_21;
    }
  }
  else
  {
    unint64_t v21 = *(void **)(v0 + 664);
    unint64_t v22 = *(void *)(v0 + 656);
    uint64_t v23 = *(void *)(v0 + 648);
    uint64_t v24 = *(void *)(v0 + 592);
    uint64_t v65 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
    uint64_t v66 = *(void *)(v0 + 584);
    os_log_t loga = *(os_log_t *)(v0 + 512);
    uint64_t v25 = *(void *)(v0 + 496);
    uint64_t v67 = *(void *)(v0 + 600);
    uint64_t v69 = *(void *)(v0 + 488);
    uint64_t v27 = *(void *)(v0 + 472);
    unint64_t v26 = *(void *)(v0 + 480);
    uint64_t v62 = *(void *)(v0 + 432);
    uint64_t v64 = *(void *)(v0 + 448);

    sub_100008084(v23, v22);
    sub_100008084(v23, v22);

    sub_100008084(v23, v22);
    sub_100008084(v27, v26);
    v65(v64, v62);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v67, v66);
    (*(void (**)(os_log_t, uint64_t))(v25 + 8))(loga, v69);
LABEL_21:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v51 = *(uint64_t (**)(void))(v0 + 8);
    return v51();
  }
  return result;
}

uint64_t sub_100012C14()
{
  uint64_t v1 = (void *)v0[68];
  unint64_t v2 = (void *)v0[67];
  uint64_t v4 = v0[59];
  unint64_t v3 = v0[60];
  swift_willThrow();
  sub_100008084(v4, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  if (qword_100020A98 != -1) {
    swift_once();
  }
  sub_100007FB4(v0[54], (uint64_t)qword_1000211B8);
  swift_errorRetain();
  swift_errorRetain();
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 138543362;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[45] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to make URL request: %{public}@", v7, 0xCu);
    sub_100007FEC(&qword_100020B58);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100012E88()
{
  uint64_t v1 = v0[75];
  uint64_t v2 = v0[74];
  uint64_t v3 = v0[73];
  uint64_t v4 = v0[64];
  uint64_t v5 = v0[61];
  uint64_t v6 = v0[62];
  sub_100008084(v0[59], v0[60]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  if (qword_100020A98 != -1) {
    swift_once();
  }
  sub_100007FB4(v0[54], (uint64_t)qword_1000211B8);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138543362;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[45] = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v10 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to make URL request: %{public}@", v9, 0xCu);
    sub_100007FEC(&qword_100020B58);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_100013118(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100007FEC(&qword_100020B68);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    uint64_t v9 = sub_100007FEC(&qword_100020C58);
    uint64_t v10 = __chkstk_darwin(v9 - 8);
    uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    __chkstk_darwin(v10);
    uint64_t v14 = (char *)&v18 - v13;
    if (a2)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = type metadata accessor for URL();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
    }
    else
    {
      uint64_t v16 = type metadata accessor for URL();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
    }
    sub_100015DD8((uint64_t)v14, (uint64_t)v12, &qword_100020C58);
    sub_100015DD8((uint64_t)v12, *(void *)(*(void *)(v3 + 64) + 40), &qword_100020C58);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1000132F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100015D7C(a1, &qword_100020FC8);
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

uint64_t sub_1000134A0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100007FEC(&qword_100020B68);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_100015DD8((uint64_t)&v11, v8, &qword_100021018);
    return swift_continuation_throwingResume();
  }
}

unint64_t sub_10001356C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100007FEC(&qword_100020E38);
    uint64_t v1 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v1 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v23 = a1 + 64;
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  unint64_t v4 = v2 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      uint64_t v10 = (v4 - 1) & v4;
      unint64_t v11 = __clz(__rbit64(v4)) | (v6 << 6);
      int64_t v12 = v6;
    }
    else
    {
      int64_t v13 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_40;
      }
      if (v13 >= v22)
      {
LABEL_36:
        sub_100015D18();
        return (unint64_t)v1;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v6 + 1;
      if (!v14)
      {
        int64_t v12 = v6 + 2;
        if (v6 + 2 >= v22) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v6 + 3;
          if (v6 + 3 >= v22) {
            goto LABEL_36;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v6 + 4;
            if (v6 + 4 >= v22) {
              goto LABEL_36;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v6 + 5;
              if (v6 + 5 >= v22) {
                goto LABEL_36;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_41;
                  }
                  if (v12 >= v22) {
                    goto LABEL_36;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v6 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_100015D20(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v31);
    sub_10000F738(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v32 + 8);
    v29[0] = v32[0];
    v29[1] = v32[1];
    uint64_t v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_100015D20((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_100015D7C((uint64_t)v28, &qword_100021010);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_100015D18();
      swift_release();
      return 0;
    }
    sub_10000F738((uint64_t)v29 + 8, (uint64_t)v27);
    sub_100015D7C((uint64_t)v28, &qword_100021010);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t result = sub_10000D580(v25, v26);
    if (v16)
    {
      uint64_t v7 = 16 * result;
      uint64_t v8 = (uint64_t *)(v1[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v8 = v25;
      v8[1] = v26;
      id v9 = (uint64_t *)(v1[7] + v7);
      unint64_t result = swift_bridgeObjectRelease();
      *id v9 = v25;
      v9[1] = v26;
      goto LABEL_8;
    }
    if (v1[2] >= v1[3]) {
      break;
    }
    *(void *)((char *)v1 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v17 = (uint64_t *)(v1[6] + 16 * result);
    *uint64_t v17 = v25;
    v17[1] = v26;
    uint64_t v18 = (uint64_t *)(v1[7] + 16 * result);
    *uint64_t v18 = v25;
    v18[1] = v26;
    uint64_t v19 = v1[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_39;
    }
    v1[2] = v21;
LABEL_8:
    int64_t v6 = v12;
    unint64_t v4 = v10;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100013938()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for CallbackManager()
{
  return self;
}

uint64_t type metadata accessor for CallbackBody()
{
  uint64_t result = qword_100021078;
  if (!qword_100021078) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000139B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallbackBody();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013A1C()
{
  uint64_t v1 = (int *)(type metadata accessor for CallbackBody() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_100013B68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallbackBody();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013BCC(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for CallbackBody() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  int64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *int64_t v12 = v2;
  v12[1] = sub_100013D10;
  return sub_100010E3C(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_100013D10()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100013E04(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013E30(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CallbackBody();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100013E8C(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100013F68;
  return v6(a1);
}

uint64_t sub_100013F68()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100014060()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014098(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100013D10;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100020FE0 + dword_100020FE0);
  return v6(a1, v4);
}

unint64_t sub_100014150()
{
  unint64_t result = qword_100020FF0;
  if (!qword_100020FF0)
  {
    type metadata accessor for CallbackBody();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100020FF0);
  }
  return result;
}

uint64_t sub_1000141A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_100014C1C();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  int64_t v15 = (void *)*a5;
  unint64_t v17 = sub_10000D580(v7, v8);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v21 = v16;
  if (v15[3] >= v20)
  {
    if (a4)
    {
      uint64_t v24 = (void *)*a5;
      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1000147DC();
      uint64_t v24 = (void *)*a5;
      if (v21) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v24[(v17 >> 6) + 8] |= 1 << v17;
    uint64_t v26 = (uint64_t *)(v24[6] + 16 * v17);
    *uint64_t v26 = v11;
    v26[1] = v12;
    uint64_t v27 = (void *)(v24[7] + 16 * v17);
    *uint64_t v27 = v13;
    v27[1] = v14;
    uint64_t v28 = v24[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v24[2] = v30;
LABEL_13:
    uint64_t v31 = sub_100014C1C();
    if (v32)
    {
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      uint64_t v37 = v33;
      uint64_t v38 = v34;
      do
      {
        uint64_t v43 = (void *)*a5;
        unint64_t v45 = sub_10000D580(v35, v36);
        uint64_t v46 = v43[2];
        BOOL v47 = (v44 & 1) == 0;
        uint64_t v48 = v46 + v47;
        if (__OFADD__(v46, v47)) {
          goto LABEL_25;
        }
        char v49 = v44;
        if (v43[3] < v48)
        {
          sub_1000144B4(v48, 1);
          unint64_t v50 = sub_10000D580(v35, v36);
          if ((v49 & 1) != (v51 & 1)) {
            goto LABEL_27;
          }
          unint64_t v45 = v50;
        }
        unint64_t v52 = (void *)*a5;
        if (v49)
        {
          swift_bridgeObjectRelease();
          uint64_t v39 = (void *)(v52[7] + 16 * v45);
          swift_bridgeObjectRelease();
          *uint64_t v39 = v37;
          v39[1] = v38;
        }
        else
        {
          v52[(v45 >> 6) + 8] |= 1 << v45;
          uint64_t v53 = (uint64_t *)(v52[6] + 16 * v45);
          uint64_t *v53 = v35;
          v53[1] = v36;
          uint64_t v54 = (void *)(v52[7] + 16 * v45);
          void *v54 = v37;
          v54[1] = v38;
          uint64_t v55 = v52[2];
          BOOL v29 = __OFADD__(v55, 1);
          uint64_t v56 = v55 + 1;
          if (v29) {
            goto LABEL_26;
          }
          v52[2] = v56;
        }
        uint64_t v35 = sub_100014C1C();
        uint64_t v36 = v40;
        uint64_t v37 = v41;
        uint64_t v38 = v42;
      }
      while (v40);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100015D18();
    return swift_release();
  }
  sub_1000144B4(v20, a4 & 1);
  unint64_t v22 = sub_10000D580(v11, v12);
  if ((v21 & 1) == (v23 & 1))
  {
    unint64_t v17 = v22;
    uint64_t v24 = (void *)*a5;
    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)(v24[7] + 16 * v17);
    swift_bridgeObjectRelease();
    *uint64_t v25 = v13;
    v25[1] = v14;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000144B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007FEC(&qword_100020E38);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
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
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    BOOL v19 = (void *)(*(void *)(v7 + 48) + v18);
    *BOOL v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_1000147DC()
{
  uint64_t v1 = v0;
  sub_100007FEC(&qword_100020E38);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100014998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10000D580(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1000147DC();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000144B4(v17, a5 & 1);
  unint64_t v23 = sub_10000D580(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *int64_t v25 = a3;
  v25[1] = a4;
  unint64_t v26 = (void *)(v20[7] + 16 * v14);
  *unint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100014B20(uint64_t a1, unint64_t a2)
{
  sub_10000891C(a1, a2);
  sub_100014EC4(a1, a2);
  sub_100008084(a1, a2);
  uint64_t v4 = static String._fromUTF8Repairing(_:)();
  swift_release();
  return v4;
}

uint64_t sub_100014B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._fromUTF8Repairing(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100014BD4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_100014C1C()
{
  void (*v14)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  void v23[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = 16 * v6;
    uint64_t v8 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    uint64_t v11 = (uint64_t *)(*(void *)(v1 + 56) + v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v14 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(&v22, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v22;
  }
  BOOL v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      char v18 = v0[1];
      uint64_t v19 = *(void *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        uint64_t v5 = (v19 - 1) & v19;
        unint64_t v6 = __clz(__rbit64(v19)) + (v16 << 6);
        int64_t v4 = v16;
        goto LABEL_3;
      }
      uint64_t v20 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        uint64_t v19 = *(void *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          BOOL v16 = v20;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          uint64_t v19 = *(void *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            BOOL v16 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v20 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            uint64_t v19 = *(void *)(v18 + 8 * v20);
            if (v19) {
              goto LABEL_10;
            }
            BOOL v16 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              uint64_t v19 = *(void *)(v18 + 8 * v16);
              if (v19) {
                goto LABEL_7;
              }
              int64_t v4 = v17 - 1;
              uint64_t v21 = v3 + 6;
              while (v17 != v21)
              {
                uint64_t v19 = *(void *)(v18 + 8 * v21++);
                if (v19)
                {
                  BOOL v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

void *sub_100014DC0(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_100014E14(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_100014DC0(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

void *sub_100014EC4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = &_swiftEmptyArrayStorage;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v5)
      {
        if (v5 >= 1)
        {
          sub_100007FEC(&qword_100020F28);
          unint64_t v2 = (void *)swift_allocObject();
          size_t v8 = j__malloc_size(v2);
          v2[2] = v5;
          v2[3] = 2 * v8 - 64;
        }
        uint64_t v9 = type metadata accessor for Data.Iterator();
        uint64_t v10 = *(void *)(v9 - 8);
        __chkstk_darwin(v9);
        uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_10000891C(a1, a2);
        uint64_t v13 = Data._copyContents(initializing:)();
        sub_100008084(a1, a2);
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        if (v13 != v5)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x100015080);
        }
      }
      return v2;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v2;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_100015090@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._fromUTF8Repairing(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

Swift::Int sub_1000150C8()
{
  return sub_100015114();
}

Swift::Int sub_1000150D8()
{
  return sub_100015114();
}

Swift::Int sub_1000150F4()
{
  return sub_100015114();
}

Swift::Int sub_100015114()
{
  return Hasher._finalize()();
}

uint64_t sub_100015160()
{
  return String.hash(into:)();
}

uint64_t sub_100015170()
{
  return String.hash(into:)();
}

uint64_t sub_10001518C()
{
  return String.hash(into:)();
}

Swift::Int sub_1000151AC()
{
  return sub_1000151F8();
}

Swift::Int sub_1000151BC()
{
  return sub_1000151F8();
}

Swift::Int sub_1000151DC()
{
  return sub_1000151F8();
}

Swift::Int sub_1000151F8()
{
  return Hasher._finalize()();
}

unint64_t sub_100015248(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CD18, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
  }
}

uint64_t sub_100015294(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_1000152B4, 0, 0);
}

uint64_t sub_1000152B4()
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100014998(0xD000000000000010, 0x8000000100019B20, 0x2D746E65746E6F43, 0xEC00000065707954, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  id v2 = (id)MobileGestalt_get_current_device();
  if (v2)
  {
    unint64_t v3 = v2;
    int internalBuild = MobileGestalt_get_internalBuild();

    if (internalBuild)
    {
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;
      char v8 = swift_isUniquelyReferenced_nonNull_native();
      sub_100014998(1702195828, 0xE400000000000000, v5, v7, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v0[17] = &_swiftEmptyDictionarySingleton;
    id v9 = [objc_allocWithZone((Class)AKAnisetteProvisioningController) init];
    v0[18] = v9;
    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    v0[19] = isa;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_1000154CC;
    uint64_t v11 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_1000134A0;
    v0[13] = &unk_10001D578;
    v0[14] = v11;
    [v9 attestationDataForRequest:isa completion:v0 + 10];
    id v2 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v2);
}

uint64_t sub_1000154CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    id v2 = sub_10001593C;
  }
  else {
    id v2 = sub_1000155DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000155DC()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void **)(v0 + 120);

  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 136);
    id v3 = [v1 attestationHeaders];
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25[0] = v2;
    sub_1000141A8(v4, (uint64_t)sub_100014BD4, 0, isUniquelyReferenced_nonNull_native, v25);
    uint64_t v6 = *(void **)(v0 + 144);
    uint64_t v7 = v25[0];
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100020A98 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100007FB4(v8, (uint64_t)qword_1000211B8);
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void **)(v0 + 144);
    if (v11)
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to get attestation data: nil response", v13, 2u);
      swift_slowDealloc();
    }

    uint64_t v7 = *(void *)(v0 + 136);
  }
  id v14 = [self ak_clientInfoHeader];
  if (v14
    && (uint64_t v15 = v14,
        uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
        v15,
        unint64_t v17 = sub_10001356C(v16),
        swift_bridgeObjectRelease(),
        v17))
  {
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    v25[0] = v7;
    sub_1000141A8(v17, (uint64_t)sub_100014BD4, 0, v18, v25);
    uint64_t v7 = v25[0];
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100020A98 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100007FB4(v19, (uint64_t)qword_1000211B8);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to get client info", v22, 2u);
      swift_slowDealloc();
    }
  }
  unint64_t v23 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v23(v7);
}

uint64_t sub_10001593C()
{
  unint64_t v23 = v0;
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = (void *)v0[18];
  swift_willThrow();

  id v3 = &DPDPushManager__prots;
  if (qword_100020A98 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007FB4(v4, (uint64_t)qword_1000211B8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = v4;
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v8 = v9;
    id v3 = &DPDPushManager__prots;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to get attestation data: %@", v7, 0xCu);
    sub_100007FEC(&qword_100020B58);
    swift_arrayDestroy();
    uint64_t v4 = v21;
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
  uint64_t v10 = v0[17];
  id v11 = [self ak_clientInfoHeader];
  if (v11
    && (uint64_t v12 = v11,
        uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
        v12,
        unint64_t v14 = sub_10001356C(v13),
        swift_bridgeObjectRelease(),
        v14))
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = v10;
    sub_1000141A8(v14, (uint64_t)sub_100014BD4, 0, isUniquelyReferenced_nonNull_native, &v22);
    uint64_t v10 = v22;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v3[339].count != -1) {
      swift_once();
    }
    sub_100007FB4(v4, (uint64_t)qword_1000211B8);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      char v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to get client info", v18, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(v10);
}

uint64_t sub_100015D00(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100015D18()
{
  return swift_release();
}

uint64_t sub_100015D20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100015D7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007FEC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100015DD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007FEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100015E3C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    unint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[9];
    char v18 = (uint64_t *)((char *)v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *char v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100015F78(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100016018(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  unint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v16);
  char v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100016104(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[9];
  unint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100016214(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_1000162C8(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v16);
  char v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000163A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000163B8);
}

uint64_t sub_1000163B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_100016480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016494);
}

uint64_t sub_100016494(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Date();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100016558()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100016610()
{
  unint64_t result = qword_1000210C8;
  if (!qword_1000210C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210C8);
  }
  return result;
}

unint64_t sub_100016664()
{
  unint64_t result = qword_1000210D0;
  if (!qword_1000210D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210D0);
  }
  return result;
}

unint64_t sub_1000166B8()
{
  unint64_t result = qword_1000210D8;
  if (!qword_1000210D8)
  {
    type metadata accessor for Date();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210D8);
  }
  return result;
}

unint64_t sub_100016704()
{
  unint64_t result = qword_1000210E0;
  if (!qword_1000210E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CallbackBody.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CallbackBody.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000168B4);
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

ValueMetadata *type metadata accessor for CallbackBody.CodingKeys()
{
  return &type metadata for CallbackBody.CodingKeys;
}

void *initializeBufferWithCopyOfBuffer for CallbackBody.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CallbackBody.Error()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for CallbackBody.Error(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CallbackBody.Error(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for CallbackBody.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CallbackBody.Error(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CallbackBody.Error(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CallbackBody.Error()
{
  return &type metadata for CallbackBody.Error;
}

unsigned char *sub_100016A44(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UserAction()
{
  return &type metadata for UserAction;
}

unint64_t sub_100016A64()
{
  unint64_t result = qword_1000210E8;
  if (!qword_1000210E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210E8);
  }
  return result;
}

unint64_t sub_100016ABC()
{
  unint64_t result = qword_1000210F0;
  if (!qword_1000210F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210F0);
  }
  return result;
}

unint64_t sub_100016B14()
{
  unint64_t result = qword_1000210F8;
  if (!qword_1000210F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210F8);
  }
  return result;
}

unint64_t sub_100016B6C()
{
  unint64_t result = qword_100021100;
  if (!qword_100021100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021100);
  }
  return result;
}

unint64_t sub_100016BC0()
{
  unint64_t result = qword_100021108;
  if (!qword_100021108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021108);
  }
  return result;
}

unint64_t sub_100016C14()
{
  unint64_t result = qword_100021118;
  if (!qword_100021118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021118);
  }
  return result;
}

unint64_t sub_100016C68()
{
  unint64_t result = qword_100021120;
  if (!qword_100021120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021120);
  }
  return result;
}

uint64_t _s16diagnosticspushd10UserActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16diagnosticspushd10UserActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100016E18);
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

ValueMetadata *type metadata accessor for CallbackBody.Error.CodingKeys()
{
  return &type metadata for CallbackBody.Error.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CallbackBody.Error.Code(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100016EECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CallbackBody.Error.Code()
{
  return &type metadata for CallbackBody.Error.Code;
}

unint64_t sub_100016F28()
{
  unint64_t result = qword_100021128;
  if (!qword_100021128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021128);
  }
  return result;
}

unint64_t sub_100016F80()
{
  unint64_t result = qword_100021130;
  if (!qword_100021130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021130);
  }
  return result;
}

unint64_t sub_100016FD8()
{
  unint64_t result = qword_100021138;
  if (!qword_100021138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021138);
  }
  return result;
}

unint64_t sub_100017030()
{
  unint64_t result = qword_100021140;
  if (!qword_100021140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021140);
  }
  return result;
}

unint64_t sub_100017084()
{
  unint64_t result = qword_100021148;
  if (!qword_100021148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021148);
  }
  return result;
}

uint64_t URLRequest.httpMethod.setter()
{
  return URLRequest.httpMethod.setter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.allHTTPHeaderFields.setter()
{
  return URLRequest.allHTTPHeaderFields.setter();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.appending(queryItems:)()
{
  return URL.appending(queryItems:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t TapToRadarService.createDraft(_:processName:displayReason:completion:)()
{
  return TapToRadarService.createDraft(_:processName:displayReason:completion:)();
}

uint64_t static TapToRadarService.shared.getter()
{
  return static TapToRadarService.shared.getter();
}

uint64_t type metadata accessor for TapToRadarService()
{
  return type metadata accessor for TapToRadarService();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
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

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
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

uint64_t Dictionary.debugDescription.getter()
{
  return Dictionary.debugDescription.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
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

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
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

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
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

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
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

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t MobileGestalt_copy_serialNumber_obj()
{
  return _MobileGestalt_copy_serialNumber_obj();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return _MobileGestalt_get_internalBuild();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

{
}

{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
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

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}