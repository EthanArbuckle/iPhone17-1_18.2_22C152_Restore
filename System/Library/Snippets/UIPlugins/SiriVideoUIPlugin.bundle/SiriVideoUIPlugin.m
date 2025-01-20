uint64_t sub_1E68@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriVideoUIError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriVideoUIError(unsigned char *result, int a2, int a3)
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
        *result = a2;
        return result;
      case 2:
        *(_WORD *)result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *result = 0;
      break;
    case 2:
      *(_WORD *)result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1F88);
    case 4:
      *(_DWORD *)result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1FB0()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriVideoUIError()
{
  return &type metadata for SiriVideoUIError;
}

unint64_t sub_1FD0()
{
  unint64_t result = qword_18298;
  if (!qword_18298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18298);
  }
  return result;
}

unint64_t sub_201C()
{
  return 0xD000000000000033;
}

uint64_t sub_2038()
{
  return 1;
}

void sub_2040()
{
}

Swift::Int sub_2068()
{
  return sub_10864();
}

Swift::Int sub_20B4()
{
  return sub_10864();
}

unint64_t sub_20F4()
{
  return 0xD000000000000033;
}

unint64_t sub_2124()
{
  unint64_t result = qword_182A0;
  if (!qword_182A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_182A0);
  }
  return result;
}

uint64_t sub_2180()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_FFD4();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21F4()
{
  return sub_FFE4();
}

uint64_t sub_2264()
{
  uint64_t v0 = sub_106C4();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_106A4();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10584();
  __chkstk_darwin(v5 - 8);
  sub_34D8(0, &qword_18420);
  sub_10574();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_344C(&qword_18448, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_31A4(&qword_18450);
  sub_3494(&qword_18458, &qword_18450);
  sub_10744();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_106E4();
  qword_182A8 = result;
  return result;
}

id sub_24C8()
{
  id v0 = [objc_allocWithZone((Class)NSCache) init];
  [v0 setCountLimit:40];
  id result = [v0 setTotalCostLimit:52428800];
  qword_182B0 = (uint64_t)v0;
  return result;
}

uint64_t sub_252C()
{
  sub_2F8C();
  sub_31A4(&qword_18468);
  sub_36A8();
  sub_3640();
  v1();
  swift_release();
  return v0;
}

uint64_t sub_2598()
{
  sub_252C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_25F0()
{
  return type metadata accessor for ImageLoader();
}

uint64_t type metadata accessor for ImageLoader()
{
  uint64_t result = qword_182F0;
  if (!qword_182F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2640()
{
  sub_2FE4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_26D8(uint64_t a1)
{
  id v49 = *v1;
  v50 = v1;
  sub_FE94();
  sub_3624();
  uint64_t v47 = v4;
  uint64_t v48 = v3;
  __chkstk_darwin(v3);
  uint64_t v45 = v5;
  v46 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_31A4(&qword_183E8);
  __chkstk_darwin(v6 - 8);
  sub_364C();
  uint64_t v9 = v8 - v7;
  sub_10644();
  sub_3624();
  v44[1] = v10;
  __chkstk_darwin(v11);
  sub_365C();
  sub_31A4(&qword_183F0);
  sub_3624();
  v44[2] = v12;
  __chkstk_darwin(v13);
  sub_364C();
  sub_31A4(&qword_183F8);
  sub_3624();
  v44[3] = v15;
  v44[4] = v14;
  __chkstk_darwin(v14);
  sub_364C();
  sub_31A4(&qword_18400);
  sub_3624();
  v44[6] = v17;
  v44[7] = v16;
  __chkstk_darwin(v16);
  sub_3674();
  v44[5] = v18;
  sub_31A4(&qword_18408);
  sub_3624();
  v44[9] = v20;
  v44[10] = v19;
  __chkstk_darwin(v19);
  sub_3674();
  v44[8] = v21;
  if (qword_18208 != -1) {
    swift_once();
  }
  v22 = (void *)qword_182B0;
  sub_FE74((NSURL *)&ImageLoader);
  v24 = v23;
  id v25 = [v22 objectForKey:v23];

  if (v25)
  {
    id v49 = v25;
    sub_21F4();
    v26 = v49;
  }
  else
  {
    id v27 = [self sharedSession];
    sub_10654();

    sub_31A4((uint64_t *)&unk_18308);
    sub_344C(&qword_18410, (void (*)(uint64_t))&type metadata accessor for NSURLSession.DataTaskPublisher);
    sub_10014();
    sub_3640();
    v28();
    id v51 = 0;
    sub_3494(&qword_18418, &qword_183F0);
    sub_10004();
    sub_3640();
    v29();
    if (qword_18200 != -1) {
      swift_once();
    }
    v30 = (void *)qword_182A8;
    id v51 = (id)qword_182A8;
    sub_106B4();
    sub_3688();
    sub_34D8(0, &qword_18420);
    sub_3494(&qword_18428, &qword_183F8);
    sub_3210();
    id v31 = v30;
    sub_10034();
    sub_3270(v9);

    sub_3640();
    v32();
    id v51 = (id)sub_106D4();
    sub_3688();
    sub_3494(&qword_18438, &qword_18400);
    sub_10024();
    sub_3270(v9);

    sub_3640();
    v33();
    uint64_t v34 = swift_allocObject();
    v35 = v50;
    swift_weakInit();
    v37 = v46;
    uint64_t v36 = v47;
    uint64_t v38 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, a1, v48);
    unint64_t v39 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    unint64_t v40 = (v45 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v41 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v41 + v39, v37, v38);
    *(void *)(v41 + v40) = v34;
    *(void *)(v41 + ((v40 + 15) & 0xFFFFFFFFFFFFFFF8)) = v49;
    sub_3494(&qword_18440, &qword_18408);
    uint64_t v42 = sub_10044();
    swift_release();
    sub_3640();
    v43();
    *(id *)((char *)v35 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable) = (id)v42;
    swift_release();
  }
}

id sub_2DC8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  sub_34D8(0, &qword_18460);
  sub_3514(v3, v4);
  id result = sub_2E30(v3, v4);
  *a2 = result;
  return result;
}

id sub_2E30(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_FEA4().super.isa;
  id v6 = [v4 initWithData:isa];
  sub_356C(a1, a2);

  return v6;
}

void sub_2EA8(id *a1)
{
  if (*a1)
  {
    uint64_t v1 = qword_18208;
    id v2 = *a1;
    if (v1 != -1) {
      swift_once();
    }
    uint64_t v3 = (void *)qword_182B0;
    sub_FE74((NSURL *)&ImageLoader);
    uint64_t v5 = v4;
    [v3 setObject:v2 forKey:v4];

    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      id v6 = v2;
      sub_21F4();
      swift_release();
    }
  }
}

uint64_t sub_2F8C()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable))
  {
    swift_retain();
    sub_FFA4();
    return swift_release();
  }
  return result;
}

void sub_2FE4()
{
  if (!qword_18300)
  {
    sub_3040((uint64_t *)&unk_18308);
    unint64_t v0 = sub_FFF4();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18300);
    }
  }
}

uint64_t sub_3040(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_3088()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_3094()
{
  uint64_t v2 = sub_31A4(&qword_18468);
  sub_3624();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_365C();
  uint64_t v6 = v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader__image;
  sub_31A4((uint64_t *)&unk_18308);
  sub_FFC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v6, v1, v2);
  *(void *)(v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable) = 0;
  return v0;
}

uint64_t sub_3164@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ImageLoader();
  uint64_t result = sub_FFB4();
  *a1 = result;
  return result;
}

uint64_t sub_31A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_31E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_3210()
{
  unint64_t result = qword_18430;
  if (!qword_18430)
  {
    sub_34D8(255, &qword_18420);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18430);
  }
  return result;
}

