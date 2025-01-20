int main(int argc, const char **argv, const char **envp)
{
  FILE *v3;
  id v4;

  v3 = (FILE *)stdout.getter();
  setlinebuf(v3);
  qword_10001D728 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for SiriReaderDaemonServer()) init];
  v4 = [self mainRunLoop];
  [v4 run];

  return 0;
}

uint64_t sub_100004144(uint64_t a1, uint64_t a2)
{
  return sub_100004260(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004168(uint64_t a1, uint64_t a2)
{
  return sub_100004260(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

void *sub_100004188@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100004198()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000041EC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004260(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000042A4(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000431C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000439C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_1000043E0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000043F0()
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

uint64_t sub_100004480@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000044AC(uint64_t a1)
{
  uint64_t v2 = sub_100004780(&qword_10001D2D0, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_100004780(&qword_10001D2D8, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004568@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000045B0(uint64_t a1)
{
  uint64_t v2 = sub_100004780(&qword_10001D2E0, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v3 = sub_100004780(&qword_10001D2E8, type metadata accessor for NSKeyValueChangeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

void type metadata accessor for SiriReaderActivationSource(uint64_t a1)
{
}

void sub_1000046A8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000046F0()
{
  return sub_100004780(&qword_10001D2A0, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_100004738()
{
  return sub_100004780(&qword_10001D2A8, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_100004780(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000047C8()
{
  return sub_100004780(&qword_10001D2B0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100004810()
{
  return sub_100004780(&qword_10001D2B8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100004858()
{
  return sub_100004780(&qword_10001D2C0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_1000048A0()
{
  return sub_100004780(&qword_10001D2C8, type metadata accessor for NSKeyValueChangeKey);
}

id sub_1000048F4()
{
  if (qword_10001D218 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10001D750;
  qword_10001D2F0 = qword_10001D750;

  return v0;
}

uint64_t sub_100004958()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E360(v0, qword_10001D2F8);
  sub_10000E2C0(v0, (uint64_t)qword_10001D2F8);
  if (qword_10001D1E8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10001D2F0;
  return Logger.init(_:)();
}

id sub_1000049E4()
{
  id result = [objc_allocWithZone((Class)AVQueuePlayer) init];
  qword_10001D310 = (uint64_t)result;
  return result;
}

id sub_100004A18()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for DaemonSession()) init];
  qword_10001D318 = (uint64_t)result;
  return result;
}

uint64_t sub_100004A4C()
{
  sub_10000E214(&qword_10001D490);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100014AB0;
  sub_1000115EC(0, &qword_10001D488);
  *(NSNumber *)(v0 + 32) = NSNumber.init(floatLiteral:)(0.75);
  *(NSNumber *)(v0 + 40) = NSNumber.init(floatLiteral:)(1.0);
  *(NSNumber *)(v0 + 48) = NSNumber.init(floatLiteral:)(1.25);
  *(NSNumber *)(v0 + 56) = NSNumber.init(floatLiteral:)(1.5);
  *(NSNumber *)(v0 + 64) = NSNumber.init(floatLiteral:)(1.75);
  *(NSNumber *)(v0 + 72) = NSNumber.init(floatLiteral:)(2.0);
  uint64_t result = specialized Array._endMutation()();
  qword_10001D730 = v0;
  return result;
}

void sub_100004B14()
{
  qword_10001D738 = 0x49746E6572727563;
  unk_10001D740 = 0xEB000000006D6574;
}

id sub_100004B40()
{
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_nowPlayingInfo] = &_swiftEmptyDictionarySingleton;
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_boostToken] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer] = 0;
  id v1 = &v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID];
  void *v1 = 0;
  v1[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences] = &_swiftEmptyArrayStorage;
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive] = 0;
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone] = 0;
  uint64_t v2 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_processMonitor;
  id v3 = objc_allocWithZone((Class)RBSProcessMonitor);
  uint64_t v4 = v0;
  *(void *)&v0[v2] = [v3 init];
  *(void *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker] = 0;
  char v5 = &v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId];
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = type metadata accessor for SiriReaderInstrumentationUtility();
  v8 = (void *)swift_allocObject();
  uint64_t v9 = type metadata accessor for SelfEmitter();
  uint64_t v10 = swift_allocObject();
  v8[5] = v9;
  v8[6] = &off_100018E48;
  v8[2] = v10;
  v11 = &v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_instrumentationUtil];
  *((void *)v11 + 3) = v7;
  *((void *)v11 + 4) = &off_100018E10;
  *(void *)v11 = v8;

  v25.receiver = v4;
  v25.super_class = (Class)type metadata accessor for SiriReaderDaemon();
  id v12 = [super init];
  uint64_t v13 = qword_10001D1F8;
  id v14 = v12;
  if (v13 != -1) {
    swift_once();
  }
  v15 = (void *)qword_10001D310;
  uint64_t v16 = qword_10001D210;
  id v17 = v14;
  id v18 = v15;
  if (v16 != -1) {
    swift_once();
  }
  NSString v19 = String._bridgeToObjectiveC()();
  [v18 addObserver:v17 forKeyPath:v19 options:5 context:0];

  sub_10000BC10();
  sub_100005E84(0);
  id v20 = [self defaultCenter];
  v21 = self;
  id v22 = v17;
  id v23 = [v21 sharedInstance];
  [v20 addObserver:v22 selector:"handlePlaybackInterruptionWithNotification:" name:AVAudioSessionInterruptionNotification object:v23];

  return v22;
}

unint64_t sub_100004F9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E214(&qword_10001D570);
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
    sub_100011670(v6, (uint64_t)&v13, &qword_10001D578);
    uint64_t v7 = v13;
    unint64_t result = sub_10000EC40(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10001086C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

id sub_1000051B0()
{
  uint64_t v1 = v0;
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 initWithSuiteName:v3];

  if (!v4) {
    return 0;
  }
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v23, 0, sizeof(v23));
  }
  sub_100010CB4((uint64_t)v23, (uint64_t)v24);
  v8 = &off_10001D000;
  if (v24[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
      if (v9
        && (v21 == *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID) && v9 == v22
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        NSString v10 = String._bridgeToObjectiveC()();
        id v7 = [v4 integerForKey:v10];

        if (qword_10001D1F0 != -1) {
          swift_once();
        }
        uint64_t v11 = type metadata accessor for Logger();
        sub_10000E2C0(v11, (uint64_t)qword_10001D2F8);
        swift_bridgeObjectRetain();
        uint64_t v12 = Logger.logObject.getter();
        os_log_type_t v13 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v12, v13))
        {
          long long v14 = (uint8_t *)swift_slowAlloc();
          v24[0] = swift_slowAlloc();
          *(_DWORD *)long long v14 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)&v23[0] = sub_10000E570(v21, v22, v24);
          v8 = &off_10001D000;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "#sirireaderd previouslyInProgressUUID: %s", v14, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v18 = Logger.logObject.getter();
        os_log_type_t v19 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v18, v19))
        {
          id v20 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)id v20 = 134217984;
          v24[0] = (uint64_t)v7;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "#sirireaderd previouslyInProgressSentence: %ld", v20, 0xCu);
          swift_slowDealloc();
        }

        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_100010C50((uint64_t)v24, &qword_10001D498);
  }
  id v7 = 0;
LABEL_19:
  if (*(void *)((char *)v8[106] + v1 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }
  NSString v16 = String._bridgeToObjectiveC()();
  [v4 setObject:v15 forKey:v16];

  swift_unknownObjectRelease();
  return v7;
}

void sub_10000561C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000E214(&qword_10001D4B0);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)aBlock - v10;
  id v12 = [self readerStartingToneAudioAssetURL];
  if (v12)
  {
    os_log_type_t v13 = v12;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    long long v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v4, v9, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v14(v11, v4, v5);
      id v15 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v16);
      id v18 = v17;
      id v19 = [v15 initWithURL:v17];

      id v20 = [objc_allocWithZone((Class)AVPlayer) initWithPlayerItem:v19];
      uint64_t v21 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer;
      unint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer);
      *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer) = v20;

      id v23 = [self defaultCenter];
      v24 = self;
      id v25 = v19;
      id v26 = [v24 mainQueue];
      uint64_t v27 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_100010CAC;
      aBlock[5] = v27;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100005B44;
      aBlock[3] = &unk_100018D58;
      v28 = _Block_copy(aBlock);
      swift_release();
      id v29 = [v23 addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:v25 queue:v26 usingBlock:v28];
      _Block_release(v28);
      swift_unknownObjectRelease();

      *(unsigned char *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone) = 1;
      v30 = *(void **)(v1 + v21);
      if (v30)
      {
        [v30 play];

        (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_100010C50((uint64_t)v4, &qword_10001D4B0);
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  sub_10000E2C0(v31, (uint64_t)qword_10001D2F8);
  v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "#sirireaderd Starting tone file not found", v34, 2u);
    swift_slowDealloc();
  }
}

void sub_100005AE4()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (id)Strong;
    sub_100005C38();
  }
}

uint64_t sub_100005B44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_100005C38()
{
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone] = 0;
  id v1 = *(void **)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer];
  *(void *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer] = 0;

  if (v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying])
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000E2C0(v2, (uint64_t)qword_10001D2F8);
    oslog = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "#sirireaderd Finished playing starting tone, but player is already playing!", v4, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_10000E2C0(v5, (uint64_t)qword_10001D2F8);
    uint64_t v6 = v0;
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "#sirireaderd Finished playing starting tone, enqueuing sentence %ld", v9, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10000A8D4(*(void *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence], 1);
  }
}

uint64_t sub_100005E84(uint64_t a1)
{
  os_log_type_t v3 = *(void **)&v1[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_processMonitor];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_100010B10;
  *(void *)(v5 + 24) = v4;
  v11[4] = sub_100010B28;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100006B68;
  v11[3] = &unk_100018CB8;
  uint64_t v6 = _Block_copy(v11);
  id v7 = v3;
  os_log_type_t v8 = v1;
  swift_retain();
  swift_release();
  [v7 updateConfiguration:v6];

  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_100005FF0(void *a1)
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v3 = [self predicateMatchingBundleIdentifier:v2];

  sub_10000E214(&qword_10001D490);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100014AC0;
  *(void *)(v4 + 32) = v3;
  v10[0] = v4;
  specialized Array._endMutation()();
  sub_1000115EC(0, &qword_10001D530);
  id v5 = v3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [a1 setPredicates:isa, v10[0]];

  [a1 setServiceClass:25];
  [a1 setEvents:1];
  id v7 = [objc_allocWithZone((Class)RBSProcessStateDescriptor) init];
  [a1 setStateDescriptor:v7];

  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10[4] = sub_100010B50;
  v10[5] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100006AC8;
  v10[3] = &unk_100018CE0;
  uint64_t v9 = _Block_copy(v10);
  swift_release();
  [a1 setUpdateHandler:v9];
  _Block_release(v9);
}

