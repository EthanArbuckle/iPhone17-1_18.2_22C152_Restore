int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  sub_100002A78(&qword_100008010);
  __chkstk_darwin();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Daemon();
  sub_100002ABC(v5, qword_100008040);
  sub_100002B20(v5, (uint64_t)qword_100008040);
  Daemon.init()();
  TaskPriority.init(rawValue:)();
  v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 0, 1, v7);
  v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  sub_100003130((uint64_t)v4, (uint64_t)&unk_100008020, v8);
  swift_release();
  sub_100003314((uint64_t)v4);
  v9 = [self currentRunLoop];
  [v9 run];

  return 0;
}

uint64_t sub_100002A78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100002ABC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002B20(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002B58()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for Daemon();
  sub_100002B20(v2, (uint64_t)qword_100008040);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100002C5C;
  return Daemon.start()();
}

uint64_t sub_100002C5C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100002D98, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_100002D98()
{
  static AISLogger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to start daemon: %@", v3, 0xCu);
    sub_100002A78(&qword_100008038);
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
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100002F78()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100002FB0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000303C;
  return sub_100002B58();
}

uint64_t sub_10000303C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100002A78(&qword_100008010);
  __chkstk_darwin();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003374(a1, (uint64_t)v7);
  uint64_t v8 = type metadata accessor for TaskPriority();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100003314((uint64_t)v7);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_100003314(uint64_t a1)
{
  uint64_t v2 = sub_100002A78(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002A78(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000033DC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000034B8;
  return v6(a1);
}

uint64_t sub_1000034B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000035B0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000035E8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000303C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100008028 + dword_100008028);
  return v6(a1, v4);
}

uint64_t static AISLogger.daemon.getter()
{
  return static AISLogger.daemon.getter();
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

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.init(rawValue:)()
{
  return TaskPriority.init(rawValue:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_release()
{
  return _swift_release();
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