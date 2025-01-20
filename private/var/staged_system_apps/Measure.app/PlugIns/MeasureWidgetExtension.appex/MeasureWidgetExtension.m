uint64_t SendableTransfer.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t SendableTransfer.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

uint64_t (*SendableTransfer.wrappedValue.modify())()
{
  return nullsub_1;
}

uint64_t SendableTransfer.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t SendableTransfer.unwrapped<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1, v2);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v5 + 16))(v7);
  uint64_t v12 = *(void *)(v4 + 16);
  uint64_t v8 = type metadata accessor for SendableTransfer();
  sub_100001D1C((void (*)(char *, char *))sub_100001CFC, (uint64_t)v11, (uint64_t)&type metadata for Never, v8, v9, a2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100001C14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, a2);
}

uint64_t sub_100001CFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100001C14(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100001D1C@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v27 = a5;
  uint64_t v28 = a2;
  uint64_t v30 = a4;
  v29 = a1;
  uint64_t v26 = *(void *)(a3 - 8);
  uint64_t v10 = __chkstk_darwin(a1, a2);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = __chkstk_darwin(v10, v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v20);
  v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v23 + 16))(v22, v6);
  uint64_t v24 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v22, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v22, v14);
    v29(v19, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v27, v12, a3);
    }
    uint64_t v24 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a6, v24, 1);
}

uint64_t type metadata accessor for SendableTransfer()
{
  return sub_100002634();
}

