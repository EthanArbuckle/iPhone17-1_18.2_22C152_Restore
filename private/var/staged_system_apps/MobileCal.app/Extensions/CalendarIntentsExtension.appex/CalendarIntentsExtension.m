id sub_100003108()
{
  id result;

  result = [objc_allocWithZone((Class)EKEventStore) initWithEKOptions:0x2000];
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_100003140@<X0>(void *a1@<X8>)
{
  id result = [objc_allocWithZone((Class)CalLinkREMStoreWrapper) init];
  *a1 = result;
  return result;
}

id sub_10000317C@<X0>(void *a1@<X8>)
{
  id result = [objc_allocWithZone((Class)CNContactStore) init];
  *a1 = result;
  return result;
}

uint64_t sub_1000031B8()
{
  uint64_t v0 = sub_100003960();
  sub_10000388C(v0, qword_100008530);
  sub_100003718(v0, (uint64_t)qword_100008530);
  return sub_100003950();
}

uint64_t sub_100003238(uint64_t a1)
{
  unint64_t v2 = sub_10000338C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000032E4()
{
  unint64_t result = qword_100008330;
  if (!qword_100008330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008330);
  }
  return result;
}

uint64_t sub_10000333C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000338C()
{
  unint64_t result = qword_100008338;
  if (!qword_100008338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008338);
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarIntentsExtension()
{
  return &type metadata for CalendarIntentsExtension;
}

id sub_1000033F0(uint64_t a1)
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v3 = (void *)v1(v2);
  swift_release();

  return v3;
}

uint64_t sub_100003440()
{
  if (qword_100008420 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100003960();
  sub_100003718(v0, (uint64_t)qword_100008530);
  v1 = sub_100003940();
  os_log_type_t v2 = sub_100003970();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Initializing", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = objc_allocWithZone((Class)EKEphemeralCacheEventStoreProvider);
  v11 = sub_100003108;
  uint64_t v12 = 0;
  *(void *)&long long v9 = _NSConcreteStackBlock;
  *((void *)&v9 + 1) = 1107296256;
  *(void *)&long long v10 = sub_1000033F0;
  *((void *)&v10 + 1) = &unk_1000042B0;
  v5 = _Block_copy(&v9);
  id v6 = [v4 initWithCreationBlock:v5];
  _Block_release(v5);
  swift_release();
  sub_100003910();
  sub_100003900();
  v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = v6;
  sub_1000037AC(&qword_1000083A0);
  sub_1000038F0();
  swift_release();
  swift_release();
  sub_1000037F0((uint64_t)&v9);
  sub_100003900();
  sub_100003850(0, &qword_1000083B0);
  long long v9 = 0u;
  long long v10 = 0u;
  v11 = 0;
  sub_1000038F0();
  swift_release();
  sub_1000037F0((uint64_t)&v9);
  sub_100003900();
  sub_100003850(0, &qword_1000083B8);
  long long v9 = 0u;
  long long v10 = 0u;
  v11 = 0;
  sub_1000038F0();

  swift_release();
  return sub_1000037F0((uint64_t)&v9);
}

uint64_t sub_100003718(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003750(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003760()
{
  return swift_release();
}

uint64_t sub_100003768()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000037A0@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return _swift_unknownObjectRetain();
}

uint64_t sub_1000037AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000037F0(uint64_t a1)
{
  uint64_t v2 = sub_1000037AC(&qword_1000083A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003850(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_10000388C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000038F0()
{
  return AppDependencyManager.add<A>(key:dependency:)();
}

uint64_t sub_100003900()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_100003910()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_100003930()
{
  return static AppExtension.main()();
}

uint64_t sub_100003940()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003950()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003960()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003970()
{
  return static os_log_type_t.default.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t self
{
  return _self;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}