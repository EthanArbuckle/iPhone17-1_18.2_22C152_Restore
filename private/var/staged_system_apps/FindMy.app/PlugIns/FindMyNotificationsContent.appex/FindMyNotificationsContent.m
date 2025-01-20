uint64_t sub_100004D60()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_100009DE0(v0, qword_10001F028);
  sub_100009D50(v0, (uint64_t)qword_10001F028);
  return Logger.init(subsystem:category:)();
}

void sub_100004DCC()
{
  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for NotificationViewController();
  [super viewDidLoad];
  uint64_t My = type metadata accessor for Feature.FindMy();
  v21[3] = My;
  v21[4] = sub_100008428(&qword_10001EA90, (void (*)(uint64_t))&type metadata accessor for Feature.FindMy);
  v2 = sub_100009F68(v21);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(My - 8) + 104))(v2, enum case for Feature.FindMy.fencesMigration(_:), My);
  LOBYTE(My) = isFeatureEnabled(_:)();
  sub_100009FCC((uint64_t)v21);
  if ((My & 1) == 0)
  {
    id v3 = [objc_allocWithZone((Class)FMFSession) initWithDelegate:v0];
    v4 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession];
    *(void *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession] = v3;
  }
  id v5 = [v0 view];
  if (v5)
  {
    v6 = v5;
    type metadata accessor for NotificationView();
    if (!swift_dynamicCastClass())
    {
LABEL_11:

      return;
    }
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      v8 = Strong;
      [Strong setScrollEnabled:1];

      v9 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v9)
      {
        v10 = v9;
        [v9 setZoomEnabled:1];

        v11 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v11)
        {
          v12 = v11;
          [v11 setDelegate:v0];

          uint64_t v13 = swift_unknownObjectWeakLoadStrong();
          if (v13)
          {
            v14 = (void *)v13;
            sub_10000A01C(0, &qword_10001EA98);
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            NSString v16 = String._bridgeToObjectiveC()();
            [v14 registerClass:ObjCClassFromMetadata forAnnotationViewWithReuseIdentifier:v16];

            uint64_t v17 = swift_unknownObjectWeakLoadStrong();
            if (v17)
            {
              v18 = (void *)v17;
              type metadata accessor for FMPersonAnnotationView();
              uint64_t v19 = swift_getObjCClassFromMetadata();
              NSString v20 = String._bridgeToObjectiveC()();
              [v18 registerClass:v19 forAnnotationViewWithReuseIdentifier:v20];

              v6 = v20;
              goto LABEL_11;
            }
LABEL_17:
            __break(1u);
            return;
          }
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
}

void sub_1000050D0(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for NotificationViewController();
  [super viewDidDisappear:a1 & 1];
  id v3 = [v1 view];
  if (v3)
  {
    v4 = v3;
    type metadata accessor for NotificationView();
    if (swift_dynamicCastClass())
    {
      Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (!Strong)
      {
        __break(1u);
        return;
      }
      v6 = Strong;
      [Strong removeFromSuperview];

      v4 = v6;
    }
  }
  uint64_t v7 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession;
  v8 = *(void **)&v1[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession];
  if (v8)
  {
    [v8 setDelegate:0];
    v9 = *(void **)&v1[v7];
  }
  else
  {
    v9 = 0;
  }
  *(void *)&v1[v7] = 0;
}

void sub_100005214(void *a1)
{
  v2 = v1;
  id v3 = [a1 request];
  id v4 = [v3 content];

  id v5 = [v4 userInfo];
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v7 = (void *)sub_10000589C(v6);
  swift_bridgeObjectRelease();
  if (v7)
  {
    id v8 = [a1 request];
    id v9 = [v8 content];

    id v10 = [v9 body];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    v14 = (uint64_t *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText];
    uint64_t *v14 = v11;
    v14[1] = v13;
    swift_bridgeObjectRelease();
    if (v7[2]
      && (unint64_t v15 = sub_10000AA80(0x6F4C796150666D66, 0xEA00000000006461), (v16 & 1) != 0)
      && (sub_100009C24(v7[7] + 32 * v15, (uint64_t)v58), swift_dynamicCast()))
    {
      swift_bridgeObjectRelease();
      char v17 = 1;
    }
    else
    {
      char v17 = 0;
    }
    v18 = (void *)sub_100008E84((uint64_t)v7, v17);
    uint64_t v19 = v18;
    if (v18)
    {
      [v18 coordinate];
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
    }
    v26 = &v2[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates];
    *(void *)v26 = v20;
    *((void *)v26 + 1) = v21;
    v26[16] = v19 == 0;
    v27 = (void *)sub_100005CD8((uint64_t)v7, v17);
    v28 = (void *)sub_100005FD4((uint64_t)v7, v17, a1);
    if (qword_10001E7A0 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_100009D50(v29, (uint64_t)qword_10001F028);
    id v30 = v27;
    id v31 = v19;
    id v32 = v28;
    id v33 = v30;
    id v34 = v31;
    id v35 = v32;
    v36 = Logger.logObject.getter();
    os_log_type_t type = static os_log_type_t.default.getter();
    uint64_t v53 = (uint64_t)v28;
    v56 = v33;
    if (os_log_type_enabled(v36, type))
    {
      v55 = v35;
      uint64_t v37 = swift_slowAlloc();
      v58[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315650;
      v52 = v27;
      id v38 = v34;
      sub_100009AE8(&qword_10001EA60);
      uint64_t v39 = String.init<A>(describing:)();
      sub_10000882C(v39, v40, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      id v41 = v55;
      sub_100009AE8(&qword_10001EA68);
      uint64_t v42 = String.init<A>(describing:)();
      sub_10000882C(v42, v43, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      v27 = v52;
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 22) = 2080;
      id v44 = v33;
      uint64_t v45 = String.init<A>(describing:)();
      sub_10000882C(v45, v46, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, type, "fence trigger location [%s], contact [%s], fence location [%s] for notification", (uint8_t *)v37, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v35 = v55;
      swift_slowDealloc();
    }
    else
    {
    }
    v47 = v34;
    id v48 = [v2 view];
    if (v48)
    {
      v49 = v48;
      type metadata accessor for NotificationView();
      uint64_t v50 = swift_dynamicCastClass();
      if (v50)
      {
        v51 = (void *)v50;
        sub_100006324(a1, v50, v7, v19 != 0);
        swift_bridgeObjectRelease();
        sub_100009118(v27);
        sub_1000070F8(v19, v53);
        sub_10000934C(v27, v19, v51);

        return;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_10001E7A0 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100009D50(v22, (uint64_t)qword_10001F028);
    v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "User info is not available in notification", v25, 2u);
      swift_slowDealloc();
    }

    sub_100007450();
  }
}

unint64_t sub_10000589C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100009AE8(&qword_10001EA80);
    v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = &_swiftEmptyDictionarySingleton;
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
        sub_100009F50();
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
    sub_100009E98(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_100009C24(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_100009E98((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_100009EF4((uint64_t)v30, &qword_10001EA88);
      swift_bridgeObjectRelease();
      sub_100009F50();
      swift_release();
      return 0;
    }
    sub_100009C24((uint64_t)v31 + 8, (uint64_t)v25);
    sub_100009EF4((uint64_t)v30, &qword_10001EA88);
    sub_100009F58(v25, v26);
    long long v27 = v24;
    sub_100009F58(v26, v28);
    long long v16 = v27;
    sub_100009F58(v28, v29);
    sub_100009F58(v29, &v27);
    unint64_t result = sub_10000AA80(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      id v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      _OWORD *v8 = v16;
      id v9 = (_OWORD *)(v2[7] + 32 * v17);
      sub_100009FCC((uint64_t)v9);
      unint64_t result = (unint64_t)sub_100009F58(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_100009F58(&v27, (_OWORD *)(v2[7] + 32 * result));
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

uint64_t sub_100005CD8(uint64_t a1, char a2)
{
  if (a2) {
    uint64_t v2 = 0xE800000000000000;
  }
  else {
    uint64_t v2 = 0xED00006E6F697461;
  }
  if (!*(void *)(a1 + 16)
    || ((a2 & 1) == 0 ? (uint64_t v4 = 0x636F4C65636E6566) : (uint64_t v4 = 0x6E6F697461636F6CLL),
        unint64_t v5 = sub_10000AA80(v4, v2),
        (v6 & 1) == 0))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_100009C24(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_18:
    sub_100009EF4((uint64_t)&v20, &qword_10001EA48);
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    if (qword_10001E7A0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100009D50(v12, (uint64_t)qword_10001F028);
    int64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      int64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Location is not available in notification", v15, 2u);
      swift_slowDealloc();
    }

    sub_100007450();
    return 0;
  }
  sub_10000A01C(0, &qword_10001EA50);
  sub_10000A01C(0, &qword_10001EA58);
  uint64_t v7 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  uint64_t v16 = v7;
  if (v7)
  {
    sub_100009D88(v18, v19);
    return v16;
  }
  if (qword_10001E7A0 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100009D50(v8, (uint64_t)qword_10001F028);
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Error decoding fence locations data", v11, 2u);
    swift_slowDealloc();
  }

  sub_100007450();
  sub_100009D88(v18, v19);
  return 0;
}

uint64_t sub_100005FD4(uint64_t a1, char a2, void *a3)
{
  if (a2) {
    return 0;
  }
  if (*(void *)(a1 + 16) && (unint64_t v5 = sub_10000AA80(0x6148646E65697266, 0xEC000000656C646ELL), (v6 & 1) != 0)) {
    sub_100009C24(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v26);
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  id v7 = [a3 request];
  id v8 = [v7 content];

  id v9 = [v8 categoryIdentifier];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  if (v10 == 0xD000000000000010 && v12 == 0x8000000100014040)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      goto LABEL_15;
    }
  }
  id v14 = [objc_allocWithZone((Class)ACAccountStore) init];
  id v15 = [v14 aa_primaryAppleAccount];

  if (v15 && (id v16 = [v15 username], v15, v16))
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    *((void *)&v25 + 1) = &type metadata for String;
    *(void *)&long long v24 = v17;
    *((void *)&v24 + 1) = v19;
    sub_100009EF4((uint64_t)v26, &qword_10001EA48);
  }
  else
  {
    sub_100009EF4((uint64_t)v26, &qword_10001EA48);
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_100009CE8((uint64_t)&v24, (uint64_t)v26);
LABEL_15:
  sub_100009C80((uint64_t)v26, (uint64_t)&v24);
  if (!*((void *)&v25 + 1))
  {
    sub_100009EF4((uint64_t)&v24, &qword_10001EA48);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_26:
    sub_100009EF4((uint64_t)v26, &qword_10001EA48);
    return 0;
  }
  swift_retain();
  unint64_t v20 = dispatch thunk of FMFContactsDataController.searchInStore(handle:keysToFetch:)();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v20)
  {
    uint64_t v22 = 0;
    goto LABEL_30;
  }
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v22) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v22)
    {
LABEL_24:
      swift_bridgeObjectRelease();
LABEL_30:
      sub_100009EF4((uint64_t)v26, &qword_10001EA48);
      return v22;
    }
  }
  if ((v20 & 0xC000000000000001) != 0)
  {
    id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_23;
  }
  if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v23 = *(id *)(v20 + 32);
LABEL_23:
    uint64_t v22 = (uint64_t)v23;
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

void sub_100006324(void *a1, uint64_t a2, void *a3, int a4)
{
  v89 = a3;
  int v87 = a4;
  uint64_t v91 = a2;
  id v88 = a1;
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  uint64_t v84 = *(void *)(v4 - 8);
  uint64_t v85 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v86 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009AE8(&qword_10001EA30);
  ((void (*)(void))__chkstk_darwin)();
  id v7 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v14 = (char *)&v84 - v13;
  uint64_t v15 = type metadata accessor for TimeZone();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [objc_allocWithZone((Class)NSDateFormatter) init];
  static TimeZone.autoupdatingCurrent.getter();
  Class isa = TimeZone._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  [v19 setTimeZone:isa];

  [v19 setTimeStyle:1];
  id v21 = v88;
  id v22 = [v88 request];
  id v23 = [v22 content];

  id v24 = [v23 date];
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_5;
  }
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  long long v25 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v25(v7, v12, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
LABEL_5:
    v26 = v21;
    id v27 = [v21 date];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100009EF4((uint64_t)v7, &qword_10001EA30);
    goto LABEL_6;
  }
  v25(v14, v7, v8);
  v26 = v21;
LABEL_6:
  Class v28 = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  uint64_t v29 = v19;
  id v30 = [v19 stringFromDate:v28];

  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v91 = v32;

  id v33 = [v26 request];
  id v34 = [v33 content];

  id v35 = [v34 categoryIdentifier];
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v38 = v37;

  uint64_t v39 = (uint64_t)v89;
  if (v89[2])
  {
    unint64_t v40 = sub_10000AA80(0x6F4C796150666D66, 0xEA00000000006461);
    if (v41)
    {
      sub_100009C24(*(void *)(v39 + 56) + 32 * v40, (uint64_t)v92);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = (void *)sub_100005FD4(v39, 1, v26);
LABEL_14:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (!Strong)
        {
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        id v44 = (void *)Strong;
        id v45 = [v21 request];
        id v46 = [v45 content];

        NSString v47 = [v46 body];
        if (v47) {
          goto LABEL_21;
        }
        static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_20:
        NSString v47 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
LABEL_21:
        [v44 setText:v47];
LABEL_22:

        v56 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v56)
        {
          v57 = v56;
          [v56 sizeToFit];

          return;
        }
        __break(1u);
        goto LABEL_36;
      }
    }
  }
  uint64_t v42 = (void *)sub_100005FD4(v39, 0, v26);
  if ((v87 & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v90 = v31;
  if (v36 == 0xD000000000000010 && v38 == 0x8000000100014040)
  {
    swift_bridgeObjectRelease();
LABEL_18:
    uint64_t v49 = swift_unknownObjectWeakLoadStrong();
    if (!v49)
    {
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    id v44 = (void *)v49;
    id v50 = [self mainBundle];
    v51._countAndFlagsBits = 0xD00000000000002BLL;
    v93._object = (void *)0xE000000000000000;
    v51._object = (void *)0x80000001000140E0;
    v52.value._object = (void *)0x8000000100014090;
    v52.value._countAndFlagsBits = 0xD000000000000012;
    v53._countAndFlagsBits = 0;
    v53._object = (void *)0xE000000000000000;
    v93._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v51, v52, (NSBundle)v50, v53, v93);

    sub_100009AE8(&qword_10001EA38);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_1000135B0;
    *(void *)(v54 + 56) = &type metadata for String;
    *(void *)(v54 + 64) = sub_100009BD0();
    uint64_t v55 = v91;
    *(void *)(v54 + 32) = v90;
    *(void *)(v54 + 40) = v55;
    String.init(format:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v48) {
    goto LABEL_18;
  }
  if (v42)
  {
    id v58 = v42;
    PersonNameComponents.init()();
    if ([v58 isKeyAvailable:CNContactNicknameKey])
    {
      id v59 = [v58 nickname];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      PersonNameComponents.nickname.setter();
    }
    if ([v58 isKeyAvailable:CNContactGivenNameKey])
    {
      id v60 = [v58 givenName];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      PersonNameComponents.givenName.setter();
    }
    v89 = v29;
    if ([v58 isKeyAvailable:CNContactFamilyNameKey])
    {
      id v61 = [v58 familyName];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      PersonNameComponents.familyName.setter();
    }
    v62 = self;
    v63 = v86;
    Class v64 = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    id v65 = [v62 localizedStringFromPersonNameComponents:v64 style:1 options:0];

    uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v68 = v67;

    (*(void (**)(char *, uint64_t))(v84 + 8))(v63, v85);
    uint64_t v69 = swift_unknownObjectWeakLoadStrong();
    if (!v69) {
      goto LABEL_38;
    }
    id v44 = (void *)v69;
    id v70 = [self mainBundle];
    v71._countAndFlagsBits = 0xD00000000000002DLL;
    v94._object = (void *)0xE000000000000000;
    v71._object = (void *)0x80000001000140B0;
    v72.value._object = (void *)0x8000000100014090;
    v72.value._countAndFlagsBits = 0xD000000000000012;
    v73._countAndFlagsBits = 0;
    v73._object = (void *)0xE000000000000000;
    v94._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v71, v72, (NSBundle)v70, v73, v94);

    sub_100009AE8(&qword_10001EA38);
    uint64_t v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = xmmword_1000135A0;
    *(void *)(v74 + 56) = &type metadata for String;
    unint64_t v75 = sub_100009BD0();
    *(void *)(v74 + 32) = v66;
    *(void *)(v74 + 40) = v68;
    *(void *)(v74 + 96) = &type metadata for String;
    *(void *)(v74 + 104) = v75;
    uint64_t v76 = v90;
    *(void *)(v74 + 64) = v75;
    *(void *)(v74 + 72) = v76;
    *(void *)(v74 + 80) = v91;
    String.init(format:_:)();
    swift_bridgeObjectRelease();
    NSString v47 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v44 setText:v47];
    uint64_t v29 = v89;
    goto LABEL_22;
  }
  uint64_t v77 = swift_unknownObjectWeakLoadStrong();
  if (v77)
  {
    id v44 = (void *)v77;
    id v78 = [self mainBundle];
    v79._countAndFlagsBits = 0xD00000000000002ELL;
    v95._object = (void *)0xE000000000000000;
    v79._object = (void *)0x8000000100014060;
    v80.value._object = (void *)0x8000000100014090;
    v80.value._countAndFlagsBits = 0xD000000000000012;
    v81._countAndFlagsBits = 0;
    v81._object = (void *)0xE000000000000000;
    v95._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v79, v80, (NSBundle)v78, v81, v95);

    sub_100009AE8(&qword_10001EA38);
    uint64_t v82 = swift_allocObject();
    *(_OWORD *)(v82 + 16) = xmmword_1000135B0;
    *(void *)(v82 + 56) = &type metadata for String;
    *(void *)(v82 + 64) = sub_100009BD0();
    uint64_t v83 = v91;
    *(void *)(v82 + 32) = v90;
    *(void *)(v82 + 40) = v83;
    String.init(format:_:)();
    swift_bridgeObjectRelease();
    NSString v47 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v44 setText:v47];
    uint64_t v42 = 0;
    goto LABEL_22;
  }
LABEL_39:
  __break(1u);
}

void sub_100006F04(unint64_t a1, uint64_t a2, void *a3)
{
  if (a2) {
    return;
  }
  if (!a1) {
    goto LABEL_12;
  }
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    NSString v9 = 0;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_11;
  }
LABEL_5:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(a1 + 32);
  }
  id v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = [v7 name];

  if (!v8) {
    goto LABEL_12;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v9 = v10;
LABEL_13:
  id v11 = v9;
  [a3 setTitle:];
}

uint64_t sub_100007054(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10000A01C(0, &qword_10001EA78);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1000070F8(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_100009AE8(&qword_10001EA28);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = *(void **)(v2 + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer);
    if (a2)
    {
      if (!v8)
      {
        id v13 = a1;
        id v12 = 0;
LABEL_8:
        [a1 coordinate];
        double v15 = v14;
        double v17 = v16;
        [a1 horizontalAccuracy];
        double v19 = v18;
        uint64_t v20 = type metadata accessor for FMFFriend();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
        id v21 = objc_allocWithZone((Class)type metadata accessor for FMPersonAnnotation());
        id v22 = v12;
        id v23 = (void *)sub_10000BB4C((uint64_t)v7, v12, 0, v15, v17, v19);

        uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          long long v25 = Strong;
          [Strong addAnnotation:v23];

          [a1 coordinate];
          double v27 = v26;
          double v29 = v28;
          [a1 horizontalAccuracy];
          id v31 = [self circleWithCenterCoordinate:v27 radius:v29];
          uint64_t v32 = swift_unknownObjectWeakLoadStrong();
          if (v32)
          {
            id v33 = (void *)v32;
            id v34 = v31;
            [v33 addOverlay:v34];

            return;
          }
        }
        else
        {

          __break(1u);
        }

        __break(1u);
        return;
      }
      id v9 = a1;
      id v10 = [v8 monogramForContact:a2];
    }
    else
    {
      id v11 = a1;
      id v10 = [v8 silhouetteMonogram];
    }
    id v12 = v10;
    goto LABEL_8;
  }
}