uint64_t sub_100006244(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v20 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000115EC(0, &qword_10001D538);
  os_log_type_t v13 = (void *)static OS_dispatch_queue.main.getter();
  long long v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a2;
  v14[4] = a3;
  aBlock[4] = sub_100010BA0;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006A84;
  aBlock[3] = &unk_100018D30;
  id v15 = _Block_copy(aBlock);
  swift_retain();
  id v16 = a2;
  id v17 = a3;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100011628(&qword_10001D540, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000E214(&qword_10001D548);
  sub_100010BAC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

void sub_10000651C(uint64_t a1, void *a2, void *a3)
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = [a2 currentState];
    if (!v5 || (uint64_t v6 = v5, v7 = [v5 isRunning], v6, !v7))
    {
      if (qword_10001D1F0 != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      sub_10000E2C0(v12, (uint64_t)qword_10001D2F8);
      os_log_type_t v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        id v15 = (uint8_t *)swift_slowAlloc();
        id v29 = swift_slowAlloc();
        *(_DWORD *)id v15 = 136315138;
        sub_10000E570(0xD000000000000016, 0x8000000100016330, (uint64_t *)&v29);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "#sirireaderd %s stopped running", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      id v16 = [a3 exitEvent];
      if (v16)
      {
        id v17 = v16;
        id v18 = [v16 context];

        if (v18)
        {
          id v19 = [v18 status];

          if (v19)
          {
            if ([v19 isJetsam])
            {
              uint64_t v20 = Logger.logObject.getter();
              os_log_type_t v21 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v20, v21))
              {
                unint64_t v22 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)unint64_t v22 = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, v21, "#sirireaderd exitStatus is jetsam, don't tear down", v22, 2u);
                swift_slowDealloc();
              }
              else
              {
              }
              goto LABEL_27;
            }
            id v23 = v19;
            v24 = Logger.logObject.getter();
            os_log_type_t v25 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v24, v25))
            {
              id v26 = (uint8_t *)swift_slowAlloc();
              uint64_t v27 = (void *)swift_slowAlloc();
              *(_DWORD *)id v26 = 138412290;
              id v29 = v23;
              id v23 = v23;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *uint64_t v27 = v19;

              _os_log_impl((void *)&_mh_execute_header, v24, v25, "#sirireaderd exitStatus: %@", v26, 0xCu);
              sub_10000E214(&qword_10001D4C8);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              v24 = v23;
            }
          }
        }
      }
      sub_100007058();
LABEL_27:

      return;
    }
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000E2C0(v8, (uint64_t)qword_10001D2F8);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      id v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      sub_10000E570(0xD000000000000016, 0x8000000100016330, (uint64_t *)&v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "#sirireaderd %s is running", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_27;
    }
  }
}

uint64_t sub_100006A84(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100006AC8(uint64_t a1, void *a2, void *a3, void *a4)
{
  unsigned int v7 = *(void (**)(id, id, id))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, v8, v9);
  swift_release();
}

uint64_t sub_100006B68(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

void sub_100006BBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self sharedInstance];
  id v33 = 0;
  unsigned int v7 = [v6 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeSpokenAudio options:0 error:&v33];
  id v8 = v33;
  if (v7
    && (id v33 = 0,
        id v9 = v8,
        unsigned int v10 = [v6 setActive:1 error:&v33],
        id v8 = v33,
        v10))
  {
    uint64_t v11 = qword_10001D1F0;
    id v12 = v33;
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000E2C0(v13, (uint64_t)qword_10001D2F8);
    os_log_type_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "#sirireaderd Successfully set up audioSession", v16, 2u);
      swift_slowDealloc();
    }

    *(unsigned char *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 1;
  }
  else
  {
    id v17 = v8;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_10000E2C0(v18, (uint64_t)qword_10001D2F8);
    swift_errorRetain();
    swift_errorRetain();
    id v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      id v32 = v6;
      v30 = (void *)v22;
      uint64_t v31 = v5;
      *(_DWORD *)os_log_type_t v21 = 138412290;
      swift_errorRetain();
      uint64_t v23 = v3;
      uint64_t v24 = v2;
      uint64_t v25 = v1;
      id v26 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v33 = v26;
      id v5 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v30 = v26;
      uint64_t v1 = v25;
      uint64_t v2 = v24;
      uint64_t v3 = v23;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "#sirireaderd Failed setting up audioSession: %@", v21, 0xCu);
      sub_10000E214(&qword_10001D4C8);
      swift_arrayDestroy();
      id v6 = v32;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v28 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain();
    sub_10000D76C((uint64_t)v5);
    sub_100012348(v27, v28, (uint64_t)v5, 0);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v29 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_100010C50(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_10001D480);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v29, 1, 1, v2);
    swift_errorRelease();
  }
}

void sub_100007058()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self sharedInstance];
  id v32 = 0;
  unsigned int v7 = [v6 setActive:0 error:&v32];
  id v8 = v32;
  if (v7)
  {
    uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain();
    id v11 = v8;
    sub_10000D76C((uint64_t)v5);
    sub_100011FB4(*(float *)&dword_10001D320, *(float *)&dword_10001D320 + *(float *)&dword_10001D324, v9, v10);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v12 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_100010C50(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_10001D480);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v12, 1, 1, v2);
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000E2C0(v13, (uint64_t)qword_10001D2F8);
    os_log_type_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "#sirireaderd Successfully tore down audioSession", v16, 2u);
      swift_slowDealloc();
    }

    *(unsigned char *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 0;
    sub_10000D620();
    id v17 = [self defaultCenter];
    [v17 setNowPlayingInfo:0];

    id v6 = v17;
  }
  else
  {
    id v18 = v32;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_10000E2C0(v19, (uint64_t)qword_10001D2F8);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      id v31 = v6;
      uint64_t v29 = (void *)v23;
      uint64_t v30 = v1;
      *(_DWORD *)uint64_t v22 = 138412290;
      swift_errorRetain();
      uint64_t v24 = v2;
      uint64_t v25 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v32 = v25;
      uint64_t v1 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v29 = v25;
      uint64_t v2 = v24;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "#sirireaderd Failed tearing down audioSession: %@", v22, 0xCu);
      sub_10000E214(&qword_10001D4C8);
      swift_arrayDestroy();
      id v6 = v31;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v26 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain();
    sub_10000D76C((uint64_t)v5);
    sub_100012348(v26, v27, (uint64_t)v5, 1u);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v28 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_100010C50(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_10001D480);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v28, 1, 1, v2);
    swift_errorRelease();
  }
}

void sub_1000076A0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = type metadata accessor for UUID();
  Class isa = v6[-1].isa;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v11
    && (*v10 == a1 ? (BOOL v12 = v11 == a2) : (BOOL v12 = 0), v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000E2C0(v13, (uint64_t)qword_10001D2F8);
    swift_bridgeObjectRetain_n();
    os_log_type_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      os_log_t v27 = v6;
      id v17 = (uint8_t *)v16;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v26 = isa;
      *(_DWORD *)id v17 = 136315138;
      v25[1] = v17 + 4;
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_10000E570(a1, a2, &v29);
      Class isa = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "#sirireaderd received pause command for %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v6 = v27;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *(CFAbsoluteTime *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker) = CFAbsoluteTimeGetCurrent();
    if (qword_10001D1F8 != -1) {
      swift_once();
    }
    [(id)qword_10001D310 pause];
    uint64_t v22 = *v10;
    uint64_t v23 = v10[1];
    swift_bridgeObjectRetain();
    sub_10000D76C((uint64_t)v9);
    [(id)qword_10001D310 volume];
    sub_100012D0C(0.0, v24, v22, v23, (uint64_t)v9, 2);
    swift_bridgeObjectRelease();
    (*((void (**)(char *, NSObject *))isa + 1))(v9, v6);
    sub_10000D2B0();
    *(unsigned char *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 0;
  }
  else
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_10000E2C0(v18, (uint64_t)qword_10001D2F8);
    os_log_t v27 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v19, "#sirireaderd received pause command but identifiers did not match", v20, 2u);
      swift_slowDealloc();
    }
    os_log_t v21 = v27;
  }
}

void sub_100007AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v3
    && (*(void *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID) == a1
      ? (BOOL v4 = v3 == a2)
      : (BOOL v4 = 0),
        v4 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    float v5 = CFAbsoluteTimeGetCurrent() - *(double *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker);
    *(float *)&dword_10001D324 = *(float *)&dword_10001D324 + v5;
    sub_100007C50();
  }
  else
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000E2C0(v6, (uint64_t)qword_10001D2F8);
    oslog = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "#sirireaderd received resume command but identifiers did not match", v8, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100007C50()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  BOOL v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 rate];
  if (v5 == 0.0)
  {
    [(id)qword_10001D310 play];
    sub_10000D620();
    *(unsigned char *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 1;
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain();
    sub_10000D76C((uint64_t)v4);
    [(id)qword_10001D310 volume];
    sub_100012D0C(0.0, v8, v6, v7, (uint64_t)v4, 4);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain();
    sub_10000D76C((uint64_t)v4);
    sub_100012348(v9, v10, (uint64_t)v4, 2u);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    uint64_t v11 = v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_100010C50(v11, &qword_10001D480);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v11, 1, 1, v1);
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_10000E2C0(v12, (uint64_t)qword_10001D2F8);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "#sirireaderd playCommand failed due to player rate being non zero", v15, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100007F28(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  Class isa = v6[-1].isa;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v11
    && (*v10 == a1 ? (BOOL v12 = v11 == a2) : (BOOL v12 = 0), v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000E2C0(v13, (uint64_t)qword_10001D2F8);
    swift_bridgeObjectRetain_n();
    os_log_type_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      os_log_t v27 = v6;
      id v17 = (uint8_t *)v16;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v26 = isa;
      *(_DWORD *)id v17 = 136315138;
      v25[1] = v17 + 4;
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_10000E570(a1, a2, &v29);
      Class isa = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "#sirireaderd received end media session command for %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v6 = v27;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_10001D1F8 != -1) {
      swift_once();
    }
    [(id)qword_10001D310 pause];
    uint64_t v22 = *v10;
    uint64_t v23 = v10[1];
    swift_bridgeObjectRetain();
    sub_10000D76C((uint64_t)v9);
    [(id)qword_10001D310 volume];
    sub_100012D0C(0.0, v24, v22, v23, (uint64_t)v9, 2);
    swift_bridgeObjectRelease();
    (*((void (**)(char *, NSObject *))isa + 1))(v9, v6);
    sub_10000D2B0();
    *(unsigned char *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 0;
    sub_100007058();
  }
  else
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_10000E2C0(v18, (uint64_t)qword_10001D2F8);
    os_log_t v27 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v19, "#sirireaderd received end media session command but identifiers did not match", v20, 2u);
      swift_slowDealloc();
    }
    os_log_t v21 = v27;
  }
}

uint64_t sub_100008354(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

void sub_1000083C0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v4 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v12)
  {
    uint64_t v13 = *(void *)(v4 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    *((void *)&v58 + 1) = &type metadata for String;
    *(void *)&long long v57 = v13;
    *((void *)&v57 + 1) = v12;
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_1000089E0((uint64_t)&v57, v9, v11);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  *((void *)&v58 + 1) = &type metadata for String;
  *(void *)&long long v57 = a1;
  *((void *)&v57 + 1) = a2;
  swift_bridgeObjectRetain();
  sub_1000089E0((uint64_t)&v57, v14, v16);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v58 + 1) = &type metadata for String;
  *(void *)&long long v57 = 32;
  *((void *)&v57 + 1) = 0xE100000000000000;
  sub_1000089E0((uint64_t)&v57, v17, v18);
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v58 + 1) = &type metadata for Double;
  *(void *)&long long v57 = 0;
  sub_1000089E0((uint64_t)&v57, v19, v20);
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v58 + 1) = &type metadata for Double;
  *(void *)&long long v57 = 0;
  sub_1000089E0((uint64_t)&v57, v21, v22);
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;
  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 defaultRate];
  *((void *)&v58 + 1) = &type metadata for Float;
  LODWORD(v57) = v26;
  sub_1000089E0((uint64_t)&v57, v23, v25);
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v29 = v28;
  [(id)qword_10001D310 defaultRate];
  *((void *)&v58 + 1) = &type metadata for Float;
  LODWORD(v57) = v30;
  sub_1000089E0((uint64_t)&v57, v27, v29);
  if (a3)
  {
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v33 = v32;
    id v34 = a3;
    [v34 size];
    double v36 = v35;
    double v38 = v37;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v34;
    id v40 = objc_allocWithZone((Class)MPMediaItemArtwork);
    v59 = sub_100010AD0;
    uint64_t v60 = v39;
    *(void *)&long long v57 = _NSConcreteStackBlock;
    *((void *)&v57 + 1) = 1107296256;
    *(void *)&long long v58 = sub_10000E2F8;
    *((void *)&v58 + 1) = &unk_100018C40;
    v41 = _Block_copy(&v57);
    id v42 = v34;
    id v43 = [v40 initWithBoundsSize:v41 requestHandler:v36 requestHandler:v38];
    _Block_release(v41);
    swift_release();
    *((void *)&v58 + 1) = sub_1000115EC(0, &qword_10001D4C0);
    *(void *)&long long v57 = v43;
    sub_1000089E0((uint64_t)&v57, v31, v33);
  }
  else
  {
    uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    long long v57 = 0u;
    long long v58 = 0u;
    sub_1000089E0((uint64_t)&v57, v44, v45);
  }
  if (a4 == 3) {
    uint64_t v46 = 32;
  }
  else {
    uint64_t v46 = 0xD000000000000016;
  }
  if (a4 == 3) {
    unint64_t v47 = 0xE100000000000000;
  }
  else {
    unint64_t v47 = 0x8000000100016330;
  }
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v48 = type metadata accessor for Logger();
  sub_10000E2C0(v48, (uint64_t)qword_10001D2F8);
  swift_bridgeObjectRetain_n();
  v49 = Logger.logObject.getter();
  os_log_type_t v50 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v57 = swift_slowAlloc();
    *(_DWORD *)v51 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_10000E570(v46, v47, (uint64_t *)&v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "#sirireaderd setting represented bundle identifier: %s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v52 = self;
  id v53 = [v52 defaultCenter];
  NSString v54 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v53 setRepresentedApplicationBundleIdentifier:v54];

  id v55 = [v52 defaultCenter];
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v55 setNowPlayingInfo:isa];
}

