int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_1000088C8 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [self serviceListener];
  qword_1000088D0 = (uint64_t)v3;
  [v3 setDelegate:qword_1000088C8];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

void sub_100001878()
{
  if (qword_100008760 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100003148();
  sub_100001EA8(v0, (uint64_t)qword_1000088D8);
  swift_errorRetain();
  swift_errorRetain();
  oslog = sub_100003128();
  os_log_type_t v1 = sub_1000031A8();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = (void *)swift_slowAlloc();
    *(_DWORD *)v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    sub_1000031B8();
    void *v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Error getting remoteObjectProxy: %@", v2, 0xCu);
    sub_100001E64(&qword_1000087F8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_100001A54(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100001B5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100001B90(void *a1)
{
  uint64_t v2 = sub_1000030F8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  id v7 = [v6 interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriAnalytics29ExtensionOrchestratorProtocol_];
  [a1 setExportedInterface:v7];

  id v8 = [v6 interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriAnalytics33ExtensionOrchestratorHostProtocol_];
  [a1 setRemoteObjectInterface:v8];

  aBlock[4] = sub_100001878;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100001A54;
  aBlock[3] = &unk_100004308;
  v9 = _Block_copy(aBlock);
  id v10 = [a1 remoteObjectProxyWithErrorHandler:v9];
  _Block_release(v9);
  sub_1000031C8();
  swift_unknownObjectRelease();
  sub_100001E64(&qword_1000087F0);
  uint64_t v11 = swift_dynamicCast();
  if (v11)
  {
    v12 = (objc_class *)type metadata accessor for ExtensionOrchestrator();
    id v13 = objc_allocWithZone(v12);
    swift_unknownObjectRetain();
    id v14 = v13;
    sub_1000030D8();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))((uint64_t)v14 + OBJC_IVAR____TtC23SAExtensionOrchestrator21ExtensionOrchestrator_orchestrator, v5, v2);

    v18.receiver = v14;
    v18.super_class = v12;
    id v15 = objc_msgSendSuper2(&v18, "init");
    [a1 setExportedObject:v15];
    [a1 resume];

    swift_unknownObjectRelease();
  }
  return v11;
}

uint64_t sub_100001E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100001E5C()
{
  return swift_release();
}

uint64_t sub_100001E64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100001EA8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100001EE0()
{
  uint64_t v0 = sub_100003148();
  sub_100002E54(v0, qword_1000088D8);
  sub_100001EA8(v0, (uint64_t)qword_1000088D8);
  return sub_100003138();
}

uint64_t sub_100001F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_100001E64(&qword_100008898);
  __chkstk_darwin();
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100008760 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100003148();
  sub_100001EA8(v8, (uint64_t)qword_1000088D8);
  v9 = sub_100003128();
  os_log_type_t v10 = sub_100003198();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Ingest called", v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = sub_100003188();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v3;
  v13[5] = a1;
  v13[6] = a2;
  id v14 = v3;
  swift_retain();
  sub_100002400((uint64_t)v7, (uint64_t)&unk_1000088A8, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_100002130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  id v7 = (void *)swift_task_alloc();
  v6[4] = v7;
  *id v7 = v6;
  v7[1] = sub_1000021D0;
  return Orchestrator.ingest()();
}

uint64_t sub_1000021D0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100002370;
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    uint64_t v5 = sub_1000022F8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000022F8()
{
  (*(void (**)(void, void))(v0 + 16))(*(void *)(v0 + 48), 0);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100002370()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (void (*)(void, uint64_t))v0[2];
  swift_errorRetain();
  v2(0, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100002400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003188();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100003178();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100002B30(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100003168();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100002630(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    sub_100003108();
    Class isa = sub_100003158().super.isa;
  }
  if (a2) {
    uint64_t v6 = sub_1000030C8();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

id sub_100002778()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionOrchestrator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000281C()
{
  return type metadata accessor for ExtensionOrchestrator();
}

uint64_t type metadata accessor for ExtensionOrchestrator()
{
  uint64_t result = qword_100008888;
  if (!qword_100008888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100002870()
{
  uint64_t result = sub_1000030F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100002900()
{
  swift_unknownObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100002948()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100002A3C;
  *(_OWORD *)(v2 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000021D0;
  return Orchestrator.ingest()();
}

uint64_t sub_100002A3C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002B30(uint64_t a1)
{
  uint64_t v2 = sub_100001E64(&qword_100008898);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100002B90(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100002C6C;
  return v6(a1);
}

uint64_t sub_100002C6C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002D64()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100002D9C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100002A3C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000088B0 + dword_1000088B0);
  return v6(a1, v4);
}

uint64_t *sub_100002E54(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002EB8(uint64_t a1)
{
  if (qword_100008760 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003148();
  sub_100001EA8(v2, (uint64_t)qword_1000088D8);
  uint64_t v3 = sub_100003128();
  os_log_type_t v4 = sub_100003198();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Publish called", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = sub_100003118();
  sub_100003030();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for OrchestratedExtensionError.notImplemented(_:), v6);
  uint64_t v8 = (void *)sub_1000030C8();
  (*(void (**)(uint64_t, void *))(a1 + 16))(a1, v8);

  return swift_errorRelease();
}

unint64_t sub_100003030()
{
  unint64_t result = qword_1000088C0;
  if (!qword_1000088C0)
  {
    sub_100003118();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000088C0);
  }
  return result;
}

uint64_t sub_100003088()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000030C0(objc_class *a1, uint64_t a2)
{
  sub_100002630(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000030C8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000030D8()
{
  return Orchestrator.init(host:)();
}

uint64_t sub_1000030F8()
{
  return type metadata accessor for Orchestrator();
}

uint64_t sub_100003108()
{
  return type metadata accessor for StagingReport();
}

uint64_t sub_100003118()
{
  return type metadata accessor for OrchestratedExtensionError();
}

uint64_t sub_100003128()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003138()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003148()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100003158()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100003168()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100003178()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100003188()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100003198()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000031A8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000031B8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000031C8()
{
  return _bridgeAnyObjectToAny(_:)();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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