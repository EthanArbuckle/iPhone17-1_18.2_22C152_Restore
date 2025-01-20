uint64_t sub_100005538()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter();
  v0[4] = v2;
  v0[5] = v1;
  return _swift_task_switch(sub_1000055CC, v2, v1);
}

uint64_t sub_1000055CC()
{
  *(void *)(v0 + 48) = type metadata accessor for Daemon();
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  void *v1 = v0;
  v1[1] = sub_1000056BC;
  return Daemon.__allocating_init(identifier:profile:services:)(0xD000000000000021, 0x800000010001F270, 0xD000000000000010, 0x800000010001F2A0, &unk_100028E20, 0);
}

uint64_t sub_1000056BC(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v4 = (void *)*v2;
  v3[8] = a1;
  v3[9] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v3[4];
    uint64_t v6 = v3[5];
    return _swift_task_switch(sub_100005A20, v5, v6);
  }
  else
  {
    v7 = (void *)swift_task_alloc();
    v3[10] = v7;
    uint64_t v8 = sub_1000073F4(&qword_100028E30, (void (*)(uint64_t))&type metadata accessor for Daemon);
    void *v7 = v4;
    v7[1] = sub_100005878;
    uint64_t v9 = v3[6];
    return ActorServiceDaemon.run()(v9, v8);
  }
}

uint64_t sub_100005878()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v5 = sub_100005C20;
  }
  else {
    uint64_t v5 = sub_1000059B4;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000059B4()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005A20()
{
  if (qword_100028D30 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006394(v1, (uint64_t)qword_100029AF0);
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    uint64_t v6 = _convertErrorToNSError(_:)();
    *(void *)(v0 + 16) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error creating Daemon instance: %@", v4, 0xCu);
    sub_100006974(&qword_100028E28);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100005C20()
{
  swift_release();
  if (qword_100028D30 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006394(v1, (uint64_t)qword_100029AF0);
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    uint64_t v6 = _convertErrorToNSError(_:)();
    *(void *)(v0 + 16) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error creating Daemon instance: %@", v4, 0xCu);
    sub_100006974(&qword_100028E28);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100005E28()
{
  os_log_type_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100028E38 + dword_100028E38);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000077CC;
  return v3();
}

uint64_t sub_100005EC8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029AF0);
  sub_100006394(v0, (uint64_t)qword_100029AF0);
  return Logger.init(subsystem:category:)();
}

int main(int argc, const char **argv, const char **envp)
{
  swift_task_create();
  swift_task_getMainExecutor();
  swift_job_run();
  int result = swift_task_asyncMainDrainQueue();
  __break(1u);
  return result;
}

uint64_t sub_100005F9C()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100006040;
  return sub_100005538();
}

uint64_t sub_100006040()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000617C, v1, v0);
}

void sub_10000617C()
{
}

uint64_t sub_1000061B4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100006298;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100028E38 + dword_100028E38);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_1000077CC;
  return v4();
}

