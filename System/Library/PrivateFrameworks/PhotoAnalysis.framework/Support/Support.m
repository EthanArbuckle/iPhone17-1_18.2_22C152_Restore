uint64_t variable initialization expression of ExecutiveBridge.executive()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for Executive.Environment();
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Executive();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Executive.Environment.production(_:), v0);
  return Executive.__allocating_init(environment:)();
}

uint64_t variable initialization expression of ExecutiveBridge.invoker()
{
  return 0;
}

id SimulatorExecutive.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

char *ExecutiveBridge.init()()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for Executive.Environment();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_executive;
  type metadata accessor for Executive();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Executive.Environment.production(_:), v2);
  v7 = v1;
  *(void *)&v1[v6] = Executive.__allocating_init(environment:)();
  *(void *)&v7[OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker] = 0;

  v8 = (objc_class *)type metadata accessor for ExecutiveBridge();
  v13.receiver = v7;
  v13.super_class = v8;
  v9 = (char *)objc_msgSendSuper2(&v13, "init");
  id v10 = [objc_allocWithZone((Class)PHAInvoker) initWithDelegate:v9];
  v11 = *(void **)&v9[OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker];
  *(void *)&v9[OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker] = v10;

  return v9;
}

uint64_t type metadata accessor for ExecutiveBridge()
{
  return self;
}

uint64_t sub_100004C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_100004C74, 0, 0);
}

uint64_t sub_100004C74()
{
  uint64_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of Executive.startup()
                         + async function pointer to dispatch thunk of Executive.startup());
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *id v1 = v0;
  v1[1] = sub_100004D24;
  return v3();
}

uint64_t sub_100004D24()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100004E20, 0, 0);
}

uint64_t sub_100004E20()
{
  OS_dispatch_semaphore.signal()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100004E80(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_1000061A8(a1, &qword_10000C7C8);
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

uint64_t sub_10000504C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_10000506C, 0, 0);
}

uint64_t sub_10000506C()
{
  uint64_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of Executive.shutdown()
                         + async function pointer to dispatch thunk of Executive.shutdown());
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000511C;
  return v3();
}

uint64_t sub_10000511C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000064F4, 0, 0);
}

uint64_t sub_100005238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[5] = v6;
  v5[6] = *(void *)(v6 - 8);
  v5[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000052F8, 0, 0);
}

uint64_t sub_1000052F8()
{
  v0[2] = *(void *)(v0[3] + OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_executive);
  swift_retain();
  Logger.init(subsystem:category:)();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  uint64_t v2 = type metadata accessor for Executive();
  unint64_t v3 = sub_1000062F4();
  *uint64_t v1 = v0;
  v1[1] = sub_100005400;
  uint64_t v4 = v0[7];
  return StatusProtocol.dumpStatus(to:)(v4, v2, v3);
}

uint64_t sub_100005400()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  uint64_t v2 = *(void *)(*(void *)v0 + 48);
  uint64_t v3 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  return _swift_task_switch(sub_10000557C, 0, 0);
}

uint64_t sub_10000557C()
{
  OS_dispatch_semaphore.signal()();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100005608(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000059EC(&qword_10000C7C8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a1;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  static TaskPriority.userInitiated.getter();
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v8;
  v11[5] = v9;
  id v12 = v8;
  objc_super v13 = v9;
  sub_100004E80((uint64_t)v7, a4, (uint64_t)v11);
  swift_release();
  OS_dispatch_semaphore.wait()();
}

Swift::Bool __swiftcall ExecutiveBridge.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  uint64_t v3 = v2;
  char v5 = dispatch thunk of Executive.listener(_:shouldAcceptNewConnection:)();
  if (v5)
  {
    [(objc_class *)shouldAcceptNewConnection.super.isa setDelegate:*(void *)(v3 + OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker)];
    [(objc_class *)shouldAcceptNewConnection.super.isa resume];
  }
  return v5 & 1;
}

id ExecutiveBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExecutiveBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t ExecutiveBridge.target(forOriginalTarget:connection:selector:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100005990(a1, (uint64_t)v8);
  sub_1000059EC(&qword_10000C6D0);
  if (swift_dynamicCast())
  {
    sub_100005A30(v6, (uint64_t)v9);
    sub_100005FAC(v9, v9[3]);
    uint64_t v3 = dispatch thunk of LegacyDispatchProtocol.targetForSelector(_:connection:)();
    if (v3)
    {
      uint64_t v4 = v3;
      *(void *)(a2 + 24) = swift_getObjectType();
      *(void *)a2 = v4;
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
    }
    return sub_100005F5C((uint64_t)v9);
  }
  else
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    uint64_t result = sub_1000061A8((uint64_t)v6, &qword_10000C6D8);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000059EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005A30(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t variable initialization expression of SimulatorExecutive.logger()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100005CB8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100005D94;
  return v6(a1);
}

uint64_t sub_100005D94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s14photoanalysisd15ExecutiveBridgeC17dispatchOperation_8toTarget7serviceySo020PHAServiceCancelableE0C_ypyptF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100005990(a3, (uint64_t)v6);
  sub_1000059EC(&qword_10000C6D0);
  if (swift_dynamicCast())
  {
    sub_100005A30(v4, (uint64_t)v7);
    sub_100005FAC(v7, v7[3]);
    dispatch thunk of LegacyDispatchProtocol.performOperation(_:on:)();
    return sub_100005F5C((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = 0;
    memset(v4, 0, sizeof(v4));
    return sub_1000061A8((uint64_t)v4, &qword_10000C6D8);
  }
}

uint64_t sub_100005F5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100005FAC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100005FF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1000060B4;
  return sub_100005238(a1, v4, v5, v7, v6);
}

uint64_t sub_1000060B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000061A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000059EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006204()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000623C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000060B4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C7E0 + dword_10000C7E0);
  return v6(a1, v4);
}

