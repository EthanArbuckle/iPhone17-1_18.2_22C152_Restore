uint64_t sub_10000473C()
{
  uint64_t result;
  NSObject *v1;

  result = _set_user_dir_suffix();
  if ((result & 1) == 0)
  {
    v1 = UVLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10002F3D0(v1);
    }

    exit(78);
  }
  return result;
}

dispatch_workloop_t sub_100004794(const char *a1)
{
  dispatch_workloop_t v1 = dispatch_workloop_create(a1);

  return v1;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v22 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = v8;
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "previewsd starting up", v16, 2u);
    uint64_t v8 = v21;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_10000473C();
  v17 = sub_100004794("com.apple.previewsd.workloop");
  qword_10003DEA0 = (uint64_t)v17;
  type metadata accessor for Daemon();
  swift_allocObject();
  qword_10003DEA8 = (uint64_t)sub_10001C334((uint64_t)v17);
  aBlock[4] = sub_100004B60;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004B88;
  aBlock[3] = &unk_100039350;
  v18 = _Block_copy(aBlock);
  v19 = v22;
  static DispatchQoS.unspecified.getter();
  v23 = &_swiftEmptyArrayStorage;
  sub_100004BE4();
  sub_100004C3C((uint64_t *)&unk_10003CD70);
  sub_100004C80();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v19, v7);
  dispatch_main();
}

uint64_t sub_100004B60()
{
  return sub_10001CF00();
}

uint64_t sub_100004B88(uint64_t a1)
{
  dispatch_workloop_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100004BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004BDC()
{
  return swift_release();
}

unint64_t sub_100004BE4()
{
  unint64_t result = qword_10003D880;
  if (!qword_10003D880)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D880);
  }
  return result;
}

uint64_t sub_100004C3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004C80()
{
  unint64_t result = qword_10003D890;
  if (!qword_10003D890)
  {
    sub_100004CDC((uint64_t *)&unk_10003CD70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D890);
  }
  return result;
}

uint64_t sub_100004CDC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

BOOL sub_100004D24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100004D38(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100004D40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100004D54(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100004D84(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100004D98(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_100004DAC(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_100004DC0(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100004DCC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100004DD8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004DE4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t *sub_100004DF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for PreviewsService.Variant();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004C3C(&qword_10003CEA0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_100004F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100004C3C(&qword_10003CEA0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100004FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_10000506C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000051E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000052A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000052B4);
}

uint64_t sub_1000052B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100004C3C(&qword_10003CEA0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000053B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000053C4);
}

uint64_t sub_1000053C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for PreviewsService.Variant();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100004C3C(&qword_10003CEA0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for PreviewShellProxy()
{
  uint64_t result = qword_10003CF00;
  if (!qword_10003CF00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100005518()
{
  type metadata accessor for PreviewsService.Variant();
  if (v0 <= 0x3F)
  {
    sub_1000055E0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000055E0()
{
  if (!qword_10003CF10)
  {
    sub_100004CDC(&qword_10003CF18);
    sub_100007644((unint64_t *)&qword_10003CF20, &qword_10003CF18);
    unint64_t v0 = type metadata accessor for ConcurrentOnDemand();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10003CF10);
    }
  }
}

uint64_t sub_100005674(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000570C;
  return sub_100005F04(a2);
}

uint64_t sub_10000570C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return _swift_task_switch(sub_100005858, 0, 0);
  }
}

uint64_t sub_100005858()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000587C(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = sub_100004C3C(&qword_10003CF58);
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  type metadata accessor for PreviewShellProxy();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[8] = v4;
  uint64_t v5 = sub_100004C3C(&qword_10003CEA0);
  *uint64_t v4 = v2;
  v4[1] = sub_1000059A8;
  return ConcurrentOnDemand.value.getter(v2 + 2, v5);
}

uint64_t sub_1000059A8()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100005DA4, 0, 0);
  }
  else
  {
    v2[10] = v2[2];
    uint64_t v3 = type metadata accessor for DaemonToShell();
    uint64_t v4 = (void *)swift_task_alloc();
    v2[11] = v4;
    uint64_t v5 = sub_1000074D4(&qword_10003CF60, (void (*)(uint64_t))&type metadata accessor for DaemonToShell);
    *uint64_t v4 = v2;
    v4[1] = sub_100005B7C;
    uint64_t v6 = v2[7];
    return ShellConnection.makeSender<A>(for:)(v6, v3, v3, v5);
  }
}

uint64_t sub_100005B7C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100005E50;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100005C98;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005C98()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  sub_100007644(&qword_10003CF68, &qword_10003CF58);
  sub_1000074D4(&qword_10003CF70, (void (*)(uint64_t))&type metadata accessor for DaemonToShell.TwoWayMessage);
  TransportSenderProtocol<>.send(message:reply:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100005DA4()
{
  TransportReply.send(error:file:line:column:function:)();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005E50()
{
  swift_release();
  TransportReply.send(error:file:line:column:function:)();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005F04(uint64_t a1)
{
  v1[7] = a1;
  uint64_t v2 = type metadata accessor for PropertyList();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for ShellService();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for CancellationToken();
  v1[14] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[15] = v5;
  v1[16] = *(void *)(v5 + 64);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  v1[19] = v6;
  v1[20] = *(void *)(v6 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v1[23] = v7;
  v1[24] = *(void *)(v7 - 8);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_10000616C, 0, 0);
}

uint64_t sub_10000616C()
{
  if (qword_10003CD48 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, char))((char *)&dword_10003D470 + dword_10003D470);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006250;
  uint64_t v2 = *(void *)(v0 + 56);
  return v4(v2, 0);
}

uint64_t sub_100006250(int a1)
{
  uint64_t v3 = *v2;
  *(_DWORD *)(v3 + 260) = a1;
  *(void *)(v3 + 224) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100006DA4;
  }
  else {
    uint64_t v4 = sub_100006368;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100006368()
{
  uint64_t v68 = v0;
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 160);
  static Logger.uv.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int v58 = *(_DWORD *)(v0 + 260);
    os_log_t log = *(os_log_t *)(v0 + 192);
    uint64_t v62 = *(void *)(v0 + 184);
    uint64_t v64 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 160);
    uint64_t v56 = *(void *)(v0 + 152);
    *(void *)type = *(void *)(v0 + 176);
    uint64_t v8 = swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446466;
    sub_1000074D4(&qword_10003CF88, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
    uint64_t v9 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 48) = sub_10001DDE4(v9, v10, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(os_log_type_t *, uint64_t))(v7 + 8))(*(os_log_type_t **)type, v56);
    *(_WORD *)(v8 + 12) = 1026;
    *(_DWORD *)(v0 + 256) = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Successfully launched preview shell (%{public}s): %{public}d", (uint8_t *)v8, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(uint64_t, uint64_t))log[1].isa)(v64, v62);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 208);
    uint64_t v12 = *(void *)(v0 + 184);
    uint64_t v13 = *(void *)(v0 + 192);
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 152));

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 96);
  uint64_t v16 = *(void *)(v0 + 104);
  uint64_t v17 = *(void *)(v0 + 88);
  type metadata accessor for PreviewAssertionManager();
  static PreviewAssertionManager.shared.getter();
  PreviewAssertionManager.takeActivePreviewAssertion(for:)();
  swift_release();
  uint64_t v18 = sub_100004C3C(&qword_10003CF18);
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v16, enum case for ShellService.daemonPreviewService(_:), v17);
  static PropertyList.empty.getter();
  uint64_t v19 = static ShellConnection<>.createByMachLookup(for:variant:clientContext:)();
  *(void *)(v0 + 232) = v19;
  if (v14)
  {
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v22 = *(void *)(v0 + 112);
    uint64_t v21 = *(void *)(v0 + 120);
    uint64_t v24 = *(void *)(v0 + 96);
    uint64_t v23 = *(void *)(v0 + 104);
    uint64_t v25 = *(void *)(v0 + 88);
    (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v27 = *(void *)(v0 + 168);
    uint64_t v28 = *(void *)(v0 + 152);
    uint64_t v29 = *(void *)(v0 + 56);
    static Logger.uv.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v27, v29, v28);
    swift_errorRetain();
    swift_errorRetain();
    v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = *(void *)(v0 + 192);
    uint64_t v34 = *(void *)(v0 + 200);
    uint64_t v65 = *(void *)(v0 + 184);
    uint64_t v36 = *(void *)(v0 + 160);
    uint64_t v35 = *(void *)(v0 + 168);
    uint64_t v37 = *(void *)(v0 + 152);
    if (v32)
    {
      loga = v30;
      uint64_t v38 = swift_slowAlloc();
      v59 = (void *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 136446466;
      uint64_t v66 = v34;
      v67[0] = v63;
      sub_1000074D4(&qword_10003CF88, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
      uint64_t v39 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 16) = sub_10001DDE4(v39, v40, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
      *(_WORD *)(v38 + 12) = 2112;
      swift_errorRetain();
      uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 24) = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v59 = v41;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, loga, v31, "Failed to launch & connect to preview shell (%{public}s): %@", (uint8_t *)v38, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v66, v65);
    }
    else
    {
      (*(void (**)(void, void))(v36 + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v65);
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v54 = *(uint64_t (**)(void))(v0 + 8);
    return v54();
  }
  else
  {
    uint64_t v42 = v19;
    uint64_t v44 = *(void *)(v0 + 136);
    uint64_t v43 = *(void *)(v0 + 144);
    uint64_t v45 = *(void *)(v0 + 120);
    uint64_t v46 = *(void *)(v0 + 104);
    uint64_t v47 = *(void *)(v0 + 112);
    uint64_t v48 = *(void *)(v0 + 88);
    uint64_t v49 = *(void *)(v0 + 96);
    (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v46, v48);
    ShellConnection.activate()();
    *(void *)(v0 + 32) = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v44, v43, v47);
    unint64_t v50 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    uint64_t v51 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v45 + 32))(v51 + v50, v44, v47);
    sub_100007644((unint64_t *)&qword_10003CF20, &qword_10003CF18);
    ConcurrentInvalidatable.onInvalidation(_:)();
    swift_release();
    *(void *)(v0 + 40) = v42;
    v52 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v52;
    uint64_t v53 = sub_100007644(&qword_10003CF98, &qword_10003CF18);
    void *v52 = v0;
    v52[1] = sub_100006BAC;
    return Transport.activation.getter(v18, v53);
  }
}

uint64_t sub_100006BAC()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100007128;
  }
  else {
    uint64_t v2 = sub_100006CC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006CC0()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[18], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[29];
  return v1(v2);
}

