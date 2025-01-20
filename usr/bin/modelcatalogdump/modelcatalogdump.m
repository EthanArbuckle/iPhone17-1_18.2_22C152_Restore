uint64_t sub_100003E48()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_100004B3C(&qword_100014078);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10000E948();
  sub_100004B80(v3, qword_100014270);
  sub_100004B04(v3, (uint64_t)qword_100014270);
  v4 = sub_10000E8B8();
  sub_100004BE4((uint64_t)v2, 1, 1, v4);
  return sub_10000E938();
}

uint64_t sub_100003F60()
{
  if (qword_100014028 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000E948();

  return sub_100004B04(v0, (uint64_t)qword_100014270);
}

uint64_t sub_100003FC4()
{
  sub_100004C84();
  *(void *)(v0 + 16) = type metadata accessor for Status();
  *(void *)(v0 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100004050, 0, 0);
}

uint64_t sub_100004050()
{
  sub_100004A58();
  sub_10000E8E8();
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_100004154;
  return sub_100004C90();
}

uint64_t sub_100004154()
{
  sub_100004C84();
  sub_100004C5C();
  uint64_t v2 = *v1;
  sub_100004C74();
  *uint64_t v3 = v2;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    v5 = sub_1000042A4;
  }
  else {
    v5 = sub_100004238;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100004238()
{
  sub_100004C84();
  sub_100004AA8(*(void *)(v0 + 24));
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000042A4()
{
  sub_100004C84();
  sub_100004AA8(*(void *)(v0 + 24));
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000430C(uint64_t a1)
{
  return sub_100004C0C(a1);
}

uint64_t sub_100004334()
{
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000043C0;
  return sub_100003FC4();
}

uint64_t sub_1000043C0()
{
  sub_100004C84();
  sub_100004C5C();
  uint64_t v1 = *v0;
  sub_100004C74();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_100004484@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100003F60();
  uint64_t v3 = sub_10000E948();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

void sub_1000044F8()
{
}

void sub_100004514()
{
}

uint64_t sub_100004530(uint64_t a1)
{
  return sub_10000430C(a1);
}

uint64_t sub_100004548()
{
  v0[2] = sub_10000EA88();
  v0[3] = sub_10000EA78();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  sub_10000490C();
  void *v1 = v0;
  v1[1] = sub_100004608;
  return static AsyncParsableCommand.main()();
}

uint64_t sub_100004608()
{
  sub_100004C84();
  sub_100004C5C();
  uint64_t v1 = *v0;
  sub_100004C74();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_10000EA68();
  return _swift_task_switch(sub_100004714, v4, v3);
}

void sub_100004714()
{
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

uint64_t sub_1000047B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100004844;
  return sub_100004548();
}

uint64_t sub_100004844()
{
  sub_100004C84();
  sub_100004C5C();
  uint64_t v1 = *v0;
  sub_100004C74();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

unint64_t sub_10000490C()
{
  unint64_t result = qword_100014040;
  if (!qword_100014040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014040);
  }
  return result;
}

ValueMetadata *type metadata accessor for modelcatalogdump()
{
  return &type metadata for modelcatalogdump;
}

unint64_t sub_10000496C()
{
  unint64_t result = qword_100014048;
  if (!qword_100014048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014048);
  }
  return result;
}

unint64_t sub_1000049BC()
{
  unint64_t result = qword_100014050;
  if (!qword_100014050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014050);
  }
  return result;
}

unint64_t sub_100004A0C()
{
  unint64_t result = qword_100014058;
  if (!qword_100014058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014058);
  }
  return result;
}

unint64_t sub_100004A58()
{
  unint64_t result = qword_100014070;
  if (!qword_100014070)
  {
    type metadata accessor for Status();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014070);
  }
  return result;
}

uint64_t sub_100004AA8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Status();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004B04(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004B3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100004B80(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100004C0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004C90()
{
  sub_100004C84();
  v1[40] = v0;
  uint64_t v2 = sub_100004B3C(&qword_100014088);
  sub_10000E458(v2);
  v1[41] = sub_10000E4E4();
  uint64_t v3 = sub_100004B3C(&qword_100014090);
  sub_10000E458(v3);
  v1[42] = sub_10000E4E4();
  uint64_t v4 = sub_10000E7C8();
  v1[43] = v4;
  sub_10000E388(v4);
  v1[44] = v5;
  v1[45] = sub_10000E4E4();
  uint64_t v6 = sub_100004B3C(&qword_100014098);
  v1[46] = v6;
  sub_10000E388(v6);
  v1[47] = v7;
  v1[48] = sub_10000E4E4();
  uint64_t v8 = sub_100004B3C(&qword_1000140A0);
  v1[49] = v8;
  sub_10000E388(v8);
  v1[50] = v9;
  v1[51] = sub_10000E4E4();
  uint64_t v10 = sub_10000E9C8();
  v1[52] = v10;
  sub_10000E388(v10);
  v1[53] = v11;
  v1[54] = sub_10000E4E4();
  uint64_t v12 = sub_10000E9F8();
  v1[55] = v12;
  sub_10000E388(v12);
  v1[56] = v13;
  v1[57] = sub_10000E4E4();
  uint64_t v14 = sub_10000E9D8();
  v1[58] = v14;
  sub_10000E388(v14);
  v1[59] = v15;
  v1[60] = sub_10000E4E4();
  uint64_t v16 = sub_10000E838();
  v1[61] = v16;
  sub_10000E388(v16);
  v1[62] = v17;
  v1[63] = sub_10000E4E4();
  uint64_t v18 = type metadata accessor for Status();
  v1[64] = v18;
  sub_10000E388(v18);
  v1[65] = v19;
  v1[66] = *(void *)(v20 + 64);
  v1[67] = swift_task_alloc();
  v1[68] = swift_task_alloc();
  uint64_t v21 = sub_10000E7F8();
  v1[69] = v21;
  sub_10000E388(v21);
  v1[70] = v22;
  v1[71] = swift_task_alloc();
  v1[72] = swift_task_alloc();
  sub_10000E578();
  return _swift_task_switch(v23, v24, v25);
}

uint64_t sub_100004F24()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void *)(v0 + 568);
  uint64_t v2 = *(void *)(v0 + 560);
  uint64_t v3 = *(void *)(v0 + 552);
  uint64_t v4 = *(void *)(v0 + 544);
  uint64_t v5 = *(void *)(v0 + 320);
  sub_10000E758();
  sub_10000E728();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for ResourceReadinessStatus.initializing(_:), v3);
  char v6 = sub_10000E7E8();
  uint64_t v7 = *(void (**)(void))(v2 + 8);
  sub_10000E464();
  v7();
  sub_10000E464();
  v7();
  sub_100007C90(v5, v4);
  if (v6)
  {
    uint64_t v8 = *(void *)(v0 + 544);
    sub_100004B3C(&qword_1000140C0);
    sub_10000E958();
    char v9 = *(unsigned char *)(v0 + 665);
    sub_100004AA8(v8);
    if ((v9 & 1) == 0)
    {
      sub_100004B3C(&qword_1000140E0);
      uint64_t v10 = sub_10000E4FC();
      *(_OWORD *)(v10 + 16) = xmmword_10000F080;
      *(void *)(v10 + 56) = &type metadata for String;
      *(void *)(v10 + 32) = 0xD00000000000003CLL;
      *(void *)(v10 + 40) = 0x800000010000F560;
      sub_10000E3BC();
      swift_bridgeObjectRelease();
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
      sub_10000E5AC();
      sub_10000E55C();
      __asm { BRAA            X1, X16 }
    }
  }
  else
  {
    sub_100004AA8(*(void *)(v0 + 544));
  }
  sub_1000062F0();
  sub_10000E3BC();
  swift_allocObject();
  *(void *)(v0 + 584) = sub_10000E748();
  uint64_t v26 = sub_10000E738();
  swift_bridgeObjectRetain();
  sub_100008FDC(&v26, (uint64_t (*)(uint64_t))sub_10000D5C0, sub_10000A340);
  uint64_t v13 = *(void *)(v0 + 320);
  swift_bridgeObjectRelease();
  uint64_t v14 = v26;
  uint64_t v15 = swift_task_alloc();
  *(void *)(v15 + 16) = v13;
  uint64_t v16 = sub_10000739C((uint64_t)sub_100009060, v15, v14);
  *(void *)(v0 + 592) = v16;
  swift_task_dealloc();
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v25 = (long long *)(v0 + 64);
    uint64_t v18 = v16 + 32;
    swift_bridgeObjectRetain();
    uint64_t v19 = _swiftEmptyArrayStorage;
    do
    {
      sub_100009080(v18, v0 + 264);
      sub_100009080(v0 + 264, v0 + 144);
      sub_100004B3C(&qword_1000140A8);
      sub_100004B3C(&qword_1000140B0);
      if ((swift_dynamicCast() & 1) == 0)
      {
        *(void *)(v0 + 136) = 0;
        *(_OWORD *)(v0 + 104) = 0u;
        *(_OWORD *)(v0 + 120) = 0u;
      }
      sub_100004C0C(v0 + 264);
      if (*(void *)(v0 + 128))
      {
        sub_10000CA94((long long *)(v0 + 104), (uint64_t)v25);
        sub_10000CA94(v25, v0 + 184);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_100009450(0, v19[2] + 1, 1, v19);
        }
        unint64_t v21 = v19[2];
        unint64_t v20 = v19[3];
        if (v21 >= v20 >> 1) {
          uint64_t v19 = sub_100009450((void *)(v20 > 1), v21 + 1, 1, v19);
        }
        v19[2] = v21 + 1;
        sub_10000CA94((long long *)(v0 + 184), (uint64_t)&v19[5 * v21 + 4]);
      }
      else
      {
        sub_1000096D0(v0 + 104, &qword_1000140B8);
      }
      v18 += 40;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
  }
  *(void *)(v0 + 600) = v19;
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 608) = v22;
  *uint64_t v22 = v0;
  v22[1] = sub_1000054C0;
  sub_10000E55C();
  return static AssetLock.lockResources(_:)();
}

