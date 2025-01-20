void sub_100002E84(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSErrorUserInfoKey v8;
  void *v9;

  v3 = a1;
  if (!v3) {
    sub_1000034A4();
  }
  *a2 = 0;
  v4 = v3;
  [v4 UTF8String];
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v5 = +[NSString stringWithFormat:@"Failed call to _set_user_dir_suffix(\"%@\").", v4];
    v8 = NSLocalizedDescriptionKey;
    v9 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    *a2 = +[NSError errorWithDomain:@"com.apple.icloudsubscriptionoptimizerd" code:42 userInfo:v6];
  }
  v7 = NSTemporaryDirectory();
}

int main(int argc, const char **argv, const char **envp)
{
  qword_100008028 = 0;
  v3 = (void *)DaemonConstants.kTempDirSuffix.unsafeMutableAddressor();
  uint64_t v4 = v3[1];
  *(void *)&xmmword_100008030 = *v3;
  *((void *)&xmmword_100008030 + 1) = v4;
  swift_bridgeObjectRetain();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_beginAccess();
  Swift::Int64 v33 = qword_100008028;
  sub_100002E84(v5, &v33);
  v6 = (void *)v33;
  v7 = (void *)qword_100008028;
  qword_100008028 = v33;
  swift_endAccess();
  id v8 = v6;

  static Logger.setWriteToStdout(enabled:)();
  uint64_t v9 = type metadata accessor for Logger();
  sub_100003408(v9, qword_100008040);
  sub_10000346C(v9, (uint64_t)qword_100008040);
  strcpy((char *)&v34, "main.swift");
  BYTE3(v34._object) = 0;
  HIDWORD(v34._object) = -369098752;
  Logger.init<A>(_:)();
  v34._uint64_t countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  if (qword_100008028)
  {
    id v20 = (id)qword_100008028;
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease();
    v34._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
    v34._object = (void *)0x8000000100003910;
    String.append(_:)((Swift::String)xmmword_100008030);
    v21._uint64_t countAndFlagsBits = 8285;
    v21._object = (void *)0xE200000000000000;
    String.append(_:)(v21);
    uint64_t countAndFlagsBits = v34._countAndFlagsBits;
    object = v34._object;
    v34._uint64_t countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v34, "with error [");
    BYTE5(v34._object) = 0;
    HIWORD(v34._object) = -5120;
    id v24 = [v20 description];
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v27 = v26;

    v28._uint64_t countAndFlagsBits = v25;
    v28._object = v27;
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
    v29._uint64_t countAndFlagsBits = 11869;
    v29._object = (void *)0xE200000000000000;
    String.append(_:)(v29);
    uint64_t v30 = v34._countAndFlagsBits;
    v31 = v34._object;
    v34._uint64_t countAndFlagsBits = countAndFlagsBits;
    v34._object = object;
    swift_bridgeObjectRetain();
    v32._uint64_t countAndFlagsBits = v30;
    v32._object = v31;
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Logger.error(_:)(v34);
    swift_bridgeObjectRelease();
    swift_willThrow();
    int result = swift_errorInMain();
    __break(1u);
  }
  else
  {
    _StringGuts.grow(_:)(51);
    v10._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
    v10._object = (void *)0x80000001000038B0;
    String.append(_:)(v10);
    String.append(_:)((Swift::String)xmmword_100008030);
    v11._uint64_t countAndFlagsBits = 11869;
    v11._object = (void *)0xE200000000000000;
    String.append(_:)(v11);
    Logger.info(_:)(v34);
    swift_bridgeObjectRelease();
    v34._uint64_t countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(48);
    swift_bridgeObjectRelease();
    v34._uint64_t countAndFlagsBits = 0xD00000000000002CLL;
    v34._object = (void *)0x80000001000038E0;
    static Timestamp.now()();
    Swift::Int64 v33 = Timestamp.toUnixMillis()();
    v12._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._uint64_t countAndFlagsBits = 11869;
    v13._object = (void *)0xE200000000000000;
    String.append(_:)(v13);
    Logger.info(_:)(v34);
    swift_bridgeObjectRelease();
    type metadata accessor for DaemonEvents();
    uint64_t v14 = type metadata accessor for CoreAnalyticsEventSink();
    swift_allocObject();
    uint64_t v15 = CoreAnalyticsEventSink.init()();
    uint64_t v35 = v14;
    v36 = &protocol witness table for CoreAnalyticsEventSink;
    v34._uint64_t countAndFlagsBits = v15;
    swift_allocObject();
    DaemonEvents.init(withSink:)();
    static DaemonEvents.initSharedInstance(_:)();
    swift_release();
    type metadata accessor for SubscriptionDaemon();
    uint64_t v16 = type metadata accessor for RealBatteryStateProvider();
    uint64_t v17 = swift_allocObject();
    uint64_t v35 = v16;
    v36 = &protocol witness table for RealBatteryStateProvider;
    v34._uint64_t countAndFlagsBits = v17;
    uint64_t v18 = SubscriptionDaemon.__allocating_init(batteryStateProvider:)();
    (*(void (**)(uint64_t))(*(void *)v18 + 160))(v18);
    swift_release();
    return 0;
  }
  return result;
}

uint64_t *sub_100003408(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000346C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1000034A4()
{
  __assert_rtn("updateTempDirSuffix", "ISOTempDirUpdater.m", 15, "nil != suffix");
}

uint64_t CoreAnalyticsEventSink.init()()
{
  return CoreAnalyticsEventSink.init()();
}

uint64_t type metadata accessor for CoreAnalyticsEventSink()
{
  return type metadata accessor for CoreAnalyticsEventSink();
}

uint64_t DaemonConstants.kTempDirSuffix.unsafeMutableAddressor()
{
  return DaemonConstants.kTempDirSuffix.unsafeMutableAddressor();
}

uint64_t static Logger.setWriteToStdout(enabled:)()
{
  return static Logger.setWriteToStdout(enabled:)();
}

Swift::Void __swiftcall Logger.info(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall Logger.error(_:)(Swift::String a1)
{
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init<A>(_:)()
{
  return Logger.init<A>(_:)();
}

Swift::Int64 __swiftcall Timestamp.toUnixMillis()()
{
  return Timestamp.toUnixMillis()();
}

uint64_t static Timestamp.now()()
{
  return static Timestamp.now()();
}

uint64_t static DaemonEvents.initSharedInstance(_:)()
{
  return static DaemonEvents.initSharedInstance(_:)();
}

uint64_t DaemonEvents.init(withSink:)()
{
  return DaemonEvents.init(withSink:)();
}

uint64_t type metadata accessor for DaemonEvents()
{
  return type metadata accessor for DaemonEvents();
}

uint64_t SubscriptionDaemon.__allocating_init(batteryStateProvider:)()
{
  return SubscriptionDaemon.__allocating_init(batteryStateProvider:)();
}

uint64_t type metadata accessor for SubscriptionDaemon()
{
  return type metadata accessor for SubscriptionDaemon();
}

uint64_t type metadata accessor for RealBatteryStateProvider()
{
  return type metadata accessor for RealBatteryStateProvider();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}