uint64_t sub_100006DA4()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[7];
  static Logger.uv.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v20 = v0[24];
    uint64_t v21 = v0[23];
    uint64_t v22 = v0[25];
    uint64_t v7 = v0[20];
    uint64_t v8 = v0[21];
    uint64_t v9 = v0[19];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446466;
    sub_1000074D4(&qword_10003CF88, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
    uint64_t v11 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[2] = sub_10001DDE4(v11, v12, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v19 = v13;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to launch & connect to preview shell (%{public}s): %@", (uint8_t *)v10, 0x16u);
    sub_100004C3C(&qword_10003CF90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  }
  else
  {
    uint64_t v14 = v0[24];
    uint64_t v15 = v0[25];
    uint64_t v16 = v0[23];
    (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_100007128()
{
  uint64_t v27 = v0;
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[7];
  static Logger.uv.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v7, v6);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v23 = v0[24];
    uint64_t v24 = v0[23];
    uint64_t v25 = v0[25];
    uint64_t v10 = v0[20];
    uint64_t v11 = v0[21];
    uint64_t v12 = v0[19];
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    sub_1000074D4(&qword_10003CF88, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[2] = sub_10001DDE4(v14, v15, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    *(_WORD *)(v13 + 12) = 2112;
    swift_errorRetain();
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v22 = v16;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to launch & connect to preview shell (%{public}s): %@", (uint8_t *)v13, 0x16u);
    sub_100004C3C(&qword_10003CF90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  }
  else
  {
    uint64_t v17 = v0[24];
    uint64_t v18 = v0[25];
    uint64_t v19 = v0[23];
    (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_1000074D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000751C()
{
  uint64_t v1 = type metadata accessor for CancellationToken();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000075AC()
{
  return CancellationToken.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t sub_100007644(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004CDC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100007688(uint64_t a1)
{
  unint64_t result = sub_1000076B0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000076B0()
{
  unint64_t result = qword_10003CFA0;
  if (!qword_10003CFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFA0);
  }
  return result;
}

unint64_t sub_100007704(uint64_t a1)
{
  unint64_t result = sub_10000772C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000772C()
{
  unint64_t result = qword_10003CFA8[0];
  if (!qword_10003CFA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003CFA8);
  }
  return result;
}

uint64_t sub_100007784()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000077DC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_1000077FC, 0, 0);
}

uint64_t sub_1000077FC()
{
  if (qword_10003CD48 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, char))((char *)&dword_10003D470 + dword_10003D470);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000078E0;
  uint64_t v2 = *(void *)(v0 + 24);
  return v4(v2, 0);
}

uint64_t sub_1000078E0(int a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(_DWORD *)(v4 + 40) = a1;
    return _swift_task_switch(sub_100007A2C, 0, 0);
  }
}

uint64_t sub_100007A2C()
{
  **(_DWORD **)(v0 + 16) = *(_DWORD *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007A50(double a1)
{
  *(double *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007A70, 0, 0);
}

uint64_t sub_100007A70()
{
  double v1 = *(double *)(v0 + 16);
  uint64_t v2 = (void (*)(double))static TimeoutError.timedOut(waitingFor:)();
  type metadata accessor for TimeoutError();
  sub_100007DA0();
  uint64_t v3 = swift_allocError();
  v2(v1);
  swift_release();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_100007B3C()
{
  return CancellationToken.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t sub_100007B9C()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_100007BCC()
{
  sub_100007B9C();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for PipeListener()
{
  return sub_100007DF8();
}

uint64_t sub_100007C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void *sub_100007C20(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_100007C50()
{
  return swift_release();
}

void *sub_100007C58(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_100007C9C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *sub_100007CA8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t sub_100007CDC(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_100007D38(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for PipeListener.ClientState()
{
  return sub_100007DF8();
}

unint64_t sub_100007DA0()
{
  unint64_t result = qword_10003D0B8;
  if (!qword_10003D0B8)
  {
    type metadata accessor for TimeoutError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003D0B8);
  }
  return result;
}

uint64_t sub_100007DF8()
{
  return swift_getGenericMetadata();
}

unint64_t sub_100007E2C()
{
  type metadata accessor for LifecycleMonitor();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  unint64_t result = sub_100007E78((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v0 + 112) = result;
  qword_10003DEB0 = v0;
  return result;
}

unint64_t sub_100007E78(uint64_t a1)
{
  uint64_t v2 = sub_100004C3C(&qword_10003D198);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C3C((uint64_t *)&unk_10003D8D0);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000914C(v12, (uint64_t)v5, &qword_10003D198);
    unint64_t result = sub_100013D9C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for Identifier();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_10000806C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C3C(&qword_10003D1B8);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100013EB4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_100008190(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C3C(&qword_10003D1B0);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100013EB4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_1000082AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C3C(&qword_10003D1A0);
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
    sub_10000914C(v6, (uint64_t)v15, &qword_10003D1A8);
    unint64_t result = sub_100013E70((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000913C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_1000083F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004C3C(&qword_10003D1C0);
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
    sub_10000914C(v6, (uint64_t)&v15, &qword_10003D1C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100013EB4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000913C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100008528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v42 = a4;
  uint64_t v9 = type metadata accessor for Identifier();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  BOOL v13 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v40 - v14;
  id v16 = [self identifierWithPid:a1];
  if (v16)
  {
    id v40 = &v40;
    id v41 = (id)__chkstk_darwin(v16);
    id v36 = v41;
    LOBYTE(v37) = v17;
    HIDWORD(v37) = a1;
    uint64_t v38 = a2;
    uint64_t v39 = a3;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_1000091B0;
    *(void *)(v18 + 24) = &v40 - 6;
    aBlock[4] = sub_1000091D4;
    aBlock[5] = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008D5C;
    aBlock[3] = &unk_100039528;
    uint64_t v19 = _Block_copy(aBlock);
    BOOL v20 = self;
    swift_retain();
    id v21 = [v20 monitorWithConfiguration:v19];
    _Block_release(v19);
    swift_release();
    LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (v19)
    {
      __break(1u);
    }
    else
    {
      uint64_t v23 = v15;
      Identifier.init()();
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
      v24(v13, v23, v9);
      swift_beginAccess();
      id v25 = v21;
      id v40 = v25;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v43 = *(void *)(v5 + 112);
      *(void *)(v5 + 112) = 0x8000000000000000;
      sub_100015328((uint64_t)v25, (uint64_t)v13, isUniquelyReferenced_nonNull_native);
      *(void *)(v5 + 112) = v43;
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
      v27(v13, v9);
      swift_endAccess();
      v24(v13, v23, v9);
      unint64_t v28 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = v5;
      (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v29 + v28, v13, v9);
      swift_retain();
      uint64_t v37 = sub_1000092E0;
      uint64_t v38 = v29;
      LOBYTE(v36) = 2;
      uint64_t v30 = v42;
      CancelationToken<>.init(dsoHandle:file:line:column:function:_:)();

      v27(v23, v9);
      uint64_t v31 = sub_100004C3C(&qword_10003D1D0);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 0, 1, v31);
    }
  }
  else
  {
    uint64_t v32 = sub_100004C3C(&qword_10003D1D0);
    uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
    uint64_t v34 = v32;
    uint64_t v35 = v42;
    return v33(v35, 1, 1, v34);
  }
  return result;
}

void sub_1000089E0(void *a1, uint64_t a2, char a3, int a4, uint64_t a5, uint64_t a6)
{
  char v11 = a3 & 1;
  id v12 = [self predicateMatchingIdentifier:a2];
  sub_100004C3C(&qword_10003D250);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100030B20;
  *(void *)(v13 + 32) = v12;
  v19[0] = v13;
  specialized Array._endMutation()();
  sub_1000095F4();
  id v14 = v12;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a1, "setPredicates:", isa, v19[0]);

  id v16 = [objc_allocWithZone((Class)RBSProcessStateDescriptor) init];
  [v16 setValues:1];
  [a1 setStateDescriptor:v16];
  if (a3) {
    [a1 setEvents:1];
  }
  uint64_t v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = a4;
  *(unsigned char *)(v17 + 20) = v11;
  *(void *)(v17 + 24) = a5;
  *(void *)(v17 + 32) = a6;
  v19[4] = sub_10000966C;
  v19[5] = v17;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_100008CBC;
  v19[3] = &unk_1000395C8;
  uint64_t v18 = _Block_copy(v19);
  swift_retain();
  swift_release();
  [a1 setUpdateHandler:v18];
  _Block_release(v18);
}

void sub_100008BF8(int a1, id a2, void *a3, int a4, char a5, void (*a6)(void))
{
  if ([a2 pid] == a4)
  {
    if (a5)
    {
      id v12 = [a3 exitEvent];
      if (!v12) {
        return;
      }
    }
    else
    {
      id v9 = [a3 state];
      if (!v9) {
        return;
      }
      uint64_t v10 = v9;
      unsigned int v11 = [v9 taskState];

      if (v11 != 3) {
        return;
      }
    }
    a6();
  }
}

void sub_100008CBC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(id, id, id))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, v8, v9);
  swift_release();
}

uint64_t sub_100008D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_100008DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Identifier();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v12 = (char *)swift_allocObject();
  *((void *)v12 + 2) = 0;
  *((void *)v12 + 3) = 0;
  *((void *)v12 + 4) = a1;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_1000199C4((uint64_t)v9, (uint64_t)&unk_10003D248, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_100008F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_100008FA4, a4, 0);
}

uint64_t sub_100008FA4()
{
  sub_100009004(*(void *)(v0 + 24));
  double v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100009004(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 112);
  if (*(void *)(v3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v4 = sub_100013D9C(a1);
    if (v5)
    {
      id v6 = *(id *)(*(void *)(v3 + 56) + 8 * v4);
      swift_bridgeObjectRelease();
      [v6 invalidate];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  uint64_t v7 = (void *)sub_100010494(a1);
  swift_endAccess();
}

uint64_t sub_1000090D4()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for LifecycleMonitor()
{
  return self;
}

uint64_t sub_100009130()
{
  return v0;
}

_OWORD *sub_10000913C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000914C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004C3C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1000091B0(void *a1)
{
  sub_1000089E0(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(_DWORD *)(v1 + 28), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1000091C4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000091D4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000091FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000920C()
{
  return swift_release();
}

uint64_t sub_100009214()
{
  uint64_t v1 = type metadata accessor for Identifier();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000092E0()
{
  uint64_t v1 = *(void *)(type metadata accessor for Identifier() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100008DB0(v2, v3);
}

uint64_t sub_100009344()
{
  uint64_t v1 = type metadata accessor for Identifier();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100009418()
{
  uint64_t v2 = *(void *)(type metadata accessor for Identifier() - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[2] = v3;
  v5[3] = v4;
  v5[1] = sub_100009500;
  return _swift_task_switch(sub_100008FA4, v3, 0);
}

uint64_t sub_100009500()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1000095F4()
{
  unint64_t result = qword_10003D258;
  if (!qword_10003D258)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003D258);
  }
  return result;
}

uint64_t sub_100009634()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000966C(int a1, void *a2, void *a3)
{
  sub_100008BF8(a1, a2, a3, *(_DWORD *)(v3 + 16), *(unsigned char *)(v3 + 20), *(void (**)(void))(v3 + 24));
}

void *sub_100009684(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for PreviewsService.Variant();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
    uint64_t v13 = &v9[v12];
    uint64_t v14 = v10 + v12;
    uint64_t v15 = sub_100004C3C(&qword_10003CEA0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return v4;
}

uint64_t sub_1000097E0(uint64_t a1, uint64_t a2)
{
  sub_1000098A0(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v4 + *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v7 = sub_100004C3C(&qword_10003CEA0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t sub_1000098A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000098F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t *sub_1000099F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_100009AC8(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t *sub_100009AC8(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_100009CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  uint64_t v9 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = v7 + v9;
  uint64_t v12 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

uint64_t sub_100009DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000098A0(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100009EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009EC8);
}

uint64_t sub_100009EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PreviewShellProxy();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100009F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009F8C);
}

uint64_t sub_100009F8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for PreviewShellProxy();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AppManagerDaemon()
{
  uint64_t result = qword_10003D2B8;
  if (!qword_10003D2B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A080()
{
  uint64_t result = type metadata accessor for PreviewShellProxy();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_10000A118()
{
  return &protocol witness table for AppManagerInterface;
}

void *sub_10000A124()
{
  return &protocol witness table for Never;
}

uint64_t sub_10000A130@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100004C3C(&qword_10003CEA0);
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  __chkstk_darwin(v4);
  uint64_t v32 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v29 - v11;
  uint64_t v13 = type metadata accessor for PreviewShellProxy();
  uint64_t v14 = v13 - 8;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v31 = (uint64_t)&v29 - v18;
  uint64_t v19 = type metadata accessor for ExecutionLane();
  __chkstk_darwin(v19 - 8);
  static ExecutionLane.any.getter();
  type metadata accessor for FutureSerialQueue();
  swift_allocObject();
  uint64_t v20 = FutureSerialQueue.init(on:)();
  uint64_t v30 = a2;
  a2[3] = (uint64_t)&type metadata for EmbeddedAppInstaller;
  a2[4] = (uint64_t)&off_10003A0C8;
  *a2 = v20;
  id v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v21(v12, (uint64_t)a1, v6);
  v21(v17, (uint64_t)v12, v6);
  v21(v10, (uint64_t)v12, v6);
  unint64_t v22 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v23 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v23 + v22, v10, v6);
  sub_100004C3C(&qword_10003CF18);
  sub_10000BB04();
  uint64_t v24 = v32;
  ConcurrentOnDemand.init(create:)();
  id v25 = *(void (**)(char *, uint64_t))(v7 + 8);
  v25(v12, v6);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v17[*(int *)(v14 + 28)], v24, v34);
  uint64_t v26 = v31;
  sub_10000BB60((uint64_t)v17, v31);
  v25(a1, v6);
  uint64_t v27 = type metadata accessor for AppManagerDaemon();
  return sub_10000BB60(v26, (uint64_t)v30 + *(int *)(v27 + 20));
}

uint64_t sub_10000A4D4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for ResetAppRequest();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for GrantExecutePermissionRequest();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for CopyURLRequest();
  v2[10] = v5;
  v2[11] = *(void *)(v5 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for UninstallAppsRequest();
  v2[13] = v6;
  v2[14] = *(void *)(v6 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for InstallAppRequest();
  v2[16] = v7;
  v2[17] = *(void *)(v7 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for TransportReply();
  v2[19] = v8;
  v2[20] = *(void *)(v8 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = type metadata accessor for AppManagerInterface.TwoWayMessage();
  v2[23] = swift_task_alloc();
  return _swift_task_switch(sub_10000A790, 0, 0);
}

uint64_t sub_10000A790()
{
  sub_100004C3C(&qword_10003D330);
  TransportMessage<>.body.getter();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v2 = v0 + 15;
      uint64_t v7 = v0[15];
      uint64_t v4 = v0[20];
      uint64_t v3 = v0[21];
      uint64_t v18 = v0[19];
      uint64_t v5 = v0 + 14;
      uint64_t v6 = v0 + 13;
      (*(void (**)(uint64_t, void, void))(v0[14] + 32))(v7, v0[23], v0[13]);
      TransportMessage<>.reply.getter();
      sub_10002C67C(v7, v3);
      goto LABEL_11;
    case 2u:
      (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[23], v0[10]);
      TransportMessage<>.reply.getter();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[24] = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_10000ABAC;
      uint64_t v9 = v0[21];
      uint64_t v10 = v0[12];
      return sub_10002A7DC(v10, v9);
    case 3u:
      (*(void (**)(void, void, void))(v0[8] + 32))(v0[9], v0[23], v0[7]);
      TransportMessage<>.reply.getter();
      uint64_t v12 = (void *)swift_task_alloc();
      v0[25] = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_10000ADDC;
      uint64_t v13 = v0[21];
      uint64_t v14 = v0[9];
      return sub_10002AF84(v14, v13);
    case 4u:
      uint64_t v2 = v0 + 6;
      uint64_t v15 = (void (*)(char *, uint64_t))v0[6];
      uint64_t v4 = v0[20];
      uint64_t v3 = v0[21];
      uint64_t v18 = v0[19];
      uint64_t v5 = v0 + 5;
      uint64_t v6 = v0 + 4;
      (*(void (**)(void (*)(char *, uint64_t), void, void))(v0[5] + 32))(v15, v0[23], v0[4]);
      TransportMessage<>.reply.getter();
      sub_10002CDE8(v15, v3);
      goto LABEL_11;
    case 5u:
      uint64_t v2 = v0 + 21;
      uint64_t v16 = v0[21];
      TransportMessage<>.reply.getter();
      sub_100024A24(v16);
      uint64_t v5 = v0 + 20;
      uint64_t v6 = v0 + 19;
      goto LABEL_13;
    default:
      uint64_t v2 = v0 + 18;
      uint64_t v1 = v0[18];
      uint64_t v4 = v0[20];
      uint64_t v3 = v0[21];
      uint64_t v18 = v0[19];
      uint64_t v5 = v0 + 17;
      uint64_t v6 = v0 + 16;
      (*(void (**)(uint64_t, void, void))(v0[17] + 32))(v1, v0[23], v0[16]);
      TransportMessage<>.reply.getter();
      sub_10002BC3C(v1, v3);
LABEL_11:
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v18);
LABEL_13:
      (*(void (**)(void, void))(*v5 + 8))(*v2, *v6);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v17 = (uint64_t (*)(void))v0[1];
      return v17();
  }
}

uint64_t sub_10000ABAC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  uint64_t v2 = *(void *)(*(void *)v0 + 160);
  uint64_t v3 = *(void *)(*(void *)v0 + 152);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_10000AD04, 0, 0);
}

uint64_t sub_10000AD04()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000ADDC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  uint64_t v2 = *(void *)(*(void *)v0 + 160);
  uint64_t v3 = *(void *)(*(void *)v0 + 152);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_10000AF34, 0, 0);
}

uint64_t sub_10000AF34()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

char *sub_10000B00C()
{
  uint64_t v60 = type metadata accessor for Logger();
  uint64_t v0 = *(void *)(v60 - 8);
  uint64_t v1 = __chkstk_darwin(v60);
  v52[0] = (char *)v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v52 - v4;
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)v52 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v52 - v9;
  static Logger.uv.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Attempting enumeration of development applications", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = *(void (**)(char *, uint64_t))(v0 + 8);
  v14(v10, v60);
  id v15 = [self enumeratorWithOptions:0];
  aBlock[4] = (uint64_t)sub_10000B778;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000B820;
  aBlock[3] = (uint64_t)&unk_1000395F0;
  uint64_t v16 = _Block_copy(aBlock);
  [v15 setFilter:v16];
  _Block_release(v16);
  uint64_t v17 = (char *)&_swiftEmptyArrayStorage;
  v61 = (char *)&_swiftEmptyArrayStorage;
  id v59 = v15;
  id v18 = [v15 nextObject];
  uint64_t v56 = v0 + 8;
  if (v18)
  {
    id v20 = v18;
    *(void *)&long long v19 = 136315138;
    long long v53 = v19;
    v52[1] = (char *)&type metadata for Any + 8;
    *(void *)&long long v19 = 136315394;
    long long v54 = v19;
    v55 = v14;
    v57 = v5;
    do
    {
      id v21 = [v20 bundleIdentifier];
      if (v21)
      {
        unint64_t v22 = v21;
        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v25 = v24;

        static Logger.uv.getter();
        id v26 = v20;
        swift_bridgeObjectRetain_n();
        id v27 = v26;
        unint64_t v28 = Logger.logObject.getter();
        os_log_type_t v29 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = swift_slowAlloc();
          uint64_t v58 = v23;
          uint64_t v31 = v30;
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = v54;
          id v32 = [v27 localizedName];
          uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v35 = v34;

          uint64_t v14 = v55;
          *(void *)(v31 + 4) = sub_10001DDE4(v33, v35, aBlock);

          swift_bridgeObjectRelease();
          *(_WORD *)(v31 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v31 + 14) = sub_10001DDE4(v58, v25, aBlock);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "DevAppsEnumeration: found qualifying development application \"%s\" (%s)", (uint8_t *)v31, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v23 = v58;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v14(v8, v60);
        uint64_t v44 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v44 = sub_10002E9A4(0, *((void *)v44 + 2) + 1, 1, v44);
        }
        unint64_t v46 = *((void *)v44 + 2);
        unint64_t v45 = *((void *)v44 + 3);
        if (v46 >= v45 >> 1) {
          uint64_t v44 = sub_10002E9A4((char *)(v45 > 1), v46 + 1, 1, v44);
        }
        *((void *)v44 + 2) = v46 + 1;
        uint64_t v47 = &v44[16 * v46];
        *((void *)v47 + 4) = v23;
        *((void *)v47 + 5) = v25;

        v61 = v44;
        uint64_t v5 = v57;
      }
      else
      {
        static Logger.uv.getter();
        id v36 = v20;
        uint64_t v37 = Logger.logObject.getter();
        os_log_type_t v38 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v39 = v53;
          id v40 = [v36 localizedName];
          uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v43 = v42;

          *(void *)(v39 + 4) = sub_10001DDE4(v41, v43, aBlock);
          uint64_t v14 = v55;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "DevAppsEnumeration: missing bundleIdentifier for %s", (uint8_t *)v39, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        v14(v5, v60);
      }
      id v20 = [v59 nextObject];
    }
    while (v20);
    uint64_t v17 = v61;
  }
  static Logger.uv.getter();
  swift_bridgeObjectRetain();
  uint64_t v48 = Logger.logObject.getter();
  os_log_type_t v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    unint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v50 = 134217984;
    aBlock[0] = *((void *)v17 + 2);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "DevAppsEnumeration: found %ld development applications", v50, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v14((char *)v52[0], v60);
  swift_beginAccess();
  return v61;
}

uint64_t sub_10000B778(void *a1)
{
  id v1 = [a1 managementDomain];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;

  sub_10000B95C();
  if (v2 == static LSBundleRecord.playgroundsManagementDomain.getter() && v4 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_10000B820(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_10000B878@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return sub_10000A130(v6, a2);
}

uint64_t sub_10000B944(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B954()
{
  return swift_release();
}

unint64_t sub_10000B95C()
{
  unint64_t result = qword_10003D338;
  if (!qword_10003D338)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003D338);
  }
  return result;
}

uint64_t sub_10000B99C()
{
  uint64_t v1 = type metadata accessor for PreviewsService.Variant();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000BA2C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100009500;
  return sub_100005674(a1, v5);
}

unint64_t sub_10000BB04()
{
  unint64_t result = qword_10003CF20;
  if (!qword_10003CF20)
  {
    sub_100004CDC(&qword_10003CF18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF20);
  }
  return result;
}

uint64_t sub_10000BB60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for AppManagerError()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s9previewsd15AppManagerErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppManagerError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppManagerError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppManagerError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppManagerError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppManagerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppManagerError()
{
  return &type metadata for AppManagerError;
}

Swift::Int sub_10000BD64()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000BDAC()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000BDD8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000BE1C()
{
  return sub_10000BFF4(*v0);
}

uint64_t sub_10000BE28()
{
  return 0;
}

BOOL sub_10000BE48()
{
  return *v0 < 7u;
}

uint64_t sub_10000BE64()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000BEA0(uint64_t a1)
{
  unint64_t v2 = sub_10000C1A8();

  return HumanReadableError.description.getter(a1, v2);
}

unint64_t sub_10000BEE0()
{
  unint64_t result = qword_10003D348;
  if (!qword_10003D348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D348);
  }
  return result;
}

unint64_t sub_10000BF38()
{
  unint64_t result = qword_10003D350;
  if (!qword_10003D350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D350);
  }
  return result;
}

unint64_t sub_10000BF90()
{
  unint64_t result = qword_10003D358;
  if (!qword_10003D358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D358);
  }
  return result;
}

uint64_t sub_10000BFF4(char a1)
{
  uint64_t countAndFlagsBits = 0x206E776F6E6B6E55;
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = 0x206D726177657250;
      break;
    case 2:
      id v2 = [self mainBundle];
      v3._uint64_t countAndFlagsBits = 0xD000000000000017;
      v6._object = (void *)0xE000000000000000;
      v3._object = (void *)0x8000000100032140;
      v4._uint64_t countAndFlagsBits = 0;
      v4._object = (void *)0xE000000000000000;
      v6._uint64_t countAndFlagsBits = 0;
      uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v6)._countAndFlagsBits;

      break;
    case 3:
      uint64_t countAndFlagsBits = 0xD000000000000019;
      break;
    case 4:
      uint64_t countAndFlagsBits = 0xD000000000000012;
      break;
    case 5:
      uint64_t countAndFlagsBits = 0xD000000000000025;
      break;
    case 6:
      uint64_t countAndFlagsBits = 0xD000000000000010;
      break;
    case 7:
      uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      break;
    default:
      return countAndFlagsBits;
  }
  return countAndFlagsBits;
}

unint64_t sub_10000C1A8()
{
  unint64_t result = qword_10003D360;
  if (!qword_10003D360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D360);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AppManagerError.Types(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppManagerError.Types(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppManagerError.Types(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x10000C368);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_10000C390(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000C39C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppManagerError.Types()
{
  return &type metadata for AppManagerError.Types;
}

unint64_t sub_10000C3B8()
{
  unint64_t result = qword_10003D368;
  if (!qword_10003D368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D368);
  }
  return result;
}

uint64_t *sub_10000C410(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = type metadata accessor for PreviewsService.Variant();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004C3C(&qword_10003CEA0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_10000C524(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = a1 + *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v4 = sub_100004C3C(&qword_10003CEA0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(v3, v4);
}

uint64_t sub_10000C5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t sub_10000C694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t sub_10000C754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_10000C814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_10000C8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C8E8);
}

uint64_t sub_10000C8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000C954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C968);
}

uint64_t sub_10000C968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ShellPreviewService()
{
  uint64_t result = qword_10003D3C8;
  if (!qword_10003D3C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000CA24()
{
  uint64_t result = type metadata accessor for PreviewShellProxy();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_10000CAB0()
{
  return &protocol witness table for PreviewServiceInterface;
}

uint64_t sub_10000CABC(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 117) = a2;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v2;
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  *(void *)(v3 + 40) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v3 + 48) = v5;
  *(void *)(v3 + 56) = *(void *)(v5 + 64);
  *(void *)(v3 + 64) = swift_task_alloc();
  sub_100004C3C(&qword_10003D238);
  *(void *)(v3 + 72) = swift_task_alloc();
  return _swift_task_switch(sub_10000CBB8, 0, 0);
}

uint64_t sub_10000CBB8()
{
  char v1 = *(unsigned char *)(v0 + 117);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  sub_100004C3C(&qword_10003D478);
  uint64_t v4 = static Future.create(dsoHandle:file:line:column:function:)();
  uint64_t v6 = v5;
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 88) = v5;
  *(void *)(v0 + 16) = *(void *)(v3 + 16);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = v2;
  char v20 = v1;
  *(unsigned char *)(v7 + 24) = v1;
  *(void *)(v7 + 32) = v6;
  swift_retain();
  sub_100004C3C(&qword_10003D480);
  sub_100007644(&qword_10003D488, &qword_10003D480);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
  swift_task_dealloc();
  swift_release();
  if (*(unsigned char *)(v0 + 116) == 1)
  {
    uint64_t v9 = *(void *)(v0 + 64);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 48);
    uint64_t v10 = *(void *)(v0 + 56);
    uint64_t v13 = *(void *)(v0 + 32);
    uint64_t v12 = *(void *)(v0 + 40);
    uint64_t v14 = *(void *)(v0 + 24);
    uint64_t v15 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v14, v12);
    unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v17 = (char *)swift_allocObject();
    *((void *)v17 + 2) = 0;
    *((void *)v17 + 3) = 0;
    *((void *)v17 + 4) = v13;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(&v17[v16], v9, v12);
    v17[v16 + v10] = v20;
    swift_retain();
    sub_1000199C4(v8, (uint64_t)&unk_10003D498, (uint64_t)v17);
    swift_release();
  }
  id v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v18;
  void *v18 = v0;
  v18[1] = sub_10000CEAC;
  return Future<A>.value.getter(v0 + 112);
}

uint64_t sub_10000CEAC()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000D050;
  }
  else {
    uint64_t v2 = sub_10000CFC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CFC0()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(unsigned int *)(v0 + 112);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10000D050()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000D0D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_100004C3C(&qword_10003CEA0);
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  __chkstk_darwin(v3);
  uint64_t v47 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for PreviewShellProxy();
  uint64_t v5 = __chkstk_darwin(v45);
  uint64_t v44 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v46 = (uint64_t)&v36 - v7;
  uint64_t v8 = type metadata accessor for PreviewsService.Variant();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v43 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v41 = (char *)&v36 - v13;
  uint64_t v42 = v14;
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v36 - v15;
  uint64_t v40 = type metadata accessor for Logger();
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  id v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  long long v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v50 = a1;
  v19(v16, a1, v8);
  char v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v20, v21))
  {
    os_log_t v37 = v20;
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v53 = v36;
    *(_DWORD *)unint64_t v22 = 136315138;
    uint64_t v39 = (void (*)(char *, uint64_t))(v22 + 4);
    sub_1000114D8(&qword_10003CF88, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
    uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v52 = sub_10001DDE4(v23, v24, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v39 = *(void (**)(char *, uint64_t))(v9 + 8);
    v39(v16, v8);
    os_log_t v25 = v37;
    _os_log_impl((void *)&_mh_execute_header, v37, v21, "ShellPreviewService (%s) init", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v39 = *(void (**)(char *, uint64_t))(v9 + 8);
    v39(v16, v8);
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v18, v40);
  id v26 = v41;
  uint64_t v27 = v50;
  v19(v41, v50, v8);
  uint64_t v28 = (uint64_t)v44;
  v19(v44, (uint64_t)v26, v8);
  os_log_type_t v29 = v43;
  v19(v43, (uint64_t)v26, v8);
  unint64_t v30 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v31 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v31 + v30, v29, v8);
  sub_100004C3C(&qword_10003CF18);
  sub_100007644((unint64_t *)&qword_10003CF20, &qword_10003CF18);
  id v32 = v47;
  ConcurrentOnDemand.init(create:)();
  uint64_t v33 = (void (*)(uint64_t, uint64_t))v39;
  v39(v26, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v28 + *(int *)(v45 + 20), v32, v49);
  uint64_t v34 = v46;
  sub_1000115B0(v28, v46, (uint64_t (*)(void))type metadata accessor for PreviewShellProxy);
  v33(v27, v8);
  return sub_1000115B0(v34, v51, (uint64_t (*)(void))type metadata accessor for PreviewShellProxy);
}

uint64_t sub_10000D6A8(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = type metadata accessor for TransportReply();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = type metadata accessor for DaemonToShell.TwoWayMessage();
  v2[9] = swift_task_alloc();
  uint64_t v4 = *(void *)(type metadata accessor for ShellPreviewService() - 8);
  v2[10] = v4;
  v2[11] = *(void *)(v4 + 64);
  v2[12] = swift_task_alloc();
  sub_100004C3C(&qword_10003D238);
  v2[13] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for PreviewType();
  v2[14] = v5;
  v2[15] = *(void *)(v5 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = type metadata accessor for ServiceMessage.Content();
  v2[18] = swift_task_alloc();
  uint64_t updated = type metadata accessor for ShellUpdatePayload();
  v2[19] = updated;
  v2[20] = *(void *)(updated - 8);
  v2[21] = swift_task_alloc();
  type metadata accessor for PropertyList();
  v2[22] = swift_task_alloc();
  sub_100004C3C(&qword_10003D440);
  v2[23] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for CapabilitiesPayload();
  v2[24] = v7;
  v2[25] = *(void *)(v7 - 8);
  v2[26] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v2[27] = v8;
  v2[28] = *(void *)(v8 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for ServiceMessage();
  v2[31] = v9;
  v2[32] = *(void *)(v9 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  return _swift_task_switch(sub_10000DAA0, 0, 0);
}

uint64_t sub_10000DAA0()
{
  uint64_t v53 = v0;
  uint64_t v2 = v0[33];
  uint64_t v1 = v0[34];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[32];
  sub_100004C3C(&qword_10003D448);
  TransportMessage<>.body.getter();
  static Logger.uv.getter();
  uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v51(v2, v1, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[32];
    uint64_t v46 = v0[31];
    uint64_t v47 = v0[33];
    uint64_t v48 = v0[28];
    uint64_t v49 = v0[27];
    uint64_t v50 = v0[30];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446210;
    sub_1000114D8(&qword_10003D468, (void (*)(uint64_t))&type metadata accessor for ServiceMessage);
    uint64_t v9 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[2] = sub_10001DDE4(v9, v10, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v11(v47, v46);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ShellPreviewService received %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v12(v50, v49);
  }
  else
  {
    uint64_t v13 = v0[30];
    uint64_t v14 = v0[27];
    uint64_t v15 = v0[28];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0[32] + 8);
    v11(v0[33], v0[31]);

    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }
  v0[35] = v11;
  if (ServiceMessage.messageType.getter() == 1)
  {
    ServiceMessage.payload.getter();
    sub_1000114D8(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for CapabilitiesPayload);
    PropertyListRepresentable.init(propertyList:)();
    uint64_t v17 = v0[25];
    uint64_t v16 = v0[26];
    uint64_t v19 = v0[23];
    uint64_t v18 = v0[24];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v19, 0, 1, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v16, v19, v18);
    if (CapabilitiesPayload.isRunningInXTP.getter())
    {
      static Logger.uv.getter();
      char v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v20, v21))
      {
        unint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "CapabilitiesPayload.isRunningInXTP is true, setting flag on shell launcher", v22, 2u);
        swift_slowDealloc();
      }
      uint64_t v23 = v0[29];
      uint64_t v25 = v0[26];
      uint64_t v24 = v0[27];
      uint64_t v26 = v0[24];
      uint64_t v27 = v0[25];

      v12(v23, v24);
      byte_10003DED0 = 1;
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    }
    else
    {
      (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
    }
  }
  ServiceMessage.content.getter();
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    uint64_t v29 = v0[20];
    uint64_t v28 = v0[21];
    uint64_t v30 = v0[19];
    uint64_t v32 = v0[15];
    uint64_t v31 = v0[16];
    uint64_t v33 = v0[14];
    (*(void (**)(uint64_t, void, uint64_t))(v29 + 32))(v28, v0[18], v30);
    ShellUpdatePayload.previewType.getter();
    char v34 = sub_10000E874();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    if (v34)
    {
      uint64_t v35 = v0[12];
      uint64_t v36 = v0[13];
      uint64_t v37 = v0[10];
      uint64_t v38 = v0[4];
      uint64_t v39 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v36, 1, 1, v39);
      sub_10000EBE0(v38, v35);
      unint64_t v40 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = 0;
      *(void *)(v41 + 24) = 0;
      sub_1000115B0(v35, v41 + v40, (uint64_t (*)(void))type metadata accessor for ShellPreviewService);
      sub_100019B70(v36, (uint64_t)&unk_10003D458, v41);
      swift_release();
    }
  }
  else
  {
    sub_10000E3F0(v0[18], (uint64_t (*)(void))&type metadata accessor for ServiceMessage.Content);
  }
  v51(v0[9], v0[34], v0[31]);
  swift_storeEnumTagMultiPayload();
  TransportMessage<>.reply.getter();
  uint64_t v42 = (void *)swift_task_alloc();
  v0[36] = v42;
  *uint64_t v42 = v0;
  v42[1] = sub_10000E12C;
  uint64_t v43 = v0[9];
  uint64_t v44 = v0[7];
  return sub_10000587C(v43, v44);
}

uint64_t sub_10000E12C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  uint64_t v2 = *(void *)(*(void *)v0 + 56);
  uint64_t v3 = *(void *)(*(void *)v0 + 48);
  uint64_t v4 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10000E3F0(v1, (uint64_t (*)(void))&type metadata accessor for DaemonToShell.TwoWayMessage);
  return _swift_task_switch(sub_10000E2B4, 0, 0);
}

uint64_t sub_10000E2B4()
{
  (*(void (**)(void, void))(v0 + 280))(*(void *)(v0 + 272), *(void *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000E3F0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000E450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return _swift_task_switch(sub_10000E470, 0, 0);
}

uint64_t sub_10000E470()
{
  if (qword_10003CD48 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, char))((char *)&dword_10003D470 + dword_10003D470);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000E554;
  uint64_t v2 = *(void *)(v0 + 24);
  return v4(v2, 1);
}

uint64_t sub_10000E554(int a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_10000E6B4;
  }
  else
  {
    *(_DWORD *)(v4 + 48) = a1;
    uint64_t v5 = sub_10000E684;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000E684()
{
  uint64_t v1 = *(void *)(v0 + 16);
  BOOL v2 = *(void *)(v0 + 40) != 0;
  *(_DWORD *)uint64_t v1 = *(_DWORD *)(v0 + 48);
  *(unsigned char *)(v1 + 4) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E6B4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  BOOL v2 = *(void *)(v0 + 40) != 0;
  *(_DWORD *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 4) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E6E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PreviewsService.Variant();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v5 + 104))(v4, enum case for PreviewsService.Variant.default(_:));
  return sub_10000D0D8((uint64_t)v4, a1);
}

uint64_t sub_10000E7A8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return sub_10000D0D8((uint64_t)v6, a2);
}

uint64_t sub_10000E874()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PreviewType.HostLocation();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = type metadata accessor for PreviewType();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v1, v9);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
  if (v13 != enum case for PreviewType.hosted(_:))
  {
    if (v13 != enum case for PreviewType.static(_:))
    {
      assertUnreachable(file:line:column:function:)();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v12, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v14 != enum case for PreviewType.HostLocation.injectedScene(_:))
  {
    if (v14 == enum case for PreviewType.HostLocation.mainScene(_:))
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return 1;
    }
    if (v14 == enum case for PreviewType.HostLocation.simDisplayScene(_:)
      || v14 == enum case for PreviewType.HostLocation.external(_:)
      || v14 == enum case for PreviewType.HostLocation.nsPreview(_:))
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return 0;
    }
    assertUnreachable(file:line:column:function:)();
  }
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v8, v2);
  v15(v6, v2);
  return 0;
}

uint64_t sub_10000EBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShellPreviewService();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EC44()
{
  uint64_t v1 = *(void *)(type metadata accessor for ShellPreviewService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + *(int *)(type metadata accessor for PreviewShellProxy() + 20);
  uint64_t v9 = sub_100004C3C(&qword_10003CEA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10000ED70(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for ShellPreviewService() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[2] = a1;
  v6[3] = v5;
  v6[1] = sub_100011618;
  return _swift_task_switch(sub_10000E470, 0, 0);
}

uint64_t sub_10000EE58(uint64_t a1)
{
  uint64_t v2 = sub_100004C3C(&qword_10003D440);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000EEB8(uint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v49 = a4;
  int v51 = a3;
  uint64_t v6 = type metadata accessor for PreviewsService.Variant();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v48 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v44 - v11;
  __chkstk_darwin(v10);
  int v14 = (char *)&v44 - v13;
  if (*(void *)(*a1 + 16))
  {
    sub_100013CC8(a2);
    char v16 = v15 ^ 1;
  }
  else
  {
    char v16 = 1;
  }
  uint64_t v17 = *(void (**)(char *))(v7 + 16);
  uint64_t v52 = a2;
  v17(v14);
  uint64_t v50 = v7;
  if ((v16 & 1) == 0)
  {
    uint64_t v18 = v17;
    ((void (*)(char *, char *, uint64_t))v17)(v12, v14, v6);
    if (v51)
    {
      uint64_t v21 = *a1;
      if (*(void *)(*a1 + 16) && (unint64_t v22 = sub_100013CC8((uint64_t)v12), (v23 & 1) != 0))
      {
        uint64_t v24 = *(void *)(v21 + 56) + 32 * v22;
        uint64_t v47 = *(void (**)(uint64_t, uint64_t))v24;
        char v25 = *(unsigned char *)(v24 + 8);
        uint64_t v26 = *(void *)(v24 + 16);
        uint64_t v27 = *(void *)(v24 + 24);
        swift_bridgeObjectRetain();
        uint64_t v46 = v27;
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        char v25 = 0;
        uint64_t v26 = 0;
      }
      LOBYTE(v55) = v25;
      uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19(v12, v6);
      v19(v14, v6);
      if (v26)
      {
        int v28 = v55;
        sub_10001123C((uint64_t)v47, v55, v26);
        int v20 = v28 ^ 1;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19(v12, v6);
      v19(v14, v6);
    }
    LODWORD(v46) = 0;
    goto LABEL_16;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v14, v6);
  int v20 = 1;
LABEL_14:
  LODWORD(v46) = v20;
LABEL_16:
  uint64_t v29 = *a1;
  uint64_t v30 = *(void *)(*a1 + 16);
  uint64_t v31 = (void (*)(char *, uint64_t, uint64_t))v18;
  uint64_t v47 = (void (*)(uint64_t, uint64_t))v19;
  if (v30 && (unint64_t v32 = sub_100013CC8(v52), (v33 & 1) != 0))
  {
    uint64_t v34 = *(void *)(v29 + 56) + 32 * v32;
    uint64_t v35 = *(void *)v34;
    char v36 = *(unsigned char *)(v34 + 8);
    uint64_t v37 = *(void *)(v34 + 24);
    uint64_t v55 = *(void *)(v34 + 16);
    uint64_t v54 = v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v45 = v35;
    if ((v51 & 1) == 0)
    {
      uint64_t v38 = (void (*)(char *, uint64_t, uint64_t))v18;
LABEL_26:
      swift_retain();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      uint64_t v31 = v38;
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v55 = (uint64_t)&_swiftEmptyArrayStorage;
    uint64_t v54 = (uint64_t)&_swiftEmptyArrayStorage;
    if ((v51 & 1) == 0)
    {
      uint64_t v45 = 3;
      uint64_t v38 = (void (*)(char *, uint64_t, uint64_t))v18;
      char v36 = 0;
      goto LABEL_26;
    }
    uint64_t v45 = 3;
  }
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  char v36 = 1;
LABEL_29:
  specialized Array._endMutation()();
  uint64_t v39 = (uint64_t)v48;
  v31(v48, v52, v6);
  uint64_t v40 = v55;
  uint64_t v41 = v54;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v53 = *a1;
  *a1 = 0x8000000000000000;
  sub_100015124(v45, v36, v40, v41, v39, isUniquelyReferenced_nonNull_native);
  *a1 = v53;
  swift_bridgeObjectRelease();
  v47(v39, v6);
  return v46 & 1;
}

uint64_t sub_10000F31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 52) = a6;
  *(void *)(v6 + 16) = a4;
  *(void *)(v6 + 24) = a5;
  return _swift_task_switch(sub_10000F340, 0, 0);
}

uint64_t sub_10000F340()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10000F3F8;
  char v6 = *(unsigned char *)(v0 + 52);
  uint64_t v7 = *(void *)(v0 + 24);
  return sub_1000291B8(v7, v6, v2, v3, v4);
}

uint64_t sub_10000F3F8(int a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_10000F588;
  }
  else
  {
    *(_DWORD *)(v4 + 48) = a1;
    uint64_t v5 = sub_10000F520;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000F520()
{
  sub_10000F5FC();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F588()
{
  sub_10000F7CC(*(void *)(v0 + 24), *(void *)(v0 + 40), *(unsigned char *)(v0 + 52));
  swift_errorRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F5FC()
{
  swift_retain();
  sub_100004C3C(&qword_10003D480);
  sub_100004C3C(&qword_10003D4A0);
  sub_100007644(&qword_10003D488, &qword_10003D480);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
  uint64_t result = swift_release();
  if (v4)
  {
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v1 = result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v1 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v1)
      {
LABEL_4:
        if (v1 < 1)
        {
          __break(1u);
          return result;
        }
        if ((v4 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v1; ++i)
          {
            specialized _ArrayBuffer._getElementSlowPath(_:)();
            Promise.succeed(with:)();
            swift_unknownObjectRelease();
          }
        }
        else
        {
          unint64_t v3 = v4 + 32;
          do
          {
            v3 += 8;
            swift_retain();
            Promise.succeed(with:)();
            swift_release();
            --v1;
          }
          while (v1);
        }
      }
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_10000F7CC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = type metadata accessor for PreviewsService.Variant();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v3;
  uint64_t v26 = *(void *)(v3 + 16);
  uint64_t v23 = a1;
  char v24 = a3;
  uint64_t v25 = a2;
  swift_retain();
  sub_100004C3C(&qword_10003D480);
  sub_100004C3C(&qword_10003D4C8);
  sub_100007644(&qword_10003D488, &qword_10003D480);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
  uint64_t result = swift_release();
  uint64_t v14 = v27;
  if (!v28)
  {
    uint64_t v17 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
    unint64_t v18 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v19 = (char *)swift_allocObject();
    *((void *)v19 + 2) = 0;
    *((void *)v19 + 3) = 0;
    *((void *)v19 + 4) = v22;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v19[v18], (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    v19[v18 + v9] = v14 & 1;
    swift_retain();
    sub_1000199C4((uint64_t)v12, (uint64_t)&unk_10003D4D0, (uint64_t)v19);
    return swift_release();
  }
  if (v28 == 1)
  {
    if (v27 >> 62)
    {
      sub_1000112BC(v27, 1);
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v15 = result;
      if (result)
      {
LABEL_5:
        if (v15 < 1)
        {
          __break(1u);
        }
        else
        {
          if ((v14 & 0xC000000000000001) != 0)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              specialized _ArrayBuffer._getElementSlowPath(_:)();
              Promise.fail(with:)();
              swift_unknownObjectRelease();
            }
          }
          else
          {
            uint64_t v20 = v14 + 32;
            do
            {
              v20 += 8;
              swift_retain();
              Promise.fail(with:)();
              swift_release();
              --v15;
            }
            while (v15);
          }
          sub_1000112D0(v14, 1);
          sub_1000112D0(v14, 1);
          return sub_1000112D0(v14, 1);
        }
        return result;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
      sub_1000112BC(v27, 1);
      uint64_t result = swift_bridgeObjectRetain();
      if (v15) {
        goto LABEL_5;
      }
    }
    sub_1000112D0(v14, 1);
    sub_1000112D0(v14, 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000FBBC(uint64_t *a1, uint64_t a2, char a3)
{
  uint64_t v3 = *a1;
  if (!*(void *)(*a1 + 16)) {
    return 0;
  }
  unint64_t v6 = sub_100013CC8(a2);
  if ((v7 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(v3 + 56);
  uint64_t v9 = v8 + 32 * v6;
  uint64_t v10 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (a3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100010368(a2);
    sub_10001123C(v12, v13, v14);
    sub_100010B7C(v11);
  }
  else
  {
    char v16 = *(unsigned char *)(v8 + 32 * v6 + 8);
    swift_bridgeObjectRetain();
    if ((v16 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_100010368(a2);
      sub_10001123C(v17, v18, v19);
      swift_bridgeObjectRelease();
    }
  }
  return v10;
}

uint64_t sub_10000FCA4(uint64_t *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for PreviewsService.Variant();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v62 = &v47[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v13 = &v47[-v12];
  uint64_t v14 = type metadata accessor for Logger();
  __chkstk_darwin(v14);
  uint64_t v17 = &v47[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v63 = a1;
  uint64_t v18 = *a1;
  if (!*(void *)(v18 + 16)) {
    return 0;
  }
  uint64_t v61 = v15;
  unint64_t v19 = sub_100013CC8(a2);
  if ((v20 & 1) == 0) {
    return 0;
  }
  uint64_t v59 = a2;
  uint64_t v60 = v9;
  uint64_t v21 = *(void *)(v18 + 56) + 32 * v19;
  uint64_t v22 = *(unsigned __int8 *)(v21 + 8);
  uint64_t v23 = *(void *)(v21 + 16);
  unint64_t v24 = *(void *)(v21 + 24);
  if (v22 == 1 && (a3 & 1) == 0) {
    return 0;
  }
  uint64_t v58 = *(void *)v21;
  uint64_t v55 = v23;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  static Logger.uv.getter();
  uint64_t v53 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v60 + 16);
  uint64_t v54 = v60 + 16;
  v53(v13, v59, v8);
  swift_errorRetain();
  uint64_t v57 = a4;
  swift_errorRetain();
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  int v28 = v27;
  BOOL v29 = os_log_type_enabled(v26, v27);
  unint64_t v56 = v24;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v50 = (void *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v65 = v51;
    *(_DWORD *)uint64_t v30 = 136446978;
    if (a3) {
      uint64_t v31 = 0x756F726765726F66;
    }
    else {
      uint64_t v31 = 0x756F72676B636162;
    }
    os_log_t v49 = v26;
    uint64_t v64 = sub_10001DDE4(v31, 0xEA0000000000646ELL, &v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    uint64_t v52 = (void (*)(unsigned char *, uint64_t))(v30 + 14);
    sub_1000114D8(&qword_10003CF88, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
    uint64_t v32 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v64 = sub_10001DDE4(v32, v33, &v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v52 = *(void (**)(unsigned char *, uint64_t))(v60 + 8);
    v52(v13, v8);
    *(_WORD *)(v30 + 22) = 2050;
    uint64_t v64 = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v30 + 32) = 2114;
    int v48 = v28;
    swift_errorRetain();
    uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v64 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v50 = v34;
    swift_errorRelease();
    swift_errorRelease();
    uint64_t v26 = v49;
    _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v48, "Failed %{public}s launch of Preview Shell (%{public}s) (%{public}ld retries remaining): %{public}@", (uint8_t *)v30, 0x2Au);
    sub_100004C3C(&qword_10003CF90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v52 = *(void (**)(unsigned char *, uint64_t))(v60 + 8);
    v52(v13, v8);
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(unsigned char *, uint64_t))(v61 + 8))(v17, v14);
  uint64_t v35 = v59;
  uint64_t v36 = v58 - 1;
  if (v58 < 1)
  {
    uint64_t v42 = v55;
    swift_bridgeObjectRelease();
    unint64_t v43 = v56;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_100010368(v35);
    sub_10001123C(v44, v45, v46);
    uint64_t v65 = v42;
    sub_100010B7C(v43);
    return v65;
  }
  else
  {
    uint64_t v37 = v56;
    swift_bridgeObjectRelease();
    uint64_t v38 = v55;
    swift_bridgeObjectRelease();
    uint64_t v39 = (uint64_t)v62;
    v53(v62, v35, v8);
    uint64_t v40 = v63;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v65 = *v40;
    *uint64_t v40 = 0x8000000000000000;
    sub_100015124(v36, v22, v38, v37, v39, isUniquelyReferenced_nonNull_native);
    *uint64_t v40 = v65;
    swift_bridgeObjectRelease();
    v52((unsigned char *)v39, v8);
  }
  return v22;
}

void *sub_100010294(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_100010338@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100010368(uint64_t a1)
{
  char v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100013CC8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *char v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100015970();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for PreviewsService.Variant();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 32 * v4);
  sub_10001058C(v4, v7);
  *char v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100010494(uint64_t a1)
{
  char v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100013D9C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *char v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100015C58();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for Identifier();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_100010884(v4, v7);
  *char v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_10001058C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewsService.Variant();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v35 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)();
    uint64_t v12 = v35;
    if ((*(void *)(v35 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v32 = (result + 1) & v11;
      unint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v34 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v33(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_1000114D8(&qword_10003D4C0, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
        uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v32)
        {
          if (v18 >= v32 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (_OWORD *)(v22 + 32 * a1);
            unint64_t v24 = (_OWORD *)(v22 + 32 * v10);
            uint64_t v12 = v35;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 2))
            {
              long long v25 = v24[1];
              _OWORD *v23 = *v24;
              v23[1] = v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v32 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v35;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v26 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v26 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  *uint64_t v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100010884(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Identifier();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      unint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_1000114D8(&qword_10003D8A0, (void (*)(uint64_t))&type metadata accessor for Identifier);
        uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (void *)(v22 + 8 * a1);
            unint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              void *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    long long v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    long long v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *long long v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100010B7C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v14 + v3;
  if (__OFADD__(v14, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    *uint64_t v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t v8 = *v1 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100010D50(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v13;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_100010D50(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100007644(&qword_10003D4B8, &qword_10003D4B0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100004C3C(&qword_10003D4B0);
          BOOL v12 = sub_100010F78(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100004C3C(&qword_10003D4A8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*sub_100010F78(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100011028(v6, a2, a3);
  return sub_100010FE0;
}

void sub_100010FE0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100011028(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_1000110A8;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000110A8()
{
  return swift_release();
}

uint64_t sub_1000110B0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000EEB8(a1, *(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(void *)(v2 + 32));
  if (!v3) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_1000110F0()
{
  uint64_t v2 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  char v6 = *(unsigned char *)(v0 + v3 + *(void *)(v2 + 64));
  uint64_t v7 = swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(unsigned char *)(v7 + 52) = v6;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  *(void *)(v7 + 8) = sub_100011618;
  return _swift_task_switch(sub_10000F340, 0, 0);
}

uint64_t sub_100011208@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000FBBC(a1, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10001123C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100011280@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000FCA4(a1, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32));
  if (!v3)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v6;
  }
  return result;
}

uint64_t sub_1000112BC(uint64_t a1, char a2)
{
  if (a2 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000112D0(uint64_t a1, char a2)
{
  if (a2 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000112E8()
{
  uint64_t v1 = type metadata accessor for PreviewsService.Variant();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_1000113C0()
{
  uint64_t v2 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  char v6 = *(unsigned char *)(v0 + v3 + *(void *)(v2 + 64));
  uint64_t v7 = swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(unsigned char *)(v7 + 52) = v6;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  *(void *)(v7 + 8) = sub_100009500;
  return _swift_task_switch(sub_10000F340, 0, 0);
}

uint64_t sub_1000114D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100011520()
{
  uint64_t v1 = type metadata accessor for PreviewsService.Variant();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000115B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001161C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1000116C0()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 104));
  return v0;
}

uint64_t sub_100011740()
{
  sub_1000116C0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for ShellLauncher()
{
  return sub_100007DF8();
}

uint64_t sub_1000117B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_1000117B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1000117EC()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100011828(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100011870(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_1000118E0(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000118EC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001193C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100011984(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ShellLauncher.Launch()
{
  return sub_100007DF8();
}

uint64_t sub_1000119DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_1000119E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1000112BC(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_100011A2C(uint64_t a1)
{
  return sub_1000112D0(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_100011A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1000112BC(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_1000112D0(v5, v6);
  return a1;
}

uint64_t sub_100011A90(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t sub_100011AA4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_1000112D0(v4, v5);
  return a1;
}

uint64_t sub_100011AE4(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_100011B2C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100011B70(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100011B88(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

uint64_t type metadata accessor for ShellLauncher.FailureAction()
{
  return sub_100007DF8();
}

uint64_t sub_100011BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011BD0);
}

uint64_t sub_100011BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100011C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011C50);
}

uint64_t sub_100011C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CrashListenerService()
{
  uint64_t result = qword_10003D6B0;
  if (!qword_10003D6B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_100011D0C()
{
  return &protocol witness table for CrashListenerInterface;
}

uint64_t sub_100011D18@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v32 = a2;
  uint64_t v2 = sub_100004C3C(&qword_10003CEA0);
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  __chkstk_darwin(v2);
  BOOL v29 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  uint64_t v5 = v4 - 8;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v28 = (uint64_t)&v27 - v9;
  uint64_t v10 = type metadata accessor for PreviewsService.Variant();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v27 - v16;
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v27 - v18;
  char v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v20((char *)&v27 - v18, v27, v10);
  v20(v17, (uint64_t)v19, v10);
  v20(v8, (uint64_t)v17, v10);
  v20(v14, (uint64_t)v17, v10);
  unint64_t v21 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v21, v14, v10);
  sub_100004C3C(&qword_10003CF18);
  sub_10000BB04();
  uint64_t v23 = v29;
  ConcurrentOnDemand.init(create:)();
  unint64_t v24 = *(void (**)(char *, uint64_t))(v11 + 8);
  v24(v17, v10);
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v8[*(int *)(v5 + 28)], v23, v31);
  uint64_t v25 = v28;
  sub_10000BB60((uint64_t)v8, v28);
  v24(v19, v10);
  return sub_10000BB60(v25, v32);
}

uint64_t sub_100012058()
{
  uint64_t v1 = type metadata accessor for PreviewsService.Variant();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000120E8(uint64_t a1, long long *a2)
{
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(_OWORD *)a1 = *a2;
  *(void *)(a1 + 16) = v3;
  id v5 = (id)v4;
  swift_retain();
  return a1;
}

uint64_t sub_10001212C(id *a1)
{
  return swift_release();
}

uint64_t sub_100012168(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000121C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t sub_10001220C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100012254(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for DaemonServiceListener()
{
  return sub_100007DF8();
}

uint64_t sub_1000122B0()
{
  type metadata accessor for StateDumpManager();
  swift_allocObject();
  uint64_t result = sub_100012510();
  qword_10003DEB8 = result;
  return result;
}

uint64_t sub_1000122EC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  PropertyList.init()();
  return sub_100016334(v1, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10001632C);
}

uint64_t sub_100012350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for PropertyList();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  PropertyList.init<A, B>(content:)();
  PropertyList.confidentlyMerge(_:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10001247C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  *a1 = a3;
  a1[1] = a4;
  uint64_t v7 = swift_bridgeObjectRetain();
  a5(v7);
  uint64_t v8 = type metadata accessor for PropertyList();
  uint64_t v9 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);

  return v9(a2, 0, 1, v8);
}

uint64_t sub_100012510()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  __chkstk_darwin(v2);
  uint64_t v23 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 1;
  *(void *)(v0 + 32) = 0;
  aBlock = (void **)&_swiftEmptyDictionarySingleton;
  sub_100004C3C(&qword_10003D868);
  *(void *)(v0 + 40) = OSAllocatedUnfairLock.init(value:)();
  sub_100016290(0, &qword_10003D870);
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v32 = sub_100016270;
  uint64_t v33 = v0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  uint64_t v30 = sub_100012E5C;
  uint64_t v31 = &unk_1000399F0;
  uint64_t v11 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v12 = os_state_add_handler();
  _Block_release(v11);

  *(void *)(v0 + 16) = v12;
  *(unsigned char *)(v0 + 24) = 0;
  uint64_t v13 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(29, v13);
  sub_100016290(0, &qword_10003D878);
  uint64_t v14 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v15 = static OS_dispatch_source.makeSignalSource(signal:queue:)();

  swift_getObjectType();
  uint64_t v32 = sub_1000162CC;
  uint64_t v33 = v0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  uint64_t v16 = v23;
  uint64_t v30 = sub_100004B88;
  uint64_t v31 = &unk_100039A18;
  uint64_t v17 = _Block_copy(&aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_100013678();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v25);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  swift_release();
  OS_dispatch_source.activate()();
  static Logger.uv.getter();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    char v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "SIGINFO handler activated", v20, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v27);
  *(void *)(v1 + 32) = v15;
  swift_unknownObjectRelease();
  return v1;
}

_DWORD *sub_100012990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PropertyList();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  if (*(_DWORD *)(a1 + 16) == 3)
  {
    uint64_t v9 = self;
    id v29 = *(id *)(a2 + 40);
    swift_retain();
    sub_100004C3C(&qword_10003D850);
    sub_100007644(&qword_10003D858, &qword_10003D850);
    SynchronousAccessProviding.syncRead<A>(file:line:column:function:_:)();
    swift_release();
    PropertyList.serializableDictionary.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v29 = 0;
    id v11 = [v9 dataWithPropertyList:isa format:200 options:0 error:&v29];

    id v12 = v29;
    if (!v11)
    {
      uint64_t v18 = v12;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease();
      return 0;
    }
    uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;

    unint64_t v16 = v15 >> 62;
    uint64_t v17 = 0;
    switch(v15 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v13), v13)) {
          goto LABEL_38;
        }
        if (HIDWORD(v13) - (int)v13 <= 0x8000) {
          goto LABEL_14;
        }
        goto LABEL_11;
      case 2uLL:
        uint64_t v20 = *(void *)(v13 + 16);
        uint64_t v19 = *(void *)(v13 + 24);
        BOOL v21 = __OFSUB__(v19, v20);
        uint64_t v17 = v19 - v20;
        if (v21) {
          goto LABEL_39;
        }
        if (v17 > 0x8000)
        {
LABEL_11:
          sub_1000162D4(v13, v15);
          return 0;
        }
        if (v16 == 2) {
          goto LABEL_16;
        }
LABEL_14:
        LODWORD(v17) = HIDWORD(v13) - v13;
        if (__OFSUB__(HIDWORD(v13), v13)) {
          goto LABEL_40;
        }
        uint64_t v17 = (int)v17;
LABEL_16:
        if (__OFADD__(v17, 200))
        {
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
        }
        uint64_t v22 = calloc(v17 + 200, 1uLL);
        uint64_t v8 = v22;
        if (v22)
        {
          uint64_t v23 = (char *)(v22 + 34);
          _DWORD *v22 = 1;
          switch((int)v16)
          {
            case 1:
              LODWORD(v26) = HIDWORD(v13) - v13;
              if (__OFSUB__(HIDWORD(v13), v13)) {
                goto LABEL_41;
              }
              unint64_t v26 = (int)v26;
LABEL_27:
              if ((v26 & 0x8000000000000000) != 0 || HIDWORD(v26))
              {
                _assertionFailure(_:_:file:line:flags:)();
                __break(1u);
                JUMPOUT(0x100012E3CLL);
              }
              v22[1] = v26;
              strcpy(v23, "previewsd state");
              if (v16 != 2) {
                goto LABEL_33;
              }
              if (__OFSUB__(*(void *)(v13 + 24), *(void *)(v13 + 16)))
              {
                __break(1u);
LABEL_33:
                if (__OFSUB__(HIDWORD(v13), v13)) {
                  goto LABEL_42;
                }
              }
LABEL_34:
              Data.copyBytes(to:count:)();
              break;
            case 2:
              uint64_t v25 = *(void *)(v13 + 16);
              uint64_t v24 = *(void *)(v13 + 24);
              BOOL v21 = __OFSUB__(v24, v25);
              unint64_t v26 = v24 - v25;
              if (!v21) {
                goto LABEL_27;
              }
              __break(1u);
LABEL_23:
              v22[1] = 0;
LABEL_24:
              strcpy(v23, "previewsd state");
              goto LABEL_34;
            case 3:
              goto LABEL_23;
            default:
              v22[1] = BYTE6(v15);
              goto LABEL_24;
          }
        }
        sub_1000162D4(v13, v15);
        break;
      case 3uLL:
        goto LABEL_16;
      default:
        uint64_t v17 = BYTE6(v15);
        goto LABEL_16;
    }
  }
  return v8;
}

uint64_t sub_100012E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t sub_100012EAC(uint64_t a1)
{
  type metadata accessor for String.Encoding();
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v56 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for PropertyList();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v57 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v55 = (char *)&v52 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v53 = (char *)&v52 - v14;
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v52 - v15;
  static Logger.uv.getter();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "SIGINFO received, logging current state dump", v19, 2u);
    swift_slowDealloc();
  }

  uint64_t v22 = *(uint64_t (**)(char *, char *))(v8 + 8);
  uint64_t v20 = (char *)(v8 + 8);
  BOOL v21 = v22;
  v22(v16, (char *)v7);
  id v59 = *(id *)(a1 + 40);
  swift_retain();
  sub_100004C3C(&qword_10003D850);
  sub_100007644(&qword_10003D858, &qword_10003D850);
  SynchronousAccessProviding.syncRead<A>(file:line:column:function:_:)();
  swift_release();
  PropertyList.serializableDictionary.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v23 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v59 = 0;
  id v25 = [v23 dataWithJSONObject:isa options:15 error:&v59];

  id v26 = v59;
  if (v25)
  {
    uint64_t v54 = v21;
    uint64_t v57 = (char *)v7;
    uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v29 = v28;

    static String.Encoding.utf8.getter();
    uint64_t v30 = String.init(data:encoding:)();
    if (v31)
    {
      uint64_t v32 = v30;
      unint64_t v33 = v31;
      uint64_t v34 = v55;
      static Logger.uv.getter();
      swift_bridgeObjectRetain();
      uint64_t v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        unint64_t v56 = v20;
        uint64_t v38 = (uint8_t *)v37;
        id v59 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_10001DDE4(v32, v33, (uint64_t *)&v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%s", v38, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        sub_1000162D4(v27, v29);

        return v54(v55, v57);
      }
      swift_bridgeObjectRelease_n();
      sub_1000162D4(v27, v29);

      uint64_t v51 = v34;
    }
    else
    {
      uint64_t v47 = v53;
      static Logger.uv.getter();
      int v48 = Logger.logObject.getter();
      os_log_type_t v49 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Failed to log state dump as JSON couldn't be converted to string", v50, 2u);
        swift_slowDealloc();
      }
      sub_1000162D4(v27, v29);

      uint64_t v51 = v47;
    }
    return v54(v51, v57);
  }
  else
  {
    uint64_t v40 = v26;
    unint64_t v56 = v20;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.uv.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (uint64_t (*)(char *, uint64_t))v21;
      uint64_t v45 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v43 = 138412290;
      swift_errorRetain();
      uint64_t v46 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v59 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v45 = v46;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Failed to log state dump due to %@", v43, 0xCu);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return v44(v57, v7);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      return v21(v57, (char *)v7);
    }
  }
}

uint64_t sub_100013678()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100013754(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v30 = a3;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v29 = v5;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v31 = a4;
    uint64_t v33 = v18;
    uint64_t v28 = v10;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_10001DDE4(a1, a2, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "state dump provider '%s' added", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v29;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  uint64_t v33 = *(void *)(v5 + 40);
  __chkstk_darwin(v33);
  swift_retain();
  uint64_t v19 = sub_100004C3C(&qword_10003D850);
  id v25 = (char *)&type metadata for () + 8;
  uint64_t v26 = sub_100007644(&qword_10003D858, &qword_10003D850);
  uint64_t v23 = &v21;
  uint64_t v24 = v19;
  uint64_t v22 = sub_100013B90;
  char v21 = 2;
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
  return swift_release();
}

uint64_t sub_100013A7C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *a1;
  *a1 = 0x8000000000000000;
  sub_100015658(a4, a5, a2, a3, isUniquelyReferenced_nonNull_native);
  *a1 = v12;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013B2C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for StateDumpManager()
{
  return self;
}

uint64_t sub_100013B90(uint64_t *a1)
{
  return sub_100013A7C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_100013BB0(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_100013BE8(uint64_t (*a1)(void))
{
  return a1();
}

void sub_100013C10(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_100013CC8(uint64_t a1)
{
  type metadata accessor for PreviewsService.Variant();
  sub_100016508(&qword_10003D4C0, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_100013F2C(a1, v2, (uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant, (unint64_t *)&unk_10003D8C0, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant, (uint64_t)&protocol conformance descriptor for PreviewsService.Variant);
}

unint64_t sub_100013D9C(uint64_t a1)
{
  type metadata accessor for Identifier();
  sub_100016508(&qword_10003D8A0, (void (*)(uint64_t))&type metadata accessor for Identifier);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_100013F2C(a1, v2, (uint64_t (*)(void))&type metadata accessor for Identifier, &qword_10003D8A8, (void (*)(uint64_t))&type metadata accessor for Identifier, (uint64_t)&protocol conformance descriptor for Identifier);
}

unint64_t sub_100013E70(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000140CC(a1, v4);
}

unint64_t sub_100013EB4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100014194(a1, a2, v4);
}

unint64_t sub_100013F2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    os_log_type_t v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_100016508(v23, v24);
      char v19 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_1000140CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100016550(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000165AC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100014194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100014278(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for PreviewsService.Variant();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100004C3C((uint64_t *)&unk_10003D8B0);
  int v47 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_39;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  unint64_t v43 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  int v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v45 = v6;
  uint64_t v46 = v9;
  os_log_type_t v49 = v8;
  uint64_t v50 = v5;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v18++, 1)) {
      goto LABEL_41;
    }
    if (v18 >= v42) {
      break;
    }
    uint64_t v24 = v43;
    unint64_t v25 = v43[v18];
    if (!v25)
    {
      int64_t v26 = v18 + 1;
      if (v18 + 1 >= v42)
      {
LABEL_32:
        swift_release();
        uint64_t v3 = v41;
        if ((v47 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      unint64_t v25 = v43[v26];
      if (!v25)
      {
        while (1)
        {
          int64_t v18 = v26 + 1;
          if (__OFADD__(v26, 1)) {
            break;
          }
          if (v18 >= v42) {
            goto LABEL_32;
          }
          unint64_t v25 = v43[v18];
          ++v26;
          if (v25) {
            goto LABEL_19;
          }
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v18;
    }
LABEL_19:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_20:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v47)
    {
      (*v48)(v49, v28, v50);
      uint64_t v29 = *(void *)(v9 + 56) + 32 * v22;
      uint64_t v30 = *(void *)v29;
      char v31 = *(unsigned char *)(v29 + 8);
      long long v51 = *(_OWORD *)(v29 + 16);
    }
    else
    {
      (*v44)(v49, v28, v50);
      uint64_t v32 = *(void *)(v9 + 56) + 32 * v22;
      uint64_t v30 = *(void *)v32;
      char v31 = *(unsigned char *)(v32 + 8);
      long long v51 = *(_OWORD *)(v32 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100016508(&qword_10003D4C0, (void (*)(uint64_t))&type metadata accessor for PreviewsService.Variant);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v33 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v16 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v19 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v11 + 48) + v27 * v19, v49, v50);
    uint64_t v20 = *(void *)(v11 + 56) + 32 * v19;
    *(void *)uint64_t v20 = v30;
    *(unsigned char *)(v20 + 8) = v31;
    *(_OWORD *)(v20 + 16) = v51;
    ++*(void *)(v11 + 16);
    uint64_t v6 = v45;
    uint64_t v9 = v46;
  }
  swift_release();
  uint64_t v3 = v41;
  uint64_t v24 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v40 = 1 << *(unsigned char *)(v9 + 32);
  if (v40 >= 64) {
    bzero(v24, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v40;
  }
  *(void *)(v9 + 16) = 0;
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_1000146CC(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Identifier();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100004C3C((uint64_t *)&unk_10003D8D0);
  int v46 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  int64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_100016508(&qword_10003D8A0, (void (*)(uint64_t))&type metadata accessor for Identifier);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_100014AF0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004C3C(&qword_10003D1B8);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    int64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *int64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100014E18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004C3C(&qword_10003D860);
  char v6 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      int64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *int64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_100015124(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v30 = a1;
  uint64_t v11 = type metadata accessor for PreviewsService.Variant();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  int64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)*v6;
  unint64_t v17 = sub_100013CC8(a5);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 < v20 || (a6 & 1) == 0)
  {
    if (v22 >= v20 && (a6 & 1) == 0)
    {
      sub_100015970();
      goto LABEL_7;
    }
    sub_100014278(v20, a6 & 1);
    unint64_t v27 = sub_100013CC8(a5);
    if ((v21 & 1) == (v28 & 1))
    {
      unint64_t v17 = v27;
      int64_t v23 = *v7;
      if (v21) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, v11);
      return sub_1000157E0(v17, (uint64_t)v14, v30, a2 & 1, v31, v32, v23);
    }
LABEL_15:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v23 = *v7;
  if ((v21 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v24 = v23[7] + 32 * v17;
  *(void *)uint64_t v24 = v30;
  *(unsigned char *)(v24 + 8) = a2 & 1;
  uint64_t v25 = v32;
  *(void *)(v24 + 16) = v31;
  *(void *)(v24 + 24) = v25;
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_100015328(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for Identifier();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100013D9C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_100015C58();
    goto LABEL_7;
  }
  sub_1000146CC(v17, a3 & 1);
  unint64_t v22 = sub_100013D9C(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_1000158B8(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_1000154D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100013EB4(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_100015EF0();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100014AF0(v17, a5 & 1);
  unint64_t v23 = sub_100013EB4(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  *char v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100015658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100013EB4(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1000160AC();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_release();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100014E18(v17, a5 & 1);
  unint64_t v23 = sub_100013EB4(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  *char v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000157E0(unint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v14 = a7[6];
  uint64_t v15 = type metadata accessor for PreviewsService.Variant();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14 + *(void *)(*(void *)(v15 - 8) + 72) * a1, a2, v15);
  uint64_t v17 = a7[7] + 32 * a1;
  *(void *)uint64_t v17 = a3;
  *(unsigned char *)(v17 + 8) = a4;
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = a6;
  uint64_t v18 = a7[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a7[2] = v20;
  }
  return result;
}

uint64_t sub_1000158B8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for Identifier();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_100015970()
{
  uint64_t v1 = v0;
  uint64_t v38 = type metadata accessor for PreviewsService.Variant();
  uint64_t v2 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  long long v37 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C3C((uint64_t *)&unk_10003D8B0);
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v6;
    return result;
  }
  uint64_t v32 = v1;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v4 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v8);
  }
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(v4 + 16);
  uint64_t v39 = v4;
  uint64_t v40 = v6;
  *(void *)(v6 + 16) = v10;
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v33 = v4 + 64;
  int64_t v34 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v35 = v2 + 32;
  uint64_t v36 = v2 + 16;
  uint64_t v14 = v38;
  uint64_t v15 = v6;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v9 << 6);
      uint64_t v18 = v39;
      goto LABEL_9;
    }
    BOOL v28 = __OFADD__(v9++, 1);
    uint64_t v18 = v39;
    if (v28) {
      goto LABEL_27;
    }
    if (v9 >= v34)
    {
LABEL_24:
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v32;
      uint64_t v6 = v40;
      goto LABEL_25;
    }
    unint64_t v29 = *(void *)(v33 + 8 * v9);
    if (!v29) {
      break;
    }
LABEL_21:
    unint64_t v13 = (v29 - 1) & v29;
    unint64_t v17 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v2 + 72) * v17;
    uint64_t v20 = v37;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v37, *(void *)(v18 + 48) + v19, v14);
    uint64_t v21 = 32 * v17;
    uint64_t v22 = *(void *)(v18 + 56) + v21;
    uint64_t v23 = *(void *)v22;
    char v24 = *(unsigned char *)(v22 + 8);
    unint64_t v25 = *(void *)(v15 + 48) + v19;
    char v26 = *(void (**)(unint64_t, char *, uint64_t))(v2 + 32);
    long long v41 = *(_OWORD *)(v22 + 16);
    v26(v25, v20, v14);
    uint64_t v27 = *(void *)(v15 + 56) + v21;
    *(void *)uint64_t v27 = v23;
    *(unsigned char *)(v27 + 8) = v24;
    *(_OWORD *)(v27 + 16) = v41;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v9 + 1;
  if (v9 + 1 >= v34) {
    goto LABEL_24;
  }
  unint64_t v29 = *(void *)(v33 + 8 * v30);
  if (v29)
  {
    ++v9;
    goto LABEL_21;
  }
  uint64_t v6 = v40;
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v34)
    {
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v32;
      goto LABEL_25;
    }
    unint64_t v29 = *(void *)(v33 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_100015C58()
{
  uint64_t v1 = type metadata accessor for Identifier();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C3C((uint64_t *)&unk_10003D8D0);
  uint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_100015EF0()
{
  uint64_t v1 = v0;
  sub_100004C3C(&qword_10003D1B8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000160AC()
{
  uint64_t v1 = v0;
  sub_100004C3C(&qword_10003D860);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

_DWORD *sub_100016270(uint64_t a1)
{
  return sub_100012990(a1, v1);
}

uint64_t sub_100016278(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016288()
{
  return swift_release();
}

uint64_t sub_100016290(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000162CC()
{
  return sub_100012EAC(v0);
}

uint64_t sub_1000162D4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001632C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012350(a1, a2, a3, a4);
}

uint64_t sub_100016334(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v7) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v22 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v22 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v22 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v22 + 8 * v9);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v20 - 1) & v20;
    unint64_t v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = 16 * v11;
    int64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 56) + v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v14, v15, v17, v18);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v7) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v22 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v22 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000164FC(void *a1, uint64_t a2)
{
  return sub_10001247C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void (**)(uint64_t))(v2 + 32));
}

uint64_t sub_100016508(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016550(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000165AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016608()
{
  uint64_t v0 = static PreviewsServiceConnection.Listener.hostToSim(machServiceName:description:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1000166E8(char a1)
{
  unint64_t result = 0xD000000000000013;
  if (!a1) {
    return 0xD000000000000011;
  }
  return result;
}

uint64_t sub_100016740()
{
  type metadata accessor for DaemonTransactionManager();
  uint64_t inited = swift_initStaticObject();
  if (qword_10003CD38 != -1) {
    swift_once();
  }
  uint64_t result = sub_100013754(0xD000000000000018, 0x8000000100030FD0, (uint64_t)sub_10001687C, 0);
  qword_10003DEC0 = inited;
  return result;
}

unint64_t sub_1000167E4(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001687C()
{
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  TransactionManager.currentState.getter();

  return swift_release();
}

uint64_t sub_1000168CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for DaemonTransactionManager()
{
  return self;
}

uint64_t sub_100016900()
{
  return 0x726576726573;
}

uint64_t sub_100016914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[5] = *a5;
  sub_100004C3C(&qword_10003D980);
  v5[6] = swift_task_alloc();
  v5[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000169E0, 0, 0);
}

uint64_t sub_1000169E0()
{
  if (qword_10003CD30 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_10003DEB0;
  *(void *)(v0 + 64) = qword_10003DEB0;
  *(_DWORD *)(v0 + 72) = PreviewsServiceConnection.remotePid.getter();
  swift_retain();
  return _swift_task_switch(sub_100016A9C, v1, 0);
}

uint64_t sub_100016A9C()
{
  sub_100008528(*(unsigned int *)(v0 + 72), (uint64_t)sub_100016DF0, *(void *)(v0 + 32), *(void *)(v0 + 56));
  swift_release();
  return _swift_task_switch(sub_100016B30, 0, 0);
}

uint64_t sub_100016B30()
{
  uint64_t v1 = v0[6];
  sub_100016DF8(v0[7], v1);
  uint64_t v2 = sub_100004C3C(&qword_10003D1D0);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = v0[6];
    sub_100016E60(v0[7]);
    sub_100016E60(v4);
  }
  else
  {
    v0[2] = v0[4];
    uint64_t v6 = v0[6];
    uint64_t v5 = v0[7];
    sub_100016EC0(&qword_10003D988);
    CancelationToken<>.cancel<A>(onInvalidationOf:)();
    sub_100016E60(v5);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100016C94(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InvalidationTrace();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[1] = a1;
  static InvalidationTrace.empty.getter();
  sub_100016EC0(&qword_10003D998);
  AnyInvalidatable.invalidate(file:line:column:function:trace:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100016DF0()
{
  return sub_100016C94(v0);
}

uint64_t sub_100016DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004C3C(&qword_10003D980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016E60(uint64_t a1)
{
  uint64_t v2 = sub_100004C3C(&qword_10003D980);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100016EC0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004CDC(&qword_10003D990);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DaemonServerRole()
{
  return &type metadata for DaemonServerRole;
}

uint64_t sub_100016F18(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = type metadata accessor for CancellationToken();
  v2[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[6] = v4;
  v2[7] = *(void *)(v4 + 64);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for PropertyList();
  v2[10] = v5;
  v2[11] = *(void *)(v5 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ShellService();
  v2[13] = v6;
  v2[14] = *(void *)(v6 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for PreviewsService.Variant();
  v2[16] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[17] = v8;
  v2[18] = *(void *)(v8 + 64);
  v2[19] = swift_task_alloc();
  sub_100004C3C(&qword_10003DCC8);
  v2[20] = swift_task_alloc();
  return _swift_task_switch(sub_10001713C, 0, 0);
}

uint64_t sub_10001713C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[4];
  static Timeout.seconds(_:)();
  uint64_t v6 = type metadata accessor for Timeout();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  v0[21] = v8;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v4);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_1000172EC;
  uint64_t v10 = v0[20];
  return withTimeout<A>(_:perform:makeTimeoutError:)(v0 + 24, v10, &unk_10003DCD0, v8, &unk_10003D0B0, 0, &type metadata for Int32);
}

uint64_t sub_1000172EC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  sub_100024828(*(void *)(v2 + 160), &qword_10003DCC8);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100024A20;
  }
  else {
    uint64_t v3 = sub_100017444;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100017444()
{
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = v0[13];
  uint64_t v5 = sub_100004C3C(&qword_10003CF18);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for ShellService.hostToShellPipeService(_:), v4);
  static PropertyList.empty.getter();
  uint64_t v6 = static ShellConnection<>.createByMachLookup(for:variant:clientContext:)();
  if (v1)
  {
    uint64_t v8 = v0[14];
    uint64_t v7 = v0[15];
    uint64_t v9 = v0[13];
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  else
  {
    uint64_t v11 = v0[14];
    uint64_t v12 = v0[15];
    uint64_t v21 = v6;
    uint64_t v13 = v0[13];
    uint64_t v15 = v0[8];
    uint64_t v14 = v0[9];
    uint64_t v16 = v0[6];
    uint64_t v17 = v0[5];
    uint64_t v22 = (uint64_t *)v0[3];
    (*(void (**)(void))(v0[11] + 8))();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
    type metadata accessor for PreviewAssertionManager();
    static PreviewAssertionManager.shared.getter();
    PreviewAssertionManager.takeActivePreviewAssertion(for:)();
    swift_release();
    v0[2] = v21;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v14, v17);
    unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v19 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v18, v15, v17);
    sub_100007644((unint64_t *)&qword_10003CF20, &qword_10003CF18);
    ConcurrentInvalidatable.onInvalidation(_:)();
    swift_release();
    v22[3] = v5;
    v22[4] = sub_100007644(&qword_10003CF98, &qword_10003CF18);
    uint64_t *v22 = v21;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100017774(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = type metadata accessor for CancellationToken();
  v2[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[6] = v4;
  v2[7] = *(void *)(v4 + 64);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for PropertyList();
  v2[10] = v5;
  v2[11] = *(void *)(v5 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ShellService();
  v2[13] = v6;
  v2[14] = *(void *)(v6 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for PreviewsService.Variant();
  v2[16] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[17] = v8;
  v2[18] = *(void *)(v8 + 64);
  v2[19] = swift_task_alloc();
  sub_100004C3C(&qword_10003DCC8);
  v2[20] = swift_task_alloc();
  return _swift_task_switch(sub_100017998, 0, 0);
}

uint64_t sub_100017998()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[4];
  static Timeout.seconds(_:)();
  uint64_t v6 = type metadata accessor for Timeout();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  v0[21] = v8;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v4);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100017B48;
  uint64_t v10 = v0[20];
  return withTimeout<A>(_:perform:makeTimeoutError:)(v0 + 24, v10, &unk_10003DCD8, v8, &unk_10003D0B0, 0, &type metadata for Int32);
}

uint64_t sub_100017B48()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  sub_100024828(*(void *)(v2 + 160), &qword_10003DCC8);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_100018020;
  }
  else {
    uint64_t v3 = sub_100017CA0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100017CA0()
{
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = v0[13];
  uint64_t v5 = sub_100004C3C(&qword_10003CF18);
  uint64_t v6 = enum case for ShellService.Instance.hostSide(_:);
  uint64_t v7 = type metadata accessor for ShellService.Instance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v2, v6, v7);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for ShellService.hostToAgentPipeService(_:), v4);
  static PropertyList.empty.getter();
  uint64_t v8 = static ShellConnection<>.createByMachLookup(for:variant:clientContext:)();
  if (v1)
  {
    uint64_t v10 = v0[14];
    uint64_t v9 = v0[15];
    uint64_t v11 = v0[13];
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  else
  {
    uint64_t v13 = v0[14];
    uint64_t v14 = v0[15];
    uint64_t v15 = v8;
    uint64_t v16 = v0[13];
    uint64_t v17 = v0[9];
    uint64_t v18 = v0[6];
    uint64_t v23 = v0[8];
    uint64_t v19 = v0[5];
    int64_t v24 = (uint64_t *)v0[3];
    (*(void (**)(void))(v0[11] + 8))();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v16);
    type metadata accessor for PreviewAssertionManager();
    static PreviewAssertionManager.shared.getter();
    PreviewAssertionManager.takeActivePreviewAssertion(for:)();
    swift_release();
    v0[2] = v15;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v23, v17, v19);
    unint64_t v20 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v21 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v21 + v20, v23, v19);
    sub_100007644((unint64_t *)&qword_10003CF20, &qword_10003CF18);
    ConcurrentInvalidatable.onInvalidation(_:)();
    swift_release();
    v24[3] = v5;
    v24[4] = sub_100007644(&qword_10003CF98, &qword_10003CF18);
    *int64_t v24 = v15;
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_100018020()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000180C8(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v3 - 8);
  long long v37 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CancellationToken();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v34[3] = v7;
  uint64_t v35 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v36 = (char *)v34 - v8;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    v42[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v41 = sub_10001DDE4(0x6C65685374736F48, 0xEF6D65747379536CLL, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v41 = a1;
    type metadata accessor for PreviewsServiceConnection();
    swift_retain();
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v41 = sub_10001DDE4(v16, v17, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "PipeListener<%s> got incoming connection: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (qword_10003CD40 != -1) {
    swift_once();
  }
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  uint64_t v18 = v36;
  TransactionManager.takeTransaction(for:)();
  swift_release();
  v34[2] = sub_100004C3C(&qword_10003D990);
  v42[0] = 0;
  v42[1] = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v19 = dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
  uint64_t v20 = type metadata accessor for TaskPriority();
  uint64_t v21 = *(void *)(v20 - 8);
  v34[0] = *(void *)(v21 + 56);
  v34[1] = v21 + 56;
  uint64_t v22 = (uint64_t)v37;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v34[0])(v37, 1, 1, v20);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = a1;
  v23[5] = v19;
  swift_retain();
  sub_1000199C4(v22, (uint64_t)&unk_10003DB90, (uint64_t)v23);
  swift_release();
  uint64_t v24 = v40;
  v42[0] = *(void *)(v40 + 32);
  __chkstk_darwin(v42[0]);
  swift_retain();
  uint64_t v25 = sub_100004C3C(&qword_10003DB98);
  v33[2] = (char *)&type metadata for () + 8;
  v33[3] = sub_100007644(&qword_10003DBA0, &qword_10003DB98);
  v33[0] = v33;
  v33[1] = v25;
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
  swift_release();
  v42[0] = v19;
  uint64_t v27 = v38;
  uint64_t v26 = v39;
  BOOL v28 = v35;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v18, v39);
  unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v30 + v29, v28, v26);
  sub_100007644(&qword_10003D988, &qword_10003D990);
  swift_retain();
  ConcurrentInvalidatable.onInvalidation(_:)();
  swift_release();
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v34[0])(v22, 1, 1, v20);
  uint64_t v31 = (void *)swift_allocObject();
  v31[2] = 0;
  v31[3] = 0;
  v31[4] = v24;
  v31[5] = v19;
  swift_retain();
  swift_retain();
  sub_1000199C4(v22, (uint64_t)&unk_10003DBB0, (uint64_t)v31);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v18, v26);
}

uint64_t sub_1000187F0(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v3 - 8);
  long long v37 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CancellationToken();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v34[3] = v7;
  uint64_t v35 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v36 = (char *)v34 - v8;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    v42[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v41 = sub_10001DDE4(0x6E65674174736F48, 0xEF6D657473795374, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v41 = a1;
    type metadata accessor for PreviewsServiceConnection();
    swift_retain();
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v41 = sub_10001DDE4(v16, v17, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "PipeListener<%s> got incoming connection: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (qword_10003CD40 != -1) {
    swift_once();
  }
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  uint64_t v18 = v36;
  TransactionManager.takeTransaction(for:)();
  swift_release();
  v34[2] = sub_100004C3C(&qword_10003D990);
  v42[0] = 0;
  v42[1] = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v19 = dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
  uint64_t v20 = type metadata accessor for TaskPriority();
  uint64_t v21 = *(void *)(v20 - 8);
  v34[0] = *(void *)(v21 + 56);
  v34[1] = v21 + 56;
  uint64_t v22 = (uint64_t)v37;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v34[0])(v37, 1, 1, v20);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = a1;
  v23[5] = v19;
  swift_retain();
  sub_1000199C4(v22, (uint64_t)&unk_10003DBE8, (uint64_t)v23);
  swift_release();
  uint64_t v24 = v40;
  v42[0] = *(void *)(v40 + 32);
  __chkstk_darwin(v42[0]);
  swift_retain();
  uint64_t v25 = sub_100004C3C(&qword_10003DBF0);
  v33[2] = (char *)&type metadata for () + 8;
  v33[3] = sub_100007644(&qword_10003DBF8, &qword_10003DBF0);
  v33[0] = v33;
  v33[1] = v25;
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
  swift_release();
  v42[0] = v19;
  uint64_t v27 = v38;
  uint64_t v26 = v39;
  BOOL v28 = v35;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v18, v39);
  unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v30 + v29, v28, v26);
  sub_100007644(&qword_10003D988, &qword_10003D990);
  swift_retain();
  ConcurrentInvalidatable.onInvalidation(_:)();
  swift_release();
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v34[0])(v22, 1, 1, v20);
  uint64_t v31 = (void *)swift_allocObject();
  v31[2] = 0;
  v31[3] = 0;
  v31[4] = v24;
  v31[5] = v19;
  swift_retain();
  swift_retain();
  sub_1000199C4(v22, (uint64_t)&unk_10003DC08, (uint64_t)v31);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v18, v26);
}

uint64_t sub_100018F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t *a5)
{
  return CancellationToken.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t sub_100019038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[11] = *a5;
  uint64_t v6 = type metadata accessor for InvalidationTrace();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  return _swift_task_switch(sub_10001917C, 0, 0);
}

uint64_t sub_10001917C()
{
  uint64_t v1 = v0[10];
  v0[5] = v0[11];
  v0[6] = sub_100007644(&qword_10003DAE0, &qword_10003D990);
  v0[2] = v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100019268;
  return MessagePipe.addLeftTransport(_:)(v0 + 2);
}

uint64_t sub_100019268()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_1000249D8, 0, 0);
  }
  else
  {
    sub_1000098A0(v2 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1000193B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[11] = *a5;
  uint64_t v6 = type metadata accessor for InvalidationTrace();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  return _swift_task_switch(sub_1000194FC, 0, 0);
}

uint64_t sub_1000194FC()
{
  uint64_t v1 = v0[10];
  v0[5] = v0[11];
  v0[6] = sub_100007644(&qword_10003DAE0, &qword_10003D990);
  v0[2] = v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000195E8;
  return MessagePipe.addLeftTransport(_:)(v0 + 2);
}

uint64_t sub_1000195E8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100019738, 0, 0);
  }
  else
  {
    sub_1000098A0(v2 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_100019738()
{
  sub_1000098A0((uint64_t)(v0 + 2));
  static Logger.uv.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to attach client to message pipe: %@", v3, 0xCu);
    sub_100004C3C(&qword_10003CF90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = v0[16];
  uint64_t v6 = v0[17];
  uint64_t v8 = v0[14];
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[13];
  uint64_t v14 = v0[12];
  uint64_t v11 = v0[10];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v9);
  v0[7] = v11;
  static InvalidationTrace.empty.getter();
  sub_100007644(&qword_10003D998, &qword_10003D990);
  AnyInvalidatable.invalidate(file:line:column:function:trace:)();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_1000199C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100024828(a1, &qword_10003D238);
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

uint64_t sub_100019B70(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100024828(a1, &qword_10003D238);
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
  sub_100004C3C(&qword_10003DB50);
  return swift_task_create();
}

uint64_t sub_100019D24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_100004C3C(&qword_10003D238);
  uint64_t result = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1 + a2;
  if (__OFADD__(*a1, a2))
  {
    __break(1u);
  }
  else
  {
    *a1 = v13;
    if (a1[1])
    {
      sub_100004C3C(&qword_10003DBB8);
      Task.cancel()();
      uint64_t result = swift_release();
    }
    a1[1] = 0;
    if (!v13)
    {
      uint64_t v14 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
      uint64_t v15 = (void *)swift_allocObject();
      _OWORD v15[2] = 0;
      v15[3] = 0;
      v15[4] = a3;
      swift_retain();
      uint64_t v16 = sub_10001AD00((uint64_t)v12, a5, (uint64_t)v15);
      uint64_t result = swift_release();
      a1[1] = v16;
    }
  }
  return result;
}

uint64_t sub_100019E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v5 = type metadata accessor for ContinuousClock();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v4[7] = v6;
  v4[8] = *(void *)(v6 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_100019FC8, 0, 0);
}

uint64_t sub_100019FC8()
{
  static Logger.uv.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Last pipe listener client went away, scheduling teardown...", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[11] = v7;
  v0[12] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v4, v5);
  ContinuousClock.init()();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10003DBD0 + dword_10003DBD0);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[13] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10001A148;
  return v10(5000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_10001A148()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_1000249DC;
  }
  else {
    uint64_t v5 = sub_10001A2B8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001A2B8()
{
  uint64_t v13 = v0;
  static Logger.uv.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[11];
    uint64_t v4 = v0[9];
    uint64_t v5 = v0[7];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[2] = sub_10001DDE4(0x6C65685374736F48, 0xEF6D65747379536CLL, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Tearing down pipe listener on %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v3(v4, v5);
  }
  else
  {
    uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[11];
    uint64_t v8 = v0[9];
    uint64_t v9 = v0[7];

    v7(v8, v9);
  }
  uint64_t v10 = (void *)swift_task_alloc();
  v0[15] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_100024A1C;
  return MessagePipe.teardown(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/previewsd/Sources/previewsd/PipeListener.swift", 102, 2, 104, 47, "updateClientCount(_:)", 21, 2);
}

uint64_t sub_10001A4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v5 = type metadata accessor for ContinuousClock();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v4[7] = v6;
  v4[8] = *(void *)(v6 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_10001A614, 0, 0);
}

uint64_t sub_10001A614()
{
  static Logger.uv.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Last pipe listener client went away, scheduling teardown...", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[11] = v7;
  v0[12] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v4, v5);
  ContinuousClock.init()();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10003DBD0 + dword_10003DBD0);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[13] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10001A794;
  return v10(5000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_10001A794()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_10001A904;
  }
  else {
    uint64_t v5 = sub_10001A97C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001A904()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001A97C()
{
  uint64_t v13 = v0;
  static Logger.uv.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[11];
    uint64_t v4 = v0[9];
    uint64_t v5 = v0[7];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[2] = sub_10001DDE4(0x6E65674174736F48, 0xEF6D657473795374, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Tearing down pipe listener on %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v3(v4, v5);
  }
  else
  {
    uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[11];
    uint64_t v8 = v0[9];
    uint64_t v9 = v0[7];

    v7(v8, v9);
  }
  uint64_t v10 = (void *)swift_task_alloc();
  v0[15] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_10001ABAC;
  return MessagePipe.teardown(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/previewsd/Sources/previewsd/PipeListener.swift", 102, 2, 104, 47, "updateClientCount(_:)", 21, 2);
}

uint64_t sub_10001ABAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001AD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100024828(a1, &qword_10003D238);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_10001AE88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v28 = a4;
  uint64_t v26 = a3;
  uint64_t v5 = sub_100004C3C(&qword_10003DA90);
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v25 + 64);
  uint64_t v7 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C3C(&qword_10003D990);
  swift_retain_n();
  uint64_t v14 = dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
  uint64_t v15 = type metadata accessor for TaskPriority();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v13, 1, 1, v15);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a1;
  v17[5] = v14;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DA98, (uint64_t)v17);
  swift_release();
  if (qword_10003CD40 != -1) {
    swift_once();
  }
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  TransactionManager.takeTransaction(for:)();
  swift_release();
  uint64_t v18 = type metadata accessor for CancellationToken();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
  v16(v13, 1, 1, v15);
  sub_10000914C((uint64_t)v10, (uint64_t)v8, &qword_10003DA90);
  unint64_t v19 = (*(unsigned __int8 *)(v25 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  uint64_t v21 = v26;
  uint64_t v22 = v27;
  v20[4] = v27;
  v20[5] = v21;
  v20[6] = v28;
  v20[7] = v14;
  sub_1000240E8((uint64_t)v8, (uint64_t)v20 + v19, &qword_10003DA90);
  swift_retain();
  id v23 = v22;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DAA8, (uint64_t)v20);
  swift_release();
  swift_release();
  return sub_100024828((uint64_t)v10, &qword_10003DA90);
}

uint64_t sub_10001B204(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v28 = a4;
  uint64_t v26 = a3;
  uint64_t v5 = sub_100004C3C(&qword_10003DA90);
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v25 + 64);
  uint64_t v7 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C3C(&qword_10003D990);
  swift_retain_n();
  uint64_t v14 = dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
  uint64_t v15 = type metadata accessor for TaskPriority();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v13, 1, 1, v15);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a1;
  v17[5] = v14;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DB08, (uint64_t)v17);
  swift_release();
  if (qword_10003CD40 != -1) {
    swift_once();
  }
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  TransactionManager.takeTransaction(for:)();
  swift_release();
  uint64_t v18 = type metadata accessor for CancellationToken();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
  v16(v13, 1, 1, v15);
  sub_10000914C((uint64_t)v10, (uint64_t)v8, &qword_10003DA90);
  unint64_t v19 = (*(unsigned __int8 *)(v25 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  uint64_t v21 = v26;
  uint64_t v22 = v27;
  v20[4] = v27;
  v20[5] = v21;
  v20[6] = v28;
  v20[7] = v14;
  sub_1000240E8((uint64_t)v8, (uint64_t)v20 + v19, &qword_10003DA90);
  swift_retain();
  id v23 = v22;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DB18, (uint64_t)v20);
  swift_release();
  swift_release();
  return sub_100024828((uint64_t)v10, &qword_10003DA90);
}

uint64_t sub_10001B580(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v28 = a4;
  uint64_t v26 = a3;
  uint64_t v5 = sub_100004C3C(&qword_10003DA90);
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v25 + 64);
  uint64_t v7 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C3C(&qword_10003D990);
  swift_retain_n();
  uint64_t v14 = dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
  uint64_t v15 = type metadata accessor for TaskPriority();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v13, 1, 1, v15);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a1;
  v17[5] = v14;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DB58, (uint64_t)v17);
  swift_release();
  if (qword_10003CD40 != -1) {
    swift_once();
  }
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  TransactionManager.takeTransaction(for:)();
  swift_release();
  uint64_t v18 = type metadata accessor for CancellationToken();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
  v16(v13, 1, 1, v15);
  sub_10000914C((uint64_t)v10, (uint64_t)v8, &qword_10003DA90);
  unint64_t v19 = (*(unsigned __int8 *)(v25 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  uint64_t v21 = v26;
  uint64_t v22 = v27;
  v20[4] = v27;
  v20[5] = v21;
  v20[6] = v28;
  v20[7] = v14;
  sub_1000240E8((uint64_t)v8, (uint64_t)v20 + v19, &qword_10003DA90);
  swift_retain();
  id v23 = v22;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DB68, (uint64_t)v20);
  swift_release();
  swift_release();
  return sub_100024828((uint64_t)v10, &qword_10003DA90);
}

uint64_t sub_10001B8FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v28 = a4;
  uint64_t v26 = a3;
  uint64_t v5 = sub_100004C3C(&qword_10003DA90);
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v25 + 64);
  uint64_t v7 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_100004C3C(&qword_10003D238);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C3C(&qword_10003D990);
  swift_retain_n();
  uint64_t v14 = dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
  uint64_t v15 = type metadata accessor for TaskPriority();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v13, 1, 1, v15);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a1;
  v17[5] = v14;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DC20, (uint64_t)v17);
  swift_release();
  if (qword_10003CD40 != -1) {
    swift_once();
  }
  type metadata accessor for TransactionManager();
  static TransactionManager.shared.getter();
  TransactionManager.takeTransaction(for:)();
  swift_release();
  uint64_t v18 = type metadata accessor for CancellationToken();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
  v16(v13, 1, 1, v15);
  sub_10000914C((uint64_t)v10, (uint64_t)v8, &qword_10003DA90);
  unint64_t v19 = (*(unsigned __int8 *)(v25 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  uint64_t v21 = v26;
  uint64_t v22 = v27;
  v20[4] = v27;
  v20[5] = v21;
  v20[6] = v28;
  v20[7] = v14;
  sub_1000240E8((uint64_t)v8, (uint64_t)v20 + v19, &qword_10003DA90);
  swift_retain();
  id v23 = v22;
  swift_retain();
  sub_1000199C4((uint64_t)v13, (uint64_t)&unk_10003DC30, (uint64_t)v20);
  swift_release();
  swift_release();
  return sub_100024828((uint64_t)v10, &qword_10003DA90);
}

uint64_t sub_10001BC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a8;
  sub_100004C3C(&qword_10003DA90);
  v8[3] = swift_task_alloc();
  uint64_t v12 = (void *)swift_task_alloc();
  v8[4] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10001BD58;
  return sub_10001E678(a7, a5, a6);
}

uint64_t sub_10001BD58()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000249E0, 0, 0);
}

uint64_t sub_10001BE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a8;
  sub_100004C3C(&qword_10003DA90);
  v8[3] = swift_task_alloc();
  uint64_t v12 = (void *)swift_task_alloc();
  v8[4] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10001BD58;
  return sub_100020298(a7, a5, a6);
}

uint64_t sub_10001BF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a8;
  sub_100004C3C(&qword_10003DA90);
  v8[3] = swift_task_alloc();
  uint64_t v12 = (void *)swift_task_alloc();
  v8[4] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10001C014;
  return sub_100021464(a7, a5, a6);
}

uint64_t sub_10001C014()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C110, 0, 0);
}

uint64_t sub_10001C110()
{
  uint64_t v1 = v0[3];
  sub_10000914C(v0[2], v1, &qword_10003DA90);
  uint64_t v2 = type metadata accessor for CancellationToken();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[3];
  if (v4 == 1)
  {
    sub_100024828(v0[3], &qword_10003DA90);
  }
  else
  {
    CancellationToken.cancel(dsoHandle:file:line:column:function:)();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10001C254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a8;
  sub_100004C3C(&qword_10003DA90);
  v8[3] = swift_task_alloc();
  uint64_t v12 = (void *)swift_task_alloc();
  v8[4] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10001BD58;
  return sub_100022D6C(a7, a5, a6);
}

void *sub_10001C334(uint64_t a1)
{
  uint64_t v83 = a1;
  uint64_t v1 = type metadata accessor for PreviewsService.Variant();
  uint64_t v104 = *(void *)(v1 - 8);
  uint64_t v100 = *(void *)(v104 + 64);
  uint64_t v2 = __chkstk_darwin(v1);
  v84 = (char *)v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v101 = (char *)v82 - v5;
  __chkstk_darwin(v4);
  v85 = (char *)v82 - v6;
  uint64_t v7 = type metadata accessor for PreviewsService();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = type metadata accessor for PreviewsServiceConnection.Listener();
  uint64_t v11 = *(void (**)(char *, void, uint64_t))(v8 + 104);
  v11(v10, enum case for PreviewsService.processExit(_:), v7);
  v87 = v11;
  uint64_t v91 = v8 + 104;
  uint64_t v12 = static PreviewsServiceConnection.Listener.local(service:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13(v10, v7);
  v88 = v13;
  uint64_t v93 = v8 + 8;
  uint64_t v14 = v105;
  v105[3] = v12;
  v14[4] = sub_100026FB4;
  v14[5] = 0;
  unsigned int v90 = enum case for PreviewsService.Variant.default(_:);
  uint64_t v15 = v104;
  v92 = *(void (**)(char *))(v104 + 104);
  uint64_t v98 = v104 + 104;
  uint64_t v16 = v85;
  v92(v85);
  uint64_t v18 = v15 + 16;
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v94 = v17;
  v17(v101, v16, v1);
  v17(v10, v16, v1);
  uint64_t v103 = v18;
  uint64_t v89 = v7;
  v11(v10, enum case for PreviewsService.agentPipe(_:), v7);
  uint64_t v19 = static PreviewsServiceConnection.Listener.local(service:)();
  v13(v10, v7);
  v82[5] = sub_100004C3C(&qword_10003DC68);
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  v82[4] = sub_100004C3C(&qword_10003DC70);
  v20[4] = OSAllocatedUnfairLock.init(value:)();
  v20[2] = v19;
  v82[3] = sub_100004C3C(&qword_10003DC78);
  uint64_t v21 = v84;
  uint64_t v22 = v101;
  id v23 = v94;
  v94(v84, v101, v1);
  uint64_t v24 = v104;
  uint64_t v25 = *(unsigned __int8 *)(v104 + 80);
  v100 += (v25 + 16) & ~v25;
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v96 = v26;
  uint64_t v97 = v25 | 7;
  uint64_t v27 = swift_allocObject();
  v95 = *(void (**)(uint64_t, char *, uint64_t))(v24 + 32);
  uint64_t v99 = v24 + 32;
  v95(v27 + v26, v21, v1);
  uint64_t v28 = MessagePipe.__allocating_init(makeRightTransport:)();
  unint64_t v29 = *(void (**)(char *, uint64_t))(v24 + 8);
  uint64_t v104 = v24 + 8;
  uint64_t v30 = v22;
  v29(v22, v1);
  v20[3] = v28;
  uint64_t v31 = v85;
  v29(v85, v1);
  v105[6] = v20;
  ((void (*)(char *, void, uint64_t))v92)(v31, v90, v1);
  v23(v30, v31, v1);
  v23(v10, v31, v1);
  uint64_t v32 = v89;
  v87(v10, enum case for PreviewsService.shellPipe(_:), v89);
  uint64_t v33 = static PreviewsServiceConnection.Listener.local(service:)();
  v88(v10, v32);
  v82[2] = sub_100004C3C(&qword_10003DC90);
  int64_t v34 = (void *)swift_allocObject();
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  v82[1] = sub_100004C3C(&qword_10003DC98);
  void v34[4] = OSAllocatedUnfairLock.init(value:)();
  v34[2] = v33;
  v82[0] = sub_100004C3C(&qword_10003DCA0);
  uint64_t v35 = v84;
  v23(v84, v30, v1);
  uint64_t v36 = swift_allocObject();
  v95(v36 + v96, v35, v1);
  uint64_t v37 = MessagePipe.__allocating_init(makeRightTransport:)();
  v86 = v29;
  v29(v30, v1);
  v34[3] = v37;
  uint64_t v38 = v85;
  v29(v85, v1);
  v105[7] = v34;
  uint64_t v39 = v92;
  ((void (*)(char *, void, uint64_t))v92)(v38, v90, v1);
  uint64_t v40 = v38;
  uint64_t v41 = v94;
  v94(v10, v38, v1);
  uint64_t v42 = v89;
  unint64_t v43 = v87;
  v87(v10, enum case for PreviewsService.preview(_:), v89);
  uint64_t v44 = static PreviewsServiceConnection.Listener.local(service:)();
  uint64_t v45 = v42;
  int v46 = v88;
  v88(v10, v45);
  int v47 = v101;
  v41(v101, v40, v1);
  int v48 = v41;
  uint64_t v49 = swift_allocObject();
  v95(v49 + v96, v47, v1);
  v86(v40, v1);
  uint64_t v50 = v105;
  v105[8] = v44;
  v50[9] = sub_1000245F4;
  v50[10] = v49;
  uint64_t v51 = v90;
  ((void (*)(char *, void, uint64_t))v39)(v40, v90, v1);
  uint64_t v52 = v48;
  v48(v10, v40, v1);
  uint64_t v53 = v89;
  v43(v10, enum case for PreviewsService.install(_:), v89);
  uint64_t v54 = static PreviewsServiceConnection.Listener.local(service:)();
  v46(v10, v53);
  uint64_t v55 = v101;
  v52(v101, v40, v1);
  uint64_t v56 = swift_allocObject();
  v95(v56 + v96, v55, v1);
  uint64_t v57 = v86;
  v86(v40, v1);
  uint64_t v58 = v105;
  v105[11] = v54;
  v58[12] = sub_100024624;
  v58[13] = v56;
  uint64_t v59 = v51;
  uint64_t v60 = v51;
  uint64_t v61 = (void (*)(char *, uint64_t, uint64_t))v92;
  ((void (*)(char *, uint64_t, uint64_t))v92)(v40, v60, v1);
  uint64_t v62 = v89;
  v87(v10, enum case for PreviewsService.crashListener(_:), v89);
  uint64_t v63 = static PreviewsServiceConnection.Listener.local(service:)();
  v88(v10, v62);
  uint64_t v64 = v101;
  v94(v101, v40, v1);
  uint64_t v65 = swift_allocObject();
  uint64_t v66 = v64;
  v67 = v95;
  v95(v65 + v96, v66, v1);
  v57(v40, v1);
  uint64_t v68 = v105;
  v105[14] = v63;
  v68[15] = sub_100024654;
  v68[16] = v65;
  v61(v40, v59, v1);
  uint64_t v69 = sub_100016608();
  v70 = (void *)swift_allocObject();
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  v70[4] = OSAllocatedUnfairLock.init(value:)();
  v70[2] = v69;
  v71 = v101;
  v94(v101, v40, v1);
  uint64_t v72 = swift_allocObject();
  uint64_t v73 = v96;
  v67(v72 + v96, v71, v1);
  uint64_t v74 = MessagePipe.__allocating_init(makeRightTransport:)();
  v75 = v86;
  v86(v40, v1);
  v70[3] = v74;
  v105[17] = v70;
  ((void (*)(char *, void, uint64_t))v92)(v40, v90, v1);
  uint64_t v76 = sub_100016608();
  v77 = (void *)swift_allocObject();
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  v77[4] = OSAllocatedUnfairLock.init(value:)();
  v77[2] = v76;
  v94(v71, v40, v1);
  uint64_t v78 = swift_allocObject();
  v95(v78 + v73, v71, v1);
  uint64_t v79 = MessagePipe.__allocating_init(makeRightTransport:)();
  v75(v40, v1);
  v77[3] = v79;
  v80 = v105;
  v105[18] = v77;
  v80[19] = sub_100016608();
  v80[20] = sub_10000E6E0;
  v80[21] = 0;
  v80[2] = v83;
  return v80;
}

uint64_t sub_10001CF00()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "activate Daemon", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = *(void *)(v1 + 40);
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(v10 + 16) = v11;
  *(void *)(v10 + 32) = v9;
  id v12 = (id)v11;
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  uint64_t v13 = *(void *)(v1 + 104);
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(v1 + 88);
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = v13;
  id v16 = (id)v15;
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  uint64_t v17 = *(void *)(v1 + 80);
  uint64_t v18 = swift_allocObject();
  long long v19 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v18 + 16) = v19;
  *(void *)(v18 + 32) = v17;
  id v20 = (id)v19;
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  uint64_t v21 = *(void *)(v1 + 168);
  uint64_t v22 = swift_allocObject();
  long long v23 = *(_OWORD *)(v1 + 152);
  *(_OWORD *)(v22 + 16) = v23;
  *(void *)(v22 + 32) = v21;
  (id)v23;
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  swift_release();
  uint64_t v24 = *(void *)(v1 + 128);
  uint64_t v25 = swift_allocObject();
  long long v26 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v25 + 16) = v26;
  *(void *)(v25 + 32) = v24;
  (id)v26;
  swift_retain();
  PreviewsServiceConnection.Listener.activate(handler:)();
  return swift_release();
}

uint64_t sub_10001D304()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();

  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 64);
  swift_release();

  uint64_t v3 = *(void **)(v0 + 88);
  swift_release();

  uint64_t v4 = *(void **)(v0 + 112);
  swift_release();

  swift_release();
  swift_release();
  uint64_t v5 = *(void **)(v0 + 152);
  swift_release();

  return v0;
}

uint64_t sub_10001D39C()
{
  sub_10001D304();

  return _swift_deallocClassInstance(v0, 176, 7);
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

uint64_t sub_10001D3F8(uint64_t a1)
{
  return sub_10001B8FC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10001D404(uint64_t a1)
{
  return sub_1000187F0(a1, v1);
}

uint64_t sub_10001D40C(uint64_t a1)
{
  return sub_1000180C8(a1, v1);
}

uint64_t sub_10001D418(uint64_t a1)
{
  return sub_10001B580(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10001D428(uint64_t a1)
{
  return sub_10001B204(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10001D43C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001D47C(uint64_t a1)
{
  return sub_10001AE88(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10001D48C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = (void *)v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100011618;
  return sub_100016914(a1, v4, v5, v7, v6);
}

uint64_t sub_10001D550(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100004C3C(&qword_10003DA90) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  id v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *id v12 = v2;
  v12[1] = sub_100011618;
  return sub_10001BC78(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_10001D668(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001D6A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001D780;
  return v6(a1);
}

uint64_t sub_10001D780()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001D878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_10001D97C, 0, 0);
}

uint64_t sub_10001D97C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock();
  uint64_t v5 = sub_10002263C(&qword_10003DBD8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_10002263C(&qword_10003DBE0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10001DB1C;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_10001DB1C()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_10001DCD8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_10001DCD8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001DD44(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001DD6C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001DDE4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001DDE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001DEB8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100020028((uint64_t)v12, *a3);
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
      sub_100020028((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000098A0((uint64_t)v12);
  return v7;
}

uint64_t sub_10001DEB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001E074(a5, a6);
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

uint64_t sub_10001E074(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001E10C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001E2EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001E2EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001E10C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001E284(v2, 0);
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

void *sub_10001E284(uint64_t a1, uint64_t a2)
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
  sub_100004C3C(&qword_10003DAF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001E2EC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004C3C(&qword_10003DAF0);
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

unsigned char **sub_10001E43C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10001E44C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001E47C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  size_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_10001E55C;
  return v5(v2 + 32);
}

uint64_t sub_10001E55C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  char v3 = *(unsigned char *)(v1 + 36);
  *(_DWORD *)uint64_t v2 = *(_DWORD *)(v1 + 32);
  *(unsigned char *)(v2 + 4) = v3;
  unint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10001E678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[12] = a2;
  v3[13] = a3;
  v3[11] = a1;
  uint64_t v4 = sub_100004C3C(&qword_10003CF58);
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = type metadata accessor for DaemonToShell.TwoWayMessage();
  v3[18] = swift_task_alloc();
  uint64_t CrashRequest = type metadata accessor for NextCrashRequest();
  v3[19] = CrashRequest;
  v3[20] = *(void *)(CrashRequest - 8);
  v3[21] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for TransportReply();
  v3[22] = v6;
  v3[23] = *(void *)(v6 - 8);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  type metadata accessor for CrashListenerInterface.TwoWayMessage();
  v3[26] = swift_task_alloc();
  uint64_t v7 = sub_100004C3C(&qword_10003DAB8);
  v3[27] = v7;
  v3[28] = *(void *)(v7 - 8);
  v3[29] = swift_task_alloc();
  sub_100004C3C(&qword_10003DAC0);
  v3[30] = swift_task_alloc();
  uint64_t v8 = sub_100004C3C(&qword_10003DAC8);
  v3[31] = v8;
  v3[32] = *(void *)(v8 - 8);
  v3[33] = swift_task_alloc();
  type metadata accessor for CrashListenerService();
  v3[34] = swift_task_alloc();
  uint64_t v9 = sub_100004C3C(&qword_10003DAD0);
  v3[35] = v9;
  v3[36] = *(void *)(v9 - 8);
  v3[37] = swift_task_alloc();
  uint64_t v10 = sub_100004C3C(&qword_10003DAD8);
  v3[38] = v10;
  v3[39] = *(void *)(v10 - 8);
  v3[40] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for Logger();
  v3[41] = v11;
  v3[42] = *(void *)(v11 - 8);
  v3[43] = swift_task_alloc();
  v3[44] = swift_task_alloc();
  return _swift_task_switch(sub_10001EAAC, 0, 0);
}

uint64_t sub_10001EAAC()
{
  uint64_t v21 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v18 = v0[41];
    uint64_t v19 = v0[44];
    uint64_t v3 = v0[11];
    uint64_t v17 = v0[42];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[8] = sub_10001DDE4(0xD000000000000014, 0x8000000100032970, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v4 + 12) = 2080;
    v0[9] = v3;
    sub_100004C3C(&qword_10003D990);
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v5 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[10] = sub_10001DDE4(v5, v6, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Creating %s service for connection: %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v7(v19, v18);
  }
  else
  {
    uint64_t v8 = v0[44];
    uint64_t v9 = v0[41];
    uint64_t v10 = v0[42];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v7(v8, v9);
  }
  v0[45] = v7;
  uint64_t v11 = v0[11];
  v0[2] = v11;
  type metadata accessor for CrashListenerInterface();
  uint64_t v12 = sub_100004C3C(&qword_10003D990);
  v0[46] = v12;
  uint64_t v13 = sub_100007644(&qword_10003DAE0, &qword_10003D990);
  Transport.activate<A>(forReceivingMessages:)();
  v0[3] = v11;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[47] = v14;
  void *v14 = v0;
  v14[1] = sub_10001EE14;
  uint64_t v15 = v0[37];
  return Transport.transportSender<A>(for:)(v15, &type metadata for Never, v12, &type metadata for Never, v13, &protocol witness table for Never);
}

uint64_t sub_10001EE14()
{
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_10001F038;
  }
  else {
    os_log_type_t v2 = sub_10001EF28;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001EF28()
{
  uint64_t v1 = v0[37];
  os_log_type_t v2 = (void (*)(uint64_t, uint64_t))v0[12];
  uint64_t v3 = DaemonConnection.invalidationHandle.getter();
  v2(v1, v3);
  swift_release();
  AsyncStream.makeAsyncIterator()();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[49] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10001F3A8;
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[31];
  return AsyncStream.Iterator.next(isolation:)(v5, 0, 0, v6);
}

uint64_t sub_10001F038()
{
  uint64_t v22 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v16 = v0[41];
    uint64_t v17 = v0[43];
    uint64_t v3 = v0[39];
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[45];
    uint64_t v20 = v0[40];
    uint64_t v18 = v0[38];
    uint64_t v4 = v0[11];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[4] = sub_10001DDE4(0xD000000000000014, 0x8000000100032970, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    v0[5] = v4;
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[6] = sub_10001DDE4(v6, v7, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not activate %s service for connection: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    v19(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v20, v18);
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[45];
    uint64_t v9 = v0[43];
    uint64_t v11 = v0[40];
    uint64_t v10 = v0[41];
    uint64_t v12 = v0[38];
    uint64_t v13 = v0[39];
    swift_errorRelease();

    swift_release_n();
    v8(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_10001F3A8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001F4A4, 0, 0);
}

uint64_t sub_10001F4A4()
{
  uint64_t v1 = v0[30];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[28] + 48))(v1, 1, v0[27]) == 1)
  {
    uint64_t v3 = v0[39];
    uint64_t v2 = v0[40];
    uint64_t v5 = v0[37];
    uint64_t v4 = v0[38];
    uint64_t v6 = v0[35];
    uint64_t v7 = v0[36];
    uint64_t v8 = v0[34];
    (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[31]);
    sub_100024088(v8, (uint64_t (*)(void))type metadata accessor for CrashListenerService);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v11 = v0[26];
    uint64_t v12 = v0[19];
    uint64_t v13 = v0[20];
    sub_1000240E8(v1, v0[29], &qword_10003DAB8);
    TransportMessage<>.body.getter();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      uint64_t v14 = v0[25];
      uint64_t v15 = v0[22];
      uint64_t v16 = v0[23];
      TransportMessage<>.reply.getter();
      TransportReply.send(file:line:column:function:)();
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
      sub_100024828(v0[29], &qword_10003DAB8);
      uint64_t v17 = (void *)swift_task_alloc();
      v0[49] = v17;
      void *v17 = v0;
      v17[1] = sub_10001F3A8;
      uint64_t v18 = v0[30];
      uint64_t v19 = v0[31];
      return AsyncStream.Iterator.next(isolation:)(v18, 0, 0, v19);
    }
    else
    {
      uint64_t v20 = v0[20];
      uint64_t v21 = v0[21];
      uint64_t v23 = v0[18];
      uint64_t v22 = v0[19];
      (*(void (**)(uint64_t, void, uint64_t))(v20 + 32))(v21, v0[26], v22);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v23, v21, v22);
      swift_storeEnumTagMultiPayload();
      TransportMessage<>.reply.getter();
      type metadata accessor for PreviewShellProxy();
      uint64_t v24 = (void *)swift_task_alloc();
      v0[50] = v24;
      uint64_t v25 = sub_100004C3C(&qword_10003CEA0);
      *uint64_t v24 = v0;
      v24[1] = sub_10001F8BC;
      return ConcurrentOnDemand.value.getter(v0 + 7, v25);
    }
  }
}

uint64_t sub_10001F8BC()
{
  uint64_t v2 = (void *)*v1;
  v2[51] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_10001FBAC, 0, 0);
  }
  else
  {
    v2[52] = v2[7];
    uint64_t v3 = type metadata accessor for DaemonToShell();
    uint64_t v4 = (void *)swift_task_alloc();
    v2[53] = v4;
    uint64_t v5 = sub_10002263C(&qword_10003CF60, (void (*)(uint64_t))&type metadata accessor for DaemonToShell);
    *uint64_t v4 = v2;
    v4[1] = sub_10001FA90;
    uint64_t v6 = v2[16];
    return ShellConnection.makeSender<A>(for:)(v6, v3, v3, v5);
  }
}

uint64_t sub_10001FA90()
{
  *(void *)(*(void *)v1 + 432) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001FEC4;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_10001FD08;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001FBAC()
{
  TransportReply.send(error:file:line:column:function:)();
  swift_errorRelease();
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[18];
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
  sub_100024088(v4, (uint64_t (*)(void))&type metadata accessor for DaemonToShell.TwoWayMessage);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_100024828(v0[29], &qword_10003DAB8);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[49] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10001F3A8;
  uint64_t v6 = v0[30];
  uint64_t v7 = v0[31];
  return AsyncStream.Iterator.next(isolation:)(v6, 0, 0, v7);
}

uint64_t sub_10001FD08()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  sub_100007644(&qword_10003CF68, &qword_10003CF58);
  sub_10002263C(&qword_10003CF70, (void (*)(uint64_t))&type metadata accessor for DaemonToShell.TwoWayMessage);
  TransportSenderProtocol<>.send(message:reply:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[18];
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
  sub_100024088(v7, (uint64_t (*)(void))&type metadata accessor for DaemonToShell.TwoWayMessage);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  sub_100024828(v0[29], &qword_10003DAB8);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[49] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10001F3A8;
  uint64_t v9 = v0[30];
  uint64_t v10 = v0[31];
  return AsyncStream.Iterator.next(isolation:)(v9, 0, 0, v10);
}

uint64_t sub_10001FEC4()
{
  swift_release();
  TransportReply.send(error:file:line:column:function:)();
  swift_errorRelease();
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[18];
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
  sub_100024088(v4, (uint64_t (*)(void))&type metadata accessor for DaemonToShell.TwoWayMessage);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_100024828(v0[29], &qword_10003DAB8);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[49] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10001F3A8;
  uint64_t v6 = v0[30];
  uint64_t v7 = v0[31];
  return AsyncStream.Iterator.next(isolation:)(v6, 0, 0, v7);
}

uint64_t sub_100020028(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100020088()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000200C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100011618;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003DAF8 + dword_10003DAF8);
  return v6(a1, v4);
}

uint64_t sub_100020180(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100004C3C(&qword_10003DA90) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_100011618;
  return sub_10001BE54(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_100020298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = sub_100004C3C(&qword_10003D448);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  sub_100004C3C(&qword_10003DB28);
  v3[16] = swift_task_alloc();
  uint64_t v5 = sub_100004C3C(&qword_10003DB30);
  v3[17] = v5;
  v3[18] = *(void *)(v5 - 8);
  v3[19] = swift_task_alloc();
  type metadata accessor for ShellPreviewService();
  v3[20] = swift_task_alloc();
  uint64_t v6 = sub_100004C3C(&qword_10003DAD0);
  v3[21] = v6;
  v3[22] = *(void *)(v6 - 8);
  v3[23] = swift_task_alloc();
  uint64_t v7 = sub_100004C3C(&qword_10003DB38);
  v3[24] = v7;
  v3[25] = *(void *)(v7 - 8);
  v3[26] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v3[27] = v8;
  v3[28] = *(void *)(v8 - 8);
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  return _swift_task_switch(sub_100020548, 0, 0);
}

uint64_t sub_100020548()
{
  uint64_t v21 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v18 = v0[27];
    uint64_t v19 = v0[30];
    uint64_t v3 = v0[10];
    uint64_t v17 = v0[28];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[7] = sub_10001DDE4(0xD000000000000013, 0x8000000100032C80, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v4 + 12) = 2080;
    v0[8] = v3;
    sub_100004C3C(&qword_10003D990);
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v5 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[9] = sub_10001DDE4(v5, v6, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Creating %s service for connection: %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v7(v19, v18);
  }
  else
  {
    uint64_t v8 = v0[30];
    uint64_t v9 = v0[27];
    uint64_t v10 = v0[28];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v7(v8, v9);
  }
  v0[31] = v7;
  uint64_t v11 = v0[10];
  v0[2] = v11;
  type metadata accessor for PreviewServiceInterface();
  uint64_t v12 = sub_100004C3C(&qword_10003D990);
  v0[32] = v12;
  uint64_t v13 = sub_100007644(&qword_10003DAE0, &qword_10003D990);
  Transport.activate<A>(forReceivingMessages:)();
  v0[3] = v11;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[33] = v14;
  void *v14 = v0;
  v14[1] = sub_1000208B0;
  uint64_t v15 = v0[23];
  return Transport.transportSender<A>(for:)(v15, &type metadata for Never, v12, &type metadata for Never, v13, &protocol witness table for Never);
}

uint64_t sub_1000208B0()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_100020AD4;
  }
  else {
    os_log_type_t v2 = sub_1000209C4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000209C4()
{
  uint64_t v1 = v0[23];
  os_log_type_t v2 = (void (*)(uint64_t, uint64_t))v0[11];
  uint64_t v3 = DaemonConnection.invalidationHandle.getter();
  v2(v1, v3);
  swift_release();
  AsyncStream.makeAsyncIterator()();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[35] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100020DF8;
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  return AsyncStream.Iterator.next(isolation:)(v5, 0, 0, v6);
}

uint64_t sub_100020AD4()
{
  uint64_t v22 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v16 = v0[27];
    uint64_t v17 = v0[29];
    uint64_t v3 = v0[25];
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v20 = v0[26];
    uint64_t v18 = v0[24];
    uint64_t v4 = v0[10];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[4] = sub_10001DDE4(0xD000000000000013, 0x8000000100032C80, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    v0[5] = v4;
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[6] = sub_10001DDE4(v6, v7, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not activate %s service for connection: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    v19(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v20, v18);
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v9 = v0[29];
    uint64_t v11 = v0[26];
    uint64_t v10 = v0[27];
    uint64_t v12 = v0[24];
    uint64_t v13 = v0[25];
    swift_errorRelease();

    swift_release_n();
    v8(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100020DF8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100020EF4, 0, 0);
}

uint64_t sub_100020EF4()
{
  uint64_t v1 = v0[16];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[14] + 48))(v1, 1, v0[13]) == 1)
  {
    uint64_t v3 = v0[25];
    uint64_t v2 = v0[26];
    uint64_t v5 = v0[23];
    uint64_t v4 = v0[24];
    uint64_t v6 = v0[21];
    uint64_t v7 = v0[22];
    uint64_t v8 = v0[20];
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    sub_100024088(v8, (uint64_t (*)(void))type metadata accessor for ShellPreviewService);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    sub_1000240E8(v1, v0[15], &qword_10003D448);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[36] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_1000210DC;
    uint64_t v12 = v0[15];
    return sub_10000D6A8(v12);
  }
}

uint64_t sub_1000210DC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000211D8, 0, 0);
}

uint64_t sub_1000211D8()
{
  sub_100024828(v0[15], &qword_10003D448);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[35] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100020DF8;
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  return AsyncStream.Iterator.next(isolation:)(v2, 0, 0, v3);
}

uint64_t sub_10002128C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100011618;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003DB40 + dword_10003DB40);
  return v6(a1, v4);
}

uint64_t sub_10002134C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100004C3C(&qword_10003DA90) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_100011618;
  return sub_10001BF34(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_100021464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = sub_100004C3C(&qword_10003D330);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  sub_100004C3C(&qword_10003DB78);
  v3[16] = swift_task_alloc();
  uint64_t v5 = sub_100004C3C(&qword_10003DB80);
  v3[17] = v5;
  v3[18] = *(void *)(v5 - 8);
  v3[19] = swift_task_alloc();
  type metadata accessor for AppManagerDaemon();
  v3[20] = swift_task_alloc();
  uint64_t v6 = sub_100004C3C(&qword_10003DAD0);
  v3[21] = v6;
  v3[22] = *(void *)(v6 - 8);
  v3[23] = swift_task_alloc();
  uint64_t v7 = sub_100004C3C(&qword_10003DB88);
  v3[24] = v7;
  v3[25] = *(void *)(v7 - 8);
  v3[26] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v3[27] = v8;
  v3[28] = *(void *)(v8 - 8);
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  return _swift_task_switch(sub_100021714, 0, 0);
}

uint64_t sub_100021714()
{
  uint64_t v21 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v18 = v0[27];
    uint64_t v19 = v0[30];
    uint64_t v3 = v0[10];
    uint64_t v17 = v0[28];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[7] = sub_10001DDE4(0xD000000000000010, 0x8000000100032CA0, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v4 + 12) = 2080;
    v0[8] = v3;
    sub_100004C3C(&qword_10003D990);
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v5 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[9] = sub_10001DDE4(v5, v6, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Creating %s service for connection: %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v7(v19, v18);
  }
  else
  {
    uint64_t v8 = v0[30];
    uint64_t v9 = v0[27];
    uint64_t v10 = v0[28];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v7(v8, v9);
  }
  v0[31] = v7;
  uint64_t v11 = v0[10];
  v0[2] = v11;
  type metadata accessor for AppManagerInterface();
  uint64_t v12 = sub_100004C3C(&qword_10003D990);
  v0[32] = v12;
  uint64_t v13 = sub_100007644(&qword_10003DAE0, &qword_10003D990);
  Transport.activate<A>(forReceivingMessages:)();
  v0[3] = v11;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[33] = v14;
  void *v14 = v0;
  v14[1] = sub_100021A7C;
  uint64_t v15 = v0[23];
  return Transport.transportSender<A>(for:)(v15, &type metadata for Never, v12, &type metadata for Never, v13, &protocol witness table for Never);
}

uint64_t sub_100021A7C()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_100021CA0;
  }
  else {
    os_log_type_t v2 = sub_100021B90;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100021B90()
{
  uint64_t v1 = v0[23];
  os_log_type_t v2 = (void (*)(uint64_t, uint64_t))v0[11];
  uint64_t v3 = DaemonConnection.invalidationHandle.getter();
  v2(v1, v3);
  swift_release();
  AsyncStream.makeAsyncIterator()();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[35] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100021FC4;
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  return AsyncStream.Iterator.next(isolation:)(v5, 0, 0, v6);
}

uint64_t sub_100021CA0()
{
  uint64_t v22 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v16 = v0[27];
    uint64_t v17 = v0[29];
    uint64_t v3 = v0[25];
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v20 = v0[26];
    uint64_t v18 = v0[24];
    uint64_t v4 = v0[10];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[4] = sub_10001DDE4(0xD000000000000010, 0x8000000100032CA0, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    v0[5] = v4;
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[6] = sub_10001DDE4(v6, v7, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not activate %s service for connection: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    v19(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v20, v18);
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v9 = v0[29];
    uint64_t v11 = v0[26];
    uint64_t v10 = v0[27];
    uint64_t v12 = v0[24];
    uint64_t v13 = v0[25];
    swift_errorRelease();

    swift_release_n();
    v8(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100021FC4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000220C0, 0, 0);
}

uint64_t sub_1000220C0()
{
  uint64_t v1 = v0[16];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[14] + 48))(v1, 1, v0[13]) == 1)
  {
    uint64_t v3 = v0[25];
    uint64_t v2 = v0[26];
    uint64_t v5 = v0[23];
    uint64_t v4 = v0[24];
    uint64_t v6 = v0[21];
    uint64_t v7 = v0[22];
    uint64_t v8 = v0[20];
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    sub_100024088(v8, (uint64_t (*)(void))type metadata accessor for AppManagerDaemon);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    sub_1000240E8(v1, v0[15], &qword_10003D330);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[36] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_1000222A8;
    uint64_t v12 = v0[15];
    return sub_10000A4D4(v12);
  }
}

uint64_t sub_1000222A8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000223A4, 0, 0);
}

uint64_t sub_1000223A4()
{
  sub_100024828(v0[15], &qword_10003D330);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[35] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100021FC4;
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  return AsyncStream.Iterator.next(isolation:)(v2, 0, 0, v3);
}

uint64_t sub_10002245C(void *a1)
{
  return sub_100019D24(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_100039CF0, (uint64_t)&unk_10003DBC8);
}

uint64_t sub_100022498(uint64_t a1)
{
  return sub_1000227B8(a1, &qword_10003DB98, &qword_10003DBA0);
}

uint64_t sub_1000224C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = (void *)v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100011618;
  return sub_100019038(a1, v4, v5, v7, v6);
}

uint64_t sub_100022588(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100011618;
  return sub_100019E9C(a1, v4, v5, v6);
}

uint64_t sub_10002263C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100022688(void *a1)
{
  return sub_100019D24(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_100039D90, (uint64_t)&unk_10003DC18);
}

uint64_t sub_1000226C4()
{
  uint64_t v1 = type metadata accessor for CancellationToken();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100022790(uint64_t a1)
{
  return sub_1000227B8(a1, &qword_10003DBF0, &qword_10003DBF8);
}

uint64_t sub_1000227B8(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for CancellationToken() - 8);
  return sub_100018F18(a1, *(void *)(v3 + 16), v3 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, a3);
}

uint64_t sub_10002284C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = (void *)v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100011618;
  return sub_1000193B8(a1, v4, v5, v7, v6);
}

uint64_t sub_100022910()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100022950(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100009500;
  return sub_10001A4E8(a1, v4, v5, v6);
}

uint64_t sub_100022A08()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022A50(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = (void *)v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100009500;
  return sub_100016914(a1, v4, v5, v7, v6);
}

uint64_t sub_100022B14()
{
  uint64_t v1 = *(void *)(sub_100004C3C(&qword_10003DA90) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  uint64_t v5 = type metadata accessor for CancellationToken();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100022C54(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100004C3C(&qword_10003DA90) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_100011618;
  return sub_10001C254(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_100022D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[12] = a2;
  v3[13] = a3;
  v3[11] = a1;
  sub_100004C3C(&qword_10003D980);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  uint64_t v4 = sub_100004C3C(&qword_10003DC40);
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  sub_100004C3C(&qword_10003DC48);
  v3[19] = swift_task_alloc();
  uint64_t v5 = sub_100004C3C(&qword_10003DC50);
  v3[20] = v5;
  v3[21] = *(void *)(v5 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ProcessExitService();
  v3[23] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[24] = v7;
  v3[25] = *(void *)(v7 + 64);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  uint64_t v8 = sub_100004C3C(&qword_10003DC58);
  v3[28] = v8;
  v3[29] = *(void *)(v8 - 8);
  v3[30] = swift_task_alloc();
  uint64_t v9 = sub_100004C3C(&qword_10003DC60);
  v3[31] = v9;
  v3[32] = *(void *)(v9 - 8);
  v3[33] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Logger();
  v3[34] = v10;
  v3[35] = *(void *)(v10 - 8);
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  return _swift_task_switch(sub_1000230B0, 0, 0);
}

uint64_t sub_1000230B0()
{
  uint64_t v22 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v19 = v0[34];
    uint64_t v20 = v0[38];
    uint64_t v3 = v0[11];
    uint64_t v18 = v0[35];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[8] = sub_10001DDE4(0xD000000000000012, 0x8000000100032D20, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v4 + 12) = 2080;
    v0[9] = v3;
    sub_100004C3C(&qword_10003D990);
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v5 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[10] = sub_10001DDE4(v5, v6, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Creating %s service for connection: %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v7(v20, v19);
  }
  else
  {
    uint64_t v8 = v0[38];
    uint64_t v9 = v0[34];
    uint64_t v10 = v0[35];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v7(v8, v9);
  }
  v0[39] = v7;
  uint64_t v11 = v0[11];
  v0[6] = v11;
  type metadata accessor for HostToProcessExitService();
  uint64_t v12 = sub_100004C3C(&qword_10003D990);
  v0[40] = v12;
  uint64_t v13 = sub_100007644(&qword_10003DAE0, &qword_10003D990);
  Transport.activate<A>(forReceivingMessages:)();
  v0[2] = v11;
  uint64_t v14 = type metadata accessor for ProcessExitServiceToHost();
  uint64_t v15 = (void *)swift_task_alloc();
  v0[41] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_100023420;
  uint64_t v16 = v0[30];
  return Transport.transportSender<A>(for:)(v16, v14, v12, v14, v13, &protocol witness table for ProcessExitServiceToHost);
}

uint64_t sub_100023420()
{
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_100023648;
  }
  else {
    os_log_type_t v2 = sub_100023534;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100023534()
{
  uint64_t v1 = v0[30];
  os_log_type_t v2 = (void (*)(uint64_t, uint64_t))v0[12];
  uint64_t v3 = DaemonConnection.invalidationHandle.getter();
  v2(v1, v3);
  swift_release();
  AsyncStream.makeAsyncIterator()();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[43] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000239A4;
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[20];
  return AsyncStream.Iterator.next(isolation:)(v5, 0, 0, v6);
}

uint64_t sub_100023648()
{
  uint64_t v22 = v0;
  static Logger.uv.getter();
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v16 = v0[34];
    uint64_t v17 = v0[37];
    uint64_t v3 = v0[32];
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[39];
    uint64_t v20 = v0[33];
    uint64_t v18 = v0[31];
    uint64_t v4 = v0[11];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[3] = sub_10001DDE4(0xD000000000000012, 0x8000000100032D20, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    v0[4] = v4;
    sub_100007644(&qword_10003DAE8, &qword_10003D990);
    uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[5] = sub_10001DDE4(v6, v7, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not activate %s service for connection: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();

    v19(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v20, v18);
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[39];
    uint64_t v9 = v0[37];
    uint64_t v10 = v0[34];
    uint64_t v12 = v0[32];
    uint64_t v11 = v0[33];
    uint64_t v13 = v0[31];
    swift_errorRelease();

    swift_release_n();
    v8(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_1000239A4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100023AA0, 0, 0);
}

uint64_t sub_100023AA0()
{
  uint64_t v1 = *(void *)(v0 + 152);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v0 + 136) + 48))(v1, 1, *(void *)(v0 + 128)) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 256);
    uint64_t v2 = *(void *)(v0 + 264);
    uint64_t v5 = *(void *)(v0 + 240);
    uint64_t v4 = *(void *)(v0 + 248);
    uint64_t v6 = *(void *)(v0 + 224);
    uint64_t v7 = *(void *)(v0 + 232);
    uint64_t v8 = *(void *)(v0 + 216);
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
    sub_100024088(v8, (uint64_t (*)(void))type metadata accessor for ProcessExitService);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
  else
  {
    sub_1000240E8(v1, *(void *)(v0 + 144), &qword_10003DC40);
    TransportMessage<>.body.getter();
    sub_10002414C(v0 + 404, v0 + 368);
    static Logger.uv.getter();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 67240192;
      *(_DWORD *)(v13 + 4) = ProcessID.pid.getter();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "ProcessExitService received request to monitor %{public}d", (uint8_t *)v13, 8u);
      swift_slowDealloc();
    }
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v15 = *(void *)(v0 + 288);
    uint64_t v16 = *(void *)(v0 + 272);

    v14(v15, v16);
    int v17 = ProcessID.pid.getter();
    *(_DWORD *)(v0 + 440) = v17;
    if (qword_10003CD30 != -1) {
      swift_once();
    }
    uint64_t v19 = *(void *)(v0 + 208);
    uint64_t v18 = *(void *)(v0 + 216);
    uint64_t v21 = *(void *)(v0 + 192);
    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v22 = qword_10003DEB0;
    *(void *)(v0 + 352) = qword_10003DEB0;
    sub_1000241A8(v18, v19);
    unint64_t v23 = (*(unsigned __int8 *)(v21 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    unint64_t v24 = (v20 + v23 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v25 = swift_allocObject();
    *(void *)(v0 + 360) = v25;
    sub_10002430C(v19, v25 + v23);
    *(_DWORD *)(v25 + v24) = v17;
    return _swift_task_switch(sub_100023E14, v22, 0);
  }
}

uint64_t sub_100023E14()
{
  sub_100008528(*(unsigned int *)(v0 + 440), (uint64_t)sub_100024370, *(void *)(v0 + 360), *(void *)(v0 + 120));
  swift_release();
  return _swift_task_switch(sub_100023EA8, 0, 0);
}

uint64_t sub_100023EA8()
{
  uint64_t v1 = v0[14];
  sub_10000914C(v0[15], v1, &qword_10003D980);
  uint64_t v2 = sub_100004C3C(&qword_10003D1D0);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = v0[14];
    sub_100024828(v0[15], &qword_10003D980);
    sub_100024828(v4, &qword_10003D980);
  }
  else
  {
    v0[7] = *(void *)(v0[27] + *(int *)(v0[23] + 20));
    uint64_t v6 = v0[14];
    uint64_t v5 = v0[15];
    type metadata accessor for ConcurrentInvalidationHandle();
    swift_retain();
    CancelationToken<>.cancel<A>(onInvalidationOf:)();
    swift_release();
    sub_100024828(v5, &qword_10003D980);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  sub_100024828(v0[18], &qword_10003DC40);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[43] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000239A4;
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[20];
  return AsyncStream.Iterator.next(isolation:)(v8, 0, 0, v9);
}

uint64_t sub_100024088(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000240E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004C3C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002414C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000241A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProcessExitService();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002420C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ProcessExitService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_10002430C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProcessExitService();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024370()
{
  type metadata accessor for ProcessExitService();

  return sub_100026E90();
}

uint64_t sub_1000243FC()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024414(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100011618;
  return sub_100017774(a1, v5);
}

uint64_t sub_1000244EC()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024504(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100011618;
  return sub_100016F18(a1, v5);
}

uint64_t sub_1000245DC()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_1000245F4(uint64_t a1, uint64_t a2)
{
  return sub_10002466C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E7A8);
}

uint64_t sub_10002460C()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024624(uint64_t a1, uint64_t a2)
{
  return sub_10002466C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B878);
}

uint64_t sub_10002463C()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024654(uint64_t a1, uint64_t a2)
{
  return sub_10002466C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100011D18);
}

uint64_t sub_10002466C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return a3(a1, a2, v7);
}

uint64_t sub_100024708()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024720()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024738()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_100024750(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewsService.Variant() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100011618;
  return sub_1000077DC(a1, v5);
}

uint64_t sub_100024828(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004C3C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100024884()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for CancellationToken);
}

uint64_t sub_1000248A0()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for PreviewsService.Variant);
}

uint64_t sub_1000248B8()
{
  return sub_1000248D0((uint64_t (*)(void))&type metadata accessor for CancellationToken);
}

uint64_t sub_1000248D0(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100024968()
{
  type metadata accessor for CancellationToken();

  return sub_100007B3C();
}

uint64_t sub_1000249EC(void *a1)
{
  return sub_10002245C(a1);
}

uint64_t sub_100024A04(void *a1)
{
  return sub_100022688(a1);
}

void sub_100024A24(uint64_t a1)
{
  uint64_t v126 = type metadata accessor for TransportReply();
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  uint64_t v133 = (uint64_t)&v119 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004C3C(&qword_10003DCE0);
  __chkstk_darwin(v4 - 8);
  v139 = (void (*)(char *, uint64_t))((char *)&v119 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v131 = (void (*)(char *, uint64_t))((char *)&v119 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __chkstk_darwin(v8);
  v132 = (char *)&v119 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v134 = (char *)&v119 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v128 = (char *)&v119 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v119 - v17;
  __chkstk_darwin(v16);
  v136 = (char *)&v119 - v19;
  uint64_t v20 = type metadata accessor for Logger();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  v135 = (char *)&v119 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v137 = (char *)&v119 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v124 = (char *)&v119 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v119 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  v123 = (char *)&v119 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  v127 = (char *)&v119 - v34;
  __chkstk_darwin(v33);
  uint64_t v36 = (char *)&v119 - v35;
  uint64_t v144 = 0;
  unint64_t v145 = 0xE000000000000000;
  id v37 = [self sharedManager];
  if (!v37)
  {
    __break(1u);
LABEL_34:
    __break(1u);
  }
  uint64_t v38 = v37;
  v130 = v18;
  v122 = v30;
  uint64_t v121 = v1;
  uint64_t v141 = v20;
  id v39 = [v37 currentUser];

  if (!v39) {
    goto LABEL_34;
  }
  unsigned int v40 = [v39 uid];

  LODWORD(v143) = v40;
  v41._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v41);
  swift_bridgeObjectRelease();
  uint64_t v43 = v144;
  unint64_t v42 = v145;
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.default.getter();
  BOOL v46 = os_log_type_enabled(v44, v45);
  uint64_t v138 = a1;
  uint64_t v140 = v21;
  if (v46)
  {
    uint64_t v129 = v7;
    int v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v144 = swift_slowAlloc();
    *(_DWORD *)int v47 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v143 = sub_10001DDE4(v43, v42, &v144);
    uint64_t v7 = v129;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Performing prewarm for user %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v21 = v140;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  int v48 = *(void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v49 = v141;
  v48(v36, v141);
  uint64_t v50 = (uint64_t)v139;
  uint64_t v143 = 1;
  uint64_t v51 = container_system_group_path_for_identifier();
  if (!v51)
  {
    uint64_t v144 = 0;
    unint64_t v145 = 0xE000000000000000;
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease();
    uint64_t v144 = 0xD000000000000026;
    unint64_t v145 = 0x8000000100032D90;
    uint64_t error_description = container_get_error_description();
    sub_100004C3C(&qword_10003DCE8);
    v71._uint64_t countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v71);
    swift_bridgeObjectRelease();
    uint64_t v73 = v144;
    unint64_t v72 = v145;
    uint64_t v74 = v135;
    static Logger.uv.getter();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v75 = Logger.logObject.getter();
    os_log_type_t v76 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      v139 = v48;
      uint64_t v79 = (void *)v78;
      uint64_t v80 = swift_slowAlloc();
      v137 = (char *)v73;
      uint64_t v144 = v80;
      *(_DWORD *)uint64_t v77 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t error_description = sub_10001DDE4(v43, v42, &v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v77 + 12) = 2112;
      sub_10000BEE0();
      swift_allocError();
      *(unsigned char *)uint64_t v81 = 1;
      *(void *)(v81 + 8) = v137;
      *(void *)(v81 + 16) = v72;
      swift_bridgeObjectRetain();
      uint64_t v82 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t error_description = v82;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v79 = v82;
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "prewarm for %s failed: %@", (uint8_t *)v77, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      uint64_t v73 = (uint64_t)v137;
      swift_slowDealloc();
      swift_slowDealloc();

      v139(v135, v141);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v48(v74, v49);
    }
    sub_10000BEE0();
    swift_allocError();
    *(unsigned char *)uint64_t v93 = 1;
    *(void *)(v93 + 8) = v73;
    *(void *)(v93 + 16) = v72;
    TransportReply.send(error:file:line:column:function:)();
    swift_errorRelease();
    return;
  }
  uint64_t v52 = (char *)[objc_allocWithZone((Class)NSURL) initFileURLWithFileSystemRepresentation:v51 isDirectory:1 relativeToURL:0];
  NSString v53 = String._bridgeToObjectiveC()();
  id v54 = [v52 URLByAppendingPathComponent:v53 isDirectory:1];

  if (!v54)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v50, 1, 1, v6);
    goto LABEL_14;
  }
  uint64_t v55 = v48;
  uint64_t v56 = v43;
  uint64_t v57 = v130;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v58 = v57;
  uint64_t v43 = v56;
  int v48 = v55;
  uint64_t v59 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v59(v50, v58, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v50, 0, 1, v6);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v50, 1, v6) == 1)
  {
LABEL_14:
    sub_10002672C(v50);
    uint64_t v83 = (uint64_t)v137;
    static Logger.uv.getter();
    swift_bridgeObjectRetain();
    v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      v139 = v48;
      v88 = (void *)v87;
      uint64_t v89 = swift_slowAlloc();
      v135 = v52;
      uint64_t v144 = v89;
      *(_DWORD *)uint64_t v86 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t error_description = sub_10001DDE4(v43, v42, &v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v86 + 12) = 2112;
      sub_10000BEE0();
      swift_allocError();
      *(unsigned char *)uint64_t v90 = 1;
      *(void *)(v90 + 8) = 0xD000000000000032;
      *(void *)(v90 + 16) = 0x8000000100032E60;
      uint64_t v91 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t error_description = v91;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v88 = v91;
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "prewarm for %s failed: %@", (uint8_t *)v86, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      uint64_t v52 = v135;
      swift_slowDealloc();
      swift_slowDealloc();

      v139(v137, v141);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v48((char *)v83, v141);
    }
    sub_10000BEE0();
    swift_allocError();
    *(unsigned char *)uint64_t v92 = 1;
    *(void *)(v92 + 8) = 0xD000000000000032;
    *(void *)(v92 + 16) = 0x8000000100032E60;
    TransportReply.send(error:file:line:column:function:)();
    swift_errorRelease();

    return;
  }
  v137 = (char *)v43;
  v135 = v52;
  v130 = (char *)v42;
  uint64_t v60 = v7;
  uint64_t v61 = v136;
  v59((uint64_t)v136, (char *)v50, v6);
  uint64_t v62 = v127;
  static Logger.uv.getter();
  uint64_t v63 = v128;
  v120 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  v120(v128, v61, v6);
  uint64_t v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.info.getter();
  BOOL v66 = os_log_type_enabled(v64, v65);
  v139 = v48;
  uint64_t v129 = v60;
  if (v66)
  {
    v67 = (uint8_t *)swift_slowAlloc();
    uint64_t v144 = swift_slowAlloc();
    *(_DWORD *)v67 = 136315138;
    uint64_t v68 = URL.path.getter();
    uint64_t error_description = sub_10001DDE4(v68, v69, &v144);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v70 = *(void (**)(char *, uint64_t))(v60 + 8);
    v70(v128, v6);
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Got preview's system container at %s", v67, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v139(v127, v141);
  }
  else
  {
    v70 = *(void (**)(char *, uint64_t))(v60 + 8);
    v70(v63, v6);

    v48(v62, v141);
  }
  v94 = v134;
  v95 = v136;
  URL.appendingPathComponent(_:isDirectory:)();
  uint64_t v96 = v95;
  uint64_t v97 = (void (*)(void (*)(char *, uint64_t), char *, uint64_t))v120;
  v120(v132, v96, v6);
  uint64_t v98 = v6;
  v97(v131, v94, v6);
  uint64_t v99 = v138;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v125 + 16))(v133, v138, v126);
  URL.path.getter();
  uint64_t v100 = String.init(contentsOfFile:)();
  unint64_t v102 = v101;
  swift_bridgeObjectRelease();
  uint64_t v103 = v6;
  uint64_t v104 = v130;
  if (char *)v100 == v137 && (char *)v102 == v130 || (_stringCompareWithSmolCheck(_:_:expecting:)())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v133, v126);
    v70((char *)v131, v6);
    v70(v132, v6);
    v105 = v123;
    static Logger.uv.getter();
    uint64_t v106 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v106, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v108 = 0;
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "User is unchanged from last prewarm", v108, 2u);
      swift_slowDealloc();
    }

    v139(v105, v141);
    TransportReply.send(file:line:column:function:)();
  }
  else
  {
    static Logger.uv.getter();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v109 = Logger.logObject.getter();
    os_log_type_t v110 = static os_log_type_t.default.getter();
    int v111 = v110;
    if (os_log_type_enabled(v109, v110))
    {
      uint64_t v112 = swift_slowAlloc();
      LODWORD(v128) = v111;
      uint64_t v113 = v112;
      uint64_t v144 = swift_slowAlloc();
      *(_DWORD *)uint64_t v113 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t error_description = sub_10001DDE4(v100, v102, &v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v113 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v114 = (uint64_t)v137;
      uint64_t error_description = sub_10001DDE4((uint64_t)v137, (unint64_t)v104, &v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v109, (os_log_type_t)v128, "User has changed from %s to %s, so clearing out old apps", (uint8_t *)v113, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v103 = v98;
      v139(v122, v141);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v139(v122, v141);
      uint64_t v114 = (uint64_t)v137;
    }
    v115 = sub_10000B00C();
    sub_10002D7D0((uint64_t)v115, v99);
    swift_bridgeObjectRelease();
    v117 = v131;
    uint64_t v116 = (uint64_t)v132;
    uint64_t v118 = v133;
    sub_100025F58(v114, v104, (uint64_t)v132, v131, v133);
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v118, v126);
    v70((char *)v117, v103);
    v70((char *)v116, v103);
  }
  v70(v134, v103);
  v70(v136, v103);
}

uint64_t sub_100025F58(uint64_t a1, void *a2, uint64_t a3, void (*a4)(char *, uint64_t), uint64_t a5)
{
  NSString v53 = a4;
  uint64_t v54 = a5;
  uint64_t v8 = type metadata accessor for String.Encoding();
  uint64_t v52 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v51 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v56 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v49 - v14;
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v55 = (void *)a1;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v50 = v8;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = (void *)swift_slowAlloc();
    v49[1] = a3;
    v60[0] = v21;
    v49[0] = v11;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_10001DDE4(a1, (unint64_t)a2, (uint64_t *)v60);
    uint64_t v11 = v49[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Setting current user to %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v8 = v50;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v15, v10);
  id v23 = [self defaultManager];
  URL._bridgeToObjectiveC()(v24);
  uint64_t v26 = v25;
  v60[0] = 0;
  unsigned int v27 = [v23 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:v60];

  id v28 = v60[0];
  if (v27)
  {
    v60[0] = v55;
    v60[1] = a2;
    id v29 = v28;
    uint64_t v30 = v51;
    static String.Encoding.utf8.getter();
    sub_1000267D0();
    StringProtocol.write(to:atomically:encoding:)();
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v30, v8);
  }
  else
  {
    NSString v53 = v22;
    id v31 = v60[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v32 = (uint64_t)v55;
    uint64_t v33 = v56;
    static Logger.uv.getter();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v52 = v10;
      uint64_t v38 = (void *)v37;
      v60[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_10001DDE4(v32, (unint64_t)a2, (uint64_t *)v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2112;
      swift_errorRetain();
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v57 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v38 = v39;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "prewarm for %s failed: %@", (uint8_t *)v36, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unsigned int v40 = v56;
      uint64_t v41 = v52;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      unsigned int v40 = v33;
      uint64_t v41 = v10;
    }
    v53(v40, v41);
    LOBYTE(v57) = 1;
    unint64_t v58 = 0xD000000000000022;
    unint64_t v59 = 0x8000000100032EA0;
    swift_errorRetain();
    sub_10000C1A8();
    HumanReadableError.withUnderlying(_:)();
    swift_errorRelease();
    uint64_t v42 = v61;
    uint64_t v43 = sub_10002678C(v60, v61);
    uint64_t v44 = *(void *)(v42 - 8);
    __chkstk_darwin(v43);
    BOOL v46 = (char *)v49 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v44 + 16))(v46);
    if (_getErrorEmbeddedNSError<A>(_:)())
    {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v42);
    }
    else
    {
      swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v47, v46, v42);
    }
    TransportReply.send(error:file:line:column:function:)();
    swift_errorRelease();
    swift_errorRelease();
    return sub_1000098A0((uint64_t)v60);
  }
}

uint64_t sub_10002672C(uint64_t a1)
{
  uint64_t v2 = sub_100004C3C(&qword_10003DCE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10002678C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000267D0()
{
  unint64_t result = qword_10003DCF0;
  if (!qword_10003DCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DCF0);
  }
  return result;
}

uint64_t *sub_100026824(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100004C3C(&qword_10003DC58);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000268F4(uint64_t a1)
{
  uint64_t v2 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_10002696C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_1000269F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100026A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100026B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_100026B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026B9C);
}

uint64_t sub_100026B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004C3C(&qword_10003DC58);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100026C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100026C74);
}

uint64_t sub_100026C74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004C3C(&qword_10003DC58);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ProcessExitService()
{
  uint64_t result = qword_10003DD50;
  if (!qword_10003DD50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100026D80()
{
  sub_100026E18();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100026E18()
{
  if (!qword_10003DD60)
  {
    type metadata accessor for ProcessExitServiceToHost();
    unint64_t v0 = type metadata accessor for TransportSender();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10003DD60);
    }
  }
}

void *sub_100026E78()
{
  return &protocol witness table for HostToProcessExitService;
}

void *sub_100026E84()
{
  return &protocol witness table for ProcessExitServiceToHost;
}

uint64_t sub_100026E90()
{
  return TransportSenderProtocol<>.send(oneWay:)();
}

unint64_t sub_100026F04()
{
  unint64_t result = qword_10003DDC8;
  if (!qword_10003DDC8)
  {
    sub_100004CDC(&qword_10003DC58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DDC8);
  }
  return result;
}

unint64_t sub_100026F60()
{
  unint64_t result = qword_10003DDD0;
  if (!qword_10003DDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DDD0);
  }
  return result;
}

uint64_t sub_100026FB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100004C3C(&qword_10003DC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1, v6);
  *(void *)(a3 + *(int *)(type metadata accessor for ProcessExitService() + 20)) = a2;

  return swift_retain();
}

void sub_100027048(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t aBlock = 34;
  unint64_t v36 = 0xE100000000000000;
  v10._uint64_t countAndFlagsBits = URL.lastPathComponent.getter();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 34;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  uint64_t v13 = aBlock;
  unint64_t v12 = v36;
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v33 = v13;
  if (v16)
  {
    uint64_t v31 = a2;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = a1;
    BOOL v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    int v30 = a3;
    uint64_t aBlock = v19;
    uint64_t v29 = v6;
    *(_DWORD *)BOOL v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_10001DDE4(v13, v12, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Attempting installation of %s", v18, 0xCu);
    swift_arrayDestroy();
    LOBYTE(a3) = v30;
    swift_slowDealloc();
    a1 = v32;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v29);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v20 = [objc_allocWithZone((Class)MIInstallOptions) init];
  [v20 setInstallTargetType:1];
  [v20 setDeveloperInstall:a3 & 1];
  [v20 setUserInitiated:1];
  if (a3)
  {
    sub_10000B95C();
    static LSBundleRecord.playgroundsBundleID.getter();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v20 setLinkedParentBundleID:v21];
  }
  uint64_t v22 = self;
  URL._bridgeToObjectiveC()(v23);
  uint64_t v25 = v24;
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = v33;
  v26[3] = v12;
  v26[4] = a1;
  uint64_t v39 = sub_100029194;
  unsigned int v40 = v26;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  unint64_t v36 = 1107296256;
  uint64_t v37 = sub_100027A78;
  uint64_t v38 = &unk_10003A078;
  unsigned int v27 = _Block_copy(&aBlock);
  id v28 = v20;
  swift_retain();
  swift_release();
  [v22 installApplication:v25 forPersonaUniqueString:0 consumeSource:0 options:v28 completion:v27];
  _Block_release(v27);
}

uint64_t sub_10002743C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  BOOL v16 = (char *)&v39 - v15;
  if (a1)
  {
    id v17 = [a1 bundleID];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v20 = v19;

    static Logger.uv.getter();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    NSString v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v42 = a5;
      uint64_t v24 = v23;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v40 = v18;
      uint64_t v44 = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v41 = v11;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_10001DDE4(a3, a4, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_10001DDE4(v40, v20, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Installation of %s (%s) succeeded", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v10);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }
    return Promise<A>.succeed()();
  }
  else
  {
    uint64_t v41 = a3;
    if (!a2)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v40 = v10;
      sub_100004C3C(&qword_10003DDE0);
      uint64_t v27 = v11;
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100031120;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 40) = v29;
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 48) = 0xD000000000000015;
      *(void *)(inited + 56) = 0x8000000100032FF0;
      sub_1000083F0(inited);
      id v30 = objc_allocWithZone((Class)NSError);
      NSString v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      uint64_t v11 = v27;
      swift_bridgeObjectRelease();
      [v30 initWithDomain:v31 code:-98 userInfo:isa];

      uint64_t v10 = v40;
    }
    swift_errorRetain();
    static Logger.uv.getter();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      unint64_t v36 = (void *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v42 = a5;
      uint64_t v44 = v37;
      *(_DWORD *)uint64_t v35 = 136315394;
      uint64_t v40 = v10;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_10001DDE4(v41, a4, &v44);
      uint64_t v41 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2112;
      swift_errorRetain();
      uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v43 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v36 = v38;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Installation of %s failed due to: %@", (uint8_t *)v35, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v40);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }
    Promise.fail(with:)();
    return swift_errorRelease();
  }
}

void sub_100027A78(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100027B04(uint64_t a1)
{
  uint64_t v42 = a1;
  uint64_t v43 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v43 - 8);
  uint64_t v2 = __chkstk_darwin(v43);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v40 = (char *)&v40 - v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v40 - v7;
  uint64_t v9 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ResetAppRequest.agentDescriptorBundle.getter();
  uint64_t v13 = AgentDescriptor.Bundle.bundleID.getter();
  unint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  BOOL v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v41 = v1;
  if (v18)
  {
    unint64_t v19 = (uint8_t *)swift_slowAlloc();
    id v45 = (id)swift_slowAlloc();
    *(_DWORD *)unint64_t v19 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_10001DDE4(v13, v15, (uint64_t *)&v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Attempting reset of %s", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v43;
    uint64_t v21 = v41;
    swift_slowDealloc();
    swift_slowDealloc();

    os_log_type_t v22 = *(void (**)(char *, uint64_t))(v21 + 8);
    v22(v8, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    os_log_type_t v22 = *(void (**)(char *, uint64_t))(v1 + 8);
    v22(v8, v43);
  }
  uint64_t v23 = self;
  NSString v24 = String._bridgeToObjectiveC()();
  NSString v25 = String._bridgeToObjectiveC()();
  id v45 = 0;
  unsigned int v26 = [v23 refreshContainerTypes:1 forBundleID:v24 reason:v25 error:&v45];

  if (v26)
  {
    id v27 = v45;
    id v28 = v40;
    static Logger.uv.getter();
    swift_bridgeObjectRetain();
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      NSString v31 = (uint8_t *)swift_slowAlloc();
      id v45 = (id)swift_slowAlloc();
      *(_DWORD *)NSString v31 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_10001DDE4(v13, v15, (uint64_t *)&v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Reset of %s succeeded", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v32 = v40;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v32 = v28;
    }
    v22(v32, v43);
    return Promise<A>.succeed()();
  }
  else
  {
    uint64_t v40 = (char *)v22;
    id v33 = v45;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.uv.getter();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    os_log_type_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      id v45 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_10001DDE4(v13, v15, (uint64_t *)&v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2112;
      swift_errorRetain();
      uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v44 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v37 = v38;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Reset of %s failed due to: %@", (uint8_t *)v36, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    ((void (*)(char *, uint64_t))v40)(v4, v43);
    Promise.fail(with:)();
    return swift_errorRelease();
  }
}

uint64_t sub_100028248(uint64_t a1, void *a2)
{
  id v4 = [objc_allocWithZone((Class)IXUninstallOptions) init];
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 setRequestUserConfirmation:0];
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = a1;
    v6[3] = a2;
    v6[4] = v5;
    swift_bridgeObjectRetain();
    id v7 = v5;
    uint64_t v8 = FutureSerialQueue.enqueue<A>(priority:makeFuture:)();

    swift_release();
    return v8;
  }
  else
  {
    sub_100004C3C(&qword_10003DDD8);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    sub_100004C3C(&qword_10003DDE0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100031120;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v11;
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    v12._uint64_t countAndFlagsBits = a1;
    v12._object = a2;
    String.append(_:)(v12);
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD00000000000001BLL;
    *(void *)(inited + 56) = 0x8000000100032F60;
    sub_1000083F0(inited);
    id v13 = objc_allocWithZone((Class)NSError);
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v16 = [v13 initWithDomain:v14 code:-99 userInfo:isa];

    uint64_t v17 = static Future.failed(dsoHandle:file:line:column:function:_:)();
    return v17;
  }
}

void sub_1000284C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  Swift::String v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = v8;
    unint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v26 = a1;
    aBlock[0] = v16;
    uint64_t v25 = a4;
    *(_DWORD *)unint64_t v15 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_10001DDE4(a2, a3, aBlock);
    a4 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Attempting uninstall of %s", v15, 0xCu);
    swift_arrayDestroy();
    a1 = v26;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v17 = self;
  id v18 = objc_allocWithZone((Class)IXApplicationIdentity);
  swift_bridgeObjectRetain();
  uint64_t v19 = a2;
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [v18 initWithBundleID:v20];

  os_log_type_t v22 = (void *)swift_allocObject();
  void v22[2] = v19;
  v22[3] = a3;
  v22[4] = a1;
  aBlock[4] = (uint64_t)sub_1000290B4;
  aBlock[5] = (uint64_t)v22;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000290C0;
  aBlock[3] = (uint64_t)&unk_10003A028;
  uint64_t v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v17 uninstallAppWithIdentity:v21 options:a4 completion:v23];
  _Block_release(v23);
}

uint64_t sub_100028810()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100028850(uint64_t a1)
{
  sub_1000284C4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void sub_10002885C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v57 = a3;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  os_log_type_t v13 = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)v53 - v15;
  __chkstk_darwin(v14);
  id v18 = (char *)v53 - v17;
  if (a2)
  {
    swift_errorRetain();
    static Logger.uv.getter();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v55 = v10;
      uint64_t v23 = (void *)v22;
      uint64_t v54 = (char *)swift_slowAlloc();
      unint64_t v59 = v54;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v56 = v9;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_10001DDE4(v57, (unint64_t)a4, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 12) = 2112;
      swift_errorRetain();
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v58 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v23 = v24;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Uninstall of %s failed due to: %@", (uint8_t *)v21, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v55 + 8))(v18, v56);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    }
    Promise.fail(with:)();
    swift_errorRelease();
  }
  else if (a1 == 3)
  {
    static Logger.uv.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = v10;
      id v28 = (uint8_t *)swift_slowAlloc();
      unint64_t v59 = (char *)swift_slowAlloc();
      uint64_t v56 = v9;
      *(_DWORD *)id v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_10001DDE4(v57, (unint64_t)a4, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Uninstall of %s succeeded", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v56);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    }
    Promise<A>.succeed()();
  }
  else
  {
    uint64_t v55 = v10;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    sub_100004C3C(&qword_10003DDE0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100031120;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v30;
    unint64_t v59 = 0;
    unint64_t v60 = 0xE000000000000000;
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    unint64_t v59 = (char *)0xD000000000000014;
    unint64_t v60 = 0x8000000100032FA0;
    v31._uint64_t countAndFlagsBits = v57;
    v31._object = a4;
    String.append(_:)(v31);
    v32._uint64_t countAndFlagsBits = 0x3A6F742065756420;
    v32._object = (void *)0xE900000000000020;
    String.append(_:)(v32);
    id v33 = (id)IXStringForUninstallDisposition();
    v53[1] = a5;
    uint64_t v56 = v9;
    if (v33)
    {
      os_log_type_t v34 = v33;
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v37 = v36;
    }
    else
    {
      uint64_t v37 = (void *)0xE700000000000000;
      uint64_t v35 = 0x6E776F6E6B6E55;
    }
    v38._uint64_t countAndFlagsBits = v35;
    v38._object = v37;
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    uint64_t v39 = (uint64_t)v59;
    unint64_t v40 = v60;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v39;
    *(void *)(inited + 56) = v40;
    sub_1000083F0(inited);
    id v41 = objc_allocWithZone((Class)NSError);
    NSString v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v44 = [v41 initWithDomain:v42 code:-98 userInfo:isa];

    static Logger.uv.getter();
    swift_bridgeObjectRetain_n();
    id v45 = v44;
    BOOL v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v54 = (char *)&type metadata for Any + 8;
      uint64_t v50 = (void *)v49;
      v53[0] = swift_slowAlloc();
      unint64_t v59 = (char *)v53[0];
      *(_DWORD *)uint64_t v48 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_10001DDE4(v57, (unint64_t)a4, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v48 + 12) = 2112;
      uint64_t v58 = (uint64_t)v45;
      id v51 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v50 = v45;

      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Uninstall of %s failed due to: %@", (uint8_t *)v48, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v56);
    id v52 = v45;
    Promise.fail(with:)();
  }
}

void sub_1000290B4(uint64_t a1, uint64_t a2)
{
  sub_10002885C(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

void sub_1000290C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100029138(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100029148()
{
  return swift_release();
}

uint64_t sub_100029154()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100029194(void *a1, uint64_t a2)
{
  return sub_10002743C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

ValueMetadata *type metadata accessor for EmbeddedAppInstaller()
{
  return &type metadata for EmbeddedAppInstaller;
}

uint64_t sub_1000291B8(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 392) = a4;
  *(void *)(v5 + 400) = a5;
  *(unsigned char *)(v5 + 509) = a3;
  *(unsigned char *)(v5 + 508) = a2;
  uint64_t v6 = type metadata accessor for Logger();
  *(void *)(v5 + 408) = v6;
  *(void *)(v5 + 416) = *(void *)(v6 - 8);
  *(void *)(v5 + 424) = swift_task_alloc();
  *(void *)(v5 + 432) = swift_task_alloc();
  *(void *)(v5 + 440) = swift_task_alloc();
  *(void *)(v5 + 448) = swift_task_alloc();
  *(void *)(v5 + 456) = swift_task_alloc();
  return _swift_task_switch(sub_1000292B4, 0, 0);
}

uint64_t sub_1000292B4()
{
  uint64_t v80 = v0;
  unint64_t v1 = sub_10000806C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v2 = self;
  id v3 = [v2 standardUserDefaults];
  NSString v4 = String._bridgeToObjectiveC()();
  unsigned int v5 = [v3 BOOLForKey:v4];

  if (v5)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v79[0] = v1;
    sub_1000154D0(49, 0xE100000000000000, 0xD000000000000016, 0x80000001000330E0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  uint64_t v78 = (char *)(v0 + 508);
  id v7 = [v2 standardUserDefaults];
  NSString v8 = String._bridgeToObjectiveC()();
  unsigned int v9 = [v7 BOOLForKey:v8];

  if (v9)
  {
    static Logger.uv.getter();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Enable full PreviewShell MallocStackLogging", v12, 2u);
      swift_slowDealloc();
    }
    uint64_t v13 = *(void *)(v0 + 456);
    uint64_t v14 = *(void *)(v0 + 408);
    uint64_t v15 = *(void *)(v0 + 416);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    v79[0] = v1;
    uint64_t v17 = 49;
    uint64_t v18 = 0xE100000000000000;
  }
  else
  {
    id v19 = [v2 standardUserDefaults];
    NSString v20 = String._bridgeToObjectiveC()();
    unsigned int v21 = [v19 BOOLForKey:v20];

    if (!v21) {
      goto LABEL_12;
    }
    static Logger.uv.getter();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Enable lite PreviewShell MallocStackLogging", v24, 2u);
      swift_slowDealloc();
    }
    uint64_t v25 = *(void *)(v0 + 448);
    uint64_t v26 = *(void *)(v0 + 408);
    uint64_t v27 = *(void *)(v0 + 416);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    v79[0] = v1;
    uint64_t v17 = 1702127980;
    uint64_t v18 = 0xE400000000000000;
  }
  sub_1000154D0(v17, v18, 0xD000000000000012, 0x80000001000330C0, v16);
  unint64_t v1 = v79[0];
  swift_bridgeObjectRelease();
LABEL_12:
  if (*(unsigned char *)(v0 + 509) == 1)
  {
    static Logger.uv.getter();
    id v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Propagating XTP env value to PreviewShell", v30, 2u);
      swift_slowDealloc();
    }
    uint64_t v31 = *(void *)(v0 + 440);
    uint64_t v32 = *(void *)(v0 + 408);
    uint64_t v33 = *(void *)(v0 + 416);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
    uint64_t v34 = xtpProcessEnvironmentKey.getter();
    uint64_t v36 = v35;
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    v79[0] = v1;
    sub_1000154D0(1702195828, 0xE400000000000000, v34, v36, v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  char v38 = *v78;
  sub_100004C3C(&qword_10003DDF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100031170;
  *(void *)(v0 + 352) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 360) = v40;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 96) = &type metadata for Bool;
  *(unsigned char *)(inited + 72) = (v38 & 1) == 0;
  *(void *)(v0 + 320) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 328) = v41;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 168) = &type metadata for Bool;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(v0 + 336) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 344) = v42;
  AnyHashable.init<A>(_:)();
  sub_100004C3C(&qword_10003DDF8);
  uint64_t v43 = swift_initStackObject();
  *(_OWORD *)(v43 + 16) = xmmword_100031120;
  *(void *)(v43 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v43 + 40) = v44;
  *(void *)(v43 + 48) = v1;
  unint64_t v45 = sub_100008190(v43);
  *(void *)(inited + 240) = sub_100004C3C(&qword_10003DE00);
  *(void *)(inited + 216) = v45;
  sub_1000082AC(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v47 = [self optionsWithDictionary:isa];
  *(void *)(v0 + 464) = v47;

  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v48 = Logger.logObject.getter();
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  BOOL v50 = os_log_type_enabled(v48, v49);
  uint64_t v51 = *(void *)(v0 + 432);
  uint64_t v53 = *(void *)(v0 + 408);
  uint64_t v52 = *(void *)(v0 + 416);
  unint64_t v54 = *(void *)(v0 + 400);
  if (v50)
  {
    uint64_t v55 = *(void *)(v0 + 392);
    int v76 = *v78;
    id v77 = v47;
    uint64_t v56 = swift_slowAlloc();
    v79[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v56 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 376) = sub_10001DDE4(v55, v54, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v56 + 12) = 2080;
    if (v76) {
      uint64_t v57 = 0x756F726765726F66;
    }
    else {
      uint64_t v57 = 0x756F72676B636162;
    }
    *(void *)(v0 + 384) = sub_10001DDE4(v57, 0xEA0000000000646ELL, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Calling into FBSOpenApplicationService to launch %s in %s", (uint8_t *)v56, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v47 = v77;
    swift_slowDealloc();

    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v58(v51, v53);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v58(v51, v53);
  }
  id v59 = [self serviceWithDefaultShellEndpoint];
  *(void *)(v0 + 472) = v59;
  if (v59)
  {
    id v60 = v59;
    uint64_t v62 = *(void *)(v0 + 392);
    uint64_t v61 = *(void *)(v0 + 400);
    char v63 = *(unsigned char *)(v0 + 509);
    uint64_t v64 = swift_task_alloc();
    *(void *)(v0 + 480) = v64;
    *(void *)(v64 + 16) = v60;
    *(unsigned char *)(v64 + 24) = v63;
    *(void *)(v64 + 32) = v62;
    *(void *)(v64 + 40) = v61;
    *(void *)(v64 + 48) = v47;
    os_log_type_t v65 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v65;
    *os_log_type_t v65 = v0;
    v65[1] = sub_100029DB0;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 504, 0, 0, 0xD00000000000001BLL, 0x80000001000321D0, sub_10002A484, v64, &type metadata for Int32);
  }
  else
  {
    static Logger.uv.getter();
    BOOL v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      unint64_t v69 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v68 = 138412290;
      sub_10002A430();
      swift_allocError();
      id v70 = v47;
      uint64_t v71 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 368) = v71;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v69 = v71;
      id v47 = v70;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Unable to create open application service: %@", v68, 0xCu);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    uint64_t v72 = *(void *)(v0 + 424);
    uint64_t v73 = *(void *)(v0 + 408);

    v58(v72, v73);
    sub_10002A430();
    swift_allocError();
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v74 = *(uint64_t (**)(void))(v0 + 8);
    return v74();
  }
}

uint64_t sub_100029DB0()
{
  *(void *)(*(void *)v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100029F80;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_100029ECC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100029ECC()
{
  uint64_t v1 = *(void **)(v0 + 464);

  uint64_t v2 = *(unsigned int *)(v0 + 504);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100029F80()
{
  uint64_t v1 = *(void **)(v0 + 464);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_10002A034(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = sub_100004C3C(&qword_10003DE10);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  NSString v12 = String._bridgeToObjectiveC()();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v14 + v13, (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_10002A52C;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027A78;
  aBlock[3] = &unk_10003A110;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  [a2 openApplication:v12 withOptions:a6 completion:v15];
  _Block_release(v15);
}

void sub_10002A20C(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = a1;
    [v2 pid];
    sub_100004C3C(&qword_10003DE10);
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    if (!a2)
    {
      sub_10002A5C8();
      swift_allocError();
    }
    swift_errorRetain();
    sub_100004C3C(&qword_10003DE10);
    CheckedContinuation.resume(throwing:)();
  }
}

unint64_t sub_10002A2C4()
{
  return 0xD00000000000001ELL;
}

unint64_t sub_10002A2E0()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_10002A2FC()
{
  return 0xD000000000000057;
}

uint64_t sub_10002A318()
{
  return 0;
}

uint64_t sub_10002A320(uint64_t a1)
{
  unint64_t v2 = sub_10002A788();

  return HumanReadableError.errorDescription.getter(a1, v2);
}

uint64_t sub_10002A35C(uint64_t a1)
{
  unint64_t v2 = sub_10002A788();

  return HumanReadableError.description.getter(a1, v2);
}

uint64_t sub_10002A398()
{
  char v0 = byte_10003DED0;
  sub_100004C3C(&qword_10003DE20);
  uint64_t v1 = swift_allocObject();
  sub_100004C3C(&qword_10003DE28);
  uint64_t result = OSAllocatedUnfairLock.init(value:)();
  *(void *)(v1 + 16) = result;
  *(unsigned char *)(v1 + 24) = v0;
  *(void *)(v1 + 32) = 0xD000000000000016;
  *(void *)(v1 + 40) = 0x8000000100033130;
  qword_10003DEC8 = v1;
  return result;
}

unint64_t sub_10002A430()
{
  unint64_t result = qword_10003DE08;
  if (!qword_10003DE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DE08);
  }
  return result;
}

void sub_10002A484(uint64_t a1)
{
  sub_10002A034(a1, *(void **)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_10002A498()
{
  uint64_t v1 = sub_100004C3C(&qword_10003DE10);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10002A52C(void *a1, uint64_t a2)
{
  sub_100004C3C(&qword_10003DE10);

  sub_10002A20C(a1, a2);
}

uint64_t sub_10002A5B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002A5C0()
{
  return swift_release();
}

unint64_t sub_10002A5C8()
{
  unint64_t result = qword_10003DE18;
  if (!qword_10003DE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DE18);
  }
  return result;
}

ValueMetadata *type metadata accessor for FrontBoardLaunchImpl.UnknownLaunchError()
{
  return &type metadata for FrontBoardLaunchImpl.UnknownLaunchError;
}

ValueMetadata *type metadata accessor for FrontBoardLaunchImpl.NoServiceError()
{
  return &type metadata for FrontBoardLaunchImpl.NoServiceError;
}

uint64_t getEnumTagSinglePayload for FrontBoardLaunchImpl(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FrontBoardLaunchImpl(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FrontBoardLaunchImpl()
{
  return &type metadata for FrontBoardLaunchImpl;
}

unint64_t sub_10002A6DC()
{
  unint64_t result = qword_10003DE30;
  if (!qword_10003DE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DE30);
  }
  return result;
}

unint64_t sub_10002A734()
{
  unint64_t result = qword_10003DE38;
  if (!qword_10003DE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DE38);
  }
  return result;
}

unint64_t sub_10002A788()
{
  unint64_t result = qword_10003DE40;
  if (!qword_10003DE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003DE40);
  }
  return result;
}

uint64_t sub_10002A7DC(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for TransportReply();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = type metadata accessor for DaemonToShell.TwoWayMessage();
  v3[10] = swift_task_alloc();
  type metadata accessor for PreviewShellProxy();
  v3[11] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for CopyURLRequest();
  v3[12] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[13] = v6;
  v3[14] = *(void *)(v6 + 64);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v3[17] = v7;
  v3[18] = *(void *)(v7 - 8);
  v3[19] = swift_task_alloc();
  return _swift_task_switch(sub_10002A9CC, 0, 0);
}

uint64_t sub_10002A9CC()
{
  char v37 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  static Logger.uv.getter();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v35(v2, v1, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_t log = v5;
    uint64_t v32 = v0[18];
    uint64_t v7 = v0[16];
    uint64_t v33 = v0[17];
    uint64_t v34 = v0[19];
    uint64_t v8 = v0[15];
    uint64_t v10 = v0[12];
    uint64_t v9 = v0[13];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    v35(v8, v7, v10);
    uint64_t v12 = String.init<A>(describing:)();
    v0[2] = sub_10001DDE4(v12, v13, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v10);
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Forwarding %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  }
  else
  {
    uint64_t v15 = v0[18];
    uint64_t v14 = v0[19];
    uint64_t v16 = v0[17];
    (*(void (**)(void, void))(v0[13] + 8))(v0[16], v0[12]);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  uint64_t v17 = v0[15];
  uint64_t v19 = v0[12];
  uint64_t v18 = v0[13];
  uint64_t v21 = v0[10];
  uint64_t v20 = v0[11];
  uint64_t v22 = v0[5];
  uint64_t v23 = v0[3];
  uint64_t v24 = type metadata accessor for AppManagerDaemon();
  sub_10002B9EC(v22 + *(int *)(v24 + 20), v20);
  v35(v21, v23, v19);
  swift_storeEnumTagMultiPayload();
  v35(v17, v23, v19);
  unint64_t v25 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v26 + v25, v17, v19);
  TransportReply.wrappingError(_:)();
  swift_release();
  uint64_t v27 = (void *)swift_task_alloc();
  v0[20] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_10002AD58;
  uint64_t v28 = v0[10];
  uint64_t v29 = v0[8];
  return sub_10000587C(v28, v29);
}

uint64_t sub_10002AD58()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v2 = *(void *)(*v0 + 80);
  uint64_t v3 = *(void *)(*v0 + 64);
  uint64_t v4 = *(void *)(*v0 + 56);
  uint64_t v5 = *(void *)(*v0 + 48);
  uint64_t v8 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_10002BA88(v2, (uint64_t (*)(void))&type metadata accessor for DaemonToShell.TwoWayMessage);
  sub_10002BA88(v1, (uint64_t (*)(void))type metadata accessor for PreviewShellProxy);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_10002AF84(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for TransportReply();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = type metadata accessor for DaemonToShell.TwoWayMessage();
  v3[10] = swift_task_alloc();
  type metadata accessor for PreviewShellProxy();
  v3[11] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for GrantExecutePermissionRequest();
  v3[12] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[13] = v6;
  v3[14] = *(void *)(v6 + 64);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v3[17] = v7;
  v3[18] = *(void *)(v7 - 8);
  v3[19] = swift_task_alloc();
  return _swift_task_switch(sub_10002B174, 0, 0);
}

uint64_t sub_10002B174()
{
  char v37 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  static Logger.uv.getter();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v35(v2, v1, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_t log = v5;
    uint64_t v32 = v0[18];
    uint64_t v7 = v0[16];
    uint64_t v33 = v0[17];
    uint64_t v34 = v0[19];
    uint64_t v8 = v0[15];
    uint64_t v10 = v0[12];
    uint64_t v9 = v0[13];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    v35(v8, v7, v10);
    uint64_t v12 = String.init<A>(describing:)();
    v0[2] = sub_10001DDE4(v12, v13, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v10);
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Forwarding %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  }
  else
  {
    uint64_t v15 = v0[18];
    uint64_t v14 = v0[19];
    uint64_t v16 = v0[17];
    (*(void (**)(void, void))(v0[13] + 8))(v0[16], v0[12]);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  uint64_t v17 = v0[15];
  uint64_t v19 = v0[12];
  uint64_t v18 = v0[13];
  uint64_t v21 = v0[10];
  uint64_t v20 = v0[11];
  uint64_t v22 = v0[5];
  uint64_t v23 = v0[3];
  uint64_t v24 = type metadata accessor for AppManagerDaemon();
  sub_10002B9EC(v22 + *(int *)(v24 + 20), v20);
  v35(v21, v23, v19);
  swift_storeEnumTagMultiPayload();
  v35(v17, v23, v19);
  unint64_t v25 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v26 + v25, v17, v19);
  TransportReply.wrappingError(_:)();
  swift_release();
  uint64_t v27 = (void *)swift_task_alloc();
  v0[20] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_10002BC38;
  uint64_t v28 = v0[10];
  uint64_t v29 = v0[8];
  return sub_10000587C(v28, v29);
}

uint64_t sub_10002B500(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), int a4)
{
  LODWORD(v4) = a4;
  uint64_t v6 = a3(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v37 = *(void *)(v13 - 8);
  uint64_t v38 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(v12, a2, v6);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  int v36 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    int v35 = v4;
    uint64_t v4 = v19;
    uint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v42[0] = v34;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v32 = v4 + 4;
    v16(v10, (uint64_t)v12, v6);
    uint64_t v20 = String.init<A>(describing:)();
    uint64_t v39 = sub_10001DDE4(v20, v21, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v39 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v33 = v22;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v36, "%s failed: %@", (uint8_t *)v4, 0x16u);
    sub_100004C3C(&qword_10003CF90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    LOBYTE(v4) = v35;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v38);
  LOBYTE(v39) = v4;
  sub_10000C1A8();
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  HumanReadableError.withUnderlying(_:)();
  uint64_t v23 = v43;
  uint64_t v24 = sub_10002678C(v42, v43);
  uint64_t v25 = *(void *)(v23 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v32 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v25 + 16))(v27);
  uint64_t v28 = _getErrorEmbeddedNSError<A>(_:)();
  if (v28)
  {
    uint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v23);
  }
  else
  {
    uint64_t v29 = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v30, v27, v23);
  }
  sub_1000098A0((uint64_t)v42);
  return v29;
}

uint64_t sub_10002B9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewShellProxy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002BA50()
{
  return sub_10002BB00((uint64_t (*)(void))&type metadata accessor for CopyURLRequest);
}

uint64_t sub_10002BA68(uint64_t a1)
{
  return sub_10002BBB8(a1, (uint64_t (*)(void))&type metadata accessor for CopyURLRequest, (uint64_t (*)(void))&type metadata accessor for CopyURLRequest, 4);
}

uint64_t sub_10002BA88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002BAE8()
{
  return sub_10002BB00((uint64_t (*)(void))&type metadata accessor for GrantExecutePermissionRequest);
}

uint64_t sub_10002BB00(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10002BB98(uint64_t a1)
{
  return sub_10002BBB8(a1, (uint64_t (*)(void))&type metadata accessor for GrantExecutePermissionRequest, (uint64_t (*)(void))&type metadata accessor for GrantExecutePermissionRequest, 5);
}

uint64_t sub_10002BBB8(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), int a4)
{
  uint64_t v8 = *(void *)(a2(0) - 8);
  return sub_10002B500(a1, v4 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), a3, a4);
}

uint64_t sub_10002BC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v85 = a2;
  uint64_t v3 = type metadata accessor for TransportReply();
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  __chkstk_darwin(v3);
  uint64_t v73 = v4;
  uint64_t v74 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SecurityScopedURLWrapper();
  uint64_t v78 = *(NSObject **)(v5 - 8);
  uint64_t v79 = (void *)v5;
  __chkstk_darwin(v5);
  id v77 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for URL();
  uint64_t v89 = *(void *)(v86 - 8);
  uint64_t v7 = __chkstk_darwin(v86);
  uint64_t v82 = v8;
  uint64_t v83 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v90 = (char *)&v66 - v9;
  uint64_t v10 = type metadata accessor for InstallAppRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v80 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v66 - v15;
  __chkstk_darwin(v14);
  os_log_type_t v18 = (char *)&v66 - v17;
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v87 = *(void *)(v19 - 8);
  v88 = (void (*)(uint64_t, char *, uint64_t))v19;
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v84 = (uint64_t)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v66 - v22;
  static Logger.uv.getter();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v25 = a1;
  v24(v18, a1, v10);
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v81 = v11;
  unint64_t v69 = v16;
  uint64_t v71 = v11 + 16;
  id v70 = v24;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v68 = v25;
    uint64_t v30 = (uint8_t *)v29;
    uint64_t v67 = swift_slowAlloc();
    v92[0] = v67;
    *(_DWORD *)uint64_t v30 = 136315138;
    BOOL v66 = v30 + 4;
    v24(v16, (uint64_t)v18, v10);
    uint64_t v31 = String.init<A>(describing:)();
    uint64_t v91 = sub_10001DDE4(v31, v32, v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void (**)(char *, uint64_t))(v81 + 8);
    v33(v18, v10);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Received %s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v25 = v68;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
    v33(v18, v10);
  }

  uint64_t v34 = *(void (**)(char *, void (*)(uint64_t, char *, uint64_t)))(v87 + 8);
  v34(v23, v88);
  int v35 = v77;
  InstallAppRequest.sourceURLWrapper.getter();
  SecurityScopedURLWrapper.url.getter();
  ((void (*)(char *, void *))v78[1].isa)(v35, v79);
  Swift::Bool v36 = URL.startAccessingSecurityScopedResource()();
  uint64_t v37 = v80;
  if (v36)
  {
    sub_10002678C(v72, v72[3]);
    LODWORD(v84) = InstallAppRequest.isDevelopment.getter();
    uint64_t v39 = v89;
    uint64_t v38 = v90;
    uint64_t v87 = *(void *)(v89 + 16);
    uint64_t v40 = v83;
    uint64_t v41 = v86;
    ((void (*)(char *, char *, uint64_t))v87)(v83, v90, v86);
    uint64_t v42 = *(unsigned __int8 *)(v39 + 80);
    uint64_t v43 = v39;
    uint64_t v44 = (v42 + 16) & ~v42;
    uint64_t v45 = v44 + v82;
    uint64_t v81 = v42 | 7;
    uint64_t v46 = swift_allocObject();
    v88 = *(void (**)(uint64_t, char *, uint64_t))(v43 + 32);
    v88(v46 + v44, v40, v41);
    *(unsigned char *)(v46 + v45) = v84 & 1;
    uint64_t v84 = FutureSerialQueue.enqueue<A>(priority:makeFuture:)();
    swift_release();
    uint64_t v48 = v74;
    uint64_t v47 = v75;
    uint64_t v49 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v85, v76);
    BOOL v50 = v40;
    uint64_t v51 = v41;
    ((void (*)(char *, char *, uint64_t))v87)(v50, v38, v41);
    unint64_t v52 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    unint64_t v53 = (v73 + v42 + v52) & ~v42;
    uint64_t v54 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v47 + 32))(v54 + v52, v48, v49);
    v88(v54 + v53, v83, v51);
    Future.observeFinish(_:)();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v90, v51);
  }
  else
  {
    uint64_t v83 = (char *)v33;
    static Logger.uv.getter();
    uint64_t v56 = (void (*)(char *, char *, uint64_t))v70;
    v70(v37, v25, v10);
    uint64_t v57 = Logger.logObject.getter();
    os_log_type_t v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = swift_slowAlloc();
      uint64_t v79 = (void *)swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      v92[0] = v82;
      *(_DWORD *)uint64_t v59 = 136315394;
      uint64_t v78 = v57;
      v56(v69, v37, v10);
      uint64_t v60 = String.init<A>(describing:)();
      uint64_t v91 = sub_10001DDE4(v60, v61, v92);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v83)(v37, v10);
      *(_WORD *)(v59 + 12) = 2112;
      sub_10000BEE0();
      swift_allocError();
      *(unsigned char *)uint64_t v62 = 2;
      *(void *)(v62 + 8) = 0xD000000000000023;
      *(void *)(v62 + 16) = 0x8000000100033330;
      uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v91 = v63;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v64 = v78;
      *uint64_t v79 = v63;
      _os_log_impl((void *)&_mh_execute_header, v64, v58, "%s failed: %@", (uint8_t *)v59, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      ((void (*)(char *, uint64_t))v83)(v37, v10);
    }
    v34((char *)v84, v88);
    sub_10000BEE0();
    swift_allocError();
    *(unsigned char *)uint64_t v65 = 2;
    *(void *)(v65 + 8) = 0xD000000000000023;
    *(void *)(v65 + 16) = 0x8000000100033330;
    TransportReply.send(error:file:line:column:function:)();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v86);
    return swift_errorRelease();
  }
}

