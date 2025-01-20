void sub_1000030AC(id a1)
{
  uint64_t vars8;

  qword_100068720 = (uint64_t)os_log_create("com.apple.people", "IMCoreInterface");
  _objc_release_x1();
}

void sub_100003210(id a1, NSArray *a2)
{
  if (a2 || [0 count]) {
    IMSPIMarkSPIMessagesAsRead();
  }
  _objc_release_x1();
}

void sub_10000340C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.people.checkWithWait", v4);

  uint64_t v13 = *(void *)(a1 + 32);
  v6 = +[NSArray arrayWithObjects:&v13 count:1];
  uint64_t v12 = *(void *)(a1 + 40);
  v7 = +[NSArray arrayWithObjects:&v12 count:1];
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  v11 = v3;
  id v8 = v3;
  IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();
}

void sub_10000359C(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v3 count];
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    v9[0] = 67109634;
    v9[1] = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "checkWithWait returned %d items for %@ on %@", (uint8_t *)v9, 0x1Cu);
  }

  if (v3) {
    id v8 = v3;
  }
  else {
    id v8 = &__NSArray0__struct;
  }
  (*(void (**)(void, void *, void))(a1[6] + 16))(a1[6], v8, 0);
}

id sub_100003B08(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:IMSPIiMessageService];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003C0C;
  v10[3] = &unk_1000619A0;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100003C0C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100003C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:IMSPISMSService];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003D1C;
  v10[3] = &unk_1000619A0;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100003D1C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100003D28(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:@"RCS"];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003E28;
  v10[3] = &unk_1000619A0;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100003E28(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100003E34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:@"SatelliteSMS"];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003F34;
  v10[3] = &unk_1000619A0;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100003F34(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100003F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:@"iMessageLite"];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004040;
  v10[3] = &unk_1000619A0;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100004040(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_10000404C(id a1, NSArray *a2)
{
  v2 = a2;
  if ([(NSArray *)v2 count])
  {
    id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"date" ascending:1];
    v4 = +[NSMutableArray arrayWithArray:v2];
    id v10 = v3;
    unsigned int v5 = +[NSArray arrayWithObjects:&v10 count:1];
    [v4 sortUsingDescriptors:v5];

    +[NSMutableArray array];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000041C0;
    v8[3] = &unk_100061A08;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

void sub_1000041C0(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [MinMessageItem alloc];
  id v7 = [v3 date];
  unsigned int v5 = [v3 body];

  id v6 = [(MinMessageItem *)v4 initWith:v7 andText:v5];
  [v2 addObject:v6];
}

uint64_t sub_10000426C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    a2 = &__NSArray0__struct;
  }
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, a2);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100004338(v3, qword_100066690);
  sub_10000439C(v3, (uint64_t)qword_100066690);
  static PeopleLogger.daemon.getter();
  sub_1000043D4();
  id v5 = [self currentRunLoop];
  [v5 run];

  return 0;
}

uint64_t *sub_100004338(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000439C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_1000043D4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000439C(v0, (uint64_t)&unk_100066690);
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    static CommandLine.arguments.getter();
    uint64_t v4 = Array.description.getter();
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    sub_10002A278(v4, v6, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Launching peopled with args %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Daemon entering sandbox", v9, 2u);
    swift_slowDealloc();
  }

  if (_set_user_dir_suffix())
  {
    if (qword_100066720 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_100069C08;
    sub_1000265B4();
    uint64_t v11 = OBJC_IVAR____TtC7peopled11XPCListener__listener;
    [*(id *)(v10 + OBJC_IVAR____TtC7peopled11XPCListener__listener) setDelegate:v10];
    id result = [*(id *)(v10 + v11) resume];
    if (qword_100066730 != -1) {
      return (id)swift_once();
    }
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void sub_1000046C4(void *a1@<X8>)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithStatusTypeIdentifier:v3];

  *a1 = v4;
}

id sub_10000473C(uint64_t a1)
{
  id v2 = [*v1 statusSubscriptionForHandle:a1];
  return v2;
}

uint64_t sub_100004778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = *v4;
  NSString v8 = String._bridgeToObjectiveC()();
  v11[4] = a3;
  v11[5] = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100004840;
  v11[3] = &unk_100061C40;
  id v9 = _Block_copy(v11);
  swift_retain();
  [v7 allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:v8 completion:v9];
  _Block_release(v9);

  return swift_release();
}

uint64_t sub_100004840(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100009084();
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000048D4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  NSString v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  Logger.ifError(_:message:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000049B8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for KettleStatusFetcher()
{
  return self;
}

uint64_t sub_1000049EC()
{
  _StringGuts.grow(_:)(35);
  v0._object = (void *)0x8000000100056520;
  v0._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 2689580;
  v1._object = (void *)0xE300000000000000;
  String.append(_:)(v1);
  return 0;
}

uint64_t sub_100004A90(void *a1)
{
  return sub_100004AB4(a1);
}

uint64_t sub_100004AB4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for StatusType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v72 - 8);
  uint64_t v12 = __chkstk_darwin(v72);
  v70 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v66 = (char *)&v62 - v15;
  __chkstk_darwin(v14);
  v17 = (char *)&v62 - v16;
  static PeopleLogger.daemon.getter();
  v18 = a1;
  v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v68 = v5;
  uint64_t v69 = v4;
  v67 = v7;
  v65 = v10;
  if (v21)
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v64 = (void *)swift_slowAlloc();
    *(_DWORD *)v22 = 138412290;
    uint64_t v71 = v11;
    v73 = v18;
    v23 = v18;
    uint64_t v11 = v71;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v64 = v18;

    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Got UserStatusChangeEvent: %@", v22, 0xCu);
    sub_1000070B0(&qword_100066A58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    v19 = v18;
  }
  v24 = v18;

  v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v17, v72);
  id v26 = [v24 statusChangeType];
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v29 = v28;

  if (v27 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v29 == v30)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
      v49 = v66;
      static PeopleLogger.daemon.getter();
      v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Got a biome event with a non-kettle status type", v52, 2u);
        swift_slowDealloc();
      }

      v25(v49, v72);
      sub_1000070B0(&qword_100066A40);
      v73 = 0;
      char v74 = 0;
      return Promise.__allocating_init(with:)();
    }
  }
  v66 = (char *)v25;
  Class isa = (Class)[v24 idsHandles];
  if (!isa)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  id v33 = [self predicateForContactsMatchingHandleStrings:isa];

  sub_1000070F4(v2 + 8, v2[11]);
  unint64_t v34 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  unint64_t v35 = v34;
  if (!(v34 >> 62))
  {
    uint64_t v36 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    id v63 = v33;
    v64 = v2;
    if (v36) {
      goto LABEL_12;
    }
LABEL_27:
    v39 = (char *)_swiftEmptyArrayStorage;
LABEL_28:
    swift_bridgeObjectRelease_n();
    if (*((void *)v39 + 2))
    {
      uint64_t v54 = (uint64_t)v64;
      Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
      v57 = v67;
      uint64_t v56 = v68;
      if (Strong)
      {
        sub_10001F660(v54, (uint64_t)v39, Strong);
        swift_unknownObjectRelease();
      }
      uint64_t v58 = type metadata accessor for TaskPriority();
      uint64_t v59 = (uint64_t)v65;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v65, 1, 1, v58);
      uint64_t v60 = swift_allocObject();
      *(void *)(v60 + 16) = 0;
      *(void *)(v60 + 24) = 0;
      sub_100016DD8(v59, (uint64_t)&unk_100066A50, v60);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      v57 = v67;
      uint64_t v56 = v68;
    }
    type metadata accessor for PeopleAnalytics();
    uint64_t v61 = v69;
    (*(void (**)(char *, void, uint64_t))(v56 + 104))(v57, enum case for StatusType.dndAvailability(_:), v69);
    static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v61);
    sub_1000070B0(&qword_100066A40);
    v73 = 0;
    char v74 = 0;
    uint64_t v53 = Promise.__allocating_init(with:)();

    return v53;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v36 = result;
  id v63 = v33;
  v64 = v2;
  if (!result) {
    goto LABEL_27;
  }
LABEL_12:
  if (v36 >= 1)
  {
    uint64_t v38 = 0;
    v39 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if ((v35 & 0xC000000000000001) != 0) {
        id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v40 = *(id *)(v35 + 8 * v38 + 32);
      }
      v41 = v40;
      id v42 = [v40 identifier];
      uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v45 = v44;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v39 = sub_10001CD98(0, *((void *)v39 + 2) + 1, 1, v39);
      }
      unint64_t v47 = *((void *)v39 + 2);
      unint64_t v46 = *((void *)v39 + 3);
      if (v47 >= v46 >> 1) {
        v39 = sub_10001CD98((char *)(v46 > 1), v47 + 1, 1, v39);
      }
      ++v38;
      *((void *)v39 + 2) = v47 + 1;
      v48 = &v39[16 * v47];
      *((void *)v48 + 4) = v43;
      *((void *)v48 + 5) = v45;
    }
    while (v36 != v38);
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000552C()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_1000055E8, 0, 0);
}

uint64_t sub_1000055E8()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.dndAvailability(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_1000056A0()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  swift_release();
  static MetricTemplate.updateStatusCount(for:signaled:)();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_100005738(uint64_t a1)
{
  uint64_t v3 = sub_1000070B0(&qword_100066A20);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v76 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v57 - v10;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v18 = (char *)v57 - v17;
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19)
  {
    v75 = (void *)(v1 + 104);
    v78 = (void (**)(char *, uint64_t))(v16 + 8);
    uint64_t v61 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v62 = (void (**)(uint64_t, char *, uint64_t))(v7 + 32);
    v66 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v67 = (void (**)(char *, uint64_t))(v7 + 8);
    swift_bridgeObjectRetain();
    id v79 = 0;
    v57[1] = a1;
    os_log_type_t v20 = (unint64_t *)(a1 + 40);
    *(void *)&long long v21 = 136315394;
    long long v60 = v21;
    uint64_t v59 = (char *)&type metadata for Any + 8;
    *(void *)&long long v21 = 136315138;
    long long v58 = v21;
    uint64_t v70 = v6;
    uint64_t v71 = v5;
    uint64_t v68 = v12;
    uint64_t v69 = v11;
    v73 = v18;
    char v74 = v15;
    while (1)
    {
      uint64_t v22 = *(v20 - 1);
      unint64_t v23 = *v20;
      swift_bridgeObjectRetain();
      id v24 = sub_100008884(v22, v23, v75);
      if (v24) {
        break;
      }
      swift_bridgeObjectRelease();
LABEL_4:
      v20 += 2;
      if (!--v19)
      {
        swift_bridgeObjectRelease();
        return v79;
      }
    }
    v25 = v24;
    uint64_t v77 = v19;
    static PeopleLogger.daemon.getter();
    uint64_t v72 = v25;
    id v26 = v25;
    swift_bridgeObjectRetain();
    id v27 = v26;
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = v60;
      swift_bridgeObjectRetain();
      *(void *)(v30 + 4) = sub_10002A278(v22, v23, v80);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 12) = 2080;
      id v31 = [v27 debugDescription];
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v34 = v33;

      *(void *)(v30 + 14) = sub_10002A278(v32, v34, v80);
      uint64_t v6 = v70;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "status for %s - %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      uint64_t v12 = v68;
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v35 = *v78;
      (*v78)(v73, v12);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v35 = *v78;
      (*v78)(v18, v12);
    }
    uint64_t v36 = v74;
    static PeopleLogger.daemon.getter();
    id v37 = v27;
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v64 = v35;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      v80[0] = v63;
      *(_DWORD *)uint64_t v40 = v58;
      id v65 = v37;
      id v41 = [v37 statusPayload];
      if (v41
        && (id v42 = v41,
            id v43 = [v41 payloadDictionary],
            v42,
            v43))
      {
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
      }
      else
      {
        sub_100005F1C((uint64_t)_swiftEmptyArrayStorage);
      }
      uint64_t v50 = Dictionary.description.getter();
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      *(void *)(v40 + 4) = sub_10002A278(v50, v52, v80);
      id v37 = v65;

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, " => %s", (uint8_t *)v40, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v12 = v68;
      v64(v74, v68);
      uint64_t v6 = v70;
      uint64_t v45 = (uint64_t)v71;
      uint64_t v44 = v69;
      id v46 = v79;
      if (!v79) {
        goto LABEL_18;
      }
    }
    else
    {

      v35(v36, v12);
      uint64_t v44 = v69;
      uint64_t v45 = (uint64_t)v71;
      id v46 = v79;
      if (!v79)
      {
LABEL_18:
        (*v66)(v45, 1, 1, v6);
        goto LABEL_19;
      }
    }
    id v47 = [v46 datePublished];
    v48 = v76;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v49 = *v62;
    (*v62)(v45, v48, v6);
    (*v66)(v45, 0, 1, v6);
    if ((*v61)(v45, 1, v6) != 1)
    {
      v49((uint64_t)v44, (char *)v45, v6);
LABEL_20:
      id v53 = [v37 datePublished];
      uint64_t v54 = v76;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      LOBYTE(v53) = static Date.< infix(_:_:)();
      v55 = *v67;
      (*v67)(v54, v6);
      v55(v44, v6);
      if (v53)
      {

        id v79 = v72;
      }
      else
      {
      }
      v18 = v73;
      uint64_t v19 = v77;
      goto LABEL_4;
    }
LABEL_19:
    static Date.distantPast.getter();
    sub_100008D44(v45);
    goto LABEL_20;
  }
  return 0;
}

unint64_t sub_100005F1C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070B0(&qword_100066A28);
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
    sub_100008DA4(v6, (uint64_t)v15);
    unint64_t result = sub_10000725C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100008E0C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_10000604C(uint64_t a1)
{
  return sub_100006190(a1, &qword_100066A00);
}

unint64_t sub_100006058(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070B0(&qword_100066A18);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_1000071E4(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
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

unint64_t sub_100006184(uint64_t a1)
{
  return sub_100006190(a1, &qword_100066A10);
}

unint64_t sub_100006190(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070B0(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000071E4(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

void sub_1000062A8(void (*a1)(char **), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v47 = a2;
  v48 = a1;
  uint64_t v5 = type metadata accessor for Logger();
  unint64_t v64 = *(void *)(v5 - 8);
  uint64_t v65 = v5;
  __chkstk_darwin(v5);
  uint64_t v63 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for StatusType();
  uint64_t v61 = *(char **)(v7 - 8);
  uint64_t v62 = v7;
  __chkstk_darwin(v7);
  long long v60 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v45 - v13;
  uint64_t v15 = type metadata accessor for AvailabilityType();
  uint64_t v59 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  os_log_type_t v20 = (char *)&v45 - v19;
  long long v21 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v23 = [v21 predicateForContactsWithIdentifiers:isa];

  sub_1000070F4((void *)(a4 + 64), *(void *)(a4 + 88));
  id v46 = v23;
  unint64_t v24 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  v25 = v12;
  uint64_t v61 = v20;
  uint64_t v62 = v15;
  uint64_t v56 = v18;
  uint64_t v57 = a4;
  uint64_t v63 = v14;
  long long v60 = (char *)sub_100006190((uint64_t)_swiftEmptyArrayStorage, &qword_100066A00);
  unint64_t v26 = v24;
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v28 = v62;
  os_log_type_t v29 = v61;
  if (!v27)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    v66 = v60;
    char v67 = 0;
    v48(&v66);
    swift_bridgeObjectRelease();

    return;
  }
  if (v27 >= 1)
  {
    uint64_t v30 = 0;
    unint64_t v64 = v24 & 0xC000000000000001;
    unsigned int v54 = enum case for AvailabilityType.busy(_:);
    id v53 = (void (**)(char *, uint64_t, uint64_t))(v59 + 104);
    unsigned int v52 = enum case for AvailabilityType.free(_:);
    unint64_t v51 = (void (**)(char *, char *, uint64_t))(v59 + 16);
    uint64_t v50 = (void (**)(char *, uint64_t))(v59 + 8);
    long long v49 = xmmword_100053F00;
    v55 = v25;
    uint64_t v65 = v27;
    unint64_t v58 = v24;
    do
    {
      if (v64) {
        id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v31 = *(id *)(v26 + 8 * v30 + 32);
      }
      uint64_t v32 = v31;
      uint64_t v33 = CNContact.people_normalizedHandles.getter();
      id v34 = sub_100005738(v33);
      swift_bridgeObjectRelease();
      if (v34)
      {
        id v35 = [objc_allocWithZone((Class)AKAvailability) initWithPublishedStatus:v34];
        if (v35)
        {
          uint64_t v36 = v35;
          if ([v35 isAvailableToMe]) {
            uint64_t v37 = v52;
          }
          else {
            uint64_t v37 = v54;
          }
          (*v53)(v29, v37, v28);
          id v38 = [v32 identifier];
          uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v40 = v39;

          sub_1000070B0(&qword_1000669F0);
          uint64_t v41 = swift_allocObject();
          *(_OWORD *)(v41 + 16) = v49;
          (*v51)(v56, v61, v62);
          Date.init()();
          id v42 = [v34 datePublished];
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          *(void *)(v41 + 56) = type metadata accessor for AvailabilityPersonStatus();
          *(void *)(v41 + 64) = sub_100007138(&qword_1000669F8, 255, (void (*)(uint64_t))&type metadata accessor for AvailabilityPersonStatus);
          sub_100007180((uint64_t *)(v41 + 32));
          AvailabilityPersonStatus.init(availability:date:availabilityDate:)();
          id v43 = v60;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v66 = v43;
          uint64_t v28 = v62;
          sub_100008014(v41, v59, v40, isUniquelyReferenced_nonNull_native);
          long long v60 = v66;

          os_log_type_t v29 = v61;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*v50)(v29, v28);
          unint64_t v26 = v58;
        }
        else
        {

          unint64_t v26 = v58;
        }
      }
      else
      {
      }
      ++v30;
    }
    while (v65 != v30);
    goto LABEL_18;
  }
  __break(1u);
}

uint64_t sub_100006BD0()
{
  swift_release();
  sub_10000900C(v0 + 24);
  sub_10000900C(v0 + 64);
  sub_10000900C(v0 + 104);
  sub_10000905C(v0 + 144);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DNDStatusSource()
{
  return self;
}

uint64_t sub_100006C54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.dndAvailability(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_100006CC8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 152) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_100006D0C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return StatusSource.debugID.getter(a1, WitnessTable);
}

uint64_t sub_100006D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100006E10;
  return StatusFetcher.fetchStatus@Sendable (for:)(a1, a2, a3);
}

uint64_t sub_100006E10(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100006F10(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v3;
  sub_1000070B0(&qword_1000669E8);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  return Promise.init(startBlock:)();
}

uint64_t sub_100006FA4()
{
  return sub_1000049EC();
}

uint64_t sub_100006FC8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100007138(&qword_1000669D8, a2, (void (*)(uint64_t))type metadata accessor for DNDStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100007020(uint64_t a1, uint64_t a2)
{
  return sub_100007138(&qword_1000669E0, a2, (void (*)(uint64_t))type metadata accessor for DNDStatusSource);
}

uint64_t sub_100007068()
{
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000070A8(void (*a1)(char **), uint64_t a2)
{
  sub_1000062A8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1000070B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_1000070F4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100007138(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t *sub_100007180(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1000071E4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_1000072E4(a1, a2, v4);
}

unint64_t sub_10000725C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_1000073C8(a1, v4);
}

unint64_t sub_1000072A0(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();
  return sub_100007490(a1, v2);
}

unint64_t sub_1000072E4(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000073C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000087D4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100008830((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100007490(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000752C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000070B0(&qword_100066A18);
  char v6 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
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
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      id v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
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
            goto LABEL_39;
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
      uint64_t v19 = 16 * v18;
      os_log_type_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *os_log_type_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_100007838(uint64_t a1, char a2)
{
  return sub_100007B78(a1, a2, &qword_100066A00);
}

uint64_t sub_100007844(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000070B0(&qword_100066A08);
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
  uint64_t v34 = v2;
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
    unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    int64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_1000087BC(v25, (uint64_t)v38);
    }
    else
    {
      sub_100008758((uint64_t)v25, (uint64_t)v38);
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
    uint64_t result = sub_1000087BC(v38, *(void *)(v7 + 56) + 40 * v14);
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
    void *v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100007B6C(uint64_t a1, char a2)
{
  return sub_100007B78(a1, a2, &qword_100066A10);
}

uint64_t sub_100007B78(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1000070B0(a3);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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
    if (v22 >= v35) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
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
            if (v14 >= v35) {
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
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
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
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_100007E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1000071E4(a3, a4);
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
    sub_1000081E0();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_release();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000752C(v17, a5 & 1);
  unint64_t v23 = sub_1000071E4(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  *char v26 = a1;
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

uint64_t sub_100008014(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000071E4(a2, a3);
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
    sub_1000085A8(&qword_100066A00);
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100007B78(v15, a4 & 1, &qword_100066A00);
  unint64_t v21 = sub_1000071E4(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
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

unint64_t sub_100008198(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

void *sub_1000081E0()
{
  uint64_t v1 = v0;
  sub_1000070B0(&qword_100066A18);
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
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

void *sub_1000083A4()
{
  return sub_1000085A8(&qword_100066A00);
}

void *sub_1000083B0()
{
  uint64_t v1 = v0;
  sub_1000070B0(&qword_100066A08);
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
  BOOL v25 = v1;
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
    uint64_t v20 = 40 * v15;
    sub_100008758(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1000087BC(v26, *(void *)(v4 + 56) + v20);
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

void *sub_10000859C()
{
  return sub_1000085A8(&qword_100066A10);
}

void *sub_1000085A8(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1000070B0(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100008758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000087BC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000087D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100008830(uint64_t a1)
{
  return a1;
}

id sub_100008884(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v30 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v30 - 8);
  uint64_t v7 = __chkstk_darwin(v30);
  int64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v29 - v10;
  uint64_t v12 = a3[3];
  uint64_t v13 = a3[4];
  sub_1000070F4(a3, v12);
  id v14 = objc_allocWithZone((Class)SKHandle);
  swift_bridgeObjectRetain();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithString:v15];

  uint64_t v17 = (void *)(*(uint64_t (**)(id, uint64_t, uint64_t))(v13 + 16))(v16, v12, v13);
  if (!v17)
  {
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    int64_t v22 = Logger.logObject.getter();
    uint64_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, (os_log_type_t)v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_10002A278(a1, a2, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v22, (os_log_type_t)v23, "no status subscription for %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v30);
    return 0;
  }
  static PeopleConstants.appBundleID.getter();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_1000048D4;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100024B90;
  aBlock[3] = (uint64_t)&unk_100061BF0;
  uint64_t v19 = _Block_copy(aBlock);
  [v17 retainPersistentSubscriptionAssertionForApplicationIdentifier:v18 completion:v19];
  _Block_release(v19);

  id v20 = [v17 currentStatus];
  if (!v20)
  {
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    int64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      v29[1] = v27 + 4;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_10002A278(a1, a2, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "no status for %s", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v30);
    return 0;
  }
  id v21 = v20;

  return v21;
}

uint64_t sub_100008D44(uint64_t a1)
{
  uint64_t v2 = sub_1000070B0(&qword_100066A20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100066A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100008E0C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008E2C()
{
  return swift_release();
}

uint64_t sub_100008E34()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008E6C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008F18;
  return sub_10000552C();
}

uint64_t sub_100008F18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000900C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000905C(uint64_t a1)
{
  return a1;
}

unint64_t sub_100009084()
{
  unint64_t result = qword_100066A60;
  if (!qword_100066A60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100066A60);
  }
  return result;
}

uint64_t sub_1000090CC()
{
  type metadata accessor for SpotlightIndexer();
  swift_allocObject();
  uint64_t result = SpotlightIndexer.init()();
  qword_100069B30 = result;
  return result;
}

uint64_t sub_10000910C()
{
  type metadata accessor for ContactFetcher();
  uint64_t result = static ContactFetcher.shared.getter();
  qword_100069B38 = result;
  return result;
}

uint64_t sub_100009140()
{
  uint64_t v0 = type metadata accessor for MessageConduit();
  swift_allocObject();
  uint64_t result = MessageConduit.init()();
  qword_100069B58 = v0;
  unk_100069B60 = &protocol witness table for MessageConduit;
  qword_100069B40 = result;
  return result;
}

uint64_t sub_100009194()
{
  type metadata accessor for PeopleLocateFriendProvider();
  uint64_t result = static PeopleLocateFriendProvider.shared.getter();
  qword_100069B68 = result;
  return result;
}

uint64_t sub_1000091C8()
{
  id v0 = [objc_allocWithZone((Class)CHSWidgetConfigurationReader) init];
  uint64_t v4 = sub_10001210C(0, &qword_100066D98);
  uint64_t v5 = &protocol witness table for CHSWidgetConfigurationReader;
  *(void *)&long long v3 = v0;
  type metadata accessor for WidgetConfigurationReader();
  uint64_t v1 = swift_allocObject();
  uint64_t result = sub_1000087BC(&v3, v1 + 16);
  qword_100069B70 = v1;
  return result;
}

uint64_t sub_100009258(uint64_t a1)
{
  return sub_1000092C0(a1, (void (*)(void))type metadata accessor for AskToBuyStatusSource, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unsigned char *, uint64_t))sub_10000EB04, &qword_100069B78);
}

uint64_t sub_10000928C(uint64_t a1)
{
  return sub_1000092C0(a1, (void (*)(void))type metadata accessor for ScreenTimeStatusSource, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unsigned char *, uint64_t))sub_10000F0A0, &qword_100069B80);
}

uint64_t sub_1000092C0(uint64_t a1, void (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t, uint64_t, unsigned char *, uint64_t), uint64_t *a4)
{
  if (qword_1000666A8 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100069B30;
  uint64_t v8 = qword_1000666B0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100069B38;
  uint64_t v10 = qword_1000666B8;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  sub_100008758((uint64_t)&qword_100069B40, (uint64_t)v15);
  type metadata accessor for PeopleFeatureFlags();
  uint64_t v11 = static PeopleFeatureFlags.shared.getter();
  a2(0);
  uint64_t v12 = swift_allocObject();
  swift_retain();
  swift_retain();
  uint64_t v13 = a3(v11, v7, v9, v15, v12);
  swift_release();
  uint64_t result = swift_release();
  *a4 = v13;
  return result;
}

uint64_t sub_100009434()
{
  if (qword_1000666B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100069B38;
  uint64_t v1 = qword_1000666C0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100069B68;
  uint64_t v3 = qword_1000666C8;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100069B70;
  uint64_t v5 = qword_1000666A8;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100069B30;
  type metadata accessor for PeopleFeatureFlags();
  swift_retain();
  uint64_t v7 = static PeopleFeatureFlags.shared.getter();
  uint64_t v18 = type metadata accessor for WidgetConfigurationReader();
  uint64_t v19 = &off_100061C68;
  v17[0] = v4;
  type metadata accessor for LocationStatusEventListener();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = sub_100012044((uint64_t)v17, v18);
  __chkstk_darwin(v9);
  uint64_t v11 = (void *)((char *)&v17[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = *v11;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v14 = sub_100010764(v7, v0, 1, v2, v13, v6, v8);
  sub_10000900C((uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  qword_100069B88 = (uint64_t)v14;
  return result;
}

uint64_t sub_1000096D0()
{
  if (qword_1000666B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100069B38;
  type metadata accessor for PeopleFeatureFlags();
  swift_retain();
  uint64_t v1 = static PeopleFeatureFlags.shared.getter();
  uint64_t v2 = type metadata accessor for KettleStatusFetcher();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = sub_10001210C(0, &qword_100066DF8);
  v14[3] = v2;
  v14[4] = &off_100061BB8;
  v14[0] = v3;
  type metadata accessor for DNDStatusSource();
  uint64_t v5 = (void *)swift_allocObject();
  uint64_t v6 = sub_100012044((uint64_t)v14, v2);
  __chkstk_darwin(v6);
  uint64_t v8 = (void *)((char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v9 + 16))(v8);
  uint64_t v10 = *v8;
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_10000E538(v1, v0, v10, v4, (uint64_t)&off_100061B68, v5);
  sub_10000900C((uint64_t)v14);
  swift_release();
  uint64_t result = swift_release();
  qword_100069B90 = (uint64_t)v11;
  return result;
}

uint64_t sub_1000098B4()
{
  if (qword_1000666B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100069B38;
  uint64_t v1 = type metadata accessor for CallHistoryFetcher();
  uint64_t v2 = swift_allocObject();
  type metadata accessor for PeopleFeatureFlags();
  swift_retain();
  uint64_t v3 = static PeopleFeatureFlags.shared.getter();
  type metadata accessor for UserDefaultsLaunchDiaryWriter();
  swift_allocObject();
  UserDefaultsLaunchDiaryWriter.init()();
  type metadata accessor for LaunchRecordReader();
  swift_allocObject();
  uint64_t v4 = LaunchRecordReader.init(withDataWriter:)();
  v14[3] = v1;
  v14[4] = &off_100062FD0;
  v14[0] = v2;
  type metadata accessor for MissedCallStatusSource();
  uint64_t v5 = (void *)swift_allocObject();
  uint64_t v6 = sub_100012044((uint64_t)v14, v1);
  __chkstk_darwin(v6);
  uint64_t v8 = (void *)((char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v9 + 16))(v8);
  uint64_t v10 = *v8;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_10000F630(v0, v10, v3, v4, v5);
  swift_release();
  sub_10000900C((uint64_t)v14);
  swift_release();
  uint64_t result = swift_release();
  qword_100069B98 = (uint64_t)v11;
  return result;
}

uint64_t sub_100009AD8()
{
  if (qword_1000666B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100069B38;
  id v1 = objc_allocWithZone((Class)IMCoreInterface);
  swift_retain();
  id v2 = [v1 init];
  uint64_t v19 = sub_10001210C(0, &qword_100066DD0);
  id v20 = &off_100062A08;
  *(void *)&long long v18 = v2;
  uint64_t v3 = type metadata accessor for MessageFetcher();
  uint64_t v4 = swift_allocObject();
  sub_1000087BC(&v18, v4 + 16);
  type metadata accessor for PeopleFeatureFlags();
  uint64_t v5 = static PeopleFeatureFlags.shared.getter();
  uint64_t v6 = type metadata accessor for UserDefaultsLaunchDiaryWriter();
  swift_allocObject();
  uint64_t v7 = UserDefaultsLaunchDiaryWriter.init()();
  uint64_t v19 = v6;
  id v20 = (_UNKNOWN **)&protocol witness table for UserDefaultsLaunchDiaryWriter;
  *(void *)&long long v18 = v7;
  type metadata accessor for LaunchRecordReader();
  swift_allocObject();
  uint64_t v8 = LaunchRecordReader.init(withDataWriter:)();
  uint64_t v19 = v3;
  id v20 = &off_100062A48;
  *(void *)&long long v18 = v4;
  type metadata accessor for IMessageStatusSource();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = sub_100012044((uint64_t)&v18, v3);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = *v12;
  swift_retain();
  swift_retain();
  swift_retain();
  NSString v15 = sub_10000FC1C(v5, v0, v14, v8, v9);
  swift_release();
  sub_10000900C((uint64_t)&v18);
  swift_release();
  uint64_t result = swift_release();
  qword_100069BA0 = (uint64_t)v15;
  return result;
}

uint64_t sub_100009D54()
{
  id v0 = [objc_allocWithZone((Class)EKEventStore) init];
  uint64_t v5 = type metadata accessor for ContactFetcher();
  uint64_t v6 = &protocol witness table for ContactFetcher;
  *(void *)&long long v4 = static ContactFetcher.shared.getter();
  type metadata accessor for PeopleFeatureFlags();
  uint64_t v1 = static PeopleFeatureFlags.shared.getter();
  type metadata accessor for CalendarStatusSource();
  id v2 = (void *)swift_allocObject();
  v2[10] = 0;
  swift_unknownObjectWeakInit();
  v2[3] = v0;
  uint64_t result = sub_1000087BC(&v4, (uint64_t)(v2 + 4));
  v2[2] = v1;
  qword_100069BA8 = (uint64_t)v2;
  return result;
}

void sub_100009E14()
{
  if (qword_1000666B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100069B38;
  type metadata accessor for PeopleFeatureFlags();
  swift_retain();
  uint64_t v1 = static PeopleFeatureFlags.shared.getter();
  id v2 = [objc_allocWithZone((Class)STDowntimeClient) init];
  type metadata accessor for ChildStateStatusSource();
  uint64_t v3 = swift_allocObject();
  swift_retain();
  id v4 = v2;
  uint64_t v5 = sub_100010198(v1, v0, (uint64_t)v4, v3);
  swift_release();

  qword_100069BB0 = v5;
}

uint64_t sub_100009EFC()
{
  if (qword_1000666B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100069B38;
  uint64_t v1 = qword_1000666C0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100069B68;
  type metadata accessor for PeopleFeatureFlags();
  swift_retain();
  uint64_t v3 = static PeopleFeatureFlags.shared.getter();
  uint64_t v10 = type metadata accessor for ContactFetcher();
  uint64_t v11 = &protocol witness table for ContactFetcher;
  *(void *)&long long v9 = v0;
  uint64_t FriendProvider = type metadata accessor for PeopleLocateFriendProvider();
  uint64_t v8 = &protocol witness table for PeopleLocateFriendProvider;
  *(void *)&long long v6 = v2;
  type metadata accessor for LocationStatusSource();
  uint64_t v4 = swift_allocObject();
  sub_1000087BC(&v9, v4 + 16);
  uint64_t result = sub_1000087BC(&v6, v4 + 64);
  *(void *)(v4 + 56) = v3;
  qword_100069BB8 = v4;
  return result;
}

uint64_t sub_10000A028()
{
  uint64_t v0 = type metadata accessor for ContactFormatter.Style();
  uint64_t v63 = *(void *)(v0 - 8);
  uint64_t v64 = v0;
  __chkstk_darwin(v0);
  uint64_t v65 = (char *)&v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for ContactFormatter();
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  char v67 = (uint64_t *)((char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v68 = (char *)&v60 - v5;
  sub_1000070B0(&qword_100066CE8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000540B0;
  if (qword_1000666E8 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100069B90;
  *(void *)(v6 + 56) = type metadata accessor for DNDStatusSource();
  *(void *)(v6 + 64) = sub_100012094(&qword_100066CF8, (void (*)(uint64_t))type metadata accessor for DNDStatusSource);
  *(void *)(v6 + 32) = v7;
  uint64_t v8 = qword_1000666D0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100069B78;
  uint64_t v66 = type metadata accessor for AskToBuyStatusSource();
  *(void *)(v6 + 96) = v66;
  *(void *)(v6 + 104) = sub_100012094(&qword_100066D00, (void (*)(uint64_t))type metadata accessor for AskToBuyStatusSource);
  *(void *)(v6 + 72) = v9;
  uint64_t v10 = qword_1000666D8;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_100069B80;
  uint64_t v62 = type metadata accessor for ScreenTimeStatusSource();
  *(void *)(v6 + 136) = v62;
  *(void *)(v6 + 144) = sub_100012094(&qword_100066D08, (void (*)(uint64_t))type metadata accessor for ScreenTimeStatusSource);
  *(void *)(v6 + 112) = v11;
  uint64_t v12 = qword_1000666F0;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_100069B98;
  *(void *)(v6 + 176) = type metadata accessor for MissedCallStatusSource();
  *(void *)(v6 + 184) = sub_100012094(&qword_100066D10, (void (*)(uint64_t))type metadata accessor for MissedCallStatusSource);
  *(void *)(v6 + 152) = v13;
  uint64_t v14 = qword_1000666F8;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_100069BA0;
  *(void *)(v6 + 216) = type metadata accessor for IMessageStatusSource();
  *(void *)(v6 + 224) = sub_100012094(&qword_100066D18, (void (*)(uint64_t))type metadata accessor for IMessageStatusSource);
  *(void *)(v6 + 192) = v15;
  uint64_t v16 = qword_100066700;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_100069BA8;
  *(void *)(v6 + 256) = type metadata accessor for CalendarStatusSource();
  *(void *)(v6 + 264) = sub_100012094(&qword_100066D20, (void (*)(uint64_t))type metadata accessor for CalendarStatusSource);
  *(void *)(v6 + 232) = v17;
  uint64_t v18 = qword_100066708;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_100069BB0;
  *(void *)(v6 + 296) = type metadata accessor for ChildStateStatusSource();
  *(void *)(v6 + 304) = sub_100012094(&qword_100066D28, (void (*)(uint64_t))type metadata accessor for ChildStateStatusSource);
  *(void *)(v6 + 272) = v19;
  uint64_t v20 = qword_100066710;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100069BB8;
  *(void *)(v6 + 336) = type metadata accessor for LocationStatusSource();
  *(void *)(v6 + 344) = sub_100012094(&qword_100066D30, (void (*)(uint64_t))type metadata accessor for LocationStatusSource);
  *(void *)(v6 + 312) = v21;
  sub_1000070B0(&qword_100066D38);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1000540C0;
  uint64_t v23 = qword_1000666E0;
  swift_retain();
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v60 = v6;
  uint64_t v24 = qword_100069B88;
  uint64_t v25 = sub_100012094(&qword_100066D40, (void (*)(uint64_t))type metadata accessor for LocationStatusEventListener);
  *(void *)(v22 + 32) = v24;
  *(void *)(v22 + 40) = v25;
  uint64_t v26 = qword_100069B90;
  uint64_t v27 = sub_100012094(&qword_100066D48, (void (*)(uint64_t))type metadata accessor for DNDStatusSource);
  *(void *)(v22 + 48) = v26;
  *(void *)(v22 + 56) = v27;
  uint64_t v28 = qword_100069B78;
  uint64_t v29 = sub_100012094(&qword_100066D50, (void (*)(uint64_t))type metadata accessor for AskToBuyStatusSource);
  *(void *)(v22 + 64) = v28;
  *(void *)(v22 + 72) = v29;
  uint64_t v30 = qword_100069B80;
  uint64_t v31 = sub_100012094(&qword_100066D58, (void (*)(uint64_t))type metadata accessor for ScreenTimeStatusSource);
  *(void *)(v22 + 80) = v30;
  *(void *)(v22 + 88) = v31;
  uint64_t v32 = qword_100069B98;
  uint64_t v33 = sub_100012094(&qword_100066D60, (void (*)(uint64_t))type metadata accessor for MissedCallStatusSource);
  *(void *)(v22 + 96) = v32;
  *(void *)(v22 + 104) = v33;
  uint64_t v34 = qword_100069BA0;
  uint64_t v35 = sub_100012094(&qword_100066D68, (void (*)(uint64_t))type metadata accessor for IMessageStatusSource);
  *(void *)(v22 + 112) = v34;
  *(void *)(v22 + 120) = v35;
  uint64_t v36 = qword_100069BB0;
  uint64_t v37 = sub_100012094(&qword_100066D70, (void (*)(uint64_t))type metadata accessor for ChildStateStatusSource);
  *(void *)(v22 + 128) = v36;
  *(void *)(v22 + 136) = v37;
  type metadata accessor for ContactFetcher();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v61 = static ContactFetcher.shared.getter();
  id v38 = [self defaultStore];
  if (qword_1000666C8 != -1) {
    swift_once();
  }
  uint64_t v39 = qword_100069B70;
  (*(void (**)(char *, void, uint64_t))(v63 + 104))(v65, enum case for ContactFormatter.Style.fullName(_:), v64);
  swift_retain();
  String.localized.getter();
  uint64_t v40 = v68;
  ContactFormatter.init(style:fallback:)();
  type metadata accessor for PeopleUserDefaults();
  uint64_t v41 = (void *)static PeopleUserDefaults.shared.getter();
  type metadata accessor for RelevantIntentManager();
  id v42 = (uint64_t *)static RelevantIntentManager.shared.getter();
  uint64_t v43 = v69;
  uint64_t v44 = v70;
  uint64_t v45 = (uint64_t)v67;
  (*(void (**)(void *, char *, uint64_t))(v69 + 16))(v67, v40, v70);
  swift_retain();
  uint64_t v46 = v61;
  swift_retain();
  id v47 = v38;
  swift_retain();
  id v48 = v41;
  char v67 = sub_1000110B0(v46, (uint64_t)v47, v39, v45, (uint64_t)v48, v42);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v44);
  swift_release();

  swift_release();
  swift_release();
  sub_1000070B0(&qword_100066D78);
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_1000540D0;
  uint64_t v50 = qword_100069B88;
  *(void *)(v49 + 56) = type metadata accessor for LocationStatusEventListener();
  *(void *)(v49 + 64) = sub_100012094(&qword_100066D80, (void (*)(uint64_t))type metadata accessor for LocationStatusEventListener);
  *(void *)(v49 + 32) = v50;
  uint64_t v51 = qword_100069B78;
  *(void *)(v49 + 96) = v66;
  *(void *)(v49 + 104) = sub_100012094(&qword_100066D88, (void (*)(uint64_t))type metadata accessor for AskToBuyStatusSource);
  *(void *)(v49 + 72) = v51;
  uint64_t v52 = qword_100069B80;
  *(void *)(v49 + 136) = v62;
  *(void *)(v49 + 144) = sub_100012094(&qword_100066D90, (void (*)(uint64_t))type metadata accessor for ScreenTimeStatusSource);
  *(void *)(v49 + 112) = v52;
  id v53 = objc_allocWithZone((Class)CHSWidgetConfigurationReader);
  swift_retain();
  swift_retain();
  swift_retain();
  id v54 = [v53 init];
  uint64_t v72 = sub_10001210C(0, &qword_100066D98);
  v73 = &protocol witness table for CHSWidgetConfigurationReader;
  *(void *)&long long v71 = v54;
  type metadata accessor for WidgetConfigurationReader();
  uint64_t v55 = swift_allocObject();
  sub_1000087BC(&v71, v55 + 16);
  type metadata accessor for PeopleTimelineControllerFactory();
  swift_allocObject();
  uint64_t v56 = PeopleTimelineControllerFactory.init()();
  swift_retain();
  uint64_t v57 = (uint64_t)v67;
  swift_retain();
  swift_retain();
  unint64_t v58 = sub_1000113CC(v60, v22, v55, v56, v57, v49);
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  qword_100069BC0 = (uint64_t)v58;
  return result;
}

void *sub_10000ABE8(uint64_t (*a1)(id *), void *a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = &_swiftEmptyArrayStorage;
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          unint64_t v4 = v15;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = &_swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_10000AD94(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *a1;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_10000ABE8((uint64_t (*)(id *))sub_10000D6F4, v32, v14);
  uint64_t v16 = sub_10000B338((unint64_t)v15);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_100022E04((uint64_t)v16);
  swift_bridgeObjectRelease();
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  id v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v29 = v10;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = v5;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v28 = v11;
    uint64_t v36 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    v27[1] = v21 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = Set.description.getter();
    uint64_t v31 = a4;
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_10002A278(v23, v25, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "refreshing widgets of kinds %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v29);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  swift_retain();
  sub_10001173C(v17);
  swift_bridgeObjectRelease();
  return swift_release();
}

BOOL sub_10000B094(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000118B8(*a1);
  uint64_t v11 = sub_100022E04((uint64_t)v10);
  swift_bridgeObjectRelease();
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v26 = v3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = a3;
    unint64_t v15 = (uint8_t *)v14;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v24 = v7;
    *(_DWORD *)unint64_t v15 = 136315138;
    uint64_t v22 = v15 + 4;
    swift_bridgeObjectRetain();
    uint64_t v16 = Set.description.getter();
    uint64_t v23 = v6;
    uint64_t v17 = v16;
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_10002A278(v17, v19, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "contactId in widget %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v25;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  char v20 = sub_10000DEE4(a3, v11);
  swift_bridgeObjectRelease();
  return (v20 & 1) == 0;
}

void *sub_10000B338(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t result = (void *)sub_10000D774(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 kind];
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10000D774(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      os_log_type_t v13 = (char *)&_swiftEmptyArrayStorage[2 * v12];
      *((void *)v13 + 4) = v8;
      *((void *)v13 + 5) = v10;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B4B4(uint64_t a1)
{
  return sub_10000B4F4(a1, "error reading widgets configurations: %s");
}

uint64_t sub_10000B4D4(uint64_t a1)
{
  return sub_10000B4F4(a1, "Failed to suggest widgets with error: %s");
}

uint64_t sub_10000B4F4(uint64_t a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v4;
    unint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v2;
    uint64_t v21 = v12;
    uint64_t v17 = a2;
    *(_DWORD *)unint64_t v11 = 136315138;
    v16[1] = v11 + 4;
    swift_getErrorValue();
    uint64_t v13 = Error.localizedDescription.getter();
    uint64_t v20 = sub_10002A278(v13, v14, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, v17, v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000B740(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v27 - v12;
  sub_1000070F4((void *)(v2 + 72), *(void *)(v2 + 96));
  static PeopleConstants.widgetBundleID.getter();
  dispatch thunk of TimelineControllerFactoryProtocol.timelineController(for:in:)();
  swift_bridgeObjectRelease();
  type metadata accessor for PeopleAnalytics();
  uint64_t v14 = static PeopleAnalytics.timelineStopwatch(timeline:)();
  sub_1000070F4(v32, v32[3]);
  uint64_t v15 = dispatch thunk of TimelineControllerProtocol.reloadTimeline()();
  dispatch thunk of PeopleAnalytics.StopWatch.stop()();
  if (v15)
  {
    uint64_t v28 = v8;
    swift_errorRetain();
    static PeopleLogger.daemon.getter();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_10002A278(a1, a2, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v19 = Error.localizedDescription.getter();
      uint64_t v30 = sub_10002A278(v19, v20, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Widget (%s) timeline refresh error: %s ", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      swift_errorRelease();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v28);
  }
  else
  {
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v27 = v14;
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v28 = v8;
      *(_DWORD *)uint64_t v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_10002A278(a1, a2, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Successfully requested widget timeline refresh for widgetKind %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v28);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v8);
    }
    uint64_t v24 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 1, 1, v24);
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = a1;
    v25[5] = a2;
    swift_bridgeObjectRetain();
    sub_100016DD8((uint64_t)v7, (uint64_t)&unk_100066E18, (uint64_t)v25);
    swift_release();
    swift_release();
  }
  return sub_10000900C((uint64_t)v32);
}

uint64_t sub_10000BD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_10000BD20, 0, 0);
}

uint64_t sub_10000BD20()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 32) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000BDB4, v2, v1);
}

uint64_t sub_10000BDB4()
{
  swift_release();
  static MetricTemplate.updateRefreshRequestedCount(for:)();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000BE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[28] = a5;
  v6[29] = v5;
  v6[26] = a3;
  v6[27] = a4;
  v6[24] = a1;
  v6[25] = a2;
  uint64_t v7 = type metadata accessor for Logger();
  v6[30] = v7;
  v6[31] = *(void *)(v7 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  return _swift_task_switch(sub_10000BF2C, 0, 0);
}

uint64_t sub_10000BF2C()
{
  uint64_t v41 = v0;
  uint64_t v1 = (uint64_t)v0 + 56;
  uint64_t v2 = *(void *)(*((void *)v0 + 29) + 152);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 32;
    swift_bridgeObjectRetain_n();
    while (1)
    {
      uint64_t v5 = *((void *)v0 + 24);
      uint64_t v6 = *((void *)v0 + 25);
      sub_100008758(v4, (uint64_t)(v0 + 6));
      sub_1000070F4((void *)v0 + 12, *((void *)v0 + 15));
      if (dispatch thunk of SpotlightReindexHandler.bundleId.getter() == v5 && v7 == v6) {
        break;
      }
      char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v9) {
        goto LABEL_13;
      }
      sub_10000900C((uint64_t)(v0 + 6));
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = (uint64_t)v0 + 56;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v1 = (uint64_t)v0 + 56;
    swift_bridgeObjectRelease();
    sub_1000087BC(v0 + 6, (uint64_t)v0 + 56);
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_11:
    *(void *)(v1 + 32) = 0;
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)v0 + 10))
  {
    sub_1000087BC((long long *)v1, (uint64_t)(v0 + 1));
    type metadata accessor for ReindexCoordinator();
    swift_allocObject();
    *((void *)v0 + 38) = ReindexCoordinator.init()();
    type metadata accessor for PeopleAnalytics();
    *((void *)v0 + 39) = static PeopleAnalytics.reIndexingStopwatch(_:)();
    static PeopleConstants.reindexTransactionName.getter();
    type metadata accessor for OSTransaction();
    swift_allocObject();
    *((void *)v0 + 40) = OSTransaction.init(name:)();
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *((void *)v0 + 37);
    uint64_t v14 = *((void *)v0 + 30);
    uint64_t v15 = *((void *)v0 + 31);
    unint64_t v16 = *((void *)v0 + 25);
    if (v12)
    {
      uint64_t v37 = *((void *)v0 + 24);
      uint64_t v17 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      swift_bridgeObjectRetain();
      *((void *)v0 + 22) = sub_10002A278(v37, v16, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v18 = OSTransaction.description.getter();
      *((void *)v0 + 23) = sub_10002A278(v18, v19, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Start batch reindex: %s with %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v20(v13, v14);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_release_n();

      unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v20(v13, v14);
    }
    *((void *)v0 + 41) = v20;
    *((void *)v0 + 42) = ReindexCoordinator.indexer.getter();
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of SpotlightIndexer.startBatchMode(forBundle:protectionClass:)
                                                                     + async function pointer to dispatch thunk of SpotlightIndexer.startBatchMode(forBundle:protectionClass:));
    uint64_t v30 = (void *)swift_task_alloc();
    *((void *)v0 + 43) = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_10000C568;
    uint64_t v31 = *((void *)v0 + 27);
    uint64_t v32 = *((void *)v0 + 28);
    uint64_t v34 = *((void *)v0 + 24);
    uint64_t v33 = *((void *)v0 + 25);
    return v39(v34, v33, v31, v32);
  }
  else
  {
    sub_10001223C(v1, (uint64_t *)&unk_100066E20);
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = *((void *)v0 + 33);
    uint64_t v25 = *((void *)v0 + 30);
    uint64_t v26 = *((void *)v0 + 31);
    unint64_t v27 = *((void *)v0 + 25);
    if (v23)
    {
      uint64_t v28 = *((void *)v0 + 24);
      uint64_t v38 = *((void *)v0 + 33);
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      *((void *)v0 + 17) = sub_10002A278(v28, v27, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "No reindex support for %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v38, v25);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v36 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v36();
  }
}

uint64_t sub_10000C568()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10000C680, 0, 0);
}

uint64_t sub_10000C680()
{
  unint64_t v19 = v0;
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v16 = v0[36];
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[41];
    uint64_t v15 = v0[30];
    uint64_t v4 = v0[24];
    unint64_t v3 = v0[25];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[21] = sub_10002A278(v4, v3, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Calling reindexEvents: %s ", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v17(v16, v15);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[41];
    uint64_t v7 = v0[36];
    uint64_t v8 = v0[30];
    swift_bridgeObjectRelease_n();

    v6(v7, v8);
  }
  uint64_t v9 = v0[5];
  uint64_t v10 = v0[6];
  sub_1000070F4(v0 + 2, v9);
  os_log_type_t v11 = (void *)swift_task_alloc();
  v0[44] = v11;
  void *v11 = v0;
  v11[1] = sub_10000C8D8;
  uint64_t v12 = v0[38];
  uint64_t v13 = v0[26];
  return dispatch thunk of SpotlightReindexHandler.reindexEvents(includeIds:withCoordinator:)(v13, v12, v9, v10);
}

uint64_t sub_10000C8D8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000C9D4, 0, 0);
}

uint64_t sub_10000C9D4()
{
  uint64_t v18 = v0;
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v14 = v0[35];
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[41];
    uint64_t v13 = v0[30];
    uint64_t v4 = v0[24];
    unint64_t v3 = v0[25];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[20] = sub_10002A278(v4, v3, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Cleaning up batch: %s ", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v15(v14, v13);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[41];
    uint64_t v7 = v0[35];
    uint64_t v8 = v0[30];
    swift_bridgeObjectRelease_n();

    v6(v7, v8);
  }
  v0[45] = ReindexCoordinator.indexer.getter();
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of SpotlightIndexer.endBatchMode(forBundle:)
                                                 + async function pointer to dispatch thunk of SpotlightIndexer.endBatchMode(forBundle:));
  uint64_t v9 = (void *)swift_task_alloc();
  v0[46] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10000CC2C;
  uint64_t v11 = v0[24];
  uint64_t v10 = v0[25];
  return v16(v11, v10);
}

uint64_t sub_10000CC2C()
{
  *(void *)(*(void *)v1 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v2 = sub_10000D018;
  }
  else
  {
    swift_release();
    os_log_type_t v2 = sub_10000CD48;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CD48()
{
  uint64_t v17 = v0;
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v14 = v0[34];
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[41];
    uint64_t v13 = v0[30];
    uint64_t v4 = v0[24];
    unint64_t v3 = v0[25];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    swift_bridgeObjectRetain();
    v0[18] = sub_10002A278(v4, v3, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 12) = 2080;
    uint64_t v6 = OSTransaction.description.getter();
    v0[19] = sub_10002A278(v6, v7, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Completed reindex for: %s with %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v15(v14, v13);
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[41];
    uint64_t v9 = v0[34];
    uint64_t v10 = v0[30];
    swift_bridgeObjectRelease_n();
    swift_release_n();

    v8(v9, v10);
  }
  dispatch thunk of PeopleAnalytics.StopWatch.stop()();
  OSTransaction.complete()();
  swift_release();
  swift_release();
  swift_release();
  sub_10000900C((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10000D018()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[41];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[30];
  uint64_t v5 = v0[24];
  uint64_t v4 = (void *)v0[25];
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_errorRetain();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = v5;
  v6._object = v4;
  String.append(_:)(v6);
  v7._countAndFlagsBits = 4203786;
  v7._object = (void *)0xE300000000000000;
  String.append(_:)(v7);
  Logger.ifError(_:message:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();
  v1(v2, v3);
  dispatch thunk of PeopleAnalytics.StopWatch.stop()();
  OSTransaction.complete()();
  swift_release();
  swift_release();
  swift_release();
  sub_10000900C((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000D1D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000900C(v0 + 32);
  sub_10000900C(v0 + 72);
  sub_10000900C(v0 + 112);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StatusManager()
{
  return self;
}

uint64_t sub_10000D264(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_1000070F4(a3, a3[3]);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_100011F04;
  *(void *)(v7 + 24) = v6;
  swift_retain();
  dispatch thunk of ChronoConfigurationReaderProtocol.allConfiguredWidgets(completion:)();
  return swift_release();
}

uint64_t sub_10000D33C(unint64_t a1, uint64_t a2, void (*a3)(void *, void), void **a4)
{
  if (a1)
  {
    unint64_t v6 = a1;
    unint64_t v27 = &_swiftEmptyArrayStorage;
    if (a1 >> 62) {
      goto LABEL_31;
    }
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = _CocoaArrayWrapper.endIndex.getter())
    {
      uint64_t v20 = a4;
      uint64_t v21 = a3;
      uint64_t v8 = 0;
      uint64_t v24 = v7;
      unint64_t v25 = v6 & 0xC000000000000001;
      unint64_t v22 = v6 + 32;
      unint64_t v23 = v6;
      while (v25)
      {
        uint64_t v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v11 = __OFADD__(v8++, 1);
        if (v11) {
          goto LABEL_29;
        }
LABEL_12:
        static PeopleConstants.appBundleID.getter();
        NSString v12 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v13 = [v10 widgetConfigurationsForApplicationContainerBundleIdentifier:v12];

        sub_1000070B0(&qword_100066C90);
        unint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v14 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v15)
          {
LABEL_21:
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v9 = &_swiftEmptyArrayStorage;
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v15) {
            goto LABEL_21;
          }
        }
        uint64_t v26 = &_swiftEmptyArrayStorage;
        a4 = &v26;
        specialized ContiguousArray.reserveCapacity(_:)();
        if (v15 < 0) {
          goto LABEL_30;
        }
        uint64_t v16 = 0;
        do
        {
          if ((v14 & 0xC000000000000001) != 0)
          {
            uint64_t v17 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v17 = *(void **)(v14 + 8 * v16 + 32);
            swift_unknownObjectRetain();
          }
          ++v16;
          a3 = (void (*)(void *, void))objc_msgSend(v17, "widget", v20, v21);
          swift_unknownObjectRelease();
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        while (v15 != v16);
        uint64_t v9 = v26;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v6 = v23;
LABEL_6:
        a4 = &v27;
        sub_10000E074((unint64_t)v9);
        if (v8 == v24)
        {
          swift_bridgeObjectRelease();
          v21(v27, 0);
          goto LABEL_33;
        }
      }
      uint64_t v10 = *(void **)(v22 + 8 * v8);
      swift_unknownObjectRetain();
      BOOL v11 = __OFADD__(v8++, 1);
      if (!v11) {
        goto LABEL_12;
      }
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    a3(&_swiftEmptyArrayStorage, 0);
LABEL_33:
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (a2)
    {
      uint64_t v18 = a2;
    }
    else
    {
      sub_100011F4C();
      uint64_t v18 = swift_allocError();
    }
    swift_errorRetain();
    a3((void *)v18, 1);
    return swift_errorRelease();
  }
}

uint64_t sub_10000D698()
{
  sub_10000900C(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WidgetConfigurationReader()
{
  return self;
}

BOOL sub_10000D6F4(void **a1)
{
  return sub_10000B094(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000D714(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D970(a1, a2, a3, (void *)*v3, &qword_100066CD8, &qword_100066CE0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000D744(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D970(a1, a2, a3, (void *)*v3, &qword_100066CE8, &qword_100066CF0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000D774(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D804(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000D794(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D970(a1, a2, a3, (void *)*v3, &qword_1000669F0, &qword_100066CC0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000D7C4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000DB18(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000D7E4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000DCA4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000D804(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000070B0(&qword_100066C08);
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
  id v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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

uint64_t sub_10000D970(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_1000070B0(a5);
    id v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    id v13 = _swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    sub_1000070B0(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000DB18(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000070B0(&qword_100066CC8);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_1000070B0(&qword_100066CD0);
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

uint64_t sub_10000DCA4(char a1, int64_t a2, char a3, void *a4)
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
  sub_1000070B0((uint64_t *)&unk_100066CB0);
  uint64_t v10 = *(void *)(type metadata accessor for ContactPerson() - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for ContactPerson() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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

uint64_t sub_10000DEE4(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 1;
  }
  uint64_t v22 = a1 + 32;
  uint64_t v4 = a2 + 56;
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; i != v2; ++i)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = (uint64_t *)(v22 + 16 * i);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v9 = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(a2 + 48);
        unint64_t v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_22:
          swift_bridgeObjectRelease();
          uint64_t v20 = 0;
          goto LABEL_23;
        }
        uint64_t v15 = ~v10;
        for (unint64_t j = v11 + 1; ; unint64_t j = v17 + 1)
        {
          uint64_t v17 = j & v15;
          if (((*(void *)(v4 + (((j & v15) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v15)) & 1) == 0) {
            break;
          }
          uint64_t v18 = (void *)(v12 + 16 * v17);
          BOOL v19 = *v18 == v8 && v18[1] == v7;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_22;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v20 = 1;
LABEL_23:
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_10000E074(unint64_t a1)
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
    uint64_t result = sub_100010E9C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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

uint64_t sub_10000E240(uint64_t a1)
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
  uint64_t v3 = sub_10001CD98(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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

uint64_t sub_10000E394(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_10001CFCC(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for CalendarPersonStatus() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10000E538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v12 - 8);
  uint64_t v49 = v12;
  __chkstk_darwin(v12);
  uint64_t v51 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for StatusType();
  uint64_t v52 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v50 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58[3] = type metadata accessor for ContactFetcher();
  v58[4] = &protocol witness table for ContactFetcher;
  v58[0] = a2;
  v57[3] = type metadata accessor for KettleStatusFetcher();
  v57[4] = &off_100061BB8;
  v57[0] = a3;
  a6[19] = 0;
  swift_unknownObjectWeakInit();
  a6[20] = 0;
  a6[2] = a1;
  sub_100008758((uint64_t)v58, (uint64_t)(a6 + 8));
  sub_100008758((uint64_t)v57, (uint64_t)(a6 + 3));
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8);
  uint64_t v55 = a4;
  uint64_t v56 = a5;
  sub_100007180((uint64_t *)&v54);
  uint64_t v47 = a1;
  uint64_t v20 = v14;
  uint64_t v21 = v52;
  swift_retain();
  v19(v16, v18, a4, a5);
  sub_1000087BC(&v54, (uint64_t)(a6 + 13));
  type metadata accessor for BiomeUtilities();
  static BiomeUtilities.shared.getter();
  uint64_t v22 = enum case for StatusType.dndAvailability(_:);
  unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
  uint64_t v24 = v50;
  v23(v50, enum case for StatusType.dndAvailability(_:), v20);
  unint64_t v25 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
  swift_release();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v52 = v21 + 8;
  uint64_t v45 = v26;
  v26(v24, v20);
  id v27 = [self userStatusChangeStream];
  id v28 = [v27 publisher];

  id v29 = [v28 subscribeOn:v25];
  uint64_t v30 = v20;
  v23(v24, v22, v20);
  sub_1000070B0((uint64_t *)&unk_100066E00);
  swift_allocObject();
  id v31 = v29;
  swift_retain();
  id v46 = v31;
  a6[20] = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  uint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    id v44 = v25;
    uint64_t v43 = v35;
    *(void *)&long long v54 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    v41[1] = v34 + 4;
    os_log_t v42 = v32;
    uint64_t v36 = v50;
    v23(v50, v22, v30);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v39 = v38;
    v45(v36, v30);
    uint64_t v53 = sub_10002A278(v37, v39, (uint64_t *)&v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    uint64_t v32 = v42;
    _os_log_impl((void *)&_mh_execute_header, v42, v33, "%s init complete", v34, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }

  swift_release();
  sub_10000900C((uint64_t)v57);
  sub_10000900C((uint64_t)v58);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v51, v49);
  return a6;
}

uint64_t sub_10000EB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = type metadata accessor for Logger();
  uint64_t v43 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StatusType();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47[3] = type metadata accessor for SpotlightIndexer();
  v47[4] = &protocol witness table for SpotlightIndexer;
  v47[0] = a2;
  v46[3] = type metadata accessor for ContactFetcher();
  v46[4] = &protocol witness table for ContactFetcher;
  v46[0] = a3;
  *(void *)(a5 + 24) = 0;
  swift_unknownObjectWeakInit();
  static PeopleConstants.askToBuyEventTTL.getter();
  *(void *)(a5 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_listener) = 0;
  *(void *)(a5 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_featureFlags) = a1;
  sub_100008758((uint64_t)v47, a5 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_indexer);
  sub_100008758((uint64_t)v46, a5 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_contactFetcher);
  uint64_t v41 = a4;
  sub_100008758(a4, a5 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_messageConduit);
  type metadata accessor for BiomeUtilities();
  uint64_t v40 = a1;
  swift_retain();
  static BiomeUtilities.shared.getter();
  uint64_t v16 = enum case for StatusType.askToBuyRequest(_:);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 104);
  v17(v15, enum case for StatusType.askToBuyRequest(_:), v12);
  uint64_t v18 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
  swift_release();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v37 = v13 + 8;
  v36(v15, v12);
  uint64_t v19 = v16;
  id v20 = [self askToBuyStream];
  id v21 = [v20 publisher];

  id v39 = v18;
  id v22 = [v21 subscribeOn:v18];

  uint64_t v35 = v17;
  v17(v15, v19, v12);
  sub_1000070B0(&qword_100066DF0);
  swift_allocObject();
  id v23 = v22;
  swift_retain();
  *(void *)(a5 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_listener) = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  os_log_t v42 = v11;
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    id v34 = v23;
    id v27 = (uint8_t *)v26;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v45 = v33;
    *(_DWORD *)id v27 = 136315138;
    v32[1] = v27 + 4;
    v35(v15, v19, v12);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v30 = v29;
    v36(v15, v12);
    uint64_t v44 = sub_10002A278(v28, v30, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s init complete", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }

  swift_release();
  sub_10000900C(v41);
  sub_10000900C((uint64_t)v46);
  sub_10000900C((uint64_t)v47);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v38);
  return a5;
}

uint64_t sub_10000F0A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = type metadata accessor for Logger();
  uint64_t v43 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StatusType();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47[3] = type metadata accessor for SpotlightIndexer();
  v47[4] = &protocol witness table for SpotlightIndexer;
  v47[0] = a2;
  v46[3] = type metadata accessor for ContactFetcher();
  v46[4] = &protocol witness table for ContactFetcher;
  v46[0] = a3;
  *(void *)(a5 + 24) = 0;
  swift_unknownObjectWeakInit();
  static PeopleConstants.screenTimeRequestEventTTL.getter();
  *(void *)(a5 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_listener) = 0;
  *(void *)(a5 + 32) = a1;
  sub_100008758((uint64_t)v47, a5 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_indexer);
  sub_100008758((uint64_t)v46, a5 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_contactFetcher);
  uint64_t v41 = a4;
  sub_100008758(a4, a5 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_messageConduit);
  type metadata accessor for BiomeUtilities();
  uint64_t v40 = a1;
  swift_retain();
  static BiomeUtilities.shared.getter();
  uint64_t v16 = enum case for StatusType.screenTimeRequest(_:);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 104);
  v17(v15, enum case for StatusType.screenTimeRequest(_:), v12);
  uint64_t v18 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
  swift_release();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v37 = v13 + 8;
  v36(v15, v12);
  uint64_t v19 = v16;
  id v20 = [self screenTimeRequestStream];
  id v21 = [v20 publisher];

  id v39 = v18;
  id v22 = [v21 subscribeOn:v18];

  uint64_t v35 = v17;
  v17(v15, v19, v12);
  sub_1000070B0(&qword_100066DE8);
  swift_allocObject();
  id v23 = v22;
  swift_retain();
  *(void *)(a5 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_listener) = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  os_log_t v42 = v11;
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    id v34 = v23;
    id v27 = (uint8_t *)v26;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v45 = v33;
    *(_DWORD *)id v27 = 136315138;
    v32[1] = v27 + 4;
    v35(v15, v19, v12);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v30 = v29;
    v36(v15, v12);
    uint64_t v44 = sub_10002A278(v28, v30, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s init complete", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }

  swift_release();
  sub_10000900C(v41);
  sub_10000900C((uint64_t)v46);
  sub_10000900C((uint64_t)v47);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v38);
  return a5;
}

void *sub_10000F630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v42 = type metadata accessor for Logger();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v44 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for StatusType();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49[3] = type metadata accessor for LaunchRecordReader();
  v49[4] = &protocol witness table for LaunchRecordReader;
  v49[0] = a4;
  v48[3] = type metadata accessor for ContactFetcher();
  v48[4] = &protocol witness table for ContactFetcher;
  v48[0] = a1;
  v47[3] = type metadata accessor for CallHistoryFetcher();
  v47[4] = &off_100062FD0;
  v47[0] = a2;
  a5[3] = 0;
  swift_unknownObjectWeakInit();
  a5[4] = 0;
  sub_100008758((uint64_t)v49, (uint64_t)(a5 + 16));
  a5[15] = a3;
  sub_100008758((uint64_t)v48, (uint64_t)(a5 + 5));
  sub_100008758((uint64_t)v47, (uint64_t)(a5 + 10));
  type metadata accessor for BiomeUtilities();
  uint64_t v41 = a3;
  swift_retain();
  static BiomeUtilities.shared.getter();
  uint64_t v15 = enum case for StatusType.missedCall(_:);
  uint64_t v16 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  v16(v14, enum case for StatusType.missedCall(_:), v11);
  id v43 = (id)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
  swift_release();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v39 = v12 + 8;
  uint64_t v38 = v17;
  v17(v14, v11);
  uint64_t v18 = v15;
  id v19 = [self intent];
  id v20 = [v19 publisher];

  static PeopleConstants.intentClassKeyPath.getter();
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  static PeopleConstants.startCallIntent.getter();
  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v23 = [v20 filterWithKeyPath:v21 value:v22];

  id v24 = [v23 subscribeOn:v43];
  unsigned int v37 = v18;
  uint64_t v25 = v11;
  uint64_t v36 = v16;
  v16(v14, v18, v11);
  sub_1000070B0(&qword_100066DE0);
  swift_allocObject();
  id v26 = v24;
  swift_retain();
  a5[4] = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  id v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    id v35 = v26;
    *(_DWORD *)unint64_t v29 = 136315138;
    v34[1] = v29 + 4;
    v36(v14, v37, v25);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v32 = v31;
    v38(v14, v25);
    uint64_t v45 = sub_10002A278(v30, v32, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s init complete", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }

  swift_release();
  sub_10000900C((uint64_t)v49);
  sub_10000900C((uint64_t)v47);
  sub_10000900C((uint64_t)v48);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v42);
  return a5;
}

void *sub_10000FC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v41 = *(void *)(v10 - 8);
  uint64_t v42 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for StatusType();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49[3] = type metadata accessor for LaunchRecordReader();
  v49[4] = &protocol witness table for LaunchRecordReader;
  v49[0] = a4;
  v48[3] = type metadata accessor for ContactFetcher();
  v48[4] = &protocol witness table for ContactFetcher;
  v48[0] = a2;
  v47[3] = type metadata accessor for MessageFetcher();
  v47[4] = &off_100062A48;
  v47[0] = a3;
  a5[18] = 0;
  a5[20] = 0;
  swift_unknownObjectWeakInit();
  sub_100008758((uint64_t)v49, (uint64_t)(a5 + 3));
  a5[2] = a1;
  sub_100008758((uint64_t)v48, (uint64_t)(a5 + 8));
  sub_100008758((uint64_t)v47, (uint64_t)(a5 + 13));
  type metadata accessor for BiomeUtilities();
  uint64_t v43 = a1;
  swift_retain();
  static BiomeUtilities.shared.getter();
  uint64_t v17 = enum case for StatusType.readMessage(_:);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 104);
  v18(v16, enum case for StatusType.readMessage(_:), v13);
  id v19 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
  swift_release();
  id v20 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v40 = v14 + 8;
  uint64_t v39 = v20;
  v20(v16, v13);
  uint64_t v21 = v17;
  id v22 = [self readMessageStream];
  id v23 = [v22 publisher];

  id v24 = [v23 subscribeOn:v19];
  uint64_t v38 = v18;
  v18(v16, v21, v13);
  sub_1000070B0(&qword_100066DD8);
  swift_allocObject();
  id v25 = v24;
  swift_retain();
  a5[18] = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  uint64_t v44 = v12;
  id v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    id v37 = v25;
    unint64_t v29 = (uint8_t *)v28;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v46 = v35;
    id v36 = v19;
    *(_DWORD *)unint64_t v29 = 136315138;
    v34[1] = v29 + 4;
    v38(v16, v21, v13);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v32 = v31;
    v39(v16, v13);
    uint64_t v45 = sub_10002A278(v30, v32, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s init complete", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }

  swift_release();
  sub_10000900C((uint64_t)v49);
  sub_10000900C((uint64_t)v47);
  sub_10000900C((uint64_t)v48);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v42);
  return a5;
}

uint64_t sub_100010198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = type metadata accessor for Logger();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for StatusType();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48[3] = sub_10001210C(0, &qword_100066DC0);
  v48[4] = &off_100061D40;
  v48[0] = a3;
  v47[3] = type metadata accessor for ContactFetcher();
  v47[4] = &protocol witness table for ContactFetcher;
  v47[0] = a2;
  *(void *)(a4 + 24) = 0;
  swift_unknownObjectWeakInit();
  static PeopleConstants.childStateEventTTL.getter();
  *(void *)(a4 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_listener) = 0;
  *(void *)(a4 + 32) = a1;
  sub_100008758((uint64_t)v47, a4 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_contactFetcher);
  sub_100008758((uint64_t)v48, a4 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_downtimeClient);
  type metadata accessor for BiomeUtilities();
  uint64_t v43 = a1;
  swift_retain();
  static BiomeUtilities.shared.getter();
  uint64_t v14 = enum case for StatusType.childState(_:);
  uint64_t v15 = *(void (**)(char *, void, uint64_t))(v11 + 104);
  v15(v13, enum case for StatusType.childState(_:), v10);
  uint64_t v16 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
  swift_release();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v39 = v11 + 8;
  v38(v13, v10);
  uint64_t v17 = v14;
  id v18 = [(id)BiomeLibrary() Family];
  swift_unknownObjectRelease();
  id v19 = [v18 ScreenTime];
  swift_unknownObjectRelease();
  id v20 = [v19 ChildState];
  swift_unknownObjectRelease();
  id v21 = [v20 DSLPublisher];

  id v41 = v16;
  id v22 = [v21 subscribeOn:v16];

  unsigned int v37 = v17;
  uint64_t v23 = v17;
  uint64_t v24 = v10;
  id v25 = v15;
  v15(v13, v23, v10);
  sub_1000070B0(&qword_100066DC8);
  swift_allocObject();
  id v26 = v22;
  swift_retain();
  *(void *)(a4 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_listener) = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
  swift_release();
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  uint64_t v44 = v9;
  os_log_type_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v46 = v35;
    id v36 = v26;
    *(_DWORD *)unint64_t v29 = 136315138;
    id v34 = v29 + 4;
    v25(v13, v37, v24);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v32 = v31;
    v38(v13, v24);
    uint64_t v45 = sub_10002A278(v30, v32, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s init complete", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }

  swift_release();
  sub_10000900C((uint64_t)v48);
  sub_10000900C((uint64_t)v47);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v42);
  return a4;
}

void *sub_100010764(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v43 = type metadata accessor for Logger();
  uint64_t v42 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for StatusType();
  uint64_t v16 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  id v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49[3] = type metadata accessor for ContactFetcher();
  v49[4] = &protocol witness table for ContactFetcher;
  v49[0] = a2;
  v48[3] = type metadata accessor for PeopleLocateFriendProvider();
  v48[4] = &protocol witness table for PeopleLocateFriendProvider;
  v48[0] = a4;
  v47[3] = type metadata accessor for SpotlightIndexer();
  v47[4] = &protocol witness table for SpotlightIndexer;
  v47[0] = a6;
  v46[3] = type metadata accessor for WidgetConfigurationReader();
  v46[4] = &off_100061C68;
  v46[0] = a5;
  a7[3] = 0;
  swift_unknownObjectWeakInit();
  a7[4] = 0;
  a7[5] = a1;
  sub_100008758((uint64_t)v49, (uint64_t)(a7 + 6));
  sub_100008758((uint64_t)v47, (uint64_t)(a7 + 11));
  sub_100008758((uint64_t)v48, (uint64_t)(a7 + 16));
  sub_100008758((uint64_t)v46, (uint64_t)(a7 + 21));
  uint64_t v41 = a1;
  uint64_t v38 = v16;
  uint64_t v40 = v15;
  if (a3)
  {
    type metadata accessor for BiomeUtilities();
    swift_retain();
    static BiomeUtilities.shared.getter();
    uint64_t v19 = enum case for StatusType.location(_:);
    id v20 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
    uint64_t v21 = v39;
    v20(v18, enum case for StatusType.location(_:), v39);
    id v22 = (void *)dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v21);
    id v23 = [self findMyLocationChangeStream];
    id v24 = [v23 publisher];

    id v25 = [v24 subscribeOn:v22];
    v20(v18, v19, v21);
    uint64_t v15 = v40;
    sub_1000070B0(&qword_100066DB8);
    swift_allocObject();
    swift_retain();
    uint64_t v26 = BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();

    a7[4] = v26;
    swift_release();
  }
  else
  {
    swift_retain();
    uint64_t v21 = v39;
  }
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  os_log_type_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v39 = v30;
    *(_DWORD *)unint64_t v29 = 136315138;
    uint64_t v45 = v30;
    unsigned int v37 = v29 + 4;
    uint64_t v31 = v21;
    uint64_t v32 = v38;
    (*(void (**)(char *, void, uint64_t))(v38 + 104))(v18, enum case for StatusType.location(_:), v21);
    sub_100012094(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v18, v31);
    uint64_t v44 = sub_10002A278(v33, v35, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s init complete", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    sub_10000900C((uint64_t)v47);
    sub_10000900C((uint64_t)v46);
    sub_10000900C((uint64_t)v48);
    sub_10000900C((uint64_t)v49);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v43);
  }
  else
  {
    swift_release_n();

    swift_release();
    sub_10000900C((uint64_t)v47);
    sub_10000900C((uint64_t)v46);
    sub_10000900C((uint64_t)v48);
    sub_10000900C((uint64_t)v49);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v43);
  }
  return a7;
}

void (*sub_100010D64(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100010E14(v6, a2, a3);
  return sub_100010DCC;
}

void sub_100010DCC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100010E14(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v3 = result;
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
    *(void *)unint64_t v3 = v4;
    return destroy for CalendarStatusSource.EventWithReason;
  }
  __break(1u);
  return result;
}

void destroy for CalendarStatusSource.EventWithReason(id *a1)
{
}

uint64_t sub_100010E9C(unint64_t a1, uint64_t a2, unint64_t a3)
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
        sub_100011FA0();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1000070B0(&qword_100066CA0);
          uint64_t v12 = sub_100010D64(v16, i, a3);
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
    sub_10001210C(0, &qword_100066C98);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_1000110B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v12 = *a6;
  uint64_t v13 = type metadata accessor for ContactFormatter();
  uint64_t v42 = v13;
  uint64_t v43 = &protocol witness table for ContactFormatter;
  id v14 = sub_100007180((uint64_t *)&v41);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v14, a4, v13);
  uint64_t v39 = sub_10001210C(0, &qword_100066DA0);
  uint64_t v40 = &protocol witness table for NSUserDefaults;
  *(void *)&long long v38 = a5;
  uint64_t v36 = type metadata accessor for ContactFetcher();
  unsigned int v37 = &protocol witness table for ContactFetcher;
  *(void *)&long long v35 = a1;
  uint64_t v33 = sub_10001210C(0, &qword_100066DA8);
  unint64_t v34 = &off_100063030;
  *(void *)&long long v32 = a2;
  uint64_t v15 = type metadata accessor for WidgetConfigurationReader();
  v31[3] = v15;
  v31[4] = &off_100061C68;
  v31[0] = a3;
  uint64_t v30 = &off_100063040;
  uint64_t v29 = v12;
  v28[0] = a6;
  type metadata accessor for WidgetSuggester();
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = sub_100012044((uint64_t)v31, v15);
  __chkstk_darwin(v17);
  uint64_t v19 = (void *)((char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = sub_100012044((uint64_t)v28, v29);
  __chkstk_darwin(v21);
  id v23 = (void *)((char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = *v19;
  uint64_t v26 = *v23;
  v16[15] = v15;
  v16[16] = &off_100061C68;
  v16[12] = v25;
  v16[30] = v12;
  v16[31] = &off_100063040;
  v16[27] = v26;
  sub_1000087BC(&v35, (uint64_t)(v16 + 2));
  sub_1000087BC(&v32, (uint64_t)(v16 + 7));
  sub_1000087BC(&v41, (uint64_t)(v16 + 17));
  sub_1000087BC(&v38, (uint64_t)(v16 + 22));
  sub_10000900C((uint64_t)v28);
  sub_10000900C((uint64_t)v31);
  return v16;
}

void *sub_1000113CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = type metadata accessor for WidgetConfigurationReader();
  os_log_type_t v28 = &off_100061C68;
  v26[0] = a3;
  uint64_t v24 = type metadata accessor for WidgetSuggester();
  uint64_t v25 = &off_100063050;
  v23[0] = a5;
  type metadata accessor for StatusManager();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = sub_100012044((uint64_t)v26, v27);
  __chkstk_darwin(v13);
  uint64_t v15 = (void *)((char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = sub_100012044((uint64_t)v23, v24);
  __chkstk_darwin(v17);
  uint64_t v19 = (void *)((char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = sub_1000115C8(a1, a2, *v15, a4, *v19, a6, v12);
  sub_10000900C((uint64_t)v23);
  sub_10000900C((uint64_t)v26);
  return v21;
}

void *sub_1000115C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v24[3] = type metadata accessor for PeopleTimelineControllerFactory();
  v24[4] = &protocol witness table for PeopleTimelineControllerFactory;
  v24[0] = a4;
  void v23[3] = type metadata accessor for WidgetConfigurationReader();
  v23[4] = &off_100061C68;
  v23[0] = a3;
  v22[3] = type metadata accessor for WidgetSuggester();
  v22[4] = &off_100063050;
  v22[0] = a5;
  a7[2] = a1;
  a7[3] = a2;
  sub_100008758((uint64_t)v23, (uint64_t)(a7 + 4));
  sub_100008758((uint64_t)v24, (uint64_t)(a7 + 9));
  sub_100008758((uint64_t)v22, (uint64_t)(a7 + 14));
  a7[19] = a6;
  uint64_t v14 = a7[3];
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = (uint64_t *)(v14 + 40);
    do
    {
      uint64_t v17 = *v16;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v19 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v17 + 24);
      swift_unknownObjectRetain();
      uint64_t v20 = swift_retain();
      v19(v20, &off_100061C80, ObjectType, v17);
      swift_unknownObjectRelease();
      v16 += 2;
      --v15;
    }
    while (v15);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_10000900C((uint64_t)v22);
  sub_10000900C((uint64_t)v24);
  sub_10000900C((uint64_t)v23);
  swift_bridgeObjectRelease();
  return a7;
}

uint64_t sub_10001173C(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v6) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v2 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v2 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v6) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v2 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v6) {
            return swift_release();
          }
          unint64_t v15 = *(void *)(v2 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_10000B740(v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v6) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v2 + 8 * v16);
  if (v15)
  {
    int64_t v8 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v2 + 8 * v8);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_1000118B8(void *a1)
{
  id v2 = [a1 intent];
  if (v2)
  {
    uint64_t v3 = v2;
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();

    if (v4)
    {
      id v5 = [a1 intent];
      if (v5)
      {
        id v6 = v5;
        self;
        uint64_t v7 = (void *)swift_dynamicCastObjCClass();
        if (v7)
        {
          id v8 = [v7 serializedParameters];
          uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          AnyHashable.init<A>(_:)();
          if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10000725C((uint64_t)v41), (v11 & 1) != 0))
          {
            sub_100011E70(*(void *)(v9 + 56) + 32 * v10, (uint64_t)&v42);
          }
          else
          {
            long long v42 = 0u;
            long long v43 = 0u;
          }
          swift_bridgeObjectRelease();
          sub_100008830((uint64_t)v41);
          if (!*((void *)&v43 + 1))
          {
LABEL_42:
            sub_10001223C((uint64_t)&v42, &qword_100067250);
            goto LABEL_43;
          }
          sub_1000070B0(&qword_100066C20);
          if (swift_dynamicCast())
          {
            AnyHashable.init<A>(_:)();
            if (MEMORY[0x6E6F73726580] && (unint64_t v12 = sub_10000725C((uint64_t)v41), (v13 & 1) != 0))
            {
              sub_100011E70(MEMORY[0x6E6F737265A8] + 32 * v12, (uint64_t)&v42);
            }
            else
            {
              long long v42 = 0u;
              long long v43 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_100008830((uint64_t)v41);
            if (*((void *)&v43 + 1))
            {
              if (swift_dynamicCast())
              {
                sub_1000070B0(&qword_100066C08);
                uint64_t v21 = (char *)swift_allocObject();
                *((_OWORD *)v21 + 1) = xmmword_100053F00;
                *((void *)v21 + 4) = 0x696669746E656469;
                *((void *)v21 + 5) = 0xEA00000000007265;
LABEL_48:

                return v21;
              }
              goto LABEL_43;
            }
            goto LABEL_42;
          }
LABEL_43:

          return (char *)&_swiftEmptyArrayStorage;
        }
      }
    }
  }
  id v14 = [a1 intent];
  id v6 = (id)INTypedIntentWithIntent();

  if (!v6) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  type metadata accessor for SelectPeopleIntent();
  if (!swift_dynamicCastClass()) {
    goto LABEL_43;
  }
  id v6 = v6;
  [a1 family];
  unint64_t v15 = SelectPeopleIntent.people(for:)();
  unint64_t v16 = v15;
  if (!(v15 >> 62))
  {
    uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (char *)swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_19;
    }
LABEL_46:

    swift_bridgeObjectRelease();
    uint64_t v21 = (char *)&_swiftEmptyArrayStorage;
LABEL_47:
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = (char *)swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_46;
  }
LABEL_19:
  uint64_t v39 = v6;
  if (v17 >= 1)
  {
    uint64_t v19 = 0;
    unint64_t v20 = v16 & 0xC000000000000001;
    uint64_t v21 = (char *)&_swiftEmptyArrayStorage;
    unint64_t v40 = v16;
    while (1)
    {
      id v22 = v20 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v16 + 8 * v19 + 32);
      id v23 = v22;
      id v24 = [v22 id];
      if (v24) {
        break;
      }
      id v32 = [v23 identifier];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v36 = v35;

        v41[0] = v34;
        v41[1] = v36;
        sub_100011E1C();
        uint64_t v37 = StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
        swift_bridgeObjectRelease();
        if (*(void *)(v37 + 16))
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRelease();
          uint64_t v26 = static String._fromSubstring(_:)();
          uint64_t v28 = v38;

          unint64_t v16 = v40;
          swift_bridgeObjectRelease_n();
          goto LABEL_28;
        }

        swift_bridgeObjectRelease();
      }
      else
      {
      }
LABEL_22:
      if (v17 == ++v19)
      {
        id v6 = v39;

        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
    }
    uint64_t v25 = v24;
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v28 = v27;

LABEL_28:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v21 = sub_10001CD98(0, *((void *)v21 + 2) + 1, 1, v21);
    }
    unint64_t v30 = *((void *)v21 + 2);
    unint64_t v29 = *((void *)v21 + 3);
    if (v30 >= v29 >> 1) {
      uint64_t v21 = sub_10001CD98((char *)(v29 > 1), v30 + 1, 1, v21);
    }
    *((void *)v21 + 2) = v30 + 1;
    uint64_t v31 = &v21[16 * v30];
    *((void *)v31 + 4) = v26;
    *((void *)v31 + 5) = v28;
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

unint64_t sub_100011E1C()
{
  unint64_t result = qword_100066C10;
  if (!qword_100066C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066C10);
  }
  return result;
}

uint64_t sub_100011E70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100011ECC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011F04(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_100011F44(unint64_t a1, uint64_t a2)
{
  return sub_10000D33C(a1, a2, *(void (**)(void *, void))(v2 + 16), *(void ***)(v2 + 24));
}

unint64_t sub_100011F4C()
{
  unint64_t result = qword_100066C28;
  if (!qword_100066C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066C28);
  }
  return result;
}

unint64_t sub_100011FA0()
{
  unint64_t result = qword_100066CA8;
  if (!qword_100066CA8)
  {
    sub_100011FFC(&qword_100066CA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066CA8);
  }
  return result;
}

uint64_t sub_100011FFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100012044(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100012094(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000120DC(void *a1)
{
  return sub_100043A60(a1, v1);
}

uint64_t sub_1000120E4(void *a1)
{
  return sub_10001244C(a1);
}

uint64_t sub_1000120EC(void *a1)
{
  return sub_100037114(a1);
}

uint64_t sub_1000120F4(void *a1)
{
  return sub_10004A6B0(a1);
}

uint64_t sub_1000120FC(void *a1)
{
  return sub_10002DB18(a1);
}

uint64_t sub_100012104(void *a1)
{
  return sub_100017FF8(a1, v1);
}

uint64_t sub_10001210C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100012148(void *a1)
{
  return sub_100004A90(a1);
}

uint64_t sub_100012150()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012190()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[2] = v2;
  v4[3] = v3;
  v4[1] = sub_100008F18;
  return _swift_task_switch(sub_10000BD20, 0, 0);
}

uint64_t sub_10001223C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000070B0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for WidgetConfigurationReader.NoWidgetHostsReturned()
{
  return &type metadata for WidgetConfigurationReader.NoWidgetHostsReturned;
}

uint64_t sub_1000122AC(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v4 = a1;
  char v5 = a2 & 1;
  return a3(&v4);
}

id sub_1000122EC(uint64_t a1)
{
  return [*v1 isDowntimeEnabledForUserID:a1];
}

uint64_t sub_100012314()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_listener))
  {
    _print_unlocked<A, B>(_:_:)();
    uint64_t v2 = 0;
    uint64_t v1 = (void *)0xE000000000000000;
  }
  else
  {
    uint64_t v1 = (void *)0xE300000000000000;
    uint64_t v2 = 4271950;
  }
  _StringGuts.grow(_:)(51);
  v3._object = (void *)0x8000000100056750;
  v3._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 0x6E657473696C0A2CLL;
  v4._object = (void *)0xEC000000203A7265;
  String.append(_:)(v4);
  v5._countAndFlagsBits = v2;
  v5._object = v1;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 10506;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  return 0;
}

uint64_t sub_10001244C(void *a1)
{
  return sub_100012470(a1);
}

uint64_t sub_100012470(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  id v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v19 = v4;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v5;
    unint64_t v12 = (uint8_t *)v11;
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 138412290;
    unint64_t v20 = v8;
    char v13 = v8;
    uint64_t v4 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v17 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Got BMScreenTimeChildState: %@", v12, 0xCu);
    sub_1000070B0(&qword_100066A58);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v18;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v2;
  *(void *)(v14 + 24) = v8;
  sub_1000070B0(&qword_100066A40);
  swift_allocObject();
  unint64_t v15 = v8;
  swift_retain();
  return Promise.init(startBlock:)();
}

uint64_t sub_1000126D4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  sub_1000070F4((void *)(a3 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_contactFetcher), *(void *)(a3 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_contactFetcher + 24));
  uint64_t v9 = (void *)swift_allocObject();
  _DWORD v9[2] = a3;
  v9[3] = sub_100016C6C;
  v9[4] = v8;
  v9[5] = a4;
  swift_retain();
  swift_retain();
  id v10 = a4;
  dispatch thunk of FamilyMemberContactFetching.familyWithDSIDs(completion:)();
  return swift_release();
}

uint64_t sub_1000127D0(uint64_t a1, char a2, uint64_t a3, void (*a4)(void, void), uint64_t a5, void *a6)
{
  uint64_t v12 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v12 - 8);
  v96 = (uint8_t *)v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for StatusType();
  uint64_t v101 = *(void *)(v14 - 8);
  uint64_t v102 = v14;
  __chkstk_darwin(v14);
  v100 = (char *)v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v19 = __chkstk_darwin(v18);
  v97 = (char *)v90 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  id v24 = (char *)v90 - v23;
  uint64_t v103 = v21;
  if (a2)
  {
    swift_errorRetain();
    static PeopleLogger.daemon.getter();
    sub_100015E30(a1, 1);
    swift_retain();
    sub_100015E30(a1, 1);
    swift_retain();
    unint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      v97 = (char *)swift_slowAlloc();
      v105[0] = (uint64_t)v97;
      *(_DWORD *)uint64_t v43 = 136315394;
      uint64_t v92 = v43 + 4;
      v99 = a4;
      uint64_t v45 = v101;
      uint64_t v44 = v102;
      uint64_t v46 = *(void (**)(char *, void, uint64_t))(v101 + 104);
      LODWORD(v96) = v42;
      uint64_t v47 = v100;
      v46(v100, enum case for StatusType.childState(_:), v102);
      sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter();
      os_log_t v93 = v40;
      uint64_t v49 = v48;
      uint64_t v98 = v17;
      unint64_t v51 = v50;
      (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v44);
      uint64_t v104 = sub_10002A278(v49, v51, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v52 = Error.localizedDescription.getter();
      uint64_t v104 = sub_10002A278(v52, v53, v105);
      a4 = v99;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
      os_log_t v54 = v93;
      _os_log_impl((void *)&_mh_execute_header, v93, (os_log_type_t)v96, "%s family lookup error: %s", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v98 + 8))(v24, v103);
    }
    else
    {
      swift_release_n();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);

      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, v103);
    }
    swift_errorRetain();
    a4(a1, 1);
    sub_100015E24(a1, 1);
    return sub_100015E24(a1, 1);
  }
  else
  {
    os_log_t v93 = v22;
    sub_100014E1C(a6, a1);
    unint64_t v26 = v25;
    if (v25 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v27 = result;
    }
    else
    {
      uint64_t v27 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
    }
    uint64_t v98 = v17;
    v99 = a4;
    uint64_t v94 = a5;
    uint64_t v95 = a3;
    if (v27)
    {
      if (v27 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v29 = 0;
      unint64_t v30 = (char *)_swiftEmptyArrayStorage;
      do
      {
        if ((v26 & 0xC000000000000001) != 0) {
          id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v31 = *(id *)(v26 + 8 * v29 + 32);
        }
        id v32 = v31;
        id v33 = [v31 identifier];
        uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v36 = v35;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v30 = sub_10001CD98(0, *((void *)v30 + 2) + 1, 1, v30);
        }
        unint64_t v38 = *((void *)v30 + 2);
        unint64_t v37 = *((void *)v30 + 3);
        if (v38 >= v37 >> 1) {
          unint64_t v30 = sub_10001CD98((char *)(v37 > 1), v38 + 1, 1, v30);
        }
        ++v29;
        *((void *)v30 + 2) = v38 + 1;
        uint64_t v39 = &v30[16 * v38];
        *((void *)v39 + 4) = v34;
        *((void *)v39 + 5) = v36;
      }
      while (v27 != v29);
    }
    else
    {
      unint64_t v30 = (char *)_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease_n();
    uint64_t v55 = *((void *)v30 + 2);
    if (v55)
    {
      uint64_t v56 = v95;
      Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
      unint64_t v58 = (uint64_t (*)(void, void))v99;
      uint64_t v59 = v103;
      if (Strong)
      {
        sub_10001FD78(v56, (uint64_t)v30, Strong);
        swift_unknownObjectRelease();
      }
      uint64_t v60 = v97;
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      uint64_t v61 = Logger.logObject.getter();
      os_log_type_t v62 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        os_log_t v93 = (os_log_t)swift_slowAlloc();
        v105[0] = (uint64_t)v93;
        v91 = v63;
        uint64_t v92 = v55;
        *(_DWORD *)uint64_t v63 = 136315138;
        v90[1] = v63 + 4;
        uint64_t v64 = v100;
        uint64_t v65 = v101;
        uint64_t v66 = v58;
        uint64_t v67 = v102;
        (*(void (**)(char *, void, uint64_t))(v101 + 104))(v100, enum case for StatusType.childState(_:), v102);
        sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v68 = dispatch thunk of CustomStringConvertible.description.getter();
        unint64_t v70 = v69;
        uint64_t v71 = v67;
        unint64_t v58 = v66;
        (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v71);
        uint64_t v104 = sub_10002A278(v68, v70, v105);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s event consume complete", v91, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v98 + 8))(v97, v103);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v98 + 8))(v60, v59);
      }
      v84 = v96;
      uint64_t v85 = type metadata accessor for TaskPriority();
      (*(void (**)(uint8_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v85 - 8) + 56))(v84, 1, 1, v85);
      uint64_t v86 = swift_allocObject();
      *(void *)(v86 + 16) = 0;
      *(void *)(v86 + 24) = 0;
      sub_100016DD8((uint64_t)v84, (uint64_t)&unk_100066FC0, v86);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      os_log_t v72 = v93;
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      v73 = Logger.logObject.getter();
      os_log_type_t v74 = static os_log_type_t.debug.getter();
      BOOL v75 = os_log_type_enabled(v73, v74);
      unint64_t v58 = (uint64_t (*)(void, void))v99;
      if (v75)
      {
        v76 = (uint8_t *)swift_slowAlloc();
        v97 = (char *)swift_slowAlloc();
        v105[0] = (uint64_t)v97;
        v96 = v76;
        *(_DWORD *)v76 = 136315138;
        v91 = v76 + 4;
        uint64_t v92 = 0;
        uint64_t v77 = v100;
        uint64_t v78 = v101;
        uint64_t v79 = v102;
        (*(void (**)(char *, void, uint64_t))(v101 + 104))(v100, enum case for StatusType.childState(_:), v102);
        sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v80 = dispatch thunk of CustomStringConvertible.description.getter();
        unint64_t v82 = v81;
        uint64_t v83 = v79;
        unint64_t v58 = (uint64_t (*)(void, void))v99;
        (*(void (**)(char *, uint64_t))(v78 + 8))(v77, v83);
        uint64_t v104 = sub_10002A278(v80, v82, v105);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v73, v74, "%s event consume complete w/o local contact", v96, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      (*(void (**)(os_log_t, uint64_t))(v98 + 8))(v72, v103);
      swift_bridgeObjectRelease();
    }
    type metadata accessor for PeopleAnalytics();
    v88 = v100;
    uint64_t v87 = v101;
    uint64_t v89 = v102;
    (*(void (**)(char *, void, uint64_t))(v101 + 104))(v100, enum case for StatusType.childState(_:), v102);
    static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v89);
    return v58(0, 0);
  }
}

uint64_t sub_10001335C()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_100013418, 0, 0);
}

uint64_t sub_100013418()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.childState(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_1000134D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  sub_1000070F4((void *)(a3 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_contactFetcher), *(void *)(a3 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_contactFetcher + 24));
  uint64_t v9 = (void *)swift_allocObject();
  _DWORD v9[2] = a3;
  v9[3] = sub_100011F04;
  v9[4] = v8;
  v9[5] = a4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  dispatch thunk of FamilyMemberContactFetching.familyWithDSIDs(completion:)();
  return swift_release();
}

uint64_t sub_1000135D0(uint64_t a1, char a2, uint64_t a3, void (*a4)(void *, uint64_t), uint64_t a5, uint64_t a6)
{
  uint64_t v11 = type metadata accessor for StatusType();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v39 = v17;
    uint64_t v40 = v16;
    swift_errorRetain();
    static PeopleLogger.daemon.getter();
    sub_100015E30(a1, 1);
    swift_retain();
    sub_100015E30(a1, 1);
    swift_retain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    int v25 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v38 = a5;
      uint64_t v27 = v26;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v42 = v37;
      *(_DWORD *)uint64_t v27 = 136315394;
      v34[1] = v27 + 4;
      (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for StatusType.childState(_:), v11);
      sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      os_log_t v36 = v23;
      uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
      int v35 = v25;
      uint64_t v29 = a4;
      unint64_t v31 = v30;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      uint64_t v41 = sub_10002A278(v28, v31, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      a4 = v29;
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v32 = Error.localizedDescription.getter();
      uint64_t v41 = sub_10002A278(v32, v33, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
      uint64_t v23 = v36;
      _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v35, "%s family lookup error: %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v39 + 8))(v19, v40);
    swift_errorRetain();
    a4((void *)a1, 1);
    sub_100015E24(a1, 1);
    return sub_100015E24(a1, 1);
  }
  else
  {
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = sub_100015D38(v20);
    sub_100015E24(a1, 0);
    sub_100013A4C(a6, (unint64_t)v21, a4, a5);
    return swift_release();
  }
}

void sub_100013A4C(uint64_t a1, unint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  uint64_t v148 = a4;
  v149 = a3;
  uint64_t v151 = a1;
  uint64_t v6 = (void *)type metadata accessor for StatusType();
  unint64_t v7 = *(v6 - 1);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = type metadata accessor for ChildStateType();
  uint64_t v10 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  v146 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = type metadata accessor for ChildStatePersonStatus();
  uint64_t v12 = *(void *)(v160 - 8);
  uint64_t v13 = __chkstk_darwin(v160);
  v159 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v163 = (char *)&v135 - v15;
  uint64_t v170 = type metadata accessor for Logger();
  uint64_t v16 = *(void *)(v170 - 8);
  uint64_t v17 = __chkstk_darwin(v170);
  v167 = (char *)&v135 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  v162 = (char *)&v135 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v161 = (char *)&v135 - v22;
  __chkstk_darwin(v21);
  v166 = (char *)&v135 - v23;
  uint64_t v156 = type metadata accessor for Date();
  uint64_t v150 = *(void *)(v156 - 8);
  uint64_t v24 = __chkstk_darwin(v156);
  v145 = (char *)&v135 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v135 - v26;
  if (a2 >> 62)
  {
LABEL_69:
    v128 = v27;
    swift_bridgeObjectRetain();
    uint64_t v129 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v27 = v128;
    uint64_t v174 = v129;
    if (v129) {
      goto LABEL_3;
    }
LABEL_70:
    *(void *)&long long v175 = 0;
    *((void *)&v175 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(20);
    (*(void (**)(uint64_t, void, void *))(v7 + 104))(v9, enum case for StatusType.childState(_:), v6);
    sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v130 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v132 = v131;
    swift_bridgeObjectRelease();
    *(void *)&long long v175 = v130;
    *((void *)&v175 + 1) = v132;
    (*(void (**)(uint64_t, void *))(v7 + 8))(v9, v6);
    v133._object = (void *)0x8000000100056730;
    v133._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v133);
    v134 = (void *)static PeopleErrors.createError(_:code:)();
    swift_bridgeObjectRelease();
    v149(v134, 1);

    return;
  }
  uint64_t v174 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v174) {
    goto LABEL_70;
  }
LABEL_3:
  v152 = v27;
  Date.init()();
  uint64_t v172 = *(void *)(v151 + 16);
  if (!v172)
  {
    v127 = 0;
    v126 = &_swiftEmptyDictionarySingleton;
    goto LABEL_67;
  }
  v155 = (void *)(v4 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_downtimeClient);
  uint64_t v171 = v151 + 32;
  unint64_t v7 = a2 & 0xC000000000000001;
  v168 = (void (**)(char *, uint64_t))(v16 + 8);
  unsigned int v140 = enum case for ChildStateType.onDemandDowntime(_:);
  v139 = (void (**)(char *, void, uint64_t))(v10 + 104);
  v138 = (void (**)(char *, char *, uint64_t))(v150 + 16);
  v153 = (void (**)(char *, char *, uint64_t))(v12 + 16);
  v137 = (void (**)(char *, uint64_t))(v12 + 8);
  swift_bridgeObjectRetain();
  v157 = 0;
  uint64_t v28 = 0;
  v158 = &_swiftEmptyDictionarySingleton;
  *(void *)&long long v29 = 138412290;
  long long v141 = v29;
  *(void *)&long long v29 = 138412546;
  long long v154 = v29;
  uint64_t v16 = v174;
  v164 = (char *)&v175 + 8;
  while (2)
  {
    unint64_t v30 = (uint64_t *)(v171 + 16 * v28);
    uint64_t v31 = *v30;
    uint64_t v12 = v30[1];
    uint64_t v173 = v28 + 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = 4;
    while (1)
    {
      uint64_t v4 = v10 - 4;
      if (v7) {
        uint64_t v32 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        uint64_t v32 = *(id *)(a2 + 8 * v10);
      }
      uint64_t v6 = v32;
      uint64_t v33 = v10 - 3;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
        goto LABEL_69;
      }
      id v34 = [v32 contact];
      if (!v34) {
        goto LABEL_8;
      }
      int v35 = v34;
      id v36 = [v34 identifier];

      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v38 = v37;

      if (v31 == v9 && v12 == v38) {
        break;
      }
      uint64_t v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t v16 = v174;
      if (v9) {
        goto LABEL_21;
      }
LABEL_8:

      ++v10;
      if (v33 == v16)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v40 = [v6 dsid];
    if (!v40)
    {
      swift_bridgeObjectRelease();
      static PeopleLogger.daemon.getter();
      uint64_t v61 = v6;
      os_log_type_t v62 = Logger.logObject.getter();
      os_log_type_t v63 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = (uint8_t *)swift_slowAlloc();
        uint64_t v65 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v64 = v141;
        uint64_t v9 = (uint64_t)(v64 + 4);
        id v66 = [v61 firstName];
        if (v66)
        {
          uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v169 = v68;

          sub_100016B88();
          swift_allocError();
          unint64_t v69 = v169;
          uint64_t *v70 = v67;
          v70[1] = (uint64_t)v69;
          id v66 = (id)_swift_stdlib_bridgeErrorToNSError();
          *(void *)&long long v175 = v66;
        }
        else
        {
          *(void *)&long long v175 = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v65 = v66;

        _os_log_impl((void *)&_mh_execute_header, v62, v63, "ODD %@ impossible no dsid", v64, 0xCu);
        sub_1000070B0(&qword_100066A58);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        os_log_type_t v62 = v61;
      }

      (*v168)(v167, v170);
      goto LABEL_64;
    }
    uint64_t v41 = v40;
    id v42 = [objc_allocWithZone((Class)STUserID) initWithDSID:v40];
    id v43 = [v42 dsid];
    id v44 = [v43 integerValue];

    if (v44 != [v41 integerValue])
    {
      swift_bridgeObjectRelease();
      static PeopleLogger.daemon.getter();
      uint64_t v71 = v6;
      id v72 = v42;
      v73 = v71;
      id v74 = v72;
      BOOL v75 = Logger.logObject.getter();
      int v76 = static os_log_type_t.error.getter();
      v169 = v75;
      if (os_log_type_enabled(v75, (os_log_type_t)v76))
      {
        v165 = v41;
        uint64_t v77 = swift_slowAlloc();
        os_log_t v143 = (os_log_t)swift_slowAlloc();
        *(_DWORD *)uint64_t v77 = v154;
        id v78 = [v73 firstName];
        LODWORD(v144) = v76;
        v142 = v73;
        if (v78)
        {
          uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v81 = v80;

          sub_100016B88();
          swift_allocError();
          *unint64_t v82 = v79;
          v82[1] = v81;
          id v78 = (id)_swift_stdlib_bridgeErrorToNSError();
          *(void *)&long long v175 = v78;
        }
        else
        {
          *(void *)&long long v175 = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        os_log_t v97 = v143;
        v143->Class isa = (Class)v78;
        uint64_t v98 = v142;

        *(_WORD *)(v77 + 12) = 2112;
        *(void *)&long long v175 = v74;
        uint64_t v9 = (uint64_t)v74;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v97[1].Class isa = (Class)v74;

        _os_log_impl((void *)&_mh_execute_header, v169, (os_log_type_t)v144, "ODD %@ bad st user id %@", (uint8_t *)v77, 0x16u);
        sub_1000070B0(&qword_100066A58);
        swift_arrayDestroy();
        v73 = v98;
        swift_slowDealloc();
        swift_slowDealloc();
        uint64_t v95 = v165;
      }
      else
      {

        uint64_t v95 = v73;
        uint64_t v9 = (uint64_t)v73;
        v169 = v41;
      }

      (*v168)(v166, v170);
      goto LABEL_64;
    }
    uint64_t v45 = v155[3];
    uint64_t v46 = v155[4];
    sub_1000070F4(v155, v45);
    if (((*(uint64_t (**)(id, uint64_t, uint64_t))(v46 + 8))(v42, v45, v46) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      static PeopleLogger.daemon.getter();
      uint64_t v83 = v6;
      id v84 = v42;
      uint64_t v85 = v83;
      id v86 = v84;
      uint64_t v87 = Logger.logObject.getter();
      int v88 = static os_log_type_t.debug.getter();
      v169 = v87;
      if (os_log_type_enabled(v87, (os_log_type_t)v88))
      {
        v165 = v41;
        uint64_t v89 = swift_slowAlloc();
        os_log_t v143 = (os_log_t)swift_slowAlloc();
        *(_DWORD *)uint64_t v89 = v154;
        id v90 = [v85 firstName];
        LODWORD(v144) = v88;
        v142 = v85;
        if (v90)
        {
          uint64_t v91 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v93 = v92;

          sub_100016B88();
          swift_allocError();
          *uint64_t v94 = v91;
          v94[1] = v93;
          id v90 = (id)_swift_stdlib_bridgeErrorToNSError();
          *(void *)&long long v175 = v90;
        }
        else
        {
          *(void *)&long long v175 = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        os_log_t v124 = v143;
        v143->Class isa = (Class)v90;
        v125 = v142;

        *(_WORD *)(v89 + 12) = 2112;
        *(void *)&long long v175 = v86;
        uint64_t v9 = (uint64_t)v86;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v124[1].Class isa = (Class)v86;

        _os_log_impl((void *)&_mh_execute_header, v169, (os_log_type_t)v144, "ODD %@ has downtime off %@", (uint8_t *)v89, 0x16u);
        sub_1000070B0(&qword_100066A58);
        swift_arrayDestroy();
        uint64_t v85 = v125;
        swift_slowDealloc();
        swift_slowDealloc();
        v96 = v165;
      }
      else
      {

        v96 = v85;
        uint64_t v9 = (uint64_t)v85;
        v169 = v41;
      }

      (*v168)(v162, v170);
LABEL_64:
      uint64_t v16 = v174;
      goto LABEL_6;
    }
    (*v139)(v146, v140, v147);
    (*v138)(v145, v152, v156);
    type metadata accessor for PeopleFeatureFlags();
    static PeopleFeatureFlags.shared.getter();
    ChildStatePersonStatus.init(childStateType:date:featureFlags:)();
    static PeopleLogger.daemon.getter();
    uint64_t v47 = v6;
    id v48 = v42;
    os_log_t v49 = v47;
    id v50 = v48;
    unint64_t v51 = Logger.logObject.getter();
    int v52 = static os_log_type_t.debug.getter();
    BOOL v53 = os_log_type_enabled(v51, (os_log_type_t)v52);
    v165 = v41;
    id v144 = v50;
    v169 = v49;
    if (v53)
    {
      LODWORD(v142) = v52;
      os_log_t v54 = (_DWORD *)swift_slowAlloc();
      v136 = (void *)swift_slowAlloc();
      *os_log_t v54 = v154;
      id v55 = [v49 firstName];
      os_log_t v143 = v51;
      if (v55)
      {
        uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v58 = v57;

        sub_100016B88();
        swift_allocError();
        *uint64_t v59 = v56;
        v59[1] = v58;
        id v55 = (id)_swift_stdlib_bridgeErrorToNSError();
        uint64_t v60 = v54;
        *(void *)&long long v175 = v55;
      }
      else
      {
        uint64_t v60 = v54;
        *(void *)&long long v175 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v99 = v136;
      void *v136 = v55;
      v100 = v169;

      *((_WORD *)v60 + 6) = 2112;
      *(void *)&long long v175 = v50;
      id v101 = v50;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v99[1] = v50;

      os_log_t v49 = v143;
      _os_log_impl((void *)&_mh_execute_header, v143, (os_log_type_t)v142, "ODD %@ has downtime on %@", (uint8_t *)v60, 0x16u);
      sub_1000070B0(&qword_100066A58);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*v168)(v161, v170);
    uint64_t v102 = *v153;
    (*v153)(v159, v163, v160);
    sub_100016B78((uint64_t)v157);
    uint64_t v103 = v158;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v175 = v103;
    unint64_t v106 = sub_1000071E4(v31, v12);
    uint64_t v107 = v103[2];
    BOOL v108 = (v105 & 1) == 0;
    uint64_t v109 = v107 + v108;
    if (__OFADD__(v107, v108)) {
      __break(1u);
    }
    char v110 = v105;
    if (v103[3] >= v109)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_1000083A4();
      }
    }
    else
    {
      sub_100007838(v109, isUniquelyReferenced_nonNull_native);
      unint64_t v111 = sub_1000071E4(v31, v12);
      if ((v110 & 1) != (v112 & 1))
      {
        KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
        return;
      }
      unint64_t v106 = v111;
    }
    v113 = (void *)v175;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((v110 & 1) == 0)
    {
      sub_100008194(v106, v31, v12, _swiftEmptyArrayStorage, v113);
      swift_bridgeObjectRetain();
    }
    uint64_t v114 = v113[7];
    v158 = v113;
    swift_bridgeObjectRelease();
    v115 = *(void **)(v114 + 8 * v106);
    char v116 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v114 + 8 * v106) = v115;
    if ((v116 & 1) == 0)
    {
      v115 = sub_10001CEA8(0, v115[2] + 1, 1, v115);
      *(void *)(v114 + 8 * v106) = v115;
    }
    unint64_t v118 = v115[2];
    unint64_t v117 = v115[3];
    if (v118 >= v117 >> 1) {
      *(void *)(v114 + 8 * v106) = sub_10001CEA8((void *)(v117 > 1), v118 + 1, 1, v115);
    }
    uint64_t v119 = v160;
    uint64_t v176 = v160;
    uint64_t v177 = sub_100016BDC(&qword_100066FB0, (void (*)(uint64_t))&type metadata accessor for ChildStatePersonStatus);
    v120 = sub_100007180((uint64_t *)&v175);
    v121 = v159;
    v102((char *)v120, v159, v119);
    uint64_t v122 = *(void *)(v114 + 8 * v106);
    *(void *)(v122 + 16) = v118 + 1;
    sub_1000087BC(&v175, v122 + 40 * v118 + 32);
    uint64_t v9 = (uint64_t)v137;
    v123 = *v137;
    (*v137)(v121, v119);
    swift_bridgeObjectRelease();

    v123(v163, v119);
    v157 = sub_100014E0C;
    uint64_t v16 = v174;
LABEL_6:
    uint64_t v28 = v173;
    if (v173 != v172) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  v126 = v158;
  v127 = v157;
LABEL_67:
  v149(v126, 0);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v150 + 8))(v152, v156);
  sub_100016B78((uint64_t)v127);
}

void sub_100014E0C(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

void sub_100014E1C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v67 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v62 - v12;
  id v14 = [a1 userDSID];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;

    uint64_t v19 = HIBYTE(v18) & 0xF;
    uint64_t v20 = v16 & 0xFFFFFFFFFFFFLL;
    if ((v18 & 0x2000000000000000) != 0) {
      uint64_t v21 = HIBYTE(v18) & 0xF;
    }
    else {
      uint64_t v21 = v16 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v65 = v7;
    if (!v21)
    {
      swift_bridgeObjectRelease();
      goto LABEL_60;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      uint64_t v23 = (uint64_t)sub_100015F24(v16, v18, 10);
      char v51 = v50;
      swift_bridgeObjectRelease();
      if ((v51 & 1) == 0) {
        goto LABEL_49;
      }
      goto LABEL_60;
    }
    if ((v18 & 0x2000000000000000) == 0)
    {
      if ((v16 & 0x1000000000000000) != 0) {
        uint64_t v22 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v22 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v23 = (uint64_t)sub_10001600C(v22, v20, 10);
      char v25 = v24 & 1;
LABEL_48:
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
LABEL_49:
        if (*(void *)(a2 + 16))
        {
          unint64_t v43 = sub_1000072A0(v23);
          if (v44)
          {
            id v45 = *(id *)(*(void *)(a2 + 56) + 8 * v43);
            id v46 = [v45 contactsIncludingImage:0];
            sub_10001210C(0, &qword_100066F98);
            static Array._unconditionallyBridgeFromObjectiveC(_:)();

            return;
          }
        }
      }
LABEL_60:
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      int v52 = Logger.logObject.getter();
      os_log_type_t v53 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = swift_slowAlloc();
        uint64_t v64 = (uint64_t)v13;
        id v55 = (uint8_t *)v54;
        v68[0] = swift_slowAlloc();
        *(_DWORD *)id v55 = 136315138;
        uint64_t v66 = v8;
        os_log_type_t v63 = v55 + 4;
        uint64_t v56 = v65;
        (*(void (**)(char *, void, uint64_t))(v5 + 104))(v65, enum case for StatusType.childState(_:), v4);
        sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v57 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v58 = v4;
        uint64_t v59 = v67;
        unint64_t v61 = v60;
        (*(void (**)(char *, uint64_t))(v5 + 8))(v56, v58);
        uint64_t v69 = sub_10002A278(v57, v61, v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "%s no family member found", v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v64, v66);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v67 + 8))(v13, v8);
      }
      return;
    }
    v68[0] = v16;
    v68[1] = v18 & 0xFFFFFFFFFFFFFFLL;
    if (v16 == 43)
    {
      if (!v19) {
        goto LABEL_65;
      }
      if (v19 == 1 || (BYTE1(v16) - 48) > 9u) {
        goto LABEL_35;
      }
      uint64_t v23 = (BYTE1(v16) - 48);
      if (v19 != 2)
      {
        if ((BYTE2(v16) - 48) > 9u) {
          goto LABEL_35;
        }
        uint64_t v23 = 10 * (BYTE1(v16) - 48) + (BYTE2(v16) - 48);
        uint64_t v34 = v19 - 3;
        if (v34)
        {
          int v35 = (unsigned __int8 *)v68 + 3;
          while (1)
          {
            unsigned int v36 = *v35 - 48;
            if (v36 > 9) {
              goto LABEL_35;
            }
            uint64_t v37 = 10 * v23;
            if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
              goto LABEL_35;
            }
            uint64_t v23 = v37 + v36;
            if (__OFADD__(v37, v36)) {
              goto LABEL_35;
            }
            char v25 = 0;
            ++v35;
            if (!--v34) {
              goto LABEL_48;
            }
          }
        }
      }
    }
    else
    {
      if (v16 == 45)
      {
        if (v19)
        {
          if (v19 != 1 && (BYTE1(v16) - 48) <= 9u)
          {
            if (v19 == 2)
            {
              char v25 = 0;
              uint64_t v23 = -(uint64_t)(BYTE1(v16) - 48);
              goto LABEL_48;
            }
            if ((BYTE2(v16) - 48) <= 9u)
            {
              uint64_t v23 = -10 * (BYTE1(v16) - 48) - (BYTE2(v16) - 48);
              uint64_t v42 = v19 - 3;
              if (!v42) {
                goto LABEL_47;
              }
              uint64_t v47 = (unsigned __int8 *)v68 + 3;
              while (1)
              {
                unsigned int v48 = *v47 - 48;
                if (v48 > 9) {
                  break;
                }
                uint64_t v49 = 10 * v23;
                if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
                  break;
                }
                uint64_t v23 = v49 - v48;
                if (__OFSUB__(v49, v48)) {
                  break;
                }
                char v25 = 0;
                ++v47;
                if (!--v42) {
                  goto LABEL_48;
                }
              }
            }
          }
LABEL_35:
          uint64_t v23 = 0;
          char v25 = 1;
          goto LABEL_48;
        }
        __break(1u);
LABEL_65:
        __break(1u);
        return;
      }
      if (!v19 || (v16 - 48) > 9u) {
        goto LABEL_35;
      }
      uint64_t v23 = (v16 - 48);
      if (v19 != 1)
      {
        if ((BYTE1(v16) - 48) > 9u) {
          goto LABEL_35;
        }
        uint64_t v23 = 10 * (v16 - 48) + (BYTE1(v16) - 48);
        uint64_t v38 = v19 - 2;
        if (v38)
        {
          uint64_t v39 = (unsigned __int8 *)v68 + 2;
          while (1)
          {
            unsigned int v40 = *v39 - 48;
            if (v40 > 9) {
              goto LABEL_35;
            }
            uint64_t v41 = 10 * v23;
            if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
              goto LABEL_35;
            }
            uint64_t v23 = v41 + v40;
            if (__OFADD__(v41, v40)) {
              goto LABEL_35;
            }
            char v25 = 0;
            ++v39;
            if (!--v38) {
              goto LABEL_48;
            }
          }
        }
      }
    }
LABEL_47:
    char v25 = 0;
    goto LABEL_48;
  }
  uint64_t v26 = v4;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    long long v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    v68[0] = v64;
    *(_DWORD *)long long v29 = 136315138;
    uint64_t v66 = v8;
    v62[1] = v29 + 4;
    os_log_type_t v63 = v29;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for StatusType.childState(_:), v4);
    sub_100016BDC(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v31 = v67;
    unint64_t v33 = v32;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v26);
    uint64_t v69 = sub_10002A278(v30, v33, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s invalid dsid", v63, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v66);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v11, v8);
  }
}

uint64_t sub_1000156B4()
{
  sub_10000905C(v0 + 16);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_ttl;
  uint64_t v2 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_contactFetcher);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled22ChildStateStatusSource_downtimeClient);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_100015798()
{
  return type metadata accessor for ChildStateStatusSource();
}

uint64_t type metadata accessor for ChildStateStatusSource()
{
  uint64_t result = qword_100066E60;
  if (!qword_100066E60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000157EC()
{
  sub_1000158A8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000158A8()
{
  if (!qword_100067640)
  {
    sub_10001210C(255, (unint64_t *)&qword_100066E70);
    unint64_t v0 = type metadata accessor for Measurement();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100067640);
    }
  }
}

uint64_t sub_100015910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.childState(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_100015984(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_1000159C8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return StatusSource.debugID.getter(a1, WitnessTable);
}

uint64_t sub_100015A1C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  sub_1000070B0(&qword_1000669E8);
  swift_allocObject();
  swift_retain();
  swift_bridgeObjectRetain();
  return Promise.init(startBlock:)();
}

uint64_t sub_100015AB0()
{
  return sub_100012314();
}

uint64_t sub_100015AD4(uint64_t a1)
{
  uint64_t result = sub_100016BDC(&qword_100066F80, (void (*)(uint64_t))type metadata accessor for ChildStateStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100015B2C()
{
  return sub_100016BDC(&qword_100066F88, (void (*)(uint64_t))type metadata accessor for ChildStateStatusSource);
}

uint64_t sub_100015B74()
{
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100015BB4(uint64_t a1, uint64_t a2)
{
  return sub_1000134D0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100015BBC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100015BF4()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100015C3C(uint64_t a1, char a2)
{
  return sub_100016CD8(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_1000135D0);
}

void *sub_100015C54(uint64_t a1, uint64_t a2)
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
  sub_1000070B0(&qword_100066FA0);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100015CBC(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

void *sub_100015D38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000070B0(&qword_100066F90);
  char v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_100016774(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100016970();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_100015E24(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100015E30(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

void *sub_100015E3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000070B0(&qword_100066C08);
  char v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100016978((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100016970();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

unsigned __int8 *sub_100015F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100016288();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = sub_10001600C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10001600C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100016288()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_100016308(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100016308(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100016460(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100015C54(v9, 0),
          unint64_t v12 = sub_100016560((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100016460(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_100015CBC(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100015CBC(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_100016560(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    _DWORD v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_100015CBC(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_100015CBC(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void *sub_100016774(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
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
    return (void *)v10;
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
    char v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
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

uint64_t sub_100016970()
{
  return swift_release();
}

uint64_t sub_100016978(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    char v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
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

uint64_t sub_100016B78(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100016B88()
{
  unint64_t result = qword_100066FA8;
  if (!qword_100066FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066FA8);
  }
  return result;
}

uint64_t sub_100016BDC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016C24()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016C64(uint64_t a1, uint64_t a2)
{
  return sub_1000126D4(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_100016C6C(uint64_t a1, char a2)
{
  return sub_1000122AC(a1, a2 & 1, *(uint64_t (**)(uint64_t *))(v2 + 16));
}

uint64_t sub_100016C78()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016CC0(uint64_t a1, char a2)
{
  return sub_100016CD8(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_1000127D0);
}

uint64_t sub_100016CD8(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, void, void, void, void, void))
{
  return a3(a1, a2 & 1, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_100016CF0()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016D28()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008F18;
  return sub_10001335C();
}

uint64_t sub_100016DD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10001223C(a1, &qword_100066A38);
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

uint64_t sub_100016F84(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10001223C(a1, &qword_100066A38);
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
  sub_1000070B0(&qword_1000671A8);
  return swift_task_create();
}

uint64_t sub_100017138(uint64_t a1, uint64_t a2, void *a3)
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
  unint64_t v9 = a3 + 7;
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

uint64_t sub_100017200()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_listener))
  {
    _print_unlocked<A, B>(_:_:)();
    uint64_t v2 = 0;
    unint64_t v1 = (void *)0xE000000000000000;
  }
  else
  {
    unint64_t v1 = (void *)0xE300000000000000;
    uint64_t v2 = 4271950;
  }
  _StringGuts.grow(_:)(49);
  v3._object = (void *)0x80000001000567F0;
  v3._countAndFlagsBits = 0xD00000000000001FLL;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 0x6E657473696C0A2CLL;
  v4._object = (void *)0xEC000000203A7265;
  String.append(_:)(v4);
  v5._countAndFlagsBits = v2;
  v5._object = v1;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 10506;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  return 0;
}

uint64_t sub_100017338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  type metadata accessor for PeopleBiomeEventIndexer();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a6;
  *(void *)(v11 + 24) = a4;
  *(void *)(v11 + 32) = sub_100011F04;
  *(void *)(v11 + 40) = v10;
  swift_retain();
  swift_retain();
  static PeopleBiomeEventIndexer.indexEvent(askToBuyEvent:withContactFetcher:withIndexer:completion:)();
  return swift_release();
}

uint64_t sub_100017444(uint64_t a1, char a2, char a3, uint64_t a4, NSObject *a5, uint64_t a6)
{
  uint64_t v77 = a6;
  uint64_t v11 = type metadata accessor for StatusType();
  uint64_t v75 = *(void *)(v11 - 8);
  uint64_t v76 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v78 = v14;
  uint64_t v79 = v15;
  uint64_t v16 = __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v68 - v20;
  __chkstk_darwin(v19);
  unint64_t v23 = (char *)&v68 - v22;
  uint64_t v24 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    id v74 = a5;
    uint64_t v27 = *(void *)(a1 + 16);
    if (v27)
    {
      if (a3)
      {
        uint64_t v28 = a4;
        Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
        swift_bridgeObjectRetain();
        if (Strong)
        {
          sub_100020424(a4, a1, Strong);
          swift_unknownObjectRelease();
        }
        uint64_t v30 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v26, 1, 1, v30);
        uint64_t v31 = swift_allocObject();
        *(void *)(v31 + 16) = 0;
        *(void *)(v31 + 24) = 0;
        sub_100016DD8((uint64_t)v26, (uint64_t)&unk_100067130, v31);
        swift_release();
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v28 = a4;
      }
      os_log_type_t v53 = v13;
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      unint64_t v61 = Logger.logObject.getter();
      os_log_type_t v62 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v61, v62))
      {
        os_log_type_t v63 = (uint8_t *)swift_slowAlloc();
        os_log_t v71 = (os_log_t)swift_slowAlloc();
        os_log_t v81 = v71;
        uint64_t v73 = v28;
        *(_DWORD *)os_log_type_t v63 = 136315138;
        uint64_t v69 = v63 + 4;
        unint64_t v70 = v63;
        uint64_t v55 = v76;
        uint64_t v64 = v13;
        uint64_t v57 = v75;
        (*(void (**)(char *, void, uint64_t))(v75 + 104))(v64, enum case for StatusType.askToBuyRequest(_:), v76);
        sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v65 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v72 = v27;
        unint64_t v67 = v66;
        (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v55);
        uint64_t v80 = sub_10002A278(v65, v67, (uint64_t *)&v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s event consume complete", v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v79 + 8))(v23, v78);
        goto LABEL_16;
      }

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v23, v78);
    }
    else
    {
      swift_bridgeObjectRetain();
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      char v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.debug.getter();
      int v52 = v51;
      os_log_type_t v53 = v13;
      if (os_log_type_enabled(v50, v51))
      {
        LODWORD(v73) = v52;
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        os_log_t v71 = (os_log_t)swift_slowAlloc();
        os_log_t v81 = v71;
        unint64_t v70 = v54;
        *(_DWORD *)uint64_t v54 = 136315138;
        uint64_t v69 = v54 + 4;
        uint64_t v55 = v76;
        uint64_t v56 = v13;
        uint64_t v57 = v75;
        (*(void (**)(char *, void, uint64_t))(v75 + 104))(v56, enum case for StatusType.askToBuyRequest(_:), v76);
        sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v58 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v72 = 0;
        unint64_t v60 = v59;
        (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v55);
        uint64_t v80 = sub_10002A278(v58, v60, (uint64_t *)&v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v73, "%s event consume complete w/o local contact", v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v79 + 8))(v21, v78);
LABEL_16:
        sub_100015E24(a1, 0);
LABEL_20:
        type metadata accessor for PeopleAnalytics();
        (*(void (**)(char *, void, uint64_t))(v57 + 104))(v53, enum case for StatusType.askToBuyRequest(_:), v55);
        static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
        (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v55);
        return ((uint64_t (*)(void, void))v74)(0, 0);
      }

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v21, v78);
    }
    sub_100015E24(a1, 0);
    uint64_t v57 = v75;
    uint64_t v55 = v76;
    goto LABEL_20;
  }
  swift_errorRetain();
  static PeopleLogger.daemon.getter();
  sub_100015E30(a1, 1);
  swift_retain();
  sub_100015E30(a1, 1);
  swift_retain();
  unint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.error.getter();
  int v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v35 = swift_slowAlloc();
    id v74 = swift_slowAlloc();
    os_log_t v81 = v74;
    *(_DWORD *)uint64_t v35 = 136315394;
    unint64_t v70 = (uint8_t *)(v35 + 4);
    uint64_t v73 = a4;
    uint64_t v36 = v75;
    uint64_t v37 = *(void (**)(char *, void, uint64_t))(v75 + 104);
    LODWORD(v72) = v34;
    uint64_t v38 = v13;
    uint64_t v39 = v13;
    uint64_t v40 = v76;
    v37(v39, enum case for StatusType.askToBuyRequest(_:), v76);
    sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
    os_log_t v71 = v32;
    uint64_t v42 = v41;
    unint64_t v44 = v43;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v40);
    uint64_t v80 = sub_10002A278(v42, v44, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    id v45 = a5;
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v46 = Error.localizedDescription.getter();
    uint64_t v80 = sub_10002A278(v46, v47, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100015E24(a1, 1);
    sub_100015E24(a1, 1);
    os_log_t v48 = v71;
    _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v72, "%s consume error: %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v78);
  }
  else
  {
    swift_release_n();
    sub_100015E24(a1, 1);
    sub_100015E24(a1, 1);

    (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v78);
    id v45 = a5;
  }
  swift_errorRetain();
  ((void (*)(uint64_t, uint64_t))v45)(a1, 1);
  sub_100015E24(a1, 1);
  return sub_100015E24(a1, 1);
}

uint64_t sub_100017E84()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_100017F40, 0, 0);
}

uint64_t sub_100017F40()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.askToBuyRequest(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_100017FF8(void *a1, uint64_t a2)
{
  sub_100008758(a2 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_indexer, (uint64_t)v7);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_1000087BC(v7, v4 + 32);
  *(unsigned char *)(v4 + 72) = 1;
  sub_1000070B0(&qword_100066A40);
  swift_allocObject();
  id v5 = a1;
  swift_retain();
  return Promise.init(startBlock:)();
}

uint64_t sub_1000180B8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v23 = a1;
  uint64_t v3 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::String v6 = &v24[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v7 = type metadata accessor for StatusType();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v24[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v9);
  uint64_t v13 = &v24[-v12 - 8];
  uint64_t v14 = enum case for StatusType.askToBuyRequest(_:);
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  v15(&v24[-v12 - 8], enum case for StatusType.askToBuyRequest(_:), v7);
  sub_100008758(v2 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_contactFetcher, (uint64_t)v24);
  v15(v11, v14, v7);
  id v16 = [self askToBuyStream];
  sub_1000070B0(&qword_1000670D0);
  swift_allocObject();
  uint64_t v17 = BiomeStreamReader.init(statusType:readerStream:)();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, v2 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_ttl, v3);
  sub_1000070B0(&qword_1000670D8);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = sub_100022680(v13, (uint64_t)v24, v17, (uint64_t)v6, v18);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v23;
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v21;
  sub_1000070B0(&qword_1000669E8);
  swift_allocObject();
  swift_bridgeObjectRetain();
  return Promise.init(startBlock:)();
}

uint64_t sub_100018378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_100022E04(v7);
  swift_bridgeObjectRelease();
  sub_1000070F4((void *)(a3 + qword_100069C18), *(void *)(a3 + qword_100069C18 + 24));
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_100016C6C;
  void v8[4] = v6;
  swift_retain();
  swift_retain();
  dispatch thunk of FamilyMemberContactFetching.familyWithDSIDs(completion:)();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1000184A4()
{
  sub_10000905C(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_ttl;
  uint64_t v2 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_indexer);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_contactFetcher);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled20AskToBuyStatusSource_messageConduit);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1000185A0()
{
  return type metadata accessor for AskToBuyStatusSource();
}

uint64_t type metadata accessor for AskToBuyStatusSource()
{
  uint64_t result = qword_100066FF8;
  if (!qword_100066FF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000185F4()
{
  sub_1000158A8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000186B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.askToBuyRequest(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_100018728(uint64_t a1)
{
  uint64_t v2 = sub_100018FE8(&qword_100066D00, (void (*)(uint64_t))type metadata accessor for AskToBuyStatusSource);
  return StatusSource.debugID.getter(a1, v2);
}

uint64_t sub_100018794(uint64_t a1)
{
  return sub_1000180B8(a1);
}

uint64_t sub_1000187B8(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for StatusType();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  return _swift_task_switch(sub_10001888C, 0, 0);
}

void sub_10001888C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[7];
  uint64_t v6 = enum case for StatusType.askToBuyRequest(_:);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[11] + 104);
  v7(v0[13], enum case for StatusType.askToBuyRequest(_:), v2);
  uint64_t v17 = swift_allocObject();
  v0[14] = v17;
  *(void *)(v17 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  v0[15] = v8;
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v3;
  v7(v1, v6, v2);
  uint64_t v9 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v10 = [v9 askToBuyStream];
  uint64_t v11 = sub_1000070B0(&qword_1000670D0);
  swift_allocObject();
  uint64_t v12 = BiomeStreamReader.init(statusType:readerStream:)();
  v0[5] = v11;
  unint64_t v13 = sub_100023230();
  v0[2] = v12;
  v0[6] = v13;
  uint64_t v15 = (char *)&async function pointer to dispatch thunk of ReindexCoordinator.reindex<A>(statusType:squashEvents:includeEvent:handleEvent:withReader:)
      + async function pointer to dispatch thunk of ReindexCoordinator.reindex<A>(statusType:squashEvents:includeEvent:handleEvent:withReader:);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[16] = v14;
  sub_10001210C(0, &qword_100067100);
  *uint64_t v14 = v0;
  v14[1] = sub_100018AE0;
  __asm { BR              X8 }
}

uint64_t sub_100018AE0()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 88);
  uint64_t v4 = *(void *)(*v0 + 80);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  sub_10000900C(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_100018CA8(uint64_t a1)
{
  uint64_t v2 = sub_10001210C(0, &qword_100067100);
  return static BMStoreDataPeople.squashRequestEvents<A>(_:)(a1, v2);
}

uint64_t sub_100018CF8(void *a1, void *a2)
{
  if (!a2[2]) {
    return 1;
  }
  uint64_t v2 = a2;
  id v3 = [a1 requestID];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  LOBYTE(v2) = sub_100017138(v4, v6, v2);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_100018D78(void *a1, uint64_t a2)
{
  uint64_t v4 = ReindexCoordinator.indexer.getter();
  v10[3] = type metadata accessor for SpotlightIndexer();
  void v10[4] = &protocol witness table for SpotlightIndexer;
  v10[0] = v4;
  sub_100008758((uint64_t)v10, (uint64_t)v9);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_1000087BC(v9, v5 + 32);
  *(unsigned char *)(v5 + 72) = 0;
  sub_1000070B0(&qword_100066A40);
  swift_allocObject();
  swift_retain();
  id v6 = a1;
  swift_retain();
  uint64_t v7 = Promise.init(startBlock:)();
  sub_10000900C((uint64_t)v10);
  swift_release();
  return v7;
}

uint64_t sub_100018E78()
{
  return sub_100017200();
}

uint64_t sub_100018EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100023ED4;
  return sub_1000187B8(a1, a2);
}

uint64_t sub_100018F48(uint64_t a1)
{
  uint64_t result = sub_100018FE8(&qword_1000670C0, (void (*)(uint64_t))type metadata accessor for AskToBuyStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100018FA0()
{
  return sub_100018FE8(&qword_1000670C8, (void (*)(uint64_t))type metadata accessor for AskToBuyStatusSource);
}

uint64_t sub_100018FE8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100019030(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 16))
  {
    sub_1000070F4((void *)(v4 + qword_100069C28), *(void *)(v4 + qword_100069C28 + 24));
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v4;
    v8[3] = a1;
    void v8[4] = a2;
    v8[5] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of EventCollectorProtocol.collectEvents(statusType:maxAge:completion:)();
    swift_release();
  }
  else
  {
    _StringGuts.grow(_:)(20);
    type metadata accessor for StatusType();
    sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    dispatch thunk of CustomStringConvertible.description.getter();
    swift_bridgeObjectRelease();
    v9._object = (void *)0x8000000100056730;
    v9._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v9);
    id v10 = (id)static PeopleErrors.createError(_:code:)();
    swift_bridgeObjectRelease();
    a2(v10, 1);
  }
}

void sub_100019254(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 16))
  {
    sub_1000070F4((void *)(v4 + qword_100069C28), *(void *)(v4 + qword_100069C28 + 24));
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v4;
    v8[3] = a1;
    void v8[4] = a2;
    v8[5] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of EventCollectorProtocol.collectEvents(statusType:maxAge:completion:)();
    swift_release();
  }
  else
  {
    _StringGuts.grow(_:)(20);
    type metadata accessor for StatusType();
    sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    dispatch thunk of CustomStringConvertible.description.getter();
    swift_bridgeObjectRelease();
    v9._object = (void *)0x8000000100056730;
    v9._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v9);
    id v10 = (id)static PeopleErrors.createError(_:code:)();
    swift_bridgeObjectRelease();
    a2(v10, 1);
  }
}

uint64_t sub_100019478(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void))
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100019BB8(a1);
  if (v12)
  {
    unint64_t v13 = (unint64_t)v12;
    swift_retain();
    uint64_t v14 = sub_1000235FC(&_swiftEmptyDictionarySingleton, v13, &qword_100067100, (uint64_t)BMAskToBuyEvent_ptr, (uint64_t)&protocol witness table for BMAskToBuyEvent, (uint64_t (*)(void))&BMAskToBuyEvent.requestId.getter);
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1000239A0((uint64_t)&_swiftEmptyDictionarySingleton, v14, a2, a3, (void (*)(uint64_t *, unsigned char *, uint64_t, uint64_t))sub_100019F90);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    type metadata accessor for PeopleAnalytics();
    static PeopleAnalytics.eventsCollected(statusType:eventCount:)();
    a4(v15, 0);
    return swift_bridgeObjectRelease();
  }
  else
  {
    static PeopleLogger.daemon.getter();
    swift_retain_n();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v23[2] = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v24 = v20;
      v23[1] = v19 + 4;
      type metadata accessor for StatusType();
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
      v23[4] = sub_10002A278(v21, v22, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s event type array not [EventType]!", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_100019818(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void))
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100019DA4(a1);
  if (v12)
  {
    unint64_t v13 = (unint64_t)v12;
    swift_retain();
    uint64_t v14 = sub_1000235FC(&_swiftEmptyDictionarySingleton, v13, &qword_100067150, (uint64_t)BMScreenTimeRequestEvent_ptr, (uint64_t)&protocol witness table for BMScreenTimeRequestEvent, (uint64_t (*)(void))&BMScreenTimeRequestEvent.requestId.getter);
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1000239A0((uint64_t)&_swiftEmptyDictionarySingleton, v14, a2, a3, (void (*)(uint64_t *, unsigned char *, uint64_t, uint64_t))sub_10001B248);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    type metadata accessor for PeopleAnalytics();
    static PeopleAnalytics.eventsCollected(statusType:eventCount:)();
    a4(v15, 0);
    return swift_bridgeObjectRelease();
  }
  else
  {
    static PeopleLogger.daemon.getter();
    swift_retain_n();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v23[2] = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v24 = v20;
      v23[1] = v19 + 4;
      type metadata accessor for StatusType();
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
      v23[4] = sub_10002A278(v21, v22, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s event type array not [EventType]!", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void *sub_100019BB8(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  specialized ContiguousArray.reserveCapacity(_:)();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v4 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        self;
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v4 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      for (uint64_t j = 0; ; ++j)
      {
        uint64_t v6 = j + 1;
        if (__OFADD__(j, 1)) {
          break;
        }
        self;
        uint64_t v7 = swift_dynamicCastObjCClass();
        if (!v7)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v1 = v7;
        swift_unknownObjectRetain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v6 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    specialized ContiguousArray.reserveCapacity(_:)();
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100019DA4(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  specialized ContiguousArray.reserveCapacity(_:)();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v4 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        self;
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v4 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      for (uint64_t j = 0; ; ++j)
      {
        uint64_t v6 = j + 1;
        if (__OFADD__(j, 1)) {
          break;
        }
        self;
        uint64_t v7 = swift_dynamicCastObjCClass();
        if (!v7)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v1 = v7;
        swift_unknownObjectRetain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v6 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    specialized ContiguousArray.reserveCapacity(_:)();
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100019F90(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v129 = a1;
  uint64_t v7 = type metadata accessor for BMAskToBuyEvent.ProductType();
  __chkstk_darwin(v7 - 8);
  v112[1] = (char *)v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = (void *)type metadata accessor for StatusType();
  uint64_t v116 = *(v126 - 1);
  __chkstk_darwin(v126);
  v115 = (char *)v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = type metadata accessor for Date();
  uint64_t v118 = *(void *)(v119 - 8);
  uint64_t v10 = __chkstk_darwin(v119);
  uint64_t v114 = (char *)v112 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v121 = (char *)v112 - v12;
  uint64_t v13 = sub_1000070B0(&qword_1000670E0);
  __chkstk_darwin(v13 - 8);
  uint64_t v122 = (char *)v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = type metadata accessor for RequestStatus();
  uint64_t v15 = *(void *)(v125 - 8);
  uint64_t v16 = __chkstk_darwin(v125);
  v113 = (char *)v112 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  os_log_t v124 = (char *)v112 - v18;
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v20 = *(void *)(v19 - 8);
  unint64_t v127 = v19;
  uint64_t v128 = v20;
  uint64_t v21 = __chkstk_darwin(v19);
  unint64_t v117 = (char *)v112 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  v123 = (char *)v112 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)v112 - v26;
  __chkstk_darwin(v25);
  long long v29 = (char *)v112 - v28;
  sub_1000070F4((void *)a2, *(void *)(a2 + 24));
  uint64_t v30 = dispatch thunk of FamilyRequestEvent.dsid.getter();
  if ((v31 & 1) == 0)
  {
    if (!*(void *)(a4 + 16) || (unint64_t v32 = sub_1000072A0(v30), (v33 & 1) == 0))
    {
      static PeopleLogger.daemon.getter();
      swift_retain();
      uint64_t v57 = Logger.logObject.getter();
      os_log_type_t v58 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v57, v58))
      {
        unint64_t v59 = (uint8_t *)swift_slowAlloc();
        uint64_t v60 = swift_slowAlloc();
        *(_DWORD *)unint64_t v59 = 136315138;
        *(void *)&v136[0] = v60;
        sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v61 = dispatch thunk of CustomStringConvertible.description.getter();
        v133[0] = sub_10002A278(v61, v62, (uint64_t *)v136);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "%s no family member found", v59, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      uint64_t v49 = *(uint64_t (**)(char *, unint64_t))(v128 + 8);
      uint64_t v64 = v27;
      return v49(v64, v127);
    }
    v112[0] = v15;
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)*(id *)(*(void *)(a4 + 56) + 8 * v32);
    id v35 = [(id)isUniquelyReferenced_nonNull_native contactsIncludingImage:0];
    sub_10001210C(0, &qword_100066F98);
    unint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v36 >> 62)
    {
LABEL_51:
      swift_bridgeObjectRetain();
      uint64_t v104 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v37 = v125;
      uint64_t v38 = v124;
      uint64_t v39 = a3;
      uint64_t v120 = v104;
      if (v104)
      {
LABEL_6:
        v123 = (char *)v36;
        sub_1000070F4((void *)a2, *(void *)(a2 + 24));
        uint64_t v40 = (uint64_t)v122;
        dispatch thunk of FamilyRequestEvent.requestStatus.getter();
        uint64_t v41 = v112[0];
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v112[0] + 48))(v40, 1, v37) == 1)
        {
          swift_bridgeObjectRelease();
          sub_10001223C(v40, &qword_1000670E0);
          uint64_t v42 = v117;
          static PeopleLogger.daemon.getter();
          swift_retain();
          unint64_t v43 = Logger.logObject.getter();
          os_log_type_t v44 = static os_log_type_t.error.getter();
          if (!os_log_type_enabled(v43, v44))
          {

            swift_release();
            return (*(uint64_t (**)(char *, unint64_t))(v128 + 8))(v42, v127);
          }
          id v45 = (uint8_t *)swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          *(_DWORD *)id v45 = 136315138;
          *(void *)&v136[0] = v46;
          sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
          uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter();
          v133[0] = sub_10002A278(v47, v48, (uint64_t *)v136);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s invalid status for event", v45, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v49 = *(uint64_t (**)(char *, unint64_t))(v128 + 8);
          char v50 = &v139;
LABEL_54:
          uint64_t v64 = (char *)*(v50 - 32);
          return v49(v64, v127);
        }
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v38, v40, v37);
        sub_1000070F4((void *)a2, *(void *)(a2 + 24));
        dispatch thunk of FamilyRequestEvent.time.getter();
        uint64_t v65 = v121;
        Date.init(timeIntervalSinceReferenceDate:)();
        uint64_t v137 = 0;
        memset(v136, 0, sizeof(v136));
        uint64_t v66 = v39 + qword_100069C10;
        uint64_t v67 = v116;
        uint64_t v68 = v115;
        uint64_t v69 = v126;
        (*(void (**)(char *, uint64_t, void *))(v116 + 16))(v115, v66, v126);
        int v70 = (*(uint64_t (**)(char *, void *))(v67 + 88))(v68, v69);
        if (v70 == enum case for StatusType.askToBuyRequest(_:))
        {
          (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v113, v38, v37);
          a3 = (uint64_t)v114;
          (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v114, v65, v119);
          sub_100008758(a2, (uint64_t)v133);
          sub_1000070B0(&qword_1000670F8);
          sub_10001210C(0, &qword_100067100);
          swift_dynamicCast();
          os_log_t v71 = (void *)v130;
          BMAskToBuyEvent.productFromRequest()();

          type metadata accessor for PeopleFeatureFlags();
          static PeopleFeatureFlags.shared.getter();
          uint64_t v134 = type metadata accessor for AskToBuyRequestPersonStatus();
          uint64_t v135 = sub_100018FE8(&qword_100067108, (void (*)(uint64_t))&type metadata accessor for AskToBuyRequestPersonStatus);
          sub_100007180(v133);
          AskToBuyRequestPersonStatus.init(requestState:date:productType:featureFlags:)();
        }
        else
        {
          if (v70 != enum case for StatusType.screenTimeRequest(_:))
          {
            uint64_t v72 = *(void (**)(char *, void *))(v67 + 8);
            a3 = v67 + 8;
            v72(v68, v69);
            goto LABEL_25;
          }
          (*(void (**)(char *, char *, uint64_t))(v112[0] + 16))(v113, v38, v37);
          a3 = (uint64_t)v114;
          (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v114, v65, v119);
          type metadata accessor for PeopleFeatureFlags();
          static PeopleFeatureFlags.shared.getter();
          uint64_t v134 = type metadata accessor for ScreenTimeRequestPersonStatus();
          uint64_t v135 = sub_100018FE8(&qword_1000670F0, (void (*)(uint64_t))&type metadata accessor for ScreenTimeRequestPersonStatus);
          sub_100007180(v133);
          ScreenTimeRequestPersonStatus.init(requestState:date:featureFlags:)();
        }
        sub_10001223C((uint64_t)v136, &qword_1000670E8);
        sub_1000231C8((uint64_t)v133, (uint64_t)v136);
LABEL_25:
        unint64_t v73 = (unint64_t)v123;
        sub_100023160((uint64_t)v136, (uint64_t)&v130);
        if (!v131)
        {
          swift_bridgeObjectRelease();

          sub_10001223C((uint64_t)v136, &qword_1000670E8);
          (*(void (**)(char *, uint64_t))(v118 + 8))(v121, v119);
          (*(void (**)(char *, uint64_t))(v112[0] + 8))(v38, v37);
          return sub_10001223C((uint64_t)&v130, &qword_1000670E8);
        }
        v126 = (void *)isUniquelyReferenced_nonNull_native;
        sub_1000087BC(&v130, (uint64_t)v133);
        unint64_t v127 = v73 & 0xC000000000000001;
        swift_bridgeObjectRetain();
        for (uint64_t i = 4; ; ++i)
        {
          unint64_t v36 = i - 4;
          if (v127)
          {
            id v75 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            uint64_t v76 = i - 3;
            if (__OFADD__(v36, 1)) {
              goto LABEL_48;
            }
          }
          else
          {
            id v75 = *(id *)(v73 + 8 * i);
            uint64_t v76 = i - 3;
            if (__OFADD__(v36, 1))
            {
LABEL_48:
              __break(1u);
LABEL_49:
              __break(1u);
LABEL_50:
              __break(1u);
              goto LABEL_51;
            }
          }
          uint64_t v128 = v76;
          uint64_t v77 = v75;
          id v78 = [v75 identifier];
          uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          a3 = v80;

          sub_100008758((uint64_t)v133, (uint64_t)&v130);
          os_log_t v81 = v129;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v138 = *v81;
          unint64_t v36 = v138;
          *os_log_t v81 = 0x8000000000000000;
          unint64_t v83 = sub_1000071E4(v79, a3);
          uint64_t v84 = *(void *)(v36 + 16);
          BOOL v85 = (v82 & 1) == 0;
          uint64_t v86 = v84 + v85;
          if (__OFADD__(v84, v85)) {
            goto LABEL_49;
          }
          a2 = v82;
          if (*(void *)(v36 + 24) >= v86)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v36 = (unint64_t)&v138;
              sub_1000083A4();
            }
          }
          else
          {
            sub_100007838(v86, isUniquelyReferenced_nonNull_native);
            unint64_t v36 = v138;
            unint64_t v87 = sub_1000071E4(v79, a3);
            if ((a2 & 1) != (v88 & 1))
            {
              uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
              __break(1u);
              return result;
            }
            unint64_t v83 = v87;
          }
          uint64_t v89 = v129;
          *uint64_t v129 = v138;
          swift_bridgeObjectRelease();
          id v90 = (void *)*v89;
          if ((a2 & 1) == 0)
          {
            v90[(v83 >> 6) + 8] |= 1 << v83;
            uint64_t v91 = (uint64_t *)(v90[6] + 16 * v83);
            uint64_t *v91 = v79;
            v91[1] = a3;
            *(void *)(v90[7] + 8 * v83) = _swiftEmptyArrayStorage;
            uint64_t v92 = v90[2];
            BOOL v93 = __OFADD__(v92, 1);
            uint64_t v94 = v92 + 1;
            if (v93) {
              goto LABEL_50;
            }
            void v90[2] = v94;
            swift_bridgeObjectRetain();
          }
          uint64_t v95 = (uint64_t *)(v90[7] + 8 * v83);
          v96 = (void *)*v95;
          char v97 = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v95 = (uint64_t)v96;
          if ((v97 & 1) == 0)
          {
            v96 = sub_10001CEA8(0, v96[2] + 1, 1, v96);
            *uint64_t v95 = (uint64_t)v96;
          }
          unint64_t v99 = v96[2];
          unint64_t v98 = v96[3];
          if (v99 >= v98 >> 1) {
            *uint64_t v95 = (uint64_t)sub_10001CEA8((void *)(v98 > 1), v99 + 1, 1, v96);
          }
          uint64_t v100 = v131;
          a2 = v132;
          uint64_t v101 = sub_100012044((uint64_t)&v130, v131);
          __chkstk_darwin(v101);
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v112 - ((v102 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(uint64_t))(v103 + 16))(isUniquelyReferenced_nonNull_native);
          sub_1000225E8(v99, isUniquelyReferenced_nonNull_native, v95, v100, a2);
          sub_10000900C((uint64_t)&v130);

          swift_bridgeObjectRelease();
          unint64_t v73 = (unint64_t)v123;
          if (v128 == v120)
          {

            swift_bridgeObjectRelease();
            sub_10001223C((uint64_t)v136, &qword_1000670E8);
            (*(void (**)(char *, uint64_t))(v118 + 8))(v121, v119);
            (*(void (**)(char *, uint64_t))(v112[0] + 8))(v124, v125);
            sub_10000900C((uint64_t)v133);
            return swift_bridgeObjectRelease();
          }
        }
      }
    }
    else
    {
      uint64_t v37 = v125;
      uint64_t v38 = v124;
      uint64_t v39 = a3;
      uint64_t v120 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v120) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    char v105 = v123;
    static PeopleLogger.daemon.getter();
    swift_retain();
    unint64_t v106 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v106, v107))
    {

      swift_release();
      return (*(uint64_t (**)(char *, unint64_t))(v128 + 8))(v105, v127);
    }
    BOOL v108 = (uint8_t *)swift_slowAlloc();
    uint64_t v109 = swift_slowAlloc();
    *(_DWORD *)BOOL v108 = 136315138;
    *(void *)&v136[0] = v109;
    sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v110 = dispatch thunk of CustomStringConvertible.description.getter();
    v133[0] = sub_10002A278(v110, v111, (uint64_t *)v136);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v106, v107, "%s no contacts found", v108, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v49 = *(uint64_t (**)(char *, unint64_t))(v128 + 8);
    char v50 = &v140;
    goto LABEL_54;
  }
  static PeopleLogger.daemon.getter();
  swift_retain();
  os_log_type_t v51 = Logger.logObject.getter();
  os_log_type_t v52 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v51, v52))
  {
    os_log_type_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v53 = 136315138;
    *(void *)&v136[0] = v54;
    sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v55 = dispatch thunk of CustomStringConvertible.description.getter();
    v133[0] = sub_10002A278(v55, v56, (uint64_t *)v136);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "%s invalid dsid", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(char *, unint64_t))(v128 + 8))(v29, v127);
}

uint64_t sub_10001B248(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v126 = a1;
  uint64_t v7 = type metadata accessor for BMAskToBuyEvent.ProductType();
  __chkstk_darwin(v7 - 8);
  v109[1] = (char *)v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = (void *)type metadata accessor for StatusType();
  uint64_t v114 = *(v123 - 1);
  __chkstk_darwin(v123);
  v113 = (char *)v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = type metadata accessor for Date();
  uint64_t v116 = *(void *)(v117 - 8);
  uint64_t v10 = __chkstk_darwin(v117);
  unint64_t v111 = (char *)v109 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v118 = (char *)v109 - v12;
  uint64_t v13 = sub_1000070B0(&qword_1000670E0);
  __chkstk_darwin(v13 - 8);
  uint64_t v120 = (char *)v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = type metadata accessor for RequestStatus();
  uint64_t v15 = *(void *)(v122 - 8);
  uint64_t v16 = __chkstk_darwin(v122);
  uint64_t v110 = (char *)v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v121 = (char *)v109 - v18;
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v20 = *(void *)(v19 - 8);
  unint64_t v124 = v19;
  uint64_t v125 = v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v115 = (char *)v109 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v119 = (char *)v109 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)v109 - v26;
  __chkstk_darwin(v25);
  long long v29 = (char *)v109 - v28;
  sub_1000070F4((void *)a2, *(void *)(a2 + 24));
  uint64_t v30 = dispatch thunk of FamilyRequestEvent.dsid.getter();
  if (v31)
  {
    static PeopleLogger.daemon.getter();
    swift_retain();
    os_log_type_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v53 = 136315138;
      *(void *)&v133[0] = v54;
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v55 = dispatch thunk of CustomStringConvertible.description.getter();
      v130[0] = sub_10002A278(v55, v56, (uint64_t *)v133);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "%s invalid dsid", v53, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    return (*(uint64_t (**)(char *, unint64_t))(v125 + 8))(v29, v124);
  }
  else if (*(void *)(a4 + 16) && (unint64_t v32 = sub_1000072A0(v30), (v33 & 1) != 0))
  {
    v109[0] = v15;
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)*(id *)(*(void *)(a4 + 56) + 8 * v32);
    id v35 = [(id)isUniquelyReferenced_nonNull_native contactsIncludingImage:0];
    sub_10001210C(0, &qword_100066F98);
    unint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v36 >> 62)
    {
LABEL_54:
      swift_bridgeObjectRetain();
      uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v38 = v122;
    uint64_t v39 = v121;
    uint64_t v40 = a3;
    uint64_t v41 = (uint64_t)v120;
    if (v37)
    {
      uint64_t v112 = v37;
      uint64_t v119 = (char *)v36;
      sub_1000070F4((void *)a2, *(void *)(a2 + 24));
      dispatch thunk of FamilyRequestEvent.requestStatus.getter();
      uint64_t v42 = v109[0];
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109[0] + 48))(v41, 1, v38) == 1)
      {
        swift_bridgeObjectRelease();
        sub_10001223C(v41, &qword_1000670E0);
        unint64_t v43 = v115;
        static PeopleLogger.daemon.getter();
        swift_retain();
        os_log_type_t v44 = Logger.logObject.getter();
        os_log_type_t v45 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          *(_DWORD *)uint64_t v46 = 136315138;
          *(void *)&v133[0] = v47;
          sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
          uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter();
          v130[0] = sub_10002A278(v48, v49, (uint64_t *)v133);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "%s invalid status for event", v46, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          return (*(uint64_t (**)(char *, unint64_t))(v125 + 8))(v115, v124);
        }
        else
        {

          swift_release();
          return (*(uint64_t (**)(char *, unint64_t))(v125 + 8))(v43, v124);
        }
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v39, v41, v38);
      sub_1000070F4((void *)a2, *(void *)(a2 + 24));
      dispatch thunk of FamilyRequestEvent.time.getter();
      int v70 = v118;
      Date.init(timeIntervalSinceReferenceDate:)();
      uint64_t v134 = 0;
      memset(v133, 0, sizeof(v133));
      uint64_t v71 = v40 + qword_100069C10;
      uint64_t v72 = v114;
      unint64_t v73 = v113;
      id v74 = v123;
      (*(void (**)(char *, uint64_t, void *))(v114 + 16))(v113, v71, v123);
      int v75 = (*(uint64_t (**)(char *, void *))(v72 + 88))(v73, v74);
      if (v75 == enum case for StatusType.askToBuyRequest(_:))
      {
        (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v110, v39, v38);
        a3 = (uint64_t)v111;
        (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v111, v70, v117);
        sub_100008758(a2, (uint64_t)v130);
        sub_1000070B0(&qword_1000670F8);
        sub_10001210C(0, &qword_100067100);
        swift_dynamicCast();
        uint64_t v76 = (void *)v127;
        BMAskToBuyEvent.productFromRequest()();

        type metadata accessor for PeopleFeatureFlags();
        static PeopleFeatureFlags.shared.getter();
        uint64_t v131 = type metadata accessor for AskToBuyRequestPersonStatus();
        uint64_t v132 = sub_100018FE8(&qword_100067108, (void (*)(uint64_t))&type metadata accessor for AskToBuyRequestPersonStatus);
        sub_100007180(v130);
        AskToBuyRequestPersonStatus.init(requestState:date:productType:featureFlags:)();
      }
      else
      {
        if (v75 != enum case for StatusType.screenTimeRequest(_:))
        {
          uint64_t v77 = *(void (**)(char *, void *))(v72 + 8);
          a3 = v72 + 8;
          v77(v73, v74);
          goto LABEL_28;
        }
        (*(void (**)(char *, char *, uint64_t))(v109[0] + 16))(v110, v39, v38);
        a3 = (uint64_t)v111;
        (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v111, v70, v117);
        type metadata accessor for PeopleFeatureFlags();
        static PeopleFeatureFlags.shared.getter();
        uint64_t v131 = type metadata accessor for ScreenTimeRequestPersonStatus();
        uint64_t v132 = sub_100018FE8(&qword_1000670F0, (void (*)(uint64_t))&type metadata accessor for ScreenTimeRequestPersonStatus);
        sub_100007180(v130);
        ScreenTimeRequestPersonStatus.init(requestState:date:featureFlags:)();
      }
      sub_10001223C((uint64_t)v133, &qword_1000670E8);
      sub_1000231C8((uint64_t)v130, (uint64_t)v133);
LABEL_28:
      id v78 = v119;
      sub_100023160((uint64_t)v133, (uint64_t)&v127);
      if (!v128)
      {
        swift_bridgeObjectRelease();

        sub_10001223C((uint64_t)v133, &qword_1000670E8);
        (*(void (**)(char *, uint64_t))(v116 + 8))(v118, v117);
        (*(void (**)(char *, uint64_t))(v109[0] + 8))(v39, v38);
        return sub_10001223C((uint64_t)&v127, &qword_1000670E8);
      }
      v123 = (void *)isUniquelyReferenced_nonNull_native;
      sub_1000087BC(&v127, (uint64_t)v130);
      unint64_t v124 = (unint64_t)v78 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      for (uint64_t i = 4; ; ++i)
      {
        unint64_t v36 = i - 4;
        if (v124)
        {
          id v80 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v81 = i - 3;
          if (__OFADD__(v36, 1)) {
            goto LABEL_51;
          }
        }
        else
        {
          id v80 = *(id *)&v78[8 * i];
          uint64_t v81 = i - 3;
          if (__OFADD__(v36, 1))
          {
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
            goto LABEL_54;
          }
        }
        uint64_t v125 = v81;
        uint64_t v82 = v80;
        id v83 = [v80 identifier];
        uint64_t v84 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        a3 = v85;

        sub_100008758((uint64_t)v130, (uint64_t)&v127);
        uint64_t v86 = v126;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v135 = *v86;
        unint64_t v36 = v135;
        *uint64_t v86 = 0x8000000000000000;
        unint64_t v88 = sub_1000071E4(v84, a3);
        uint64_t v89 = *(void *)(v36 + 16);
        BOOL v90 = (v87 & 1) == 0;
        uint64_t v91 = v89 + v90;
        if (__OFADD__(v89, v90)) {
          goto LABEL_52;
        }
        a2 = v87;
        if (*(void *)(v36 + 24) >= v91)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            unint64_t v36 = (unint64_t)&v135;
            sub_1000083A4();
          }
        }
        else
        {
          sub_100007838(v91, isUniquelyReferenced_nonNull_native);
          unint64_t v36 = v135;
          unint64_t v92 = sub_1000071E4(v84, a3);
          if ((a2 & 1) != (v93 & 1))
          {
            uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
            __break(1u);
            return result;
          }
          unint64_t v88 = v92;
        }
        uint64_t v94 = v126;
        unint64_t *v126 = v135;
        swift_bridgeObjectRelease();
        uint64_t v95 = (void *)*v94;
        if ((a2 & 1) == 0)
        {
          v95[(v88 >> 6) + 8] |= 1 << v88;
          v96 = (uint64_t *)(v95[6] + 16 * v88);
          uint64_t *v96 = v84;
          v96[1] = a3;
          *(void *)(v95[7] + 8 * v88) = _swiftEmptyArrayStorage;
          uint64_t v97 = v95[2];
          BOOL v98 = __OFADD__(v97, 1);
          uint64_t v99 = v97 + 1;
          if (v98) {
            goto LABEL_53;
          }
          v95[2] = v99;
          swift_bridgeObjectRetain();
        }
        uint64_t v100 = (uint64_t *)(v95[7] + 8 * v88);
        uint64_t v101 = (void *)*v100;
        char v102 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v100 = (uint64_t)v101;
        if ((v102 & 1) == 0)
        {
          uint64_t v101 = sub_10001CEA8(0, v101[2] + 1, 1, v101);
          uint64_t *v100 = (uint64_t)v101;
        }
        unint64_t v104 = v101[2];
        unint64_t v103 = v101[3];
        if (v104 >= v103 >> 1) {
          uint64_t *v100 = (uint64_t)sub_10001CEA8((void *)(v103 > 1), v104 + 1, 1, v101);
        }
        uint64_t v105 = v128;
        a2 = v129;
        uint64_t v106 = sub_100012044((uint64_t)&v127, v128);
        __chkstk_darwin(v106);
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v109 - ((v107 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(uint64_t))(v108 + 16))(isUniquelyReferenced_nonNull_native);
        sub_1000225E8(v104, isUniquelyReferenced_nonNull_native, v100, v105, a2);
        sub_10000900C((uint64_t)&v127);

        swift_bridgeObjectRelease();
        id v78 = v119;
        if (v125 == v112)
        {

          swift_bridgeObjectRelease();
          sub_10001223C((uint64_t)v133, &qword_1000670E8);
          (*(void (**)(char *, uint64_t))(v116 + 8))(v118, v117);
          (*(void (**)(char *, uint64_t))(v109[0] + 8))(v121, v122);
          sub_10000900C((uint64_t)v130);
          return swift_bridgeObjectRelease();
        }
      }
    }
    swift_bridgeObjectRelease();
    os_log_type_t v63 = v119;
    static PeopleLogger.daemon.getter();
    swift_retain();
    uint64_t v64 = Logger.logObject.getter();
    os_log_type_t v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(_DWORD *)uint64_t v66 = 136315138;
      *(void *)&v133[0] = v67;
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v68 = dispatch thunk of CustomStringConvertible.description.getter();
      v130[0] = sub_10002A278(v68, v69, (uint64_t *)v133);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "%s no contacts found", v66, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, unint64_t))(v125 + 8))(v119, v124);
    }
    else
    {

      swift_release();
      return (*(uint64_t (**)(char *, unint64_t))(v125 + 8))(v63, v124);
    }
  }
  else
  {
    static PeopleLogger.daemon.getter();
    swift_retain();
    uint64_t v57 = Logger.logObject.getter();
    os_log_type_t v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      unint64_t v59 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      *(_DWORD *)unint64_t v59 = 136315138;
      *(void *)&v133[0] = v60;
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v61 = dispatch thunk of CustomStringConvertible.description.getter();
      v130[0] = sub_10002A278(v61, v62, (uint64_t *)v133);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "%s no family member found", v59, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    return (*(uint64_t (**)(char *, unint64_t))(v125 + 8))(v27, v124);
  }
}

void sub_10001C4EC(uint64_t a1, char a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    static PeopleLogger.daemon.getter();
    sub_100015E30(a1, 1);
    swift_retain();
    sub_100015E30(a1, 1);
    swift_retain();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = v22;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v24 = a5;
      HIDWORD(v21) = v15;
      type metadata accessor for StatusType();
      uint64_t v23 = a4;
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v25 = sub_10002A278(v17, v18, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v19 = Error.localizedDescription.getter();
      uint64_t v25 = sub_10002A278(v19, v20, &v26);
      a4 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v13, BYTE4(v21), "%s family lookup error: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_errorRetain();
    a4((id)a1, 1);
    sub_100015E24(a1, 1);
    sub_100015E24(a1, 1);
  }
  else
  {
    sub_100019030(a1, a4, a5);
  }
}

void sub_10001C858(uint64_t a1, char a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    static PeopleLogger.daemon.getter();
    sub_100015E30(a1, 1);
    swift_retain();
    sub_100015E30(a1, 1);
    swift_retain();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = v22;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v24 = a5;
      HIDWORD(v21) = v15;
      type metadata accessor for StatusType();
      uint64_t v23 = a4;
      sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v25 = sub_10002A278(v17, v18, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v19 = Error.localizedDescription.getter();
      uint64_t v25 = sub_10002A278(v19, v20, &v26);
      a4 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v13, BYTE4(v21), "%s family lookup error: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      sub_100015E24(a1, 1);
      sub_100015E24(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_errorRetain();
    a4((id)a1, 1);
    sub_100015E24(a1, 1);
    sub_100015E24(a1, 1);
  }
  else
  {
    sub_100019254(a1, a4, a5);
  }
}

uint64_t sub_10001CBC4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10001CCA0;
  return v6(a1);
}

uint64_t sub_10001CCA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_10001CD98(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000070B0(&qword_100066C08);
      uint64_t v10 = (char *)swift_allocObject();
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
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100022D10(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10001CEA8(void *result, int64_t a2, char a3, void *a4)
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
      sub_1000070B0(&qword_1000669F0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
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
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100023050(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001CFCC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001D034(a1, a2, a3, a4, &qword_100067160, (uint64_t (*)(void))&type metadata accessor for CalendarPersonStatus, (uint64_t (*)(void))&type metadata accessor for CalendarPersonStatus);
}

uint64_t sub_10001D000(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001D034(a1, a2, a3, a4, (uint64_t *)&unk_100066CB0, (uint64_t (*)(void))&type metadata accessor for ContactPerson, (uint64_t (*)(void))&type metadata accessor for ContactPerson);
}

uint64_t sub_10001D034(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000070B0(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100023B74(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10001D2B4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001D034(a1, a2, a3, a4, &qword_100067158, (uint64_t (*)(void))&type metadata accessor for RelevantIntent, (uint64_t (*)(void))&type metadata accessor for RelevantIntent);
}

uint64_t sub_10001D2E8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10001E44C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10001D498(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  int v25 = a3 & 1;
  uint64_t v8 = *v4;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  id v9 = a2;
  NSObject.hash(into:)();

  Hasher._combine(_:)(a3 & 1);
  Swift::Int v10 = Hasher._finalize()();
  uint64_t v11 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v24 = a1;
  if ((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v13 = ~v11;
    sub_10001210C(0, &qword_100067180);
    while (1)
    {
      uint64_t v14 = *(void *)(v8 + 48) + 16 * v12;
      int v15 = *(unsigned __int8 *)(v14 + 8);
      id v16 = *(id *)v14;
      char v17 = static NSObject.== infix(_:_:)();

      if (v17 & 1) != 0 && (((v25 == 0) ^ v15)) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v13;
      if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(*v4 + 48) + 16 * v12;
    BOOL v19 = *(void **)v18;
    LOBYTE(v18) = *(unsigned char *)(v18 + 8);
    *(void *)uint64_t v24 = v19;
    *(unsigned char *)(v24 + 8) = v18;
    id v20 = v19;
    return 0;
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    id v23 = v9;
    sub_10001E5E8(v23, v25, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v4 = v26;
    swift_bridgeObjectRelease();
    *(void *)uint64_t v24 = v23;
    *(unsigned char *)(v24 + 8) = v25;
    return 1;
  }
}

uint64_t sub_10001D690(void *a1, void *a2)
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

      sub_10001210C(0, &qword_100067168);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v29;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10001D938(v7, result + 1);
    uint64_t v30 = (void *)v22;
    unint64_t v23 = *(void *)(v22 + 16);
    if (*(void *)(v22 + 24) <= v23)
    {
      uint64_t v27 = v23 + 1;
      id v28 = v8;
      sub_10001E12C(v27, &qword_100067178);
      uint64_t v24 = v30;
    }
    else
    {
      uint64_t v24 = (void *)v22;
      id v25 = v8;
    }
    sub_10001E3C8((uint64_t)v8, v24);
    *uint64_t v3 = (uint64_t)v24;
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
      sub_10001210C(0, &qword_100067168);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        id v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
    uint64_t v31 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10001E7BC((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v31;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10001D938(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000070B0(&qword_100067178);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v15 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_10001210C(0, &qword_100067168);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        unint64_t v9 = *(void *)(v15 + 16);
        if (*(void *)(v15 + 24) <= v9)
        {
          sub_10001E12C(v9 + 1, &qword_100067178);
          uint64_t v2 = v15;
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
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v7 == v11;
            if (v7 == v11) {
              unint64_t v7 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v14;
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

uint64_t sub_10001DB44()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000070B0(&qword_100067110);
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

uint64_t sub_10001DE24(uint64_t a1)
{
  return sub_10001E12C(a1, &qword_100067190);
}

uint64_t sub_10001DE30()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000070B0(&qword_100067188);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v31 = v0;
    unint64_t v32 = (void *)(v2 + 56);
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
        unint64_t v17 = v32[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v32[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v32[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v31;
                uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
                if (v30 > 63) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v32 = -1 << v30;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v32[v18];
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
                  unint64_t v17 = v32[v11];
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
      uint64_t v19 = *(void *)(v2 + 48) + 16 * v15;
      uint64_t v20 = *(void **)v19;
      Swift::UInt v21 = *(unsigned __int8 *)(v19 + 8);
      Hasher.init(_seed:)();
      id v22 = v20;
      NSObject.hash(into:)();

      Hasher._combine(_:)(v21);
      uint64_t result = Hasher._finalize()();
      uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v9 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = *(void *)(v4 + 48) + 16 * v12;
      *(void *)uint64_t v13 = v22;
      *(unsigned char *)(v13 + 8) = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_10001E12C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  sub_1000070B0(a2);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    int64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t sub_10001E3C8(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

Swift::Int sub_10001E44C(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_10001DB44();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_10001E950();
      goto LABEL_22;
    }
    sub_10001EE6C();
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

void sub_10001E5E8(void *a1, char a2, unint64_t a3, char a4)
{
  Swift::UInt v25 = a2 & 1;
  unint64_t v7 = *(void *)(*v4 + 16);
  unint64_t v8 = *(void *)(*v4 + 24);
  if (v8 > v7 && (a4 & 1) != 0) {
    goto LABEL_14;
  }
  if (a4)
  {
    sub_10001DE30();
  }
  else
  {
    if (v8 > v7)
    {
      sub_10001EB04();
      goto LABEL_14;
    }
    sub_10001F11C();
  }
  uint64_t v9 = *v4;
  Hasher.init(_seed:)();
  id v10 = a1;
  NSObject.hash(into:)();

  Hasher._combine(_:)(v25);
  Swift::Int v11 = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v9 + 32);
  a3 = v11 & ~v12;
  if ((*(void *)(v9 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v13 = ~v12;
    sub_10001210C(0, &qword_100067180);
    while (1)
    {
      uint64_t v14 = *(void *)(v9 + 48) + 16 * a3;
      int v15 = *(unsigned __int8 *)(v14 + 8);
      id v16 = *(id *)v14;
      char v17 = static NSObject.== infix(_:_:)();

      if (v17 & 1) != 0 && (((v25 == 0) ^ v15)) {
        break;
      }
      a3 = (a3 + 1) & v13;
      if (((*(void *)(v9 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
        goto LABEL_14;
      }
    }
    ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
LABEL_14:
  uint64_t v18 = *v23;
  *(void *)(*v23 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v19 = *(void *)(v18 + 48) + 16 * a3;
  *(void *)uint64_t v19 = a1;
  *(unsigned char *)(v19 + 8) = v25;
  uint64_t v20 = *(void *)(v18 + 16);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v18 + 16) = v22;
  }
}

void sub_10001E7BC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10001E12C(v6 + 1, &qword_100067178);
  }
  else
  {
    if (v7 > v6)
    {
      sub_10001ECC0();
      goto LABEL_14;
    }
    sub_10001F3E4();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10001210C(0, &qword_100067168);
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

void *sub_10001E950()
{
  uint64_t v1 = v0;
  sub_1000070B0(&qword_100067110);
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
    void *v19 = *v17;
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

id sub_10001EB04()
{
  uint64_t v1 = v0;
  sub_1000070B0(&qword_100067188);
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
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void **)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 8);
    uint64_t v19 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v19 = v18;
    *(unsigned char *)(v19 + 8) = v17;
    id result = v18;
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

id sub_10001ECC0()
{
  uint64_t v1 = v0;
  sub_1000070B0(&qword_100067178);
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

uint64_t sub_10001EE6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000070B0(&qword_100067110);
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

uint64_t sub_10001F11C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000070B0(&qword_100067188);
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
  uint64_t v30 = v0;
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
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
    if (v16 >= v31) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v31) {
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
    uint64_t v19 = *(void *)(v2 + 48) + 16 * v15;
    uint64_t v20 = *(void **)v19;
    Swift::UInt v21 = *(unsigned __int8 *)(v19 + 8);
    Hasher.init(_seed:)();
    id v22 = v20;
    NSObject.hash(into:)();

    Hasher._combine(_:)(v21);
    uint64_t result = Hasher._finalize()();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = *(void *)(v4 + 48) + 16 * v12;
    *(void *)uint64_t v13 = v22;
    *(unsigned char *)(v13 + 8) = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v30;
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
    if (v11 >= v31) {
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

uint64_t sub_10001F3E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000070B0(&qword_100067178);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  BOOL v28 = v0;
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

uint64_t sub_10001F660(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v6 = type metadata accessor for StatusType();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v10 - 8);
  uint64_t v49 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v47 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v43 - v13;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  os_log_type_t v45 = v9;
  uint64_t v46 = v6;
  uint64_t v44 = v7;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(void *)&v52[0] = 0;
    *(_DWORD *)uint64_t v18 = 136315394;
    *((void *)&v52[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(35);
    v19._object = (void *)0x8000000100056520;
    v19._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v19);
    uint64_t v50 = a1;
    _print_unlocked<A, B>(_:_:)();
    unint64_t v43 = a3;
    v20._countAndFlagsBits = 2689580;
    v20._object = (void *)0xE300000000000000;
    String.append(_:)(v20);
    *(void *)&v52[0] = sub_10002A278(*(uint64_t *)&v52[0], *((unint64_t *)&v52[0] + 1), &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v21 = Array.description.getter();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    *(void *)&v52[0] = sub_10002A278(v21, v23, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v24 = v49;
  unint64_t v25 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v25(v14, v49);
  if (*(void *)(a2 + 16))
  {
    uint64_t v27 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v27 + 16, (uint64_t)v52);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v52, v28 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v52);
    uint64_t v29 = swift_allocObject();
    sub_1000087BC(v52, v29 + 16);
    *(void *)(v29 + 56) = a2;
    *(void *)(v29 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v30 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    int64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v32))
    {
      char v33 = (uint8_t *)swift_slowAlloc();
      *(void *)&v52[0] = swift_slowAlloc();
      *(_DWORD *)char v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v34 = Array.description.getter();
      unint64_t v43 = v25;
      id v35 = a3;
      uint64_t v36 = v34;
      unint64_t v38 = v37;
      swift_bridgeObjectRelease();
      uint64_t v39 = v36;
      a3 = v35;
      uint64_t v51 = sub_10002A278(v39, v38, (uint64_t *)v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Will attempt suggesting widgets for contacts: %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v25(v30, v24);
    }
    uint64_t v40 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v42 = (uint64_t)v45;
    uint64_t v41 = v46;
    (*(void (**)(char *, void, uint64_t))(v40 + 104))(v45, enum case for StatusType.dndAvailability(_:), v46);
    sub_10004F3AC(v42, a2);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v41);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10001FD78(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for StatusType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - v12;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  os_log_type_t v45 = v8;
  uint64_t v46 = v5;
  uint64_t v44 = v6;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    *(void *)&v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    unint64_t v43 = a3;
    uint64_t v18 = sub_100012314();
    uint64_t v50 = sub_10002A278(v18, v19, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v20 = Array.description.getter();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_10002A278(v20, v22, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v23 = v49;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v24(v13, v49);
  if (*(void *)(a2 + 16))
  {
    BOOL v26 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v26 + 16, (uint64_t)v51);
    uint64_t v27 = swift_allocObject();
    sub_1000087BC(v51, v27 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v51);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v51, v28 + 16);
    *(void *)(v28 + 56) = a2;
    *(void *)(v28 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v29 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&v51[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = Array.description.getter();
      unint64_t v43 = v24;
      uint64_t v34 = a3;
      uint64_t v35 = v33;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      a3 = v34;
      uint64_t v50 = sub_10002A278(v38, v37, (uint64_t *)v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Will attempt suggesting widgets for contacts: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v24(v29, v23);
    }
    uint64_t v39 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v41 = (uint64_t)v45;
    uint64_t v40 = v46;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v45, enum case for StatusType.childState(_:), v46);
    sub_10004F3AC(v41, a2);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100020424(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for StatusType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - v12;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  os_log_type_t v45 = v8;
  uint64_t v46 = v5;
  uint64_t v44 = v6;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    *(void *)&v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    unint64_t v43 = a3;
    uint64_t v18 = sub_100017200();
    uint64_t v50 = sub_10002A278(v18, v19, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v20 = Array.description.getter();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_10002A278(v20, v22, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v23 = v49;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v24(v13, v49);
  if (*(void *)(a2 + 16))
  {
    BOOL v26 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v26 + 16, (uint64_t)v51);
    uint64_t v27 = swift_allocObject();
    sub_1000087BC(v51, v27 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v51);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v51, v28 + 16);
    *(void *)(v28 + 56) = a2;
    *(void *)(v28 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v29 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&v51[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = Array.description.getter();
      unint64_t v43 = v24;
      uint64_t v34 = a3;
      uint64_t v35 = v33;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      a3 = v34;
      uint64_t v50 = sub_10002A278(v38, v37, (uint64_t *)v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Will attempt suggesting widgets for contacts: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v24(v29, v23);
    }
    uint64_t v39 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v41 = (uint64_t)v45;
    uint64_t v40 = v46;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v45, enum case for StatusType.askToBuyRequest(_:), v46);
    sub_10004F3AC(v41, a2);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100020AD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for StatusType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - v12;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  os_log_type_t v45 = v8;
  uint64_t v46 = v5;
  uint64_t v44 = v6;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    *(void *)&v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    unint64_t v43 = a3;
    uint64_t v18 = sub_10002B26C();
    uint64_t v50 = sub_10002A278(v18, v19, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v20 = Array.description.getter();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_10002A278(v20, v22, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v23 = v49;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v24(v13, v49);
  if (*(void *)(a2 + 16))
  {
    BOOL v26 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v26 + 16, (uint64_t)v51);
    uint64_t v27 = swift_allocObject();
    sub_1000087BC(v51, v27 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v51);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v51, v28 + 16);
    *(void *)(v28 + 56) = a2;
    *(void *)(v28 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v29 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&v51[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = Array.description.getter();
      unint64_t v43 = v24;
      uint64_t v34 = a3;
      uint64_t v35 = v33;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      a3 = v34;
      uint64_t v50 = sub_10002A278(v38, v37, (uint64_t *)v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Will attempt suggesting widgets for contacts: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v24(v29, v23);
    }
    uint64_t v39 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v41 = (uint64_t)v45;
    uint64_t v40 = v46;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v45, enum case for StatusType.screenTimeRequest(_:), v46);
    sub_10004F3AC(v41, a2);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10002117C(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for StatusType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - v12;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  os_log_type_t v45 = v8;
  uint64_t v46 = v5;
  uint64_t v44 = v6;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    *(void *)&v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    unint64_t v43 = a3;
    uint64_t v18 = sub_100036FE4();
    uint64_t v50 = sub_10002A278(v18, v19, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v20 = Array.description.getter();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_10002A278(v20, v22, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v23 = v49;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v24(v13, v49);
  if (*(void *)(a2 + 16))
  {
    BOOL v26 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v26 + 16, (uint64_t)v51);
    uint64_t v27 = swift_allocObject();
    sub_1000087BC(v51, v27 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v51);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v51, v28 + 16);
    *(void *)(v28 + 56) = a2;
    *(void *)(v28 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v29 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&v51[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = Array.description.getter();
      unint64_t v43 = v24;
      uint64_t v34 = a3;
      uint64_t v35 = v33;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      a3 = v34;
      uint64_t v50 = sub_10002A278(v38, v37, (uint64_t *)v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Will attempt suggesting widgets for contacts: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v24(v29, v23);
    }
    uint64_t v39 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v41 = (uint64_t)v45;
    uint64_t v40 = v46;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v45, enum case for StatusType.readMessage(_:), v46);
    sub_10004F3AC(v41, a2);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100021828(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v6 = type metadata accessor for StatusType();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v10 - 8);
  uint64_t v49 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v47 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v43 - v13;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  os_log_type_t v45 = v9;
  uint64_t v46 = v6;
  uint64_t v44 = v7;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(void *)&v52[0] = 0;
    *(_DWORD *)uint64_t v18 = 136315394;
    *((void *)&v52[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(46);
    v19._object = (void *)0x8000000100056870;
    v19._countAndFlagsBits = 0xD00000000000002ALL;
    String.append(_:)(v19);
    uint64_t v50 = a1;
    _print_unlocked<A, B>(_:_:)();
    unint64_t v43 = a3;
    v20._countAndFlagsBits = 10506;
    v20._object = (void *)0xE200000000000000;
    String.append(_:)(v20);
    *(void *)&v52[0] = sub_10002A278(*(uint64_t *)&v52[0], *((unint64_t *)&v52[0] + 1), &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v21 = Array.description.getter();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    *(void *)&v52[0] = sub_10002A278(v21, v23, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v24 = v49;
  unint64_t v25 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v25(v14, v49);
  if (*(void *)(a2 + 16))
  {
    uint64_t v27 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v27 + 16, (uint64_t)v52);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v52, v28 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v52);
    uint64_t v29 = swift_allocObject();
    sub_1000087BC(v52, v29 + 16);
    *(void *)(v29 + 56) = a2;
    *(void *)(v29 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v30 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    os_log_type_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(void *)&v52[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v34 = Array.description.getter();
      unint64_t v43 = v25;
      uint64_t v35 = a3;
      uint64_t v36 = v34;
      unint64_t v38 = v37;
      swift_bridgeObjectRelease();
      uint64_t v39 = v36;
      a3 = v35;
      uint64_t v51 = sub_10002A278(v39, v38, (uint64_t *)v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Will attempt suggesting widgets for contacts: %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v25(v30, v24);
    }
    uint64_t v40 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v42 = (uint64_t)v45;
    uint64_t v41 = v46;
    (*(void (**)(char *, void, uint64_t))(v40 + 104))(v45, enum case for StatusType.location(_:), v46);
    sub_10004F3AC(v42, a2);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v41);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100021F3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for StatusType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - v12;
  static PeopleLogger.daemon.getter();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  os_log_type_t v45 = v8;
  uint64_t v46 = v5;
  uint64_t v44 = v6;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    *(void *)&v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    unint64_t v43 = a3;
    uint64_t v18 = sub_10004A580();
    uint64_t v50 = sub_10002A278(v18, v19, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v20 = Array.description.getter();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_10002A278(v20, v22, (uint64_t *)v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "status source: %s has updated statuses for contacts: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v23 = v49;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
  uint64_t result = v24(v13, v49);
  if (*(void *)(a2 + 16))
  {
    BOOL v26 = sub_1000070F4((void *)a3 + 4, *((void *)a3 + 7));
    sub_100008758(*v26 + 16, (uint64_t)v51);
    uint64_t v27 = swift_allocObject();
    sub_1000087BC(v51, v27 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_100008758((uint64_t)a3 + 32, (uint64_t)v51);
    uint64_t v28 = swift_allocObject();
    sub_1000087BC(v51, v28 + 16);
    *(void *)(v28 + 56) = a2;
    *(void *)(v28 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    swift_release();
    uint64_t v29 = v47;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&v51[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = Array.description.getter();
      unint64_t v43 = v24;
      uint64_t v34 = a3;
      uint64_t v35 = v33;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      a3 = v34;
      uint64_t v50 = sub_10002A278(v38, v37, (uint64_t *)v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Will attempt suggesting widgets for contacts: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43(v47, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v24(v29, v23);
    }
    uint64_t v39 = v44;
    sub_1000070F4((void *)a3 + 14, *((void *)a3 + 17));
    uint64_t v41 = (uint64_t)v45;
    uint64_t v40 = v46;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v45, enum case for StatusType.missedCall(_:), v46);
    sub_10004F3AC(v41, a2);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    dispatch thunk of Promise.catch<A>(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000225E8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v9 = sub_100007180((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_1000087BC(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_100022680(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v37 = a4;
  uint64_t v9 = type metadata accessor for StatusType();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  long long v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v32 = v13;
  __chkstk_darwin(v13);
  os_log_type_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40[3] = sub_1000070B0(&qword_1000670D0);
  v40[4] = sub_100023230();
  v40[0] = a3;
  uint64_t v33 = v10;
  BOOL v16 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
  v16(a5 + qword_100069C10, a1, v9);
  uint64_t v34 = a2;
  sub_100008758(a2, a5 + qword_100069C18);
  uint64_t v17 = a5 + qword_100069C20;
  uint64_t v18 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v19 + 16);
  uint64_t v30 = v18;
  v20(v17, v37);
  uint64_t v36 = a5;
  sub_100008758((uint64_t)v40, a5 + qword_100069C28);
  static PeopleLogger.daemon.getter();
  uint64_t v35 = a1;
  v16((uint64_t)v12, a1, v9);
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v29 = v23 + 4;
    sub_100018FE8(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v38 = sub_10002A278(v24, v25, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    BOOL v26 = *(void (**)(char *, uint64_t))(v33 + 8);
    v26(v12, v9);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "FamilyStatusEventProcessor for %s init", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v37, v30);
    sub_10000900C((uint64_t)v40);
    sub_10000900C(v34);
    v26(v35, v9);
  }
  else
  {

    uint64_t v27 = *(void (**)(char *, uint64_t))(v33 + 8);
    v27(v12, v9);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v37, v30);
    sub_10000900C((uint64_t)v40);
    sub_10000900C(v34);
    v27(v35, v9);
  }
  (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);
  return v36;
}

uint64_t sub_100022AE0()
{
  return sub_1000232E4((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_100022AF8(uint64_t a1, uint64_t a2)
{
  return sub_100018378(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100022B00(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100022BE0;
  return v5(v2 + 16);
}

uint64_t sub_100022BE0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  void *v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100022D10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_100022E04(uint64_t a1)
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
      sub_10001D2E8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100022E9C()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100022EDC(uint64_t a1, char a2)
{
  sub_10001C4EC(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(id, uint64_t))(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100022EF0(unint64_t a1)
{
  return sub_100019478(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t, void))(v1 + 32));
}

uint64_t sub_100022EFC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  sub_10001210C(0, &qword_100067168);
  sub_100023CD8();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        Swift::Int v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_10001D690(&v9, v6);
      }
    }
    else
    {
      Swift::Int v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_10001D690(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100023050(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_1000070B0(&qword_100066CC0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100023160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_1000670E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000231C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_1000670E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100023230()
{
  unint64_t result = qword_100067118;
  if (!qword_100067118)
  {
    sub_100011FFC(&qword_1000670D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100067118);
  }
  return result;
}

uint64_t sub_10002328C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000232C4(void *a1)
{
  return sub_100018CF8(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000232CC()
{
  return sub_1000232E4((void (*)(void))&_swift_release);
}

uint64_t sub_1000232E4(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 24));
  return _swift_deallocObject(v1, 32, 7);
}

uint64_t sub_100023334(void *a1)
{
  return sub_100018D78(a1, *(void *)(v1 + 16));
}

uint64_t sub_100023340(uint64_t a1, uint64_t a2)
{
  return sub_100017338(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + 32, *(unsigned char *)(v2 + 72));
}

uint64_t sub_100023350()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023388()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000233C8(uint64_t a1, char a2)
{
  return sub_100017444(a1, a2 & 1, *(unsigned char *)(v2 + 16), *(void *)(v2 + 24), *(NSObject **)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_1000233DC()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023414()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008F18;
  return sub_100017E84();
}

uint64_t sub_1000234C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100023ED4;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100067138 + dword_100067138);
  return v6(a1, v4);
}

uint64_t sub_100023578(uint64_t a1, uint64_t a2)
{
  return sub_10000D264(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_100023584(unint64_t *a1)
{
  return sub_10000AD94(a1, v1 + 16, *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_1000235A8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000235F0(unint64_t a1)
{
  return sub_100019818(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t, void))(v1 + 32));
}

uint64_t sub_1000235FC(void *a1, unint64_t a2, unint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  uint64_t v42 = a6;
  uint64_t v43 = a5;
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  id v7 = v6;
  uint64_t v8 = a2;
  if (a2 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    if (v10) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return (uint64_t)a1;
  }
  uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_26;
  }
LABEL_3:
  id v36 = v7;
  unint64_t v39 = v8 & 0xC000000000000001;
  uint64_t v11 = 4;
  uint64_t v38 = v8;
  uint64_t v37 = v10;
  while (1)
  {
    if (v39) {
      id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v13 = *(id *)(v8 + 8 * v11);
    }
    id v7 = v13;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v44 = v11 - 3;
    uint64_t v45 = v11;
    uint64_t v14 = sub_10001210C(0, v40);
    v51[3] = v14;
    v51[4] = v43;
    v51[0] = v7;
    sub_1000070F4(v51, v14);
    id v7 = v7;
    uint64_t v15 = v42();
    uint64_t v8 = v16;
    sub_100008758((uint64_t)v51, (uint64_t)&v49);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    os_log_type_t v52 = a1;
    unint64_t v19 = sub_1000071E4(v15, v8);
    uint64_t v20 = a1[2];
    BOOL v21 = (v18 & 1) == 0;
    uint64_t v22 = v20 + v21;
    if (__OFADD__(v20, v21)) {
      goto LABEL_23;
    }
    char v23 = v18;
    if (a1[3] < v22) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      a1 = v52;
      if (v18) {
        goto LABEL_4;
      }
    }
    else
    {
      sub_1000083B0();
      a1 = v52;
      if (v23)
      {
LABEL_4:
        uint64_t v12 = a1[7] + 40 * v19;
        sub_10000900C(v12);
        sub_1000087BC(&v49, v12);
        goto LABEL_5;
      }
    }
LABEL_17:
    uint64_t v26 = sub_100012044((uint64_t)&v49, v50);
    __chkstk_darwin(v26);
    uint64_t v28 = (uint64_t *)((char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v29 + 16))(v28);
    uint64_t v30 = *v28;
    uint64_t v47 = v14;
    uint64_t v48 = v43;
    *(void *)&long long v46 = v30;
    a1[(v19 >> 6) + 8] |= 1 << v19;
    uint64_t v31 = (uint64_t *)(a1[6] + 16 * v19);
    *uint64_t v31 = v15;
    v31[1] = v8;
    sub_1000087BC(&v46, a1[7] + 40 * v19);
    uint64_t v32 = a1[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_24;
    }
    a1[2] = v34;
    sub_10000900C((uint64_t)&v49);
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000900C((uint64_t)v51);

    uint64_t v11 = v45 + 1;
    uint64_t v8 = v38;
    if (v44 == v37) {
      goto LABEL_26;
    }
  }
  sub_100007844(v22, isUniquelyReferenced_nonNull_native);
  unint64_t v24 = sub_1000071E4(v15, v8);
  if ((v23 & 1) == (v25 & 1))
  {
    unint64_t v19 = v24;
    a1 = v52;
    if (v23) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000239A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *, unsigned char *, uint64_t, uint64_t))
{
  uint64_t v24 = a1;
  uint64_t v10 = a2 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = 0;
  while (v13)
  {
    unint64_t v17 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v18 = v17 | (v16 << 6);
LABEL_5:
    sub_100008758(*(void *)(a2 + 56) + 40 * v18, (uint64_t)v23);
    sub_1000087BC(v23, (uint64_t)v22);
    a5(&v24, v22, a3, a4);
    uint64_t result = sub_10000900C((uint64_t)v22);
    if (v5)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  if (__OFADD__(v16++, 1))
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v16 >= v14) {
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v10 + 8 * v16);
  if (v20)
  {
LABEL_19:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v16 << 6);
    goto LABEL_5;
  }
  int64_t v21 = v16 + 1;
  if (v16 + 1 >= v14) {
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v10 + 8 * v21);
  if (v20) {
    goto LABEL_18;
  }
  int64_t v21 = v16 + 2;
  if (v16 + 2 >= v14) {
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v10 + 8 * v21);
  if (v20) {
    goto LABEL_18;
  }
  int64_t v21 = v16 + 3;
  if (v16 + 3 >= v14) {
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v10 + 8 * v21);
  if (v20) {
    goto LABEL_18;
  }
  int64_t v21 = v16 + 4;
  if (v16 + 4 >= v14)
  {
LABEL_25:
    swift_release();
    return v24;
  }
  unint64_t v20 = *(void *)(v10 + 8 * v21);
  if (v20)
  {
LABEL_18:
    int64_t v16 = v21;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v14) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v10 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_19;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100023B74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100023CD8()
{
  unint64_t result = qword_100067170;
  if (!qword_100067170)
  {
    sub_10001210C(255, &qword_100067168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100067170);
  }
  return result;
}

uint64_t sub_100023D40(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008F18;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100067198 + dword_100067198);
  return v6(a1, v4);
}

uint64_t sub_100023E00()
{
  swift_release();
  sub_10000900C(v0 + 32);
  return _swift_deallocObject(v0, 73, 7);
}

uint64_t sub_100023E4C()
{
  sub_10000900C(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100023E88()
{
  sub_10000900C(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100023ED8(unint64_t *a1)
{
  return sub_100023584(a1);
}

id sub_100023F1C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for XPCListener()) init];
  qword_100069C08 = (uint64_t)result;
  return result;
}

id sub_100023F4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC7peopled11XPCListener__machServiceName];
  *(void *)uint64_t v2 = 0xD000000000000016;
  *((void *)v2 + 1) = 0x8000000100056930;
  uint64_t v21 = OBJC_IVAR____TtC7peopled11XPCListener_eventObserver;
  uint64_t v3 = type metadata accessor for XPCStreamHandler();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = type metadata accessor for PeopleTimelineControllerFactory();
  swift_allocObject();
  unint64_t v6 = v0;
  uint64_t v7 = PeopleTimelineControllerFactory.init()();
  type metadata accessor for PeopleFeatureFlags();
  uint64_t v8 = static PeopleFeatureFlags.shared.getter();
  void v26[3] = v3;
  v26[4] = &off_100062B40;
  v26[0] = v4;
  uint64_t v24 = v5;
  char v25 = &protocol witness table for PeopleTimelineControllerFactory;
  *(void *)&long long v23 = v7;
  type metadata accessor for XPCEventObserver();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = sub_100012044((uint64_t)v26, v3);
  __chkstk_darwin(v10);
  unint64_t v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = *v12;
  v9[5] = v3;
  v9[6] = &off_100062B40;
  long long v9[2] = v14;
  swift_retain();
  swift_retain();
  v9[13] = sub_100006058((uint64_t)_swiftEmptyArrayStorage);
  sub_1000087BC(&v23, (uint64_t)(v9 + 7));
  v9[12] = v8;
  sub_10000900C((uint64_t)v26);
  swift_release();
  swift_release();
  *(void *)&v1[v21] = v9;
  id v15 = objc_allocWithZone((Class)NSXPCListener);
  swift_bridgeObjectRetain();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithMachServiceName:v16];

  *(void *)&v6[OBJC_IVAR____TtC7peopled11XPCListener__listener] = v17;
  unint64_t v18 = (objc_class *)type metadata accessor for XPCListener();
  v22.receiver = v6;
  v22.super_class = v18;
  return objc_msgSendSuper2(&v22, "init");
}

id sub_1000241E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCListener();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for XPCListener()
{
  return self;
}

uint64_t sub_100024304(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v30 - v9;
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [a2 valueForEntitlement:v11];

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v36, 0, sizeof(v36));
  }
  sub_100024764((uint64_t)v36, (uint64_t)&v37);
  if (v38[2])
  {
    if ((swift_dynamicCast() & 1) != 0 && v35 == 1)
    {
      uint64_t v13 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP6People23ServiceDelegateProtocol_];
      [a2 setExportedInterface:v13];
      if (qword_100066738 != -1) {
        swift_once();
      }
      [a2 setExportedObject:qword_100069C68];
      [a2 resume];
      static PeopleLogger.daemon.getter();
      id v14 = a1;
      id v15 = a2;
      NSString v16 = v14;
      id v17 = v15;
      unint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      int v20 = v19;
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v21 = swift_slowAlloc();
        int v33 = v20;
        uint64_t v22 = v21;
        uint64_t v31 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 138412546;
        uint64_t v34 = v13;
        uint64_t v30 = v22 + 12;
        uint64_t v37 = v16;
        uint64_t v32 = v38;
        long long v23 = v16;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v24 = v31;
        *uint64_t v31 = v16;

        *(_WORD *)(v22 + 12) = 2112;
        uint64_t v37 = v17;
        char v25 = v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v24[1] = v17;

        _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v33, "%@: New connection established %@", (uint8_t *)v22, 0x16u);
        sub_1000070B0(&qword_100066A58);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        NSString v16 = v34;
      }
      else
      {

        unint64_t v18 = v13;
      }

      uint64_t v28 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    sub_1000247CC((uint64_t)&v37);
  }
  static PeopleLogger.daemon.getter();
  unint64_t v18 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v26, "connection is not entitled. declining.", v27, 2u);
    swift_slowDealloc();
  }
  uint64_t v28 = 0;
  uint64_t v10 = v8;
LABEL_15:

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v28;
}

uint64_t sub_100024764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100067250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000247CC(uint64_t a1)
{
  uint64_t v2 = sub_1000070B0(&qword_100067250);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002482C()
{
  sub_10000900C(v0 + 16);
  swift_release();
  sub_10000900C(v0 + 64);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocationStatusSource()
{
  return self;
}

uint64_t sub_100024898@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.location(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_10002490C(uint64_t a1)
{
  uint64_t v2 = sub_100024B50(&qword_100066D30);
  return StatusSource.debugID.getter(a1, v2);
}

uint64_t sub_100024964(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = *v1 + 16;
  uint64_t v6 = v4 + 64;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100024A18;
  return static LocateFriend.statusFromFMCache(for:with:friendLocateProvider:)(a1, v5, v6);
}

uint64_t sub_100024A18(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100024B1C()
{
  return sub_100024B50(&qword_100067310);
}

uint64_t sub_100024B50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LocationStatusSource();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100024B90(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void *sub_100024BFC(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t result = (void *)sub_10000D774(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 subscriptionIdentifier];
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10000D774(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      v13[5] = v10;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_100024D78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  id v7 = a3 + 2;
  uint64_t v9 = a3[5];
  uint64_t v8 = a3[6];
  sub_1000070F4(v7, v9);
  swift_retain();
  uint64_t v10 = static PeopleConstants.appBundleID.getter();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100011F04;
  *(void *)(v13 + 24) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v8 + 24))(v10, v12, sub_100025EC0, v13, v9, v8);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100024E84(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, void))
{
  sub_1000070B0(&qword_100067400);
  static Result<>.foundation_from(_:_:)();
  a3(v5, v6);
  return sub_100015E24(v5, v6);
}

uint64_t sub_100024F04@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v4 = *a1;
  uint64_t v5 = *sub_1000070F4((void *)(a2 + 56), *(void *)(a2 + 80));
  v16[3] = type metadata accessor for WidgetConfigurationReader();
  v16[4] = &off_100061C68;
  v16[0] = v5;
  sub_100008758((uint64_t)v16, (uint64_t)v15);
  uint64_t v6 = swift_allocObject();
  sub_1000087BC(v15, v6 + 16);
  swift_retain();
  sub_10000900C((uint64_t)v16);
  id v17 = _swiftEmptyArrayStorage;
  if (v4 >> 62) {
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = _CocoaArrayWrapper.endIndex.getter())
  {
    id v14 = a3;
    uint64_t v8 = 4;
    while (1)
    {
      uint64_t v9 = (v4 & 0xC000000000000001) != 0
         ? (void *)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(v4 + 8 * v8);
      a3 = v9;
      uint64_t v10 = v8 - 3;
      if (__OFADD__(v8 - 4, 1)) {
        break;
      }
      uint64_t v11 = sub_1000118B8(v9);

      sub_10000E240((uint64_t)v11);
      ++v8;
      if (v10 == v7)
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = v17;
        a3 = v14;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = _swiftEmptyArrayStorage;
LABEL_13:
  uint64_t result = swift_release();
  *a3 = v12;
  return result;
}

uint64_t sub_1000250A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3 = a3;
  uint64_t v4 = *(void *)(*(void *)a1 + 16);
  if (v4)
  {
    uint64_t v6 = (void *)(a2 + 96);
    uint64_t v7 = swift_bridgeObjectRetain() + 40;
    do
    {
      sub_1000070F4(v6, *(void *)(a2 + 120));
      swift_bridgeObjectRetain();
      uint64_t v9 = dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v8 = (void *)CNContact.people_normalizedHandles.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v8 = _swiftEmptyArrayStorage;
      }
      v7 += 16;
      sub_10000E240((uint64_t)v8);
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    uint64_t v3 = a3;
  }
  uint64_t v11 = sub_100022E04((uint64_t)_swiftEmptyArrayStorage);
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_1000251D4()
{
  sub_10000900C(v0 + 16);
  sub_10000900C(v0 + 56);
  sub_10000900C(v0 + 96);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AvailabilitySubscriptionManager()
{
  return self;
}

uint64_t sub_100025240()
{
  sub_1000070B0(&qword_1000673D8);
  sub_1000070B0(&qword_1000673E0);
  swift_allocObject();
  swift_retain();
  Promise.init(startBlock:)();
  uint64_t v1 = sub_1000070F4((void *)(v0 + 56), *(void *)(v0 + 80));
  sub_100008758(*v1 + 16, (uint64_t)v5);
  uint64_t v2 = swift_allocObject();
  sub_1000087BC(v5, v2 + 16);
  sub_1000070B0(&qword_100067148);
  swift_allocObject();
  Promise.init(startBlock:)();
  swift_retain();
  sub_1000070B0(&qword_1000673E8);
  dispatch thunk of Promise.then<A>(_:)();
  swift_release();
  swift_release();
  swift_retain();
  sub_1000070B0(&qword_1000673F0);
  dispatch thunk of Promise.then<A>(_:)();
  swift_release();
  swift_release();
  static Promise.join<A, B>(_:_:)();
  swift_release();
  swift_release();
  dispatch thunk of Promise.then<A>(_:)();
  swift_release();
  uint64_t v3 = dispatch thunk of Promise.catch<A>(_:)();
  swift_release();
  return v3;
}

uint64_t sub_100025470(uint64_t a1, uint64_t a2)
{
  return sub_100024D78(a1, a2, v2);
}

uint64_t sub_100025478()
{
  sub_10000900C(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000254B0@<X0>(unint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100024F04(a1, v2, a2);
}

uint64_t sub_1000254CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000250A0(a1, v2, a2);
}

uint64_t sub_1000254E8(unint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_100025C98(v4, a2);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_100024BFC((unint64_t)v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_100022E04((uint64_t)v6);
  swift_bridgeObjectRelease();
  if (!(a1 >> 62))
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v8 = result;
  if (!result) {
    goto LABEL_12;
  }
LABEL_3:
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v11 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v12 = v11;
      id v13 = [v11 subscriptionIdentifier];
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;

      LOBYTE(v13) = sub_10004A3F0(v14, v16, v7);
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        static PeopleConstants.appBundleID.getter();
        NSString v17 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        v19[4] = sub_10002593C;
        v19[5] = 0;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 1107296256;
        v19[2] = sub_100024B90;
        v19[3] = &unk_100062360;
        unint64_t v18 = _Block_copy(v19);
        [v12 releasePersistentSubscriptionAssertionForApplicationIdentifier:v17 completion:v18];
        _Block_release(v18);

        uint64_t v12 = v17;
      }
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025720(id *a1, uint64_t a2)
{
  id v3 = [*a1 ownerHandles];
  if (!v3)
  {
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
LABEL_19:
    char v16 = sub_10000DEE4((uint64_t)v9, a2);
    swift_bridgeObjectRelease();
    return (v16 & 1) == 0;
  }
  unint64_t v4 = v3;
  sub_100025E48();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v6 = result;
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v17 = a2;
  if (!v6)
  {
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
LABEL_18:
    swift_bridgeObjectRelease_n();
    a2 = v17;
    goto LABEL_19;
  }
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v10 = *(id *)(v5 + 8 * v8 + 32);
      }
      id v11 = v10;
      id v12 = [v10 handleString];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      Swift::String v13 = String.lowercased()();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_10001CD98(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v15 = *((void *)v9 + 2);
      unint64_t v14 = *((void *)v9 + 3);
      if (v15 >= v14 >> 1) {
        uint64_t v9 = sub_10001CD98((char *)(v14 > 1), v15 + 1, 1, v9);
      }
      ++v8;
      *((void *)v9 + 2) = v15 + 1;
      *(Swift::String *)&v9[16 * v15 + 32] = v13;
    }
    while (v6 != v8);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002593C()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  Logger.ifError(_:message:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100025A20(uint64_t a1)
{
  return sub_1000254E8(*(void *)a1, *(void **)(a1 + 8));
}

uint64_t sub_100025A50()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v14 = v0;
    uint64_t v8 = (uint8_t *)v7;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v13 = v1;
    *(_DWORD *)uint64_t v8 = 136315138;
    id v12 = v8 + 4;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    uint64_t v15 = sub_10002A278(v9, v10, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v13);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

void *sub_100025C98(unint64_t a1, void *a2)
{
  unint64_t v4 = a1;
  uint64_t v17 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      unint64_t v7 = v4 & 0xC000000000000001;
      uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v14 = v5;
      unint64_t v15 = v4;
      while (v7)
      {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        unint64_t v10 = v9;
        unint64_t v11 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_17;
        }
        id v16 = v9;
        char v12 = sub_100025720(&v16, (uint64_t)a2);
        if (v2)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return a2;
        }
        if (v12)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          uint64_t v5 = v14;
          unint64_t v4 = v15;
        }
        else
        {
        }
        ++v6;
        if (v11 == v5)
        {
          a2 = v17;
          goto LABEL_20;
        }
      }
      if (v6 < *(void *)(v8 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      if (!v5) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v6 + 32);
    goto LABEL_9;
  }
LABEL_19:
  a2 = _swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return a2;
}

uint64_t sub_100025E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100025E40()
{
  return swift_release();
}

unint64_t sub_100025E48()
{
  unint64_t result = qword_1000673F8;
  if (!qword_1000673F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000673F8);
  }
  return result;
}

uint64_t sub_100025E88()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100025EC0(uint64_t a1, uint64_t a2)
{
  return sub_100024E84(a1, a2, *(void (**)(uint64_t, void))(v2 + 16));
}

uint64_t sub_100025ED0()
{
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *(void *)(v0 + 104);
  *(void *)(v0 + 104) = 0x8000000000000000;
  sub_100007E8C((uint64_t)sub_100026FCC, v1, 0xD00000000000002DLL, 0x8000000100056B40, isUniquelyReferenced_nonNull_native);
  *(void *)(v0 + 104) = v8;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  swift_retain();
  char v4 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(void *)(v0 + 104);
  *(void *)(v0 + 104) = 0x8000000000000000;
  sub_100007E8C((uint64_t)sub_100026FD4, v3, 0xD00000000000001FLL, 0x8000000100056B70, v4);
  *(void *)(v0 + 104) = v9;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  swift_retain();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v0 + 104);
  *(void *)(v0 + 104) = 0x8000000000000000;
  sub_100007E8C((uint64_t)sub_100026FDC, v5, 0xD000000000000035, 0x8000000100056B90, v6);
  *(void *)(v0 + 104) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_100026124(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    sub_1000070B0(&qword_100066C08);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100054670;
    *(void *)(inited + 32) = static PeopleConstants.singleContactWidgetKind.getter();
    *(void *)(inited + 40) = v5;
    *(void *)(inited + 48) = static PeopleConstants.multipleContactsWidgetKind.getter();
    *(void *)(inited + 56) = v6;
    uint64_t v7 = *sub_1000070F4(a1, a1[3]);
    v13[3] = &type metadata for XPCEvent;
    v13[4] = &off_100062478;
    v13[0] = v7;
    uint64_t v8 = *(void *)(inited + 32);
    uint64_t v9 = *(void *)(inited + 40);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    swift_bridgeObjectRetain();
    sub_100026AEC(&v11, (uint64_t)v13, v3);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(inited + 56);
    uint64_t v11 = *(void *)(inited + 48);
    uint64_t v12 = v10;
    swift_bridgeObjectRetain();
    sub_100026AEC(&v11, (uint64_t)v13, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000900C((uint64_t)v13);
    swift_setDeallocating();
    swift_arrayDestroy();
    return swift_release();
  }
  return result;
}

uint64_t sub_100026280(void *a1)
{
  uint64_t v2 = type metadata accessor for PeopleFeatureFlagNames();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for PeopleFeatureFlagNames.calendarStatus(_:), v2);
    char v8 = dispatch thunk of FeatureFlagsProvider.isEnabled(_:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v8)
    {
      sub_1000070B0(&qword_100066C08);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100054670;
      *(void *)(inited + 32) = static PeopleConstants.singleContactWidgetKind.getter();
      *(void *)(inited + 40) = v10;
      *(void *)(inited + 48) = static PeopleConstants.multipleContactsWidgetKind.getter();
      *(void *)(inited + 56) = v11;
      uint64_t v12 = *sub_1000070F4(a1, a1[3]);
      v19[3] = &type metadata for XPCEvent;
      v19[4] = &off_100062478;
      v19[0] = v12;
      uint64_t v13 = *(void *)(inited + 32);
      uint64_t v14 = *(void *)(inited + 40);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = v13;
      uint64_t v18 = v14;
      swift_bridgeObjectRetain();
      sub_100026AEC(&v17, (uint64_t)v19, v7);
      swift_bridgeObjectRelease();
      uint64_t v15 = *(void *)(inited + 56);
      uint64_t v17 = *(void *)(inited + 48);
      uint64_t v18 = v15;
      swift_bridgeObjectRetain();
      sub_100026AEC(&v17, (uint64_t)v19, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10000900C((uint64_t)v19);
      swift_release();
      swift_setDeallocating();
      return swift_arrayDestroy();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1000264B8(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    long long v10 = xmmword_100053F00;
    uint64_t v4 = static PeopleConstants.singleContactWidgetKind.getter();
    uint64_t v6 = v5;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    uint64_t v7 = *sub_1000070F4(a1, a1[3]);
    v9[3] = &type metadata for XPCEvent;
    v9[4] = &off_100062478;
    v8[1] = v6;
    v9[0] = v7;
    v8[0] = v4;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_100026AEC(v8, (uint64_t)v9, v3);
    swift_bridgeObjectRelease();
    sub_10000900C((uint64_t)v9);
    swift_arrayDestroy();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000265B4()
{
  sub_100025ED0();
  uint64_t v0 = swift_allocObject();
  swift_weakInit();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = sub_100026AE4;
  *(void *)(v1 + 24) = v0;
  v4[4] = sub_100026F4C;
  v4[5] = v1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_100026F54;
  v4[3] = &unk_100062450;
  uint64_t v2 = _Block_copy(v4);
  swift_retain_n();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v2);
  _Block_release(v2);
  return swift_release_n();
}

uint64_t sub_1000266D4(void *a1)
{
  unint64_t v2 = 0xD000000000000021;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  sub_100008758((uint64_t)a1, (uint64_t)v29);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v25 = v3;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v28[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    long long v10 = (xpc_object_t *)sub_1000070F4(v29, v29[3]);
    string = xpc_dictionary_get_string(*v10, _xpc_event_key_name);
    os_log_type_t v26 = a1;
    if (string)
    {
      unint64_t v12 = String.init(cString:)();
      unint64_t v14 = v13;
    }
    else
    {
      unint64_t v14 = 0x8000000100056B10;
      unint64_t v12 = 0xD000000000000021;
    }
    uint64_t v27 = sub_10002A278(v12, v14, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000900C((uint64_t)v29);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Received event %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v25);
    a1 = v26;
    unint64_t v2 = 0xD000000000000021;
  }
  else
  {
    sub_10000900C((uint64_t)v29);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v17 = (xpc_object_t *)sub_1000070F4(a1, a1[3]);
    if (xpc_dictionary_get_string(*v17, _xpc_event_key_name))
    {
      unint64_t v2 = String.init(cString:)();
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v19 = 0x8000000100056B10;
    }
    swift_beginAccess();
    uint64_t v20 = *(void *)(v16 + 104);
    swift_bridgeObjectRetain();
    swift_release();
    if (*(void *)(v20 + 16) && (unint64_t v21 = sub_1000071E4(v2, v19), (v22 & 1) != 0))
    {
      long long v23 = *(void (**)(void *))(*(void *)(v20 + 56) + 16 * v21);
      swift_retain_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23(a1);
      return swift_release_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_100026A38()
{
  sub_10000900C(v0 + 16);
  sub_10000900C(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCEventObserver()
{
  return self;
}

uint64_t sub_100026AAC()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026AE4(void *a1)
{
  return sub_1000266D4(a1);
}

uint64_t sub_100026AEC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v33 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = *a1;
  unint64_t v13 = (void *)a1[1];
  static PeopleLogger.daemon.getter();
  sub_100008758(a2, (uint64_t)v36);
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  int v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, (os_log_type_t)v15);
  uint64_t v32 = v12;
  if (v16)
  {
    int v30 = v15;
    uint64_t v31 = a3;
    uint64_t v29 = v6;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_10002A278(v12, (unint64_t)v13, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v18 = (xpc_object_t *)sub_1000070F4(v36, v37);
    if (xpc_dictionary_get_string(*v18, _xpc_event_key_name))
    {
      unint64_t v19 = String.init(cString:)();
      unint64_t v21 = v20;
    }
    else
    {
      unint64_t v21 = 0x8000000100056B10;
      unint64_t v19 = 0xD000000000000021;
    }
    uint64_t v38 = sub_10002A278(v19, v21, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000900C((uint64_t)v36);
    _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v30, "reloading timelines of kind: %s due to xpc event: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    char v22 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v6 = v29;
    v22(v11, v29);
    a3 = v31;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_10000900C((uint64_t)v36);

    char v22 = *(void (**)(char *, uint64_t))(v7 + 8);
    v22(v11, v6);
  }
  sub_1000070F4((void *)(a3 + 56), *(void *)(a3 + 80));
  static PeopleConstants.widgetBundleID.getter();
  uint64_t v23 = v32;
  dispatch thunk of TimelineControllerFactoryProtocol.timelineController(for:in:)();
  swift_bridgeObjectRelease();
  sub_1000070F4(v36, v37);
  dispatch thunk of TimelineControllerProtocol.reloadTimeline()();
  uint64_t v24 = v33;
  static PeopleLogger.daemon.getter();
  uint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  _StringGuts.grow(_:)(47);
  swift_bridgeObjectRelease();
  uint64_t v34 = 0xD000000000000023;
  unint64_t v35 = 0x8000000100056BD0;
  v25._countAndFlagsBits = v23;
  v25._object = v13;
  String.append(_:)(v25);
  v26._countAndFlagsBits = 0x203A726F72726520;
  v26._object = (void *)0xEA00000000004025;
  String.append(_:)(v26);
  Logger.ifError(_:message:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  v22(v24, v6);
  return sub_10000900C((uint64_t)v36);
}

uint64_t sub_100026F14()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026F4C(void *a1)
{
  return sub_10003B200(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100026F54(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_100026FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100026FC4()
{
  return swift_release();
}

uint64_t sub_100026FCC(void *a1)
{
  return sub_100026124(a1);
}

uint64_t sub_100026FD4(void *a1)
{
  return sub_100026280(a1);
}

uint64_t sub_100026FDC(void *a1)
{
  return sub_1000264B8(a1);
}

ValueMetadata *type metadata accessor for XPCEvent()
{
  return &type metadata for XPCEvent;
}

void sub_100026FF8()
{
  type metadata accessor for StatusType();
  if (v0 <= 0x3F)
  {
    sub_1000158A8();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t sub_1000270CC()
{
  uint64_t v1 = v0 + qword_100069C10;
  uint64_t v2 = type metadata accessor for StatusType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000900C(v0 + qword_100069C18);
  uint64_t v3 = v0 + qword_100069C20;
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000900C(v0 + qword_100069C28);
  return v0;
}

uint64_t sub_100027198()
{
  sub_1000270CC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FamilyStatusEventProcessor()
{
  return sub_100027248();
}

unint64_t sub_100027208()
{
  unint64_t result = qword_100066E70;
  if (!qword_100066E70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100066E70);
  }
  return result;
}

uint64_t sub_100027248()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100027278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[11] = a5;
  v6[12] = v5;
  v6[9] = a3;
  v6[10] = a4;
  v6[7] = a1;
  v6[8] = a2;
  sub_1000070B0(&qword_100067748);
  v6[13] = swift_task_alloc();
  uint64_t v7 = sub_1000070B0((uint64_t *)&unk_100067650);
  v6[14] = v7;
  v6[15] = *(void *)(v7 - 8);
  v6[16] = swift_task_alloc();
  sub_1000070B0(&qword_100067758);
  v6[17] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MessageDetails();
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  return _swift_task_switch(sub_100027400, 0, 0);
}

uint64_t sub_100027400()
{
  sub_1000070F4(*(void **)(v0 + 88), *(void *)(*(void *)(v0 + 88) + 24));
  if (dispatch thunk of MessageConduitProtocol.enabledOnPlatform.getter())
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v0 + 96);
    uint64_t v3 = OBJC_IVAR____TtC7peopled20RequestMessageSender_messageConduit;
    *(void *)(v0 + 168) = OBJC_IVAR____TtC7peopled20RequestMessageSender_messageConduit;
    sub_100008758(v1, v2 + v3);
    type metadata accessor for RequestMessageDetailsBuilder();
    swift_allocObject();
    *(void *)(v0 + 176) = RequestMessageDetailsBuilder.init()();
    id v4 = [self hours];
    sub_100027208();
    Measurement.init(value:unit:)();
    uint64_t v5 = type metadata accessor for ContactFetcher();
    *(void *)(v0 + 16) = static ContactFetcher.shared.getter();
    *(void *)(v0 + 40) = v5;
    *(void *)(v0 + 48) = &protocol witness table for ContactFetcher;
    unint64_t v19 = (char *)&async function pointer to dispatch thunk of RequestMessageDetailsBuilder.fromPersistence(_:eventID:useFamilyCache:resolveAppBundleInfo:maxAge:withContactFetcher:)
        + async function pointer to dispatch thunk of RequestMessageDetailsBuilder.fromPersistence(_:eventID:useFamilyCache:resolveAppBundleInfo:maxAge:withContactFetcher:);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v6;
    void *v6 = v0;
    v6[1] = sub_100027700;
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 136);
    uint64_t v10 = *(void *)(v0 + 64);
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 56);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t))v19)(v7, v9, v11, v10, 0, 0, v8, v0 + 16);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 72);
    uint64_t v13 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    uint64_t v15 = type metadata accessor for ResolvedFamily();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
    uint64_t v16 = type metadata accessor for MessageDetails.EventSource();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v14, v16);
    uint64_t v17 = *(void *)(v0 + 88);
    type metadata accessor for RequestMessageSender();
    swift_deallocPartialClassInstance();
    sub_10000900C(v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

uint64_t sub_100027700()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = *v1 + 16;
  swift_task_dealloc();
  uint64_t v4 = v2[16];
  uint64_t v5 = v2[15];
  uint64_t v6 = v2[14];
  if (v0)
  {
    swift_errorRelease();
    sub_10000900C(v3);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = sub_1000278AC;
  }
  else
  {
    sub_10000900C(v3);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = sub_100027AD0;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000278AC()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[7];
  uint64_t v4 = (void *)v0[8];
  uint64_t v6 = v0[12] + v0[21];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[19] + 56))(v1, 1, 1, v0[18]);
  sub_10001223C(v1, &qword_100067758);
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = v5;
  v7._object = v4;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  static PeopleErrors.createError(_:code:)();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_release();
  uint64_t v8 = type metadata accessor for ResolvedFamily();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v3, v8);
  uint64_t v9 = type metadata accessor for MessageDetails.EventSource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v2, v9);
  sub_10000900C(v6);
  uint64_t v10 = v0[11];
  type metadata accessor for RequestMessageSender();
  swift_deallocPartialClassInstance();
  sub_10000900C(v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100027AD0()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[13];
  uint64_t v15 = v0[12];
  uint64_t v6 = v0[10];
  uint64_t v16 = v0[11];
  uint64_t v14 = v0[9];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  swift_bridgeObjectRelease();
  Swift::String v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  v7(v1, v3, v4);
  uint64_t v8 = type metadata accessor for ResolvedFamily();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v5, v6, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  MessageDetails.family.setter();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
  uint64_t v10 = type metadata accessor for MessageDetails.EventSource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v14, v10);
  v7(v15 + OBJC_IVAR____TtC7peopled20RequestMessageSender_details, v1, v4);
  sub_10000900C(v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = v0[12];
  return v11(v12);
}

uint64_t sub_100027CE8()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_1000070B0(&qword_100067748);
  v1[6] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for MessageDetails();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_100027E44, 0, 0);
}

uint64_t sub_100027E44()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[2] + OBJC_IVAR____TtC7peopled20RequestMessageSender_details;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v1, v5, v2);
  MessageDetails.family.getter();
  Swift::String v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[11] = v7;
  v0[12] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v1, v2);
  uint64_t v8 = type metadata accessor for ResolvedFamily();
  LODWORD(v1) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8);
  sub_10001223C(v4, &qword_100067748);
  if (v1 == 1)
  {
    uint64_t v9 = static PeopleErrors.createError(_:code:)();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
    return v10(v9);
  }
  else
  {
    uint64_t v12 = v0[9];
    uint64_t v13 = v0[7];
    uint64_t v14 = (void *)(v0[2] + OBJC_IVAR____TtC7peopled20RequestMessageSender_messageConduit);
    uint64_t v15 = v14[3];
    uint64_t v16 = v14[4];
    sub_1000070F4(v14, v15);
    v6(v12, v5, v13);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[13] = v17;
    void *v17 = v0;
    v17[1] = sub_100028088;
    uint64_t v18 = v0[9];
    return dispatch thunk of MessageConduitProtocol.sendMessage(details:)(v18, v15, v16);
  }
}

uint64_t sub_100028088(uint64_t a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 88);
  uint64_t v3 = *(void *)(*(void *)v1 + 72);
  uint64_t v4 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  v2(v3, v4);
  return _swift_task_switch(sub_1000281F0, 0, 0);
}

uint64_t sub_1000281F0()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  static PeopleLogger.messages.getter();
  Logger.ifError(_:message:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[14];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_1000282CC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7peopled20RequestMessageSender_details;
  uint64_t v2 = type metadata accessor for MessageDetails();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled20RequestMessageSender_messageConduit);
  return swift_deallocClassInstance();
}

uint64_t sub_10002837C()
{
  return type metadata accessor for RequestMessageSender();
}

uint64_t type metadata accessor for RequestMessageSender()
{
  uint64_t result = qword_100067690;
  if (!qword_100067690) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000283D0()
{
  uint64_t result = type metadata accessor for MessageDetails();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100028468()
{
  uint64_t result = static PeopleErrors.createError(_:code:)();
  qword_100069C38 = result;
  return result;
}

id sub_1000284A8()
{
  if (qword_100066718 != -1) {
    swift_once();
  }
  id v0 = objc_allocWithZone((Class)type metadata accessor for PeopleIndexingClient());
  uint64_t v1 = swift_retain();
  id result = sub_10002851C(v1);
  qword_100069C40 = (uint64_t)result;
  return result;
}

id sub_10002851C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC7peopled20PeopleIndexingClient_statusManager] = a1;
  uint64_t v7 = (objc_class *)type metadata accessor for PeopleIndexingClient();
  v14.receiver = v1;
  v14.super_class = v7;
  swift_retain();
  id v8 = objc_msgSendSuper2(&v14, "init");
  static PeopleConstants.peopleReindexRegistration.getter();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  SpotlightDaemonClientRegister();

  static PeopleLogger.daemon.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "PeopleIndexingClient: SpotlightDaemonClientRegister completed.", v12, 2u);
    swift_slowDealloc();
  }
  swift_release();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

uint64_t PeopleIndexingClient.provideData(forBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void, unint64_t, uint64_t))
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  objc_super v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Unimplemented SpotlightDaemonClient method!", v16, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (qword_100066728 != -1) {
    swift_once();
  }
  return a10(0, 0xF000000000000000, qword_100069C38);
}

uint64_t PeopleIndexingClient.provideFileURL(forBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(char *, uint64_t))
{
  uint64_t v10 = sub_1000070B0(&qword_100067760);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unimplemented SpotlightDaemonClient method!", v19, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v20 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
  if (qword_100066728 != -1) {
    swift_once();
  }
  a10(v12, qword_100069C38);
  return sub_10001223C((uint64_t)v12, &qword_100067760);
}

void sub_100028AF0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, void *aBlock, void (*a9)(void *))
{
  uint64_t v10 = _Block_copy(aBlock);
  _Block_copy(v10);
  id v11 = a1;
  a9(v10);
  _Block_release(v10);
  _Block_release(v10);
}

uint64_t PeopleIndexingClient.reindexAllItems(for:protectionClass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  return _swift_task_switch(sub_100028C34, 0, 0);
}

uint64_t sub_100028C34()
{
  uint64_t v19 = v0;
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v15 = v0[9];
    uint64_t v16 = v0[8];
    uint64_t v17 = v0[10];
    unint64_t v3 = v0[4];
    uint64_t v4 = v0[3];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_10002A278(v4, v3, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "PeopleIndexingClient reindexAllItems for %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v7 = v0[9];
    uint64_t v6 = v0[10];
    uint64_t v8 = v0[8];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  NSString v9 = (void *)swift_task_alloc();
  v0[11] = v9;
  *NSString v9 = v0;
  v9[1] = sub_100028E88;
  uint64_t v10 = v0[5];
  uint64_t v11 = v0[6];
  uint64_t v13 = v0[3];
  uint64_t v12 = v0[4];
  return sub_10000BE24(v13, v12, (uint64_t)_swiftEmptyArrayStorage, v10, v11);
}

uint64_t sub_100028E88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002911C(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v4[4] = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v4[5] = v10;
  a4;
  uint64_t v12 = (void *)swift_task_alloc();
  void v4[6] = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_100029218;
  return PeopleIndexingClient.reindexAllItems(for:protectionClass:)(v6, v8, v9, v11);
}

uint64_t sub_100029218()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  os_log_type_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t PeopleIndexingClient.reindexItems(for:bundleID:protectionClass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  uint64_t v7 = type metadata accessor for Logger();
  v6[11] = v7;
  v6[12] = *(void *)(v7 - 8);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  return _swift_task_switch(sub_100029468, 0, 0);
}

uint64_t sub_100029468()
{
  uint64_t v34 = v0;
  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v29 = v0[12];
    uint64_t v31 = v0[11];
    uint64_t v32 = v0[14];
    uint64_t v3 = v0[6];
    unint64_t v4 = v0[7];
    uint64_t v5 = v0[5];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    v0[3] = sub_10002A278(v3, v4, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2048;
    uint64_t v7 = *(void *)(v5 + 16);
    swift_bridgeObjectRelease();
    v0[4] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "PeopleIndexingClient reindexAllItems for %s for %ld ids", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v8(v32, v31);
  }
  else
  {
    uint64_t v9 = v0[14];
    uint64_t v10 = v0[11];
    uint64_t v11 = v0[12];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v8(v9, v10);
  }
  if (*(void *)(v0[5] + 16))
  {
    uint64_t v12 = (void *)swift_task_alloc();
    v0[15] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_1000298D8;
    uint64_t v13 = v0[8];
    uint64_t v14 = v0[9];
    uint64_t v16 = v0[6];
    uint64_t v15 = v0[7];
    uint64_t v17 = v0[5];
    return sub_10000BE24(v16, v15, v17, v13, v14);
  }
  else
  {
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = v0[13];
    uint64_t v23 = v0[11];
    unint64_t v24 = v0[7];
    if (v21)
    {
      uint64_t v25 = v0[6];
      uint64_t v30 = v0[13];
      Swift::String v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)Swift::String v26 = 136315138;
      swift_bridgeObjectRetain();
      v0[2] = sub_10002A278(v25, v24, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Reindex for %s provided empty id array.", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v27 = v30;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v27 = v22;
    }
    v8(v27, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = (uint64_t (*)(void))v0[1];
    return v28();
  }
}

uint64_t sub_1000298D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100029B9C(int a1, int a2, int a3, void *aBlock, void *a5)
{
  long long v5[2] = a5;
  v5[3] = _Block_copy(aBlock);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5[4] = v7;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v5[5] = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  v5[6] = v12;
  a5;
  uint64_t v14 = (void *)swift_task_alloc();
  v5[7] = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_100029CC0;
  return PeopleIndexingClient.reindexItems(for:bundleID:protectionClass:)(v7, v8, v10, v11, v13);
}

uint64_t sub_100029CC0()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  os_log_type_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id PeopleIndexingClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void PeopleIndexingClient.init()()
{
}

id PeopleIndexingClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeopleIndexingClient();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100029F34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100023ED4;
  return v6();
}

uint64_t sub_10002A000(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100023ED4;
  return v7();
}

uint64_t sub_10002A0CC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10001223C(a1, &qword_100066A38);
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

uint64_t sub_10002A278(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002A34C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100011E70((uint64_t)v12, *a3);
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
      sub_100011E70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000900C((uint64_t)v12);
  return v7;
}

uint64_t sub_10002A34C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10002A508(a5, a6);
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

uint64_t sub_10002A508(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002A5A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002A718(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002A718(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002A5A0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100015C54(v2, 0);
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

uint64_t sub_10002A718(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000070B0(&qword_100066FA0);
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

uint64_t type metadata accessor for PeopleIndexingClient()
{
  return self;
}

uint64_t sub_10002A88C()
{
  _Block_release(*(const void **)(v0 + 40));
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002A8E4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  unint64_t v6 = (void *)v0[6];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_100008F18;
  int64_t v8 = (uint64_t (*)(int, int, int, void *, void *))((char *)&dword_100067808 + dword_100067808);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_10002A9B0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100023ED4;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100067818 + dword_100067818);
  return v6(v2, v3, v4);
}

uint64_t sub_10002AA74(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100023ED4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100067828 + dword_100067828);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10002AB40()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002AB78(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008F18;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100067838 + dword_100067838);
  return v6(a1, v4);
}

uint64_t sub_10002AC30()
{
  _Block_release(*(const void **)(v0 + 32));
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002AC80()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100023ED4;
  int64_t v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_100067848 + dword_100067848);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10002AD48()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_10002AD88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unimplemented SpotlightDaemonClient method!", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_100066728 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)_convertErrorToNSError(_:)();
  (*(void (**)(uint64_t, void, void *))(a1 + 16))(a1, 0, v9);
}

uint64_t sub_10002AF24(uint64_t a1)
{
  uint64_t v2 = sub_1000070B0(&qword_100067760);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_log_type_t v7 = (char *)&v22 - v6;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  size_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Unimplemented SpotlightDaemonClient method!", v14, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v7, 1, 1, v15);
  if (qword_100066728 != -1) {
    swift_once();
  }
  sub_10002B204((uint64_t)v7, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v15) == 1)
  {
    uint64_t v18 = 0;
  }
  else
  {
    URL._bridgeToObjectiveC()(v17);
    uint64_t v18 = v19;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v15);
  }
  os_log_type_t v20 = (void *)_convertErrorToNSError(_:)();
  (*(void (**)(uint64_t, void *, void *))(a1 + 16))(a1, v18, v20);

  return sub_10001223C((uint64_t)v7, &qword_100067760);
}

uint64_t sub_10002B204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100067760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B26C()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_listener))
  {
    _print_unlocked<A, B>(_:_:)();
    uint64_t v2 = 0;
    uint64_t v1 = (void *)0xE000000000000000;
  }
  else
  {
    uint64_t v1 = (void *)0xE300000000000000;
    uint64_t v2 = 4271950;
  }
  _StringGuts.grow(_:)(51);
  v3._object = (void *)0x8000000100057000;
  v3._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 0x6E657473696C0A2CLL;
  v4._object = (void *)0xEC000000203A7265;
  String.append(_:)(v4);
  v5._countAndFlagsBits = v2;
  v5._object = v1;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 10506;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  return 0;
}

uint64_t sub_10002B3A4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PeopleUserDefaults();
  size_t v11 = (void *)static PeopleUserDefaults.shared.getter();
  NSString v12 = String._bridgeToObjectiveC()();
  unsigned int v13 = [v11 BOOLForKey:v12];

  if (v13)
  {
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 1, 1, v14);
    uint64_t v15 = (void *)swift_allocObject();
    long long v15[2] = 0;
    v15[3] = 0;
    v15[4] = a1;
    id v16 = a1;
    sub_10002C210((uint64_t)v10, (uint64_t)&unk_1000679B8, (uint64_t)v15);
    swift_release();
  }
  else
  {
    static PeopleLogger.daemon.getter();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "AskTo enabled for Screen Time, people bowing out", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  BOOL v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v2;
  v21[5] = a1;
  id v22 = a1;
  swift_retain();
  sub_100016DD8((uint64_t)v10, (uint64_t)&unk_1000679A8, (uint64_t)v21);
  swift_release();
  sub_1000070B0(&qword_100066A40);
  swift_allocObject();
  return Promise.init(startBlock:)();
}

uint64_t sub_10002B6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a4;
  uint64_t v5 = type metadata accessor for MessageDetails.EventSource();
  v4[13] = v5;
  v4[14] = *(void *)(v5 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v4[16] = v6;
  v4[17] = *(void *)(v6 - 8);
  v4[18] = swift_task_alloc();
  sub_1000070B0(&qword_100067748);
  v4[19] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for ResolvedFamily();
  v4[20] = v7;
  v4[21] = *(void *)(v7 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  return _swift_task_switch(sub_10002B8A0, 0, 0);
}

uint64_t sub_10002B8A0()
{
  uint64_t v1 = type metadata accessor for ContactFetcher();
  uint64_t v2 = static ContactFetcher.shared.getter();
  v0[5] = v1;
  v0[6] = &protocol witness table for ContactFetcher;
  v0[2] = v2;
  Swift::String v3 = (void *)swift_task_alloc();
  v0[24] = v3;
  *Swift::String v3 = v0;
  v3[1] = sub_10002B960;
  uint64_t v4 = v0[19];
  return static ResolvedFamily.getFamilyForLoggedInChild(withContactFetcher:)(v4, v0 + 2);
}

uint64_t sub_10002B960()
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  sub_10000900C(v2);
  if (v0) {
    Swift::String v3 = sub_10002C17C;
  }
  else {
    Swift::String v3 = sub_10002BA80;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002BA80()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[19];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_10001223C(v3, &qword_100067748);
    static PeopleLogger.daemon.getter();
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "ST send message task: no family found", v6, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
  else
  {
    uint64_t v9 = v0[23];
    uint64_t v23 = v0[22];
    uint64_t v10 = v0[14];
    uint64_t v11 = v0[15];
    NSString v12 = (void *)v0[12];
    uint64_t v13 = v0[13];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v9, v3, v1);
    id v14 = [v12 requestID];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v11, enum case for MessageDetails.EventSource.screenTime(_:), v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v23, v9, v1);
    uint64_t v18 = type metadata accessor for MessageConduit();
    swift_allocObject();
    uint64_t v19 = MessageConduit.init()();
    v0[10] = v18;
    v0[11] = &protocol witness table for MessageConduit;
    v0[7] = v19;
    type metadata accessor for RequestMessageSender();
    swift_allocObject();
    uint64_t v20 = (void *)swift_task_alloc();
    v0[26] = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_10002BD74;
    uint64_t v21 = v0[22];
    uint64_t v22 = v0[15];
    return sub_100027278(v15, v17, v22, v21, (uint64_t)(v0 + 7));
  }
}

uint64_t sub_10002BD74(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    return _swift_task_switch(sub_10002C0C4, 0, 0);
  }
  else
  {
    *(void *)(v4 + 216) = a1;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v4 + 224) = v6;
    void *v6 = v5;
    v6[1] = sub_10002BEFC;
    return sub_100027CE8();
  }
}

uint64_t sub_10002BEFC()
{
  swift_task_dealloc();
  swift_errorRelease();
  return _swift_task_switch(sub_10002C004, 0, 0);
}

uint64_t sub_10002C004()
{
  swift_release();
  (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10002C0C4()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10002C17C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002C210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10001223C(a1, &qword_100066A38);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_10002C398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  uint64_t v6 = sub_1000070B0((uint64_t *)&unk_100067650);
  v5[5] = v6;
  v5[6] = *(void *)(v6 - 8);
  v5[7] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for StatusType();
  v5[8] = v7;
  v5[9] = *(void *)(v7 - 8);
  v5[10] = swift_task_alloc();
  return _swift_task_switch(sub_10002C4B8, 0, 0);
}

uint64_t sub_10002C4B8()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v14 = v0[6];
  uint64_t v15 = v0[5];
  NSString v12 = (void *)v0[4];
  uint64_t v13 = v0[3];
  uint64_t v5 = enum case for StatusType.screenTimeRequest(_:);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  v6(v1, enum case for StatusType.screenTimeRequest(_:), v4);
  id v7 = [self screenTimeRequestStream];
  sub_1000070B0(&qword_100067970);
  swift_allocObject();
  v0[2] = BiomeStreamReader.init(statusType:readerStream:)();
  v6(v1, v5, v4);
  static PeopleConstants.screenTimeRequestEventTTL.getter();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v12;
  *(void *)(v8 + 24) = v13;
  sub_10002ECEC();
  id v9 = v12;
  swift_retain();
  dispatch thunk of EventCollectorProtocol.collectEvents(statusType:maxAge:completion:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v15);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

unint64_t sub_10002C6AC(unint64_t a1, void *a2, char *a3)
{
  long long v49 = a3;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v49 - v9;
  *(void *)&v52[0] = _swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_20;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_44;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      self;
      if (swift_dynamicCastObjCClass())
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((*(void *)&v52[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)&v52[0] & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != v11; ++j)
    {
      self;
      if (swift_dynamicCastObjCClass())
      {
        swift_unknownObjectRetain();
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((*(void *)&v52[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)&v52[0] & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
  }
LABEL_20:
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)&v52[0];
  if (!(*(void *)&v52[0] >> 62))
  {
    uint64_t v15 = *(void *)((*(void *)&v52[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_22;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_38;
  }
LABEL_22:
  unint64_t result = v15 - 1;
  if (__OFSUB__(v15, 1))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if ((v14 & 0xC000000000000001) != 0)
  {
LABEL_45:
    id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_27;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_47;
  }
  if (result >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_47:
    __break(1u);
    return result;
  }
  id v17 = *(id *)(v14 + 8 * result + 32);
LABEL_27:
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  id v19 = [v18 requestID];
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  id v23 = [a2 requestID];
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;

  if (v20 == v24 && v22 == v26)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
LABEL_32:

LABEL_39:
      static PeopleLogger.daemon.getter();
      uint64_t v40 = a2;
      uint64_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v43 = 138412290;
        *(void *)&v52[0] = v40;
        uint64_t v45 = v40;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v44 = v40;

        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Indexing ST %@", v43, 0xCu);
        sub_1000070B0(&qword_100066A58);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v41 = v40;
      }

      (*(void (**)(char *, uint64_t))(v50 + 8))(v8, v51);
      long long v46 = v49;
      sub_100008758((uint64_t)&v49[OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_indexer], (uint64_t)v52);
      uint64_t v47 = swift_allocObject();
      *(void *)(v47 + 16) = v40;
      *(void *)(v47 + 24) = v46;
      sub_1000087BC(v52, v47 + 32);
      *(unsigned char *)(v47 + 72) = 1;
      sub_1000070B0(&qword_100066A40);
      swift_allocObject();
      uint64_t v48 = v40;
      swift_retain();
      Promise.init(startBlock:)();
      return swift_release();
    }
  }
  sub_10001210C(0, &qword_100067150);
  if (static NSObject.== infix(_:_:)()) {
    goto LABEL_32;
  }
  static PeopleLogger.daemon.getter();
  id v28 = a2;
  id v29 = v18;
  id v30 = v28;
  uint64_t v31 = v29;
  long long v49 = v10;
  uint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 138412546;
    *(void *)&v52[0] = v30;
    id v36 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v35 = v30;

    *(_WORD *)(v34 + 12) = 2112;
    *(void *)&v52[0] = v31;
    uint64_t v37 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v35[1] = v31;

    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Dropping %@ since prior event sorted higher %@", (uint8_t *)v34, 0x16u);
    sub_1000070B0(&qword_100066A58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v32 = v31;
  }
  uint64_t v39 = v50;
  uint64_t v38 = v51;

  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v49, v38);
}

uint64_t sub_10002CDF4(uint64_t (*a1)(uint64_t *))
{
  uint64_t v2 = 0;
  char v3 = 0;
  return a1(&v2);
}

uint64_t sub_10002CE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  type metadata accessor for PeopleBiomeEventIndexer();
  uint64_t v11 = type metadata accessor for AppBundleResolver();
  swift_retain();
  void v14[3] = v11;
  v14[4] = &protocol witness table for AppBundleResolver;
  v14[0] = AppBundleResolver.__allocating_init()();
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a6;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = sub_100016C6C;
  *(void *)(v12 + 40) = v10;
  swift_retain();
  static PeopleBiomeEventIndexer.indexEvent(screenTimeRequest:bundleResolver:withContactFetcher:withIndexer:completion:)();
  swift_release();
  return sub_10000900C((uint64_t)v14);
}

uint64_t sub_10002CF64(uint64_t a1, char a2, char a3, uint64_t a4, NSObject *a5, uint64_t a6)
{
  uint64_t v77 = a6;
  uint64_t v11 = type metadata accessor for StatusType();
  uint64_t v75 = *(void *)(v11 - 8);
  uint64_t v76 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v78 = v14;
  uint64_t v79 = v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v68 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)&v68 - v22;
  uint64_t v24 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    id v74 = a5;
    uint64_t v27 = *(void *)(a1 + 16);
    if (v27)
    {
      if (a3)
      {
        uint64_t v28 = a4;
        Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
        swift_bridgeObjectRetain();
        if (Strong)
        {
          sub_100020AD0(a4, a1, Strong);
          swift_unknownObjectRelease();
        }
        uint64_t v30 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v26, 1, 1, v30);
        uint64_t v31 = swift_allocObject();
        *(void *)(v31 + 16) = 0;
        *(void *)(v31 + 24) = 0;
        sub_100016DD8((uint64_t)v26, (uint64_t)&unk_100067998, v31);
        swift_release();
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v28 = a4;
      }
      os_log_type_t v53 = v13;
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      uint64_t v61 = Logger.logObject.getter();
      os_log_type_t v62 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v61, v62))
      {
        os_log_type_t v63 = (uint8_t *)swift_slowAlloc();
        os_log_t v71 = (os_log_t)swift_slowAlloc();
        os_log_t v81 = v71;
        uint64_t v73 = v28;
        *(_DWORD *)os_log_type_t v63 = 136315138;
        unint64_t v69 = v63 + 4;
        int v70 = v63;
        uint64_t v55 = v76;
        uint64_t v64 = v13;
        uint64_t v57 = v75;
        (*(void (**)(char *, void, uint64_t))(v75 + 104))(v64, enum case for StatusType.screenTimeRequest(_:), v76);
        sub_10002ED48(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v65 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v72 = v27;
        unint64_t v67 = v66;
        (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v55);
        uint64_t v80 = sub_10002A278(v65, v67, (uint64_t *)&v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s event consume complete", v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v79 + 8))(v23, v78);
        goto LABEL_16;
      }

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v23, v78);
    }
    else
    {
      swift_bridgeObjectRetain();
      static PeopleLogger.daemon.getter();
      swift_retain_n();
      uint64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.debug.getter();
      int v52 = v51;
      os_log_type_t v53 = v13;
      if (os_log_type_enabled(v50, v51))
      {
        LODWORD(v73) = v52;
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        os_log_t v71 = (os_log_t)swift_slowAlloc();
        os_log_t v81 = v71;
        int v70 = v54;
        *(_DWORD *)uint64_t v54 = 136315138;
        unint64_t v69 = v54 + 4;
        uint64_t v55 = v76;
        unint64_t v56 = v13;
        uint64_t v57 = v75;
        (*(void (**)(char *, void, uint64_t))(v75 + 104))(v56, enum case for StatusType.screenTimeRequest(_:), v76);
        sub_10002ED48(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
        uint64_t v58 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v72 = 0;
        unint64_t v60 = v59;
        (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v55);
        uint64_t v80 = sub_10002A278(v58, v60, (uint64_t *)&v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v73, "%s event consume complete w/o local contact", v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v79 + 8))(v21, v78);
LABEL_16:
        sub_100015E24(a1, 0);
LABEL_20:
        type metadata accessor for PeopleAnalytics();
        (*(void (**)(char *, void, uint64_t))(v57 + 104))(v53, enum case for StatusType.screenTimeRequest(_:), v55);
        static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
        (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v55);
        return ((uint64_t (*)(void, void))v74)(0, 0);
      }

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v21, v78);
    }
    sub_100015E24(a1, 0);
    uint64_t v57 = v75;
    uint64_t v55 = v76;
    goto LABEL_20;
  }
  swift_errorRetain();
  static PeopleLogger.daemon.getter();
  sub_100015E30(a1, 1);
  swift_retain();
  sub_100015E30(a1, 1);
  swift_retain();
  uint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.error.getter();
  int v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v35 = swift_slowAlloc();
    id v74 = swift_slowAlloc();
    os_log_t v81 = v74;
    *(_DWORD *)uint64_t v35 = 136315394;
    int v70 = (uint8_t *)(v35 + 4);
    uint64_t v73 = a4;
    uint64_t v36 = v75;
    uint64_t v37 = *(void (**)(char *, void, uint64_t))(v75 + 104);
    LODWORD(v72) = v34;
    uint64_t v38 = v13;
    uint64_t v39 = v13;
    uint64_t v40 = v76;
    v37(v39, enum case for StatusType.screenTimeRequest(_:), v76);
    sub_10002ED48(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
    os_log_t v71 = v32;
    uint64_t v42 = v41;
    unint64_t v44 = v43;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v40);
    uint64_t v80 = sub_10002A278(v42, v44, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    uint64_t v45 = a5;
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v46 = Error.localizedDescription.getter();
    uint64_t v80 = sub_10002A278(v46, v47, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100015E24(a1, 1);
    sub_100015E24(a1, 1);
    os_log_t v48 = v71;
    _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v72, "%s consume error: %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v78);
  }
  else
  {
    swift_release_n();
    sub_100015E24(a1, 1);
    sub_100015E24(a1, 1);

    (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v78);
    uint64_t v45 = a5;
  }
  swift_errorRetain();
  ((void (*)(uint64_t, uint64_t))v45)(a1, 1);
  sub_100015E24(a1, 1);
  return sub_100015E24(a1, 1);
}

uint64_t sub_10002D9A4()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_10002DA60, 0, 0);
}

uint64_t sub_10002DA60()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.screenTimeRequest(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_10002DB18(void *a1)
{
  return sub_10002B3A4(a1);
}

uint64_t sub_10002DB3C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v23 = a1;
  uint64_t v3 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v24[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v7 = type metadata accessor for StatusType();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v24[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v9);
  uint64_t v13 = &v24[-v12 - 8];
  uint64_t v14 = enum case for StatusType.screenTimeRequest(_:);
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  v15(&v24[-v12 - 8], enum case for StatusType.screenTimeRequest(_:), v7);
  sub_100008758(v2 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_contactFetcher, (uint64_t)v24);
  v15(v11, v14, v7);
  id v16 = [self screenTimeRequestStream];
  sub_1000070B0(&qword_100067970);
  swift_allocObject();
  uint64_t v17 = BiomeStreamReader.init(statusType:readerStream:)();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, v2 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_ttl, v3);
  sub_1000070B0(&qword_100067978);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = sub_10002E81C(v13, (uint64_t)v24, v17, (uint64_t)v6, v18);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v23;
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v21;
  sub_1000070B0(&qword_1000669E8);
  swift_allocObject();
  swift_bridgeObjectRetain();
  return Promise.init(startBlock:)();
}

uint64_t sub_10002DDFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_100022E04(v7);
  swift_bridgeObjectRelease();
  sub_1000070F4((void *)(a3 + qword_100069C18), *(void *)(a3 + qword_100069C18 + 24));
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v8[2] = a3;
  v8[3] = sub_100016C6C;
  void v8[4] = v6;
  swift_retain();
  swift_retain();
  dispatch thunk of FamilyMemberContactFetching.familyWithDSIDs(completion:)();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10002DF28()
{
  sub_10000905C(v0 + 16);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_ttl;
  uint64_t v2 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_indexer);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_contactFetcher);
  sub_10000900C(v0 + OBJC_IVAR____TtC7peopled22ScreenTimeStatusSource_messageConduit);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_10002E01C()
{
  return type metadata accessor for ScreenTimeStatusSource();
}

uint64_t type metadata accessor for ScreenTimeStatusSource()
{
  uint64_t result = qword_100067898;
  if (!qword_100067898) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002E070()
{
  sub_1000158A8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10002E130@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.screenTimeRequest(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_10002E1A4(uint64_t a1)
{
  uint64_t v2 = sub_10002ED48(&qword_100066D08, (void (*)(uint64_t))type metadata accessor for ScreenTimeStatusSource);
  return StatusSource.debugID.getter(a1, v2);
}

uint64_t sub_10002E210(uint64_t a1)
{
  return sub_10002DB3C(a1);
}

uint64_t sub_10002E234(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for StatusType();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  return _swift_task_switch(sub_10002E308, 0, 0);
}

void sub_10002E308()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[7];
  uint64_t v6 = enum case for StatusType.screenTimeRequest(_:);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[11] + 104);
  v7(v0[13], enum case for StatusType.screenTimeRequest(_:), v2);
  uint64_t v17 = swift_allocObject();
  v0[14] = v17;
  *(void *)(v17 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  v0[15] = v8;
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v3;
  v7(v1, v6, v2);
  uint64_t v9 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v10 = [v9 screenTimeRequestStream];
  uint64_t v11 = sub_1000070B0(&qword_100067970);
  swift_allocObject();
  uint64_t v12 = BiomeStreamReader.init(statusType:readerStream:)();
  v0[5] = v11;
  unint64_t v13 = sub_10002ECEC();
  v0[2] = v12;
  v0[6] = v13;
  uint64_t v15 = (char *)&async function pointer to dispatch thunk of ReindexCoordinator.reindex<A>(statusType:squashEvents:includeEvent:handleEvent:withReader:)
      + async function pointer to dispatch thunk of ReindexCoordinator.reindex<A>(statusType:squashEvents:includeEvent:handleEvent:withReader:);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[16] = v14;
  sub_10001210C(0, &qword_100067150);
  *uint64_t v14 = v0;
  v14[1] = sub_100018AE0;
  __asm { BR              X8 }
}

uint64_t sub_10002E55C(uint64_t a1)
{
  uint64_t v2 = sub_10001210C(0, &qword_100067150);
  return static BMStoreDataPeople.squashRequestEvents<A>(_:)(a1, v2);
}

uint64_t sub_10002E5AC(void *a1, uint64_t a2)
{
  uint64_t v4 = ReindexCoordinator.indexer.getter();
  v10[3] = type metadata accessor for SpotlightIndexer();
  void v10[4] = &protocol witness table for SpotlightIndexer;
  v10[0] = v4;
  sub_100008758((uint64_t)v10, (uint64_t)v9);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_1000087BC(v9, v5 + 32);
  *(unsigned char *)(v5 + 72) = 0;
  sub_1000070B0(&qword_100066A40);
  swift_allocObject();
  swift_retain();
  id v6 = a1;
  swift_retain();
  uint64_t v7 = Promise.init(startBlock:)();
  sub_10000900C((uint64_t)v10);
  swift_release();
  return v7;
}

uint64_t sub_10002E6AC()
{
  return sub_10002B26C();
}

uint64_t sub_10002E6D4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100023ED4;
  return sub_10002E234(a1, a2);
}

uint64_t sub_10002E77C(uint64_t a1)
{
  uint64_t result = sub_10002ED48(&qword_100067960, (void (*)(uint64_t))type metadata accessor for ScreenTimeStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10002E7D4()
{
  return sub_10002ED48(&qword_100067968, (void (*)(uint64_t))type metadata accessor for ScreenTimeStatusSource);
}

uint64_t sub_10002E81C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v37 = a4;
  uint64_t v9 = type metadata accessor for StatusType();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v32 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40[3] = sub_1000070B0(&qword_100067970);
  v40[4] = sub_10002ECEC();
  v40[0] = a3;
  uint64_t v33 = v10;
  uint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
  v16(a5 + qword_100069C10, a1, v9);
  uint64_t v34 = a2;
  sub_100008758(a2, a5 + qword_100069C18);
  uint64_t v17 = a5 + qword_100069C20;
  uint64_t v18 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v19 + 16);
  uint64_t v30 = v18;
  v20(v17, v37);
  uint64_t v36 = a5;
  sub_100008758((uint64_t)v40, a5 + qword_100069C28);
  static PeopleLogger.daemon.getter();
  uint64_t v35 = a1;
  v16((uint64_t)v12, a1, v9);
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    id v29 = v23 + 4;
    sub_10002ED48(&qword_100066DB0, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v38 = sub_10002A278(v24, v25, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v33 + 8);
    v26(v12, v9);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "FamilyStatusEventProcessor for %s init", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v37, v30);
    sub_10000900C((uint64_t)v40);
    sub_10000900C(v34);
    v26(v35, v9);
  }
  else
  {

    uint64_t v27 = *(void (**)(char *, uint64_t))(v33 + 8);
    v27(v12, v9);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v37, v30);
    sub_10000900C((uint64_t)v40);
    sub_10000900C(v34);
    v27(v35, v9);
  }
  (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);
  return v36;
}

uint64_t sub_10002EC7C()
{
  return sub_1000232E4((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_10002EC94(uint64_t a1, uint64_t a2)
{
  return sub_10002DDFC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10002EC9C()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10002ECDC(uint64_t a1, char a2)
{
  sub_10001C858(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(id, uint64_t))(v2 + 24), *(void *)(v2 + 32));
}

unint64_t sub_10002ECEC()
{
  unint64_t result = qword_100067980;
  if (!qword_100067980)
  {
    sub_100011FFC(&qword_100067970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100067980);
  }
  return result;
}

uint64_t sub_10002ED48(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002ED90()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002EDC8()
{
  return sub_1000232E4((void (*)(void))&_swift_release);
}

uint64_t sub_10002EDE0(void *a1)
{
  return sub_10002E5AC(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002EDEC(uint64_t a1, uint64_t a2)
{
  return sub_10002CE34(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + 32, *(unsigned char *)(v2 + 72));
}

uint64_t sub_10002EDFC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002EE34()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002EE74(uint64_t a1, char a2)
{
  return sub_10002CF64(a1, a2 & 1, *(unsigned char *)(v2 + 16), *(void *)(v2 + 24), *(NSObject **)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_10002EE88()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002EEC0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100023ED4;
  return sub_10002D9A4();
}

uint64_t sub_10002EF6C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002EFB4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100008F18;
  return sub_10002C398(a1, v4, v5, v7, v6);
}

uint64_t sub_10002F074()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002F0B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100008F18;
  return sub_10002B6E8(a1, v4, v5, v6);
}

uint64_t sub_10002F168()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10002F1A8(unint64_t a1)
{
  return sub_10002C6AC(a1, *(void **)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_10002F1C0()
{
  type metadata accessor for XPCEncoder();
  swift_allocObject();
  uint64_t v0 = XPCEncoder.init()();
  type metadata accessor for XPCDecoder();
  swift_allocObject();
  *(void *)&long long v25 = v0;
  v24[0] = XPCDecoder.init()();
  sub_1000070B0(&qword_100067AC0);
  swift_allocObject();
  uint64_t v1 = MessageDispatcher.init<A, B>(encoder:decoder:)();
  if (qword_100066718 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100069BC0;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v3 = objc_allocWithZone((Class)SKStatusSubscriptionService);
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithStatusTypeIdentifier:v4];

  id v6 = [objc_allocWithZone((Class)CHSWidgetConfigurationReader) init];
  uint64_t v26 = sub_10001210C(0, &qword_100066D98);
  uint64_t v27 = (_UNKNOWN **)&protocol witness table for CHSWidgetConfigurationReader;
  *(void *)&long long v25 = v6;
  uint64_t v7 = type metadata accessor for WidgetConfigurationReader();
  uint64_t v8 = swift_allocObject();
  sub_1000087BC(&v25, v8 + 16);
  uint64_t v9 = type metadata accessor for ContactFetcher();
  uint64_t v10 = static ContactFetcher.shared.getter();
  uint64_t v26 = sub_10001210C(0, &qword_100066DF8);
  uint64_t v27 = &off_100061B68;
  *(void *)&long long v25 = v5;
  v24[3] = v7;
  v24[4] = &off_100061C68;
  v24[0] = v8;
  uint64_t v22 = v9;
  uint64_t v23 = &protocol witness table for ContactFetcher;
  *(void *)&long long v21 = v10;
  type metadata accessor for AvailabilitySubscriptionManager();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = sub_100012044((uint64_t)v24, v7);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  uint64_t v16 = *v14;
  v11[10] = v7;
  v11[11] = &off_100061C68;
  v11[7] = v16;
  sub_1000087BC(&v25, (uint64_t)(v11 + 2));
  sub_1000087BC(&v21, (uint64_t)(v11 + 12));
  id v17 = v5;
  swift_retain();
  swift_retain();
  sub_10000900C((uint64_t)v24);

  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  uint64_t v18 = sub_100031AAC(v1, v2, (uint64_t)v11);
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  qword_100069C68 = v18;
  return result;
}

uint64_t sub_10002F54C(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_100006E10;
  return sub_1000309C8(a1);
}

uint64_t sub_10002F5E4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_10002F6C0;
  return v7(a2);
}

uint64_t sub_10002F6C0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  id v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_10002F7D0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100067BC0 + dword_100067BC0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10002F878;
  return v3();
}

uint64_t sub_10002F878(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_10002F988(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_10002FA64;
  return v7(a2);
}

uint64_t sub_10002FA64(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    uint64_t v8 = *(void **)(v6 + 16);
    *uint64_t v8 = a1;
    v8[1] = a2;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_10002FB80(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100067BB8 + dword_100067BB8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100036044;
  return v5(a1);
}

uint64_t sub_10002FC28(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_100036040;
  return v7(a2);
}

uint64_t sub_10002FD04(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100067BB0 + dword_100067BB0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10002FDAC;
  return v5(a1);
}

uint64_t sub_10002FDAC(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t sub_10002FEB4(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100067B90 + dword_100067B90);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100036044;
  return v5(a1);
}

uint64_t sub_10002FF5C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_100030038;
  return v7(a2);
}

uint64_t sub_100030038(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(unsigned char **)(v4 + 16) = a1 & 1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_10003014C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v28 = a4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = v11;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    unint64_t v27 = a2;
    uint64_t v30 = v19;
    uint64_t v26 = v10;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v29 = sub_10002A278(0xD00000000000001DLL, 0x80000001000570D0, &v30);
    a4 = v28;
    uint64_t v10 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s", v18, 0xCu);
    swift_arrayDestroy();
    a2 = v27;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v21;
  void v22[5] = a1;
  v22[6] = a2;
  v22[7] = a3;
  v22[8] = a4;
  sub_1000315B4(a1, a2);
  swift_retain();
  sub_100016DD8((uint64_t)v10, (uint64_t)&unk_100067AB8, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_100030480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[9] = a4;
  return _swift_task_switch(sub_1000304A8, 0, 0);
}

uint64_t sub_1000304A8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v2 = *(void *)(v0 + 88);
    *(void *)(v0 + 112) = *(void *)(Strong + 16);
    swift_retain();
    swift_release();
    *(void *)(v0 + 56) = v3;
    *(void *)(v0 + 64) = v2;
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageDispatcher.handleMessage(with:)
                                                  + async function pointer to dispatch thunk of MessageDispatcher.handleMessage(with:));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v4;
    void *v4 = v0;
    v4[1] = sub_100030618;
    return v7(v0 + 40, v0 + 56);
  }
  else
  {
    (*(void (**)(void, unint64_t, void))(v0 + 96))(0, 0xF000000000000000, 0);
    sub_10003160C(0, 0xF000000000000000);
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_100030618()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000307D0;
  }
  else {
    uint64_t v2 = sub_100030748;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100030748()
{
  uint64_t v1 = *(void *)(v0 + 40);
  unint64_t v2 = *(void *)(v0 + 48);
  (*(void (**)(uint64_t, unint64_t, void))(v0 + 96))(v1, v2, 0);
  sub_10003160C(v1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000307D0()
{
  uint64_t v1 = v0[16];
  unint64_t v2 = (void (*)(void, unint64_t, uint64_t))v0[12];
  swift_errorRetain();
  v2(0, 0xF000000000000000, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_100030930(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

uint64_t sub_1000309C8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_1000070B0((uint64_t *)&unk_100067650);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  return _swift_task_switch(sub_100030AE8, 0, 0);
}

uint64_t sub_100030AE8()
{
  static PeopleLogger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "handling fetch contacts status message", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v10 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
  sub_1000070F4((void *)(v10 + 24), *(void *)(v10 + 48));
  uint64_t ContactsStatus = FetchContactsStatusMessage.contactIDs.getter();
  v0[10] = ContactsStatus;
  uint64_t v12 = FetchContactsStatusMessage.types.getter();
  v0[11] = v12;
  swift_bridgeObjectRetain();
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_100030FFC(v13, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_10003B7EC((uint64_t)v14);
  v0[12] = v15;
  swift_bridgeObjectRelease();
  static PeopleConstants.statusSourceTimeout.getter();
  Measurement<>.timeInterval.getter();
  unint64_t v17 = v16;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
  uint64_t v18 = (void *)swift_task_alloc();
  v0[13] = v18;
  void *v18 = v0;
  v18[1] = sub_100030CEC;
  v19.n128_u64[0] = v17;
  return static StatusCoalescer.fetchStatus(for:statusFetchers:timeout:)(ContactsStatus, v15, v19);
}

uint64_t sub_100030CEC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 112) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_100030F04;
  }
  else
  {
    *(void *)(v4 + 120) = a1;
    uint64_t v5 = sub_100030E38;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100030E38()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000070F4((void *)(v1 + 64), *(void *)(v1 + 88));
  sub_100025240();
  swift_release();
  uint64_t v2 = Dictionary<>.typeErased()();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100030F04()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100030F90()
{
  swift_release();
  sub_10000900C(v0 + 24);
  sub_10000900C(v0 + 64);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

void *sub_100030FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusType();
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  uint64_t v39 = (char *)&v28 - v8;
  uint64_t result = _swiftEmptyArrayStorage;
  unint64_t v44 = _swiftEmptyArrayStorage;
  uint64_t v10 = *(void *)(a1 + 16);
  if (!v10) {
    return result;
  }
  uint64_t v11 = 0;
  uint64_t v34 = a1 + 32;
  uint64_t v36 = v7 + 16;
  uint64_t v32 = v7;
  uint64_t v38 = v7 + 8;
  uint64_t v40 = v6;
  uint64_t v29 = a2;
  uint64_t v31 = v10;
  while (1)
  {
    sub_100008758(v34 + 40 * v11, (uint64_t)v43);
    uint64_t v12 = *(void *)(a2 + 16);
    sub_100008758((uint64_t)v43, (uint64_t)&v41);
    uint64_t v37 = v12;
    if (v12) {
      break;
    }
LABEL_17:
    sub_10000900C((uint64_t)&v41);
    sub_1000087BC(v43, (uint64_t)&v41);
    uint64_t v25 = v44;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10000D744(0, v25[2] + 1, 1);
      uint64_t v25 = v44;
    }
    unint64_t v27 = v25[2];
    unint64_t v26 = v25[3];
    if (v27 >= v26 >> 1)
    {
      sub_10000D744(v26 > 1, v27 + 1, 1);
      uint64_t v25 = v44;
    }
    v25[2] = v27 + 1;
    sub_1000087BC(&v41, (uint64_t)&v25[5 * v27 + 4]);
LABEL_5:
    if (++v11 == v10) {
      return v44;
    }
  }
  sub_1000070F4(&v41, v42);
  dispatch thunk of StatusSource.statusType.getter();
  uint64_t v13 = v32;
  unint64_t v33 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v14 = *(void (**)(uint64_t, unint64_t, uint64_t))(v32 + 16);
  v14(v40, a2 + v33, v4);
  sub_100035FF8(&qword_100067AA8, (void (*)(uint64_t))&type metadata accessor for StatusType);
  swift_bridgeObjectRetain();
  char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v16 = v40;
  char v17 = v15;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v18(v40, v4);
  if (v17)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v31;
LABEL_16:
    v18((uint64_t)v39, v4);
    goto LABEL_17;
  }
  uint64_t v35 = (uint64_t (*)(uint64_t, unint64_t, uint64_t))v14;
  if (v37 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v31;
LABEL_4:
    v18((uint64_t)v39, v4);
    sub_10000900C((uint64_t)&v41);
    sub_10000900C((uint64_t)v43);
    goto LABEL_5;
  }
  uint64_t v30 = v11;
  uint64_t v19 = *(void *)(v32 + 72);
  unint64_t v20 = a2 + v19 + v33;
  uint64_t v21 = 1;
  while (1)
  {
    uint64_t result = (void *)v35(v16, v20, v4);
    uint64_t v22 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    uint64_t v23 = v16;
    char v24 = dispatch thunk of static Equatable.== infix(_:_:)();
    v18(v23, v4);
    if (v24)
    {
      a2 = v29;
      swift_bridgeObjectRelease();
      uint64_t v11 = v30;
      uint64_t v10 = v31;
      goto LABEL_16;
    }
    ++v21;
    v20 += v19;
    uint64_t v16 = v40;
    if (v22 == v37)
    {
      a2 = v29;
      swift_bridgeObjectRelease();
      uint64_t v11 = v30;
      uint64_t v10 = v31;
      goto LABEL_4;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100031408()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100031440()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_100031490(*(void *)(v0 + 40), *(void *)(v0 + 48));
  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100031490(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000314E8()
{
  long long v6 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_100008F18;
  *(_OWORD *)(v3 + 96) = v4;
  *(void *)(v3 + 88) = v2;
  *(_OWORD *)(v3 + 72) = v6;
  return _swift_task_switch(sub_1000304A8, 0, 0);
}

uint64_t sub_1000315B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10003160C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100031490(a1, a2);
  }
  return a1;
}

uint64_t sub_100031620()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100031658(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100030930(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100031660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v15[3] = type metadata accessor for StatusManager();
  v15[4] = &off_100061C90;
  v15[0] = a2;
  void v14[3] = type metadata accessor for AvailabilitySubscriptionManager();
  v14[4] = &off_100062328;
  v14[0] = a3;
  *(void *)(a4 + 16) = a1;
  sub_100008758((uint64_t)v15, a4 + 24);
  sub_100008758((uint64_t)v14, a4 + 64);
  type metadata accessor for FetchContactsStatusMessage();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = &unk_100067AD0;
  *(void *)(v8 + 24) = a4;
  sub_100035FF8(&qword_100067AE8, (void (*)(uint64_t))&type metadata accessor for FetchContactsStatusMessage);
  swift_retain();
  swift_retain();
  swift_retain();
  dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  type metadata accessor for PingMessage();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &unk_100067AF8;
  *(void *)(v9 + 24) = a4;
  sub_100035FF8(&qword_100067B10, (void (*)(uint64_t))&type metadata accessor for PingMessage);
  swift_retain();
  swift_retain();
  dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  type metadata accessor for FamilyWillSendScreenTimeMessage();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &unk_100067B20;
  *(void *)(v10 + 24) = a4;
  sub_100035FF8(&qword_100067B38, (void (*)(uint64_t))&type metadata accessor for FamilyWillSendScreenTimeMessage);
  swift_retain();
  swift_retain();
  dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  type metadata accessor for FamilyWillSendAskToBuyMessage();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_100067B48;
  *(void *)(v11 + 24) = a4;
  sub_100035FF8(&qword_100067B60, (void (*)(uint64_t))&type metadata accessor for FamilyWillSendAskToBuyMessage);
  swift_retain();
  swift_retain();
  dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  type metadata accessor for FamilyATBSendIMessage();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_100067B70;
  *(void *)(v12 + 24) = a4;
  sub_100035FF8(&qword_100067B88, (void (*)(uint64_t))&type metadata accessor for FamilyATBSendIMessage);
  swift_retain();
  dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  sub_10000900C((uint64_t)v14);
  sub_10000900C((uint64_t)v15);
  return a4;
}

uint64_t sub_100031AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = type metadata accessor for StatusManager();
  uint64_t v22 = &off_100061C90;
  v20[0] = a2;
  uint64_t v18 = type metadata accessor for AvailabilitySubscriptionManager();
  uint64_t v19 = &off_100062328;
  v17[0] = a3;
  type metadata accessor for ServiceDelegate();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_100012044((uint64_t)v20, v21);
  __chkstk_darwin(v7);
  uint64_t v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_100012044((uint64_t)v17, v18);
  __chkstk_darwin(v11);
  uint64_t v13 = (void *)((char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = sub_100031660(a1, *v9, *v13, v6);
  sub_10000900C((uint64_t)v17);
  sub_10000900C((uint64_t)v20);
  return v15;
}

uint64_t sub_100031C8C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100031D24;
  return sub_10002F54C(a1);
}

uint64_t sub_100031D24(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100031E20()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100031E58(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100023ED4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100067AD8 + dword_100067AD8);
  return v8(a1, a2, v6);
}

uint64_t sub_100031F20(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100032010;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_100067BC0 + dword_100067BC0);
  long long v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_10002F878;
  return v6(a1);
}

uint64_t sub_100032010(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_10003211C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100008F18;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100067B00 + dword_100067B00);
  return v8(a1, a2, v6);
}

uint64_t sub_1000321E4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100036058;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_100067BB8 + dword_100067BB8);
  long long v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_100036044;
  return v6(a1);
}

uint64_t sub_1000322D4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100023ED4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100067B28 + dword_100067B28);
  return v8(a1, a2, v6);
}

uint64_t sub_10003239C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100031D24;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_100067BB0 + dword_100067BB0);
  long long v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_10002FDAC;
  return v6(a1);
}

uint64_t sub_10003248C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100023ED4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100067B50 + dword_100067B50);
  return v8(a1, a2, v6);
}

uint64_t sub_100032554(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100036058;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_100067B90 + dword_100067B90);
  long long v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_100036044;
  return v6(a1);
}

uint64_t sub_100032644(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100023ED4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100067B78 + dword_100067B78);
  return v8(a1, a2, v6);
}

uint64_t sub_10003270C()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  return _swift_task_switch(sub_1000327C8, 0, 0);
}

uint64_t sub_1000327C8()
{
  uint64_t v13 = v0;
  static PeopleLogger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[4];
    uint64_t v11 = v0[5];
    uint64_t v4 = v0[3];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = sub_10002A278(0xD000000000000015, 0x8000000100057190, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v11, v4);
  }
  else
  {
    uint64_t v7 = v0[4];
    uint64_t v6 = v0[5];
    uint64_t v8 = v0[3];

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v9(1735290736, 0xE400000000000000);
}

uint64_t sub_1000329AC(uint64_t a1)
{
  v1[4] = a1;
  sub_1000070B0(&qword_100067B98);
  v1[5] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for Logger();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for AskToMetrics.RequestJourneyCheckpoint();
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for AskToMetrics();
  v1[16] = v4;
  v1[17] = *(void *)(v4 - 8);
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_100032B88, 0, 0);
}

uint64_t sub_100032B88()
{
  unint64_t v20 = v0;
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  FamilyWillSendScreenTimeMessage.isCallerAskToProcess.getter();
  AskToMetrics.init(isAskToProcess:)();
  uint64_t v4 = enum case for AskToMetrics.RequestJourneyCheckpoint.daemonReceivedCanSendCall(_:);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  v0[19] = v5;
  v0[20] = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v5(v1, v4, v3);
  AskToMetrics.logScreenTimeMoreTimeRequestCheckpoint(_:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[21] = v6;
  v0[22] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  static PeopleLogger.daemon.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v18 = v0[12];
    uint64_t v10 = v0[6];
    uint64_t v9 = v0[7];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    v0[3] = sub_10002A278(0xD000000000000029, 0x8000000100057160, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v12(v18, v10);
  }
  else
  {
    uint64_t v13 = v0[12];
    uint64_t v14 = v0[6];
    uint64_t v15 = v0[7];

    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }
  v0[23] = v12;
  sub_10001210C(0, &qword_100067BA0);
  uint64_t v16 = (void *)swift_task_alloc();
  v0[24] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_100032E30;
  return static FAFamilyCircle.fetch()();
}

uint64_t sub_100032E30(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 200) = a1;
  *(void *)(v3 + 208) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_1000338CC;
  }
  else {
    uint64_t v4 = sub_100032F44;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100032F44()
{
  uint64_t v1 = *(void **)(v0 + 200);
  if (v1)
  {
    uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    uint64_t v3 = *(void *)(v0 + 120);
    uint64_t v4 = *(void *)(v0 + 104);
    (*(void (**)(uint64_t, void, uint64_t))(v0 + 152))(v3, enum case for AskToMetrics.RequestJourneyCheckpoint.familyCircleFetchSucceeded(_:), v4);
    AskToMetrics.logScreenTimeMoreTimeRequestCheckpoint(_:)();
    v2(v3, v4);
    uint64_t v5 = FAFamilyCircle.requestingFamilyMember.getter();
    *(void *)(v0 + 216) = v5;
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
      uint64_t v8 = *(void *)(v0 + 120);
      uint64_t v9 = *(void *)(v0 + 104);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 152))(v8, enum case for AskToMetrics.RequestJourneyCheckpoint.familyCircleHasRequester(_:), v9);
      AskToMetrics.logScreenTimeMoreTimeRequestCheckpoint(_:)();
      v7(v8, v9);
      uint64_t v10 = FAFamilyCircle.approvers.getter();
      *(void *)(v0 + 224) = v10;
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
        uint64_t v13 = *(void *)(v0 + 120);
        uint64_t v14 = *(void *)(v0 + 104);
        uint64_t v15 = *(void *)(v0 + 40);
        (*(void (**)(uint64_t, void, uint64_t))(v0 + 152))(v13, enum case for AskToMetrics.RequestJourneyCheckpoint.familyCircleHasApprovers(_:), v14);
        AskToMetrics.logScreenTimeMoreTimeRequestCheckpoint(_:)();
        v12(v13, v14);
        type metadata accessor for MessageSendRules();
        *(void *)(v0 + 232) = static MessageSendRules.sharedInstance.getter();
        uint64_t v16 = type metadata accessor for DiscoveredHandles();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
        os_log_t v48 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:askToMetrics:discoveredHandles:)
                                                                                 + async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:askToMetrics:discoveredHandles:));
        char v17 = (void *)swift_task_alloc();
        *(void *)(v0 + 240) = v17;
        void *v17 = v0;
        v17[1] = sub_10003344C;
        uint64_t v18 = *(void *)(v0 + 144);
        uint64_t v19 = *(void *)(v0 + 40);
        return v48(v6, v11, 1, v18, v19);
      }
      static PeopleLogger.daemon.getter();
      uint64_t v39 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v39, v40))
      {
        long long v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to get approvers for logged in user", v41, 2u);
        swift_slowDealloc();
      }
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
      uint64_t v43 = *(void *)(v0 + 136);
      uint64_t v49 = *(void *)(v0 + 144);
      uint64_t v44 = *(void *)(v0 + 128);
      uint64_t v45 = *(void *)(v0 + 80);
      uint64_t v46 = *(void *)(v0 + 48);

      v42(v45, v46);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v49, v44);
    }
    else
    {
      static PeopleLogger.daemon.getter();
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to get requesting Family member for logged in user", v32, 2u);
        swift_slowDealloc();
      }
      unint64_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
      uint64_t v35 = *(void *)(v0 + 136);
      uint64_t v34 = *(void *)(v0 + 144);
      uint64_t v36 = *(void *)(v0 + 128);
      uint64_t v37 = *(void *)(v0 + 72);
      uint64_t v38 = *(void *)(v0 + 48);

      v33(v37, v38);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    }
  }
  else
  {
    static PeopleLogger.daemon.getter();
    uint64_t v21 = Logger.logObject.getter();
    uint64_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, (os_log_type_t)v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v22, "Failed to fetch FamilyCircle", v23, 2u);
      swift_slowDealloc();
    }
    char v24 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    uint64_t v26 = *(void *)(v0 + 136);
    uint64_t v25 = *(void *)(v0 + 144);
    uint64_t v27 = *(void *)(v0 + 128);
    uint64_t v28 = *(void *)(v0 + 64);
    uint64_t v29 = *(void *)(v0 + 48);

    v24(v28, v29);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47(0);
}

uint64_t sub_10003344C(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 40);
  *(unsigned char *)(*(void *)v1 + 252) = a1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100035F98(v2);
  return _swift_task_switch(sub_1000335AC, 0, 0);
}

uint64_t sub_1000335AC()
{
  uint64_t v32 = v0;
  uint64_t v1 = *(void **)(v0 + 200);
  static PeopleLogger.daemon.getter();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    int v23 = *(unsigned __int8 *)(v0 + 252);
    char v24 = *(void **)(v0 + 216);
    uint64_t v5 = *(void **)(v0 + 200);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    uint64_t v28 = *(void *)(v0 + 136);
    uint64_t v29 = *(void *)(v0 + 128);
    uint64_t v30 = *(void *)(v0 + 144);
    uint64_t v25 = *(void *)(v0 + 48);
    uint64_t v26 = *(void *)(v0 + 88);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    id v7 = v5;
    id v8 = [v7 description];
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    *(void *)(v0 + 16) = sub_10002A278(v9, v11, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v6 + 12) = 1024;
    *(_DWORD *)(v0 + 248) = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetched family %s willSend: %{BOOL}d", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v27(v26, v25);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 216);
    uint64_t v13 = *(void **)(v0 + 200);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    uint64_t v16 = *(void *)(v0 + 136);
    uint64_t v15 = *(void *)(v0 + 144);
    uint64_t v17 = *(void *)(v0 + 128);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 48);

    v14(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  uint64_t v20 = *(unsigned __int8 *)(v0 + 252);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v21(v20);
}

uint64_t sub_1000338CC()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_1000339B0(uint64_t a1)
{
  v1[4] = a1;
  sub_1000070B0(&qword_100067B98);
  v1[5] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for Logger();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for AskToMetrics();
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  return _swift_task_switch(sub_100033B30, 0, 0);
}

uint64_t sub_100033B30()
{
  uint64_t v14 = v0;
  FamilyWillSendAskToBuyMessage.isCallerAskToProcess.getter();
  AskToMetrics.init(isAskToProcess:)();
  static PeopleLogger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v12 = v0[12];
    uint64_t v4 = v0[6];
    uint64_t v3 = v0[7];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[3] = sub_10002A278(0xD000000000000027, 0x8000000100057130, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v6(v12, v4);
  }
  else
  {
    uint64_t v7 = v0[12];
    uint64_t v8 = v0[6];
    uint64_t v9 = v0[7];

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v6(v7, v8);
  }
  v0[16] = v6;
  sub_10001210C(0, &qword_100067BA0);
  unint64_t v10 = (void *)swift_task_alloc();
  v0[17] = v10;
  *unint64_t v10 = v0;
  v10[1] = sub_100033D70;
  return static FAFamilyCircle.fetch()();
}

uint64_t sub_100033D70(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 144) = a1;
  *(void *)(v3 + 152) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100034724;
  }
  else {
    uint64_t v4 = sub_100033E84;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100033E84()
{
  uint64_t v1 = (void *)v0[18];
  if (v1)
  {
    uint64_t v2 = FAFamilyCircle.requestingFamilyMember.getter();
    v0[20] = v2;
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = FAFamilyCircle.approvers.getter();
      v0[21] = v4;
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = v0[5];
        type metadata accessor for MessageSendRules();
        v0[22] = static MessageSendRules.sharedInstance.getter();
        uint64_t v7 = type metadata accessor for DiscoveredHandles();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
        uint64_t v39 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:askToMetrics:discoveredHandles:)
                                                                                 + async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:askToMetrics:discoveredHandles:));
        uint64_t v8 = (void *)swift_task_alloc();
        v0[23] = v8;
        *uint64_t v8 = v0;
        v8[1] = sub_1000342B4;
        uint64_t v9 = v0[15];
        uint64_t v10 = v0[5];
        return v39(v3, v5, 1, v9, v10);
      }
      static PeopleLogger.daemon.getter();
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to get approvers for logged in user", v32, 2u);
        swift_slowDealloc();
      }
      uint64_t v33 = (void (*)(uint64_t, uint64_t))v0[16];
      uint64_t v40 = v0[15];
      uint64_t v34 = v0[13];
      uint64_t v35 = v0[14];
      uint64_t v36 = v0[10];
      uint64_t v37 = v0[6];

      v33(v36, v37);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v40, v34);
    }
    else
    {
      static PeopleLogger.daemon.getter();
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        int v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to get requesting Family member for logged in user", v23, 2u);
        swift_slowDealloc();
      }
      uint64_t v24 = v0[15];
      uint64_t v25 = (void (*)(uint64_t, uint64_t))v0[16];
      uint64_t v26 = v0[13];
      uint64_t v27 = v0[14];
      uint64_t v28 = v0[9];
      uint64_t v29 = v0[6];

      v25(v28, v29);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v24, v26);
    }
  }
  else
  {
    static PeopleLogger.daemon.getter();
    uint64_t v12 = Logger.logObject.getter();
    uint64_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, (os_log_type_t)v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v13, "Failed to fetch FamilyCircle", v14, 2u);
      swift_slowDealloc();
    }
    uint64_t v15 = v0[15];
    uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[16];
    uint64_t v17 = v0[13];
    uint64_t v18 = v0[14];
    uint64_t v19 = v0[8];
    uint64_t v20 = v0[6];

    v16(v19, v20);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v15, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(void))v0[1];
  return v38(0);
}

uint64_t sub_1000342B4(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 40);
  *(unsigned char *)(*(void *)v1 + 196) = a1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100035F98(v2);
  return _swift_task_switch(sub_100034414, 0, 0);
}

uint64_t sub_100034414()
{
  uint64_t v32 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  static PeopleLogger.daemon.getter();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    int v23 = *(unsigned __int8 *)(v0 + 196);
    uint64_t v24 = *(void **)(v0 + 160);
    uint64_t v5 = *(void **)(v0 + 144);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    uint64_t v28 = *(void *)(v0 + 112);
    uint64_t v29 = *(void *)(v0 + 104);
    uint64_t v30 = *(void *)(v0 + 120);
    uint64_t v25 = *(void *)(v0 + 48);
    uint64_t v26 = *(void *)(v0 + 88);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    id v7 = v5;
    id v8 = [v7 description];
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    *(void *)(v0 + 16) = sub_10002A278(v9, v11, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v6 + 12) = 1024;
    *(_DWORD *)(v0 + 192) = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetched family %s willSend: %{BOOL}d", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v27(v26, v25);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 160);
    uint64_t v13 = *(void **)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 120);
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    uint64_t v16 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 112);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 48);

    v15(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v14, v16);
  }
  uint64_t v20 = *(unsigned __int8 *)(v0 + 196);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v21(v20);
}

uint64_t sub_100034724()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_1000347FC(uint64_t a1)
{
  v1[8] = a1;
  uint64_t v2 = type metadata accessor for MessageDetails.EventSource();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  sub_1000070B0(&qword_100067B98);
  v1[12] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for ResolvedFamily();
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AskToMetrics();
  v1[27] = v5;
  v1[28] = *(void *)(v5 - 8);
  v1[29] = swift_task_alloc();
  return _swift_task_switch(sub_100034A68, 0, 0);
}

uint64_t sub_100034A68()
{
  uint64_t v14 = v0;
  FamilyATBSendIMessage.isCallerAskToProcess.getter();
  AskToMetrics.init(isAskToProcess:)();
  static PeopleLogger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v12 = v0[26];
    uint64_t v4 = v0[17];
    uint64_t v3 = v0[18];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[7] = sub_10002A278(0xD00000000000001FLL, 0x8000000100057110, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v6(v12, v4);
  }
  else
  {
    uint64_t v7 = v0[26];
    uint64_t v8 = v0[17];
    uint64_t v9 = v0[18];

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v6(v7, v8);
  }
  v0[30] = v6;
  sub_10001210C(0, &qword_100067BA0);
  unint64_t v10 = (void *)swift_task_alloc();
  v0[31] = v10;
  *unint64_t v10 = v0;
  v10[1] = sub_100034CA8;
  return static FAFamilyCircle.fetch()();
}

uint64_t sub_100034CA8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 256) = a1;
  *(void *)(v3 + 264) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100035E6C;
  }
  else {
    uint64_t v4 = sub_100034DBC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100034DBC()
{
  uint64_t v1 = *(void **)(v0 + 256);
  if (v1)
  {
    uint64_t v2 = FAFamilyCircle.requestingFamilyMember.getter();
    *(void *)(v0 + 272) = v2;
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = FAFamilyCircle.approvers.getter();
      *(void *)(v0 + 280) = v4;
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)(v0 + 96);
        uint64_t v7 = v3;
        swift_bridgeObjectRetain();
        ResolvedFamily.init(requestingFamilyMember:actionFamilyMember:approvers:)();
        type metadata accessor for MessageSendRules();
        *(void *)(v0 + 288) = static MessageSendRules.sharedInstance.getter();
        uint64_t v8 = type metadata accessor for DiscoveredHandles();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
        uint64_t v25 = (uint64_t (*)(NSObject *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:askToMetrics:discoveredHandles:)
                                                                                     + async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:askToMetrics:discoveredHandles:));
        uint64_t v9 = (void *)swift_task_alloc();
        *(void *)(v0 + 296) = v9;
        *uint64_t v9 = v0;
        v9[1] = sub_1000351E4;
        uint64_t v10 = *(void *)(v0 + 232);
        uint64_t v11 = *(void *)(v0 + 96);
        return v25(v7, v5, 1, v10, v11);
      }
      uint64_t v13 = (void *)(v0 + 168);
      static PeopleLogger.daemon.getter();
      uint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to get approvers for logged in user", v20, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      uint64_t v13 = (void *)(v0 + 160);
      static PeopleLogger.daemon.getter();
      uint64_t v3 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v3, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v16, "Failed to get requesting Family member for logged in user", v17, 2u);
        swift_slowDealloc();
      }
    }
  }
  else
  {
    uint64_t v13 = (void *)(v0 + 152);
    static PeopleLogger.daemon.getter();
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v14, "Failed to fetch FamilyCircle", v15, 2u);
      swift_slowDealloc();
    }
  }

  uint64_t v21 = *(void *)(v0 + 232);
  uint64_t v23 = *(void *)(v0 + 216);
  uint64_t v22 = *(void *)(v0 + 224);
  (*(void (**)(void, void))(v0 + 240))(*v13, *(void *)(v0 + 136));
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
  return v24(0);
}

uint64_t sub_1000351E4(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(unsigned char *)(*(void *)v1 + 348) = a1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100035F98(v2);
  return _swift_task_switch(sub_100035344, 0, 0);
}

uint64_t sub_100035344()
{
  if (*(unsigned char *)(v0 + 348) == 1)
  {
    uint64_t v2 = *(void *)(v0 + 120);
    uint64_t v1 = *(void *)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 80);
    uint64_t v6 = *(void *)(v0 + 88);
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v29 = FamilyATBSendIMessage.requestID.getter();
    uint64_t v9 = v8;
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v6, enum case for MessageDetails.EventSource.askToBuy(_:), v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
    uint64_t v10 = type metadata accessor for MessageConduit();
    swift_allocObject();
    uint64_t v11 = MessageConduit.init()();
    *(void *)(v0 + 40) = v10;
    *(void *)(v0 + 48) = &protocol witness table for MessageConduit;
    *(void *)(v0 + 16) = v11;
    type metadata accessor for RequestMessageSender();
    swift_allocObject();
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 304) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_100035680;
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v14 = *(void *)(v0 + 88);
    return sub_100027278(v29, v9, v14, v13, v0 + 16);
  }
  else
  {
    static PeopleLogger.daemon.getter();
    os_log_type_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "iMessage config/device config prevents ATB iMessage send", v18, 2u);
      swift_slowDealloc();
    }
    os_log_type_t v19 = *(void **)(v0 + 272);
    uint64_t v20 = *(void **)(v0 + 256);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 112);

    v21(v22, v23);
    uint64_t v25 = *(void *)(v0 + 224);
    uint64_t v26 = *(void *)(v0 + 232);
    uint64_t v27 = *(void *)(v0 + 216);
    (*(void (**)(void, void))(v24 + 8))(*(void *)(v0 + 128), *(void *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28(0);
  }
}

uint64_t sub_100035680(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 312) = a1;
  *(void *)(v3 + 320) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100035BEC;
  }
  else {
    uint64_t v4 = sub_100035794;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100035794()
{
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v1;
  void *v1 = v0;
  v1[1] = sub_100035830;
  return sub_100027CE8();
}

uint64_t sub_100035830(uint64_t a1)
{
  *(void *)(*(void *)v1 + 336) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100035950, 0, 0);
}

uint64_t sub_100035950()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 136);
  static PeopleLogger.daemon.getter();
  Logger.ifError(_:message:)();
  v2(v3, v4);
  static PeopleLogger.daemon.getter();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    *(_DWORD *)(v0 + 344) = v1 == 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "iMessage ATB iMessage send result %{BOOL}d", v7, 8u);
    swift_slowDealloc();
  }
  uint64_t v8 = *(void **)(v0 + 272);
  uint64_t v9 = *(void **)(v0 + 256);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
  uint64_t v11 = *(void *)(v0 + 184);
  uint64_t v12 = *(void *)(v0 + 136);
  uint64_t v13 = *(void *)(v0 + 112);
  swift_release();
  swift_errorRelease();

  v10(v11, v12);
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 232);
  uint64_t v16 = *(void *)(v0 + 216);
  (*(void (**)(void, void))(v13 + 8))(*(void *)(v0 + 128), *(void *)(v0 + 104));
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v17 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v17(v1 == 0);
}

uint64_t sub_100035BEC()
{
  uint64_t v1 = (void *)v0[34];
  uint64_t v2 = (void *)v0[32];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[17];
  uint64_t v12 = v0[14];
  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[30];
  static PeopleLogger.daemon.getter();
  swift_errorRetain();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  type metadata accessor for FamilyATBSendIMessage();
  sub_100035FF8(&qword_100067BA8, (void (*)(uint64_t))&type metadata accessor for FamilyATBSendIMessage);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 4203808;
  v6._object = (void *)0xE300000000000000;
  String.append(_:)(v6);
  Logger.ifError(_:message:)();

  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();

  v13(v3, v4);
  uint64_t v7 = v0[28];
  uint64_t v8 = v0[29];
  uint64_t v9 = v0[27];
  (*(void (**)(void, void))(v12 + 8))(v0[16], v0[13]);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10(0);
}

uint64_t sub_100035E6C()
{
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_100035F98(uint64_t a1)
{
  uint64_t v2 = sub_1000070B0(&qword_100067B98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100035FF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003605C()
{
  uint64_t v2 = *v0;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v1[16] = isa;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_100036178;
  uint64_t v4 = swift_continuation_init();
  v1[10] = _NSConcreteStackBlock;
  v1[11] = 0x40000000;
  v1[12] = sub_100036284;
  v1[13] = &unk_100062B28;
  v1[14] = v4;
  [v2 grabUnreadFor:isa completionHandler:v1 + 10];
  return _swift_continuation_await(v1 + 2);
}

uint64_t sub_100036178()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(*v0 + 120);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v2(v1);
}

uint64_t sub_100036284(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_10003B1BC();
  **(void **)(*(void *)(v1 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return _swift_continuation_resume(v1);
}

uint64_t sub_1000362EC(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = sub_1000070B0(&qword_100067DE8);
  v3[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000363E4, 0, 0);
}

uint64_t sub_1000363E4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = swift_allocObject();
  v0[10] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[11] = v4;
  void *v4 = v0;
  v4[1] = sub_1000364E4;
  uint64_t v6 = v0[8];
  uint64_t v5 = v0[9];
  return withTimeout<A>(after:_:)(v5, 1000000000000000000, 0, &unk_100067E38, v3, v6);
}

uint64_t sub_1000364E4()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10003669C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100036600;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100036600()
{
  uint64_t v1 = (uint64_t *)v0[9];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  sub_10003AE04((uint64_t)v1 + *(int *)(v0[8] + 64), v0[2]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  return v5(v3, v2, v4);
}

uint64_t sub_10003669C()
{
  swift_release();
  static PeopleLogger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "MessageFetcher getLastReceivedMessage timed out", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_errorRelease();
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void, unint64_t, void))v0[1];
  return v9(0, 0xE000000000000000, 0);
}

uint64_t sub_100036814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000368D8, 0, 0);
}

uint64_t sub_1000368D8()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  sub_1000070F4(v1 + 2, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  void *v4 = v0;
  v4[1] = sub_1000369E4;
  uint64_t v5 = v0[6];
  return v7(v5, v2, v3);
}

uint64_t sub_1000369E4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100036AE4, 0, 0);
}

unint64_t sub_100036AE4()
{
  uint64_t v36 = v0;
  unint64_t v1 = v0[11];
  unint64_t v2 = v1 >> 62;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3)
    {
LABEL_3:
      unint64_t result = v3 - 1;
      if (__OFSUB__(v3, 1))
      {
        __break(1u);
      }
      else if ((v1 & 0xC000000000000001) == 0)
      {
        if ((result & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (result < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v5 = *(id *)(v0[11] + 8 * result + 32);
LABEL_8:
          swift_bridgeObjectRelease();
          static PeopleLogger.daemon.getter();
          swift_bridgeObjectRetain_n();
          id v6 = v5;
          uint64_t v7 = Logger.logObject.getter();
          os_log_type_t v8 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v7, v8))
          {
            os_log_type_t v33 = v8;
            uint64_t v9 = swift_slowAlloc();
            uint64_t v32 = swift_slowAlloc();
            *(_DWORD *)uint64_t v9 = 136315394;
            uint64_t v35 = v32;
            id v10 = [v6 text];
            uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            unint64_t v13 = v12;

            v0[2] = sub_10002A278(v11, v13, &v35);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            *(_WORD *)(v9 + 12) = 2048;
            if (v2)
            {
              swift_bridgeObjectRetain();
              uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v14 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            uint64_t v18 = v0[8];
            uint64_t v34 = v0[9];
            uint64_t v19 = v0[7];
            swift_bridgeObjectRelease();
            v0[3] = v14;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v7, v33, "lastReceivedMessage %s out of %ld", (uint8_t *)v9, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v34, v19);
            unint64_t v2 = v1 >> 62;
          }
          else
          {
            uint64_t v16 = v0[8];
            uint64_t v15 = v0[9];
            uint64_t v17 = v0[7];
            swift_bridgeObjectRelease_n();

            (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
          }
          uint64_t v20 = (Swift::String *)v0[4];
          id v21 = [v6 text];
          static String._unconditionallyBridgeFromObjectiveC(_:)();

          Swift::String v22 = String.trim()();
          swift_bridgeObjectRelease();
          *uint64_t v20 = v22;
          if (v2)
          {
            swift_bridgeObjectRetain();
            uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v23 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          uint64_t v24 = v0[4];
          swift_bridgeObjectRelease();
          uint64_t v25 = v24 + *(int *)(sub_1000070B0(&qword_100067DE8) + 64);
          *(void *)(v24 + 16) = v23;
          id v26 = [v6 date];
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v27 = type metadata accessor for Date();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v25, 0, 1, v27);
          goto LABEL_20;
        }
        __break(1u);
        return result;
      }
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
  }
  uint64_t v28 = (void *)v0[4];
  swift_bridgeObjectRelease_n();
  uint64_t v29 = (char *)v28 + *(int *)(sub_1000070B0(&qword_100067DE8) + 64);
  *uint64_t v28 = 0;
  v28[1] = 0xE000000000000000;
  void v28[2] = 0;
  uint64_t v30 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 1, 1, v30);
LABEL_20:
  swift_task_dealloc();
  uint64_t v31 = (uint64_t (*)(void))v0[1];
  return v31();
}

uint64_t type metadata accessor for MessageFetcher()
{
  return self;
}

uint64_t sub_100036FE4()
{
  if (*(void *)(v0 + 144))
  {
    _print_unlocked<A, B>(_:_:)();
    uint64_t v2 = 0;
    unint64_t v1 = (void *)0xE000000000000000;
  }
  else
  {
    unint64_t v1 = (void *)0xE300000000000000;
    uint64_t v2 = 4271950;
  }
  _StringGuts.grow(_:)(53);
  v3._countAndFlagsBits = 0xD00000000000001FLL;
  v3._object = (void *)0x8000000100057260;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._object = (void *)0x8000000100057280;
  v4._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v4);
  v5._countAndFlagsBits = v2;
  v5._object = v1;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 10506;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  return 0;
}

uint64_t sub_100037114(void *a1)
{
  return sub_100037138(a1);
}

uint64_t sub_100037138(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  os_log_type_t v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v22 = v4;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v23 = v2;
    unint64_t v12 = (uint8_t *)v11;
    id v21 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 138412290;
    uint64_t v24 = v8;
    unint64_t v13 = v8;
    uint64_t v4 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v21 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Got BMReadMessageEvent: %@", v12, 0xCu);
    sub_1000070B0(&qword_100066A58);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v23;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1000070B0(&qword_100066C08);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100053F00;
  id v15 = [v8 idsHandle];
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  *(void *)(v14 + 32) = v16;
  *(void *)(v14 + 40) = v18;
  LOBYTE(v15) = [v8 markedUnread];
  sub_1000070B0(&qword_100066A40);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  *(void *)(v19 + 24) = v2;
  *(unsigned char *)(v19 + 32) = (_BYTE)v15;
  swift_retain();
  return Promise.__allocating_init(_:)();
}

uint64_t sub_100037400(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 232) = a4;
  *(void *)(v4 + 64) = a2;
  *(void *)(v4 + 72) = a3;
  uint64_t v5 = type metadata accessor for Logger();
  *(void *)(v4 + 80) = v5;
  *(void *)(v4 + 88) = *(void *)(v5 - 8);
  *(void *)(v4 + 96) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for StatusType();
  *(void *)(v4 + 104) = v6;
  *(void *)(v4 + 112) = *(void *)(v6 - 8);
  *(void *)(v4 + 120) = swift_task_alloc();
  sub_1000070B0(&qword_100066A38);
  *(void *)(v4 + 128) = swift_task_alloc();
  sub_1000070B0(&qword_100066A20);
  *(void *)(v4 + 136) = swift_task_alloc();
  return _swift_task_switch(sub_100037580, 0, 0);
}

uint64_t sub_100037580()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 144) = [v2 predicateForContactsMatchingHandleStrings:isa];

  sub_1000070F4((void *)(v1 + 64), *(void *)(v1 + 88));
  unint64_t v4 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  *(void *)(v0 + 152) = 0;
  unint64_t v5 = v4;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v6 = v7;
    if (v7) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_15;
  }
LABEL_3:
  if (v6 < 1)
  {
    __break(1u);
    return _swift_task_switch(v7, v8, v9);
  }
  uint64_t v10 = 0;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v12 = *(id *)(v5 + 8 * v10 + 32);
    }
    unint64_t v13 = v12;
    id v14 = [v12 identifier];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10001CD98(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v19 = *((void *)v11 + 2);
    unint64_t v18 = *((void *)v11 + 3);
    if (v19 >= v18 >> 1) {
      uint64_t v11 = sub_10001CD98((char *)(v18 > 1), v19 + 1, 1, v11);
    }
    ++v10;
    *((void *)v11 + 2) = v19 + 1;
    uint64_t v20 = &v11[16 * v19];
    *((void *)v20 + 4) = v15;
    *((void *)v20 + 5) = v17;
  }
  while (v6 != v10);
LABEL_16:
  *(void *)(v0 + 160) = v11;
  char v21 = *(unsigned char *)(v0 + 232);
  swift_bridgeObjectRelease_n();
  if (v21)
  {
    sub_1000070F4((void *)(*(void *)(v0 + 72) + 24), *(void *)(*(void *)(v0 + 72) + 48));
    dispatch thunk of LaunchRecordReaderProtocol.reload()();
    type metadata accessor for LaunchRecorderWriter();
    *(void *)(v0 + 168) = static LaunchRecorderWriter.sharedInstance.getter();
    sub_10003B034(&qword_100067E30, 255, (void (*)(uint64_t))&type metadata accessor for LaunchRecorderWriter);
    uint64_t v22 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v9 = v23;
    *(void *)(v0 + 176) = v22;
    *(void *)(v0 + 184) = v23;
    uint64_t v7 = (uint64_t)sub_100037D04;
    uint64_t v8 = v22;
    return _swift_task_switch(v7, v8, v9);
  }
  if (*(void *)(*(void *)(v0 + 160) + 16))
  {
    uint64_t Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      sub_10002117C(*(void *)(v0 + 72), *(void *)(v0 + 160), Strong);
      swift_unknownObjectRelease();
    }
    uint64_t v25 = *(void *)(v0 + 128);
    uint64_t v26 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = 0;
    *(void *)(v27 + 24) = 0;
    sub_100016DD8(v25, (uint64_t)&unk_100067E28, v27);
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void **)(v0 + 144);
  uint64_t v29 = *(void *)(v0 + 120);
  uint64_t v30 = *(void *)(v0 + 104);
  uint64_t v31 = *(void *)(v0 + 112);
  type metadata accessor for PeopleAnalytics();
  (*(void (**)(uint64_t, void, uint64_t))(v31 + 104))(v29, enum case for StatusType.readMessage(_:), v30);
  static PeopleAnalytics.eventReceived(foundContacts:statusType:)();

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_100037D04()
{
  dispatch thunk of LaunchRecorderWriter.reload()();
  return _swift_task_switch(sub_100037D6C, 0, 0);
}

uint64_t sub_100037D6C()
{
  uint64_t v1 = v0[20];
  sub_1000070F4((void *)(v0[9] + 24), *(void *)(v0[9] + 48));
  v0[24] = dispatch thunk of LaunchRecordReaderProtocol.dates(forContactIdentifier:)();
  uint64_t v2 = *(void *)(v1 + 16);
  v0[25] = v2;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    do
    {
      v0[26] = v3;
      uint64_t v6 = v0[24];
      uint64_t v7 = v0[20] + 16 * v3;
      uint64_t v8 = *(void *)(v7 + 32);
      v0[27] = v8;
      uint64_t v9 = *(void *)(v7 + 40);
      v0[28] = v9;
      if (*(void *)(v6 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v10 = sub_1000071E4(v8, v9);
        if (v11)
        {
          unint64_t v12 = v10;
          uint64_t v13 = v0[17];
          uint64_t v14 = *(void *)(v0[24] + 56);
          uint64_t v15 = type metadata accessor for Date();
          uint64_t v16 = *(void *)(v15 - 8);
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v13, v14 + *(void *)(v16 + 72) * v12, v15);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
          {
            sub_10001223C(v0[17], &qword_100066A20);
            uint64_t v19 = v0[22];
            uint64_t v20 = v0[23];
            char v21 = sub_1000380B8;
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v17 = v0[17];
          uint64_t v18 = type metadata accessor for Date();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v4 = v0[17];
        uint64_t v5 = type metadata accessor for Date();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
      }
      sub_10001223C(v0[17], &qword_100066A20);
      uint64_t v3 = v0[26] + 1;
    }
    while (v3 != v0[25]);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = v0[22];
  uint64_t v20 = v0[23];
  char v21 = sub_100038028;
LABEL_13:
  return _swift_task_switch(v21, v19, v20);
}

uint64_t sub_100038028()
{
  uint64_t v1 = *(void *)(v0 + 152);
  dispatch thunk of LaunchRecorderWriter.save()();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v2 = sub_10003B1FC;
  }
  else
  {
    uint64_t v2 = sub_1000383B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000380B8()
{
  dispatch thunk of LaunchRecorderWriter.remove(contactId:)();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100038130, 0, 0);
}

uint64_t sub_100038130()
{
  uint64_t v1 = v0[26] + 1;
  if (v1 == v0[25])
  {
LABEL_2:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v0[22];
    uint64_t v3 = v0[23];
    uint64_t v4 = sub_100038028;
    goto LABEL_3;
  }
  while (1)
  {
    v0[26] = v1;
    uint64_t v7 = v0[24];
    uint64_t v8 = v0[20] + 16 * v1;
    uint64_t v9 = *(void *)(v8 + 32);
    v0[27] = v9;
    uint64_t v10 = *(void *)(v8 + 40);
    v0[28] = v10;
    if (*(void *)(v7 + 16)) {
      break;
    }
    uint64_t v5 = v0[17];
    uint64_t v6 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
LABEL_8:
    sub_10001223C(v0[17], &qword_100066A20);
    uint64_t v1 = v0[26] + 1;
    if (v1 == v0[25]) {
      goto LABEL_2;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_1000071E4(v9, v10);
  if ((v12 & 1) == 0)
  {
    uint64_t v18 = v0[17];
    uint64_t v19 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
    goto LABEL_14;
  }
  unint64_t v13 = v11;
  uint64_t v14 = v0[17];
  uint64_t v15 = *(void *)(v0[24] + 56);
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(uint64_t, unint64_t, uint64_t))(v17 + 16))(v14, v15 + *(void *)(v17 + 72) * v13, v16);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16) == 1)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_10001223C(v0[17], &qword_100066A20);
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  uint64_t v4 = sub_1000380B8;
LABEL_3:
  return _swift_task_switch(v4, v2, v3);
}

uint64_t sub_1000383B4()
{
  swift_release();
  if (*(void *)(v0[20] + 16))
  {
    uint64_t Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      sub_10002117C(v0[9], v0[20], Strong);
      swift_unknownObjectRelease();
    }
    uint64_t v2 = v0[16];
    uint64_t v3 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = 0;
    sub_100016DD8(v2, (uint64_t)&unk_100067E28, v4);
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)v0[18];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[14];
  type metadata accessor for PeopleAnalytics();
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v6, enum case for StatusType.readMessage(_:), v7);
  static PeopleAnalytics.eventReceived(foundContacts:statusType:)();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100038590()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_10003864C, 0, 0);
}

uint64_t sub_10003864C()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.unreadMessage(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_100038704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[14] = a3;
  v4[15] = a4;
  v4[12] = a1;
  v4[13] = a2;
  uint64_t v5 = type metadata accessor for StatusType();
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  sub_1000070B0(&qword_100066A20);
  v4[19] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v4[20] = v6;
  v4[21] = *(void *)(v6 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v4[27] = v7;
  v4[28] = *(void *)(v7 - 8);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = sub_1000070B0(&qword_100067DE8);
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  v4[41] = swift_task_alloc();
  return _swift_task_switch(sub_100038998, 0, 0);
}

uint64_t sub_100038998()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v4 = [v2 predicateForContactsWithIdentifiers:isa];
  *(void *)(v0 + 336) = v4;

  sub_1000070F4((void *)(v1 + 64), *(void *)(v1 + 88));
  uint64_t v5 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  *(void *)(v0 + 344) = v5;
  unint64_t v6 = v5;
  unint64_t v7 = sub_10000604C((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v13 = v7;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t v7 = swift_bridgeObjectRelease();
    *(void *)(v0 + 352) = v14;
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(void *)(v0 + 352) = v14;
    if (v14)
    {
LABEL_3:
      if (v14 < 1)
      {
        __break(1u);
      }
      else
      {
        *(void *)(v0 + 360) = v13;
        *(void *)(v0 + 368) = 0;
        uint64_t v15 = *(void *)(v0 + 344);
        if ((v15 & 0xC000000000000001) != 0) {
          id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v16 = *(id *)(v15 + 32);
        }
        *(void *)(v0 + 376) = v16;
        uint64_t v18 = *(void *)(v0 + 272);
        uint64_t v19 = *(void *)(v0 + 112);
        uint64_t v20 = CNContact.people_normalizedHandles.getter();
        *(void *)(v0 + 384) = v20;
        uint64_t v21 = *sub_1000070F4((void *)(v19 + 104), *(void *)(v19 + 128));
        *(_DWORD *)(v0 + 472) = *(_DWORD *)(v18 + 64);
        uint64_t v22 = swift_allocObject();
        *(void *)(v0 + 392) = v22;
        *(void *)(v22 + 16) = v21;
        *(void *)(v22 + 24) = v20;
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v23 = (void *)swift_task_alloc();
        *(void *)(v0 + 400) = v23;
        void *v23 = v0;
        v23[1] = sub_1000390E4;
        unint64_t v7 = *(void *)(v0 + 320);
        uint64_t v12 = *(void *)(v0 + 272);
        uint64_t v10 = &unk_100067DF8;
        uint64_t v8 = 1000000000000000000;
        uint64_t v9 = 0;
        uint64_t v11 = v22;
      }
      return withTimeout<A>(after:_:)(v7, v8, v9, v10, v11, v12);
    }
  }
  swift_bridgeObjectRelease();

  **(void **)(v0 + 96) = v13;
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
  return v24();
}

uint64_t sub_1000390E4()
{
  *(void *)(*(void *)v1 + 408) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000396EC;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100039200;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100039200()
{
  uint64_t v1 = *(uint64_t **)(v0 + 320);
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  sub_10003AE04((uint64_t)v1 + *(int *)(*(void *)(v0 + 272) + 64), *(void *)(v0 + 328) + *(int *)(v0 + 472));
  *(void *)(v0 + 416) = v4;
  uint64_t v5 = *(void **)(v0 + 328);
  uint64_t v6 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v8 = (char *)v5 + *(int *)(v0 + 472);
  *uint64_t v5 = v2;
  v5[1] = v3;
  long long v5[2] = v4;
  uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  *(void *)(v0 + 424) = v9;
  *(void *)(v0 + 432) = (v7 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v9(v8, 1, v6) == 1)
  {
    if (v4 > 0)
    {
      static PeopleLogger.common.getter();
      uint64_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "No time in last unread message!", v12, 2u);
        swift_slowDealloc();
      }
      uint64_t v13 = *(void *)(v0 + 256);
      uint64_t v14 = *(void *)(v0 + 216);
      uint64_t v15 = *(void *)(v0 + 224);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
    sub_10001223C(*(void *)(v0 + 328), &qword_100067DE8);
    goto LABEL_11;
  }
  uint64_t v16 = *(void *)(v0 + 328);
  uint64_t v17 = *(void **)(v0 + 312);
  uint64_t v18 = v16 + *(int *)(v0 + 472);
  uint64_t v19 = (uint64_t)v17 + *(int *)(*(void *)(v0 + 272) + 64);
  void *v17 = v2;
  v17[1] = v3;
  v17[2] = v4;
  sub_10003AD9C(v18, v19);
  sub_10001223C(v19, &qword_100066A20);
  sub_10001223C(v16, &qword_100067DE8);
  if (v4 < 1)
  {
LABEL_11:
    uint64_t v27 = *(void **)(v0 + 376);
    swift_bridgeObjectRelease();

    uint64_t v28 = *(void *)(v0 + 368) + 1;
    if (v28 == *(void *)(v0 + 352))
    {
      uint64_t v29 = *(void *)(v0 + 360);
      uint64_t v30 = *(void **)(v0 + 336);
      swift_bridgeObjectRelease();

      **(void **)(v0 + 96) = v29;
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
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
      return v31();
    }
    else
    {
      *(void *)(v0 + 368) = v28;
      uint64_t v32 = *(void *)(v0 + 344);
      if ((v32 & 0xC000000000000001) != 0) {
        id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v33 = *(id *)(v32 + 8 * v28 + 32);
      }
      *(void *)(v0 + 376) = v33;
      uint64_t v34 = *(void *)(v0 + 272);
      uint64_t v35 = *(void *)(v0 + 112);
      uint64_t v36 = CNContact.people_normalizedHandles.getter();
      *(void *)(v0 + 384) = v36;
      uint64_t v37 = *sub_1000070F4((void *)(v35 + 104), *(void *)(v35 + 128));
      *(_DWORD *)(v0 + 472) = *(_DWORD *)(v34 + 64);
      uint64_t v38 = swift_allocObject();
      *(void *)(v0 + 392) = v38;
      *(void *)(v38 + 16) = v37;
      *(void *)(v38 + 24) = v36;
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v39 = (void *)swift_task_alloc();
      *(void *)(v0 + 400) = v39;
      void *v39 = v0;
      v39[1] = sub_1000390E4;
      uint64_t v40 = *(void *)(v0 + 320);
      uint64_t v41 = *(void *)(v0 + 272);
      return withTimeout<A>(after:_:)(v40, 1000000000000000000, 0, &unk_100067DF8, v38, v41);
    }
  }
  uint64_t v20 = *(void *)(v0 + 304);
  uint64_t v21 = *(void *)(v0 + 112);
  uint64_t v22 = *(int *)(*(void *)(v0 + 272) + 64);
  *(_DWORD *)(v0 + 476) = v22;
  uint64_t v23 = v20 + v22;
  sub_1000070F4((void *)(v21 + 104), *(void *)(v21 + 128));
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v24;
  void *v24 = v0;
  v24[1] = sub_100039B38;
  uint64_t v25 = *(void *)(v0 + 384);
  return sub_1000362EC(v23, v25);
}

uint64_t sub_1000396EC()
{
  swift_release();
  static PeopleLogger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "MessageFetcher getLastReceivedMessage timed out", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(int *)(v0 + 472);
  uint64_t v5 = *(void *)(v0 + 328);
  uint64_t v6 = *(void *)(v0 + 264);
  uint64_t v7 = *(void *)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 168);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v5 + v4, 1, 1, v9);
  *(void *)(v0 + 416) = 0;
  os_log_type_t v11 = *(void **)(v0 + 328);
  uint64_t v12 = *(void *)(v0 + 160);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v14 = (char *)v11 + *(int *)(v0 + 472);
  void *v11 = 0;
  v11[1] = 0xE000000000000000;
  v11[2] = 0;
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  *(void *)(v0 + 424) = v15;
  *(void *)(v0 + 432) = (v13 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v15(v14, 1, v12) == 1)
  {
    uint64_t v16 = *(void *)(v0 + 328);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 328);
    uint64_t v17 = *(void **)(v0 + 312);
    uint64_t v18 = v16 + *(int *)(v0 + 472);
    uint64_t v19 = (uint64_t)v17 + *(int *)(*(void *)(v0 + 272) + 64);
    void *v17 = 0;
    v17[1] = 0xE000000000000000;
    v17[2] = 0;
    sub_10003AD9C(v18, v19);
    sub_10001223C(v19, &qword_100066A20);
  }
  sub_10001223C(v16, &qword_100067DE8);
  uint64_t v20 = *(void **)(v0 + 376);
  swift_bridgeObjectRelease();

  uint64_t v21 = *(void *)(v0 + 368) + 1;
  if (v21 == *(void *)(v0 + 352))
  {
    uint64_t v22 = *(void *)(v0 + 360);
    uint64_t v23 = *(void **)(v0 + 336);
    swift_bridgeObjectRelease();

    **(void **)(v0 + 96) = v22;
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
  else
  {
    *(void *)(v0 + 368) = v21;
    uint64_t v26 = *(void *)(v0 + 344);
    if ((v26 & 0xC000000000000001) != 0) {
      id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v27 = *(id *)(v26 + 8 * v21 + 32);
    }
    *(void *)(v0 + 376) = v27;
    uint64_t v28 = *(void *)(v0 + 272);
    uint64_t v29 = *(void *)(v0 + 112);
    uint64_t v30 = CNContact.people_normalizedHandles.getter();
    *(void *)(v0 + 384) = v30;
    uint64_t v31 = *sub_1000070F4((void *)(v29 + 104), *(void *)(v29 + 128));
    *(_DWORD *)(v0 + 472) = *(_DWORD *)(v28 + 64);
    uint64_t v32 = swift_allocObject();
    *(void *)(v0 + 392) = v32;
    *(void *)(v32 + 16) = v31;
    *(void *)(v32 + 24) = v30;
    swift_retain();
    swift_bridgeObjectRetain();
    id v33 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v33;
    *id v33 = v0;
    v33[1] = sub_1000390E4;
    uint64_t v34 = *(void *)(v0 + 320);
    uint64_t v35 = *(void *)(v0 + 272);
    return withTimeout<A>(after:_:)(v34, 1000000000000000000, 0, &unk_100067DF8, v32, v35);
  }
}

uint64_t sub_100039B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[56] = a1;
  v4[57] = a2;
  v4[58] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100039C5C, 0, 0);
}

uint64_t sub_100039C5C()
{
  uint64_t v124 = v0;
  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 448);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 424);
  uint64_t v6 = *(void **)(v0 + 296);
  uint64_t v5 = *(void **)(v0 + 304);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v8 = *(void *)(v0 + 160);
  uint64_t v9 = (uint64_t)v5 + *(int *)(v0 + 476);
  *uint64_t v5 = v3;
  v5[1] = v2;
  long long v5[2] = v1;
  uint64_t v10 = (uint64_t)v6 + *(int *)(v7 + 64);
  void *v6 = v3;
  v6[1] = v2;
  v6[2] = v1;
  sub_10003AD9C(v9, v10);
  if (v4(v10, 1, v8) == 1)
  {
    swift_bridgeObjectRetain();
    sub_10001223C(v10, &qword_100066A20);
LABEL_16:
    uint64_t v75 = *(void *)(v0 + 456);
    uint64_t v76 = *(void *)(v0 + 464);
    uint64_t v77 = *(void *)(v0 + 448);
    uint64_t v114 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 424);
    uint64_t v78 = *(void **)(v0 + 280);
    uint64_t v79 = *(void **)(v0 + 288);
    uint64_t v80 = *(void *)(v0 + 272);
    uint64_t v112 = *(void *)(v0 + 160);
    uint64_t v81 = *(void *)(v0 + 304) + *(int *)(v0 + 476);
    id v82 = [*(id *)(v0 + 376) identifier];
    uint64_t v121 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v122 = v83;

    sub_1000070B0(&qword_1000669F0);
    uint64_t v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = xmmword_100053F00;
    uint64_t v85 = (uint64_t)v79 + *(int *)(v80 + 64);
    *uint64_t v79 = v77;
    v79[1] = v75;
    v79[2] = v76;
    sub_10003AD9C(v81, v85);
    uint64_t v86 = (uint64_t)v78 + *(int *)(v80 + 64);
    *uint64_t v78 = v77;
    v78[1] = v75;
    v78[2] = v76;
    sub_10003AD9C(v81, v86);
    if (v114(v86, 1, v112) == 1)
    {
      Date.init()();
      sub_10001223C(v86, &qword_100066A20);
    }
    else
    {
      (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 168) + 32))(*(void *)(v0 + 176), v86, *(void *)(v0 + 160));
    }
    uint64_t v87 = *(void **)(v0 + 376);
    uint64_t v88 = *(void *)(v0 + 360);
    uint64_t v89 = *(void *)(v0 + 304);
    *(void *)(v84 + 56) = type metadata accessor for MessagePersonStatus();
    *(void *)(v84 + 64) = sub_10003B034(&qword_100067E00, 255, (void (*)(uint64_t))&type metadata accessor for MessagePersonStatus);
    sub_100007180((uint64_t *)(v84 + 32));
    MessagePersonStatus.init(lastMessageString:unreadCount:date:)();
    sub_10001223C(v85, &qword_100066A20);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v123 = v88;
    sub_100008014(v84, v121, v122, isUniquelyReferenced_nonNull_native);
    uint64_t v91 = v123;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_10001223C(v89, &qword_100067DE8);
    goto LABEL_20;
  }
  os_log_type_t v11 = *(void **)(v0 + 376);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 168) + 32);
  v13(*(void *)(v0 + 208), v10, *(void *)(v0 + 160));
  swift_bridgeObjectRetain();
  id v14 = [v11 identifier];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  if (*(void *)(v12 + 16) && (unint64_t v18 = sub_1000071E4(v15, v17), (v19 & 1) != 0))
  {
    (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 168) + 16))(*(void *)(v0 + 152), *(void *)(*(void *)(v0 + 120) + 56) + *(void *)(*(void *)(v0 + 168) + 72) * v18, *(void *)(v0 + 160));
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 424);
  uint64_t v22 = *(void *)(v0 + 160);
  uint64_t v23 = *(void *)(v0 + 152);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 168) + 56))(v23, v20, 1, v22);
  swift_bridgeObjectRelease();
  if (v21(v23, 1, v22) == 1)
  {
    uint64_t v24 = *(void *)(v0 + 152);
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 160));
    sub_10001223C(v24, &qword_100066A20);
    goto LABEL_16;
  }
  uint64_t v25 = *(void **)(v0 + 376);
  uint64_t v27 = *(void *)(v0 + 200);
  uint64_t v26 = *(void *)(v0 + 208);
  uint64_t v29 = *(void *)(v0 + 184);
  uint64_t v28 = *(void *)(v0 + 192);
  uint64_t v30 = v13;
  uint64_t v31 = *(void *)(v0 + 160);
  uint64_t v32 = *(void *)(v0 + 168);
  v30(v27, *(void *)(v0 + 152), v31);
  static PeopleLogger.daemon.getter();
  id v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
  v33(v28, v26, v31);
  v33(v29, v27, v31);
  id v34 = v25;
  uint64_t v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.debug.getter();
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v38 = *(void **)(v0 + 376);
  uint64_t v39 = *(void *)(v0 + 248);
  uint64_t v41 = *(void *)(v0 + 216);
  uint64_t v40 = *(void *)(v0 + 224);
  uint64_t v42 = *(void *)(v0 + 192);
  uint64_t v44 = *(void *)(v0 + 160);
  uint64_t v43 = *(void *)(v0 + 168);
  if (v37)
  {
    uint64_t v108 = *(void *)(v0 + 184);
    uint64_t v119 = *(void *)(v0 + 216);
    uint64_t v45 = swift_slowAlloc();
    uint64_t v123 = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136315650;
    uint64_t v117 = v40;
    id v46 = [v38 identifier];
    uint64_t v115 = v39;
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    os_log_type_t type = v36;
    unint64_t v49 = v48;

    *(void *)(v0 + 72) = sub_10002A278(v47, v49, &v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v45 + 12) = 2080;
    sub_10003B034(&qword_100067E08, 255, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v50 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 80) = sub_10002A278(v50, v51, &v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    int v52 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v52(v42, v44);
    *(_WORD *)(v45 + 22) = 2080;
    uint64_t v53 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 88) = sub_10002A278(v53, v54, &v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v52(v108, v44);
    _os_log_impl((void *)&_mh_execute_header, v35, type, "%s message time %s viewed %s", (uint8_t *)v45, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
    v55(v115, v119);
  }
  else
  {
    uint64_t v56 = *(void *)(v0 + 184);

    uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v57(v42, v44);
    uint64_t v58 = v56;
    int v52 = v57;
    v57(v58, v44);

    uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v55(v39, v41);
  }
  if ((static Date.< infix(_:_:)() & 1) == 0)
  {
    uint64_t v73 = *(void *)(v0 + 208);
    uint64_t v74 = *(void *)(v0 + 160);
    v52(*(void *)(v0 + 200), v74);
    v52(v73, v74);
    goto LABEL_16;
  }
  unint64_t v59 = *(void **)(v0 + 376);
  swift_bridgeObjectRelease();
  static PeopleLogger.daemon.getter();
  id v60 = v59;
  uint64_t v61 = Logger.logObject.getter();
  os_log_type_t v113 = static os_log_type_t.debug.getter();
  BOOL v62 = os_log_type_enabled(v61, v113);
  os_log_type_t v63 = *(void **)(v0 + 376);
  uint64_t v64 = *(void *)(v0 + 304);
  uint64_t v116 = *(void *)(v0 + 216);
  uint64_t v118 = *(void *)(v0 + 240);
  uint64_t v65 = *(void *)(v0 + 208);
  uint64_t v120 = *(void *)(v0 + 200);
  uint64_t v66 = *(void *)(v0 + 160);
  if (v62)
  {
    uint64_t v109 = v55;
    *(void *)typea = *(void *)(v0 + 208);
    unint64_t v67 = (uint8_t *)swift_slowAlloc();
    uint64_t v123 = swift_slowAlloc();
    *(_DWORD *)unint64_t v67 = 136315138;
    uint64_t v107 = v64;
    id v68 = [v63 identifier];
    uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v106 = v66;
    unint64_t v71 = v70;

    *(void *)(v0 + 64) = sub_10002A278(v69, v71, &v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v61, v113, "%s viewed since unread message", v67, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v109(v118, v116);
    v52(v120, v106);
    v52(*(void *)typea, v106);
    uint64_t v72 = v107;
  }
  else
  {

    v55(v118, v116);
    v52(v120, v66);
    v52(v65, v66);
    uint64_t v72 = v64;
  }
  sub_10001223C(v72, &qword_100067DE8);
  uint64_t v91 = *(void *)(v0 + 360);
LABEL_20:
  uint64_t v92 = *(void *)(v0 + 368) + 1;
  if (v92 == *(void *)(v0 + 352))
  {
    char v93 = *(void **)(v0 + 336);
    swift_bridgeObjectRelease();

    **(void **)(v0 + 96) = v91;
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v94 = *(uint64_t (**)(void))(v0 + 8);
    return v94();
  }
  else
  {
    *(void *)(v0 + 360) = v91;
    *(void *)(v0 + 368) = v92;
    uint64_t v96 = *(void *)(v0 + 344);
    if ((v96 & 0xC000000000000001) != 0) {
      id v97 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v97 = *(id *)(v96 + 8 * v92 + 32);
    }
    *(void *)(v0 + 376) = v97;
    uint64_t v98 = *(void *)(v0 + 272);
    uint64_t v99 = *(void *)(v0 + 112);
    uint64_t v100 = CNContact.people_normalizedHandles.getter();
    *(void *)(v0 + 384) = v100;
    uint64_t v101 = *sub_1000070F4((void *)(v99 + 104), *(void *)(v99 + 128));
    *(_DWORD *)(v0 + 472) = *(_DWORD *)(v98 + 64);
    uint64_t v102 = swift_allocObject();
    *(void *)(v0 + 392) = v102;
    *(void *)(v102 + 16) = v101;
    *(void *)(v102 + 24) = v100;
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t v103 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v103;
    *unint64_t v103 = v0;
    v103[1] = sub_1000390E4;
    uint64_t v104 = *(void *)(v0 + 320);
    uint64_t v105 = *(void *)(v0 + 272);
    return withTimeout<A>(after:_:)(v104, 1000000000000000000, 0, &unk_100067DF8, v102, v105);
  }
}

uint64_t sub_10003A890()
{
  swift_release();
  sub_10000900C(v0 + 24);
  sub_10000900C(v0 + 64);
  sub_10000900C(v0 + 104);
  swift_release();
  sub_10000905C(v0 + 152);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IMessageStatusSource()
{
  return self;
}

uint64_t sub_10003A914@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.readMessage(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_10003A988(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 160) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_10003A9CC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return StatusSource.debugID.getter(a1, WitnessTable);
}

uint64_t sub_10003AA20(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)(*v1 + 24);
  sub_1000070F4(v4, *(void *)(*v1 + 48));
  dispatch thunk of LaunchRecordReaderProtocol.reload()();
  sub_1000070F4(v4, *(void *)(v3 + 48));
  uint64_t v5 = dispatch thunk of LaunchRecordReaderProtocol.dates(forContactIdentifier:)();
  sub_1000070B0(&qword_1000669E8);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = v3;
  v6[4] = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  return Promise.__allocating_init(_:)();
}

uint64_t sub_10003AB00()
{
  return sub_100036FE4();
}

uint64_t sub_10003AB24(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10003B034(&qword_100067DC8, a2, (void (*)(uint64_t))type metadata accessor for IMessageStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003AB7C(uint64_t a1, uint64_t a2)
{
  return sub_10003B034(&qword_100067DD0, a2, (void (*)(uint64_t))type metadata accessor for IMessageStatusSource);
}

uint64_t sub_10003ABC4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003AC0C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100023ED4;
  return sub_100038704(a1, v4, v5, v6);
}

uint64_t sub_10003ACC0()
{
  return sub_10003B0AC((void (*)(void))&_swift_release, (void (*)(void))&_swift_bridgeObjectRelease, 32);
}

uint64_t sub_10003ACF0(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100023ED4;
  return sub_100036814(a1, v5, v4);
}

uint64_t sub_10003AD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100066A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100066A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AE6C()
{
  return sub_10003B0AC((void (*)(void))&_swift_bridgeObjectRelease, (void (*)(void))&_swift_release, 33);
}

uint64_t sub_10003AE9C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100023ED4;
  return sub_100037400(a1, v4, v5, v6);
}

uint64_t sub_10003AF50()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003AF88()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008F18;
  return sub_100038590();
}

uint64_t sub_10003B034(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_10003B07C()
{
  return sub_10003B0AC((void (*)(void))&_swift_release, (void (*)(void))&_swift_bridgeObjectRelease, 32);
}

uint64_t sub_10003B0AC(void (*a1)(void), void (*a2)(void), uint64_t a3)
{
  a1(*(void *)(v3 + 16));
  a2(*(void *)(v3 + 24));
  return _swift_deallocObject(v3, a3, 7);
}

uint64_t sub_10003B110(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  char v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100008F18;
  return sub_100036814(a1, v5, v4);
}

unint64_t sub_10003B1BC()
{
  unint64_t result = qword_100067E40;
  if (!qword_100067E40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100067E40);
  }
  return result;
}

uint64_t sub_10003B200(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  static PeopleLogger.daemon.getter();
  swift_unknownObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v18 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    string = xpc_dictionary_get_string(a1, _xpc_event_key_name);
    char v19 = a2;
    if (string)
    {
      unint64_t v14 = String.init(cString:)();
      unint64_t v16 = v15;
    }
    else
    {
      unint64_t v16 = 0x8000000100056B10;
      unint64_t v14 = 0xD000000000000021;
    }
    uint64_t v20 = sub_10002A278(v14, v16, v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "did receive xpc event: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    a2 = v19;
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v21[3] = (uint64_t)&type metadata for XPCEvent;
  v21[4] = (uint64_t)&off_100062478;
  v21[0] = (uint64_t)a1;
  swift_unknownObjectRetain();
  a2(v21);
  swift_unknownObjectRelease();
  return sub_10000900C((uint64_t)v21);
}

uint64_t type metadata accessor for XPCStreamHandler()
{
  return self;
}

void sub_10003B4C4(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10001210C(0, &qword_1000680C8);
    sub_1000431A0();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v20;
    uint64_t v18 = v21;
    uint64_t v2 = v22;
    int64_t v3 = v23;
    unint64_t v4 = v24;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v18 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v3 = 0;
  }
  uint64_t v17 = v2;
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_36;
    }
    sub_10001210C(0, &qword_1000680C8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v19;
    swift_unknownObjectRelease();
    int64_t v11 = v3;
    uint64_t v9 = v4;
    if (!v19) {
      goto LABEL_36;
    }
LABEL_26:
    id v15 = objc_msgSend(v12, "contactPredicate", v17);

    int64_t v3 = v11;
    unint64_t v4 = v9;
    if (v15)
    {
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      int64_t v3 = v11;
      unint64_t v4 = v9;
    }
  }
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    int64_t v11 = v3;
LABEL_25:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_36;
    }
    goto LABEL_26;
  }
  int64_t v11 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v11 >= v8) {
      goto LABEL_36;
    }
    unint64_t v13 = *(void *)(v18 + 8 * v11);
    if (!v13)
    {
      int64_t v14 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_36;
      }
      unint64_t v13 = *(void *)(v18 + 8 * v14);
      if (v13) {
        goto LABEL_23;
      }
      int64_t v14 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_36;
      }
      unint64_t v13 = *(void *)(v18 + 8 * v14);
      if (v13) {
        goto LABEL_23;
      }
      int64_t v14 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_36;
      }
      unint64_t v13 = *(void *)(v18 + 8 * v14);
      if (v13)
      {
LABEL_23:
        int64_t v11 = v14;
      }
      else
      {
        int64_t v11 = v3 + 5;
        if (v3 + 5 >= v8) {
          goto LABEL_36;
        }
        unint64_t v13 = *(void *)(v18 + 8 * v11);
        if (!v13)
        {
          int64_t v16 = v3 + 6;
          while (v8 != v16)
          {
            unint64_t v13 = *(void *)(v18 + 8 * v16++);
            if (v13)
            {
              int64_t v11 = v16 - 1;
              goto LABEL_24;
            }
          }
LABEL_36:
          sub_100016970();
          return;
        }
      }
    }
LABEL_24:
    uint64_t v9 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

void *sub_10003B7EC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    unint64_t v10 = _swiftEmptyArrayStorage;
    sub_10000D714(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = _swiftEmptyArrayStorage;
    do
    {
      sub_100008758(v4, (uint64_t)v8);
      sub_1000070B0(&qword_100066CF0);
      sub_1000070B0(&qword_100066CE0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000D714(0, v2[2] + 1, 1);
        uint64_t v2 = v10;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000D714(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v10;
      }
      v2[2] = v6 + 1;
      sub_1000087BC(&v9, (uint64_t)&v2[5 * v6 + 4]);
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *sub_10003B928(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CalendarPersonStatus();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v22 = _swiftEmptyArrayStorage;
    sub_10000D794(0, v6, 0);
    uint64_t v7 = v22;
    unint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    long long v9 = v10;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v18 = *(void *)(v8 + 56);
    do
    {
      v9(v5, v11, v2);
      uint64_t v22 = v7;
      unint64_t v13 = v7[2];
      unint64_t v12 = v7[3];
      if (v13 >= v12 >> 1) {
        sub_10000D794(v12 > 1, v13 + 1, 1);
      }
      uint64_t v20 = v2;
      uint64_t v21 = sub_1000402A8(&qword_100068040, 255, (void (*)(uint64_t))&type metadata accessor for CalendarPersonStatus);
      int64_t v14 = sub_100007180((uint64_t *)&v19);
      v9((char *)v14, (uint64_t)v5, v2);
      id v15 = v22;
      v22[2] = v13 + 1;
      sub_1000087BC(&v19, (uint64_t)&v15[5 * v13 + 4]);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      uint64_t v7 = v22;
      v11 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_10003BB28()
{
  _StringGuts.grow(_:)(33);
  v0._object = (void *)0x8000000100057330;
  v0._countAndFlagsBits = 0xD00000000000001FLL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

uint64_t sub_10003BBB8(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = type metadata accessor for Date();
  v3[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[8] = v5;
  v3[9] = *(void *)(v5 + 64);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  sub_1000070B0(&qword_100066A38);
  v3[12] = swift_task_alloc();
  return _swift_task_switch(sub_10003BCC4, 0, 0);
}

uint64_t sub_10003BCC4()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v21 = v1;
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v6 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v20 = v0[6];
  uint64_t v8 = v0[4];
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v1, 1, 1, v9);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v10(v2, v8, v6);
  v10(v4, v7, v6);
  uint64_t v11 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = (v11 + 40) & ~v11;
  uint64_t v13 = (v3 + v11 + v12) & ~v11;
  int64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = v20;
  id v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  v15(&v14[v12], v2, v6);
  v15(&v14[v13], v4, v6);
  swift_retain();
  uint64_t v16 = sub_100016F84(v21, (uint64_t)&unk_1000680E0, (uint64_t)v14);
  v0[13] = v16;
  uint64_t v17 = (void *)swift_task_alloc();
  v0[14] = v17;
  uint64_t v18 = sub_1000070B0(&qword_1000671A8);
  void *v17 = v0;
  v17[1] = sub_10003BED8;
  return Task.result.getter(v0 + 2, v16, v18, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_10003BED8()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10003BFF0, 0, 0);
}

uint64_t sub_10003BFF0(uint64_t a1)
{
  if (*(unsigned char *)(v1 + 24))
  {
    return _swift_willThrowTypedImpl(a1, &type metadata for Never, &protocol witness table for Never);
  }
  else
  {
    uint64_t v2 = *(void *)(v1 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 8);
    return v3(v2);
  }
}

uint64_t sub_10003C0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return _swift_task_switch(sub_10003C0D8, 0, 0);
}

void sub_10003C0D8()
{
  uint64_t v1 = *(void **)(v0[3] + 24);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  Class v3 = Date._bridgeToObjectiveC()().super.isa;
  id v4 = [v1 predicateForEventsWithStartDate:isa endDate:v3 calendars:0];

  id v5 = [v1 eventsMatchingPredicate:v4];
  sub_10001210C(0, &qword_100067168);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    goto LABEL_15;
  }
LABEL_3:
  if (v7 < 1)
  {
    __break(1u);
    return;
  }
  id v13 = v4;
  for (uint64_t i = 0; i != v7; ++i)
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v9 = *(id *)(v6 + 8 * i + 32);
    }
    unint64_t v10 = v9;
    if (([v9 isAllDay] & 1) != 0 || objc_msgSend(v10, "status") == (id)3)
    {
    }
    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
  }
  swift_bridgeObjectRelease();
  id v4 = v13;
LABEL_16:
  uint64_t v11 = (void *)v0[2];

  void *v11 = _swiftEmptyArrayStorage;
  uint64_t v12 = (void (*)(void))v0[1];
  v12();
}

uint64_t sub_10003C314(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return _swift_task_switch(sub_10003C334, 0, 0);
}

uint64_t sub_10003C334()
{
  if ([*(id *)(v0 + 48) hasAttendees])
  {
    id v1 = [*(id *)(v0 + 48) attendees];
    if (v1)
    {
      uint64_t v2 = v1;
      sub_10001210C(0, &qword_100068050);
      unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v24 = (unint64_t)_swiftEmptyArrayStorage;
      if (v3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
        id v4 = (void *)swift_bridgeObjectRelease();
        if (v8)
        {
LABEL_5:
          if (v8 < 1)
          {
            __break(1u);
            goto LABEL_36;
          }
          for (uint64_t i = 0; i != v8; ++i)
          {
            if ((v3 & 0xC000000000000001) != 0) {
              id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v10 = *(id *)(v3 + 8 * i + 32);
            }
            uint64_t v11 = v10;
            if ((objc_msgSend(v10, "isCurrentUser", v24) & 1) != 0
              || [v11 participantStatus] == (id)3)
            {
            }
            else
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
              specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized ContiguousArray._endMutation()();
            }
          }
          swift_bridgeObjectRelease();
          unint64_t v14 = v24;
          if ((v24 & 0x8000000000000000) != 0) {
            goto LABEL_31;
          }
LABEL_22:
          if ((v14 & 0x4000000000000000) == 0)
          {
            uint64_t v15 = *(void *)(v14 + 16);
            if (!v15) {
              goto LABEL_32;
            }
LABEL_24:
            id v4 = (void *)specialized ContiguousArray.reserveCapacity(_:)();
            if ((v15 & 0x8000000000000000) == 0)
            {
              uint64_t v16 = 0;
              do
              {
                if ((v14 & 0xC000000000000001) != 0) {
                  id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                }
                else {
                  id v17 = *(id *)(v14 + 8 * v16 + 32);
                }
                uint64_t v18 = v17;
                ++v16;
                id v19 = [v17 contactPredicate];

                specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                specialized ContiguousArray._endMutation()();
              }
              while (v15 != v16);
              goto LABEL_32;
            }
LABEL_36:
            __break(1u);
            return dispatch thunk of ContactFetcherProtocol.contacts(withPredicates:includeImages:)(v4, v5, v6, v7);
          }
LABEL_31:
          swift_bridgeObjectRetain();
          uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
          swift_release();
          if (!v15)
          {
LABEL_32:
            swift_release();
            *(void *)(v0 + 64) = _swiftEmptyArrayStorage;
            uint64_t v20 = *(void **)(v0 + 56);
            uint64_t v21 = v20[7];
            uint64_t v22 = v20[8];
            sub_1000070F4(v20 + 4, v21);
            int64_t v23 = (void *)swift_task_alloc();
            *(void *)(v0 + 72) = v23;
            void *v23 = v0;
            v23[1] = sub_10003C6D0;
            id v4 = _swiftEmptyArrayStorage;
            uint64_t v5 = 0;
            uint64_t v6 = v21;
            uint64_t v7 = v22;
            return dispatch thunk of ContactFetcherProtocol.contacts(withPredicates:includeImages:)(v4, v5, v6, v7);
          }
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v8) {
          goto LABEL_5;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        goto LABEL_31;
      }
      goto LABEL_22;
    }
  }
  uint64_t v12 = *(uint64_t (**)(void *))(v0 + 8);
  return v12(&_swiftEmptySetSingleton);
}

uint64_t sub_10003C6D0(uint64_t a1)
{
  *(void *)(*(void *)v2 + 80) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    swift_bridgeObjectRelease();
    unint64_t v3 = sub_10003CB20;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v3 = sub_10003C820;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10003C820()
{
  uint64_t v1 = *(void *)(v0 + 80);
  unint64_t v2 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.count.getter();
    if (v3) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v26 = sub_100022E04((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    uint64_t v27 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v27(v26);
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3) {
    goto LABEL_6;
  }
LABEL_3:
  sub_10000D774(0, v3 & ~(v3 >> 63), 0);
  if (v2)
  {
    uint64_t result = __CocoaSet.startIndex.getter();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_100040B74(*(void *)(v0 + 80));
    char v6 = v7 & 1;
  }
  uint64_t v28 = result;
  uint64_t v29 = v5;
  char v30 = v6;
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = &qword_100066F98;
    do
    {
      while (1)
      {
        sub_100040904(v28, v29, v30, *(void *)(v0 + 80), v8);
        id v17 = v16;
        id v18 = [v16 identifier];
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v21 = v20;

        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0) {
          uint64_t result = sub_10000D774(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v23 = _swiftEmptyArrayStorage[2];
        unint64_t v22 = _swiftEmptyArrayStorage[3];
        if (v23 >= v22 >> 1) {
          uint64_t result = sub_10000D774(v22 > 1, v23 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v23 + 1;
        unint64_t v24 = &_swiftEmptyArrayStorage[2 * v23];
        v24[4] = v19;
        void v24[5] = v21;
        if (v2) {
          break;
        }
        int64_t v9 = sub_100040820(v28, v29, v30, *(void *)(v0 + 80));
        uint64_t v11 = v10;
        uint64_t v12 = v8;
        char v14 = v13;
        sub_100042C68(v28, v29, v30);
        uint64_t v28 = v9;
        uint64_t v29 = v11;
        char v15 = v14 & 1;
        uint64_t v8 = v12;
        unint64_t v2 = 0;
        char v30 = v15;
        if (!--v3) {
          goto LABEL_20;
        }
      }
      if ((v30 & 1) == 0) {
        goto LABEL_25;
      }
      if (__CocoaSet.Index.handleBitPattern.getter()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_1000070B0(&qword_1000680C0);
      uint64_t v25 = (void (*)(uint64_t, void))Set.Index._asCocoa.modify();
      __CocoaSet.formIndex(after:isUnique:)();
      v25(v0 + 16, 0);
      --v3;
    }
    while (v3);
LABEL_20:
    sub_100042C68(v28, v29, v30);
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10003CB20()
{
  uint64_t v1 = sub_100022E04((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  unint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10003CB98(uint64_t a1)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = v1;
  return _swift_task_switch(sub_10003CBB8, 0, 0);
}

uint64_t sub_10003CBB8()
{
  Swift::Int v1 = (Swift::Int)[*(id *)(v0 + 64) calendar];
  if (!v1)
  {
LABEL_31:
    __break(1u);
    return dispatch thunk of ContactFetcherProtocol.contacts(withPredicates:includeImages:)(v1, v2, v3, v4);
  }
  uint64_t v5 = (void *)v1;
  id v6 = [(id)v1 sharees];

  if (v6)
  {
    uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v8 = sub_10003D39C(v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
      if ((v8 & 0xC000000000000001) != 0)
      {
        int64_t v9 = &_swiftEmptySetSingleton;
        __CocoaSet.makeIterator()();
        uint64_t v10 = __CocoaSet.Iterator.next()();
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = (id *)(v0 + 48);
          sub_10001210C(0, &qword_1000680C8);
          do
          {
            *(void *)(v0 + 56) = v11;
            swift_dynamicCast();
            id v13 = [*v12 shareeStatus];
            id v14 = *v12;
            if (v13 == (id)1)
            {
              unint64_t v15 = *((void *)&_swiftEmptySetSingleton + 2);
              if (*((void *)&_swiftEmptySetSingleton + 3) <= v15)
              {
                sub_10001DE24(v15 + 1);
                int64_t v9 = &_swiftEmptySetSingleton;
              }
              Swift::Int v1 = NSObject._rawHashValue(seed:)(*((void *)&_swiftEmptySetSingleton + 5));
              uint64_t v16 = (char *)&_swiftEmptySetSingleton + 56;
              uint64_t v17 = -1 << *((unsigned char *)&_swiftEmptySetSingleton + 32);
              unint64_t v18 = v1 & ~v17;
              unint64_t v19 = v18 >> 6;
              if (((-1 << v18) & ~*((void *)&_swiftEmptySetSingleton + (v18 >> 6) + 7)) != 0)
              {
                unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*((void *)&_swiftEmptySetSingleton + (v18 >> 6) + 7))) | v18 & 0x7FFFFFFFFFFFFFC0;
              }
              else
              {
                char v21 = 0;
                unint64_t v22 = (unint64_t)(63 - v17) >> 6;
                do
                {
                  if (++v19 == v22 && (v21 & 1) != 0)
                  {
                    __break(1u);
                    goto LABEL_31;
                  }
                  BOOL v23 = v19 == v22;
                  if (v19 == v22) {
                    unint64_t v19 = 0;
                  }
                  v21 |= v23;
                  uint64_t v24 = *(void *)&v16[8 * v19];
                }
                while (v24 == -1);
                unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
              }
              *(void *)&v16[(v20 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v20;
              *(void *)(*((void *)&_swiftEmptySetSingleton + 6) + 8 * v20) = v14;
              ++*((void *)&_swiftEmptySetSingleton + 2);
            }
            else
            {
            }
            uint64_t v11 = __CocoaSet.Iterator.next()();
          }
          while (v11);
        }
        swift_release();
      }
      else
      {
        int64_t v9 = (void *)sub_1000402F0(v8, (uint64_t (*)(char *, unint64_t, uint64_t))sub_100040468);
      }
      uint64_t v27 = *(void **)(v0 + 72);
      sub_10003B4C4((uint64_t)v9);
      Swift::Int v29 = v28;
      *(void *)(v0 + 80) = v28;
      swift_release();
      uint64_t v30 = v27[7];
      uint64_t v31 = v27[8];
      sub_1000070F4(v27 + 4, v30);
      uint64_t v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 88) = v32;
      *uint64_t v32 = v0;
      v32[1] = sub_10003CF4C;
      Swift::Int v1 = v29;
      uint64_t v2 = 0;
      uint64_t v3 = v30;
      uint64_t v4 = v31;
      return dispatch thunk of ContactFetcherProtocol.contacts(withPredicates:includeImages:)(v1, v2, v3, v4);
    }
  }
  uint64_t v25 = *(uint64_t (**)(void *))(v0 + 8);
  return v25(&_swiftEmptySetSingleton);
}

uint64_t sub_10003CF4C(uint64_t a1)
{
  *(void *)(*(void *)v2 + 96) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_10003CB20;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_10003D09C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10003D09C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  unint64_t v2 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.count.getter();
    if (v3) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v26 = sub_100022E04((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    uint64_t v27 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v27(v26);
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3) {
    goto LABEL_6;
  }
LABEL_3:
  sub_10000D774(0, v3 & ~(v3 >> 63), 0);
  if (v2)
  {
    uint64_t result = __CocoaSet.startIndex.getter();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_100040B74(*(void *)(v0 + 96));
    char v6 = v7 & 1;
  }
  uint64_t v28 = result;
  uint64_t v29 = v5;
  char v30 = v6;
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = &qword_100066F98;
    do
    {
      while (1)
      {
        sub_100040904(v28, v29, v30, *(void *)(v0 + 96), v8);
        uint64_t v17 = v16;
        id v18 = [v16 identifier];
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v21 = v20;

        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0) {
          uint64_t result = sub_10000D774(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v23 = _swiftEmptyArrayStorage[2];
        unint64_t v22 = _swiftEmptyArrayStorage[3];
        if (v23 >= v22 >> 1) {
          uint64_t result = sub_10000D774(v22 > 1, v23 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v23 + 1;
        uint64_t v24 = &_swiftEmptyArrayStorage[2 * v23];
        v24[4] = v19;
        void v24[5] = v21;
        if (v2) {
          break;
        }
        int64_t v9 = sub_100040820(v28, v29, v30, *(void *)(v0 + 96));
        uint64_t v11 = v10;
        uint64_t v12 = v8;
        char v14 = v13;
        sub_100042C68(v28, v29, v30);
        uint64_t v28 = v9;
        uint64_t v29 = v11;
        char v15 = v14 & 1;
        uint64_t v8 = v12;
        unint64_t v2 = 0;
        char v30 = v15;
        if (!--v3) {
          goto LABEL_20;
        }
      }
      if ((v30 & 1) == 0) {
        goto LABEL_25;
      }
      if (__CocoaSet.Index.handleBitPattern.getter()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_1000070B0(&qword_1000680C0);
      uint64_t v25 = (void (*)(uint64_t, void))Set.Index._asCocoa.modify();
      __CocoaSet.formIndex(after:isUnique:)();
      v25(v0 + 16, 0);
      --v3;
    }
    while (v3);
LABEL_20:
    sub_100042C68(v28, v29, v30);
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10003D39C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000070B0(&qword_100067190);
    unint64_t v2 = (void *)static _SetStorage.allocate(capacity:)();
  }
  else
  {
    unint64_t v2 = &_swiftEmptySetSingleton;
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
  char v6 = (char *)(v2 + 7);
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
    sub_1000087D4(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v28);
    v16.Class isa = AnyHashable._bridgeToObjectiveC()().isa;
    sub_100008830((uint64_t)v28);
    self;
    uint64_t v17 = swift_dynamicCastObjCClass();
    if (!v17)
    {
      swift_release_n();

      sub_100016970();
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
    sub_100016970();
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

BOOL sub_10003D6DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10003D6F4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10003D73C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10003D768()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_10003D7AC()
{
  Swift::UInt v1 = *(void **)v0;
  Swift::UInt v2 = *(unsigned __int8 *)(v0 + 8);
  Hasher.init(_seed:)();
  id v3 = v1;
  NSObject.hash(into:)();

  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_10003D814()
{
  Swift::UInt v1 = *(unsigned __int8 *)(v0 + 8);
  id v2 = *(id *)v0;
  NSObject.hash(into:)();

  Hasher._combine(_:)(v1);
}

Swift::Int sub_10003D864()
{
  Swift::UInt v1 = *(void **)v0;
  Swift::UInt v2 = *(unsigned __int8 *)(v0 + 8);
  Hasher.init(_seed:)();
  id v3 = v1;
  NSObject.hash(into:)();

  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10003D8C8(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  sub_10001210C(0, &qword_100067180);
  return static NSObject.== infix(_:_:)() & ~(v2 ^ v3) & 1;
}

uint64_t sub_10003D934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = v4;
  *(void *)(v5 + 24) = a1;
  uint64_t v8 = type metadata accessor for Date();
  *(void *)(v5 + 48) = v8;
  *(void *)(v5 + 56) = *(void *)(v8 - 8);
  *(void *)(v5 + 64) = swift_task_alloc();
  *(void *)(v5 + 72) = swift_task_alloc();
  uint64_t v9 = sub_1000070B0(&qword_100068060) - 8;
  uint64_t v10 = swift_task_alloc();
  *(void *)(v5 + 80) = v10;
  uint64_t v11 = sub_1000070B0((uint64_t *)&unk_100067650);
  int64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v10, a3, v11);
  uint64_t v13 = *(int *)(v9 + 56);
  *(_DWORD *)(v5 + 120) = v13;
  v12(v10 + v13, a4, v11);
  return _swift_task_switch(sub_10003DAC4, 0, 0);
}

uint64_t sub_10003DAC4()
{
  if (*(void *)(v0[3] + 16))
  {
    static Date.- infix(_:_:)();
    static Date.+ infix(_:_:)();
    Swift::UInt v1 = (void *)swift_task_alloc();
    v0[11] = v1;
    void *v1 = v0;
    v1[1] = sub_10003DC14;
    uint64_t v2 = v0[8];
    uint64_t v3 = v0[9];
    return sub_10003BBB8(v3, v2);
  }
  else
  {
    uint64_t v5 = v0[10];
    unint64_t v6 = sub_100006184((uint64_t)_swiftEmptyArrayStorage);
    sub_10001223C(v5, &qword_100068060);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v7 = (uint64_t (*)(unint64_t))v0[1];
    return v7(v6);
  }
}

uint64_t sub_10003DC14(uint64_t a1)
{
  uint64_t v5 = *(void **)v2;
  uint64_t v4 = *(void **)v2;
  uint64_t v6 = *(void *)(*(void *)v2 + 56);
  swift_task_dealloc();
  char v7 = (void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v4[9];
  uint64_t v9 = v4[8];
  uint64_t v10 = v4[6];
  if (v1)
  {
    swift_errorRelease();
    uint64_t v11 = *v7;
    (*v7)(v9, v10);
    v11(v8, v10);
    int64_t v12 = sub_10003E0D4;
  }
  else
  {
    v5[12] = a1;
    uint64_t v13 = *v7;
    (*v7)(v9, v10);
    v13(v8, v10);
    int64_t v12 = sub_10003DDF8;
  }
  return _swift_task_switch(v12, 0, 0);
}

uint64_t sub_10003DDF8()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = sub_1000070B0(&qword_100068068);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  long long v5[2] = v1;
  v5[3] = v2;
  v5[4] = v3;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[14] = v6;
  void *v6 = v0;
  v6[1] = sub_10003DF0C;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v0 + 2, v4, v4, 0, 0, &unk_100068078, v5, v4);
}

uint64_t sub_10003DF0C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return _swift_task_switch(sub_10003E040, 0, 0);
}

uint64_t sub_10003E040()
{
  sub_10001223C(v0[10], &qword_100068060);
  uint64_t v1 = v0[2];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_10003E0D4()
{
  uint64_t v1 = *(void *)(v0 + 80);
  unint64_t v2 = sub_100006184((uint64_t)_swiftEmptyArrayStorage);
  sub_10001223C(v1, &qword_100068060);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_10003E178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[21] = a4;
  v5[22] = a5;
  v5[19] = a2;
  v5[20] = a3;
  v5[18] = a1;
  sub_1000070B0(&qword_100066A38);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  v5[26] = swift_task_alloc();
  uint64_t v6 = sub_1000070B0(&qword_100068080);
  v5[27] = v6;
  v5[28] = *(void *)(v6 - 8);
  v5[29] = swift_task_alloc();
  return _swift_task_switch(sub_10003E29C, 0, 0);
}

uint64_t sub_10003E29C()
{
  unint64_t v1 = *(void *)(v0 + 160);
  *(void *)(v0 + 128) = sub_100006184((uint64_t)_swiftEmptyArrayStorage);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v2 = v3;
    if (v3) {
      goto LABEL_3;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    sub_1000070B0(&qword_100068068);
    TaskGroup.makeAsyncIterator()();
    *(void *)(v0 + 240) = 0;
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v40;
    *uint64_t v40 = v0;
    v40[1] = sub_10003E888;
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v3 = v0 + 136;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    return TaskGroup.Iterator.next(isolation:)(v3, v4, v5, v6);
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v3 = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_25;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v7 = 0;
    unint64_t v43 = v1 & 0xC000000000000001;
    uint64_t v42 = *(void *)(v0 + 160) + 32;
    uint64_t v44 = v2;
    while (1)
    {
      uint64_t v46 = v7;
      if (v43) {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v9 = *(id *)(v42 + 8 * v7);
      }
      uint64_t v10 = v9;
      uint64_t v12 = *(void *)(v0 + 200);
      uint64_t v11 = *(void *)(v0 + 208);
      uint64_t v13 = *(void *)(v0 + 168);
      uint64_t v14 = *(void *)(v0 + 176);
      uint64_t v15 = type metadata accessor for TaskPriority();
      uint64_t v16 = *(void *)(v15 - 8);
      unint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
      v49(v11, 1, 1, v15);
      uint64_t v17 = (void *)swift_allocObject();
      v17[2] = 0;
      void v17[3] = 0;
      v17[4] = v13;
      v17[5] = v10;
      v17[6] = v14;
      sub_100042E6C(v11, v12);
      unint64_t v48 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
      LODWORD(v11) = v48(v12, 1, v15);
      swift_retain();
      id v47 = v10;
      swift_bridgeObjectRetain();
      uint64_t v18 = *(void *)(v0 + 200);
      if (v11 == 1)
      {
        sub_10001223C(*(void *)(v0 + 200), &qword_100066A38);
      }
      else
      {
        TaskPriority.rawValue.getter();
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v15);
      }
      uint64_t v45 = v16;
      if (v17[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v19 = dispatch thunk of Actor.unownedExecutor.getter();
        uint64_t v21 = v20;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v21 = 0;
      }
      uint64_t v22 = **(void **)(v0 + 152);
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = &unk_1000680A0;
      *(void *)(v23 + 24) = v17;
      sub_1000070B0(&qword_100068068);
      uint64_t v24 = v21 | v19;
      if (v21 | v19)
      {
        uint64_t v24 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v19;
        *(void *)(v0 + 40) = v21;
      }
      uint64_t v25 = *(void *)(v0 + 208);
      uint64_t v26 = *(void *)(v0 + 184);
      uint64_t v27 = *(void *)(v0 + 192);
      uint64_t v28 = *(void *)(v0 + 168);
      uint64_t v29 = *(void *)(v0 + 176);
      *(void *)(v0 + 80) = 1;
      *(void *)(v0 + 88) = v24;
      *(void *)(v0 + 96) = v22;
      swift_task_create();
      swift_release();
      sub_10001223C(v25, &qword_100066A38);
      v49(v27, 1, 1, v15);
      char v30 = (void *)swift_allocObject();
      v30[2] = 0;
      uint64_t v31 = v30 + 2;
      v30[3] = 0;
      v30[4] = v28;
      v30[5] = v47;
      v30[6] = v29;
      sub_100042E6C(v27, v26);
      LODWORD(v25) = v48(v26, 1, v15);
      swift_retain();
      id v32 = v47;
      swift_bridgeObjectRetain();
      uint64_t v33 = *(void *)(v0 + 184);
      if (v25 == 1)
      {
        sub_10001223C(*(void *)(v0 + 184), &qword_100066A38);
        if (!*v31) {
          goto LABEL_21;
        }
      }
      else
      {
        TaskPriority.rawValue.getter();
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v33, v15);
        if (!*v31)
        {
LABEL_21:
          uint64_t v34 = 0;
          uint64_t v36 = 0;
          goto LABEL_22;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v34 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v36 = v35;
      swift_unknownObjectRelease();
LABEL_22:
      uint64_t v37 = **(void **)(v0 + 152);
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = &unk_1000680B0;
      *(void *)(v38 + 24) = v30;
      uint64_t v39 = v36 | v34;
      if (v36 | v34)
      {
        uint64_t v39 = v0 + 48;
        *(void *)(v0 + 48) = 0;
        *(void *)(v0 + 56) = 0;
        *(void *)(v0 + 64) = v34;
        *(void *)(v0 + 72) = v36;
      }
      uint64_t v7 = v46 + 1;
      uint64_t v8 = *(void *)(v0 + 192);
      *(void *)(v0 + 104) = 1;
      *(void *)(v0 + 112) = v39;
      *(void *)(v0 + 120) = v37;
      swift_task_create();

      swift_release();
      sub_10001223C(v8, &qword_100066A38);
      if (v44 == v46 + 1) {
        goto LABEL_25;
      }
    }
  }
  __break(1u);
  return TaskGroup.Iterator.next(isolation:)(v3, v4, v5, v6);
}

uint64_t sub_10003E888()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003E984, 0, 0);
}

uint64_t sub_10003E984()
{
  uint64_t v1 = v0[17];
  if (v1)
  {
    uint64_t v2 = v0[30];
    *(void *)(swift_task_alloc() + 16) = v0 + 16;
    sub_100042120(v1, (void (*)(uint64_t, uint64_t, uint64_t))sub_100043198);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v0[30] = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[31] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_10003E888;
    uint64_t v4 = v0[27];
    return TaskGroup.Iterator.next(isolation:)(v0 + 17, 0, 0, v4);
  }
  else
  {
    uint64_t v5 = (void *)v0[18];
    (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
    *uint64_t v5 = v0[16];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_10003EB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a1;
  id v9 = (void *)swift_task_alloc();
  v6[5] = v9;
  *id v9 = v6;
  v9[1] = sub_10003EBE8;
  v9[6] = a5;
  v9[7] = a4;
  return _swift_task_switch(sub_10003C334, 0, 0);
}

uint64_t sub_10003EBE8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10003ECE8, 0, 0);
}

uint64_t sub_10003ECE8()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (uint64_t *)v0[2];
  uint64_t v3 = sub_1000470FC(v0[4], v0[6]);
  uint64_t v4 = (void *)sub_100006184((uint64_t)_swiftEmptyArrayStorage);
  id v5 = v1;
  uint64_t v6 = sub_1000422C0(v4, v3, v5, 0);

  swift_release();
  uint64_t *v2 = v6;
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10003EDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a1;
  uint64_t v9 = (void *)swift_task_alloc();
  v6[5] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_10003EE60;
  v9[8] = a5;
  v9[9] = a4;
  return _swift_task_switch(sub_10003CBB8, 0, 0);
}

uint64_t sub_10003EE60(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10003EF60, 0, 0);
}

uint64_t sub_10003EF60()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (uint64_t *)v0[2];
  uint64_t v3 = sub_1000470FC(v0[4], v0[6]);
  uint64_t v4 = (void *)sub_100006184((uint64_t)_swiftEmptyArrayStorage);
  id v5 = v1;
  uint64_t v6 = sub_1000422C0(v4, v3, v5, 1);

  swift_release();
  uint64_t *v2 = v6;
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10003F020(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *a4;
  uint64_t v19 = *a4;
  *a4 = 0x8000000000000000;
  unint64_t v12 = sub_1000071E4(a1, a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_12;
  }
  char v4 = v11;
  if (*(void *)(v10 + 24) >= v15)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_12:
    sub_10000859C();
    uint64_t v10 = v19;
    goto LABEL_6;
  }
  sub_100007B6C(v15, isUniquelyReferenced_nonNull_native);
  uint64_t v10 = v19;
  unint64_t v16 = sub_1000071E4(a1, a2);
  if ((v4 & 1) != (v17 & 1))
  {
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v16;
LABEL_6:
  *a4 = v10;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
    sub_100008194(v12, a1, a2, &_swiftEmptySetSingleton, *a4);
    swift_bridgeObjectRetain();
  }
  sub_10003F184(a3);
  return swift_bridgeObjectRelease();
}

void sub_10003F184(uint64_t a1)
{
  int64_t v2 = 0;
  uint64_t v3 = a1 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_10001D498((uint64_t)v13, *(id *)(*(void *)(a1 + 48) + 16 * v9), *(unsigned char *)(v9 + 8));
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_22;
  }
LABEL_23:
  swift_release();
}

uint64_t sub_10003F304(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Date();
  v2[12] = v5;
  v2[13] = *(void *)(v5 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for PeopleFeatureFlagNames();
  v2[15] = v6;
  v2[16] = *(void *)(v6 - 8);
  v2[17] = swift_task_alloc();
  return _swift_task_switch(sub_10003F4EC, 0, 0);
}

uint64_t sub_10003F4EC()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for PeopleFeatureFlagNames.calendarStatus(_:), v3);
  char v4 = dispatch thunk of FeatureFlagsProvider.isEnabled(_:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    Date.init()();
    uint64_t v5 = self;
    id v6 = [v5 hours];
    sub_10001210C(0, (unint64_t *)&qword_100066E70);
    Measurement.init(value:unit:)();
    id v7 = [v5 hours];
    Measurement.init(value:unit:)();
    uint64_t v8 = (void *)swift_task_alloc();
    v0[18] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_10003F708;
    uint64_t v9 = v0[14];
    uint64_t v11 = v0[10];
    uint64_t v10 = v0[11];
    uint64_t v12 = v0[3];
    return sub_10003D934(v12, v9, v10, v11);
  }
  else
  {
    unint64_t v14 = sub_10000604C((uint64_t)_swiftEmptyArrayStorage);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(unint64_t))v0[1];
    return v15(v14);
  }
}

uint64_t sub_10003F708(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 112);
  uint64_t v3 = *(void *)(*(void *)v1 + 104);
  uint64_t v4 = *(void *)(*(void *)v1 + 96);
  uint64_t v5 = *(void *)(*(void *)v1 + 88);
  uint64_t v6 = *(void *)(*(void *)v1 + 80);
  uint64_t v7 = *(void *)(*(void *)v1 + 72);
  uint64_t v8 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v9(v6, v8);
  v9(v5, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_10003F8F4, 0, 0);
}

uint64_t sub_10003F8F4()
{
  uint64_t v19 = v0;
  uint64_t v1 = v0[19];
  unint64_t v2 = sub_10000604C((uint64_t)_swiftEmptyArrayStorage);
  swift_retain();
  uint64_t v3 = sub_100042A84(v2, v1);
  swift_release();
  swift_bridgeObjectRelease();
  static PeopleLogger.common.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v15 = v0[6];
    uint64_t v16 = v0[5];
    uint64_t v17 = v0[7];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_1000070B0(&qword_100068038);
    uint64_t v7 = Dictionary.description.getter();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    v0[2] = sub_10002A278(v7, v9, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "CalendarStatusSource returning statuses %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v11 = v0[6];
    uint64_t v10 = v0[7];
    uint64_t v12 = v0[5];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v3);
}

uint64_t sub_10003FBA8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_1000402F0(v6, (uint64_t (*)(char *, unint64_t, uint64_t))sub_100040608);
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v37 = v3;
  uint64_t v38 = a1;
  uint64_t v36 = v4;
  if (v8)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t result = sub_100040780(v7);
    int64_t v10 = result;
    int v12 = v11;
    char v14 = v13 & 1;
    while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(unsigned char *)(v7 + 32))
    {
      if (((*(void *)(v7 + 56 + (((unint64_t)v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_21;
      }
      if (*(_DWORD *)(v7 + 36) != v12) {
        goto LABEL_22;
      }
      id v15 = *(id *)(*(void *)(v7 + 48) + 16 * v10);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t result = sub_100040820(v10, v12, v14 & 1, v7);
      int64_t v10 = result;
      int v12 = v16;
      char v14 = v17 & 1;
      if (!--v8)
      {
        sub_100042C68(result, v16, v17 & 1);
        swift_release();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  swift_release();
LABEL_10:
  uint64_t v18 = sub_100022EFC((unint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1000428B8(v5, v18);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    uint64_t v35 = v18;
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t result = sub_100040780(v19);
    int64_t v21 = result;
    int v23 = v22;
    char v25 = v24 & 1;
    while ((v21 & 0x8000000000000000) == 0 && v21 < 1 << *(unsigned char *)(v19 + 32))
    {
      if (((*(void *)(v19 + 56 + (((unint64_t)v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
        goto LABEL_24;
      }
      if (*(_DWORD *)(v19 + 36) != v23) {
        goto LABEL_25;
      }
      id v26 = *(id *)(*(void *)(v19 + 48) + 16 * v21);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t result = sub_100040820(v21, v23, v25 & 1, v19);
      int64_t v21 = result;
      int v23 = v27;
      char v25 = v28 & 1;
      if (!--v20)
      {
        sub_100042C68(result, v27, v28 & 1);
        swift_release();
        uint64_t v18 = v35;
        goto LABEL_19;
      }
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_19:
  swift_retain();
  uint64_t v29 = sub_100041BDC(v18);
  swift_bridgeObjectRelease();
  swift_release();
  swift_retain();
  uint64_t v30 = sub_100041F10((unint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_100040BFC(v29);
  swift_bridgeObjectRelease();
  uint64_t v32 = sub_100040BFC(v30);
  swift_bridgeObjectRelease();
  sub_10000E394(v32);
  uint64_t v33 = sub_10003B928(v31);
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v39 = *v38;
  *uint64_t v38 = 0x8000000000000000;
  sub_100008014((uint64_t)v33, v36, v37, isUniquelyReferenced_nonNull_native);
  *uint64_t v38 = v39;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003FFCC()
{
  swift_release();

  sub_10000900C(v0 + 32);
  sub_10000905C(v0 + 72);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CalendarStatusSource()
{
  return self;
}

uint64_t sub_100040040@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.calendar(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_1000400B4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 80) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_1000400F8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return StatusSource.debugID.getter(a1, WitnessTable);
}

uint64_t sub_10004014C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100006E10;
  return sub_10003F304(a1);
}

uint64_t sub_1000401E4()
{
  return sub_10003BB28();
}

uint64_t sub_100040208(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000402A8(&qword_100068028, a2, (void (*)(uint64_t))type metadata accessor for CalendarStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100040260(uint64_t a1, uint64_t a2)
{
  return sub_1000402A8(&qword_100068030, a2, (void (*)(uint64_t))type metadata accessor for CalendarStatusSource);
}

uint64_t sub_1000402A8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_1000402F0(uint64_t isStackAllocationSafe, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v4 = isStackAllocationSafe;
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = a2((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v6, v4);
    swift_release();
    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    unint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    uint64_t v8 = a2((char *)v9, v6, v4);
    swift_release();
    swift_slowDealloc();
  }
  return v8;
}

unint64_t *sub_100040468(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    uint64_t result = (unint64_t *)[*(id *)(*(void *)(a3 + 48) + 8 * v13) shareeStatus];
    if (result == (unint64_t *)1)
    {
      *(unint64_t *)((char *)v4 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return (unint64_t *)sub_100046954(v4, a2, v5, a3);
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v11) {
    goto LABEL_24;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100040608(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (unint64_t *)result;
  uint64_t v6 = 0;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v12) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v12) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v12) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
LABEL_5:
    if ((*(unsigned char *)(*(void *)(a3 + 48) + 16 * v14 + 8) & 1) == 0)
    {
      *(void *)(result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v6++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_100046E4C(v5, a2, v6, a3);
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v12) {
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100040780(uint64_t a1)
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

int64_t sub_100040820(int64_t result, int a2, char a3, uint64_t a4)
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

void sub_100040904(uint64_t a1, int a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_10001210C(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_10001210C(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v17;
  swift_unknownObjectRelease();
  Swift::Int v8 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v7 = (v7 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_23;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v14 = static NSObject.== infix(_:_:)();
    }
    while ((v14 & 1) == 0);
  }

LABEL_17:
  int64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v7);
  id v16 = v15;
}

uint64_t sub_100040B74(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_100040BFC(uint64_t a1)
{
  uint64_t v2 = sub_1000070B0(&qword_100068048);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  char v5 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v51 = (char *)v45 - v6;
  uint64_t v7 = type metadata accessor for CalendarPersonStatus();
  __chkstk_darwin(v7);
  uint64_t v53 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v55 = (char *)_swiftEmptyArrayStorage;
  uint64_t v50 = (v10 + 32) & ~v10;
  uint64_t v54 = (uint64_t)_swiftEmptyArrayStorage + v50;
  char v11 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v45[2] = v9 + 48;
  v45[3] = v9 + 16;
  uint64_t v46 = v9;
  int v52 = (uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 32);
  v45[1] = v10 | 7;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  unint64_t v14 = 0;
LABEL_4:
  unint64_t v16 = *(void *)(a1 + 16);
  if (v14 != v16)
  {
    if (v14 < v16)
    {
      while (1)
      {
        uint64_t v17 = *(void *)(a1 + 32 + 8 * v14);
        swift_bridgeObjectRetain();
        uint64_t result = swift_bridgeObjectRelease();
        if (v17) {
          break;
        }
LABEL_9:
        ++v14;
        unint64_t v18 = *(void *)(a1 + 16);
        if (v14 == v18) {
          goto LABEL_37;
        }
        if (v14 >= v18) {
          goto LABEL_43;
        }
      }
      unint64_t v15 = *(void *)(v17 + 16);
      if (!v15)
      {
        (*v11)(v5, 1, 1, v7);
        uint64_t result = sub_10001223C((uint64_t)v5, &qword_100068048);
        goto LABEL_9;
      }
      unint64_t v19 = 0;
      ++v14;
      while (1)
      {
        if (v19 >= v15) {
          goto LABEL_44;
        }
        uint64_t v20 = v13;
        uint64_t v21 = v46;
        uint64_t v22 = *(void *)(v46 + 72);
        unint64_t v48 = v19;
        uint64_t v49 = v22;
        (*(void (**)(char *, unint64_t, uint64_t))(v46 + 16))(v5, v17 + v50 + v22 * v19, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v5, 0, 1, v7);
        uint64_t v23 = (uint64_t)v51;
        sub_100042C74((uint64_t)v5, (uint64_t)v51);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v23, 1, v7) == 1)
        {
          swift_bridgeObjectRelease();
          uint64_t v41 = v55;
          uint64_t v13 = v20;
          goto LABEL_38;
        }
        id v47 = *v52;
        uint64_t result = v47(v53, v23, v7);
        if (!v20) {
          break;
        }
        uint64_t v24 = v20;
LABEL_35:
        BOOL v39 = __OFSUB__(v24, 1);
        uint64_t v13 = v24 - 1;
        if (v39) {
          goto LABEL_45;
        }
        unint64_t v19 = v48 + 1;
        uint64_t v40 = v54;
        uint64_t result = v47((char *)v54, (uint64_t)v53, v7);
        uint64_t v54 = v40 + v49;
        unint64_t v15 = *(void *)(v17 + 16);
        if (v19 == v15)
        {
          (*v11)(v5, 1, 1, v7);
          uint64_t result = sub_10001223C((uint64_t)v5, &qword_100068048);
          goto LABEL_4;
        }
      }
      unint64_t v25 = *((void *)v55 + 3);
      if ((uint64_t)((v25 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_47;
      }
      int64_t v26 = v25 & 0xFFFFFFFFFFFFFFFELL;
      if (v26 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v26;
      }
      sub_1000070B0(&qword_100067160);
      uint64_t v28 = v49;
      uint64_t v29 = v50;
      uint64_t v54 = v27;
      uint64_t v30 = (char *)swift_allocObject();
      uint64_t result = j__malloc_size(v30);
      if (!v28) {
        goto LABEL_48;
      }
      uint64_t v31 = result - v29;
      if (result - v29 == 0x8000000000000000 && v28 == -1) {
        goto LABEL_49;
      }
      uint64_t v33 = v31 / v28;
      uint64_t v34 = v55;
      *((void *)v30 + 2) = v54;
      *((void *)v30 + 3) = 2 * (v31 / v28);
      uint64_t v35 = &v30[v29];
      uint64_t v36 = *((void *)v34 + 3) >> 1;
      uint64_t v37 = v36 * v28;
      if (!*((void *)v34 + 2))
      {
LABEL_34:
        uint64_t v54 = (uint64_t)&v35[v37];
        uint64_t v55 = v30;
        uint64_t v24 = (v33 & 0x7FFFFFFFFFFFFFFFLL) - v36;
        uint64_t result = swift_release();
        goto LABEL_35;
      }
      if (v30 < v34 || v35 >= &v34[v50 + v37])
      {
        uint64_t v54 = v31 / v28;
        uint64_t v38 = v35;
        v45[0] = v37;
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        if (v30 == v55)
        {
LABEL_33:
          *((void *)v55 + 2) = 0;
          goto LABEL_34;
        }
        uint64_t v54 = v31 / v28;
        uint64_t v38 = v35;
        v45[0] = v37;
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v37 = v45[0];
      uint64_t v35 = v38;
      uint64_t v33 = v54;
      goto LABEL_33;
    }
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_37:
  uint64_t v23 = (uint64_t)v51;
  (*v11)(v51, 1, 1, v7);
  swift_bridgeObjectRelease();
  uint64_t v41 = v55;
LABEL_38:
  swift_bridgeObjectRelease();
  uint64_t result = sub_10001223C(v23, &qword_100068048);
  unint64_t v42 = *((void *)v41 + 3);
  if (v42 < 2) {
    return (uint64_t)v41;
  }
  unint64_t v43 = v42 >> 1;
  BOOL v39 = __OFSUB__(v43, v13);
  uint64_t v44 = v43 - v13;
  if (!v39)
  {
    *((void *)v41 + 2) = v44;
    return (uint64_t)v41;
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_100041104(char *a1, char a2, uint64_t a3)
{
  uint64_t v88 = a3;
  uint64_t v92 = type metadata accessor for CalendarPersonStatus.Representation();
  uint64_t v97 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v87 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000070B0(&qword_100066A20);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v85 = (char *)&v78 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v86 = (char *)&v78 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v78 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v78 - v21;
  uint64_t v23 = type metadata accessor for CalendarPersonStatus.Priority();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  BOOL v90 = (char *)&v78 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v98 = (char *)&v78 - v27;
  uint64_t v96 = a1;
  if (a2) {
    goto LABEL_6;
  }
  id v28 = [a1 attendees];
  if (!v28) {
    goto LABEL_7;
  }
  uint64_t v29 = v28;
  sub_10001210C(0, &qword_100068050);
  unint64_t v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v30 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  a1 = v96;
  if (v31 > 3) {
LABEL_6:
  }
    uint64_t v32 = (unsigned int *)&enum case for CalendarPersonStatus.Priority.low(_:);
  else {
LABEL_7:
  }
    uint64_t v32 = (unsigned int *)&enum case for CalendarPersonStatus.Priority.high(_:);
  uint64_t v33 = *v32;
  uint64_t v89 = v24;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 104);
  uint64_t v91 = v23;
  v34(v98, v33, v23);
  id v35 = [a1 startDate];
  if (!v35)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v22, 1, 1, v6);
    goto LABEL_28;
  }
  uint64_t v36 = v35;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  char v93 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v93(v22, v9, v6);
  uint64_t v95 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v95(v22, 0, 1, v6);
  uint64_t v94 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v94(v22, 1, v6) == 1)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  char v37 = static Date.> infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v22, v6);
  sub_1000070B0(&qword_100067160);
  uint64_t v38 = *(void *)(type metadata accessor for CalendarPersonStatus() - 8);
  uint64_t v39 = *(void *)(v38 + 72);
  unint64_t v40 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  if (v37)
  {
    uint64_t v80 = v20;
    uint64_t v84 = v39;
    uint64_t v88 = swift_allocObject();
    *(_OWORD *)(v88 + 16) = xmmword_1000540D0;
    uint64_t v13 = v96;
    id v41 = [v96 title];
    if (v41)
    {
      unint64_t v42 = v41;
      uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v45 = v44;

      id v46 = [v13 startDate];
      if (v46)
      {
        id v47 = v46;
        uint64_t v78 = v45;
        uint64_t v79 = v43;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v48 = v80;
        v93(v80, v9, v6);
        v95(v48, 0, 1, v6);
        if (v94(v48, 1, v6) != 1)
        {
          uint64_t v49 = v87;
          unint64_t v50 = v88 + v40;
          unint64_t v51 = *(void (**)(char *, void, uint64_t))(v97 + 104);
          v97 += 104;
          uint64_t v83 = v51;
          v51(v87, enum case for CalendarPersonStatus.Representation.past(_:), v92);
          uint64_t v13 = v90;
          uint64_t v81 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
          v81(v90, v98, v91);
          unint64_t v82 = v50;
          int v52 = v49;
          CalendarPersonStatus.init(title:startDate:representation:priority:)();
          id v53 = v96;
          id v54 = [v96 title];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v79 = v57;
            uint64_t v80 = (char *)v56;

            id v58 = [v53 startDate];
            if (v58)
            {
              unint64_t v59 = v58;
              static Date._unconditionallyBridgeFromObjectiveC(_:)();

              uint64_t v13 = v86;
              v93(v86, v9, v6);
              v95(v13, 0, 1, v6);
              if (v94(v13, 1, v6) != 1)
              {
                v83(v52, enum case for CalendarPersonStatus.Representation.alert(_:), v92);
                v81(v90, v98, v91);
                CalendarPersonStatus.init(title:startDate:representation:priority:)();
                id v60 = v96;
                id v61 = [v96 title];
                if (v61)
                {
                  BOOL v62 = v61;
                  uint64_t v86 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)();
                  uint64_t v13 = v63;

                  id v64 = [v60 startDate];
                  if (v64)
                  {
                    uint64_t v65 = v64;
                    static Date._unconditionallyBridgeFromObjectiveC(_:)();

                    uint64_t v66 = v85;
                    v93(v85, v9, v6);
                    v95(v66, 0, 1, v6);
                    if (v94(v66, 1, v6) != 1)
                    {
                      v83(v52, enum case for CalendarPersonStatus.Representation.future(_:), v92);
                      uint64_t v67 = v91;
                      id v68 = v98;
                      v81(v90, v98, v91);
                      CalendarPersonStatus.init(title:startDate:representation:priority:)();
                      uint64_t v69 = v88;
                      uint64_t v70 = v89;
LABEL_25:
                      (*(void (**)(char *, uint64_t))(v70 + 8))(v68, v67);
                      return v69;
                    }
                    goto LABEL_37;
                  }
LABEL_36:
                  v95(v85, 1, 1, v6);
LABEL_37:
                  __break(1u);
                  goto LABEL_38;
                }
LABEL_35:
                __break(1u);
                goto LABEL_36;
              }
LABEL_34:
              __break(1u);
              goto LABEL_35;
            }
LABEL_33:
            v95(v86, 1, 1, v6);
            goto LABEL_34;
          }
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
LABEL_30:
      v95(v80, 1, 1, v6);
      goto LABEL_31;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_100053F00;
  id v71 = v96;
  id v72 = [v96 title];
  if (!v72)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v73 = v72;
  uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v86 = v74;

  id v75 = [v71 startDate];
  if (!v75)
  {
LABEL_39:
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v95)(v13, 1, 1, v6);
    goto LABEL_40;
  }
  uint64_t v76 = v75;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v93(v13, v9, v6);
  v95(v13, 0, 1, v6);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v94)(v13, 1, v6);
  if (result != 1)
  {
    (*(void (**)(char *, void, uint64_t))(v97 + 104))(v87, enum case for CalendarPersonStatus.Representation.past(_:), v92);
    uint64_t v70 = v89;
    id v68 = v98;
    uint64_t v67 = v91;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v90, v98, v91);
    CalendarPersonStatus.init(title:startDate:representation:priority:)();
    goto LABEL_25;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100041BDC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v33 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v7 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v7 = *(void *)(a1 + 16);
  }
  uint64_t result = (uint64_t)_swiftEmptyArrayStorage;
  if (v7)
  {
    unint64_t v40 = _swiftEmptyArrayStorage;
    sub_10000D7C4(0, v7 & ~(v7 >> 63), 0);
    if (v33)
    {
      uint64_t result = __CocoaSet.startIndex.getter();
      char v10 = 1;
    }
    else
    {
      uint64_t result = sub_100040B74(a1);
      char v10 = v11 & 1;
    }
    uint64_t v37 = result;
    uint64_t v38 = v9;
    char v39 = v10;
    if (v7 < 0)
    {
      __break(1u);
LABEL_25:
      __break(1u);
    }
    else
    {
      uint64_t v31 = v1;
      uint64_t v32 = v6;
      uint64_t v12 = a1 & 0xFFFFFFFFFFFFFF8;
      if (a1 < 0) {
        uint64_t v12 = a1;
      }
      uint64_t v34 = v12;
      id v35 = (void (**)(char *, uint64_t))(v4 + 8);
      unint64_t v13 = v33;
      do
      {
        while (1)
        {
          sub_100040904(v37, v38, v39, a1, &qword_100067168);
          uint64_t v25 = v24;
          Date.init()();
          uint64_t v26 = sub_100041104(v25, 0, (uint64_t)v6);
          (*v35)(v6, v3);

          uint64_t v27 = v40;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = sub_10000D7C4(0, v27[2] + 1, 1);
            uint64_t v27 = v40;
          }
          unint64_t v29 = v27[2];
          unint64_t v28 = v27[3];
          if (v29 >= v28 >> 1)
          {
            uint64_t result = sub_10000D7C4(v28 > 1, v29 + 1, 1);
            uint64_t v27 = v40;
          }
          void v27[2] = v29 + 1;
          v27[v29 + 4] = v26;
          if (v13) {
            break;
          }
          uint64_t v14 = v37;
          uint64_t v15 = v38;
          char v16 = v39;
          uint64_t v17 = v3;
          int64_t v18 = sub_100040820(v37, v38, v39, a1);
          uint64_t v19 = a1;
          uint64_t v21 = v20;
          char v23 = v22;
          sub_100042C68(v14, v15, v16);
          uint64_t v37 = v18;
          uint64_t v38 = v21;
          uint64_t v3 = v17;
          a1 = v19;
          uint64_t v6 = v32;
          unint64_t v13 = v33;
          char v39 = v23 & 1;
          if (!--v7) {
            goto LABEL_22;
          }
        }
        if ((v39 & 1) == 0) {
          goto LABEL_25;
        }
        if (__CocoaSet.Index.handleBitPattern.getter()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_1000070B0(&qword_100068058);
        unint64_t v30 = (void (*)(char *, void))Set.Index._asCocoa.modify();
        __CocoaSet.formIndex(after:isUnique:)();
        v30(v36, 0);
        --v7;
      }
      while (v7);
LABEL_22:
      sub_100042C68(v37, v38, v39);
      return (uint64_t)v40;
    }
  }
  return result;
}

uint64_t sub_100041F10(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    if (!v7) {
      return (uint64_t)v8;
    }
    uint64_t v19 = _swiftEmptyArrayStorage;
    uint64_t result = sub_10000D7C4(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v19;
    v16[1] = v2;
    unint64_t v17 = a1 & 0xC000000000000001;
    char v11 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v2 = a1;
    while (v7 != v10)
    {
      if (v17) {
        uint64_t v12 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        uint64_t v12 = (char *)*(id *)(a1 + 8 * v10 + 32);
      }
      unint64_t v13 = v12;
      Date.init()();
      uint64_t v4 = sub_100041104(v13, 1, (uint64_t)v6);
      (*v11)(v6, v18);

      uint64_t v19 = v8;
      unint64_t v15 = v8[2];
      unint64_t v14 = v8[3];
      if (v15 >= v14 >> 1)
      {
        sub_10000D7C4(v14 > 1, v15 + 1, 1);
        uint64_t v8 = v19;
      }
      ++v10;
      uint64_t v8[2] = v15 + 1;
      v8[v15 + 4] = v4;
      a1 = v2;
      if (v7 == v10) {
        return (uint64_t)v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_100042120(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    unint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v8) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000422C0(void *a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v35 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v40)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v40 = i;
      unint64_t v11 = v10 | (i << 6);
    }
    else
    {
      int64_t v12 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_35;
      }
      if (v12 >= v35)
      {
LABEL_32:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v13 = *(void *)(v34 + 8 * v12);
      int64_t v14 = i + 1;
      if (!v13)
      {
        int64_t v14 = i + 2;
        if (i + 2 >= v35) {
          goto LABEL_32;
        }
        unint64_t v13 = *(void *)(v34 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = i + 3;
          if (i + 3 >= v35) {
            goto LABEL_32;
          }
          unint64_t v13 = *(void *)(v34 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = i + 4;
            if (i + 4 >= v35) {
              goto LABEL_32;
            }
            unint64_t v13 = *(void *)(v34 + 8 * v14);
            if (!v13)
            {
              uint64_t v15 = i + 5;
              if (i + 5 >= v35) {
                goto LABEL_32;
              }
              unint64_t v13 = *(void *)(v34 + 8 * v15);
              if (!v13)
              {
                while (1)
                {
                  int64_t v14 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_36;
                  }
                  if (v14 >= v35) {
                    goto LABEL_32;
                  }
                  unint64_t v13 = *(void *)(v34 + 8 * v14);
                  ++v15;
                  if (v13) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v14 = i + 5;
            }
          }
        }
      }
LABEL_22:
      unint64_t v7 = (v13 - 1) & v13;
      int64_t v40 = v14;
      unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    }
    uint64_t v16 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    swift_bridgeObjectRetain_n();
    id v19 = a3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v39 = a1;
    unint64_t v22 = sub_1000071E4(v18, v17);
    uint64_t v23 = a1[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24)) {
      break;
    }
    char v26 = v21;
    if (a1[3] >= v25)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_10000859C();
        a1 = v39;
      }
    }
    else
    {
      sub_100007B6C(v25, isUniquelyReferenced_nonNull_native);
      a1 = v39;
      unint64_t v27 = sub_1000071E4(v18, v17);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_37;
      }
      unint64_t v22 = v27;
    }
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      a1[(v22 >> 6) + 8] |= 1 << v22;
      unint64_t v29 = (uint64_t *)(a1[6] + 16 * v22);
      *unint64_t v29 = v18;
      v29[1] = v17;
      *(void *)(a1[7] + 8 * v22) = &_swiftEmptySetSingleton;
      uint64_t v30 = a1[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_34;
      }
      a1[2] = v32;
      swift_bridgeObjectRetain();
    }
    sub_10001D498((uint64_t)&v39, v19, a4);
    uint64_t v9 = v39;
    swift_bridgeObjectRelease_n();
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_1000425CC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a3;
  uint64_t v34 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a3 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  unint64_t v11 = a4 & 0xC000000000000001;
  uint64_t v39 = a4 + 56;
  uint64_t v37 = a3 + 56;
  unint64_t v35 = a4 & 0xC000000000000001;
  int64_t v36 = v10;
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v5 << 6);
LABEL_30:
    uint64_t v30 = *(void *)(v4 + 48) + 16 * v16;
    if (*(unsigned char *)(v30 + 8) == 1)
    {
      int64_t v12 = *(void **)v30;
      if (v11)
      {
        id v13 = v12;
        char v14 = __CocoaSet.contains(_:)();

        if ((v14 & 1) == 0)
        {
LABEL_33:
          *(unint64_t *)((char *)a1 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
          if (__OFADD__(v34++, 1))
          {
            __break(1u);
LABEL_36:
            swift_retain();
            sub_100046E4C(a1, a2, v34, v4);
            return;
          }
        }
      }
      else
      {
        if (!*(void *)(a4 + 16)) {
          goto LABEL_33;
        }
        Swift::Int v20 = *(void *)(a4 + 40);
        id v21 = v12;
        Swift::Int v22 = NSObject._rawHashValue(seed:)(v20);
        uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
        unint64_t v24 = v22 & ~v23;
        if (((*(void *)(v39 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) == 0) {
          goto LABEL_32;
        }
        sub_10001210C(0, &qword_100067168);
        id v25 = *(id *)(*(void *)(a4 + 48) + 8 * v24);
        char v26 = static NSObject.== infix(_:_:)();

        if ((v26 & 1) == 0)
        {
          uint64_t v27 = ~v23;
          while (1)
          {
            unint64_t v24 = (v24 + 1) & v27;
            if (((*(void *)(v39 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) == 0) {
              break;
            }
            id v28 = *(id *)(*(void *)(a4 + 48) + 8 * v24);
            char v29 = static NSObject.== infix(_:_:)();

            if (v29) {
              goto LABEL_25;
            }
          }
LABEL_32:

          uint64_t v6 = v37;
          uint64_t v4 = a3;
          unint64_t v11 = v35;
          int64_t v10 = v36;
          goto LABEL_33;
        }
LABEL_25:

        uint64_t v6 = v37;
        uint64_t v4 = a3;
        unint64_t v11 = v35;
        int64_t v10 = v36;
      }
    }
  }
  int64_t v17 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v10) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  ++v5;
  if (v18) {
    goto LABEL_29;
  }
  int64_t v5 = v17 + 1;
  if (v17 + 1 >= v10) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v5);
  if (v18) {
    goto LABEL_29;
  }
  int64_t v5 = v17 + 2;
  if (v17 + 2 >= v10) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v5);
  if (v18)
  {
LABEL_29:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v5 << 6);
    goto LABEL_30;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v10) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v5 = v19;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v5 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v5);
    ++v19;
    if (v18) {
      goto LABEL_29;
    }
  }
LABEL_38:
  __break(1u);
}

uint64_t sub_1000428B8(uint64_t a1, uint64_t a2)
{
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    sub_1000425CC((unint64_t *)((char *)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a1, a2);
    uint64_t v11 = v10;
    swift_release();
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    int64_t v12 = (void *)swift_slowAlloc();
    bzero(v12, v8);
    swift_bridgeObjectRetain();
    sub_1000425CC((unint64_t *)v12, v7, a1, a2);
    uint64_t v11 = v13;
    swift_release();
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

uint64_t sub_100042A84(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    unint64_t v16 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v17 = v16[1];
    uint64_t v18 = *(void *)(*(void *)(a2 + 56) + 8 * i);
    v19[0] = *v16;
    v19[1] = v17;
    v19[2] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10003FBA8(&v20, v19);
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v10++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v10 >= v8) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    if (!v14) {
      break;
    }
LABEL_17:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v10 + 1;
  if (v10 + 1 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v10 + 2;
  if (v10 + 2 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v10 + 3;
  if (v10 + 3 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v10 + 4;
  if (v10 + 4 >= v8)
  {
LABEL_26:
    swift_release();
    return v20;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_16:
    int64_t v10 = v15;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100042C68(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100042C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100068048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *unint64_t v9 = v3;
  v9[1] = sub_100023ED4;
  return sub_10003E178(a1, a2, v6, v7, v8);
}

uint64_t sub_100042DA4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *unint64_t v9 = v2;
  v9[1] = sub_100023ED4;
  return sub_10003EB30(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100042E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0(&qword_100066A38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042ED4()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100042F0C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100023ED4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100068090 + dword_100068090);
  return v6(a1, v4);
}

uint64_t sub_100042FC8()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100043018(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *unint64_t v9 = v2;
  v9[1] = sub_100023ED4;
  return sub_10003EDA8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000430E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008F18;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100068090 + dword_100068090);
  return v6(a1, v4);
}

uint64_t sub_100043198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003F020(a1, a2, a3, *(void **)(v3 + 16));
}

unint64_t sub_1000431A0()
{
  unint64_t result = qword_1000680D0;
  if (!qword_1000680D0)
  {
    sub_10001210C(255, &qword_1000680C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000680D0);
  }
  return result;
}

uint64_t sub_100043208()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v4;
  int64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);
  return _swift_deallocObject(v0, v8, v6);
}

uint64_t sub_100043304(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for Date() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 40) & ~v5;
  uint64_t v7 = *(void *)(v1 + 32);
  uint64_t v8 = v1 + v6;
  uint64_t v9 = v1 + ((*(void *)(v4 + 64) + v5 + v6) & ~v5);
  int64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *int64_t v10 = v2;
  void v10[4] = v8;
  void v10[5] = v9;
  v10[2] = a1;
  v10[3] = v7;
  v10[1] = sub_100008F18;
  return _swift_task_switch(sub_10003C0D8, 0, 0);
}

uint64_t initializeBufferWithCopyOfBuffer for CalendarStatusSource.EventWithReason(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for CalendarStatusSource.EventWithReason(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t initializeWithTake for CalendarStatusSource.EventWithReason(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for CalendarStatusSource.EventWithReason(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CalendarStatusSource.EventWithReason(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CalendarStatusSource.EventWithReason(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarStatusSource.EventWithReason()
{
  return &type metadata for CalendarStatusSource.EventWithReason;
}

unint64_t sub_10004359C()
{
  unint64_t result = qword_1000680E8;
  if (!qword_1000680E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000680E8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for CalendarStatusSource.EventWithReason.Reason(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CalendarStatusSource.EventWithReason.Reason(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CalendarStatusSource.EventWithReason.Reason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10004375CLL);
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

uint64_t sub_100043784(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100043790(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CalendarStatusSource.EventWithReason.Reason()
{
  return &type metadata for CalendarStatusSource.EventWithReason.Reason;
}

unint64_t sub_1000437B0()
{
  unint64_t result = qword_1000680F0;
  if (!qword_1000680F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000680F0);
  }
  return result;
}

uint64_t sub_10004380C(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  int64_t v7 = 0;
  int64_t v8 = (unint64_t)(v3 + 63) >> 6;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v7 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (v14 >= v8) {
      goto LABEL_22;
    }
    unint64_t v15 = *(void *)(v2 + 8 * v14);
    ++v7;
    if (!v15)
    {
      int64_t v7 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_22;
      }
      unint64_t v15 = *(void *)(v2 + 8 * v7);
      if (!v15)
      {
        int64_t v7 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_22;
        }
        unint64_t v15 = *(void *)(v2 + 8 * v7);
        if (!v15)
        {
          int64_t v7 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_22;
          }
          unint64_t v15 = *(void *)(v2 + 8 * v7);
          if (!v15)
          {
            int64_t v16 = v14 + 4;
            if (v16 >= v8)
            {
LABEL_22:
              swift_endAccess();
              return swift_release();
            }
            unint64_t v15 = *(void *)(v2 + 8 * v16);
            int64_t v7 = v16;
            if (!v15) {
              break;
            }
          }
        }
      }
    }
LABEL_21:
    unint64_t v5 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v7 << 6);
LABEL_5:
    uint64_t v11 = (Swift::Int *)(*(void *)(a1 + 48) + 16 * v10);
    Swift::Int v12 = *v11;
    Swift::Int v13 = v11[1];
    swift_bridgeObjectRetain_n();
    sub_10001D2E8(&v17, v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  while (1)
  {
    int64_t v7 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v7 >= v8) {
      goto LABEL_22;
    }
    unint64_t v15 = *(void *)(v2 + 8 * v7);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_1000439C0()
{
  _StringGuts.grow(_:)(46);
  v0._object = (void *)0x8000000100056870;
  v0._countAndFlagsBits = 0xD00000000000002ALL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 10506;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  return 0;
}

uint64_t sub_100043A60(void *a1, uint64_t a2)
{
  sub_1000070F4((void *)(a2 + 88), *(void *)(a2 + 112));
  return sub_100047934(a1, 1, a2);
}

uint64_t sub_100043AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[1] = a3;
  uint64_t v9 = type metadata accessor for ContactPerson();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  v16[0] = type metadata accessor for PeopleBiomeEventIndexer();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v9);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a5;
  *((void *)v14 + 3) = sub_100049E00;
  *((void *)v14 + 4) = v12;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v14[v13], (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_retain();
  swift_retain();
  static PeopleBiomeEventIndexer.indexEvent(locationEvent:withPerson:withIndexer:completion:)();
  return swift_release();
}

uint64_t sub_100043C78(uint64_t a1, uint64_t a2, void (*a3)(void, void, void), uint64_t a4, uint64_t a5)
{
  uint64_t v48 = a4;
  uint64_t v8 = type metadata accessor for StatusType();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  Swift::Int v17 = (char *)&v41 - v16;
  if (a1)
  {
    swift_errorRetain();
    static PeopleLogger.daemon.getter();
    swift_retain();
    swift_errorRetain();
    swift_retain();
    swift_errorRetain();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      LODWORD(v44) = v20;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      uint64_t v50 = v43;
      *(_DWORD *)uint64_t v22 = 136315394;
      unint64_t v42 = (uint8_t *)(v22 + 4);
      (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for StatusType.location(_:), v8);
      sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v45 = a3;
      unint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      uint64_t v49 = sub_10002A278(v23, v25, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v26 = Error.localizedDescription.getter();
      uint64_t v49 = sub_10002A278(v26, v27, &v50);
      a3 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v44, "'%s' event error: %s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v47);
    swift_errorRetain();
    a3(a1, 0, 1);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    uint64_t v44 = a5;
    static PeopleLogger.daemon.getter();
    swift_retain_n();
    id v28 = Logger.logObject.getter();
    uint64_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, (os_log_type_t)v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v50 = v43;
      uint64_t v45 = a3;
      *(_DWORD *)uint64_t v30 = 136315138;
      id v41 = v30 + 4;
      unint64_t v42 = v30;
      (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for StatusType.location(_:), v8);
      sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v33 = v32;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      uint64_t v49 = sub_10002A278(v31, v33, &v50);
      a3 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v29, "'%s' event consume complete", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v47);
    unint64_t v35 = (void *)ContactPerson.contact.getter();
    if (v35)
    {
      int64_t v36 = v35;
      id v37 = [v35 identifier];

      uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v40 = v39;
    }
    else
    {
      uint64_t v38 = 0;
      unint64_t v40 = 0xE000000000000000;
    }
    a3(v38, v40, 0);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000442D8(uint64_t *a1, void *a2, int a3, void *a4)
{
  int v39 = a3;
  uint64_t v8 = type metadata accessor for StatusType();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  uint64_t v13 = *(void *)(*a1 + 16);
  if (v13)
  {
    v32[0] = a4;
    v32[1] = a2;
    unint64_t v33 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v34 = v4;
    uint64_t v35 = v9;
    uint64_t v36 = v8;
    swift_bridgeObjectRetain();
    uint64_t v14 = (uint64_t *)(v12 + 40);
    unint64_t v15 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v17 = *(v14 - 1);
      uint64_t v16 = *v14;
      swift_bridgeObjectRetain();
      object = String.trimToNil()().value._object;
      swift_bridgeObjectRelease();
      if (object)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        id v37 = v15;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_10000D774(0, v15[2] + 1, 1);
          unint64_t v15 = v37;
        }
        unint64_t v21 = v15[2];
        unint64_t v20 = v15[3];
        if (v21 >= v20 >> 1)
        {
          sub_10000D774(v20 > 1, v21 + 1, 1);
          unint64_t v15 = v37;
        }
        long long v15[2] = v21 + 1;
        uint64_t v22 = (char *)&v15[2 * v21];
        *((void *)v22 + 4) = v17;
        *((void *)v22 + 5) = v16;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v14 += 2;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    uint64_t v23 = v15[2];
    type metadata accessor for PeopleAnalytics();
    uint64_t v25 = v35;
    uint64_t v24 = v36;
    uint64_t v26 = v33;
    (*(void (**)(char *, void, uint64_t))(v35 + 104))(v33, enum case for StatusType.location(_:), v36);
    static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v24);
    if (v23)
    {
      if (v39) {
        sub_10004461C(v32[0], (uint64_t)v15);
      }
    }
    return swift_release();
  }
  else
  {
    id v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    _StringGuts.grow(_:)(39);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for StatusType.location(_:), v8);
    sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
    uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    id v37 = (void *)v28;
    unint64_t v38 = v30;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v31._object = (void *)0x8000000100057380;
    v31._countAndFlagsBits = 0xD000000000000025;
    String.append(_:)(v31);
    static PeopleErrors.createError(_:code:)();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
}

uint64_t sub_10004461C(void *a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = &_swiftEmptySetSingleton;
  unsigned int v6 = sub_1000070F4((void *)(v2 + 168), *(void *)(v2 + 192));
  sub_100008758(*v6 + 16, (uint64_t)v11);
  uint64_t v7 = swift_allocObject();
  sub_1000087BC(v11, v7 + 16);
  sub_1000070B0(&qword_100067148);
  swift_allocObject();
  Promise.init(startBlock:)();
  sub_100008758(v2 + 168, (uint64_t)v11);
  uint64_t v8 = (void *)swift_allocObject();
  sub_1000087BC(v11, (uint64_t)(v8 + 2));
  v8[7] = v5;
  v8[8] = a2;
  v8[9] = a1;
  v8[10] = v2;
  swift_retain();
  swift_bridgeObjectRetain();
  id v9 = a1;
  swift_retain();
  dispatch thunk of Promise.then<A>(_:)();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1000447A4()
{
  sub_10000905C(v0 + 16);
  swift_release();
  swift_release();
  sub_10000900C(v0 + 48);
  sub_10000900C(v0 + 88);
  sub_10000900C(v0 + 128);
  sub_10000900C(v0 + 168);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocationStatusEventListener()
{
  return self;
}

uint64_t sub_100044830(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = (uint64_t (*)(char *, uint64_t))Strong;
    swift_bridgeObjectRetain();
    sub_100021828(a1, a2, v14);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  static PeopleLogger.location.getter();
  id v15 = a3;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v32 = v10;
    uint64_t v35 = v19;
    *(_DWORD *)uint64_t v18 = 136380931;
    id v20 = [v15 idsHandle];
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v31 = v9;
    uint64_t v22 = v21;
    unint64_t v33 = v8;
    unint64_t v24 = v23;

    uint64_t v34 = sub_10002A278(v22, v24, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v25 = BMFindMyLocationChangeEvent.reason.getter();
    uint64_t v34 = sub_10002A278(v25, v26, &v35);
    uint64_t v8 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Event triggered widget refresh: %{private}s, %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v31);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v27 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = 0;
  *(void *)(v28 + 24) = 0;
  sub_100016DD8((uint64_t)v8, (uint64_t)&unk_100068290, v28);
  return swift_release();
}

uint64_t sub_100044BD4()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_100044C90, 0, 0);
}

uint64_t sub_100044C90()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.location(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_100044D48(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v37 = a5;
  uint64_t v40 = a4;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v36 = v9;
  __chkstk_darwin(v9);
  int v39 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v12 = result;
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v14 = (uint64_t *)(a3 + 16);
  uint64_t v38 = a6;
  if (v12)
  {
    if (v12 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v15 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0) {
        id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v16 = *(id *)(v11 + 8 * v15 + 32);
      }
      os_log_type_t v17 = v16;
      ++v15;
      uint64_t v18 = sub_1000118B8(v16);
      uint64_t v19 = sub_100022E04((uint64_t)v18);
      swift_bridgeObjectRelease();
      sub_10004380C(v19);

      swift_bridgeObjectRelease();
    }
    while (v12 != v15);
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v20 = *v14;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1000470FC(v40, v20);
  uint64_t v22 = sub_100015E3C(v21);
  swift_release();
  unint64_t v23 = v39;
  static PeopleLogger.location.getter();
  swift_retain_n();
  unint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 136315138;
    v34[1] = v26 + 4;
    swift_retain();
    uint64_t v27 = Array.description.getter();
    unint64_t v29 = v28;
    swift_release();
    uint64_t v41 = sub_10002A278(v27, v29, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "location-sharing contact ids %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v35 + 8))(v39, v36);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v23, v36);
  }
  sub_1000070B0(&qword_100066A40);
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = v22;
  uint64_t v31 = v37;
  uint64_t v32 = v38;
  v30[3] = v40;
  v30[4] = v31;
  v30[5] = v32;
  swift_bridgeObjectRetain();
  id v33 = v31;
  swift_retain();
  return Promise.__allocating_init(_:)();
}

uint64_t sub_100045118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[4] = a2;
  v5[5] = a3;
  uint64_t v6 = type metadata accessor for Logger();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  return _swift_task_switch(sub_1000451EC, 0, 0);
}

uint64_t sub_1000451EC()
{
  uint64_t v30 = v0;
  if (*(void *)(*(void *)(v0 + 32) + 16))
  {
    static PeopleLogger.location.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.debug.getter();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v6 = *(void *)(v0 + 72);
    if (v3)
    {
      uint64_t v27 = *(void *)(v0 + 64);
      uint64_t v26 = *(void *)(v0 + 88);
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v8 = Array.description.getter();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 16) = sub_10002A278(v8, v10, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "location-sharing lookup task with %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v26, v27);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    }
    uint64_t v21 = *(void *)(v0 + 40);
    type metadata accessor for OSTransaction();
    uint64_t v22 = swift_task_alloc();
    *(void *)(v0 + 96) = v22;
    *(_OWORD *)(v22 + 16) = *(_OWORD *)(v0 + 48);
    *(void *)(v22 + 32) = v21;
    unint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v23;
    void *v23 = v0;
    v23[1] = sub_100045684;
    return static OSTransaction.named(_:block:)("com.apple.people.LocationStatusEventListener", 44, 2, &unk_100068270, v22);
  }
  else
  {
    static PeopleLogger.location.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v15 = *(void *)(v0 + 72);
    uint64_t v14 = *(void *)(v0 + 80);
    uint64_t v16 = *(void *)(v0 + 64);
    if (v13)
    {
      uint64_t v28 = *(void *)(v0 + 64);
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v17 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v18 = Array.description.getter();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 24) = sub_10002A278(v18, v20, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "location-sharing: %s not in any widget", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v28);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_100045684()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000457D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  sub_1000070B0(&qword_100066A38);
  v3[8] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v3[9] = v6;
  v3[10] = *(void *)(v6 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[13] = v7;
  void *v7 = v3;
  v7[1] = sub_100045928;
  return static LocateFriend.isUpdateSignificant(event:with:)(a1, a2 + 128);
}

uint64_t sub_100045928(char a1)
{
  *(unsigned char *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100045A28, 0, 0);
}

uint64_t sub_100045A28()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(void **)(v0 + 40);
  if (*(unsigned char *)(v0 + 112) == 1)
  {
    static PeopleLogger.location.getter();
    id v2 = v1;
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.debug.getter();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v9 = *(void **)(v0 + 40);
    if (v5)
    {
      os_log_type_t type = v4;
      uint64_t v10 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v38 = v6;
      id v11 = [v9 idsHandle];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v37 = v8;
      unint64_t v14 = v13;

      *(void *)(v0 + 24) = sub_10002A278(v12, v14, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v15 = BMFindMyLocationChangeEvent.reason.getter();
      *(void *)(v0 + 32) = sub_10002A278(v15, v16, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v3, type, "Event significant: %s, %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v38, v37);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
    sub_100044830(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void **)(v0 + 40));
  }
  else
  {
    static PeopleLogger.location.getter();
    id v17 = v1;
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v22 = *(void *)(v0 + 80);
    uint64_t v21 = *(void *)(v0 + 88);
    uint64_t v23 = *(void *)(v0 + 72);
    unint64_t v24 = *(void **)(v0 + 40);
    if (v20)
    {
      uint64_t v39 = *(void *)(v0 + 72);
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v25 = 136315138;
      os_log_type_t v35 = v19;
      id v26 = [v24 idsHandle];
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v29 = v28;

      *(void *)(v0 + 16) = sub_10002A278(v27, v29, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v18, v35, "Update event not significant for %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v39);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
    uint64_t v30 = *(void *)(v0 + 64);
    uint64_t v31 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = 0;
    *(void *)(v32 + 24) = 0;
    sub_100016DD8(v30, (uint64_t)&unk_100068280, v32);
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_100045ED0()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_100045F8C, 0, 0);
}

uint64_t sub_100045F8C()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.location(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100046044, v2, v1);
}

uint64_t sub_100046044()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  swift_release();
  static MetricTemplate.updateStatusCount(for:signaled:)();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000460DC(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for StatusType();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return _swift_task_switch(sub_1000461A0, 0, 0);
}

void sub_1000461A0()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[10];
  uint64_t v14 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v16 = v0[8];
  uint64_t v4 = enum case for StatusType.location(_:);
  BOOL v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[11] + 104);
  v5(v1, enum case for StatusType.location(_:), v2);
  id v6 = [self findMyLocationChangeStream];
  uint64_t v7 = sub_1000070B0(&qword_100068238);
  swift_allocObject();
  uint64_t v8 = BiomeStreamReader.init(statusType:readerStream:)();
  v0[13] = v8;
  v5(v1, v4, v2);
  uint64_t v9 = swift_allocObject();
  v0[14] = v9;
  *(void *)(v9 + 16) = v3;
  uint64_t v10 = swift_allocObject();
  v0[15] = v10;
  *(void *)(v10 + 16) = v14;
  *(void *)(v10 + 24) = v16;
  v0[5] = v7;
  unint64_t v11 = sub_1000468B8();
  v0[2] = v8;
  v0[6] = v11;
  unint64_t v13 = (char *)&async function pointer to dispatch thunk of ReindexCoordinator.reindex<A>(statusType:squashEvents:includeEvent:handleEvent:withReader:)
      + async function pointer to dispatch thunk of ReindexCoordinator.reindex<A>(statusType:squashEvents:includeEvent:handleEvent:withReader:);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[16] = v12;
  sub_100046914();
  *uint64_t v12 = v0;
  v12[1] = sub_1000463FC;
  __asm { BR              X8 }
}

uint64_t sub_1000463FC()
{
  uint64_t v1 = *(void *)v0 + 16;
  uint64_t v2 = *(void *)(*(void *)v0 + 96);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  uint64_t v4 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10000900C(v1);
  return _swift_task_switch(sub_1000465A0, 0, 0);
}

uint64_t sub_1000465A0()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100046608()
{
  return static BMFindMyLocationChangeEvent.squashEvents(_:)();
}

uint64_t sub_10004663C(void *a1, void *a2)
{
  if (!a2[2]) {
    return 1;
  }
  uint64_t v2 = a2;
  id v3 = [a1 idsHandle];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  LOBYTE(v2) = sub_100017138(v4, v6, v2);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1000466BC()
{
  return sub_1000439C0();
}

uint64_t sub_1000466E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100023ED4;
  return sub_1000460DC(a1, a2);
}

uint64_t sub_10004678C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000497C4(&qword_100068228, a2, (void (*)(uint64_t))type metadata accessor for LocationStatusEventListener);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000467E4()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004681C(void *a1)
{
  return sub_10004663C(a1, *(void **)(v1 + 16));
}

uint64_t sub_100046824()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100046864(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  ReindexCoordinator.indexer.getter();
  uint64_t v4 = sub_10004887C(a1, 0, v3);
  swift_release();
  return v4;
}

unint64_t sub_1000468B8()
{
  unint64_t result = qword_100068240;
  if (!qword_100068240)
  {
    sub_100011FFC(&qword_100068238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068240);
  }
  return result;
}

unint64_t sub_100046914()
{
  unint64_t result = qword_100068248;
  if (!qword_100068248)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100068248);
  }
  return result;
}

uint64_t sub_100046954(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1000070B0(&qword_100067190);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v9 = (void *)result;
  unint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::Int v18 = v9[5];
    id v19 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = NSObject._rawHashValue(seed:)(v18);
    uint64_t v20 = -1 << *((unsigned char *)v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
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
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v29[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100046BB4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_1000070B0(&qword_100067110);
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
    unint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *unint64_t v28 = v18;
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

uint64_t sub_100046E4C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_1000070B0(&qword_100067188);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v31 = a2;
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
    if (v14 >= v31) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v31) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v31) {
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
    uint64_t v17 = *(void *)(v4 + 48) + 16 * v13;
    uint64_t v18 = *(void **)v17;
    Swift::UInt v19 = *(unsigned __int8 *)(v17 + 8);
    Hasher.init(_seed:)();
    id v20 = v18;
    NSObject.hash(into:)();

    Hasher._combine(_:)(v19);
    uint64_t result = Hasher._finalize()();
    uint64_t v21 = -1 << v8[32];
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = *((void *)v8 + 6) + 16 * v24;
    *(void *)uint64_t v29 = v20;
    *(unsigned char *)(v29 + 8) = v19;
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
  if (v16 >= v31) {
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
    if (v10 >= v31) {
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

uint64_t sub_1000470FC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_100047284((unint64_t *)((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_100047284((unint64_t *)v8, v5, v3, a2);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_100047284(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  uint64_t v31 = *(void *)(a3 + 16);
  if (!v31)
  {
    uint64_t v26 = 0;
    goto LABEL_27;
  }
  uint64_t v32 = a4 + 56;
  uint64_t v30 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  for (uint64_t i = 0; i != v31; ++i)
  {
    uint64_t v7 = (uint64_t *)(v30 + 16 * i);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v10 = Hasher._finalize()();
    uint64_t v11 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = 1 << v12;
    if (((1 << v12) & *(void *)(v32 + 8 * (v12 >> 6))) == 0) {
      goto LABEL_3;
    }
    uint64_t v15 = *(void *)(a4 + 48);
    uint64_t v16 = (void *)(v15 + 16 * v12);
    BOOL v17 = *v16 == v9 && v16[1] == v8;
    if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v21 = ~v11;
      for (unint64_t j = v12 + 1; ; unint64_t j = v23 + 1)
      {
        unint64_t v23 = j & v21;
        if (((*(void *)(v32 + (((j & v21) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v21)) & 1) == 0) {
          break;
        }
        unint64_t v24 = (void *)(v15 + 16 * v23);
        BOOL v25 = *v24 == v9 && v24[1] == v8;
        if (v25 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v13 = v23 >> 6;
          uint64_t v14 = 1 << v23;
          goto LABEL_12;
        }
      }
LABEL_3:
      swift_bridgeObjectRelease();
      continue;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_12:
    unint64_t v19 = a1[v13];
    a1[v13] = v14 | v19;
    if ((v14 & v19) == 0 && __OFADD__(v28++, 1))
    {
      __break(1u);
      return result;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a2;
  uint64_t v26 = v28;
LABEL_27:
  swift_retain();
  return sub_100046BB4(a1, v5, v26, a4);
}

uint64_t sub_100047498(unint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  id v23 = a2;
  uint64_t v22 = type metadata accessor for ContactPerson();
  uint64_t v5 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (!v8) {
      return (uint64_t)v9;
    }
    unint64_t v24 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t result = sub_10000D7E4(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0) {
      break;
    }
    uint64_t v11 = 0;
    uint64_t v9 = v24;
    unint64_t v19 = a1 & 0xC000000000000001;
    id v20 = v7;
    v18[1] = v3;
    v18[2] = v5 + 32;
    unint64_t v21 = a1;
    while (v8 != v11)
    {
      if (v19) {
        id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v12 = *(id *)(a1 + 8 * v11 + 32);
      }
      id v13 = v12;
      id v14 = [v23 idsHandle];
      uint64_t v7 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v15 = v20;
      ContactPerson.init(contact:idsHandle:)();

      unint64_t v24 = v9;
      unint64_t v17 = v9[2];
      unint64_t v16 = v9[3];
      unint64_t v3 = v17 + 1;
      if (v17 >= v16 >> 1)
      {
        sub_10000D7E4(v16 > 1, v17 + 1, 1);
        uint64_t v9 = v24;
      }
      ++v11;
      long long v9[2] = v3;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v17, v15, v22);
      a1 = v21;
      if (v8 == v11) {
        return (uint64_t)v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void *sub_1000476F4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for ContactPerson();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  Swift::Int v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v11)
  {
    v19[1] = v3;
    uint64_t v28 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    id v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v13 = v8 + 16;
    uint64_t v15 = *(unsigned __int8 *)(v13 + 64);
    uint64_t v16 = a1 + ((v15 + 32) & ~v15);
    uint64_t v25 = *(void *)(v13 + 56);
    uint64_t v26 = v14;
    uint64_t v23 = v15 | 7;
    uint64_t v24 = (v15 + 24) & ~v15;
    unint64_t v22 = (v9 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = v13;
    id v20 = (void (**)(uint64_t, char *, uint64_t))(v13 + 16);
    unint64_t v21 = v22 + 8;
    do
    {
      v26(v10, v16, v7);
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = a2;
      (*v20)(v17 + v24, v10, v7);
      *(void *)(v17 + v22) = a3;
      sub_1000070B0(&qword_100068250);
      swift_allocObject();
      id v18 = a2;
      swift_retain();
      Promise.init(startBlock:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v16 += v25;
      --v11;
    }
    while (v11);
    return v28;
  }
  return result;
}

uint64_t sub_100047934(void *a1, int a2, uint64_t a3)
{
  LODWORD(v101) = a2;
  uint64_t v95 = type metadata accessor for ContactPerson();
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v6 = &v91[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for StatusType();
  uint64_t v103 = *(void *)(v7 - 8);
  uint64_t v104 = v7;
  __chkstk_darwin(v7);
  uint64_t v102 = &v91[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v100 = &v91[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v98 = &v91[-v14];
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v106 = &v91[-v16];
  __chkstk_darwin(v15);
  id v18 = &v91[-v17];
  static PeopleLogger.location.getter();
  id v19 = a1;
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = &selRef_statusChangeType;
  uint64_t v107 = v10;
  uint64_t v96 = v6;
  if (v22)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v105 = (void (*)(unsigned char *, uint64_t))a3;
    id v99 = (id)v25;
    uint64_t v110 = v25;
    *(_DWORD *)uint64_t v24 = 136380931;
    id v26 = [v19 idsHandle];
    uint64_t v27 = v9;
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v30 = v29;

    uint64_t v31 = v28;
    uint64_t v9 = v27;
    uint64_t v111 = sub_10002A278(v31, v30, &v110);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v32 = BMFindMyLocationChangeEvent.reason.getter();
    uint64_t v111 = sub_10002A278(v32, v33, &v110);
    uint64_t v23 = &selRef_statusChangeType;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Got location change event for handle %{private}s: %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    a3 = (uint64_t)v105;
    swift_slowDealloc();
    uint64_t v10 = v107;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v34 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
  v34(v18, v9);
  os_log_type_t v35 = self;
  sub_1000070B0(&qword_100066C08);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_100053F00;
  id v37 = [v19 v23[49]];
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v40 = v39;

  *(void *)(v36 + 32) = v38;
  *(void *)(v36 + 40) = v40;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v42 = [v35 predicateForContactsMatchingHandleStrings:isa];

  sub_1000070F4((void *)(a3 + 48), *(void *)(a3 + 72));
  unint64_t v43 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  id v44 = v19;
  uint64_t v45 = sub_100047498(v43, v44);
  swift_bridgeObjectRelease();

  uint64_t v111 = v45;
  if (*(void *)(v45 + 16))
  {
    id v99 = v42;
    swift_bridgeObjectRetain();
    uint64_t v46 = v100;
    static PeopleLogger.daemon.getter();
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v106 = 0;
      uint64_t v50 = v49;
      uint64_t v51 = swift_slowAlloc();
      uint64_t v105 = v34;
      uint64_t v98 = (unsigned char *)v51;
      uint64_t v110 = v51;
      *(_DWORD *)uint64_t v50 = 134218242;
      uint64_t v52 = *(void *)(v45 + 16);
      swift_bridgeObjectRelease();
      uint64_t v108 = v52;
      uint64_t v97 = v9;
      uint64_t v96 = &v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      uint64_t v95 = v50 + 14;
      id v54 = v102;
      uint64_t v53 = v103;
      uint64_t v55 = v104;
      (*(void (**)(unsigned char *, void, uint64_t))(v103 + 104))(v102, enum case for StatusType.location(_:), v104);
      sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v56 = dispatch thunk of CustomStringConvertible.description.getter();
      id v57 = v44;
      unint64_t v59 = v58;
      (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v54, v55);
      uint64_t v108 = sub_10002A278(v56, v59, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      id v44 = v57;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Found %ld valid contacts for '%s'", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v105(v100, v97);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      v34(v46, v9);
    }
    id v42 = v99;
  }
  else
  {
    uint64_t v105 = v34;
    uint64_t v106 = 0;
    uint64_t v97 = v9;
    id v60 = v98;
    static PeopleLogger.daemon.getter();
    uint64_t v100 = v44;
    id v61 = v44;
    swift_retain_n();
    id v62 = v61;
    os_log_type_t v63 = Logger.logObject.getter();
    os_log_type_t v64 = static os_log_type_t.default.getter();
    int v65 = v64;
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v66 = swift_slowAlloc();
      id v99 = v42;
      uint64_t v67 = v66;
      uint64_t v93 = swift_slowAlloc();
      uint64_t v110 = v93;
      *(_DWORD *)uint64_t v67 = 136315395;
      id v68 = v102;
      uint64_t v69 = v103;
      uint64_t v70 = v104;
      (*(void (**)(unsigned char *, void, uint64_t))(v103 + 104))(v102, enum case for StatusType.location(_:), v104);
      sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
      int v92 = v65;
      uint64_t v72 = v71;
      unint64_t v74 = v73;
      (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v68, v70);
      uint64_t v108 = sub_10002A278(v72, v74, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 12) = 2081;
      id v75 = [v62 idsHandle];
      uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v77 = a3;
      unint64_t v79 = v78;

      uint64_t v108 = sub_10002A278(v76, v79, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      a3 = v77;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v92, "No contact for '%s' %{private}s; placeholder created",
        (uint8_t *)v67,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v42 = v99;
      swift_slowDealloc();

      v105(v98, v97);
    }
    else
    {

      swift_release_n();
      v105(v60, v97);
    }
    uint64_t v80 = v96;
    id v81 = [v62 idsHandle];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    ContactPerson.init(contact:idsHandle:)();
    unint64_t v82 = v111;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v82 = sub_10001D000(0, *(void *)(v82 + 16) + 1, 1, v82);
    }
    unint64_t v84 = *(void *)(v82 + 16);
    unint64_t v83 = *(void *)(v82 + 24);
    if (v84 >= v83 >> 1) {
      unint64_t v82 = sub_10001D000(v83 > 1, v84 + 1, 1, v82);
    }
    *(void *)(v82 + 16) = v84 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v94 + 32))(v82+ ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80))+ *(void *)(v94 + 72) * v84, v80, v95);
    uint64_t v111 = v82;
    id v44 = v100;
  }
  swift_beginAccess();
  id v85 = v44;
  swift_retain();
  uint64_t v86 = swift_bridgeObjectRetain();
  sub_1000476F4(v86, v85, a3);
  swift_bridgeObjectRelease_n();

  swift_release();
  sub_1000070B0(&qword_100068250);
  static Promise.all(_:)();
  swift_bridgeObjectRelease();
  uint64_t v87 = swift_allocObject();
  *(void *)(v87 + 16) = a3;
  *(unsigned char *)(v87 + 24) = v101 & 1;
  *(void *)(v87 + 32) = v85;
  id v88 = v85;
  swift_retain();
  uint64_t v89 = dispatch thunk of Promise.then<A>(_:)();
  swift_release();
  swift_release();

  return v89;
}

uint64_t sub_10004887C(void *a1, int a2, uint64_t a3)
{
  LODWORD(v101) = a2;
  uint64_t v95 = type metadata accessor for ContactPerson();
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v6 = &v91[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for StatusType();
  uint64_t v103 = *(void *)(v7 - 8);
  uint64_t v104 = v7;
  __chkstk_darwin(v7);
  uint64_t v102 = &v91[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v100 = &v91[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v98 = &v91[-v14];
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v106 = &v91[-v16];
  __chkstk_darwin(v15);
  id v18 = &v91[-v17];
  static PeopleLogger.location.getter();
  id v19 = a1;
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = &selRef_statusChangeType;
  uint64_t v107 = v10;
  uint64_t v96 = v6;
  if (v22)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v105 = (void (*)(unsigned char *, uint64_t))a3;
    id v99 = (id)v25;
    uint64_t v110 = v25;
    *(_DWORD *)uint64_t v24 = 136380931;
    id v26 = [v19 idsHandle];
    uint64_t v27 = v9;
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v30 = v29;

    uint64_t v31 = v28;
    uint64_t v9 = v27;
    uint64_t v111 = sub_10002A278(v31, v30, &v110);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v32 = BMFindMyLocationChangeEvent.reason.getter();
    uint64_t v111 = sub_10002A278(v32, v33, &v110);
    uint64_t v23 = &selRef_statusChangeType;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Got location change event for handle %{private}s: %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    a3 = (uint64_t)v105;
    swift_slowDealloc();
    uint64_t v10 = v107;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v34 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
  v34(v18, v9);
  os_log_type_t v35 = self;
  sub_1000070B0(&qword_100066C08);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_100053F00;
  id v37 = [v19 v23[49]];
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v40 = v39;

  *(void *)(v36 + 32) = v38;
  *(void *)(v36 + 40) = v40;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v42 = [v35 predicateForContactsMatchingHandleStrings:isa];

  sub_1000070F4((void *)(a3 + 48), *(void *)(a3 + 72));
  unint64_t v43 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  id v44 = v19;
  uint64_t v45 = sub_100047498(v43, v44);
  swift_bridgeObjectRelease();

  uint64_t v111 = v45;
  if (*(void *)(v45 + 16))
  {
    id v99 = v42;
    swift_bridgeObjectRetain();
    uint64_t v46 = v100;
    static PeopleLogger.daemon.getter();
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v106 = 0;
      uint64_t v50 = v49;
      uint64_t v51 = swift_slowAlloc();
      uint64_t v105 = v34;
      uint64_t v98 = (unsigned char *)v51;
      uint64_t v110 = v51;
      *(_DWORD *)uint64_t v50 = 134218242;
      uint64_t v52 = *(void *)(v45 + 16);
      swift_bridgeObjectRelease();
      uint64_t v108 = v52;
      uint64_t v97 = v9;
      uint64_t v96 = &v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      uint64_t v95 = v50 + 14;
      id v54 = v102;
      uint64_t v53 = v103;
      uint64_t v55 = v104;
      (*(void (**)(unsigned char *, void, uint64_t))(v103 + 104))(v102, enum case for StatusType.location(_:), v104);
      sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v56 = dispatch thunk of CustomStringConvertible.description.getter();
      id v57 = v44;
      unint64_t v59 = v58;
      (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v54, v55);
      uint64_t v108 = sub_10002A278(v56, v59, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      id v44 = v57;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Found %ld valid contacts for '%s'", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v105(v100, v97);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      v34(v46, v9);
    }
    id v42 = v99;
  }
  else
  {
    uint64_t v105 = v34;
    uint64_t v106 = 0;
    uint64_t v97 = v9;
    id v60 = v98;
    static PeopleLogger.daemon.getter();
    uint64_t v100 = v44;
    id v61 = v44;
    swift_retain_n();
    id v62 = v61;
    os_log_type_t v63 = Logger.logObject.getter();
    os_log_type_t v64 = static os_log_type_t.default.getter();
    int v65 = v64;
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v66 = swift_slowAlloc();
      id v99 = v42;
      uint64_t v67 = v66;
      uint64_t v93 = swift_slowAlloc();
      uint64_t v110 = v93;
      *(_DWORD *)uint64_t v67 = 136315395;
      id v68 = v102;
      uint64_t v69 = v103;
      uint64_t v70 = v104;
      (*(void (**)(unsigned char *, void, uint64_t))(v103 + 104))(v102, enum case for StatusType.location(_:), v104);
      sub_1000497C4(&qword_100066DB0, 255, (void (*)(uint64_t))&type metadata accessor for StatusType);
      uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
      int v92 = v65;
      uint64_t v72 = v71;
      unint64_t v74 = v73;
      (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v68, v70);
      uint64_t v108 = sub_10002A278(v72, v74, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 12) = 2081;
      id v75 = [v62 idsHandle];
      uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v77 = a3;
      unint64_t v79 = v78;

      uint64_t v108 = sub_10002A278(v76, v79, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      a3 = v77;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v92, "No contact for '%s' %{private}s; placeholder created",
        (uint8_t *)v67,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v42 = v99;
      swift_slowDealloc();

      v105(v98, v97);
    }
    else
    {

      swift_release_n();
      v105(v60, v97);
    }
    uint64_t v80 = v96;
    id v81 = [v62 idsHandle];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    ContactPerson.init(contact:idsHandle:)();
    unint64_t v82 = v111;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v82 = sub_10001D000(0, *(void *)(v82 + 16) + 1, 1, v82);
    }
    unint64_t v84 = *(void *)(v82 + 16);
    unint64_t v83 = *(void *)(v82 + 24);
    if (v84 >= v83 >> 1) {
      unint64_t v82 = sub_10001D000(v83 > 1, v84 + 1, 1, v82);
    }
    *(void *)(v82 + 16) = v84 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v94 + 32))(v82+ ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80))+ *(void *)(v94 + 72) * v84, v80, v95);
    uint64_t v111 = v82;
    id v44 = v100;
  }
  swift_beginAccess();
  id v85 = v44;
  swift_retain();
  uint64_t v86 = swift_bridgeObjectRetain();
  sub_1000476F4(v86, v85, a3);
  swift_bridgeObjectRelease_n();

  swift_release();
  sub_1000070B0(&qword_100068250);
  static Promise.all(_:)();
  swift_bridgeObjectRelease();
  uint64_t v87 = swift_allocObject();
  *(void *)(v87 + 16) = a3;
  *(unsigned char *)(v87 + 24) = v101 & 1;
  *(void *)(v87 + 32) = v85;
  id v88 = v85;
  swift_retain();
  uint64_t v89 = dispatch thunk of Promise.then<A>(_:)();
  swift_release();
  swift_release();

  return v89;
}

uint64_t sub_1000497C4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100049810(uint64_t *a1)
{
  return sub_1000442D8(a1, *(void **)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100049834()
{
  sub_10000900C(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10004986C()
{
  sub_10000900C(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_1000498C4(uint64_t *a1)
{
  return sub_100044D48(a1, v1 + 16, *(void *)(v1 + 56), *(void *)(v1 + 64), *(void **)(v1 + 72), *(void *)(v1 + 80));
}

uint64_t sub_1000498E8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100049938(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100008F18;
  return sub_100045118(a1, v4, v5, v7, v6);
}

uint64_t sub_1000499F8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100023ED4;
  return sub_1000457D8(v2, v3, v4);
}

uint64_t sub_100049AA0()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100049AD8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100023ED4;
  return sub_100045ED0();
}

uint64_t sub_100049B84()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008F18;
  return sub_100044BD4();
}

uint64_t sub_100049C30()
{
  uint64_t v1 = type metadata accessor for ContactPerson();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100049D18(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for ContactPerson() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_100043AC0(a1, a2, v7, v2 + v6, v8);
}

uint64_t sub_100049DC8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100049E00(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(uint64_t (**)(void *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  char v7 = a3 & 1;
  return v4(v6);
}

uint64_t sub_100049E40()
{
  uint64_t v1 = type metadata accessor for ContactPerson();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100049F14(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ContactPerson() - 8);
  uint64_t v4 = v1[2];
  uint64_t v5 = (void (*)(void, void, void))v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_100043C78(a1, v4, v5, v6, v7);
}

uint64_t sub_100049F90()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100049FDC(uint64_t *a1)
{
  return sub_100049810(a1);
}

uint64_t sub_100049FF4(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10001210C(0, &qword_1000684B0);
    sub_10004D3F4();
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v30;
    uint64_t v29 = v31;
    uint64_t v3 = v32;
    uint64_t v4 = v33;
    uint64_t v5 = v34;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v29 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v28 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v27 = (char *)_swiftEmptyArrayStorage;
LABEL_8:
  uint64_t v9 = v4;
  unint64_t v10 = v5;
  while (v1 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_41;
    }
    sub_10001210C(0, &qword_1000684B0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v16 = v35;
    swift_unknownObjectRelease();
    uint64_t v4 = v9;
    uint64_t v5 = v10;
    if (!v35) {
      goto LABEL_41;
    }
LABEL_33:
    id v20 = [v16 normalizedValue];
    if (v20)
    {
      os_log_type_t v21 = v20;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      Swift::String_optional v22 = String.trimToNil()();
      uint64_t countAndFlagsBits = v22.value._countAndFlagsBits;
      object = v22.value._object;
      swift_bridgeObjectRelease();
      if (v22.value._object)
      {

LABEL_36:
        uint64_t v23 = v27;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_10001CD98(0, *((void *)v27 + 2) + 1, 1, v27);
          uint64_t v23 = (char *)result;
        }
        unint64_t v25 = *((void *)v23 + 2);
        unint64_t v24 = *((void *)v23 + 3);
        if (v25 >= v24 >> 1)
        {
          uint64_t result = (uint64_t)sub_10001CD98((char *)(v24 > 1), v25 + 1, 1, v23);
          uint64_t v23 = (char *)result;
        }
        *((void *)v23 + 2) = v25 + 1;
        uint64_t v27 = v23;
        id v26 = &v23[16 * v25];
        *((void *)v26 + 4) = countAndFlagsBits;
        *((void *)v26 + 5) = object;
        goto LABEL_8;
      }
    }
    id v11 = [v16 value];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Swift::String_optional v12 = String.trimToNil()();
    uint64_t countAndFlagsBits = v12.value._countAndFlagsBits;
    object = v12.value._object;

    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v9 = v4;
    unint64_t v10 = v5;
    if (v12.value._object) {
      goto LABEL_36;
    }
  }
  if (v10)
  {
    uint64_t v5 = (v10 - 1) & v10;
    unint64_t v15 = __clz(__rbit64(v10)) | (v9 << 6);
    uint64_t v4 = v9;
LABEL_32:
    id v16 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    if (!v16) {
      goto LABEL_41;
    }
    goto LABEL_33;
  }
  int64_t v17 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v17 >= v28) {
      goto LABEL_41;
    }
    unint64_t v18 = *(void *)(v29 + 8 * v17);
    uint64_t v4 = v9 + 1;
    if (!v18)
    {
      uint64_t v4 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_41;
      }
      unint64_t v18 = *(void *)(v29 + 8 * v4);
      if (!v18)
      {
        uint64_t v4 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_41;
        }
        unint64_t v18 = *(void *)(v29 + 8 * v4);
        if (!v18)
        {
          uint64_t v4 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_41;
          }
          unint64_t v18 = *(void *)(v29 + 8 * v4);
          if (!v18)
          {
            uint64_t v4 = v9 + 5;
            if (v9 + 5 >= v28) {
              goto LABEL_41;
            }
            unint64_t v18 = *(void *)(v29 + 8 * v4);
            if (!v18)
            {
              uint64_t v19 = v9 + 6;
              while (v28 != v19)
              {
                unint64_t v18 = *(void *)(v29 + 8 * v19++);
                if (v18)
                {
                  uint64_t v4 = v19 - 1;
                  goto LABEL_31;
                }
              }
LABEL_41:
              sub_100016970();
              return (uint64_t)v27;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v5 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v4 << 6);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_10004A3F0(uint64_t a1, uint64_t a2, uint64_t a3)
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
      id v11 = (void *)(v10 + 16 * v8);
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
          id v16 = (void *)(v10 + 16 * v15);
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

id sub_10004A528()
{
  id result = [objc_allocWithZone((Class)CHManager) init];
  qword_100069C70 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for CallHistoryFetcher()
{
  return self;
}

uint64_t sub_10004A580()
{
  if (*(void *)(v0 + 32))
  {
    _print_unlocked<A, B>(_:_:)();
    uint64_t v2 = 0;
    uint64_t v1 = (void *)0xE000000000000000;
  }
  else
  {
    uint64_t v1 = (void *)0xE300000000000000;
    uint64_t v2 = 4271950;
  }
  _StringGuts.grow(_:)(63);
  v3._uint64_t countAndFlagsBits = 0xD000000000000029;
  v3._object = (void *)0x8000000100057460;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._object = (void *)0x8000000100057490;
  v4._uint64_t countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v4);
  v5._uint64_t countAndFlagsBits = v2;
  v5._object = v1;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 10506;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  return 0;
}

uint64_t sub_10004A6B0(void *a1)
{
  return sub_10004A6D4(a1);
}

uint64_t sub_10004A6D4(void *a1)
{
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::String v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000070B0(&qword_100066A38);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v23 - 8);
  uint64_t v11 = __chkstk_darwin(v23);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = sub_10004D504(a1);
  if (!*((void *)v14 + 2))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t Strong = (uint64_t (*)(char *, uint64_t))swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    static PeopleLogger.common.getter();
    unint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Where is our status delegate?", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v23);
    goto LABEL_7;
  }
  sub_100021F3C(v1, (uint64_t)v14, Strong);
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  sub_100016DD8((uint64_t)v9, (uint64_t)&unk_1000684F8, v17);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
LABEL_8:
  type metadata accessor for PeopleAnalytics();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for StatusType.missedCall(_:), v3);
  static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1000070B0(&qword_100066A40);
  uint64_t v24 = 0;
  char v25 = 0;
  return Promise.__allocating_init(with:)();
}

uint64_t sub_10004ABE0()
{
  uint64_t v1 = type metadata accessor for StatusType();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_10004AC9C, 0, 0);
}

uint64_t sub_10004AC9C()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for StatusType.missedCall(_:), v0[2]);
  type metadata accessor for MainActor();
  v0[5] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000056A0, v2, v1);
}

uint64_t sub_10004AD54(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.daemon.getter();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Fetching missed call status", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1000070F4((void *)(v2 + 128), *(void *)(v2 + 152));
  dispatch thunk of LaunchRecordReaderProtocol.reload()();
  sub_1000070F4((void *)(v2 + 128), *(void *)(v2 + 152));
  uint64_t v11 = dispatch thunk of LaunchRecordReaderProtocol.dates(forContactIdentifier:)();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a1;
  uint64_t v12[3] = v2;
  v12[4] = v11;
  sub_1000070B0(&qword_1000669E8);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  return Promise.init(startBlock:)();
}

uint64_t sub_10004AF4C(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v82 = a2;
  unint64_t v83 = a1;
  uint64_t v7 = type metadata accessor for StatusType();
  uint64_t v92 = *(void *)(v7 - 8);
  uint64_t v93 = (unsigned int (**)(uint64_t, uint64_t, char *))v7;
  __chkstk_darwin(v7);
  uint64_t v91 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000070B0(&qword_100066A20);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000070B0(&qword_1000684E0);
  __chkstk_darwin(v12 - 8);
  uint64_t v89 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for MissedCallPersonStatus();
  unint64_t v94 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = type metadata accessor for Logger();
  uint64_t v79 = *(void *)(v80 - 8);
  uint64_t v17 = __chkstk_darwin(v80);
  unint64_t v95 = (unint64_t)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  id v20 = (char *)&v78 - v19;
  os_log_type_t v21 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v23 = [v21 predicateForContactsWithIdentifiers:isa];

  sub_100008758(a4 + 40, (uint64_t)v99);
  sub_1000070F4(v99, v99[3]);
  id v81 = v23;
  uint64_t v24 = dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
  char v25 = (void *)v94;
  BOOL v90 = v16;
  uint64_t v91 = (char *)v14;
  unint64_t v78 = v20;
  unint64_t v95 = v24;
  sub_10000900C((uint64_t)v99);
  unint64_t v26 = sub_10000604C((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v27 = v95;
  unint64_t v98 = v26;
  if (v95 >> 62) {
    goto LABEL_34;
  }
  uint64_t v28 = *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (2)
  {
    uint64_t v29 = (uint64_t)v89;
    uint64_t v30 = v91;
    uint64_t v31 = v90;
    if (v28)
    {
      if (v28 >= 1)
      {
        uint64_t v32 = 0;
        uint64_t v93 = (unsigned int (**)(uint64_t, uint64_t, char *))(v25 + 6);
        unint64_t v94 = v27 & 0xC000000000000001;
        id v88 = (void (**)(char *, uint64_t, char *))(v25 + 4);
        uint64_t v87 = (void (**)(uint64_t *, char *, char *))(v25 + 2);
        unint64_t v84 = (void (**)(char *, char *))(v25 + 1);
        long long v86 = xmmword_100053F00;
        uint64_t v92 = v28;
        id v85 = v11;
        while (1)
        {
          id v33 = v94 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v27 + 8 * v32 + 32);
          uint64_t v34 = v33;
          id v35 = [v33 identifier];
          uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v38 = v37;

          if (*((void *)a5 + 2) && (unint64_t v39 = sub_1000071E4(v36, v38), (v40 & 1) != 0))
          {
            unint64_t v41 = v39;
            uint64_t v42 = *((void *)a5 + 7);
            uint64_t v43 = type metadata accessor for Date();
            uint64_t v44 = *(void *)(v43 - 8);
            uint64_t v45 = v44;
            uint64_t v46 = v42 + *(void *)(v44 + 72) * v41;
            uint64_t v30 = v91;
            (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v11, v46, v43);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v11, 0, 1, v43);
            uint64_t v31 = v90;
          }
          else
          {
            uint64_t v47 = type metadata accessor for Date();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v11, 1, 1, v47);
          }
          swift_bridgeObjectRelease();
          sub_10004BC84(v34, (uint64_t)v11, v29);
          sub_10001223C((uint64_t)v11, &qword_100066A20);
          if ((*v93)(v29, 1, v30) != 1) {
            break;
          }

          sub_10001223C(v29, &qword_1000684E0);
LABEL_7:
          ++v32;
          unint64_t v27 = v95;
          if (v92 == v32) {
            goto LABEL_28;
          }
        }
        uint64_t v11 = a5;
        (*v88)(v31, v29, v30);
        id v48 = [v34 identifier];
        uint64_t v49 = v31;
        uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v52 = v51;

        sub_1000070B0(&qword_1000669F0);
        uint64_t v53 = v30;
        uint64_t v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = v86;
        *(void *)(v54 + 56) = v53;
        *(void *)(v54 + 64) = sub_10004CEBC(&qword_1000684E8, 255, (void (*)(uint64_t))&type metadata accessor for MissedCallPersonStatus);
        uint64_t v55 = sub_100007180((uint64_t *)(v54 + 32));
        (*v87)(v55, v49, v53);
        char v25 = (void *)v98;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v99[0] = (uint64_t)v25;
        unint64_t v98 = 0x8000000000000000;
        unint64_t v58 = sub_1000071E4(v50, v52);
        uint64_t v59 = v25[2];
        BOOL v60 = (v57 & 1) == 0;
        uint64_t v61 = v59 + v60;
        if (__OFADD__(v59, v60))
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          swift_bridgeObjectRetain();
          uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          unint64_t v27 = v95;
          continue;
        }
        a5 = v57;
        if (v25[3] < v61)
        {
          sub_100007838(v61, isUniquelyReferenced_nonNull_native);
          unint64_t v62 = sub_1000071E4(v50, v52);
          if ((a5 & 1) != (v63 & 1)) {
            goto LABEL_36;
          }
          unint64_t v58 = v62;
          char v25 = (void *)v99[0];
          if ((a5 & 1) == 0) {
            goto LABEL_25;
          }
LABEL_23:
          uint64_t v64 = v25[7];
          swift_bridgeObjectRelease();
          *(void *)(v64 + 8 * v58) = v54;
LABEL_27:
          unint64_t v98 = (unint64_t)v25;

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v31 = v90;
          uint64_t v30 = v91;
          (*v84)(v90, v91);
          a5 = v11;
          uint64_t v11 = v85;
          uint64_t v29 = (uint64_t)v89;
          goto LABEL_7;
        }
        if (isUniquelyReferenced_nonNull_native)
        {
          char v25 = (void *)v99[0];
          if (v57) {
            goto LABEL_23;
          }
        }
        else
        {
          sub_1000083A4();
          char v25 = (void *)v99[0];
          if (a5) {
            goto LABEL_23;
          }
        }
LABEL_25:
        v25[(v58 >> 6) + 8] |= 1 << v58;
        int v65 = (uint64_t *)(v25[6] + 16 * v58);
        uint64_t *v65 = v50;
        v65[1] = v52;
        *(void *)(v25[7] + 8 * v58) = v54;
        uint64_t v66 = v25[2];
        BOOL v67 = __OFADD__(v66, 1);
        uint64_t v68 = v66 + 1;
        if (v67) {
          goto LABEL_33;
        }
        v25[2] = v68;
        swift_bridgeObjectRetain();
        goto LABEL_27;
      }
      __break(1u);
LABEL_36:
      uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
LABEL_28:
      swift_bridgeObjectRelease();
      uint64_t v69 = v78;
      static PeopleLogger.daemon.getter();
      uint64_t v70 = Logger.logObject.getter();
      os_log_type_t v71 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v72 = v69;
        unint64_t v73 = (uint8_t *)swift_slowAlloc();
        v99[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v73 = 136315138;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_1000070B0(&qword_100068038);
        uint64_t v74 = Dictionary.description.getter();
        unint64_t v76 = v75;
        swift_bridgeObjectRelease();
        uint64_t v96 = sub_10002A278(v74, v76, v99);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v70, v71, "Returning status for missedCall %s", v73, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v79 + 8))(v72, v80);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v79 + 8))(v69, v80);
      }
      swift_beginAccess();
      uint64_t v96 = v98;
      char v97 = 0;
      swift_bridgeObjectRetain();
      v83(&v96);
      swift_bridgeObjectRelease();

      return swift_bridgeObjectRelease();
    }
    return result;
  }
}

uint64_t sub_10004BC84@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v131 = a2;
  uint64_t v5 = sub_1000070B0(&qword_1000684A8);
  __chkstk_darwin(v5 - 8);
  uint64_t v132 = (char *)v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CallServiceProvider();
  uint64_t v128 = *(void *)(v7 - 8);
  uint64_t v129 = v7;
  __chkstk_darwin(v7);
  Swift::String v133 = (char *)v114 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v136 - 8);
  uint64_t v10 = __chkstk_darwin(v136);
  v126 = (char *)v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v114 - v13;
  __chkstk_darwin(v12);
  uint64_t v134 = (char *)v114 - v15;
  uint64_t v16 = sub_1000070B0(&qword_100066A20);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v130 = (uint64_t)v114 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  os_log_type_t v21 = (char *)v114 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)v114 - v22;
  uint64_t v24 = type metadata accessor for Date();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = __chkstk_darwin(v24);
  long long v127 = (char *)v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  unint64_t v135 = (char *)v114 - v29;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)v114 - v30;
  id v124 = a1;
  unint64_t v32 = CNContact.callHistoryHandles.getter();
  unint64_t v33 = v32;
  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v34) {
      goto LABEL_72;
    }
  }
  else
  {
    uint64_t v34 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v34)
    {
LABEL_72:
      swift_bridgeObjectRelease();
      goto LABEL_73;
    }
  }
  uint64_t v122 = v9;
  unint64_t v35 = sub_10004CF04();
  unint64_t v36 = v35;
  if (!(v35 >> 62))
  {
    uint64_t result = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_5;
    }
    goto LABEL_71;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  if (!result)
  {
LABEL_71:
    swift_bridgeObjectRelease();
    goto LABEL_72;
  }
LABEL_5:
  uint64_t v123 = v31;
  if ((v36 & 0xC000000000000001) != 0)
  {
    id v125 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      return result;
    }
    id v38 = *(id *)(v36 + 32);
    id v125 = v38;
  }
  swift_bridgeObjectRelease();
  id v39 = [v38 date];

  if (v39)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v21, 0, 1, v24);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v21, 1, 1, v24);
  }
  char v40 = v123;
  sub_10003AE04((uint64_t)v21, (uint64_t)v23);
  uint64_t v120 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v120(v23, 1, v24) == 1)
  {
    swift_bridgeObjectRelease();

    sub_10001223C((uint64_t)v23, &qword_100066A20);
LABEL_73:
    uint64_t v82 = type metadata accessor for MissedCallPersonStatus();
    unint64_t v83 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56);
    uint64_t v84 = a3;
    return v83(v84, 1, 1, v82);
  }
  unint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
  uint64_t v116 = v25 + 32;
  uint64_t v115 = v41;
  v41(v40, (uint64_t)v23, v24);
  id v42 = [v125 remoteParticipantHandles];
  uint64_t v119 = v24;
  if (!v42)
  {
    swift_bridgeObjectRelease();
    static PeopleLogger.daemon.getter();
    unint64_t v73 = Logger.logObject.getter();
    os_log_type_t v74 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v73, v74))
    {
      unint64_t v75 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "Missed call but no remote handles", v75, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v122 + 8))(v14, v136);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v40, v119);
    goto LABEL_73;
  }
  uint64_t v43 = v42;
  v114[1] = v25 + 48;
  uint64_t v118 = v25;
  uint64_t v117 = a3;
  sub_10001210C(0, &qword_1000684B0);
  sub_10004D3F4();
  uint64_t v44 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v121 = (void *)sub_100049FF4(v44);
  uint64_t result = swift_bridgeObjectRelease();
  if (v34 < 1) {
    goto LABEL_78;
  }
  swift_bridgeObjectRetain();
  uint64_t v45 = 0;
  uint64_t v46 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if ((v33 & 0xC000000000000001) != 0) {
      id v47 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v47 = *(id *)(v33 + 8 * v45 + 32);
    }
    id v48 = v47;
    id v49 = [v47 value];
    uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v52 = v51;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v46 = sub_10001CD98(0, *((void *)v46 + 2) + 1, 1, v46);
    }
    unint64_t v54 = *((void *)v46 + 2);
    unint64_t v53 = *((void *)v46 + 3);
    if (v54 >= v53 >> 1) {
      uint64_t v46 = sub_10001CD98((char *)(v53 > 1), v54 + 1, 1, v46);
    }
    ++v45;
    *((void *)v46 + 2) = v54 + 1;
    uint64_t v55 = &v46[16 * v54];
    *((void *)v55 + 4) = v50;
    *((void *)v55 + 5) = v52;
  }
  while (v34 != v45);
  swift_bridgeObjectRelease_n();
  uint64_t v56 = sub_100022E04((uint64_t)v46);
  swift_bridgeObjectRelease();
  uint64_t v57 = v121[2];
  if (v57)
  {
    uint64_t v58 = v121[4];
    unint64_t v60 = v121[5];
    uint64_t v59 = v121 + 4;
    if (*(void *)(v56 + 16))
    {
      uint64_t v61 = v56 + 56;
      unint64_t v62 = 1;
      while (1)
      {
        swift_bridgeObjectRetain();
        Hasher.init(_seed:)();
        String.hash(into:)();
        Swift::Int v63 = Hasher._finalize()();
        uint64_t v64 = -1 << *(unsigned char *)(v56 + 32);
        unint64_t v65 = v63 & ~v64;
        if (((*(void *)(v61 + ((v65 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v65) & 1) == 0) {
          break;
        }
        uint64_t v66 = *(void *)(v56 + 48);
        BOOL v67 = (void *)(v66 + 16 * v65);
        BOOL v68 = *v67 == v58 && v67[1] == v60;
        if (!v68 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          uint64_t v69 = ~v64;
          do
          {
            unint64_t v65 = (v65 + 1) & v69;
            if (((*(void *)(v61 + ((v65 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v65) & 1) == 0) {
              goto LABEL_48;
            }
            uint64_t v70 = (void *)(v66 + 16 * v65);
            BOOL v71 = *v70 == v58 && v70[1] == v60;
          }
          while (!v71 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
        }
        uint64_t result = swift_bridgeObjectRelease();
        if (v62 == v57) {
          goto LABEL_54;
        }
        if (v62 >= v121[2]) {
          goto LABEL_77;
        }
        uint64_t v72 = &v59[2 * v62];
        uint64_t v58 = *v72;
        unint64_t v60 = v72[1];
        ++v62;
        if (!*(void *)(v56 + 16)) {
          goto LABEL_43;
        }
      }
LABEL_48:
      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_43:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    unint64_t v76 = v134;
    static PeopleLogger.daemon.getter();
    swift_bridgeObjectRetain();
    uint64_t v77 = Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.debug.getter();
    BOOL v79 = os_log_type_enabled(v77, v78);
    uint64_t v80 = v117;
    if (v79)
    {
      id v81 = (uint8_t *)swift_slowAlloc();
      v138[0] = swift_slowAlloc();
      *(_DWORD *)id v81 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v137 = sub_10002A278(v58, v60, v138);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Not a 1 to 1 call with %s", v81, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v122 + 8))(v76, v136);
    (*(void (**)(char *, uint64_t))(v118 + 8))(v123, v119);
    goto LABEL_53;
  }
LABEL_54:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v85 = (uint64_t)v132;
  long long v86 = v135;
  uint64_t v87 = v130;
  sub_10003AD9C(v131, v130);
  uint64_t v88 = v119;
  unsigned int v89 = v120((char *)v87, 1, v119);
  uint64_t v80 = v117;
  BOOL v90 = v133;
  if (v89 == 1)
  {
    sub_10001223C(v87, &qword_100066A20);
  }
  else
  {
    v115(v86, v87, v88);
    if (static Date.< infix(_:_:)())
    {
      uint64_t v91 = v126;
      static PeopleLogger.daemon.getter();
      id v92 = v124;
      uint64_t v93 = Logger.logObject.getter();
      os_log_type_t v94 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v93, v94))
      {
        unint64_t v95 = (uint8_t *)swift_slowAlloc();
        v138[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v95 = 136315138;
        id v96 = [v92 identifier];
        uint64_t v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v99 = v98;

        uint64_t v80 = v117;
        uint64_t v137 = sub_10002A278(v97, v99, v138);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v93, v94, "%s viewed since missed call", v95, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v122 + 8))(v126, v136);
        uint64_t v100 = *(void (**)(char *, uint64_t))(v118 + 8);
        uint64_t v101 = v135;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v122 + 8))(v91, v136);
        uint64_t v100 = *(void (**)(char *, uint64_t))(v118 + 8);
        uint64_t v101 = v86;
      }
      uint64_t v113 = v119;
      v100(v101, v119);
      v100(v123, v113);
LABEL_53:
      uint64_t v82 = type metadata accessor for MissedCallPersonStatus();
      unint64_t v83 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56);
      uint64_t v84 = v80;
      return v83(v84, 1, 1, v82);
    }
    (*(void (**)(char *, uint64_t))(v118 + 8))(v86, v88);
  }
  String.localized.getter();
  sub_1000070B0(&qword_1000684C0);
  uint64_t v102 = swift_allocObject();
  *(_OWORD *)(v102 + 16) = xmmword_100053F00;
  Swift::String v103 = Date.relativeDateString()();
  *(void *)(v102 + 56) = &type metadata for String;
  *(void *)(v102 + 64) = sub_10004D45C();
  *(Swift::String *)(v102 + 32) = v103;
  String.init(format:_:)();
  swift_bridgeObjectRelease();
  id v104 = [v125 serviceProvider];
  if (v104)
  {
    uint64_t v105 = v104;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  CallServiceProvider.init(rawValue:)();
  uint64_t v107 = v128;
  uint64_t v106 = v129;
  int v108 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v128 + 48))(v85, 1, v129);
  char v109 = v123;
  if (v108 == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v107 + 104))(v90, enum case for CallServiceProvider.other(_:), v106);
    sub_10001223C(v85, &qword_1000684A8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v107 + 32))(v90, v85, v106);
  }
  uint64_t v110 = v118;
  uint64_t v111 = v119;
  (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v127, v109, v119);
  MissedCallPersonStatus.init(localizedString:serviceProvider:date:)();

  (*(void (**)(char *, uint64_t))(v110 + 8))(v109, v111);
  uint64_t v112 = type metadata accessor for MissedCallPersonStatus();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v112 - 8) + 56))(v80, 0, 1, v112);
}

uint64_t sub_10004CC88()
{
  sub_10000905C(v0 + 16);
  swift_release();
  sub_10000900C(v0 + 40);
  sub_10000900C(v0 + 80);
  swift_release();
  sub_10000900C(v0 + 128);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MissedCallStatusSource()
{
  return self;
}

uint64_t sub_10004CD0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for StatusType.missedCall(_:);
  uint64_t v3 = type metadata accessor for StatusType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_10004CD80(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return StatusSource.debugID.getter(a1, WitnessTable);
}

uint64_t sub_10004CDD4(uint64_t a1)
{
  return sub_10004AD54(a1);
}

uint64_t sub_10004CDF8()
{
  return sub_10004A580();
}

uint64_t sub_10004CE1C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10004CEBC(&qword_100068498, a2, (void (*)(uint64_t))type metadata accessor for MissedCallStatusSource);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10004CE74(uint64_t a1, uint64_t a2)
{
  return sub_10004CEBC(&qword_1000684A0, a2, (void (*)(uint64_t))type metadata accessor for MissedCallStatusSource);
}

uint64_t sub_10004CEBC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_10004CF04()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = self;
  id v5 = [v4 predicateForCallsWithStatus:kCHCallStatusMissed];
  id v6 = [v4 predicateForCallsWithStatusRead:0];
  uint64_t v33 = sub_10001210C(0, &qword_1000684B0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v8 = [v4 predicateForCallsWithAnyRemoteParticipantHandles:isa];

  sub_1000070B0(&qword_100066F90);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100054E00;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v8;
  uint64_t v37 = v9;
  specialized Array._endMutation()();
  sub_10001210C(0, &qword_1000684D0);
  id v35 = v5;
  id v10 = v6;
  id v34 = v8;
  Class v11 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [self andPredicateWithSubpredicates:v11];

  if (qword_100066740 != -1) {
    swift_once();
  }
  id v13 = [(id)qword_100069C70 callsWithPredicate:v12 limit:0 offset:0 batchSize:0];
  sub_10001210C(0, &qword_1000684D8);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  static PeopleLogger.daemon.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = v12;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    id v32 = v10;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    id v31 = v15;
    uint64_t v37 = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v30 = v1;
    swift_bridgeObjectRetain();
    uint64_t v21 = Array.description.getter();
    uint64_t v29 = v3;
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v36 = sub_10002A278(v21, v23, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v24 = Array.description.getter();
    uint64_t v33 = v0;
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t v36 = sub_10002A278(v24, v26, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Calls fetched %s for %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v33);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return v14;
}

unint64_t sub_10004D3F4()
{
  unint64_t result = qword_1000684B8;
  if (!qword_1000684B8)
  {
    sub_10001210C(255, &qword_1000684B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000684B8);
  }
  return result;
}

unint64_t sub_10004D45C()
{
  unint64_t result = qword_1000684C8;
  if (!qword_1000684C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000684C8);
  }
  return result;
}

uint64_t sub_10004D4B0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10004D4F8(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_10004AF4C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(char **)(v2 + 32));
}

char *sub_10004D504(void *a1)
{
  uint64_t v54 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v54 - 8);
  uint64_t v4 = __chkstk_darwin(v54);
  id v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v47 - v7;
  sub_10001210C(0, &qword_100068500);
  sub_10001210C(0, &qword_100068508);
  id v9 = [a1 interaction];
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  id v13 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  sub_100031490(v10, v12);
  if (v1) {
    return v6;
  }
  uint64_t v52 = v6;
  if (!v13) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v53 = v3;
  uint64_t v50 = 0;
  static PeopleLogger.daemon.getter();
  uint64_t v14 = v13;
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v51 = v14;
  if (v17)
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    id v49 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138412290;
    uint64_t v55 = v14;
    uint64_t v19 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v49->Class isa = (Class)v13;

    uint64_t v14 = v51;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Got interaction from call intent %@", v18, 0xCu);
    sub_1000070B0(&qword_100066A58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v15 = v14;
  }

  uint64_t v20 = *(void (**)(char *, uint64_t))(v53 + 8);
  v53 += 8;
  v20(v8, v54);
  uint64_t v21 = [v14 intent];
  self;
  uint64_t v22 = swift_dynamicCastObjCClass();
  if (!v22)
  {

    id v6 = (char *)_swiftEmptyArrayStorage;
LABEL_32:

    return v6;
  }
  unint64_t v23 = v22;
  uint64_t v24 = v52;
  static PeopleLogger.daemon.getter();
  unint64_t v25 = v21;
  unint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  id v49 = v25;
  if (v28)
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    id v47 = (void *)swift_slowAlloc();
    id v48 = v20;
    *(_DWORD *)uint64_t v29 = 138412290;
    uint64_t v55 = v23;
    uint64_t v30 = v25;
    uint64_t v24 = v52;
    uint64_t v20 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v47 = v23;

    uint64_t v14 = v51;
    unint64_t v25 = v49;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Got call intent %@", v29, 0xCu);
    sub_1000070B0(&qword_100066A58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    unint64_t v26 = v25;
  }

  v20(v24, v54);
  id v31 = [v23 contacts];
  if (!v31)
  {

    id v6 = (char *)_swiftEmptyArrayStorage;
    uint64_t v21 = v14;
    goto LABEL_32;
  }
  id v32 = v31;
  sub_10001210C(0, &qword_100068510);
  unint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v33 >> 62))
  {
    uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t result = (char *)swift_bridgeObjectRetain();
    if (v34) {
      goto LABEL_15;
    }
LABEL_30:
    id v6 = (char *)_swiftEmptyArrayStorage;
LABEL_31:

    swift_bridgeObjectRelease_n();
    uint64_t v21 = v49;
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  unint64_t result = (char *)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v34 = (uint64_t)result;
  if (!result) {
    goto LABEL_30;
  }
LABEL_15:
  if (v34 >= 1)
  {
    uint64_t v36 = 0;
    id v6 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if ((v33 & 0xC000000000000001) != 0) {
        id v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v37 = *(id *)(v33 + 8 * v36 + 32);
      }
      id v38 = v37;
      id v39 = [v37 contactIdentifier];
      if (v39)
      {
        char v40 = v39;
        uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v43 = v42;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v6 = sub_10001CD98(0, *((void *)v6 + 2) + 1, 1, v6);
        }
        unint64_t v45 = *((void *)v6 + 2);
        unint64_t v44 = *((void *)v6 + 3);
        if (v45 >= v44 >> 1) {
          id v6 = sub_10001CD98((char *)(v44 > 1), v45 + 1, 1, v6);
        }
        *((void *)v6 + 2) = v45 + 1;
        uint64_t v46 = &v6[16 * v45];
        *((void *)v46 + 4) = v41;
        *((void *)v46 + 5) = v43;
      }
      else
      {
      }
      ++v36;
    }
    while (v34 != v36);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_10004DB38()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004DB70()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008F18;
  return sub_10004ABE0();
}

void *sub_10004DC1C(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a2;
  uint64_t v6 = sub_1000070B0(&qword_100068668);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RelevantIntent();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v30 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  os_log_type_t v27 = (char *)&v24 - v13;
  uint64_t v14 = *(void *)(a3 + 16);
  if (!v14) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v25 = v12;
  BOOL v28 = (void (**)(char *))(v12 + 32);
  uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  uint64_t v24 = a3;
  uint64_t v15 = (uint64_t *)(a3 + 40);
  unint64_t v33 = _swiftEmptyArrayStorage;
  unint64_t v26 = a1;
  do
  {
    uint64_t v16 = v9;
    uint64_t v17 = *v15;
    v32[0] = *(v15 - 1);
    v32[1] = v17;
    swift_bridgeObjectRetain();
    a1(v32);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v33;
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v16;
    if ((*v29)(v8, 1, v16) == 1)
    {
      sub_10001223C((uint64_t)v8, &qword_100068668);
    }
    else
    {
      uint64_t v18 = v27;
      uint64_t v19 = *v28;
      (*v28)(v27);
      ((void (*)(char *, char *, uint64_t))v19)(v30, v18, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v33 = (void *)sub_10001D2B4(0, v33[2] + 1, 1, (unint64_t)v33);
      }
      unint64_t v21 = v33[2];
      unint64_t v20 = v33[3];
      if (v21 >= v20 >> 1) {
        unint64_t v33 = (void *)sub_10001D2B4(v20 > 1, v21 + 1, 1, (unint64_t)v33);
      }
      uint64_t v22 = v33;
      v33[2] = v21 + 1;
      uint64_t v9 = v16;
      ((void (*)(char *, char *, uint64_t))v19)((char *)v22+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v21, v30, v16);
      a1 = v26;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v33;
}

void *sub_10004DF3C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
    unint64_t result = (void *)sub_10000D774(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 identifier];
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10000D774(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      void v13[5] = v10;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_10004E0B8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  sub_10001210C(0, &qword_100068680);
  v7.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  if (a2)
  {
    void v8[4] = a2;
    v8[5] = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    uint64_t v8[2] = sub_100024B90;
    v8[3] = &unk_1000631A0;
    a2 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  [v6 setRelevantShortcuts:v7.super.isa completionHandler:a2];
  _Block_release(a2);
}

uint64_t sub_10004E1B4(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return _swift_task_switch(sub_10004E278, 0, 0);
}

uint64_t sub_10004E278()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  id v5 = sub_10004DC1C((void (*)(void))sub_100051804, v4, v3);
  v0[9] = v5;
  swift_task_dealloc();
  sub_1000070F4((void *)(v2 + 216), *(void *)(v2 + 240));
  uint64_t v6 = static PeopleConstants.appBundleID.getter();
  uint64_t v8 = v7;
  v0[10] = v7;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[11] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10004E394;
  return RelevantIntentManager.updateRelevantIntents(_:for:)(v5, v6, v8);
}

uint64_t sub_10004E394()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return _swift_task_switch(sub_10004E534, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_10004E534()
{
  static PeopleLogger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error updating single contact relevant intents: %@", v3, 0xCu);
    sub_1000070B0(&qword_100066A58);
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
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_10004E714(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = *a1;
  uint64_t v9 = (void *)a1[1];
  sub_10004E7A0(a2, v8, v9, a3, a4);
  if (v4) {
    __break(1u);
  }
}

uint64_t sub_10004E7A0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v54 = a5;
  uint64_t v51 = a4;
  id v53 = a3;
  uint64_t v7 = type metadata accessor for RelevantContext();
  __chkstk_darwin(v7 - 8);
  uint64_t v52 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000070B0(&qword_100068670);
  __chkstk_darwin(v9 - 8);
  id v47 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SelectPerson();
  uint64_t v49 = *(void *)(v11 - 8);
  uint64_t v50 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v58 = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v43 - v14;
  uint64_t v48 = type metadata accessor for Date();
  uint64_t v16 = *(void *)(v48 - 8);
  uint64_t v17 = __chkstk_darwin(v48);
  uint64_t v46 = (char *)v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  unint64_t v20 = (char *)v43 - v19;
  sub_1000070F4(a1 + 2, a1[5]);
  uint64_t v21 = a2;
  id v22 = v53;
  uint64_t v23 = dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)();
  if (v23)
  {
    unint64_t v44 = v20;
    uint64_t v45 = v16;
    uint64_t v24 = (void *)v23;
    Date.init()();
    SelectPerson.init()();
    uint64_t v56 = v21;
    id v57 = v22;
    sub_1000070F4(a1 + 17, a1[20]);
    swift_bridgeObjectRetain();
    id v53 = v24;
    dispatch thunk of ContactFormatterProtocol.displayName(for:)();
    type metadata accessor for VerticalTextHelper();
    static VerticalTextHelper.shared.getter();
    uint64_t v25 = dispatch thunk of VerticalTextHelper.makeIdentifier(for:)();
    os_log_type_t v27 = v26;
    swift_release();
    if (v27)
    {
      v55._uint64_t countAndFlagsBits = 124;
      v55._object = (void *)0xE100000000000000;
      v28._uint64_t countAndFlagsBits = v25;
      v28._object = v27;
      String.append(_:)(v28);
      swift_bridgeObjectRelease();
      String.append(_:)(v55);
      swift_bridgeObjectRelease();
    }
    uint64_t v29 = v47;
    PersonTypeAppEntity.init(id:displayString:)();
    uint64_t v30 = type metadata accessor for PersonTypeAppEntity();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
    uint64_t v31 = v15;
    SelectPerson.person.setter();
    uint64_t v33 = v49;
    uint64_t v32 = v50;
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v58, v15, v50);
    id v47 = (char *)static PeopleConstants.singleContactWidgetKind.getter();
    v43[1] = v34;
    id v35 = v46;
    uint64_t v36 = v44;
    static Date.+ infix(_:_:)();
    static RelevantContext.date(from:to:)();
    id v37 = *(void (**)(char *, uint64_t))(v45 + 8);
    uint64_t v38 = v48;
    v37(v35, v48);
    sub_100051820(&qword_100068678, (void (*)(uint64_t))&type metadata accessor for SelectPerson);
    uint64_t v39 = v54;
    RelevantIntent.init<A>(_:widgetKind:relevance:)();

    (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v32);
    v37(v36, v38);
    uint64_t v40 = type metadata accessor for RelevantIntent();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
  }
  else
  {
    uint64_t v42 = type metadata accessor for RelevantIntent();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v54, 1, 1, v42);
  }
}

void sub_10004ECA0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v50 = a3;
  uint64_t v57 = a2;
  uint64_t v58 = a4;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000070B0(&qword_100066A20);
  __chkstk_darwin(v9 - 8);
  uint64_t v49 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v51 = *(void *)(v11 - 8);
  uint64_t v52 = v11;
  __chkstk_darwin(v11);
  uint64_t v54 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000070B0(&qword_100068640);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for INShortcut();
  uint64_t v55 = *(void *)(v16 - 8);
  uint64_t v56 = v16;
  __chkstk_darwin(v16);
  id v53 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000070F4((void *)(a1 + 16), *(void *)(a1 + 40));
  static PeopleConstants.maxContactsInMultipleWidget.getter();
  unint64_t v18 = dispatch thunk of ContactFetcherProtocol.recommendedContacts(maxSuggestions:excludeContactIdentifiers:)();
  unint64_t v19 = v18;
  if (v18 >> 62) {
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v20 < static PeopleWidgetConfiguration.minContacts(forFamily:)()
    || (uint64_t v21 = sub_10004DF3C(v19),
        uint64_t v22 = sub_100022E04((uint64_t)v21),
        swift_bridgeObjectRelease(),
        char v23 = sub_10000DEE4(v57, v22),
        swift_bridgeObjectRelease(),
        (v23 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    static PeopleLogger.daemon.getter();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "WidgetSuggester: Not enough contact suggestions", v26, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_8;
  }
  id v28 = [objc_allocWithZone((Class)type metadata accessor for SelectPeopleIntent()) init];
  static PeopleConstants.appBundleID.getter();
  NSString v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 _setLaunchId:v29];

  swift_retain();
  sub_100051410(v19, a1);
  swift_bridgeObjectRelease();
  swift_release();
  type metadata accessor for PersonType();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v28 setPeople:isa];

  id v31 = v28;
  INShortcut.init(intent:)();
  uint64_t v33 = v55;
  uint64_t v32 = v56;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v15, 1, v56) == 1)
  {
    sub_10001223C((uint64_t)v15, &qword_100068640);

LABEL_8:
    os_log_type_t v27 = _swiftEmptyArrayStorage;
    goto LABEL_9;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v53, v15, v32);
  id v34 = objc_allocWithZone((Class)INRelevantShortcut);
  Class v35 = INShortcut._bridgeToObjectiveC()().super.isa;
  id v36 = [v34 initWithShortcut:v35];

  static PeopleConstants.multipleContactsWidgetKind.getter();
  NSString v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v36 setWidgetKind:v37];

  Date.init()();
  uint64_t v57 = sub_1000070B0(&qword_100066F90);
  uint64_t v38 = swift_allocObject();
  long long v48 = xmmword_100054F60;
  *(_OWORD *)(v38 + 16) = xmmword_100054F60;
  uint64_t v39 = v49;
  static Date.+ infix(_:_:)();
  uint64_t v40 = v51;
  uint64_t v41 = v52;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56))(v39, 0, 1, v52);
  v42.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v39, 1, v41) == 1)
  {
    Class v43 = 0;
  }
  else
  {
    Class v43 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v41);
  }
  uint64_t v44 = v40;
  id v45 = [objc_allocWithZone((Class)INDateRelevanceProvider) initWithStartDate:v42.super.isa endDate:v43];

  *(void *)(v38 + 32) = v45;
  uint64_t v59 = (void *)v38;
  specialized Array._endMutation()();
  sub_10001210C(0, &qword_100068648);
  Class v46 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v36 setRelevanceProviders:v46];

  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = v48;
  *(void *)(v47 + 32) = v36;
  uint64_t v59 = (void *)v47;
  specialized Array._endMutation()();
  os_log_type_t v27 = v59;

  (*(void (**)(char *, uint64_t))(v44 + 8))(v54, v41);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v53, v56);
LABEL_9:
  *uint64_t v58 = v27;
}

uint64_t sub_10004F3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a2;
  uint64_t v4 = type metadata accessor for StatusType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for WidgetSuggester.Relevance();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v37 + 64);
  uint64_t v10 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v36 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v36 - v15;
  if ((sub_100050378() & 1) != 0
    && ((*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4),
        int v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4),
        v17 != enum case for StatusType.dndAvailability(_:)))
  {
    if (v17 != enum case for StatusType.motionState(_:)
      && v17 != enum case for StatusType.location(_:)
      && v17 != enum case for StatusType.askToBuyRequest(_:)
      && v17 != enum case for StatusType.screenTimeRequest(_:)
      && v17 != enum case for StatusType.childState(_:)
      && v17 != enum case for StatusType.unreadMessage(_:)
      && v17 != enum case for StatusType.readMessage(_:)
      && v17 != enum case for StatusType.missedCall(_:)
      && v17 != enum case for StatusType.calendar(_:))
    {
      uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)();
      __break(1u);
      return result;
    }
    id v27 = [self hours];
    sub_10001210C(0, (unint64_t *)&qword_100066E70);
    Measurement.init(value:unit:)();
    sub_100051084((uint64_t)v14, (uint64_t)v16);
    id v28 = sub_1000070F4((void *)(v2 + 96), *(void *)(v2 + 120));
    sub_100008758(*v28 + 16, (uint64_t)v39);
    uint64_t v29 = swift_allocObject();
    sub_1000087BC(v39, v29 + 16);
    sub_1000070B0(&qword_100067148);
    swift_allocObject();
    Promise.init(startBlock:)();
    sub_1000070B0(&qword_100066CA0);
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    sub_100051120((uint64_t)v16, (uint64_t)v11);
    unint64_t v30 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    uint64_t v31 = swift_allocObject();
    uint64_t v32 = v38;
    *(void *)(v31 + 16) = v2;
    *(void *)(v31 + 24) = v32;
    sub_100051084((uint64_t)v11, v31 + v30);
    swift_retain();
    swift_bridgeObjectRetain();
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    sub_100051120((uint64_t)v16, (uint64_t)v11);
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v2;
    *(void *)(v33 + 24) = v32;
    sub_100051084((uint64_t)v11, v33 + v30);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1000070B0(&qword_100068638);
    dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    sub_100008758(v2 + 56, (uint64_t)v39);
    uint64_t v34 = swift_allocObject();
    sub_1000087BC(v39, v34 + 16);
    *(void *)(v34 + 56) = v2;
    swift_retain();
    uint64_t v18 = dispatch thunk of Promise.then<A>(_:)();
    swift_release();
    swift_release();
    sub_1000512DC((uint64_t)v16);
  }
  else
  {
    sub_1000070B0(&qword_100066A40);
    *(void *)&v39[0] = 0;
    BYTE8(v39[0]) = 0;
    return Promise.__allocating_init(with:)();
  }
  return v18;
}

uint64_t sub_10004F900@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v5 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_23:
    uint64_t result = swift_bridgeObjectRelease();
LABEL_24:
    *a2 = _swiftEmptyArrayStorage;
    return result;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_23;
  }
LABEL_3:
  if (v5 >= 1)
  {
    unint64_t v19 = a2;
    uint64_t v20 = v2;
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = (v4 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(v4 + 8 * v7 + 32);
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, "containerBundleIdentifier", v19, v20);
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v14 = v13;

      uint64_t v15 = static PeopleConstants.appBundleID.getter();
      if (!v14) {
        goto LABEL_6;
      }
      if (v12 == v15 && v14 == v16)
      {
        swift_bridgeObjectRelease_n();
LABEL_20:
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        goto LABEL_7;
      }
      char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_20;
      }

LABEL_7:
      if (v5 == ++v7)
      {
        uint64_t result = swift_bridgeObjectRelease();
        a2 = v19;
        goto LABEL_24;
      }
    }
    static PeopleConstants.appBundleID.getter();
LABEL_6:

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_10004FAE8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  uint64_t v23 = a3;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WidgetSuggester.Relevance();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  unint64_t v13 = *a1;
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_3;
    }
LABEL_7:
    sub_1000070B0(&qword_100068650);
    sub_100051120(v22, (uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = v23;
    *(void *)(v20 + 16) = a2;
    *(void *)(v20 + 24) = v21;
    sub_100051084((uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
    swift_retain();
    swift_bridgeObjectRetain();
    return Promise.__allocating_init(_:)();
  }
  if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_7;
  }
LABEL_3:
  static PeopleLogger.daemon.getter();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "WidgetSuggester: Not suggesting because user already has contact widgets", v16, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1000070B0(&qword_100068650);
  uint64_t v24 = 0;
  char v25 = 0;
  return Promise.__allocating_init(with:)();
}

uint64_t sub_10004FD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  void *v7 = v4;
  v7[1] = sub_10004FE4C;
  return sub_10004E1B4(a3, a4);
}

uint64_t sub_10004FE4C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10004FF48, 0, 0);
}

uint64_t sub_10004FF48()
{
  **(unsigned char **)(v0 + 16) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10004FF6C(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  if (*a1 != 1)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    goto LABEL_5;
  }
  sub_10004ECA0(a2, a3, a4, &v12);
  if (!v5)
  {
    uint64_t v11 = v12;
LABEL_5:
    *a5 = v11;
    return;
  }
  __break(1u);
}

uint64_t sub_100050014(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_100008758(a2, (uint64_t)v9);
    uint64_t v6 = swift_allocObject();
    sub_1000087BC(v9, v6 + 16);
    *(void *)(v6 + 56) = v5;
    *(void *)(v6 + 64) = a3;
    sub_1000070B0(&qword_100066A40);
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_retain();
    return Promise.init(startBlock:)();
  }
  sub_1000070B0(&qword_100066A40);
  return Promise.__allocating_init(with:)();
}

uint64_t sub_100050140(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_retain();
  uint64_t v12 = a3[3];
  uint64_t v13 = a3[4];
  sub_1000070F4(a3, v12);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = sub_100016C6C;
  void v14[3] = v10;
  v14[4] = a5;
  os_log_type_t v15 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v13 + 8);
  swift_retain();
  swift_retain();
  v15(a4, sub_100051404, v14, v12, v13);
  swift_release();
  return swift_release();
}

uint64_t sub_100050270(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    swift_errorRetain();
    a2(a1, 1);
    return swift_errorRelease();
  }
  else
  {
    sub_1000070F4((void *)(a4 + 176), *(void *)(a4 + 200));
    v7[3] = type metadata accessor for Date();
    sub_100007180(v7);
    Date.init()();
    static PeopleConstants.widgetSuggestionDateKey.getter();
    dispatch thunk of KeyValueStorageProtocol.setValue(_:forKey:)();
    swift_bridgeObjectRelease();
    sub_10001223C((uint64_t)v7, &qword_100067250);
    return ((uint64_t (*)(void, void))a2)(0, 0);
  }
}

uint64_t sub_100050378()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v64 = *(void *)(v1 - 8);
  uint64_t v65 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  id v53 = (char *)&v51 - v6;
  __chkstk_darwin(v5);
  uint64_t v52 = (char *)&v51 - v7;
  uint64_t v8 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v59 = *(void *)(v8 - 8);
  uint64_t v60 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v58 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v57 = (char *)&v51 - v11;
  uint64_t v12 = type metadata accessor for Calendar();
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v56 = v12;
  __chkstk_darwin(v12);
  uint64_t v54 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DateComponents();
  uint64_t v62 = *(void *)(v14 - 8);
  uint64_t v63 = v14;
  __chkstk_darwin(v14);
  uint64_t v61 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000070B0(&qword_100066A20);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  char v25 = (char *)&v51 - v24;
  sub_1000070F4((void *)(v0 + 176), *(void *)(v0 + 200));
  static PeopleConstants.widgetSuggestionDateKey.getter();
  dispatch thunk of KeyValueStorageProtocol.value(forKey:)();
  swift_bridgeObjectRelease();
  if (!v67)
  {
    sub_10001223C((uint64_t)v66, &qword_100067250);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
    goto LABEL_8;
  }
  int v26 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, v26 ^ 1u, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
LABEL_8:
    sub_10001223C((uint64_t)v18, &qword_100066A20);
    static PeopleLogger.daemon.getter();
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v45))
    {
      Class v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Class v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Last widget suggestion date not found, suggest widgets", v46, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v64 + 8))(v4, v65);
    return 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v25, v18, v19);
  id v27 = v54;
  static Calendar.current.getter();
  sub_1000070B0(&qword_100068610);
  uint64_t v28 = type metadata accessor for Calendar.Component();
  uint64_t v29 = *(void *)(v28 - 8);
  unint64_t v30 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_100053F00;
  (*(void (**)(unint64_t, void, uint64_t))(v29 + 104))(v31 + v30, enum case for Calendar.Component.hour(_:), v28);
  sub_100050CC4(v31);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  Date.init()();
  uint64_t v32 = v61;
  uint64_t v51 = v25;
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  v33(v23, v19);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v27, v56);
  DateComponents.hour.getter();
  id v34 = [self hours];
  sub_10001210C(0, (unint64_t *)&qword_100066E70);
  Class v35 = v57;
  Measurement.init(value:unit:)();
  uint64_t v36 = v58;
  static PeopleConstants.widgetSuggestionTTL.getter();
  sub_100050FDC();
  uint64_t v37 = v60;
  LOBYTE(v31) = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v59 + 8);
  v38(v36, v37);
  v38(v35, v37);
  if ((v31 & 1) == 0)
  {
    uint64_t v47 = v52;
    static PeopleLogger.daemon.getter();
    long long v48 = Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Last widget suggestion date is older 24 hours, suggest widgets", v50, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v64 + 8))(v47, v65);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v32, v63);
    v33(v51, v19);
    return 1;
  }
  uint64_t v39 = v53;
  static PeopleLogger.daemon.getter();
  uint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    NSDate v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSDate v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Last widget suggestion date is within 24 hours, do not suggest widgets", v42, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v64 + 8))(v39, v65);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v32, v63);
  v33(v51, v19);
  return 0;
}

uint64_t sub_100050C40()
{
  sub_10000900C(v0 + 16);
  sub_10000900C(v0 + 56);
  sub_10000900C(v0 + 96);
  sub_10000900C(v0 + 136);
  sub_10000900C(v0 + 176);
  sub_10000900C(v0 + 216);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WidgetSuggester()
{
  return self;
}

void *sub_100050CC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_1000070B0(&qword_100068620);
    uint64_t v9 = static _SetStorage.allocate(capacity:)();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    Class v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100051820(&qword_100068628, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_100051820(&qword_100068630, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        char v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

unint64_t sub_100050FDC()
{
  unint64_t result = qword_100068618;
  if (!qword_100068618)
  {
    sub_100011FFC((uint64_t *)&unk_100067650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068618);
  }
  return result;
}

uint64_t type metadata accessor for WidgetSuggester.Relevance()
{
  uint64_t result = qword_1000686E0;
  if (!qword_1000686E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100051084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetSuggester.Relevance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000510E8()
{
  sub_10000900C(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100051120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetSuggester.Relevance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100051188(unint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for WidgetSuggester.Relevance() - 8);
  return sub_10004FAE8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

void sub_1000511FC(unsigned char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for WidgetSuggester.Relevance() - 8);
  sub_10004FF6C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_10005127C()
{
  sub_10000900C(v0 + 16);
  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000512BC(uint64_t *a1)
{
  return sub_100050014(a1, v1 + 16, *(void *)(v1 + 56));
}

uint64_t sub_1000512DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WidgetSuggester.Relevance();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100051338()
{
  sub_10000900C(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100051380(uint64_t a1, uint64_t a2)
{
  return sub_100050140(a1, a2, v2 + 2, v2[7], v2[8]);
}

uint64_t sub_10005138C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000513C4()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100051404(uint64_t a1)
{
  return sub_100050270(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void *sub_100051410(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v4) {
      break;
    }
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    unint64_t v14 = v3 & 0xC000000000000001;
    type metadata accessor for PersonType();
    uint64_t v6 = 0;
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    unint64_t v15 = v3;
    while (v4 != v6)
    {
      if (v14) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      ++v6;
      id v9 = [v7 identifier];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1000070F4((void *)(a2 + 136), *(void *)(a2 + 160));
      dispatch thunk of ContactFormatterProtocol.displayName(for:)();
      id v10 = objc_allocWithZone(ObjCClassFromMetadata);
      NSString v11 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      NSString v12 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v10 initWithIdentifier:v11 displayString:v12];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      unint64_t v3 = v15;
      if (v4 == v6) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10005162C()
{
  uint64_t v1 = *(void *)(type metadata accessor for WidgetSuggester.Relevance() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100051718(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for WidgetSuggester.Relevance() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100008F18;
  return sub_10004FD9C(a1, v5, v6, v7);
}

void sub_100051804(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10004E714(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_100051820(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100051868(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100051878()
{
  return swift_release();
}

uint64_t sub_100051880(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_1000518F0(uint64_t a1)
{
  uint64_t v2 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_100051958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000519C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100051A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100051A90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100051AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100051B0C);
}

uint64_t sub_100051B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_100051B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100051B90);
}

uint64_t sub_100051B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070B0((uint64_t *)&unk_100067650);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void sub_100051C04()
{
  sub_1000158A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t type metadata accessor for RelevantIntent()
{
  return type metadata accessor for RelevantIntent();
}

uint64_t RelevantIntent.init<A>(_:widgetKind:relevance:)()
{
  return RelevantIntent.init<A>(_:widgetKind:relevance:)();
}

uint64_t static RelevantContext.date(from:to:)()
{
  return static RelevantContext.date(from:to:)();
}

uint64_t type metadata accessor for RelevantContext()
{
  return type metadata accessor for RelevantContext();
}

uint64_t static RelevantIntentManager.shared.getter()
{
  return static RelevantIntentManager.shared.getter();
}

uint64_t type metadata accessor for RelevantIntentManager()
{
  return type metadata accessor for RelevantIntentManager();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement<>.timeInterval.getter()
{
  return Measurement<>.timeInterval.getter();
}

uint64_t type metadata accessor for Measurement()
{
  return type metadata accessor for Measurement();
}

uint64_t DateComponents.hour.getter()
{
  return DateComponents.hour.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall Date.relativeDateString()()
{
  uint64_t v0 = Date.relativeDateString()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t static Date.- infix(_:_:)()
{
  return static Date.- infix(_:_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t XPCDecoder.init()()
{
  return XPCDecoder.init()();
}

uint64_t type metadata accessor for XPCDecoder()
{
  return type metadata accessor for XPCDecoder();
}

uint64_t XPCEncoder.init()()
{
  return XPCEncoder.init()();
}

uint64_t type metadata accessor for XPCEncoder()
{
  return type metadata accessor for XPCEncoder();
}

uint64_t OSTransaction.description.getter()
{
  return OSTransaction.description.getter();
}

uint64_t OSTransaction.init(name:)()
{
  return OSTransaction.init(name:)();
}

Swift::Void __swiftcall OSTransaction.complete()()
{
}

uint64_t type metadata accessor for OSTransaction()
{
  return type metadata accessor for OSTransaction();
}

uint64_t dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)()
{
  return dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)();
}

uint64_t MessageDispatcher.init<A, B>(encoder:decoder:)()
{
  return MessageDispatcher.init<A, B>(encoder:decoder:)();
}

uint64_t Promise.init(startBlock:)()
{
  return Promise.init(startBlock:)();
}

uint64_t static Promise.all(_:)()
{
  return static Promise.all(_:)();
}

uint64_t static Promise.join<A, B>(_:_:)()
{
  return static Promise.join<A, B>(_:_:)();
}

uint64_t dispatch thunk of Promise.then<A>(_:)()
{
  return dispatch thunk of Promise.then<A>(_:)();
}

{
  return dispatch thunk of Promise.then<A>(_:)();
}

uint64_t Promise.__allocating_init(with:)()
{
  return Promise.__allocating_init(with:)();
}

uint64_t dispatch thunk of Promise.catch<A>(_:)()
{
  return dispatch thunk of Promise.catch<A>(_:)();
}

uint64_t Promise.__allocating_init(_:)()
{
  return Promise.__allocating_init(_:)();
}

uint64_t Logger.ifError(_:message:)()
{
  return Logger.ifError(_:message:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t SelectPeopleIntent.people(for:)()
{
  return SelectPeopleIntent.people(for:)();
}

uint64_t type metadata accessor for SelectPeopleIntent()
{
  return type metadata accessor for SelectPeopleIntent();
}

uint64_t static PeopleFeatureFlags.shared.getter()
{
  return static PeopleFeatureFlags.shared.getter();
}

uint64_t type metadata accessor for PeopleFeatureFlags()
{
  return type metadata accessor for PeopleFeatureFlags();
}

uint64_t static PeopleUserDefaults.shared.getter()
{
  return static PeopleUserDefaults.shared.getter();
}

uint64_t type metadata accessor for PeopleUserDefaults()
{
  return type metadata accessor for PeopleUserDefaults();
}

uint64_t type metadata accessor for PeopleFeatureFlagNames()
{
  return type metadata accessor for PeopleFeatureFlagNames();
}

uint64_t static PeopleBiomeEventIndexer.indexEvent(askToBuyEvent:withContactFetcher:withIndexer:completion:)()
{
  return static PeopleBiomeEventIndexer.indexEvent(askToBuyEvent:withContactFetcher:withIndexer:completion:)();
}

uint64_t static PeopleBiomeEventIndexer.indexEvent(locationEvent:withPerson:withIndexer:completion:)()
{
  return static PeopleBiomeEventIndexer.indexEvent(locationEvent:withPerson:withIndexer:completion:)();
}

uint64_t static PeopleBiomeEventIndexer.indexEvent(screenTimeRequest:bundleResolver:withContactFetcher:withIndexer:completion:)()
{
  return static PeopleBiomeEventIndexer.indexEvent(screenTimeRequest:bundleResolver:withContactFetcher:withIndexer:completion:)();
}

uint64_t type metadata accessor for PeopleBiomeEventIndexer()
{
  return type metadata accessor for PeopleBiomeEventIndexer();
}

uint64_t static PeopleWidgetConfiguration.minContacts(forFamily:)()
{
  return static PeopleWidgetConfiguration.minContacts(forFamily:)();
}

uint64_t static PeopleLocateFriendProvider.shared.getter()
{
  return static PeopleLocateFriendProvider.shared.getter();
}

uint64_t type metadata accessor for PeopleLocateFriendProvider()
{
  return type metadata accessor for PeopleLocateFriendProvider();
}

uint64_t PeopleTimelineControllerFactory.init()()
{
  return PeopleTimelineControllerFactory.init()();
}

uint64_t type metadata accessor for PeopleTimelineControllerFactory()
{
  return type metadata accessor for PeopleTimelineControllerFactory();
}

uint64_t static PeopleErrors.createError(_:code:)()
{
  return static PeopleErrors.createError(_:code:)();
}

uint64_t static PeopleLogger.common.getter()
{
  return static PeopleLogger.common.getter();
}

uint64_t static PeopleLogger.daemon.getter()
{
  return static PeopleLogger.daemon.getter();
}

uint64_t static PeopleLogger.location.getter()
{
  return static PeopleLogger.location.getter();
}

uint64_t static PeopleLogger.messages.getter()
{
  return static PeopleLogger.messages.getter();
}

uint64_t static PeopleAnalytics.eventReceived(foundContacts:statusType:)()
{
  return static PeopleAnalytics.eventReceived(foundContacts:statusType:)();
}

uint64_t static PeopleAnalytics.eventsCollected(statusType:eventCount:)()
{
  return static PeopleAnalytics.eventsCollected(statusType:eventCount:)();
}

uint64_t static PeopleAnalytics.timelineStopwatch(timeline:)()
{
  return static PeopleAnalytics.timelineStopwatch(timeline:)();
}

uint64_t static PeopleAnalytics.reIndexingStopwatch(_:)()
{
  return static PeopleAnalytics.reIndexingStopwatch(_:)();
}

uint64_t dispatch thunk of PeopleAnalytics.StopWatch.stop()()
{
  return dispatch thunk of PeopleAnalytics.StopWatch.stop()();
}

uint64_t type metadata accessor for PeopleAnalytics()
{
  return type metadata accessor for PeopleAnalytics();
}

uint64_t static PeopleConstants.appBundleID.getter()
{
  return static PeopleConstants.appBundleID.getter();
}

uint64_t static PeopleConstants.widgetBundleID.getter()
{
  return static PeopleConstants.widgetBundleID.getter();
}

uint64_t static PeopleConstants.startCallIntent.getter()
{
  return static PeopleConstants.startCallIntent.getter();
}

uint64_t static PeopleConstants.askToBuyEventTTL.getter()
{
  return static PeopleConstants.askToBuyEventTTL.getter();
}

uint64_t static PeopleConstants.childStateEventTTL.getter()
{
  return static PeopleConstants.childStateEventTTL.getter();
}

uint64_t static PeopleConstants.intentClassKeyPath.getter()
{
  return static PeopleConstants.intentClassKeyPath.getter();
}

uint64_t static PeopleConstants.statusSourceTimeout.getter()
{
  return static PeopleConstants.statusSourceTimeout.getter();
}

uint64_t static PeopleConstants.widgetSuggestionTTL.getter()
{
  return static PeopleConstants.widgetSuggestionTTL.getter();
}

uint64_t static PeopleConstants.reindexTransactionName.getter()
{
  return static PeopleConstants.reindexTransactionName.getter();
}

uint64_t static PeopleConstants.findMySpotlightBundleID.getter()
{
  return static PeopleConstants.findMySpotlightBundleID.getter();
}

uint64_t static PeopleConstants.singleContactWidgetKind.getter()
{
  return static PeopleConstants.singleContactWidgetKind.getter();
}

uint64_t static PeopleConstants.widgetSuggestionDateKey.getter()
{
  return static PeopleConstants.widgetSuggestionDateKey.getter();
}

uint64_t static PeopleConstants.askToBuySpotlightBundleID.getter()
{
  return static PeopleConstants.askToBuySpotlightBundleID.getter();
}

uint64_t static PeopleConstants.peopleReindexRegistration.getter()
{
  return static PeopleConstants.peopleReindexRegistration.getter();
}

uint64_t static PeopleConstants.screenTimeRequestEventTTL.getter()
{
  return static PeopleConstants.screenTimeRequestEventTTL.getter();
}

uint64_t static PeopleConstants.multipleContactsWidgetKind.getter()
{
  return static PeopleConstants.multipleContactsWidgetKind.getter();
}

uint64_t static PeopleConstants.maxContactsInMultipleWidget.getter()
{
  return static PeopleConstants.maxContactsInMultipleWidget.getter();
}

uint64_t static PeopleConstants.screenTimeRequestSpotlightBundleID.getter()
{
  return static PeopleConstants.screenTimeRequestSpotlightBundleID.getter();
}

uint64_t type metadata accessor for PersonType()
{
  return type metadata accessor for PersonType();
}

uint64_t type metadata accessor for StatusType()
{
  return type metadata accessor for StatusType();
}

uint64_t type metadata accessor for PingMessage()
{
  return type metadata accessor for PingMessage();
}

uint64_t AskToMetrics.logScreenTimeMoreTimeRequestCheckpoint(_:)()
{
  return AskToMetrics.logScreenTimeMoreTimeRequestCheckpoint(_:)();
}

uint64_t AskToMetrics.init(isAskToProcess:)()
{
  return AskToMetrics.init(isAskToProcess:)();
}

uint64_t type metadata accessor for AskToMetrics.RequestJourneyCheckpoint()
{
  return type metadata accessor for AskToMetrics.RequestJourneyCheckpoint();
}

uint64_t type metadata accessor for AskToMetrics()
{
  return type metadata accessor for AskToMetrics();
}

uint64_t SelectPerson.person.setter()
{
  return SelectPerson.person.setter();
}

uint64_t SelectPerson.init()()
{
  return SelectPerson.init()();
}

uint64_t type metadata accessor for SelectPerson()
{
  return type metadata accessor for SelectPerson();
}

uint64_t dispatch thunk of StatusSource.statusType.getter()
{
  return dispatch thunk of StatusSource.statusType.getter();
}

uint64_t ContactPerson.init(contact:idsHandle:)()
{
  return ContactPerson.init(contact:idsHandle:)();
}

uint64_t ContactPerson.contact.getter()
{
  return ContactPerson.contact.getter();
}

uint64_t type metadata accessor for ContactPerson()
{
  return type metadata accessor for ContactPerson();
}

uint64_t type metadata accessor for RequestStatus()
{
  return type metadata accessor for RequestStatus();
}

uint64_t StatusFetcher.fetchStatus(for:)()
{
  return StatusFetcher.fetchStatus(for:)();
}

uint64_t static BiomeUtilities.shared.getter()
{
  return static BiomeUtilities.shared.getter();
}

uint64_t dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)()
{
  return dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
}

uint64_t type metadata accessor for BiomeUtilities()
{
  return type metadata accessor for BiomeUtilities();
}

uint64_t type metadata accessor for ChildStateType()
{
  return type metadata accessor for ChildStateType();
}

uint64_t static ContactFetcher.shared.getter()
{
  return static ContactFetcher.shared.getter();
}

uint64_t type metadata accessor for ContactFetcher()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t MessageConduit.init()()
{
  return MessageConduit.init()();
}

uint64_t type metadata accessor for MessageConduit()
{
  return type metadata accessor for MessageConduit();
}

uint64_t type metadata accessor for MessageDetails.EventSource()
{
  return type metadata accessor for MessageDetails.EventSource();
}

uint64_t MessageDetails.family.getter()
{
  return MessageDetails.family.getter();
}

uint64_t MessageDetails.family.setter()
{
  return MessageDetails.family.setter();
}

uint64_t type metadata accessor for MessageDetails()
{
  return type metadata accessor for MessageDetails();
}

uint64_t static MetricTemplate.updateStatusCount(for:signaled:)()
{
  return static MetricTemplate.updateStatusCount(for:signaled:)();
}

uint64_t static MetricTemplate.updateRefreshRequestedCount(for:)()
{
  return static MetricTemplate.updateRefreshRequestedCount(for:)();
}

uint64_t ResolvedFamily.init(requestingFamilyMember:actionFamilyMember:approvers:)()
{
  return ResolvedFamily.init(requestingFamilyMember:actionFamilyMember:approvers:)();
}

uint64_t type metadata accessor for ResolvedFamily()
{
  return type metadata accessor for ResolvedFamily();
}

uint64_t type metadata accessor for AvailabilityType()
{
  return type metadata accessor for AvailabilityType();
}

uint64_t type metadata accessor for ContactFormatter.Style()
{
  return type metadata accessor for ContactFormatter.Style();
}

uint64_t ContactFormatter.init(style:fallback:)()
{
  return ContactFormatter.init(style:fallback:)();
}

uint64_t type metadata accessor for ContactFormatter()
{
  return type metadata accessor for ContactFormatter();
}

uint64_t static MessageSendRules.sharedInstance.getter()
{
  return static MessageSendRules.sharedInstance.getter();
}

uint64_t type metadata accessor for MessageSendRules()
{
  return type metadata accessor for MessageSendRules();
}

uint64_t SpotlightIndexer.init()()
{
  return SpotlightIndexer.init()();
}

uint64_t type metadata accessor for SpotlightIndexer()
{
  return type metadata accessor for SpotlightIndexer();
}

uint64_t AppBundleResolver.__allocating_init()()
{
  return AppBundleResolver.__allocating_init()();
}

uint64_t type metadata accessor for AppBundleResolver()
{
  return type metadata accessor for AppBundleResolver();
}

uint64_t BiomeStreamReader.init(statusType:readerStream:)()
{
  return BiomeStreamReader.init(statusType:readerStream:)();
}

uint64_t type metadata accessor for DiscoveredHandles()
{
  return type metadata accessor for DiscoveredHandles();
}

uint64_t dispatch thunk of FamilyRequestEvent.requestStatus.getter()
{
  return dispatch thunk of FamilyRequestEvent.requestStatus.getter();
}

uint64_t dispatch thunk of FamilyRequestEvent.dsid.getter()
{
  return dispatch thunk of FamilyRequestEvent.dsid.getter();
}

uint64_t dispatch thunk of FamilyRequestEvent.time.getter()
{
  return dispatch thunk of FamilyRequestEvent.time.getter();
}

uint64_t LaunchRecordReader.init(withDataWriter:)()
{
  return LaunchRecordReader.init(withDataWriter:)();
}

uint64_t type metadata accessor for LaunchRecordReader()
{
  return type metadata accessor for LaunchRecordReader();
}

uint64_t ReindexCoordinator.indexer.getter()
{
  return ReindexCoordinator.indexer.getter();
}

uint64_t ReindexCoordinator.init()()
{
  return ReindexCoordinator.init()();
}

uint64_t type metadata accessor for ReindexCoordinator()
{
  return type metadata accessor for ReindexCoordinator();
}

uint64_t dispatch thunk of VerticalTextHelper.makeIdentifier(for:)()
{
  return dispatch thunk of VerticalTextHelper.makeIdentifier(for:)();
}

uint64_t static VerticalTextHelper.shared.getter()
{
  return static VerticalTextHelper.shared.getter();
}

uint64_t type metadata accessor for VerticalTextHelper()
{
  return type metadata accessor for VerticalTextHelper();
}

uint64_t BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)()
{
  return BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
}

uint64_t CallServiceProvider.init(rawValue:)()
{
  return CallServiceProvider.init(rawValue:)();
}

uint64_t type metadata accessor for CallServiceProvider()
{
  return type metadata accessor for CallServiceProvider();
}

uint64_t MessagePersonStatus.init(lastMessageString:unreadCount:date:)()
{
  return MessagePersonStatus.init(lastMessageString:unreadCount:date:)();
}

uint64_t type metadata accessor for MessagePersonStatus()
{
  return type metadata accessor for MessagePersonStatus();
}

uint64_t PersonTypeAppEntity.init(id:displayString:)()
{
  return PersonTypeAppEntity.init(id:displayString:)();
}

uint64_t type metadata accessor for PersonTypeAppEntity()
{
  return type metadata accessor for PersonTypeAppEntity();
}

uint64_t type metadata accessor for CalendarPersonStatus.Representation()
{
  return type metadata accessor for CalendarPersonStatus.Representation();
}

uint64_t CalendarPersonStatus.init(title:startDate:representation:priority:)()
{
  return CalendarPersonStatus.init(title:startDate:representation:priority:)();
}

uint64_t type metadata accessor for CalendarPersonStatus.Priority()
{
  return type metadata accessor for CalendarPersonStatus.Priority();
}

uint64_t type metadata accessor for CalendarPersonStatus()
{
  return type metadata accessor for CalendarPersonStatus();
}

uint64_t dispatch thunk of FeatureFlagsProvider.isEnabled(_:)()
{
  return dispatch thunk of FeatureFlagsProvider.isEnabled(_:)();
}

uint64_t static LaunchRecorderWriter.sharedInstance.getter()
{
  return static LaunchRecorderWriter.sharedInstance.getter();
}

uint64_t dispatch thunk of LaunchRecorderWriter.save()()
{
  return dispatch thunk of LaunchRecorderWriter.save()();
}

uint64_t dispatch thunk of LaunchRecorderWriter.reload()()
{
  return dispatch thunk of LaunchRecorderWriter.reload()();
}

uint64_t dispatch thunk of LaunchRecorderWriter.remove(contactId:)()
{
  return dispatch thunk of LaunchRecorderWriter.remove(contactId:)();
}

uint64_t type metadata accessor for LaunchRecorderWriter()
{
  return type metadata accessor for LaunchRecorderWriter();
}

uint64_t FamilyATBSendIMessage.isCallerAskToProcess.getter()
{
  return FamilyATBSendIMessage.isCallerAskToProcess.getter();
}

uint64_t FamilyATBSendIMessage.requestID.getter()
{
  return FamilyATBSendIMessage.requestID.getter();
}

uint64_t type metadata accessor for FamilyATBSendIMessage()
{
  return type metadata accessor for FamilyATBSendIMessage();
}

uint64_t ChildStatePersonStatus.init(childStateType:date:featureFlags:)()
{
  return ChildStatePersonStatus.init(childStateType:date:featureFlags:)();
}

uint64_t type metadata accessor for ChildStatePersonStatus()
{
  return type metadata accessor for ChildStatePersonStatus();
}

uint64_t dispatch thunk of ContactFetcherProtocol.recommendedContacts(maxSuggestions:excludeContactIdentifiers:)()
{
  return dispatch thunk of ContactFetcherProtocol.recommendedContacts(maxSuggestions:excludeContactIdentifiers:)();
}

uint64_t dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)()
{
  return dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)();
}

uint64_t dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)()
{
  return dispatch thunk of ContactFetcherProtocol.contacts(withPredicate:includeImages:)();
}

uint64_t dispatch thunk of EventCollectorProtocol.collectEvents(statusType:maxAge:completion:)()
{
  return dispatch thunk of EventCollectorProtocol.collectEvents(statusType:maxAge:completion:)();
}

uint64_t dispatch thunk of MessageConduitProtocol.enabledOnPlatform.getter()
{
  return dispatch thunk of MessageConduitProtocol.enabledOnPlatform.getter();
}

uint64_t MissedCallPersonStatus.init(localizedString:serviceProvider:date:)()
{
  return MissedCallPersonStatus.init(localizedString:serviceProvider:date:)();
}

uint64_t type metadata accessor for MissedCallPersonStatus()
{
  return type metadata accessor for MissedCallPersonStatus();
}

uint64_t dispatch thunk of KeyValueStorageProtocol.setValue(_:forKey:)()
{
  return dispatch thunk of KeyValueStorageProtocol.setValue(_:forKey:)();
}

uint64_t dispatch thunk of KeyValueStorageProtocol.value(forKey:)()
{
  return dispatch thunk of KeyValueStorageProtocol.value(forKey:)();
}

uint64_t dispatch thunk of SpotlightReindexHandler.bundleId.getter()
{
  return dispatch thunk of SpotlightReindexHandler.bundleId.getter();
}

uint64_t AvailabilityPersonStatus.init(availability:date:availabilityDate:)()
{
  return AvailabilityPersonStatus.init(availability:date:availabilityDate:)();
}

uint64_t type metadata accessor for AvailabilityPersonStatus()
{
  return type metadata accessor for AvailabilityPersonStatus();
}

uint64_t dispatch thunk of ContactFormatterProtocol.displayName(for:)()
{
  return dispatch thunk of ContactFormatterProtocol.displayName(for:)();
}

uint64_t FetchContactsStatusMessage.contactIDs.getter()
{
  return FetchContactsStatusMessage.contactIDs.getter();
}

uint64_t FetchContactsStatusMessage.types.getter()
{
  return FetchContactsStatusMessage.types.getter();
}

uint64_t type metadata accessor for FetchContactsStatusMessage()
{
  return type metadata accessor for FetchContactsStatusMessage();
}

uint64_t dispatch thunk of LaunchRecordReaderProtocol.dates(forContactIdentifier:)()
{
  return dispatch thunk of LaunchRecordReaderProtocol.dates(forContactIdentifier:)();
}

uint64_t dispatch thunk of LaunchRecordReaderProtocol.reload()()
{
  return dispatch thunk of LaunchRecordReaderProtocol.reload()();
}

uint64_t dispatch thunk of TimelineControllerProtocol.reloadTimeline()()
{
  return dispatch thunk of TimelineControllerProtocol.reloadTimeline()();
}

uint64_t AskToBuyRequestPersonStatus.init(requestState:date:productType:featureFlags:)()
{
  return AskToBuyRequestPersonStatus.init(requestState:date:productType:featureFlags:)();
}

uint64_t type metadata accessor for AskToBuyRequestPersonStatus()
{
  return type metadata accessor for AskToBuyRequestPersonStatus();
}

uint64_t dispatch thunk of FamilyMemberContactFetching.familyWithDSIDs(completion:)()
{
  return dispatch thunk of FamilyMemberContactFetching.familyWithDSIDs(completion:)();
}

uint64_t RequestMessageDetailsBuilder.init()()
{
  return RequestMessageDetailsBuilder.init()();
}

uint64_t type metadata accessor for RequestMessageDetailsBuilder()
{
  return type metadata accessor for RequestMessageDetailsBuilder();
}

uint64_t FamilyWillSendAskToBuyMessage.isCallerAskToProcess.getter()
{
  return FamilyWillSendAskToBuyMessage.isCallerAskToProcess.getter();
}

uint64_t type metadata accessor for FamilyWillSendAskToBuyMessage()
{
  return type metadata accessor for FamilyWillSendAskToBuyMessage();
}

uint64_t ScreenTimeRequestPersonStatus.init(requestState:date:featureFlags:)()
{
  return ScreenTimeRequestPersonStatus.init(requestState:date:featureFlags:)();
}

uint64_t type metadata accessor for ScreenTimeRequestPersonStatus()
{
  return type metadata accessor for ScreenTimeRequestPersonStatus();
}

uint64_t UserDefaultsLaunchDiaryWriter.init()()
{
  return UserDefaultsLaunchDiaryWriter.init()();
}

uint64_t type metadata accessor for UserDefaultsLaunchDiaryWriter()
{
  return type metadata accessor for UserDefaultsLaunchDiaryWriter();
}

uint64_t FamilyWillSendScreenTimeMessage.isCallerAskToProcess.getter()
{
  return FamilyWillSendScreenTimeMessage.isCallerAskToProcess.getter();
}

uint64_t type metadata accessor for FamilyWillSendScreenTimeMessage()
{
  return type metadata accessor for FamilyWillSendScreenTimeMessage();
}

uint64_t dispatch thunk of ChronoConfigurationReaderProtocol.allConfiguredWidgets(completion:)()
{
  return dispatch thunk of ChronoConfigurationReaderProtocol.allConfiguredWidgets(completion:)();
}

uint64_t dispatch thunk of TimelineControllerFactoryProtocol.timelineController(for:in:)()
{
  return dispatch thunk of TimelineControllerFactoryProtocol.timelineController(for:in:)();
}

INShortcut __swiftcall INShortcut._bridgeToObjectiveC()()
{
  return (INShortcut)INShortcut._bridgeToObjectiveC()();
}

uint64_t INShortcut.init(intent:)()
{
  return INShortcut.init(intent:)();
}

uint64_t type metadata accessor for INShortcut()
{
  return type metadata accessor for INShortcut();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary<>.typeErased()()
{
  return Dictionary<>.typeErased()();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
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

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::String __swiftcall String.trim()()
{
  uint64_t v0 = String.trim()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.localized.getter()
{
  return String.localized.getter();
}

Swift::String_optional __swiftcall String.trimToNil()()
{
  uint64_t v0 = String.trimToNil()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
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

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
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

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
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

uint64_t FAFamilyCircle.requestingFamilyMember.getter()
{
  return FAFamilyCircle.requestingFamilyMember.getter();
}

uint64_t FAFamilyCircle.approvers.getter()
{
  return FAFamilyCircle.approvers.getter();
}

uint64_t type metadata accessor for BMAskToBuyEvent.ProductType()
{
  return type metadata accessor for BMAskToBuyEvent.ProductType();
}

uint64_t BMAskToBuyEvent.productFromRequest()()
{
  return BMAskToBuyEvent.productFromRequest()();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static BMFindMyLocationChangeEvent.squashEvents(_:)()
{
  return static BMFindMyLocationChangeEvent.squashEvents(_:)();
}

uint64_t BMFindMyLocationChangeEvent.reason.getter()
{
  return BMFindMyLocationChangeEvent.reason.getter();
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

uint64_t CNContact.callHistoryHandles.getter()
{
  return CNContact.callHistoryHandles.getter();
}

uint64_t CNContact.people_normalizedHandles.getter()
{
  return CNContact.people_normalizedHandles.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
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

uint64_t static CommandLine.arguments.getter()
{
  return static CommandLine.arguments.getter();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
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

uint64_t static Result<>.foundation_from(_:_:)()
{
  return static Result<>.foundation_from(_:_:)();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t IMSPIMarkSPIMessagesAsRead()
{
  return _IMSPIMarkSPIMessagesAsRead();
}

uint64_t IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS()
{
  return _IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();
}

uint64_t INTypedIntentWithIntent()
{
  return _INTypedIntentWithIntent();
}

uint64_t SpotlightDaemonClientRegister()
{
  return _SpotlightDaemonClientRegister();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_checkAndClear_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAndClear:service:");
}

id objc_msgSend_checkWithWait_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkWithWait:service:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_initWith_andText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWith:andText:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return _[a1 logHandle];
}

id objc_msgSend_onComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onComplete:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_then(void *a1, const char *a2, ...)
{
  return _[a1 then];
}