uint64_t sub_1000089E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10001086C((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_10000F614(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100010C50(a1, &qword_10001D498);
    sub_10000F038(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_100010C50((uint64_t)v9, &qword_10001D498);
  }
}

void sub_100008AB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2);
  uint64_t v28 = (uint64_t)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SpeakableStringExtractor.InputType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for String.Encoding();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  uint64_t v12 = String.data(using:allowLossyConversion:)();
  unint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v14 >> 60 == 15)
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000E2C0(v15, (uint64_t)qword_10001D2F8);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "#sirireaderd failed to create sentence data from article body", v18, 2u);
      swift_slowDealloc();
    }

    uint64_t v19 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain();
    uint64_t v21 = v28;
    sub_10000D76C(v28);
    sub_100012348(v19, v20, v21, 3u);
    swift_bridgeObjectRelease();
    uint64_t v23 = v29;
    uint64_t v22 = v30;
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v21, v30);
    uint64_t v24 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_100010C50(v24, &qword_10001D480);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v24, 1, 1, v22);
  }
  else
  {
    id v25 = sub_10000FB24();
    dispatch thunk of SynthesisVoice.language.getter();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for SpeakableStringExtractor.InputType.plainText(_:), v4);
    objc_allocWithZone((Class)type metadata accessor for SpeakableStringExtractor());
    sub_1000109CC(v12, v14);
    int v26 = (void *)SpeakableStringExtractor.init(language:data:inputType:)();
    __chkstk_darwin(v26);
    *(&v27 - 2) = v1;
    dispatch thunk of SpeakableStringExtractor.enumerate(_:)();
    sub_100010A2C(v12, v14);

    *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence) = *(void *)(v1
                                                                                                  + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence);
  }
}

uint64_t sub_100008F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  uint64_t v7 = *(char **)(a3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a3 + v6) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_10000E444(0, *((void *)v7 + 2) + 1, 1, v7);
    *(void *)(a3 + v6) = v7;
  }
  unint64_t v10 = *((void *)v7 + 2);
  unint64_t v9 = *((void *)v7 + 3);
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = sub_10000E444((char *)(v9 > 1), v10 + 1, 1, v7);
    *(void *)(a3 + v6) = v7;
  }
  *((void *)v7 + 2) = v10 + 1;
  uint64_t v11 = &v7[56 * v10];
  *((void *)v11 + 4) = a1;
  *((void *)v11 + 5) = a2;
  *((void *)v11 + 6) = 0;
  v11[56] = 1;
  *((void *)v11 + 8) = 0;
  *((_WORD *)v11 + 36) = 1;
  *((void *)v11 + 10) = 0;
  return 1;
}

uint64_t sub_100008FFC()
{
  uint64_t v1 = type metadata accessor for OSSignpostID();
  uint64_t v2 = *(char **)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v36 = sub_10000FB24();
  static os_signpost_type_t.begin.getter();
  if (qword_10001D1E8 != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:)();
    uint64_t v7 = (void (*)(void, void))*((void *)v2 + 1);
    uint64_t v5 = v2 + 8;
    uint64_t v6 = (uint64_t (*)(void, void))v7;
    v7(v4, v1);
    uint64_t v8 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences];
    id v34 = *(char **)(v9 + 16);
    double v35 = v0;
    if (!v34) {
      break;
    }
    uint64_t v27 = v6;
    uint64_t v28 = v4;
    uint64_t v29 = v5;
    uint64_t v30 = v1;
    uint64_t v33 = type metadata accessor for DurationEstimator();
    Class v32 = (Class)type metadata accessor for SynthesisRequest();
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    uint64_t v4 = 0;
    *(void *)&long long v11 = 134218240;
    long long v31 = v11;
    while (1)
    {
      uint64_t v12 = v9;
      unint64_t v13 = *(void **)(v9 + v10 + 80);
      uint64_t v1 = *(void *)(v9 + v10 + 40);
      id v14 = objc_allocWithZone(v32);
      id v15 = v13;
      id v16 = v36;
      swift_bridgeObjectRetain_n();
      os_log_type_t v17 = (void *)SynthesisRequest.init(text:voice:)();
      static DurationEstimator.roughEstimation(request:)();
      uint64_t v19 = v18;
      if (qword_10001D1F0 != -1) {
        swift_once();
      }
      uint64_t v20 = type metadata accessor for Logger();
      sub_10000E2C0(v20, (uint64_t)qword_10001D2F8);
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = v31;
        *(void *)(v23 + 4) = v4;
        *(_WORD *)(v23 + 12) = 2048;
        *(void *)(v23 + 14) = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "#sirireaderd estimated duration of sentence %ld is %f", (uint8_t *)v23, 0x16u);
        swift_slowDealloc();
      }

      uint64_t v2 = v35;
      uint64_t v0 = *(char **)&v35[v8];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v2[v8] = v0;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v0 = sub_10000F9BC((uint64_t)v0);
      }
      if ((unint64_t)v4 >= *((void *)v0 + 2)) {
        break;
      }
      id v25 = &v0[v10];
      *((void *)v25 + 6) = v19;
      ++v4;
      v25[56] = 0;
      *(void *)&v2[v8] = v0;

      swift_bridgeObjectRelease();
      v10 += 56;
      uint64_t v9 = v12;
      if (v34 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v30;
        uint64_t v6 = v27;
        uint64_t v4 = v28;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    swift_once();
  }
LABEL_13:
  static os_signpost_type_t.end.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  return v6(v4, v1);
}

uint64_t sub_1000093A8(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  double v3 = 0.0;
  if (*(void *)(v2 + 16) > result)
  {
    if (result < 0)
    {
LABEL_15:
      __break(1u);
      return result;
    }
    if (result)
    {
      uint64_t v4 = (unsigned char *)(v2 + 72);
      uint64_t v5 = 1 - result;
      do
      {
        if (*v4 == 1 && (*(v4 - 16) & 1) != 0)
        {
          double v3 = v3 + 0.0;
          if (!v5) {
            return result;
          }
        }
        else
        {
          if (*v4) {
            uint64_t v6 = -24;
          }
          else {
            uint64_t v6 = -8;
          }
          double v3 = v3 + *(double *)&v4[v6];
          if (!v5) {
            return result;
          }
        }
        v4 += 56;
        ++v5;
      }
      while (v5 != 1);
      __break(1u);
      goto LABEL_15;
    }
  }
  return result;
}

double sub_100009434()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    double v3 = (unsigned char *)(v1 + 72);
    uint64_t v4 = 1;
    double result = 0.0;
    do
    {
      if (*v3 == 1 && (*(v3 - 16) & 1) != 0)
      {
        double result = result + 0.0;
        if (v2 == v4) {
          return result;
        }
      }
      else
      {
        if (*v3) {
          uint64_t v6 = -24;
        }
        else {
          uint64_t v6 = -8;
        }
        double result = result + *(double *)&v3[v6];
        if (v2 == v4) {
          return result;
        }
      }
      v3 += 56;
    }
    while (!__OFADD__(v4++, 1));
    __break(1u);
  }
  return 0.0;
}

double sub_1000094B8(double result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  unint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = -1;
  if (v3 && result >= 0.0)
  {
    uint64_t v5 = (double *)(v2 + 72);
    double v6 = 0.0;
    do
    {
      if (*(unsigned char *)v5)
      {
        double v7 = *(v5 - 3);
        if (*((unsigned char *)v5 - 16)) {
          double v7 = 0.0;
        }
      }
      else
      {
        double v7 = *(v5 - 1);
      }
      unint64_t v8 = v4 + 2;
      ++v4;
      if (v8 >= v3) {
        break;
      }
      double v6 = v6 + v7;
      v5 += 7;
    }
    while (v6 <= result);
  }
  return result;
}

void sub_100009528()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence);
  sub_100009ACC(v1);
  uint64_t v2 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
LABEL_17:
    __break(1u);
  }
  else
  {
    uint64_t v3 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    uint64_t v4 = 56 * v1;
    uint64_t v5 = v1 + 1;
    double v6 = 0.0;
    while (1)
    {
      if (qword_10001D1F8 != -1) {
        swift_once();
      }
      [(id)qword_10001D310 defaultRate];
      if (v6 >= (float)(v8 * 15.0) || v5 >= *(void *)(*(void *)(v0 + v3) + 16)) {
        break;
      }
      sub_100009ACC(v5);
      if (v2 < 0)
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      uint64_t v9 = *(void *)(v0 + v3);
      if ((unint64_t)v5 >= *(void *)(v9 + 16)) {
        goto LABEL_16;
      }
      uint64_t v10 = v9 + v4;
      if (*(unsigned char *)(v10 + 128))
      {
        double v7 = *(double *)(v10 + 104);
        if (*(unsigned char *)(v10 + 112)) {
          double v7 = 0.0;
        }
      }
      else
      {
        double v7 = *(double *)(v10 + 120);
      }
      double v6 = v6 + v7;
      ++v5;
      v4 += 56;
    }
  }
}

void sub_100009674()
{
  uint64_t v1 = v0;
  if (qword_10001D1F0 != -1) {
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000E2C0(v2, (uint64_t)qword_10001D2F8);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "#sirireaderd Canceling all TTS requests", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v6 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    uint64_t v7 = *(void *)(*(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences) + 16);
    if (!v7) {
      break;
    }
    unint64_t v8 = 0;
    uint64_t v9 = 80;
    uint64_t v10 = &off_10001D000;
    while (1)
    {
      uint64_t v13 = *(void *)(v1 + v6);
      if (v8 >= *(void *)(v13 + 16)) {
        break;
      }
      id v14 = *(void **)(v13 + v9);
      if (v14)
      {
        uint64_t v15 = qword_10001D200;
        id v16 = v14;
        if (v15 != -1) {
          swift_once();
        }
        os_log_type_t v17 = v10[99];
        dispatch thunk of DaemonSession.cancel(request:)();

        uint64_t v18 = *(char **)(v1 + v6);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v1 + v6) = v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v18 = sub_10000F9BC((uint64_t)v18);
          *(void *)(v1 + v6) = v18;
        }
        if (v8 >= *((void *)v18 + 2)) {
          goto LABEL_20;
        }
        uint64_t v20 = *(void **)&v18[v9];
        *(void *)&v18[v9] = 0;

        uint64_t v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v11 = swift_slowAlloc();
          *(_DWORD *)uint64_t v11 = 134217984;
          *(void *)(v11 + 4) = v8;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "#sirireaderd Canceled TTS generation for sentence %ld", (uint8_t *)v11, 0xCu);
          uint64_t v10 = &off_10001D000;
          swift_slowDealloc();
          uint64_t v12 = v16;
        }
        else
        {
          uint64_t v12 = v21;
          uint64_t v21 = v16;
        }
      }
      ++v8;
      v9 += 56;
      if (v7 == v8) {
        return;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
  }
}