uint64_t sub_10002C67C(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = a2;
  uint64_t v3 = type metadata accessor for UninstallAppsRequest();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v56 = (char *)v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v51 - v7;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v54 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v60 = (char *)v51 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v55 = (char *)v51 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v51 - v16;
  static Logger.uv.getter();
  os_log_type_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v57 = a1;
  v18(v8, a1, v3);
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v59 = v9;
  if (v21)
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v63 = v53;
    *(_DWORD *)uint64_t v22 = 136315138;
    v51[1] = v22 + 4;
    unint64_t v52 = v22;
    v18(v56, (uint64_t)v8, v3);
    uint64_t v23 = String.init<A>(describing:)();
    uint64_t v62 = sub_10001DDE4(v23, v24, &v63);
    uint64_t v9 = v59;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Received %s", v52, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  }

  uint64_t v25 = *(void (**)(char *, uint64_t))(v61 + 8);
  v25(v17, v9);
  uint64_t v26 = v60;
  uint64_t v27 = UninstallAppsRequest.bundleIDs.getter();
  if (v27)
  {
    BOOL v28 = (void *)v27;
    if (UninstallAppsRequest.arePrefixes.getter())
    {
      uint64_t v29 = v55;
      static Logger.uv.getter();
      swift_bridgeObjectRetain_n();
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v30, v31))
      {
        unint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        *(_DWORD *)unint64_t v32 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v33 = Array.description.getter();
        unint64_t v35 = v34;
        swift_bridgeObjectRelease();
        uint64_t v62 = sub_10001DDE4(v33, v35, &v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Attempting uninstall of applications matching specified prefixes: %s", v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        Swift::Bool v36 = v55;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        Swift::Bool v36 = v29;
      }
      v25(v36, v59);
      uint64_t v49 = sub_10000B00C();
      uint64_t v41 = sub_10002F08C((uint64_t)v49, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      static Logger.uv.getter();
      swift_bridgeObjectRetain_n();
      uint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v45 = Array.description.getter();
        unint64_t v47 = v46;
        swift_bridgeObjectRelease();
        uint64_t v62 = sub_10001DDE4(v45, v47, &v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Attempting uninstall of specified applications: %s", v44, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v48 = v60;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v48 = v26;
      }
      v25(v48, v59);
      uint64_t v41 = (uint64_t)v28;
    }
  }
  else
  {
    uint64_t v37 = v54;
    static Logger.uv.getter();
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Attempting uninstall of all development applications", v40, 2u);
      swift_slowDealloc();
    }

    v25(v37, v9);
    uint64_t v41 = (uint64_t)sub_10000B00C();
  }
  sub_10002D7D0(v41, v58);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002CDE8(void (*a1)(char *, uint64_t), uint64_t a2)
{
  uint64_t v85 = a2;
  uint64_t v3 = type metadata accessor for TransportReply();
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  __chkstk_darwin(v3);
  uint64_t v73 = v4;
  uint64_t v74 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AgentDescriptor.Bundle();
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v80 = v5;
  __chkstk_darwin(v5);
  uint64_t v78 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ResetAppRequest();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v72 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v68 - v12;
  uint64_t v71 = v14;
  __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v68 - v15;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v87 = *(void *)(v17 - 8);
  uint64_t v88 = v17;
  uint64_t v18 = __chkstk_darwin(v17);
  id v77 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  BOOL v21 = (char *)&v68 - v20;
  static Logger.uv.getter();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v89 = a1;
  v22(v16, (char *)a1, v7);
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v86 = v8;
  uint64_t v84 = v13;
  uint64_t v81 = v22;
  uint64_t v82 = v8 + 16;
  if (v25)
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    uint64_t v91 = v69;
    *(_DWORD *)uint64_t v26 = 136315138;
    id v70 = (void (*)(char *, uint64_t))(v26 + 4);
    v22(v13, v16, v7);
    uint64_t v27 = String.init<A>(describing:)();
    uint64_t v90 = sub_10001DDE4(v27, v28, &v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v29 = v7;
    swift_bridgeObjectRelease();
    id v70 = *(void (**)(char *, uint64_t))(v86 + 8);
    v70(v16, v7);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Received %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v30 = *(void (**)(char *, uint64_t))(v87 + 8);
    v30(v21, v88);
  }
  else
  {
    id v70 = *(void (**)(char *, uint64_t))(v8 + 8);
    v70(v16, v7);

    uint64_t v30 = *(void (**)(char *, uint64_t))(v87 + 8);
    v30(v21, v88);
    uint64_t v29 = v7;
  }
  os_log_type_t v31 = v78;
  ResetAppRequest.agentDescriptorBundle.getter();
  uint64_t v32 = AgentDescriptor.Bundle.bundleID.getter();
  uint64_t v34 = v33;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v31, v80);
  unint64_t v35 = (void *)v83;
  Swift::Bool v36 = sub_10000B00C();
  char v37 = sub_10002DCF0(v32, v34, v36);
  swift_bridgeObjectRelease();
  if (v37)
  {
    swift_bridgeObjectRelease();
    sub_10002678C(v35, v35[3]);
    uint64_t v38 = v84;
    v81(v84, (char *)v89, v29);
    uint64_t v39 = v86;
    uint64_t v40 = v29;
    unint64_t v41 = (*(unsigned __int8 *)(v86 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
    uint64_t v42 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v39 + 32))(v42 + v41, v38, v40);
    FutureSerialQueue.enqueue<A>(priority:makeFuture:)();
    swift_release();
    Future.ignoringValue(dsoHandle:file:line:column:function:)();
    swift_release();
    uint64_t v44 = v74;
    uint64_t v43 = v75;
    uint64_t v45 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v85, v76);
    unint64_t v46 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v47 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v47 + v46, v44, v45);
    Future.observeFinish(_:)();
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t v91 = 0;
    unint64_t v92 = 0xE000000000000000;
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease();
    uint64_t v91 = v32;
    unint64_t v92 = v34;
    v49._object = (void *)0x8000000100033390;
    v49._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
    String.append(_:)(v49);
    unint64_t v50 = v92;
    uint64_t v83 = v91;
    uint64_t v51 = v77;
    static Logger.uv.getter();
    unint64_t v52 = v72;
    uint64_t v53 = v81;
    v81(v72, (char *)v89, v29);
    swift_bridgeObjectRetain_n();
    uint64_t v54 = Logger.logObject.getter();
    os_log_type_t v55 = static os_log_type_t.error.getter();
    BOOL v56 = os_log_type_enabled(v54, v55);
    uint64_t v57 = v84;
    if (v56)
    {
      uint64_t v58 = swift_slowAlloc();
      uint64_t v89 = v30;
      uint64_t v59 = v53;
      uint64_t v60 = v58;
      uint64_t v79 = swift_slowAlloc();
      uint64_t v80 = swift_slowAlloc();
      uint64_t v91 = v80;
      *(_DWORD *)uint64_t v60 = 136315394;
      v59(v57, v52, v29);
      uint64_t v61 = String.init<A>(describing:)();
      uint64_t v90 = sub_10001DDE4(v61, v62, &v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v70(v52, v29);
      *(_WORD *)(v60 + 12) = 2112;
      sub_10000BEE0();
      swift_allocError();
      *(unsigned char *)uint64_t v63 = 6;
      uint64_t v64 = v83;
      *(void *)(v63 + 8) = v83;
      *(void *)(v63 + 16) = v50;
      swift_bridgeObjectRetain();
      uint64_t v65 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v90 = v65;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(void *)uint64_t v79 = v65;
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "%s failed: %@", (uint8_t *)v60, 0x16u);
      sub_100004C3C(&qword_10003CF90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v89(v77, v88);
      uint64_t v66 = v64;
    }
    else
    {
      v70(v52, v29);

      swift_bridgeObjectRelease_n();
      v30(v51, v88);
      uint64_t v66 = v83;
    }
    sub_10000BEE0();
    swift_allocError();
    *(unsigned char *)uint64_t v67 = 6;
    *(void *)(v67 + 8) = v66;
    *(void *)(v67 + 16) = v50;
    TransportReply.send(error:file:line:column:function:)();
    return swift_errorRelease();
  }
}

