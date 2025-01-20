uint64_t sub_100004834()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  v1 = [v0 type];
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;
  if (v2 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v4 == v5) {
    goto LABEL_14;
  }
  v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_15:

    return 1;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v11)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_15;
  }
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  if (v14 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v16 == v17)
  {

    swift_bridgeObjectRelease_n();
    return 1;
  }
  v19 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19 & 1;
}

uint64_t sub_1000049C8()
{
  uint64_t v1 = v0;
  sub_10000BBD0(&qword_1000290F0);
  __chkstk_darwin();
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_10000D4F4((uint64_t)v3, &qword_1000290F0);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_100029100;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100004C0C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000D650;
  return sub_100004C9C();
}

uint64_t sub_100004C9C()
{
  v1[98] = v0;
  sub_10000BBD0(&qword_100029090);
  v1[99] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for UUID();
  v1[100] = v2;
  v1[101] = *(void *)(v2 - 8);
  v1[102] = swift_task_alloc();
  v1[103] = swift_task_alloc();
  v1[104] = swift_task_alloc();
  v1[105] = swift_task_alloc();
  return _swift_task_switch(sub_100004DB4, 0, 0);
}

uint64_t sub_100004DB4()
{
  uint64_t v100 = v0;
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 848) = sub_10000BC14(v1, (uint64_t)qword_10002A018);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "NotifyWhenFoundNotificationService: Handling new Notify When Found notification", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = (uint8_t *)(v0 + 784);
  uint64_t v6 = *(void *)(v0 + 784);

  id v7 = [*(id *)(v6 + 104) content];
  [v7 mutableCopy];

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10000D0AC(0, (unint64_t *)&qword_100029098);
  if (!swift_dynamicCast())
  {
    v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "NotifyWhenFoundNotificationService: No UNMutableNotificationContent", v20, 2u);
      swift_slowDealloc();
    }
    v21 = *(id **)v5;

    id v22 = [objc_allocWithZone((Class)UNMutableNotificationContent) init];
    NSString v23 = String._bridgeToObjectiveC()();
    [v22 setBody:v23];

    ((void (*)(id))v21[14])(v22);
    goto LABEL_36;
  }
  uint64_t v8 = *(void **)(v0 + 768);
  *(void *)(v0 + 856) = v8;
  id v9 = v8;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  v12 = &NotifyWhenFoundNotificationService;
  if (os_log_type_enabled(v10, v11))
  {
    id v97 = v9;
    v13 = (uint8_t *)swift_slowAlloc();
    v99[0] = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    id v14 = [v97 userInfo];
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v15 = Dictionary.description.getter();
    unint64_t v17 = v16;
    v12 = &NotifyWhenFoundNotificationService;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 752) = sub_10001B53C(v15, v17, v99);
    uint64_t v5 = (uint8_t *)(v0 + 784);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NotifyWhenFoundNotificationService: Extracting payload dictionary from: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v9 = v97;
    swift_slowDealloc();
  }
  else
  {
  }
  v24 = *(id **)v5;
  id v25 = [*(id *)(*(void *)v5 + 96) (SEL)v12[40].ivars];
  uint64_t v26 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v27 = v12;
  unint64_t v28 = sub_100007990(v26);
  swift_bridgeObjectRelease();
  if (!v28)
  {
    v29 = v27;
    id v30 = v9;
    v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v99[0] = swift_slowAlloc();
      v95 = v33;
      *(_DWORD *)v33 = 136315138;
      v98 = v24;
      id v34 = [v30 (SEL)v29[40].ivars];
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v35 = Dictionary.description.getter();
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 760) = sub_10001B53C(v35, v37, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      v24 = v98;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "NotifyWhenFoundNotificationService: Could not get payload dictionary from: %s", v95, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v46 = *(void (**)(void))(*(void *)v5 + 112);
    id v22 = v24[12];
    v46();

LABEL_36:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v90 = *(uint64_t (**)(void))(v0 + 8);
    return v90();
  }
  sub_100007D64(v0 + 80);
  v96 = v5;
  swift_bridgeObjectRelease();
  long long v38 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 312) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 328) = v38;
  long long v39 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 296) = v39;
  *(void *)(v0 + 408) = *(void *)(v0 + 240);
  long long v40 = *(_OWORD *)(v0 + 224);
  *(_OWORD *)(v0 + 376) = *(_OWORD *)(v0 + 208);
  *(_OWORD *)(v0 + 392) = v40;
  long long v41 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 344) = *(_OWORD *)(v0 + 176);
  *(_OWORD *)(v0 + 360) = v41;
  long long v42 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 248) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 264) = v42;
  if (*(void *)(v0 + 304) && (v43 = *(void **)(v0 + 288)) != 0 && v43[2])
  {
    uint64_t countAndFlagsBits = v43[4];
    object = (void *)v43[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v48 = *(void *)(*(void *)v5 + 64);
    v47 = *(void **)(*(void *)v5 + 72);
    id v49 = [self mainBundle];
    v102._object = (void *)0x8000000100020390;
    v50._uint64_t countAndFlagsBits = v48;
    v50._object = v47;
    v51.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
    v51.value._object = (void *)0xEB00000000656C62;
    v52._uint64_t countAndFlagsBits = 0;
    v52._object = (void *)0xE000000000000000;
    v102._uint64_t countAndFlagsBits = 0xD000000000000018;
    Swift::String v53 = NSLocalizedString(_:tableName:bundle:value:comment:)(v50, v51, (NSBundle)v49, v52, v102);
    uint64_t countAndFlagsBits = v53._countAndFlagsBits;
    object = v53._object;
  }
  *(void *)(v0 + 872) = object;
  *(void *)(v0 + 864) = countAndFlagsBits;
  uint64_t v54 = *(void *)(v0 + 784);
  uint64_t v55 = *(void *)(v54 + 48);
  *(void *)(v0 + 880) = v55;
  v56 = *(void **)(v54 + 56);
  *(void *)(v0 + 888) = v56;
  v57 = self;
  *(void *)(v0 + 896) = v57;
  id v58 = [v57 mainBundle];
  v103._object = (void *)0x8000000100020390;
  v59._uint64_t countAndFlagsBits = v55;
  v59._object = v56;
  v60.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v60.value._object = (void *)0xEB00000000656C62;
  v61._uint64_t countAndFlagsBits = 0;
  v61._object = (void *)0xE000000000000000;
  v103._uint64_t countAndFlagsBits = 0xD000000000000018;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v59, v60, (NSBundle)v58, v61, v103);

  *(void *)(v0 + 904) = sub_10000BBD0(&qword_1000290A0);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_10001F930;
  *(void *)(v62 + 56) = &type metadata for String;
  unint64_t v63 = sub_10000BE94();
  *(void *)(v0 + 912) = v63;
  *(void *)(v62 + 64) = v63;
  *(void *)(v62 + 32) = countAndFlagsBits;
  *(void *)(v62 + 40) = object;
  swift_bridgeObjectRetain();
  String.init(format:_:)();
  swift_bridgeObjectRelease();
  NSString v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setBody:v64];

  v65 = v9;
  v66 = Logger.logObject.getter();
  os_log_type_t v67 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v66, v67))
  {
    v68 = (uint8_t *)swift_slowAlloc();
    v94 = (void *)swift_slowAlloc();
    *(_DWORD *)v68 = 138412290;
    *(void *)(v0 + 776) = v65;
    v69 = v65;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v94 = v65;

    _os_log_impl((void *)&_mh_execute_header, v66, v67, "NotifyWhenFoundNotificationService: Content after updating with fallback data: %@.", v68, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    v66 = v65;
  }

  id v70 = v24[12];
  v24[12] = v65;
  v71 = v65;

  v72 = v96;
  if (!*(void *)(v0 + 408))
  {
    swift_bridgeObjectRelease();
    sub_10000BEE8((uint64_t *)(v0 + 248));
    goto LABEL_30;
  }
  uint64_t v73 = *(void *)(v0 + 808);
  uint64_t v74 = *(void *)(v0 + 800);
  uint64_t v75 = *(void *)(v0 + 792);
  swift_bridgeObjectRetain();
  sub_10000BEE8((uint64_t *)(v0 + 248));
  UUID.init(uuidString:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v75, 1, v74) == 1)
  {
    uint64_t v76 = *(void *)(v0 + 792);
    swift_bridgeObjectRelease();
    sub_10000D4F4(v76, &qword_100029090);
LABEL_30:
    v77 = Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v79 = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "NotifyWhenFoundNotificationService: No subscription identifier. Nothing else to do.", v79, 2u);
      swift_slowDealloc();
    }

    swift_retain_n();
    v80 = Logger.logObject.getter();
    os_log_type_t v81 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      v99[0] = swift_slowAlloc();
      *(_DWORD *)v82 = 136315138;
      id v83 = [v24[12] body];
      v84 = v24;
      uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v87 = v86;

      uint64_t v88 = v85;
      v24 = v84;
      *(void *)(v0 + 744) = sub_10001B53C(v88, v87, v99);
      v72 = v96;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "NotifyWhenFoundNotificationService: Completing with fallback data from server %s", v82, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    v89 = *(void (**)(void))(*(void *)v72 + 112);
    id v22 = v24[12];
    v89();

    goto LABEL_36;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 808) + 32))(*(void *)(v0 + 840), *(void *)(v0 + 792), *(void *)(v0 + 800));
  v92 = (void *)swift_task_alloc();
  *(void *)(v0 + 920) = v92;
  void *v92 = v0;
  v92[1] = sub_100005BD0;
  uint64_t v93 = *(void *)(v0 + 840);
  return sub_100008BAC(v93);
}

uint64_t sub_100005BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 928) = a1;
  *(void *)(v3 + 936) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100005CD4, 0, 0);
}

uint64_t sub_100005CD4()
{
  uint64_t v1 = *(void **)(v0 + 928);
  if (v1)
  {
    *(void *)(v0 + 944) = swift_allocObject();
    swift_weakInit();
    if (sub_100004834())
    {
      uint64_t v2 = *(void *)(v0 + 832);
      uint64_t v3 = *(void *)(v0 + 808);
      uint64_t v4 = *(void *)(v0 + 800);
      uint64_t v5 = *(void **)(*(void *)(v0 + 784) + 88);
      *(void *)(v0 + 952) = v5;
      id v6 = v5;
      id v7 = [v1 identifier];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      *(void *)(v0 + 960) = isa;
      id v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      *(void *)(v0 + 968) = v9;
      *(void *)(v0 + 976) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v9(v2, v4);
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 1048;
      *(void *)(v0 + 24) = sub_1000066DC;
      uint64_t v10 = swift_continuation_init();
      *(void *)(v0 + 456) = _NSConcreteStackBlock;
      *(void *)(v0 + 464) = 0x40000000;
      *(void *)(v0 + 472) = sub_100008B88;
      *(void *)(v0 + 480) = &unk_100024E08;
      *(void *)(v0 + 488) = v10;
      [v6 postedLocalNotifyWhenFoundNotificationForUUID:isa completion:v0 + 456];
      return _swift_continuation_await(v0 + 16);
    }
    else
    {
      uint64_t v81 = *(void *)(v0 + 936);
      os_log_type_t v19 = *(void **)(v0 + 928);
      id v78 = *(id *)(v0 + 856);
      uint64_t v20 = *(void *)(v0 + 832);
      uint64_t v21 = *(void *)(v0 + 824);
      uint64_t v22 = *(void *)(v0 + 808);
      uint64_t v23 = *(void *)(v0 + 800);
      uint64_t v79 = v23;
      id v24 = [v19 identifier];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      UUID.uuidString.getter();
      id v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      *(void *)(v0 + 984) = v25;
      *(void *)(v0 + 992) = (v22 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v25(v20, v23);
      NSString v26 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v78 setTargetContentIdentifier:v26];

      *(void *)(v0 + 696) = 0xD000000000000010;
      *(void *)(v0 + 704) = 0x80000001000200A0;
      AnyHashable.init<A>(_:)();
      id v27 = [v19 identifier];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v28 = UUID.uuidString.getter();
      uint64_t v30 = v29;
      v80 = v25;
      v25(v21, v79);
      *(void *)(v0 + 592) = &type metadata for String;
      *(void *)(v0 + 568) = v28;
      *(void *)(v0 + 576) = v30;
      id v31 = [v78 userInfo];
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000D09C((_OWORD *)(v0 + 568), (_OWORD *)(v0 + 664));
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1000142F8((_OWORD *)(v0 + 664), v0 + 416, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_10000C018(v0 + 416);
      Class v33 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v78 setUserInfo:v33];

      if (v81)
      {
        id v34 = *(id *)(v0 + 936);
        id v35 = [v34 beaconMap];
        sub_10000D0AC(0, &qword_1000290B8);
        uint64_t v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v37 = *(void *)(v36 + 16);
        swift_bridgeObjectRelease();
        if (v37 >= 2)
        {
          long long v38 = *(void **)(v0 + 856);
          uint64_t v39 = *(void *)(v0 + 816);
          uint64_t v40 = *(void *)(v0 + 800);
          *(void *)(v0 + 712) = 0x65644970756F7267;
          *(void *)(v0 + 720) = 0xEF7265696669746ELL;
          AnyHashable.init<A>(_:)();
          id v41 = [v34 identifier];
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v42 = UUID.uuidString.getter();
          uint64_t v44 = v43;
          v80(v39, v40);
          *(void *)(v0 + 656) = &type metadata for String;
          *(void *)(v0 + 632) = v42;
          *(void *)(v0 + 640) = v44;
          id v45 = [v38 userInfo];
          static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          sub_10000D09C((_OWORD *)(v0 + 632), (_OWORD *)(v0 + 600));
          char v46 = swift_isUniquelyReferenced_nonNull_native();
          sub_1000142F8((_OWORD *)(v0 + 600), v0 + 496, v46);
          swift_bridgeObjectRelease();
          sub_10000C018(v0 + 496);
          Class v47 = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v38 setUserInfo:v47];
        }
      }
      uint64_t v48 = sub_10000C1A0(*(void **)(v0 + 928), *(void **)(v0 + 936), *(void *)(v0 + 864), *(void *)(v0 + 872));
      uint64_t v50 = v49;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 1000) = v48;
      *(void *)(v0 + 1008) = v50;
      if (sub_100004834())
      {
        Swift::String_optional v51 = *(void **)(v0 + 856);
        NSString v52 = String._bridgeToObjectiveC()();
        [v51 setTitle:v52];
      }
      uint64_t v53 = *(void *)(v0 + 912);
      uint64_t v54 = *(void **)(v0 + 888);
      uint64_t v55 = *(void *)(v0 + 880);
      v56 = *(void **)(v0 + 856);
      id v57 = [*(id *)(v0 + 896) mainBundle];
      v83._uint64_t countAndFlagsBits = 0xD000000000000018;
      v83._object = (void *)0x8000000100020390;
      v58._uint64_t countAndFlagsBits = v55;
      v58._object = v54;
      v59.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
      v59.value._object = (void *)0xEB00000000656C62;
      v60._uint64_t countAndFlagsBits = 0;
      v60._object = (void *)0xE000000000000000;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v58, v59, (NSBundle)v57, v60, v83);

      uint64_t v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_10001F930;
      *(void *)(v61 + 56) = &type metadata for String;
      *(void *)(v61 + 64) = v53;
      *(void *)(v61 + 32) = v48;
      *(void *)(v61 + 40) = v50;
      swift_bridgeObjectRetain();
      String.init(format:_:)();
      swift_bridgeObjectRelease();
      NSString v62 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v56 setBody:v62];

      id v63 = v56;
      NSString v64 = Logger.logObject.getter();
      os_log_type_t v65 = static os_log_type_t.default.getter();
      BOOL v66 = os_log_type_enabled(v64, v65);
      os_log_type_t v67 = *(void **)(v0 + 856);
      if (v66)
      {
        v68 = (uint8_t *)swift_slowAlloc();
        v69 = (void *)swift_slowAlloc();
        *(_DWORD *)v68 = 138412290;
        *(void *)(v0 + 728) = v67;
        id v70 = v67;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v69 = v67;

        _os_log_impl((void *)&_mh_execute_header, v64, v65, "NotifyWhenFoundNotificationService: Content after updating with beacon data: %@.", v68, 0xCu);
        sub_10000BBD0(&qword_100029058);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        v71 = *(NSObject **)(v0 + 856);
      }
      else
      {

        v71 = *(NSObject **)(v0 + 856);
        NSString v64 = v71;
      }
      uint64_t v72 = *(void *)(v0 + 928);
      uint64_t v73 = *(void *)(v0 + 784);

      uint64_t v74 = *(void **)(v73 + 96);
      *(void *)(v73 + 96) = v71;
      uint64_t v75 = v71;

      uint64_t v76 = (void *)swift_task_alloc();
      *(void *)(v0 + 1016) = v76;
      *uint64_t v76 = v0;
      v76[1] = sub_1000070DC;
      return sub_1000098D0(v72);
    }
  }
  else
  {
    os_log_type_t v11 = *(void **)(v0 + 856);
    uint64_t v12 = *(void *)(v0 + 840);
    uint64_t v13 = *(void *)(v0 + 808);
    uint64_t v14 = *(void *)(v0 + 800);
    uint64_t v15 = *(void *)(v0 + 784);
    swift_bridgeObjectRelease();
    unint64_t v16 = *(void (**)(void))(v15 + 112);
    id v17 = *(id *)(v15 + 96);
    v16();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

uint64_t sub_1000066DC()
{
  return _swift_task_switch(sub_1000067BC, 0, 0);
}

uint64_t sub_1000067BC()
{
  uint64_t v1 = *(void **)(v0 + 952);
  int v2 = *(unsigned __int8 *)(v0 + 1048);

  if (v2 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "NotifyWhenFoundNotificationService: Local notification was already posted, returning empty content.", v5, 2u);
      swift_slowDealloc();
    }
    id v6 = *(void (**)(uint64_t, uint64_t))(v0 + 968);
    uint64_t v7 = *(void *)(v0 + 944);
    uint64_t v8 = *(void **)(v0 + 936);
    id v9 = *(void **)(v0 + 928);
    uint64_t v10 = *(void **)(v0 + 856);
    uint64_t v11 = *(void *)(v0 + 840);
    uint64_t v12 = *(void *)(v0 + 800);

    id v13 = [objc_allocWithZone((Class)UNMutableNotificationContent) init];
    sub_100008278(v13, v9, v7);

    swift_release();
    v6(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
  else
  {
    uint64_t v77 = *(void *)(v0 + 936);
    unint64_t v16 = *(void **)(v0 + 928);
    uint64_t v17 = *(void *)(v0 + 832);
    uint64_t v18 = *(void *)(v0 + 824);
    uint64_t v19 = *(void *)(v0 + 808);
    uint64_t v20 = *(void *)(v0 + 800);
    id v74 = *(id *)(v0 + 856);
    uint64_t v75 = v20;
    id v21 = [v16 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    UUID.uuidString.getter();
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    *(void *)(v0 + 984) = v22;
    *(void *)(v0 + 992) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v22(v17, v20);
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v74 setTargetContentIdentifier:v23];

    *(void *)(v0 + 696) = 0xD000000000000010;
    *(void *)(v0 + 704) = 0x80000001000200A0;
    AnyHashable.init<A>(_:)();
    id v24 = [v16 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v25 = UUID.uuidString.getter();
    uint64_t v27 = v26;
    uint64_t v76 = v22;
    v22(v18, v75);
    *(void *)(v0 + 592) = &type metadata for String;
    *(void *)(v0 + 568) = v25;
    *(void *)(v0 + 576) = v27;
    id v28 = [v74 userInfo];
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000D09C((_OWORD *)(v0 + 568), (_OWORD *)(v0 + 664));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1000142F8((_OWORD *)(v0 + 664), v0 + 416, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_10000C018(v0 + 416);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v74 setUserInfo:isa];

    if (v77)
    {
      id v31 = *(id *)(v0 + 936);
      id v32 = [v31 beaconMap];
      sub_10000D0AC(0, &qword_1000290B8);
      uint64_t v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v34 = *(void *)(v33 + 16);
      swift_bridgeObjectRelease();
      if (v34 >= 2)
      {
        id v35 = *(void **)(v0 + 856);
        uint64_t v36 = *(void *)(v0 + 816);
        uint64_t v37 = *(void *)(v0 + 800);
        *(void *)(v0 + 712) = 0x65644970756F7267;
        *(void *)(v0 + 720) = 0xEF7265696669746ELL;
        AnyHashable.init<A>(_:)();
        id v38 = [v31 identifier];
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v39 = UUID.uuidString.getter();
        uint64_t v41 = v40;
        v76(v36, v37);
        *(void *)(v0 + 656) = &type metadata for String;
        *(void *)(v0 + 632) = v39;
        *(void *)(v0 + 640) = v41;
        id v42 = [v35 userInfo];
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        sub_10000D09C((_OWORD *)(v0 + 632), (_OWORD *)(v0 + 600));
        char v43 = swift_isUniquelyReferenced_nonNull_native();
        sub_1000142F8((_OWORD *)(v0 + 600), v0 + 496, v43);
        swift_bridgeObjectRelease();
        sub_10000C018(v0 + 496);
        Class v44 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v35 setUserInfo:v44];
      }
    }
    uint64_t v45 = sub_10000C1A0(*(void **)(v0 + 928), *(void **)(v0 + 936), *(void *)(v0 + 864), *(void *)(v0 + 872));
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1000) = v45;
    *(void *)(v0 + 1008) = v47;
    if (sub_100004834())
    {
      uint64_t v48 = *(void **)(v0 + 856);
      NSString v49 = String._bridgeToObjectiveC()();
      [v48 setTitle:v49];
    }
    uint64_t v50 = *(void *)(v0 + 912);
    Swift::String_optional v51 = *(void **)(v0 + 888);
    uint64_t v52 = *(void *)(v0 + 880);
    uint64_t v53 = *(void **)(v0 + 856);
    id v54 = [*(id *)(v0 + 896) mainBundle];
    v79._uint64_t countAndFlagsBits = 0xD000000000000018;
    v79._object = (void *)0x8000000100020390;
    v55._uint64_t countAndFlagsBits = v52;
    v55._object = v51;
    v56.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
    v56.value._object = (void *)0xEB00000000656C62;
    v57._uint64_t countAndFlagsBits = 0;
    v57._object = (void *)0xE000000000000000;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v55, v56, (NSBundle)v54, v57, v79);

    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_10001F930;
    *(void *)(v58 + 56) = &type metadata for String;
    *(void *)(v58 + 64) = v50;
    *(void *)(v58 + 32) = v45;
    *(void *)(v58 + 40) = v47;
    swift_bridgeObjectRetain();
    String.init(format:_:)();
    swift_bridgeObjectRelease();
    NSString v59 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v53 setBody:v59];

    id v60 = v53;
    uint64_t v61 = Logger.logObject.getter();
    os_log_type_t v62 = static os_log_type_t.default.getter();
    BOOL v63 = os_log_type_enabled(v61, v62);
    NSString v64 = *(void **)(v0 + 856);
    if (v63)
    {
      os_log_type_t v65 = (uint8_t *)swift_slowAlloc();
      BOOL v66 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v65 = 138412290;
      *(void *)(v0 + 728) = v64;
      id v67 = v64;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v66 = v64;

      _os_log_impl((void *)&_mh_execute_header, v61, v62, "NotifyWhenFoundNotificationService: Content after updating with beacon data: %@.", v65, 0xCu);
      sub_10000BBD0(&qword_100029058);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      v68 = *(NSObject **)(v0 + 856);
    }
    else
    {

      v68 = *(NSObject **)(v0 + 856);
      uint64_t v61 = v68;
    }
    uint64_t v69 = *(void *)(v0 + 928);
    uint64_t v70 = *(void *)(v0 + 784);

    v71 = *(void **)(v70 + 96);
    *(void *)(v70 + 96) = v68;
    uint64_t v72 = v68;

    uint64_t v73 = (void *)swift_task_alloc();
    *(void *)(v0 + 1016) = v73;
    *uint64_t v73 = v0;
    v73[1] = sub_1000070DC;
    return sub_1000098D0(v69);
  }
}