uint64_t sub_3270(uint64_t a1)
{
  uint64_t v2 = sub_31A4(&qword_183E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_32D0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_3308()
{
  sub_FE94();
  sub_36A8();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = ((((*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  sub_3640();
  v5();
  swift_release();

  return _swift_deallocObject(v0, v4, v3);
}

void sub_33A4(id *a1)
{
  sub_FE94();

  sub_2EA8(a1);
}

uint64_t sub_344C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3494(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_3040(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_34D8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_3514(uint64_t a1, unint64_t a2)
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

uint64_t sub_356C(uint64_t a1, unint64_t a2)
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

uint64_t sub_35C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2180();
  *a1 = result;
  return result;
}

uint64_t sub_35F0(id *a1)
{
  id v1 = *a1;
  return sub_21F4();
}

uint64_t sub_3688()
{
  return sub_31E8(v1, 1, 1, v0);
}

uint64_t initializeBufferWithCopyOfBuffer for ContentDisambiguation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ContentDisambiguation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ContentDisambiguation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ContentDisambiguation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ContentDisambiguation(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ContentDisambiguation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentDisambiguation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentDisambiguation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentDisambiguation()
{
  return &type metadata for ContentDisambiguation;
}

uint64_t sub_3918()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_3934()
{
  qword_18470 = 0x4079A00000000000;
}

uint64_t sub_3948()
{
  uint64_t v1 = sub_10274();
  sub_3AE8(v0, (uint64_t)__src);
  uint64_t v6 = v1;
  uint64_t v7 = 0;
  char v8 = 0;
  uint64_t v9 = __src[0];
  uint64_t v10 = __src[1];
  uint64_t v11 = __src[2];
  uint64_t v12 = __src[3];
  uint64_t v4 = (void *)__src[5];
  long long v14 = *(_OWORD *)&__src[5];
  uint64_t v13 = __src[4];
  uint64_t v15 = __src[7];
  uint64_t v16 = __src[8];
  long long v17 = *(_OWORD *)&__src[9];
  char v18 = __src[11];
  if (qword_18210 != -1) {
    swift_once();
  }
  double v2 = *(double *)&qword_18470;
  sub_10504();
  sub_3C00(0.0, 0, 0.0, 1, INFINITY, 0, 0.0, 0, (uint64_t)__src, 0.0, 1, v2, 0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  memcpy(__dst, __src, sizeof(__dst));
  sub_31A4(&qword_18478);
  sub_3E08();
  sub_103C4();
  return sub_3ED8((uint64_t)__src);
}

uint64_t sub_3AE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_8FA4(v7, (uint64_t *)v12);
  long long v11 = v12[1];
  uint64_t v8 = v13;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v5;
  *(_OWORD *)(a2 + 16) = v12[0];
  *(_OWORD *)(a2 + 32) = v11;
  *(void *)(a2 + 48) = v8;
  *(void *)(a2 + 56) = KeyPath;
  *(void *)(a2 + 64) = v4;
  *(void *)(a2 + 72) = v3;
  *(void *)(a2 + 80) = 0;
  *(unsigned char *)(a2 + 88) = 1;

  return swift_bridgeObjectRetain();
}

uint64_t sub_3B94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_B1A4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_3BC0()
{
  return sub_B1E0();
}

uint64_t sub_3C00@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10684();
    v23 = (void *)sub_102D4();
    sub_FF64();
  }
  sub_10134();
  memcpy((void *)a9, v13, 0x71uLL);
  memcpy((void *)(a9 + 120), __src, 0x70uLL);

  return sub_3F48((uint64_t)v13);
}

uint64_t sub_3DB0()
{
  return sub_103B4();
}

uint64_t sub_3DCC()
{
  return sub_3948();
}

unint64_t sub_3E08()
{
  unint64_t result = qword_18480;
  if (!qword_18480)
  {
    sub_3040(&qword_18478);
    sub_3E84();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18480);
  }
  return result;
}

unint64_t sub_3E84()
{
  unint64_t result = qword_18488;
  if (!qword_18488)
  {
    sub_3040(&qword_18490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18488);
  }
  return result;
}

uint64_t sub_3ED8(uint64_t a1)
{
  double v2 = *(void **)(a1 + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_3F48(uint64_t a1)
{
  double v2 = *(void **)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_retain();
  return a1;
}

uint64_t sub_3FB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_B1A4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_3FE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_4044(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

void destroy for ContentResult(uint64_t a1)
{
  sub_40B0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v2 = *(void **)(a1 + 80);
}

uint64_t sub_40B0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t initializeWithCopy for ContentResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_4044(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  long long v11 = *(void **)(a2 + 80);
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v11;
  return a1;
}

uint64_t assignWithCopy for ContentResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_4044(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_40B0(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v10 = *(void **)(a1 + 80);
  long long v11 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v11;
  id v12 = v11;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

void *initializeWithTake for ContentResult(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for ContentResult(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_40B0(v5, v6, v7);
  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a1 + 80);
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v11;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResult(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentResult()
{
  return &type metadata for ContentResult;
}

uint64_t sub_4388()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_43A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  sub_31A4(&qword_18640);
  sub_8EE8();
  __chkstk_darwin();
  sub_3674();
  v66 = v5;
  uint64_t v65 = sub_10344();
  sub_3624();
  uint64_t v64 = v6;
  __chkstk_darwin();
  sub_3674();
  uint64_t v62 = v7;
  sub_31A4(&qword_18648);
  __chkstk_darwin();
  sub_364C();
  uint64_t v10 = v9 - v8;
  uint64_t v59 = sub_31A4(&qword_18650);
  sub_8EE8();
  __chkstk_darwin();
  sub_365C();
  uint64_t v61 = sub_31A4(&qword_18658);
  sub_8EE8();
  __chkstk_darwin();
  sub_3674();
  uint64_t v63 = v11;
  uint64_t v60 = sub_31A4(&qword_18660);
  sub_8EE8();
  __chkstk_darwin();
  sub_3674();
  uint64_t v68 = v12;
  uint64_t v13 = sub_31A4(&qword_18668);
  sub_8EE8();
  __chkstk_darwin();
  sub_3674();
  uint64_t v67 = v14;
  uint64_t v15 = sub_31A4(&qword_18670);
  sub_3624();
  uint64_t v17 = v16;
  __chkstk_darwin();
  sub_364C();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = *(void **)(v1 + 72);
  if (v21)
  {
    id v22 = v21;
    uint64_t v74 = *(void *)sub_FF34();
    swift_bridgeObjectRetain();
    sub_10774();
    uint64_t v23 = sub_105A4();

    sub_91D4((uint64_t)v75, v23, &v76);
    swift_bridgeObjectRelease();
    sub_873C((uint64_t)v75);
    uint64_t v72 = v15;
    uint64_t v73 = a1;
    uint64_t v70 = v20;
    uint64_t v71 = v17;
    uint64_t v69 = v13;
    if (v77)
    {
      if (swift_dynamicCast())
      {
        if (v74)
        {
          uint64_t v24 = *(void *)v3;
          char v25 = *(unsigned char *)(v3 + 8);
          sub_7B38(*(void *)v3, v25);
          char v26 = sub_7098(v24, v25);
          sub_7B44(v24, v25);
          double v27 = 0.0;
          if ((v26 & 1) == 0) {
            goto LABEL_9;
          }
        }
      }
    }
    else
    {
      sub_8C64((uint64_t)&v76, &qword_18678);
    }
    double v27 = 1.0;
LABEL_9:
    uint64_t v28 = *(void *)(v3 + 24);
    v75[0] = *(void *)(v3 + 16);
    v75[1] = v28;
    sub_7E4C();
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_10374();
    uint64_t v31 = v30;
    char v33 = v32 & 1;
    sub_10314();
    uint64_t v34 = sub_10304();
    sub_31E8(v10, 1, 1, v34);
    sub_10324();
    sub_8C64(v10, &qword_18648);
    uint64_t v56 = sub_10364();
    uint64_t v36 = v35;
    uint64_t v58 = v3;
    char v38 = v37;
    uint64_t v57 = v39;
    swift_release();
    char v40 = v38 & 1;
    sub_8790(v29, v31, v33);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v42 = swift_getKeyPath();
    (*(void (**)(uint64_t, void, uint64_t))(v64 + 104))(v62, enum case for Text.TruncationMode.tail(_:), v65);
    uint64_t v43 = swift_getKeyPath();
    sub_8F54();
    v44();
    uint64_t *v66 = v43;
    sub_8878((uint64_t)v66, v2 + *(int *)(v59 + 36), &qword_18640);
    *(void *)uint64_t v2 = v56;
    *(void *)(v2 + 8) = v36;
    *(unsigned char *)(v2 + 16) = v40;
    *(void *)(v2 + 24) = v57;
    *(void *)(v2 + 32) = KeyPath;
    *(void *)(v2 + 40) = 2;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = v42;
    *(unsigned char *)(v2 + 64) = 1;
    sub_8860(v56, v36, v40);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_8C64((uint64_t)v66, &qword_18640);
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v62, v65);
    sub_8790(v56, v36, v40);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v45 = sub_10404();
    uint64_t v46 = swift_getKeyPath();
    sub_8878(v2, v63, &qword_18650);
    uint64_t v47 = (uint64_t *)(v63 + *(int *)(v61 + 36));
    *uint64_t v47 = v46;
    v47[1] = v45;
    sub_8C64(v2, &qword_18650);
    sub_8878(v63, v68, &qword_18658);
    *(double *)(v68 + *(int *)(v60 + 36)) = v27;
    sub_8C64(v63, &qword_18658);
    uint64_t v48 = sub_10524();
    uint64_t v49 = *(void *)v58;
    char v50 = *(unsigned char *)(v58 + 8);
    sub_7B38(*(void *)v58, v50);
    LOBYTE(v43) = sub_7098(v49, v50);
    sub_7B44(v49, v50);
    sub_8878(v68, v67, &qword_18660);
    uint64_t v51 = v67 + *(int *)(v69 + 36);
    *(void *)uint64_t v51 = v48;
    *(unsigned char *)(v51 + 8) = v43 & 1;
    sub_8C64(v68, &qword_18660);
    sub_88C8();
    sub_103C4();
    sub_8C64(v67, &qword_18668);
    sub_7B38(v49, v50);
    LOBYTE(v48) = sub_7098(v49, v50);
    sub_7B44(v49, v50);
    uint64_t v52 = swift_allocObject();
    memcpy((void *)(v52 + 16), (const void *)v58, 0x58uLL);
    sub_8F54();
    v53();
    uint64_t v54 = v73 + *(int *)(sub_31A4(&qword_186F8) + 36);
    *(unsigned char *)uint64_t v54 = v48 & 1;
    *(void *)(v54 + 8) = sub_8D10;
    *(void *)(v54 + 16) = v52;
    sub_8D18(v58);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
  }
  sub_105D4();
  sub_86F4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_8F84();
  __break(1u);
  return result;
}

void sub_4BE4(unsigned char *a1, uint64_t a2)
{
  if (*a1 == 1)
  {
    uint64_t v3 = *(void **)(a2 + 72);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = (uint64_t *)sub_FF24();
      uint64_t v7 = *v5;
      uint64_t v6 = v5[1];
      v11[0] = v7;
      v11[1] = v6;
      swift_bridgeObjectRetain();
      sub_10774();
      uint64_t v8 = *(void *)(a2 + 64);
      v11[3] = &type metadata for Int;
      v11[0] = v8;
      uint64_t v9 = (void (*)(unsigned char *, void))sub_10594();
      sub_9238((uint64_t)v11, (uint64_t)v12);
      v9(v10, 0);
    }
    else
    {
      sub_105D4();
      sub_86F4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
      sub_10144();
      __break(1u);
    }
  }
}

uint64_t sub_4D08@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_43A4(a1);
}

uint64_t sub_4D4C()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_31A4(&qword_184D0);
  sub_3624();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_364C();
  uint64_t v9 = v8 - v7;
  uint64_t v24 = sub_31A4(&qword_184D8);
  sub_3624();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_364C();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_31A4(&qword_184E0);
  sub_8EE8();
  __chkstk_darwin(v17);
  sub_8F3C();
  uint64_t v18 = swift_allocObject();
  memcpy((void *)(v18 + 16), v2, 0x60uLL);
  sub_6BA4((uint64_t)v2);
  sub_31A4(&qword_184E8);
  sub_6C14();
  sub_10484();
  swift_getKeyPath();
  sub_3494(&qword_18508, &qword_184D0);
  sub_773C();
  sub_103A4();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
  uint64_t v19 = sub_103F4();
  char v20 = sub_102F4();
  sub_8F54();
  v21();
  uint64_t v22 = v1 + *(int *)(v16 + 36);
  *(void *)uint64_t v22 = v19;
  *(unsigned char *)(v22 + 8) = v20;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v24);
  sub_7788();
  sub_103C4();
  return sub_8C64(v1, &qword_184E0);
}

uint64_t sub_4FFC()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_FF84();
  sub_3624();
  uint64_t v5 = v4;
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v57 - v9;
  uint64_t v11 = sub_FEE4();
  sub_3624();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_8F3C();
  uint64_t v15 = *(void *)(v0 + 48);
  uint64_t v63 = *(void *)(v0 + 40);
  unint64_t v64 = v15;
  uint64_t v16 = sub_6574(v63, v15);
  if (v17 >> 60 != 15)
  {
    uint64_t v59 = v10;
    uint64_t v60 = v3;
    uint64_t v61 = v16;
    unint64_t v62 = v17;
    uint64_t v65 = v5;
    uint64_t v18 = sub_8F60();
    sub_4044(v18, v19, v20);
    uint64_t v21 = sub_8F60();
    uint64_t v24 = sub_729C(v21, v22, v23);
    uint64_t v26 = v25;
    uint64_t v27 = sub_8F60();
    sub_40B0(v27, v28, v29);
    if (v26)
    {
      id v30 = [objc_allocWithZone((Class)SARemoteDevice) init];
      sub_7FF0(v24, v26, v30, (SEL *)&selRef_setAssistantId_);
      id v31 = [objc_allocWithZone((Class)SAExecuteOnRemoteRequest) init];
      sub_FED4();
      uint64_t v32 = sub_FEC4();
      uint64_t v34 = v33;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
      sub_7FF0(v32, v34, v31, (SEL *)&selRef_setAceId_);

      [v31 setRemoteDevice:v30];
      sub_805C(v61, v62, v31);
      if (qword_18290 != -1) {
        swift_once();
      }
      uint64_t v35 = v60;
      sub_7E98(v60, (uint64_t)qword_19398);
      uint64_t v36 = v65;
      char v37 = v59;
      sub_8F54();
      v38();
      sub_6BA4(v2);
      uint64_t v39 = sub_FF74();
      os_log_type_t v40 = sub_10664();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        id v58 = v30;
        uint64_t v66 = v42;
        *(_DWORD *)uint64_t v41 = 136315138;
        v57[1] = v41 + 4;
        unint64_t v43 = v64;
        swift_bridgeObjectRetain();
        uint64_t v44 = sub_F4AC(v63, v43, &v66);
        sub_8EF8(v44);
        sub_10714();
        swift_bridgeObjectRelease();
        sub_7BE0(v2);
        _os_log_impl(&dword_0, v39, v40, "Sending Direct Invocation command for item: %s", v41, 0xCu);
        swift_arrayDestroy();
        id v30 = v58;
        sub_8F0C();
        sub_8F0C();

        sub_3640();
        v45();
      }
      else
      {
        sub_7BE0(v2);

        (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v35);
      }
      uint64_t v54 = *(void **)(v2 + 80);
      if (v54)
      {
        id v55 = v31;
        id v56 = v54;
        sub_105C4();

        return sub_7ED0(v61, v62);
      }
      else
      {
        sub_105D4();
        sub_86F4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
        uint64_t result = sub_8F84();
        __break(1u);
      }
      return result;
    }
    sub_7ED0(v61, v62);
    uint64_t v3 = v60;
    uint64_t v5 = v65;
  }
  if (qword_18290 != -1) {
    swift_once();
  }
  sub_7E98(v3, (uint64_t)qword_19398);
  sub_8F54();
  v46();
  sub_6BA4(v2);
  uint64_t v47 = sub_FF74();
  os_log_type_t v48 = sub_10674();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    uint64_t v65 = v5;
    *(_DWORD *)uint64_t v49 = 136315138;
    unint64_t v50 = v64;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_F4AC(v63, v50, &v66);
    sub_8EF8(v51);
    sub_10714();
    swift_bridgeObjectRelease();
    sub_7BE0(v2);
    _os_log_impl(&dword_0, v47, v48, "Error while creating direct invocation command from item: %s", v49, 0xCu);
    swift_arrayDestroy();
    sub_8F0C();
    sub_8F0C();

    sub_3640();
    return v52();
  }
  else
  {
    sub_7BE0(v2);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
}

uint64_t sub_55D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_31A4(&qword_18500);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_18218 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_18498;
  *(void *)uint64_t v6 = sub_10274();
  *((void *)v6 + 1) = v7;
  v6[16] = 0;
  uint64_t v8 = sub_31A4(&qword_18530);
  sub_578C(a1, &v6[*(int *)(v8 + 44)]);
  if (qword_18230 != -1) {
    swift_once();
  }
  if (qword_18238 != -1) {
    swift_once();
  }
  sub_10504();
  sub_100B4();
  sub_8878((uint64_t)v6, a2, &qword_18500);
  uint64_t v9 = (_OWORD *)(a2 + *(int *)(sub_31A4(&qword_184E8) + 36));
  long long v10 = v12[1];
  *uint64_t v9 = v12[0];
  v9[1] = v10;
  v9[2] = v12[2];
  return sub_8C64((uint64_t)v6, &qword_18500);
}

uint64_t sub_578C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  os_log_type_t v40 = a2;
  uint64_t v3 = sub_31A4(&qword_18538);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_31A4(&qword_18540);
  uint64_t v41 = v6;
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  long long v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  sub_5AD4(a1, (uint64_t)v5);
  sub_789C();
  sub_103C4();
  sub_8C64((uint64_t)v5, &qword_18538);
  uint64_t v13 = (void (*)(char *, char *, uint64_t))v7[4];
  uint64_t v14 = v12;
  uint64_t v34 = v12;
  v13(v12, v10, v6);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v33 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v38 = *(void *)(a1 + 40);
  uint64_t v39 = v15;
  int v37 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v36 = *(void *)(a1 + 72);
  uint64_t KeyPath = swift_getKeyPath();
  sub_105D4();
  sub_86F4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = (void *)sub_10154();
  uint64_t v20 = v19;
  uint64_t v21 = (void (*)(char *, char *, uint64_t))v7[2];
  uint64_t v22 = v41;
  v21(v10, v14, v41);
  char v23 = v40;
  v21(v40, v10, v22);
  uint64_t v24 = &v23[*(int *)(sub_31A4(&qword_185B0) + 48)];
  uint64_t v25 = KeyPath;
  *(void *)uint64_t v24 = KeyPath;
  v24[8] = 0;
  uint64_t v26 = v33;
  *((void *)v24 + 2) = v39;
  *((void *)v24 + 3) = v26;
  *((void *)v24 + 4) = v38;
  *((void *)v24 + 5) = v16;
  v24[48] = v37;
  uint64_t v27 = v36;
  *((void *)v24 + 7) = v17;
  *((void *)v24 + 8) = v27;
  *((void *)v24 + 9) = v18;
  *((void *)v24 + 10) = v20;
  sub_7B38(v25, 0);
  uint64_t v28 = (void (*)(char *, uint64_t))v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v29 = v18;
  uint64_t v30 = v41;
  v28(v34, v41);
  sub_7B44(v25, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v28)(v10, v30);
}

uint64_t sub_5AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v43 = sub_10124();
  __chkstk_darwin(v43);
  uint64_t v45 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_31A4(&qword_18578);
  __chkstk_darwin(v42);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_31A4(&qword_18568);
  uint64_t v6 = __chkstk_darwin(v50);
  uint64_t v44 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v46 = (uint64_t)&v41 - v8;
  uint64_t v47 = sub_31A4(&qword_185B8);
  __chkstk_darwin(v47);
  long long v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_31A4(&qword_185C0);
  uint64_t v11 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_31A4(&qword_185C8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_FE94();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void **)(a1 + 80);
  if (v21)
  {
    id v22 = v21;
    sub_105B4();

    sub_6148(*(void *)(a1 + 64), (uint64_t)v16, 1000.0, 679.0);
    if (sub_7B50((uint64_t)v16, 1, v17) == 1)
    {
      sub_8C64((uint64_t)v16, &qword_185C8);
      sub_62BC();
      uint64_t v23 = v48;
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v10, v13, v48);
      swift_storeEnumTagMultiPayload();
      sub_79C8();
      uint64_t v24 = sub_3040(&qword_18590);
      unint64_t v25 = sub_7A8C();
      uint64_t v51 = v24;
      unint64_t v52 = v25;
      swift_getOpaqueTypeConformance2();
      sub_10284();
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v23);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(&v5[*(int *)(v42 + 40)], v20, v17);
      *(void *)uint64_t v5 = sub_BD30;
      *((void *)v5 + 1) = 0;
      v5[16] = 0;
      sub_6BA4(a1);
      sub_62BC();
      uint64_t v27 = v45;
      uint64_t v28 = &v45[*(int *)(v43 + 20)];
      uint64_t v29 = enum case for RoundedCornerStyle.continuous(_:);
      uint64_t v30 = sub_10264();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v28, v29, v30);
      __asm { FMOV            V0.2D, #15.0 }
      *uint64_t v27 = _Q0;
      uint64_t v36 = (uint64_t)v44;
      uint64_t v37 = (uint64_t)&v44[*(int *)(v50 + 36)];
      sub_7D0C((uint64_t)v27, v37, (void (*)(void))&type metadata accessor for RoundedRectangle);
      *(_WORD *)(v37 + *(int *)(sub_31A4(&qword_18588) + 36)) = 256;
      sub_8878((uint64_t)v5, v36, &qword_18578);
      sub_7D60((uint64_t)v27, (void (*)(void))&type metadata accessor for RoundedRectangle);
      sub_8C64((uint64_t)v5, &qword_18578);
      uint64_t v38 = v46;
      sub_7B78(v36, v46);
      sub_8878(v38, (uint64_t)v10, &qword_18568);
      swift_storeEnumTagMultiPayload();
      sub_79C8();
      uint64_t v39 = sub_3040(&qword_18590);
      unint64_t v40 = sub_7A8C();
      uint64_t v51 = v39;
      unint64_t v52 = v40;
      swift_getOpaqueTypeConformance2();
      sub_10284();
      sub_8C64(v38, &qword_18568);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      return sub_7BE0(a1);
    }
  }
  else
  {
    sub_105D4();
    sub_86F4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_10144();
    __break(1u);
  }
  return result;
}