uint64_t sub_10002D7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for TransportReply();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = sub_10000B00C();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v15 = v8;
  uint64_t v16 = sub_10002E2B4;
  uint64_t v17 = v9;
  uint64_t v18 = v2;
  swift_retain();
  uint64_t v10 = sub_10002E3FC((void (*)(uint64_t *__return_ptr, void *))sub_10002E3DC, (uint64_t)v14, a1);
  swift_bridgeObjectRelease();
  uint64_t v19 = v10;
  sub_100004C3C(&qword_10003DE58);
  sub_100007644(&qword_10003DE60, &qword_10003DE58);
  Sequence.invert<A>(dsoHandle:file:line:column:function:andAccumulateErrors:)();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(&v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], a2, v5);
  unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  *((void *)v12 + 2) = sub_10002E2B4;
  *((void *)v12 + 3) = v9;
  *((void *)v12 + 4) = v9;
  (*(void (**)(char *, unsigned char *, uint64_t))(v6 + 32))(&v12[v11], &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
  swift_retain_n();
  Future.observeFinish(_:)();
  swift_release_n();
  swift_release();
  return swift_release();
}

uint64_t sub_10002DA5C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002DA94()
{
  sub_100004C3C(&qword_10003DE98);
  FutureTermination.result.getter();
  if (v13 == 1)
  {
    uint64_t v0 = v12;
    v7[0] = 2;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    swift_errorRetain();
    sub_10000C1A8();
    HumanReadableError.withUnderlying(_:)();
    sub_10002F080(v12, 1);
    uint64_t v1 = v11;
    uint64_t v2 = sub_10002678C(v10, v11);
    uint64_t v3 = *(void *)(v1 - 8);
    __chkstk_darwin(v2);
    uint64_t v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v3 + 16))(v5);
    if (_getErrorEmbeddedNSError<A>(_:)())
    {
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v1);
    }
    else
    {
      swift_allocError();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v3 + 32))(v6, v5, v1);
    }
    TransportReply.send(error:file:line:column:function:)();
    sub_10002F080(v0, 1);
    swift_errorRelease();
    sub_1000098A0((uint64_t)v10);
  }
  else
  {
    TransportReply.send(file:line:column:function:)();
  }
  URL.stopAccessingSecurityScopedResource()();
}

