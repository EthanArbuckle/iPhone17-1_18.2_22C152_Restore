int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void (*v13)(char *, uint64_t);
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v19;

  v3 = type metadata accessor for Logger();
  v4 = *(void *)(v3 - 8);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v19 - v8;
  if (_set_user_dir_suffix())
  {
    static Logger.daemon.getter();
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Entered non-macOS Sandbox", v12, 2u);
      swift_slowDealloc();
    }

    v13 = *(void (**)(char *, uint64_t))(v4 + 8);
    v13(v9, v3);
    static Logger.daemon.getter();
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Starting daemon", v16, 2u);
      swift_slowDealloc();
    }

    v13(v7, v3);
    type metadata accessor for CMLXPCServer();
    qword_100008010 = CMLXPCServer.__allocating_init()();
    dispatch thunk of CMLXPCServer.registerScheduledTasks()();
    dispatch thunk of CMLXPCServer.start()();
    v17 = [self mainRunLoop];
    [v17 run];

    exit(0);
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return static Logger.daemon.getter();
}

uint64_t static Logger.daemon.getter()
{
  return static Logger.daemon.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t dispatch thunk of CMLXPCServer.registerScheduledTasks()()
{
  return dispatch thunk of CMLXPCServer.registerScheduledTasks()();
}

uint64_t dispatch thunk of CMLXPCServer.start()()
{
  return dispatch thunk of CMLXPCServer.start()();
}

uint64_t CMLXPCServer.__allocating_init()()
{
  return CMLXPCServer.__allocating_init()();
}

uint64_t type metadata accessor for CMLXPCServer()
{
  return type metadata accessor for CMLXPCServer();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void exit(int a1)
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}