void sub_10000990C()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 0;
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000E2C0(v1, (uint64_t)qword_10001D2F8);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "#sirireaderd Pausing player and calling removeAllItems", v4, 2u);
    swift_slowDealloc();
  }

  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 pause];
  [(id)qword_10001D310 removeAllItems];
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "#sirireaderd Buffering the first sentences", v7, 2u);
    swift_slowDealloc();
  }

  sub_100009528();
}

void sub_100009ACC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  os_log_t v76 = *(os_log_t *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000E214(&qword_10001D4B0);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000E214(&qword_10001D480);
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  if (*(void *)(v15 + 16) <= a1) {
    return;
  }
  if (a1 < 0)
  {
    __break(1u);
LABEL_33:
    swift_once();
LABEL_5:
    sub_10000E2C0(v3, (uint64_t)qword_10001D2F8);
    os_log_t v76 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v76, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 134217984;
      uint64_t v78 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v76, v18, "#sirireaderd Sentence %ld has already been generated, not doing generation", v19, 0xCu);
      swift_slowDealloc();

      return;
    }
    goto LABEL_19;
  }
  uint64_t v16 = v15 + 32;
  uint64_t v17 = v15 + 32 + 56 * a1;
  if (*(unsigned char *)(v17 + 41) == 3)
  {
    if (qword_10001D1F0 == -1) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
  if (*(void *)(v16 + 56 * a1 + 48)) {
    return;
  }
  uint64_t v20 = *(NSObject **)(v17 + 8);
  uint64_t v72 = *(void *)v17;
  v75 = v20;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_10000FB24();
  os_log_type_t v22 = *(void **)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  v74 = v21;
  if (v22)
  {
    uint64_t v68 = v14;
    uint64_t v69 = v1;
    v70 = v12;
    uint64_t v23 = *(void *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    uint64_t v78 = 0x6E7568435354542FLL;
    unint64_t v79 = 0xEA00000000002D6BLL;
    uint64_t v24 = v22;
    swift_bridgeObjectRetain();
    uint64_t v73 = v10;
    v25._countAndFlagsBits = v23;
    v25._object = v24;
    String.append(_:)(v25);
    v26._countAndFlagsBits = 45;
    v26._object = (void *)0xE100000000000000;
    String.append(_:)(v26);
    uint64_t v77 = a1;
    v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v71 = v9;
    String.append(_:)(v27);
    swift_bridgeObjectRelease();
    v28._countAndFlagsBits = v78;
    uint64_t v29 = (void *)v79;
    uint64_t v78 = 0xD00000000000001ALL;
    unint64_t v79 = 0x8000000100016050;
    v28._object = v29;
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v30._countAndFlagsBits = 1717658414;
    v30._object = (void *)0xE400000000000000;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    uint64_t v67 = v78;
    id v31 = objc_allocWithZone((Class)type metadata accessor for SynthesisRequest());
    Class v32 = v74;
    uint64_t v33 = (void *)SynthesisRequest.init(text:voice:)();
    UUID.init(uuidString:)();
    swift_bridgeObjectRelease();
    dispatch thunk of BaseRequest.logLinkId.setter();
    id v34 = v70;
    URL.init(fileURLWithPath:)();
    uint64_t v35 = v71;
    swift_bridgeObjectRelease();
    uint64_t v36 = v73;
    (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v8, v34, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v8, 0, 1, v35);
    double v37 = v33;
    dispatch thunk of BaseRequest.outputPath.setter();
    v74 = v37;

    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_10000E2C0(v3, (uint64_t)qword_10001D2F8);
    os_log_t v39 = v76;
    ((void (*)(char *, uint64_t, uint64_t))v76[2].isa)(v5, v38, v3);
    v75 = v32;
    id v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.default.getter();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v77 = a1;
      uint64_t v78 = v44;
      *(_DWORD *)uint64_t v43 = 134218498;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v45 = v75;
      LODWORD(v72) = v42;
      uint64_t v46 = dispatch thunk of SynthesisVoice.language.getter();
      uint64_t v77 = sub_10000E570(v46, v47, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2080;
      uint64_t v48 = dispatch thunk of SynthesisVoice.name.getter();
      if (v49)
      {
        unint64_t v50 = v49;
      }
      else
      {
        uint64_t v48 = 0x656D616E206C696ELL;
        unint64_t v50 = 0xE800000000000000;
      }
      uint64_t v67 = v43 + 24;
      uint64_t v77 = sub_10000E570(v48, v50, &v78);
      uint64_t v51 = v71;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      uint64_t v35 = v51;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v72, "#sirireaderd synthesizing sentence %ld with voice: %s named %s", (uint8_t *)v43, 0x20u);
      swift_arrayDestroy();
      id v34 = v70;
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v76[1].isa)(v5, v3);
    }
    else
    {

      id v55 = v75;
      ((void (*)(char *, uint64_t))v39[1].isa)(v5, v3);
    }
    uint64_t v56 = v69;
    uint64_t v57 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v57;
    *(void *)(v3 + 24) = a1;
    if (qword_10001D200 != -1) {
      swift_once();
    }
    id v58 = (id)qword_10001D318;
    v59 = v74;
    dispatch thunk of DaemonSession.synthesize(request:didFinish:)();

    uint64_t v60 = v68;
    uint64_t v61 = *(char **)(v56 + v68);
    v62 = v59;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v56 + v60) = v61;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v61 = sub_10000F9BC((uint64_t)v61);
      *(void *)(v56 + v60) = v61;
    }
    if (*((void *)v61 + 2) > (unint64_t)a1)
    {
      v64 = &v61[56 * a1];
      v65 = (void *)*((void *)v64 + 10);
      *((void *)v64 + 10) = v62;

      swift_release();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v34, v35);
      return;
    }
    __break(1u);
    goto LABEL_35;
  }
  swift_bridgeObjectRelease();
  if (qword_10001D1F0 != -1) {
LABEL_35:
  }
    swift_once();
  sub_10000E2C0(v3, (uint64_t)qword_10001D2F8);
  os_log_t v76 = (os_log_t)Logger.logObject.getter();
  os_log_type_t v52 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v76, v52))
  {

    os_log_t v54 = v74;
    goto LABEL_20;
  }
  id v53 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v53 = 0;
  _os_log_impl((void *)&_mh_execute_header, v76, v52, "#sirireaderd No currently playing UUID", v53, 2u);
  swift_slowDealloc();

LABEL_19:
  os_log_t v54 = v76;
LABEL_20:
}

void sub_10000A42C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = &off_10001D000;
  if (a1)
  {
    swift_errorRetain();
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_10000E2C0(v5, (uint64_t)qword_10001D2F8);
    os_log_type_t v6 = static os_log_type_t.error.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = v6;
    if (os_log_type_enabled(v7, v6))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      swift_getErrorValue();
      uint64_t v10 = Error.localizedDescription.getter();
      sub_10000E570(v10, v11, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "#sirireaderd %s", v9, 0xCu);
      swift_arrayDestroy();
      uint64_t v4 = &off_10001D000;
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
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v13 = Strong;
    sub_10000A6EC(a3);
  }
  else
  {
    if (v4[62] != (uint64_t (*)())-1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_10000E2C0(v14, (uint64_t)qword_10001D2F8);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v15, "#sirireaderd unexpectedly found nil self", v16, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000A6EC(unint64_t a1)
{
  uint64_t v3 = v1;
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_10000E2C0(v5, (uint64_t)qword_10001D2F8);
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  int v8 = v7;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, (os_log_type_t)v8, "#sirireaderd Generation completed for sentence: %ld", v2, 0xCu);
    swift_slowDealloc();
  }

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = (uint8_t *)OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    os_log_type_t v6 = *(NSObject **)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
    if (v6[2].isa > (Class)a1)
    {
      int v8 = BYTE1(v6[7 * a1 + 9].isa);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v2[v3] = v6;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_18:
  os_log_type_t v6 = sub_10000F9BC((uint64_t)v6);
LABEL_8:
  if (v6[2].isa <= (Class)a1)
  {
    __break(1u);
    return;
  }
  uint64_t v10 = &v6[7 * a1];
  BYTE1(v10[9].isa) = 3;
  *(void *)&v2[v3] = v6;
  Class isa = v10[10].isa;
  v10[10].Class isa = 0;

  if (*(void *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence) == a1
    && *(unsigned char *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone) != 1)
  {
    BOOL v12 = 1;
  }
  else
  {
    if ((v8 - 1) > 1) {
      return;
    }
    BOOL v12 = v8 == 1;
  }
  sub_10000A8D4(a1, v12);
}

uint64_t sub_10000A8D4(unint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v14 = (uint64_t)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  if (*(void *)(*(void *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences) + 16) <= (int64_t)a1)
  {
    if (qword_10001D1F0 == -1)
    {
LABEL_23:
      uint64_t v52 = type metadata accessor for Logger();
      sub_10000E2C0(v52, (uint64_t)qword_10001D2F8);
      id v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v53, v54))
      {
        id v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v55 = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "#sirireaderd Playback complete, resetting to beginning of content", v55, 2u);
        swift_slowDealloc();
      }

      *(void *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence) = 0;
      if (qword_10001D1F8 != -1) {
        swift_once();
      }
      [(id)qword_10001D310 removeAllItems];
      sub_100007058();
      return 0;
    }
LABEL_48:
    swift_once();
    goto LABEL_23;
  }
  int v73 = a2;
  uint64_t v70 = v6;
  uint64_t v71 = v12;
  uint64_t v72 = v11;
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_10000E2C0(v16, (uint64_t)qword_10001D2F8);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v69 = v7;
  if (v19)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 134217984;
    uint64_t v75 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "#sirireaderd Updating playback duration and position for sentence: %ld", v20, 0xCu);
    swift_slowDealloc();
  }

  sub_10000B350(a1);
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134217984;
    uint64_t v75 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "#sirireaderd Attempting to add sentence to play queue: %ld", v23, 0xCu);
    swift_slowDealloc();
  }

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v24 = *(void *)(v3 + v15);
  if (*(void *)(v24 + 16) <= a1)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  int v25 = *(unsigned __int8 *)(v24 + 56 * a1 + 73);
  Swift::String v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  if (v25 == 3)
  {
    if (v28)
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 134217984;
      uint64_t v75 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "#sirireaderd Validated sentence has been generated: %ld", v29, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v30 = *(void *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    if (v30)
    {
      uint64_t v31 = *(void *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
      uint64_t v75 = 0x6E7568435354542FLL;
      unint64_t v76 = 0xEA00000000002D6BLL;
      swift_bridgeObjectRetain();
      uint64_t v67 = v31;
      v32._countAndFlagsBits = v31;
      v32._object = (void *)v30;
      String.append(_:)(v32);
      v33._countAndFlagsBits = 45;
      v33._object = (void *)0xE100000000000000;
      String.append(_:)(v33);
      unint64_t v74 = a1;
      v34._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v34);
      swift_bridgeObjectRelease();
      v35._countAndFlagsBits = v75;
      uint64_t v36 = (void *)v76;
      uint64_t v75 = 0xD00000000000001ALL;
      unint64_t v76 = 0x8000000100016050;
      v35._object = v36;
      String.append(_:)(v35);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v37._countAndFlagsBits = 1717658414;
      v37._object = (void *)0xE400000000000000;
      String.append(_:)(v37);
      swift_bridgeObjectRelease();
      URL.init(fileURLWithPath:)();
      swift_bridgeObjectRelease();
      id v38 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v39);
      os_log_type_t v41 = v40;
      id v42 = [v38 initWithURL:v40];

      NSString v43 = String._bridgeToObjectiveC()();
      id v68 = v42;
      [v42 addObserver:v3 forKeyPath:v43 options:3 context:0];

      uint64_t v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v46 = 134217984;
        uint64_t v75 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "#sirireaderd Adding sentence to play queue: %ld", v46, 0xCu);
        swift_slowDealloc();
      }

      if (qword_10001D1F8 == -1) {
        goto LABEL_17;
      }
      goto LABEL_50;
    }
    v64 = Logger.logObject.getter();
    os_log_type_t v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "#sirireaderd No currently playing UUID", v66, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  if (v28)
  {
    uint64_t v14 = 12;
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v57 = 134217984;
    uint64_t v75 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "#sirireaderd Sentence %ld has not been generated, will begin playback once generation is complete.", v57, 0xCu);
    swift_slowDealloc();
  }

  if (v73) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = 2;
  }
  id v58 = *(char **)(v3 + v15);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + v15) = v58;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    id v58 = sub_10000F9BC((uint64_t)v58);
  }
  if (*((void *)v58 + 2) > a1)
  {
    uint64_t result = 0;
    v58[56 * a1 + 73] = v30;
    *(void *)(v3 + v15) = v58;
    return result;
  }
  __break(1u);
