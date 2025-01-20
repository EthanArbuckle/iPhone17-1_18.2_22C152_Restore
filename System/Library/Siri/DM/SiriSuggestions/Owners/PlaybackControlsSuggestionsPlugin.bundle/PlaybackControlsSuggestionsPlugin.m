uint64_t sub_48B4()
{
  uint64_t result;

  sub_7480();
  swift_allocObject();
  result = sub_7490();
  qword_C4A0 = result;
  return result;
}

uint64_t sub_490C(uint64_t a1, uint64_t a2)
{
  v3[43] = a2;
  v3[44] = v2;
  v3[42] = a1;
  uint64_t v4 = sub_7450();
  v3[45] = v4;
  v3[46] = *(void *)(v4 - 8);
  v3[47] = swift_task_alloc();
  return _swift_task_switch(sub_49D0, 0, 0);
}

uint64_t sub_49D0()
{
  uint64_t v1 = v0[46];
  sub_5708(&qword_C138);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_7810;
  *(void *)(inited + 32) = 0x45442D6564;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = 0x55412D6E65;
  *(void *)(inited + 56) = 0xE500000000000000;
  *(void *)(inited + 64) = 0x41432D6E65;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = 0x42472D6E65;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = 0x4E492D6E65;
  *(void *)(inited + 104) = 0xE500000000000000;
  *(void *)(inited + 112) = 0x53552D6E65;
  *(void *)(inited + 120) = 0xE500000000000000;
  *(void *)(inited + 128) = 0x53452D7365;
  *(void *)(inited + 136) = 0xE500000000000000;
  *(void *)(inited + 144) = 0x584D2D7365;
  *(void *)(inited + 152) = 0xE500000000000000;
  *(void *)(inited + 160) = 0x53552D7365;
  *(void *)(inited + 168) = 0xE500000000000000;
  *(void *)(inited + 176) = 0x52462D7266;
  *(void *)(inited + 184) = 0xE500000000000000;
  *(void *)(inited + 192) = 0x504A2D616ALL;
  *(void *)(inited + 200) = 0xE500000000000000;
  *(void *)(inited + 208) = 0x4E432D687ALL;
  *(void *)(inited + 216) = 0xE500000000000000;
  *(void *)(inited + 224) = 0x4B482D687ALL;
  *(void *)(inited + 232) = 0xE500000000000000;
  sub_6514(0, 13, 0);
  for (uint64_t i = 0; i != 208; i += 16)
  {
    swift_bridgeObjectRetain();
    sub_7440();
    unint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v5 >= v4 >> 1) {
      sub_6514(v4 > 1, v5 + 1, 1);
    }
    v0[48] = &_swiftEmptyArrayStorage;
    uint64_t v6 = v0[47];
    uint64_t v7 = v0[45];
    *((void *)&_swiftEmptyArrayStorage + 2) = v5 + 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))((char *)&_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v5, v6, v7);
  }
  swift_setDeallocating();
  sub_64D0();
  sub_5708(&qword_C140);
  uint64_t v8 = *(void *)(sub_7470() - 8);
  uint64_t v9 = swift_allocObject();
  v0[49] = v9;
  *(_OWORD *)(v9 + 16) = xmmword_7820;
  v10 = *(void (**)(void))(v8 + 104);
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  sub_73B4();
  v10();
  if (qword_C1A0 != -1) {
    swift_once();
  }
  v11 = (int *)v0[42];
  uint64_t v12 = qword_C4A0;
  v0[35] = sub_7480();
  v0[36] = sub_7064(&qword_C148, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[32] = v12;
  v15 = (uint64_t (*)(void *))((char *)v11 + *v11);
  swift_retain();
  v13 = (void *)swift_task_alloc();
  v0[50] = v13;
  void *v13 = v0;
  v13[1] = sub_4E90;
  return v15(v0 + 32);
}

uint64_t sub_4E90()
{
  sub_73E4();
  uint64_t v1 = v0 + 256;
  *(void *)(v0 + 408) = v2;
  swift_task_dealloc();
  sub_68F8(v1);
  return _swift_task_switch(sub_4F78, 0, 0);
}

