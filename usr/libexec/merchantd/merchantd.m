int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int result;
  id v10;
  id v11;
  void **v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  void *v16;
  uint64_t v17;

  v3 = self;
  v4 = [v3 defaultCenter];
  v16 = sub_100003694;
  v17 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_1000036A8;
  v15 = &unk_100004190;
  v5 = _Block_copy(&v12);
  v6 = [v4 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:0 usingBlock:v5];
  _Block_release(v5);

  qword_100008028 = (uint64_t)v6;
  v7 = static Queues.main.getter();
  v16 = sub_1000037B4;
  v17 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_100003808;
  v15 = &unk_1000041B8;
  v8 = _Block_copy(&v12);
  swift_release();
  dispatch_sync(v7, v8);

  _Block_release(v8);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    v10 = [self currentRunLoop];
    [v10 run];

    v11 = [v3 defaultCenter];
    [v11 removeObserver:qword_100008028];

    exit(0);
  }
  __break(1u);
  return result;
}

void sub_100003694()
{
}

uint64_t sub_1000036A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000379C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000037AC()
{
  return swift_release();
}

void sub_1000037B4()
{
  type metadata accessor for Daemon();
  id v0 = (id)static Daemon.shared.getter();
  Daemon.registerServiceListeners()();
}

uint64_t sub_100003808(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

Swift::Void __swiftcall Daemon.registerServiceListeners()()
{
}

uint64_t static Daemon.shared.getter()
{
  return static Daemon.shared.getter();
}

uint64_t type metadata accessor for Daemon()
{
  return type metadata accessor for Daemon();
}

uint64_t static Queues.main.getter()
{
  return static Queues.main.getter();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}