LABEL_50:
  swift_once();
LABEL_17:
  [(id)qword_10001D310 insertItem:v68 afterItem:0];
  if ((v73 & 1) == 0) {
    goto LABEL_38;
  }
  unint64_t v47 = Logger.logObject.getter();
  os_log_type_t v48 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v47, v48))
  {
    unint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v49 = 134217984;
    uint64_t v75 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "#sirireaderd Starting playback for sentence: %ld", v49, 0xCu);
    swift_slowDealloc();
  }

  [(id)qword_10001D310 play];
  *(unsigned char *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 1;
  if (*(void *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence) == a1)
  {
    sub_10000D76C((uint64_t)v9);
    float v50 = CFAbsoluteTimeGetCurrent()
        - *(double *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime);
    [(id)qword_10001D310 volume];
    sub_100012D0C(v50, v51, v67, v30, (uint64_t)v9, 1);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v70);
  }
  else
  {
LABEL_38:
    swift_bridgeObjectRelease();
  }
  id v60 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v61 = String._bridgeToObjectiveC()();
  id v62 = [v60 initWithSuiteName:v61];

  if (v62)
  {
    NSString v63 = String._bridgeToObjectiveC()();
    [v62 setInteger:a1 forKey:v63];
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v14, v72);
  return 1;
}

void sub_10000B350(uint64_t a1)
{
  sub_1000093A8(a1);
  uint64_t v2 = v1;
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000E2C0(v3, (uint64_t)qword_10001D2F8);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134217984;
    v17[0] = v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "#sirireaderd calculated estimated playback position: %f", v6, 0xCu);
    swift_slowDealloc();
  }

  double v7 = sub_100009434();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    *(double *)uint64_t v17 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "#sirireaderd calculated total playback duration of %f", v10, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  os_log_type_t v18 = &type metadata for Double;
  *(double *)uint64_t v17 = v7;
  sub_1000089E0((uint64_t)v17, v11, v12);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  os_log_type_t v18 = &type metadata for Double;
  v17[0] = v2;
  sub_1000089E0((uint64_t)v17, v13, v14);
  id v15 = [self defaultCenter];
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v15 setNowPlayingInfo:isa];
}

void sub_10000B750()
{
  uint64_t v1 = v0;
  uint64_t v2 = Notification.userInfo.getter();
  if (!v2) {
    return;
  }
  uint64_t v3 = v2;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10000ECD0((uint64_t)v20), (v5 & 1) != 0))
  {
    sub_10001087C(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v21);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_1000108D8((uint64_t)v20);
  if (!*((void *)&v22 + 1))
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  if (!v18)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 1;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v3 + 16) && (unint64_t v10 = sub_10000ECD0((uint64_t)v20), (v11 & 1) != 0))
    {
      sub_10001087C(*(void *)(v3 + 56) + 32 * v10, (uint64_t)&v21);
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1000108D8((uint64_t)v20);
    if (*((void *)&v22 + 1))
    {
      if ((swift_dynamicCast() & 1) == 0) {
        return;
      }
      if (v19)
      {
        sub_100007C50();
        if (qword_10001D1F0 != -1) {
          swift_once();
        }
        uint64_t v17 = type metadata accessor for Logger();
        sub_10000E2C0(v17, (uint64_t)qword_10001D2F8);
        uint64_t v13 = Logger.logObject.getter();
        os_log_type_t v14 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v13, v14)) {
          goto LABEL_35;
        }
        id v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v15 = 0;
        uint64_t v16 = "#sirireaderd Audio session resumed";
      }
      else
      {
        if (qword_10001D1F0 != -1) {
          swift_once();
        }
        uint64_t v12 = type metadata accessor for Logger();
        sub_10000E2C0(v12, (uint64_t)qword_10001D2F8);
        uint64_t v13 = Logger.logObject.getter();
        os_log_type_t v14 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v13, v14)) {
          goto LABEL_35;
        }
        id v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v15 = 0;
        uint64_t v16 = "#sirireaderd Audio session ended and should not resume";
      }
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v16, v15, 2u);
      swift_slowDealloc();
LABEL_35:

      return;
    }
LABEL_17:
    sub_100010C50((uint64_t)&v21, &qword_10001D498);
    return;
  }
  if (v18 != 1) {
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000E2C0(v6, (uint64_t)qword_10001D2F8);
  double v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#sirireaderd Audio session interrupted", v9, 2u);
    swift_slowDealloc();
  }

  *(unsigned char *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 0;
}

uint64_t sub_10000BC10()
{
  id v0 = [self sharedCommandCenter];
  id v1 = [v0 changePlaybackRateCommand];
  if (qword_10001D208 != -1) {
    swift_once();
  }
  sub_1000115EC(0, &qword_10001D488);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v1 setSupportedPlaybackRates:isa];

  id v3 = [v0 changePlaybackRateCommand];
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v37 = sub_10000E41C;
  uint64_t v38 = v4;
  aBlock = _NSConcreteStackBlock;
  uint64_t v34 = 1107296256;
  Swift::String v35 = sub_10000C8DC;
  uint64_t v36 = &unk_100018B00;
  char v5 = _Block_copy(&aBlock);
  swift_release();
  id v6 = [v3 addTargetWithHandler:v5];
  _Block_release(v5);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000116D4((uint64_t)&aBlock);
  id v7 = [v0 playCommand];
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v37 = sub_10000E424;
  uint64_t v38 = v8;
  aBlock = _NSConcreteStackBlock;
  uint64_t v34 = 1107296256;
  Swift::String v35 = sub_10000C8DC;
  uint64_t v36 = &unk_100018B28;
  os_log_type_t v9 = _Block_copy(&aBlock);
  swift_release();
  id v10 = [v7 addTargetWithHandler:v9];
  _Block_release(v9);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000116D4((uint64_t)&aBlock);
  id v11 = [v0 pauseCommand];
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v37 = sub_10000E42C;
  uint64_t v38 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v34 = 1107296256;
  Swift::String v35 = sub_10000C8DC;
  uint64_t v36 = &unk_100018B50;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_release();
  id v14 = [v11 addTargetWithHandler:v13];
  _Block_release(v13);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000116D4((uint64_t)&aBlock);
  id v15 = [v0 skipForwardCommand];
  sub_10000E214(&qword_10001D490);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100014AD0;
  *(NSNumber *)(v16 + 32) = NSNumber.init(floatLiteral:)(1.0);
  *(NSNumber *)(v16 + 40) = NSNumber.init(floatLiteral:)(30.0);
  aBlock = (void **)v16;
  specialized Array._endMutation()();
  Class v17 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v15 setPreferredIntervals:v17];

  id v18 = [v0 skipForwardCommand];
  Swift::String v37 = sub_10000CC90;
  uint64_t v38 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v34 = 1107296256;
  Swift::String v35 = sub_10000C8DC;
  uint64_t v36 = &unk_100018B78;
  uint64_t v19 = _Block_copy(&aBlock);
  id v20 = [v18 addTargetWithHandler:v19];
  _Block_release(v19);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000116D4((uint64_t)&aBlock);
  id v21 = [v0 skipBackwardCommand];
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_100014AD0;
  *(NSNumber *)(v22 + 32) = NSNumber.init(floatLiteral:)(1.0);
  *(NSNumber *)(v22 + 40) = NSNumber.init(floatLiteral:)(30.0);
  aBlock = (void **)v22;
  specialized Array._endMutation()();
  Class v23 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v21 setPreferredIntervals:v23];

  id v24 = [v0 skipBackwardCommand];
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v37 = sub_10000E434;
  uint64_t v38 = v25;
  aBlock = _NSConcreteStackBlock;
  uint64_t v34 = 1107296256;
  Swift::String v35 = sub_10000C8DC;
  uint64_t v36 = &unk_100018BA0;
  Swift::String v26 = _Block_copy(&aBlock);
  swift_release();
  id v27 = [v24 addTargetWithHandler:v26];
  _Block_release(v26);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000116D4((uint64_t)&aBlock);
  id v28 = [v0 changePlaybackPositionCommand];
  uint64_t v29 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v37 = sub_10000E43C;
  uint64_t v38 = v29;
  aBlock = _NSConcreteStackBlock;
  uint64_t v34 = 1107296256;
  Swift::String v35 = sub_10000C8DC;
  uint64_t v36 = &unk_100018BC8;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_release();
  id v31 = [v28 addTargetWithHandler:v30];
  _Block_release(v30);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return sub_1000116D4((uint64_t)&aBlock);
}

uint64_t sub_10000C3A8(void *a1)
{
  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  id v2 = [(id)qword_10001D310 currentItem];
  if (!v2) {
    return 200;
  }
  id v3 = v2;
  id v4 = [v2 status];

  if (v4 != (id)1) {
    return 200;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (!v5) {
    return 200;
  }
  id v6 = (void *)v5;
  id v7 = a1;
  uint64_t v8 = &OBJC_INSTANCE_METHODS_NSObject;
  [v6 playbackRate];
  if (v9 <= 0.0)
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000E2C0(v16, (uint64_t)qword_10001D2F8);
    id v17 = v7;
    id v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v20 = 134217984;
      [v6 playbackRate];
      v44[0] = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "#sirireaderd cannot play at negative rate %f", v20, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    return 200;
  }
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_10000E2C0(v10, (uint64_t)qword_10001D2F8);
  id v11 = v7;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v14 = 134217984;
    [v6 playbackRate];
    v44[0] = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v8 = &OBJC_INSTANCE_METHODS_NSObject;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "#sirireaderd changing playback rate to %f", v14, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  id v22 = (id)qword_10001D310;
  [v6 *(SEL *)&v8[326]];
  [v22 setDefaultRate:];

  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v24 = (void *)Strong;
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v27 = v26;
    [v6 *(SEL *)&v8[326]];
    os_log_type_t v45 = &type metadata for Float;
    LODWORD(v44[0]) = v28;
    sub_1000089E0((uint64_t)v44, v25, v27);
  }
  uint64_t v29 = swift_unknownObjectWeakLoadStrong();
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v33 = v32;
    [v6 *(SEL *)&v8[326]];
    os_log_type_t v45 = &type metadata for Float;
    LODWORD(v44[0]) = v34;
    sub_1000089E0((uint64_t)v44, v31, v33);
  }
  id v35 = [self defaultCenter];
  Class isa = (void *)swift_unknownObjectWeakLoadStrong();
  if (isa)
  {
    swift_bridgeObjectRetain();

    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  [v35 setNowPlayingInfo:isa];

  Swift::String v37 = (unsigned __int8 *)swift_unknownObjectWeakLoadStrong();
  if (v37)
  {
    int v38 = v37[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying];

    if (v38 == 1)
    {
      id v39 = (id)qword_10001D310;
      [v6 playbackRate];
      [v39 playImmediatelyAtRate:];
    }
  }
  uint64_t v40 = swift_unknownObjectWeakLoadStrong();
  if (v40)
  {
    os_log_type_t v41 = (void *)v40;
    [v6 playbackRate];
    sub_1000106E4(v42);
  }
  return 0;
}