uint64_t sub_1000070DC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1024) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000071DC, 0, 0);
}

uint64_t sub_1000071DC()
{
  uint64_t v1 = v0[128];
  if (v1)
  {
    int v2 = (void *)swift_task_alloc();
    v0[129] = v2;
    *int v2 = v0;
    v2[1] = sub_10000738C;
    v2[16] = v1;
    return _swift_task_switch(sub_10000C738, 0, 0);
  }
  else
  {
    uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[123];
    uint64_t v4 = v0[118];
    uint64_t v5 = (void *)v0[117];
    id v6 = (void *)v0[116];
    uint64_t v7 = (void *)v0[107];
    uint64_t v8 = v0[105];
    uint64_t v9 = v0[100];
    uint64_t v10 = v0[98];
    swift_bridgeObjectRelease();
    id v11 = *(id *)(v10 + 96);
    sub_100008278(v11, v6, v4);

    swift_release();
    v3(v8, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_10000738C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1040) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000748C, 0, 0);
}

uint64_t sub_10000748C()
{
  uint64_t v1 = *(void **)(v0 + 1040);
  if (v1)
  {
    id v2 = [*(id *)(v0 + 1040) name];
    if (v2)
    {
      uint64_t v3 = v2;
      os_log_type_t v62 = v1;
      uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v6 = v5;

      char v7 = sub_100004834();
      uint64_t v8 = *(void *)(v0 + 1008);
      if (v7)
      {
        uint64_t v9 = *(void *)(v0 + 912);
        uint64_t v10 = *(void **)(v0 + 896);
        uint64_t v11 = *(void *)(v0 + 784);
        swift_bridgeObjectRelease();
        uint64_t v12 = *(void *)(v11 + 16);
        id v13 = *(void **)(v11 + 24);
        id v14 = [v10 mainBundle];
        v64._object = (void *)0x8000000100020390;
        v15._uint64_t countAndFlagsBits = v12;
        v15._object = v13;
        v16.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
        v16.value._object = (void *)0xEB00000000656C62;
        v17._uint64_t countAndFlagsBits = 0;
        v17._object = (void *)0xE000000000000000;
        v64._uint64_t countAndFlagsBits = 0xD000000000000018;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v15, v16, (NSBundle)v14, v17, v64);

        uint64_t v18 = swift_allocObject();
        *(_OWORD *)(v18 + 16) = xmmword_10001F930;
        *(void *)(v18 + 56) = &type metadata for String;
        *(void *)(v18 + 64) = v9;
        *(void *)(v18 + 32) = v4;
        *(void *)(v18 + 40) = v6;
      }
      else
      {
        uint64_t v28 = *(void *)(v0 + 1000);
        uint64_t v29 = *(void *)(v0 + 912);
        uint64_t v30 = *(void *)(v0 + 784);
        uint64_t v31 = *(void *)(v30 + 32);
        id v32 = *(void **)(v30 + 40);
        id v33 = [*(id *)(v0 + 896) mainBundle];
        v65._object = (void *)0x8000000100020390;
        v34._uint64_t countAndFlagsBits = v31;
        v34._object = v32;
        v35.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
        v35.value._object = (void *)0xEB00000000656C62;
        v36._uint64_t countAndFlagsBits = 0;
        v36._object = (void *)0xE000000000000000;
        v65._uint64_t countAndFlagsBits = 0xD000000000000018;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v34, v35, (NSBundle)v33, v36, v65);

        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = xmmword_10001F940;
        *(void *)(v37 + 56) = &type metadata for String;
        *(void *)(v37 + 64) = v29;
        *(void *)(v37 + 32) = v28;
        *(void *)(v37 + 40) = v8;
        *(void *)(v37 + 96) = &type metadata for String;
        *(void *)(v37 + 104) = v29;
        *(void *)(v37 + 72) = v4;
        *(void *)(v37 + 80) = v6;
      }
      String.init(format:_:)();
      swift_bridgeObjectRelease();
      NSString v38 = String._bridgeToObjectiveC()();
      uint64_t v39 = *(void **)(v0 + 856);
      swift_bridgeObjectRelease();
      [v39 setBody:v38];

      id v40 = v39;
      uint64_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.default.getter();
      BOOL v43 = os_log_type_enabled(v41, v42);
      Class v44 = *(void **)(v0 + 856);
      if (v43)
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 138412290;
        *(void *)(v0 + 736) = v44;
        id v47 = v44;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v46 = v44;

        _os_log_impl((void *)&_mh_execute_header, v41, v42, "NotifyWhenFoundNotificationService: Content after updating with location data: %@.", v45, 0xCu);
        sub_10000BBD0(&qword_100029058);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        uint64_t v48 = *(NSObject **)(v0 + 856);
      }
      else
      {

        uint64_t v48 = *(NSObject **)(v0 + 856);
        uint64_t v41 = v48;
      }
      NSString v49 = *(void **)(v0 + 1024);
      uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v0 + 984);
      uint64_t v50 = *(void *)(v0 + 944);
      Swift::String_optional v51 = *(void **)(v0 + 936);
      uint64_t v52 = *(void **)(v0 + 928);
      uint64_t v60 = *(void *)(v0 + 840);
      uint64_t v53 = *(void *)(v0 + 800);
      uint64_t v54 = *(void *)(v0 + 784);

      Swift::String v55 = *(void **)(v54 + 96);
      *(void *)(v54 + 96) = v48;
      Swift::String_optional v56 = v48;

      id v57 = *(id *)(v54 + 96);
      sub_100008278(v57, v52, v50);

      swift_release();
      v61(v60, v53);
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v1 = *(void **)(v0 + 1024);
  }

  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 984);
  uint64_t v20 = *(void *)(v0 + 944);
  id v21 = *(void **)(v0 + 936);
  uint64_t v22 = *(void **)(v0 + 928);
  NSString v23 = *(void **)(v0 + 856);
  uint64_t v24 = *(void *)(v0 + 840);
  uint64_t v25 = *(void *)(v0 + 800);
  uint64_t v26 = *(void *)(v0 + 784);
  swift_bridgeObjectRelease();
  id v27 = *(id *)(v26 + 96);
  sub_100008278(v27, v22, v20);

  swift_release();
  v19(v24, v25);
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v58 = *(uint64_t (**)(void))(v0 + 8);
  return v58();
}

unint64_t sub_100007990(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000BBD0(&qword_1000290E0);
    id v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_10000D294();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_10000D1DC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_10000D238(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_10000D1DC((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_10000D4F4((uint64_t)v30, &qword_1000290E8);
      swift_bridgeObjectRelease();
      sub_10000D294();
      swift_release();
      return 0;
    }
    sub_10000D238((uint64_t)v31 + 8, (uint64_t)v25);
    sub_10000D4F4((uint64_t)v30, &qword_1000290E8);
    sub_10000D09C(v25, v26);
    long long v27 = v24;
    sub_10000D09C(v26, v28);
    long long v16 = v27;
    sub_10000D09C(v28, v29);
    sub_10000D09C(v29, &v27);
    unint64_t result = sub_10001BD38(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v16;
      uint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      sub_10000D29C((uint64_t)v9);
      unint64_t result = (unint64_t)sub_10000D09C(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_10000D09C(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_100007D64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(void *)&v30[0] = 0;
  id v5 = [v3 dataWithJSONObject:isa options:0 error:v30];

  id v6 = *(id *)&v30[0];
  int64_t v7 = &NotifyWhenFoundNotificationService;
  if (v5)
  {
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    sub_10000D130();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    if (!v1)
    {
      sub_10000D184(v8, v10);
      uint64_t result = swift_release();
      long long v19 = v30[9];
      *(_OWORD *)(a1 + 128) = v30[8];
      *(_OWORD *)(a1 + 144) = v19;
      *(void *)(a1 + 160) = v31;
      long long v20 = v30[5];
      *(_OWORD *)(a1 + 64) = v30[4];
      *(_OWORD *)(a1 + 80) = v20;
      long long v21 = v30[7];
      *(_OWORD *)(a1 + 96) = v30[6];
      *(_OWORD *)(a1 + 112) = v21;
      long long v22 = v30[1];
      *(_OWORD *)a1 = v30[0];
      *(_OWORD *)(a1 + 16) = v22;
      long long v23 = v30[3];
      *(_OWORD *)(a1 + 32) = v30[2];
      *(_OWORD *)(a1 + 48) = v23;
      return result;
    }
    swift_release();
    if (qword_100028EB8 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_10000BC14(v11, (uint64_t)qword_10002A018);
    swift_errorRetain();
    swift_errorRetain();
    int64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(void *)&v30[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v14 = 136315138;
      swift_errorRetain();
      sub_10000BBD0(&qword_1000290C0);
      uint64_t v15 = String.init<A>(describing:)();
      sub_10001B53C(v15, v16, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Excption decoding data - %s", v14, 0xCu);
      swift_arrayDestroy();
      int64_t v7 = &NotifyWhenFoundNotificationService;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_willThrow();
    sub_10000D184(v8, v10);
  }
  else
  {
    unint64_t v17 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  swift_errorRetain();
  if (v7[52].name != (char *)-1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  sub_10000BC14(v24, (uint64_t)qword_10002A018);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    long long v27 = (uint8_t *)swift_slowAlloc();
    *(void *)&v30[0] = swift_slowAlloc();
    *(_DWORD *)long long v27 = 136315138;
    swift_errorRetain();
    sub_10000BBD0(&qword_1000290C0);
    uint64_t v28 = String.init<A>(describing:)();
    sub_10001B53C(v28, v29, (uint64_t *)v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Excption serializing data - %s", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  return swift_errorRelease();
}

void sub_100008278(void *a1, void *a2, uint64_t a3)
{
  Swift::String v36 = a1;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v37 = v6;
  uint64_t v9 = type metadata accessor for Logger();
  sub_10000BC14(v9, (uint64_t)qword_10002A018);
  id v10 = a2;
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  os_log_type_t v13 = &NotifyWhenFoundNotificationService;
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    aBlock[0] = v34;
    uint64_t v35 = a3;
    *(_DWORD *)unint64_t v14 = 136315138;
    v32[1] = v14 + 4;
    id v15 = [v10 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000BE50(&qword_100029088);
    uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v33 = v5;
    unint64_t v18 = v17;
    uint64_t v19 = v37;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v5);
    uint64_t v20 = v16;
    os_log_type_t v13 = &NotifyWhenFoundNotificationService;
    aBlock[6] = sub_10001B53C(v20, v18, aBlock);
    a3 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "NotifyWhenFoundNotificationService: Disabling NWF on beacon: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v21 = v33;
  }
  else
  {

    uint64_t v21 = v5;
    uint64_t v19 = v37;
  }
  long long v22 = self;
  id v23 = [v10 v13[38].base_prots];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v21);
  id v25 = [v22 disableNotifyWhenFound:isa];

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v27 = *(id *)(Strong + 80);
    swift_release();
    uint64_t v28 = swift_allocObject();
    unint64_t v29 = v36;
    *(void *)(v28 + 16) = v36;
    *(void *)(v28 + 24) = a3;
    aBlock[4] = (uint64_t)sub_10000D128;
    aBlock[5] = v28;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100008B1C;
    aBlock[3] = (uint64_t)&unk_100024E60;
    uint64_t v30 = _Block_copy(aBlock);
    id v31 = v29;
    swift_retain();
    swift_release();
    [v27 executeCommand:v25 completion:v30];

    _Block_release(v30);
    id v25 = v27;
  }
}

uint64_t sub_1000086D0(uint64_t a1, void *a2)
{
  uint64_t v3 = &NotifyWhenFoundNotificationService;
  if (a1)
  {
    swift_errorRetain();
    if (qword_100028EB8 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_10000BC14(v4, (uint64_t)qword_10002A018);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      long long v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_errorRetain();
      sub_10000BBD0(&qword_1000290C0);
      uint64_t v8 = String.init<A>(describing:)();
      sub_10001B53C(v8, v9, (uint64_t *)&v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "NotifyWhenFoundNotificationService: Disabling NWF completed with error - %s", v7, 0xCu);
      swift_arrayDestroy();
      uint64_t v3 = &NotifyWhenFoundNotificationService;
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      goto LABEL_12;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100028EB8 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_10000BC14(v10, (uint64_t)qword_10002A018);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v11))
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v11, "NotifyWhenFoundNotificationService: Disabling NWF completed successfully", v12, 2u);
      swift_slowDealloc();
    }
  }

LABEL_12:
  if (v3[52].name != (char *)-1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_10000BC14(v13, (uint64_t)qword_10002A018);
  unint64_t v14 = a2;
  id v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    unint64_t v18 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 138412290;
    long long v22 = v14;
    uint64_t v19 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v18 = v14;

    _os_log_impl((void *)&_mh_execute_header, v15, v16, "NotifyWhenFoundNotificationService: Showing final alert: %@", v17, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v15 = v14;
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v21 = *(void (**))(result + 112);
    swift_retain();
    swift_release();
    v21(v14);
    return swift_release();
  }
  return result;
}

void sub_100008B1C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100008B88(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_100008BAC(uint64_t a1)
{
  v2[24] = a1;
  v2[25] = v1;
  uint64_t v3 = type metadata accessor for UUID();
  v2[26] = v3;
  v2[27] = *(void *)(v3 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  return _swift_task_switch(sub_100008CA0, 0, 0);
}

uint64_t sub_100008CA0()
{
  id v23 = v0;
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  uint64_t v5 = type metadata accessor for Logger();
  v0[33] = sub_10000BC14(v5, (uint64_t)qword_10002A018);
  os_log_type_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[34] = v6;
  v0[35] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v1, v3);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[32];
  uint64_t v11 = v0[26];
  uint64_t v12 = v0[27];
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_10000BE50(&qword_100029088);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[23] = sub_10001B53C(v14, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_type_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v10, v11);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "NotifyWhenFoundNotificationService: Looking for beacon matching subscription: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    os_log_type_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v0[32], v0[26]);
  }

  v0[36] = v16;
  unint64_t v17 = *(void **)(v0[25] + 88);
  v0[37] = v17;
  id v18 = v17;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  v0[38] = isa;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100008FBC;
  uint64_t v20 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100009874;
  v0[13] = &unk_100024DC8;
  v0[14] = v20;
  [v18 notificationBeaconForSubscriptionId:isa completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100008FBC()
{
  return _swift_task_switch(sub_10000909C, 0, 0);
}

uint64_t sub_10000909C()
{
  uint64_t v67 = v0;
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = *(void **)(v0 + 120);
  uint64_t v3 = *(void **)(v0 + 128);

  uint64_t v4 = *(void (**)(void, uint64_t, uint64_t))(v0 + 272);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 192);
  if (!v2)
  {
    v4(*(void *)(v0 + 224), v6, v5);
    id v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    BOOL v42 = os_log_type_enabled(v40, v41);
    BOOL v43 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    uint64_t v44 = *(void *)(v0 + 224);
    uint64_t v45 = *(void *)(v0 + 208);
    if (v42)
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315138;
      sub_10000BE50(&qword_100029088);
      uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 136) = sub_10001B53C(v47, v48, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v43(v44, v45);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "NotifyWhenFoundNotificationService: No beacon found for subscription uuid - %s.", v46, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v43(v44, v45);
    }
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  v4(*(void *)(v0 + 248), v6, v5);
  id v7 = v2;
  os_log_type_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  uint64_t v60 = *(void *)(v0 + 248);
  if (v10)
  {
    os_log_type_t type = v9;
    uint64_t v12 = *(void *)(v0 + 240);
    uint64_t v13 = *(void *)(v0 + 208);
    Swift::String v64 = v2;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315650;
    log = v8;
    id v15 = [v7 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000BE50(&qword_100029088);
    uint64_t v54 = v11;
    uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
    os_log_type_t v62 = v3;
    unint64_t v18 = v17;
    v11(v12, v13);
    *(void *)(v0 + 160) = sub_10001B53C(v16, v18, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v14 + 12) = 2080;
    id v19 = [v7 type];
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    *(void *)(v0 + 168) = sub_10001B53C(v20, v22, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v3 = v62;
    swift_bridgeObjectRelease();

    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 176) = sub_10001B53C(v23, v24, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v54(v60, v13);
    _os_log_impl((void *)&_mh_execute_header, log, type, "NotifyWhenFoundNotificationService: Found beacon %s of type %s for subscription: %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v64;
    swift_slowDealloc();

    if (v62) {
      goto LABEL_4;
    }
LABEL_9:

    goto LABEL_13;
  }
  uint64_t v49 = *(void *)(v0 + 208);

  v11(v60, v49);
  if (!v3) {
    goto LABEL_9;
  }
LABEL_4:
  (*(void (**)(void, void, void))(v0 + 272))(*(void *)(v0 + 232), *(void *)(v0 + 192), *(void *)(v0 + 208));
  id v25 = v3;
  os_log_type_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  unint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  if (v28)
  {
    os_log_type_t typea = v27;
    uint64_t v30 = *(void *)(v0 + 240);
    uint64_t v55 = *(void *)(v0 + 232);
    uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    uint64_t v63 = v3;
    uint64_t v31 = *(void *)(v0 + 208);
    loga = v26;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315394;
    Swift::String v65 = v2;
    id v33 = [v25 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000BE50(&qword_100029088);
    uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v36 = v35;
    uint64_t v37 = v31;
    v61(v30, v31);
    *(void *)(v0 + 144) = sub_10001B53C(v34, v36, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v32 + 12) = 2080;
    uint64_t v2 = v65;
    uint64_t v38 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 152) = sub_10001B53C(v38, v39, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v3 = v63;
    v61(v55, v37);
    _os_log_impl((void *)&_mh_execute_header, loga, typea, "NotifyWhenFoundNotificationService: Found beacon group %s for subscription: %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v50 = *(void *)(v0 + 232);
    uint64_t v51 = *(void *)(v0 + 208);

    v29(v50, v51);
  }
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v52 = *(uint64_t (**)(void *, void *))(v0 + 8);
  return v52(v2, v3);
}

uint64_t sub_100009874(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(*(void *)(v4 + 64) + 40);
  *uint64_t v5 = a2;
  v5[1] = a3;
  id v6 = a2;
  id v7 = a3;

  return _swift_continuation_resume(v4);
}

uint64_t sub_1000098D0(uint64_t a1)
{
  v2[22] = a1;
  v2[23] = v1;
  uint64_t v3 = type metadata accessor for Date();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for UUID();
  v2[27] = v4;
  v2[28] = *(void *)(v4 - 8);
  v2[29] = swift_task_alloc();
  return _swift_task_switch(sub_1000099EC, 0, 0);
}

uint64_t sub_1000099EC()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = *(void **)(v0[23] + 80);
  v0[30] = v2;
  sub_10000BBD0(&qword_100029040);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F950;
  *(void *)(v3 + 32) = v1;
  specialized Array._endMutation()();
  sub_10000D0AC(0, &qword_100029048);
  id v4 = v2;
  id v5 = v1;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[31] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100009B84;
  uint64_t v7 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000A6B0;
  v0[13] = &unk_100024D10;
  v0[14] = v7;
  [v4 locationsForBeacons:isa completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100009B84()
{
  return _swift_task_switch(sub_100009C64, 0, 0);
}

uint64_t sub_100009C64()
{
  uint64_t v70 = v0;
  uint64_t v1 = (void **)(v0 + 176);
  uint64_t v2 = *(void **)(v0 + 176);
  uint64_t v3 = *(void **)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 120);

  id v5 = [v2 identifier];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v4 + 16) && (unint64_t v6 = sub_10001BC5C(*(void *)(v0 + 232)), (v7 & 1) != 0))
  {
    uint64_t v9 = *(void *)(v0 + 224);
    uint64_t v8 = *(void *)(v0 + 232);
    uint64_t v10 = *(void *)(v0 + 208);
    uint64_t v11 = *(void *)(v0 + 216);
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v13 = *(void *)(v0 + 200);
    uint64_t v14 = *(void **)(*(void *)(v4 + 56) + 8 * v6);
    *(void *)(v0 + 256) = v14;
    id v15 = v14;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
    id v16 = v15;
    [v16 latitude];
    double v18 = v17;
    [v16 longitude];
    double v20 = v19;
    id v21 = objc_allocWithZone((Class)CLLocation);
    [v16 horizontalAccuracy];
    double v23 = v22;
    id v24 = [v16 timestamp];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
    id v26 = [v21 initWithCoordinate:isa v18 v20 -1.0 v23 -1.0];
    *(void *)(v0 + 264) = v26;

    if (qword_100028EB8 != -1) {
      swift_once();
    }
    os_log_type_t v27 = *(void **)(v0 + 176);
    uint64_t v28 = type metadata accessor for Logger();
    *(void *)(v0 + 272) = sub_10000BC14(v28, (uint64_t)qword_10002A018);
    id v29 = v27;
    id v30 = v26;
    id v31 = v29;
    id v32 = v30;
    id v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.default.getter();
    BOOL v35 = os_log_type_enabled(v33, v34);
    unint64_t v36 = *(void **)(v0 + 176);
    if (v35)
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v68 = v32;
      id v38 = v36;
      id v39 = [v38 description];
      uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      os_log_type_t type = v34;
      unint64_t v42 = v41;

      *(void *)(v0 + 160) = sub_10001B53C(v40, v42, &v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      id v32 = v68;
      *(_WORD *)(v37 + 12) = 2080;
      id v43 = v68;
      id v44 = [v43 description];
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v47 = v46;

      *(void *)(v0 + 168) = sub_10001B53C(v45, v47, &v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v33, type, "NotifyWhenFoundNotificationService: Latest unshifted location for %s is %s.", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v66 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v66;
    void *v66 = v0;
    v66[1] = sub_10000A308;
    v66[6] = v32;
    return _swift_task_switch(sub_10000A788, 0, 0);
  }
  else
  {
    uint64_t v49 = *(void *)(v0 + 224);
    uint64_t v48 = *(void *)(v0 + 232);
    uint64_t v50 = *(void *)(v0 + 216);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    if (qword_100028EB8 != -1) {
      swift_once();
    }
    uint64_t v51 = *v1;
    uint64_t v52 = type metadata accessor for Logger();
    sub_10000BC14(v52, (uint64_t)qword_10002A018);
    id v53 = v51;
    uint64_t v54 = Logger.logObject.getter();
    os_log_type_t v55 = static os_log_type_t.error.getter();
    BOOL v56 = os_log_type_enabled(v54, v55);
    id v57 = *v1;
    if (v56)
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v58 = 136315138;
      id v59 = v57;
      id v60 = [v59 description];
      uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v63 = v62;

      *(void *)(v0 + 128) = sub_10001B53C(v61, v63, &v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v54, v55, "NotifyWhenFoundNotificationService: Unable to fetch latest location for %s.", v58, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v64 = *(uint64_t (**)(void))(v0 + 8);
    return v64(0);
  }
}

uint64_t sub_10000A308(uint64_t a1)
{
  *(void *)(*(void *)v1 + 288) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000A408, 0, 0);
}

uint64_t sub_10000A408()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void **)(v0 + 176);
  id v2 = *(id *)(v0 + 288);
  id v3 = v1;
  id v4 = v2;
  id v5 = v3;
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v23 = *(void *)(v0 + 288);
    id v24 = *(void **)(v0 + 264);
    id v25 = *(void **)(v0 + 256);
    uint64_t v8 = *(void **)(v0 + 176);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    id v10 = v8;
    id v11 = [v10 description];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;

    *(void *)(v0 + 136) = sub_10001B53C(v12, v14, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2080;
    *(void *)(v0 + 144) = v23;
    id v15 = v4;
    sub_10000BBD0((uint64_t *)&unk_100029350);
    uint64_t v16 = String.init<A>(describing:)();
    *(void *)(v0 + 152) = sub_10001B53C(v16, v17, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "NotifyWhenFoundNotificationService: Latest shifted location for %s is %s.", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    double v18 = *(void **)(v0 + 264);
    double v19 = *(void **)(v0 + 176);
  }
  uint64_t v20 = *(void *)(v0 + 288);
  swift_task_dealloc();
  swift_task_dealloc();
  id v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v21(v20);
}

uint64_t sub_10000A6B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  type metadata accessor for UUID();
  sub_10000D0AC(0, &qword_100029078);
  sub_10000BE50(&qword_100029080);
  **(void **)(*(void *)(v1 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return _swift_continuation_resume(v1);
}

uint64_t sub_10000A768()
{
  *(void *)(v1 + 48) = v0;
  return _swift_task_switch(sub_10000A788, 0, 0);
}

uint64_t sub_10000A788()
{
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  id v2 = (id *)(v0 + 48);
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000BC14(v3, (uint64_t)qword_10002A018);
  id v4 = v1;
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 48);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    *(void *)(v0 + 40) = v8;
    id v11 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v10 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "NotifyWhenFoundNotificationService: Shifting Location: %@", v9, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    id v2 = (id *)(v0 + 48);
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v12 = *v2;
  [*v2 coordinate];
  double v14 = v13;
  [v12 coordinate];
  double v16 = v15;
  unsigned int v17 = [self isLocationShiftRequiredForCoordinate:v14, v15];
  id v18 = v12;
  double v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  id v22 = *v2;
  if (v17)
  {
    if (v21)
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      id v24 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 138412290;
      *(void *)(v0 + 32) = v22;
      BOOL v35 = v2;
      id v25 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v24 = v22;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "NotifyWhenFoundNotificationService: Location shifting is required for %@.", v23, 0xCu);
      sub_10000BBD0(&qword_100029058);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      id v26 = *v35;
    }
    else
    {

      id v26 = *v2;
      double v19 = *v2;
    }

    id v30 = (double *)swift_task_alloc();
    *(void *)(v0 + 56) = v30;
    _OWORD v30[2] = v14;
    v30[3] = v16;
    *((void *)v30 + 4) = v26;
    id v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v31;
    uint64_t v32 = sub_10000BBD0((uint64_t *)&unk_100029350);
    void *v31 = v0;
    v31[1] = sub_10000ACBC;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000014, 0x80000001000202C0, sub_10000BC4C, v30, v32);
  }
  else
  {
    if (v21)
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 138412290;
      *(void *)(v0 + 16) = v22;
      id v29 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v28 = v22;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "NotifyWhenFoundNotificationService: Location shifting not required for %@.", v27, 0xCu);
      sub_10000BBD0(&qword_100029058);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    unint64_t v36 = *(uint64_t (**)(id))(v0 + 8);
    id v33 = *(id *)(v0 + 48);
    return v36(v22);
  }
}

uint64_t sub_10000ACBC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10000ADD4, 0, 0);
}

uint64_t sub_10000ADD4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 24));
}

uint64_t sub_10000ADEC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000BBD0(&qword_1000290C0);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10000D0AC(0, &qword_1000290C8);
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

id *sub_10000AEC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return v0;
}

uint64_t sub_10000AF28()
{
  sub_10000AEC8();

  return _swift_deallocClassInstance(v0, 128, 7);
}

uint64_t type metadata accessor for NotifyWhenFoundNotificationService()
{
  return self;
}

id sub_10000AF80()
{
  return *(id *)(*(void *)v0 + 96);
}

uint64_t sub_10000AF8C()
{
  return sub_1000049C8();
}

void sub_10000AFB0(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v32 = a1;
  uint64_t v8 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  __chkstk_darwin();
  BOOL v35 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000BBD0(&qword_100029060);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin();
  double v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v34 = [objc_allocWithZone((Class)GEOLocationShifter) init];
  [a2 horizontalAccuracy];
  double v15 = v14;
  id v31 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v31(v13, a1, v10);
  uint64_t v16 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v17 = (v16 + 24) & ~v16;
  uint64_t v30 = v16 | 7;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a2;
  double v19 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v19(v18 + v17, v13, v10);
  unint64_t v42 = sub_10000BC5C;
  uint64_t v43 = v18;
  aBlock = _NSConcreteStackBlock;
  uint64_t v39 = 1107296256;
  uint64_t v40 = sub_10000B79C;
  unint64_t v41 = &unk_100024D50;
  id v33 = _Block_copy(&aBlock);
  id v20 = a2;
  swift_release();
  v31(v13, v32, v10);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  v19(v21 + v17, v13, v10);
  unint64_t v42 = sub_10000BDD8;
  uint64_t v43 = v21;
  aBlock = _NSConcreteStackBlock;
  uint64_t v39 = 1107296256;
  uint64_t v40 = sub_100008B1C;
  unint64_t v41 = &unk_100024DA0;
  id v22 = _Block_copy(&aBlock);
  id v23 = v20;
  swift_release();
  sub_10000D0AC(0, &qword_100029068);
  id v25 = v35;
  uint64_t v24 = v36;
  uint64_t v26 = v37;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v35, enum case for DispatchQoS.QoSClass.default(_:), v37);
  uint64_t v27 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  id v29 = v33;
  id v28 = v34;
  [v34 shiftCoordinate:v33 accuracy:0 withCompletionHandler:v22 mustGoToNetworkCallback:v27 errorHandler:a3 callbackQueue:a4 v15];

  _Block_release(v22);
  _Block_release(v29);
}