void sub_10000737C(double a1, double a2, double a3, double a4)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v9 = Strong;
    [Strong setRegion:0 a1, a2, a3, a4];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000740C(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100007450()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A01C(0, &qword_10001E9F8);
  id v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_100009AC8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000740C;
  aBlock[3] = &unk_100018C20;
  id v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100008428(&qword_10001EA00, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100009AE8(&qword_10001EA08);
  sub_100009B2C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10000770C(char *a1)
{
  id v2 = [a1 view];
  if (!v2) {
    return;
  }
  id v22 = v2;
  type metadata accessor for NotificationView();
  if (swift_dynamicCastClass())
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v4 = Strong;
      [Strong setTranslatesAutoresizingMaskIntoConstraints:0];

      sub_100009AE8(&qword_10001EA18);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_1000135C0;
      uint64_t v6 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v6)
      {
        uint64_t v7 = v6;
        id v8 = [v6 widthAnchor];

        id v9 = [v8 constraintEqualToConstant:0.0];
        *(void *)(v5 + 32) = v9;
        uint64_t v10 = swift_unknownObjectWeakLoadStrong();
        if (v10)
        {
          id v11 = (void *)v10;
          id v12 = self;
          id v13 = [v11 heightAnchor];

          id v14 = [v13 constraintEqualToConstant:0.0];
          *(void *)(v5 + 40) = v14;
          specialized Array._endMutation()();
          sub_10000A01C(0, &qword_10001EA20);
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v12 activateConstraints:isa];

          uint64_t v16 = swift_unknownObjectWeakLoadStrong();
          if (v16)
          {
            double v17 = (void *)v16;
            if (*(void *)&a1[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText
                              + 8])
            {
              swift_bridgeObjectRetain();
              NSString v18 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            else
            {
              NSString v18 = 0;
            }
            [v17 setText:v18, v22, v5];

            uint64_t v20 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v20)
            {
              id v21 = v20;
              [v20 sizeToFit];

              double v19 = v21;
              goto LABEL_14;
            }
LABEL_21:
            __break(1u);
            return;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  double v19 = v22;
LABEL_14:
}

id sub_1000079DC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession] = 0;
  uint64_t v6 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer;
  id v7 = objc_allocWithZone((Class)CNMonogrammer);
  id v8 = v3;
  *(void *)&v3[v6] = [v7 initWithStyle:0 diameter:128.0];
  uint64_t v9 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_contactsDataController;
  type metadata accessor for FMFContactsDataController();
  swift_allocObject();
  *(void *)&v8[v9] = FMFContactsDataController.init(isSnapshotMode:)();
  uint64_t v10 = &v8[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  id v11 = &v8[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;

  if (a2)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for NotificationViewController();
  [super initWithNibName:v12 bundle:a3];

  return v13;
}

id sub_100007B7C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession] = 0;
  uint64_t v3 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer;
  id v4 = objc_allocWithZone((Class)CNMonogrammer);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 initWithStyle:0 diameter:128.0];
  uint64_t v6 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_contactsDataController;
  type metadata accessor for FMFContactsDataController();
  swift_allocObject();
  *(void *)&v5[v6] = FMFContactsDataController.init(isSnapshotMode:)();
  id v7 = &v5[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = &v5[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for NotificationViewController();
  [super initWithCoder:a1];

  return v9;
}

id sub_100007CA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for NotificationViewController()
{
  return self;
}

__n128 initializeWithTake for FMAnnotationClusterIdentifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for Weight(uint64_t a1)
{
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

uint64_t sub_100007EA8(uint64_t a1, uint64_t a2)
{
  return sub_100008104(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSNumber sub_100007ECC()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_100007ED4(uint64_t a1, uint64_t a2)
{
  uint64_t result = static CGFloat._forceBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100007F28(uint64_t a1, uint64_t a2)
{
  char v3 = static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_100007F80@<X0>(void *a1@<X8>)
{
  uint64_t result = static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = v3;
  return result;
}

uint64_t sub_100007FA8(uint64_t a1, uint64_t a2)
{
  return sub_100008104(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007FC8(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100008040(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000080C0@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100008104(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100008148()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000819C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_100008210(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100008220()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000082B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000082DC()
{
  sub_100008428(&qword_10001E988, type metadata accessor for TraitKey);
  sub_100008428(&qword_10001E990, type metadata accessor for TraitKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100008398()
{
  return sub_100008428(&qword_10001E940, type metadata accessor for TraitKey);
}

uint64_t sub_1000083E0()
{
  return sub_100008428(&qword_10001E948, type metadata accessor for TraitKey);
}

uint64_t sub_100008428(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008470()
{
  return sub_100008428(&qword_10001E950, type metadata accessor for TraitKey);
}

void *sub_1000084B8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

double sub_1000084C8@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t sub_1000084D4()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_10000859C()
{
  return sub_100008428(&qword_10001E958, type metadata accessor for Weight);
}

uint64_t sub_1000085E4()
{
  return sub_100008428(&qword_10001E960, type metadata accessor for Weight);
}

uint64_t sub_10000862C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100008674()
{
  sub_100008428((unint64_t *)&qword_10001EAD8, type metadata accessor for AttributeName);
  sub_100008428(&qword_10001EAE0, type metadata accessor for AttributeName);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100008730()
{
  return Double.hashValue.getter(*v0);
}

void sub_100008738()
{
  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *v0;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  Hasher._combine(_:)(v1);
}

uint64_t sub_10000876C(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return static Hasher._hash(seed:_:)(a1, v2);
}

BOOL sub_10000877C(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100008790()
{
  return sub_100008428(&qword_10001E968, type metadata accessor for Weight);
}

unint64_t sub_1000087D8()
{
  unint64_t result = qword_10001E980;
  if (!qword_10001E980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E980);
  }
  return result;
}

uint64_t sub_10000882C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008900(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009C24((uint64_t)v12, *a3);
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
      sub_100009C24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009FCC((uint64_t)v12);
  return v7;
}

uint64_t sub_100008900(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100008ABC(a5, a6);
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

uint64_t sub_100008ABC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008B54(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008D34(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008D34(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008B54(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008CCC(v2, 0);
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

void *sub_100008CCC(uint64_t a1, uint64_t a2)
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
  sub_100009AE8(&qword_10001EA70);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008D34(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009AE8(&qword_10001EA70);
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

uint64_t sub_100008E84(uint64_t a1, char a2)
{
  uint64_t v2 = 0;
  if ((a2 & 1) == 0)
  {
    if (*(void *)(a1 + 16)
      && (unint64_t v4 = sub_10000AA80(0xD000000000000014, 0x80000001000143B0), (v5 & 1) != 0)
      && (sub_100009C24(*(void *)(a1 + 56) + 32 * v4, (uint64_t)v18), (swift_dynamicCast() & 1) != 0))
    {
      sub_10000A01C(0, &qword_10001EA50);
      sub_10000A01C(0, &qword_10001EA58);
      uint64_t v6 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
      uint64_t v2 = v6;
      if (v6)
      {
        sub_100009D88(v16, v17);
        return v2;
      }
      if (qword_10001E7A0 != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for Logger();
      sub_100009D50(v7, (uint64_t)qword_10001F028);
      int64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error decoding fence trigger location data", v10, 2u);
        swift_slowDealloc();
      }
      sub_100009D88(v16, v17);
    }
    else
    {
      if (qword_10001E7A0 != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      sub_100009D50(v11, (uint64_t)qword_10001F028);
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        id v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Trigger location is not available in notification", v14, 2u);
        swift_slowDealloc();
      }
    }
    return 0;
  }
  return v2;
}

void sub_100009118(void *a1)
{
  if (a1)
  {
    id v2 = objc_allocWithZone((Class)MKPointAnnotation);
    id v3 = a1;
    id v4 = [v2 init];
    [v3 coordinate];
    [v4 setCoordinate:];
    id v5 = [objc_allocWithZone((Class)CLGeocoder) init];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    v19[4] = sub_100009E90;
    v19[5] = v6;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 1107296256;
    v19[2] = sub_100007054;
    v19[3] = &unk_100018CC0;
    uint64_t v7 = _Block_copy(v19);
    id v8 = v4;
    swift_release();
    [v5 reverseGeocodeLocation:v3 completionHandler:v7];
    _Block_release(v7);

    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v10 = Strong;
      [Strong addAnnotation:v8];

      [v3 coordinate];
      double v12 = v11;
      double v14 = v13;
      [v3 horizontalAccuracy];
      id v16 = [self circleWithCenterCoordinate:v12 radius:v14];
      unint64_t v17 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v17)
      {
        NSString v18 = v17;
        [v17 addOverlay:v16];

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void *sub_10000934C(void *a1, void *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  double v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v54 = v10;
    [a1 coordinate];
    CLLocationDegrees latitude = v14;
    CLLocationDegrees longitude = v16;
    [a1 horizontalAccuracy];
    double v19 = v18 * 5.0;
    if (a2)
    {
      id v20 = a1;
      id v21 = a2;
      [v21 distanceFromLocation:v20];
      double v23 = v22;
      [v20 horizontalAccuracy];
      if (v23 - v24 <= 0.0)
      {
      }
      else
      {
        [v20 coordinate];
        double v26 = v25;
        [v21 coordinate];
        CLLocationDegrees v28 = (v26 + v27) * 0.5;
        [v20 coordinate];
        double v30 = v29;
        [v21 coordinate];
        CLLocationCoordinate2D v32 = CLLocationCoordinate2DMake(v28, (v30 + v31) * 0.5);
        CLLocationDegrees latitude = v32.latitude;
        CLLocationDegrees longitude = v32.longitude;
        [v20 distanceFromLocation:v21];
        double v34 = v33;

        double v19 = v34 + v34;
      }
    }
    uint64_t v10 = v54;
  }
  else
  {
    CLLocationDegrees latitude = 0.0;
    double v19 = 2000.0;
    CLLocationDegrees longitude = 0.0;
  }
  v56.CLLocationDegrees latitude = latitude;
  v56.CLLocationDegrees longitude = longitude;
  MKCoordinateRegion v57 = MKCoordinateRegionMakeWithDistance(v56, v19, v19);
  double v35 = v57.center.latitude;
  double v36 = v57.center.longitude;
  double latitudeDelta = v57.span.latitudeDelta;
  double longitudeDelta = v57.span.longitudeDelta;
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v40 = result;
    [result regionThatFits:v35, v36, latitudeDelta, longitudeDelta];
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;

    sub_10000A01C(0, &qword_10001E9F8);
    uint64_t v49 = (void *)static OS_dispatch_queue.main.getter();
    id v50 = (void *)swift_allocObject();
    v50[2] = a3;
    v50[3] = v42;
    v50[4] = v44;
    v50[5] = v46;
    v50[6] = v48;
    aBlock[4] = sub_100009E80;
    aBlock[5] = v50;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000740C;
    aBlock[3] = &unk_100018C70;
    Swift::String v51 = _Block_copy(aBlock);
    id v52 = a3;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100008428(&qword_10001EA00, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100009AE8(&qword_10001EA08);
    sub_100009B2C();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v51);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000097BC(void *a1, uint64_t a2)
{
  type metadata accessor for FMPersonAnnotation();
  if (swift_dynamicCastClass())
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [a1 dequeueReusableAnnotationViewWithIdentifier:v4];

    if (v5)
    {
      type metadata accessor for FMPersonAnnotationView();
      uint64_t v6 = (void *)swift_dynamicCastClass();
      id v7 = v6;
      if (v6) {
        [v6 setSelected:1 animated:0];
      }
      else {
    }
      }
    else
    {
      return 0;
    }
  }
  else
  {
    id v8 = objc_allocWithZone((Class)MKMarkerAnnotationView);
    swift_unknownObjectRetain();
    NSString v9 = String._bridgeToObjectiveC()();
    id v7 = [v8 initWithAnnotation:a2 reuseIdentifier:v9];

    swift_unknownObjectRelease();
  }
  return v7;
}

id sub_1000098F8(uint64_t a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    NSString v4 = (void *)v3;
    id v5 = objc_allocWithZone((Class)MKCircleRenderer);
    swift_unknownObjectRetain();
    id v6 = [v5 initWithCircle:v4];
    [v4 coordinate];
    uint64_t v8 = v1 + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates;
    if ((*(unsigned char *)(v8 + 16) & 1) != 0
      || v7 != *(double *)v8
      || ([v4 coordinate], (*(unsigned char *)(v8 + 16) & 1) != 0)
      || v9 != *(double *)(v8 + 8))
    {
      uint64_t v10 = &selRef_systemRedColor;
    }
    else
    {
      uint64_t v10 = &selRef_systemBlueColor;
    }
    uint64_t v11 = self;
    id v12 = v6;
    id v13 = [v11 *v10];
    [v12 setFillColor:v13];

    id v14 = v12;
    [v14 setAlpha:0.2];

    swift_unknownObjectRelease();
    return v14;
  }
  else
  {
    id v16 = objc_allocWithZone((Class)MKOverlayRenderer);
    return [v16 initWithOverlay:a1];
  }
}

uint64_t sub_100009A90()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100009AC8()
{
  sub_10000770C(*(char **)(v0 + 16));
}

uint64_t sub_100009AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009AE0()
{
  return swift_release();
}

uint64_t sub_100009AE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009B2C()
{
  unint64_t result = qword_10001EA10;
  if (!qword_10001EA10)
  {
    sub_100009B88(&qword_10001EA08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001EA10);
  }
  return result;
}

uint64_t sub_100009B88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009BD0()
{
  unint64_t result = qword_10001EA40;
  if (!qword_10001EA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001EA40);
  }
  return result;
}

uint64_t sub_100009C24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009AE8(&qword_10001EA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009AE8(&qword_10001EA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009D50(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100009D88(uint64_t a1, unint64_t a2)
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

uint64_t *sub_100009DE0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009E48()
{
  return _swift_deallocObject(v0, 56, 7);
}

void sub_100009E80()
{
  sub_10000737C(v0[3], v0[4], v0[5], v0[6]);
}

void sub_100009E90(unint64_t a1, uint64_t a2)
{
  sub_100006F04(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100009E98(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009EF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100009AE8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009F50()
{
  return swift_release();
}

_OWORD *sub_100009F58(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_100009F68(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100009FCC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A01C(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for SymbolicTraits(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

uint64_t sub_10000A080(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000A0B4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000A0C0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000A0E0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

uint64_t sub_10000A134()
{
  return sub_100008428(&qword_10001EAC0, type metadata accessor for AttributeName);
}

uint64_t sub_10000A17C()
{
  return sub_100008428(&qword_10001EAC8, type metadata accessor for AttributeName);
}

uint64_t sub_10000A1C4()
{
  return sub_100008428(&qword_10001EAD0, type metadata accessor for AttributeName);
}

uint64_t sub_10000A20C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000A22C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
}

void sub_10000A268(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

UIImage *sub_10000A2D4(void *a1)
{
  id v3 = [v1 imageWithRenderingMode:2];
  [v1 size];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [v1 scale];
  CGFloat v9 = v8;
  v14.width = v5;
  v14.height = v7;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v9);
  [a1 set];
  [v1 size];
  [v3 drawInRect:CGRectMake(0.0, 0.0, v10, v11)];

  __n128 result = UIGraphicsGetImageFromCurrentImageContext();
  if (result)
  {
    id v13 = result;

    UIGraphicsEndImageContext();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t UIFont.bold.getter()
{
  return sub_10000A868(2);
}

id UIFont.light.getter()
{
  return sub_10000A9E8(&UIFontWeightLight);
}

unint64_t sub_10000A3DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009AE8(&qword_10001EB70);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  id v3 = (void *)v2;
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
    sub_10000ACC4(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_10000AAF8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100009F58(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_10000A4F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009AE8(&qword_10001EB80);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_10000AAF8((uint64_t)v6);
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

unint64_t sub_10000A604(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009AE8(&qword_10001EB58);
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
    swift_unknownObjectRetain();
    unint64_t result = sub_10000AA80(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

id sub_10000A720(uint64_t a1)
{
  id v3 = [v1 fontDescriptor];
  sub_100009AE8(&qword_10001EB60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000135B0;
  *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
  *(void *)(inited + 64) = sub_100009AE8(&qword_10001EB68);
  *(void *)(inited + 40) = a1;
  uint64_t v5 = UIFontDescriptorTraitsAttribute;
  swift_bridgeObjectRetain();
  sub_10000A3DC(inited);
  type metadata accessor for AttributeName(0);
  sub_10000AC6C();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 fontDescriptorByAddingAttributes:isa];

  id v8 = [self fontWithDescriptor:v7 size:0.0];
  return v8;
}

uint64_t UIFont.italic.getter()
{
  return sub_10000A868(1);
}

uint64_t sub_10000A868(uint64_t a1)
{
  id v3 = [v1 fontDescriptor];
  id v4 = [v3 fontDescriptorWithSymbolicTraits:a1];

  if (v4)
  {
    id v5 = [self fontWithDescriptor:v4 size:0.0];

    return (uint64_t)v5;
  }
  else
  {
    _StringGuts.grow(_:)(61);
    v7._object = (void *)0x8000000100014400;
    v7._countAndFlagsBits = 0xD00000000000003BLL;
    String.append(_:)(v7);
    type metadata accessor for SymbolicTraits(0);
    _print_unlocked<A, B>(_:_:)();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id UIFont.regular.getter()
{
  return sub_10000A9E8(&UIFontWeightRegular);
}

id UIFont.medium.getter()
{
  return sub_10000A9E8(&UIFontWeightMedium);
}

id UIFont.semiBold.getter()
{
  return sub_10000A9E8(&UIFontWeightSemibold);
}

id UIFont.extraBold.getter()
{
  return sub_10000A9E8(&UIFontWeightHeavy);
}

id UIFont.titleBold.getter()
{
  return sub_10000A9E8(&UIFontWeightBold);
}

id sub_10000A9E8(void *a1)
{
  sub_100009AE8(&qword_10001EB50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000135B0;
  *(void *)(inited + 32) = UIFontWeightTrait;
  *(void *)(inited + 40) = *a1;
  id v3 = UIFontWeightTrait;
  unint64_t v4 = sub_10000A4F8(inited);
  id v5 = sub_10000A720(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t UIFont.tightLeading.getter()
{
  return sub_10000A868(0x8000);
}

unint64_t sub_10000AA80(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000AB88(a1, a2, v4);
}

unint64_t sub_10000AAF8(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_10000AD2C(a1, v2);
}

unint64_t sub_10000AB88(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10000AC6C()
{
  unint64_t result = qword_10001EAD8;
  if (!qword_10001EAD8)
  {
    type metadata accessor for AttributeName(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001EAD8);
  }
  return result;
}

uint64_t sub_10000ACC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009AE8(&qword_10001EB78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000AD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_10000AEA4(double a1, double a2)
{
  double v4 = a2 / 6.0;
  double v11 = a1 * 0.448;
  double v10 = a1 * 0.385;
  double v5 = a2 / 3.0;
  id v6 = [objc_allocWithZone((Class)UIBezierPath) init];
  [v6 moveToPoint:a1 + a1, a1];
  double v7 = a2 * 0.5;
  [v6 addCurveToPoint:v5 + a2 * 0.5 + a1 controlPoint1:a1 + a1 controlPoint2:a1 + a1];
  double v8 = a1 + a1 + a2;
  [v6 addCurveToPoint:a1 controlPoint1:v8 controlPoint2:v5 + a1 controlPoint2:a1 + a1 + v5];
  [v6 addCurveToPoint:a1 - (v7 + v5) controlPoint1:a1 + a1 controlPoint2:a1 - v4 v8 a1 - v5 a1 + a1 + v5];
  [v6 addCurveToPoint:0.0 controlPoint1:a1 controlPoint2:a1 + a1 - v5 0.0 a1 * 1.5];
  [v6 addCurveToPoint:a1 controlPoint1:0.0, 0.0 controlPoint2:v11, v11];
  [v6 addCurveToPoint:a1 + a1 controlPoint1:a1 controlPoint2:a1 + a1 - v11];
  [v6 closePath];
  return v6;
}

void sub_10000B068(uint64_t a1)
{
  uint64_t v2 = sub_100009AE8(&qword_10001EBD8);
  __chkstk_darwin(v2 - 8);
  double v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for FMFLocationSource();
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  double v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  double v11 = (char *)&v31 - v10;
  __chkstk_darwin(v9);
  double v33 = (char *)&v31 - v12;
  uint64_t v13 = sub_100009AE8(&qword_10001EA28);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for FMFFriend();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  double v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C884(a1, (uint64_t)v15, &qword_10001EA28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_100009EF4((uint64_t)v15, &qword_10001EA28);
LABEL_5:
    double v22 = *(void **)(v34 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
    *(void *)(v34 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage) = 0;

    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  FMFFriend.location.getter();
  uint64_t v20 = type metadata accessor for FMFLocation();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v4, 1, v20) == 1)
  {
    sub_100009EF4((uint64_t)v4, &qword_10001EBD8);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_5;
  }
  FMFLocation.locationSource.getter();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v20);
  uint64_t v23 = v32;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v33, v11, v5);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v8, enum case for FMFLocationSource.stewie(_:), v5);
  sub_10000C950(&qword_10001EBE0);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v25 = v35;
  uint64_t v24 = v36;
  double v26 = *(void (**)(char *, uint64_t))(v23 + 8);
  v26(v8, v5);
  if (v24 == v25)
  {
    id v27 = [self configurationWithTextStyle:UIFontTextStyleBody scale:1];
    NSString v28 = String._bridgeToObjectiveC()();
    id v29 = [self _systemImageNamed:v28 withConfiguration:v27];

    double v30 = *(void **)(v34 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
    *(void *)(v34 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage) = v29;
  }
  else
  {
    double v30 = *(void **)(v34 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
    *(void *)(v34 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage) = 0;
  }

  v26(v33, v5);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_10000B570()
{
  sub_10000A01C(0, &qword_10001EBD0);
  OS_dispatch_queue.sync<A>(execute:)();
  return v1;
}

id sub_10000B5F4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)(a1 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage);
  if (v3)
  {
    id v4 = *(id *)(a1 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIImage) init];
    uint64_t v3 = 0;
  }
  *a2 = v4;
  return v3;
}

uint64_t sub_10000B658()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10000B6CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FMFFriend();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009AE8(&qword_10001EA28);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person;
  swift_beginAccess();
  sub_10000C884(v11, (uint64_t)v10, &qword_10001EA28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_100009EF4((uint64_t)v10, &qword_10001EA28);
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_100009EF4((uint64_t)v10, &qword_10001EA28);
    uint64_t v12 = FMFFriend.identifier.getter();
    unint64_t v13 = v14;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *a2 = v12;
  a2[1] = v13;
  type metadata accessor for FMAnnotationIdentifier();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10000B8BC()
{
  return 1;
}

void sub_10000B8C4()
{
  sub_100009EF4(v0 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person, &qword_10001EA28);

  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_updateQueue);
}

id sub_10000B91C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPersonAnnotation();
  [super dealloc];
}

uint64_t sub_10000B9B8()
{
  return type metadata accessor for FMPersonAnnotation();
}

uint64_t type metadata accessor for FMPersonAnnotation()
{
  uint64_t result = qword_10001EBB8;
  if (!qword_10001EBB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000BA0C()
{
  sub_10000BABC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000BABC()
{
  if (!qword_10001EBC8)
  {
    type metadata accessor for FMFFriend();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001EBC8);
    }
  }
}

uint64_t sub_10000BB14@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000B6CC(*(void *)(v1 + 16), a1);
}

id sub_10000BB30@<X0>(void *a1@<X8>)
{
  return sub_10000B5F4(*(void *)(v1 + 16), a1);
}

uint64_t sub_10000BB4C(uint64_t a1, void *a2, int a3, double a4, double a5, double a6)
{
  uint64_t v7 = v6;
  LODWORD(v107) = a3;
  v114 = a2;
  uint64_t v115 = a1;
  uint64_t v109 = type metadata accessor for FMFLocationSource();
  uint64_t v105 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  Swift::String v93 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100009AE8(&qword_10001EBE8);
  __chkstk_darwin(v98);
  v103 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009AE8(&qword_10001EBD8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v92 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  Swift::String v95 = (char *)&v91 - v16;
  uint64_t v17 = sub_100009AE8(&qword_10001EBF0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v96 = (uint64_t)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v104 = (uint64_t)&v91 - v21;
  __chkstk_darwin(v20);
  uint64_t v101 = (uint64_t)&v91 - v22;
  uint64_t v23 = sub_100009AE8(&qword_10001EA28);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v94 = (uint64_t)&v91 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v99 = (uint64_t)&v91 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v97 = (uint64_t)&v91 - v29;
  __chkstk_darwin(v28);
  uint64_t v113 = (uint64_t)&v91 - v30;
  v106 = (void *)type metadata accessor for FMFConfigValue();
  uint64_t v31 = *(v106 - 1);
  __chkstk_darwin(v106);
  double v33 = (char *)&v91 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v35 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v37 = (char *)&v91 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v38 - 8);
  uint64_t v39 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v39 - 8);
  unint64_t v40 = &v6[OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person];
  uint64_t v41 = type metadata accessor for FMFFriend();
  uint64_t v100 = *(void *)(v41 - 8);
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 56);
  uint64_t v112 = (uint64_t)v40;
  uint64_t v102 = v41;
  v42(v40, 1, 1);
  uint64_t v110 = OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage;
  *(void *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage] = 0;
  uint64_t v43 = OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_updateQueue;
  sub_10000A01C(0, &qword_10001E9F8);
  v111 = v7;
  static DispatchQoS.userInteractive.getter();
  static OS_dispatch_queue.Attributes.concurrent.getter();
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v37, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v34);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v7[v43] = result;
  if ((~*(void *)&a6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (a6 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (a6 < 9.22337204e18)
  {
    uint64_t v45 = v106;
    (*(void (**)(char *, void, void *))(v31 + 104))(v33, enum case for FMFConfigValue.inaccuracyRadiusThreshold(_:), v106);
    uint64_t v117 = 0x7FFFFFFFFFFFFFFFLL;
    FMFGlobalConfig<A>(_:fallback:)();
    (*(void (**)(char *, void *))(v31 + 8))(v33, v45);
    uint64_t v47 = v115;
    uint64_t v46 = v116;
    uint64_t v48 = v113;
    sub_10000C884(v115, v113, &qword_10001EA28);
    if (v107)
    {
      sub_100009EF4(v48, &qword_10001EA28);
      char v49 = 0;
LABEL_27:
      uint64_t v84 = v112;
      swift_beginAccess();
      sub_10000C8E8(v47, v84);
      swift_endAccess();
      uint64_t v85 = *(void **)(v108 + v110);
      v86 = v114;
      *(void *)(v108 + v110) = v114;
      id v87 = v86;

      id v88 = v111;
      v89 = (double *)&v111[OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_tempCoordinate];
      double *v89 = a4;
      v89[1] = a5;

      id v90 = sub_100010074(0, 0, v46 < (uint64_t)a6, v49 & 1, a4, a5, a6);
      sub_10000B068(v47);

      sub_100009EF4(v47, &qword_10001EA28);
      return (uint64_t)v90;
    }
    uint64_t v107 = v46;
    uint64_t v50 = v97;
    sub_10000C884(v48, v97, &qword_10001EA28);
    uint64_t v51 = v100;
    uint64_t v52 = v102;
    v106 = *(void **)(v100 + 48);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v106)(v50, 1, v102) == 1)
    {
      sub_100009EF4(v50, &qword_10001EA28);
      uint64_t v53 = (uint64_t)v103;
      uint64_t v54 = v105;
      uint64_t v55 = v101;
    }
    else
    {
      uint64_t v56 = (uint64_t)v95;
      FMFFriend.location.getter();
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
      uint64_t v57 = type metadata accessor for FMFLocation();
      uint64_t v58 = *(void *)(v57 - 8);
      int v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v56, 1, v57);
      uint64_t v53 = (uint64_t)v103;
      uint64_t v54 = v105;
      uint64_t v55 = v101;
      if (v59 != 1)
      {
        FMFLocation.locationSource.getter();
        (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v57);
        id v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
        uint64_t v61 = v55;
        uint64_t v62 = 0;
LABEL_12:
        uint64_t v63 = v109;
        v60(v61, v62, 1, v109);
        uint64_t v64 = v104;
        (*(void (**)(uint64_t, void, uint64_t))(v54 + 104))(v104, enum case for FMFLocationSource.secureLive(_:), v63);
        v60(v64, 0, 1, v63);
        uint64_t v65 = v53 + *(int *)(v98 + 48);
        sub_10000C884(v55, v53, &qword_10001EBF0);
        uint64_t v66 = v109;
        sub_10000C884(v64, v65, &qword_10001EBF0);
        uint64_t v67 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
        if (v67(v53, 1, v66) == 1)
        {
          sub_100009EF4(v64, &qword_10001EBF0);
          uint64_t v53 = (uint64_t)v103;
          sub_100009EF4(v55, &qword_10001EBF0);
          int v68 = v67(v65, 1, v66);
          uint64_t v69 = v99;
          if (v68 == 1)
          {
            sub_100009EF4(v53, &qword_10001EBF0);
            sub_10000C884(v48, v69, &qword_10001EA28);
LABEL_20:
            uint64_t v76 = v94;
            sub_10000C884(v69, v94, &qword_10001EA28);
            uint64_t v77 = v102;
            if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v106)(v76, 1, v102) == 1)
            {
              sub_100009EF4(v69, &qword_10001EA28);
              sub_100009EF4(v48, &qword_10001EA28);
              uint64_t v78 = v76;
              Swift::String v79 = &qword_10001EA28;
            }
            else
            {
              Swift::String_optional v80 = v92;
              FMFFriend.location.getter();
              (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v76, v77);
              uint64_t v81 = type metadata accessor for FMFLocation();
              uint64_t v82 = *(void *)(v81 - 8);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v80, 1, v81) != 1)
              {
                char v83 = FMFLocation.isLivePaused.getter();
                sub_100009EF4(v69, &qword_10001EA28);
                sub_100009EF4(v48, &qword_10001EA28);
                (*(void (**)(char *, uint64_t))(v82 + 8))(v80, v81);
                char v49 = v83 ^ 1;
                goto LABEL_26;
              }
              sub_100009EF4(v69, &qword_10001EA28);
              sub_100009EF4(v48, &qword_10001EA28);
              Swift::String v79 = &qword_10001EBD8;
              uint64_t v78 = (uint64_t)v80;
            }
            sub_100009EF4(v78, v79);
            char v49 = 1;
LABEL_26:
            uint64_t v46 = v107;
            goto LABEL_27;
          }
        }
        else
        {
          uint64_t v70 = v96;
          sub_10000C884(v53, v96, &qword_10001EBF0);
          if (v67(v65, 1, v66) != 1)
          {
            uint64_t v71 = v70;
            uint64_t v72 = v105;
            Swift::String v73 = v93;
            (*(void (**)(char *, uint64_t, uint64_t))(v105 + 32))(v93, v65, v66);
            sub_10000C950(&qword_10001EBF8);
            char v74 = dispatch thunk of static Equatable.== infix(_:_:)();
            unint64_t v75 = *(void (**)(char *, uint64_t))(v72 + 8);
            v75(v73, v66);
            sub_100009EF4(v104, &qword_10001EBF0);
            sub_100009EF4(v101, &qword_10001EBF0);
            v75((char *)v71, v66);
            sub_100009EF4(v53, &qword_10001EBF0);
            uint64_t v69 = v99;
            sub_10000C884(v48, v99, &qword_10001EA28);
            if (v74) {
              goto LABEL_20;
            }
LABEL_18:
            sub_100009EF4(v69, &qword_10001EA28);
            sub_100009EF4(v48, &qword_10001EA28);
            char v49 = 0;
            goto LABEL_26;
          }
          sub_100009EF4(v104, &qword_10001EBF0);
          sub_100009EF4(v55, &qword_10001EBF0);
          (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v70, v66);
          uint64_t v69 = v99;
        }
        sub_100009EF4(v53, &qword_10001EBE8);
        sub_10000C884(v48, v69, &qword_10001EA28);
        goto LABEL_18;
      }
      sub_100009EF4(v56, &qword_10001EBD8);
    }
    id v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
    uint64_t v61 = v55;
    uint64_t v62 = 1;
    goto LABEL_12;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000C884(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009AE8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009AE8(&qword_10001EA28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C950(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FMFLocationSource();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000C994()
{
  qword_10001F058 = 0x4010000000000000;
}

__n128 sub_10000C9A4()
{
  if (qword_10001E7A8 != -1) {
    swift_once();
  }
  double v0 = *(double *)&qword_10001F058;
  double v1 = *(double *)&qword_10001F058 + 34.0 + 2.0;
  id v2 = [self systemBlueColor];
  id v3 = [v2 colorWithAlphaComponent:0.2];

  id v4 = [v3 CGColor];
  *(double *)&xmmword_10001F060 = v0 + v0 + 44.0;
  *((double *)&xmmword_10001F060 + 1) = v0;
  qword_10001F070 = 0x4020000000000000;
  qword_10001F078 = *(void *)&v1;
  xmmword_10001F080 = xmmword_100013C00;
  unk_10001F090 = xmmword_100013C10;
  __asm
  {
    FMOV            V0.2D, #20.0
    FMOV            V1.2D, #15.0
  }
  xmmword_10001F0A0 = _Q0;
  unk_10001F0B0 = _Q1;
  xmmword_10001F0C0 = xmmword_100013C20;
  *(int64x2_t *)&qword_10001F0D0 = vdupq_n_s64(0x3FD999999999999AuLL);
  __asm { FMOV            V0.2D, #30.0 }
  xmmword_10001F0E0 = (__int128)result;
  unk_10001F0F0 = xmmword_100013C30;
  qword_10001F100 = (uint64_t)v4;
  byte_10001F108 = 1;
  return result;
}

id sub_10000CB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle;
  id v7 = objc_allocWithZone((Class)CALayer);
  uint64_t v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  uint64_t v9 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder;
  *(void *)&v8[v9] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v10 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage;
  *(void *)&v8[v10] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v11 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer;
  *(void *)&v8[v11] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v12 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage;
  *(void *)&v8[v12] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v13 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer;
  *(void *)&v8[v13] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v14 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground;
  *(void *)&v8[v14] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v15 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer;
  *(void *)&v8[v15] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v16 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer;
  *(void *)&v8[v16] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v17 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground;
  *(void *)&v8[v17] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v18 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer;
  *(void *)&v8[v18] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v19 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer;
  *(void *)&v8[v19] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v20 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer;
  *(void *)&v8[v20] = [objc_allocWithZone((Class)CAShapeLayer) init];
  *(void *)&v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCallout] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCenterCircle] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_applyShadowToBalloonTail] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isPulsating] = 0;

  if (a3)
  {
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = 0;
  }
  v25.receiver = v8;
  v25.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  id v22 = [super initWithAnnotation:a1 reuseIdentifier:v21];

  id v23 = v22;
  sub_10000CE38();
  sub_10000ED1C();

  swift_unknownObjectRelease();
  return v23;
}

void sub_10000CE38()
{
  if (qword_10001E7B0 != -1) {
    swift_once();
  }
  long long v65 = xmmword_10001F0E0;
  *(_OWORD *)uint64_t v66 = unk_10001F0F0;
  *(_OWORD *)&v66[9] = *(_OWORD *)((char *)&qword_10001F0F8 + 1);
  long long v61 = xmmword_10001F0A0;
  long long v62 = unk_10001F0B0;
  long long v63 = xmmword_10001F0C0;
  long long v64 = *(_OWORD *)&qword_10001F0D0;
  long long v57 = xmmword_10001F060;
  long long v58 = *(_OWORD *)&qword_10001F070;
  long long v59 = xmmword_10001F080;
  long long v60 = unk_10001F090;
  double v1 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
  long long v2 = xmmword_10001F060;
  if (byte_10001F108) {
    double v3 = *((double *)&xmmword_10001F060 + 1) + *((double *)&xmmword_10001F060 + 1);
  }
  else {
    double v3 = 0.0;
  }
  double v4 = *(double *)&xmmword_10001F060 - v3;
  [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle] setFrame:*(double *)&xmmword_10001F060 + 1, *(double *)&xmmword_10001F060 + 1, *(double *)&xmmword_10001F060 - v3, *(double *)&xmmword_10001F060 - v3];
  [v1 setCornerRadius:v4 * 0.5];
  [v1 setAnchorPoint:0.5, 0.5];
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder];
  [v5 setCornerRadius:(v4 + -4.0) * 0.5];
  [v1 addSublayer:v5];
  [v1 addSublayer:*(void *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage]];
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer];
  id v7 = self;
  id v8 = [v7 bezierPathWithOvalInRect:0.0, 0.0, 0.0, 0.0];
  id v9 = [v8 CGPath];

  [v6 setPath:v9];
  [v6 setFillColor:*(void *)&v66[16]];
  id v55 = sub_10000AEA4(*(double *)&v59 * 0.5, *(double *)&v59 * 0.125);
  uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer];
  id v11 = [v55 CGPath];
  [v10 setPath:v11];

  [v10 setFrame:*(double *)&v2 + 1 + *(double *)&v58 - (*(double *)&v2 - *(double *)&v58) * 0.5 + 1.0, (*(double *)&v59 - v3) * -0.25 - *(double *)&v59 * 0.125 + -2.0, *(double *)&v59, *(double *)&v59];
  [v10 setAnchorPoint:0.5, 1.0];
  id v54 = *(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage];
  [v10 addSublayer:];
  [v1 bounds];
  sub_10000F8E8(v1, v12, v13, v14, v15);
  [v10 bounds];
  sub_10000F8E8(v10, v16, v17, v18, v19);
  uint64_t v20 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground];
  double v21 = *((double *)&v63 + 1);
  id v22 = [v7 bezierPathWithOvalInRect:0.0, 0.0, *(double *)&v62 + v21 + v21, *((double *)&v62 + 1) + v21 + v21];
  id v23 = [v22 CGPath];

  [v20 setPath:v23];
  uint64_t v24 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer];
  [v24 addSublayer:v20];
  objc_super v25 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer];
  [v24 addSublayer:v25];
  [v24 setFrame:*(double *)&v2 - *(double *)&v61, *(double *)&v2 - *((double *)&v61 + 1), v62];
  [v20 setFrame:0.0, 0.0, v62];
  [v25 setFrame:v21, v21, v62];
  id v26 = [v0 layer];
  [v26 setFrame:0.0, 0.0, *(double *)&v2, *(double *)&v2];

  id v27 = [v0 layer];
  [v27 addSublayer:v6];

  id v28 = [v0 layer];
  [v28 addSublayer:v1];

  id v29 = [v0 layer];
  [v29 addSublayer:v10];

  id v30 = [v0 layer];
  [v30 addSublayer:v24];

  double v31 = *(double *)v66;
  uint64_t v32 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer];
  [v32 setFrame:((*(double *)&v2 - *(double *)&v65) * 0.5 + *(double *)&v2 * *(double *)&v64, (*(double *)&v2 - *((double *)&v65 + 1)) * 0.5 + *(double *)&v2 * *((double *)&v64 + 1), v65)];
  double v33 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground];
  id v34 = [v7 bezierPathWithOvalInRect:0.0, 0.0, v65];
  id v35 = [v34 CGPath];

  [v33 setPath:v35];
  uint64_t v36 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer];
  id v37 = [v7 bezierPathWithOvalInRect:0.0, 0.0, *(double *)&v65 - (v31 + v31), *((double *)&v65 + 1) - (v31 + v31)];
  id v38 = [v37 CGPath];

  [v36 setPath:v38];
  [v33 setFrame:0.0, 0.0, v65];
  uint64_t v39 = self;
  id v40 = [v39 whiteColor];
  id v41 = [v40 CGColor];

  [v33 setFillColor:v41];
  [v33 frame];
  [v36 setFrame:sub_10000FA4C(v42, v43, v44, v45, v31, v31)];
  id v46 = [v39 blackColor];
  id v47 = [v46 CGColor];

  [v36 setFillColor:v47];
  uint64_t v48 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer];
  [v36 frame];
  [v48 setFrame:sub_10000FA4C(v49, v50, v51, v52, v31, v31)];
  [v48 setContentsGravity:kCAGravityResizeAspectFill];
  [v32 addSublayer:v33];
  [v32 addSublayer:v36];
  [v32 addSublayer:v48];
  id v53 = [v0 layer];
  [v53 addSublayer:v32];

  sub_10000D69C((uint64_t)&v57);
  CATransform3DMakeScale(&v56, 0.0, 0.0, 1.0);
  [v10 setTransform:&v56];
  [v10 setOpacity:0.0];
  [v54 setOpacity:0.0];
  [v6 setOpacity:0.0];
}

id sub_10000D69C(uint64_t a1)
{
  char v3 = *(unsigned char *)(a1 + 168);
  double v4 = *(double *)a1;
  double v5 = *(double *)a1;
  if (v3) {
    double v5 = v4 - (*(double *)(a1 + 8) + *(double *)(a1 + 8));
  }
  [*(id *)(v1 + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage) setFrame:((v5 - *(double *)(a1 + 24)) * 0.5) * 0.5, ((v5 - *(double *)(a1 + 24)) * 0.5) * 0.5, *(double *)(a1 + 24), *(double *)(a1 + 24)];
  if (v3) {
    double v4 = v4 - (*(double *)(a1 + 8) + *(double *)(a1 + 8));
  }
  [*(id *)(v1 + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder) setFrame:2.0, 2.0, v4 + -4.0, v4 + -4.0];
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage);
  double v7 = (*(double *)(a1 + 32) - *(double *)(a1 + 40)) * 0.5;

  return [v6 setFrame:v7, v7];
}

void sub_10000D784(void *a1)
{
  long long v2 = v1;
  if (qword_10001E7B0 != -1) {
    swift_once();
  }
  v34[8] = xmmword_10001F0E0;
  v35[0] = unk_10001F0F0;
  *(_OWORD *)((char *)v35 + 9) = *(_OWORD *)((char *)&qword_10001F0F8 + 1);
  v34[4] = xmmword_10001F0A0;
  v34[5] = unk_10001F0B0;
  v34[6] = xmmword_10001F0C0;
  v34[7] = *(_OWORD *)&qword_10001F0D0;
  v34[0] = xmmword_10001F060;
  v34[1] = *(_OWORD *)&qword_10001F070;
  _OWORD v34[2] = xmmword_10001F080;
  v34[3] = unk_10001F090;
  sub_10000F890((uint64_t)v34);
  sub_10000D69C((uint64_t)v34);
  uint64_t v4 = sub_10000F8BC((uint64_t)v34);
  double v5 = *(void **)&v1[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage];
  uint64_t v6 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x188);
  double v7 = (void *)((uint64_t (*)(uint64_t))v6)(v4);
  id v8 = [v7 CGImage];

  [v5 setContents:v8];
  id v9 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage];
  uint64_t v10 = (void *)v6();
  id v11 = [v10 CGImage];

  [v9 setContents:v11];
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  LODWORD(v12) = 1132068864;
  [v2 setDisplayPriority:v12];
  [v2 setCollisionMode:1];
  uint64_t v13 = OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou;
  if (*((unsigned char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) == 1
    && ([v2 isSelected] & 1) != 0)
  {
    double v14 = 0.65;
  }
  else
  {
    double v14 = 0.5;
  }
  id v15 = [v2 layer];
  [v15 setAnchorPoint:0.5, v14];

  [*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder] setOpacity:0.0];
  double v16 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
  [v16 setHidden:*((unsigned __int8 *)a1 + v13)];
  if (v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCenterCircle] == 1) {
    [v16 setHidden:1];
  }
  [v2 _updateFromMap];
  [v2 setUserInteractionEnabled:1];
  double v17 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer];
  double v18 = *(void **)((char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage);
  if (!v18) {
    goto LABEL_13;
  }
  double v19 = self;
  id v20 = v18;
  id v21 = [v19 systemGrayColor];
  id v22 = sub_10000A2D4(v21);

  if (v22)
  {
    id v23 = [v22 CGImage];

    if (v23)
    {
      type metadata accessor for CGImage(0);
      id v22 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();

      goto LABEL_14;
    }
LABEL_13:
    id v22 = 0;
  }
LABEL_14:
  [v17 setContents:v22];
  swift_unknownObjectRelease();
  uint64_t v24 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer];
  objc_super v25 = *(void **)((char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
  if (!v25) {
    goto LABEL_18;
  }
  id v26 = self;
  id v27 = v25;
  id v28 = [v26 whiteColor];
  id v29 = sub_10000A2D4(v28);

  if (!v29) {
    goto LABEL_19;
  }
  id v30 = [v29 CGImage];

  if (v30)
  {
    type metadata accessor for CGImage(0);
    id v29 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  }
  else
  {
LABEL_18:
    id v29 = 0;
  }
LABEL_19:
  [v24 setContents:v29];
  swift_unknownObjectRelease();
  if ((*((unsigned char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive) & 1) == 0)
  {
    char v33 = v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated];
    v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
    if ((v33 & 1) == 0) {
      return;
    }
    goto LABEL_23;
  }
  int v31 = v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated];
  int v32 = (*((unsigned char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate) & 1) == 0;
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = v32;
  if (v31 != v32) {
LABEL_23:
  }
    sub_10000F100();
}

id sub_10000DD14()
{
  v37.receiver = v0;
  v37.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  [super _updateFromMap];
  id result = [v0 annotation];
  if (result)
  {
    type metadata accessor for FMAnnotation();
    uint64_t v2 = swift_dynamicCastClass();
    if (!v2) {
      return (id)swift_unknownObjectRelease();
    }
    uint64_t v3 = v2;
    if (qword_10001E7B0 != -1) {
      swift_once();
    }
    long long v4 = xmmword_10001F060;
    double v5 = *(double *)&qword_10001F078;
    double v6 = *(double *)&qword_10001F0F8;
    [v0 _pointsForDistance:*(double *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy)];
    double v8 = v7;
    double v9 = v7 + v7;
    uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer];
    id v11 = [self bezierPathWithOvalInRect:1.0, 1.0, v9, v9];
    id v12 = [v11 CGPath];

    [v10 setPath:v12];
    [v10 setFrame:*(double *)&v4 * 0.5 - v8, *(double *)&v4 * 0.5 - v8, v9, v9];
    [v0 _mapPitchRadians];
    CATransform3DMakeRotation(&v36, v13, 1.0, 0.0, 0.0);
    [v10 setTransform:&v36];
    [v10 setZPosition:-100.0];
    uint64_t v14 = OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate;
    if (v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] == *(unsigned char *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate))
    {
      if (!*(unsigned char *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate)) {
        goto LABEL_14;
      }
    }
    else
    {
      [v0 setSelected:[v0 isSelected] animated:0];
      if ((*(unsigned char *)(v3 + v14) & 1) == 0) {
        goto LABEL_14;
      }
    }
    if ([v0 isSelected])
    {
      [v10 setLineWidth:v6];
      id v15 = [self whiteColor];
      id v16 = [v15 CGColor];

      [v10 setStrokeColor:v16];
      double v17 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer];
      [v17 setOpacity:0.0];
      double v18 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage];
      [v18 setOpacity:0.0];
      double v19 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
      [v19 setOpacity:0.0];
      if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) & 1) == 0)
      {
        LODWORD(v20) = 1.0;
        [v10 setOpacity:v20];
      }
      if (v9 >= *((double *)&v4 + 1) + v5) {
        goto LABEL_18;
      }
      long long v21 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v36.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v36.m13 = v21;
      long long v22 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v36.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
      *(_OWORD *)&v36.m23 = v22;
      long long v23 = *(_OWORD *)&CATransform3DIdentity.m33;
      *(_OWORD *)&v36.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
      *(_OWORD *)&v36.m33 = v23;
      long long v24 = *(_OWORD *)&CATransform3DIdentity.m43;
      *(_OWORD *)&v36.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
      *(_OWORD *)&v36.m43 = v24;
      [v19 setTransform:&v36];
      CATransform3DMakeScale(&v36, 0.0, 0.0, 1.0);
      [v17 setTransform:&v36];
      float v25 = 0.0;
      [v17 setOpacity:0.0];
      [v18 setOpacity:0.0];
      LODWORD(v26) = 1.0;
      [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage] setOpacity:v26];
      LODWORD(v27) = 1.0;
      [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder] setOpacity:v27];
      LODWORD(v28) = 1.0;
      [v19 setOpacity:v28];
LABEL_17:
      *(float *)&double v29 = v25;
      [v10 setOpacity:v29];
LABEL_18:
      if (*(void *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage)) {
        *(float *)&double v20 = 1.0;
      }
      else {
        *(float *)&double v20 = 0.0;
      }
      [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer] setOpacity:v20];
      if (*(void *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage)) {
        *(float *)&double v35 = 1.0;
      }
      else {
        *(float *)&double v35 = 0.0;
      }
      [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer] setOpacity:v35];
      return (id)swift_unknownObjectRelease();
    }
LABEL_14:
    [v10 setLineWidth:0.0];
    id v30 = [self clearColor];
    id v31 = [v30 CGColor];

    [v10 setStrokeColor:v31];
    [v10 setLineWidth:0.0];
    float v25 = 1.0;
    LODWORD(v32) = 1.0;
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer] setOpacity:v32];
    LODWORD(v33) = 1.0;
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage] setOpacity:v33];
    LODWORD(v34) = 1.0;
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle] setOpacity:v34];
    if (![v0 isSelected]
      || *(unsigned char *)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) == 1)
    {
      float v25 = 0.0;
    }
    goto LABEL_17;
  }
  return result;
}

void sub_10000E334(char a1, char a2)
{
  v82.receiver = v2;
  v82.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  [super setSelected:a1 & 1 animated:a2 & 1];
  if (qword_10001E7B0 != -1) {
    swift_once();
  }
  double v6 = *((double *)&xmmword_10001F060 + 1);
  double v5 = *(double *)&xmmword_10001F060;
  double v78 = *(double *)&qword_10001F070;
  double v7 = *(double *)&xmmword_10001F080;
  double v9 = *((double *)&xmmword_10001F0A0 + 1);
  double v8 = *(double *)&xmmword_10001F0A0;
  double v10 = *(double *)&xmmword_10001F0C0;
  uint64_t v11 = qword_10001F0D0;
  double v12 = unk_10001F0D8;
  int v13 = byte_10001F108;
  if ([v2 annotation])
  {
    type metadata accessor for FMAnnotation();
    uint64_t v14 = swift_dynamicCastClass();
    if (v14)
    {
      uint64_t v15 = v14;
      double v75 = v6;
      double v16 = v8;
      double v17 = v10;
      double v18 = v5;
      double v19 = v7;
      double v20 = v9;
      double v21 = v12;
      uint64_t v22 = v11;
      if (*(unsigned char *)(v14 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) == 1
        && ([v2 isSelected] & 1) != 0)
      {
        double v23 = 0.65;
      }
      else
      {
        double v23 = 0.5;
      }
      id v24 = [v2 layer];
      [v24 setAnchorPoint:0.5, v23];

      char v25 = *(unsigned char *)(v15 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate);
      swift_unknownObjectRelease();
      v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] = v25;
      uint64_t v11 = v22;
      double v12 = v21;
      double v9 = v20;
      double v7 = v19;
      double v5 = v18;
      double v10 = v17;
      double v8 = v16;
      double v6 = v75;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  double v26 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer];
  if (a2)
  {
    sub_100009AE8(&qword_10001ECD8);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_1000135B0;
    *(void *)(v27 + 32) = 0x726F66736E617274;
    *(void *)(v27 + 40) = 0xE90000000000006DLL;
    *(void *)(v27 + 48) = [self springAnimationWithDuration:0.638 dampingRatio:0.7 velocity:0.0];
    sub_10000A604(v27);
    sub_100009AE8(&qword_10001ECE0);
    v28.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v28.super.Class isa = 0;
  }
  [v26 setActions:v28.super.isa];

  if ((a1 & 1) != 0
    && (v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] & 1) == 0
    && v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] == 1)
  {
    double v29 = v6 + v6;
    if (!v13) {
      double v29 = 0.0;
    }
    double v30 = v5 - v29;
    double v76 = *(double *)&v11;
    CGFloat v31 = v78 / v30;
    CGFloat v32 = (v30 - v78) * 0.5 + v6 * -4.0 + -1.0;
    CATransform3DMakeTranslation(&v81, v32, v32, 1.0);
    CATransform3DScale(&v80, &v81, v31, v31, 1.0);
    double v33 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
    CATransform3D v81 = v80;
    [v33 setTransform:&v81];
    long long v34 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v81.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v81.CGFloat m13 = v34;
    long long v35 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v81.CGFloat m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v81.CGFloat m23 = v35;
    long long v36 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v81.CGFloat m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&v81.CGFloat m33 = v36;
    long long v37 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v81.CGFloat m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v81.CGFloat m43 = v37;
    [v26 setTransform:&v81];
    [*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage] setOpacity:0.0];
    [*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder] setOpacity:0.0];
    CATransform3DMakeTranslation(&v81, (v5 - v8) * 0.25, -((v5 - v9) * v10), 1.0);
    id v38 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer];
    CATransform3DScale(&v80, &v81, v10, v10, 1.0);
    CATransform3D v81 = v80;
    [v38 setTransform:&v81];
    LODWORD(v39) = 1.0;
    [v38 setOpacity:v39];
    CATransform3DMakeTranslation(&v81, (v7 - v5) * 0.5 * v76, (v7 - v5) * 0.5 * v12 - (v7 * 0.5 + v7 * 0.125 + v7 * 0.125), 1.0);
    id v40 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer];
    [v40 setTransform:&v81];
  }
  else
  {
    id v40 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
    CGFloat m12 = CATransform3DIdentity.m12;
    CGFloat m13 = CATransform3DIdentity.m13;
    CGFloat m14 = CATransform3DIdentity.m14;
    CGFloat m21 = CATransform3DIdentity.m21;
    CGFloat m22 = CATransform3DIdentity.m22;
    CGFloat m23 = CATransform3DIdentity.m23;
    CGFloat m31 = CATransform3DIdentity.m31;
    CGFloat m24 = CATransform3DIdentity.m24;
    CGFloat m32 = CATransform3DIdentity.m32;
    CGFloat m34 = CATransform3DIdentity.m34;
    CGFloat m33 = CATransform3DIdentity.m33;
    CGFloat m42 = CATransform3DIdentity.m42;
    CGFloat m41 = CATransform3DIdentity.m41;
    CGFloat m44 = CATransform3DIdentity.m44;
    CGFloat m43 = CATransform3DIdentity.m43;
    v81.m11 = CATransform3DIdentity.m11;
    v81.CGFloat m12 = m12;
    CGFloat v49 = m12;
    v81.CGFloat m13 = m13;
    v81.CGFloat m14 = m14;
    CGFloat v50 = m13;
    CGFloat v51 = m14;
    v81.CGFloat m21 = m21;
    v81.CGFloat m22 = m22;
    CGFloat v52 = m21;
    CGFloat v53 = m22;
    v81.CGFloat m23 = m23;
    v81.CGFloat m24 = m24;
    CGFloat v54 = m23;
    v81.CGFloat m31 = m31;
    v81.CGFloat m32 = m32;
    v81.CGFloat m33 = m33;
    v81.CGFloat m34 = m34;
    v81.CGFloat m41 = m41;
    v81.CGFloat m42 = m42;
    v81.CGFloat m43 = m43;
    v81.CGFloat m44 = m44;
    [v40 setTransform:&v81, *(void *)&m23, *(void *)&m22, *(void *)&m21, *(void *)&m14, *(void *)&m13, *(void *)&m12, *(void *)&CATransform3DIdentity.m11, *(void *)&m31];
    CATransform3DMakeScale(&v81, 0.0, 0.0, 1.0);
    [v26 setTransform:&v81];
    [v26 setOpacity:0.0];
    [*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage] setOpacity:0.0];
    id v55 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer];
    v81.m11 = CATransform3DIdentity.m11;
    v81.CGFloat m12 = v49;
    v81.CGFloat m13 = v50;
    v81.CGFloat m14 = v51;
    v81.CGFloat m21 = v52;
    v81.CGFloat m22 = v53;
    v81.CGFloat m23 = v54;
    v81.CGFloat m24 = m24;
    v81.CGFloat m31 = m31;
    v81.CGFloat m32 = m32;
    v81.CGFloat m33 = m33;
    v81.CGFloat m34 = m34;
    v81.CGFloat m41 = m41;
    v81.CGFloat m42 = m42;
    v81.CGFloat m43 = m43;
    v81.CGFloat m44 = m44;
    [v55 setTransform:&v81];
    LODWORD(v56) = 1.0;
    [v55 setOpacity:v56];
    long long v57 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer];
    v81.m11 = v67;
    v81.CGFloat m12 = v66;
    v81.CGFloat m13 = v65;
    v81.CGFloat m14 = v64;
    v81.CGFloat m21 = v63;
    v81.CGFloat m22 = v62;
    v81.CGFloat m23 = v61;
    v81.CGFloat m24 = m24;
    v81.CGFloat m31 = v68;
    v81.CGFloat m32 = m32;
    v81.CGFloat m33 = m33;
    v81.CGFloat m34 = m34;
    v81.CGFloat m41 = m41;
    v81.CGFloat m42 = m42;
    v81.CGFloat m43 = m43;
    v81.CGFloat m44 = m44;
    [v57 setTransform:&v81];
    LODWORD(v58) = 1.0;
    [v57 setOpacity:v58];
    LODWORD(v59) = 1.0;
    [*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage] setOpacity:v59];
    LODWORD(v60) = 1.0;
    [*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder] setOpacity:v60];
  }
  LODWORD(v41) = 1.0;
  [v40 setOpacity:v41];
  sub_10000ED1C();
}