uint64_t sub_10000C8DC(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = v3();
  swift_release();

  return v5;
}

uint64_t sub_10000C934()
{
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E2C0(v0, (uint64_t)qword_10001D2F8);
  id v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "#sirireaderd playCommand", v3, 2u);
    swift_slowDealloc();
  }

  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 rate];
  if (v4 == 0.0)
  {
    [(id)qword_10001D310 play];
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v6 = (void *)Strong;
      sub_10000D620();
    }
    uint64_t v7 = swift_unknownObjectWeakLoadStrong();
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    *(unsigned char *)(v7 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 1;
  }
  else
  {
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v10, "#sirireaderd playCommand failed due to player rate being non zero", v11, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = 200;
  }

  return v9;
}

uint64_t sub_10000CB34()
{
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E2C0(v0, (uint64_t)qword_10001D2F8);
  id v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "#sirireaderd pauseCommand", v3, 2u);
    swift_slowDealloc();
  }

  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 pause];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_10000D2B0();
  }
  id v6 = (unsigned char *)swift_unknownObjectWeakLoadStrong();
  if (v6)
  {
    v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] = 0;
  }
  return 0;
}

uint64_t sub_10000CC90()
{
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E2C0(v0, (uint64_t)qword_10001D2F8);
  id v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "#sirireaderd skipForwardCommand", v3, 2u);
    swift_slowDealloc();
  }

  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 advanceToNextItem];
  return 0;
}

uint64_t sub_10000CDB0()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 200;
  }
  id v1 = (unsigned char *)Strong;
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000E2C0(v2, (uint64_t)qword_10001D2F8);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "#sirireaderd skipBackwardCommand", v5, 2u);
    swift_slowDealloc();
  }

  v1[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] = 0;
  uint64_t v6 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence;
  uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence];
  BOOL v8 = v7 < 1;
  uint64_t v9 = v7 - 1;
  if (!v8) {
    *(void *)&v1[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] = v9;
  }
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "#sirireaderd pausing player before skip backward", v12, 2u);
    swift_slowDealloc();
  }

  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 pause];
  [(id)qword_10001D310 removeAllItems];
  sub_100009528();
  sub_10000A8D4(*(void *)&v1[v6], 1);

  return 0;
}

uint64_t sub_10000CFA8(void *a1)
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (!v2) {
    return 200;
  }
  id v3 = (void *)v2;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 200;
  }
  uint64_t v5 = (unsigned char *)Strong;
  uint64_t v6 = qword_10001D1F0;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_10000E2C0(v8, (uint64_t)qword_10001D2F8);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "#sirireaderd changePlaybackPositionCommand", v11, 2u);
    swift_slowDealloc();
  }

  [v3 positionTime];
  double v13 = v12;
  uint64_t v14 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking;
  v5[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking] = 1;
  float v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "#sirireaderd pausing player before changing playback position", v17, 2u);
    swift_slowDealloc();
  }

  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  [(id)qword_10001D310 pause];
  [(id)qword_10001D310 removeAllItems];
  sub_1000094B8(v13);
  uint64_t v19 = v18;
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v22 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "#sirireaderd changePlaybackPositionCommand to sentence %ld", v22, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v23 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence;
  *(void *)&v5[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] = v19;
  sub_100009674();
  sub_100009528();
  sub_10000A8D4(*(void *)&v5[v23], 1);

  v5[v14] = 0;
  return 0;
}

void sub_10000D2B0()
{
  uint64_t v1 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer;
  if (*(void *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer)) {
    sub_10000D620();
  }
  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11[4] = sub_10000E3FC;
  v11[5] = v3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000D5B8;
  v11[3] = &unk_100018AD8;
  os_log_type_t v4 = _Block_copy(v11);
  swift_release();
  id v5 = [v2 scheduledTimerWithTimeInterval:0 repeats:v4 block:420.0];
  _Block_release(v4);
  uint64_t v6 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = v5;

  *(CFAbsoluteTime *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker) = CFAbsoluteTimeGetCurrent();
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000E2C0(v7, (uint64_t)qword_10001D2F8);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "#sirireaderd idle timer started", v10, 2u);
    swift_slowDealloc();
  }
}

void sub_10000D498()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (id)Strong;
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_10000E2C0(v1, (uint64_t)qword_10001D2F8);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "#sirireaderd releasing audio session after idle", v4, 2u);
      swift_slowDealloc();
    }

    sub_100007058();
  }
}

void sub_10000D5B8(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000D620()
{
  uint64_t v1 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer);
  if (v2)
  {
    id v3 = v2;
    [v3 invalidate];
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = 0;

    float v5 = CFAbsoluteTimeGetCurrent() - *(double *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker);
    *(float *)&dword_10001D324 = *(float *)&dword_10001D324 + v5;
  }
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000E2C0(v6, (uint64_t)qword_10001D2F8);
  oslog = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "#sirireaderd idle timer invalidated", v8, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10000D76C@<X0>(uint64_t a1@<X8>)
{
  sub_10000E214(&qword_10001D480);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  float v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v16 - v7;
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v16 - v9;
  uint64_t v11 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
  sub_100011670(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, (uint64_t)v8, &qword_10001D480);
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v8, 1, v12) == 1)
  {
    UUID.init()();
    sub_100010C50((uint64_t)v8, &qword_10001D480);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v8, v12);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_10000E258((uint64_t)v10, v11);
  sub_100011670(v11, (uint64_t)v5, &qword_10001D480);
  if (v14(v5, 1, v12) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v5, v12);
  }
  UUID.init()();
  return sub_100010C50((uint64_t)v5, &qword_10001D480);
}

id sub_10000D990()
{
  return sub_10000DEEC(0, type metadata accessor for SiriReaderDaemon);
}

uint64_t sub_10000DA68()
{
  return type metadata accessor for SiriReaderDaemon();
}

uint64_t type metadata accessor for SiriReaderDaemon()
{
  uint64_t result = qword_10001D3D0;
  if (!qword_10001D3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000DABC()
{
  sub_10000DBAC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000DBAC()
{
  if (!qword_10001D3E0)
  {
    type metadata accessor for UUID();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001D3E0);
    }
  }
}

BOOL sub_10000DC04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000DC18()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000DC60()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000DC8C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id sub_10000DCD0()
{
  uint64_t v1 = OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_server;
  id v2 = objc_allocWithZone((Class)type metadata accessor for SiriReaderDaemon());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  uint64_t v4 = OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_interface;
  *(void *)&v3[v4] = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP11sirireaderd24SiriReaderDaemonProtocol_];

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for SiriReaderDaemonServer();
  id v5 = [super init];
  id v6 = objc_allocWithZone((Class)NSXPCListener);
  id v7 = v5;
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v6 initWithMachServiceName:v8];

  [v9 setDelegate:v7];
  [v9 resume];

  return v7;
}

id sub_10000DED4(uint64_t a1)
{
  return sub_10000DEEC(a1, type metadata accessor for SiriReaderDaemonServer);
}