uint64_t sub_6148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_7DB4();
    uint64_t v9 = a1 + 48;
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_10634();
      sub_10634();
      if (v13 == v12) {
        break;
      }
      v9 += 40;
      swift_bridgeObjectRelease();
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_18240 != -1) {
      swift_once();
    }
    sub_6850(*(uint64_t *)algn_184C8, a2, a3, a4);
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    uint64_t v10 = sub_FE94();
    return sub_31E8(a2, 1, 1, v10);
  }
}

uint64_t sub_62BC()
{
  uint64_t v3 = type metadata accessor for PlaceHolder();
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  sub_365C();
  uint64_t v5 = sub_31A4(&qword_18590);
  sub_8EE8();
  __chkstk_darwin(v6);
  sub_8F24();
  long long v7 = *(_OWORD *)(v0 + 40);
  long long v12 = *(_OWORD *)(v0 + 24);
  long long v13 = v7;
  uint64_t v8 = *(void *)(v0 + 64);
  uint64_t v14 = *(void *)(v0 + 56);
  uint64_t v15 = v8;
  long long v16 = v7;
  long long v17 = v12;
  *(void *)(v1 + *(int *)(v4 + 28)) = swift_getKeyPath();
  sub_31A4(&qword_185D0);
  swift_storeEnumTagMultiPayload();
  long long v9 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = v9;
  *(void *)(v1 + 32) = *(void *)(v0 + 56);
  *(void *)(v1 + 40) = v8;
  sub_7CB4((uint64_t)&v17);
  sub_7CB4((uint64_t)&v16);
  sub_7CE0((uint64_t)&v15);
  if (qword_18220 != -1) {
    swift_once();
  }
  if (qword_18228 != -1) {
    swift_once();
  }
  sub_10504();
  sub_10134();
  sub_7D0C(v1, v2, (void (*)(void))type metadata accessor for PlaceHolder);
  memcpy((void *)(v2 + *(int *)(v5 + 36)), __src, 0x70uLL);
  sub_7D60(v1, (void (*)(void))type metadata accessor for PlaceHolder);
  sub_7A8C();
  sub_103C4();
  return sub_8C64(v2, &qword_18590);
}

