void sub_100002E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (__cdecl *v13)(int);
  void *v14;
  id v15;
  void aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags();
  sub_10000348C();
  v2 = v1;
  __chkstk_darwin();
  sub_1000034A8();
  v5 = v4 - v3;
  v6 = type metadata accessor for DispatchQoS();
  sub_10000348C();
  v8 = v7;
  __chkstk_darwin();
  sub_1000034A8();
  v11 = v10 - v9;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  _set_user_dir_suffix();
  swift_release();
  type metadata accessor for VCDaemon();
  static VCDaemon.daemon.getter();
  dispatch thunk of VCDaemon.start()();
  swift_release();
  v13 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v13);
  sub_100003304();
  static OS_dispatch_source.makeSignalSource(signal:queue:)();
  swift_getObjectType();
  aBlock[4] = sub_1000030F0;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003224;
  aBlock[3] = &unk_1000042A8;
  v14 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  sub_100003268();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v14);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v0);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v6);
  OS_dispatch_source.activate()();
  v15 = [self mainRunLoop];
  [v15 run];
  swift_unknownObjectRelease();
}

uint64_t sub_1000030F0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000348C();
  uint64_t v2 = v1;
  __chkstk_darwin();
  sub_1000034A8();
  uint64_t v5 = v4 - v3;
  static WFLog.subscript.getter();
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received SIGTERM", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v0);
  type metadata accessor for VCDaemon();
  static VCDaemon.daemon.getter();
  dispatch thunk of VCDaemon.stop()();
  swift_release();
  return xpc_transaction_exit_clean();
}

uint64_t sub_100003224(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_100003268()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003304()
{
  unint64_t result = qword_100008010;
  if (!qword_100008010)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008010);
  }
  return result;
}

uint64_t sub_100003344(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003354()
{
  return swift_release();
}

unint64_t sub_10000335C()
{
  unint64_t result = qword_100008018;
  if (!qword_100008018)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008018);
  }
  return result;
}

uint64_t sub_1000033AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000033F0()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    sub_100003444(&qword_100008020);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_100003444(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t dispatch thunk of VCDaemon.stop()()
{
  return dispatch thunk of VCDaemon.stop()();
}

uint64_t dispatch thunk of VCDaemon.start()()
{
  return dispatch thunk of VCDaemon.start()();
}

uint64_t static VCDaemon.daemon.getter()
{
  return static VCDaemon.daemon.getter();
}

uint64_t type metadata accessor for VCDaemon()
{
  return type metadata accessor for VCDaemon();
}

uint64_t static WFLog.subscript.getter()
{
  return static WFLog.subscript.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
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

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}