char *sub_10000EB1C(uint64_t a1, double a2, double a3)
{
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  [super hitTest:a1 withEvent:a2];
  if (v7) {
    return (char *)v7;
  }
  id v9 = [v3 rightCalloutAccessoryView];
  if (v9)
  {
    double v10 = v9;
    [v3 convertPoint:v9 toCoordinateSpace:a2];
    id v8 = [v10 hitTest:a1];
  }
  else
  {
    if (qword_10001E7B0 != -1) {
      swift_once();
    }
    double v11 = *(double *)&xmmword_10001F060;
    [*(id *)&v3[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle] frame];
    if (sqrt((a2 - (v13 + v12 * 0.5)) * (a2 - (v13 + v12 * 0.5)) + (a3 - (v15 + v14 * 0.5)) * (a3 - (v15 + v14 * 0.5))) >= v11 * 0.5)
    {
      return 0;
    }
    else
    {
      double v16 = v3;
      return v3;
    }
  }
  return (char *)v8;
}

void sub_10000ED1C()
{
  id v1 = [v0 traitCollection];
  id v2 = [v1 userInterfaceStyle];

  unsigned int v3 = [v0 isSelected];
  long long v4 = self;
  if (v2 == (id)2)
  {
    double v5 = &selRef_systemGray2Color;
    if (v3) {
      double v5 = &selRef_systemGray3Color;
    }
    id v6 = [v4 *v5];
    id v7 = [v6 CGColor];

    id v8 = [self systemGray3Color];
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle] setBackgroundColor:v7];
    id v9 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder];
    id v10 = [v8 CGColor];
    [v9 setBackgroundColor:v10];

    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer] setFillColor:v7];
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground] setFillColor:v7];
  }
  else
  {
    double v11 = &selRef_systemGray6Color;
    if (v3) {
      double v11 = &selRef_whiteColor;
    }
    id v12 = [v4 *v11];
    id v8 = [v12 CGColor];

    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle] setBackgroundColor:v8];
    double v13 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder];
    id v14 = [self whiteColor];
    id v15 = [v14 CGColor];

    [v13 setBackgroundColor:v15];
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer] setFillColor:v8];
    [*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground] setFillColor:v8];
  }

  sub_10000F100();
}