uint64_t sub_6574(uint64_t a1, uint64_t a2)
{
  sub_31A4(&qword_185F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_12540;
  v18[0] = (id)0x696669746E656469;
  v18[1] = (id)0xEA00000000007265;
  sub_10774();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  sub_105E4();
  uint64_t v5 = (void *)sub_106F4();
  swift_bridgeObjectRelease();
  id v6 = [objc_allocWithZone((Class)SKIDirectInvocationContext) init];
  [v6 setInputOrigin:SAInputOriginDialogButtonTapValue];
  [v6 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
  long long v7 = self;
  id v8 = [v7 runSiriKitExecutorCommandWithContext:v6 payload:v5];
  id v9 = [v7 wrapCommandInStartLocalRequest:v8];
  id v10 = [objc_allocWithZone((Class)SAStartUIRequest) init];
  [v10 setStartLocalRequest:v9];
  id v11 = [v10 dictionary];
  if (!v11)
  {

LABEL_6:
    return 0;
  }
  long long v12 = v11;
  v18[0] = 0;
  id v13 = [self dataWithPropertyList:v11 format:200 options:0 error:v18];
  id v14 = v18[0];
  if (!v13)
  {
    long long v16 = v14;
    sub_FE64();

    swift_willThrow();
    swift_errorRelease();
    goto LABEL_6;
  }
  uint64_t v15 = sub_FEB4();

  return v15;
}

uint64_t sub_6850@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  if (a1)
  {
    sub_31A4(&qword_185E0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_12540;
    *(void *)(v7 + 56) = &type metadata for CGFloat;
    unint64_t v8 = sub_7E00();
    *(void *)(v7 + 64) = v8;
    *(double *)(v7 + 32) = a3;
    sub_10604();
    sub_7E4C();
    sub_10734();
    swift_bridgeObjectRelease();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_12540;
    *(void *)(v9 + 56) = &type metadata for CGFloat;
    *(void *)(v9 + 64) = v8;
    *(double *)(v9 + 32) = a4;
    sub_10604();
    sub_10734();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10734();
    swift_bridgeObjectRelease();
    sub_FE84();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = sub_FE94();
    return sub_31E8(a2, 1, 1, v11);
  }
}

uint64_t sub_6AD8()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_4D4C();
}

uint64_t sub_6B1C()
{
  sub_40B0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_6B78()
{
  return sub_4FFC();
}

uint64_t sub_6B9C@<X0>(uint64_t a1@<X8>)
{
  return sub_55D4(*(void *)(v1 + 16), a1);
}

uint64_t sub_6BA4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  sub_4044(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_6C14()
{
  unint64_t result = qword_184F0;
  if (!qword_184F0)
  {
    sub_3040(&qword_184E8);
    sub_3494(&qword_184F8, &qword_18500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_184F0);
  }
  return result;
}

void sub_6CB4()
{
  qword_18498 = 0x4024000000000000;
}

void sub_6CC4()
{
  qword_184A0 = 0x4075900000000000;
}

void sub_6CD8()
{
  qword_184A8 = 0x4068200000000000;
}

void sub_6CEC()
{
  qword_184B0 = 0x4075A00000000000;
}

void sub_6D00()
{
  qword_184B8 = 0x406D600000000000;
}

void sub_6D14()
{
  qword_184C0 = 7496556;
  *(void *)algn_184C8 = 0xE300000000000000;
}

uint64_t sub_6D30@<X0>(uint64_t a1@<X1>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v30 = a3;
  char v4 = a2 & 1;
  uint64_t v5 = sub_102A4();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_31A4(&qword_18600);
  __chkstk_darwin(v27);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_31A4(&qword_18608);
  __chkstk_darwin(v29);
  long long v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_31A4(&qword_18610);
  uint64_t v13 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_102B4();
  double v16 = 1.0;
  if ((sub_102C4() & 1) == 0)
  {
    sub_7B38(a1, v4);
    char v17 = sub_7098(a1, v4);
    sub_7B44(a1, v4);
    if (v17) {
      double v16 = 1.2;
    }
    else {
      double v16 = 1.0;
    }
  }
  sub_10554();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v5);
  id v22 = &v10[*(int *)(v27 + 36)];
  *(double *)id v22 = v16;
  *((double *)v22 + 1) = v16;
  *((void *)v22 + 2) = v19;
  *((void *)v22 + 3) = v21;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v23 = sub_10524();
  sub_7B38(a1, v4);
  char v24 = sub_7098(a1, v4);
  sub_7B44(a1, v4);
  sub_8878((uint64_t)v10, (uint64_t)v12, &qword_18600);
  unint64_t v25 = &v12[*(int *)(v29 + 36)];
  *(void *)unint64_t v25 = v23;
  v25[8] = v24 & 1;
  sub_8C64((uint64_t)v10, &qword_18600);
  sub_85A8();
  sub_103C4();
  sub_8C64((uint64_t)v12, &qword_18608);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(v30, v15, v28);
}

uint64_t sub_708C@<X0>(uint64_t a1@<X8>)
{
  return sub_6D30(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_7098(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10224();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_10684();
  uint64_t v9 = sub_102D4();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_F4AC(1819242306, 0xE400000000000000, &v14);
    sub_10714();
    _os_log_impl(&dword_0, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10214();
  swift_getAtKeyPath();
  sub_7B44(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_729C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_10224();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = sub_10684();
    uint64_t v11 = sub_102D4();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      v15[0] = v13 + 4;
      v15[1] = sub_F4AC(0xD000000000000010, 0x8000000000013250, &v16);
      sub_10714();
      _os_log_impl(&dword_0, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10214();
    swift_getAtKeyPath();
    sub_40B0(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v16;
  }
  return a1;
}

uint64_t sub_74C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_10224();
  sub_3624();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_365C();
  sub_31A4(&qword_185D0);
  sub_8EE8();
  __chkstk_darwin(v10);
  sub_8F24();
  sub_8878(v4, v3, &qword_185D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10084();
    sub_8EE8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 32))(a1, v3);
  }
  else
  {
    os_log_type_t v13 = sub_10684();
    uint64_t v14 = sub_102D4();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v17 = sub_F4AC(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      sub_8EF8(v17);
      sub_10714();
      _os_log_impl(&dword_0, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      sub_8F0C();
      sub_8F0C();
    }

    sub_10214();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v2, v6);
  }
}

uint64_t sub_770C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_101E4();
  *a1 = result & 1;
  return result;
}

unint64_t sub_773C()
{
  unint64_t result = qword_18510;
  if (!qword_18510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18510);
  }
  return result;
}

unint64_t sub_7788()
{
  unint64_t result = qword_18518;
  if (!qword_18518)
  {
    sub_3040(&qword_184E0);
    sub_3040(&qword_184D0);
    sub_3494(&qword_18508, &qword_184D0);
    sub_773C();
    swift_getOpaqueTypeConformance2();
    sub_3494(&qword_18520, &qword_18528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18518);
  }
  return result;
}

unint64_t sub_789C()
{
  unint64_t result = qword_18548;
  if (!qword_18548)
  {
    sub_3040(&qword_18538);
    sub_7910();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18548);
  }
  return result;
}

unint64_t sub_7910()
{
  unint64_t result = qword_18550;
  if (!qword_18550)
  {
    sub_3040(&qword_18558);
    sub_79C8();
    sub_3040(&qword_18590);
    sub_7A8C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18550);
  }
  return result;
}

unint64_t sub_79C8()
{
  unint64_t result = qword_18560;
  if (!qword_18560)
  {
    sub_3040(&qword_18568);
    sub_3494(&qword_18570, &qword_18578);
    sub_3494(&qword_18580, &qword_18588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18560);
  }
  return result;
}

unint64_t sub_7A8C()
{
  unint64_t result = qword_18598;
  if (!qword_18598)
  {
    sub_3040(&qword_18590);
    sub_86F4(&qword_185A0, (void (*)(uint64_t))type metadata accessor for PlaceHolder);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18598);
  }
  return result;
}

uint64_t sub_7B38(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_7B44(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_7B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_7B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_31A4(&qword_18568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_7BE0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  sub_40B0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_7C50()
{
  return sub_10164();
}

uint64_t sub_7C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_7F48(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_7CB4(uint64_t a1)
{
  return a1;
}

uint64_t sub_7CE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_7D0C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_8EE8();
  uint64_t v4 = sub_8F70();
  v5(v4);
  return a2;
}

uint64_t sub_7D60(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_8EE8();
  sub_3640();
  v3();
  return a1;
}

unint64_t sub_7DB4()
{
  unint64_t result = qword_185D8;
  if (!qword_185D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185D8);
  }
  return result;
}

unint64_t sub_7E00()
{
  unint64_t result = qword_185E8;
  if (!qword_185E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185E8);
  }
  return result;
}

unint64_t sub_7E4C()
{
  unint64_t result = qword_185F0;
  if (!qword_185F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185F0);
  }
  return result;
}

uint64_t sub_7E98(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_7ED0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_356C(a1, a2);
  }
  return a1;
}

uint64_t sub_7EE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_101F4();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_7F18()
{
  return sub_10204();
}

uint64_t sub_7F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  sub_3624();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

