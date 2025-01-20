void sub_100002D88(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (__cdecl *v6)(int);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v11[5];

  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v11[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (!sub_1000033F4()) {
    exit(1);
  }
  v6 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(13, v6);
  sub_100003210();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v2);
  static DispatchQoS.unspecified.getter();
  v11[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100003250();
  sub_1000032A8(&qword_100008010);
  sub_1000032EC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v7 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v11[3] = type metadata accessor for NXDaemonEnvironmentDarwin();
  v11[4] = (uint64_t)&protocol witness table for NXDaemonEnvironmentDarwin;
  sub_100003390(v11);
  v8 = v7;
  NXDaemonEnvironmentDarwin.init()();
  type metadata accessor for NXDaemon();
  swift_allocObject();
  v9 = NXDaemon.init(dispatchQueue:environment:)();
  NXDaemon.activate()();
  swift_release();

  *a1 = v9;
}

int main(int argc, const char **argv, const char **envp)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100003118();
  swift_release();
  return 0;
}

void sub_100003118()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100002D88(&v2);
  if (!v0)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    dispatch_main();
  }
  __break(1u);
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}

unint64_t sub_100003210()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

unint64_t sub_100003250()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

uint64_t sub_1000032A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000032EC()
{
  unint64_t result = qword_100008018;
  if (!qword_100008018)
  {
    sub_100003348(&qword_100008010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008018);
  }
  return result;
}

uint64_t sub_100003348(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100003390(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

BOOL sub_1000033F4()
{
  if (_set_user_dir_suffix())
  {
    bzero(buf, 0x400uLL);
    size_t v0 = confstr(65537, (char *)buf, 0x400uLL);
    BOOL v1 = v0 != 0;
    if (!v0)
    {
      uint64_t v2 = sub_100003548();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        int v6 = *__error();
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "### confstr temp dir failed: %{darwin.errno}d", (uint8_t *)v7, 8u);
      }
    }
  }
  else
  {
    v3 = sub_100003548();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      int v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "### _set_user_dir_suffix failed: %{darwin.errno}d", buf, 8u);
    }

    return 0;
  }
  return v1;
}

id sub_100003548()
{
  if (qword_100008028 != -1) {
    dispatch_once(&qword_100008028, &stru_100004290);
  }
  size_t v0 = (void *)qword_100008020;

  return v0;
}

void sub_10000359C(id a1)
{
  qword_100008020 = (uint64_t)os_log_create("com.apple.nexus", "NXDaemon");

  _objc_release_x1();
}

uint64_t NXDaemonEnvironmentDarwin.init()()
{
  return NXDaemonEnvironmentDarwin.init()();
}

uint64_t type metadata accessor for NXDaemonEnvironmentDarwin()
{
  return type metadata accessor for NXDaemonEnvironmentDarwin();
}

uint64_t NXDaemon.init(dispatchQueue:environment:)()
{
  return NXDaemon.init(dispatchQueue:environment:)();
}

Swift::Void __swiftcall NXDaemon.activate()()
{
}

uint64_t type metadata accessor for NXDaemon()
{
  return type metadata accessor for NXDaemon();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

int *__error(void)
{
  return ___error();
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleaseReturnValue(id a1)
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}