void sub_10000F100()
{
  if ([v0 isSelected]
    && v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] == 1)
  {
    sub_10000F1A8();
  }
  else
  {
    uint64_t v1 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer;
    id v2 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer];
    if (v2)
    {
      [v2 removeAllAnimations];
      id v2 = *(void **)&v0[v1];
      if (v2)
      {
        [v2 removeFromSuperlayer];
        id v2 = *(void **)&v0[v1];
      }
    }
    *(void *)&v0[v1] = 0;
  }
}

void sub_10000F1A8()
{
  if (!*(void *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer])
  {
    uint64_t v1 = v0;
    uint64_t v29 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer;
    id v2 = [self systemGreenColor];
    id v3 = [v2 CGColor];

    if (qword_10001E7B0 != -1) {
      swift_once();
    }
    double v4 = *(double *)&xmmword_10001F060;
    id v5 = [objc_allocWithZone((Class)CAShapeLayer) init];
    id v6 = [self bezierPathWithOvalInRect:0.0, 0.0, v4, v4];
    id v7 = [v6 CGPath];

    [v5 setPath:v7];
    [v5 setAnchorPoint:0.5, 0.5];
    [v5 setFrame:CGRectMake(0.0, -v4, v4, v4)];
    [v5 setFillColor:v3];
    [v5 setOpacity:0.0];
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = self;
    id v10 = [v9 animationWithKeyPath:v8];

    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
    [v10 setFromValue:isa];

    Class v12 = Double._bridgeToObjectiveC()().super.super.isa;
    [v10 setToValue:v12];

    [v10 setRemovedOnCompletion:0];
    [v10 setDuration:1.5];
    NSString v13 = String._bridgeToObjectiveC()();
    id v14 = [v9 animationWithKeyPath:v13];

    Class v15 = Float._bridgeToObjectiveC()().super.super.isa;
    [v14 setFromValue:v15];

    Class v16 = Float._bridgeToObjectiveC()().super.super.isa;
    [v14 setToValue:v16];

    [v14 setRemovedOnCompletion:0];
    [v14 setDuration:1.5];
    id v17 = [objc_allocWithZone((Class)CAAnimationGroup) init];
    sub_100009AE8(&qword_10001EA18);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1000135C0;
    *(void *)(v18 + 32) = v10;
    *(void *)(v18 + 40) = v14;
    specialized Array._endMutation()();
    sub_10000F850();
    id v19 = v10;
    id v20 = v14;
    Class v21 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v17 setAnimations:v21];

    [v17 setDuration:1.5];
    [v17 setRepeatCount:0.0];
    uint64_t v22 = self;
    id v23 = v17;
    id v24 = [v22 functionWithName:kCAMediaTimingFunctionEaseOut];
    [v23 setTimingFunction:v24];

    [v23 setRemovedOnCompletion:0];
    LODWORD(v25) = 2139095040;
    [v23 setRepeatCount:v25];
    id v26 = [v1 layer];
    [v26 insertSublayer:v5 atIndex:0];

    NSString v27 = String._bridgeToObjectiveC()();
    [v5 addAnimation:v23 forKey:v27];

    id v28 = *(id *)&v1[v29];
    *(void *)&v1[v29] = v5;
  }
}