uint64_t sub_10002DCF0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002DDB8()
{
  sub_100004C3C(&qword_10003DE98);
  FutureTermination.result.getter();
  if (v14 != 1) {
    return TransportReply.send(file:line:column:function:)();
  }
  uint64_t v0 = v13;
  v8[0] = 6;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  swift_errorRetain();
  sub_10000C1A8();
  HumanReadableError.withUnderlying(_:)();
  sub_10002F080(v13, 1);
  uint64_t v1 = v12;
  uint64_t v2 = sub_10002678C(v11, v12);
  uint64_t v3 = *(void *)(v1 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v3 + 16))(v5);
  if (_getErrorEmbeddedNSError<A>(_:)())
  {
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v1);
  }
  else
  {
    swift_allocError();
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v3 + 32))(v7, v5, v1);
  }
  TransportReply.send(error:file:line:column:function:)();
  sub_10002F080(v0, 1);
  swift_errorRelease();
  return sub_1000098A0((uint64_t)v11);
}

uint64_t sub_10002E000(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char **)(a3 + 16);
  swift_beginAccess();
  uint64_t v11 = *(char **)(a3 + 16);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a3 + 16) = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v11 = sub_10002E9A4(0, *((void *)v11 + 2) + 1, 1, v11);
    *uint64_t v10 = v11;
  }
  unint64_t v14 = *((void *)v11 + 2);
  unint64_t v13 = *((void *)v11 + 3);
  if (v14 >= v13 >> 1)
  {
    uint64_t v11 = sub_10002E9A4((char *)(v13 > 1), v14 + 1, 1, v11);
    *uint64_t v10 = v11;
  }
  *((void *)v11 + 2) = v14 + 1;
  uint64_t v15 = &v11[16 * v14];
  *((void *)v15 + 4) = a1;
  *((void *)v15 + 5) = a2;
  swift_endAccess();
  static Logger.uv.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    v23[0] = swift_slowAlloc();
    uint64_t v21 = v6;
    *(_DWORD *)uint64_t v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_10001DDE4(a1, a2, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_10002E2B4(uint64_t a1, unint64_t a2)
{
  return sub_10002E000(a1, a2, v2);
}

uint64_t sub_10002E2BC@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void (*a3)(void, unint64_t)@<X2>, void *a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v8 = *a1;
  uint64_t v9 = (void *)a1[1];
  if (sub_10002DCF0(*a1, (uint64_t)v9, a2))
  {
    sub_10002678C(a4, a4[3]);
    uint64_t result = sub_100028248(v8, v9);
  }
  else
  {
    _StringGuts.grow(_:)(70);
    v11._object = (void *)0x8000000100032FA0;
    v11._uint64_t countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v11);
    v12._uint64_t countAndFlagsBits = v8;
    v12._object = v9;
    String.append(_:)(v12);
    v13._uint64_t countAndFlagsBits = 0xD000000000000030;
    v13._object = (void *)0x80000001000332B0;
    String.append(_:)(v13);
    a3(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    uint64_t result = 0;
  }
  *a5 = result;
  return result;
}