uint64_t sub_1000054C0()
{
  sub_100004C84();
  sub_100004C5C();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_100004C74();
  *uint64_t v5 = v4;
  *(void *)(v3 + 616) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_10000E578();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_1000055B4()
{
  uint64_t v1 = *(void *)(v0 + 616);
  uint64_t v2 = *(void *)(v0 + 592);
  uint64_t v3 = *(void *)(v0 + 504);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = sub_100007A98((void (*)(uint64_t, uint64_t *))sub_1000090E4, v4, v2);
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_10000E68C();
    v6();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_10000E524();
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
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
LABEL_6:
    return v7();
  }
  uint64_t v8 = (uint64_t)v5;
  uint64_t v33 = *(void *)(v0 + 592);
  uint64_t v10 = *(void *)(v0 + 504);
  uint64_t v9 = *(void *)(v0 + 512);
  uint64_t v11 = *(void *)(v0 + 496);
  uint64_t v34 = *(void *)(v0 + 488);
  swift_task_dealloc();
  *(void *)(v0 + 624) = sub_100004B3C(&qword_1000140C0);
  sub_10000E958();
  uint64_t v12 = *(unsigned __int8 *)(v0 + 664);
  *(_DWORD *)(v0 + 656) = *(_DWORD *)(v9 + 20);
  sub_10000E958();
  sub_1000064B0(v8, v12, *(unsigned char *)(v0 + 661));
  swift_bridgeObjectRelease();
  sub_1000068B0(v33, v10);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v34);
  sub_10000E958();
  uint64_t v13 = *(void *)(v0 + 592);
  if ((*(unsigned char *)(v0 + 660) & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000E3DC();
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
    sub_10000E5AC();
    goto LABEL_6;
  }
  uint64_t v14 = *(void *)(v0 + 536);
  uint64_t v30 = *(void *)(v0 + 520);
  uint64_t v16 = *(void *)(v0 + 472);
  uint64_t v15 = *(void *)(v0 + 480);
  uint64_t v17 = *(void *)(v0 + 464);
  uint64_t v29 = *(void *)(v0 + 320);
  uint64_t v18 = (void (__cdecl *)(int))sub_10000E9B8();
  signal(2, v18);
  sub_100009104(0, &qword_1000140C8);
  sub_100009104(0, &qword_1000140D0);
  unsigned int v32 = enum case for DispatchQoS.QoSClass.default(_:);
  v31 = *(void (**)(uint64_t))(v16 + 104);
  v31(v15);
  uint64_t v19 = (void *)sub_10000EAC8();
  unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v20(v15, v17);
  *(void *)(v0 + 632) = sub_10000EAD8();

  swift_getObjectType();
  sub_100007C90(v29, v14);
  unint64_t v21 = (*(unsigned __int8 *)(v30 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v13;
  sub_10000928C(v14, v22 + v21);
  *(void *)(v0 + 48) = sub_1000092F0;
  *(void *)(v0 + 56) = v22;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_100008394;
  *(void *)(v0 + 40) = &unk_100010800;
  uint64_t v23 = _Block_copy((const void *)(v0 + 16));
  swift_bridgeObjectRetain();
  sub_10000E9E8();
  sub_1000083D8();
  sub_10000EAE8();
  _Block_release(v23);
  sub_10000E5A0();
  v24();
  sub_10000E5A0();
  v25();
  swift_release();
  sub_10000EAF8();
  ((void (*)(uint64_t, void, uint64_t))v31)(v15, v32, v17);
  uint64_t v26 = (void *)sub_10000EAC8();
  v20(v15, v17);
  sub_10000E718();
  swift_bridgeObjectRelease();

  sub_10000EA98();
  *(void *)(v0 + 640) = 0;
  v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 648) = v28;
  void *v28 = v0;
  v28[1] = sub_100005C3C;
  sub_10000E578();
  return AsyncStream.Iterator.next(isolation:)();
}

uint64_t sub_100005C3C()
{
  sub_100004C84();
  sub_100004C5C();
  uint64_t v1 = *v0;
  sub_100004C74();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000E578();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_100005D04()
{
  if (!*(void *)(v0 + 304))
  {
    uint64_t v16 = *(void *)(v0 + 384);
    uint64_t v17 = *(void *)(v0 + 368);
    uint64_t v18 = *(void *)(v0 + 376);
    swift_release();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    sub_10000E698();
    v19();
    sub_10000E3DC();
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
    sub_10000E5AC();
    goto LABEL_14;
  }
  uint64_t v1 = *(void *)(v0 + 592);
  swift_bridgeObjectRelease();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    *(void *)(v0 + 312) = &_swiftEmptyArrayStorage;
    unsigned int v32 = (void **)(v0 + 312);
    sub_10000966C(0, v2, 0);
    uint64_t v3 = *(void *)(v0 + 640);
    uint64_t v4 = 32;
    while (1)
    {
      int64_t v34 = v2;
      uint64_t v5 = *(void *)(v0 + 488);
      uint64_t v6 = *(void *)(v0 + 328);
      uint64_t v7 = *(void *)(v0 + 336);
      sub_100009080(*(void *)(v0 + 592) + v4, v0 + 224);
      sub_10000968C((void *)(v0 + 224), *(void *)(v0 + 248));
      uint64_t v8 = sub_10000E7D8();
      sub_100004BE4(v7, 1, 1, v8);
      sub_100004BE4(v6, 1, 1, v5);
      sub_10000E788();
      if (v3) {
        break;
      }
      uint64_t v9 = *(void *)(v0 + 336);
      sub_1000096D0(*(void *)(v0 + 328), &qword_100014088);
      sub_1000096D0(v9, &qword_100014090);
      sub_100004C0C(v0 + 224);
      uint64_t v10 = *(void **)(v0 + 312);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000966C(0, v10[2] + 1, 1);
        uint64_t v10 = *v32;
      }
      unint64_t v12 = v10[2];
      unint64_t v11 = v10[3];
      if (v12 >= v11 >> 1)
      {
        sub_10000966C(v11 > 1, v12 + 1, 1);
        uint64_t v10 = *v32;
      }
      uint64_t v14 = *(void *)(v0 + 352);
      uint64_t v13 = *(void *)(v0 + 360);
      uint64_t v15 = *(void *)(v0 + 344);
      v10[2] = v12 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v12, v13, v15);
      uint64_t v3 = 0;
      *(void *)(v0 + 312) = v10;
      v4 += 40;
      int64_t v2 = v34 - 1;
      if (v34 == 1)
      {
        uint64_t v27 = 0;
        goto LABEL_17;
      }
    }
    uint64_t v20 = *(void *)(v0 + 400);
    uint64_t v35 = *(void *)(v0 + 408);
    uint64_t v21 = *(void *)(v0 + 384);
    uint64_t v33 = *(void *)(v0 + 392);
    uint64_t v23 = *(void *)(v0 + 368);
    uint64_t v22 = *(void *)(v0 + 376);
    uint64_t v24 = *(void *)(v0 + 336);
    sub_1000096D0(*(void *)(v0 + 328), &qword_100014088);
    sub_1000096D0(v24, &qword_100014090);
    sub_100004C0C(v0 + 224);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v35, v33);
    swift_bridgeObjectRelease();
    sub_10000E410();
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
LABEL_14:
    sub_10000E584();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v27 = *(void *)(v0 + 640);
  uint64_t v10 = &_swiftEmptyArrayStorage;
LABEL_17:
  sub_10000E958();
  char v28 = *(unsigned char *)(v0 + 662);
  sub_10000E958();
  sub_1000064B0((uint64_t)v10, v28, *(unsigned char *)(v0 + 663));
  swift_bridgeObjectRelease();
  *(void *)(v0 + 640) = v27;
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 648) = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_100005C3C;
  sub_10000E578();
  sub_10000E584();
  return AsyncStream.Iterator.next(isolation:)();
}

void sub_1000061E8()
{
  swift_release();
  sub_10000E524();
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
  sub_10000E584();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1000062F0()
{
  sub_10000E7B8();
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_10000936C(v0);
  swift_bridgeObjectRelease();
  uint64_t v13 = v1;
  sub_100008FDC((uint64_t *)&v13, (uint64_t (*)(uint64_t))sub_10000D5AC, sub_100009C84);
  swift_bridgeObjectRelease();
  uint64_t v2 = v13[2];
  if (v2)
  {
    uint64_t v3 = (void **)(v13 + 7);
    do
    {
      uint64_t v5 = (uint64_t)*(v3 - 3);
      uint64_t v4 = (uint64_t)*(v3 - 2);
      uint64_t v6 = (uint64_t)*(v3 - 1);
      uint64_t v7 = *v3;
      sub_100004B3C(&qword_1000140E0);
      uint64_t v8 = sub_10000E4FC();
      *(_OWORD *)(v8 + 16) = xmmword_10000F080;
      uint64_t v13 = (void *)v5;
      uint64_t v14 = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16._countAndFlagsBits = 9;
      v16._object = (void *)0xE100000000000000;
      sub_10000EA48(v16);
      v17._countAndFlagsBits = v6;
      v17._object = v7;
      sub_10000EA48(v17);
      swift_bridgeObjectRelease();
      uint64_t v9 = (uint64_t)v13;
      uint64_t v10 = v14;
      *(void *)(v8 + 56) = &type metadata for String;
      *(void *)(v8 + 32) = v9;
      *(void *)(v8 + 40) = v10;
      sub_10000E3BC();
      swift_bridgeObjectRelease();
      v3 += 4;
      --v2;
    }
    while (v2);
  }
  swift_release();
  sub_100004B3C(&qword_1000140E0);
  uint64_t v11 = sub_10000E4FC();
  *(_OWORD *)(v11 + 16) = xmmword_10000F080;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = 0xD000000000000033;
  *(void *)(v11 + 40) = 0x800000010000F630;
  sub_10000E3BC();

  return swift_bridgeObjectRelease();
}

void sub_1000064B0(uint64_t a1, char a2, char a3)
{
  sub_10000E7C8();
  sub_10000E3A0();
  uint64_t v39 = v7;
  uint64_t v41 = v6;
  __chkstk_darwin();
  sub_10000E63C();
  uint64_t v8 = sub_10000E6D8();
  sub_10000E3A0();
  uint64_t v10 = v9;
  __chkstk_darwin();
  sub_10000E514();
  uint64_t v13 = v12 - v11;
  sub_10000E708();
  sub_10000E3A0();
  __chkstk_darwin();
  sub_10000E60C();
  uint64_t v34 = a1;
  if (a2)
  {
    id v14 = [objc_allocWithZone((Class)NSDateFormatter) init];
    [v14 setDateStyle:1];
    [v14 setTimeStyle:3];
    sub_10000E6F8();
    Class isa = sub_10000E6E8().super.isa;
    sub_10000E68C();
    v16();
    [v14 setTimeZone:isa];

    sub_10000E6C8();
    Class v17 = sub_10000E6B8().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v8);
    id v18 = [v14 stringFromDate:v17];

    uint64_t v19 = sub_10000EA28();
    uint64_t v21 = v20;

    sub_100004B3C(&qword_1000140E0);
    uint64_t v22 = sub_10000E4FC();
    *(_OWORD *)(v22 + 16) = xmmword_10000F080;
    v42._countAndFlagsBits = v19;
    v42._object = v21;
    sub_10000EA48(v42);
    swift_bridgeObjectRelease();
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 32) = 0x6F20657461647055;
    *(void *)(v22 + 40) = 0xEB00000000203A6ELL;
    sub_10000E3BC();

    a1 = v34;
    swift_bridgeObjectRelease();
  }
  uint64_t v23 = *(void *)(a1 + 16);
  if (v23)
  {
    uint64_t v24 = a1 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80));
    uint64_t v38 = *(void *)(v39 + 72);
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16);
    if (a2) {
      uint64_t v25 = 9;
    }
    else {
      uint64_t v25 = 0;
    }
    unint64_t v26 = 0xE000000000000000;
    if (a2) {
      unint64_t v26 = 0xE100000000000000;
    }
    unint64_t v36 = v26;
    uint64_t v37 = v25;
    swift_bridgeObjectRetain();
    uint64_t v27 = v41;
    do
    {
      v40(v3, v24, v27);
      uint64_t v28 = sub_10000E7A8(a3 & 1);
      uint64_t v30 = v29;
      sub_100004B3C(&qword_1000140E0);
      uint64_t v31 = sub_10000E4FC();
      *(_OWORD *)(v31 + 16) = xmmword_10000F080;
      v43._countAndFlagsBits = v28;
      v43._object = v30;
      sub_10000EA48(v43);
      swift_bridgeObjectRelease();
      *(void *)(v31 + 56) = &type metadata for String;
      *(void *)(v31 + 32) = v37;
      *(void *)(v31 + 40) = v36;
      sub_10000E3BC();
      uint64_t v27 = v41;
      swift_bridgeObjectRelease();
      sub_10000E698();
      v32();
      v24 += v38;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    sub_100004B3C(&qword_1000140E0);
    uint64_t v33 = sub_10000E4FC();
    *(_OWORD *)(v33 + 16) = xmmword_10000F080;
    *(void *)(v33 + 56) = &type metadata for String;
    *(void *)(v33 + 32) = 0;
    *(void *)(v33 + 40) = 0xE000000000000000;
    sub_10000E3BC();
    swift_bridgeObjectRelease();
  }
}