uint64_t sub_10000B394(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  double v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 altitude];
  double v15 = v14;
  [a1 verticalAccuracy];
  double v17 = v16;
  [a1 course];
  double v19 = v18;
  [a1 speed];
  double v21 = v20;
  id v22 = [a1 timestamp];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  id v23 = objc_allocWithZone((Class)CLLocation);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v25 = [v23 initWithCoordinate:isa altitude:a3 horizontalAccuracy:a4 verticalAccuracy:v15 course:a5 speed:v17 timestamp:v19];

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v26 = type metadata accessor for Logger();
  sub_10000BC14(v26, (uint64_t)qword_10002A018);
  id v27 = a1;
  id v28 = v25;
  id v29 = v27;
  id v30 = v28;
  id v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315394;
    v43[1] = a2;
    id v34 = [v29 description];
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v37 = v36;

    uint64_t v44 = sub_10001B53C(v35, v37, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    id v38 = [v30 description];
    uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = v40;

    uint64_t v44 = sub_10001B53C(v39, v41, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "NotifyWhenFoundNotificationService: Shifted Location from %s to %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v45 = (uint64_t)v30;
  sub_10000BBD0(&qword_100029060);
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10000B79C(uint64_t a1, double a2, double a3, double a4)
{
  id v7 = *(void (**)(uint64_t, double, double, double))(a1 + 32);
  uint64_t v8 = swift_retain();
  v7(v8, a2, a3, a4);

  return swift_release();
}

uint64_t sub_10000B808(uint64_t a1, void *a2)
{
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000BC14(v3, (uint64_t)qword_10002A018);
  id v4 = a2;
  swift_errorRetain();
  id v5 = v4;
  swift_errorRetain();
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    *(_WORD *)(v8 + 12) = 2080;
    swift_errorRetain();
    sub_10000BBD0(&qword_100029070);
    uint64_t v11 = String.init<A>(describing:)();
    sub_10001B53C(v11, v12, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "NotifyWhenFoundNotificationService: Failed to shift location %@ - Error: %s", (uint8_t *)v8, 0x16u);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v14 = 0;
  sub_10000BBD0(&qword_100029060);
  return CheckedContinuation.resume(returning:)();
}

void *sub_10000BAA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_10000BAAC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10000BAC0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10000BAD4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10000BAE8(void *a1, uint64_t a2, uint64_t a3)
{
  v3[2] = 0xD000000000000016;
  v3[3] = 0x8000000100020200;
  v3[4] = 0xD000000000000018;
  v3[5] = 0x8000000100020220;
  v3[6] = 0xD000000000000021;
  v3[7] = 0x8000000100020240;
  v3[8] = 0xD000000000000026;
  v3[9] = 0x8000000100020270;
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  swift_retain();
  v3[12] = [a1 content];
  v3[11] = [objc_allocWithZone((Class)SPBeaconManager) init];
  v3[10] = [objc_allocWithZone((Class)SPOwnerSession) init];
  return v3;
}

uint64_t sub_10000BBD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000BC14(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_10000BC4C(uint64_t a1)
{
  sub_10000AFB0(a1, *(void **)(v1 + 32), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_10000BC5C(double a1, double a2, double a3)
{
  uint64_t v7 = *(void *)(sub_10000BBD0(&qword_100029060) - 8);
  uint64_t v8 = *(void **)(v3 + 16);
  uint64_t v9 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_10000B394(v8, v9, a1, a2, a3);
}

uint64_t sub_10000BCEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BCFC()
{
  return swift_release();
}

uint64_t sub_10000BD08()
{
  uint64_t v1 = sub_10000BBD0(&qword_100029060);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000BDD8(uint64_t a1)
{
  sub_10000BBD0(&qword_100029060);
  uint64_t v3 = *(void **)(v1 + 16);

  return sub_10000B808(a1, v3);
}

uint64_t sub_10000BE50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UUID();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000BE94()
{
  unint64_t result = qword_1000290A8;
  if (!qword_1000290A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000290A8);
  }
  return result;
}

uint64_t *sub_10000BEE8(uint64_t *a1)
{
  return a1;
}

uint64_t sub_10000BF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000BFE0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C018(uint64_t a1)
{
  return a1;
}

void *sub_10000C06C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      unsigned int v9 = [v6 partIdentifier];
      if ([a2 partIdentifier] == (id)v9)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10000C1A0(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v53 = a3;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v11 = a2;
    id v12 = [v11 beaconMap];
    sub_10000D0AC(0, &qword_1000290B8);
    uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v14 = *(void *)(v13 + 16);
    swift_bridgeObjectRelease();
    if (v14 == 1)
    {
      id v15 = [v11 name];
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v18 = v17;
    }
    else
    {
      uint64_t v52 = v8;
      id v21 = [a1 accessoryProductInfo];
      if (!v21) {
        goto LABEL_9;
      }
      id v22 = v21;
      id v23 = [v21 layoutTemplate];

      if (!v23) {
        goto LABEL_9;
      }
      sub_10000D0AC(0, &qword_1000290D0);
      unint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      id v25 = a1;
      uint64_t v26 = sub_10000C06C(v24, v25);
      swift_bridgeObjectRelease();

      if (v26)
      {
        id v27 = [v26 partName];
        uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        id v30 = v29;
      }
      else
      {
LABEL_9:
        id v27 = [a1 name];
        uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        id v30 = v31;
      }

      id v32 = [v11 name];
      uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v35 = v34;

      uint64_t v54 = v33;
      unint64_t v55 = v35;
      v36._uint64_t countAndFlagsBits = 2108704;
      v36._object = (void *)0xE300000000000000;
      String.append(_:)(v36);
      v37._uint64_t countAndFlagsBits = v28;
      v37._object = v30;
      String.append(_:)(v37);

      swift_bridgeObjectRelease();
      uint64_t v16 = v54;
      unint64_t v18 = v55;
      uint64_t v8 = v52;
    }
  }
  else
  {
    id v19 = [a1 name];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v20;
  }
  uint64_t v38 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v38 = v16 & 0xFFFFFFFFFFFFLL;
  }
  if (v38) {
    return v16;
  }
  swift_bridgeObjectRelease();
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v40 = type metadata accessor for Logger();
  sub_10000BC14(v40, (uint64_t)qword_10002A018);
  id v41 = a1;
  swift_bridgeObjectRetain_n();
  id v42 = v41;
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v54 = v52;
    *(_DWORD *)uint64_t v45 = 136315394;
    v51[1] = v45 + 4;
    id v46 = [v42 identifier];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000BE50(&qword_100029088);
    uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v49 = v48;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v56 = sub_10001B53C(v47, v49, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v39 = v53;
    uint64_t v56 = sub_10001B53C(v53, a4, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "NotifyWhenFoundNotificationService: Beacon name for %s is empty, using fallback name %s.", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v39 = v53;
  }
  swift_bridgeObjectRetain();
  return v39;
}

uint64_t sub_10000C718(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_10000C738, 0, 0);
}

uint64_t sub_10000C738()
{
  uint64_t v1 = v0[16];
  id v2 = [objc_allocWithZone((Class)CLGeocoder) init];
  v0[17] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000C864;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000ADEC;
  v0[13] = &unk_100024E20;
  v0[14] = v3;
  [v2 reverseGeocodeLocation:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000C864()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    id v2 = sub_10000CE5C;
  }
  else {
    id v2 = sub_10000C974;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000C974()
{
  uint64_t v41 = v0;
  unint64_t v1 = *(void *)(v0 + 120);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    id v2 = (void *)_CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      if ((v1 & 0xC000000000000001) != 0)
      {
        id v3 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_22:
          swift_once();
LABEL_7:
          uint64_t v4 = *(void **)(v0 + 128);
          uint64_t v5 = type metadata accessor for Logger();
          sub_10000BC14(v5, (uint64_t)qword_10002A018);
          id v6 = v4;
          id v7 = v2;
          id v8 = v6;
          id v9 = v7;
          id v10 = Logger.logObject.getter();
          os_log_type_t v11 = static os_log_type_t.default.getter();
          BOOL v12 = os_log_type_enabled(v10, v11);
          uint64_t v13 = *(void **)(v0 + 128);
          uint64_t v14 = *(void **)(v0 + 136);
          if (v12)
          {
            uint64_t v38 = *(void **)(v0 + 136);
            uint64_t v15 = swift_slowAlloc();
            Swift::String v37 = (void *)swift_slowAlloc();
            uint64_t v40 = swift_slowAlloc();
            *(_DWORD *)uint64_t v15 = 136315394;
            id v16 = v13;
            id v17 = [v16 description];
            uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            unint64_t v20 = v19;

            *(void *)(v0 + 80) = sub_10001B53C(v18, v20, &v40);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            *(_WORD *)(v15 + 12) = 2112;
            *(void *)(v0 + 80) = v9;
            id v21 = v9;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *Swift::String v37 = v9;

            _os_log_impl((void *)&_mh_execute_header, v10, v11, "NotifyWhenFoundNotificationService: Reverse-geocoding result for %s is %@.", (uint8_t *)v15, 0x16u);
            sub_10000BBD0(&qword_100029058);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          goto LABEL_17;
        }
        id v3 = *(id *)(v1 + 32);
      }
      id v2 = v3;
      swift_bridgeObjectRelease();
      if (qword_100028EB8 == -1) {
        goto LABEL_7;
      }
      goto LABEL_22;
    }
  }
  else
  {
    id v2 = *(void **)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  id v22 = *(void **)(v0 + 128);
  uint64_t v23 = type metadata accessor for Logger();
  sub_10000BC14(v23, (uint64_t)qword_10002A018);
  id v24 = v22;
  id v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = *(void **)(v0 + 128);
  if (v27)
  {
    uint64_t v39 = *(void **)(v0 + 136);
    id v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)id v29 = 136315138;
    id v30 = v28;
    id v31 = [v30 description];
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v34 = v33;

    *(void *)(v0 + 80) = sub_10001B53C(v32, v34, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "NotifyWhenFoundNotificationService: No reverse-geocoding results found for %s.", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v9 = 0;
LABEL_17:
  unint64_t v35 = *(uint64_t (**)(id))(v0 + 8);
  return v35(v9);
}

uint64_t sub_10000CE5C()
{
  uint64_t v13 = v0;
  swift_willThrow();
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000BC14(v1, (uint64_t)qword_10002A018);
  swift_errorRetain();
  swift_errorRetain();
  id v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void *)(v0 + 144);
  if (v4)
  {
    os_log_type_t v11 = *(void **)(v0 + 136);
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)id v6 = 136315138;
    *(void *)(v0 + 80) = v5;
    swift_errorRetain();
    sub_10000BBD0(&qword_1000290C0);
    uint64_t v7 = String.init<A>(describing:)();
    *(void *)(v0 + 80) = sub_10001B53C(v7, v8, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "NotifyWhenFoundNotificationService: Reverse-geocoding failed with error %s.", v6, 0xCu);
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
  id v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9(0);
}

_OWORD *sub_10000D09C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D0AC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000D0E8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D128(uint64_t a1)
{
  return sub_1000086D0(a1, *(void **)(v1 + 16));
}

unint64_t sub_10000D130()
{
  unint64_t result = qword_1000290D8;
  if (!qword_1000290D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000290D8);
  }
  return result;
}

uint64_t sub_10000D184(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D1DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000D238(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D294()
{
  return swift_release();
}

uint64_t sub_10000D29C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000D2EC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D32C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000D400;
  long long v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *long long v2 = v1;
  v2[1] = sub_10000D650;
  return sub_100004C9C();
}

uint64_t sub_10000D400()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D4F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000BBD0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D550()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D588(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000D400;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100029578 + dword_100029578);
  return v6(a1, v4);
}

unint64_t sub_10000D654(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 7565409;
      break;
    case 2:
      unint64_t result = 0x7472656C61;
      break;
    case 3:
      unint64_t result = 0x736772612D636F6CLL;
      break;
    case 4:
      unint64_t result = 0x6469646E65697266;
      break;
    case 5:
      unint64_t result = 0x6553646E65697266;
      break;
    case 6:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 7:
      unint64_t result = 0x6552646E65697266;
      break;
    case 8:
      unint64_t result = 1684632949;
      break;
    case 9:
      unint64_t result = 0x49555570756F7267;
      break;
    default:
      return result;
  }
  return result;
}

Swift::String *FMReplacedIdentifier.unsafeMutableAddressor()
{
  return &FMReplacedIdentifier;
}

Swift::String *FMReplacedGroupIdentifier.unsafeMutableAddressor()
{
  return &FMReplacedGroupIdentifier;
}

uint64_t sub_10000D7D8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 2036625250;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 2036625250;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x79656B2D636F6CLL;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x736772612D636F6CLL;
      break;
    case 3:
      unint64_t v3 = 0x8000000100020110;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v5 = 0x2D7972616D6D7573;
      unint64_t v3 = 0xEB00000000677261;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x79656B2D636F6CLL) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x736772612D636F6CLL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0x8000000100020110;
      unint64_t v2 = 0xD000000000000011;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xEB00000000677261;
      if (v5 != 0x2D7972616D6D7573) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
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

uint64_t sub_10000D9AC(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 7565409;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 7565409;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6F4C796150666D66;
      unint64_t v3 = 0xEA00000000006461;
      break;
    case 2:
      uint64_t v5 = 0x70416E49776F6873;
      unint64_t v3 = 0xEE007472656C4170;
      break;
    case 3:
      uint64_t v5 = 7107189;
      break;
    case 4:
      uint64_t v5 = 0x696669746E656469;
      unint64_t v3 = 0xEA00000000007265;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEA00000000006461;
      if (v5 == 0x6F4C796150666D66) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xEE007472656C4170;
      if (v5 != 0x70416E49776F6873) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 7107189;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xEA00000000007265;
      if (v5 != 0x696669746E656469) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
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

uint64_t sub_10000DB80(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x7472656C61;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x7472656C61;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6567646162;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x79726F6765746163;
      break;
    case 3:
      uint64_t v5 = 0x646E756F73;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 0x6567646162) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x79726F6765746163;
      goto LABEL_9;
    case 3:
      if (v5 == 0x646E756F73) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10000DCE8()
{
  return Hasher._finalize()();
}

Swift::Int sub_10000DDE4()
{
  return Hasher._finalize()();
}

Swift::String *FMLatitudeIdentifier.unsafeMutableAddressor()
{
  return &FMLatitudeIdentifier;
}

Swift::String *FMLongitudeIdentifier.unsafeMutableAddressor()
{
  return &FMLongitudeIdentifier;
}

Swift::String *FMAccuracyIdentifier.unsafeMutableAddressor()
{
  return &FMAccuracyIdentifier;
}

Swift::String *FMLocationIdentifier.unsafeMutableAddressor()
{
  return &FMLocationIdentifier;
}

uint64_t PushPayload.apsData.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DF18(v1, a1);
}

uint64_t sub_10000DF18(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t PushPayload.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushPayload.showInAppAlert.getter()
{
  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t PushPayload.url.getter()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushPayload.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 152);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000DFE8(unsigned __int8 *a1, char *a2)
{
  return sub_10000D9AC(*a1, *a2);
}

Swift::Int sub_10000DFF4()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E0F0()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E1D4()
{
  return Hasher._finalize()();
}

unint64_t sub_10000E2CC@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_100024B38;
  unint64_t result = sub_10000FA0C(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10000E304(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 7565409;
  switch(*v1)
  {
    case 1:
      uint64_t v3 = 0x6F4C796150666D66;
      unint64_t v2 = 0xEA00000000006461;
      goto LABEL_3;
    case 2:
      strcpy((char *)a1, "showInAppAlert");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    case 3:
      *(void *)a1 = 7107189;
      *(void *)(a1 + 8) = 0xE300000000000000;
      break;
    case 4:
      *(void *)a1 = 0x696669746E656469;
      *(void *)(a1 + 8) = 0xEA00000000007265;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_10000E3C4()
{
  uint64_t result = 7565409;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6F4C796150666D66;
      break;
    case 2:
      uint64_t result = 0x70416E49776F6873;
      break;
    case 3:
      uint64_t result = 7107189;
      break;
    case 4:
      uint64_t result = 0x696669746E656469;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000E474@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_100024B38;
  unint64_t result = sub_10000FA0C(a1, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000E4A4()
{
  return 0;
}

void sub_10000E4B0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10000E4BC(uint64_t a1)
{
  unint64_t v2 = sub_100010EB8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E4F8(uint64_t a1)
{
  unint64_t v2 = sub_100010EB8();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 PushPayload.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000EED4(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(void *)(a2 + 160) = v10;
    long long v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    __n128 result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t PushAPSData.alert.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F4EC(v1, a1);
}

uint64_t PushAPSData.badge.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t PushAPSData.category.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushAPSData.sound.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000E624(unsigned __int8 *a1, char *a2)
{
  return sub_10000DB80(*a1, *a2);
}

Swift::Int sub_10000E630()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E6F8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E7A8()
{
  return Hasher._finalize()();
}

unint64_t sub_10000E86C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000F554(*a1);
  *a2 = result;
  return result;
}

void sub_10000E89C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x7472656C61;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 0x6567646162;
      goto LABEL_3;
    case 2:
      *a1 = 0x79726F6765746163;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x646E756F73;
      a1[1] = 0xE500000000000000;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE500000000000000;
      break;
  }
}

uint64_t sub_10000E924()
{
  uint64_t result = 0x7472656C61;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6567646162;
      break;
    case 2:
      uint64_t result = 0x79726F6765746163;
      break;
    case 3:
      uint64_t result = 0x646E756F73;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000E9A0@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000F554(a1);
  *a2 = result;
  return result;
}

void sub_10000E9C8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000E9D4(uint64_t a1)
{
  unint64_t v2 = sub_100010DA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000EA10(uint64_t a1)
{
  unint64_t v2 = sub_100010DA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 PushAPSData.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000F5A0(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v7[6];
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t PushAlert.body.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushAlert.locKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushAlert.locArgs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PushAlert.fallbackLocArgs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PushAlert.summaryArg.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000EB40(unsigned __int8 *a1, char *a2)
{
  return sub_10000D7D8(*a1, *a2);
}

Swift::Int sub_10000EB4C()
{
  return sub_10000DCE8();
}

uint64_t sub_10000EB54()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000EC38()
{
  return sub_10000DDE4();
}

unint64_t sub_10000EC40@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_100024C50;
  unint64_t result = sub_10000FA0C(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10000EC78(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 2036625250;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x79656B2D636F6CLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x736772612D636F6CLL;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0xD000000000000011;
      a1[1] = 0x8000000100020110;
      break;
    case 4:
      *a1 = 0x2D7972616D6D7573;
      a1[1] = 0xEB00000000677261;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_10000ED38()
{
  unint64_t result = 2036625250;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x79656B2D636F6CLL;
      break;
    case 2:
      unint64_t result = 0x736772612D636F6CLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x2D7972616D6D7573;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000EDE8@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_100024C50;
  unint64_t result = sub_10000FA0C(a1, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000EE18(uint64_t a1)
{
  unint64_t v2 = sub_100010C98();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000EE54(uint64_t a1)
{
  unint64_t v2 = sub_100010C98();

  return CodingKey.debugDescription.getter(a1, v2);
}

double PushAlert.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10000FA54(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t *sub_10000EED4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000BBD0(&qword_100029150);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v66 = a1;
  sub_100010C54(a1, v9);
  sub_100010EB8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return (uint64_t *)sub_10000D29C((uint64_t)v66);
  }
  uint64_t v65 = v6;
  uint64_t v59 = a2;
  LOBYTE(v67) = 0;
  sub_100010F0C();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v10 = v78;
  int v11 = v87;
  uint64_t v12 = v89;
  uint64_t v54 = v86;
  uint64_t v55 = v88;
  uint64_t v13 = v91;
  uint64_t v53 = v90;
  unsigned __int8 v99 = v87;
  LOBYTE(v78) = 1;
  uint64_t v57 = v80;
  uint64_t v58 = v10;
  uint64_t v14 = v79;
  uint64_t v63 = v85;
  uint64_t v64 = v81;
  uint64_t v60 = v82;
  uint64_t v61 = v84;
  uint64_t v62 = v83;
  sub_100010E48(v10, v79, v80, v81, v82, v83, v84, v85);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v56 = v16;
  int v47 = v11;
  uint64_t v48 = v15;
  uint64_t v51 = v12;
  uint64_t v52 = v14;
  LOBYTE(v78) = 2;
  swift_bridgeObjectRetain();
  uint64_t v50 = 0;
  int v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  LOBYTE(v78) = 3;
  uint64_t v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v100 = 4;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  uint64_t v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v49 = v20;
  id v22 = *(void (**)(char *, uint64_t))(v65 + 8);
  uint64_t v23 = v21;
  uint64_t v42 = v24;
  uint64_t v43 = v21;
  id v25 = v8;
  uint64_t v26 = v24;
  v22(v25, v5);
  uint64_t v27 = v57;
  *(void *)&long long v67 = v58;
  *((void *)&v67 + 1) = v52;
  uint64_t v45 = v18;
  *(void *)&long long v68 = v57;
  *((void *)&v68 + 1) = v64;
  *(void *)&long long v69 = v60;
  uint64_t v28 = v20;
  uint64_t v29 = v60;
  *((void *)&v69 + 1) = v62;
  *(void *)&long long v70 = v61;
  *((void *)&v70 + 1) = v63;
  *(void *)&long long v71 = v54;
  BYTE8(v71) = v47;
  *(void *)&long long v72 = v55;
  *((void *)&v72 + 1) = v51;
  int v44 = v17;
  *(void *)&long long v73 = v53;
  *((void *)&v73 + 1) = v13;
  uint64_t v46 = v13;
  *(void *)&long long v74 = v48;
  *((void *)&v74 + 1) = v56;
  LOBYTE(v75) = v17;
  *((void *)&v75 + 1) = v18;
  *(void *)&long long v76 = v28;
  *((void *)&v76 + 1) = v23;
  uint64_t v77 = v26;
  sub_100010F60((uint64_t *)&v67);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = v58;
  uint64_t v31 = v52;
  uint64_t v33 = v61;
  uint64_t v32 = v62;
  sub_10000BF70(v58, v52, v27, v64, v29, v62, v61, v63);
  swift_bridgeObjectRelease();
  uint64_t v34 = v51;
  swift_bridgeObjectRelease();
  sub_10000D29C((uint64_t)v66);
  uint64_t v78 = v30;
  uint64_t v79 = v31;
  uint64_t v80 = v27;
  uint64_t v81 = v64;
  uint64_t v82 = v29;
  uint64_t v83 = v32;
  uint64_t v84 = v33;
  uint64_t v85 = v63;
  uint64_t v86 = v54;
  unsigned __int8 v87 = v99;
  uint64_t v88 = v55;
  uint64_t v89 = v34;
  uint64_t v90 = v53;
  uint64_t v91 = v46;
  uint64_t v92 = v48;
  uint64_t v93 = v56;
  char v94 = v44;
  uint64_t v95 = v45;
  uint64_t v96 = v49;
  uint64_t v97 = v43;
  uint64_t v98 = v42;
  double result = sub_10000BEE8(&v78);
  long long v36 = v76;
  uint64_t v37 = v59;
  *(_OWORD *)(v59 + 128) = v75;
  *(_OWORD *)(v37 + 144) = v36;
  *(void *)(v37 + 160) = v77;
  long long v38 = v72;
  *(_OWORD *)(v37 + 64) = v71;
  *(_OWORD *)(v37 + 80) = v38;
  long long v39 = v74;
  *(_OWORD *)(v37 + 96) = v73;
  *(_OWORD *)(v37 + 112) = v39;
  long long v40 = v68;
  *(_OWORD *)uint64_t v37 = v67;
  *(_OWORD *)(v37 + 16) = v40;
  long long v41 = v70;
  *(_OWORD *)(v37 + 32) = v69;
  *(_OWORD *)(v37 + 48) = v41;
  return result;
}

uint64_t sub_10000F4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BBD0(&qword_100029110);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000F554(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100024BD0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000F5A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000BBD0(&qword_100029138);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010C54(a1, a1[3]);
  sub_100010DA0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000D29C((uint64_t)a1);
  }
  char v65 = 0;
  sub_100010DF4();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v50 = a2;
  uint64_t v9 = v56;
  uint64_t v10 = v59;
  uint64_t v12 = v60;
  uint64_t v11 = v61;
  LOBYTE(v56) = 1;
  uint64_t v51 = v9;
  uint64_t v52 = v57;
  uint64_t v53 = v58;
  uint64_t v54 = v63;
  uint64_t v55 = v62;
  sub_100010E48(v9, v57, v58, v59, v60, v61, v62, v63);
  uint64_t v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v64 = v14;
  uint64_t v45 = v13;
  uint64_t v46 = v11;
  uint64_t v47 = v12;
  uint64_t v48 = v10;
  uint64_t v16 = v52;
  uint64_t v15 = v53;
  uint64_t v17 = v51;
  LOBYTE(v56) = 2;
  uint64_t v44 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v56) = 3;
  uint64_t v49 = v18;
  swift_bridgeObjectRetain();
  uint64_t v19 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v43 = v19;
  uint64_t v42 = v21;
  v20(v8, v5);
  uint64_t v22 = v17;
  uint64_t v23 = v17;
  uint64_t v24 = v16;
  uint64_t v25 = v16;
  uint64_t v26 = v15;
  uint64_t v28 = v47;
  uint64_t v27 = v48;
  uint64_t v29 = v46;
  uint64_t v30 = v54;
  sub_100010E48(v23, v25, v26, v48, v47, v46, v55, v54);
  swift_bridgeObjectRetain();
  uint64_t v31 = v24;
  uint64_t v32 = v53;
  uint64_t v33 = v55;
  sub_10000BF70(v22, v31, v53, v27, v28, v29, v55, v30);
  sub_10000D29C((uint64_t)a1);
  uint64_t v34 = v52;
  uint64_t v35 = v33;
  uint64_t v36 = v54;
  sub_10000BF70(v22, v52, v32, v27, v28, v29, v35, v54);
  uint64_t v37 = v42;
  swift_bridgeObjectRelease();
  uint64_t v38 = v49;
  uint64_t result = swift_bridgeObjectRelease();
  long long v40 = v50;
  *uint64_t v50 = v22;
  v40[1] = v34;
  v40[2] = v53;
  v40[3] = v27;
  v40[4] = v28;
  v40[5] = v29;
  v40[6] = v55;
  v40[7] = v36;
  v40[8] = v45;
  *((unsigned char *)v40 + 72) = v64 & 1;
  v40[10] = v44;
  v40[11] = v38;
  v40[12] = v43;
  v40[13] = v37;
  return result;
}

unint64_t sub_10000FA0C(Swift::String string, Swift::OpaquePointer cases)
{
  object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  if (v5 >= 5) {
    return 5;
  }
  else {
    return v5;
  }
}

uint64_t sub_10000FA54@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000BBD0(&qword_100029118);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010C54(a1, a1[3]);
  sub_100010C98();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000D29C((uint64_t)a1);
  }
  LOBYTE(v35) = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v10;
  LOBYTE(v35) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v33 = v13;
  uint64_t v28 = v12;
  uint64_t v29 = v9;
  uint64_t v32 = v11;
  sub_10000BBD0(&qword_100029128);
  char v34 = 2;
  unint64_t v14 = sub_100010CEC();
  swift_bridgeObjectRetain();
  unint64_t v30 = v14;
  uint64_t v31 = 0;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  unint64_t v15 = v35;
  char v34 = 3;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v16 = v15;
  unint64_t v17 = v35;
  LOBYTE(v35) = 4;
  unint64_t v30 = v17;
  swift_bridgeObjectRetain();
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v19 = v32;
  uint64_t v21 = v20;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v31 = v18;
  v22(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v23 = v19;
  uint64_t v24 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000D29C((uint64_t)a1);
  swift_bridgeObjectRelease();
  unint64_t v25 = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v29;
  a2[1] = v23;
  a2[2] = v28;
  a2[3] = v24;
  a2[4] = v16;
  a2[5] = v25;
  a2[6] = v31;
  a2[7] = v21;
  return result;
}

uint64_t destroy for PushPayload(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PushPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 56);
  if (v4)
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
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    long long v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v13 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v13;
  uint64_t v14 = *(void *)(a2 + 152);
  uint64_t v15 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = v14;
  *(void *)(a1 + 160) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PushPayload(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 7);
  if (*(void *)(a1 + 56))
  {
    if (v4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 48) = *((void *)a2 + 6);
      *(void *)(a1 + 56) = *((void *)a2 + 7);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10001026C(a1);
      long long v5 = a2[3];
      long long v7 = *a2;
      long long v6 = a2[1];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v5;
      *(_OWORD *)a1 = v7;
      *(_OWORD *)(a1 + 16) = v6;
    }
  }
  else if (v4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    *(void *)(a1 + 48) = *((void *)a2 + 6);
    *(void *)(a1 + 56) = *((void *)a2 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *a2;
    long long v9 = a2[1];
    long long v10 = a2[3];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v10;
    *(_OWORD *)a1 = v8;
    *(_OWORD *)(a1 + 16) = v9;
  }
  uint64_t v11 = *((void *)a2 + 8);
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(void *)(a1 + 104) = *((void *)a2 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(void *)(a1 + 120) = *((void *)a2 + 15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
  *(void *)(a1 + 136) = *((void *)a2 + 17);
  *(void *)(a1 + 144) = *((void *)a2 + 18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *((void *)a2 + 19);
  *(void *)(a1 + 160) = *((void *)a2 + 20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001026C(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for PushPayload(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[9];
  *(void *)(a1 + 160) = *((void *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for PushPayload(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 56)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 56);
  if (!v4)
  {
    sub_10001026C(a1);
LABEL_5:
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PushPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 168)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 168) = 1;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 168) = 0;
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

uint64_t initializeBufferWithCopyOfBuffer for PushAPSData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PushAPSData(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PushAPSData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 56);
  if (v4)
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
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    long long v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 96);
  uint64_t v12 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = v11;
  *(void *)(a1 + 104) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PushAPSData(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 7);
  if (*(void *)(a1 + 56))
  {
    if (v4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 48) = *((void *)a2 + 6);
      *(void *)(a1 + 56) = *((void *)a2 + 7);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10001026C(a1);
      long long v5 = a2[3];
      long long v7 = *a2;
      long long v6 = a2[1];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v5;
      *(_OWORD *)a1 = v7;
      *(_OWORD *)(a1 + 16) = v6;
    }
  }
  else if (v4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    *(void *)(a1 + 48) = *((void *)a2 + 6);
    *(void *)(a1 + 56) = *((void *)a2 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *a2;
    long long v9 = a2[1];
    long long v10 = a2[3];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v10;
    *(_OWORD *)a1 = v8;
    *(_OWORD *)(a1 + 16) = v9;
  }
  uint64_t v11 = *((void *)a2 + 8);
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(void *)(a1 + 104) = *((void *)a2 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PushAPSData(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for PushAPSData(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 56)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 56);
  if (!v4)
  {
    sub_10001026C(a1);
LABEL_5:
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PushAPSData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushAPSData(uint64_t result, int a2, int a3)
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
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PushAPSData()
{
  return &type metadata for PushAPSData;
}

uint64_t destroy for PushAlert()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PushAlert(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PushAlert(void *a1, void *a2)
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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PushAlert(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PushAlert(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PushAlert(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushAlert(uint64_t result, int a2, int a3)
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PushAlert()
{
  return &type metadata for PushAlert;
}

void *sub_100010C54(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100010C98()
{
  unint64_t result = qword_100029120;
  if (!qword_100029120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029120);
  }
  return result;
}

unint64_t sub_100010CEC()
{
  unint64_t result = qword_100029130;
  if (!qword_100029130)
  {
    sub_100010D58(&qword_100029128);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029130);
  }
  return result;
}

uint64_t sub_100010D58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100010DA0()
{
  unint64_t result = qword_100029140;
  if (!qword_100029140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029140);
  }
  return result;
}

unint64_t sub_100010DF4()
{
  unint64_t result = qword_100029148;
  if (!qword_100029148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029148);
  }
  return result;
}

uint64_t sub_100010E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_100010EB8()
{
  unint64_t result = qword_100029158;
  if (!qword_100029158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029158);
  }
  return result;
}

unint64_t sub_100010F0C()
{
  unint64_t result = qword_100029160;
  if (!qword_100029160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029160);
  }
  return result;
}

uint64_t *sub_100010F60(uint64_t *a1)
{
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for PushPayload.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PushPayload.CodingKeys()
{
  return &type metadata for PushPayload.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PushAPSData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PushAPSData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100011170);
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

uint64_t sub_100011198(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000111A0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PushAPSData.CodingKeys()
{
  return &type metadata for PushAPSData.CodingKeys;
}

uint64_t _s26FindMyNotificationsService11PushPayloadV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s26FindMyNotificationsService11PushPayloadV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100011314);
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

ValueMetadata *type metadata accessor for PushAlert.CodingKeys()
{
  return &type metadata for PushAlert.CodingKeys;
}

unint64_t sub_100011350()
{
  unint64_t result = qword_100029168;
  if (!qword_100029168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029168);
  }
  return result;
}

unint64_t sub_1000113A8()
{
  unint64_t result = qword_100029170;
  if (!qword_100029170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029170);
  }
  return result;
}

unint64_t sub_100011400()
{
  unint64_t result = qword_100029178;
  if (!qword_100029178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029178);
  }
  return result;
}

unint64_t sub_100011458()
{
  unint64_t result = qword_100029180;
  if (!qword_100029180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029180);
  }
  return result;
}

unint64_t sub_1000114B0()
{
  unint64_t result = qword_100029188;
  if (!qword_100029188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029188);
  }
  return result;
}

unint64_t sub_100011508()
{
  unint64_t result = qword_100029190;
  if (!qword_100029190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029190);
  }
  return result;
}

unint64_t sub_100011560()
{
  unint64_t result = qword_100029198;
  if (!qword_100029198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029198);
  }
  return result;
}

unint64_t sub_1000115B8()
{
  unint64_t result = qword_1000291A0;
  if (!qword_1000291A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000291A0);
  }
  return result;
}

unint64_t sub_100011610()
{
  unint64_t result = qword_1000291A8;
  if (!qword_1000291A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000291A8);
  }
  return result;
}

uint64_t sub_100011670()
{
  sub_100011E8C();
  sub_10000BBD0(&qword_1000290A0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10001F930;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_10000BE94();
  *(void *)(v0 + 32) = 0xD000000000000029;
  *(void *)(v0 + 40) = 0x8000000100020400;
  uint64_t result = NSPredicate.init(format:_:)();
  static String.emailPredicate = result;
  return result;
}

uint64_t *String.emailPredicate.unsafeMutableAddressor()
{
  if (qword_100028EB0 != -1) {
    swift_once();
  }
  return &static String.emailPredicate;
}

id static String.emailPredicate.getter()
{
  if (qword_100028EB0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static String.emailPredicate;

  return v0;
}

BOOL String.isPhoneNumber.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)v21 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v21 - v12;
  CharacterSet.init(charactersIn:)();
  static CharacterSet.decimalDigits.getter();
  CharacterSet.formUnion(_:)();
  static CharacterSet.controlCharacters.getter();
  CharacterSet.formUnion(_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  static CharacterSet.whitespacesAndNewlines.getter();
  CharacterSet.formUnion(_:)();
  v14(v8, v4);
  v21[0] = a1;
  v21[1] = a2;
  sub_1000119EC();
  v21[0] = StringProtocol.components(separatedBy:)();
  sub_10000BBD0(&qword_100029128);
  sub_100011A40();
  uint64_t v15 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0) {
    uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v19 = v18 != 0;
  v14(v11, v4);
  v14(v13, v4);
  return v19;
}

unint64_t sub_1000119EC()
{
  unint64_t result = qword_1000291B0;
  if (!qword_1000291B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000291B0);
  }
  return result;
}

unint64_t sub_100011A40()
{
  unint64_t result = qword_1000291B8;
  if (!qword_1000291B8)
  {
    sub_100010D58(&qword_100029128);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000291B8);
  }
  return result;
}

id String.isEmail.getter()
{
  if (qword_100028EB0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static String.emailPredicate;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 evaluateWithObject:v1];

  return v2;
}

uint64_t String.sanitized.getter(uint64_t a1, unint64_t a2)
{
  v4._uint64_t countAndFlagsBits = 0x3A6F746C69616DLL;
  v4._object = (void *)0xE700000000000000;
  Swift::Bool v5 = String.hasPrefix(_:)(v4);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = String.count.getter();
    sub_100011DDC(v6, a1, a2);
    swift_bridgeObjectRelease();
    a1 = static String._fromSubstring(_:)();
    a2 = v7;
    swift_bridgeObjectRelease();
  }
  v8._uint64_t countAndFlagsBits = 980182388;
  v8._object = (void *)0xE400000000000000;
  if (String.hasPrefix(_:)(v8))
  {
    uint64_t v9 = String.count.getter();
    sub_100011DDC(v9, a1, a2);
    swift_bridgeObjectRelease();
    a1 = static String._fromSubstring(_:)();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t String.characterCount.getter()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = String.UTF16View.count.getter();
  swift_bridgeObjectRelease();
  return v0;
}

Swift::String __swiftcall String.deletingPrefix(_:)(Swift::String a1)
{
  unint64_t v3 = v2;
  uint64_t v4 = v1;
  Swift::Bool v5 = String.hasPrefix(_:)(a1);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = String.count.getter();
    sub_100011DDC(v6, v4, v3);
    swift_bridgeObjectRelease();
    uint64_t v4 = static String._fromSubstring(_:)();
    unint64_t v3 = v7;
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = v4;
  uint64_t v9 = (void *)v3;
  result._object = v9;
  result._uint64_t countAndFlagsBits = v8;
  return result;
}

uint64_t String.nonBreaking.getter()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_100011DDC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return String.subscript.getter();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = String.index(_:offsetBy:limitedBy:)();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }

  return String.subscript.getter();
}

unint64_t sub_100011E8C()
{
  unint64_t result = qword_1000291C0;
  if (!qword_1000291C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000291C0);
  }
  return result;
}

id sub_100011EFC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a4(v5);
  swift_bridgeObjectRelease();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

id FMPhoneNumberUtil.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id FMPhoneNumberUtil.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return [super init];
}

uint64_t type metadata accessor for FMPhoneNumberUtil()
{
  return self;
}

id FMPhoneNumberUtil.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return [super dealloc];
}

uint64_t sub_1000122A4()
{
  uint64_t result = CPPhoneNumberCopyHomeCountryCode();
  if (!result)
  {
    __break(1u);
    goto LABEL_27;
  }
  id v1 = (void *)result;
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v4 = v3;

  uint64_t v5 = v4 & 0x2000000000000000;
  uint64_t v6 = HIBYTE(v4) & 0xF;
  uint64_t v7 = v2 & 0xFFFFFFFFFFFFLL;
  if ((v4 & 0x2000000000000000) != 0) {
    uint64_t v8 = HIBYTE(v4) & 0xF;
  }
  else {
    uint64_t v8 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8)
  {
    swift_bridgeObjectRelease();
    uint64_t result = CPPhoneNumberCopyActiveCountryCode();
    if (result)
    {
      uint64_t v9 = (void *)result;
      uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v11 = v10;

      uint64_t v5 = v11 & 0x2000000000000000;
      uint64_t v6 = HIBYTE(v11) & 0xF;
      uint64_t v7 = v2 & 0xFFFFFFFFFFFFLL;
      goto LABEL_8;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_8:
  if (v5) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = v7;
  }
  if (!v12)
  {
    swift_bridgeObjectRelease();
    uint64_t result = CPPhoneNumberCopyNetworkCountryCode();
    if (result)
    {
      uint64_t v13 = (void *)result;
      uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      uint64_t v5 = v15 & 0x2000000000000000;
      uint64_t v6 = HIBYTE(v15) & 0xF;
      uint64_t v7 = v2 & 0xFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_14:
  if (v5) {
    uint64_t v16 = v6;
  }
  else {
    uint64_t v16 = v7;
  }
  if (v16) {
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  uint64_t result = CPPhoneNumberCopyLastKnownNetworkCountryCode();
  if (!result)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  unint64_t v17 = (void *)result;
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  uint64_t v5 = v19 & 0x2000000000000000;
  uint64_t v6 = HIBYTE(v19) & 0xF;
  uint64_t v7 = v2 & 0xFFFFFFFFFFFFLL;
LABEL_20:
  if (v5) {
    uint64_t v20 = v6;
  }
  else {
    uint64_t v20 = v7;
  }
  if (!v20)
  {
    swift_bridgeObjectRelease();
    return 29557;
  }
  return v2;
}

uint64_t sub_1000123D4(uint64_t a1)
{
  sub_1000122A4();
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v4 = (void *)CFPhoneNumberCreate();

  if (!v4) {
    goto LABEL_5;
  }
  id v5 = v4;
  uint64_t String = CFPhoneNumberCreateString();
  if (!String)
  {

LABEL_5:
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v7 = (void *)String;
  a1 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return a1;
}

uint64_t sub_1000124C4(uint64_t a1)
{
  if (qword_100028EB0 != -1) {
    swift_once();
  }
  uint64_t v2 = static String.emailPredicate;
  NSString v3 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = [(id)v2 evaluateWithObject:v3];

  if (v2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    a1 = sub_1000123D4(a1);
    id v5 = v4;
    swift_bridgeObjectRetain();
    v6._uint64_t countAndFlagsBits = 43;
    v6._object = (void *)0xE100000000000000;
    if (String.hasPrefix(_:)(v6) || String.count.getter() <= 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v7._uint64_t countAndFlagsBits = a1;
      v7._object = v5;
      String.append(_:)(v7);
      swift_bridgeObjectRelease_n();
      return 43;
    }
  }
  return a1;
}

uint64_t sub_1000125F8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v23 = a3;
  uint64_t v6 = type metadata accessor for CharacterSet();
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  uint64_t v10 = HIBYTE(a2) & 0xF;
  uint64_t v28 = a1;
  uint64_t v20 = a1 & 0xFFFFFFFFFFFFLL;
  uint64_t v21 = v10;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v10 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v22 = v10;
  if (!v10) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v19 = a2 & 0xFFFFFFFFFFFFFFLL;
  v18[1] = v3;
  v18[2] = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v12 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v13 = (void (**)(char *, uint64_t))(v7 + 8);
  do
  {
    if ((a2 & 0x1000000000000000) != 0)
    {
      _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
    }
    else
    {
      if ((a2 & 0x2000000000000000) != 0)
      {
        uint64_t v24 = v28;
        uint64_t v25 = v19;
      }
      else if ((v28 & 0x1000000000000000) == 0)
      {
        _StringObject.sharedUTF8.getter();
      }
      _decodeScalar(_:startingAt:)();
    }
    uint64_t v15 = v14;
    (*v12)(v9, v23, v6);
    char v16 = CharacterSet.contains(_:)();
    (*v13)(v9, v6);
    if (v16) {
      String.UnicodeScalarView.append(_:)();
    }
    v11 += v15;
  }
  while (v11 < v22);
  return v26;
}

uint64_t sub_1000127EC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    static CharacterSet.decimalDigits.getter();
    CharacterSet.insert(_:)();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000125F8(a1, a2, (uint64_t)v7);
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v12 = HIBYTE(v11) & 0xF;
    if ((v11 & 0x2000000000000000) == 0) {
      uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
    }
    if (!v12)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    if (v9 == a1 && v11 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10001297C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CharacterSet.decimalDigits.getter();
  v8._uint64_t countAndFlagsBits = 0x2D232A29282BLL;
  v8._object = (void *)0xE600000000000000;
  CharacterSet.insert(charactersIn:)(v8);
  uint64_t v28 = a1;
  unint64_t v29 = a2;
  sub_1000119EC();
  StringProtocol.rangeOfCharacter(from:options:range:)();
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = a1;
    unint64_t v17 = a2;
  }
  else
  {
    uint64_t v28 = a1;
    unint64_t v29 = a2;
    uint64_t v10 = String.Index.utf16Offset<A>(in:)();
    uint64_t result = String.count.getter();
    uint64_t v12 = result - v10;
    if (__OFSUB__(result, v10))
    {
      __break(1u);
      return result;
    }
    NSString v13 = String._bridgeToObjectiveC()();
    id v14 = [v13 substringWithRange:v10, v12];

    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v17 = v16;
  }
  uint64_t v18 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0) {
    uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (v18)
  {
    uint64_t v27 = v4;
    sub_1000122A4();
    NSString v19 = String._bridgeToObjectiveC()();
    NSString v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)CFPhoneNumberCreate();

    if (v21)
    {
      id v22 = v21;
      uint64_t String = CFPhoneNumberCreateString();
      uint64_t v24 = v27;
      if (String)
      {
        uint64_t v25 = (void *)String;
        swift_bridgeObjectRelease();
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v24);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v15;
}

void sub_100012C64()
{
  uint64_t v1 = v0;
  id v2 = [*(id *)(v0 + 16) userInfo];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v24[6] = 0x6F4C796150666D66;
  v24[7] = 0xEA00000000006461;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10001BCF4((uint64_t)v24), (v5 & 1) != 0))
  {
    sub_10000D238(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v25);
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000C018((uint64_t)v24);
  if (*((void *)&v26 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = *(void **)(v1 + 24);
      if (v6)
      {
        NSString v7 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        v24[4] = (uint64_t)sub_100013C38;
        v24[5] = v1;
        v24[0] = (uint64_t)_NSConcreteStackBlock;
        v24[1] = 1107296256;
        v24[2] = (uint64_t)sub_1000139E0;
        v24[3] = (uint64_t)&unk_100025268;
        Swift::String v8 = _Block_copy(v24);
        swift_retain();
        swift_release();
        [v6 dataForPayload:v7 completion:v8];
        _Block_release(v8);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      return;
    }
  }
  else
  {
    sub_100013BD8((uint64_t)&v25);
  }
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_10000BC14(v9, (uint64_t)qword_10002A018);
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "FenceNotificationContentService: No subscription identifier. Nothing else to do.", v12, 2u);
    swift_slowDealloc();
  }

  swift_retain_n();
  NSString v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    v24[0] = v16;
    id v17 = [*(id *)(v1 + 16) body:v16];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v20 = v19;

    *(void *)&long long v25 = sub_10001B53C(v18, v20, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "FenceNotificationContentService: Completing with best attempt %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v21 = *(void (**)(void))(v1 + 32);
  id v22 = *(void **)(v1 + 16);
  swift_retain();
  id v23 = v22;
  v21();
  swift_release();
}

void sub_100013090(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    goto LABEL_9;
  }
  id v13 = a1;
  if ((sub_1000146A8() & 1) == 0)
  {

LABEL_9:
    if (a4)
    {
      swift_errorRetain();
      if (qword_100028EB8 != -1) {
        swift_once();
      }
      sub_10000BC14(v9, (uint64_t)qword_10002A018);
      swift_errorRetain();
      swift_errorRetain();
      long long v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        v65[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136315138;
        swift_getErrorValue();
        uint64_t v28 = Error.localizedDescription.getter();
        *(void *)&long long v63 = sub_10001B53C(v28, v29, (uint64_t *)v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "FenceNotificationContentService: Failed to fetch data for payload, error: %s.", v27, 0xCu);
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
    else
    {
      unint64_t v30 = self;
      v65[0] = a3;
      sub_10000BBD0((uint64_t *)&unk_100029350);
      uint64_t v31 = Optional._bridgeToObjectiveC()();
      v65[0] = 0;
      id v32 = [v30 archivedDataWithRootObject:v31 requiringSecureCoding:1 error:v65];
      swift_unknownObjectRelease();
      id v33 = v65[0];
      if (v32)
      {
        id v59 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v35 = v34;
      }
      else
      {
        long long v39 = v33;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        swift_errorRelease();
        id v59 = 0;
        unint64_t v35 = 0xF000000000000000;
      }
      if (qword_100028EB8 != -1) {
        swift_once();
      }
      sub_10000BC14(v9, (uint64_t)qword_10002A018);
      id v40 = a3;
      uint64_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = (void *)swift_slowAlloc();
        unint64_t v58 = v35;
        v65[0] = v44;
        *(_DWORD *)uint64_t v43 = 136315138;
        *(void *)&long long v63 = a3;
        id v45 = v40;
        uint64_t v46 = String.init<A>(describing:)();
        *(void *)&long long v63 = sub_10001B53C(v46, v47, (uint64_t *)v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "FenceNotificationContentService: Successfully replaced payload with location: %s.", v43, 0xCu);
        swift_arrayDestroy();
        unint64_t v35 = v58;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v48 = (uint64_t)v59;
      [*(id *)(a5 + 16) mutableCopy];
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100013C58();
      if (swift_dynamicCast())
      {
        uint64_t v49 = (void *)v63;
        *(void *)&long long v63 = 0x6E6F697461636F6CLL;
        *((void *)&v63 + 1) = 0xE800000000000000;
        AnyHashable.init<A>(_:)();
        if (v35 >> 60 == 15)
        {
          long long v63 = 0u;
          long long v64 = 0u;
        }
        else
        {
          *((void *)&v64 + 1) = &type metadata for Data;
          *(void *)&long long v63 = v48;
          *((void *)&v63 + 1) = v35;
        }
        sub_100013CAC(v48, v35);
        id v50 = [v49 userInfo];
        uint64_t v51 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v61 = v51;
        if (v35 >> 60 == 15)
        {
          sub_100013BD8((uint64_t)&v63);
          sub_100013D18((uint64_t)v65, v62);
          sub_10000C018((uint64_t)v65);
          sub_100013BD8((uint64_t)v62);
        }
        else
        {
          sub_10000D09C(&v63, v62);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v60 = v51;
          sub_1000142F8(v62, (uint64_t)v65, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
          sub_10000C018((uint64_t)v65);
        }
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v49 setUserInfo:isa];
        sub_100013C98(v48, v35);

        uint64_t v54 = *(void **)(a5 + 16);
        *(void *)(a5 + 16) = v49;
      }
      else
      {
        sub_100013C98(v48, v35);
      }
    }
    uint64_t v55 = *(void (**)(void))(a5 + 32);
    uint64_t v56 = *(void **)(a5 + 16);
    swift_retain();
    id v38 = v56;
    v55();
    goto LABEL_35;
  }
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10000BC14(v9, (uint64_t)qword_10002A018);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v14, v9);
  id v15 = v13;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v16, v17))
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_18;
  }
  unint64_t v58 = a5;
  uint64_t v18 = (uint8_t *)swift_slowAlloc();
  uint64_t v57 = (void *)swift_slowAlloc();
  v65[0] = v57;
  *(_DWORD *)uint64_t v18 = 136315138;
  id v59 = v15;
  id v19 = [v15 identifier:v57];
  if (v19)
  {
    unint64_t v20 = v19;
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v23 = v22;

    *(void *)&long long v63 = sub_10001B53C(v21, v23, (uint64_t *)v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    id v24 = v59;

    id v15 = v24;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "FenceNotificationContentService: Handle %s is on block list, ignoring!", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a5 = v58;
LABEL_18:
    uint64_t v36 = *(void (**)(void))(a5 + 32);
    id v37 = objc_allocWithZone((Class)UNNotificationContent);
    swift_retain();
    id v38 = [v37 init];
    v36();

LABEL_35:
    swift_release();

    return;
  }

  __break(1u);
}

void sub_1000139E0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = *(void (**)(void *, void *, void *, void *))(a1 + 32);
  swift_retain();
  id v13 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v9(a2, a3, a4, a5);
  swift_release();
}

uint64_t sub_100013AA4()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for FenceNotificationContentService()
{
  return self;
}

id sub_100013B10()
{
  return *(id *)(*(void *)v0 + 16);
}

void sub_100013B1C()
{
}

id sub_100013B80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMFSessionDelegateTrampoline();
  return [super dealloc];
}