void sub_7FF0(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6 = sub_105F4();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void sub_805C(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_FEA4().super.isa;
  [a3 setSerializedCommand:isa];
}

uint64_t initializeBufferWithCopyOfBuffer for ContentResultStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_7B38(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for ContentResultStyle(uint64_t a1)
{
  return sub_7B44(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for ContentResultStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_7B38(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_7B44(v5, v6);
  return a1;
}

uint64_t initializeWithTake for ContentResultStyle(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ContentResultStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_7B44(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResultStyle(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentResultStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentResultStyle()
{
  return &type metadata for ContentResultStyle;
}

void destroy for ContentResultTextView(uint64_t a1)
{
  sub_7B44(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v2 = *(void **)(a1 + 72);
}

uint64_t initializeWithCopy for ContentResultTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_7B38(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v10 = *(void **)(a2 + 72);
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v10;
  return a1;
}

uint64_t assignWithCopy for ContentResultTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_7B38(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_7B44(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = *(void **)(a1 + 72);
  uint64_t v9 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v9;
  id v10 = v9;

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

void *initializeWithTake for ContentResultTextView(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for ContentResultTextView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_7B44(v6, v7);
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a1 + 72);
  uint64_t v11 = a2[9];
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = v11;

  *(void *)(a1 + 80) = a2[10];
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResultTextView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentResultTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentResultTextView()
{
  return &type metadata for ContentResultTextView;
}

uint64_t sub_8550(uint64_t a1)
{
  return sub_8DA4(a1, &qword_184E0, (void (*)(void))sub_7788);
}

uint64_t sub_8570()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_858C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_85A8()
{
  unint64_t result = qword_18618;
  if (!qword_18618)
  {
    sub_3040(&qword_18608);
    sub_8648();
    sub_3494(&qword_18630, &qword_18638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18618);
  }
  return result;
}

unint64_t sub_8648()
{
  unint64_t result = qword_18620;
  if (!qword_18620)
  {
    sub_3040(&qword_18600);
    sub_86F4(&qword_18628, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18620);
  }
  return result;
}

uint64_t sub_86F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_873C(uint64_t a1)
{
  return a1;
}

uint64_t sub_8790(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_87A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_101A4();
  *a1 = result;
  return result;
}

uint64_t sub_87D4()
{
  return sub_101B4();
}

uint64_t sub_87FC()
{
  return sub_10174();
}

uint64_t sub_8820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_7F48(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Text.TruncationMode, (uint64_t (*)(char *))&EnvironmentValues.truncationMode.setter);
}

uint64_t sub_8860(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_8878(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_31A4(a3);
  sub_8EE8();
  uint64_t v4 = sub_8F70();
  v5(v4);
  return a2;
}

unint64_t sub_88C8()
{
  unint64_t result = qword_18680;
  if (!qword_18680)
  {
    sub_3040(&qword_18668);
    sub_8968();
    sub_3494(&qword_18630, &qword_18638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18680);
  }
  return result;
}

unint64_t sub_8968()
{
  unint64_t result = qword_18688;
  if (!qword_18688)
  {
    sub_3040(&qword_18660);
    sub_89E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18688);
  }
  return result;
}

unint64_t sub_89E4()
{
  unint64_t result = qword_18690;
  if (!qword_18690)
  {
    sub_3040(&qword_18658);
    sub_8A84();
    sub_3494(&qword_186E8, &qword_186F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18690);
  }
  return result;
}

unint64_t sub_8A84()
{
  unint64_t result = qword_18698;
  if (!qword_18698)
  {
    sub_3040(&qword_18650);
    sub_8B24();
    sub_3494(&qword_186E0, &qword_18640);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18698);
  }
  return result;
}

unint64_t sub_8B24()
{
  unint64_t result = qword_186A0;
  if (!qword_186A0)
  {
    sub_3040(&qword_186A8);
    sub_8BC4();
    sub_3494(&qword_186D0, &qword_186D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_186A0);
  }
  return result;
}

unint64_t sub_8BC4()
{
  unint64_t result = qword_186B0;
  if (!qword_186B0)
  {
    sub_3040(&qword_186B8);
    sub_3494(&qword_186C0, &qword_186C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_186B0);
  }
  return result;
}

uint64_t sub_8C64(uint64_t a1, uint64_t *a2)
{
  sub_31A4(a2);
  sub_8EE8();
  sub_3640();
  v3();
  return a1;
}

uint64_t sub_8CB4()
{
  sub_7B44(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 104, 7);
}

void sub_8D10(unsigned char *a1)
{
  sub_4BE4(a1, v1 + 16);
}

uint64_t sub_8D18(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 72);
  sub_7B38(*(void *)a1, *(unsigned char *)(a1 + 8));
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_8D84(uint64_t a1)
{
  return sub_8DA4(a1, &qword_18608, (void (*)(void))sub_85A8);
}

uint64_t sub_8DA4(uint64_t a1, uint64_t *a2, void (*a3)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_8E08()
{
  unint64_t result = qword_18700;
  if (!qword_18700)
  {
    sub_3040(&qword_186F8);
    sub_3040(&qword_18668);
    sub_88C8();
    swift_getOpaqueTypeConformance2();
    sub_3494(&qword_18708, &qword_18710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18700);
  }
  return result;
}

uint64_t sub_8EF8(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_8F0C()
{
  return swift_slowDealloc();
}

uint64_t sub_8F60()
{
  return v0;
}

uint64_t sub_8F70()
{
  return v0;
}

uint64_t sub_8F84()
{
  return sub_10144();
}

uint64_t sub_8FA4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_104D4();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  char v7 = (uint64_t *)((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_31A4(&qword_18730);
  uint64_t v8 = sub_104E4();
  sub_B184(v8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_12540;
  if (qword_18248 != -1) {
    swift_once();
  }
  *char v7 = qword_18718;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for GridItem.Size.fixed(_:), v4);
  if (qword_18250 != -1) {
    swift_once();
  }
  sub_10514();
  sub_104F4();
  sub_105D4();
  sub_AFA4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_10154();
  *a2 = v9;
  a2[1] = a1;
  a2[2] = 0;
  a2[3] = result;
  a2[4] = v11;
  return result;
}

double sub_91D4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_AA70(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_B0EC(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_9238(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_ACAC((_OWORD *)a1, v4);
    sub_ACBC(v4, a2);
    return sub_873C(a2);
  }
  else
  {
    sub_A9EC(a1, &qword_18678);
    sub_AB7C(a2, v4);
    sub_873C(a2);
    return sub_A9EC((uint64_t)v4, &qword_18678);
  }
}

uint64_t sub_92C0@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 24);
  if (v4)
  {
    id v5 = v4;
    char v6 = (uint64_t *)sub_FF14();
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    *(void *)&long long v18 = v8;
    *((void *)&v18 + 1) = v7;
    swift_bridgeObjectRetain();
    sub_10774();
    uint64_t v9 = sub_105A4();

    sub_91D4((uint64_t)v17, v9, &v18);
    swift_bridgeObjectRelease();
    sub_873C((uint64_t)v17);
    if (v19)
    {
      if (swift_dynamicCast())
      {
        uint64_t v10 = v16;
LABEL_7:
        uint64_t v11 = *(void *)(v2 + 8);
        v17[0] = *(void *)v2;
        *(void *)&long long v18 = v11;
        uint64_t v12 = swift_allocObject();
        long long v13 = *(_OWORD *)(v2 + 16);
        *(_OWORD *)(v12 + 16) = *(_OWORD *)v2;
        *(_OWORD *)(v12 + 32) = v13;
        *(void *)(v12 + 48) = *(void *)(v2 + 32);
        *(void *)(v12 + 56) = v10;
        *a1 = sub_A800;
        a1[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v12;
        id v14 = v5;
        sub_7CE0((uint64_t)v17);
        return sub_7CE0((uint64_t)&v18);
      }
    }
    else
    {
      sub_A9EC((uint64_t)&v18, &qword_18678);
    }
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  sub_105D4();
  sub_AFA4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = sub_10144();
  __break(1u);
  return result;
}

uint64_t sub_945C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v52 = a3;
  uint64_t v47 = a1;
  uint64_t v51 = a4;
  uint64_t v50 = sub_10114();
  uint64_t v49 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v46 = v5;
  uint64_t v48 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_31A4(&qword_18738);
  uint64_t v6 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_31A4(&qword_18740);
  uint64_t v9 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_31A4(&qword_18748);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  os_log_type_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_31A4(&qword_18750);
  __chkstk_darwin(v42);
  uint64_t v44 = (uint64_t)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_31A4(&qword_18758);
  __chkstk_darwin(v43);
  uint64_t v45 = (uint64_t)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_102E4();
  v53 = a2;
  sub_31A4(&qword_18760);
  sub_3494(&qword_18768, &qword_18760);
  sub_10064();
  sub_3494(&qword_18770, &qword_18738);
  uint64_t v18 = v40;
  sub_103C4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);
  uint64_t v19 = sub_103F4();
  LOBYTE(v18) = sub_102F4();
  uint64_t v20 = v41;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v41);
  uint64_t v21 = &v15[*(int *)(v13 + 44)];
  *(void *)uint64_t v21 = v19;
  v21[8] = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  if (qword_18248 != -1) {
    swift_once();
  }
  sub_10504();
  sub_10134();
  uint64_t v22 = v44;
  sub_A990((uint64_t)v15, v44, &qword_18748);
  memcpy((void *)(v22 + *(int *)(v42 + 36)), __src, 0x70uLL);
  sub_A9EC((uint64_t)v15, &qword_18748);
  uint64_t v23 = *a2;
  uint64_t v56 = a2[1];
  uint64_t v57 = v23;
  long long v55 = *(_OWORD *)(a2 + 3);
  uint64_t v24 = swift_allocObject();
  long long v25 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v24 + 32) = v25;
  *(void *)(v24 + 48) = a2[4];
  uint64_t v26 = v45;
  sub_A990(v22, v45, &qword_18750);
  uint64_t v27 = (void (**)())(v26 + *(int *)(v43 + 36));
  *uint64_t v27 = sub_A818;
  v27[1] = (void (*)())v24;
  v27[2] = 0;
  v27[3] = 0;
  sub_7CE0((uint64_t)&v57);
  sub_7CE0((uint64_t)&v56);
  sub_A83C((id *)&v55);
  sub_A9EC(v22, &qword_18750);
  uint64_t v28 = v49;
  uint64_t v29 = v48;
  uint64_t v30 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v48, v47, v50);
  unint64_t v31 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  unint64_t v32 = (v46 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v33 + v31, v29, v30);
  unint64_t v34 = v33 + v32;
  long long v35 = *((_OWORD *)a2 + 1);
  *(_OWORD *)unint64_t v34 = *(_OWORD *)a2;
  *(_OWORD *)(v34 + 16) = v35;
  *(void *)(v34 + 32) = a2[4];
  uint64_t v36 = v51;
  sub_A990(v26, v51, &qword_18758);
  uint64_t v37 = (void *)(v36 + *(int *)(sub_31A4(&qword_18778) + 36));
  void *v37 = v52;
  v37[1] = sub_A918;
  v37[2] = v33;
  sub_7CE0((uint64_t)&v57);
  sub_7CE0((uint64_t)&v56);
  sub_A83C((id *)&v55);
  return sub_A9EC(v26, &qword_18758);
}

uint64_t sub_9B6C(uint64_t a1)
{
  uint64_t v2 = sub_10294();
  __chkstk_darwin(v2);
  uint64_t v3 = sub_10254();
  if (qword_18250 != -1) {
    uint64_t v3 = swift_once();
  }
  __chkstk_darwin(v3);
  *(void *)&v5[-4] = a1;
  v5[3] = 0;
  sub_AFA4(&qword_18788, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_10874();
  sub_31A4(&qword_18790);
  sub_AFEC();
  return sub_10054();
}

uint64_t sub_9D00(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v7 = *a1;
  uint64_t v8 = v2;
  long long v6 = *(_OWORD *)(a1 + 3);
  uint64_t v3 = swift_allocObject();
  long long v4 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = a1[4];
  sub_7CE0((uint64_t)&v7);
  sub_7CE0((uint64_t)&v8);
  sub_A83C((id *)&v6);
  sub_31A4(&qword_187A8);
  sub_3494(&qword_187A0, &qword_187A8);
  return sub_104C4();
}

double sub_9DF8@<D0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a1;
    uint64_t v3 = a3;
    uint64_t v5 = *(void *)(a2 + 8);
    if (*(void *)(v5 + 16) > a1)
    {
      uint64_t v6 = v5 + 48 * a1;
      uint64_t v7 = *(void *)(v6 + 40);
      uint64_t v8 = *(void *)(v6 + 56);
      uint64_t v16 = *(void *)(v6 + 48);
      uint64_t v17 = *(void *)(v6 + 32);
      char v15 = *(unsigned char *)(v6 + 64);
      uint64_t v9 = *(void *)(v6 + 72);
      uint64_t KeyPath = swift_getKeyPath();
      sub_105D4();
      sub_AFA4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t v19 = v7;
      swift_bridgeObjectRetain();
      uint64_t v18 = v8;
      swift_bridgeObjectRetain();
      uint64_t v21 = v9;
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_10154();
      uint64_t v13 = v11;
      uint64_t v14 = v10;
      if (qword_18258 == -1) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_9:
  swift_once();
LABEL_4:
  sub_10504();
  sub_10134();
  if (qword_18248 != -1) {
    swift_once();
  }
  sub_10504();
  sub_10134();
  *(unsigned char *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = v17;
  *(void *)(v3 + 32) = v19;
  *(void *)(v3 + 40) = v16;
  *(void *)(v3 + 48) = v18;
  *(unsigned char *)(v3 + 56) = v15;
  *(void *)(v3 + 80) = v14;
  *(void *)(v3 + 88) = v13;
  *(void *)(v3 + 96) = v22;
  *(unsigned char *)(v3 + 104) = v23;
  *(void *)(v3 + 112) = v24;
  *(unsigned char *)(v3 + 120) = v25;
  *(void *)(v3 + 128) = v26;
  *(unsigned char *)(v3 + 136) = v27;
  *(void *)(v3 + 144) = v28;
  *(unsigned char *)(v3 + 152) = v29;
  *(void *)(v3 + 160) = v30;
  *(unsigned char *)(v3 + 168) = v31;
  *(void *)(v3 + 176) = v32;
  *(unsigned char *)(v3 + 184) = v33;
  *(void *)(v3 + 192) = v34;
  *(void *)(v3 + 200) = v35;
  *(void *)(v3 + 208) = v36;
  *(unsigned char *)(v3 + 216) = v37;
  *(void *)(v3 + 224) = v38;
  *(unsigned char *)(v3 + 232) = v39;
  *(void *)(v3 + 240) = v40;
  *(unsigned char *)(v3 + 248) = v41;
  *(void *)(v3 + 256) = v42;
  *(unsigned char *)(v3 + 264) = v43;
  *(void *)(v3 + 272) = v44;
  *(unsigned char *)(v3 + 280) = v45;
  *(void *)(v3 + 288) = v46;
  *(unsigned char *)(v3 + 296) = v47;
  *(void *)(v3 + 64) = v21;
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 320) = v4;
  *(void *)uint64_t v3 = KeyPath;
  *(void *)(v3 + 8) = 0;
  double result = *(double *)&v48;
  *(_OWORD *)(v3 + 304) = v48;
  return result;
}

void sub_A24C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 24);
  if (v2)
  {
    id v3 = v2;
    unint64_t v4 = (void *)sub_FF04();
    uint64_t v5 = v4[1];
    *(void *)&long long v14 = *v4;
    *((void *)&v14 + 1) = v5;
    swift_bridgeObjectRetain();
    sub_10774();
    uint64_t v6 = sub_105A4();

    sub_91D4((uint64_t)v16, v6, &v14);
    swift_bridgeObjectRelease();
    sub_873C((uint64_t)v16);
    uint64_t v7 = v15;
    sub_A9EC((uint64_t)&v14, &qword_18678);
    if (!v7)
    {
      uint64_t v8 = *v4;
      uint64_t v9 = v4[1];
      *(void *)&long long v14 = v8;
      *((void *)&v14 + 1) = v9;
      id v10 = v3;
      swift_bridgeObjectRetain();
      sub_10774();
      uint64_t v11 = *(void *)(*(void *)(v1 + 8) + 16);
      char v15 = &type metadata for Int;
      *(void *)&long long v14 = v11;
      uint64_t v12 = (void (*)(unsigned char *, void))sub_10594();
      sub_9238((uint64_t)&v14, (uint64_t)v16);
      v12(v13, 0);
    }
  }
  else
  {
    sub_105D4();
    sub_AFA4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_10144();
    __break(1u);
  }
}

void sub_A3E4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  sub_10524();
  sub_100C4();
  swift_release();
  uint64_t v5 = *(void **)(a3 + 24);
  if (v5)
  {
    id v6 = v5;
    v9[1] = *(void *)(sub_FF24() + 8);
    swift_bridgeObjectRetain();
    sub_10774();
    v9[3] = &type metadata for Int;
    v9[0] = v4;
    uint64_t v7 = (void (*)(unsigned char *, void))sub_10594();
    sub_9238((uint64_t)v9, (uint64_t)v10);
    v7(v8, 0);
  }
  else
  {
    sub_105D4();
    sub_AFA4(&qword_185A8, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_10144();
    __break(1u);
  }
}

uint64_t sub_A54C()
{
  return sub_10104();
}

void sub_A5AC()
{
  qword_18718 = 0x4074200000000000;
}

void sub_A5C0()
{
  qword_18720 = 0x404E000000000000;
}

void destroy for ContentResultsList(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for ContentResultsList(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for ContentResultsList(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = (void *)a1[3];
  id v5 = (void *)a2[3];
  a1[3] = v5;
  id v6 = v5;

  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for ContentResultsList(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResultsList(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentResultsList(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)double result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentResultsList()
{
  return &type metadata for ContentResultsList;
}

uint64_t sub_A7DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_A7F8()
{
  return sub_B088(64);
}

uint64_t sub_A800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_945C(a1, (uint64_t *)(v2 + 16), *(void *)(v2 + 56), a2);
}

uint64_t sub_A80C()
{
  return sub_9B6C(*(void *)(v0 + 16));
}

void sub_A818()
{
}

id *sub_A83C(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_A868()
{
  sub_10114();
  sub_8EE8();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5 + 40, v4);
}

void sub_A918(uint64_t *a1)
{
  uint64_t v3 = sub_10114();
  sub_B184(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);

  sub_A3E4(a1, v1 + v8, v9);
}

uint64_t sub_A990(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_31A4(a3);
  sub_8EE8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_A9EC(uint64_t a1, uint64_t *a2)
{
  sub_31A4(a2);
  sub_8EE8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_AA40()
{
  return sub_A54C();
}

void sub_AA5C()
{
  qword_18728 = 0x4075900000000000;
}

unint64_t sub_AA70(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10754(*(void *)(v2 + 40));

  return sub_AAB4(a1, v4);
}

unint64_t sub_AAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_AE74(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10764();
      sub_873C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_AB7C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_AA70(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_31A4(&qword_18780);
    sub_107A4(isUniquelyReferenced_nonNull_native, v10);
    sub_873C(*(void *)(v12 + 48) + 40 * v6);
    sub_ACAC((_OWORD *)(*(void *)(v12 + 56) + 32 * v6), a2);
    sub_107B4();
    *uint64_t v3 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

_OWORD *sub_ACAC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_ACBC(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *long long v2 = 0x8000000000000000;
  sub_AD3C(a1, a2, isUniquelyReferenced_nonNull_native);
  *long long v2 = v7;

  return swift_bridgeObjectRelease();
}

_OWORD *sub_AD3C(_OWORD *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_AA70(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_31A4(&qword_18780);
  if (!sub_107A4(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_AA70(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    double result = (_OWORD *)sub_107F4();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v14);
    sub_AF4C((uint64_t)v19);
    return sub_ACAC(a1, v19);
  }
  else
  {
    sub_AE74(a2, (uint64_t)v21);
    return sub_AED0(v14, (uint64_t)v21, a1, v18);
  }
}

uint64_t sub_AE74(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_AED0(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = sub_ACAC(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

uint64_t sub_AF4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_AF9C()
{
  return sub_9D00(*(uint64_t **)(v0 + 16));
}

uint64_t sub_AFA4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_AFEC()
{
  unint64_t result = qword_18798;
  if (!qword_18798)
  {
    sub_3040(&qword_18790);
    sub_3494(&qword_187A0, &qword_187A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18798);
  }
  return result;
}

uint64_t sub_B088(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

double sub_B0DC@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_9DF8(a1, v2 + 16, a2);
}

uint64_t sub_B0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_B148()
{
  return sub_3494(&qword_187B0, &qword_187B8);
}

uint64_t sub_B184(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_B19C()
{
  return sub_B088(56);
}

uint64_t sub_B1A4()
{
  sub_B21C();
  sub_10234();
  return v1;
}

uint64_t sub_B1E0()
{
  return sub_10244();
}

unint64_t sub_B21C()
{
  unint64_t result = qword_187C0;
  if (!qword_187C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_187C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for OriginAssistantIdKey()
{
  return &type metadata for OriginAssistantIdKey;
}

void sub_B278(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t sub_B280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_B2E4();

  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

unint64_t sub_B2E4()
{
  unint64_t result = qword_187C8;
  if (!qword_187C8)
  {
    sub_3040(&qword_187D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_187C8);
  }
  return result;
}

uint64_t sub_B350(uint64_t TupleTypeMetadata, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      BOOL v9 = v5;
      uint64_t v10 = v8;
      uint64_t v11 = a2;
      do
      {
        uint64_t v12 = *v9++;
        *v10++ = v12;
        --v11;
      }
      while (v11);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  unint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    char v15 = (int *)(v6 + 32);
    uint64_t v16 = a2;
    do
    {
      if (a2 == 1) {
        int v17 = 0;
      }
      else {
        int v17 = *v15;
      }
      uint64_t v19 = *v5++;
      uint64_t v18 = v19;
      uint64_t v20 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 16))(&v14[v17], v20);
      v15 += 4;
      --v16;
    }
    while (v16);
  }
  return sub_10544();
}

uint64_t sub_B4C4()
{
  sub_31A4(&qword_18930);
  sub_8EE8();
  __chkstk_darwin(v1);
  sub_364C();
  unint64_t v4 = (uint64_t *)(v3 - v2);
  *unint64_t v4 = sub_10504();
  v4[1] = v5;
  uint64_t v6 = sub_31A4(&qword_18938);
  sub_B5A8(v0, (uint64_t *)((char *)v4 + *(int *)(v6 + 44)));
  sub_3494(&qword_18940, &qword_18930);
  sub_103C4();
  return sub_8C64((uint64_t)v4, &qword_18930);
}

uint64_t sub_B5A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = sub_31A4(&qword_18948);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  BOOL v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_10084();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v25 - v15;
  type metadata accessor for PlaceHolder();
  uint64_t v25 = a1;
  sub_74C4((uint64_t)v16);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for ColorScheme.light(_:), v10);
  LOBYTE(a1) = sub_10074();
  int v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v17(v14, v10);
  v17(v16, v10);
  if (a1)
  {
    if (qword_18268 != -1) {
      swift_once();
    }
    uint64_t v18 = &qword_187E0;
  }
  else
  {
    if (qword_18270 != -1) {
      swift_once();
    }
    uint64_t v18 = &qword_187E8;
  }
  uint64_t v19 = *v18;
  swift_retain();
  sub_B8C4();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v20(v7, v9, v3);
  uint64_t v21 = v26;
  uint64_t *v26 = v19;
  uint64_t v22 = sub_31A4(&qword_18950);
  v20((char *)v21 + *(int *)(v22 + 48), v7, v3);
  char v23 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_retain();
  v23(v9, v3);
  v23(v7, v3);
  return swift_release();
}

uint64_t sub_B8C4()
{
  uint64_t v0 = sub_10084();
  sub_EA38();
  uint64_t v2 = v1;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v18 - v7;
  uint64_t v9 = sub_10454();
  if (qword_18260 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_187D8;
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for PlaceHolder();
  swift_retain();
  sub_74C4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v6, enum case for ColorScheme.light(_:), v0);
  char v12 = sub_10074();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v6, v0);
  v13(v8, v0);
  if (v12)
  {
    if (qword_18278 != -1) {
      swift_once();
    }
    unint64_t v14 = &qword_187F0;
  }
  else
  {
    if (qword_18280 != -1) {
      swift_once();
    }
    unint64_t v14 = &qword_187F8;
  }
  uint64_t v15 = *v14;
  swift_retain();
  uint64_t v16 = swift_getKeyPath();
  v18[1] = v9;
  id v18[2] = KeyPath;
  v18[3] = v10;
  v18[4] = v16;
  v18[5] = v15;
  sub_31A4(&qword_18958);
  sub_E3FC();
  sub_103C4();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_BB68()
{
  uint64_t v0 = sub_31A4(&qword_18648);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10304();
  sub_31E8((uint64_t)v2, 1, 1, v3);
  uint64_t v4 = sub_10324();
  uint64_t result = sub_8C64((uint64_t)v2, &qword_18648);
  qword_187D8 = v4;
  return result;
}

uint64_t sub_BC28(uint64_t a1)
{
  return sub_BC78(a1, &qword_187E0);
}

uint64_t sub_BC3C(uint64_t a1)
{
  return sub_BC78(a1, &qword_187E8);
}

uint64_t sub_BC50(uint64_t a1)
{
  return sub_BC78(a1, &qword_187F0);
}

uint64_t sub_BC64(uint64_t a1)
{
  return sub_BC78(a1, &qword_187F8);
}

uint64_t sub_BC78(uint64_t a1, uint64_t *a2)
{
  sub_103E4();
  sub_EA38();
  __chkstk_darwin(v3);
  sub_364C();
  (*(void (**)(uint64_t, void))(v6 + 104))(v5 - v4, enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t result = sub_10414();
  *a2 = result;
  return result;
}

uint64_t sub_BD30()
{
  return sub_3094();
}

uint64_t sub_BD68(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    *(void *)(a1 + 40) = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_31A4(&qword_185D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10084();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_BEB8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_31A4(&qword_185D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10084();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_BF80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_31A4(&qword_185D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10084();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_C078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_8C64(a1 + v6, &qword_185D0);
    sub_31A4(&qword_185D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_10084();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_C1B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_31A4(&qword_185D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10084();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t sub_C290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_8C64(a1 + v8, &qword_185D0);
    uint64_t v11 = sub_31A4(&qword_185D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10084();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_C3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C3C8);
}

uint64_t sub_C3C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_31A4(&qword_18800);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return sub_7B50(v9, a2, v8);
  }
}

uint64_t sub_C454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C468);
}

uint64_t sub_C468(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_31A4(&qword_18800);
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return sub_31E8(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PlaceHolder()
{
  uint64_t result = qword_18860;
  if (!qword_18860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_C534()
{
  sub_C5CC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_C5CC()
{
  if (!qword_18870)
  {
    sub_10084();
    unint64_t v0 = sub_10094();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18870);
    }
  }
}

uint64_t sub_C624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_C62C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_FE94();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_C704(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = sub_FE94();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v12;
  unint64_t v14 = ((v9 + v12 + ((v8 + 17) & ~v8)) & ~(unint64_t)v12)
      + *(void *)(v11 + 64);
  int v15 = (v12 | v7) & 0x100000;
  if ((v13 | (unint64_t)v7) > 7 || v15 != 0 || v14 > 0x18)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = v18 + (((v13 | v7) & 0xF8 ^ 0x1F8) & ((v13 | v7) + 16));
    swift_retain();
  }
  else
  {
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    unint64_t v19 = ~(unint64_t)v7;
    uint64_t v24 = v5;
    uint64_t v20 = *a2;
    uint64_t v21 = a2[1];
    char v22 = *((unsigned char *)a2 + 16);
    sub_C8E0();
    *(void *)a1 = v20;
    *(void *)(a1 + 8) = v21;
    *(unsigned char *)(a1 + 16) = v22;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))((a1 + v8 + 17) & v19, ((unint64_t)a2 + v8 + 17) & v19, v24);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((((a1 + v8 + 17) & v19) + v25 + v13) & ~v13, ((((unint64_t)a2 + v8 + 17) & v19) + v25 + v13) & ~v13, v26);
  }
  return a1;
}

uint64_t sub_C8E0()
{
  return swift_retain();
}

uint64_t sub_C8E8(uint64_t a1, uint64_t a2)
{
  sub_C9BC();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t v8 = sub_FE94();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 8);
  uint64_t v11 = v8;
  unint64_t v12 = (v6 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);

  return v10(v12, v11);
}

uint64_t sub_C9BC()
{
  return swift_release();
}

uint64_t sub_C9C4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_C8E0();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 17 + a1) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 17) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v12, v13);
  uint64_t v14 = *(void *)(v10 + 48);
  uint64_t v15 = sub_FE94();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 16))((v14 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (v14 + *(unsigned __int8 *)(v16 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), v15);
  return a1;
}

uint64_t sub_CABC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_C8E0();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_C9BC();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 17 + a1) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 17) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v10 + 40);
  uint64_t v15 = sub_FE94();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 24))((v14 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (v14 + *(unsigned __int8 *)(v16 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), v15);
  return a1;
}

uint64_t sub_CBC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 17 + a1) & ~v6;
  uint64_t v8 = (v6 + 17 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32);
  uint64_t v10 = sub_FE94();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))((v9 + *(unsigned __int8 *)(v11 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v9 + *(unsigned __int8 *)(v11 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_CC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_C9BC();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 17 + a1) & ~v9;
  uint64_t v11 = (v9 + 17 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 24);
  uint64_t v13 = sub_FE94();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 40))((v12 + *(unsigned __int8 *)(v14 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80), (v12 + *(unsigned __int8 *)(v14 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80), v13);
  return a1;
}

uint64_t sub_CD88(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_FE94();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v7 <= v10) {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v11 = v7;
  }
  if (v11 <= 0xFE) {
    unsigned int v12 = 254;
  }
  else {
    unsigned int v12 = v11;
  }
  uint64_t v13 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = *(void *)(v6 + 64);
  uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v16 = v8;
  if (a2 <= v12) {
    goto LABEL_26;
  }
  uint64_t v17 = ((v14 + v15 + ((v13 + 17) & ~v13)) & ~v15) + *(void *)(*(void *)(v8 - 8) + 64);
  char v18 = 8 * v17;
  if (v17 <= 3)
  {
    unsigned int v21 = ((a2 - v12 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v21))
    {
      int v19 = *(_DWORD *)((char *)a1 + v17);
      if (!v19) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v21 > 0xFF)
    {
      int v19 = *(unsigned __int16 *)((char *)a1 + v17);
      if (!*(unsigned __int16 *)((char *)a1 + v17)) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v21 < 2)
    {
LABEL_26:
      if (v11 > 0xFE)
      {
        uint64_t v24 = ((unint64_t)a1 + v13 + 17) & ~v13;
        if (v7 == v12)
        {
          uint64_t v10 = v7;
          uint64_t v16 = v5;
        }
        else
        {
          uint64_t v24 = (v24 + v14 + v15) & ~v15;
        }
        return sub_7B50(v24, v10, v16);
      }
      else
      {
        unsigned int v23 = *((unsigned __int8 *)a1 + 16);
        if (v23 > 1) {
          return (v23 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v19 = *((unsigned __int8 *)a1 + v17);
  if (!*((unsigned char *)a1 + v17)) {
    goto LABEL_26;
  }
LABEL_18:
  int v22 = (v19 - 1) << v18;
  if (v17 > 3) {
    int v22 = 0;
  }
  if (v17)
  {
    if (v17 > 3) {
      LODWORD(v17) = 4;
    }
    switch((int)v17)
    {
      case 2:
        LODWORD(v17) = *a1;
        break;
      case 3:
        LODWORD(v17) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v17) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v17) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v12 + (v17 | v22) + 1;
}

void sub_D004(_WORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = sub_FE94();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v9 <= v12) {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v13 = v9;
  }
  if (v13 <= 0xFE) {
    unsigned int v14 = 254;
  }
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = *(void *)(v8 + 64);
  uint64_t v17 = *(unsigned __int8 *)(v11 + 80);
  size_t v18 = ((v16 + v17 + ((v15 + 17) & ~v15)) & ~v17) + *(void *)(*(void *)(v10 - 8) + 64);
  char v19 = 8 * v18;
  if (a3 <= v14)
  {
    int v20 = 0;
  }
  else if (v18 <= 3)
  {
    unsigned int v23 = ((a3 - v14 + ~(-1 << v19)) >> v19) + 1;
    if (HIWORD(v23))
    {
      int v20 = 4;
    }
    else if (v23 >= 0x100)
    {
      int v20 = 2;
    }
    else
    {
      int v20 = v23 > 1;
    }
  }
  else
  {
    int v20 = 1;
  }
  if (v14 < a2)
  {
    unsigned int v21 = ~v14 + a2;
    if (v18 < 4)
    {
      int v22 = (v21 >> v19) + 1;
      if (v18)
      {
        int v24 = v21 & ~(-1 << v19);
        bzero(a1, v18);
        if (v18 == 3)
        {
          *a1 = v24;
          *((unsigned char *)a1 + 2) = BYTE2(v24);
        }
        else if (v18 == 2)
        {
          *a1 = v24;
        }
        else
        {
          *(unsigned char *)a1 = v24;
        }
      }
    }
    else
    {
      bzero(a1, v18);
      *(_DWORD *)a1 = v21;
      int v22 = 1;
    }
    switch(v20)
    {
      case 1:
        *((unsigned char *)a1 + v18) = v22;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v18) = v22;
        return;
      case 3:
        goto LABEL_47;
      case 4:
        *(_DWORD *)((char *)a1 + v18) = v22;
        return;
      default:
        return;
    }
  }
  switch(v20)
  {
    case 1:
      *((unsigned char *)a1 + v18) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)((char *)a1 + v18) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_47:
      __break(1u);
      JUMPOUT(0xD308);
    case 4:
      *(_DWORD *)((char *)a1 + v18) = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v13 > 0xFE)
        {
          uint64_t v25 = ((unint64_t)a1 + v15 + 17) & ~v15;
          if (v9 == v14)
          {
            uint64_t v26 = a2;
            uint64_t v12 = v9;
            uint64_t v10 = v7;
          }
          else
          {
            uint64_t v25 = (v25 + v16 + v17) & ~v17;
            uint64_t v26 = a2;
          }
          sub_31E8(v25, v26, v12, v10);
        }
        else if (a2 > 0xFE)
        {
          *((unsigned char *)a1 + 16) = 0;
          *(void *)a1 = (a2 - 255);
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((unsigned char *)a1 + 16) = -(char)a2;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Thumbnail()
{
  return sub_E53C();
}

uint64_t sub_D348()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D364()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D3A8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v47 = a2;
  sub_EA38();
  uint64_t v42 = v4;
  uint64_t v46 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = *(void *)(v7 + 16);
  swift_getTupleTypeMetadata2();
  sub_10534();
  swift_getWitnessTable();
  sub_104A4();
  uint64_t v10 = sub_10434();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = swift_getWitnessTable();
  uint64_t v50 = v10;
  uint64_t v51 = v11;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  sub_EA38();
  uint64_t v44 = v12;
  __chkstk_darwin(v13);
  char v37 = (char *)&v37 - v14;
  uint64_t v15 = sub_100F4();
  sub_EA38();
  uint64_t v43 = v16;
  __chkstk_darwin(v17);
  uint64_t v40 = (char *)&v37 - v18;
  uint64_t v50 = v10;
  uint64_t v51 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v48 = OpaqueTypeConformance2;
  uint64_t v49 = &protocol witness table for _AppearanceActionModifier;
  uint64_t v39 = swift_getWitnessTable();
  uint64_t v50 = v15;
  uint64_t v51 = v39;
  uint64_t v19 = swift_getOpaqueTypeMetadata2();
  sub_EA38();
  uint64_t v21 = v20;
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  char v27 = (char *)&v37 - v26;
  sub_D800(a1);
  uint64_t v28 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v9, v2, a1);
  unint64_t v29 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = *(void *)(a1 + 24);
  *(void *)(v30 + 16) = v45;
  *(void *)(v30 + 24) = v31;
  (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v30 + v29, v9, a1);
  sub_103D4();
  swift_release();
  sub_3640();
  v32();
  sub_103C4();
  sub_3640();
  v33();
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v34(v27, v25, v19);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v21 + 8);
  v35(v25, v19);
  v34(v47, v27, v19);
  return ((uint64_t (*)(char *, uint64_t))v35)(v27, v19);
}

uint64_t sub_D800(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  swift_getTupleTypeMetadata2();
  sub_10534();
  swift_getWitnessTable();
  sub_104A4();
  uint64_t v4 = sub_10434();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v11[-v6];
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v12 = v3;
  uint64_t v13 = v8;
  uint64_t v14 = v1;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_10424();
  uint64_t v15 = WitnessTable;
  swift_getWitnessTable();
  sub_103C4();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_D9C4(uint64_t a1)
{
  type metadata accessor for ImageLoader();
  sub_DFFC();
  sub_100A4();
  uint64_t v2 = type metadata accessor for Thumbnail();
  sub_26D8(a1 + *(int *)(v2 + 40));

  return swift_release();
}

uint64_t sub_DA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  swift_getTupleTypeMetadata2();
  sub_10534();
  swift_getWitnessTable();
  uint64_t v8 = sub_104A4();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v14 = &v18[-v13];
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v21 = a1;
  sub_10504();
  sub_10494();
  swift_getWitnessTable();
  uint64_t v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16);
  v15(v14, v12, v8);
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v15(a4, v14, v8);
  return ((uint64_t (*)(unsigned char *, uint64_t))v16)(v14, v8);
}

uint64_t sub_DC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v20 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = type metadata accessor for Thumbnail();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v10, a1 + *(int *)(v11 + 36), a2);
  type metadata accessor for ImageLoader();
  sub_DFFC();
  sub_100A4();
  uint64_t v13 = sub_100E4();
  uint64_t v15 = v14;
  uint64_t v16 = v20;
  v12(v20, (uint64_t)v10, a2);
  v26[0] = v13;
  v26[1] = v15;
  v27[0] = v16;
  v27[1] = v26;
  swift_retain();
  v25[0] = a2;
  v25[1] = &type metadata for ThumbnailImageView;
  uint64_t v23 = v21;
  unint64_t v24 = sub_E064();
  sub_B350((uint64_t)v27, 2, (uint64_t)v25);
  swift_release();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v10, a2);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v17)(v16, a2);
}

uint64_t sub_DE54()
{
  uint64_t v1 = *(void *)(type metadata accessor for Thumbnail() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_C9BC();
  sub_3640();
  v5();
  sub_FE94();
  sub_8EE8();
  sub_3640();
  v6();

  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_DF78()
{
  uint64_t v1 = *(void *)(type metadata accessor for Thumbnail() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_D9C4(v2);
}

unint64_t sub_DFFC()
{
  unint64_t result = qword_18920;
  if (!qword_18920)
  {
    type metadata accessor for ImageLoader();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18920);
  }
  return result;
}

uint64_t sub_E04C@<X0>(unsigned char *a1@<X8>)
{
  return sub_DA6C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_E058@<X0>(uint64_t a1@<X8>)
{
  return sub_DC5C(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_E064()
{
  unint64_t result = qword_18928;
  if (!qword_18928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18928);
  }
  return result;
}

uint64_t sub_E0B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_10464();
  sub_EA38();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_364C();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_31A4(&qword_18988);
  sub_EA38();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_364C();
  uint64_t v14 = v13 - v12;
  swift_retain();
  id v15 = (id)sub_2180();
  swift_release();
  if (!v15) {
    id v15 = [objc_allocWithZone((Class)UIImage) init];
  }
  id v16 = v15;
  sub_10444();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v1);
  sub_10474();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
  swift_retain();
  uint64_t v17 = (void *)sub_2180();
  swift_release();

  sub_10524();
  swift_retain();
  uint64_t v18 = (void *)sub_2180();
  swift_release();
  sub_31A4(&qword_18990);
  sub_E8C4();
  sub_103C4();
  swift_release();
  swift_release();

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a1, v14, v8);
}

uint64_t sub_E310@<X0>(uint64_t a1@<X8>)
{
  return sub_E0B0(a1);
}

uint64_t sub_E318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10184();
  *a1 = result;
  return result;
}

uint64_t sub_E344()
{
  return sub_10194();
}

uint64_t sub_E370@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_101C4();
  *a1 = result;
  return result;
}

uint64_t sub_E39C()
{
  return sub_101D4();
}

uint64_t sub_E3CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10184();
  *a1 = result;
  return result;
}

unint64_t sub_E3FC()
{
  unint64_t result = qword_18960;
  if (!qword_18960)
  {
    sub_3040(&qword_18958);
    sub_E49C();
    sub_3494(&qword_186E8, &qword_186F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18960);
  }
  return result;
}

unint64_t sub_E49C()
{
  unint64_t result = qword_18968;
  if (!qword_18968)
  {
    sub_3040(&qword_18970);
    sub_3494(&qword_18978, &qword_18980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18968);
  }
  return result;
}

uint64_t sub_E53C()
{
  return swift_getGenericMetadata();
}

void *initializeBufferWithCopyOfBuffer for ThumbnailImageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ThumbnailImageView()
{
  return swift_release();
}

void *assignWithCopy for ThumbnailImageView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ThumbnailImageView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ThumbnailImageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailImageView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailImageView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailImageView()
{
  return &type metadata for ThumbnailImageView;
}

uint64_t sub_E6B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E828()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E8A8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_E8C4()
{
  unint64_t result = qword_18998;
  if (!qword_18998)
  {
    sub_3040(&qword_18990);
    sub_E964();
    sub_3494(&qword_189B0, &qword_189B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18998);
  }
  return result;
}

unint64_t sub_E964()
{
  unint64_t result = qword_189A0;
  if (!qword_189A0)
  {
    sub_3040(&qword_189A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_189A0);
  }
  return result;
}

uint64_t sub_E9D8()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for Utterance(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Utterance()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Utterance(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for Utterance(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Utterance()
{
  return &type metadata for Utterance;
}

uint64_t sub_EB10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_EB2C()
{
  sub_7E4C();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_10374();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  sub_10334();
  uint64_t v5 = sub_10364();
  uint64_t v7 = v6;
  char v9 = v8;
  swift_release();
  sub_8790(v0, v2, v4);
  swift_bridgeObjectRelease();
  sub_10404();
  uint64_t v10 = sub_10354();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_8790(v5, v7, v9 & 1);
  swift_bridgeObjectRelease();
  sub_103C4();
  sub_8790(v10, v12, v14 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_EC94()
{
  return sub_EB2C();
}

uint64_t sub_EC9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_ECF0()
{
  sub_ED58();
  uint64_t result = sub_10704();
  qword_19390 = result;
  return result;
}

unint64_t sub_ED58()
{
  unint64_t result = qword_189C0;
  if (!qword_189C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_189C0);
  }
  return result;
}

uint64_t sub_ED98()
{
  uint64_t v0 = swift_allocObject();
  sub_EDD0();
  return v0;
}

uint64_t sub_EDD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_FF84();
  sub_3624();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_18290 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_7E98(v2, (uint64_t)qword_19398);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v2);
  char v9 = sub_FF74();
  os_log_type_t v10 = sub_10694();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Initializing SiriVideoUIPlugin", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  return v1;
}

uint64_t sub_EF44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_FF84();
  sub_3624();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)sub_FF44();
  BOOL v13 = *v12 == a1 && v12[1] == a2;
  if (v13 || (sub_107E4() & 1) != 0)
  {
    sub_FE24();
    swift_allocObject();
    sub_FE14();
    sub_FC74();
    sub_FE04();
    if (!v2)
    {
      swift_release();
      sub_FCC0();
      return sub_104B4();
    }
    swift_release();
  }
  else
  {
    sub_1FD0();
    uint64_t v3 = swift_allocError();
    swift_willThrow();
  }
  if (qword_18290 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_7E98(v6, (uint64_t)qword_19398);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v6);
  swift_errorRetain();
  swift_errorRetain();
  id v16 = sub_FF74();
  os_log_type_t v17 = sub_10674();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v23 = v6;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v24 = swift_slowAlloc();
    uint64_t v22 = v8;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v25 = v3;
    swift_errorRetain();
    sub_31A4(&qword_18A78);
    uint64_t v19 = sub_10614();
    uint64_t v25 = sub_F4AC(v19, v20, (uint64_t *)&v24);
    sub_10714();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v16, v17, "Error in decoding received data in func view(for:data:mode:) :%s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  }
  return swift_willThrow();
}

uint64_t sub_F2C8()
{
  return sub_FF54();
}

uint64_t sub_F2E0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SiriVideoUIPlugin()
{
  return self;
}

unint64_t sub_F318()
{
  unint64_t result = qword_18A70;
  if (!qword_18A70)
  {
    sub_FEF4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18A70);
  }
  return result;
}

uint64_t sub_F368(uint64_t a1, uint64_t a2)
{
  return sub_EF44(a1, a2);
}

uint64_t sub_F380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_ED98();
  *a1 = result;
  return result;
}

uint64_t sub_F3A8()
{
  return sub_F2C8();
}

uint64_t sub_F3C0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_F3D0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_F40C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_F434(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_F4AC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_10714();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_F4AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_F580(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_B0EC((uint64_t)v12, *a3);
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
      sub_B0EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_AF4C((uint64_t)v12);
  return v7;
}

uint64_t sub_F580(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_F6D8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10724();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_F7B0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10794();
    if (!v8)
    {
      uint64_t result = sub_107C4();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_F6D8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_107D4();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_F7B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_F848(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_FA24(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_FA24((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_F848(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_10624();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_F9BC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10784();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_107D4();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_107C4();
  __break(1u);
  return result;
}

void *sub_F9BC(uint64_t a1, uint64_t a2)
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
  sub_31A4((uint64_t *)&unk_18A90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_FA24(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_31A4((uint64_t *)&unk_18A90);
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
  BOOL v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_FBD4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_FAFC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_FAFC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_107D4();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_FBD4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_107D4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_FC64(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_FC74()
{
  unint64_t result = qword_18A80;
  if (!qword_18A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18A80);
  }
  return result;
}

unint64_t sub_FCC0()
{
  unint64_t result = qword_18A88;
  if (!qword_18A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18A88);
  }
  return result;
}

uint64_t sub_FD14()
{
  uint64_t v0 = sub_FF84();
  sub_FDA0(v0, qword_19398);
  sub_7E98(v0, (uint64_t)qword_19398);
  if (qword_18288 != -1) {
    swift_once();
  }
  id v1 = (id)qword_19390;
  return sub_FF94();
}

uint64_t *sub_FDA0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_FE04()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_FE14()
{
  return JSONDecoder.init()();
}

uint64_t sub_FE24()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_FE34()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_FE44()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_FE54()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_FE64()
{
  return _convertNSErrorToError(_:)();
}

void sub_FE74(NSURL *retstr@<X8>)
{
}

uint64_t sub_FE84()
{
  return URL.init(string:)();
}

uint64_t sub_FE94()
{
  return type metadata accessor for URL();
}

NSData sub_FEA4()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_FEB4()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_FEC4()
{
  return UUID.uuidString.getter();
}

uint64_t sub_FED4()
{
  return UUID.init()();
}

uint64_t sub_FEE4()
{
  return type metadata accessor for UUID();
}

uint64_t sub_FEF4()
{
  return type metadata accessor for VideoDataModels();
}

uint64_t sub_FF04()
{
  return VideoUIPluginConstants.SharedStateKeys.listItemsCount.unsafeMutableAddressor();
}

uint64_t sub_FF14()
{
  return VideoUIPluginConstants.SharedStateKeys.scrollListToIndex.unsafeMutableAddressor();
}

uint64_t sub_FF24()
{
  return VideoUIPluginConstants.SharedStateKeys.currentFocusedIndex.unsafeMutableAddressor();
}

uint64_t sub_FF34()
{
  return VideoUIPluginConstants.SharedStateKeys.isFocusInteractionEnabled.unsafeMutableAddressor();
}

uint64_t sub_FF44()
{
  return VideoUIPluginConstants.Views.ContentDisambiguation.unsafeMutableAddressor();
}

uint64_t sub_FF54()
{
  return static SnippetProvider.snippet(for:mode:idiom:)();
}

uint64_t sub_FF64()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_FF74()
{
  return Logger.logObject.getter();
}

uint64_t sub_FF84()
{
  return type metadata accessor for Logger();
}

uint64_t sub_FF94()
{
  return Logger.init(_:)();
}

void sub_FFA4()
{
}

uint64_t sub_FFB4()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_FFC4()
{
  return Published.init(initialValue:)();
}

uint64_t sub_FFD4()
{
  return static Published.subscript.getter();
}

uint64_t sub_FFE4()
{
  return static Published.subscript.setter();
}

uint64_t sub_FFF4()
{
  return type metadata accessor for Published();
}

uint64_t sub_10004()
{
  return Publisher.replaceError(with:)();
}

uint64_t sub_10014()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_10024()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_10034()
{
  return Publisher.subscribe<A>(on:options:)();
}

uint64_t sub_10044()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_10054()
{
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_10064()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_10074()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_10084()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_10094()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100A4()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_100B4()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100C4()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_100E4()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_100F4()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_10104()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_10114()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_10124()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_10134()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10144()
{
  return EnvironmentObject.error()();
}

uint64_t sub_10154()
{
  return EnvironmentObject.init()();
}

uint64_t sub_10164()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10174()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10184()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10194()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_101A4()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_101B4()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_101C4()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_101D4()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_101E4()
{
  return EnvironmentValues.isFocused.getter();
}

uint64_t sub_101F4()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10204()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10214()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10224()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10234()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_10244()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_10254()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10264()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10274()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10284()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10294()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t sub_102A4()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t sub_102B4()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t sub_102C4()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t sub_102D4()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_102E4()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_102F4()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10304()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10314()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_10324()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10334()
{
  return static Font.headline.getter();
}

uint64_t sub_10344()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_10354()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_10364()
{
  return Text.font(_:)();
}

uint64_t sub_10374()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10384()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10394()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_103A4()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_103B4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_103C4()
{
  return View.privacySensitive(_:)();
}

uint64_t sub_103D4()
{
  return View.onAppear(perform:)();
}

uint64_t sub_103E4()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_103F4()
{
  return static Color.clear.getter();
}

uint64_t sub_10404()
{
  return static Color.white.getter();
}

uint64_t sub_10414()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_10424()
{
  return Group<A>.init(content:)();
}

uint64_t sub_10434()
{
  return type metadata accessor for Group();
}

uint64_t sub_10444()
{
  return Image.init(uiImage:)();
}

uint64_t sub_10454()
{
  return Image.init(systemName:)();
}

uint64_t sub_10464()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10474()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10484()
{
  return Button.init(action:label:)();
}

uint64_t sub_10494()
{
  return ZStack.init(alignment:content:)();
}

uint64_t sub_104A4()
{
  return type metadata accessor for ZStack();
}

uint64_t sub_104B4()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_104C4()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_104D4()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t sub_104E4()
{
  return type metadata accessor for GridItem();
}

uint64_t sub_104F4()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t sub_10504()
{
  return static Alignment.center.getter();
}

uint64_t sub_10514()
{
  return static Alignment.leading.getter();
}

uint64_t sub_10524()
{
  return static Animation.easeOut(duration:)();
}

uint64_t sub_10534()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_10544()
{
  return TupleView.init(_:)();
}

uint64_t sub_10554()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_10564()
{
  return static UnitPoint.leading.getter();
}

uint64_t sub_10574()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10584()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10594()
{
  return dispatch thunk of Context.sharedState.modify();
}

uint64_t sub_105A4()
{
  return dispatch thunk of Context.sharedState.getter();
}

uint64_t sub_105B4()
{
  return dispatch thunk of Context.currentIdiom.getter();
}

uint64_t sub_105C4()
{
  return dispatch thunk of Context.perform(aceCommand:)();
}

uint64_t sub_105D4()
{
  return type metadata accessor for Context();
}

uint64_t sub_105E4()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_105F4()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10604()
{
  return String.init(format:_:)();
}

uint64_t sub_10614()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_10624()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10634()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10644()
{
  return type metadata accessor for NSURLSession.DataTaskPublisher();
}

uint64_t sub_10654()
{
  return NSURLSession.dataTaskPublisher(for:)();
}

uint64_t sub_10664()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10674()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10684()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10694()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_106A4()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_106B4()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_106C4()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_106D4()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_106E4()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_106F4()
{
  return SKIDirectInvocation.Video.newPayload(userData:)();
}

uint64_t sub_10704()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10714()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10724()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10734()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_10744()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_10754(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10764()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10774()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10784()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10794()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_107A4(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_107B4()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_107C4()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_107D4()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_107E4()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_107F4()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10804()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10814()
{
  return Error._code.getter();
}

uint64_t sub_10824()
{
  return Error._domain.getter();
}

uint64_t sub_10834()
{
  return Error._userInfo.getter();
}

uint64_t sub_10844()
{
  return Hasher.init(_seed:)();
}

void sub_10854(Swift::UInt a1)
{
}

Swift::Int sub_10864()
{
  return Hasher._finalize()();
}

uint64_t sub_10874()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}