id sub_10000F6EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  return [super dealloc];
}

uint64_t type metadata accessor for FMMapAnnotationView()
{
  return self;
}

unint64_t sub_10000F850()
{
  unint64_t result = qword_10001ECD0;
  if (!qword_10001ECD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001ECD0);
  }
  return result;
}

uint64_t sub_10000F890(uint64_t a1)
{
  id v2 = *(id *)(a1 + 160);
  return a1;
}

uint64_t sub_10000F8BC(uint64_t a1)
{
  return a1;
}

id sub_10000F8E8(void *a1, double a2, double a3, double a4, double a5)
{
  transform.a = 1.0;
  transform.b = 0.0;
  transform.c = 0.0;
  transform.d = 1.0;
  transform.tx = 0.0;
  transform.ty = 0.0;
  CGPathRef v6 = CGPathCreateWithEllipseInRect(*(CGRect *)&a2, &transform);
  [a1 setShadowPath:v6];

  id v7 = [self blackColor];
  id v8 = [v7 CGColor];

  [a1 setShadowColor:v8];
  [a1 setShadowOffset:0.0, 0.0];
  LODWORD(v9) = 1045220557;
  [a1 setShadowOpacity:v9];
  if (qword_10001E7B0 != -1) {
    swift_once();
  }
  return [a1 setShadowRadius:*((double *)&xmmword_10001F060 + 1)];
}

