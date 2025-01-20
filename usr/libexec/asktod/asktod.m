int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;

  type metadata accessor for Daemon();
  swift_allocObject();
  v4 = Daemon.init()();
  qword_100008010 = v4;
  if (qword_100008020 != -1) {
    swift_once();
  }
  v6 = type metadata accessor for Logger();
  sub_100003768(v6, (uint64_t)qword_100008038);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "asktod entered autoreleasepool", v9, 2u);
    swift_slowDealloc();
  }

  Daemon.startup()();
  v10 = [self currentRunLoop];
  [v10 run];

  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "asktod runloop completed", v13, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_100003768(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1000037A0()
{
  qword_100008028 = 0x6C7070612E6D6F63;
  unk_100008030 = 0xEF6F546B73412E65;
}

uint64_t sub_1000037D0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003884(v0, qword_100008038);
  sub_100003768(v0, (uint64_t)qword_100008038);
  if (qword_100008018 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_100003884(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

Swift::Void __swiftcall Daemon.startup()()
{
}

uint64_t Daemon.init()()
{
  return Daemon.init()();
}

uint64_t type metadata accessor for Daemon()
{
  return type metadata accessor for Daemon();
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

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}