id sub_10000DEEC(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for SiriReaderDaemonServer()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for ArticleSentence(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ArticleSentence(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t initializeWithCopy for ArticleSentence(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  objc_super v4 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for ArticleSentence(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  id v6 = *(void **)(a1 + 48);
  id v7 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v7;
  id v8 = v7;

  return a1;
}

__n128 initializeWithTake for ArticleSentence(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ArticleSentence(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleSentence(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticleSentence(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleSentence()
{
  return &type metadata for ArticleSentence;
}

uint64_t sub_10000E214(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000E258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E214(&qword_10001D480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E2C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_10000E2F8(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, double, double))(a1 + 32);
  uint64_t v6 = swift_retain();
  id v7 = (void *)v5(v6, a2, a3);
  swift_release();

  return v7;
}

uint64_t *sub_10000E360(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000E3C4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E3FC()
{
}

uint64_t sub_10000E404(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E414()
{
  return swift_release();
}

uint64_t sub_10000E41C(void *a1)
{
  return sub_10000C3A8(a1);
}

uint64_t sub_10000E424()
{
  return sub_10000C934();
}

uint64_t sub_10000E42C()
{
  return sub_10000CB34();
}

uint64_t sub_10000E434()
{
  return sub_10000CDB0();
}

uint64_t sub_10000E43C(void *a1)
{
  return sub_10000CFA8(a1);
}

char *sub_10000E444(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000E214(&qword_10001D4A8);
      os_log_type_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[56 * v8 + 32]) {
          memmove(v12, a4 + 32, 56 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000FD30(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E570(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E644(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001087C((uint64_t)v12, *a3);
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
      sub_10001087C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000116D4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E644(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000E800(a5, a6);
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

uint64_t sub_10000E800(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E898(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EA78(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EA78(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E898(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EA10(v2, 0);
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

void *sub_10000EA10(uint64_t a1, uint64_t a2)
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
  sub_10000E214(&qword_10001D4B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000EA78(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000E214(&qword_10001D4B8);
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

unint64_t sub_10000EBC8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000ED14(a1, a2, v4);
}

unint64_t sub_10000EC40(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_10000EDF8(a1, v2);
}

unint64_t sub_10000ECD0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000EF70(a1, v4);
}

unint64_t sub_10000ED14(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10000EDF8(uint64_t a1, uint64_t a2)
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

unint64_t sub_10000EF70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001092C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000108D8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_10000F038@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10000EBC8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000F7D4();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_10001086C((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_10000F43C(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_10000F13C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000E214(&qword_10001D4A0);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      os_log_type_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_10001086C(v24, v35);
      }
      else
      {
        sub_10001087C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_10001086C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000F43C(unint64_t result, uint64_t a2)
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
        Swift::Int v10 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_10000F614(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_10000EBC8(a2, a3);
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
      sub_10000F7D4();
      goto LABEL_7;
    }
    sub_10000F13C(v15, a4 & 1);
    unint64_t v21 = sub_10000EBC8(a2, a3);
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
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_1000116D4((uint64_t)v19);
    return sub_10001086C(a1, v19);
  }
LABEL_13:
  sub_10000F768(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_10000F768(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10001086C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_10000F7D4()
{
  uint64_t v1 = v0;
  sub_10000E214(&qword_10001D4A0);
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
    uint64_t v20 = 32 * v15;
    sub_10001087C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_10001086C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

char *sub_10000F9BC(uint64_t a1)
{
  return sub_10000E444(0, *(void *)(a1 + 16), 0, (char *)a1);
}

float sub_10000F9D0()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  float v3 = 1.0;
  if (v2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v2 objectForKey:v4];

    if (v5)
    {
      _bridgeAnyObjectToAny(_:)();

      swift_unknownObjectRelease();
    }
    else
    {

      memset(v8, 0, sizeof(v8));
    }
    sub_100010CB4((uint64_t)v8, (uint64_t)v9);
    if (v10)
    {
      if (swift_dynamicCast()) {
        return v7;
      }
    }
    else
    {
      sub_100010C50((uint64_t)v9, &qword_10001D498);
    }
  }
  return v3;
}

id sub_10000FB24()
{
  id v0 = (objc_class *)type metadata accessor for SynthesisVoice();
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = SynthesisVoice.init(language:name:)();
  id v3 = [self sharedPreferences];
  id v4 = [v3 outputVoice];

  if (!v4)
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000E2C0(v9, (uint64_t)qword_10001D2F8);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "#sirireaderd Unable to retrieve outputVoice, falling back to en-us", v12, 2u);
      swift_slowDealloc();
    }
    goto LABEL_10;
  }
  id result = [v4 languageCode];
  if (result)
  {
    uint64_t v6 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v7 = [v4 name];
    if (v7)
    {
      uint64_t v8 = v7;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    id v13 = objc_allocWithZone(v0);
    uint64_t v14 = SynthesisVoice.init(language:name:)();

    uint64_t v10 = v2;
    uint64_t v2 = v14;
LABEL_10:

    return (id)v2;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000FD30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000FE28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, void *a7, unint64_t a8)
{
  uint64_t v9 = v8;
  *(CFAbsoluteTime *)&v8[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime] = CFAbsoluteTimeGetCurrent();
  if (v8[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive] == 1) {
    sub_100007058();
  }
  sub_100006BBC();
  if (qword_10001D200 != -1) {
    swift_once();
  }
  id v13 = (id)qword_10001D318;
  dispatch thunk of DaemonSession.keepActive.setter();

  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_10000E2C0(v14, (uint64_t)qword_10001D2F8);
  swift_bridgeObjectRetain_n();
  unint64_t v15 = v9;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    id v52 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    sub_10000E570(a5, a6, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "#sirireaderd new UUID now playing: %s started at %f", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v19 = (uint64_t *)&v15[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID];
  *uint64_t v19 = a5;
  v19[1] = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  dword_10001D320 = 0;
  dword_10001D324 = 0;
  *(void *)&v15[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker] = 0;
  sub_10000D620();
  uint64_t v20 = 0;
  if (a8 <= 2) {
    uint64_t v20 = dword_100014C6C[a8];
  }
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    id v52 = (id)swift_slowAlloc();
    *(_DWORD *)unint64_t v23 = 136315138;
    uint64_t v24 = READSchemaREADRequestTrigger.description.getter();
    sub_10000E570(v24, v25, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "#sirireaderd logging trigger as: %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v26 = *v19;
  uint64_t v27 = v19[1];
  swift_bridgeObjectRetain();
  sub_1000126C4(v26, v27, v20);
  swift_bridgeObjectRelease();
  *(void *)&v15[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence] = sub_1000051B0();
  sub_100005E84(a8);
  sub_10000561C();
  id v28 = [self defaultManager];
  NSString v29 = String._bridgeToObjectiveC()();
  sub_10000E214(&qword_10001D568);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014AE0;
  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 32) = NSFileOwnerAccountName;
  *(void *)(inited + 40) = 0x656C69626F6DLL;
  *(void *)(inited + 48) = 0xE600000000000000;
  uint64_t v31 = NSFileOwnerAccountName;
  sub_100004F9C(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_100011628(&qword_10001D2D0, type metadata accessor for FileAttributeKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v52 = 0;
  LODWORD(inited) = [v28 createDirectoryAtPath:v29 withIntermediateDirectories:0 attributes:isa error:&v52];

  if (inited)
  {
    id v33 = v52;
  }
  else
  {
    id v34 = v52;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    id v35 = Logger.logObject.getter();
    int v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, (os_log_type_t)v36))
    {
      Swift::String v37 = (uint8_t *)swift_slowAlloc();
      int v38 = (void *)swift_slowAlloc();
      *(_DWORD *)Swift::String v37 = 138412290;
      swift_errorRetain();
      id v39 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v52 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *int v38 = v39;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v36, "#sirireaderd error creating TTS generation directory: %@", v37, 0xCu);
      sub_10000E214(&qword_10001D4C8);
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
  if (qword_10001D1F8 != -1) {
    swift_once();
  }
  id v40 = (id)qword_10001D310;
  *(float *)&double v41 = sub_10000F9D0();
  [v40 setDefaultRate:v41];

  sub_1000083C0(a1, a2, a7, a8);
  sub_100008AB8();
  sub_100008FFC();
  sub_10000990C();
  uint64_t v43 = *v19;
  uint64_t v42 = v19[1];
  swift_bridgeObjectRetain();
  unint64_t v44 = String.count.getter();
  if ((v44 & 0x8000000000000000) != 0
    || (uint64_t v45 = v44, HIDWORD(v44))
    || (unint64_t v46 = *(void *)(*(void *)&v15[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences] + 16),
        HIDWORD(v46)))
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    float v47 = sub_100009434();
    sub_1000129CC(v47, v43, v42, v45, v46);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000106E4(float a1)
{
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    unint64_t v5 = String._bridgeToObjectiveC()();
    *(float *)&double v6 = a1;
    oslog = v5;
    [v4 setFloat:v6 forKey:@""];
  }
  else
  {
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000E2C0(v7, (uint64_t)qword_10001D2F8);
    oslog = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "#sirireaderd failed to fetch user defaults", v9, 2u);
      swift_slowDealloc();
    }
  }
}

_OWORD *sub_10001086C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001087C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000108D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001092C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001098C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000109C4(uint64_t a1)
{
  sub_10000A42C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000109CC(uint64_t a1, unint64_t a2)
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

uint64_t sub_100010A24(uint64_t a1, uint64_t a2)
{
  return sub_100008F14(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100010A2C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100010A40(a1, a2);
  }
  return a1;
}

uint64_t sub_100010A40(uint64_t a1, unint64_t a2)
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

uint64_t sub_100010A98()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100010AD0()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_100010AD8()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100010B10(void *a1)
{
}

uint64_t sub_100010B18()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010B28()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100010B50(uint64_t a1, void *a2, void *a3)
{
  return sub_100006244(a1, a2, a3, v3);
}

uint64_t sub_100010B58()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100010BA0()
{
  sub_10000651C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_100010BAC()
{
  unint64_t result = qword_10001D550;
  if (!qword_10001D550)
  {
    sub_100010C08(&qword_10001D548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D550);
  }
  return result;
}

uint64_t sub_100010C08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100010C50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000E214(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100010CAC()
{
}

uint64_t sub_100010CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E214(&qword_10001D498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100010D1C(uint64_t a1, char *a2, uint64_t a3, void *a4)
{
  double v6 = v4;
  uint64_t v9 = a2;
  if (qword_10001D210 == -1)
  {
    if (!a2) {
      return;
    }
  }
  else
  {
    swift_once();
    if (!v9) {
      return;
    }
  }
  BOOL v11 = qword_10001D738 == a1 && unk_10001D740 == (void)v9;
  if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    goto LABEL_28;
  }
  sub_100011670(a3, (uint64_t)time, &qword_10001D498);
  if (!*(void *)&time[24])
  {
    sub_100010C50((uint64_t)time, &qword_10001D498);
    goto LABEL_28;
  }
  sub_1000115EC(0, &qword_10001D560);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v12 = (uint64_t)v52;
  id v13 = [v52 currentItem];

  if (v13) {
    goto LABEL_27;
  }
  if ((v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] & 1) == 0) {
    goto LABEL_27;
  }
  if (v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking]) {
    goto LABEL_27;
  }
  uint64_t v5 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence;
  if (*(void *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] >= *(void *)(*(void *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences] + 16)) {
    goto LABEL_27;
  }
  uint64_t v51 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  if (qword_10001D1F0 != -1) {
    goto LABEL_79;
  }
  while (1)
  {
    uint64_t v14 = type metadata accessor for Logger();
    sub_10000E2C0(v14, (uint64_t)qword_10001D2F8);
    unint64_t v15 = v6;
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      float v50 = v15;
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134217984;
      *(void *)time = *(void *)&v6[v5];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "#sirireaderd Marking playback as complete for sentence: %ld", v18, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      uint64_t v16 = v15;
    }

    unint64_t v19 = *(void *)&v6[v5];
    if ((v19 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_81:
      __break(1u);
      return;
    }
    uint64_t v20 = *(void *)&v6[v51];
    if (v19 >= *(void *)(v20 + 16)) {
      goto LABEL_81;
    }
    uint64_t v21 = v20 + 32;
    if (*(unsigned char *)(v21 + 56 * v19 + 40))
    {
      uint64_t v22 = v21 + 56 * v19;
      double v23 = *(double *)(v22 + 16);
      if (*(unsigned char *)(v22 + 24)) {
        double v23 = 0.0;
      }
    }
    else
    {
      double v23 = *(double *)(v21 + 56 * v19 + 32);
    }
    float v24 = v23;
    *(float *)&dword_10001D320 = *(float *)&dword_10001D320 + v24;
    *(void *)&v6[v5] = v19 + 1;
    sub_10000A8D4(v19 + 1, 0);
    sub_100009528();
LABEL_27:

LABEL_28:
    if ((a1 != 0x737574617473 || v9 != (char *)0xE600000000000000)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      return;
    }
    if (!a4 || !a4[2])
    {
      memset(time, 0, sizeof(time));
LABEL_36:
      sub_100010C50((uint64_t)time, &qword_10001D498);
LABEL_37:
      a4 = 0;
      goto LABEL_38;
    }
    unint64_t v25 = NSKeyValueChangeNewKey;
    unint64_t v26 = sub_10000EC40((uint64_t)v25);
    if (v27) {
      sub_10001087C(a4[7] + 32 * v26, (uint64_t)time);
    }
    else {
      memset(time, 0, sizeof(time));
    }

    if (!*(void *)&time[24]) {
      goto LABEL_36;
    }
    sub_1000115EC(0, &qword_10001D488);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_37;
    }
    a4 = [v52 integerValue];

LABEL_38:
    sub_100011670(a3, (uint64_t)time, &qword_10001D498);
    if (!*(void *)&time[24])
    {
      sub_100010C50((uint64_t)time, &qword_10001D498);
      if (a4 != (void *)2) {
        return;
      }
      goto LABEL_65;
    }
    sub_1000115EC(0, &qword_10001D558);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_64;
    }
    a3 = (uint64_t)v52;
    [v52 duration];
    Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
    if (qword_10001D1F0 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_10000E2C0(v29, (uint64_t)qword_10001D2F8);
    BOOL v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v5 = 12;
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 134217984;
      *(Float64 *)time = Seconds;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "#sirireaderd playerItem.duration in seconds : %f", v32, 0xCu);
      swift_slowDealloc();
    }

    if ((~*(void *)&Seconds & 0x7FF0000000000000) == 0 && (*(void *)&Seconds & 0xFFFFFFFFFFFFFLL) != 0) {
      goto LABEL_60;
    }
    uint64_t v12 = *(void *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence];
    a1 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    uint64_t v9 = *(char **)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences];
    if (v12 >= *((void *)v9 + 2)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v6[a1] = v9;
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v12 < 0) {
        goto LABEL_77;
      }
    }
    else
    {
      uint64_t v9 = sub_10000F9BC((uint64_t)v9);
      if (v12 < 0)
      {
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
    }
    if ((unint64_t)v12 < *((void *)v9 + 2))
    {
      id v34 = &v9[56 * v12];
      *((Float64 *)v34 + 8) = Seconds;
      v34[72] = 0;
      *(void *)&v6[a1] = v9;
      goto LABEL_60;
    }
LABEL_78:
    __break(1u);
LABEL_79:
    swift_once();
  }
  id v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v35, v36))
  {
    Swift::String v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "#sirireaderd attempting to save duration for sentence outside bounds", v37, 2u);
    swift_slowDealloc();
  }

LABEL_60:
  id v38 = [v52 error];
  if (!v38)
  {

LABEL_64:
    if (a4 != (void *)2) {
      return;
    }
    goto LABEL_65;
  }
  id v39 = v38;
  id v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 138412290;
    id v44 = v39;
    uint64_t v45 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)time = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v43 = v45;

    _os_log_impl((void *)&_mh_execute_header, v40, v41, "#sirireaderd playerItem error: %@", v42, 0xCu);
    sub_10000E214(&qword_10001D4C8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (a4 != (void *)2) {
    return;
  }
LABEL_65:
  if (qword_10001D1F0 != -1) {
    swift_once();
  }
  uint64_t v46 = type metadata accessor for Logger();
  sub_10000E2C0(v46, (uint64_t)qword_10001D2F8);
  float v47 = Logger.logObject.getter();
  os_log_type_t v48 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v47, v48))
  {
    unint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "#sirireaderd AVPlayerItem failure has occured", v49, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000115EC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100011628(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100011670(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000E214(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000116D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for GenerationState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenerationState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerationState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x100011890);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_1000118B8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000118C4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GenerationState()
{
  return &type metadata for GenerationState;
}

unint64_t sub_1000118E0()
{
  unint64_t result = qword_10001D580;
  if (!qword_10001D580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D580);
  }
  return result;
}

uint64_t sub_10001198C()
{
  sub_1000119F8();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10001D750 = result;
  return result;
}

unint64_t sub_1000119F8()
{
  unint64_t result = qword_10001D588;
  if (!qword_10001D588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001D588);
  }
  return result;
}

uint64_t sub_100011A38()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E360(v0, qword_10001D590);
  sub_10000E2C0(v0, (uint64_t)qword_10001D590);
  if (qword_10001D218 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10001D750;
  return Logger.init(_:)();
}

uint64_t sub_100011AC4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SelfEmitter()
{
  return self;
}

uint64_t sub_100011AF8()
{
  sub_1000116D4(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for SiriReaderInstrumentationUtility()
{
  return self;
}

void *sub_100011B54(uint64_t a1)
{
  uint64_t v2 = sub_10000E214(&qword_10001D480);
  __chkstk_darwin(v2 - 8);
  unsigned int v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013120(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1000130C0((uint64_t)v4);
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000E2C0(v9, (uint64_t)qword_10001D590);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "cannot generate READClient event with nil readId", v12, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v13 = [objc_allocWithZone((Class)READSchemaREADClientEvent) init];
  if (!v13)
  {
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_10000E2C0(v20, (uint64_t)qword_10001D590);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      double v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "error initializing READSchemaREADClientEvent", v23, 2u);
      swift_slowDealloc();
    }

    goto LABEL_20;
  }
  uint64_t v14 = v13;
  id v15 = [objc_allocWithZone((Class)READSchemaREADClientEventMetadata) init];
  if (!v15)
  {
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_10000E2C0(v24, (uint64_t)qword_10001D590);
    unint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      char v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "error initializing READSchemaREADClientEventMetadata", v27, 2u);
      swift_slowDealloc();
    }

LABEL_20:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  uint64_t v16 = v15;
  id v17 = objc_allocWithZone((Class)SISchemaUUID);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v19 = [v17 initWithNSUUID:isa];

  [v16 setReadId:v19];
  [v14 setEventMetadata:v16];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v14;
}

void sub_100011FB4(float a1, float a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_10000E214(&qword_10001D480);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - v11;
  id v13 = [objc_allocWithZone((Class)READSchemaREADPlaybackSessionEnded) init];
  *(float *)&double v14 = a1;
  [v13 setPlayedAudioDuration:v14];
  *(float *)&double v15 = a2;
  [v13 setTotalDuration:v15];
  id v16 = [objc_allocWithZone((Class)READSchemaREADPlaybackSessionContext) init];
  if (v16)
  {
    id v17 = objc_allocWithZone((Class)SISchemaUUID);
    id v18 = v16;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v20 = [v17 initWithNSUUID:isa];

    [v18 setContextId:v20];
  }
  [v16 setEnded:v13];
  if (!a4) {
    goto LABEL_9;
  }
  UUID.init(uuidString:)();
  uint64_t v21 = type metadata accessor for UUID();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v10, 1, v21) == 1)
  {
    sub_1000130C0((uint64_t)v10);
    uint64_t v23 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v12, v10, v21);
    uint64_t v23 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v12, v23, 1, v21);
  uint64_t v24 = sub_100011B54((uint64_t)v12);
  sub_1000130C0((uint64_t)v12);
  if (v24)
  {
    [v24 setPlaybackSessionContext:v16];
    [objc_msgSend(self, "sharedStream") emitMessage:v24];

    swift_unknownObjectRelease();
  }
  else
  {
LABEL_9:
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    sub_10000E2C0(v25, (uint64_t)qword_10001D590);
    os_log_type_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "error generating READClient Event", v28, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_100012348(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v6 = sub_10000E214(&qword_10001D480);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v27 - v10;
  id v12 = [objc_allocWithZone((Class)READSchemaREADPlaybackSessionFailed) init];
  id v13 = v12;
  if (v12) {
    [v12 setErrorCodes:a4];
  }
  id v14 = [objc_allocWithZone((Class)READSchemaREADPlaybackSessionContext) init];
  if (v14)
  {
    id v15 = objc_allocWithZone((Class)SISchemaUUID);
    id v16 = v14;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v18 = [v15 initWithNSUUID:isa];

    [v16 setContextId:v18];
  }
  [v14 setFailed:v13];
  if (!a2) {
    goto LABEL_11;
  }
  UUID.init(uuidString:)();
  uint64_t v19 = type metadata accessor for UUID();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) == 1)
  {
    sub_1000130C0((uint64_t)v9);
    uint64_t v21 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v11, v9, v19);
    uint64_t v21 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v11, v21, 1, v19);
  uint64_t v22 = sub_100011B54((uint64_t)v11);
  sub_1000130C0((uint64_t)v11);
  if (v22)
  {
    [v22 setPlaybackSessionContext:v14];
    [objc_msgSend(self, "sharedStream") emitMessage:v22];

    swift_unknownObjectRelease();
  }
  else
  {
LABEL_11:
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    sub_10000E2C0(v23, (uint64_t)qword_10001D590);
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "error generating READClient Event", v26, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_1000126C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000E214(&qword_10001D480);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v21 - v9;
  id v11 = [objc_allocWithZone((Class)READSchemaREADRequestStarted) init];
  [v11 setTrigger:a3];
  id v12 = [objc_allocWithZone((Class)READSchemaREADRequestContext) init];
  [v12 setStartedOrChanged:v11];
  if (!a2) {
    goto LABEL_7;
  }
  UUID.init(uuidString:)();
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) == 1)
  {
    sub_1000130C0((uint64_t)v8);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v10, v8, v13);
    uint64_t v15 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v10, v15, 1, v13);
  id v16 = sub_100011B54((uint64_t)v10);
  sub_1000130C0((uint64_t)v10);
  if (v16)
  {
    [v16 setReadThisRequestContext:v12];
    [objc_msgSend(self, "sharedStream") emitMessage:v16];

    swift_unknownObjectRelease();
  }
  else
  {
LABEL_7:
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_10000E2C0(v17, (uint64_t)qword_10001D590);
    id v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "error generating READClient Event", v20, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_1000129CC(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_10000E214(&qword_10001D480);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  id v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - v13;
  id v15 = [objc_allocWithZone((Class)READSchemaREADRequestPreprocessingEnded) init];
  [v15 setUtteranceCount:a5];
  [v15 setArticleTextLength:a4];
  *(float *)&double v16 = a1;
  [v15 setEstimatedDuration:v16];
  id v17 = [objc_allocWithZone((Class)READSchemaREADRequestPreprocessingContext) init];
  [v17 setEnded:v15];
  if (!a3) {
    goto LABEL_7;
  }
  UUID.init(uuidString:)();
  uint64_t v18 = type metadata accessor for UUID();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v12, 1, v18) == 1)
  {
    sub_1000130C0((uint64_t)v12);
    uint64_t v20 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v14, v12, v18);
    uint64_t v20 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v14, v20, 1, v18);
  uint64_t v21 = sub_100011B54((uint64_t)v14);
  sub_1000130C0((uint64_t)v14);
  if (v21)
  {
    [v21 setReadsThisRequestPreprocessingContext:v17];
    [objc_msgSend(self, "sharedStream") emitMessage:v21];

    swift_unknownObjectRelease();
  }
  else
  {
LABEL_7:
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_10000E2C0(v22, (uint64_t)qword_10001D590);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "error generating READClient Event", v25, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_100012D0C(float a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = sub_10000E214(&qword_10001D480);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v32 - v14;
  id v16 = [objc_allocWithZone((Class)READSchemaREADPlaybackSessionStartedOrChanged) init];
  [v16 setPlaybackStateChange:a6];
  *(float *)&double v17 = a2;
  [v16 setVolume:v17];
  if (a1 > 0.0)
  {
    *(float *)&double v18 = a1;
    [v16 setCustomerPerceivedLatency:v18];
  }
  id v19 = [objc_allocWithZone((Class)READSchemaREADPlaybackSessionContext) init];
  if (v19)
  {
    id v20 = objc_allocWithZone((Class)SISchemaUUID);
    id v21 = v19;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v23 = [v20 initWithNSUUID:isa];

    [v21 setContextId:v23];
  }
  [v19 setStartedOrChanged:v16];
  if (!a4) {
    goto LABEL_11;
  }
  UUID.init(uuidString:)();
  uint64_t v24 = type metadata accessor for UUID();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v13, 1, v24) == 1)
  {
    sub_1000130C0((uint64_t)v13);
    uint64_t v26 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v15, v13, v24);
    uint64_t v26 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v15, v26, 1, v24);
  uint64_t v27 = sub_100011B54((uint64_t)v15);
  sub_1000130C0((uint64_t)v15);
  if (v27)
  {
    [v27 setPlaybackSessionContext:v19];
    [objc_msgSend(self, "sharedStream") emitMessage:v27];

    swift_unknownObjectRelease();
  }
  else
  {
LABEL_11:
    if (qword_10001D220 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_10000E2C0(v28, (uint64_t)qword_10001D590);
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "error generating READClient Event", v31, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t sub_1000130C0(uint64_t a1)
{
  uint64_t v2 = sub_10000E214(&qword_10001D480);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100013120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E214(&qword_10001D480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t dispatch thunk of BaseRequest.outputPath.setter()
{
  return dispatch thunk of BaseRequest.outputPath.setter();
}

uint64_t dispatch thunk of BaseRequest.logLinkId.setter()
{
  return dispatch thunk of BaseRequest.logLinkId.setter();
}

uint64_t dispatch thunk of DaemonSession.keepActive.setter()
{
  return dispatch thunk of DaemonSession.keepActive.setter();
}

uint64_t dispatch thunk of DaemonSession.synthesize(request:didFinish:)()
{
  return dispatch thunk of DaemonSession.synthesize(request:didFinish:)();
}

uint64_t dispatch thunk of DaemonSession.cancel(request:)()
{
  return dispatch thunk of DaemonSession.cancel(request:)();
}

uint64_t type metadata accessor for DaemonSession()
{
  return type metadata accessor for DaemonSession();
}

uint64_t dispatch thunk of SynthesisVoice.name.getter()
{
  return dispatch thunk of SynthesisVoice.name.getter();
}

uint64_t SynthesisVoice.init(language:name:)()
{
  return SynthesisVoice.init(language:name:)();
}

uint64_t dispatch thunk of SynthesisVoice.language.getter()
{
  return dispatch thunk of SynthesisVoice.language.getter();
}

uint64_t type metadata accessor for SynthesisVoice()
{
  return type metadata accessor for SynthesisVoice();
}

uint64_t SynthesisRequest.init(text:voice:)()
{
  return SynthesisRequest.init(text:voice:)();
}

uint64_t type metadata accessor for SynthesisRequest()
{
  return type metadata accessor for SynthesisRequest();
}

uint64_t static DurationEstimator.roughEstimation(request:)()
{
  return static DurationEstimator.roughEstimation(request:)();
}

uint64_t type metadata accessor for DurationEstimator()
{
  return type metadata accessor for DurationEstimator();
}

uint64_t SpeakableStringExtractor.init(language:data:inputType:)()
{
  return SpeakableStringExtractor.init(language:data:inputType:)();
}

uint64_t type metadata accessor for SpeakableStringExtractor.InputType()
{
  return type metadata accessor for SpeakableStringExtractor.InputType();
}

uint64_t dispatch thunk of SpeakableStringExtractor.enumerate(_:)()
{
  return dispatch thunk of SpeakableStringExtractor.enumerate(_:)();
}

uint64_t type metadata accessor for SpeakableStringExtractor()
{
  return type metadata accessor for SpeakableStringExtractor();
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

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t stdout.getter()
{
  return stdout.getter();
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

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t READSchemaREADRequestTrigger.description.getter()
{
  return READSchemaREADRequestTrigger.description.getter();
}

NSNumber __swiftcall NSNumber.init(floatLiteral:)(Swift::Double floatLiteral)
{
  return (NSNumber)NSNumber.init(floatLiteral:)(floatLiteral);
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
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

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
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

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}