uint64_t type metadata accessor for FMFSessionDelegateTrampoline()
{
  return self;
}

uint64_t sub_100013BD8(uint64_t a1)
{
  uint64_t v2 = sub_10000BBD0(&qword_100029348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100013C38(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_100013090(a1, a2, a3, a4, v4);
}

uint64_t sub_100013C40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013C50()
{
  return swift_release();
}

unint64_t sub_100013C58()
{
  unint64_t result = qword_100029098;
  if (!qword_100029098)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029098);
  }
  return result;
}

uint64_t sub_100013C98(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000D184(a1, a2);
  }
  return a1;
}

uint64_t sub_100013CAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100013CC0(a1, a2);
  }
  return a1;
}

uint64_t sub_100013CC0(uint64_t a1, unint64_t a2)
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

double sub_100013D18@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10001BCF4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000144C0();
      uint64_t v9 = v11;
    }
    sub_10000C018(*(void *)(v9 + 48) + 40 * v6);
    sub_10000D09C((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_10001412C(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_100013E14(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000BBD0((uint64_t *)&unk_100029360);
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10000D09C((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10000D1DC(v25, (uint64_t)&v38);
      sub_10000D238(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10000D09C(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_10001412C(unint64_t result, uint64_t a2)
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
        sub_10000D1DC(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        uint64_t result = sub_10000C018((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              _OWORD *v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *unint64_t v22 = v24 & v23;
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
  return result;
}

_OWORD *sub_1000142F8(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_10001BCF4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1000144C0();
      goto LABEL_7;
    }
    sub_100013E14(v13, a3 & 1);
    unint64_t v19 = sub_10001BCF4(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10000D1DC(a2, (uint64_t)v21);
      return sub_100014444(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_10000D29C((uint64_t)v17);

  return sub_10000D09C(a1, v17);
}

_OWORD *sub_100014444(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_10000D09C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_1000144C0()
{
  uint64_t v1 = v0;
  sub_10000BBD0((uint64_t *)&unk_100029360);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10000D1DC(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_10000D238(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10000D09C(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000146A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void (***)(char *, uint64_t, uint64_t))(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v54 - v7;
  int64_t v9 = &NotifyWhenFoundNotificationService;
  id v10 = [v1 identifier];
  if (!v10)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_100028EB0 != -1) {
    swift_once();
  }
  unint64_t v12 = (void *)static String.emailPredicate;
  NSString v13 = String._bridgeToObjectiveC()();
  LODWORD(v12) = [v12 evaluateWithObject:v13];
  swift_bridgeObjectRelease();

  id v14 = [v1 identifier];
  unint64_t v15 = v14;
  if (v12)
  {
    uint64_t v16 = CMFItemCreateWithEmailAddress();
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = qword_100028EB8;
      swift_unknownObjectRetain();
      if (v18 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_10000BC14(v2, (uint64_t)qword_10002A018);
      v3[2](v8, v19, v2);
      id v20 = v1;
      swift_unknownObjectRetain();
      int64_t v9 = (__objc2_class_ro *)v20;
      int64_t v21 = Logger.logObject.getter();
      int v22 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v21, (os_log_type_t)v22))
      {

        swift_unknownObjectRelease_n();
        ((void (*)(char *, uint64_t))v3[1])(v8, v2);
        goto LABEL_20;
      }
      LODWORD(v57) = v22;
      unint64_t v58 = v3;
      uint64_t v59 = v2;
      uint64_t v23 = swift_slowAlloc();
      id v56 = (id)swift_slowAlloc();
      uint64_t v61 = (uint64_t)v56;
      *(_DWORD *)uint64_t v23 = 136315394;
      id v24 = [(__objc2_class_ro *)v9 identifier];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v28 = v27;

        uint64_t v60 = sub_10001B53C(v26, v28, &v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2080;
        uint64_t v60 = v17;
        swift_unknownObjectRetain();
        uint64_t v29 = String.init<A>(describing:)();
        uint64_t v60 = sub_10001B53C(v29, v30, &v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v57, "FMFHandle+Blocklist: Handle %s is an email: %s", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        ((void (*)(char *, uint64_t))v58[1])(v8, v59);
LABEL_20:
        int IsItemBlocked = CMFBlockListIsItemBlocked();
        swift_unknownObjectRelease();
        return IsItemBlocked != 0;
      }
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (!v14)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v33 = v32;

  sub_10001297C(v31, v33);
  swift_bridgeObjectRelease();
  NSString v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v35 = (void *)CFPhoneNumberCreate();
  uint64_t v36 = CMFItemCreateWithPhoneNumber();
  if (!v36)
  {
LABEL_24:
    __break(1u);
LABEL_25:

    swift_unknownObjectRelease();
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v37 = v36;
  uint64_t v38 = qword_100028EB8;
  swift_unknownObjectRetain();
  if (v38 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_10000BC14(v2, (uint64_t)qword_10002A018);
  v3[2](v6, v39, v2);
  uint64_t v40 = v3;
  uint64_t v3 = v1;
  swift_unknownObjectRetain();
  uint64_t v41 = Logger.logObject.getter();
  uint64_t v42 = v2;
  os_log_type_t v43 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v41, v43))
  {

    swift_unknownObjectRelease_n();
    ((void (*)(char *, uint64_t))v40[1])(v6, v42);
    goto LABEL_20;
  }
  id v56 = v35;
  id v57 = v34;
  unint64_t v58 = v40;
  uint64_t v59 = v42;
  uint64_t v44 = swift_slowAlloc();
  uint64_t v55 = swift_slowAlloc();
  uint64_t v61 = v55;
  *(_DWORD *)uint64_t v44 = 136315394;
  id v45 = [v3 identifier];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v49 = v48;

    uint64_t v60 = sub_10001B53C(v47, v49, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    uint64_t v60 = v37;
    swift_unknownObjectRetain();
    uint64_t v50 = String.init<A>(describing:)();
    uint64_t v60 = sub_10001B53C(v50, v51, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, v43, "FMFHandle+Blocklist: Handle %s is a phone number: %s", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v58[1])(v6, v59);
    goto LABEL_20;
  }
LABEL_26:

  uint64_t result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_100014DF4()
{
  uint64_t v1 = type metadata accessor for Handle();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v40 - v6;
  Handle.identifier.getter();
  if (qword_100028EB0 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)static String.emailPredicate;
  NSString v9 = String._bridgeToObjectiveC()();
  LODWORD(v8) = [v8 evaluateWithObject:v9];
  swift_bridgeObjectRelease();

  uint64_t v10 = Handle.identifier.getter();
  if (v8)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t result = CMFItemCreateWithEmailAddress();
    if (result)
    {
      uint64_t v14 = result;
      uint64_t v15 = qword_100028EB8;
      swift_unknownObjectRetain();
      if (v15 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      sub_10000BC14(v16, (uint64_t)qword_10002A018);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v0, v1);
      swift_unknownObjectRetain();
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        id v41 = v12;
        uint64_t v20 = v19;
        uint64_t v43 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315394;
        uint64_t v21 = Handle.identifier.getter();
        uint64_t v42 = sub_10001B53C(v21, v22, &v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
        *(_WORD *)(v20 + 12) = 2080;
        uint64_t v42 = v14;
        swift_unknownObjectRetain();
        uint64_t v23 = String.init<A>(describing:)();
        uint64_t v42 = sub_10001B53C(v23, v24, &v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "FMFHandle+Blocklist: Handle %s is an email: %s", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

LABEL_14:
LABEL_18:
        int IsItemBlocked = CMFBlockListIsItemBlocked();
        swift_unknownObjectRelease();
        return IsItemBlocked != 0;
      }
      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);

      goto LABEL_17;
    }
    __break(1u);
  }
  else
  {
    sub_10001297C(v10, v11);
    swift_bridgeObjectRelease();
    NSString v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v26 = (void *)CFPhoneNumberCreate();
    uint64_t result = CMFItemCreateWithPhoneNumber();
    if (result)
    {
      uint64_t v27 = result;
      uint64_t v28 = qword_100028EB8;
      swift_unknownObjectRetain();
      if (v28 != -1) {
        swift_once();
      }
      uint64_t v29 = type metadata accessor for Logger();
      sub_10000BC14(v29, (uint64_t)qword_10002A018);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v0, v1);
      swift_unknownObjectRetain();
      unint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        id v41 = v26;
        uint64_t v33 = v32;
        uint64_t v34 = swift_slowAlloc();
        id v40 = v25;
        uint64_t v43 = v34;
        *(_DWORD *)uint64_t v33 = 136315394;
        uint64_t v35 = Handle.identifier.getter();
        uint64_t v42 = sub_10001B53C(v35, v36, &v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
        *(_WORD *)(v33 + 12) = 2080;
        uint64_t v42 = v27;
        swift_unknownObjectRetain();
        uint64_t v37 = String.init<A>(describing:)();
        uint64_t v42 = sub_10001B53C(v37, v38, &v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "FMFHandle+Blocklist: Handle %s is a phone number: %s", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        goto LABEL_14;
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
LABEL_17:
      swift_unknownObjectRelease_n();
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100015434()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100015480(v0, qword_10002A018);
  sub_10000BC14(v0, (uint64_t)qword_10002A018);
  return Logger.init()();
}

uint64_t *sub_100015480(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_100015570()
{
  uint64_t v1 = v0;
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000BC14(v2, (uint64_t)qword_10002A018);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "NotificationService: serviceExtensionTimeWillExpire", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void (**)(void *))(v1
                                     + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  if (v6)
  {
    uint64_t v7 = v1 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
    swift_beginAccess();
    sub_100015A8C(v7, (uint64_t)&v16);
    uint64_t v8 = *((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      uint64_t v9 = v18;
      uint64_t v10 = sub_100010C54(&v16, *((uint64_t *)&v17 + 1));
      uint64_t v11 = *(void *)(v8 - 8);
      __chkstk_darwin(v10);
      NSString v13 = &v15[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(unsigned char *))(v11 + 16))(v13);
      swift_retain();
      sub_100015AF4((uint64_t)&v16);
      uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
      (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v8);
      v6(v14);
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      swift_beginAccess();
      sub_100015A24((uint64_t)&v16, v7);
      swift_endAccess();
      sub_100015B54((uint64_t)v6);
    }
    else
    {
      sub_100015AF4((uint64_t)&v16);
    }
  }
}

id sub_100015844()
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
  swift_beginAccess();
  sub_100015A24((uint64_t)v4, v1);
  swift_endAccess();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for NotificationService();
  return [super dealloc];
}

uint64_t type metadata accessor for NotificationService()
{
  return self;
}

uint64_t sub_100015A24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BBD0(&qword_100029408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BBD0(&qword_100029408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015AF4(uint64_t a1)
{
  uint64_t v2 = sub_10000BBD0(&qword_100029408);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015B54(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100015B64(uint64_t (*a1)(void))
{
  return a1();
}

void sub_100015B8C(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  _Block_copy(a3);
  id v7 = [a1 content];
  id v8 = [v7 categoryIdentifier];

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  BOOL v12 = v9 == 0x45434E45464F4547 && v11 == 0xE800000000000000;
  if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = type metadata accessor for FenceNotificationContentService();
    uint64_t v14 = (void *)swift_allocObject();
    id v15 = objc_allocWithZone((Class)type metadata accessor for FMFSessionDelegateTrampoline());
    id v16 = a1;
    swift_retain();
    id v17 = [v15 init];
    id v18 = [objc_allocWithZone((Class)FMFSession) initWithDelegate:v17];

    v14[3] = v18;
    v14[4] = sub_100016674;
    v14[5] = v6;
    id v19 = [v16 content];

    v14[2] = v19;
    uint64_t v55 = v13;
    id v56 = &off_100025240;
    v54[0] = (uint64_t)v14;
LABEL_21:
    if (qword_100028EB8 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_10000BC14(v26, (uint64_t)qword_10002A018);
    sub_100016610((uint64_t)v54, (uint64_t)v53);
    id v27 = a1;
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    log = v28;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      os_log_type_t v31 = (void *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138412546;
      v51[0] = (uint64_t)v27;
      id v32 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v31 = v27;

      *(_WORD *)(v30 + 12) = 2080;
      sub_100016610((uint64_t)v53, (uint64_t)v51);
      sub_10000BBD0(&qword_100029410);
      uint64_t v33 = String.init<A>(describing:)();
      v51[0] = sub_10001B53C(v33, v34, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10000D29C((uint64_t)v53);
      _os_log_impl((void *)&_mh_execute_header, log, v29, "NotificationService: Handling request: %@ using %s", (uint8_t *)v30, 0x16u);
      sub_10000BBD0(&qword_100029058);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_10000D29C((uint64_t)v53);
    }
    uint64_t v35 = v55;
    unint64_t v36 = v56;
    sub_100010C54(v54, v55);
    ((void (*)(uint64_t, _UNKNOWN **))v36[4])(v35, v36);
    sub_100016610((uint64_t)v54, (uint64_t)v53);
    uint64_t v37 = a2 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
    swift_beginAccess();
    sub_100015A24((uint64_t)v53, v37);
    swift_endAccess();
    sub_10000D29C((uint64_t)v54);
    swift_release();
    return;
  }
  BOOL v20 = v9 == 0x465F594649544F4ELL && v11 == 0xEC000000444E554FLL;
  if (v20 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t found = type metadata accessor for NotifyWhenFoundNotificationService();
    swift_allocObject();
    id v22 = a1;
    swift_retain();
    uint64_t v23 = sub_10000BAE8(v22, (uint64_t)sub_100016674, v6);

    swift_release();
    unint64_t v24 = &off_100024CE8;
LABEL_20:
    uint64_t v55 = found;
    id v56 = v24;
    v54[0] = (uint64_t)v23;
    goto LABEL_21;
  }
  if (v9 == 0x4F4C5F524546464FLL && v11 == 0xEE004E4F49544143
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v9 == 0x525F455449564E49 && v11 == 0xEF45534E4F505345)
  {
    swift_bridgeObjectRelease();
LABEL_19:
    uint64_t found = type metadata accessor for LocationSharingContentService();
    swift_allocObject();
    id v25 = a1;
    swift_retain();
    uint64_t v23 = sub_10001E4E0(v25, (uint64_t)sub_100016674, v6);

    unint64_t v24 = &off_1000252E0;
    goto LABEL_20;
  }
  char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v38) {
    goto LABEL_19;
  }
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v39 = type metadata accessor for Logger();
  sub_10000BC14(v39, (uint64_t)qword_10002A018);
  id v40 = a1;
  id v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    v54[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315138;
    id v44 = [v40 content];
    id v45 = [v44 categoryIdentifier];

    uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v48 = v47;

    v53[0] = sub_10001B53C(v46, v48, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "NotificationService: Unknown category: %s, using provided content.", v43, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v49 = [v40 content];
  ((void (**)(void, id))a3)[2](a3, v49);
  swift_release();
}

uint64_t sub_100016440(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_100028EB8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000BC14(v7, (uint64_t)qword_10002A018);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "NotificationService: didReceiveNotification", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = (uint64_t (**)())(a2 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  uint64_t v12 = *(void *)(a2 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  *uint64_t v11 = sub_1000165FC;
  v11[1] = (uint64_t (*)())v6;
  swift_retain();
  sub_100015B54(v12);
  _Block_copy(a3);
  sub_100015B8C(a1, a2, (void (**)(void, void))a3);
  _Block_release(a3);

  return swift_release();
}

uint64_t sub_1000165C4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000165FC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100016610(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001667C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  os_log_type_t v42 = a6;
  uint64_t v49 = a5;
  uint64_t v45 = a4;
  uint64_t v46 = a2;
  uint64_t v54 = a3;
  uint64_t v7 = type metadata accessor for Handle();
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v53 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v55 = (char *)&v42 - v11;
  __chkstk_darwin(v10);
  unint64_t v48 = (char *)&v42 - v13;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v43 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  int64_t v44 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v50 = v12 + 32;
  uint64_t v51 = a1;
  uint64_t v52 = v12;
  unint64_t v47 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v21 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      uint64_t v23 = v55;
      goto LABEL_24;
    }
    int64_t v24 = v19 + 1;
    uint64_t v23 = v55;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v24 >= v44) {
      goto LABEL_41;
    }
    unint64_t v25 = *(void *)(v43 + 8 * v24);
    ++v19;
    if (!v25)
    {
      int64_t v19 = v24 + 1;
      if (v24 + 1 >= v44) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v43 + 8 * v19);
      if (!v25)
      {
        int64_t v19 = v24 + 2;
        if (v24 + 2 >= v44) {
          goto LABEL_41;
        }
        unint64_t v25 = *(void *)(v43 + 8 * v19);
        if (!v25)
        {
          int64_t v19 = v24 + 3;
          if (v24 + 3 >= v44) {
            goto LABEL_41;
          }
          unint64_t v25 = *(void *)(v43 + 8 * v19);
          if (!v25)
          {
            int64_t v26 = v24 + 4;
            if (v26 >= v44)
            {
LABEL_41:
              swift_release();
              uint64_t v40 = 1;
              id v41 = v42;
              goto LABEL_47;
            }
            unint64_t v25 = *(void *)(v43 + 8 * v26);
            int64_t v19 = v26;
            if (!v25) {
              break;
            }
          }
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_24:
    uint64_t v27 = v52;
    uint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v52 + 16);
    os_log_type_t v29 = v48;
    v28(v48, *(void *)(v51 + 48) + *(void *)(v52 + 72) * v22, v7);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v30(v23, v29, v7);
    uint64_t v31 = Handle.serverID.getter();
    if (v32)
    {
      if (v54)
      {
        if (v31 == v46 && v32 == v54)
        {
          swift_bridgeObjectRelease();
          unint64_t v34 = v53;
          v28(v53, (unint64_t)v23, v7);
LABEL_43:
          (*v47)(v34, v7);
          swift_release();
          goto LABEL_46;
        }
        char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        unint64_t v34 = v53;
        v28(v53, (unint64_t)v23, v7);
        if (v33) {
          goto LABEL_43;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v34 = v53;
        v28(v53, (unint64_t)v23, v7);
      }
    }
    else
    {
      unint64_t v34 = v53;
      v28(v53, (unint64_t)v23, v7);
      if (!v54) {
        goto LABEL_43;
      }
    }
    uint64_t v35 = Handle.serverID.getter();
    if (!v36)
    {
      BOOL v20 = *v47;
      uint64_t v39 = v49;
      swift_bridgeObjectRetain();
      v20(v34, v7);
      if (!v39) {
        goto LABEL_45;
      }
      goto LABEL_5;
    }
    if (!v49)
    {
      BOOL v20 = *v47;
      (*v47)(v53, v7);
LABEL_5:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    uint64_t v37 = v47;
    if (v35 == v45 && v36 == v49)
    {
      (*v47)(v53, v7);
      swift_bridgeObjectRelease();
LABEL_45:
      swift_release();
      uint64_t v23 = v55;
LABEL_46:
      id v41 = v42;
      v30(v42, v23, v7);
      uint64_t v40 = 0;
LABEL_47:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v41, v40, 1, v7);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
    BOOL v20 = *v37;
    (*v37)(v53, v7);
    swift_bridgeObjectRelease();
    if (v38) {
      goto LABEL_45;
    }
LABEL_6:
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v20)(v55, v7);
  }
  while (1)
  {
    int64_t v19 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v19 >= v44) {
      goto LABEL_41;
    }
    unint64_t v25 = *(void *)(v43 + 8 * v19);
    ++v26;
    if (v25) {
      goto LABEL_23;
    }
  }
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_100016BD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000BBD0(&qword_1000290F0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_10000D4F4((uint64_t)v4, &qword_1000290F0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_100029570;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100016E1C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000D650;
  return sub_100016EAC();
}

uint64_t sub_100016EAC()
{
  v1[51] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[52] = v2;
  v1[53] = *(void *)(v2 - 8);
  v1[54] = swift_task_alloc();
  v1[55] = swift_task_alloc();
  v1[56] = swift_task_alloc();
  return _swift_task_switch(sub_100016F88, 0, 0);
}

uint64_t sub_100016F88()
{
  uint64_t v28 = v0;
  uint64_t My = type metadata accessor for Feature.FindMy();
  v0[13] = My;
  v0[14] = sub_10001E990(&qword_100029518, (void (*)(uint64_t))&type metadata accessor for Feature.FindMy);
  uint64_t v2 = sub_10001B4D8(v0 + 10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(My - 8) + 104))(v2, enum case for Feature.FindMy.fencesMigration(_:), My);
  LOBYTE(My) = isFeatureEnabled(_:)();
  sub_10000D29C((uint64_t)(v0 + 10));
  if (My)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[60] = v3;
    void *v3 = v0;
    v3[1] = sub_100018368;
    return sub_100019014();
  }
  else
  {
    uint64_t v5 = (void *)v0[51];
    uint64_t v6 = (void *)v5[4];
    v0[57] = v6;
    if (v6)
    {
      uint64_t v7 = qword_100028EB8;
      id v8 = v6;
      if (v7 != -1) {
        swift_once();
      }
      v0[58] = sub_10000BC14(v0[52], (uint64_t)qword_10002A018);
      swift_retain_n();
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.default.getter();
      BOOL v11 = os_log_type_enabled(v9, v10);
      uint64_t v12 = v0[51];
      if (v11)
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315138;
        uint64_t v27 = v26;
        id v14 = [*(id *)(v12 + 16) userInfo];
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v15 = Dictionary.description.getter();
        unint64_t v17 = v16;
        swift_bridgeObjectRelease();
        v0[50] = sub_10001B53C(v15, v17, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "LocationSharingContentService: Handling: %s", v13, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      unint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        int64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "LocationSharingContentService: Requesting force refresh", v24, 2u);
        swift_slowDealloc();
      }

      v0[2] = v0;
      v0[3] = sub_1000174B4;
      uint64_t v25 = swift_continuation_init();
      v0[15] = _NSConcreteStackBlock;
      v0[16] = 0x40000000;
      v0[17] = sub_1000186C8;
      v0[18] = &unk_100025308;
      v0[19] = v25;
      [v8 forceRefreshWithCompletion:v0 + 15];
      return _swift_continuation_await(v0 + 2);
    }
    else
    {
      id v18 = (void (*)(void))v5[5];
      int64_t v19 = (void *)v5[2];
      swift_retain();
      id v20 = v19;
      v18();

      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v21 = (uint64_t (*)(void))v0[1];
      return v21();
    }
  }
}

uint64_t sub_1000174B4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 472) = v1;
  if (v1) {
    uint64_t v2 = sub_1000184B8;
  }
  else {
    uint64_t v2 = sub_1000175C4;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_1000175C4()
{
  uint64_t v116 = v0;
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LocationSharingContentService: Force refresh completed", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 408);

  id v5 = [*(id *)(v4 + 16) userInfo];
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)(v0 + 312) = 7565409;
  *(void *)(v0 + 320) = 0xE300000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_10001BCF4(v0 + 160), (v8 & 1) != 0))
  {
    sub_10000D238(*(void *)(v6 + 56) + 32 * v7, v0 + 200);
  }
  else
  {
    *(_OWORD *)(v0 + 200) = 0u;
    *(_OWORD *)(v0 + 216) = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000C018(v0 + 160);
  if (*(void *)(v0 + 224))
  {
    uint64_t v9 = (uint64_t *)(v0 + 384);
    sub_10000BBD0(&qword_100029520);
    if (swift_dynamicCast())
    {
      uint64_t v10 = *v9;
      if (*(void *)(*v9 + 16) && (unint64_t v11 = sub_10001BD38(0x6469646E65697266, 0xE800000000000000), (v12 & 1) != 0))
      {
        sub_10000D238(*(void *)(v10 + 56) + 32 * v11, v0 + 232);
        int v13 = swift_dynamicCast();
        if (v13) {
          uint64_t v14 = *(void *)(v0 + 296);
        }
        else {
          uint64_t v14 = 0;
        }
        if (v13) {
          uint64_t v15 = *(void *)(v0 + 304);
        }
        else {
          uint64_t v15 = 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
      }
      if (*(void *)(v10 + 16) && (unint64_t v26 = sub_10001BD38(0x6552646E65697266, 0xEF64497473657571), (v27 & 1) != 0))
      {
        sub_10000D238(*(void *)(v10 + 56) + 32 * v26, v0 + 264);
      }
      else
      {
        *(_OWORD *)(v0 + 264) = 0u;
        *(_OWORD *)(v0 + 280) = 0u;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 288))
      {
        int v28 = swift_dynamicCast();
        if (v28) {
          uint64_t v29 = *(void *)(v0 + 328);
        }
        else {
          uint64_t v29 = 0;
        }
        if (v28) {
          uint64_t v30 = *(void *)(v0 + 336);
        }
        else {
          uint64_t v30 = 0;
        }
        if (!(v15 | v30)) {
          goto LABEL_39;
        }
      }
      else
      {
        sub_10000D4F4(v0 + 264, &qword_100029348);
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if (!v15)
        {
LABEL_39:
          unint64_t v16 = Logger.logObject.getter();
          os_log_type_t v17 = static os_log_type_t.error.getter();
          if (!os_log_type_enabled(v16, v17)) {
            goto LABEL_21;
          }
          id v18 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v18 = 0;
          int64_t v19 = "LocationSharingContentService: No friend identifier detected, returning default content.";
          goto LABEL_20;
        }
      }
      id v31 = [*(id *)(v0 + 456) getHandlesWithPendingOffers];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v34 = (void *)sub_100018760(v33);
        swift_bridgeObjectRelease();
        if (v34)
        {
          uint64_t v114 = v14;
          id v35 = [*(id *)(v0 + 456) getHandlesSharingLocationsWithMe];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

            unint64_t v38 = sub_100018760(v37);
            swift_bridgeObjectRelease();
            if (v38)
            {
              sub_100018D64(v38, v34);
              uint64_t v40 = v39;
              swift_bridgeObjectRetain_n();
              id v41 = Logger.logObject.getter();
              os_log_type_t v42 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v41, v42))
              {
                logb = v41;
                os_log_type_t typea = v42;
                uint64_t v43 = (uint8_t *)swift_slowAlloc();
                v115[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v43 = 136315138;
                buf = v43;
                sub_10001E804();
                sub_10001E990(&qword_100029558, (void (*)(uint64_t))sub_10001E804);
                swift_bridgeObjectRetain();
                uint64_t v44 = Set.description.getter();
                unint64_t v46 = v45;
                swift_bridgeObjectRelease();
                *(void *)(v0 + 376) = sub_10001B53C(v44, v46, v115);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                id v41 = logb;
                _os_log_impl((void *)&_mh_execute_header, logb, typea, "LocationSharingContentService: Found handles: %s", buf, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {
                swift_bridgeObjectRelease_n();
              }

              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_10001E0BC(v40, v114, v15, v29, v30);
              unint64_t v48 = v47;
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              if (!v48)
              {
                id v20 = *(void **)(v0 + 456);
                unint64_t v22 = *(void (**)(void))(*(void *)(v0 + 408) + 40);
                goto LABEL_22;
              }
              uint64_t v49 = (uint8_t *)(v0 + 368);
              uint64_t v50 = *(void *)(v0 + 424);
              char v51 = sub_1000146A8();
              uint64_t v52 = *(NSObject **)(v50 + 16);
              uint64_t v53 = *(void *)(v0 + 464);
              uint64_t v54 = *(void *)(v0 + 416);
              if (v51)
              {
                ((void (*)(void, uint64_t, uint64_t))v52)(*(void *)(v0 + 448), v53, v54);
                id v55 = v48;
                id v56 = Logger.logObject.getter();
                os_log_type_t v57 = static os_log_type_t.default.getter();
                if (!os_log_type_enabled(v56, v57))
                {
                  uint64_t v74 = *(void *)(v0 + 448);
                  uint64_t v75 = *(void *)(v0 + 416);
                  uint64_t v76 = *(void *)(v0 + 424);

                  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v74, v75);
                  goto LABEL_62;
                }
                unint64_t v58 = (uint8_t *)swift_slowAlloc();
                v115[0] = swift_slowAlloc();
                *(_DWORD *)unint64_t v58 = 136315138;
                id v59 = [v55 identifier];
                if (v59)
                {
                  uint64_t v60 = v59;
                  uint64_t v61 = *(void *)(v0 + 424);
                  os_log_t v107 = *(os_log_t *)(v0 + 416);
                  *(void *)typeb = *(void *)(v0 + 448);
                  uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                  unint64_t v64 = v63;

                  *(void *)(v0 + 368) = sub_10001B53C(v62, v64, v115);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_bridgeObjectRelease();

                  _os_log_impl((void *)&_mh_execute_header, v56, v57, "LocationSharingContentService: Handle %s is on block list, ignoring!", v58, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  (*(void (**)(os_log_type_t *, os_log_t))(v61 + 8))(*(os_log_type_t **)typeb, v107);
LABEL_62:
                  id v20 = *(void **)(v0 + 456);
                  uint64_t v77 = *(void (**)(void))(*(void *)(v0 + 408) + 40);
                  id v78 = objc_allocWithZone((Class)UNNotificationContent);
                  swift_retain();
                  id v79 = [v78 init];
                  v77();

                  swift_release();
                  goto LABEL_23;
                }

                __break(1u);
                goto LABEL_71;
              }
              ((void (*)(void, uint64_t, uint64_t))v52)(*(void *)(v0 + 440), v53, v54);
              unint64_t v58 = v48;
              char v65 = Logger.logObject.getter();
              os_log_type_t v66 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v65, v66))
              {
                os_log_type_t type = v65;
                os_log_t log = v52;
                long long v67 = (uint8_t *)swift_slowAlloc();
                v115[0] = swift_slowAlloc();
                *(_DWORD *)long long v67 = 136315138;
                id v68 = [(uint8_t *)v58 identifier];
                if (!v68)
                {
LABEL_71:

                  __break(1u);
                  goto LABEL_72;
                }
                long long v69 = v68;
                uint64_t v101 = *(void *)(v0 + 424);
                uint64_t v103 = *(void *)(v0 + 416);
                bufa = *(uint8_t **)(v0 + 440);
                uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v72 = v71;

                *(void *)(v0 + 360) = sub_10001B53C(v70, v72, v115);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();

                _os_log_impl((void *)&_mh_execute_header, type, v66, "LocationSharingContentService: Handle %s is **not** on block list, proceeding with alert.", v67, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                long long v73 = *(void (**)(uint8_t *, uint64_t))(v101 + 8);
                v73(bufa, v103);
                ((void (*)(void, void, void))log)(*(void *)(v0 + 432), *(void *)(v0 + 464), *(void *)(v0 + 416));
              }
              else
              {
                uint64_t v80 = *(uint8_t **)(v0 + 440);
                uint64_t v82 = *(void *)(v0 + 416);
                uint64_t v81 = *(void *)(v0 + 424);

                long long v73 = *(void (**)(uint8_t *, uint64_t))(v81 + 8);
                v73(v80, v82);
                ((void (*)(void, void, void))v52)(*(void *)(v0 + 432), *(void *)(v0 + 464), *(void *)(v0 + 416));
              }
              uint64_t v49 = v58;
              uint64_t v83 = Logger.logObject.getter();
              os_log_type_t v84 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v83, v84))
              {
                os_log_type_t loga = v84;
                uint64_t v85 = swift_slowAlloc();
                v115[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v85 = 136315394;
                id v86 = [(uint8_t *)v49 identifier];
                if (!v86)
                {
LABEL_72:

                  __break(1u);
                  goto LABEL_73;
                }
                unsigned __int8 v87 = v86;
                uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v90 = v89;

                *(void *)(v0 + 344) = sub_10001B53C(v88, v90, v115);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();

                *(_WORD *)(v85 + 12) = 2080;
                id v91 = [(uint8_t *)v49 serverId];
                if (!v91)
                {
LABEL_73:

                  __break(1u);
                  return;
                }
                uint64_t v92 = v91;
                uint64_t v102 = *(void *)(v0 + 416);
                v104 = *(uint8_t **)(v0 + 432);
                uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v95 = v94;

                *(void *)(v0 + 352) = sub_10001B53C(v93, v95, v115);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();

                _os_log_impl((void *)&_mh_execute_header, v83, loga, "LocationSharingContentService: Found friend with handle %s aka %s", (uint8_t *)v85, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                v73(v104, v102);
              }
              else
              {
                uint64_t v96 = *(uint8_t **)(v0 + 432);
                uint64_t v97 = *(void *)(v0 + 416);

                v73(v96, v97);
              }
              id v20 = *(void **)(v0 + 456);
              uint64_t v98 = *(void (**)(void))(*(void *)(v0 + 408) + 40);
              unsigned __int8 v99 = *(void **)(v4 + 16);
              swift_retain();
              id v100 = v99;
              v98();

              swift_release();
              goto LABEL_23;
            }
          }
          swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v16, v17)) {
        goto LABEL_21;
      }
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      int64_t v19 = "LocationSharingContentService: Unable to retrive handles from fmfd.";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v19, v18, 2u);
      swift_slowDealloc();
      goto LABEL_21;
    }
  }
  else
  {
    sub_10000D4F4(v0 + 200, &qword_100029348);
  }
  unint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v18 = 0;
    int64_t v19 = "LocationSharingContentService: No aps dict detected, returning default content.";
    goto LABEL_20;
  }
LABEL_21:
  id v20 = *(void **)(v0 + 456);
  uint64_t v21 = *(void *)(v0 + 408);

  unint64_t v22 = *(void (**)(void))(v21 + 40);
LABEL_22:
  os_log_type_t v23 = *(void **)(v4 + 16);
  swift_retain();
  id v24 = v23;
  v22();

  swift_release();
LABEL_23:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(void (**)(void))(v0 + 8);
  v25();
}

uint64_t sub_100018368()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000184B8()
{
  swift_willThrow();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[49] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LocationSharingContentService: Failed to force refresh FMF due to: %{public}@", v3, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = (void *)v0[57];
  uint64_t v7 = v0[51];

  char v8 = *(void (**)(void))(v7 + 40);
  uint64_t v9 = *(void **)(v7 + 16);
  swift_retain();
  id v10 = v9;
  v8();

  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_1000186C8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_10000BBD0(&qword_1000290C0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_100018760(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000BBD0(&qword_100029560);
    uint64_t v2 = (void *)static _SetStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptySetSingleton;
  }
  uint64_t v27 = a1 + 56;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 7);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v8 << 6);
      int64_t v12 = v8;
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v13 >= v26) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v12 = v8 + 1;
    if (!v14)
    {
      int64_t v12 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_39;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_39;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v12);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v10 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_28:
    sub_10000D1DC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v28);
    v16.Class isa = AnyHashable._bridgeToObjectiveC()().isa;
    sub_10000C018((uint64_t)v28);
    self;
    uint64_t v17 = swift_dynamicCastObjCClass();
    if (!v17)
    {
      swift_release_n();

      sub_10000D294();
      return 0;
    }
    uint64_t v18 = v17;
    uint64_t result = NSObject._rawHashValue(seed:)(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    *(void *)(v2[6] + 8 * v9) = v18;
    ++v2[2];
    int64_t v8 = v12;
    unint64_t v5 = v10;
  }
  int64_t v15 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_39:
    swift_release();
    sub_10000D294();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v15);
  if (v14)
  {
    int64_t v12 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_100018AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Handle();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v11 = (char *)&v27 - v10;
  uint64_t result = __chkstk_darwin(v9);
  unint64_t v14 = (char *)&v27 - v13;
  int64_t v15 = 0;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v17 = a1 + 56;
  uint64_t v16 = v18;
  uint64_t v19 = 1 << *(unsigned char *)(v17 - 24);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v16;
  uint64_t v28 = v17;
  int64_t v29 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v30 = v5 + 16;
  while (1)
  {
    if (v21)
    {
      unint64_t v22 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      unint64_t v23 = v22 | (v15 << 6);
      goto LABEL_5;
    }
    int64_t v24 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v24 >= v29) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v24 + 1;
      if (v24 + 1 >= v29) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v15);
      if (!v25)
      {
        int64_t v15 = v24 + 2;
        if (v24 + 2 >= v29) {
          goto LABEL_23;
        }
        unint64_t v25 = *(void *)(v28 + 8 * v15);
        if (!v25)
        {
          int64_t v15 = v24 + 3;
          if (v24 + 3 >= v29) {
            goto LABEL_23;
          }
          unint64_t v25 = *(void *)(v28 + 8 * v15);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v21 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v14, *(void *)(v31 + 48) + *(void *)(v5 + 72) * v23, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v14, v4);
    sub_10001C1A0((uint64_t)v11, v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  }
  int64_t v26 = v24 + 4;
  if (v26 >= v29)
  {
LABEL_23:
    swift_release();
    return v32;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v15 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v15 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v15 >= v29) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v15);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_100018D64(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  v18[1] = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    sub_10001E804();
    sub_10001E990(&qword_100029558, (void (*)(uint64_t))sub_10001E804);
    Set.Iterator.init(_cocoa:)();
    unint64_t v2 = (unint64_t)v18[2];
    uint64_t v17 = v18[3];
    uint64_t v3 = (uint64_t)v18[4];
    id v4 = v18[5];
    unint64_t v5 = (unint64_t)v18[6];
  }
  else
  {
    id v4 = 0;
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = (void *)(a1 + 56);
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if ((v2 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | ((void)v4 << 6);
      int64_t v12 = (char *)v4;
      goto LABEL_29;
    }
    uint64_t v14 = (uint64_t)v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_32;
    }
    unint64_t v15 = v17[v14];
    int64_t v12 = (char *)v4 + 1;
    if (!v15)
    {
      int64_t v12 = (char *)v4 + 2;
      if ((uint64_t)v4 + 2 >= v9) {
        goto LABEL_32;
      }
      unint64_t v15 = v17[(void)v12];
      if (!v15)
      {
        int64_t v12 = (char *)v4 + 3;
        if ((uint64_t)v4 + 3 >= v9) {
          goto LABEL_32;
        }
        unint64_t v15 = v17[(void)v12];
        if (!v15)
        {
          int64_t v12 = (char *)v4 + 4;
          if ((uint64_t)v4 + 4 >= v9) {
            goto LABEL_32;
          }
          unint64_t v15 = v17[(void)v12];
          if (!v15)
          {
            int64_t v12 = (char *)v4 + 5;
            if ((uint64_t)v4 + 5 >= v9) {
              goto LABEL_32;
            }
            unint64_t v15 = v17[(void)v12];
            if (!v15)
            {
              uint64_t v16 = (char *)v4 + 6;
              while ((char *)v9 != v16)
              {
                unint64_t v15 = v17[(void)v16++];
                if (v15)
                {
                  int64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_10000D294();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + ((void)v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_10001C4C4(v18, v13);

      id v4 = v12;
      unint64_t v5 = v10;
      if ((v2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        sub_10001E804();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v18[0];
        swift_unknownObjectRelease();
        int64_t v12 = (char *)v4;
        uint64_t v10 = v5;
        if (v13) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_100019014()
{
  v1[38] = v0;
  sub_10000BBD0(&qword_100029510);
  v1[39] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for Friend();
  v1[40] = v2;
  v1[41] = *(void *)(v2 - 8);
  v1[42] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Handle();
  v1[43] = v3;
  v1[44] = *(void *)(v3 - 8);
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  v1[50] = swift_task_alloc();
  v1[51] = swift_task_alloc();
  return _swift_task_switch(sub_1000191AC, 0, 0);
}

uint64_t sub_1000191AC()
{
  unint64_t v23 = v0;
  uint64_t My = type metadata accessor for Feature.FindMy();
  v0[5] = My;
  v0[6] = sub_10001E990(&qword_100029518, (void (*)(uint64_t))&type metadata accessor for Feature.FindMy);
  uint64_t v2 = sub_10001B4D8(v0 + 2);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(My - 8) + 104))(v2, enum case for Feature.FindMy.fencesMigration(_:), My);
  LOBYTE(My) = isFeatureEnabled(_:)();
  sub_10000D29C((uint64_t)(v0 + 2));
  if (My)
  {
    if (qword_100028EB8 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    v0[52] = sub_10000BC14(v3, (uint64_t)qword_10002A018);
    swift_retain_n();
    id v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = v0[38];
    if (v6)
    {
      os_log_type_t type = v5;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v22 = v20;
      id v9 = [*(id *)(v7 + 16) userInfo];
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v10 = Dictionary.description.getter();
      unint64_t v12 = v11;
      swift_bridgeObjectRelease();
      v0[37] = sub_10001B53C(v10, v12, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v4, type, "LocationSharingContentService: Handling: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "LocationSharingContentService: Requesting force refresh", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = v0[38];

    v0[53] = *(void *)(v18 + 24);
    uint64_t v19 = (void *)swift_task_alloc();
    v0[54] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_100019608;
    return Session.forceRefreshClient()();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_100019608()
{
  *(void *)(*(void *)v1 + 440) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10001AAA4;
  }
  else {
    uint64_t v2 = sub_10001971C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001971C()
{
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LocationSharingContentService: Force refresh completed", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 304);

  id v5 = [*(id *)(v4 + 16) userInfo];
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)(v0 + 224) = 7565409;
  *(void *)(v0 + 232) = 0xE300000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_10001BCF4(v0 + 56), (v8 & 1) != 0))
  {
    sub_10000D238(*(void *)(v6 + 56) + 32 * v7, v0 + 96);
  }
  else
  {
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000C018(v0 + 56);
  if (!*(void *)(v0 + 120))
  {
    sub_10000D4F4(v0 + 96, &qword_100029348);
    goto LABEL_15;
  }
  sub_10000BBD0(&qword_100029520);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v15, v16))
    {
LABEL_18:
      uint64_t v19 = *(void *)(v0 + 304);

      uint64_t v20 = *(void (**)(void))(v19 + 40);
      unint64_t v21 = *(void **)(v4 + 16);
      swift_retain();
      id v22 = v21;
      v20();

      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
      return v23();
    }
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    uint64_t v18 = "LocationSharingContentService: No aps dict detected, returning default content.";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v18, v17, 2u);
    swift_slowDealloc();
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)(v0 + 280);
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {
LABEL_22:
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  unint64_t v11 = sub_10001BD38(0x6469646E65697266, 0xE800000000000000);
  if ((v12 & 1) == 0)
  {
    uint64_t v10 = 0;
    goto LABEL_22;
  }
  sub_10000D238(*(void *)(v9 + 56) + 32 * v11, v0 + 160);
  int v13 = swift_dynamicCast();
  uint64_t v10 = *(void *)(v0 + 192);
  if (v13)
  {
    uint64_t v14 = *(void *)(v0 + 200);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v14 = 0;
  }
LABEL_23:
  *(void *)(v0 + 448) = v10;
  *(void *)(v0 + 456) = v14;
  if (*(void *)(v9 + 16) && (unint64_t v25 = sub_10001BD38(0x6552646E65697266, 0xEF64497473657571), (v26 & 1) != 0))
  {
    sub_10000D238(*(void *)(v9 + 56) + 32 * v25, v0 + 128);
  }
  else
  {
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 152))
  {
    int v27 = swift_dynamicCast();
    uint64_t v28 = *(void *)(v0 + 208);
    uint64_t v29 = *(void *)(v0 + 216);
    if (!v27)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }
  }
  else
  {
    sub_10000D4F4(v0 + 128, &qword_100029348);
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  *(void *)(v0 + 464) = v28;
  *(void *)(v0 + 472) = v29;
  if (!(v14 | v29))
  {
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_18;
    }
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    uint64_t v18 = "LocationSharingContentService: No friend identifier detected, returning default content.";
    goto LABEL_17;
  }
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 480) = v30;
  *uint64_t v30 = v0;
  v30[1] = sub_100019BF0;
  return Session.friendsWithPendingOffers()();
}

uint64_t sub_100019BF0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 488) = a1;
  *(void *)(v3 + 496) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10001ACDC;
  }
  else {
    uint64_t v4 = sub_100019D04;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100019D04()
{
  uint64_t v1 = v0[61];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[44];
    uint64_t v4 = v0[41];
    uint64_t v19 = &_swiftEmptyArrayStorage;
    sub_10001DE5C(0, v2, 0);
    id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v4 += 16;
    uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    uint64_t v17 = *(void *)(v4 + 56);
    uint64_t v18 = v5;
    unint64_t v7 = (void (**)(uint64_t, uint64_t))(v4 - 8);
    char v8 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v9 = v0[42];
      uint64_t v10 = v0[40];
      v18(v9, v6, v10);
      Friend.handle.getter();
      (*v7)(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10001DE5C(0, v8[2] + 1, 1);
        char v8 = v19;
      }
      unint64_t v12 = v8[2];
      unint64_t v11 = v8[3];
      if (v12 >= v11 >> 1)
      {
        sub_10001DE5C(v11 > 1, v12 + 1, 1);
        char v8 = v19;
      }
      uint64_t v13 = v0[51];
      uint64_t v14 = v0[43];
      v8[2] = v12 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v12, v13, v14);
      uint64_t v19 = v8;
      v6 += v17;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v8 = &_swiftEmptyArrayStorage;
  }
  v0[63] = sub_10001E664((uint64_t)v8);
  swift_bridgeObjectRelease();
  unint64_t v15 = (void *)swift_task_alloc();
  v0[64] = v15;
  *unint64_t v15 = v0;
  v15[1] = sub_100019F38;
  return Session.friendsSharingLocationsWithMe()();
}

uint64_t sub_100019F38(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 520) = a1;
  *(void *)(v3 + 528) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10001AF28;
  }
  else {
    uint64_t v4 = sub_10001A050;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10001A050()
{
  unint64_t v95 = v0;
  uint64_t v1 = v0[65];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[44];
    uint64_t v4 = v0[41];
    v94[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10001DE5C(0, v2, 0);
    id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v4 += 16;
    uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    *(void *)os_log_type_t type = *(void *)(v4 + 56);
    unint64_t v89 = v5;
    unint64_t v7 = (void (**)(uint64_t, uint64_t))(v4 - 8);
    uint64_t v0 = v93;
    char v8 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v9 = v0[42];
      uint64_t v10 = v0[40];
      v89(v9, v6, v10);
      Friend.handle.getter();
      (*v7)(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10001DE5C(0, v8[2] + 1, 1);
        char v8 = (void *)v94[0];
      }
      unint64_t v12 = v8[2];
      unint64_t v11 = v8[3];
      uint64_t v0 = v93;
      if (v12 >= v11 >> 1)
      {
        sub_10001DE5C(v11 > 1, v12 + 1, 1);
        uint64_t v0 = v93;
        char v8 = (void *)v94[0];
      }
      uint64_t v13 = v0[50];
      uint64_t v14 = v0[43];
      v8[2] = v12 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v12, v13, v14);
      v94[0] = (uint64_t)v8;
      v6 += *(void *)type;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v8 = &_swiftEmptyArrayStorage;
  }
  uint64_t v15 = v0[63];
  os_log_type_t v16 = v0;
  uint64_t v17 = sub_10001E664((uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_100018AA0(v17, v15);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    v94[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v21 = 136315138;
    sub_10001E990(&qword_100029528, (void (*)(uint64_t))&type metadata accessor for Handle);
    swift_bridgeObjectRetain();
    uint64_t v22 = Set.description.getter();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    v0[34] = sub_10001B53C(v22, v24, v94);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "LocationSharingContentService: Found handles: %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v25 = v0[58];
  uint64_t v26 = v0[59];
  uint64_t v28 = v0[56];
  uint64_t v27 = v0[57];
  uint64_t v30 = v0[43];
  uint64_t v29 = v0[44];
  uint64_t v31 = (char *)v16[39];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10001667C(v18, v28, v27, v25, v26, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v31, 1, v30) == 1)
  {
    uint64_t v32 = v16[38];
    sub_10000D4F4(v16[39], &qword_100029510);
    uint64_t v33 = *(void (**)(void))(v32 + 40);
    unint64_t v34 = *(void **)(v32 + 16);
    swift_retain();
    id v35 = v34;
    v33();

    swift_release();
  }
  else
  {
    uint64_t v36 = v16[44];
    (*(void (**)(void, void, void))(v36 + 32))(v16[49], v16[39], v16[43]);
    char v37 = sub_100014DF4();
    unint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
    uint64_t v39 = v16[49];
    uint64_t v40 = v16[43];
    if (v37)
    {
      v38(v16[48], v39, v40);
      id v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.default.getter();
      BOOL v43 = os_log_type_enabled(v41, v42);
      uint64_t v44 = v16[48];
      uint64_t v45 = v16[44];
      if (v43)
      {
        uint64_t v90 = v16[43];
        unint64_t v46 = (uint8_t *)swift_slowAlloc();
        v94[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v46 = 136315138;
        uint64_t v47 = Handle.identifier.getter();
        v16[33] = sub_10001B53C(v47, v48, v94);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
        v49(v44, v90);
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "LocationSharingContentService: Handle %s is on block list, ignoring!", v46, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
        v49(v16[48], v16[43]);
      }

      os_log_type_t v16 = v93;
      uint64_t v59 = v93[49];
      uint64_t v60 = v93[43];
      uint64_t v61 = *(void (**)(void))(v93[38] + 40);
      id v62 = objc_allocWithZone((Class)UNNotificationContent);
      swift_retain();
      id v63 = [v62 init];
      v61();

      swift_release();
      v49(v59, v60);
    }
    else
    {
      v38(v16[47], v39, v40);
      uint64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.default.getter();
      BOOL v52 = os_log_type_enabled(v50, v51);
      uint64_t v53 = v16[47];
      uint64_t v54 = v16[44];
      if (v52)
      {
        uint64_t v91 = v16[43];
        id v55 = (uint8_t *)swift_slowAlloc();
        v94[0] = swift_slowAlloc();
        *(_DWORD *)id v55 = 136315138;
        uint64_t v56 = Handle.identifier.getter();
        v16[32] = sub_10001B53C(v56, v57, v94);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v58 = v91;
        uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        v92(v53, v58);
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "LocationSharingContentService: Handle %s is **not** on block list, proceeding with alert.", v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        v92(v53, v16[43]);
      }

      os_log_type_t v16 = v93;
      uint64_t v64 = v93[49];
      uint64_t v65 = v93[45];
      uint64_t v66 = v93[43];
      v38(v93[46], v64, v66);
      v38(v65, v64, v66);
      long long v67 = Logger.logObject.getter();
      os_log_type_t v68 = static os_log_type_t.default.getter();
      BOOL v69 = os_log_type_enabled(v67, v68);
      uint64_t v71 = v93[45];
      uint64_t v70 = v93[46];
      uint64_t v72 = v93[43];
      if (v69)
      {
        uint64_t v73 = swift_slowAlloc();
        v94[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v73 = 136315394;
        uint64_t v74 = Handle.identifier.getter();
        v93[30] = sub_10001B53C(v74, v75, v94);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v92(v70, v72);
        *(_WORD *)(v73 + 12) = 2080;
        uint64_t v76 = Handle.serverID.getter();
        if (v77)
        {
          unint64_t v78 = v77;
        }
        else
        {
          uint64_t v76 = 0x3E6C696E3CLL;
          unint64_t v78 = 0xE500000000000000;
        }
        v93[31] = sub_10001B53C(v76, v78, v94);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v92(v71, v72);
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "LocationSharingContentService: Found friend with handle %s aka %s", (uint8_t *)v73, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        id v79 = v92;
        swift_slowDealloc();
      }
      else
      {
        id v79 = v92;
        v92(v93[46], v93[43]);
        v92(v71, v72);
      }
      uint64_t v80 = v93[49];
      uint64_t v81 = v93[43];
      uint64_t v82 = v93[38];
      uint64_t v83 = *(void (**)(void))(v82 + 40);
      os_log_type_t v84 = *(void **)(v82 + 16);
      swift_retain();
      id v85 = v84;
      v83();

      swift_release();
      v79(v80, v81);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v86 = (uint64_t (*)(void))v16[1];
  return v86();
}

uint64_t sub_10001AAA4()
{
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[36] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LocationSharingContentService: Failed to force refresh FML due to: %{public}@", v3, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[38];

  unint64_t v7 = *(void (**)(void))(v6 + 40);
  char v8 = *(void **)(v6 + 16);
  swift_retain();
  id v9 = v8;
  v7();

  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10001ACDC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[36] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LocationSharingContentService: Failed to force refresh FML due to: %{public}@", v3, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[38];

  unint64_t v7 = *(void (**)(void))(v6 + 40);
  char v8 = *(void **)(v6 + 16);
  swift_retain();
  id v9 = v8;
  v7();

  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10001AF28()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[36] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "LocationSharingContentService: Failed to force refresh FML due to: %{public}@", v3, 0xCu);
    sub_10000BBD0(&qword_100029058);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[38];

  unint64_t v7 = *(void (**)(void))(v6 + 40);
  char v8 = *(void **)(v6 + 16);
  swift_retain();
  id v9 = v8;
  v7();

  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10001B180()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for LocationSharingContentService()
{
  return self;
}

uint64_t sub_10001B1F4()
{
  return sub_100016BD8();
}

uint64_t sub_10001B218(uint64_t result, unsigned char **a2)
{
  os_log_type_t v2 = *a2;
  *os_log_type_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001B228(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001B264(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001B340;
  return v6(a1);
}

uint64_t sub_10001B340()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001B438(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001B460(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001B53C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t *sub_10001B4D8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001B53C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001B610(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D238((uint64_t)v12, *a3);
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
      sub_10000D238((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D29C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001B610(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001B7CC(a5, a6);
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

uint64_t sub_10001B7CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001B864(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001BA44(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001BA44(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001B864(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001B9DC(v2, 0);
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

void *sub_10001B9DC(uint64_t a1, uint64_t a2)
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
  sub_10000BBD0(&qword_100029530);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001BA44(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000BBD0(&qword_100029530);
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

unsigned char **sub_10001BB94(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_10001BBA4(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
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

unint64_t sub_10001BC5C(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_10001E990(&qword_100029080, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_10001BDB0(a1, v2);
}

unint64_t sub_10001BCF4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001BF70(a1, v4);
}

unint64_t sub_10001BD38(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001C038(a1, a2, v4);
}

unint64_t sub_10001BDB0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
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
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10001E990((unint64_t *)&unk_100029580, (void (*)(uint64_t))&type metadata accessor for UUID);
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

unint64_t sub_10001BF70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000D1DC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000C018((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10001C038(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10001C11C(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t sub_10001C1A0(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Handle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_10001E990(&qword_100029528, (void (*)(uint64_t))&type metadata accessor for Handle);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    os_log_type_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    BOOL v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_10001E990(&qword_100029538, (void (*)(uint64_t))&type metadata accessor for Handle);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      BOOL v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    BOOL v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_10001CFC8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_10001C4C4(void *a1, void *a2)
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

      sub_10001E804();
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
    Swift::Int v22 = sub_10001C744(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10001CD28();
      unint64_t v23 = v28;
    }
    else
    {
      unint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10001C11C((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
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
      sub_10001E804();
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
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10001D268((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10001C744(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000BBD0(&qword_100029560);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_10001E804();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10001CD28();
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

uint64_t sub_10001C92C()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for Handle();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  id v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_10000BBD0(&qword_100029540);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    char v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    id v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      id v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_10001E990(&qword_100029528, (void (*)(uint64_t))&type metadata accessor for Handle);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_10001CD28()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000BBD0(&qword_100029560);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v28 = v0;
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
                  void *v6 = -1 << v27;
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
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10001CFC8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for Handle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_10001C92C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10001D3E0();
      goto LABEL_12;
    }
    sub_10001D830();
  }
  uint64_t v12 = *v3;
  sub_10001E990(&qword_100029528, (void (*)(uint64_t))&type metadata accessor for Handle);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_10001E990(&qword_100029538, (void (*)(uint64_t))&type metadata accessor for Handle);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_10001D268(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10001CD28();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10001D684();
      goto LABEL_14;
    }
    sub_10001DBE0();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10001E804();
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

void *sub_10001D3E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Handle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBD0(&qword_100029540);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

id sub_10001D684()
{
  uint64_t v1 = v0;
  sub_10000BBD0(&qword_100029560);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
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

uint64_t sub_10001D830()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Handle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_10000BBD0(&qword_100029540);
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_10001E990(&qword_100029528, (void (*)(uint64_t))&type metadata accessor for Handle);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10001DBE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000BBD0(&qword_100029560);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v28 = v0;
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

uint64_t sub_10001DE5C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001DE7C(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10001DE7C(char a1, int64_t a2, char a3, void *a4)
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
  sub_10000BBD0(&qword_100029548);
  uint64_t v10 = *(void *)(type metadata accessor for Handle() - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for Handle() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  int64_t v18 = (char *)v13 + v17;
  Swift::Int v19 = (char *)a4 + v17;
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
  uint64_t v21 = &v18[v20];
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

void sub_10001E0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10001E804();
    sub_10001E990(&qword_100029558, (void (*)(uint64_t))sub_10001E804);
    Set.Iterator.init(_cocoa:)();
    uint64_t v5 = v39;
    uint64_t v36 = v40;
    uint64_t v6 = v41;
    int64_t v7 = v42;
    unint64_t v8 = v43;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v36 = a1 + 56;
    uint64_t v10 = ~v9;
    uint64_t v11 = -v9;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v8 = v12 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v6 = v10;
    int64_t v7 = 0;
  }
  uint64_t v32 = v6;
  int64_t v35 = (unint64_t)(v6 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  if (!__CocoaSet.Iterator.next()()) {
    goto LABEL_51;
  }
  sub_10001E804();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v13 = v44;
  swift_unknownObjectRelease();
  uint64_t v14 = v8;
  if (!v44) {
    goto LABEL_51;
  }
  while (1)
  {
    id v21 = [v13 serverId:v32];
    if (v21)
    {
      unint64_t v22 = v21;
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v25 = v24;

      if (a3)
      {
        if (v23 == a2 && v25 == a3)
        {
LABEL_50:
          swift_bridgeObjectRelease();
          goto LABEL_51;
        }
        char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v26) {
          goto LABEL_51;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else if (!a3)
    {
      goto LABEL_51;
    }
    id v27 = [v13 serverId];
    if (!v27)
    {
      if (!a5) {
        goto LABEL_51;
      }
LABEL_12:

      unint64_t v8 = v14;
      if (v5 < 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    unint64_t v28 = v27;
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v31 = v30;

    if (a5)
    {
      if (v29 == a4 && v31 == a5) {
        goto LABEL_50;
      }
      char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_51;
      }
      goto LABEL_12;
    }

    swift_bridgeObjectRelease();
    unint64_t v8 = v14;
    if (v5 < 0) {
      goto LABEL_8;
    }
LABEL_13:
    if (!v8) {
      break;
    }
    uint64_t v14 = (v8 - 1) & v8;
    unint64_t v16 = __clz(__rbit64(v8)) | (v7 << 6);
LABEL_31:
    id v13 = *(id *)(*(void *)(v5 + 48) + 8 * v16);
    if (!v13) {
      goto LABEL_51;
    }
  }
  int64_t v17 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    return;
  }
  int64_t v18 = v7;
  if (v17 >= v35) {
    goto LABEL_51;
  }
  unint64_t v19 = *(void *)(v36 + 8 * v17);
  ++v7;
  if (v19) {
    goto LABEL_30;
  }
  int64_t v7 = v17 + 1;
  if (v17 + 1 >= v35) {
    goto LABEL_51;
  }
  unint64_t v19 = *(void *)(v36 + 8 * v7);
  if (v19) {
    goto LABEL_30;
  }
  int64_t v7 = v17 + 2;
  if (v17 + 2 >= v35) {
    goto LABEL_51;
  }
  unint64_t v19 = *(void *)(v36 + 8 * v7);
  if (v19) {
    goto LABEL_30;
  }
  int64_t v7 = v17 + 3;
  if (v17 + 3 >= v35) {
    goto LABEL_51;
  }
  unint64_t v19 = *(void *)(v36 + 8 * v7);
  if (v19) {
    goto LABEL_30;
  }
  int64_t v7 = v17 + 4;
  if (v17 + 4 >= v35) {
    goto LABEL_51;
  }
  unint64_t v19 = *(void *)(v36 + 8 * v7);
  if (v19)
  {
LABEL_30:
    uint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v7 << 6);
    goto LABEL_31;
  }
  uint64_t v20 = v18 + 6;
  while (v35 != v20)
  {
    unint64_t v19 = *(void *)(v36 + 8 * v20++);
    if (v19)
    {
      int64_t v7 = v20 - 1;
      goto LABEL_30;
    }
  }
LABEL_51:
  sub_10000D294();
}

void *sub_10001E4E0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for ClientOrigin();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Session();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for ClientOrigin.findMyApp(_:), v8);
  uint64_t v12 = static Session.sharedSession(origin:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v4[3] = v12;
  id v13 = [objc_allocWithZone((Class)type metadata accessor for FMFSessionDelegateTrampoline()) init];
  id v14 = [objc_allocWithZone((Class)FMFSession) initWithDelegate:v13];

  v4[4] = v14;
  v4[5] = a2;
  v4[6] = a3;
  _OWORD v4[2] = [a1 content];
  return v4;
}

uint64_t sub_10001E664(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Handle();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_10001E990(&qword_100029528, (void (*)(uint64_t))&type metadata accessor for Handle);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v17 = result;
  if (v9)
  {
    id v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_10001C1A0((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

unint64_t sub_10001E804()
{
  unint64_t result = qword_100029550;
  if (!qword_100029550)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029550);
  }
  return result;
}

uint64_t sub_10001E844()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001E884()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000D400;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000D650;
  return sub_100016EAC();
}

uint64_t sub_10001E958()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E990(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t type metadata accessor for Feature.FindMy()
{
  return type metadata accessor for Feature.FindMy();
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

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t static CharacterSet.decimalDigits.getter()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t static CharacterSet.controlCharacters.getter()
{
  return static CharacterSet.controlCharacters.getter();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

Swift::Void __swiftcall CharacterSet.insert(charactersIn:)(Swift::String charactersIn)
{
}

uint64_t CharacterSet.insert(_:)()
{
  return CharacterSet.insert(_:)();
}

uint64_t CharacterSet.contains(_:)()
{
  return CharacterSet.contains(_:)();
}

uint64_t CharacterSet.formUnion(_:)()
{
  return CharacterSet.formUnion(_:)();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
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

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for ClientOrigin()
{
  return type metadata accessor for ClientOrigin();
}

uint64_t Friend.handle.getter()
{
  return Friend.handle.getter();
}

uint64_t type metadata accessor for Friend()
{
  return type metadata accessor for Friend();
}

uint64_t Handle.identifier.getter()
{
  return Handle.identifier.getter();
}

uint64_t Handle.serverID.getter()
{
  return Handle.serverID.getter();
}

uint64_t type metadata accessor for Handle()
{
  return type metadata accessor for Handle();
}

uint64_t static Session.sharedSession(origin:)()
{
  return static Session.sharedSession(origin:)();
}

uint64_t type metadata accessor for Session()
{
  return type metadata accessor for Session();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
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

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
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

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.UnicodeScalarView.append(_:)()
{
  return String.UnicodeScalarView.append(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return String.Index.utf16Offset<A>(in:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF16View.count.getter()
{
  return String.UTF16View.count.getter();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
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

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
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

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
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

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return StringProtocol.components(separatedBy:)();
}

uint64_t StringProtocol.rangeOfCharacter(from:options:range:)()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
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

NSObject __swiftcall AnyHashable._bridgeToObjectiveC()()
{
  return (NSObject)AnyHashable._bridgeToObjectiveC()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
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

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
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

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return _CMFBlockListIsItemBlocked();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return _CMFItemCreateWithEmailAddress();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return _CMFItemCreateWithPhoneNumber();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return _CPPhoneNumberCopyActiveCountryCode();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return _CPPhoneNumberCopyHomeCountryCode();
}

uint64_t CPPhoneNumberCopyLastKnownNetworkCountryCode()
{
  return _CPPhoneNumberCopyLastKnownNetworkCountryCode();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return _CPPhoneNumberCopyNetworkCountryCode();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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