void sub_1000068B0(uint64_t a1, uint64_t a2)
{
  uint64_t v67 = a2;
  uint64_t v3 = 0;
  uint64_t v4 = sub_10000E818();
  sub_10000E3A0();
  uint64_t v6 = v5;
  ((void (*)(void))__chkstk_darwin)();
  sub_10000E6A4();
  uint64_t v66 = v7;
  sub_10000E540();
  ((void (*)(void))__chkstk_darwin)();
  v63 = (char *)&v57 - v8;
  sub_10000E540();
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v57 - v10;
  __chkstk_darwin(v9);
  v76 = (char *)&v57 - v12;
  sub_10000E540();
  __chkstk_darwin(v13);
  *(void *)&long long v69 = (char *)&v57 - v14;
  sub_10000E3BC();
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v65 = a1;
  uint64_t v64 = v6;
  uint64_t v60 = v15;
  if (v15)
  {
    uint64_t v58 = 0;
    uint64_t v59 = a1 + 32;
    uint64_t v75 = v6 + 16;
    Swift::String v16 = (void (**)(void))(v6 + 8);
    swift_bridgeObjectRetain();
    int64_t v17 = 0;
    id v18 = &_swiftEmptySetSingleton;
    uint64_t v73 = v4;
    do
    {
      sub_100009080(v59 + 40 * v17, (uint64_t)&v80);
      sub_10000968C(&v80, v82);
      uint64_t v19 = sub_10000E778();
      uint64_t v70 = *(void *)(v19 + 16);
      if (v70)
      {
        int64_t v62 = v17;
        uint64_t v20 = 0;
        unint64_t v21 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
        v61 = (char *)v19;
        v68 = (char *)(v19 + v21);
        uint64_t v74 = *(void *)(v6 + 72);
        uint64_t v22 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 16);
        uint64_t v23 = (char *)v69;
        do
        {
          uint64_t v72 = v20;
          v22((uint64_t)v23, &v68[v74 * v20], v4);
          v22((uint64_t)v76, v23, v4);
          sub_10000E014(&qword_100014118, (void (*)(uint64_t))&type metadata accessor for Tag);
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_10000EA08();
          uint64_t v25 = -1 << v18[32];
          unint64_t v26 = v24 & ~v25;
          uint64_t v27 = *(void *)&v18[((v26 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v26;
          uint64_t v71 = (unint64_t)v16 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          if (v27)
          {
            uint64_t v28 = ~v25;
            while (1)
            {
              v22((uint64_t)v11, (char *)(*((void *)v18 + 6) + v26 * v74), v73);
              sub_10000E014(&qword_100014120, (void (*)(uint64_t))&type metadata accessor for Tag);
              char v29 = sub_10000EA18();
              uint64_t v30 = *v16;
              sub_10000E68C();
              v30();
              if (v29) {
                break;
              }
              unint64_t v26 = (v26 + 1) & v28;
              if (((*(void *)&v18[((v26 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v26) & 1) == 0) {
                goto LABEL_9;
              }
            }
            swift_bridgeObjectRelease();
            uint64_t v4 = v73;
          }
          else
          {
LABEL_9:
            swift_bridgeObjectRelease();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v4 = v73;
            v22((uint64_t)v11, v76, v73);
            v79[0] = (uint64_t)v18;
            sub_10000BDB8((uint64_t)v11, v26, isUniquelyReferenced_nonNull_native);
            id v18 = (unsigned char *)v79[0];
            swift_bridgeObjectRelease();
            uint64_t v30 = *v16;
          }
          sub_10000E68C();
          v30();
          uint64_t v23 = (char *)v69;
          uint64_t v20 = v72 + 1;
          ((void (*)(void, uint64_t))v30)(v69, v4);
        }
        while (v20 != v70);
        swift_bridgeObjectRelease();
        uint64_t v6 = v64;
        int64_t v17 = v62;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      ++v17;
      sub_100004C0C((uint64_t)&v80);
    }
    while (v17 != v60);
    swift_bridgeObjectRelease();
    uint64_t v3 = v58;
  }
  else
  {
    id v18 = &_swiftEmptySetSingleton;
  }
  unsigned int v32 = 0;
  uint64_t v33 = *((void *)v18 + 7);
  v61 = v18 + 56;
  uint64_t v34 = 1 << v18[32];
  uint64_t v35 = -1;
  if (v34 < 64) {
    uint64_t v35 = ~(-1 << v34);
  }
  unint64_t v36 = v35 & v33;
  int64_t v62 = (unint64_t)(v34 + 63) >> 6;
  uint64_t v73 = v6 + 16;
  uint64_t v72 = v6 + 32;
  uint64_t v70 = v6 + 8;
  long long v69 = xmmword_10000F080;
  v68 = (char *)0x800000010000F610;
  uint64_t v71 = (uint64_t)v18;
  if (!v36) {
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v75 = (v36 - 1) & v36;
  v76 = v32;
  unint64_t v37 = __clz(__rbit64(v36)) | ((void)v32 << 6);
  uint64_t v38 = v65;
  while (1)
  {
    v44 = v63;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v63, *((void *)v18 + 6) + *(void *)(v6 + 72) * v37, v4);
    uint64_t v45 = v66;
    uint64_t v46 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v66, v44, v4);
    __chkstk_darwin(v46);
    *(&v57 - 2) = v45;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_10000739C((uint64_t)sub_10000C058, (uint64_t)(&v57 - 4), v38);
    uint64_t v48 = *(void *)(v47 + 16);
    uint64_t v74 = v48;
    if (v48)
    {
      uint64_t v49 = v47 + 32;
      swift_bridgeObjectRetain();
      uint64_t v50 = 0;
      uint64_t v51 = v48;
      while (1)
      {
        sub_100009080(v49, (uint64_t)v79);
        sub_100004B3C(&qword_1000140A8);
        sub_100004B3C(&qword_1000140B0);
        if (swift_dynamicCast())
        {
          sub_10000CA94(v77, (uint64_t)&v80);
          sub_10000968C(&v80, v82);
          v79[3] = swift_getAssociatedTypeWitness();
          v79[4] = swift_getAssociatedConformanceWitness();
          sub_10000C078(v79);
          sub_10000E798();
          if (v3)
          {
            sub_10000C0DC((uint64_t)v79);
            swift_errorRelease();
            sub_100004C0C((uint64_t)&v80);
            uint64_t v52 = 0;
            uint64_t v3 = 0;
          }
          else
          {
            sub_100004C0C((uint64_t)v79);
            sub_100004C0C((uint64_t)&v80);
            uint64_t v52 = 1;
          }
        }
        else
        {
          uint64_t v78 = 0;
          memset(v77, 0, sizeof(v77));
          sub_1000096D0((uint64_t)v77, &qword_1000140B8);
          uint64_t v52 = 0;
        }
        BOOL v39 = __OFADD__(v50, v52);
        v50 += v52;
        if (v39) {
          break;
        }
        v49 += 40;
        if (!--v51)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v6 = v64;
          goto LABEL_46;
        }
      }
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    swift_bridgeObjectRelease();
    uint64_t v50 = 0;
LABEL_46:
    sub_100004B3C(&qword_1000140E0);
    uint64_t v53 = sub_10000E4FC();
    *(_OWORD *)(v53 + 16) = v69;
    uint64_t v80 = 0;
    unint64_t v81 = 0xE000000000000000;
    sub_10000EB48(39);
    sub_10000EB58();
    v83._countAndFlagsBits = 0x2073616820;
    v83._object = (void *)0xE500000000000000;
    sub_10000EA48(v83);
    v79[0] = v50;
    v84._countAndFlagsBits = sub_10000EB88();
    sub_10000EA48(v84);
    swift_bridgeObjectRelease();
    v85._countAndFlagsBits = 0xD00000000000001CLL;
    v85._object = v68;
    sub_10000EA48(v85);
    v79[0] = v74;
    v86._countAndFlagsBits = sub_10000EB88();
    sub_10000EA48(v86);
    swift_bridgeObjectRelease();
    uint64_t v54 = v80;
    unint64_t v55 = v81;
    *(void *)(v53 + 56) = &type metadata for String;
    *(void *)(v53 + 32) = v54;
    *(void *)(v53 + 40) = v55;
    sub_10000E3BC();
    swift_bridgeObjectRelease();
    sub_10000E5A0();
    v56();
    id v18 = (unsigned char *)v71;
    unint64_t v36 = v75;
    unsigned int v32 = v76;
    if (v75) {
      goto LABEL_20;
    }
LABEL_21:
    BOOL v39 = __OFADD__(v32, 1);
    int64_t v40 = (int64_t)(v32 + 1);
    uint64_t v38 = v65;
    if (v39) {
      goto LABEL_54;
    }
    if (v40 >= v62) {
      goto LABEL_52;
    }
    unint64_t v41 = *(void *)&v61[8 * v40];
    if (!v41) {
      break;
    }
LABEL_34:
    uint64_t v75 = (v41 - 1) & v41;
    v76 = (char *)v40;
    unint64_t v37 = __clz(__rbit64(v41)) + (v40 << 6);
  }
  sub_10000E5BC();
  if (v42 == v39) {
    goto LABEL_52;
  }
  sub_10000E54C();
  if (v41) {
    goto LABEL_33;
  }
  sub_10000E5BC();
  if (v42 == v39) {
    goto LABEL_52;
  }
  sub_10000E54C();
  if (v41) {
    goto LABEL_33;
  }
  sub_10000E5BC();
  if (v42 == v39)
  {
LABEL_52:
    swift_release();
    return;
  }
  sub_10000E54C();
  if (v41)
  {
LABEL_33:
    int64_t v40 = v43;
    goto LABEL_34;
  }
  while (1)
  {
    int64_t v40 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v40 >= v62) {
      goto LABEL_52;
    }
    unint64_t v41 = *(void *)&v61[8 * v40];
    ++v43;
    if (v41) {
      goto LABEL_34;
    }
  }
LABEL_55:
  __break(1u);
}

uint64_t sub_10000725C(void *a1)
{
  sub_10000968C(a1, a1[3]);
  uint64_t v1 = sub_10000E778();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(sub_10000E818() - 8);
    unint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    sub_10000E014(&qword_100014120, (void (*)(uint64_t))&type metadata accessor for Tag);
    while ((sub_10000EA18() & 1) == 0)
    {
      v4 += v5;
      if (!--v2) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t sub_10000739C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (unint64_t *)&_swiftEmptyArrayStorage;
  int64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(unint64_t **)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = (uint64_t (*)(long long *))result;
    uint64_t v5 = 0;
    uint64_t v8 = a3 + 32;
    uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v13 = *(unint64_t **)(a3 + 16);
    uint64_t v14 = (uint64_t (*)(long long *))result;
    while ((unint64_t)v5 < *(void *)(a3 + 16))
    {
      sub_100009080(v8, (uint64_t)v16);
      char v10 = v7(v16);
      if (v3)
      {
        sub_100004C0C((uint64_t)v16);
        swift_release();
        swift_bridgeObjectRelease();
        return (uint64_t)v5;
      }
      if (v10)
      {
        sub_10000CA94(v16, (uint64_t)v15);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10000964C(0, v9[2] + 1, 1);
        }
        uint64_t v9 = v17;
        unint64_t v12 = v17[2];
        unint64_t v11 = v17[3];
        if (v12 >= v11 >> 1)
        {
          sub_10000964C((void *)(v11 > 1), v12 + 1, 1);
          uint64_t v9 = v17;
        }
        v9[2] = v12 + 1;
        uint64_t result = sub_10000CA94(v15, (uint64_t)&v9[5 * v12 + 4]);
        uint64_t v6 = v13;
        uint64_t v7 = v14;
      }
      else
      {
        uint64_t result = sub_100004C0C((uint64_t)v16);
      }
      uint64_t v5 = (unint64_t *)((char *)v5 + 1);
      v8 += 40;
      if (v6 == v5)
      {
        uint64_t v5 = v17;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_100007528()
{
  uint64_t v2 = sub_10000E918();
  uint64_t v3 = sub_10000E458(v2);
  __chkstk_darwin(v3);
  sub_10000E5DC();
  uint64_t v4 = sub_10000E8B8();
  uint64_t v5 = sub_10000E458(v4);
  __chkstk_darwin(v5);
  sub_10000E5F4();
  uint64_t v6 = sub_100004B3C(&qword_100014230);
  uint64_t v7 = sub_10000E458(v6);
  __chkstk_darwin(v7);
  sub_10000E63C();
  uint64_t v8 = sub_100004B3C(&qword_100014228);
  uint64_t v9 = sub_10000E458(v8);
  __chkstk_darwin(v9);
  sub_10000E624();
  sub_10000E848();
  uint64_t v10 = sub_10000E858();
  sub_100004BE4(v1, 0, 1, v10);
  uint64_t v11 = sub_10000E868();
  sub_100004BE4(v0, 1, 1, v11);
  sub_10000E8A8();
  sub_10000E908();
  return sub_10000E988();
}

BOOL sub_1000076BC(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = sub_10000E818();
  uint64_t v5 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Status();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004B3C(&qword_1000140D8);
  sub_10000E998();
  uint64_t v11 = *(void *)(v39[0] + 16);
  swift_bridgeObjectRelease();
  sub_100007C90(a2, (uint64_t)v10);
  sub_100009080(a1, (uint64_t)v39);
  if (v11)
  {
    sub_10000E998();
    uint64_t v34 = sub_1000079E4((uint64_t)v40);
    sub_10000968C(v39, v39[3]);
    uint64_t v12 = sub_10000E778();
    int64_t v13 = *(void *)(v12 + 16);
    if (v13)
    {
      unsigned int v32 = v10;
      uint64_t v33 = v2;
      int64_t v40 = _swiftEmptyArrayStorage;
      sub_100009724(0, v13, 0);
      uint64_t v14 = v5 + 16;
      uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      uint64_t v16 = *(unsigned __int8 *)(v5 + 80);
      v31[1] = v12;
      uint64_t v17 = v12 + ((v16 + 32) & ~v16);
      uint64_t v35 = *(void *)(v14 + 56);
      unint64_t v36 = v15;
      uint64_t v37 = v14;
      id v18 = (void (**)(char *, uint64_t))(v14 - 8);
      do
      {
        uint64_t v19 = v38;
        v36(v7, v17, v38);
        uint64_t v20 = sub_10000E808();
        uint64_t v22 = v21;
        (*v18)(v7, v19);
        uint64_t v23 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100009724(0, v23[2] + 1, 1);
          uint64_t v23 = v40;
        }
        unint64_t v25 = v23[2];
        unint64_t v24 = v23[3];
        if (v25 >= v24 >> 1)
        {
          sub_100009724((char *)(v24 > 1), v25 + 1, 1);
          uint64_t v23 = v40;
        }
        v23[2] = v25 + 1;
        unint64_t v26 = &v23[2 * v25];
        v26[4] = v20;
        v26[5] = v22;
        v17 += v35;
        --v13;
      }
      while (v13);
      swift_bridgeObjectRelease();
      uint64_t v10 = v32;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v23 = _swiftEmptyArrayStorage;
    }
    uint64_t v28 = sub_10000CD58((uint64_t)v23, v34);
    swift_bridgeObjectRelease();
    uint64_t v29 = *(void *)(v28 + 16);
    swift_release();
    BOOL v27 = v29 != 0;
  }
  else
  {
    BOOL v27 = 1;
  }
  sub_100004AA8((uint64_t)v10);
  sub_100004C0C((uint64_t)v39);
  return v27;
}

uint64_t sub_1000079E4(uint64_t a1)
{
  uint64_t v2 = sub_10000EAB8();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000B56C(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t *sub_100007A98(void (*a1)(uint64_t, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v16 = sub_10000E7C8();
  uint64_t v6 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v9)
  {
    uint64_t v20 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10000966C(0, v9, 0);
    uint64_t v10 = v20;
    uint64_t v11 = a3 + 32;
    v15[1] = v6 + 32;
    while (1)
    {
      v17(v11, &v19);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v20 = v10;
      unint64_t v13 = v10[2];
      unint64_t v12 = v10[3];
      if (v13 >= v12 >> 1)
      {
        sub_10000966C(v12 > 1, v13 + 1, 1);
        uint64_t v10 = v20;
      }
      v10[2] = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v13, v8, v16);
      v11 += 40;
      if (!--v9) {
        return v10;
      }
    }
    swift_release();
  }
  return v10;
}

uint64_t type metadata accessor for Status()
{
  uint64_t result = qword_1000141B8;
  if (!qword_1000141B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Status();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007CF4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = a3;
  uint64_t v6 = sub_100004B3C(&qword_100014088);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004B3C(&qword_100014090);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000968C(a1, a1[3]);
  uint64_t v12 = sub_10000E7D8();
  sub_100004BE4((uint64_t)v11, 1, 1, v12);
  uint64_t v13 = sub_10000E838();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v8, a2, v13);
  sub_100004BE4((uint64_t)v8, 0, 1, v13);
  sub_10000E788();
  sub_1000096D0((uint64_t)v8, &qword_100014088);
  uint64_t result = sub_1000096D0((uint64_t)v11, &qword_100014090);
  if (v3) {
    *uint64_t v16 = v3;
  }
  return result;
}

uint64_t sub_100007EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_100004B3C(&qword_100014088);
  __chkstk_darwin(v3 - 8);
  Swift::Int v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004B3C(&qword_100014090);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10000E7C8();
  uint64_t v9 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  unint64_t v25 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100004B3C(&qword_1000140E0);
  uint64_t v11 = swift_allocObject();
  long long v21 = xmmword_10000F080;
  *(_OWORD *)(v11 + 16) = xmmword_10000F080;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = 0xD00000000000003CLL;
  *(void *)(v11 + 40) = 0x800000010000F5A0;
  sub_10000EBB8();
  swift_bridgeObjectRelease();
  int64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = &_swiftEmptyArrayStorage;
  if (v12)
  {
    uint64_t v28 = &_swiftEmptyArrayStorage;
    sub_10000966C(0, v12, 0);
    uint64_t v14 = a1 + 32;
    uint64_t v24 = v9 + 32;
    do
    {
      sub_100009080(v14, (uint64_t)v27);
      sub_10000968C(v27, v27[3]);
      uint64_t v15 = sub_10000E7D8();
      sub_100004BE4((uint64_t)v8, 1, 1, v15);
      uint64_t v16 = sub_10000E838();
      sub_100004BE4((uint64_t)v5, 1, 1, v16);
      sub_10000E788();
      sub_1000096D0((uint64_t)v5, &qword_100014088);
      sub_1000096D0((uint64_t)v8, &qword_100014090);
      sub_100004C0C((uint64_t)v27);
      uint64_t v13 = v28;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000966C(0, v13[2] + 1, 1);
        uint64_t v13 = v28;
      }
      unint64_t v18 = v13[2];
      unint64_t v17 = v13[3];
      if (v18 >= v17 >> 1)
      {
        sub_10000966C(v17 > 1, v18 + 1, 1);
        uint64_t v13 = v28;
      }
      v13[2] = v18 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))((unint64_t)v13+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v18, v25, v26);
      uint64_t v28 = v13;
      v14 += 40;
      --v12;
    }
    while (v12);
  }
  sub_100004B3C(&qword_1000140C0);
  sub_10000E958();
  char v19 = v27[0];
  type metadata accessor for Status();
  sub_10000E958();
  sub_1000064B0((uint64_t)v13, v19, v27[0]);
  swift_bridgeObjectRelease();
  type metadata accessor for Status();
  sub_10000E014((unint64_t *)&qword_100014070, (void (*)(uint64_t))type metadata accessor for Status);
  uint64_t result = sub_10000E8D8();
  __break(1u);
  return result;
}

uint64_t sub_100008394(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000083D8()
{
  return sub_10000EB08();
}

BOOL sub_1000084B4(char a1, char a2)
{
  return a1 == a2;
}

void sub_1000084C4(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_1000084EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F74696E6F6DLL && a2 == 0xE700000000000000;
  if (v2 || (sub_10000EB98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65736F62726576 && a2 == 0xE700000000000000;
    if (v6 || (sub_10000EB98() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1936154996 && a2 == 0xE400000000000000;
      if (v7 || (sub_10000EB98() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 1953063287 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_10000EB98();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_100008684()
{
  return 4;
}

Swift::Int sub_10000868C(unsigned __int8 a1)
{
  return sub_10000EBE8();
}

uint64_t sub_1000086D4()
{
  return 0;
}

uint64_t sub_1000086E0(char a1)
{
  uint64_t result = 0x726F74696E6F6DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x65736F62726576;
      break;
    case 2:
      uint64_t result = 1936154996;
      break;
    case 3:
      uint64_t result = 1953063287;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_100008760(char *a1, char *a2)
{
  return sub_1000084B4(*a1, *a2);
}

Swift::Int sub_10000876C()
{
  return sub_10000868C(*v0);
}

void sub_100008774(uint64_t a1)
{
  sub_1000084C4(a1, *v1);
}

Swift::Int sub_10000877C()
{
  Swift::UInt v1 = *v0;
  sub_10000EBC8();
  sub_10000EBD8(v1);
  return sub_10000EBE8();
}

uint64_t sub_1000087C0()
{
  uint64_t v0 = sub_10000E8B8();
  uint64_t v1 = sub_10000E458(v0);
  __chkstk_darwin(v1);
  sub_10000E514();
  uint64_t v2 = sub_100004B3C(&qword_100014228);
  uint64_t v3 = sub_10000E458(v2);
  __chkstk_darwin(v3);
  sub_10000E5DC();
  sub_10000E848();
  sub_10000E858();
  sub_10000E474();
  sub_10000E670();
  type metadata accessor for Status();
  sub_10000E848();
  sub_10000E474();
  sub_10000E670();
  sub_100007528();
  sub_10000E848();
  sub_10000E474();
  return sub_10000E670();
}

uint64_t sub_100008928@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v44 = sub_100004B3C(&qword_1000140D8);
  sub_10000E3A0();
  uint64_t v40 = v4;
  __chkstk_darwin(v5);
  sub_10000E514();
  uint64_t v45 = v7 - v6;
  uint64_t v50 = sub_100004B3C(&qword_1000140C0);
  sub_10000E3A0();
  uint64_t v48 = v8;
  __chkstk_darwin(v9);
  sub_10000E6A4();
  uint64_t v41 = v10;
  sub_10000E540();
  __chkstk_darwin(v11);
  uint64_t v47 = (char *)&v39 - v12;
  sub_10000E540();
  __chkstk_darwin(v13);
  uint64_t v49 = (char *)&v39 - v14;
  uint64_t v51 = sub_100004B3C(&qword_100014238);
  sub_10000E3A0();
  uint64_t v46 = v15;
  __chkstk_darwin(v16);
  sub_10000E514();
  uint64_t v17 = sub_10000E8B8();
  uint64_t v18 = sub_10000E458(v17);
  __chkstk_darwin(v18);
  sub_10000E60C();
  uint64_t v19 = sub_100004B3C(&qword_100014228);
  uint64_t v20 = sub_10000E458(v19);
  __chkstk_darwin(v20);
  sub_10000E624();
  uint64_t v21 = type metadata accessor for Status();
  uint64_t v22 = (int *)(v21 - 8);
  __chkstk_darwin(v21);
  sub_10000E5F4();
  sub_10000E848();
  sub_10000E858();
  sub_10000E4AC();
  sub_10000E654();
  uint64_t v23 = v2 + v22[7];
  sub_10000E848();
  sub_10000E4AC();
  uint64_t v43 = v23;
  sub_10000E654();
  uint64_t v24 = v2 + v22[8];
  sub_100007528();
  uint64_t v25 = v2 + v22[9];
  sub_10000E848();
  sub_10000E4AC();
  sub_10000E654();
  uint64_t v26 = (uint64_t)a1;
  sub_10000968C(a1, a1[3]);
  sub_10000E05C();
  BOOL v27 = v52;
  sub_10000EBF8();
  if (!v27)
  {
    uint64_t v52 = a1;
    uint64_t v39 = v24;
    uint64_t v29 = v47;
    uint64_t v28 = v48;
    char v56 = 0;
    uint64_t v30 = sub_10000E0A8(&qword_100014248, &qword_1000140C0);
    sub_10000EB68();
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v28 + 40);
    v31(v2, v49, v50);
    char v55 = 1;
    sub_10000EB68();
    uint64_t v49 = (char *)v30;
    v31(v43, v29, v50);
    char v54 = 2;
    sub_10000E0A8(&qword_100014250, &qword_1000140D8);
    uint64_t v32 = v45;
    uint64_t v33 = (void (*)(uint64_t, uint64_t, uint64_t))v31;
    uint64_t v34 = v44;
    sub_10000EB68();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 40))(v39, v32, v34);
    char v53 = 3;
    uint64_t v36 = v41;
    sub_10000EB68();
    sub_10000E698();
    v37();
    uint64_t v38 = v42;
    uint64_t v26 = (uint64_t)v52;
    v33(v25, v36, v50);
    sub_100007C90(v2, v38);
  }
  sub_100004C0C(v26);
  return sub_100004AA8(v2);
}

uint64_t sub_100008E40()
{
  return sub_1000086E0(*v0);
}

uint64_t sub_100008E48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000084EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100008E70()
{
  return sub_1000086D4();
}

uint64_t sub_100008E90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100008684();
  *a1 = result;
  return result;
}

uint64_t sub_100008EB8(uint64_t a1)
{
  unint64_t v2 = sub_10000E05C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008EF4(uint64_t a1)
{
  unint64_t v2 = sub_10000E05C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008F30()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000043C0;
  return sub_100004C90();
}

uint64_t sub_100008FC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008928(a1, a2);
}

uint64_t sub_100008FDC(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

BOOL sub_100009060(uint64_t a1)
{
  return sub_1000076BC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100009080(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000090E4(void *a1, void *a2)
{
  return sub_100007CF4(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100009104(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009140()
{
  uint64_t v1 = *(void *)(type metadata accessor for Status() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 24) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  swift_bridgeObjectRelease();
  sub_100004B3C(&qword_1000140C0);
  sub_10000E5CC();
  uint64_t v6 = *(void (**)(void))(v5 + 8);
  sub_10000E464();
  v6();
  sub_10000E464();
  v6();
  sub_100004B3C(&qword_1000140D8);
  sub_10000E5CC();
  sub_10000E5A0();
  v7();
  sub_10000E464();
  v6();

  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_10000928C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Status();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000092F0()
{
  uint64_t v1 = *(void *)(type metadata accessor for Status() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100007EBC(v2, v3);
}

uint64_t sub_100009354(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009364()
{
  return swift_release();
}

void *sub_10000936C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004B3C(&qword_100014150);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 32);
  uint64_t v5 = sub_10000D38C((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10000D5D4();
  if (v5 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_100009450(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100004B3C(&qword_1000140E8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100004B3C(&qword_1000140B0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009578(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1 || (uint64_t result = sub_10000E7C8(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = sub_10000E7C8();
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return _swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

void *sub_10000964C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009864(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_10000966C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_10000998C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_10000968C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000096D0(uint64_t a1, uint64_t *a2)
{
  sub_100004B3C(a2);
  sub_10000E5CC();
  sub_10000E5A0();
  v3();
  return a1;
}

char *sub_100009724(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100009B84(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_100009744(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100004B3C(&qword_100014150);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || &a4[4 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100004B3C(&qword_100014158);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_100009864(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100004B3C(&qword_100014130);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100004B3C(&qword_1000140A8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_10000998C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004B3C(&qword_1000140F0);
  uint64_t v10 = *(void *)(sub_10000E7C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_10000E7C8() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_100009578(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_100009B3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

char *sub_100009B84(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100004B3C(&qword_100014140);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_100009C84(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_10000EB78(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_147;
    }
    if (v3) {
      return sub_10000AC4C(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v104 = result;
  v101 = a1;
  if (v3 <= 1)
  {
    char v5 = _swiftEmptyArrayStorage;
    v107 = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v43 = _swiftEmptyArrayStorage[2];
      uint64_t v8 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_113;
    }
    v103 = _swiftEmptyArrayStorage;
  }
  else
  {
    sub_100004B3C(&qword_100014158);
    uint64_t result = sub_10000EA58();
    *(void *)(result + 16) = v3 / 2;
    v103 = (void *)result;
    v107 = (char *)(result + 32);
  }
  Swift::Int v6 = 0;
  uint64_t v7 = *a1;
  uint64_t v102 = *a1 + 8;
  uint64_t v100 = *a1 + 24;
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v105 = v3;
  uint64_t v106 = *a1;
  while (1)
  {
    Swift::Int v9 = v6++;
    if (v6 >= v3) {
      goto LABEL_39;
    }
    uint64_t v10 = (uint64_t *)(v7 + 32 * v6);
    uint64_t result = *v10;
    uint64_t v11 = v10[1];
    unint64_t v12 = (void *)(v7 + 32 * v9);
    if (result == *v12 && v11 == v12[1])
    {
      Swift::Int v15 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_38;
      }
      int v14 = 0;
    }
    else
    {
      uint64_t result = sub_10000EB98();
      int v14 = result;
      Swift::Int v15 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_30;
      }
    }
    unint64_t v16 = (void *)(v102 + 32 * v15);
    do
    {
      uint64_t result = *(v16 - 1);
      uint64_t v17 = (void *)(v7 + 32 * v6);
      if (result == *v17 && *v16 == v17[1])
      {
        if (v14) {
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t result = sub_10000EB98();
        if ((v14 ^ result)) {
          goto LABEL_30;
        }
      }
      v16 += 4;
      Swift::Int v19 = v15 + 1;
      Swift::Int v6 = v15;
      Swift::Int v15 = v19;
    }
    while (v19 < v3);
    Swift::Int v15 = v19;
LABEL_30:
    Swift::Int v6 = v15;
    if (v14)
    {
LABEL_31:
      if (v15 < v9) {
        goto LABEL_150;
      }
      if (v9 < v15)
      {
        uint64_t v20 = 32 * v15;
        uint64_t v21 = 32 * v9;
        Swift::Int v22 = v15;
        Swift::Int v23 = v9;
        do
        {
          if (v23 != --v22)
          {
            if (!v7) {
              goto LABEL_153;
            }
            uint64_t v24 = (_OWORD *)(v7 + v21);
            uint64_t v25 = v7 + v20;
            long long v26 = *(_OWORD *)(v7 + v21);
            uint64_t v27 = *(void *)(v7 + v21 + 16);
            uint64_t v28 = *(void *)(v7 + v21 + 24);
            long long v29 = *(_OWORD *)(v7 + v20 - 16);
            *uint64_t v24 = *(_OWORD *)(v7 + v20 - 32);
            v24[1] = v29;
            *(_OWORD *)(v25 - 32) = v26;
            *(void *)(v25 - 16) = v27;
            *(void *)(v25 - 8) = v28;
          }
          ++v23;
          v20 -= 32;
          v21 += 32;
        }
        while (v23 < v22);
      }
LABEL_38:
      Swift::Int v6 = v15;
    }
LABEL_39:
    if (v6 < v3)
    {
      if (__OFSUB__(v6, v9)) {
        goto LABEL_145;
      }
      if (v6 - v9 < v104) {
        break;
      }
    }
LABEL_59:
    if (v6 < v9) {
      goto LABEL_140;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10000B460(0, *((void *)v8 + 2) + 1, 1, v8);
      uint64_t v8 = (char *)result;
    }
    unint64_t v42 = *((void *)v8 + 2);
    unint64_t v41 = *((void *)v8 + 3);
    unint64_t v43 = v42 + 1;
    if (v42 >= v41 >> 1)
    {
      uint64_t result = (uint64_t)sub_10000B460((char *)(v41 > 1), v42 + 1, 1, v8);
      uint64_t v8 = (char *)result;
    }
    *((void *)v8 + 2) = v43;
    uint64_t v44 = v8 + 32;
    uint64_t v45 = (Swift::Int *)&v8[16 * v42 + 32];
    *uint64_t v45 = v9;
    v45[1] = v6;
    if (v42)
    {
      uint64_t v7 = v106;
      while (1)
      {
        unint64_t v46 = v43 - 1;
        if (v43 >= 4)
        {
          uint64_t v51 = &v44[16 * v43];
          uint64_t v52 = *((void *)v51 - 8);
          uint64_t v53 = *((void *)v51 - 7);
          BOOL v57 = __OFSUB__(v53, v52);
          uint64_t v54 = v53 - v52;
          if (v57) {
            goto LABEL_129;
          }
          uint64_t v56 = *((void *)v51 - 6);
          uint64_t v55 = *((void *)v51 - 5);
          BOOL v57 = __OFSUB__(v55, v56);
          uint64_t v49 = v55 - v56;
          char v50 = v57;
          if (v57) {
            goto LABEL_130;
          }
          unint64_t v58 = v43 - 2;
          uint64_t v59 = &v44[16 * v43 - 32];
          uint64_t v61 = *(void *)v59;
          uint64_t v60 = *((void *)v59 + 1);
          BOOL v57 = __OFSUB__(v60, v61);
          uint64_t v62 = v60 - v61;
          if (v57) {
            goto LABEL_131;
          }
          BOOL v57 = __OFADD__(v49, v62);
          uint64_t v63 = v49 + v62;
          if (v57) {
            goto LABEL_133;
          }
          if (v63 >= v54)
          {
            unint64_t v81 = &v44[16 * v46];
            uint64_t v83 = *(void *)v81;
            uint64_t v82 = *((void *)v81 + 1);
            BOOL v57 = __OFSUB__(v82, v83);
            uint64_t v84 = v82 - v83;
            if (v57) {
              goto LABEL_139;
            }
            BOOL v74 = v49 < v84;
            goto LABEL_97;
          }
        }
        else
        {
          if (v43 != 3)
          {
            uint64_t v75 = *((void *)v8 + 4);
            uint64_t v76 = *((void *)v8 + 5);
            BOOL v57 = __OFSUB__(v76, v75);
            uint64_t v68 = v76 - v75;
            char v69 = v57;
            goto LABEL_91;
          }
          uint64_t v48 = *((void *)v8 + 4);
          uint64_t v47 = *((void *)v8 + 5);
          BOOL v57 = __OFSUB__(v47, v48);
          uint64_t v49 = v47 - v48;
          char v50 = v57;
        }
        if (v50) {
          goto LABEL_132;
        }
        unint64_t v58 = v43 - 2;
        uint64_t v64 = &v44[16 * v43 - 32];
        uint64_t v66 = *(void *)v64;
        uint64_t v65 = *((void *)v64 + 1);
        BOOL v67 = __OFSUB__(v65, v66);
        uint64_t v68 = v65 - v66;
        char v69 = v67;
        if (v67) {
          goto LABEL_134;
        }
        uint64_t v70 = &v44[16 * v46];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v57 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v57) {
          goto LABEL_136;
        }
        if (__OFADD__(v68, v73)) {
          goto LABEL_138;
        }
        if (v68 + v73 >= v49)
        {
          BOOL v74 = v49 < v73;
LABEL_97:
          if (v74) {
            unint64_t v46 = v58;
          }
          goto LABEL_99;
        }
LABEL_91:
        if (v69) {
          goto LABEL_135;
        }
        v77 = &v44[16 * v46];
        uint64_t v79 = *(void *)v77;
        uint64_t v78 = *((void *)v77 + 1);
        BOOL v57 = __OFSUB__(v78, v79);
        uint64_t v80 = v78 - v79;
        if (v57) {
          goto LABEL_137;
        }
        if (v80 < v68) {
          goto LABEL_108;
        }
LABEL_99:
        unint64_t v85 = v46 - 1;
        if (v46 - 1 >= v43)
        {
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
        if (!v7) {
          goto LABEL_152;
        }
        Swift::String v86 = (unint64_t *)v8;
        uint64_t v87 = v7;
        v88 = &v44[16 * v85];
        uint64_t v89 = *(void *)v88;
        v90 = &v44[16 * v46];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t result = sub_10000AED8((char *)(v87 + 32 * *(void *)v88), (char *)(v87 + 32 * *(void *)v90), v87 + 32 * v91, v107);
        if (v1)
        {
LABEL_110:
          swift_bridgeObjectRelease();
          v103[2] = 0;
          return swift_bridgeObjectRelease();
        }
        if (v91 < v89) {
          goto LABEL_126;
        }
        if (v46 > v86[2]) {
          goto LABEL_127;
        }
        *(void *)v88 = v89;
        *(void *)&v44[16 * v85 + 8] = v91;
        unint64_t v92 = v86[2];
        if (v46 >= v92) {
          goto LABEL_128;
        }
        uint64_t v8 = (char *)v86;
        unint64_t v43 = v92 - 1;
        uint64_t result = (uint64_t)memmove(&v44[16 * v46], v90 + 16, 16 * (v92 - 1 - v46));
        v86[2] = v92 - 1;
        BOOL v74 = v92 > 2;
        uint64_t v7 = v106;
        if (!v74) {
          goto LABEL_108;
        }
      }
    }
    unint64_t v43 = 1;
    uint64_t v7 = v106;
LABEL_108:
    Swift::Int v3 = v105;
    if (v6 >= v105)
    {
      char v5 = v103;
LABEL_113:
      uint64_t result = (uint64_t)v8;
      v103 = v5;
      if (v43 >= 2)
      {
        uint64_t v93 = *v101;
        do
        {
          unint64_t v94 = v43 - 2;
          if (v43 < 2) {
            goto LABEL_141;
          }
          if (!v93) {
            goto LABEL_154;
          }
          uint64_t v95 = result;
          uint64_t v96 = *(void *)(result + 32 + 16 * v94);
          uint64_t v97 = *(void *)(result + 32 + 16 * (v43 - 1) + 8);
          uint64_t result = sub_10000AED8((char *)(v93 + 32 * v96), (char *)(v93 + 32 * *(void *)(result + 32 + 16 * (v43 - 1))), v93 + 32 * v97, v107);
          if (v1) {
            goto LABEL_110;
          }
          if (v97 < v96) {
            goto LABEL_142;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_10000B558(v95);
            uint64_t v95 = result;
          }
          if (v94 >= *(void *)(v95 + 16)) {
            goto LABEL_143;
          }
          v98 = (void *)(v95 + 32 + 16 * v94);
          void *v98 = v96;
          v98[1] = v97;
          unint64_t v99 = *(void *)(v95 + 16);
          if (v43 > v99) {
            goto LABEL_144;
          }
          memmove((void *)(v95 + 32 + 16 * (v43 - 1)), (const void *)(v95 + 32 + 16 * v43), 16 * (v99 - v43));
          uint64_t result = v95;
          *(void *)(v95 + 16) = v99 - 1;
          unint64_t v43 = v99 - 1;
        }
        while (v99 > 2);
      }
      swift_bridgeObjectRelease();
      v103[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  if (__OFADD__(v9, v104)) {
    goto LABEL_148;
  }
  if (v9 + v104 >= v3) {
    Swift::Int v30 = v3;
  }
  else {
    Swift::Int v30 = v9 + v104;
  }
  if (v30 >= v9)
  {
    if (v6 != v30)
    {
      uint64_t v31 = (void *)(v100 + 32 * v6);
      do
      {
        uint64_t v32 = (uint64_t *)(v7 + 32 * v6);
        uint64_t result = *v32;
        uint64_t v33 = v32[1];
        Swift::Int v34 = v9;
        uint64_t v35 = v31;
        do
        {
          uint64_t v36 = (long long *)(v35 - 7);
          if (result == *(v35 - 7) && v33 == *(v35 - 6)) {
            break;
          }
          uint64_t result = sub_10000EB98();
          if ((result & 1) == 0) {
            break;
          }
          if (!v7) {
            goto LABEL_151;
          }
          long long v39 = *v36;
          long long v38 = *(_OWORD *)(v35 - 5);
          *(v35 - 4) = *v35;
          v35 -= 4;
          uint64_t result = v35[1];
          uint64_t v33 = v35[2];
          uint64_t v40 = v35[3];
          v36[2] = v39;
          v36[3] = v38;
          *(v35 - 3) = result;
          *(v35 - 2) = v33;
          *(v35 - 1) = v40;
          ++v34;
        }
        while (v6 != v34);
        ++v6;
        v31 += 4;
      }
      while (v6 != v30);
      Swift::Int v6 = v30;
    }
    goto LABEL_59;
  }
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
  return result;
}

uint64_t sub_10000A340(uint64_t *a1)
{
  uint64_t v2 = v1;
  v122 = a1;
  Swift::Int v3 = a1[1];
  uint64_t result = sub_10000EB78(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_150;
    }
    if (v3) {
      return sub_10000AD28(0, v3, 1, v122);
    }
    return result;
  }
  if (v3 < -1) {
    goto LABEL_149;
  }
  uint64_t v107 = result;
  if (v3 > 1)
  {
    sub_100004B3C(&qword_1000140A8);
    uint64_t result = sub_10000EA58();
    *(void *)(result + 16) = v3 / 2;
    uint64_t v106 = (void *)result;
    v114 = (char *)(result + 32);
LABEL_10:
    Swift::Int v6 = 0;
    uint64_t v7 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      Swift::Int v8 = v6++;
      Swift::Int v113 = v8;
      if (v6 < v3)
      {
        Swift::Int v9 = v8;
        uint64_t v10 = v2;
        uint64_t v11 = *v122;
        sub_100009080(*v122 + 40 * v6, (uint64_t)&v120);
        uint64_t v108 = v11;
        sub_100009080(v11 + 40 * v9, (uint64_t)v118);
        sub_10000968C(&v120, v121);
        uint64_t v12 = sub_10000E768();
        uint64_t v14 = v13;
        sub_10000968C(v118, v119);
        if (v12 == sub_10000E768() && v14 == v15) {
          char v115 = 0;
        }
        else {
          char v115 = sub_10000EB98();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100004C0C((uint64_t)v118);
        uint64_t result = sub_100004C0C((uint64_t)&v120);
        Swift::Int v6 = v113 + 2;
        uint64_t v2 = v10;
        if (v113 + 2 >= v3)
        {
          Swift::Int v8 = v113;
        }
        else
        {
          uint64_t v17 = v108 + 40 * v113 + 40;
          Swift::Int v110 = v3;
          while (1)
          {
            uint64_t v18 = v2;
            sub_100009080(v17 + 40, (uint64_t)&v120);
            sub_100009080(v17, (uint64_t)v118);
            sub_10000968C(&v120, v121);
            uint64_t v19 = sub_10000E768();
            uint64_t v21 = v20;
            sub_10000968C(v118, v119);
            BOOL v23 = v19 == sub_10000E768() && v21 == v22;
            char v24 = v23 ? 0 : sub_10000EB98();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_100004C0C((uint64_t)v118);
            uint64_t result = sub_100004C0C((uint64_t)&v120);
            char v25 = v115 ^ v24;
            uint64_t v2 = v18;
            Swift::Int v3 = v110;
            if (v25) {
              break;
            }
            ++v6;
            v17 += 40;
            if (v6 >= v110)
            {
              Swift::Int v6 = v110;
              break;
            }
          }
          Swift::Int v8 = v113;
        }
        if (v115)
        {
          if (v6 < v8) {
            goto LABEL_151;
          }
          if (v8 < v6)
          {
            Swift::Int v111 = v3;
            uint64_t v26 = v2;
            uint64_t v27 = v7;
            uint64_t v28 = 40 * v6 - 40;
            Swift::Int v29 = v8;
            uint64_t v30 = 40 * v8;
            Swift::Int v31 = v6;
            do
            {
              if (v29 != --v31)
              {
                if (!v108) {
                  goto LABEL_156;
                }
                uint64_t v32 = v108 + v30;
                sub_10000CA94((long long *)(v108 + v30), (uint64_t)&v120);
                uint64_t v33 = *(void *)(v108 + v28 + 32);
                long long v34 = *(_OWORD *)(v108 + v28 + 16);
                *(_OWORD *)uint64_t v32 = *(_OWORD *)(v108 + v28);
                *(_OWORD *)(v32 + 16) = v34;
                *(void *)(v32 + 32) = v33;
                uint64_t result = sub_10000CA94(&v120, v108 + v28);
              }
              ++v29;
              v28 -= 40;
              v30 += 40;
            }
            while (v29 < v31);
            uint64_t v7 = v27;
            uint64_t v2 = v26;
            Swift::Int v3 = v111;
            Swift::Int v8 = v113;
          }
        }
      }
      if (v6 < v3)
      {
        if (__OFSUB__(v6, v8)) {
          goto LABEL_148;
        }
        if (v6 - v8 < v107)
        {
          if (__OFADD__(v8, v107)) {
            goto LABEL_152;
          }
          if (v8 + v107 >= v3) {
            Swift::Int v35 = v3;
          }
          else {
            Swift::Int v35 = v8 + v107;
          }
          if (v35 < v8)
          {
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
            return result;
          }
          if (v6 != v35)
          {
            v109 = v7;
            Swift::Int v112 = v35;
            uint64_t v116 = v2;
            uint64_t v36 = 40 * v6 - 40;
            do
            {
              uint64_t v37 = v36;
              while (1)
              {
                uint64_t v38 = *v122 + v37;
                sub_100009080(v38 + 40, (uint64_t)&v120);
                sub_100009080(v38, (uint64_t)v118);
                sub_10000968C(&v120, v121);
                uint64_t v39 = sub_10000E768();
                uint64_t v41 = v40;
                sub_10000968C(v118, v119);
                if (v39 == sub_10000E768() && v41 == v42) {
                  break;
                }
                char v44 = sub_10000EB98();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_100004C0C((uint64_t)v118);
                uint64_t result = sub_100004C0C((uint64_t)&v120);
                if ((v44 & 1) == 0) {
                  goto LABEL_60;
                }
                uint64_t v45 = *v122;
                if (!*v122) {
                  goto LABEL_154;
                }
                uint64_t v46 = v45 + v37;
                sub_10000CA94((long long *)(v45 + v37 + 40), (uint64_t)&v120);
                long long v47 = *(_OWORD *)(v46 + 16);
                *(_OWORD *)(v46 + 40) = *(_OWORD *)v46;
                *(_OWORD *)(v46 + 56) = v47;
                *(void *)(v46 + 72) = *(void *)(v46 + 32);
                uint64_t result = sub_10000CA94(&v120, v46);
                v37 -= 40;
                if (v6 == ++v8) {
                  goto LABEL_60;
                }
              }
              swift_bridgeObjectRelease_n();
              sub_100004C0C((uint64_t)v118);
              uint64_t result = sub_100004C0C((uint64_t)&v120);
LABEL_60:
              ++v6;
              v36 += 40;
              Swift::Int v8 = v113;
            }
            while (v6 != v112);
            Swift::Int v6 = v112;
            uint64_t v2 = v116;
            uint64_t v7 = v109;
          }
        }
      }
      if (v6 < v8) {
        goto LABEL_143;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000B460(0, *((void *)v7 + 2) + 1, 1, v7);
        uint64_t v7 = (char *)result;
      }
      unint64_t v49 = *((void *)v7 + 2);
      unint64_t v48 = *((void *)v7 + 3);
      unint64_t v50 = v49 + 1;
      uint64_t v117 = v2;
      if (v49 >= v48 >> 1)
      {
        uint64_t result = (uint64_t)sub_10000B460((char *)(v48 > 1), v49 + 1, 1, v7);
        uint64_t v7 = (char *)result;
      }
      *((void *)v7 + 2) = v50;
      uint64_t v51 = v7 + 32;
      uint64_t v52 = &v7[16 * v49 + 32];
      *(void *)uint64_t v52 = v8;
      *((void *)v52 + 1) = v6;
      if (v49)
      {
        while (1)
        {
          unint64_t v53 = v50 - 1;
          if (v50 >= 4)
          {
            unint64_t v58 = &v51[2 * v50];
            uint64_t v59 = *(v58 - 8);
            uint64_t v60 = *(v58 - 7);
            BOOL v64 = __OFSUB__(v60, v59);
            uint64_t v61 = v60 - v59;
            if (v64) {
              goto LABEL_132;
            }
            uint64_t v63 = *(v58 - 6);
            uint64_t v62 = *(v58 - 5);
            BOOL v64 = __OFSUB__(v62, v63);
            uint64_t v56 = v62 - v63;
            char v57 = v64;
            if (v64) {
              goto LABEL_133;
            }
            unint64_t v65 = v50 - 2;
            uint64_t v66 = &v51[2 * v50 - 4];
            uint64_t v68 = *v66;
            uint64_t v67 = v66[1];
            BOOL v64 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v64) {
              goto LABEL_134;
            }
            BOOL v64 = __OFADD__(v56, v69);
            uint64_t v70 = v56 + v69;
            if (v64) {
              goto LABEL_136;
            }
            if (v70 >= v61)
            {
              v88 = &v51[2 * v53];
              uint64_t v90 = *v88;
              uint64_t v89 = v88[1];
              BOOL v64 = __OFSUB__(v89, v90);
              uint64_t v91 = v89 - v90;
              if (v64) {
                goto LABEL_142;
              }
              BOOL v81 = v56 < v91;
              goto LABEL_99;
            }
          }
          else
          {
            if (v50 != 3)
            {
              uint64_t v82 = *((void *)v7 + 4);
              uint64_t v83 = *((void *)v7 + 5);
              BOOL v64 = __OFSUB__(v83, v82);
              uint64_t v75 = v83 - v82;
              char v76 = v64;
              goto LABEL_93;
            }
            uint64_t v55 = *((void *)v7 + 4);
            uint64_t v54 = *((void *)v7 + 5);
            BOOL v64 = __OFSUB__(v54, v55);
            uint64_t v56 = v54 - v55;
            char v57 = v64;
          }
          if (v57) {
            goto LABEL_135;
          }
          unint64_t v65 = v50 - 2;
          uint64_t v71 = &v51[2 * v50 - 4];
          uint64_t v73 = *v71;
          uint64_t v72 = v71[1];
          BOOL v74 = __OFSUB__(v72, v73);
          uint64_t v75 = v72 - v73;
          char v76 = v74;
          if (v74) {
            goto LABEL_137;
          }
          v77 = &v51[2 * v53];
          uint64_t v79 = *v77;
          uint64_t v78 = v77[1];
          BOOL v64 = __OFSUB__(v78, v79);
          uint64_t v80 = v78 - v79;
          if (v64) {
            goto LABEL_139;
          }
          if (__OFADD__(v75, v80)) {
            goto LABEL_141;
          }
          if (v75 + v80 >= v56)
          {
            BOOL v81 = v56 < v80;
LABEL_99:
            if (v81) {
              unint64_t v53 = v65;
            }
            goto LABEL_101;
          }
LABEL_93:
          if (v76) {
            goto LABEL_138;
          }
          uint64_t v84 = &v51[2 * v53];
          uint64_t v86 = *v84;
          uint64_t v85 = v84[1];
          BOOL v64 = __OFSUB__(v85, v86);
          uint64_t v87 = v85 - v86;
          if (v64) {
            goto LABEL_140;
          }
          if (v87 < v75) {
            goto LABEL_110;
          }
LABEL_101:
          unint64_t v92 = v53 - 1;
          if (v53 - 1 >= v50)
          {
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
            goto LABEL_153;
          }
          if (!*v122) {
            goto LABEL_155;
          }
          uint64_t v93 = v7;
          unint64_t v94 = &v51[2 * v92];
          uint64_t v95 = *v94;
          uint64_t v96 = &v51[2 * v53];
          uint64_t v97 = v96[1];
          uint64_t result = sub_10000B0BC((char *)(*v122 + 40 * *v94), (char *)(*v122 + 40 * *v96), (char *)(*v122 + 40 * v97), v114);
          if (v117)
          {
LABEL_125:
            swift_bridgeObjectRelease();
            v106[2] = 0;
            return swift_bridgeObjectRelease();
          }
          if (v97 < v95) {
            goto LABEL_129;
          }
          if (v53 > *((void *)v93 + 2)) {
            goto LABEL_130;
          }
          *unint64_t v94 = v95;
          v51[2 * v92 + 1] = v97;
          unint64_t v98 = *((void *)v93 + 2);
          if (v53 >= v98) {
            goto LABEL_131;
          }
          uint64_t v7 = v93;
          unint64_t v50 = v98 - 1;
          uint64_t result = (uint64_t)memmove(&v51[2 * v53], v96 + 2, 16 * (v98 - 1 - v53));
          *((void *)v93 + 2) = v98 - 1;
          if (v98 <= 2) {
            goto LABEL_110;
          }
        }
      }
      unint64_t v50 = 1;
LABEL_110:
      Swift::Int v3 = v122[1];
      uint64_t v2 = v117;
      if (v6 >= v3)
      {
        char v5 = v106;
        goto LABEL_113;
      }
    }
  }
  char v5 = _swiftEmptyArrayStorage;
  v114 = (char *)&_swiftEmptyArrayStorage[4];
  if (v3 == 1)
  {
    uint64_t v106 = _swiftEmptyArrayStorage;
    goto LABEL_10;
  }
  unint64_t v50 = _swiftEmptyArrayStorage[2];
  uint64_t v7 = (char *)_swiftEmptyArrayStorage;
LABEL_113:
  uint64_t v99 = (uint64_t)v7;
  uint64_t v106 = v5;
  if (v50 >= 2)
  {
    uint64_t v100 = *v122;
    do
    {
      unint64_t v101 = v50 - 2;
      if (v50 < 2) {
        goto LABEL_144;
      }
      if (!v100) {
        goto LABEL_157;
      }
      uint64_t v102 = *(void *)(v99 + 32 + 16 * v101);
      uint64_t v103 = *(void *)(v99 + 32 + 16 * (v50 - 1) + 8);
      uint64_t result = sub_10000B0BC((char *)(v100 + 40 * v102), (char *)(v100 + 40 * *(void *)(v99 + 32 + 16 * (v50 - 1))), (char *)(v100 + 40 * v103), v114);
      if (v2) {
        goto LABEL_125;
      }
      if (v103 < v102) {
        goto LABEL_145;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000B558(v99);
        uint64_t v99 = result;
      }
      if (v101 >= *(void *)(v99 + 16)) {
        goto LABEL_146;
      }
      uint64_t v104 = (void *)(v99 + 32 + 16 * v101);
      *uint64_t v104 = v102;
      v104[1] = v103;
      unint64_t v105 = *(void *)(v99 + 16);
      if (v50 > v105) {
        goto LABEL_147;
      }
      uint64_t result = (uint64_t)memmove((void *)(v99 + 32 + 16 * (v50 - 1)), (const void *)(v99 + 32 + 16 * v50), 16 * (v105 - v50));
      *(void *)(v99 + 16) = v105 - 1;
      unint64_t v50 = v105 - 1;
      uint64_t v2 = 0;
    }
    while (v105 > 2);
  }
  swift_bridgeObjectRelease();
  v106[2] = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000AC4C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 + 24;
    while (2)
    {
      Swift::Int v9 = (uint64_t *)(v7 + 32 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (void *)v8;
      do
      {
        uint64_t v13 = (long long *)(v12 - 7);
        if (result == *(v12 - 7) && v10 == *(v12 - 6)) {
          break;
        }
        uint64_t result = sub_10000EB98();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        long long v16 = *v13;
        long long v15 = *(_OWORD *)(v12 - 5);
        *(v12 - 4) = *v12;
        v12 -= 4;
        uint64_t result = v12[1];
        uint64_t v10 = v12[2];
        uint64_t v17 = v12[3];
        v13[2] = v16;
        v13[3] = v15;
        *(v12 - 3) = result;
        *(v12 - 2) = v10;
        *(v12 - 1) = v17;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 32;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_10000AD28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = result;
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v6 = 40 * a3 - 40;
    while (2)
    {
      uint64_t v7 = v19;
      uint64_t v23 = v6;
      while (1)
      {
        uint64_t v8 = *a4 + v6;
        sub_100009080(v8 + 40, (uint64_t)&v21);
        sub_100009080(v8, (uint64_t)v20);
        sub_10000968C(&v21, v22);
        uint64_t v9 = sub_10000E768();
        uint64_t v11 = v10;
        sub_10000968C(v20, v20[3]);
        if (v9 == sub_10000E768() && v11 == v12) {
          break;
        }
        char v14 = sub_10000EB98();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100004C0C((uint64_t)v20);
        uint64_t result = sub_100004C0C((uint64_t)&v21);
        if (v14)
        {
          uint64_t v15 = *a4;
          if (!*a4)
          {
            __break(1u);
            return result;
          }
          uint64_t v16 = v15 + v6;
          sub_10000CA94((long long *)(v15 + v6 + 40), (uint64_t)&v21);
          long long v17 = *(_OWORD *)(v16 + 16);
          *(_OWORD *)(v16 + 40) = *(_OWORD *)v16;
          *(_OWORD *)(v16 + 56) = v17;
          *(void *)(v16 + 72) = *(void *)(v16 + 32);
          uint64_t result = sub_10000CA94(&v21, v16);
          v6 -= 40;
          if (v5 != ++v7) {
            continue;
          }
        }
        goto LABEL_13;
      }
      swift_bridgeObjectRelease_n();
      sub_100004C0C((uint64_t)v20);
      uint64_t result = sub_100004C0C((uint64_t)&v21);
LABEL_13:
      ++v5;
      uint64_t v6 = v23 + 40;
      if (v5 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_10000AED8(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 32;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 32;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[32 * v11] <= a4) {
      memmove(a4, __src, 32 * v11);
    }
    uint64_t v13 = &v4[32 * v11];
    if (v7 >= v6 || v10 < 32) {
      goto LABEL_53;
    }
    uint64_t v19 = (char *)(a3 - 32);
    while (1)
    {
      uint64_t v20 = v19 + 32;
      long long v21 = v13 - 32;
      BOOL v22 = *((void *)v13 - 4) == *((void *)v6 - 4) && *((void *)v13 - 3) == *((void *)v6 - 3);
      if (v22 || (sub_10000EB98() & 1) == 0)
      {
        BOOL v24 = v20 != v13 || v19 >= v13;
        v13 -= 32;
        if (!v24) {
          goto LABEL_49;
        }
      }
      else
      {
        BOOL v23 = v20 != v6 || v19 >= v6;
        long long v21 = v6 - 32;
        v6 -= 32;
        if (!v23) {
          goto LABEL_49;
        }
      }
      long long v25 = *((_OWORD *)v21 + 1);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v21;
      *((_OWORD *)v19 + 1) = v25;
LABEL_49:
      v19 -= 32;
      if (v6 <= v7 || v13 <= v4) {
        goto LABEL_53;
      }
    }
  }
  if (a4 != __dst || &__dst[32 * v9] <= a4) {
    memmove(a4, __dst, 32 * v9);
  }
  uint64_t v13 = &v4[32 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_10000EB98() & 1) != 0) {
        break;
      }
      uint64_t v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 32;
      if (!v14) {
        goto LABEL_18;
      }
LABEL_19:
      v7 += 32;
      if (v4 >= v13 || (unint64_t)v6 >= a3) {
        goto LABEL_24;
      }
    }
    uint64_t v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 32;
    if (v14) {
      goto LABEL_19;
    }
LABEL_18:
    long long v16 = *((_OWORD *)v15 + 1);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    *((_OWORD *)v7 + 1) = v16;
    goto LABEL_19;
  }
LABEL_24:
  uint64_t v6 = v7;
LABEL_53:
  uint64_t v27 = (v13 - v4) / 32;
  if (v6 != v4 || v6 >= &v4[32 * v27]) {
    memmove(v6, v4, 32 * v27);
  }
  return 1;
}

uint64_t sub_10000B0BC(char *__dst, char *__src, char *a3, char *a4)
{
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = __src - __dst;
  int64_t v8 = (__src - __dst) / 40;
  uint64_t v52 = a3;
  uint64_t v9 = a3 - __src;
  uint64_t v10 = (a3 - __src) / 40;
  if (v8 >= v10)
  {
    BOOL v27 = a4 == __src && &__src[40 * v10] > a4;
    uint64_t v13 = a4;
    if (!v27) {
      memmove(a4, __src, 40 * v10);
    }
    uint64_t v12 = &a4[40 * v10];
    if (v6 >= v5 || v9 < 40) {
      goto LABEL_61;
    }
    uint64_t v28 = v52 - 40;
    uint64_t v46 = a4;
    while (1)
    {
      long long v47 = v12;
      Swift::Int v29 = v12 - 40;
      sub_100009080((uint64_t)(v12 - 40), (uint64_t)v50);
      uint64_t v52 = v5;
      uint64_t v30 = v5 - 40;
      sub_100009080((uint64_t)(v5 - 40), (uint64_t)v48);
      sub_10000968C(v50, v51);
      uint64_t v31 = sub_10000E768();
      uint64_t v33 = v32;
      sub_10000968C(v48, v49);
      if (v31 == sub_10000E768() && v33 == v34) {
        char v36 = 0;
      }
      else {
        char v36 = sub_10000EB98();
      }
      uint64_t v13 = v46;
      uint64_t v37 = v28 + 40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100004C0C((uint64_t)v48);
      sub_100004C0C((uint64_t)v50);
      if (v36)
      {
        BOOL v38 = v37 != v52 || v28 >= v52;
        uint64_t v5 = v30;
        uint64_t v12 = v47;
        if (!v38) {
          goto LABEL_57;
        }
      }
      else
      {
        BOOL v39 = v37 != v47 || v28 >= v47;
        uint64_t v30 = v29;
        uint64_t v12 = v29;
        uint64_t v5 = v52;
        if (!v39) {
          goto LABEL_57;
        }
      }
      long long v40 = *(_OWORD *)v30;
      long long v41 = *((_OWORD *)v30 + 1);
      *((void *)v28 + 4) = *((void *)v30 + 4);
      *(_OWORD *)uint64_t v28 = v40;
      *((_OWORD *)v28 + 1) = v41;
LABEL_57:
      v28 -= 40;
      if (v12 <= v46 || v5 <= v6) {
        goto LABEL_61;
      }
    }
  }
  if (a4 != __dst || &__dst[40 * v8] <= a4) {
    memmove(a4, __dst, 40 * v8);
  }
  uint64_t v12 = &a4[40 * v8];
  uint64_t v13 = a4;
  if (v5 < v52 && v7 >= 40)
  {
    while (1)
    {
      BOOL v14 = v12;
      uint64_t v15 = v5;
      sub_100009080((uint64_t)v5, (uint64_t)v50);
      sub_100009080((uint64_t)v13, (uint64_t)v48);
      sub_10000968C(v50, v51);
      uint64_t v16 = sub_10000E768();
      uint64_t v18 = v17;
      sub_10000968C(v48, v49);
      BOOL v20 = v16 == sub_10000E768() && v18 == v19;
      if (v20) {
        break;
      }
      char v21 = sub_10000EB98();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100004C0C((uint64_t)v48);
      sub_100004C0C((uint64_t)v50);
      if ((v21 & 1) == 0) {
        goto LABEL_18;
      }
      BOOL v22 = v15;
      uint64_t v5 = v15 + 40;
      BOOL v23 = v6 != v15 || v6 >= v5;
LABEL_22:
      uint64_t v12 = v14;
      if (v23)
      {
        long long v24 = *(_OWORD *)v22;
        long long v25 = *((_OWORD *)v22 + 1);
        *((void *)v6 + 4) = *((void *)v22 + 4);
        *(_OWORD *)uint64_t v6 = v24;
        *((_OWORD *)v6 + 1) = v25;
      }
      v6 += 40;
      if (v13 >= v14 || v5 >= v52) {
        goto LABEL_30;
      }
    }
    swift_bridgeObjectRelease_n();
    sub_100004C0C((uint64_t)v48);
    sub_100004C0C((uint64_t)v50);
LABEL_18:
    BOOL v20 = v6 == v13;
    BOOL v22 = v13;
    v13 += 40;
    BOOL v23 = !v20 || v6 >= v13;
    uint64_t v5 = v15;
    goto LABEL_22;
  }
LABEL_30:
  uint64_t v5 = v6;
LABEL_61:
  uint64_t v43 = (v12 - v13) / 40;
  if (v5 != v13 || v5 >= &v13[40 * v43]) {
    memmove(v5, v13, 40 * v43);
  }
  return 1;
}

char *sub_10000B460(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100004B3C(&qword_100014148);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10000B558(uint64_t a1)
{
  return sub_10000B460(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000B56C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10000EBC8();
  swift_bridgeObjectRetain();
  sub_10000EA38();
  Swift::Int v8 = sub_10000EBE8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10000EB98() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_10000EB98() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *Swift::Int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000C130(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *Swift::Int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000B71C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000E818();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  char v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100004B3C(&qword_100014128);
  uint64_t v7 = sub_10000EB28();
  uint64_t v8 = v7;
  if (*(void *)(v6 + 16))
  {
    char v36 = v0;
    uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v10 = *(void *)(v6 + 56);
    BOOL v38 = (void *)(v6 + 56);
    uint64_t v39 = v3;
    if (v9 < 64) {
      uint64_t v11 = ~(-1 << v9);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & v10;
    int64_t v37 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v40 = v3 + 32;
    uint64_t v13 = v7 + 56;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    if (!v12) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v15 << 6))
    {
      uint64_t v22 = v6;
      uint64_t v23 = *(void *)(v39 + 72);
      unint64_t v24 = *(void *)(v6 + 48) + v23 * i;
      long long v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v5, v24, v2);
      sub_10000E014(&qword_100014118, (void (*)(uint64_t))&type metadata accessor for Tag);
      uint64_t result = sub_10000EA08();
      uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v13 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_28:
      *(void *)(v13 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v8 + 48) + v29 * v23, v5, v2);
      ++*(void *)(v8 + 16);
      uint64_t v6 = v22;
      if (v12) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v37) {
        break;
      }
      BOOL v19 = v38;
      unint64_t v20 = v38[v18];
      ++v15;
      if (!v20)
      {
        int64_t v15 = v18 + 1;
        if (v18 + 1 >= v37) {
          goto LABEL_30;
        }
        unint64_t v20 = v38[v15];
        if (!v20)
        {
          int64_t v21 = v18 + 2;
          if (v21 >= v37)
          {
LABEL_30:
            swift_release();
            uint64_t v1 = v36;
            goto LABEL_32;
          }
          unint64_t v20 = v38[v21];
          if (!v20)
          {
            while (1)
            {
              int64_t v15 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                goto LABEL_39;
              }
              if (v15 >= v37) {
                goto LABEL_30;
              }
              unint64_t v20 = v38[v15];
              ++v21;
              if (v20) {
                goto LABEL_18;
              }
            }
          }
          int64_t v15 = v21;
        }
      }
LABEL_18:
      unint64_t v12 = (v20 - 1) & v20;
    }
    swift_release();
    uint64_t v1 = v36;
    BOOL v19 = v38;
LABEL_32:
    uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
    if (v34 > 63) {
      sub_10000C2CC(0, (unint64_t)(v34 + 63) >> 6, v19);
    }
    else {
      *BOOL v19 = -1 << v34;
    }
    *(void *)(v6 + 16) = 0;
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v8;
  return result;
}

uint64_t sub_10000BADC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004B3C(&qword_100014138);
  uint64_t v3 = sub_10000EB28();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_10000EBC8();
      sub_10000EA38();
      uint64_t result = sub_10000EBE8();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      void *v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_10000C2CC(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *char v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_10000BDB8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_10000E818();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_10000B71C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10000C2E8();
      goto LABEL_12;
    }
    sub_10000C71C();
  }
  uint64_t v12 = *v3;
  sub_10000E014(&qword_100014118, (void (*)(uint64_t))&type metadata accessor for Tag);
  uint64_t v13 = sub_10000EA08();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_10000E014(&qword_100014120, (void (*)(uint64_t))&type metadata accessor for Tag);
      char v21 = sub_10000EA18();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_10000EBA8();
  __break(1u);
  return result;
}

uint64_t sub_10000C058(void *a1)
{
  return sub_10000725C(a1) & 1;
}

uint64_t *sub_10000C078(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000C0DC(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    return swift_slowDealloc();
  }
  return result;
}

Swift::Int sub_10000C130(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000BADC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000C568();
      goto LABEL_22;
    }
    sub_10000CAAC();
  }
  uint64_t v11 = *v4;
  sub_10000EBC8();
  sub_10000EA38();
  uint64_t result = sub_10000EBE8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10000EB98(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10000EBA8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_10000EB98();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  char v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_10000C2CC(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_10000C2E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000E818();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004B3C(&qword_100014128);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_10000EB18();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v26 = v6 + 56;
  uint64_t v27 = v8;
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v17 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v18 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v18 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v12 << 6))
  {
    unint64_t v23 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v23, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v27 + 48) + v23, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v17) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v26 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v17) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v26 + 8 * v12);
      if (!v21) {
        break;
      }
    }
LABEL_23:
    unint64_t v16 = (v21 - 1) & v21;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v17)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    uint64_t v8 = v27;
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v26 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v17) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v26 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10000C568()
{
  uint64_t v1 = v0;
  sub_100004B3C(&qword_100014138);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000EB18();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    int64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    int64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *int64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000C71C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000E818();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100004B3C(&qword_100014128);
  uint64_t v7 = sub_10000EB28();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  int64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_10000E014(&qword_100014118, (void (*)(uint64_t))&type metadata accessor for Tag);
    uint64_t result = sub_10000EA08();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_28:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_34;
    }
    if (v19 >= v36) {
      goto LABEL_30;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_30;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20) {
        break;
      }
    }
LABEL_18:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v36)
  {
LABEL_30:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_30;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_18;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_10000CA94(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000CAAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004B3C(&qword_100014138);
  uint64_t v3 = sub_10000EB28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_10000EBC8();
    swift_bridgeObjectRetain();
    sub_10000EA38();
    uint64_t result = sub_10000EBE8();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000CD58(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v6 = (unint64_t *)((char *)&v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_10000C2CC(0, v5, v6);
    uint64_t v7 = sub_10000CEEC(v6, v5, v3, a2);
    swift_release();
  }
  else
  {
    unint64_t v8 = (unint64_t *)swift_slowAlloc();
    sub_10000C2CC(0, v5, v8);
    uint64_t v7 = sub_10000CEEC(v8, v5, v3, a2);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_10000CEEC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  uint64_t v31 = *(void *)(a3 + 16);
  if (!v31)
  {
    uint64_t v26 = 0;
    goto LABEL_27;
  }
  uint64_t v32 = a4 + 56;
  uint64_t v30 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  for (uint64_t i = 0; i != v31; ++i)
  {
    uint64_t v7 = (uint64_t *)(v30 + 16 * i);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    sub_10000EBC8();
    swift_bridgeObjectRetain();
    sub_10000EA38();
    Swift::Int v10 = sub_10000EBE8();
    uint64_t v11 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = 1 << v12;
    if (((1 << v12) & *(void *)(v32 + 8 * (v12 >> 6))) == 0) {
      goto LABEL_22;
    }
    uint64_t v15 = *(void *)(a4 + 48);
    int64_t v16 = (void *)(v15 + 16 * v12);
    BOOL v17 = *v16 == v9 && v16[1] == v8;
    if (!v17 && (sub_10000EB98() & 1) == 0)
    {
      uint64_t v21 = ~v11;
      for (unint64_t j = v12 + 1; ; unint64_t j = v23 + 1)
      {
        unint64_t v23 = j & v21;
        if (((*(void *)(v32 + (((j & v21) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v21)) & 1) == 0) {
          break;
        }
        char v24 = (void *)(v15 + 16 * v23);
        BOOL v25 = *v24 == v9 && v24[1] == v8;
        if (v25 || (sub_10000EB98() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v13 = v23 >> 6;
          uint64_t v14 = 1 << v23;
          goto LABEL_10;
        }
      }
LABEL_22:
      swift_bridgeObjectRelease();
      continue;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_10:
    unint64_t v19 = a1[v13];
    a1[v13] = v14 | v19;
    if ((v14 & v19) == 0 && __OFADD__(v28++, 1))
    {
      __break(1u);
      return result;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a2;
  uint64_t v26 = v28;
LABEL_27:
  swift_retain();
  return sub_10000D0FC(a1, v5, v26, a4);
}

uint64_t sub_10000D0FC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_35:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100004B3C(&qword_100014138);
  uint64_t result = sub_10000EB38();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_35;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_35;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    BOOL v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_10000EBC8();
    swift_bridgeObjectRetain();
    sub_10000EA38();
    uint64_t result = sub_10000EBE8();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_35;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000D38C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v26 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    unint64_t v23 = (uint64_t *)(*(void *)(a4 + 56) + 16 * v16);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    *uint64_t v11 = v22;
    v11[1] = v21;
    v11[2] = v24;
    v11[3] = v25;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 4;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v26;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_10000D5AC(void *a1)
{
  return sub_100009744(0, a1[2], 0, a1);
}

void *sub_10000D5C0(void *a1)
{
  return sub_100009864(0, a1[2], 0, a1);
}

uint64_t sub_10000D5D4()
{
  return swift_release();
}

uint64_t *sub_10000D5DC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004B3C(&qword_1000140C0);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_100004B3C(&qword_1000140D8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
  }
  return a1;
}

uint64_t sub_10000D738(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100004B3C(&qword_1000140C0);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v4 - 8), a1, v4);
  v9(a1 + a2[5], v4);
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_100004B3C(&qword_1000140D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[7];

  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v4);
}

uint64_t sub_10000D83C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004B3C(&qword_1000140C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004B3C(&qword_1000140D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_10000D948(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004B3C(&qword_1000140C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004B3C(&qword_1000140D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_10000DA54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004B3C(&qword_1000140C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004B3C(&qword_1000140D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_10000DB60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004B3C(&qword_1000140C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004B3C(&qword_1000140D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_10000DC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000DC80);
}

uint64_t sub_10000DC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100004B3C(&qword_1000140C0);
  sub_10000E440();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_100004B3C(&qword_1000140D8);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
  }

  return sub_10000DD04(v9, a2, v8);
}

uint64_t sub_10000DD04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000DD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DD40);
}

uint64_t sub_10000DD40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100004B3C(&qword_1000140C0);
  sub_10000E440();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_100004B3C(&qword_1000140D8);
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  return sub_100004BE4(v11, a2, a2, v10);
}

void sub_10000DDCC()
{
  sub_10000DE94();
  if (v0 <= 0x3F)
  {
    sub_10000DEE0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000DE94()
{
  if (!qword_1000141C8)
  {
    unint64_t v0 = sub_10000E978();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000141C8);
    }
  }
}

void sub_10000DEE0()
{
  if (!qword_1000141D0)
  {
    sub_100009B3C((uint64_t *)&unk_1000141D8);
    unint64_t v0 = sub_10000E9A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000141D0);
    }
  }
}

uint64_t sub_10000DF3C()
{
  return sub_10000E014((unint64_t *)&qword_100014070, (void (*)(uint64_t))type metadata accessor for Status);
}

uint64_t sub_10000DF84()
{
  return sub_10000E014((unint64_t *)&unk_100014210, (void (*)(uint64_t))type metadata accessor for Status);
}

uint64_t sub_10000DFCC()
{
  return sub_10000E014(&qword_100014220, (void (*)(uint64_t))type metadata accessor for Status);
}

uint64_t sub_10000E014(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000E05C()
{
  unint64_t result = qword_100014240;
  if (!qword_100014240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014240);
  }
  return result;
}

uint64_t sub_10000E0A8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009B3C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for Status.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Status.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Status.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x10000E250);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E278(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E280(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Status.CodingKeys()
{
  return &type metadata for Status.CodingKeys;
}

unint64_t sub_10000E29C()
{
  unint64_t result = qword_100014258;
  if (!qword_100014258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014258);
  }
  return result;
}

unint64_t sub_10000E2EC()
{
  unint64_t result = qword_100014260;
  if (!qword_100014260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014260);
  }
  return result;
}

unint64_t sub_10000E33C()
{
  unint64_t result = qword_100014268;
  if (!qword_100014268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014268);
  }
  return result;
}

uint64_t sub_10000E388(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000E3BC()
{
  return sub_10000EBB8();
}

uint64_t sub_10000E3DC()
{
  return *(void *)(v0 + 576);
}

uint64_t sub_10000E410()
{
  return *(void *)(v0 + 576);
}

uint64_t sub_10000E458(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000E474()
{
  sub_100004BE4(v0, 0, 1, v1);
  return sub_10000E8A8();
}

uint64_t sub_10000E4AC()
{
  sub_100004BE4(v0, 0, 1, v1);
  return sub_10000E8A8();
}

uint64_t sub_10000E4E4()
{
  return swift_task_alloc();
}

uint64_t sub_10000E4FC()
{
  return swift_allocObject();
}

uint64_t sub_10000E5AC()
{
  return v0 + 8;
}

uint64_t sub_10000E654()
{
  return Flag<A>.init(wrappedValue:name:help:)(0, v0, v1);
}

uint64_t sub_10000E670()
{
  return Flag<A>.init(wrappedValue:name:help:)(0, v0, v1);
}

NSDate sub_10000E6B8()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10000E6C8()
{
  return static Date.now.getter();
}

uint64_t sub_10000E6D8()
{
  return type metadata accessor for Date();
}

NSTimeZone sub_10000E6E8()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_10000E6F8()
{
  return static TimeZone.current.getter();
}

uint64_t sub_10000E708()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10000E718()
{
  return static Catalog.monitorUpdates(for:on:)();
}

uint64_t sub_10000E728()
{
  return static CatalogClient.generativeExperienceEssentialResourcesStatus()();
}

uint64_t sub_10000E738()
{
  return dispatch thunk of CatalogClient.resources()();
}

uint64_t sub_10000E748()
{
  return CatalogClient.init()();
}

uint64_t sub_10000E758()
{
  return type metadata accessor for CatalogClient();
}

uint64_t sub_10000E768()
{
  return dispatch thunk of CatalogResource.id.getter();
}

uint64_t sub_10000E778()
{
  return dispatch thunk of CatalogResource.tags.getter();
}

uint64_t sub_10000E788()
{
  return CatalogResource.statusOutput(status:progress:assetLock:)();
}

uint64_t sub_10000E798()
{
  return dispatch thunk of AssetBackedResource.fetchLockedAsset(with:)();
}

uint64_t sub_10000E7A8(Swift::Bool withAssetSet)
{
  return ResourceStatusOutput.description(withAssetSet:)(withAssetSet)._countAndFlagsBits;
}

uint64_t sub_10000E7B8()
{
  return static ResourceStatusOutput.legend.getter();
}

uint64_t sub_10000E7C8()
{
  return type metadata accessor for ResourceStatusOutput();
}

uint64_t sub_10000E7D8()
{
  return type metadata accessor for AssetSubscriptionStatus();
}

uint64_t sub_10000E7E8()
{
  return static ResourceReadinessStatus.== infix(_:_:)();
}

uint64_t sub_10000E7F8()
{
  return type metadata accessor for ResourceReadinessStatus();
}

uint64_t sub_10000E808()
{
  return Tag.rawValue.getter();
}

uint64_t sub_10000E818()
{
  return type metadata accessor for Tag();
}

uint64_t sub_10000E838()
{
  return type metadata accessor for AssetLock();
}

uint64_t sub_10000E848()
{
  return ArgumentHelp.init(stringLiteral:)();
}

uint64_t sub_10000E858()
{
  return type metadata accessor for ArgumentHelp();
}

uint64_t sub_10000E868()
{
  return type metadata accessor for CompletionKind();
}

uint64_t sub_10000E878()
{
  return static ParsableCommand._commandName.getter();
}

uint64_t sub_10000E888()
{
  return static ParsableCommand.configuration.getter();
}

void sub_10000E898()
{
}

uint64_t sub_10000E8A8()
{
  return static NameSpecification.long.getter();
}

uint64_t sub_10000E8B8()
{
  return type metadata accessor for NameSpecification();
}

uint64_t sub_10000E8C8()
{
  return static ParsableArguments._errorLabel.getter();
}

uint64_t sub_10000E8D8()
{
  return static ParsableArguments.exit(withError:)();
}

uint64_t sub_10000E8E8()
{
  return static ParsableArguments.parse(_:)();
}

void sub_10000E8F8()
{
}

uint64_t sub_10000E908()
{
  return static ArrayParsingStrategy.singleValue.getter();
}

uint64_t sub_10000E918()
{
  return type metadata accessor for ArrayParsingStrategy();
}

uint64_t sub_10000E938()
{
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10000E948()
{
  return type metadata accessor for CommandConfiguration();
}

uint64_t sub_10000E958()
{
  return Flag.wrappedValue.getter();
}

uint64_t sub_10000E978()
{
  return type metadata accessor for Flag();
}

uint64_t sub_10000E988()
{
  return Option.init<A>(wrappedValue:name:parsing:help:completion:)();
}

uint64_t sub_10000E998()
{
  return Option.wrappedValue.getter();
}

uint64_t sub_10000E9A8()
{
  return type metadata accessor for Option();
}

uint64_t sub_10000E9B8()
{
  return SIG_IGN.getter();
}

uint64_t sub_10000E9C8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000E9D8()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_10000E9E8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000E9F8()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10000EA08()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10000EA18()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_10000EA28()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000EA38()
{
  return String.hash(into:)();
}

void sub_10000EA48(Swift::String a1)
{
}

uint64_t sub_10000EA58()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10000EA68()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000EA78()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000EA88()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000EA98()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_10000EAB8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10000EAC8()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_10000EAD8()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t sub_10000EAE8()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

void sub_10000EAF8()
{
}

uint64_t sub_10000EB08()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10000EB18()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10000EB28()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000EB38()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10000EB48(Swift::Int a1)
{
}

uint64_t sub_10000EB58()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000EB68()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

Swift::Int sub_10000EB78(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10000EB88()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000EB98()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000EBA8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000EBB8()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_10000EBC8()
{
  return Hasher.init(_seed:)();
}

void sub_10000EBD8(Swift::UInt a1)
{
}

Swift::Int sub_10000EBE8()
{
  return Hasher._finalize()();
}

uint64_t sub_10000EBF8()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void exit(int a1)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}