uint64_t sub_100001FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_100001FE4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100002074(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    uint64_t *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_10000212C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_100002158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1000021A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1000021F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_100002248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_100002298(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1000023F4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x10000260CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t sub_100002634()
{
  return swift_getGenericMetadata();
}

BOOL AppDependencyType.init(rawValue:)(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008800;
  v6._object = a2;
  Swift::Int v4 = sub_100006800(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

unint64_t AppDependencyType.rawValue.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_1000026C8()
{
  return 1;
}

unint64_t sub_1000026D4()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

Swift::Int sub_100002728()
{
  return sub_100006830();
}

uint64_t sub_100002780()
{
  return sub_100006780();
}

Swift::Int sub_10000279C()
{
  return sub_100006830();
}

uint64_t sub_1000027F0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  Swift::OpaquePointer v3 = (void *)a1[1];
  v4._rawValue = &off_100008838;
  v7._object = v3;
  Swift::Int v5 = sub_100006800(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100002844(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x8000000100007130;
}

uint64_t getEnumTagSinglePayload for AppDependencyType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AppDependencyType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100002958);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100002980()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppDependencyType()
{
  return &type metadata for AppDependencyType;
}

unint64_t sub_10000299C()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

unint64_t sub_1000029F4()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

uint64_t sub_100002A48(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C6576656CLL;
  }
  else {
    uint64_t v3 = 0x6572757361656DLL;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6C6576656CLL;
  }
  else {
    uint64_t v5 = 0x6572757361656DLL;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100006810();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100002AEC()
{
  uint64_t v0 = sub_100006670();
  sub_1000048A0(v0, qword_10000CEE0);
  sub_100004868(v0, (uint64_t)qword_10000CEE0);
  return sub_100006650();
}

uint64_t sub_100002B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[13] = a2;
  v3[14] = a3;
  v3[12] = a1;
  sub_1000067B0();
  v3[15] = sub_1000067A0();
  uint64_t v5 = sub_100006790();
  return _swift_task_switch(sub_100002BF0, v5, v4);
}

uint64_t sub_100002BF0()
{
  swift_release();
  sub_100004C90();
  unint64_t v1 = (void *)sub_1000067D0();
  sub_1000067C0();
  sub_1000066B0();
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 != (id)1)
  {
    sub_1000064C0();
    sub_100004CD0((long long *)(v0 + 56), v0 + 16);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v5 = *(void *)(v0 + 48);
    sub_100004CE8((void *)(v0 + 16), v4);
    sub_1000065A0();
    (*(void (**)(void, uint64_t, uint64_t))(v5 + 8))(*(unsigned __int8 *)(v0 + 56), v4, v5);
    sub_100004D2C(v0 + 16);
  }
  sub_1000067C0();
  sub_1000066B0();
  sub_100006580();

  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100002DC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000065A0();
  *a1 = v3;
  return result;
}

uint64_t sub_100002E00()
{
  return sub_1000065B0();
}

void (*sub_100002E38(void *a1))(void *a1)
{
  id v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006590();
  return sub_100002E94;
}

void sub_100002E94(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100002EE4()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

unint64_t sub_100002F3C()
{
  unint64_t result = qword_10000C158;
  if (!qword_10000C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }
  return result;
}

unint64_t sub_100002F94()
{
  unint64_t result = qword_10000C160;
  if (!qword_10000C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C160);
  }
  return result;
}

uint64_t sub_100002FE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003EC0(a1, a2, a3, (void (*)(void))sub_100002EE4);
}

uint64_t sub_100003030@<X0>(uint64_t a1@<X8>)
{
  return sub_100003DF0(&qword_10000C0A0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CEE0, a1);
}

uint64_t sub_100003068(uint64_t a1)
{
  unint64_t v2 = sub_100004D7C();

  return static OpenIntent.openAppWhenRun.getter(a1, v2);
}

uint64_t sub_1000030B4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_100003160;
  return sub_100002B54(a1, v5, v4);
}

uint64_t sub_100003160()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003254@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004904();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000327C(uint64_t a1)
{
  unint64_t v2 = sub_100002EE4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000032B8()
{
  uint64_t v0 = sub_1000045D8(&qword_10000C1F0);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006670();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v7 = sub_100006640();
  sub_1000048A0(v7, qword_10000CEF8);
  sub_100004868(v7, (uint64_t)qword_10000CEF8);
  sub_100006650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  return sub_100006630();
}

unint64_t sub_100003428()
{
  uint64_t v0 = sub_1000045D8(&qword_10000C1E8);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000045D8(&qword_10000C1F0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006670();
  uint64_t v21 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  sub_1000045D8(&qword_10000C1F8);
  int v11 = (int *)(sub_1000045D8(&qword_10000C200) - 8);
  uint64_t v12 = *(void *)v11;
  uint64_t v22 = *(void *)(*(void *)v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100006BD0;
  unint64_t v15 = v14 + v13;
  v20[0] = v14 + v13 + v11[14];
  *(unsigned char *)(v14 + v13) = 0;
  sub_100006650();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v20[1] = v9 + 56;
  v16(v7, 1, 1, v8);
  uint64_t v17 = sub_1000065D0();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v3, 1, 1, v17);
  sub_1000065E0();
  *(unsigned char *)(v15 + v22) = 1;
  sub_100006650();
  v16(v7, 1, 1, v21);
  v18(v3, 1, 1, v17);
  sub_1000065E0();
  unint64_t result = sub_100003740(v14);
  qword_10000CF10 = result;
  return result;
}

unint64_t sub_100003740(uint64_t a1)
{
  uint64_t v2 = sub_1000045D8(&qword_10000C200);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000045D8(&qword_10000C208);
  uint64_t v7 = sub_1000067F0();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = &v6[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000046C0(v13, (uint64_t)v6);
    char v15 = *v6;
    unint64_t result = sub_10000461C(*v6);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v8[6] + result) = v15;
    uint64_t v19 = v8[7];
    uint64_t v20 = sub_1000065F0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v18, v10, v20);
    uint64_t v21 = v8[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
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

uint64_t sub_100003930(char *a1, char *a2)
{
  return sub_100002A48(*a1, *a2);
}

unint64_t sub_100003940()
{
  unint64_t result = qword_10000C170;
  if (!qword_10000C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

Swift::Int sub_100003994()
{
  return sub_100006830();
}

uint64_t sub_100003A14()
{
  sub_100006780();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003A80()
{
  return sub_100006830();
}

uint64_t sub_100003AFC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000088C0;
  v8._object = v3;
  Swift::Int v5 = sub_100006800(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100003B5C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6572757361656DLL;
  if (*v1) {
    uint64_t v2 = 0x6C6576656CLL;
  }
  unint64_t v3 = 0xE700000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_100003B9C()
{
  unint64_t result = qword_10000C178;
  if (!qword_10000C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

unint64_t sub_100003BF4()
{
  unint64_t result = qword_10000C180;
  if (!qword_10000C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

void *sub_100003C48()
{
  return &protocol witness table for String;
}

unint64_t sub_100003C58()
{
  unint64_t result = qword_10000C188;
  if (!qword_10000C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C188);
  }
  return result;
}

unint64_t sub_100003CB0()
{
  unint64_t result = qword_10000C190;
  if (!qword_10000C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C190);
  }
  return result;
}

unint64_t sub_100003D08()
{
  unint64_t result = qword_10000C198;
  if (!qword_10000C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C198);
  }
  return result;
}

unint64_t sub_100003D60()
{
  unint64_t result = qword_10000C1A0;
  if (!qword_10000C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A0);
  }
  return result;
}

uint64_t sub_100003DB8@<X0>(uint64_t a1@<X8>)
{
  return sub_100003DF0(&qword_10000C0A8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CEF8, a1);
}

uint64_t sub_100003DF0@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100004868(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100003E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003EC0(a1, a2, a3, (void (*)(void))sub_100003F08);
}

uint64_t sub_100003EC0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003F08()
{
  unint64_t result = qword_10000C1A8;
  if (!qword_10000C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A8);
  }
  return result;
}

uint64_t sub_100003F5C(uint64_t a1)
{
  unint64_t v2 = sub_100003F08();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100003FAC()
{
  unint64_t result = qword_10000C1B0;
  if (!qword_10000C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B0);
  }
  return result;
}

unint64_t sub_100004004()
{
  unint64_t result = qword_10000C1B8;
  if (!qword_10000C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B8);
  }
  return result;
}

unint64_t sub_10000405C()
{
  unint64_t result = qword_10000C1C0;
  if (!qword_10000C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1C0);
  }
  return result;
}

uint64_t sub_1000040B0()
{
  if (qword_10000C0B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10000CF10;

  return _swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000410C(uint64_t a1)
{
  unint64_t v2 = sub_100003D60();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100004158()
{
  return sub_100004594(&qword_10000C1C8, &qword_10000C1D0);
}

uint64_t sub_100004194(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000041DC(void *a1@<X8>)
{
  *a1 = &off_100008910;
}

unsigned char *initializeBufferWithCopyOfBuffer for LaunchMeasureEnum(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchMeasureEnum(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LaunchMeasureEnum(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100004354);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10000437C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100004384(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchMeasureEnum()
{
  return &type metadata for LaunchMeasureEnum;
}

uint64_t destroy for LaunchMeasureIntent()
{
  swift_release();

  return swift_release();
}

void *_s22MeasureWidgetExtension19LaunchMeasureIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LaunchMeasureIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LaunchMeasureIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for LaunchMeasureIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchMeasureIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchMeasureIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchMeasureIntent()
{
  return &type metadata for LaunchMeasureIntent;
}

uint64_t sub_100004558()
{
  return sub_100004594(&qword_10000C1D8, &qword_10000C1E0);
}

uint64_t sub_100004594(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004194(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000045D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000461C(char a1)
{
  sub_100006820();
  sub_100006780();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006830();

  return sub_100004728(a1 & 1, v2);
}

uint64_t sub_1000046C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000045D8(&qword_10000C200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100004728(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x6C6576656CLL;
    }
    else {
      uint64_t v6 = 0x6572757361656DLL;
    }
    if (a1) {
      unint64_t v7 = 0xE500000000000000;
    }
    else {
      unint64_t v7 = 0xE700000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x6C6576656CLL : 0x6572757361656DLL;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE500000000000000 : 0xE700000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100006810();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
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

uint64_t sub_100004868(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000048A0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004904()
{
  uint64_t v24 = sub_100006600();
  uint64_t v0 = *(void *)(v24 - 8);
  __chkstk_darwin(v24, v1);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000045D8(&qword_10000C210);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  char v11 = (char *)&v22 - v10;
  uint64_t v12 = sub_1000045D8(&qword_10000C1F0);
  __chkstk_darwin(v12 - 8, v13);
  char v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100006670();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  sub_1000045D8(&qword_10000C218);
  sub_100004C3C();
  sub_1000067E0();
  sub_1000064F0();
  sub_1000064E0();
  uint64_t v23 = sub_1000064D0();
  sub_1000045D8(&qword_10000C228);
  sub_100006650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  char v25 = 2;
  uint64_t v19 = sub_100006570();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v11, 1, 1, v19);
  v20(v8, 1, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100003F08();
  sub_1000065C0();
  return v23;
}

unint64_t sub_100004C3C()
{
  unint64_t result = qword_10000C220;
  if (!qword_10000C220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C220);
  }
  return result;
}

unint64_t sub_100004C90()
{
  unint64_t result = qword_10000C238;
  if (!qword_10000C238)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C238);
  }
  return result;
}

uint64_t sub_100004CD0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_100004CE8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004D2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100004D7C()
{
  unint64_t result = qword_10000C240;
  if (!qword_10000C240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C240);
  }
  return result;
}

uint64_t sub_100004DD0(char a1)
{
  int v25 = a1 & 1;
  uint64_t v24 = sub_100006600();
  uint64_t v1 = *(void *)(v24 - 8);
  __chkstk_darwin(v24, v2);
  uint64_t v23 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000045D8(&qword_10000C210);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  char v11 = (char *)&v23 - v10;
  uint64_t v12 = sub_1000045D8(&qword_10000C1F0);
  __chkstk_darwin(v12 - 8, v13);
  char v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100006670();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  sub_1000045D8(&qword_10000C218);
  sub_100004C3C();
  sub_1000067E0();
  sub_1000064F0();
  sub_1000064E0();
  uint64_t v19 = sub_1000064D0();
  sub_1000045D8(&qword_10000C228);
  swift_retain();
  sub_100006650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  char v26 = 2;
  uint64_t v20 = sub_100006570();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v11, 1, 1, v20);
  v21(v8, 1, 1, v20);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100003F08();
  sub_1000065C0();
  char v26 = v25;
  swift_retain();
  swift_retain();
  sub_1000065B0();
  swift_release();
  swift_release_n();
  return v19;
}

ValueMetadata *type metadata accessor for LevelWidgetExtensionControl()
{
  return &type metadata for LevelWidgetExtensionControl;
}

ValueMetadata *type metadata accessor for MeasureWidgetExtensionControl()
{
  return &type metadata for MeasureWidgetExtensionControl;
}

uint64_t sub_100005174()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005190@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v1 = sub_100006660();
  uint64_t v38 = *(void *)(v1 - 8);
  uint64_t v39 = v1;
  __chkstk_darwin(v1, v2);
  v33 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000066A0();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v6 = sub_100006770();
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v35 = sub_100006670();
  uint64_t v32 = *(void *)(v35 - 8);
  __chkstk_darwin(v35, v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000045D8(&qword_10000C248);
  uint64_t v31 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000045D8(&qword_10000C250);
  uint64_t v34 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000045D8(&qword_10000C258);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v36 = v19;
  uint64_t v37 = v20;
  __chkstk_darwin(v19, v21);
  uint64_t v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045D8(&qword_10000C260);
  sub_100004594(&qword_10000C268, &qword_10000C260);
  sub_100006750();
  sub_100006760();
  sub_100006690();
  (*(void (**)(char *, void, uint64_t))(v38 + 104))(v33, enum case for LocalizedStringResource.BundleDescription.main(_:), v39);
  sub_100006680();
  uint64_t v24 = sub_100004594(&qword_10000C270, &qword_10000C248);
  sub_100006700();
  int v25 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v26 = v35;
  v25(v10, v35);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v11);
  sub_100006650();
  uint64_t v41 = v11;
  uint64_t v42 = v24;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_1000066F0();
  v25(v10, v26);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v15);
  uint64_t v41 = v15;
  uint64_t v42 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v36;
  sub_100006710();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v28);
}

uint64_t sub_100005728()
{
  return sub_100005CE4(0);
}

uint64_t sub_100005744@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006730();
  *a1 = result;
  return result;
}

uint64_t sub_100005788@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v1 = sub_100006670();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000045D8(&qword_10000C248);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_1000045D8(&qword_10000C250);
  uint64_t v35 = *(void *)(v33 - 8);
  __chkstk_darwin(v33, v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000045D8(&qword_10000C258);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v36 = v14;
  uint64_t v37 = v15;
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000045D8(&qword_10000C278);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v38 = v19;
  uint64_t v39 = v20;
  __chkstk_darwin(v19, v21);
  uint64_t v34 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045D8(&qword_10000C260);
  sub_100004594(&qword_10000C268, &qword_10000C260);
  sub_100006750();
  sub_100006650();
  uint64_t v23 = sub_100004594(&qword_10000C270, &qword_10000C248);
  sub_100006700();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v2 + 8);
  v24(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_100006650();
  uint64_t v41 = v6;
  uint64_t v42 = v23;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = v33;
  sub_1000066F0();
  v24(v5, v1);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v26);
  id v27 = [self currentDevice];
  [v27 userInterfaceIdiom];

  uint64_t v41 = v26;
  uint64_t v42 = OpaqueTypeConformance2;
  uint64_t v28 = swift_getOpaqueTypeConformance2();
  v29 = v34;
  uint64_t v30 = v36;
  sub_100006720();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v30);
  uint64_t v41 = v30;
  uint64_t v42 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v38;
  sub_100006710();
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v29, v31);
}

uint64_t sub_100005CC8()
{
  return sub_100005CE4(1);
}

uint64_t sub_100005CE4(char a1)
{
  return sub_100006740();
}

uint64_t sub_100005D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006730();
  *a1 = result;
  return result;
}

uint64_t sub_100005D90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005DAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005E9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005FC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v35 = sub_1000045D8(&qword_10000C288);
  __chkstk_darwin(v35, v1);
  uint64_t v34 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_1000045D8(&qword_10000C290);
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v3 = v31;
  uint64_t v5 = __chkstk_darwin(v33, v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = sub_1000045D8(&qword_10000C298);
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v12 = v32;
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (char *)&v29 - v18;
  sub_100006384();
  sub_1000066E0();
  sub_1000063D8();
  uint64_t v30 = v10;
  sub_1000066E0();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v20(v16, v19, v11);
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v22 = v7;
  uint64_t v23 = v7;
  uint64_t v24 = v33;
  v21(v23, v10, v33);
  int v25 = v34;
  v20(v34, v16, v11);
  v21(&v25[*(int *)(v35 + 48)], v22, v24);
  sub_1000066C0();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v31 + 8);
  v26(v30, v24);
  id v27 = *(void (**)(char *, uint64_t))(v32 + 8);
  v27(v19, v11);
  v26(v22, v24);
  return ((uint64_t (*)(char *, uint64_t))v27)(v16, v11);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006304()
{
  unint64_t result = qword_10000C280;
  if (!qword_10000C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C280);
  }
  return result;
}

ValueMetadata *type metadata accessor for MeasureWidgetExtensionBundle()
{
  return &type metadata for MeasureWidgetExtensionBundle;
}

uint64_t sub_100006368()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006384()
{
  unint64_t result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

unint64_t sub_1000063D8()
{
  unint64_t result = qword_10000C2A8;
  if (!qword_10000C2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A8);
  }
  return result;
}

unint64_t sub_100006430()
{
  unint64_t result = qword_10000C2B0;
  if (!qword_10000C2B0)
  {
    sub_100004194(&qword_10000C2B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2B0);
  }
  return result;
}

uint64_t sub_10000648C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000064C0()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t sub_1000064D0()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t sub_1000064E0()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_1000064F0()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_100006510()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006520()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100006530()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006540()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006570()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006580()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006590()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000065A0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000065B0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000065C0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000065D0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000065E0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_1000065F0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006600()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006620()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006630()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006640()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006650()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006660()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006670()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006680()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006690()
{
  return static Locale.current.getter();
}

uint64_t sub_1000066A0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000066B0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000066C0()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_1000066D0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000066E0()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_1000066F0()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100006700()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100006710()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100006720()
{
  return ControlWidgetConfiguration.enabled(_:)();
}

uint64_t sub_100006730()
{
  return Image.init(systemName:)();
}

uint64_t sub_100006740()
{
  return ControlWidgetButton.init<>(action:label:)();
}

uint64_t sub_100006750()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_100006760()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006770()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006780()
{
  return String.hash(into:)();
}

uint64_t sub_100006790()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000067A0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000067B0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000067C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000067D0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_1000067E0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000067F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006800(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006810()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006820()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006830()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}