double sub_10000FA4C(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_10000FA68()
{
  uint64_t v1 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v2 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v3 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v4 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v5 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v6 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v7 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground;
  *(void *)&v0[v7] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v8 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer;
  *(void *)&v0[v8] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v9 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer;
  *(void *)&v0[v9] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v10 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground;
  *(void *)&v0[v10] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v11 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer;
  *(void *)&v0[v11] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v12 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer;
  *(void *)&v0[v12] = [objc_allocWithZone((Class)CALayer) init];
  uint64_t v13 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer;
  *(void *)&v0[v13] = [objc_allocWithZone((Class)CAShapeLayer) init];
  *(void *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCallout] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCenterCircle] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_applyShadowToBalloonTail] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isPulsating] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000FCB0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FMLocalize()
{
  return self;
}

id sub_10000FE7C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationView();
  return [super dealloc];
}

uint64_t type metadata accessor for NotificationView()
{
  return self;
}

id sub_100010018()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPersonAnnotationView();
  return [super dealloc];
}

uint64_t type metadata accessor for FMPersonAnnotationView()
{
  return self;
}

id sub_100010074(uint64_t a1, uint64_t a2, char a3, char a4, double a5, double a6, double a7)
{
  uint64_t v8 = &v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title];
  void *v8 = 0;
  v8[1] = 0;
  *(void *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage] = 0;
  *(void *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage] = 0;
  uint64_t v9 = &v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier];
  void *v9 = a1;
  v9[1] = a2;
  uint64_t v10 = (double *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_coordinate];
  double *v10 = a5;
  v10[1] = a6;
  *(double *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy] = a7;
  v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou] = a2 == 1;
  v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate] = a3;
  v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive] = a4;
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for FMAnnotation();
  return [super init];
}