uint64_t sub_100006298(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100006394(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000063CC(uint64_t a1)
{
  uint64_t v2 = sub_1000073F4(&qword_100028EA0, type metadata accessor for SPBeaconManagerError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100006438(uint64_t a1)
{
  uint64_t v2 = sub_1000073F4(&qword_100028EA0, type metadata accessor for SPBeaconManagerError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000064A8(uint64_t a1)
{
  uint64_t v2 = sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100006514()
{
  return *v0;
}

uint64_t sub_10000651C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100006524()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(SPBeaconManagerErrorDomain);
}

uint64_t sub_100006534(uint64_t a1)
{
  uint64_t v2 = sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000065A0(uint64_t a1)
{
  uint64_t v2 = sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10000660C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_10000669C()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000066D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100006750()
{
  return Hasher._finalize()();
}

void *sub_1000067B0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000067C0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000067CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100006850(void *a1, void *a2)
{
  return *a1 == *a2;
}

char *sub_100006864(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006974(&qword_100028E60);
      v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006A1C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006974(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_1000069B8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006A1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_100006974(&qword_100028E68);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006B28()
{
  return _swift_task_switch(sub_100006B44, 0, 0);
}

uint64_t sub_100006B44()
{
  type metadata accessor for LocalBeaconing();
  uint64_t v1 = swift_allocObject();
  swift_defaultActor_initialize();
  strcpy((char *)(v1 + 112), "LocalBeaconing");
  *(unsigned char *)(v1 + 127) = -18;
  uint64_t v2 = v1 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  uint64_t v3 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_initialFetchComplete) = 0;
  uint64_t v4 = sub_100006864(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v6 = *((void *)v4 + 2);
  unint64_t v5 = *((void *)v4 + 3);
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_100006864((char *)(v5 > 1), v6 + 1, 1, v4);
  }
  v0[4] = v4;
  uint64_t v7 = sub_1000073F4((unint64_t *)&unk_100028E40, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *((void *)v4 + 2) = v6 + 1;
  uint64_t v8 = &v4[16 * v6];
  *((void *)v8 + 4) = v1;
  *((void *)v8 + 5) = v7;
  type metadata accessor for LocalBeaconingXPCService();
  uint64_t v9 = swift_allocObject();
  v0[5] = v9;
  swift_defaultActor_initialize();
  *(void *)(v9 + 112) = 0xD000000000000018;
  *(void *)(v9 + 120) = 0x800000010001F320;
  v0[6] = type metadata accessor for XPCSessionManager();
  v10 = (void *)swift_task_alloc();
  v0[7] = v10;
  void *v10 = v0;
  v10[1] = sub_100006D60;
  return XPCSessionManager.__allocating_init(name:)(0xD000000000000018, 0x800000010001F320);
}

uint64_t sub_100006D60(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  swift_task_dealloc();
  *(void *)(v3 + 128) = a1;
  return _swift_task_switch(sub_100006E78, 0, 0);
}

uint64_t sub_100006E78()
{
  uint64_t v1 = *(char **)(v0 + 32);
  unint64_t v3 = *((void *)v1 + 2);
  unint64_t v2 = *((void *)v1 + 3);
  if (v3 >= v2 >> 1) {
    uint64_t v1 = sub_100006864((char *)(v2 > 1), v3 + 1, 1, *(char **)(v0 + 32));
  }
  *(void *)(v0 + 64) = v1;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = sub_1000073F4(&qword_100029980, (void (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService);
  *((void *)v1 + 2) = v3 + 1;
  unint64_t v6 = &v1[16 * v3];
  *((void *)v6 + 4) = v4;
  *((void *)v6 + 5) = v5;
  type metadata accessor for SearchPartyPushXPCService();
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 72) = v7;
  swift_defaultActor_initialize();
  *(void *)(v7 + 112) = 0xD000000000000016;
  *(void *)(v7 + 120) = 0x800000010001F340;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_100006FD8;
  return XPCSessionManager.__allocating_init(name:)(0xD000000000000016, 0x800000010001F340);
}

uint64_t sub_100006FD8(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 72);
  swift_task_dealloc();
  *(void *)(v3 + 128) = a1;
  return _swift_task_switch(sub_1000070F0, 0, 0);
}

uint64_t sub_1000070F0()
{
  uint64_t v1 = *(char **)(v0 + 64);
  unint64_t v3 = *((void *)v1 + 2);
  unint64_t v2 = *((void *)v1 + 3);
  if (v3 >= v2 >> 1) {
    uint64_t v1 = sub_100006864((char *)(v2 > 1), v3 + 1, 1, *(char **)(v0 + 64));
  }
  *(void *)(v0 + 88) = v1;
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = sub_1000073F4(&qword_100028E50, (void (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService);
  *((void *)v1 + 2) = v3 + 1;
  unint64_t v6 = &v1[16 * v3];
  *((void *)v6 + 4) = v4;
  *((void *)v6 + 5) = v5;
  type metadata accessor for StorageService();
  swift_allocObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v7;
  void *v7 = v0;
  v7[1] = sub_100007218;
  return sub_10000CBF8();
}

uint64_t sub_100007218(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100007318, 0, 0);
}

uint64_t sub_100007318()
{
  uint64_t v1 = *(char **)(v0 + 88);
  unint64_t v3 = *((void *)v1 + 2);
  unint64_t v2 = *((void *)v1 + 3);
  if (v3 >= v2 >> 1) {
    uint64_t v1 = sub_100006864((char *)(v2 > 1), v3 + 1, 1, *(char **)(v0 + 88));
  }
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = sub_1000073F4(&qword_100028E58, (void (*)(uint64_t))type metadata accessor for StorageService);
  *((void *)v1 + 2) = v3 + 1;
  unint64_t v6 = &v1[16 * v3];
  *((void *)v6 + 4) = v4;
  *((void *)v6 + 5) = v5;
  uint64_t v7 = *(uint64_t (**)(char *))(v0 + 8);
  return v7(v1);
}

uint64_t sub_1000073F4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for LocalBeaconManagerState(uint64_t a1)
{
}

void type metadata accessor for BeaconingKeyType(uint64_t a1)
{
}

void type metadata accessor for SPBeaconManagerError(uint64_t a1)
{
}

uint64_t sub_100007490()
{
  return sub_1000073F4(&qword_100028E90, type metadata accessor for SPBeaconManagerError);
}

uint64_t sub_1000074D8()
{
  return sub_1000073F4(&qword_100028E98, type metadata accessor for SPBeaconManagerError);
}

uint64_t sub_100007520()
{
  return sub_1000073F4(&qword_100028EA0, type metadata accessor for SPBeaconManagerError);
}

uint64_t sub_100007568()
{
  return sub_1000073F4(&qword_100028EA8, type metadata accessor for SPBeaconManagerError);
}

uint64_t sub_1000075B0()
{
  return sub_1000073F4(&qword_100028EB0, type metadata accessor for SPBeaconManagerError);
}

uint64_t sub_1000075F8()
{
  return sub_1000073F4(&qword_100028EB8, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100007654(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000769C()
{
  return sub_1000073F4(&qword_100028EC0, type metadata accessor for Code);
}

unint64_t sub_1000076E8()
{
  unint64_t result = qword_100028EC8;
  if (!qword_100028EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028EC8);
  }
  return result;
}

uint64_t sub_10000773C()
{
  return sub_1000073F4((unint64_t *)&unk_100028ED0, type metadata accessor for Code);
}

uint64_t sub_100007784()
{
  return sub_1000073F4(&qword_1000299A0, type metadata accessor for SPBeaconManagerError);
}

uint64_t *sub_1000077D0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    int64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for PublicKey();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    uint64_t v20 = type metadata accessor for SharedSecretKey();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_100007990(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = type metadata accessor for PublicKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = type metadata accessor for SharedSecretKey();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);

  return v12(v10, v11);
}

uint64_t sub_100007AE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for PublicKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for SharedSecretKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_100007C54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for PublicKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for SharedSecretKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t sub_100007DC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for PublicKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for SharedSecretKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t sub_100007F34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for PublicKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for SharedSecretKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_1000080A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000080B8);
}

uint64_t sub_1000080B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for Date();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[6];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = type metadata accessor for PublicKey();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_7;
  }
  uint64_t v16 = type metadata accessor for SharedSecretKey();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + a3[8];

  return v17(v19, a2, v18);
}

uint64_t sub_100008250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008264);
}

uint64_t sub_100008264(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for Date();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t v16 = type metadata accessor for PublicKey();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_7;
  }
  uint64_t v18 = type metadata accessor for SharedSecretKey();
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[8];

  return v19(v21, a2, a2, v20);
}

uint64_t type metadata accessor for LocalBeaconKeyInfo()
{
  uint64_t result = qword_100028FA8;
  if (!qword_100028FA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

{
  return type metadata accessor for LocalBeaconKeyInfo();
}

uint64_t sub_100008454()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Date();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for PublicKey();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for SharedSecretKey();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100008594()
{
  _StringGuts.grow(_:)(44);
  v0._countAndFlagsBits = 0x203A726961703CLL;
  v0._object = (void *)0xE700000000000000;
  String.append(_:)(v0);
  type metadata accessor for LocalBeaconKeyInfo();
  type metadata accessor for Date();
  sub_10000A300(&qword_100029058, (void (*)(uint64_t))&type metadata accessor for Date);
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x4B63696C62757020;
  v2._object = (void *)0xEC000000203A7965;
  String.append(_:)(v2);
  type metadata accessor for PublicKey();
  _print_unlocked<A, B>(_:_:)();
  v3._object = (void *)0x800000010001F400;
  v3._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v3);
  type metadata accessor for SharedSecretKey();
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

unint64_t sub_100008730(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6574614472696170;
      break;
    case 3:
      unint64_t result = 0x654B63696C627570;
      break;
    case 4:
      unint64_t result = 0x6553646572616873;
      break;
    default:
      unint64_t result = 0x6E65644972657375;
      break;
  }
  return result;
}

BOOL sub_100008800(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008814()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000885C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100008888()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_1000088CC()
{
  return sub_100008730(*v0);
}

uint64_t sub_1000088D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000A608(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000088FC()
{
  return 0;
}

void sub_100008908(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100008914(uint64_t a1)
{
  unint64_t v2 = sub_10000A19C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008950(uint64_t a1)
{
  unint64_t v2 = sub_10000A19C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000898C(void *a1)
{
  uint64_t v3 = sub_100006974(&qword_100029030);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A158(a1, a1[3]);
  sub_10000A19C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  type metadata accessor for UUID();
  sub_10000A300(&qword_100029038, (void (*)(uint64_t))&type metadata accessor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for LocalBeaconKeyInfo();
    char v12 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v11 = 2;
    type metadata accessor for Date();
    sub_10000A300(&qword_100029040, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v10 = 3;
    type metadata accessor for PublicKey();
    sub_10000A300(&qword_100029048, (void (*)(uint64_t))&type metadata accessor for PublicKey);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v9 = 4;
    type metadata accessor for SharedSecretKey();
    sub_10000A300(&qword_100029050, (void (*)(uint64_t))&type metadata accessor for SharedSecretKey);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100008CBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v36 = type metadata accessor for SharedSecretKey();
  uint64_t v33 = *(void *)(v36 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v35 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for PublicKey();
  uint64_t v39 = *(void *)(v41 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v37 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for Date();
  uint64_t v40 = *(void *)(v43 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v38 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v45 = (char *)&v31 - v10;
  uint64_t v47 = sub_100006974(&qword_100029000);
  uint64_t v42 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  char v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (int *)type metadata accessor for LocalBeaconKeyInfo();
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A158(a1, a1[3]);
  sub_10000A19C();
  v46 = v12;
  uint64_t v16 = (uint64_t)v48;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v16) {
    return sub_10000A1F0((uint64_t)a1);
  }
  uint64_t v17 = v9;
  v32 = v15;
  uint64_t v18 = v43;
  uint64_t v19 = v44;
  v48 = a1;
  char v53 = 0;
  sub_10000A300(&qword_100029010, (void (*)(uint64_t))&type metadata accessor for UUID);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v20 = v6;
  uint64_t v21 = (uint64_t)v32;
  v22 = v45;
  v45 = *(char **)(v19 + 32);
  ((void (*)(char *, char *, uint64_t))v45)(v32, v22, v20);
  char v52 = 1;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  ((void (*)(uint64_t, char *, uint64_t))v45)(v21 + v13[5], v17, v20);
  char v51 = 2;
  sub_10000A300(&qword_100029018, (void (*)(uint64_t))&type metadata accessor for Date);
  v23 = v38;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v24 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v21 + v13[6], v23, v18);
  char v50 = 3;
  sub_10000A300(&qword_100029020, (void (*)(uint64_t))&type metadata accessor for PublicKey);
  v25 = v37;
  uint64_t v26 = v41;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v27 = v13;
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v24 + v13[7], v25, v26);
  char v49 = 4;
  sub_10000A300(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for SharedSecretKey);
  v29 = v35;
  uint64_t v28 = v36;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v46, v47);
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v24 + v27[8], v29, v28);
  sub_10000A240(v24, v34);
  sub_10000A1F0((uint64_t)v48);
  return sub_10000A2A4(v24);
}

uint64_t sub_100009464@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008CBC(a1, a2);
}

uint64_t sub_10000947C(void *a1)
{
  return sub_10000898C(a1);
}

uint64_t sub_10000949C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = type metadata accessor for SharedSecretKey();
  uint64_t v19 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v20 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PublicKey();
  uint64_t v22 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalBeaconKeyInfo.userIdentifier.getter();
  char v9 = (int *)type metadata accessor for LocalBeaconKeyInfo();
  uint64_t v10 = a2 + v9[5];
  LocalBeaconKeyInfo.beaconIdentifier.getter();
  uint64_t v11 = a2 + v9[6];
  LocalBeaconKeyInfo.pairDate.getter();
  LocalBeaconKeyInfo.publicKey.getter();
  PublicKey.init(data:)();
  if (v2)
  {
    uint64_t v21 = v6;
    uint64_t v12 = type metadata accessor for LocalBeaconKeyInfo();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    uint64_t v13 = type metadata accessor for UUID();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
    v14(a2, v13);
    v14(v10, v13);
    uint64_t v15 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v11, v15);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(a2 + v9[7], v8, v6);
    LocalBeaconKeyInfo.sharedSecretKey.getter();
    sub_10000A300(&qword_100029060, (void (*)(uint64_t))&type metadata accessor for SharedSecretKey);
    KeyRepresentable<>.init(data:)();
    uint64_t v16 = type metadata accessor for LocalBeaconKeyInfo();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a2 + v9[8], v20, v21);
  }
}

uint64_t sub_100009808@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_10000A100(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x100009A6CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_10000A0A8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_100009A7C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_10000A100(a1, a2);
      char v5 = sub_100009CAC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_10000A0A8(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_100009CAC(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_10000A0A8(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_100009808((uint64_t)__s1, a3, a4, &v14);
      sub_10000A0A8(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_100009CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  sub_100009808(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100009D64(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x100009EA0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_10000A100(a3, a4);
              char v15 = sub_100009A7C(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_100009EC0()
{
  if ((static UUID.== infix(_:_:)() & 1) == 0) {
    goto LABEL_6;
  }
  type metadata accessor for LocalBeaconKeyInfo();
  if ((static UUID.== infix(_:_:)() & 1) == 0) {
    goto LABEL_6;
  }
  if ((static Date.== infix(_:_:)() & 1) != 0
    && (type metadata accessor for PublicKey(),
        sub_10000A300(&qword_100028FF0, (void (*)(uint64_t))&type metadata accessor for PublicKey),
        dispatch thunk of RawRepresentable.rawValue.getter(),
        dispatch thunk of RawRepresentable.rawValue.getter(),
        char v0 = sub_100009D64(v5, v6, v3, v4),
        sub_10000A0A8(v3, v4),
        sub_10000A0A8(v5, v6),
        (v0 & 1) != 0))
  {
    type metadata accessor for SharedSecretKey();
    sub_10000A300(&qword_100028FF8, (void (*)(uint64_t))&type metadata accessor for SharedSecretKey);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    char v1 = sub_100009D64(v5, v6, v3, v4);
    sub_10000A0A8(v3, v4);
    sub_10000A0A8(v5, v6);
  }
  else
  {
LABEL_6:
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_10000A0A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10000A100(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

void *sub_10000A158(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000A19C()
{
  unint64_t result = qword_100029008;
  if (!qword_100029008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029008);
  }
  return result;
}

uint64_t sub_10000A1F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A2A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A300(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LocalBeaconKeyInfo.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalBeaconKeyInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LocalBeaconKeyInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000A4B4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000A4DC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A4E8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalBeaconKeyInfo.CodingKeys()
{
  return &type metadata for LocalBeaconKeyInfo.CodingKeys;
}

unint64_t sub_10000A504()
{
  unint64_t result = qword_100029068;
  if (!qword_100029068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029068);
  }
  return result;
}

unint64_t sub_10000A55C()
{
  unint64_t result = qword_100029070;
  if (!qword_100029070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029070);
  }
  return result;
}

unint64_t sub_10000A5B4()
{
  unint64_t result = qword_100029078;
  if (!qword_100029078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029078);
  }
  return result;
}

uint64_t sub_10000A608(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E65644972657375 && a2 == 0xEE00726569666974;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010001F420 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574614472696170 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6553646572616873 && a2 == 0xEF79654B74657263)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10000A840()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029B08);
  uint64_t v1 = sub_100006394(v0, (uint64_t)qword_100029B08);
  if (qword_100028D78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006394(v0, (uint64_t)qword_100029BC8);
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10000A908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DatabaseState();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_10000A978(uint64_t a1, char a2)
{
  uint64_t v4 = v2;
  v3[2] = a1;
  v3[3] = v2;
  uint64_t v7 = type metadata accessor for DatabaseState();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = swift_task_alloc();
  v3[4] = v9;
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v9, enum case for DatabaseState.unavailable(_:), v7);
  sub_100006974(&qword_100029248);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + ((*(unsigned int *)(*(void *)v10 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v10 + 16), v9, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
  v4[14] = v10;
  sub_100006974(&qword_100029250);
  swift_allocObject();
  v4[15] = AsyncStreamProvider.init()();
  v4[16] = 0;
  *(_DWORD *)((char *)v4 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_currentVersion) = 1;
  BOOL v11 = (char *)v4 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_baseContainerURL;
  uint64_t v12 = type metadata accessor for URL();
  v3[5] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[6] = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a1, v12);
  *((unsigned char *)v4 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_temporary) = a2;
  return _swift_task_switch(sub_10000AC0C, v4, 0);
}

uint64_t sub_10000AC0C()
{
  (*(void (**)(void, void))(v0[6] + 8))(v0[2], v0[5]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[3];
  return v1(v2);
}

uint64_t sub_10000AC90()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10000AD44()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_baseContainerURL;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_10000ADD8()
{
  return type metadata accessor for StorageDatabase();
}

uint64_t type metadata accessor for StorageDatabase()
{
  uint64_t result = qword_1000290A8;
  if (!qword_1000290A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000AE2C()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000AEF8()
{
  return sub_10000CBB4((unint64_t *)&unk_100029198);
}

uint64_t sub_10000AF2C()
{
  return v0;
}

uint64_t sub_10000AF38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_baseContainerURL;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_10000AFAC()
{
  return swift_retain();
}

uint64_t sub_10000AFE4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 128) = a1;
  return swift_release();
}

uint64_t (*sub_10000B02C())()
{
  return j__swift_endAccess;
}

void sub_10000B084(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = v3 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_10000A908(v4, a1);

  os_unfair_lock_unlock(v5);
}

uint64_t sub_10000B134()
{
  sub_100006974(&qword_100029230);
  uint64_t v1 = *(void *)(type metadata accessor for DatabaseState() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001E910;
  uint64_t v4 = v3 + v2;
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = v5 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v5 + 16);
  uint64_t v7 = (os_unfair_lock_s *)(v5 + ((*(unsigned int *)(*(void *)v5 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  sub_10000A908(v6, v4);
  os_unfair_lock_unlock(v7);
  AsyncStreamProvider.stream(initialEvents:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B290()
{
  return 1;
}

uint64_t sub_10000B298()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_temporary);
}

uint64_t sub_10000B2A8()
{
  return sub_10000C4F0();
}

uint64_t sub_10000B2C0()
{
  return sub_10000AC90();
}

void sub_10000B2D8()
{
}

uint64_t sub_10000B310()
{
  uint64_t v1 = type metadata accessor for DatabaseState();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = v5 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v5 + 16);
  uint64_t v7 = (os_unfair_lock_s *)(v5 + ((*(unsigned int *)(*(void *)v5 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  sub_10000BBB0(v6);
  os_unfair_lock_unlock(v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for DatabaseState.available(_:), v1);
  AsyncStreamProvider.yield(value:transaction:)();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_10000B488(int a1, int a2)
{
}

void sub_10000B4A0()
{
}

void sub_10000B4D8()
{
}

void sub_10000B510()
{
}

uint64_t sub_10000B548()
{
  return Database.description.getter();
}

uint64_t sub_10000B5A0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = type metadata accessor for StorageDatabase();
  uint64_t v3 = sub_10000CBB4(&qword_100029238);
  void *v1 = v0;
  v1[1] = sub_10000B670;
  return Database.isolatedDescription.getter(v2, v3);
}

uint64_t sub_10000B670(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_10000B774()
{
  return sub_10000CBB4(&qword_1000291A8);
}

uint64_t sub_10000B7A8()
{
  return sub_10000CBB4(&qword_1000291B0);
}

uint64_t sub_10000B7DC()
{
  uint64_t v0 = type metadata accessor for Table();
  sub_1000069B8(v0, qword_100029B20);
  sub_100006394(v0, (uint64_t)qword_100029B20);
  return Table.init(_:database:)();
}

uint64_t sub_10000B848()
{
  uint64_t v0 = sub_100006974(&qword_1000291E0);
  sub_1000069B8(v0, qword_100029B38);
  sub_100006394(v0, (uint64_t)qword_100029B38);
  sub_10000CB10(&qword_100029220, &qword_1000291E0);
  return ExpressionType.init(_:)();
}

uint64_t sub_10000B8D4()
{
  uint64_t v0 = sub_100006974(&qword_1000291F0);
  sub_1000069B8(v0, qword_100029B50);
  sub_100006394(v0, (uint64_t)qword_100029B50);
  sub_10000CB10(&qword_100029218, &qword_1000291F0);
  return ExpressionType.init(_:)();
}

uint64_t sub_10000B96C()
{
  uint64_t v0 = sub_100006974(&qword_1000291F0);
  sub_1000069B8(v0, qword_100029B68);
  sub_100006394(v0, (uint64_t)qword_100029B68);
  sub_10000CB10(&qword_100029218, &qword_1000291F0);
  return ExpressionType.init(_:)();
}

uint64_t sub_10000B9FC()
{
  uint64_t v0 = sub_100006974(&qword_1000291F8);
  sub_1000069B8(v0, qword_100029B80);
  sub_100006394(v0, (uint64_t)qword_100029B80);
  sub_10000CB10(&qword_100029210, &qword_1000291F8);
  return ExpressionType.init(_:)();
}

uint64_t sub_10000BA88()
{
  uint64_t v0 = sub_100006974(&qword_100029200);
  sub_1000069B8(v0, qword_100029B98);
  sub_100006394(v0, (uint64_t)qword_100029B98);
  sub_10000CB10(&qword_100029208, &qword_100029200);
  return ExpressionType.init(_:)();
}

uint64_t sub_10000BB18()
{
  uint64_t v0 = sub_100006974(&qword_100029200);
  sub_1000069B8(v0, qword_100029BB0);
  sub_100006394(v0, (uint64_t)qword_100029BB0);
  sub_10000CB10(&qword_100029208, &qword_100029200);
  return ExpressionType.init(_:)();
}

uint64_t sub_10000BBB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DatabaseState();
  uint64_t v3 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 104))(a1, enum case for DatabaseState.available(_:), v2);
}

uint64_t sub_10000BC6C()
{
  if (qword_100028D40 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Table();
  sub_100006394(v1, (uint64_t)qword_100029B20);
  Table.create(temporary:ifNotExists:withoutRowid:block:)();
  Connection.run(_:_:)();
  if (v0) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10000BD4C()
{
  uint64_t v0 = sub_100006974(&qword_1000291B8);
  __chkstk_darwin(v0 - 8);
  char v28 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006974(&qword_1000291C0);
  __chkstk_darwin(v2 - 8);
  char v27 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006974(&qword_1000291C8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006974(&qword_1000291D0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006974(&qword_1000291D8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028D48 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100006974(&qword_1000291E0);
  sub_100006394(v13, (uint64_t)qword_100029B38);
  uint64_t v14 = sub_100006974(&qword_1000291E8);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  uint64_t v17 = v15 + 56;
  v16(v12, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  TableBuilder.column<A>(_:primaryKey:check:defaultValue:)();
  sub_10000CA6C((uint64_t)v9, &qword_1000291D0);
  sub_10000CA6C((uint64_t)v12, &qword_1000291D8);
  if (qword_100028D50 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_100006974(&qword_1000291F0);
  sub_100006394(v18, (uint64_t)qword_100029B50);
  v16(v12, 1, 1, v14);
  BOOL v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v29 = v17;
  v19(v6, 1, 1, v18);
  type metadata accessor for UUID();
  TableBuilder.column<A>(_:unique:check:defaultValue:)();
  sub_10000CA6C((uint64_t)v6, &qword_1000291C8);
  sub_10000CA6C((uint64_t)v12, &qword_1000291D8);
  if (qword_100028D58 != -1) {
    swift_once();
  }
  sub_100006394(v18, (uint64_t)qword_100029B68);
  v16(v12, 1, 1, v14);
  v19(v6, 1, 1, v18);
  TableBuilder.column<A>(_:unique:check:defaultValue:)();
  sub_10000CA6C((uint64_t)v6, &qword_1000291C8);
  sub_10000CA6C((uint64_t)v12, &qword_1000291D8);
  if (qword_100028D60 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100006974(&qword_1000291F8);
  sub_100006394(v20, (uint64_t)qword_100029B80);
  v16(v12, 1, 1, v14);
  uint64_t v21 = (uint64_t)v27;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v27, 1, 1, v20);
  type metadata accessor for Date();
  TableBuilder.column<A>(_:unique:check:defaultValue:)();
  sub_10000CA6C(v21, &qword_1000291C0);
  sub_10000CA6C((uint64_t)v12, &qword_1000291D8);
  uint64_t v22 = (uint64_t)v28;
  if (qword_100028D68 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_100006974(&qword_100029200);
  sub_100006394(v23, (uint64_t)qword_100029B98);
  v16(v12, 1, 1, v14);
  char v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  v24(v22, 1, 1, v23);
  TableBuilder.column<A>(_:unique:check:defaultValue:)();
  sub_10000CA6C(v22, &qword_1000291B8);
  sub_10000CA6C((uint64_t)v12, &qword_1000291D8);
  if (qword_100028D70 != -1) {
    swift_once();
  }
  sub_100006394(v23, (uint64_t)qword_100029BB0);
  v16(v12, 1, 1, v14);
  v24(v22, 1, 1, v23);
  TableBuilder.column<A>(_:unique:check:defaultValue:)();
  sub_10000CA6C(v22, &qword_1000291B8);
  return sub_10000CA6C((uint64_t)v12, &qword_1000291D8);
}

uint64_t sub_10000C46C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029BC8);
  sub_100006394(v0, (uint64_t)qword_100029BC8);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000C4F0()
{
  uint64_t v2 = type metadata accessor for Keychain.DataProtectionClass();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = static Keychain.data(account:service:)();
  if (!v1)
  {
    if (v7 >> 60 == 15)
    {
      uint64_t v0 = static Data.random(bytes:)();
      unint64_t v9 = v8;
      v11[0] = v0;
      v11[1] = v8;
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Keychain.DataProtectionClass.d(_:), v2);
      sub_10000A100(v0, v9);
      sub_10000CB60();
      static Keychain.set<A>(data:account:service:dataProtectionClass:)();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_10000A0A8(v0, v9);
    }
    else
    {
      return v6;
    }
  }
  return v0;
}

void sub_10000C6F4(int a1, int a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028D38 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100006394(v8, (uint64_t)qword_100029B08);
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (_DWORD *)swift_slowAlloc();
    uint64_t v21 = v7;
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v14 = v11;
    *uint64_t v11 = 67109376;
    LODWORD(v22) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v14 + 4) = 1024;
    LODWORD(v22) = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Migrate schema %d -> %d", (uint8_t *)v14, 0xEu);
    uint64_t v5 = v13;
    uint64_t v4 = v12;
    unint64_t v7 = v21;
    swift_slowDealloc();
  }

  if (a2 == 1)
  {
    v15._countAndFlagsBits = 0xD00000000000001FLL;
    v15._object = (void *)0x800000010001F520;
    Connection.execute(_:)(v15);
    if (!v16)
    {
      v17._countAndFlagsBits = 0xD000000000000018;
      v17._object = (void *)0x800000010001F540;
      Connection.execute(_:)(v17);
      if (!v18)
      {
        UUID.init()();
        UUID.uuidString.getter();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        Connection.savepoint(_:block:)();
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    unint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    unint64_t v22 = 0xD000000000000013;
    unint64_t v23 = 0x800000010001F500;
    int v24 = a2;
    v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t sub_10000CA50()
{
  return sub_10000BC6C();
}

uint64_t sub_10000CA6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006974(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000CAC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000CB10(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CAC8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000CB60()
{
  unint64_t result = qword_100029228;
  if (!qword_100029228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029228);
  }
  return result;
}

uint64_t sub_10000CBB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for StorageDatabase();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CBF8()
{
  v1[5] = v0;
  sub_100006974(&qword_100029358);
  v1[6] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for URL.DirectoryHint();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  swift_defaultActor_initialize();
  strcpy((char *)(v0 + 112), "StorageService");
  *(unsigned char *)(v0 + 127) = -18;
  uint64_t v4 = (void *)swift_task_alloc();
  v1[14] = v4;
  void *v4 = v1;
  v4[1] = sub_10000CDB0;
  return daemon.getter();
}

uint64_t sub_10000CDB0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  type metadata accessor for Daemon();
  sub_10000DA34(&qword_100029360, 255, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000CF0C, v3, v2);
}

uint64_t sub_10000CF0C()
{
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v5 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v15 = v0[7];
  uint64_t v16 = v0[12];
  uint64_t v7 = Daemon.identifier.getter();
  unint64_t v9 = v8;
  swift_release();
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 47;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for URL.DirectoryHint.isDirectory(_:), v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v6, 1, 1, v3);
  URL.init(filePath:directoryHint:relativeTo:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v16, v1, v3);
  type metadata accessor for StorageDatabase();
  swift_allocObject();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[16] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_10000D0E8;
  uint64_t v13 = v0[12];
  return sub_10000A978(v13, 0);
}

uint64_t sub_10000D0E8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  if (v3)
  {
    (*(void (**)(void, void))(v5[11] + 8))(v5[13], v5[10]);
    _StringGuts.grow(_:)(48);
    v5[2] = 0;
    v5[3] = 0xE000000000000000;
    v6._object = (void *)0x800000010001F610;
    v6._countAndFlagsBits = 0xD00000000000002ELL;
    String.append(_:)(v6);
    v5[4] = v3;
    sub_100006974(&qword_100029368);
    _print_unlocked<A, B>(_:_:)();
    return _assertionFailure(_:_:file:line:flags:)();
  }
  else
  {
    *(void *)(v5[5] + 128) = a1;
    type metadata accessor for StorageStore();
    uint64_t v8 = swift_allocObject();
    v5[17] = v8;
    swift_retain();
    swift_defaultActor_initialize();
    *(void *)(v8 + 112) = a1;
    return _swift_task_switch(sub_10000D318, v8, 0);
  }
}

uint64_t sub_10000D318()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v1 + 136) = *(void *)(v0 + 136);
  return _swift_task_switch(sub_10000D33C, v1, 0);
}

uint64_t sub_10000D33C()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[13], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[5];
  return v1(v2);
}

uint64_t sub_10000D3E4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for StorageService()
{
  return self;
}

uint64_t sub_10000D450()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000D480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for StorageService();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_10000D528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for StorageService();
  *uint64_t v8 = v4;
  v8[1] = sub_10000DA7C;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_10000D5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for StorageService();
  void *v4 = v2;
  v4[1] = sub_10000D694;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_10000D694()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D788()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_10000D7A8, v0, 0);
}

uint64_t sub_10000D7A8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 128);
  *(void *)(v0 + 24) = v1;
  return _swift_task_switch(sub_10000D7CC, v1, 0);
}

uint64_t sub_10000D7CC()
{
  type metadata accessor for StorageDatabase();
  sub_10000DA34(&qword_100029238, 255, (void (*)(uint64_t))type metadata accessor for StorageDatabase);
  Database.startup()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000D894(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for StorageService();
  void *v4 = v2;
  v4[1] = sub_10000D694;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_10000D93C()
{
  type metadata accessor for StorageService();
  sub_10000DA34(&qword_100028E58, v0, (void (*)(uint64_t))type metadata accessor for StorageService);
  return ActorServiceProtocol.description.getter();
}

uint64_t sub_10000D9A4(uint64_t a1, uint64_t a2)
{
  return sub_10000DA34(&qword_100029318, a2, (void (*)(uint64_t))type metadata accessor for StorageService);
}

uint64_t sub_10000D9EC(uint64_t a1, uint64_t a2)
{
  return sub_10000DA34(qword_100029320, a2, (void (*)(uint64_t))type metadata accessor for StorageService);
}

uint64_t sub_10000DA34(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000DA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a5;
  return _swift_task_switch(sub_10000DAA0, a4, 0);
}

uint64_t sub_10000DAA0()
{
  sub_100010A5C();
  if (NSXPCConnection.hasEntitlement<A>(_:)())
  {
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    return _swift_task_switch(sub_10000DB4C, 0, 0);
  }
}

uint64_t sub_10000DB4C()
{
  [*(id *)(v0 + 16) invalidate];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000DBB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000CA6C(a1, &qword_100029520);
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

uint64_t sub_10000DD60(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000CA6C(a1, &qword_100029520);
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
  sub_100006974(&qword_100029568);
  return swift_task_create();
}

uint64_t sub_10000DF14()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for SearchPartyPushXPCService()
{
  return self;
}

uint64_t sub_10000DF7C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10000DFC0()
{
  v1[4] = v0;
  uint64_t v2 = type metadata accessor for XPCServiceDescription();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for MachServiceName();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return _swift_task_switch(sub_10000E0EC, v0, 0);
}

uint64_t sub_10000E0EC()
{
  id receiver = v0[5].receiver;
  Class super_class = v0[5].super_class;
  id v3 = v0[4].receiver;
  Class v4 = v0[4].super_class;
  MachServiceName.init(_:)();
  id v5 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP7SPOwner33FindMyBeaconDaemonPushXPCProtocol_];
  v0[6].id receiver = v5;
  uint64_t v6 = (objc_class *)sub_100006974(&qword_100029500);
  id v7 = objc_allocWithZone(v6);
  swift_weakInit();
  swift_weakAssign();
  v0[1].id receiver = v7;
  v0[1].Class super_class = v6;
  uint64_t v8 = (objc_class *)[v0 + 1 init];
  v0[6].Class super_class = v8;
  (*((void (**)(id, Class, id))v4 + 2))(receiver, super_class, v3);
  uint64_t v9 = v8;
  id v10 = v5;
  swift_retain();
  XPCServiceDescription.init(name:exportedObject:exportedInterface:options:requiredEntitlement:shouldAccept:)();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[7].id receiver = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10000E2C8;
  return daemon.getter();
}

uint64_t sub_10000E2C8(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 120) = a1;
  swift_task_dealloc();
  id v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 128) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  uint64_t v6 = sub_100010F4C(&qword_100028E30, 255, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_100010F4C((unint64_t *)&unk_100028E40, 255, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *id v3 = v9;
  v3[1] = sub_10000E4AC;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_10000E4AC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  swift_release();
  if (v0)
  {
    uint64_t v4 = sub_10000E83C;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_10000E614;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_10000E614()
{
  *(void *)(v0 + 144) = *(void *)(*(void *)(v0 + 32) + 128);
  type metadata accessor for XPCSessionManager();
  sub_100010F4C(&qword_100029518, 255, (void (*)(uint64_t))&type metadata accessor for XPCSessionManager);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000E6D8, v2, v1);
}

uint64_t sub_10000E6D8()
{
  uint64_t v1 = v0[17];
  dispatch thunk of XPCSessionManager.register(service:)();
  v0[19] = v1;
  uint64_t v2 = v0[4];
  if (v1) {
    uint64_t v3 = sub_10000E91C;
  }
  else {
    uint64_t v3 = sub_10000E764;
  }
  return _swift_task_switch(v3, v2, 0);
}

uint64_t sub_10000E764()
{
  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000E83C()
{
  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000E91C()
{
  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000E9FC(uint64_t a1, void *a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = *a2;
  sub_100006974(&qword_100029520);
  v2[5] = swift_task_alloc();
  return _swift_task_switch(sub_10000EAB8, 0, 0);
}

uint64_t sub_10000EAB8()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v4 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 1, 1, v5);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v3;
  v6[5] = v4;
  v6[6] = v2;
  swift_retain();
  id v7 = v4;
  sub_10000DBB4(v1, (uint64_t)&unk_100029530, (uint64_t)v6);
  swift_release();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(1);
}

uint64_t sub_10000EBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for SearchPartyPushXPCService();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_10000EC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SearchPartyPushXPCService();
  *uint64_t v8 = v4;
  v8[1] = sub_10000DA7C;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_10000ED34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for SearchPartyPushXPCService();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_10000EDDC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000DA7C;
  return sub_10000DFC0();
}

uint64_t sub_10000EE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for SearchPartyPushXPCService();
  void *v4 = v2;
  v4[1] = sub_10000D694;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_10000EF10()
{
  type metadata accessor for SearchPartyPushXPCService();
  sub_100010F4C(&qword_100028E50, v0, (void (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService);
  return ActorServiceProtocol.description.getter();
}

Swift::Int sub_10000EF78()
{
  return Hasher._finalize()();
}

uint64_t sub_10000EFD0()
{
  return String.hash(into:)();
}

Swift::Int sub_10000EFEC()
{
  return Hasher._finalize()();
}

uint64_t sub_10000F040@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025058, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_10000F094(void *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000010001F210;
}

uint64_t sub_10000F0B4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  Swift::Int v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *Swift::Int v3 = v2;
  v3[1] = sub_10000F148;
  return daemon.getter();
}

uint64_t sub_10000F148(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 40) = a1;
  swift_task_dealloc();
  Swift::Int v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  uint64_t v6 = sub_100010F4C(&qword_100028E30, 255, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_100010F4C((unint64_t *)&unk_100028E40, 255, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *Swift::Int v3 = v9;
  v3[1] = sub_10000F32C;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_10000F32C(uint64_t a1)
{
  Swift::Int v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v3[7] = a1;
  v3[8] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v3[3];
    return _swift_task_switch(sub_10000F5E4, v5, 0);
  }
  else
  {
    swift_release();
    uint64_t v6 = (void *)swift_task_alloc();
    v3[9] = v6;
    *uint64_t v6 = v4;
    v6[1] = sub_10000F4BC;
    uint64_t v7 = v3[2];
    return sub_100011210(v7);
  }
}

uint64_t sub_10000F4BC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    Swift::Int v3 = sub_10000F6AC;
  }
  else {
    Swift::Int v3 = sub_10000F648;
  }
  return _swift_task_switch(v3, v2, 0);
}

uint64_t sub_10000F5E4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F648()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F6AC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F710(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_100006974(&qword_100029520);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a1;
  v13[5] = a2;
  v13[6] = v4;
  v13[7] = a3;
  v13[8] = a4;
  sub_100010F38(a1, a2);
  id v14 = v4;
  swift_retain();
  sub_10000DBB4((uint64_t)v11, (uint64_t)&unk_100029578, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_10000F844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  v8[8] = swift_isaMask & *a6;
  uint64_t v9 = type metadata accessor for LocalBeaconKeyInfo();
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  v8[12] = swift_task_alloc();
  sub_100006974((uint64_t *)&unk_100029580);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  return _swift_task_switch(sub_10000F994, 0, 0);
}

uint64_t sub_10000F994()
{
  unint64_t v1 = v0[4];
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = v0[14];
    uint64_t v3 = type metadata accessor for LocalBeaconKeyInfo();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  }
  else
  {
    uint64_t v11 = v0[3];
    type metadata accessor for PropertyListDecoder();
    swift_allocObject();
    sub_10000A100(v11, v1);
    PropertyListDecoder.init()();
    sub_100010F4C(&qword_100029590, 255, (void (*)(uint64_t))&type metadata accessor for LocalBeaconKeyInfo);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
    uint64_t v14 = v0[12];
    uint64_t v13 = v0[13];
    uint64_t v15 = v0[10];
    uint64_t v16 = v0[11];
    uint64_t v17 = v0[9];
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v16, v14, v17);
    sub_10000949C(v16, v13);
    uint64_t v19 = v0[13];
    uint64_t v20 = v0[14];
    uint64_t v22 = v0[3];
    unint64_t v21 = v0[4];
    (*(void (**)(void, void))(v0[10] + 8))(v0[12], v0[9]);
    sub_100010DE8(v22, v21);
    uint64_t v23 = type metadata accessor for LocalBeaconKeyInfo();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v19, 0, 1, v23);
    sub_100010F94(v19, v20);
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[15] = Strong;
  if (Strong)
  {
    uint64_t v5 = v0[8];
    uint64_t v7 = *(void *)(v5 + 80);
    uint64_t v6 = *(void *)(v5 + 88);
    int v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 16) + **(int **)(v6 + 16));
    uint64_t v8 = (void *)swift_task_alloc();
    v0[16] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_10000FEB0;
    uint64_t v9 = v0[14];
    return v24(v9, v7, v6);
  }
  else
  {
    uint64_t v12 = (void (*)(void))v0[6];
    sub_10000CA6C(v0[14], (uint64_t *)&unk_100029580);
    v12(0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_10000FEB0()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  if (v0) {
    uint64_t v2 = sub_100010088;
  }
  else {
    uint64_t v2 = sub_10000FFE4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000FFE4()
{
  uint64_t v1 = (void (*)(void))v0[6];
  sub_10000CA6C(v0[14], (uint64_t *)&unk_100029580);
  v1(0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_100010088()
{
  sub_10000CA6C(v0[14], (uint64_t *)&unk_100029580);
  uint64_t v1 = v0[17];
  if (qword_100028D80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006394(v2, (uint64_t)qword_100029BF8);
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    uint64_t v7 = _convertErrorToNSError(_:)();
    v0[2] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v7;
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "TRACE: XPC error: %@", v5, 0xCu);
    sub_100006974(&qword_100028E28);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
  }

  uint64_t v8 = (void (*)(uint64_t))v0[6];
  swift_errorRetain();
  v8(v1);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

void sub_1000102AC(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = a1;
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v5;
  sub_10000F710(v8, v10, (uint64_t)sub_100010DE0, v11);
  swift_release();
  sub_100010DE8(v8, v10);
}

void sub_10001039C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100010400()
{
}

id sub_100010444()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_10001047C(uint64_t a1)
{
  return _swift_unknownObjectWeakDestroy(a1 + qword_100029430);
}

uint64_t type metadata accessor for SearchPartyPushXPCService.Trampoline()
{
  return sub_100010FFC();
}

uint64_t sub_1000104A4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100010F4C(&qword_1000294C0, a2, (void (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000104FC(uint64_t a1, uint64_t a2)
{
  return sub_100010F4C(qword_1000294C8, a2, (void (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService);
}

uint64_t sub_100010544(uint64_t a1, uint64_t a2)
{
  return sub_100010F4C(&qword_1000294C0, a2, (void (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService);
}

uint64_t sub_10001058C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029BF8);
  sub_100006394(v0, (uint64_t)qword_100029BF8);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100010610(uint64_t a1)
{
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100006298;
  return sub_10000E9FC(a1, v1);
}

uint64_t sub_1000106A8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000106F0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10000DA7C;
  v4[2] = v3;
  return _swift_task_switch(sub_10000DAA0, v2, 0);
}

uint64_t sub_100010798(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100010874;
  return v6(a1);
}

uint64_t sub_100010874()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001096C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000109A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000DA7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100029538 + dword_100029538);
  return v6(a1, v4);
}

unint64_t sub_100010A5C()
{
  unint64_t result = qword_100029548;
  if (!qword_100029548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029548);
  }
  return result;
}

uint64_t sub_100010AB0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100010B90;
  return v5(v2 + 16);
}

uint64_t sub_100010B90()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  void *v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100010CC0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000D694;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100029558 + dword_100029558);
  return v6(a1, v4);
}

void sub_100010D78()
{
}

uint64_t sub_100010DA8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100010DE0(uint64_t a1)
{
  sub_10001039C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100010DE8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000A0A8(a1, a2);
  }
  return a1;
}

uint64_t sub_100010DFC()
{
  swift_unknownObjectRelease();
  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >> 60 != 15) {
    sub_10000A0A8(*(void *)(v0 + 32), v1);
  }

  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100010E5C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (void *)v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000D694;
  return sub_10000F844(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100010F38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000A100(a1, a2);
  }
  return a1;
}

uint64_t sub_100010F4C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006974((uint64_t *)&unk_100029580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010FFC()
{
  return swift_getGenericMetadata();
}

uint64_t getEnumTagSinglePayload for SearchPartyPushXPCService.Entitlement(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SearchPartyPushXPCService.Entitlement(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001111CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100011144()
{
  return 0;
}

ValueMetadata *type metadata accessor for SearchPartyPushXPCService.Entitlement()
{
  return &type metadata for SearchPartyPushXPCService.Entitlement;
}

unint64_t sub_100011160()
{
  unint64_t result = qword_100029598;
  if (!qword_100029598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029598);
  }
  return result;
}

unint64_t sub_1000111B8()
{
  unint64_t result = qword_1000295A0;
  if (!qword_1000295A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000295A0);
  }
  return result;
}

uint64_t sub_100011210(uint64_t a1)
{
  v2[11] = a1;
  v2[12] = v1;
  sub_100006974((uint64_t *)&unk_100029580);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for LocalBeaconKeyInfo();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return _swift_task_switch(sub_10001132C, v1, 0);
}

uint64_t sub_10001132C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[15];
  sub_100014264(v0[11], v3);
  unsigned int v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_1000142CC(v0[15]);
  }
  else
  {
    uint64_t v5 = v0[16];
    uint64_t v6 = v0[14];
    uint64_t v7 = v0[12];
    sub_100015790(v0[15], v0[19]);
    uint64_t v8 = v7 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess();
    sub_100014264(v8, v6);
    if (v4(v6, 1, v5) == 1)
    {
      uint64_t v9 = v0[14];
      sub_10000A2A4(v0[19]);
      sub_1000142CC(v9);
    }
    else
    {
      sub_100015790(v0[14], v0[18]);
      if (sub_100009EC0())
      {
        if (qword_100028D88 != -1) {
          swift_once();
        }
        uint64_t v10 = type metadata accessor for Logger();
        sub_100006394(v10, (uint64_t)qword_100029C10);
        uint64_t v11 = Logger.logObject.getter();
        os_log_type_t v12 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Already know about this beacon -- ignoring redundant call.", v13, 2u);
          swift_slowDealloc();
        }
        uint64_t v15 = v0[18];
        uint64_t v14 = v0[19];

        sub_10000A2A4(v15);
        sub_10000A2A4(v14);
        goto LABEL_19;
      }
      uint64_t v16 = v0[19];
      sub_10000A2A4(v0[18]);
      sub_10000A2A4(v16);
    }
  }
  uint64_t v17 = v0[16];
  if (v4(v0[11], 1, v17) == 1)
  {
    uint64_t v18 = v0[13];
    uint64_t v19 = v0[12] + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess();
    sub_100014264(v19, v18);
    unsigned int v20 = v4(v18, 1, v17);
    sub_1000142CC(v18);
    if (v20 == 1)
    {
      if (qword_100028D88 != -1) {
        swift_once();
      }
      uint64_t v21 = type metadata accessor for Logger();
      sub_100006394(v21, (uint64_t)qword_100029C10);
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        int v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Beacon already removed -- ignoring redundant call.", v24, 2u);
        swift_slowDealloc();
      }

LABEL_19:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v25 = (uint64_t (*)(void))v0[1];
      return v25();
    }
  }
  char v27 = (void *)swift_task_alloc();
  v0[20] = v27;
  void *v27 = v0;
  v27[1] = sub_10001172C;
  return daemon.getter();
}

uint64_t sub_10001172C(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 168) = a1;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 176) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for StorageService();
  uint64_t v6 = sub_100016698(&qword_100028E30, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_100016698(&qword_100028E58, (void (*)(uint64_t))type metadata accessor for StorageService);
  *uint64_t v3 = v9;
  v3[1] = sub_100011908;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_100011908(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[23] = a1;
  v4[24] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[12];
    uint64_t v6 = sub_100011D84;
  }
  else
  {
    swift_release();
    uint64_t v6 = sub_100011A40;
    uint64_t v5 = a1;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_100011A40()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  void *v1 = v0;
  v1[1] = sub_100011ADC;
  uint64_t v2 = *(void *)(v0 + 88);
  return sub_10001B2F4(v2);
}

uint64_t sub_100011ADC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v4 = sub_100011CE0;
  }
  else {
    uint64_t v4 = sub_100011C08;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_100011C08()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  swift_release();
  uint64_t v3 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  swift_beginAccess();
  sub_100015728(v1, v3);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100011CE0()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100011D84()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100011E28()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029C10);
  uint64_t v1 = sub_100006394(v0, (uint64_t)qword_100029C10);
  if (qword_100028D90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006394(v0, (uint64_t)qword_100029C28);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100011EF0()
{
  swift_bridgeObjectRelease();
  sub_1000142CC(v0 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_100011F38()
{
  return type metadata accessor for LocalBeaconing();
}

uint64_t type metadata accessor for LocalBeaconing()
{
  uint64_t result = qword_1000295E0;
  if (!qword_1000295E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100011F8C()
{
  sub_100012038();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100012038()
{
  if (!qword_1000295F0)
  {
    type metadata accessor for LocalBeaconKeyInfo();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000295F0);
    }
  }
}

uint64_t sub_100012090()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_1000120B0, v0, 0);
}

uint64_t sub_1000120B0()
{
  if (&getBeacon(device:count:swizzler:)) {
    initializeFindMyBeaconingSupport()();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  void *v1 = v0;
  v1[1] = sub_100012190;
  uint64_t v2 = *(void **)(v0 + 40);
  v1[12] = v2;
  v1[13] = *v2;
  return _swift_task_switch(sub_100012BEC, v2, 0);
}

uint64_t sub_100012190()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v2 + 56) = v6;
    *uint64_t v6 = v3;
    v6[1] = sub_100012300;
    return daemon.getter();
  }
}

uint64_t sub_100012300(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 64) = a1;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 72) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for StorageService();
  uint64_t v6 = sub_100016698(&qword_100028E30, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_100016698(&qword_100028E58, (void (*)(uint64_t))type metadata accessor for StorageService);
  *uint64_t v3 = v9;
  v3[1] = sub_1000124DC;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_1000124DC(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[10] = a1;
  v4[11] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[5];
    uint64_t v6 = sub_100012B40;
  }
  else
  {
    swift_release();
    v4[12] = *(void *)(*(void *)(sub_100006974((uint64_t *)&unk_100029580) - 8) + 64);
    v4[13] = swift_task_alloc();
    uint64_t v6 = sub_100012648;
    uint64_t v5 = a1;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_100012648()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  void *v1 = v0;
  v1[1] = sub_1000126E4;
  uint64_t v2 = *(void *)(v0 + 104);
  return sub_10001BFAC(v2);
}

uint64_t sub_1000126E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v4 = sub_100012AD0;
  }
  else {
    uint64_t v4 = sub_100012810;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_100012810()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[5];
  uint64_t v3 = swift_task_alloc();
  sub_100010F94(v1, v3);
  uint64_t v4 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  swift_beginAccess();
  sub_100016274(v3, v4);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = swift_task_alloc();
  sub_100014264(v4, v5);
  uint64_t v6 = type metadata accessor for LocalBeaconKeyInfo();
  LODWORD(v1) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6);
  sub_1000142CC(v5);
  swift_task_dealloc();
  if (v1 != 1)
  {
    if (qword_100028D88 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100006394(v7, (uint64_t)qword_100029C10);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    uint64_t v11 = "Beaconing FMIP keys.";
    goto LABEL_12;
  }
  if (&getBeacon(device:count:swizzler:))
  {
    logInUse()();
    goto LABEL_14;
  }
  if (qword_100028D88 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100006394(v12, (uint64_t)qword_100029C10);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    uint64_t v11 = "Not beaconing since FMIP is turned off.";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v8, v9, v11, v10, 2u);
    swift_slowDealloc();
  }
LABEL_13:

LABEL_14:
  uint64_t v13 = v0[5];
  swift_release();
  *(unsigned char *)(v13 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_initialFetchComplete) = 1;
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100012AD0()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012B40()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012BA4()
{
  *(void *)(v1 + 96) = v0;
  *(void *)(v1 + 104) = *v0;
  return _swift_task_switch(sub_100012BEC, v0, 0);
}

uint64_t sub_100012BEC()
{
  uint64_t My = type metadata accessor for Feature.FindMy();
  v0[5] = My;
  uint64_t v2 = sub_100016698(&qword_100029718, (void (*)(uint64_t))&type metadata accessor for Feature.FindMy);
  v0[6] = v2;
  uint64_t v3 = sub_1000162DC(v0 + 2);
  uint64_t v4 = *(void (**)(uint64_t *, void, uint64_t))(*(void *)(My - 8) + 104);
  v4(v3, enum case for Feature.FindMy.baLPEM(_:), My);
  char v5 = isFeatureEnabled(_:)();
  sub_10000A1F0((uint64_t)(v0 + 2));
  if (((v5 & 1) != 0
     || (v0[10] = My,
         v0[11] = v2,
         uint64_t v6 = sub_1000162DC(v0 + 7),
         v4(v6, enum case for Feature.FindMy.baPowerOff(_:), My),
         char v7 = isFeatureEnabled(_:)(),
         sub_10000A1F0((uint64_t)(v0 + 7)),
         (v7 & 1) != 0))
    && (static SystemInfo.isFactoryBuild.getter() & 1) != 0)
  {
    uint64_t v9 = v0[12];
    uint64_t v8 = v0[13];
    uint64_t v10 = swift_task_alloc();
    v0[14] = v10;
    *(unsigned char *)(v10 + 16) = 0;
    *(void *)(v10 + 24) = v9;
    *(void *)(v10 + 32) = v8;
    uint64_t v11 = (void *)swift_task_alloc();
    v0[15] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_100012E1C;
    return withOnceCheckedThrowingContinuation<A>(function:_:)();
  }
  else
  {
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_100012E1C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = sub_100012F5C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 96);
    swift_task_dealloc();
    uint64_t v4 = sub_100012F44;
    uint64_t v3 = v5;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_100012F44()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012F5C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_10001306C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for LocalBeaconing();
  *uint64_t v8 = v4;
  v8[1] = sub_10000DA7C;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_100013134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_1000131E0()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_10000DA7C;
  v2[5] = v0;
  return _swift_task_switch(sub_1000120B0, v0, 0);
}

uint64_t sub_100013288(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  void *v4 = v2;
  v4[1] = sub_10000D694;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_100013334()
{
  return ActorServiceProtocol.description.getter();
}

uint64_t sub_1000133A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a3;
  uint64_t v6 = sub_100006974(&qword_100029760);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for GeneratedTokens();
  uint64_t v26 = *(void *)(v9 - 8);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v13 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_16:
    __break(1u);
  }
  else
  {
    uint64_t v14 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (!v13) {
      return (uint64_t)v14;
    }
    uint64_t v29 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t result = sub_100015E4C(0, v13 & ~(v13 >> 63), 0);
    if ((v13 & 0x8000000000000000) == 0)
    {
      v22[1] = v3;
      os_log_type_t v23 = v8;
      uint64_t v14 = v29;
      int v24 = (uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
      uint64_t v15 = (uint64_t (**)(char *, char *, uint64_t))(v26 + 32);
      uint64_t v16 = v28;
      if (v28 <= v27) {
        uint64_t v16 = v27;
      }
      uint64_t v17 = v16 - v27;
      uint64_t v18 = v9;
      while (1)
      {
        TokenSequence.next()();
        uint64_t result = (*v24)(v8, 1, v18);
        if (result == 1) {
          goto LABEL_18;
        }
        uint64_t v19 = *v15;
        (*v15)(v12, v8, v18);
        uint64_t v29 = v14;
        unint64_t v21 = v14[2];
        unint64_t v20 = v14[3];
        if (v21 >= v20 >> 1)
        {
          sub_100015E4C(v20 > 1, v21 + 1, 1);
          uint64_t v14 = v29;
        }
        v14[2] = v21 + 1;
        uint64_t result = v19((char *)v14+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v21, v12, v18);
        if (v28 < v27)
        {
          __break(1u);
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
        if (!v17) {
          goto LABEL_15;
        }
        --v17;
        --v13;
        uint64_t v8 = v23;
        if (!v13) {
          return (uint64_t)v14;
        }
      }
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void *sub_100013620(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v9 = *(void *)(type metadata accessor for GeneratedTokens() - 8);
    uint64_t v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v10 += v11;
      if (!--v6) {
        return v13;
      }
    }
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_100013768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v52 = a3;
  uint64_t v55 = a2;
  v65 = a4;
  uint64_t v5 = type metadata accessor for NearOwnerAdvertisement();
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  __chkstk_darwin(v5);
  char v49 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Advertisement();
  uint64_t v60 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  __chkstk_darwin(v7);
  v59 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PublicKey();
  uint64_t v57 = *(void *)(v9 - 8);
  uint64_t v58 = v9;
  __chkstk_darwin(v9);
  v56 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DiversifiedRootKeys();
  uint64_t v53 = *(void *)(v11 - 8);
  uint64_t v54 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for KeyGenerationHint();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  unint64_t v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DateInterval();
  uint64_t v63 = *(void *)(v22 - 8);
  uint64_t v64 = v22;
  uint64_t v23 = __chkstk_darwin(v22);
  v62 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v48 - v25;
  uint64_t v27 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v55 + *(int *)(v27 + 24), v18);
  uint64_t v55 = a1;
  GeneratedTokens.hint.getter();
  KeyGenerationHint.index.getter();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v28 = v26;
  dateInterval(baseTime:bucket:bucketSizeInMinutes:)();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (v52 == 1 || v52 == -1)
  {
    char v30 = v62;
    uint64_t v29 = v63;
    uint64_t v31 = v28;
    uint64_t v32 = v64;
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v62, v28, v64);
    GeneratedTokens.diversifiedRootKeys.getter();
    uint64_t v33 = v56;
    DiversifiedRootKeys.publicKey.getter();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v54);
    uint64_t v34 = v59;
    PublicKey.advertisement.getter();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v33, v58);
    v35 = v49;
    Advertisement.nearOwner.getter();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v34, v61);
    uint64_t v36 = NearOwnerAdvertisement.data.getter();
    unint64_t v38 = v37;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v51);
  }
  else
  {
    char v30 = v62;
    uint64_t v29 = v63;
    uint64_t v31 = v28;
    uint64_t v32 = v64;
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v62, v28, v64);
    GeneratedTokens.diversifiedRootKeys.getter();
    uint64_t v39 = v56;
    DiversifiedRootKeys.publicKey.getter();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v54);
    uint64_t v40 = v59;
    PublicKey.advertisement.getter();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v39, v58);
    uint64_t v36 = Advertisement.data.getter();
    unint64_t v38 = v41;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v40, v61);
  }
  id v42 = objc_allocWithZone((Class)SPBeaconingKey);
  Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
  Class v44 = Data._bridgeToObjectiveC()().super.isa;
  id v45 = [v42 initWithDateInterval:isa key:v44];

  sub_10000A0A8(v36, v38);
  v46 = *(void (**)(char *, uint64_t))(v29 + 8);
  v46(v30, v32);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v46)(v31, v32);
  void *v65 = v45;
  return result;
}

unint64_t *sub_100013DE0(uint64_t a1)
{
  uint64_t v4 = sub_100006974((uint64_t *)&unk_100029580);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LocalBeaconKeyInfo();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)(v1 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo);
  swift_beginAccess();
  sub_100014264((uint64_t)v11, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1000142CC((uint64_t)v6);
    uint64_t v12 = sub_100016B94();
    if (!v2) {
      return v12;
    }
  }
  else
  {
    sub_100015790((uint64_t)v6, (uint64_t)v10);
    uint64_t v11 = sub_1000166E0(a1, (uint64_t)v10);
    sub_10000A2A4((uint64_t)v10);
  }
  return (unint64_t *)v11;
}

uint64_t sub_100013F8C()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_100013FAC, v0, 0);
}

uint64_t sub_100013FAC()
{
  if (&getBeacon(device:count:swizzler:))
  {
    BOOL v1 = 1;
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 40);
    sub_100006974((uint64_t *)&unk_100029580);
    uint64_t v3 = swift_task_alloc();
    uint64_t v4 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess();
    sub_100014264(v4, v3);
    uint64_t v5 = type metadata accessor for LocalBeaconKeyInfo();
    BOOL v1 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
    sub_1000142CC(v3);
    swift_task_dealloc();
  }
  uint64_t v6 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v6(v1);
}

uint64_t sub_1000140E0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_100014100, v1, 0);
}

uint64_t sub_100014100()
{
  uint64_t v1 = sub_100013DE0(*(void *)(v0 + 16));
  uint64_t v2 = *(uint64_t (**)(unint64_t *))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10001417C(uint64_t a1)
{
  uint64_t result = sub_100016698(&qword_1000296C8, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000141D4()
{
  return sub_100016698(qword_1000296D0, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
}

uint64_t sub_10001421C()
{
  return sub_100016698(&qword_1000296C8, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
}

uint64_t sub_100014264(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006974((uint64_t *)&unk_100029580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000142CC(uint64_t a1)
{
  uint64_t v2 = sub_100006974((uint64_t *)&unk_100029580);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001432C(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(unsigned char *)(v9 + 24) = a2;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a4;
  v11[4] = sub_100016350;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  void v11[2] = sub_10001563C;
  v11[3] = &unk_100025480;
  uint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_retain();
  swift_release();
  [v8 sharedHardwareManager:v10];
  _Block_release(v10);
}

uint64_t sub_10001443C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100006974(&qword_100029520);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = a1;
  sub_100016378();
  deoptionalize<A>(_:)();
  uint64_t v13 = v17[1];
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  *(void *)(v15 + 32) = v13;
  *(void *)(v15 + 40) = a2;
  *(unsigned char *)(v15 + 48) = a3;
  *(void *)(v15 + 56) = a4;
  *(void *)(v15 + 64) = a5;
  swift_retain();
  swift_retain();
  sub_10000DD60((uint64_t)v12, (uint64_t)&unk_100029730, v15);
  return swift_release();
}

uint64_t sub_100014590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = a7;
  *(void *)(v8 + 96) = a8;
  *(unsigned char *)(v8 + 104) = a6;
  *(void *)(v8 + 72) = a4;
  *(void *)(v8 + 80) = a5;
  *(void *)(v8 + 64) = a1;
  return _swift_task_switch(sub_1000145BC, 0, 0);
}

uint64_t sub_1000145BC()
{
  char v1 = *(unsigned char *)(v0 + 104);
  uint64_t v3 = *(void **)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = *(void **)(v0 + 64);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(unsigned char *)(v5 + 24) = v1;
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(v0 + 88);
  *(void *)(v0 + 48) = sub_100016518;
  *(void *)(v0 + 56) = v5;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_1000155B0;
  *(void *)(v0 + 40) = &unk_1000254F8;
  uint64_t v6 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  swift_retain();
  swift_release();
  id v7 = [v3 startLPEMConfigSession:v6];
  _Block_release(v6);
  void *v4 = v7;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

void sub_100014708(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100006974(&qword_100029520);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    if (qword_100028D88 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100006394(v15, (uint64_t)qword_100029C10);
    swift_errorRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138543362;
      uint64_t v20 = _convertErrorToNSError(_:)();
      uint64_t v29 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v19 = v20;
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Error starting LPEM configuration session: %{public}@", v18, 0xCu);
      sub_100006974(&qword_100028E28);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
    }

    uint64_t v29 = a2;
    OnceCheckedContinuation.resume(throwing:)();
    swift_errorRelease();
  }
  else if (a1)
  {
    uint64_t v21 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = 0;
    *(void *)(v22 + 24) = 0;
    *(unsigned char *)(v22 + 32) = a4 & 1;
    *(void *)(v22 + 40) = a5;
    *(void *)(v22 + 48) = a1;
    *(void *)(v22 + 56) = a3;
    *(void *)(v22 + 64) = a6;
    id v23 = a1;
    swift_retain();
    swift_retain();
    sub_10000DBB4((uint64_t)v14, (uint64_t)&unk_100029740, v22);
    swift_release();
  }
  else
  {
    if (qword_100028D88 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_100006394(v24, (uint64_t)qword_100029C10);
    os_log_t v28 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v28, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v25, "startLPEMConfigSession returned a nil session!", v26, 2u);
      swift_slowDealloc();
    }
    os_log_t v27 = v28;
  }
}

uint64_t sub_100014AAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 192) = a6;
  *(void *)(v7 + 200) = a7;
  *(void *)(v7 + 184) = a5;
  *(unsigned char *)(v7 + 216) = a4;
  return _swift_task_switch(sub_100014B44, 0, 0);
}

uint64_t sub_100014B44()
{
  uint64_t v30 = v0;
  if (*(unsigned char *)(v0 + 216) == 1)
  {
    if (qword_100028D88 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100006394(v1, (uint64_t)qword_100029C10);
    swift_retain_n();
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(void *)(v0 + 184);
    if (v4)
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      *(void *)(v0 + 144) = v5;
      type metadata accessor for LocalBeaconing();
      sub_100016698(qword_1000296D0, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
      uint64_t v7 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 144) = sub_1000157F4(v7, v8, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s: Enabling NFHeadlessModeFeatureFindMy", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    os_log_type_t v17 = *(void **)(v0 + 192);
    *(void *)(v0 + 144) = 0;
    unsigned __int8 v18 = [v17 enableLPEMFeature:4 error:v0 + 144];
    uint64_t v19 = *(void **)(v0 + 144);
    if ((v18 & 1) == 0)
    {
LABEL_12:
      id v20 = v19;
      uint64_t v21 = _convertNSErrorToError(_:)();

      uint64_t v22 = v0 + 16;
      *(void *)(v0 + 208) = v21;
      id v23 = *(void **)(v0 + 192);
      swift_willThrow();
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_100015280;
      *(void *)(v0 + 176) = swift_continuation_init();
      *(void *)(v0 + 144) = _NSConcreteStackBlock;
      *(void *)(v0 + 152) = 0x40000000;
      uint64_t v24 = &unk_100025548;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_100028D88 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100006394(v9, (uint64_t)qword_100029C10);
    swift_retain_n();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 184);
    if (v12)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v0 + 144) = v13;
      type metadata accessor for LocalBeaconing();
      sub_100016698(qword_1000296D0, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
      uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 144) = sub_1000157F4(v15, v16, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s: Disabling NFHeadlessModeFeatureFindMy", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    os_log_type_t v25 = *(void **)(v0 + 192);
    *(void *)(v0 + 144) = 0;
    unsigned int v26 = [v25 disableLPEMFeature:4 error:v0 + 144];
    uint64_t v19 = *(void **)(v0 + 144);
    if (!v26) {
      goto LABEL_12;
    }
  }
  uint64_t v22 = v0 + 80;
  id v23 = *(void **)(v0 + 192);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 88) = sub_1000150E8;
  id v27 = v19;
  *(void *)(v0 + 176) = swift_continuation_init();
  *(void *)(v0 + 144) = _NSConcreteStackBlock;
  *(void *)(v0 + 152) = 0x40000000;
  uint64_t v24 = &unk_100025560;
LABEL_16:
  *(void *)(v0 + 160) = sub_1000155A8;
  *(void *)(v0 + 168) = v24;
  [v23 endSessionWithCompletion:v0 + 144];
  return _swift_continuation_await(v22);
}

uint64_t sub_1000150E8()
{
  return _swift_task_switch(sub_1000151F4, 0, 0);
}

uint64_t sub_1000151F4()
{
  OnceCheckedContinuation.resume<>()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100015280()
{
  return _swift_task_switch(sub_10001538C, 0, 0);
}

uint64_t sub_10001538C()
{
  if (qword_100028D88 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006394(v1, (uint64_t)qword_100029C10);
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    BOOL v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v4 = 138543362;
    uint64_t v6 = _convertErrorToNSError(_:)();
    v0[18] = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v6;
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "LPEM error: %{public}@", v4, 0xCu);
    sub_100006974(&qword_100028E28);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
  }
  uint64_t v7 = v0[26];

  v0[18] = v7;
  OnceCheckedContinuation.resume(throwing:)();
  swift_errorRelease();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000155A8(uint64_t a1)
{
  return _swift_continuation_resume(*(void *)(a1 + 32));
}

void sub_1000155B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10001563C(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000156A4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029C28);
  sub_100006394(v0, (uint64_t)qword_100029C28);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100015728(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006974((uint64_t *)&unk_100029580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000157F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000158C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001663C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001663C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A1F0((uint64_t)v12);
  return v7;
}

uint64_t sub_1000158C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100015A84(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100015A84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100015B1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100015CFC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100015CFC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100015B1C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100015C94(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100015C94(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006974(&qword_100029748);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100015CFC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006974(&qword_100029748);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100015E4C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100015E8C(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_100015E6C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000160CC(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_100015E8C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006974(&qword_100029768);
  uint64_t v10 = *(void *)(type metadata accessor for GeneratedTokens() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for GeneratedTokens() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unsigned __int8 v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000160CC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006974(&qword_100029770);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    sub_100006974(&qword_100029778);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100016274(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006974((uint64_t *)&unk_100029580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1000162DC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_100016340(uint64_t a1)
{
  sub_10001432C(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100016350(uint64_t a1)
{
  return sub_10001443C(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_100016360(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016370()
{
  return swift_release();
}

unint64_t sub_100016378()
{
  unint64_t result = qword_100029720;
  if (!qword_100029720)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_100029720);
  }
  return result;
}

uint64_t sub_1000163B8()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100016408(uint64_t a1)
{
  char v4 = *(unsigned char *)(v1 + 48);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 32);
  long long v7 = *(_OWORD *)(v1 + 56);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_10000D694;
  *(_OWORD *)(v5 + 88) = v7;
  *(unsigned char *)(v5 + 104) = v4;
  *(_OWORD *)(v5 + 72) = v6;
  *(void *)(v5 + 64) = a1;
  return _swift_task_switch(sub_1000145BC, 0, 0);
}

uint64_t sub_1000164D8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100016518(void *a1, uint64_t a2)
{
  sub_100014708(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_100016528()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100016578()
{
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_10000DA7C;
  *(void *)(v4 + 200) = v3;
  *(_OWORD *)(v4 + 184) = v5;
  *(unsigned char *)(v4 + 216) = v2;
  return _swift_task_switch(sub_100014B44, 0, 0);
}

uint64_t sub_10001663C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100016698(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000166E0(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v3 = sub_100006974(&qword_100029750);
  __chkstk_darwin(v3 - 8);
  uint64_t v36 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for SharedSecretKey();
  uint64_t v5 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for PublicKey();
  uint64_t v7 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006974(&qword_100029758);
  __chkstk_darwin(v10 - 8);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TokenSequence();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v29 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v34 = *(void *)(v16 - 8);
  uint64_t v35 = v16;
  __chkstk_darwin(v16);
  unsigned __int8 v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ReferenceClock.now.getter();
  uint64_t v19 = type metadata accessor for LocalBeaconKeyInfo();
  bucket(beaconIdentifier:baseTime:date:bucketSizeInMinutes:)();
  uint64_t v20 = type metadata accessor for PrivateKey();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2 + *(int *)(v19 + 28), v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v32, a2 + *(int *)(v19 + 32), v33);
  uint64_t v21 = type metadata accessor for KeyGenerationHint();
  unint64_t v22 = v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v36, 1, 1, v21);
  uint64_t v23 = v37;
  TokenSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)();
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
  }
  else
  {
    uint64_t v24 = sub_1000133A0(0, 5, (uint64_t)v15);
    __chkstk_darwin(v24);
    uint64_t v25 = v30;
    *(&v27 - 2) = a2;
    *(&v27 - 1) = v25;
    unint64_t v22 = sub_100013620((void (*)(uint64_t *__return_ptr, uint64_t))sub_100016FA8, (uint64_t)(&v27 - 4), v24);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v29);
  }
  return v22;
}

unint64_t *sub_100016B94()
{
  uint64_t v1 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (&getBeacon(device:count:swizzler:))
  {
    sub_100015E6C(0, 5, 0);
    uint64_t v2 = v0;
    uint64_t v3 = 0;
    uint64_t v4 = (unint64_t *)&_swiftEmptyArrayStorage;
    do
    {
      uint64_t v5 = getBeacon(device:count:swizzler:)();
      if (v2)
      {
        swift_release();
        return v1;
      }
      uint64_t v8 = v5;
      unint64_t v9 = v6;
      unint64_t v10 = v7;
      uint64_t v43 = v4;
      unint64_t v12 = v4[2];
      unint64_t v11 = v4[3];
      uint64_t v13 = v4;
      if (v12 >= v11 >> 1)
      {
        uint64_t v34 = 0;
        sub_100015E6C(v11 > 1, v12 + 1, 1);
        uint64_t v2 = 0;
        uint64_t v13 = v43;
      }
      ++v3;
      v13[2] = v12 + 1;
      uint64_t v14 = &v13[3 * v12];
      v14[4] = v8;
      v14[5] = v9;
      v14[6] = v10;
      uint64_t v4 = v13;
    }
    while (v3 != 5);
    keyDuration.getter();
    unint64_t v15 = v4[2];
    if (v15)
    {
      v33[1] = v33;
      uint64_t v34 = v2;
      uint64_t v43 = (unint64_t *)&_swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)();
      uint64_t v16 = type metadata accessor for Date();
      uint64_t v42 = v16;
      uint64_t v17 = *(void *)(v16 - 8);
      uint64_t v37 = (void (**)(char *, char *, uint64_t, double))(v17 + 16);
      uint64_t v36 = *(void *)(v17 + 64);
      uint64_t v35 = (void (**)(char *, uint64_t))(v17 + 8);
      v33[2] = v4;
      unsigned __int8 v18 = (char *)(v4 + 6);
      do
      {
        uint64_t v40 = v33;
        unint64_t v41 = v15;
        uint64_t v19 = *((void *)v18 - 2);
        unint64_t v20 = *((void *)v18 - 1);
        uint64_t v21 = v36;
        __chkstk_darwin(v16);
        unint64_t v22 = (char *)v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_10000A100(v19, v20);
        Date.init(timeIntervalSince1970:)();
        uint64_t v38 = type metadata accessor for DateInterval();
        uint64_t v39 = v33;
        uint64_t v23 = *(void *)(v38 - 8);
        __chkstk_darwin(v38);
        uint64_t v25 = (char *)v33 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
        double v27 = __chkstk_darwin(v26);
        (*v37)(v22, v22, v42, v27);
        DateInterval.init(start:duration:)();
        id v28 = objc_allocWithZone((Class)SPBeaconingKey);
        sub_10000A100(v19, v20);
        Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
        Class v30 = Data._bridgeToObjectiveC()().super.isa;
        [v28 initWithDateInterval:isa key:v30];

        sub_10000A0A8(v19, v20);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v38);
        unint64_t v31 = v41;
        (*v35)(v22, v42);
        sub_10000A0A8(v19, v20);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        uint64_t v16 = specialized ContiguousArray._endMutation()();
        v18 += 24;
        unint64_t v15 = v31 - 1;
      }
      while (v15);
      uint64_t v1 = v43;
      swift_release();
    }
    else
    {
      swift_release();
      return (unint64_t *)&_swiftEmptyArrayStorage;
    }
  }
  return v1;
}

uint64_t sub_100016FA8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100013768(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_100016FD0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029C48);
  uint64_t v1 = sub_100006394(v0, (uint64_t)qword_100029C48);
  if (qword_100028DA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006394(v0, (uint64_t)qword_100029C60);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t type metadata accessor for LocalBeaconingXPCService()
{
  return self;
}

uint64_t sub_1000170BC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100017100()
{
  v1[4] = v0;
  uint64_t v2 = type metadata accessor for XPCServiceDescription();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for MachServiceName();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return _swift_task_switch(sub_10001722C, v0, 0);
}

uint64_t sub_10001722C()
{
  id receiver = v0[5].receiver;
  Class super_class = v0[5].super_class;
  id v3 = v0[4].receiver;
  Class v4 = v0[4].super_class;
  MachServiceName.init(_:)();
  id v5 = [self interfaceWithProtocol:&OBJC_PROTOCOL___SPLocalBeaconManagerXPCProtocol];
  v0[6].id receiver = v5;
  unint64_t v6 = (objc_class *)sub_100006974(&qword_100029968);
  id v7 = objc_allocWithZone(v6);
  swift_weakInit();
  swift_weakAssign();
  v0[1].id receiver = v7;
  v0[1].Class super_class = v6;
  uint64_t v8 = (objc_class *)[v0 + 1 init];
  v0[6].Class super_class = v8;
  (*((void (**)(id, Class, id))v4 + 2))(receiver, super_class, v3);
  sub_10001A8E0();
  unint64_t v9 = v8;
  id v10 = v5;
  XPCServiceDescription.init(name:exportedObject:exportedInterface:options:requiredEntitlement:shouldAccept:)();
  unint64_t v11 = (void *)swift_task_alloc();
  v0[7].id receiver = v11;
  *unint64_t v11 = v0;
  v11[1] = sub_1000173F4;
  return daemon.getter();
}

uint64_t sub_1000173F4(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 120) = a1;
  swift_task_dealloc();
  id v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 128) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  uint64_t v6 = sub_10001ADE8(&qword_100028E30, 255, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_10001ADE8((unint64_t *)&unk_100028E40, 255, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *id v3 = v9;
  v3[1] = sub_1000175D8;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_1000175D8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  swift_release();
  if (v0)
  {
    uint64_t v4 = sub_10000E83C;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_100017740;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_100017740()
{
  *(void *)(v0 + 144) = *(void *)(*(void *)(v0 + 32) + 128);
  type metadata accessor for XPCSessionManager();
  sub_10001ADE8(&qword_100029518, 255, (void (*)(uint64_t))&type metadata accessor for XPCSessionManager);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000E6D8, v2, v1);
}

uint64_t sub_100017804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LocalBeaconingXPCService();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_1000178AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for LocalBeaconingXPCService();
  *uint64_t v8 = v4;
  v8[1] = sub_10000DA7C;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_100017970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LocalBeaconingXPCService();
  void *v4 = v2;
  v4[1] = sub_10000DA7C;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_100017A18()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000DA7C;
  return sub_100017100();
}

uint64_t sub_100017AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LocalBeaconingXPCService();
  void *v4 = v2;
  v4[1] = sub_10000D694;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_100017B4C()
{
  type metadata accessor for LocalBeaconingXPCService();
  sub_10001ADE8(&qword_100029980, v0, (void (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService);
  return ActorServiceProtocol.description.getter();
}

Swift::Int sub_100017BB4()
{
  return Hasher._finalize()();
}

uint64_t sub_100017C0C()
{
  return String.hash(into:)();
}

Swift::Int sub_100017C28()
{
  return Hasher._finalize()();
}

uint64_t sub_100017C7C@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025090, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_100017CD0(void *a1@<X8>)
{
  *a1 = 0xD00000000000002BLL;
  a1[1] = 0x800000010001F240;
}

uint64_t sub_100017CF0()
{
  *(void *)(v1 + 56) = v0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 64) = v2;
  void *v2 = v1;
  v2[1] = sub_100017D84;
  return daemon.getter();
}

uint64_t sub_100017D84(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 72) = a1;
  swift_task_dealloc();
  Swift::Int v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 80) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  uint64_t v6 = sub_10001ADE8(&qword_100028E30, 255, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_10001ADE8((unint64_t *)&unk_100028E40, 255, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *Swift::Int v3 = v9;
  v3[1] = sub_100017F68;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_100017F68(uint64_t a1)
{
  Swift::Int v3 = (void *)*v2;
  v3[11] = a1;
  v3[12] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[7];
    uint64_t v5 = sub_1000184B4;
  }
  else
  {
    uint64_t v6 = v3[7];
    swift_release();
    uint64_t v5 = sub_100018090;
    uint64_t v4 = v6;
  }
  return _swift_task_switch(v5, v4, 0);
}

uint64_t sub_100018090()
{
  type metadata accessor for Transaction();
  uint64_t v1 = static Transaction.currentNSXPCConnection.getter();
  v0[13] = v1;
  if (v1)
  {
    uint64_t v2 = NSXPCConnection.shortDescription.getter();
  }
  else
  {
    unint64_t v3 = 0xE90000000000003ELL;
    uint64_t v2 = 0x4E574F4E4B4E553CLL;
  }
  v0[14] = v2;
  v0[15] = v3;
  uint64_t v4 = v0[11];
  return _swift_task_switch(sub_100018130, v4, 0);
}

uint64_t sub_100018130()
{
  if (&getBeacon(device:count:swizzler:))
  {
    BOOL v1 = 1;
  }
  else
  {
    uint64_t v2 = v0[11];
    sub_100006974((uint64_t *)&unk_100029580);
    uint64_t v3 = swift_task_alloc();
    uint64_t v4 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess();
    sub_10001AE30(v4, v3, (uint64_t *)&unk_100029580);
    uint64_t v5 = type metadata accessor for LocalBeaconKeyInfo();
    BOOL v1 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
    sub_1000142CC(v3);
    swift_task_dealloc();
  }
  v0[16] = v1;
  uint64_t v6 = v0[7];
  return _swift_task_switch(sub_100018274, v6, 0);
}

uint64_t sub_100018274()
{
  uint64_t v14 = v0;
  if (qword_100028D98 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006394(v1, (uint64_t)qword_100029C48);
  swift_bridgeObjectRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = v0[15];
    uint64_t v5 = v0[14];
    unint64_t v12 = (void *)v0[13];
    uint64_t v11 = v0[16];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446466;
    swift_bridgeObjectRetain();
    v0[5] = sub_1000157F4(v5, v4, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2048;
    v0[6] = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s: beaconingState() -> %ld", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {
    uint64_t v7 = (void *)v0[13];
    swift_bridgeObjectRelease_n();
    swift_release();
  }
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v9 = v0[16];
  return v8(v9);
}

uint64_t sub_1000184B4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100018518(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = type metadata accessor for DateInterval();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  sub_100006974((uint64_t *)&unk_100029580);
  v2[14] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for LocalBeaconKeyInfo();
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[18] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100018694;
  return daemon.getter();
}

uint64_t sub_100018694(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v9 = *v1;
  *(void *)(v2 + 152) = a1;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 160) = v3;
  uint64_t v4 = type metadata accessor for Daemon();
  uint64_t v5 = type metadata accessor for LocalBeaconing();
  uint64_t v6 = sub_10001ADE8(&qword_100028E30, 255, (void (*)(uint64_t))&type metadata accessor for Daemon);
  uint64_t v7 = sub_10001ADE8((unint64_t *)&unk_100028E40, 255, (void (*)(uint64_t))type metadata accessor for LocalBeaconing);
  *uint64_t v3 = v9;
  v3[1] = sub_100018878;
  return ActorServiceDaemon.getService<A>()(v4, v5, v6, v7);
}

uint64_t sub_100018878(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 80);
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100019208;
  }
  else
  {
    swift_release();
    uint64_t v5 = sub_1000189B8;
  }
  return _swift_task_switch(v5, v4, 0);
}

uint64_t sub_1000189B8()
{
  type metadata accessor for Transaction();
  uint64_t v1 = static Transaction.currentNSXPCConnection.getter();
  v0[23] = v1;
  if (v1)
  {
    uint64_t v2 = NSXPCConnection.shortDescription.getter();
  }
  else
  {
    unint64_t v3 = 0xE90000000000003ELL;
    uint64_t v2 = 0x4E574F4E4B4E553CLL;
  }
  v0[24] = v2;
  v0[25] = v3;
  uint64_t v4 = v0[21];
  return _swift_task_switch(sub_100018A58, v4, 0);
}

uint64_t sub_100018A58()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[21] + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  swift_beginAccess();
  sub_10001AE30(v4, v3, (uint64_t *)&unk_100029580);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) != 1)
  {
    uint64_t v5 = v0[22];
    uint64_t v8 = v0[17];
    uint64_t v9 = v0[9];
    sub_100015790(v0[14], v8);
    uint64_t v7 = sub_1000166E0(v9, v8);
    sub_10000A2A4(v0[17]);
    if (!v5) {
      goto LABEL_6;
    }
LABEL_5:
    v0[26] = v5;
    uint64_t v10 = v0[10];
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_100018BAC;
    uint64_t v12 = v10;
    goto LABEL_7;
  }
  uint64_t v5 = v0[22];
  sub_1000142CC(v0[14]);
  uint64_t v6 = sub_100016B94();
  if (v5) {
    goto LABEL_5;
  }
  uint64_t v7 = v6;
LABEL_6:
  v0[27] = v7;
  uint64_t v12 = v0[10];
  uint64_t v11 = sub_100018C3C;
LABEL_7:
  return _swift_task_switch(v11, v12, 0);
}

uint64_t sub_100018BAC()
{
  uint64_t v1 = *(void **)(v0 + 184);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100018C3C()
{
  uint64_t v47 = v0;
  if (qword_100028D98 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006394(v1, (uint64_t)qword_100029C48);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[25];
  Class v44 = v0;
  if (v4)
  {
    uint64_t v7 = v0 + 9;
    uint64_t v6 = v0[9];
    uint64_t v8 = v7[15];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446466;
    swift_bridgeObjectRetain();
    *(v7 - 2) = sub_1000157F4(v8, v5, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2048;
    *(v7 - 1) = v6;
    uint64_t v0 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s: beaconingKeys(keyType: %ld) -> ", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v10 = v0[27];
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v11 = result;
    if (!result) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_18;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v13 = 0;
  unint64_t v14 = v10 & 0xC000000000000001;
  uint64_t v40 = v0[27] + 32;
  unint64_t v41 = (void (**)(uint64_t, uint64_t))(v0[12] + 8);
  uint64_t v43 = v11;
  unint64_t v42 = v10 & 0xC000000000000001;
  do
  {
    if (v14) {
      id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v15 = *(id *)(v40 + 8 * v13);
    }
    id v16 = v15;
    swift_bridgeObjectRetain_n();
    id v17 = v16;
    unsigned __int8 v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    BOOL v20 = os_log_type_enabled(v18, v19);
    unint64_t v21 = v0[25];
    if (v20)
    {
      uint64_t v22 = v0[24];
      uint64_t v23 = v0[13];
      uint64_t v45 = v0[11];
      uint64_t v24 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136446722;
      swift_bridgeObjectRetain();
      *(void *)(v24 + 4) = sub_1000157F4(v22, v21, &v46);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v24 + 12) = 2080;
      id v25 = [v17 key];
      uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v28 = v27;

      v0[5] = v26;
      v0[6] = v28;
      sub_10000CB60();
      uint64_t v29 = DataProtocol.hexString.getter();
      unint64_t v31 = v30;
      uint64_t v32 = v26;
      uint64_t v11 = v43;
      sub_10000A0A8(v32, v28);
      *(void *)(v24 + 14) = sub_1000157F4(v29, v31, &v46);
      swift_bridgeObjectRelease();

      *(_WORD *)(v24 + 22) = 2082;
      id v33 = [v17 dateInterval];
      static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10001ADE8(&qword_100029990, 255, (void (*)(uint64_t))&type metadata accessor for DateInterval);
      uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v36 = v35;
      (*v41)(v23, v45);
      *(void *)(v24 + 24) = sub_1000157F4(v34, v36, &v46);
      uint64_t v0 = v44;
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "%{public}s:   %s -- %{public}s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      unint64_t v14 = v42;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ++v13;
  }
  while (v11 != v13);
LABEL_18:
  uint64_t v37 = (void *)v0[23];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v39 = v0[27];
  return v38(v39);
}

uint64_t sub_100019208()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100019290()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10001B2E8;
  return sub_100017CF0();
}

uint64_t sub_10001931C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000193B0;
  return sub_100018518(a1);
}

uint64_t sub_1000193B0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000194B0(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Transaction();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  id v6 = v2;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  return swift_release();
}

uint64_t sub_100019560(void *a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = swift_isaMask & *a1;
  return _swift_task_switch(sub_1000195BC, 0, 0);
}

uint64_t sub_1000195BC()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 48) = Strong;
  if (Strong)
  {
    uint64_t v2 = *(void *)(v0 + 40);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v3 = *(void *)(v2 + 88);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_100019714;
    return v8(v4, v3);
  }
  else
  {
    (*(void (**)(uint64_t))(v0 + 24))(-1);
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_100019714(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1000198AC;
  }
  else
  {
    swift_unknownObjectRelease();
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_100019844;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100019844()
{
  (*(void (**)(void))(v0 + 24))(*(void *)(v0 + 72));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000198AC()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 24);
  swift_unknownObjectRelease();
  v1(-1);
  swift_errorRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100019930(void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = a1;
  sub_1000194B0((uint64_t)sub_10001B020, v5);

  return swift_release();
}

uint64_t sub_1000199BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Transaction();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  id v8 = v3;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  return swift_release();
}

uint64_t sub_100019A70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = swift_isaMask & *a1;
  return _swift_task_switch(sub_100019ACC, 0, 0);
}

uint64_t sub_100019ACC()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v3 = *(void *)(v2 + 88);
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_100019C3C;
    uint64_t v6 = *(void *)(v0 + 24);
    return v9(v6, v4, v3);
  }
  else
  {
    (*(void (**)(void *))(v0 + 32))(&_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    id v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_100019C3C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100019DE0;
  }
  else
  {
    swift_unknownObjectRelease();
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_100019D6C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100019D6C()
{
  (*(void (**)(void))(v0 + 32))(*(void *)(v0 + 80));
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100019DE0()
{
  uint64_t v1 = *(void (**)(void *))(v0 + 32);
  swift_unknownObjectRelease();
  v1(&_swiftEmptyArrayStorage);
  swift_errorRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100019E68(void *a1, int a2, uint64_t a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a1;
  sub_1000199BC(a3, (uint64_t)sub_10001AEA4, v7);

  return swift_release();
}

void sub_100019EFC(uint64_t a1, uint64_t a2)
{
  sub_10001AFE0();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

uint64_t sub_100019F68(void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = a1;
  sub_10001AC2C((void (*)(void))sub_10001ADE0);

  return swift_release();
}

void sub_10001A038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_10001A0A8(void *a1, int a2, int a3, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = qword_100028D98;
  id v11 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100006394(v7, (uint64_t)qword_100029C48);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "TRACE: Trampoline offlineAdvertisingKeys:completion:", v10, 2u);
    swift_slowDealloc();
  }

  _Block_release(v5);
}

uint64_t sub_10001A1BC(void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void (**)(void))_Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = qword_100028D98;
  id v12 = a1;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100006394(v13, (uint64_t)qword_100029C48);
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "poisonBeaconIdentifier is not supported by FindMyBeaconDaemon!", v16, 2u);
    swift_slowDealloc();
  }

  v10[2](v10);
  _Block_release(v10);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_10001A380(void *a1, int a2, void *a3)
{
}

void sub_10001A38C(void *a1, int a2, void *a3)
{
}

void sub_10001A398(void *a1, int a2, void *aBlock, const char *a4)
{
  uint64_t v6 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v7 = qword_100028D98;
  id v12 = a1;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100006394(v8, (uint64_t)qword_100029C48);
  os_log_type_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a4, v11, 2u);
    swift_slowDealloc();
  }

  v6[2](v6, 0);
  _Block_release(v6);
}

void sub_10001A4C8(void *a1, int a2, int a3, void *a4)
{
}

void sub_10001A4D4(void *a1, int a2, int a3, void *a4)
{
}

void sub_10001A4E0(void *a1, int a2, int a3, void *aBlock, const char *a5)
{
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v8 = qword_100028D98;
  id v13 = a1;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100006394(v9, (uint64_t)qword_100029C48);
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a5, v12, 2u);
    swift_slowDealloc();
  }

  v7[2](v7);
  _Block_release(v7);
}

void sub_10001A60C(void *a1)
{
  uint64_t v1 = qword_100028D98;
  id v2 = a1;
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100006394(v3, (uint64_t)qword_100029C48);
  oslog = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "bluetoothPowerStateUpdated is not supported by FindMyBeaconDaemon!", v5, 2u);
    swift_slowDealloc();
  }
}

void sub_10001A708()
{
}

uint64_t sub_10001A74C(uint64_t a1)
{
  return _swift_unknownObjectWeakDestroy(a1 + qword_100029830);
}

uint64_t type metadata accessor for LocalBeaconingXPCService.Trampoline()
{
  return sub_100010FFC();
}

uint64_t sub_10001A774(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10001ADE8(&qword_100029928, a2, (void (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10001A7CC(uint64_t a1, uint64_t a2)
{
  return sub_10001ADE8(qword_100029930, a2, (void (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService);
}

uint64_t sub_10001A814(uint64_t a1, uint64_t a2)
{
  return sub_10001ADE8(&qword_100029928, a2, (void (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService);
}

uint64_t sub_10001A85C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000069B8(v0, qword_100029C60);
  sub_100006394(v0, (uint64_t)qword_100029C60);
  return Logger.init(subsystem:category:)();
}

unint64_t sub_10001A8E0()
{
  unint64_t result = qword_100029970;
  if (!qword_100029970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029970);
  }
  return result;
}

unint64_t sub_10001A934(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006974(&qword_1000299A8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001AE30(v6, (uint64_t)&v15, &qword_1000299B0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001AA6C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    os_log_type_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *os_log_type_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10001AE94(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10001AA6C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001AAE4(a1, a2, v4);
}

unint64_t sub_10001AAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

void sub_10001AC2C(void (*a1)(void))
{
  if (qword_100028D98 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006394(v2, (uint64_t)qword_100029C48);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "getMacBeaconingConfig is not supported by FindMyBeaconDaemon!", v5, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for SPBeaconManagerError(0);
  sub_10001A934((uint64_t)&_swiftEmptyArrayStorage);
  sub_10001ADE8(&qword_1000299A0, 255, type metadata accessor for SPBeaconManagerError);
  _BridgedStoredNSError.init(_:userInfo:)();
  a1(0);
}

uint64_t sub_10001ADA8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001ADE0(uint64_t a1, uint64_t a2)
{
  sub_10001A038(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001ADE8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001AE30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006974(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10001AE94(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10001AEA4(uint64_t a1)
{
  sub_100019EFC(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001AEAC()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001AEEC()
{
  long long v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_10000D694;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 48) = swift_isaMask & *v2;
  return _swift_task_switch(sub_100019ACC, 0, 0);
}

unint64_t sub_10001AFE0()
{
  unint64_t result = qword_1000299C8;
  if (!qword_1000299C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000299C8);
  }
  return result;
}

uint64_t sub_10001B020()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001B034()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001B074()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_10000DA7C;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  *(void *)(v3 + 40) = swift_isaMask & *(void *)v4;
  return _swift_task_switch(sub_1000195BC, 0, 0);
}

unsigned char *storeEnumTagSinglePayload for LocalBeaconingXPCService.Entitlement(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001B200);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalBeaconingXPCService.Entitlement()
{
  return &type metadata for LocalBeaconingXPCService.Entitlement;
}

unint64_t sub_10001B23C()
{
  unint64_t result = qword_1000299E0;
  if (!qword_1000299E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000299E0);
  }
  return result;
}

unint64_t sub_10001B294()
{
  unint64_t result = qword_1000299E8;
  if (!qword_1000299E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000299E8);
  }
  return result;
}

uint64_t sub_10001B2F4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for UUID();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_100006974((uint64_t *)&unk_100029580);
  v2[7] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for LocalBeaconKeyInfo();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Table();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_10001B49C, v1, 0);
}

uint64_t sub_10001B49C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + 112);
  *(void *)(v0 + 112) = v1;
  return _swift_task_switch(sub_10001B4C0, v1, 0);
}

uint64_t sub_10001B4C0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  type metadata accessor for StorageDatabase();
  sub_10001D054(&qword_100029238, (void (*)(uint64_t))type metadata accessor for StorageDatabase);
  *(void *)(v0 + 120) = Database.writeConnection.getter();
  return _swift_task_switch(sub_10001B580, v1, 0);
}

uint64_t sub_10001B580()
{
  uint64_t v1 = v0[15];
  if (v1)
  {
    if (qword_100028D40 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[12];
    uint64_t v2 = v0[13];
    uint64_t v4 = v0[11];
    uint64_t v5 = v0[8];
    uint64_t v6 = v0[9];
    uint64_t v7 = v0[7];
    uint64_t v8 = v0[2];
    uint64_t v9 = sub_100006394(v4, (uint64_t)qword_100029B20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v9, v4);
    sub_100014264(v8, v7);
    int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
    uint64_t v12 = v0[12];
    uint64_t v11 = v0[13];
    uint64_t v26 = v0[11];
    if (v10 == 1)
    {
      uint64_t v13 = v0[6];
      uint64_t v14 = v0[4];
      uint64_t v15 = v0[5];
      sub_10000CA6C(v0[7], (uint64_t *)&unk_100029580);
      uint64_t v16 = swift_task_alloc();
      *(void *)(v16 + 16) = v11;
      *(void *)(v16 + 24) = v1;
      UUID.init()();
      UUID.uuidString.getter();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
      Connection.savepoint(_:block:)();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v26);
      swift_bridgeObjectRelease();
      swift_release();
      swift_task_dealloc();
    }
    else
    {
      uint64_t v19 = v0[10];
      uint64_t v20 = v0[6];
      uint64_t v21 = v0[5];
      uint64_t v25 = v0[4];
      sub_100015790(v0[7], v19);
      uint64_t v22 = (void *)swift_task_alloc();
      void v22[2] = v11;
      v22[3] = v19;
      v22[4] = v1;
      UUID.init()();
      UUID.uuidString.getter();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v25);
      Connection.savepoint(_:block:)();
      swift_bridgeObjectRelease();
      swift_release();
      swift_task_dealloc();
      sub_10000A2A4(v19);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v26);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v17 = type metadata accessor for DatabaseError();
    sub_10001D054(&qword_100029AC0, (void (*)(uint64_t))&type metadata accessor for DatabaseError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v18, enum case for DatabaseError.notConnected(_:), v17);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
  }
  return v23();
}

uint64_t sub_10001B928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = a3;
  uint64_t v27 = a1;
  uint64_t v3 = type metadata accessor for OnConflict();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Insert();
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  __chkstk_darwin(v7);
  uint64_t v26 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v4;
  uint64_t v29 = v3;
  uint64_t v9 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  uint64_t v25 = v6;
  v9(v6, enum case for OnConflict.replace(_:), v3);
  sub_100006974(&qword_100029AE8);
  type metadata accessor for Setter();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001F1C0;
  v24[1] = v10;
  if (qword_100028D48 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100006974(&qword_1000291E0);
  sub_100006394(v11, (uint64_t)qword_100029B38);
  uint64_t v33 = 1;
  <- infix<A>(_:_:)();
  if (qword_100028D50 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100006974(&qword_1000291F0);
  sub_100006394(v12, (uint64_t)qword_100029B50);
  type metadata accessor for UUID();
  <- infix<A>(_:_:)();
  if (qword_100028D58 != -1) {
    swift_once();
  }
  sub_100006394(v12, (uint64_t)qword_100029B68);
  type metadata accessor for LocalBeaconKeyInfo();
  <- infix<A>(_:_:)();
  if (qword_100028D60 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100006974(&qword_1000291F8);
  sub_100006394(v13, (uint64_t)qword_100029B80);
  type metadata accessor for Date();
  <- infix<A>(_:_:)();
  if (qword_100028D68 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_100006974(&qword_100029200);
  sub_100006394(v14, (uint64_t)qword_100029B98);
  uint64_t v15 = PublicKey.data.getter();
  unint64_t v17 = v16;
  uint64_t v33 = v15;
  unint64_t v34 = v16;
  <- infix<A>(_:_:)();
  sub_10000A0A8(v15, v17);
  if (qword_100028D70 != -1) {
    swift_once();
  }
  sub_100006394(v14, (uint64_t)qword_100029BB0);
  uint64_t v18 = SharedSecretKey.data.getter();
  unint64_t v20 = v19;
  uint64_t v33 = v18;
  unint64_t v34 = v19;
  <- infix<A>(_:_:)();
  sub_10000A0A8(v18, v20);
  type metadata accessor for Table();
  uint64_t v22 = v25;
  uint64_t v21 = v26;
  QueryType.insert(or:_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v29);
  Connection.run(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v21, v31);
}

uint64_t sub_10001BEB0()
{
  uint64_t v0 = type metadata accessor for Delete();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Table();
  QueryType.delete()();
  Connection.run(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001BFAC(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  sub_100006974(&qword_100029AB8);
  v2[9] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Row();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Table();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  return _swift_task_switch(sub_10001C124, v1, 0);
}

uint64_t sub_10001C124()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64) + 112);
  *(void *)(v0 + 152) = v1;
  return _swift_task_switch(sub_10001C148, v1, 0);
}

uint64_t sub_10001C148()
{
  uint64_t v1 = *(void *)(v0 + 64);
  type metadata accessor for StorageDatabase();
  sub_10001D054(&qword_100029238, (void (*)(uint64_t))type metadata accessor for StorageDatabase);
  *(void *)(v0 + 160) = Database.readConnection.getter();
  return _swift_task_switch(sub_10001C208, v1, 0);
}

uint64_t sub_10001C208()
{
  if (v0[20])
  {
    if (qword_100028D40 != -1) {
      swift_once();
    }
    uint64_t v1 = v0[18];
    uint64_t v3 = v0[14];
    uint64_t v2 = v0[15];
    uint64_t v4 = sub_100006394(v3, (uint64_t)qword_100029B20);
    v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v56(v1, v4, v3);
    sub_100006974(&qword_100029AC8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_10001F1D0;
    if (qword_100028D50 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100006974(&qword_1000291F0);
    uint64_t v7 = sub_100006394(v6, (uint64_t)qword_100029B50);
    *(void *)(v5 + 56) = v6;
    uint64_t v8 = sub_10001D004(&qword_100029AD0, &qword_1000291F0);
    *(void *)(v5 + 64) = v8;
    uint64_t v9 = sub_1000162DC((uint64_t *)(v5 + 32));
    uint64_t v10 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
    v10(v9, v7, v6);
    if (qword_100028D58 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100006394(v6, (uint64_t)qword_100029B68);
    *(void *)(v5 + 96) = v6;
    *(void *)(v5 + 104) = v8;
    uint64_t v12 = sub_1000162DC((uint64_t *)(v5 + 72));
    v10(v12, v11, v6);
    if (qword_100028D60 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100006974(&qword_1000291F8);
    uint64_t v14 = sub_100006394(v13, (uint64_t)qword_100029B80);
    *(void *)(v5 + 136) = v13;
    *(void *)(v5 + 144) = sub_10001D004(&qword_100029AD8, &qword_1000291F8);
    uint64_t v15 = sub_1000162DC((uint64_t *)(v5 + 112));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v15, v14, v13);
    if (qword_100028D68 != -1) {
      swift_once();
    }
    uint64_t v55 = v0 + 2;
    uint64_t v16 = sub_100006974(&qword_100029200);
    uint64_t v17 = sub_100006394(v16, (uint64_t)qword_100029B98);
    *(void *)(v5 + 176) = v16;
    uint64_t v18 = sub_10001D004(&qword_100029AE0, &qword_100029200);
    *(void *)(v5 + 184) = v18;
    unint64_t v19 = sub_1000162DC((uint64_t *)(v5 + 152));
    unint64_t v20 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
    v20(v19, v17, v16);
    if (qword_100028D70 != -1) {
      swift_once();
    }
    uint64_t v21 = v0[16];
    uint64_t v54 = v0[17];
    uint64_t v22 = v0[14];
    uint64_t v23 = v0[15];
    uint64_t v24 = sub_100006394(v16, (uint64_t)qword_100029BB0);
    *(void *)(v5 + 216) = v16;
    *(void *)(v5 + 224) = v18;
    uint64_t v25 = sub_1000162DC((uint64_t *)(v5 + 192));
    v20(v25, v24, v16);
    SchemaType.select(_:)();
    swift_bridgeObjectRelease();
    QueryType.limit(_:)();
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v26(v21, v22);
    v0[5] = v22;
    v0[6] = &protocol witness table for Table;
    uint64_t v27 = sub_1000162DC(v55);
    v56((uint64_t)v27, v54, v22);
    Connection.prepare(_:)();
    sub_10000A1F0((uint64_t)v55);
    uint64_t v32 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()();
    swift_release();
    if (*(void *)(v32 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[11] + 16))(v0[9], v32 + ((*(unsigned __int8 *)(v0[11] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[11] + 80)), v0[10]);
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = 1;
    }
    uint64_t v34 = v0[10];
    uint64_t v35 = v0[11];
    uint64_t v36 = v0[9];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v36, v33, 1, v34);
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v36, 1, v34) == 1)
    {
      uint64_t v37 = v0[17];
      uint64_t v38 = v0[18];
      uint64_t v39 = v0[14];
      uint64_t v40 = v0[9];
      swift_release();
      v26(v37, v39);
      v26(v38, v39);
      sub_10000CA6C(v40, &qword_100029AB8);
      uint64_t v41 = 1;
    }
    else
    {
      uint64_t v42 = v0[12];
      uint64_t v43 = v0[13];
      uint64_t v44 = v0[10];
      uint64_t v45 = v0[11];
      uint64_t v46 = v0[7];
      (*(void (**)(uint64_t, void, uint64_t))(v45 + 32))(v43, v0[9], v44);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v42, v43, v44);
      sub_10001CA2C(v42, v46);
      uint64_t v47 = v0[17];
      uint64_t v57 = v0[18];
      uint64_t v49 = v0[13];
      uint64_t v48 = v0[14];
      uint64_t v50 = v0[10];
      uint64_t v51 = v0[11];
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v49, v50);
      v26(v47, v48);
      v26(v57, v48);
      uint64_t v41 = 0;
    }
    uint64_t v52 = v0[7];
    uint64_t v53 = type metadata accessor for LocalBeaconKeyInfo();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, v41, 1, v53);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v28 = type metadata accessor for DatabaseError();
    sub_10001D054(&qword_100029AC0, (void (*)(uint64_t))&type metadata accessor for DatabaseError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v28 - 8) + 104))(v29, enum case for DatabaseError.notConnected(_:), v28);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = (uint64_t (*)(void))v0[1];
  }
  return v30();
}

uint64_t sub_10001CA2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = type metadata accessor for SharedSecretKey();
  uint64_t v23 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PublicKey();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028D50 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100006974(&qword_1000291F0);
  sub_100006394(v10, (uint64_t)qword_100029B50);
  uint64_t v11 = type metadata accessor for UUID();
  Row.subscript.getter();
  if (qword_100028D58 != -1) {
    swift_once();
  }
  sub_100006394(v10, (uint64_t)qword_100029B68);
  uint64_t v12 = (int *)type metadata accessor for LocalBeaconKeyInfo();
  uint64_t v29 = a2 + v12[5];
  Row.subscript.getter();
  if (qword_100028D60 != -1) {
    swift_once();
  }
  uint64_t v24 = v6;
  uint64_t v13 = sub_100006974(&qword_1000291F8);
  sub_100006394(v13, (uint64_t)qword_100029B80);
  uint64_t v14 = a2 + v12[6];
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v28 = v14;
  Row.subscript.getter();
  if (qword_100028D68 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100006974(&qword_100029200);
  sub_100006394(v16, (uint64_t)qword_100029B98);
  Row.subscript.getter();
  PublicKey.init(data:)();
  if (v2)
  {
    uint64_t v17 = type metadata accessor for Row();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1, v17);
    unint64_t v20 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    v20(a2, v11);
    v20(v29, v11);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v28, v15);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(a2 + v12[7], v9, v27);
    if (qword_100028D70 != -1) {
      swift_once();
    }
    sub_100006394(v16, (uint64_t)qword_100029BB0);
    Row.subscript.getter();
    sub_10001D054(&qword_100029060, (void (*)(uint64_t))&type metadata accessor for SharedSecretKey);
    uint64_t v18 = v24;
    uint64_t v19 = v25;
    KeyRepresentable<>.init(data:)();
    uint64_t v22 = type metadata accessor for Row();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(a1, v22);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(a2 + v12[8], v18, v19);
  }
}

uint64_t sub_10001CFA8()
{
  swift_release();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for StorageStore()
{
  return self;
}

uint64_t sub_10001D004(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CAC8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001D054(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001D09C()
{
  return sub_10001BEB0();
}

uint64_t sub_10001D0B8()
{
  return sub_10001B928(v0[2], v0[3], v0[4]);
}

uint64_t static SystemInfo.isFactoryBuild.getter()
{
  return static SystemInfo.isFactoryBuild.getter();
}

uint64_t static Transaction.currentNSXPCConnection.getter()
{
  return static Transaction.currentNSXPCConnection.getter();
}

uint64_t static Transaction.asyncTask(name:block:)()
{
  return static Transaction.asyncTask(name:block:)();
}

uint64_t type metadata accessor for Transaction()
{
  return type metadata accessor for Transaction();
}

uint64_t deoptionalize<A>(_:)()
{
  return deoptionalize<A>(_:)();
}

uint64_t type metadata accessor for MachServiceName()
{
  return type metadata accessor for MachServiceName();
}

uint64_t MachServiceName.init(_:)()
{
  return MachServiceName.init(_:)();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t dispatch thunk of XPCSessionManager.register(service:)()
{
  return dispatch thunk of XPCSessionManager.register(service:)();
}

uint64_t type metadata accessor for XPCSessionManager()
{
  return type metadata accessor for XPCSessionManager();
}

uint64_t AsyncStreamProvider.yield(value:transaction:)()
{
  return AsyncStreamProvider.yield(value:transaction:)();
}

uint64_t AsyncStreamProvider.stream(initialEvents:)()
{
  return AsyncStreamProvider.stream(initialEvents:)();
}

uint64_t AsyncStreamProvider.init()()
{
  return AsyncStreamProvider.init()();
}

uint64_t XPCServiceDescription.init(name:exportedObject:exportedInterface:options:requiredEntitlement:shouldAccept:)()
{
  return XPCServiceDescription.init(name:exportedObject:exportedInterface:options:requiredEntitlement:shouldAccept:)();
}

uint64_t type metadata accessor for XPCServiceDescription()
{
  return type metadata accessor for XPCServiceDescription();
}

uint64_t OnceCheckedContinuation.resume(throwing:)()
{
  return OnceCheckedContinuation.resume(throwing:)();
}

uint64_t OnceCheckedContinuation.resume<>()()
{
  return OnceCheckedContinuation.resume<>()();
}

uint64_t type metadata accessor for Feature.FindMy()
{
  return type metadata accessor for Feature.FindMy();
}

uint64_t type metadata accessor for Keychain.DataProtectionClass()
{
  return type metadata accessor for Keychain.DataProtectionClass();
}

uint64_t static Keychain.set<A>(data:account:service:dataProtectionClass:)()
{
  return static Keychain.set<A>(data:account:service:dataProtectionClass:)();
}

uint64_t static Keychain.data(account:service:)()
{
  return static Keychain.data(account:service:)();
}

uint64_t DataProtocol.hexString.getter()
{
  return DataProtocol.hexString.getter();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)DateInterval._bridgeToObjectiveC()();
}

uint64_t static DateInterval._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t DateInterval.init(start:duration:)()
{
  return DateInterval.init(start:duration:)();
}

uint64_t type metadata accessor for DateInterval()
{
  return type metadata accessor for DateInterval();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data.random(bytes:)()
{
  return static Data.random(bytes:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Connection.run(_:_:)()
{
  return Connection.run(_:_:)();
}

uint64_t Connection.run(_:)()
{
  return Connection.run(_:)();
}

{
  return Connection.run(_:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Connection.execute(_:)(Swift::String a1)
{
}

uint64_t Connection.prepare(_:)()
{
  return Connection.prepare(_:)();
}

uint64_t Connection.savepoint(_:block:)()
{
  return Connection.savepoint(_:block:)();
}

uint64_t type metadata accessor for OnConflict()
{
  return type metadata accessor for OnConflict();
}

uint64_t SchemaType.select(_:)()
{
  return SchemaType.select(_:)();
}

uint64_t TableBuilder.column<A>(_:primaryKey:check:defaultValue:)()
{
  return TableBuilder.column<A>(_:primaryKey:check:defaultValue:)();
}

uint64_t TableBuilder.column<A>(_:unique:check:defaultValue:)()
{
  return TableBuilder.column<A>(_:unique:check:defaultValue:)();
}

uint64_t ExpressionType.init(_:)()
{
  return ExpressionType.init(_:)();
}

uint64_t <- infix<A>(_:_:)()
{
  return <- infix<A>(_:_:)();
}

uint64_t type metadata accessor for Row()
{
  return type metadata accessor for Row();
}

uint64_t Row.subscript.getter()
{
  return Row.subscript.getter();
}

uint64_t Table.create(temporary:ifNotExists:withoutRowid:block:)()
{
  return Table.create(temporary:ifNotExists:withoutRowid:block:)();
}

uint64_t type metadata accessor for Table()
{
  return type metadata accessor for Table();
}

uint64_t Table.init(_:database:)()
{
  return Table.init(_:database:)();
}

uint64_t type metadata accessor for Delete()
{
  return type metadata accessor for Delete();
}

uint64_t type metadata accessor for Insert()
{
  return type metadata accessor for Insert();
}

uint64_t type metadata accessor for Setter()
{
  return type metadata accessor for Setter();
}

uint64_t QueryType.limit(_:)()
{
  return QueryType.limit(_:)();
}

uint64_t QueryType.delete()()
{
  return QueryType.delete()();
}

uint64_t QueryType.insert(or:_:)()
{
  return QueryType.insert(or:_:)();
}

uint64_t static ReferenceClock.now.getter()
{
  return static ReferenceClock.now.getter();
}

uint64_t type metadata accessor for PrivateKey()
{
  return type metadata accessor for PrivateKey();
}

uint64_t dateInterval(baseTime:bucket:bucketSizeInMinutes:)()
{
  return dateInterval(baseTime:bucket:bucketSizeInMinutes:)();
}

uint64_t Advertisement.data.getter()
{
  return Advertisement.data.getter();
}

uint64_t Advertisement.nearOwner.getter()
{
  return Advertisement.nearOwner.getter();
}

uint64_t type metadata accessor for Advertisement()
{
  return type metadata accessor for Advertisement();
}

uint64_t TokenSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)()
{
  return TokenSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)();
}

uint64_t TokenSequence.next()()
{
  return TokenSequence.next()();
}

uint64_t type metadata accessor for TokenSequence()
{
  return type metadata accessor for TokenSequence();
}

uint64_t GeneratedTokens.diversifiedRootKeys.getter()
{
  return GeneratedTokens.diversifiedRootKeys.getter();
}

uint64_t GeneratedTokens.hint.getter()
{
  return GeneratedTokens.hint.getter();
}

uint64_t type metadata accessor for GeneratedTokens()
{
  return type metadata accessor for GeneratedTokens();
}

uint64_t SharedSecretKey.data.getter()
{
  return SharedSecretKey.data.getter();
}

uint64_t type metadata accessor for SharedSecretKey()
{
  return type metadata accessor for SharedSecretKey();
}

uint64_t KeyRepresentable<>.init(data:)()
{
  return KeyRepresentable<>.init(data:)();
}

uint64_t KeyGenerationHint.index.getter()
{
  return KeyGenerationHint.index.getter();
}

uint64_t type metadata accessor for KeyGenerationHint()
{
  return type metadata accessor for KeyGenerationHint();
}

uint64_t DiversifiedRootKeys.publicKey.getter()
{
  return DiversifiedRootKeys.publicKey.getter();
}

uint64_t type metadata accessor for DiversifiedRootKeys()
{
  return type metadata accessor for DiversifiedRootKeys();
}

uint64_t NearOwnerAdvertisement.data.getter()
{
  return NearOwnerAdvertisement.data.getter();
}

uint64_t type metadata accessor for NearOwnerAdvertisement()
{
  return type metadata accessor for NearOwnerAdvertisement();
}

uint64_t bucket(beaconIdentifier:baseTime:date:bucketSizeInMinutes:)()
{
  return bucket(beaconIdentifier:baseTime:date:bucketSizeInMinutes:)();
}

uint64_t PublicKey.advertisement.getter()
{
  return PublicKey.advertisement.getter();
}

uint64_t PublicKey.data.getter()
{
  return PublicKey.data.getter();
}

uint64_t PublicKey.init(data:)()
{
  return PublicKey.init(data:)();
}

uint64_t type metadata accessor for PublicKey()
{
  return type metadata accessor for PublicKey();
}

uint64_t type metadata accessor for DatabaseError()
{
  return type metadata accessor for DatabaseError();
}

uint64_t type metadata accessor for DatabaseState()
{
  return type metadata accessor for DatabaseState();
}

uint64_t Database.description.getter()
{
  return Database.description.getter();
}

uint64_t Database.readConnection.getter()
{
  return Database.readConnection.getter();
}

uint64_t Database.writeConnection.getter()
{
  return Database.writeConnection.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.createIfNecessary()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.purge()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.reset()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.startup()()
{
}

uint64_t Daemon.identifier.getter()
{
  return Daemon.identifier.getter();
}

uint64_t type metadata accessor for Daemon()
{
  return type metadata accessor for Daemon();
}

uint64_t ActorServiceProtocol.description.getter()
{
  return ActorServiceProtocol.description.getter();
}

Swift::Void __swiftcall initializeFindMyBeaconingSupport()()
{
}

uint64_t keyDuration.getter()
{
  return keyDuration.getter();
}

Swift::Void __swiftcall logInUse()()
{
}

uint64_t getBeacon(device:count:swizzler:)()
{
  return getBeacon(device:count:swizzler:)();
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

uint64_t LocalBeaconKeyInfo.sharedSecretKey.getter()
{
  return LocalBeaconKeyInfo.sharedSecretKey.getter();
}

uint64_t LocalBeaconKeyInfo.publicKey.getter()
{
  return LocalBeaconKeyInfo.publicKey.getter();
}

uint64_t LocalBeaconKeyInfo.userIdentifier.getter()
{
  return LocalBeaconKeyInfo.userIdentifier.getter();
}

uint64_t LocalBeaconKeyInfo.beaconIdentifier.getter()
{
  return LocalBeaconKeyInfo.beaconIdentifier.getter();
}

uint64_t LocalBeaconKeyInfo.pairDate.getter()
{
  return LocalBeaconKeyInfo.pairDate.getter();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
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

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t NSXPCConnection.hasEntitlement<A>(_:)()
{
  return NSXPCConnection.hasEntitlement<A>(_:)();
}

uint64_t NSXPCConnection.shortDescription.getter()
{
  return NSXPCConnection.shortDescription.getter();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of _AnySequenceBox.__copyToContiguousArray()()
{
  return dispatch thunk of _AnySequenceBox.__copyToContiguousArray()();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void exit(int a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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
  return [super a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_job_run()
{
  return _swift_job_run();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_task_asyncMainDrainQueue()
{
  return _swift_task_asyncMainDrainQueue();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}