unint64_t sub_1000062F4()
{
  unint64_t result = qword_10000C7F0;
  if (!qword_10000C7F0)
  {
    type metadata accessor for Executive();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10000C7F0);
  }
  return result;
}

uint64_t sub_100006350()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1000064F8;
  *(_OWORD *)(v2 + 16) = v3;
  return _swift_task_switch(sub_10000506C, 0, 0);
}

uint64_t sub_100006400()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100006448()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1000064F8;
  *(_OWORD *)(v2 + 16) = v3;
  return _swift_task_switch(sub_100004C74, 0, 0);
}

id SimulatorExecutive.init()()
{
  Logger.init(subsystem:category:)();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimulatorExecutive();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SimulatorExecutive()
{
  uint64_t result = qword_10000C8A8;
  if (!qword_10000C8A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id SimulatorExecutive.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimulatorExecutive();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000066F8()
{
  return type metadata accessor for SimulatorExecutive();
}

uint64_t sub_100006700()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t start()
{
  _set_user_dir_suffix();
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    PLDebugEnableCoreDataMultithreadedAsserts();
    id v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.photoanalysisd"];
    objc_super v2 = objc_alloc_init(_TtC14photoanalysisd15ExecutiveBridge);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_1000069D4;
    v15 = &unk_100008500;
    v16 = v2;
    uint64_t v3 = sub_100006A78(0xFuLL, &v12);
    uint64_t v4 = (void *)qword_10000C8C8;
    qword_10000C8C8 = v3;

    dispatch_resume((dispatch_object_t)qword_10000C8C8);
    uint64_t v5 = v2;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_100006B00;
    v15 = &unk_100008500;
    v16 = v5;
    uint64_t v6 = v5;
    uint64_t v7 = sub_100006A78(0x1DuLL, &v12);
    uint64_t v8 = (void *)qword_10000C8D0;
    qword_10000C8D0 = v7;

    dispatch_resume((dispatch_object_t)qword_10000C8D0);
    [v1 setDelegate:v6];
    [(ExecutiveBridge *)v6 startup];
    [v1 resume];
    CFRunLoopRun();
    uint64_t v9 = 70;
  }
  else
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once((dispatch_once_t *)&__PXLog_genericOnceToken, &stru_1000084B8);
    }
    uint64_t v10 = __PXLog_genericOSLog;
    if (os_log_type_enabled(__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "photoanalysisd launched prior to first unlock", (uint8_t *)&v12, 2u);
    }
    uint64_t v6 = 0;
    id v1 = 0;
    uint64_t v9 = 69;
  }

  return v9;
}

uint64_t sub_1000069D4(uint64_t a1)
{
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once((dispatch_once_t *)&__PXLog_genericOnceToken, &stru_1000084D8);
  }
  objc_super v2 = __PXLog_genericOSLog;
  if (os_log_type_enabled(__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "photoanalysisd shutting down due to SIGTERM", v4, 2u);
  }
  [*(id *)(a1 + 32) shutdown];
  return xpc_transaction_exit_clean();
}

NSObject *sub_100006A78(uintptr_t a1, void *a2)
{
  uint64_t v4 = dispatch_get_global_queue(2, 0);
  id v5 = a2;
  uint64_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0, v4);
  dispatch_source_set_event_handler(v6, v5);

  return v6;
}

id sub_100006B00(uint64_t a1)
{
  return _[*(id *)(a1 + 32) dumpStatusToLog];
}

uint64_t dispatch thunk of LegacyDispatchProtocol.performOperation(_:on:)()
{
  return dispatch thunk of LegacyDispatchProtocol.performOperation(_:on:)();
}

uint64_t dispatch thunk of LegacyDispatchProtocol.targetForSelector(_:connection:)()
{
  return dispatch thunk of LegacyDispatchProtocol.targetForSelector(_:connection:)();
}

uint64_t type metadata accessor for Executive.Environment()
{
  return type metadata accessor for Executive.Environment();
}

uint64_t Executive.__allocating_init(environment:)()
{
  return Executive.__allocating_init(environment:)();
}

uint64_t dispatch thunk of Executive.listener(_:shouldAcceptNewConnection:)()
{
  return dispatch thunk of Executive.listener(_:shouldAcceptNewConnection:)();
}

uint64_t type metadata accessor for Executive()
{
  return type metadata accessor for Executive();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

void CFRunLoopRun(void)
{
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t PLDebugEnableCoreDataMultithreadedAsserts()
{
  return _PLDebugEnableCoreDataMultithreadedAsserts();
}

uint64_t __PXLog_genericSetupOSLog()
{
  return ___PXLog_genericSetupOSLog();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return _[a1 startup];
}