uint64_t sub_4F78()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = 0;
  do
  {
    int v2 = *((unsigned __int8 *)&off_8440 + v1 + 32);
    sub_7600(30);
    swift_bridgeObjectRelease();
    v3 = (void *)0xE500000000000000;
    v4._countAndFlagsBits = 0x6573756150;
    switch(v2)
    {
      case 0:
        v4._countAndFlagsBits = 0x77726F4674736146;
        v3 = (void *)0xEB00000000647261;
        break;
      case 1:
        v3 = (void *)0xE400000000000000;
        v4._countAndFlagsBits = 1954047310;
        break;
      case 2:
        v3 = (void *)0xE800000000000000;
        v4._countAndFlagsBits = 0x676E6F537478654ELL;
        break;
      case 3:
        break;
      case 4:
        v4._countAndFlagsBits = 0x6968546573756150;
        v3 = (void *)0xED0000676E6F5373;
        break;
      case 5:
        v3 = (void *)0xE600000000000000;
        v4._countAndFlagsBits = 0x646E69776552;
        break;
      case 6:
        v3 = (void *)0xE400000000000000;
        v4._countAndFlagsBits = 1885956947;
        break;
      case 7:
        v4._countAndFlagsBits = 0x7369685470696B53;
        v3 = (void *)0xEC000000676E6F53;
        break;
      case 8:
        v3 = (void *)0xE400000000000000;
        v4._countAndFlagsBits = 1886352467;
        break;
      default:
        JUMPOUT(0);
    }
    uint64_t v5 = *(void *)(v0 + 352);
    ++v1;
    long long v10 = *(_OWORD *)(v0 + 384);
    v4._object = v3;
    sub_75B0(v4);
    swift_bridgeObjectRelease();
    uint64_t v6 = swift_task_alloc();
    *(unsigned char *)(v6 + 16) = v2;
    *(_OWORD *)(v6 + 24) = v10;
    *(void *)(v6 + 40) = v5;
    sub_7520();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
  }
  while (v1 != 9);
  swift_bridgeObjectRelease_n();
  swift_release();
  swift_bridgeObjectRelease();
  sub_7530();
  sub_5708(&qword_C150);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_7830;
  sub_6838((long long *)(v0 + 296), v7 + 32);
  swift_release();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

_UNKNOWN **sub_53A0()
{
  return &off_8440;
}