Swift::Int sub_100010128()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  switch(v1)
  {
    case 0:
      Swift::UInt v2 = 0;
      goto LABEL_7;
    case 1:
      Swift::UInt v2 = 1;
      goto LABEL_7;
    case 2:
      Swift::UInt v2 = 2;
      goto LABEL_7;
    case 3:
      Swift::UInt v2 = 3;
LABEL_7:
      Hasher._combine(_:)(v2);
      break;
    default:
      Hasher._combine(_:)(4uLL);
      String.hash(into:)();
      break;
  }
  return Hasher._finalize()();
}

void sub_1000101F8()
{
  switch(*(void *)(v0 + 8))
  {
    case 0:
      Swift::UInt v1 = 0;
      goto LABEL_9;
    case 1:
      Swift::UInt v1 = 1;
      goto LABEL_9;
    case 2:
      Swift::UInt v1 = 2;
      goto LABEL_9;
    case 3:
      Swift::UInt v1 = 3;
LABEL_9:
      Hasher._combine(_:)(v1);
      break;
    default:
      Hasher._combine(_:)(4uLL);
      String.hash(into:)();
      break;
  }
}

Swift::Int sub_1000102C0()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  switch(v1)
  {
    case 0:
      Swift::UInt v2 = 0;
      goto LABEL_7;
    case 1:
      Swift::UInt v2 = 1;
      goto LABEL_7;
    case 2:
      Swift::UInt v2 = 2;
      goto LABEL_7;
    case 3:
      Swift::UInt v2 = 3;
LABEL_7:
      Hasher._combine(_:)(v2);
      break;
    default:
      Hasher._combine(_:)(4uLL);
      String.hash(into:)();
      break;
  }
  return Hasher._finalize()();
}

uint64_t sub_10001038C(uint64_t *a1, uint64_t a2)
{
  return sub_100011C2C(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

void sub_1000103A0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FMAnnotationIdentifier();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v21 - v12;
  sub_100011D7C(v1, (uint64_t)&v21 - v12);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      Swift::UInt v14 = 2;
      goto LABEL_6;
    case 2u:
      Swift::UInt v14 = 3;
      goto LABEL_6;
    case 3u:
      Swift::UInt v14 = 4;
      goto LABEL_6;
    case 4u:
      Hasher._combine(_:)(5uLL);
      String.hash(into:)();
      swift_bridgeObjectRelease();
      String.hash(into:)();
      goto LABEL_7;
    case 5u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v13, v3);
      Hasher._combine(_:)(6uLL);
      sub_100012784(&qword_10001EF88, (void (*)(uint64_t))&type metadata accessor for UUID);
      dispatch thunk of Hashable.hash(into:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return;
    case 6u:
      uint64_t v15 = *(void *)(*(void *)v13 + 24);
      uint64_t v16 = *(void *)(*(void *)v13 + 32);
      Hasher._combine(_:)(7uLL);
      switch(v15)
      {
        case 0:
          Swift::UInt v17 = 0;
          goto LABEL_18;
        case 1:
          Swift::UInt v17 = 1;
          goto LABEL_18;
        case 2:
          Swift::UInt v17 = 2;
          goto LABEL_18;
        case 3:
          Swift::UInt v17 = 3;
LABEL_18:
          Hasher._combine(_:)(v17);
          break;
        default:
          Hasher._combine(_:)(4uLL);
          String.hash(into:)();
          break;
      }
      Hasher._combine(_:)(*(void *)(v16 + 16));
      uint64_t v18 = *(void *)(v16 + 16);
      if (v18)
      {
        uint64_t v19 = v16 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
        uint64_t v20 = *(void *)(v8 + 72);
        do
        {
          sub_100011D7C(v19, (uint64_t)v11);
          sub_1000103A0(a1);
          sub_100011D20((uint64_t)v11);
          v19 += v20;
          --v18;
        }
        while (v18);
      }
      swift_release();
      return;
    case 7u:
      Hasher._combine(_:)(0);
      return;
    default:
      Swift::UInt v14 = 1;
LABEL_6:
      Hasher._combine(_:)(v14);
      String.hash(into:)();
LABEL_7:
      swift_bridgeObjectRelease();
      return;
  }
}