uint64_t sub_10002E3DC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10002E2BC(a1, *(void **)(v2 + 16), *(void (**)(void, unint64_t))(v2 + 24), *(void **)(v2 + 40), a2);
}

void *sub_10002E3FC(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v12 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t *)(a3 + 40);
    do
    {
      uint64_t v9 = *v8;
      v11[0] = *(v8 - 1);
      v11[1] = v9;
      swift_bridgeObjectRetain();
      a1(&v10, v11);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (void *)swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      if (v10)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v8 += 2;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    return (void *)v12;
  }
  return result;
}

uint64_t sub_10002E53C(uint64_t a1, void (*a2)(uint64_t, unint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (uint64_t *)(a4 + 16);
  sub_100004C3C(&qword_10003DE68);
  FutureTermination.result.getter();
  uint64_t v6 = v22;
  if (v23)
  {
    uint64_t v18 = v22;
    swift_errorRetain();
    sub_100004C3C(&qword_10003DBB8);
    sub_100004C3C(&qword_10003DE70);
    if (swift_dynamicCast())
    {
      sub_10002E98C(v16, (uint64_t)&v19);
      sub_10002678C(&v19, v21);
      uint64_t v7 = dispatch thunk of HumanReadableError.fullDiagnosticsOutput.getter();
      unint64_t v9 = v8;
      sub_1000098A0((uint64_t)&v19);
    }
    else
    {
      uint64_t v17 = 0;
      memset(v16, 0, sizeof(v16));
      sub_10002E920((uint64_t)v16);
      uint64_t v19 = 0;
      unint64_t v20 = 0xE000000000000000;
      *(void *)&v16[0] = v6;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v7 = v19;
      unint64_t v9 = v20;
    }
    a2(v7, v9);
    sub_10002E980(v6, 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10002E980(v22, 0);
  }
  swift_beginAccess();
  uint64_t v10 = *v5;
  if (!*(void *)(v10 + 16)) {
    return TransportReply.send(file:line:column:function:)();
  }
  *(void *)&v16[0] = v10;
  swift_bridgeObjectRetain();
  sub_100004C3C(&qword_10003DE80);
  sub_100007644(&qword_10003DE88, &qword_10003DE80);
  uint64_t v11 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  sub_10000BEE0();
  swift_allocError();
  *(unsigned char *)uint64_t v14 = 3;
  *(void *)(v14 + 8) = v11;
  *(void *)(v14 + 16) = v13;
  TransportReply.send(error:file:line:column:function:)();
  return swift_errorRelease();
}

uint64_t sub_10002E7D4()
{
  uint64_t v1 = type metadata accessor for TransportReply();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002E8A8(uint64_t a1)
{
  type metadata accessor for TransportReply();
  uint64_t v3 = (void (*)(uint64_t, unint64_t))v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];

  return sub_10002E53C(a1, v3, v4, v5);
}

uint64_t sub_10002E920(uint64_t a1)
{
  uint64_t v2 = sub_100004C3C(&qword_10003DE78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002E980(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10002E98C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

char *sub_10002E9A4(char *result, int64_t a2, char a3, char *a4)
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
      sub_100004C3C(&qword_10003DE90);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_10002EC40(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002EAB4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002EAD4(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_10002EAD4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004C3C(&qword_10003DE90);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002EC40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002ED34()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

void sub_10002EDC8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  int v5 = *(unsigned __int8 *)(v1 + v4 + *(void *)(v3 + 64));

  sub_100027048(a1, v1 + v4, v5);
}

uint64_t sub_10002EE5C()
{
  uint64_t v1 = type metadata accessor for TransportReply();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

void sub_10002EFAC()
{
  type metadata accessor for TransportReply();
  type metadata accessor for URL();

  sub_10002DA94();
}

uint64_t sub_10002F080(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_10002F08C(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v4 = 0;
    uint64_t v5 = result + 40;
    uint64_t v6 = -(uint64_t)v2;
    uint64_t v7 = &_swiftEmptyArrayStorage;
    unint64_t v21 = *(void *)(result + 16);
    uint64_t v20 = result + 40;
    while (1)
    {
      uint64_t v22 = v7;
      uint64_t v8 = v4 <= v2 ? v2 : v4;
      uint64_t v9 = -v8;
      for (uint64_t i = (uint64_t *)(v5 + 16 * v4++); ; i += 2)
      {
        if (v9 + v4 == 1)
        {
          __break(1u);
          return result;
        }
        if (a2[2]) {
          break;
        }
LABEL_7:
        ++v4;
        if (v6 + v4 == 1) {
          return (uint64_t)v22;
        }
      }
      uint64_t v12 = *(i - 1);
      uint64_t v11 = *i;
      uint64_t v13 = a2[4];
      uint64_t v14 = (void *)a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15._uint64_t countAndFlagsBits = v13;
      v15._object = v14;
      Swift::Bool v16 = String.hasPrefix(_:)(v15);
      swift_bridgeObjectRelease();
      if (!v16) {
        break;
      }
      uint64_t v7 = v22;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = sub_10002EAB4(0, v22[2] + 1, 1);
        uint64_t v7 = v22;
      }
      unint64_t v2 = v21;
      uint64_t v5 = v20;
      unint64_t v18 = v7[2];
      unint64_t v17 = v7[3];
      if (v18 >= v17 >> 1)
      {
        uint64_t result = sub_10002EAB4(v17 > 1, v18 + 1, 1);
        uint64_t v5 = v20;
        unint64_t v2 = v21;
        uint64_t v7 = v22;
      }
      void v7[2] = v18 + 1;
      uint64_t v19 = (char *)&v7[2 * v18];
      *((void *)v19 + 4) = v12;
      *((void *)v19 + 5) = v11;
      if (!(v6 + v4)) {
        return (uint64_t)v7;
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  return (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10002F228()
{
  return sub_10002F2C8((uint64_t (*)(void))&type metadata accessor for ResetAppRequest);
}

uint64_t sub_10002F240(uint64_t a1)
{
  type metadata accessor for ResetAppRequest();

  return sub_100027B04(a1);
}

uint64_t sub_10002F2B0()
{
  return sub_10002F2C8((uint64_t (*)(void))&type metadata accessor for TransportReply);
}

uint64_t sub_10002F2C8(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10002F360()
{
  type metadata accessor for TransportReply();

  return sub_10002DDB8();
}

void sub_10002F3D0(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

Swift::Void __swiftcall URL.stopAccessingSecurityScopedResource()()
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return URL.startAccessingSecurityScopedResource()();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.copyBytes(to:count:)()
{
  return Data.copyBytes(to:count:)();
}

uint64_t static PreviewsServiceConnection.Listener.local(service:)()
{
  return static PreviewsServiceConnection.Listener.local(service:)();
}

uint64_t PreviewsServiceConnection.Listener.activate(handler:)()
{
  return PreviewsServiceConnection.Listener.activate(handler:)();
}

uint64_t static PreviewsServiceConnection.Listener.hostToSim(machServiceName:description:)()
{
  return static PreviewsServiceConnection.Listener.hostToSim(machServiceName:description:)();
}

uint64_t type metadata accessor for PreviewsServiceConnection.Listener()
{
  return type metadata accessor for PreviewsServiceConnection.Listener();
}

uint64_t PreviewsServiceConnection.remotePid.getter()
{
  return PreviewsServiceConnection.remotePid.getter();
}

uint64_t type metadata accessor for PreviewsServiceConnection()
{
  return type metadata accessor for PreviewsServiceConnection();
}

uint64_t type metadata accessor for PreviewsService.Variant()
{
  return type metadata accessor for PreviewsService.Variant();
}

uint64_t type metadata accessor for PreviewsService()
{
  return type metadata accessor for PreviewsService();
}

uint64_t type metadata accessor for ShellService.Instance()
{
  return type metadata accessor for ShellService.Instance();
}

uint64_t type metadata accessor for ShellService()
{
  return type metadata accessor for ShellService();
}

uint64_t type metadata accessor for DaemonToShell.TwoWayMessage()
{
  return type metadata accessor for DaemonToShell.TwoWayMessage();
}

uint64_t type metadata accessor for DaemonToShell()
{
  return type metadata accessor for DaemonToShell();
}

Swift::Void __swiftcall ShellConnection.activate()()
{
}

uint64_t static ShellConnection<>.createByMachLookup(for:variant:clientContext:)()
{
  return static ShellConnection<>.createByMachLookup(for:variant:clientContext:)();
}

uint64_t TransactionManager.takeTransaction(for:)()
{
  return TransactionManager.takeTransaction(for:)();
}

uint64_t TransactionManager.currentState.getter()
{
  return TransactionManager.currentState.getter();
}

uint64_t static TransactionManager.shared.getter()
{
  return static TransactionManager.shared.getter();
}

uint64_t type metadata accessor for TransactionManager()
{
  return type metadata accessor for TransactionManager();
}

uint64_t PreviewAssertionManager.takeActivePreviewAssertion(for:)()
{
  return PreviewAssertionManager.takeActivePreviewAssertion(for:)();
}

uint64_t static PreviewAssertionManager.shared.getter()
{
  return static PreviewAssertionManager.shared.getter();
}

uint64_t type metadata accessor for PreviewAssertionManager()
{
  return type metadata accessor for PreviewAssertionManager();
}

uint64_t MessagePipe.__allocating_init(makeRightTransport:)()
{
  return MessagePipe.__allocating_init(makeRightTransport:)();
}

uint64_t type metadata accessor for PreviewType.HostLocation()
{
  return type metadata accessor for PreviewType.HostLocation();
}

uint64_t type metadata accessor for PreviewType()
{
  return type metadata accessor for PreviewType();
}

uint64_t type metadata accessor for CopyURLRequest()
{
  return type metadata accessor for CopyURLRequest();
}

uint64_t ServiceMessage.messageType.getter()
{
  return ServiceMessage.messageType.getter();
}

uint64_t type metadata accessor for ServiceMessage.Content()
{
  return type metadata accessor for ServiceMessage.Content();
}

uint64_t ServiceMessage.content.getter()
{
  return ServiceMessage.content.getter();
}

uint64_t ServiceMessage.payload.getter()
{
  return ServiceMessage.payload.getter();
}

uint64_t type metadata accessor for ServiceMessage()
{
  return type metadata accessor for ServiceMessage();
}

uint64_t TransportReply.wrappingError(_:)()
{
  return TransportReply.wrappingError(_:)();
}

uint64_t TransportReply.send(file:line:column:function:)()
{
  return TransportReply.send(file:line:column:function:)();
}

uint64_t TransportReply.send(error:file:line:column:function:)()
{
  return TransportReply.send(error:file:line:column:function:)();
}

uint64_t type metadata accessor for TransportReply()
{
  return type metadata accessor for TransportReply();
}

uint64_t AgentDescriptor.Bundle.bundleID.getter()
{
  return AgentDescriptor.Bundle.bundleID.getter();
}

uint64_t type metadata accessor for AgentDescriptor.Bundle()
{
  return type metadata accessor for AgentDescriptor.Bundle();
}

uint64_t ResetAppRequest.agentDescriptorBundle.getter()
{
  return ResetAppRequest.agentDescriptorBundle.getter();
}

uint64_t type metadata accessor for ResetAppRequest()
{
  return type metadata accessor for ResetAppRequest();
}

uint64_t type metadata accessor for TransportSender()
{
  return type metadata accessor for TransportSender();
}

uint64_t dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)()
{
  return dispatch thunk of DaemonConnection.__allocating_init(connection:role:serviceDescription:)();
}

uint64_t DaemonConnection.invalidationHandle.getter()
{
  return DaemonConnection.invalidationHandle.getter();
}

uint64_t type metadata accessor for NextCrashRequest()
{
  return type metadata accessor for NextCrashRequest();
}

uint64_t TransportMessage<>.body.getter()
{
  return TransportMessage<>.body.getter();
}

{
  return TransportMessage<>.body.getter();
}

uint64_t TransportMessage<>.reply.getter()
{
  return TransportMessage<>.reply.getter();
}

uint64_t InstallAppRequest.isDevelopment.getter()
{
  return InstallAppRequest.isDevelopment.getter();
}

uint64_t InstallAppRequest.sourceURLWrapper.getter()
{
  return InstallAppRequest.sourceURLWrapper.getter();
}

uint64_t type metadata accessor for InstallAppRequest()
{
  return type metadata accessor for InstallAppRequest();
}

uint64_t ShellUpdatePayload.previewType.getter()
{
  return ShellUpdatePayload.previewType.getter();
}

uint64_t type metadata accessor for ShellUpdatePayload()
{
  return type metadata accessor for ShellUpdatePayload();
}

uint64_t type metadata accessor for AppManagerInterface.TwoWayMessage()
{
  return type metadata accessor for AppManagerInterface.TwoWayMessage();
}

uint64_t type metadata accessor for AppManagerInterface()
{
  return type metadata accessor for AppManagerInterface();
}

uint64_t CapabilitiesPayload.isRunningInXTP.getter()
{
  return CapabilitiesPayload.isRunningInXTP.getter();
}

uint64_t type metadata accessor for CapabilitiesPayload()
{
  return type metadata accessor for CapabilitiesPayload();
}

uint64_t UninstallAppsRequest.arePrefixes.getter()
{
  return UninstallAppsRequest.arePrefixes.getter();
}

uint64_t UninstallAppsRequest.bundleIDs.getter()
{
  return UninstallAppsRequest.bundleIDs.getter();
}

uint64_t type metadata accessor for UninstallAppsRequest()
{
  return type metadata accessor for UninstallAppsRequest();
}

uint64_t type metadata accessor for CrashListenerInterface.TwoWayMessage()
{
  return type metadata accessor for CrashListenerInterface.TwoWayMessage();
}

uint64_t type metadata accessor for CrashListenerInterface()
{
  return type metadata accessor for CrashListenerInterface();
}

uint64_t type metadata accessor for PreviewServiceInterface()
{
  return type metadata accessor for PreviewServiceInterface();
}

uint64_t TransportSenderProtocol<>.send(oneWay:)()
{
  return TransportSenderProtocol<>.send(oneWay:)();
}

uint64_t TransportSenderProtocol<>.send(message:reply:)()
{
  return TransportSenderProtocol<>.send(message:reply:)();
}

uint64_t type metadata accessor for HostToProcessExitService()
{
  return type metadata accessor for HostToProcessExitService();
}

uint64_t type metadata accessor for ProcessExitServiceToHost()
{
  return type metadata accessor for ProcessExitServiceToHost();
}

uint64_t SecurityScopedURLWrapper.url.getter()
{
  return SecurityScopedURLWrapper.url.getter();
}

uint64_t type metadata accessor for SecurityScopedURLWrapper()
{
  return type metadata accessor for SecurityScopedURLWrapper();
}

uint64_t type metadata accessor for GrantExecutePermissionRequest()
{
  return type metadata accessor for GrantExecutePermissionRequest();
}

uint64_t ProcessID.pid.getter()
{
  return ProcessID.pid.getter();
}

uint64_t Transport.activate<A>(forReceivingMessages:)()
{
  return Transport.activate<A>(forReceivingMessages:)();
}

uint64_t Identifier.init()()
{
  return Identifier.init()();
}

uint64_t type metadata accessor for Identifier()
{
  return type metadata accessor for Identifier();
}

uint64_t PropertyList.confidentlyMerge(_:)()
{
  return PropertyList.confidentlyMerge(_:)();
}

uint64_t PropertyList.serializableDictionary.getter()
{
  return PropertyList.serializableDictionary.getter();
}

uint64_t static PropertyList.empty.getter()
{
  return static PropertyList.empty.getter();
}

uint64_t PropertyList.init<A, B>(content:)()
{
  return PropertyList.init<A, B>(content:)();
}

uint64_t PropertyList.init()()
{
  return PropertyList.init()();
}

uint64_t type metadata accessor for PropertyList()
{
  return type metadata accessor for PropertyList();
}

uint64_t static TimeoutError.timedOut(waitingFor:)()
{
  return static TimeoutError.timedOut(waitingFor:)();
}

uint64_t type metadata accessor for TimeoutError()
{
  return type metadata accessor for TimeoutError();
}

uint64_t static ExecutionLane.any.getter()
{
  return static ExecutionLane.any.getter();
}

uint64_t type metadata accessor for ExecutionLane()
{
  return type metadata accessor for ExecutionLane();
}

uint64_t AnyInvalidatable.invalidate(file:line:column:function:trace:)()
{
  return AnyInvalidatable.invalidate(file:line:column:function:trace:)();
}

uint64_t CancelationToken<>.cancel<A>(onInvalidationOf:)()
{
  return CancelationToken<>.cancel<A>(onInvalidationOf:)();
}

uint64_t CancelationToken<>.init(dsoHandle:file:line:column:function:_:)()
{
  return CancelationToken<>.init(dsoHandle:file:line:column:function:_:)();
}

uint64_t CancellationToken.cancel(dsoHandle:file:line:column:function:)()
{
  return CancellationToken.cancel(dsoHandle:file:line:column:function:)();
}

uint64_t type metadata accessor for CancellationToken()
{
  return type metadata accessor for CancellationToken();
}

uint64_t FutureSerialQueue.init(on:)()
{
  return FutureSerialQueue.init(on:)();
}

uint64_t FutureSerialQueue.enqueue<A>(priority:makeFuture:)()
{
  return FutureSerialQueue.enqueue<A>(priority:makeFuture:)();
}

uint64_t type metadata accessor for FutureSerialQueue()
{
  return type metadata accessor for FutureSerialQueue();
}

uint64_t FutureTermination.result.getter()
{
  return FutureTermination.result.getter();
}

uint64_t static InvalidationTrace.empty.getter()
{
  return static InvalidationTrace.empty.getter();
}

uint64_t type metadata accessor for InvalidationTrace()
{
  return type metadata accessor for InvalidationTrace();
}

uint64_t assertUnreachable(file:line:column:function:)()
{
  return assertUnreachable(file:line:column:function:)();
}

uint64_t ConcurrentOnDemand.init(create:)()
{
  return ConcurrentOnDemand.init(create:)();
}

uint64_t type metadata accessor for ConcurrentOnDemand()
{
  return type metadata accessor for ConcurrentOnDemand();
}

uint64_t dispatch thunk of HumanReadableError.fullDiagnosticsOutput.getter()
{
  return dispatch thunk of HumanReadableError.fullDiagnosticsOutput.getter();
}

uint64_t HumanReadableError.isNativeHumanReadable.getter()
{
  return HumanReadableError.isNativeHumanReadable.getter();
}

uint64_t HumanReadableError.canTryAgain.getter()
{
  return HumanReadableError.canTryAgain.getter();
}

uint64_t HumanReadableError.lowValueTitle.getter()
{
  return HumanReadableError.lowValueTitle.getter();
}

uint64_t HumanReadableError.highValueTitle.getter()
{
  return HumanReadableError.highValueTitle.getter();
}

uint64_t HumanReadableError.withUnderlying(_:)()
{
  return HumanReadableError.withUnderlying(_:)();
}

uint64_t HumanReadableError.collectDiagnostics(into:)()
{
  return HumanReadableError.collectDiagnostics(into:)();
}

uint64_t HumanReadableError.plistRepresentation.getter()
{
  return HumanReadableError.plistRepresentation.getter();
}

uint64_t HumanReadableError.errorTypeDescription.getter()
{
  return HumanReadableError.errorTypeDescription.getter();
}

uint64_t HumanReadableError.fullDiagnosticsOutput.getter()
{
  return HumanReadableError.fullDiagnosticsOutput.getter();
}

uint64_t HumanReadableError.options.getter()
{
  return HumanReadableError.options.getter();
}

uint64_t HumanReadableError.severity.getter()
{
  return HumanReadableError.severity.getter();
}

uint64_t ConcurrentInvalidatable.onInvalidation(_:)()
{
  return ConcurrentInvalidatable.onInvalidation(_:)();
}

uint64_t xtpProcessEnvironmentKey.getter()
{
  return xtpProcessEnvironmentKey.getter();
}

uint64_t PropertyListRepresentable.init(propertyList:)()
{
  return PropertyListRepresentable.init(propertyList:)();
}

uint64_t SynchronousAccessProviding.syncRead<A>(file:line:column:function:_:)()
{
  return SynchronousAccessProviding.syncRead<A>(file:line:column:function:_:)();
}

uint64_t SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)()
{
  return SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)();
}

uint64_t type metadata accessor for ConcurrentInvalidationHandle()
{
  return type metadata accessor for ConcurrentInvalidationHandle();
}

uint64_t Future.ignoringValue(dsoHandle:file:line:column:function:)()
{
  return Future.ignoringValue(dsoHandle:file:line:column:function:)();
}

uint64_t Future.observeFinish(_:)()
{
  return Future.observeFinish(_:)();
}

uint64_t static Future.create(dsoHandle:file:line:column:function:)()
{
  return static Future.create(dsoHandle:file:line:column:function:)();
}

uint64_t static Future.failed(dsoHandle:file:line:column:function:_:)()
{
  return static Future.failed(dsoHandle:file:line:column:function:_:)();
}

uint64_t Promise.fail(with:)()
{
  return Promise.fail(with:)();
}

uint64_t Promise.succeed(with:)()
{
  return Promise.succeed(with:)();
}

uint64_t Promise<A>.succeed()()
{
  return Promise<A>.succeed()();
}

uint64_t static Timeout.seconds(_:)()
{
  return static Timeout.seconds(_:)();
}

uint64_t type metadata accessor for Timeout()
{
  return type metadata accessor for Timeout();
}

uint64_t OSAllocatedUnfairLock.init(value:)()
{
  return OSAllocatedUnfairLock.init(value:)();
}

uint64_t static Logger.uv.getter()
{
  return static Logger.uv.getter();
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

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init(contentsOfFile:)()
{
  return String.init(contentsOfFile:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
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

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t Sequence.invert<A>(dsoHandle:file:line:column:function:andAccumulateErrors:)()
{
  return Sequence.invert<A>(dsoHandle:file:line:column:function:andAccumulateErrors:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static LSBundleRecord.playgroundsBundleID.getter()
{
  return static LSBundleRecord.playgroundsBundleID.getter();
}

uint64_t static LSBundleRecord.playgroundsManagementDomain.getter()
{
  return static LSBundleRecord.playgroundsManagementDomain.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
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

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
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

uint64_t IXStringForUninstallDisposition()
{
  return _IXStringForUninstallDisposition();
}

uint64_t UVLog()
{
  return _UVLog();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

uint64_t container_get_error_description()
{
  return _container_get_error_description();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

void dispatch_main(void)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}