uint64_t sub_53AC(char a1)
{
  uint64_t result = 0x77726F4674736146;
  switch(a1)
  {
    case 1:
      uint64_t result = 1954047310;
      break;
    case 2:
      uint64_t result = 0x676E6F537478654ELL;
      break;
    case 3:
      uint64_t result = 0x6573756150;
      break;
    case 4:
      uint64_t result = 0x6968546573756150;
      break;
    case 5:
      uint64_t result = 0x646E69776552;
      break;
    case 6:
      uint64_t result = 1885956947;
      break;
    case 7:
      uint64_t result = 0x7369685470696B53;
      break;
    case 8:
      uint64_t result = 1886352467;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_54C8(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_6BCC(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_550C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for PlaybackControlsSuggestionsPluginOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_5544(char a1)
{
  if (a1) {
    return 0xD000000000000012;
  }
  else {
    return 0x6C7070612E6D6F63;
  }
}

uint64_t sub_558C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_5630;
  return sub_490C(a1, a2);
}

uint64_t sub_5630(uint64_t a1)
{
  sub_73E4();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_5708(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_574C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB00000000647261;
  uint64_t v3 = 0x77726F4674736146;
  uint64_t v4 = a1;
  uint64_t v5 = 0x77726F4674736146;
  unint64_t v6 = 0xEB00000000647261;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1954047310;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x676E6F537478654ELL;
      break;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v5 = 0x6573756150;
      break;
    case 4:
      uint64_t v5 = 0x6968546573756150;
      unint64_t v6 = 0xED0000676E6F5373;
      break;
    case 5:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x646E69776552;
      break;
    case 6:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1885956947;
      break;
    case 7:
      uint64_t v5 = 0x7369685470696B53;
      unint64_t v6 = 0xEC000000676E6F53;
      break;
    case 8:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1886352467;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1954047310;
      break;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x676E6F537478654ELL;
      break;
    case 3:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x6573756150;
      break;
    case 4:
      uint64_t v3 = 0x6968546573756150;
      unint64_t v2 = 0xED0000676E6F5373;
      break;
    case 5:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x646E69776552;
      break;
    case 6:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1885956947;
      break;
    case 7:
      uint64_t v3 = 0x7369685470696B53;
      unint64_t v2 = 0xEC000000676E6F53;
      break;
    case 8:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1886352467;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_7640();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_59D8(char a1)
{
  return sub_7660();
}

uint64_t sub_5A3C()
{
  sub_75A0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_5B8C(uint64_t a1, char a2)
{
  return sub_7660();
}

uint64_t sub_5BEC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_8470;
  v6._object = a2;
  unint64_t v4 = sub_7630(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_5C38(unsigned __int8 *a1, char *a2)
{
  return sub_574C(*a1, *a2);
}

uint64_t sub_5C44@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_5BEC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_5C74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_53AC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_5CA0(void *a1@<X8>)
{
  *a1 = &off_8440;
}

Swift::Int sub_5CB0()
{
  return sub_59D8(*v0);
}

uint64_t sub_5CB8()
{
  return sub_5A3C();
}

Swift::Int sub_5CC0(uint64_t a1)
{
  return sub_5B8C(a1, *v1);
}

uint64_t sub_5CC8(uint64_t a1)
{
  return sub_5D18(a1, 0x6C7070612E6D6F63, 0xEF636973754D2E65, &qword_C438);
}

uint64_t sub_5CF4(uint64_t a1)
{
  return sub_5D18(a1, 0xD000000000000012, 0x8000000000007A00, &qword_C448);
}

uint64_t sub_5D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_7580();
  uint64_t v5 = sub_74A0();
  v8[3] = v5;
  v8[4] = sub_7064(&qword_C178, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  Swift::String v6 = sub_70AC(v8);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v6, enum case for CoreSignalTypes.app(_:), v5);
  uint64_t result = sub_7550();
  *a4 = result;
  return result;
}

uint64_t sub_5E0C()
{
  sub_7580();
  uint64_t result = sub_7560();
  qword_C458 = result;
  return result;
}

uint64_t sub_5E40()
{
  sub_7580();
  uint64_t result = sub_7570();
  qword_C468 = result;
  return result;
}

uint64_t sub_5E74()
{
  sub_7580();
  uint64_t result = sub_7540();
  qword_C478 = result;
  return result;
}

uint64_t sub_5EA8()
{
  sub_5708(&qword_C160);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_7840;
  if (qword_C450 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_C460;
  *(void *)(v0 + 32) = qword_C458;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_C470;
  *(void *)(v0 + 40) = qword_C468;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_C478;
  sub_75D0();
  qword_C488 = v0;
  return swift_retain();
}

uint64_t sub_5FDC()
{
  sub_5708(&qword_C158);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_7850;
  *(unsigned char *)(inited + 32) = 0;
  if (qword_C480 != -1) {
    swift_once();
  }
  unint64_t v1 = qword_C488;
  if (qword_C430 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_C440;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v3 = sub_7620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    swift_retain();
  }
  if (__OFADD__(v3, 2))
  {
    __break(1u);
  }
  else
  {
    sub_6F58(v3 + 2);
    sub_75D0();
    swift_retain();
    sub_75C0();
    sub_7418();
    if (!v5) {
      goto LABEL_11;
    }
  }
  sub_73C4(v3 + 1, v4);
LABEL_11:
  sub_75F0();
  sub_75D0();
  swift_retain();
  sub_75C0();
  sub_7418();
  if (v5) {
    sub_73C4(v3 + 1, v6);
  }
  sub_75F0();
  sub_75D0();
  swift_release();
  swift_release();
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 48) = 1;
  sub_5708(&qword_C160);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_7860;
  uint64_t v8 = qword_C438;
  *(void *)(v7 + 32) = qword_C438;
  uint64_t v20 = v7;
  sub_75D0();
  *(void *)(inited + 56) = v20;
  *(unsigned char *)(inited + 64) = 2;
  unint64_t v9 = qword_C488;
  *(void *)(inited + 72) = qword_C488;
  *(unsigned char *)(inited + 80) = 3;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_7870;
  uint64_t v11 = qword_C448;
  *(void *)(v10 + 32) = v8;
  *(void *)(v10 + 40) = v11;
  uint64_t v21 = v10;
  sub_75D0();
  *(void *)(inited + 88) = v21;
  *(unsigned char *)(inited + 96) = 4;
  *(void *)(inited + 104) = v9;
  *(unsigned char *)(inited + 112) = 5;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    uint64_t v12 = sub_7620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
  }
  if (__OFADD__(v12, 2))
  {
    __break(1u);
  }
  else
  {
    sub_6F58(v12 + 2);
    sub_75D0();
    swift_retain();
    sub_75C0();
    sub_742C();
    if (!v5) {
      goto LABEL_17;
    }
  }
  sub_73C4(v9 + 1, v13);
LABEL_17:
  sub_75F0();
  sub_75D0();
  swift_retain();
  sub_75C0();
  sub_742C();
  if (v5) {
    sub_73C4(v9 + 1, v14);
  }
  sub_75F0();
  sub_75D0();
  swift_release();
  swift_release();
  *(void *)(inited + 120) = v9;
  *(unsigned char *)(inited + 128) = 6;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_7860;
  *(void *)(v15 + 32) = qword_C438;
  uint64_t v22 = v15;
  sub_75D0();
  *(void *)(inited + 136) = v22;
  *(unsigned char *)(inited + 144) = 7;
  uint64_t v16 = qword_C488;
  *(void *)(inited + 152) = qword_C488;
  *(unsigned char *)(inited + 160) = 8;
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  sub_75C0();
  unint64_t v18 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
  unint64_t v17 = *(void *)((char *)&dword_18 + (v16 & 0xFFFFFFFFFFFFFF8));
  if (v18 >= v17 >> 1) {
    sub_73C4(v18 + 1, v17);
  }
  sub_75F0();
  sub_75D0();
  swift_release();
  *(void *)(inited + 168) = v16;
  sub_5708(&qword_C168);
  sub_7018();
  uint64_t result = sub_7590();
  qword_C498 = result;
  return result;
}

uint64_t sub_64D0()
{
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

size_t sub_6514(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_6948(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_6534(uint64_t a1)
{
  char v2 = *(unsigned char *)(v1 + 16);
  sub_6850(a1, (uint64_t)v63);
  uint64_t v3 = v64;
  long long v41 = v65;
  sub_68B4(v63, v64);
  if (qword_C490 != -1) {
    swift_once();
  }
  sub_54C8(v2, qword_C498);
  *(void *)v62 = v3;
  *(_OWORD *)&v62[8] = v41;
  sub_70AC(v61);
  sub_7460();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)&v62[16];
  __n128 v59 = sub_73FC(v61, *(uint64_t *)v62, v5, v6, v7, v8, v9, v10, *(long long *)v62);
  uint64_t v60 = v4;
  sub_70AC(v58);
  sub_74E0();
  uint64_t v11 = v60;
  __n128 v56 = sub_73FC(v58, v59.n128_i64[0], v12, v13, v14, v15, v16, v17, *(_OWORD *)&v59);
  uint64_t v57 = v11;
  sub_70AC(v55);
  sub_74D0();
  uint64_t v18 = v57;
  long long v42 = (__int128)v56;
  sub_68B4(v55, v56.n128_i64[0]);
  sub_53AC(v2);
  long long v53 = v42;
  uint64_t v54 = v18;
  sub_70AC(v52);
  sub_74F0();
  swift_bridgeObjectRelease();
  uint64_t v19 = v54;
  __n128 v50 = sub_73FC(v52, v53, v20, v21, v22, v23, v24, v25, v53);
  uint64_t v51 = v19;
  sub_70AC(v49);
  sub_7510();
  uint64_t v26 = v51;
  __n128 v47 = sub_73FC(v49, v50.n128_i64[0], v27, v28, v29, v30, v31, v32, *(_OWORD *)&v50);
  uint64_t v48 = v26;
  sub_70AC(v46);
  sub_74C0();
  uint64_t v33 = v48;
  __n128 v44 = sub_73FC(v46, v47.n128_i64[0], v34, v35, v36, v37, v38, v39, *(_OWORD *)&v47);
  uint64_t v45 = v33;
  sub_70AC(v43);
  sub_7500();
  sub_68F8((uint64_t)v43);
  sub_68F8((uint64_t)v46);
  sub_68F8((uint64_t)v49);
  sub_68F8((uint64_t)v52);
  sub_68F8((uint64_t)v55);
  sub_68F8((uint64_t)v58);
  sub_68F8((uint64_t)v61);
  return sub_68F8((uint64_t)v63);
}

uint64_t sub_6838(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_6850(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_68B4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_68F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

size_t sub_6948(size_t result, int64_t a2, char a3, uint64_t a4)
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
  sub_5708(&qword_C180);
  uint64_t v10 = *(void *)(sub_7450() - 8);
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
  uint64_t v15 = *(void *)(sub_7450() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_6AF8(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_6AF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1 || (uint64_t result = sub_7450(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = sub_7450();
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return _swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

unint64_t sub_6BCC(char a1)
{
  sub_7650();
  sub_53AC(a1);
  sub_75A0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_7660();
  return sub_6C54(a1, v2);
}

unint64_t sub_6C54(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xEB00000000647261;
      uint64_t v8 = 0x77726F4674736146;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1954047310;
          break;
        case 2:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x676E6F537478654ELL;
          break;
        case 3:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x6573756150;
          break;
        case 4:
          uint64_t v8 = 0x6968546573756150;
          unint64_t v7 = 0xED0000676E6F5373;
          break;
        case 5:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x646E69776552;
          break;
        case 6:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1885956947;
          break;
        case 7:
          uint64_t v8 = 0x7369685470696B53;
          unint64_t v7 = 0xEC000000676E6F53;
          break;
        case 8:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1886352467;
          break;
        default:
          break;
      }
      uint64_t v9 = 0x77726F4674736146;
      unint64_t v10 = 0xEB00000000647261;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xE400000000000000;
          uint64_t v9 = 1954047310;
          break;
        case 2:
          unint64_t v10 = 0xE800000000000000;
          uint64_t v9 = 0x676E6F537478654ELL;
          break;
        case 3:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v9 = 0x6573756150;
          break;
        case 4:
          uint64_t v9 = 0x6968546573756150;
          unint64_t v10 = 0xED0000676E6F5373;
          break;
        case 5:
          unint64_t v10 = 0xE600000000000000;
          uint64_t v9 = 0x646E69776552;
          break;
        case 6:
          unint64_t v10 = 0xE400000000000000;
          uint64_t v9 = 1885956947;
          break;
        case 7:
          uint64_t v9 = 0x7369685470696B53;
          unint64_t v10 = 0xEC000000676E6F53;
          break;
        case 8:
          unint64_t v10 = 0xE400000000000000;
          uint64_t v9 = 1886352467;
          break;
        default:
          break;
      }
      if (v8 == v9 && v7 == v10) {
        break;
      }
      char v12 = sub_7640();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_6F58(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((char *)&dword_18 + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_7620();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_7610();
    *uint64_t v1 = result;
  }
  return result;
}

unint64_t sub_7018()
{
  unint64_t result = qword_C170;
  if (!qword_C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C170);
  }
  return result;
}

uint64_t sub_7064(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_70AC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unsigned char *initializeBufferWithCopyOfBuffer for PlaybackControlsSuggestion(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaybackControlsSuggestion(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlaybackControlsSuggestion(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x7278);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_72A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_72AC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PlaybackControlsSuggestion()
{
  return &type metadata for PlaybackControlsSuggestion;
}

unint64_t sub_72C8()
{
  unint64_t result = qword_C188;
  if (!qword_C188)
  {
    sub_731C(&qword_C190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C188);
  }
  return result;
}

uint64_t sub_731C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_7368()
{
  unint64_t result = qword_C198;
  if (!qword_C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C198);
  }
  return result;
}

uint64_t sub_73C4@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a2 > 1, a1, 1);
}

__n128 sub_73FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  return (__n128)a9;
}

uint64_t sub_7440()
{
  return Locale.init(identifier:)();
}

uint64_t sub_7450()
{
  return type metadata accessor for Locale();
}

uint64_t sub_7460()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_7470()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_7480()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_7490()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_74A0()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_74B0()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t sub_74C0()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_74D0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_74E0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_74F0()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_7500()
{
  return dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)();
}

uint64_t sub_7510()
{
  return dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()();
}

uint64_t sub_7520()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_7530()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_7540()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_7550()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_7560()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_7570()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_7580()
{
  return type metadata accessor for Signal();
}

uint64_t sub_7590()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_75A0()
{
  return String.hash(into:)();
}

void sub_75B0(Swift::String a1)
{
}

uint64_t sub_75C0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_75D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_75F0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

void sub_7600(Swift::Int a1)
{
}

uint64_t sub_7610()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_7620()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

Swift::Int sub_7630(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_7640()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_7650()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_7660()
{
  return Hasher._finalize()();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}