Swift::Int sub_10001077C()
{
  Hasher.init(_seed:)();
  sub_1000103A0((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int sub_1000107C0()
{
  Hasher.init(_seed:)();
  sub_1000103A0((uint64_t)v1);
  return Hasher._finalize()();
}

void sub_1000108F4()
{
}

void sub_100010950()
{
}

void sub_1000109AC()
{
}

uint64_t sub_100010A08(uint64_t a1)
{
  Swift::UInt v2 = v1;
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for FMAnnotationIdentifier();
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v40 - v8;
  sub_100009C80(a1, (uint64_t)v42);
  if (v43)
  {
    if (swift_dynamicCast())
    {
      uint64_t v10 = v41;
      uint64_t v11 = *(void **)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
      uint64_t v12 = *(void **)((char *)v41 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
      if (v11)
      {
        if (!v12) {
          goto LABEL_31;
        }
        sub_10000A01C(0, &qword_10001EBD0);
        id v13 = v12;
        id v14 = v11;
        char v15 = static NSObject.== infix(_:_:)();

        if ((v15 & 1) == 0) {
          goto LABEL_31;
        }
      }
      else if (v12)
      {
        goto LABEL_31;
      }
      uint64_t v16 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x190))();
      (*(void (**)(uint64_t))((swift_isaMask & *v10) + 0x190))(v16);
      char v17 = sub_1000115A0((uint64_t)v9, (uint64_t)v7);
      sub_100011D20((uint64_t)v7);
      sub_100011D20((uint64_t)v9);
      if ((v17 & 1) == 0) {
        goto LABEL_31;
      }
      sub_10000A01C(0, (unint64_t *)&unk_10001EEC0);
      uint64_t v18 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x188))();
      uint64_t v19 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v10) + 0x188))();
      char v20 = static NSObject.== infix(_:_:)();

      if ((v20 & 1) == 0) {
        goto LABEL_31;
      }
      int v21 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x198))();
      if ((v21 ^ (*(unsigned int (**)(void))((swift_isaMask & *v10) + 0x198))())) {
        goto LABEL_31;
      }
      [v2 coordinate];
      double v23 = v22;
      [v10 coordinate];
      if (v23 != v24) {
        goto LABEL_31;
      }
      [v2 coordinate];
      double v26 = v25;
      [v10 coordinate];
      if (v26 != v27
        || *(double *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy) != *(double *)((char *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy))
      {
        goto LABEL_31;
      }
      uint64_t v28 = *(void *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier + 8);
      unint64_t v29 = *(void *)((char *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier + 8);
      switch(v28)
      {
        case 0:
          if (v29) {
            goto LABEL_31;
          }
          break;
        case 1:
          if (v29 != 1) {
            goto LABEL_31;
          }
          break;
        case 2:
          if (v29 != 2) {
            goto LABEL_31;
          }
          break;
        case 3:
          if (v29 != 3) {
            goto LABEL_31;
          }
          break;
        default:
          if (v29 < 4
            || (*(void *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier) != *(void *)((char *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier)
             || v28 != v29)
            && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            goto LABEL_31;
          }
          break;
      }
      if (*((unsigned __int8 *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate) != *((unsigned __int8 *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate)
        || *((unsigned __int8 *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive) != *((unsigned __int8 *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive)
        || *((unsigned __int8 *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) != *((unsigned __int8 *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou))
      {
        goto LABEL_31;
      }
      uint64_t v32 = *(void *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title + 8);
      uint64_t v33 = *(void *)((char *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title + 8);
      if (v32)
      {
        if (!v33
          || (*(void *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title) != *(void *)((char *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title)
           || v32 != v33)
          && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          goto LABEL_31;
        }
LABEL_41:
        long long v34 = *(void **)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage);
        long long v35 = *(void **)((char *)v10 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage);
        if (!v34)
        {
          id v39 = v35;

          if (!v35)
          {
            char v30 = 1;
            return v30 & 1;
          }

          goto LABEL_32;
        }
        if (v35)
        {
          sub_10000A01C(0, &qword_10001EBD0);
          id v36 = v34;
          id v37 = v35;
          id v38 = v36;
          char v30 = static NSObject.== infix(_:_:)();

          return v30 & 1;
        }
        goto LABEL_31;
      }
      if (!v33) {
        goto LABEL_41;
      }
LABEL_31:
    }
  }
  else
  {
    sub_100009EF4((uint64_t)v42, &qword_10001EA48);
  }
LABEL_32:
  char v30 = 0;
  return v30 & 1;
}

id sub_100011068()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMAnnotation();
  return [super dealloc];
}

uint64_t type metadata accessor for FMAnnotation()
{
  return self;
}

unint64_t destroy for FMAnnotationClusterIdentifier(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s26FindMyNotificationsContent29FMAnnotationClusterIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for FMAnnotationClusterIdentifier(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FMAnnotationClusterIdentifier(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FMAnnotationClusterIdentifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FMAnnotationClusterIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_100011354(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10001136C(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FMAnnotationClusterIdentifier()
{
  return &type metadata for FMAnnotationClusterIdentifier;
}

unint64_t sub_1000113A0()
{
  unint64_t result = qword_10001EEB0;
  if (!qword_10001EEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001EEB0);
  }
  return result;
}

void *sub_1000113F4()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_100011400@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FMAnnotation();
  uint64_t result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FMAnnotationIdentifier() - 8;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_100011D7C(a1 + v12, (uint64_t)v10);
        sub_100011D7C(a2 + v12, (uint64_t)v7);
        char v15 = sub_1000115A0(v10, v7);
        sub_100011D20((uint64_t)v7);
        sub_100011D20((uint64_t)v10);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1000115A0(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = a2;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v64 = *(void *)(v3 - 8);
  uint64_t v65 = v3;
  __chkstk_darwin(v3);
  CGFloat v63 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for FMAnnotationIdentifier();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v63 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (uint64_t *)((char *)&v63 - v13);
  uint64_t v15 = __chkstk_darwin(v12);
  BOOL v17 = (uint64_t *)((char *)&v63 - v16);
  uint64_t v18 = __chkstk_darwin(v15);
  char v20 = (uint64_t *)((char *)&v63 - v19);
  uint64_t v21 = __chkstk_darwin(v18);
  double v23 = (uint64_t *)((char *)&v63 - v22);
  __chkstk_darwin(v21);
  double v25 = (uint64_t *)((char *)&v63 - v24);
  uint64_t v26 = sub_100009AE8(&qword_10001EED0);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  unint64_t v29 = (char **)((char *)&v63 + *(int *)(v27 + 56) - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v30 = a1;
  CGFloat v31 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011D7C(v30, (uint64_t)v31);
  sub_100011D7C(v66, (uint64_t)v29);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100011D7C((uint64_t)v31, (uint64_t)v23);
      uint64_t v33 = *v23;
      uint64_t v32 = v23[1];
      if (swift_getEnumCaseMultiPayload() == 1) {
        goto LABEL_13;
      }
      goto LABEL_19;
    case 2u:
      sub_100011D7C((uint64_t)v31, (uint64_t)v20);
      uint64_t v35 = *v20;
      uint64_t v34 = v20[1];
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_19;
      }
      if (v35 != *v29 || v34 != v29[1]) {
        goto LABEL_17;
      }
      goto LABEL_37;
    case 3u:
      sub_100011D7C((uint64_t)v31, (uint64_t)v17);
      uint64_t v33 = *v17;
      uint64_t v32 = v17[1];
      if (swift_getEnumCaseMultiPayload() == 3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    case 4u:
      sub_100011D7C((uint64_t)v31, (uint64_t)v14);
      uint64_t v41 = *v14;
      uint64_t v40 = v14[1];
      uint64_t v42 = v14[2];
      uint64_t v43 = v14[3];
      if (swift_getEnumCaseMultiPayload() != 4)
      {
        swift_bridgeObjectRelease();
LABEL_19:
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      uint64_t v45 = v29[2];
      uint64_t v44 = v29[3];
      if (v41 == *v29 && v40 == v29[1])
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
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_68;
        }
      }
      if (v42 == v45 && v43 == v44)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v58 = (uint64_t)v31;
      }
      else
      {
        char v60 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v60 & 1) == 0) {
          goto LABEL_68;
        }
        uint64_t v58 = (uint64_t)v31;
      }
      goto LABEL_39;
    case 5u:
      sub_100011D7C((uint64_t)v31, (uint64_t)v11);
      if (swift_getEnumCaseMultiPayload() != 5)
      {
        (*(void (**)(char *, uint64_t))(v64 + 8))(v11, v65);
        goto LABEL_20;
      }
      CGFloat v49 = v63;
      uint64_t v48 = v64;
      uint64_t v50 = v65;
      (*(void (**)(char *, void *, uint64_t))(v64 + 32))(v63, v29, v65);
      char v39 = static UUID.== infix(_:_:)();
      CGFloat v51 = *(void (**)(char *, uint64_t))(v48 + 8);
      v51(v49, v50);
      v51(v11, v50);
LABEL_65:
      sub_100011D20((uint64_t)v31);
      return v39 & 1;
    case 6u:
      sub_100011D7C((uint64_t)v31, (uint64_t)v8);
      uint64_t v53 = *(void *)(*(void *)v8 + 16);
      uint64_t v52 = *(void *)(*(void *)v8 + 24);
      uint64_t v54 = *(void *)(*(void *)v8 + 32);
      if (swift_getEnumCaseMultiPayload() == 6)
      {
        uint64_t v55 = *v29;
        unint64_t v56 = *(void *)(*v29 + 24);
        uint64_t v57 = *(void *)(*v29 + 32);
        switch(v52)
        {
          case 0:
            if (v56) {
              goto LABEL_67;
            }
            goto LABEL_64;
          case 1:
            if (v56 != 1) {
              goto LABEL_67;
            }
            goto LABEL_64;
          case 2:
            if (v56 != 2) {
              goto LABEL_67;
            }
            goto LABEL_64;
          case 3:
            if (v56 != 3) {
              goto LABEL_67;
            }
            goto LABEL_64;
          default:
            if (v56 >= 4)
            {
              BOOL v61 = v53 == *(void *)(v55 + 16) && v52 == v56;
              if (v61 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
LABEL_64:
                char v39 = sub_100011440(v54, v57);
                swift_release();
                swift_release();
                goto LABEL_65;
              }
            }
LABEL_67:
            swift_release();
            swift_release();
            break;
        }
        goto LABEL_68;
      }
      swift_release();
LABEL_20:
      sub_100009EF4((uint64_t)v31, &qword_10001EED0);
      goto LABEL_21;
    case 7u:
      if (swift_getEnumCaseMultiPayload() == 7) {
        goto LABEL_38;
      }
      goto LABEL_20;
    default:
      sub_100011D7C((uint64_t)v31, (uint64_t)v25);
      uint64_t v33 = *v25;
      uint64_t v32 = v25[1];
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_19;
      }
LABEL_13:
      if (v33 == *v29 && v32 == v29[1])
      {
LABEL_37:
        swift_bridgeObjectRelease_n();
LABEL_38:
        uint64_t v58 = (uint64_t)v31;
LABEL_39:
        sub_100011D20(v58);
        char v39 = 1;
        return v39 & 1;
      }
LABEL_17:
      char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v38) {
        goto LABEL_38;
      }
LABEL_68:
      sub_100011D20((uint64_t)v31);
LABEL_21:
      char v39 = 0;
      return v39 & 1;
  }
}

uint64_t sub_100011C2C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      if (a4) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 1:
      if (a4 != 1) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a4 != 2) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a4 != 3) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    default:
      if (a4 < 4)
      {
LABEL_14:
        uint64_t result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        uint64_t result = 1;
      }
      else
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      break;
  }
  return result;
}

uint64_t type metadata accessor for FMAnnotationIdentifier()
{
  uint64_t result = qword_10001EF48;
  if (!qword_10001EF48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011D20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FMAnnotationIdentifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FMAnnotationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011DE0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_100011DF4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
      case 3u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        uint64_t v11 = a2[2];
        uint64_t v12 = a2[3];
        a1[2] = v11;
        a1[3] = v12;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v13 = type metadata accessor for UUID();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_100012000(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      goto LABEL_3;
    case 4:
      swift_bridgeObjectRelease();
LABEL_3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 5:
      uint64_t v3 = type metadata accessor for UUID();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 6:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

void *sub_10001210C(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 4u:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      uint64_t v8 = a2[2];
      uint64_t v9 = a2[3];
      a1[2] = v8;
      a1[3] = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 5u:
      uint64_t v10 = type metadata accessor for UUID();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      goto LABEL_7;
    case 6u:
      *a1 = *a2;
      swift_retain();
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_1000122BC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100011D20((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 5u:
        uint64_t v6 = type metadata accessor for UUID();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_8;
      case 6u:
        *a1 = *a2;
        swift_retain();
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *sub_1000124AC(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    uint64_t v6 = type metadata accessor for UUID();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100012564(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100011D20((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      uint64_t v6 = type metadata accessor for UUID();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10001262C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100012654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100012680()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100012690()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_10001273C()
{
  return sub_100012784(&qword_10001EF80, (void (*)(uint64_t))type metadata accessor for FMAnnotationIdentifier);
}

uint64_t sub_100012784(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t type metadata accessor for Feature.FindMy()
{
  return type metadata accessor for Feature.FindMy();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t PersonNameComponents.givenName.setter()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t PersonNameComponents.familyName.setter()
{
  return PersonNameComponents.familyName.setter();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)PersonNameComponents._bridgeToObjectiveC()();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t PersonNameComponents.nickname.setter()
{
  return PersonNameComponents.nickname.setter();
}

uint64_t PersonNameComponents.init()()
{
  return PersonNameComponents.init()();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return type metadata accessor for PersonNameComponents();
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

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)CGFloat._bridgeToObjectiveC()();
}

uint64_t static CGFloat._forceBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t FMFLocation.isLivePaused.getter()
{
  return FMFLocation.isLivePaused.getter();
}

uint64_t FMFLocation.locationSource.getter()
{
  return FMFLocation.locationSource.getter();
}

uint64_t type metadata accessor for FMFLocation()
{
  return type metadata accessor for FMFLocation();
}

uint64_t type metadata accessor for FMFConfigValue()
{
  return type metadata accessor for FMFConfigValue();
}

uint64_t FMFGlobalConfig<A>(_:fallback:)()
{
  return FMFGlobalConfig<A>(_:fallback:)();
}

uint64_t type metadata accessor for FMFLocationSource()
{
  return type metadata accessor for FMFLocationSource();
}

uint64_t dispatch thunk of FMFContactsDataController.searchInStore(handle:keysToFetch:)()
{
  return dispatch thunk of FMFContactsDataController.searchInStore(handle:keysToFetch:)();
}

uint64_t FMFContactsDataController.init(isSnapshotMode:)()
{
  return FMFContactsDataController.init(isSnapshotMode:)();
}

uint64_t type metadata accessor for FMFContactsDataController()
{
  return type metadata accessor for FMFContactsDataController();
}

uint64_t FMFFriend.identifier.getter()
{
  return FMFFriend.identifier.getter();
}

uint64_t FMFFriend.location.getter()
{
  return FMFFriend.location.getter();
}

uint64_t type metadata accessor for FMFFriend()
{
  return type metadata accessor for FMFFriend();
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

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
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

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
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

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)Float._bridgeToObjectiveC()();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static OS_dispatch_queue.Attributes.concurrent.getter()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
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

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
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

uint64_t Identifiable<>.id.getter()
{
  return Identifiable<>.id.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
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

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DScale(retstr, t, sx, sy, sz);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.CLLocationDegrees longitude = v3;
  result.CLLocationDegrees latitude = v2;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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