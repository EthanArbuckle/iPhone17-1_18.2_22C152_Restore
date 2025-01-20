uint64_t sub_10015453C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t result;

  v4 = *(void *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    v7 = sub_10019B220();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(void **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_100150B20(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_100150B20((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_10019B580();
  __break(1u);
  return result;
}

uint64_t sub_100154698(void *a1)
{
  v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_10019B720() & 1;
  }
}

unint64_t sub_1001546F0()
{
  unint64_t result = qword_100286DD8;
  if (!qword_100286DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100286DD8);
  }
  return result;
}

uint64_t sub_100154744(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BatchID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1001547A0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001547D8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t initializeWithCopy for ObservabilitySignalDeserializer(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ObservabilitySignalDeserializer(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for ObservabilitySignalDeserializer(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ObservabilitySignalDeserializer(uint64_t a1, uint64_t a2)
{
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservabilitySignalDeserializer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservabilitySignalDeserializer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ObservabilitySignalDeserializer()
{
  return &type metadata for ObservabilitySignalDeserializer;
}

void *sub_10015495C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000C440(&qword_100285608);
  __chkstk_darwin(v4 - 8);
  v61 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000C440(&qword_100285610);
  __chkstk_darwin(v6 - 8);
  v60 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_10019A9C0();
  uint64_t v8 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_10019AC90();
  uint64_t v11 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  v68 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000C440(&qword_100282D10);
  __chkstk_darwin(v13 - 8);
  v64 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10019ABA0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  v57 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for TimeRange();
  uint64_t v63 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  v56 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v62 = (uint64_t)&v48 - v22;
  __chkstk_darwin(v21);
  v24 = (char *)&v48 - v23;
  uint64_t v58 = a1;
  if (a1 < 0) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v55 = v15;
  sub_100132AEC(v2, (uint64_t)&v48 - v23);
  uint64_t v25 = 0;
  uint64_t v67 = *(int *)(v18 + 20);
  v26 = (void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v50 = (void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  v53 = (void (**)(char *, uint64_t))(v11 + 8);
  v54 = (void (**)(char *, uint64_t))(v8 + 8);
  v52 = (uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t v48 = v16 + 32;
  v27 = &_swiftEmptyArrayStorage;
  v51 = v10;
  uint64_t v49 = v18;
  v28 = (void (**)(char *, char *, uint64_t))(v16 + 32);
  while (1)
  {
    uint64_t v29 = v62;
    sub_100132AEC((uint64_t)v24, v62);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v27 = (void *)sub_10015034C(0, v27[2] + 1, 1, (unint64_t)v27);
    }
    uint64_t v30 = v59;
    unint64_t v32 = v27[2];
    unint64_t v31 = v27[3];
    if (v32 >= v31 >> 1) {
      v27 = (void *)sub_10015034C(v31 > 1, v32 + 1, 1, (unint64_t)v27);
    }
    v27[2] = v32 + 1;
    sub_10012E0E0(v29, (uint64_t)v27+ ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))+ *(void *)(v63 + 72) * v32);
    if (qword_100284F90 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_100128E40(v30, (uint64_t)qword_10028D320);
    v34 = *v26;
    (*v26)(v68, v33, v30);
    v66 = v27;
    v35 = v60;
    v34(v60, v33, v30);
    (*v50)(v35, 0, 1, v30);
    uint64_t v36 = sub_10019ACD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v61, 1, 1, v36);
    v37 = v51;
    sub_10019A990();
    v38 = v26;
    v39 = v64;
    v40 = v68;
    sub_10019AC70();
    (*v54)(v37, v65);
    (*v53)(v40, v30);
    uint64_t v41 = v55;
    __n128 result = (void *)(*v52)(v39, 1, v55);
    if (result == 1) {
      break;
    }
    v43 = *v28;
    v44 = v57;
    (*v28)(v57, v39, v41);
    char v45 = v24[v67];
    uint64_t v46 = (uint64_t)v56;
    v43(v56, v44, v41);
    *(unsigned char *)(v46 + *(int *)(v49 + 20)) = v45;
    sub_100132B50((uint64_t)v24);
    __n128 result = (void *)sub_10012E0E0(v46, (uint64_t)v24);
    if (v58 == v25)
    {
      sub_100132B50((uint64_t)v24);
      return v66;
    }
    BOOL v47 = __OFADD__(v25++, 1);
    v26 = v38;
    v27 = v66;
    if (v47)
    {
      __break(1u);
      break;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100155230(char a1)
{
  uint64_t v2 = sub_10000C440(&qword_100285608);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000C440(&qword_100285610);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (qword_100284F90 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    if (qword_100284F90 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (qword_100284F90 != -1) {
LABEL_9:
  }
    swift_once();
LABEL_8:
  uint64_t v8 = sub_10019AC90();
  uint64_t v9 = sub_100128E40(v8, (uint64_t)qword_10028D320);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v7, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v8);
  uint64_t v11 = sub_10019ACD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 1, 1, v11);
  return sub_10019A990();
}

Swift::Int sub_100155738(uint64_t a1)
{
  sub_10019B7D0();
  sub_10019ABA0();
  sub_100156B78(&qword_100286E80, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10019B060();
  sub_10019B7E0(*(unsigned __int8 *)(v1 + *(int *)(a1 + 20)));
  return sub_10019B7F0();
}

void sub_1001557DC(uint64_t a1, uint64_t a2)
{
  sub_10019ABA0();
  sub_100156B78(&qword_100286E80, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10019B060();
  sub_10019B7E0(*(unsigned __int8 *)(v2 + *(int *)(a2 + 20)));
}

Swift::Int sub_100155868(uint64_t a1, uint64_t a2)
{
  sub_10019B7D0();
  sub_10019ABA0();
  sub_100156B78(&qword_100286E80, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10019B060();
  sub_10019B7E0(*(unsigned __int8 *)(v2 + *(int *)(a2 + 20)));
  return sub_10019B7F0();
}

BOOL sub_100155908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_10019AB60() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20));
}

uint64_t sub_10015595C()
{
  uint64_t v1 = 0x72756F682031;
  if (*v0 != 1) {
    uint64_t v1 = 0x74756E696D203531;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7961642031;
  }
}

BOOL sub_1001559B8(uint64_t a1, uint64_t a2)
{
  return (sub_100156334(a2, a1) & 1) == 0;
}

BOOL sub_1001559E4(uint64_t a1, uint64_t a2)
{
  return (sub_100156334(a1, a2) & 1) == 0;
}

uint64_t sub_100155A04(uint64_t a1, uint64_t a2)
{
  return sub_100156334(a2, a1);
}

id sub_100155A14()
{
  id result = sub_100155A34();
  qword_10028D340 = (uint64_t)result;
  return result;
}

id sub_100155A34()
{
  uint64_t v19 = sub_10019AC00();
  uint64_t v0 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10019ACD0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10019AC90();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [objc_allocWithZone((Class)NSDateIntervalFormatter) init];
  if (qword_100284F90 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100128E40(v7, (uint64_t)qword_10028D320);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  Class isa = sub_10019AC50().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  [v11 setCalendar:isa];

  [v11 setDateStyle:1];
  [v11 setTimeStyle:2];
  if (qword_100284FB0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_100128E40(v3, (uint64_t)qword_10028D368);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v14, v3);
  Class v15 = sub_10019ACB0().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  [v11 setTimeZone:v15];

  sub_10019ABE0();
  Class v16 = sub_10019ABF0().super.isa;
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v19);
  [v11 setLocale:v16];

  return v11;
}

uint64_t sub_100155DB0()
{
  uint64_t v35 = sub_10019A9C0();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10019AC90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000C440(&qword_100282D10);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10019ABA0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100284FA0 != -1) {
    swift_once();
  }
  id v34 = (id)qword_10028D340;
  Class isa = sub_10019AAF0().super.isa;
  if (qword_100284F90 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_100128E40(v4, (uint64_t)qword_10028D320);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
  uint64_t v16 = type metadata accessor for TimeRange();
  sub_100155230(*(unsigned char *)(v0 + *(int *)(v16 + 20)));
  sub_10019AC70();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v35);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    Class v18 = sub_10019AAF0().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    Class v20 = isa;
    id v19 = v34;
    id v21 = [v34 stringFromDate:isa toDate:v18];

    uint64_t v22 = sub_10019B0B0();
    uint64_t v24 = v23;

    uint64_t v40 = v22;
    uint64_t v41 = v24;
    uint64_t v38 = 9011426;
    unint64_t v39 = 0xA300000000000000;
    uint64_t v36 = 32;
    unint64_t v37 = 0xE100000000000000;
    sub_100131298();
    uint64_t v25 = sub_10019B4C0();
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    uint64_t v40 = v25;
    uint64_t v41 = v27;
    uint64_t v38 = 11501794;
    unint64_t v39 = 0xA300000000000000;
    uint64_t v36 = 32;
    unint64_t v37 = 0xE100000000000000;
    uint64_t v28 = sub_10019B4C0();
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v40 = v28;
    uint64_t v41 = v30;
    uint64_t v38 = 9666786;
    unint64_t v39 = 0xA300000000000000;
    uint64_t v36 = 45;
    unint64_t v37 = 0xE100000000000000;
    uint64_t v31 = sub_10019B4C0();
    swift_bridgeObjectRelease();
    return v31;
  }
  return result;
}

uint64_t sub_1001562A0()
{
  return sub_100156B78(&qword_100286DE0, (void (*)(uint64_t))type metadata accessor for TimeRange);
}

uint64_t type metadata accessor for TimeRange()
{
  uint64_t result = qword_100286E40;
  if (!qword_100286E40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100156334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019A9C0();
  uint64_t v42 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10019AC90();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000C440(&qword_100282D10);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v30 - v15;
  uint64_t v17 = sub_10019ABA0();
  uint64_t v41 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v40 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v43 = (char *)&v30 - v20;
  if (sub_10019AB10())
  {
    char v21 = 1;
    return v21 & 1;
  }
  if ((sub_10019AB60() & 1) == 0)
  {
    char v21 = 0;
    return v21 & 1;
  }
  uint64_t v38 = v14;
  uint64_t v39 = a2;
  if (qword_100284F90 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_100128E40(v7, (uint64_t)qword_10028D320);
  uint64_t v36 = *(void (**)(char *))(v8 + 16);
  uint64_t v37 = v22;
  v36(v10);
  uint64_t v34 = type metadata accessor for TimeRange();
  sub_100155230(*(unsigned char *)(a1 + *(int *)(v34 + 20)));
  sub_10019AC70();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v42 + 8);
  v35(v6, v4);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v42 = v8 + 8;
  uint64_t v33 = v23;
  v23(v10, v7);
  uint64_t v24 = v41;
  uint64_t v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  uint64_t result = v32(v16, 1, v17);
  uint64_t v31 = v4;
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v30(v43, v16, v17);
    ((void (*)(char *, uint64_t, uint64_t))v36)(v10, v37, v7);
    sub_100155230(*(unsigned char *)(v39 + *(int *)(v34 + 20)));
    uint64_t v26 = v38;
    sub_10019AC70();
    v35(v6, v31);
    v33(v10, v7);
    uint64_t result = v32(v26, 1, v17);
    if (result != 1)
    {
      uint64_t v27 = v40;
      v30(v40, v26, v17);
      uint64_t v28 = v43;
      char v21 = sub_10019AB10();
      uint64_t v29 = *(void (**)(char *, uint64_t))(v24 + 8);
      v29(v27, v17);
      v29(v28, v17);
      return v21 & 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1001567E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001567FC);
}

uint64_t sub_1001567FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10019ABA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 3) {
      return v10 - 2;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_1001568B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001568CC);
}

uint64_t sub_1001568CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10019ABA0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t sub_100156988()
{
  uint64_t result = sub_10019ABA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TimeRange.Duration(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100156AE8);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeRange.Duration()
{
  return &type metadata for TimeRange.Duration;
}

unint64_t sub_100156B24()
{
  unint64_t result = qword_100286E78;
  if (!qword_100286E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100286E78);
  }
  return result;
}

uint64_t sub_100156B78(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_100156BC0(uint64_t a1, uint64_t a2, char a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  sub_10016D134(0, v3, 0);
  uint64_t result = (void *)sub_100157CF0(a1);
  int64_t v7 = (int64_t)result;
  int v9 = v8;
  char v11 = v10 & 1;
  while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v9) {
      goto LABEL_14;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8 * v7);
    unint64_t v14 = _swiftEmptyArrayStorage[2];
    unint64_t v13 = _swiftEmptyArrayStorage[3];
    if (v14 >= v13 >> 1) {
      sub_10016D134(v13 > 1, v14 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v14 + 1;
    uint64_t v15 = &_swiftEmptyArrayStorage[2 * v14];
    v15[4] = v12;
    *((unsigned char *)v15 + 40) = a3 & 1;
    uint64_t result = (void *)sub_100157D90(v7, v9, v11 & 1, a1);
    int64_t v7 = (int64_t)result;
    int v9 = v16;
    char v11 = v17 & 1;
    if (!--v3)
    {
      sub_100157EE8((uint64_t)result, v16, v17 & 1);
      return _swiftEmptyArrayStorage;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_100156D3C()
{
  sub_10000C440((uint64_t *)&unk_100284880);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1001D69A0;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = &protocol witness table for String;
  *(void *)(v0 + 32) = 0x756575517473614CLL;
  *(void *)(v0 + 40) = 0xEF6874676E654C65;
  sub_10019ADF0();
  swift_bridgeObjectRelease();
  if (v3) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t sub_100156E48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10007FDE0(a1, a1[3]);
  uint64_t result = sub_10019AD90();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100156EAC(uint64_t a1, uint64_t a2)
{
  sub_10000C440((uint64_t *)&unk_100284880);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 64) = &protocol witness table for String;
  *(void *)(v3 + 32) = 0x756575517473614CLL;
  *(void *)(v3 + 40) = 0xEF6874676E654C65;
  *(_OWORD *)(v3 + 16) = xmmword_1001D6A80;
  *(void *)(v3 + 96) = &type metadata for Int;
  *(void *)(v3 + 104) = &protocol witness table for Int;
  *(void *)(v3 + 72) = a2;
  LOBYTE(a2) = sub_10019ADD0();
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    sub_10019B3B0();
    sub_100080160();
    id v4 = (id)sub_10019B470();
    sub_10019AF50();
  }
}

uint64_t sub_100157038(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10019B100();
  __chkstk_darwin(v4 - 8);
  sub_10000C440((uint64_t *)&unk_100284880);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1001D69A0;
  v24[0] = 1598374469;
  v24[1] = 0xE400000000000000;
  v27._countAndFlagsBits = sub_10019AD20();
  sub_10019B190(v27);
  swift_bridgeObjectRelease();
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = &protocol witness table for String;
  *(void *)(v5 + 32) = 1598374469;
  *(void *)(v5 + 40) = 0xE400000000000000;
  sub_10019ADF0();
  swift_bridgeObjectRelease();
  uint64_t v6 = v25;
  if (v25 == 1)
  {
    sub_10000C440((uint64_t *)&unk_100287F10);
    if ((a2 & 1) == 0)
    {
      uint64_t inited = swift_initStackObject();
      uint64_t v6 = 0;
LABEL_4:
      *(_OWORD *)(inited + 16) = xmmword_1001D69A0;
      *(void *)(inited + 32) = a1;
      uint64_t v8 = sub_100157E74(inited);
      swift_setDeallocating();
      goto LABEL_8;
    }
    uint64_t v9 = swift_initStackObject();
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = v26;
  if (a2)
  {
    if (v25)
    {
      char v23 = sub_10013FDBC(v24, a1);
      uint64_t v6 = v25;
      if ((v23 & 1) == 0) {
        return sub_100157F48(v6);
      }
LABEL_7:
      if (v6 == 1)
      {
LABEL_9:
        sub_10019B3B0();
        sub_100080160();
        char v10 = (void *)sub_10019B470();
        sub_10019AF50();

        return sub_100157F48(v6);
      }
      goto LABEL_8;
    }
    sub_10000C440((uint64_t *)&unk_100287F10);
    uint64_t v9 = swift_initStackObject();
LABEL_6:
    *(_OWORD *)(v9 + 16) = xmmword_1001D69A0;
    *(void *)(v9 + 32) = a1;
    uint64_t v6 = sub_100157E74(v9);
    swift_setDeallocating();
    goto LABEL_7;
  }
  if (!v26)
  {
    sub_10000C440((uint64_t *)&unk_100287F10);
    uint64_t inited = swift_initStackObject();
    goto LABEL_4;
  }
  uint64_t v25 = v26;
  char v22 = sub_10013FDBC(v24, a1);
  uint64_t v8 = v25;
  if ((v22 & 1) == 0) {
    return sub_100157F48(v6);
  }
LABEL_8:
  sub_10019A860();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10019A850();
  uint64_t v25 = v6;
  unint64_t v26 = v8;
  sub_100157EF4();
  uint64_t v12 = sub_10019A840();
  unint64_t v14 = v13;
  sub_10019B0F0();
  uint64_t v15 = sub_10019B0D0();
  uint64_t v17 = v16;
  sub_10007DBF0(v12, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (!v17) {
    goto LABEL_9;
  }
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1001D6A80;
  uint64_t v25 = 1598374469;
  unint64_t v26 = 0xE400000000000000;
  v28._countAndFlagsBits = sub_10019AD20();
  sub_10019B190(v28);
  swift_bridgeObjectRelease();
  uint64_t v19 = v25;
  unint64_t v20 = v26;
  *(void *)(v18 + 56) = &type metadata for String;
  *(void *)(v18 + 64) = &protocol witness table for String;
  *(void *)(v18 + 72) = v15;
  *(void *)(v18 + 32) = v19;
  *(void *)(v18 + 40) = v20;
  *(void *)(v18 + 96) = &type metadata for String;
  *(void *)(v18 + 104) = &protocol witness table for String;
  *(void *)(v18 + 80) = v17;
  char v21 = sub_10019ADD0();
  swift_bridgeObjectRelease();
  if ((v21 & 1) == 0) {
    goto LABEL_9;
  }
  return sub_100157F48(v6);
}

void sub_1001574D8(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_10007FDE0(a1, a1[3]);
  sub_10019AD50();
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = sub_100142F60();
  if (v2)
  {
    swift_errorRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    sub_10019B3B0();
    sub_100080160();
    uint64_t v9 = (void *)sub_10019B470();
    sub_10019AF50();

LABEL_6:
    uint64_t v8 = 0;
    uint64_t v7 = 1;
    goto LABEL_7;
  }
  uint64_t v7 = v5;
  uint64_t v8 = v6;
  swift_bridgeObjectRelease();
  if (v7 == 1) {
    goto LABEL_5;
  }
LABEL_7:
  *a2 = v7;
  a2[1] = v8;
}

void sub_100157608(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_10010B9B8((void *)0x3F, 0xE100000000000000, v2);
  sub_10000C440(&qword_100286390);
  sub_10013CCDC((unint64_t *)&qword_1002848A0, &qword_100286390);
  uint64_t v3 = sub_10019B070();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_10019B530(54);
  v19._countAndFlagsBits = 0xD000000000000032;
  v19._object = (void *)0x80000001002144F0;
  sub_10019B190(v19);
  v20._countAndFlagsBits = v3;
  v20._object = v5;
  sub_10019B190(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 15145;
  v21._object = (void *)0xE200000000000000;
  sub_10019B190(v21);
  if (v2)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    sub_10010C2B4(0, v2, 0);
    uint64_t v6 = _swiftEmptyArrayStorage;
    uint64_t v7 = *(void *)(type metadata accessor for BatchID() - 8);
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = *(void *)(v7 + 72);
    do
    {
      uint64_t v14 = 1598374469;
      unint64_t v15 = 0xE400000000000000;
      v22._countAndFlagsBits = sub_10019AD20();
      sub_10019B190(v22);
      swift_bridgeObjectRelease();
      uint64_t v16 = &type metadata for String;
      uint64_t v17 = &protocol witness table for String;
      uint64_t v18 = v6;
      unint64_t v11 = v6[2];
      unint64_t v10 = v6[3];
      if (v11 >= v10 >> 1)
      {
        sub_10010C2B4((void *)(v10 > 1), v11 + 1, 1);
        uint64_t v6 = v18;
      }
      v6[2] = v11 + 1;
      sub_10010C2D4((uint64_t)&v14, (uint64_t)&v6[5 * v11 + 4]);
      v8 += v9;
      --v2;
    }
    while (v2);
  }
  char v12 = sub_10019ADD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
    sub_10019B3B0();
    sub_100080160();
    unint64_t v13 = (void *)sub_10019B470();
    sub_10019AF50();
  }
}

uint64_t sub_100157920@<X0>(void *a1@<X8>)
{
  sub_10000C440((uint64_t *)&unk_100284880);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1001D69A0;
  v6._countAndFlagsBits = sub_10019AD20();
  sub_10019B190(v6);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = &protocol witness table for String;
  *(void *)(v2 + 32) = 1598374469;
  *(void *)(v2 + 40) = 0xE400000000000000;
  sub_10000C440(&qword_100286F50);
  sub_10019ADF0();
  swift_bridgeObjectRelease();
  if (v5) {
    return sub_100132A7C(&v4, (uint64_t)a1);
  }
  a1[3] = sub_10000C440(&qword_100286F58);
  uint64_t result = sub_10013CCDC(&qword_100286F60, &qword_100286F58);
  a1[4] = result;
  *a1 = _swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_100157AD8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_10007FDE0(a1, a1[3]);
  sub_10019AD50();
  if (v4)
  {
    uint64_t v5 = sub_100142F60();
    if (v2)
    {
      swift_errorRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = v5;
      uint64_t v10 = v6;
      swift_bridgeObjectRelease();
      if (v9 != 1)
      {
        uint64_t v17 = _swiftEmptyArrayStorage;
        if (v9)
        {
          unint64_t v13 = sub_100156BC0(v9, (uint64_t)&v15, 1);
          sub_10014ED54((uint64_t)v13);
        }
        if (v10)
        {
          uint64_t v14 = sub_100156BC0(v10, (uint64_t)v16, 0);
          sub_10014ED54((uint64_t)v14);
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t v8 = v17;
        goto LABEL_7;
      }
    }
    sub_10019B3B0();
    sub_100080160();
    unint64_t v11 = (void *)sub_10019B470();
    uint64_t v8 = _swiftEmptyArrayStorage;
    sub_10019AF50();

LABEL_7:
    uint64_t v7 = sub_10000C440(&qword_100286F58);
    goto LABEL_8;
  }
  uint64_t v7 = sub_10000C440(&qword_100286F58);
  uint64_t v8 = _swiftEmptyArrayStorage;
LABEL_8:
  a2[3] = v7;
  uint64_t result = sub_10013CCDC(&qword_100286F60, &qword_100286F58);
  a2[4] = result;
  *a2 = v8;
  return result;
}

uint64_t type metadata accessor for ObservabilityStateStoreDatabase()
{
  return self;
}

uint64_t sub_100157CF0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_100157D90(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100157E74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_10019B360();
  uint64_t v7 = result;
  if (v2)
  {
    unint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_10013FDBC(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_100157EE8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100157EF4()
{
  unint64_t result = qword_100286F68;
  if (!qword_100286F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100286F68);
  }
  return result;
}

uint64_t sub_100157F48(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100157F8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for TimeRange();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v2[15];
  uint64_t v9 = v2[16];
  sub_10007FDE0(v2 + 12, v8);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void, uint64_t, uint64_t))(v9 + 24))(v25, a1, 0, v8, v9);
  uint64_t v10 = sub_10015836C(v25);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v25);
  v25[0] = v10;
  sub_10000C440(&qword_100287030);
  sub_1001586FC();
  if (sub_10019B380())
  {
    if (qword_100284FA8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10019AF80();
    sub_100128E40(v11, (uint64_t)qword_10028D348);
    sub_100158878(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimeRange);
    swift_retain();
    char v12 = sub_10019AF60();
    os_log_type_t v13 = sub_10019B390();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      v25[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136446466;
      uint64_t v15 = sub_10007C26C(0x63696E756D6D6F63, 0xED00006E6F697461, v25);
      uint64_t v23 = a2;
      uint64_t v24 = v15;
      sub_10019B4A0();
      swift_release();
      *(_WORD *)(v14 + 12) = 2082;
      uint64_t v16 = sub_100155DB0();
      uint64_t v24 = sub_10007C26C(v16, v17, v25);
      a2 = v23;
      sub_10019B4A0();
      swift_bridgeObjectRelease();
      sub_1001588E0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimeRange);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Generating %{public}s report for %{public}s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release();
      sub_1001588E0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TimeRange);
    }

    uint64_t v20 = sub_10019ABA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(a2, a1, v20);
    uint64_t v21 = type metadata accessor for ObservabilityCommunicationReport();
    *(void *)(a2 + *(int *)(v21 + 20)) = v10;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a2, 0, 1, v21);
  }
  else
  {
    uint64_t v18 = type metadata accessor for ObservabilityCommunicationReport();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a2, 1, 1, v18);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10015836C(void *a1)
{
  sub_10010B568(v1 + 56, (uint64_t)v10);
  type metadata accessor for ErrorCollector();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 56) = sub_100142550((uint64_t)_swiftEmptyArrayStorage);
  sub_100132A7C(v10, inited + 16);
  sub_10010B568(v1 + 16, (uint64_t)v9);
  uint64_t v4 = swift_initStackObject();
  *(void *)(v4 + 56) = sub_100142550((uint64_t)_swiftEmptyArrayStorage);
  sub_100132A7C(v9, v4 + 16);
  sub_10007FDE0(a1, a1[3]);
  sub_10019B250();
  uint64_t v5 = sub_10014BDFC();
  uint64_t v6 = sub_10014BDFC();
  uint64_t v7 = sub_10013F7A8(v6, v5);
  swift_setDeallocating();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v4 + 16);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(inited + 16);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1001584C4()
{
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 16);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 56);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 96);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ObservabilityCommunicationReporter()
{
  return self;
}

uint64_t sub_100158530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000C440(&qword_100287028);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100157F8C(a1, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for ObservabilityCommunicationReport();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_100158638((uint64_t)v6);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(void *)(a2 + 32) = 0;
  }
  else
  {
    *(void *)(a2 + 24) = v7;
    *(void *)(a2 + 32) = &off_100238390;
    uint64_t v9 = sub_10010B318((uint64_t *)a2);
    return sub_100158698((uint64_t)v6, (uint64_t)v9);
  }
  return result;
}

uint64_t sub_100158638(uint64_t a1)
{
  uint64_t v2 = sub_10000C440(&qword_100287028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100158698(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ObservabilityCommunicationReport();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1001586FC()
{
  unint64_t result = qword_100287038;
  if (!qword_100287038)
  {
    sub_1000788B8(&qword_100287030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287038);
  }
  return result;
}

uint64_t sub_100158758(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100158878(a1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  if (swift_getEnumCaseMultiPayload() != 6) {
    return sub_1001588E0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  }
  swift_bridgeObjectRelease();
  return sub_10014BFA4();
}

uint64_t sub_10015885C(uint64_t a1)
{
  return sub_100158758(a1);
}

uint64_t sub_100158878(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1001588E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100158940()
{
  uint64_t v0 = sub_10019AF80();
  sub_100128DDC(v0, qword_10028D348);
  sub_100128E40(v0, (uint64_t)qword_10028D348);
  return sub_10019AF70();
}

uint64_t sub_1001589C4()
{
  sub_10000C440(&qword_1002860D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001D8C90;
  *(void *)(inited + 32) = 0x444D4D5F65746164;
  *(void *)(inited + 40) = 0xEB00000000484844;
  *(void *)(inited + 48) = sub_100158F1C();
  *(void *)(inited + 56) = 0xD000000000000018;
  *(void *)(inited + 64) = 0x80000001002145F0;
  uint64_t v2 = v0 + *(int *)(type metadata accessor for ObservabilityHourlyReport() + 36);
  *(NSNumber *)(inited + 72) = sub_10019B370();
  *(void *)(inited + 80) = 0xD000000000000015;
  *(void *)(inited + 88) = 0x8000000100214610;
  *(NSNumber *)(inited + 96) = sub_10019B370();
  *(void *)(inited + 104) = 0xD000000000000015;
  *(void *)(inited + 112) = 0x8000000100214630;
  *(NSNumber *)(inited + 120) = sub_10019B370();
  *(void *)(inited + 128) = 0xD000000000000017;
  *(void *)(inited + 136) = 0x8000000100214650;
  *(NSNumber *)(inited + 144) = sub_10019B370();
  *(void *)(inited + 152) = 0xD000000000000015;
  *(void *)(inited + 160) = 0x8000000100214670;
  *(NSNumber *)(inited + 168) = sub_10019B370();
  *(void *)(inited + 176) = 0xD000000000000013;
  *(void *)(inited + 184) = 0x8000000100214690;
  *(NSNumber *)(inited + 192) = sub_10019B370();
  *(void *)(inited + 200) = 0xD000000000000010;
  *(void *)(inited + 208) = 0x80000001002146B0;
  *(NSNumber *)(inited + 216) = sub_10019B370();
  *(void *)(inited + 224) = 0xD000000000000010;
  *(void *)(inited + 232) = 0x80000001002146D0;
  *(NSNumber *)(inited + 240) = sub_10019B370();
  *(void *)(inited + 248) = 0x5F64657269707865;
  *(void *)(inited + 256) = 0xEF73656863746162;
  *(NSNumber *)(inited + 264) = sub_10019B370();
  *(void *)(inited + 272) = 0xD00000000000001ALL;
  *(void *)(inited + 280) = 0x80000001002146F0;
  *(NSNumber *)(inited + 288) = sub_10019B370();
  *(void *)(inited + 296) = 0xD00000000000001BLL;
  *(void *)(inited + 304) = 0x8000000100214710;
  *(NSNumber *)(inited + 312) = sub_10019B370();
  *(void *)(inited + 320) = 0xD000000000000015;
  *(void *)(inited + 328) = 0x8000000100214730;
  *(NSNumber *)(inited + 336) = sub_10019B370();
  uint64_t result = sub_10013ECFC(inited);
  uint64_t v18 = result;
  if (*(unsigned char *)(v2 + 8))
  {
    sub_1001592A8(0xD000000000000016, 0x8000000100214750);
    uint64_t result = swift_unknownObjectRelease();
    if (*(unsigned char *)(v2 + 48)) {
      goto LABEL_3;
    }
LABEL_10:
    double v9 = round(*(double *)(v2 + 40) / (double)*(uint64_t *)(v2 + 32) * 10.0);
    if ((~*(void *)&v9 & 0x7FF0000000000000) != 0)
    {
      if (v9 > -9.22337204e18)
      {
        if (v9 < 9.22337204e18)
        {
          uint64_t result = 100 * (uint64_t)v9;
          if ((unsigned __int128)((uint64_t)v9 * (__int128)100) >> 64 == result >> 63)
          {
            Class isa = sub_10019B370().super.super.isa;
            uint64_t v11 = v18;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v17 = v11;
            sub_100159744((uint64_t)isa, 0xD000000000000016, 0x8000000100214770, isUniquelyReferenced_nonNull_native, &v17);
            uint64_t v18 = v17;
            uint64_t result = swift_bridgeObjectRelease();
            if (*(unsigned char *)(v2 + 24)) {
              goto LABEL_4;
            }
            goto LABEL_15;
          }
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  double v5 = round(*(double *)v2 * 10.0);
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = result;
  uint64_t result = 100 * (uint64_t)v5;
  if ((unsigned __int128)((uint64_t)v5 * (__int128)100) >> 64 != result >> 63)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Class v7 = sub_10019B370().super.super.isa;
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v17 = v6;
  sub_100159744((uint64_t)v7, 0xD000000000000016, 0x8000000100214750, v8, &v17);
  uint64_t v18 = v17;
  uint64_t result = swift_bridgeObjectRelease();
  if ((*(unsigned char *)(v2 + 48) & 1) == 0) {
    goto LABEL_10;
  }
LABEL_3:
  sub_1001592A8(0xD000000000000016, 0x8000000100214770);
  uint64_t result = swift_unknownObjectRelease();
  if (*(unsigned char *)(v2 + 24))
  {
LABEL_4:
    sub_1001592A8(0xD000000000000016, 0x8000000100214790);
    swift_unknownObjectRelease();
    return v18;
  }
LABEL_15:
  double v13 = round(*(double *)(v2 + 16) * 10.0);
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t result = 100 * (uint64_t)v13;
  if ((unsigned __int128)((uint64_t)v13 * (__int128)100) >> 64 == result >> 63)
  {
    Class v14 = sub_10019B370().super.super.isa;
    uint64_t v15 = v18;
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = v15;
    sub_100159744((uint64_t)v14, 0xD000000000000016, 0x8000000100214790, v16, &v17);
    uint64_t v4 = v17;
    swift_bridgeObjectRelease();
    return v4;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_100158F1C()
{
  uint64_t v0 = sub_10019ACD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10019AC90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Class v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10019A9C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100284F90 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100128E40(v4, (uint64_t)qword_10028D320);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
  if (qword_100284FB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100128E40(v0, (uint64_t)qword_10028D368);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v0);
  sub_10019AC30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1001598B4();
  Class v14 = (void *)sub_10019B450();
  sub_10000C440((uint64_t *)&unk_100285520);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1001D6910;
  uint64_t result = sub_10019A920();
  if (v17)
  {
    __break(1u);
    goto LABEL_10;
  }
  *(void *)(v15 + 56) = &type metadata for Int;
  *(void *)(v15 + 64) = &protocol witness table for Int;
  *(void *)(v15 + 32) = result;
  uint64_t result = sub_10019A8D0();
  if (v18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(v15 + 96) = &type metadata for Int;
  *(void *)(v15 + 104) = &protocol witness table for Int;
  *(void *)(v15 + 72) = result;
  uint64_t result = sub_10019A8F0();
  if ((v19 & 1) == 0)
  {
    *(void *)(v15 + 136) = &type metadata for Int;
    *(void *)(v15 + 144) = &protocol witness table for Int;
    *(void *)(v15 + 112) = result;
    uint64_t v20 = sub_10019B460();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v20;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1001592A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100076504(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10014210C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_100159378(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_100159378(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10019B4F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10019B7D0();
        swift_bridgeObjectRetain();
        sub_10019B150();
        Swift::Int v9 = sub_10019B7F0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          char v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    char v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    char v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *char v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100159550(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10019B4F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Swift::UInt v9 = *(unsigned __int8 *)(*(void *)(a2 + 48) + v6);
        sub_10019B7D0();
        sub_10019B7E0(v9);
        uint64_t result = sub_10019B7F0();
        unint64_t v10 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (unsigned char *)(v11 + v3);
        uint64_t v13 = (unsigned char *)(v11 + v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_10019ABA0() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100159744(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  unint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_100076504(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10014210C();
LABEL_7:
    unint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100141424(v15, a4 & 1);
  unint64_t v21 = sub_100076504(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_10019B760();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_1001598B4()
{
  unint64_t result = qword_100286100;
  if (!qword_100286100)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100286100);
  }
  return result;
}

uint64_t *sub_1001598F4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10019ABA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    unint64_t v10 = (uint64_t *)((char *)a1 + v9);
    char v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = a3[9];
    uint64_t v14 = a3[10];
    uint64_t v15 = (uint64_t *)((char *)a1 + v13);
    char v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    *(uint64_t *)((char *)a1 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v18 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v18) = *(uint64_t *)((char *)a2 + v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100159A30(uint64_t a1)
{
  uint64_t v2 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100159AD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (void *)(a1 + v8);
  unint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v17 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100159BBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v7 = a3[8];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[9];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100159CEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t sub_100159DAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100159EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100159EB4);
}

uint64_t sub_100159EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10019ABA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100159F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100159F8C);
}

uint64_t sub_100159F8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10019ABA0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ObservabilityDailyReport()
{
  uint64_t result = qword_100287098;
  if (!qword_100287098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10015A098()
{
  uint64_t result = sub_10019ABA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10015A154()
{
  uint64_t v1 = sub_10000C440(&qword_100282D10);
  __chkstk_darwin(v1 - 8);
  v61 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10019ABA0();
  uint64_t v55 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  v56 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SigningFailure();
  uint64_t v54 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v57 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000C440((uint64_t *)&unk_1002871B0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v53 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v53 - v13;
  uint64_t v15 = *(void **)(v0 + 16);
  swift_getObjectType();
  uint64_t v16 = sub_100146080();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v63 = (void *)(v0 + 24);
  uint64_t v64 = v0;
  uint64_t v21 = *sub_10007FDE0((void *)(v64 + 24), *(void *)(v64 + 48));
  uint64_t v59 = v18;
  uint64_t v60 = v16;
  uint64_t v58 = v20;
  uint64_t v22 = sub_100136EB8(v16, v18, v20);
  uint64_t v24 = v23;
  sub_10007FDE0((void *)(v21 + 16), *(void *)(v21 + 40));
  uint64_t v25 = sub_10013029C(v22, v24);
  id v53 = v15;
  if (v25)
  {
    sub_100137188(v25, v12);
    uint64_t v26 = v14;
    uint64_t v27 = v54;
    uint64_t v28 = v55;
  }
  else
  {
    uint64_t v27 = v54;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v12, 1, 1, v4);
    uint64_t v26 = v14;
    uint64_t v28 = v55;
  }
  swift_bridgeObjectRelease();
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v29(v12, 1, v4) == 1)
  {
    uint64_t v30 = sub_10007FDE0(v63, *(void *)(v64 + 48));
    sub_10007FDE0((void *)(*v30 + 16), *(void *)(*v30 + 40));
    uint64_t v31 = sub_10013029C(0x6146657669746361, 0xED00006572756C69);
    if (v31) {
      sub_100137188(v31, v26);
    }
    else {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v26, 1, 1, v4);
    }
    sub_1000808B4((uint64_t)v12, (uint64_t *)&unk_1002871B0);
  }
  else
  {
    sub_100135ED4((uint64_t)v12, (uint64_t)v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v26, 0, 1, v4);
  }
  sub_10015A7FC((uint64_t)v26, (uint64_t)v9);
  if (v29(v9, 1, v4) == 1)
  {
    sub_1000808B4((uint64_t)v9, (uint64_t *)&unk_1002871B0);
    uint64_t v33 = (uint64_t)v61;
    uint64_t v32 = v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v61, 1, 1, v62);
  }
  else
  {
    uint64_t v33 = (uint64_t)v61;
    uint64_t v32 = v62;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v61, v9, v62);
    sub_100135F38((uint64_t)v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v33, 0, 1, v32);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v33, 1, v32) != 1)
    {
      uint64_t v34 = v4;
      uint64_t v36 = v56;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v56, v33, v32);
      goto LABEL_15;
    }
  }
  uint64_t v34 = v4;
  id v35 = [v53 now:v53];
  uint64_t v36 = v56;
  sub_10019AB70();

  sub_1000808B4(v33, &qword_100282D10);
LABEL_15:
  uint64_t v37 = (uint64_t)v26;
  uint64_t v38 = v60;
  uint64_t v62 = (uint64_t)v26;
  uint64_t v39 = v58;
  uint64_t v40 = v59;
  uint64_t v41 = sub_10015A864(v37, v60, v59, v58);
  uint64_t v42 = (uint64_t)v57;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v57, v36, v32);
  v43 = (uint64_t *)(v42 + *(int *)(v34 + 20));
  uint64_t *v43 = v38;
  v43[1] = v40;
  v43[2] = v39;
  *(void *)(v42 + *(int *)(v34 + 24)) = v41;
  char v45 = v63;
  uint64_t v44 = v64;
  uint64_t v46 = sub_10007FDE0(v63, *(void *)(v64 + 48));
  sub_10007FDE0((void *)(*v46 + 16), *(void *)(*v46 + 40));
  unint64_t v47 = sub_100136F94();
  uint64_t v48 = sub_100136EB8(v38, v40, v39);
  sub_1001306E8(v47, v48, v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v50 = sub_10007FDE0(v45, *(void *)(v44 + 48));
  sub_10007FDE0((void *)(*v50 + 16), *(void *)(*v50 + 40));
  unint64_t v51 = sub_100136F94();
  sub_1001306E8(v51, 0x6146657669746361, 0xED00006572756C69);
  swift_bridgeObjectRelease();
  sub_100135F38(v42);
  return sub_1000808B4(v62, (uint64_t *)&unk_1002871B0);
}

uint64_t sub_10015A798()
{
  swift_unknownObjectRelease();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 24);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SigningObservabilityDiary()
{
  return self;
}

uint64_t sub_10015A7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C440((uint64_t *)&unk_1002871B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10015A864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10000C440((uint64_t *)&unk_1002871B0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SigningFailure();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10015A7FC(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1000808B4((uint64_t)v10, (uint64_t *)&unk_1002871B0);
    return 1;
  }
  sub_100135ED4((uint64_t)v10, (uint64_t)v14);
  uint64_t v16 = &v14[*(int *)(v11 + 20)];
  BOOL v17 = *(void *)v16 < a2;
  if (*(void *)v16 == a2 && (v18 = *((void *)v16 + 1), BOOL v17 = v18 < a3, v18 == a3))
  {
    if (*((void *)v16 + 2) >= a4)
    {
LABEL_6:
      uint64_t v15 = *(void *)&v14[*(int *)(v11 + 24)];
      sub_100135F38((uint64_t)v14);
      return v15;
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  uint64_t v19 = *(void *)&v14[*(int *)(v11 + 24)];
  uint64_t result = sub_100135F38((uint64_t)v14);
  BOOL v21 = __OFADD__(v19, 1);
  uint64_t v15 = v19 + 1;
  if (!v21) {
    return v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_10015AA74()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC7Metrics27APSigningObservabilityDiary_diary);
  uint64_t v2 = sub_10007FDE0((void *)(v1 + 24), *(void *)(v1 + 48));
  sub_10007FDE0((void *)(*v2 + 16), *(void *)(*v2 + 40));
  sub_10000C440(&qword_100285C90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001D69A0;
  *(void *)(inited + 32) = 0xD000000000000012;
  *(void *)(inited + 40) = 0x8000000100213970;
  sub_10015AF24();
  *(NSNumber *)(inited + 48) = sub_10019B440(1);
  unint64_t v4 = sub_10013ECE4(inited);
  sub_1001306E8(v4, 0xD000000000000012, 0x8000000100213970);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_10007FDE0((void *)(v1 + 24), *(void *)(v1 + 48));
  swift_getObjectType();
  uint64_t v6 = sub_100146080();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  sub_10007FDE0((void *)(*v5 + 16), *(void *)(*v5 + 40));
  uint64_t v11 = sub_100136EB8(v6, v8, v10);
  sub_10012FFAC(v11, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_10007FDE0((void *)(v1 + 24), *(void *)(v1 + 48));
  sub_10007FDE0((void *)(*v13 + 16), *(void *)(*v13 + 40));
  return sub_10012FFAC(0x6146657669746361, 0xED00006572756C69);
}

id sub_10015AC48()
{
  uint64_t v1 = OBJC_IVAR____TtC7Metrics27APSigningObservabilityDiary_diary;
  id v2 = objc_allocWithZone((Class)APSystemClock);
  uint64_t v3 = v0;
  id v4 = [v2 init];
  uint64_t v5 = (objc_class *)type metadata accessor for PropertyListFileManagerFileSystem();
  uint64_t v24 = (uint64_t)v5;
  uint64_t v25 = &off_1002372E0;
  v23[0] = [objc_allocWithZone(v5) init];
  uint64_t v6 = type metadata accessor for SigningObservabilityPropertyListFileStore();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = sub_100132FEC((uint64_t)v23, (uint64_t)v5);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = *v10;
  v7[5] = v5;
  v7[6] = &off_1002372E0;
  v7[2] = v12;
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v23);
  uint64_t v24 = v6;
  uint64_t v25 = &off_100237438;
  v23[0] = v7;
  type metadata accessor for SigningObservabilityDiary();
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = sub_100132FEC((uint64_t)v23, v6);
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v17 + 16))(v16);
  uint64_t v18 = *v16;
  v13[6] = v6;
  v13[7] = &off_100237438;
  v13[2] = v4;
  v13[3] = v18;
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v23);
  *(void *)&v0[v1] = v13;

  uint64_t v19 = (objc_class *)type metadata accessor for APSigningObservabilityDiary();
  v22.receiver = v3;
  v22.super_class = v19;
  return [super init];
}

id sub_10015AEBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APSigningObservabilityDiary();
  return [super dealloc];
}

uint64_t type metadata accessor for APSigningObservabilityDiary()
{
  return self;
}

unint64_t sub_10015AF24()
{
  unint64_t result = qword_1002860E0;
  if (!qword_1002860E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1002860E0);
  }
  return result;
}

uint64_t type metadata accessor for RandomTimeRangeOffset()
{
  return self;
}

uint64_t sub_10015AF88(uint64_t a1)
{
  uint64_t result = sub_10015AFC4(a1, 0.0, 1.0);
  if (v2 < 0.0 || v2 >= 1.0) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10015AFC4(uint64_t result, float a2, float a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  float v5 = a3 - a2;
  if ((~COERCE_INT(a3 - a2) & 0x7F800000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = swift_stdlib_random();
  if ((float)((float)(v5 * (float)((float)0 * 0.000000059605)) + a2) == a3) {
    return sub_10015AFC4(v6, a2, a3);
  }
  return result;
}

uint64_t sub_10015B070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_10015B07C()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10015B0B8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10015B0F8(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10015B160(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10015B1A8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10015B1F0(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Histogram()
{
  return sub_10012B520();
}

void *initializeBufferWithCopyOfBuffer for HistogramCounts(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HistogramCounts()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HistogramCounts(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for HistogramCounts(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HistogramCounts(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HistogramCounts(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

uint64_t type metadata accessor for Histogram.Configuration()
{
  return sub_10012B520();
}

uint64_t sub_10015B394()
{
  sub_10019B530(24);
  v1._countAndFlagsBits = 0x3A6E6F6973726576;
  v1._object = (void *)0xE900000000000020;
  sub_10019B190(v1);
  v2._countAndFlagsBits = sub_10019B700();
  sub_10019B190(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x74656B637562202CLL;
  v3._object = (void *)0xEB00000000203A73;
  sub_10019B190(v3);
  sub_10019B310();
  swift_getWitnessTable();
  sub_10019B710();
  return 0;
}

uint64_t sub_10015B4A4()
{
  return sub_10015B394();
}

uint64_t sub_10015B4B4(uint64_t a1)
{
  return _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1 + 8);
}

uint64_t sub_10015B4BC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

void *sub_10015B524(void *a1, void *a2)
{
  *a1 = *a2;
  sub_10012B784(a1 + 1, a2 + 1);
  return a1;
}

__n128 sub_10015B554(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_10015B568(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t sub_10015B5B4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10015B5FC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AvailableBucket()
{
  return sub_10012B520();
}

void sub_10015B664(double a1)
{
  double v2 = a1;
  if ((*(unsigned char *)(v1 + 8) & 1) == 0)
  {
    double v2 = *(double *)v1;
    if (*(double *)v1 > a1) {
      double v2 = a1;
    }
  }
  *(double *)uint64_t v1 = v2;
  *(unsigned char *)(v1 + 8) = 0;
  double v3 = a1;
  if ((*(unsigned char *)(v1 + 24) & 1) == 0)
  {
    double v3 = *(double *)(v1 + 16);
    if (v3 <= a1) {
      double v3 = a1;
    }
  }
  *(double *)(v1 + 16) = v3;
  *(unsigned char *)(v1 + 24) = 0;
  if ((*(unsigned char *)(v1 + 48) & 1) == 0) {
    a1 = *(double *)(v1 + 40) + a1;
  }
  *(double *)(v1 + 40) = a1;
  *(unsigned char *)(v1 + 48) = 0;
  uint64_t v4 = *(void *)(v1 + 32);
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    *(void *)(v1 + 32) = v6;
  }
}

uint64_t sub_10015B6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v3 = v2;
  uint64_t v6 = sub_10019A9C0();
  uint64_t v71 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v69 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10019AC90();
  uint64_t v68 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000C440(&qword_100282D10);
  __chkstk_darwin(v10 - 8);
  uint64_t v67 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_10019ABA0();
  uint64_t v12 = *(void *)(v74 - 8);
  uint64_t v13 = __chkstk_darwin(v74);
  v73 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v60 - v15;
  uint64_t v65 = type metadata accessor for TimeRange();
  __chkstk_darwin(v65);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100284FA8 != -1) {
    swift_once();
  }
  uint64_t v72 = v12;
  uint64_t v19 = sub_10019AF80();
  sub_100128E40(v19, (uint64_t)qword_10028D348);
  sub_100158878(a1, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for TimeRange);
  swift_retain();
  uint64_t v20 = sub_10019AF60();
  os_log_type_t v21 = sub_10019B390();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v64 = a2;
  v66 = v9;
  uint64_t v63 = v16;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v62 = a1;
    uint64_t v24 = v23;
    uint64_t v79 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v88 = sub_10007C26C(0x796C72756F68, 0xE600000000000000, &v79);
    sub_10019B4A0();
    swift_release();
    *(_WORD *)(v24 + 12) = 2082;
    uint64_t v25 = sub_100155DB0();
    uint64_t v88 = sub_10007C26C(v25, v26, &v79);
    sub_10019B4A0();
    swift_bridgeObjectRelease();
    sub_10015C6A4((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for TimeRange);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Generating %{public}s report for %{public}s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v62;
    swift_slowDealloc();
  }
  else
  {
    swift_release();
    sub_10015C6A4((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for TimeRange);
  }

  uint64_t v27 = v3[5];
  uint64_t v28 = v3[6];
  sub_10007FDE0(v3 + 2, v27);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 24))(v95, a1, 1, v27, v28);
  uint64_t v94 = 0;
  sub_10007FDE0(v3 + 7, v3[10]);
  uint64_t v88 = sub_100156D3C();
  uint64_t v89 = v88;
  uint64_t v90 = v88;
  uint64_t v91 = v88;
  v92 = 0;
  uint64_t v93 = 0;
  uint64_t v86 = 0;
  v87 = 0;
  uint64_t v79 = 0;
  unsigned __int8 v80 = 1;
  uint64_t v81 = 0;
  unsigned __int8 v82 = 1;
  uint64_t v83 = 0;
  double v84 = 0.0;
  char v85 = 1;
  uint64_t v78 = 0;
  uint64_t v77 = 0;
  uint64_t v76 = 0;
  uint64_t v75 = 0;
  uint64_t v29 = sub_10007FDE0(v95, v95[3]);
  __chkstk_darwin(v29);
  *(&v60 - 10) = (uint64_t)&v88;
  *(&v60 - 9) = (uint64_t)&v79;
  *(&v60 - 8) = (uint64_t)&v86;
  *(&v60 - 7) = (uint64_t)&v87;
  *(&v60 - 6) = (uint64_t)&v94;
  *(&v60 - 5) = (uint64_t)&v76;
  *(&v60 - 4) = (uint64_t)&v77;
  *(&v60 - 3) = (uint64_t)&v75;
  *(&v60 - 2) = (uint64_t)&v78;
  sub_10019B250();
  sub_10007FDE0(v3 + 7, v3[10]);
  uint64_t v30 = v67;
  if (qword_100284F90 != -1) {
    swift_once();
  }
  uint64_t v31 = v70;
  uint64_t v32 = sub_100128E40(v70, (uint64_t)qword_10028D320);
  uint64_t v33 = v68;
  uint64_t v34 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v66, v32, v31);
  id v35 = v69;
  sub_100155230(*(unsigned char *)(a1 + *(int *)(v65 + 20)));
  sub_10019AC70();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v35, v6);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v31);
  uint64_t v36 = v72;
  uint64_t v37 = v74;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48))(v30, 1, v74);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    uint64_t v40 = (uint64_t)v63;
    v39(v63, v30, v37);
    sub_100156EAC(v40, v89);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v40, v37);
    uint64_t v41 = v94;
    if (v94 > 0 || v92 || v93 || v83 || v78 > 0 || v77 > 0 || v76 > 0 || v75 >= 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v73, a1, v37);
      uint64_t v43 = v88;
      uint64_t v42 = v89;
      uint64_t v44 = v83;
      double v45 = v84;
      char v46 = v85;
      uint64_t v72 = v79;
      LODWORD(v71) = v80;
      uint64_t v70 = v81;
      LODWORD(v69) = v82;
      uint64_t v68 = v86;
      uint64_t v67 = v87;
      v66 = (char *)v90;
      uint64_t v65 = v91;
      uint64_t v63 = v92;
      uint64_t v62 = v93;
      unint64_t v47 = (void (*)(uint64_t, char *, uint64_t))v39;
      if ((v85 & 1) == 0)
      {
        double v48 = v84 / (double)v83;
        double v49 = COERCE_DOUBLE(sub_10015C644(v83));
        if (v50) {
          double v49 = 1.0;
        }
        double v45 = v48 * v49;
      }
      uint64_t v51 = v78;
      uint64_t v52 = v77;
      uint64_t v60 = v76;
      uint64_t v61 = v75;
      uint64_t v53 = v64;
      v47(v64, v73, v74);
      uint64_t v54 = (int *)type metadata accessor for ObservabilityHourlyReport();
      *(void *)(v53 + v54[5]) = v41;
      uint64_t v55 = (uint64_t *)(v53 + v54[6]);
      *uint64_t v55 = v43;
      v55[1] = v42;
      uint64_t v56 = v65;
      v55[2] = (uint64_t)v66;
      v55[3] = v56;
      uint64_t v57 = v62;
      v55[4] = (uint64_t)v63;
      v55[5] = v57;
      *(void *)(v53 + v54[7]) = v67;
      *(void *)(v53 + v54[8]) = v68;
      uint64_t v58 = v53 + v54[9];
      *(void *)uint64_t v58 = v72;
      *(unsigned char *)(v58 + 8) = v71;
      *(void *)(v58 + 16) = v70;
      *(unsigned char *)(v58 + 24) = (_BYTE)v69;
      *(void *)(v58 + 32) = v44;
      *(double *)(v58 + 40) = v45;
      *(unsigned char *)(v58 + 48) = v46;
      *(void *)(v53 + v54[10]) = v51;
      *(void *)(v53 + v54[11]) = v52;
      *(void *)(v53 + v54[12]) = v60;
      *(void *)(v53 + v54[13]) = v61;
      (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v54 - 1) + 56))(v53, 0, 1, v54);
    }
    else
    {
      uint64_t v59 = type metadata accessor for ObservabilityHourlyReport();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v64, 1, 1, v59);
    }
    return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v95);
  }
  return result;
}

uint64_t sub_10015C14C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, uint64_t *a9, uint64_t *a10)
{
  uint64_t v28 = a8;
  uint64_t v15 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v15);
  uint64_t v17 = (uint64_t *)((char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100158878(a1, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      uint64_t v19 = *v17;
      uint64_t v20 = v17[1];
      uint64_t v21 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
      sub_10015C3C0(v20);
      sub_10015B664(*(double *)&v19);
      if (__OFADD__(*a4, 1))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      uint64_t v22 = (uint64_t)v17 + v21;
      ++*a4;
      uint64_t v23 = type metadata accessor for BatchID;
      return sub_10015C6A4(v22, (uint64_t (*)(void))v23);
    case 2:
      uint64_t result = sub_10015C3C0(*v17);
      if (__OFADD__(*a5, 1)) {
        goto LABEL_22;
      }
      ++*a5;
      return result;
    case 3:
      if (__OFADD__(*a6, 1)) {
        goto LABEL_23;
      }
      ++*a6;
      uint64_t v24 = type metadata accessor for BatchID;
LABEL_9:
      uint64_t v23 = v24;
      uint64_t v22 = (uint64_t)v17;
      return sub_10015C6A4(v22, (uint64_t (*)(void))v23);
    case 6:
      char v25 = *((unsigned char *)v17 + 8);
      uint64_t result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        if (!__OFADD__(*a7, 1))
        {
          ++*a7;
          return result;
        }
LABEL_26:
        __break(1u);
        JUMPOUT(0x10015C3A0);
      }
      if (!__OFADD__(*v28, 1))
      {
        ++*v28;
        return result;
      }
      goto LABEL_25;
    case 7:
      unint64_t v26 = a10;
      uint64_t v27 = *a10 + *v17;
      if (!__OFADD__(*a10, *v17)) {
        goto LABEL_18;
      }
      __break(1u);
LABEL_17:
      unint64_t v26 = a9;
      uint64_t v27 = *a9 + 1;
      if (__OFADD__(*a9, 1)) {
        goto LABEL_24;
      }
LABEL_18:
      *unint64_t v26 = v27;
      return result;
    case 8:
      goto LABEL_17;
    default:
      uint64_t v24 = type metadata accessor for ObservabilitySignal;
      goto LABEL_9;
  }
}

uint64_t sub_10015C3C0(uint64_t result)
{
  uint64_t v2 = v1[1];
  char v3 = v2 <= result;
  if (v2 < result)
  {
    uint64_t v4 = v1 + 4;
    uint64_t v5 = v1[4];
    BOOL v6 = __OFADD__(v5, 1);
    uint64_t v7 = v5 + 1;
    char v3 = (v7 < 0) ^ v6 | (v7 == 0);
    if (!v6)
    {
LABEL_7:
      *uint64_t v4 = v7;
      goto LABEL_8;
    }
    __break(1u);
  }
  if (!v3)
  {
    uint64_t v4 = v1 + 5;
    uint64_t v8 = v1[5];
    BOOL v6 = __OFADD__(v8, 1);
    uint64_t v7 = v8 + 1;
    if (v6)
    {
      __break(1u);
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  if (v9 >= result) {
    uint64_t v9 = result;
  }
  v1[1] = result;
  v1[2] = v9;
  if (v10 <= result) {
    uint64_t v11 = result;
  }
  else {
    uint64_t v11 = v10;
  }
  v1[3] = v11;
  return result;
}

uint64_t type metadata accessor for ObservabilityHourlyReporter()
{
  return self;
}

uint64_t sub_10015C440@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000C440(&qword_1002874B8);
  __chkstk_darwin(v4 - 8);
  BOOL v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10015B6D4(a1, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for ObservabilityHourlyReport();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_10015C548((uint64_t)v6);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(void *)(a2 + 32) = 0;
  }
  else
  {
    *(void *)(a2 + 24) = v7;
    *(void *)(a2 + 32) = &off_100237D00;
    uint64_t v9 = sub_10010B318((uint64_t *)a2);
    return sub_10015C5A8((uint64_t)v6, (uint64_t)v9);
  }
  return result;
}

uint64_t sub_10015C548(uint64_t a1)
{
  uint64_t v2 = sub_10000C440(&qword_1002874B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10015C5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ObservabilityHourlyReport();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10015C60C(uint64_t a1)
{
  return sub_10015C14C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48), *(void **)(v1 + 56), *(void **)(v1 + 64), *(uint64_t **)(v1 + 72), *(uint64_t **)(v1 + 80));
}

uint64_t sub_10015C644(uint64_t result)
{
  double v1 = (double)result;
  if ((double)result >= 9.22337204e18)
  {
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  if ((uint64_t)v1 == result) {
    *(double *)&uint64_t result = (double)result;
  }
  else {
    *(double *)&uint64_t result = 0.0;
  }
  return result;
}

uint64_t sub_10015C6A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10015C704(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = a1;
  uint64_t v4 = sub_10019ABA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v56 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v55 = (char *)&v54 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v54 - v10;
  uint64_t v12 = sub_10000C440(&qword_100282D10);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v57 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v54 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v54 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v54 - v21;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v23((char *)&v54 - v21, 1, 1, v4);
  uint64_t v62 = a2;
  v23((char *)a2, 1, 1, v4);
  uint64_t v61 = v2;
  sub_100145784(v2, (uint64_t)v66, &qword_100287600);
  sub_100145784((uint64_t)v66, (uint64_t)&v67, &qword_100287600);
  uint64_t v58 = v5;
  uint64_t v60 = v4;
  if ((v68 & 1) == 0)
  {
    sub_10019AB80();
    uint64_t v27 = v11;
    sub_10019AAE0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    sub_1000808B4((uint64_t)v22, &qword_100282D10);
    v23(v20, 0, 1, v4);
    sub_100145784((uint64_t)v20, (uint64_t)v22, &qword_100282D10);
    uint64_t v24 = v61;
    uint64_t v25 = v62;
    uint64_t v26 = (uint64_t)v20;
    goto LABEL_10;
  }
  uint64_t v54 = v17;
  uint64_t v24 = v61;
  sub_100145784(v61 + 16, (uint64_t)v65, &qword_100286360);
  sub_100145784((uint64_t)v65, (uint64_t)v69, &qword_100286360);
  uint64_t v25 = v62;
  uint64_t v26 = (uint64_t)v20;
  uint64_t v27 = v11;
  if (!v69[1]) {
    goto LABEL_10;
  }
  id v28 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
  NSString v29 = sub_10019B0A0();
  id v30 = [v28 dateFromString:v29];

  if (!v30)
  {
    uint64_t v33 = (uint64_t)v54;
    v23(v54, 1, 1, v60);
    uint64_t v24 = v61;
    goto LABEL_8;
  }
  sub_10019AB70();

  uint64_t v31 = v58;
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
  uint64_t v33 = (uint64_t)v54;
  uint64_t v34 = v60;
  v32(v54, v27, v60);
  v23((char *)v33, 0, 1, v34);
  int v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v33, 1, v34);
  uint64_t v24 = v61;
  if (v35 == 1)
  {
LABEL_8:
    sub_1000808B4(v33, &qword_100282D10);
    goto LABEL_9;
  }
  sub_1000808B4((uint64_t)v22, &qword_100282D10);
  uint64_t v36 = v33;
  uint64_t v37 = v22;
  uint64_t v38 = v55;
  v32(v55, (char *)v36, v34);
  uint64_t v39 = v38;
  uint64_t v22 = v37;
  v32(v37, v39, v34);
  v23(v37, 0, 1, v34);
LABEL_9:
  uint64_t v25 = v62;
LABEL_10:
  sub_100145784(v24 + 32, (uint64_t)v64, &qword_100287600);
  sub_100145784((uint64_t)v64, (uint64_t)&v70, &qword_100287600);
  if ((v71 & 1) == 0)
  {
    sub_10019AB80();
    sub_10019AAE0();
    uint64_t v51 = v27;
    uint64_t v52 = v60;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v51, v60);
    sub_1000808B4(v25, &qword_100282D10);
    v23((char *)v26, 0, 1, v52);
    sub_100145784(v26, v25, &qword_100282D10);
    return sub_100145784((uint64_t)v22, v59, &qword_100282D10);
  }
  sub_100145784(v24 + 48, (uint64_t)v63, &qword_100286360);
  sub_100145784((uint64_t)v63, (uint64_t)v72, &qword_100286360);
  if (v72[1])
  {
    uint64_t v40 = v23;
    uint64_t v41 = v25;
    id v42 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
    NSString v43 = sub_10019B0A0();
    id v44 = [v42 dateFromString:v43];

    if (v44)
    {
      sub_10019AB70();

      uint64_t v45 = v58;
      char v46 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      uint64_t v47 = (uint64_t)v57;
      uint64_t v48 = v60;
      v46(v57, v27, v60);
      v40((char *)v47, 0, 1, v48);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v47, 1, v48) != 1)
      {
        uint64_t v49 = v41;
        sub_1000808B4(v41, &qword_100282D10);
        char v50 = v56;
        v46(v56, (char *)v47, v48);
        v46((char *)v49, v50, v48);
        v40((char *)v49, 0, 1, v48);
        return sub_100145784((uint64_t)v22, v59, &qword_100282D10);
      }
    }
    else
    {
      uint64_t v47 = (uint64_t)v57;
      v40(v57, 1, 1, v60);
    }
    sub_1000808B4(v47, &qword_100282D10);
  }
  return sub_100145784((uint64_t)v22, v59, &qword_100282D10);
}

uint64_t sub_10015CE38(void *a1)
{
  uint64_t v3 = sub_10000C440(&qword_100287648);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10007FDE0(a1, a1[3]);
  sub_10015FAA0();
  sub_10019B830();
  v8[15] = 0;
  sub_10019B690();
  if (!v1)
  {
    v8[14] = 1;
    sub_10019B680();
    v8[13] = 2;
    sub_10019B690();
    v8[12] = 3;
    sub_10019B680();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10015CFF0()
{
  uint64_t result = 0x79616C6544776F6CLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656D6954776F6CLL;
      break;
    case 2:
      uint64_t result = 0x616C654468676968;
      break;
    case 3:
      uint64_t result = 0x656D695468676968;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10015D080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10015F67C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10015D0A8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10015D0B4(uint64_t a1)
{
  unint64_t v2 = sub_10015FAA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015D0F0(uint64_t a1)
{
  unint64_t v2 = sub_10015FAA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10015D12C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10015F844(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_10015D170(void *a1)
{
  return sub_10015CE38(a1);
}

void sub_10015D1AC()
{
  uint64_t v1 = self;
  id v2 = [v1 sharedInstance];
  if (v2)
  {
    uint64_t v3 = v2;
    swift_retain();
    id v4 = [v1 sharedInstance];
    if (v4)
    {
      long long v5 = v4;
      NSString v6 = sub_10019B0A0();
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = sub_10015F198;
      *(void *)(v7 + 24) = v0;
      v9[4] = sub_10015F1EC;
      v9[5] = v7;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256;
      long long v9[2] = sub_10015F008;
      v9[3] = &unk_100237E88;
      long long v8 = _Block_copy(v9);
      swift_retain();
      swift_release();
      [v5 subscribeForMessage:v6 handler:v8];
      _Block_release(v8);

      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

uint64_t sub_10015D358(long long *a1, uint64_t a2)
{
  uint64_t v45 = a2;
  uint64_t v43 = type metadata accessor for PeriodicWorkRequest();
  __chkstk_darwin(v43);
  id v44 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10019ABA0();
  char v46 = *(void **)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  id v42 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v41 - v7;
  uint64_t v9 = sub_10000C440(&qword_1002875F8);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000C440(&qword_100282D10);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v41 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v41 - v20;
  long long v22 = a1[1];
  long long v47 = *a1;
  long long v48 = v22;
  long long v23 = a1[3];
  long long v49 = a1[2];
  long long v50 = v23;
  sub_10015C704((uint64_t)&v41 - v20, (uint64_t)v19);
  uint64_t v24 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_100145784((uint64_t)v21, (uint64_t)v12, &qword_100282D10);
  uint64_t v25 = (uint64_t)v19;
  uint64_t v26 = v46;
  sub_100145784(v25, v24, &qword_100282D10);
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v26[6];
  if (v27((uint64_t)v12, 1, v4) != 1)
  {
    sub_10000C660((uint64_t)v12, (uint64_t)v16);
    int v30 = v27(v24, 1, v4);
    uint64_t v31 = (void (*)(char *, char *, uint64_t))v26[4];
    v31(v8, v16, v4);
    if (v30 != 1)
    {
      uint64_t v41 = v8;
      uint64_t v33 = v42;
      v31(v42, (char *)v24, v4);
      uint64_t v34 = sub_10000C440(&qword_100286BE0);
      uint64_t v35 = (uint64_t)v44;
      uint64_t v36 = &v44[*(int *)(v34 + 48)];
      uint64_t v37 = (void (*)(char *, char *, uint64_t))v26[2];
      uint64_t v38 = v41;
      v37(v44, v41, v4);
      v37(v36, v33, v4);
      swift_storeEnumTagMultiPayload();
      sub_10015D9F0(v35);
      sub_10015F35C(v35, (uint64_t (*)(void))type metadata accessor for PeriodicWorkRequest);
      uint64_t v39 = (void (*)(char *, uint64_t))v26[1];
      v39(v33, v4);
      v39(v38, v4);
      goto LABEL_9;
    }
    uint64_t v32 = (uint64_t)v44;
    ((void (*)(char *, char *, uint64_t))v26[2])(v44, v8, v4);
LABEL_7:
    swift_storeEnumTagMultiPayload();
    sub_10015D9F0(v32);
    sub_10015F35C(v32, (uint64_t (*)(void))type metadata accessor for PeriodicWorkRequest);
    ((void (*)(char *, uint64_t))v26[1])(v8, v4);
LABEL_9:
    NSString v29 = &qword_100282D10;
    uint64_t v28 = 19279;
    goto LABEL_10;
  }
  if (v27(v24, 1, v4) != 1)
  {
    ((void (*)(char *, uint64_t, uint64_t))v26[4])(v8, v24, v4);
    uint64_t v32 = (uint64_t)v44;
    ((void (*)(char *, char *, uint64_t))v26[2])(v44, v8, v4);
    goto LABEL_7;
  }
  uint64_t v28 = 0x726F727245;
  NSString v29 = &qword_1002875F8;
LABEL_10:
  sub_1000808B4((uint64_t)v12, v29);
  return v28;
}

uint64_t sub_10015D834(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  return sub_10015D870(a2, a3, a4);
}

uint64_t sub_10015D870(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (qword_100284FA8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10019AF80();
  sub_100128E40(v5, (uint64_t)qword_10028D348);
  uint64_t v6 = sub_10019AF60();
  os_log_type_t v7 = sub_10019B3C0();
  if (os_log_type_enabled(v6, v7))
  {
    long long v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Starting work…", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = swift_beginAccess();
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v12 = v10 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_10010B568(v12, (uint64_t)v14);
      sub_10007FDE0(v14, v14[3]);
      sub_1001346E0();
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v14);
      v12 += 40;
      --v11;
    }
    while (v11);
    uint64_t v9 = swift_bridgeObjectRelease();
  }
  a3(v9);
  return sub_10014F408();
}

uint64_t sub_10015D9F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeriodicWorkRequest();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 40;
  uint64_t v5 = sub_10019ABA0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 40;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v40 - v11 + 40;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)v40 - v14 + 40;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)v40 - v17 + 40;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v40 - v19 + 40;
  sub_10019AB90();
  sub_10015F134(a1, (uint64_t)v4);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v4, v5);
      if (sub_10019AB00())
      {
        uint64_t v22 = v39 + 32;
        swift_beginAccess();
        sub_10010B568(v22, (uint64_t)v40);
        uint64_t v24 = v41;
        uint64_t v23 = v42;
        sub_10007FDE0(v40, v41);
        (*(void (**)(char *, uint64_t, uint64_t))(v23 + 40))(v15, v24, v23);
        uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
        v25(v15, v5);
LABEL_11:
        v25(v20, v5);
        return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v40);
      }
      uint64_t v38 = *(void (**)(char *, uint64_t))(v6 + 8);
      v38(v15, v5);
    }
    else
    {
      NSString v29 = &v4[*(int *)(sub_10000C440(&qword_100286BE0) + 48)];
      int v30 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v30(v12, v4, v5);
      v30(v9, v29, v5);
      if (sub_10019AB00())
      {
        uint64_t v31 = v39 + 32;
        swift_beginAccess();
        sub_10010B568(v31, (uint64_t)v40);
        uint64_t v32 = v41;
        uint64_t v33 = v42;
        sub_10007FDE0(v40, v41);
        (*(void (**)(char *, uint64_t, uint64_t))(v33 + 40))(v9, v32, v33);
        _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v40);
      }
      if (sub_10019AB00())
      {
        uint64_t v34 = v39 + 72;
        swift_beginAccess();
        sub_10010B568(v34, (uint64_t)v40);
        uint64_t v36 = v41;
        uint64_t v35 = v42;
        sub_10007FDE0(v40, v41);
        (*(void (**)(char *, uint64_t, uint64_t))(v35 + 40))(v12, v36, v35);
        uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
        v25(v9, v5);
        v25(v12, v5);
        goto LABEL_11;
      }
      uint64_t v38 = *(void (**)(char *, uint64_t))(v6 + 8);
      v38(v9, v5);
      v38(v12, v5);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v18, v4, v5);
    if (sub_10019AB00())
    {
      uint64_t v26 = v39 + 72;
      swift_beginAccess();
      sub_10010B568(v26, (uint64_t)v40);
      uint64_t v28 = v41;
      uint64_t v27 = v42;
      sub_10007FDE0(v40, v41);
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 40))(v18, v28, v27);
      uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
      v25(v18, v5);
      goto LABEL_11;
    }
    uint64_t v38 = *(void (**)(char *, uint64_t))(v6 + 8);
    v38(v18, v5);
  }
  return ((uint64_t (*)(char *, uint64_t))v38)(v20, v5);
}

uint64_t sub_10015DEAC()
{
  sub_10000C7B8(v0 + 16);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 32);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 72);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ObservabilityPeriodicPlanner()
{
  return self;
}

uint64_t sub_10015DF20(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v8 = sub_10000C440(&qword_100287608);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ObservabilityStateDumper.ObservabilityStateDumperParams(0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10015EDA4(a2, type metadata accessor for ObservabilityStateDumper.ObservabilityStateDumperParams, &qword_100287610, (void (*)(uint64_t))type metadata accessor for ObservabilityStateDumper.ObservabilityStateDumperParams, (uint64_t)&unk_1001D7690, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1000808B4((uint64_t)v10, &qword_100287608);
    sub_10015F24C();
    uint64_t v15 = swift_allocError();
    *uint64_t v16 = 0xD00000000000001DLL;
    v16[1] = 0x80000001002148E0;
    swift_willThrow();
    uint64_t v24 = v15;
    swift_errorRetain();
    sub_10000C440(&qword_1002875D8);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      strcpy((char *)v22, "Parse Error: ");
      HIWORD(v22[1]) = -4864;
      sub_10019B190(v23);
      swift_bridgeObjectRelease();
      ((void (*)(void, void))a3)(v22[0], v22[1]);
    }
    else
    {
      swift_errorRelease();
      swift_getErrorValue();
      sub_10019B770();
      uint64_t v18 = sub_10019B130();
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))a3)(v18, v20);
    }
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    sub_10015F2F4((uint64_t)v10, (uint64_t)v14, type metadata accessor for ObservabilityStateDumper.ObservabilityStateDumperParams);
    uint64_t v17 = a5(v14);
    a3(v17);
    swift_bridgeObjectRelease();
    return sub_10015F35C((uint64_t)v14, type metadata accessor for ObservabilityStateDumper.ObservabilityStateDumperParams);
  }
}

uint64_t sub_10015E294(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t (*a5)(Swift::String *))
{
  sub_10015EBE4(a2, &v31);
  uint64_t v22 = a3;
  uint64_t v7 = v31;
  char v8 = BYTE8(v31);
  uint64_t v10 = v32;
  uint64_t v9 = v33;
  uint64_t v11 = v34;
  char v12 = v35;
  uint64_t v13 = v37;
  uint64_t v21 = v36;
  sub_100145784((uint64_t)&v31, (uint64_t)v38, &qword_1002875E0);
  if (v39 == 1)
  {
    sub_10015F24C();
    uint64_t v14 = swift_allocError();
    *uint64_t v15 = 0xD00000000000001DLL;
    v15[1] = 0x80000001002148E0;
    swift_willThrow();
    v23[6] = v14;
    swift_errorRetain();
    sub_10000C440(&qword_1002875D8);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      strcpy((char *)v23, "Parse Error: ");
      HIWORD(v23[1]) = -4864;
      sub_10019B190(v24);
      swift_bridgeObjectRelease();
      ((void (*)(void, void))v22)(v23[0], v23[1]);
    }
    else
    {
      swift_errorRelease();
      swift_getErrorValue();
      sub_10019B770();
      uint64_t v17 = sub_10019B130();
      uint64_t v19 = v18;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))v22)(v17, v19);
    }
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    v24._countAndFlagsBits = v7;
    LOBYTE(v24._object) = v8 & 1;
    uint64_t v25 = v10;
    uint64_t v26 = v9;
    uint64_t v27 = v11;
    char v28 = v12 & 1;
    uint64_t v29 = v21;
    uint64_t v30 = v13;
    uint64_t v16 = a5(&v24);
    v22(v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10015E4FC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v8 = sub_10000C440(&qword_100287628);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ObservabilityReportWorkerParamsTime(0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10015EDA4(a2, type metadata accessor for ObservabilityReportWorkerParamsTime, &qword_100287630, (void (*)(uint64_t))type metadata accessor for ObservabilityReportWorkerParamsTime, (uint64_t)&unk_1001D99E0, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1000808B4((uint64_t)v10, &qword_100287628);
    sub_10015F24C();
    uint64_t v15 = swift_allocError();
    *uint64_t v16 = 0xD00000000000001DLL;
    v16[1] = 0x80000001002148E0;
    swift_willThrow();
    uint64_t v24 = v15;
    swift_errorRetain();
    sub_10000C440(&qword_1002875D8);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      strcpy((char *)v22, "Parse Error: ");
      HIWORD(v22[1]) = -4864;
      sub_10019B190(v23);
      swift_bridgeObjectRelease();
      ((void (*)(void, void))a3)(v22[0], v22[1]);
    }
    else
    {
      swift_errorRelease();
      swift_getErrorValue();
      sub_10019B770();
      uint64_t v18 = sub_10019B130();
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))a3)(v18, v20);
    }
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    sub_10015F2F4((uint64_t)v10, (uint64_t)v14, type metadata accessor for ObservabilityReportWorkerParamsTime);
    uint64_t v17 = a5(v14);
    a3(v17);
    swift_bridgeObjectRelease();
    return sub_10015F35C((uint64_t)v14, type metadata accessor for ObservabilityReportWorkerParamsTime);
  }
}

uint64_t sub_10015E870(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v8 = sub_10000C440(&qword_100287618);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ObservabilityReportWorkerParamsRange(0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10015EDA4(a2, type metadata accessor for ObservabilityReportWorkerParamsRange, &qword_100287620, (void (*)(uint64_t))type metadata accessor for ObservabilityReportWorkerParamsRange, (uint64_t)&unk_1001D9A08, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1000808B4((uint64_t)v10, &qword_100287618);
    sub_10015F24C();
    uint64_t v15 = swift_allocError();
    *uint64_t v16 = 0xD00000000000001DLL;
    v16[1] = 0x80000001002148E0;
    swift_willThrow();
    uint64_t v24 = v15;
    swift_errorRetain();
    sub_10000C440(&qword_1002875D8);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      strcpy((char *)v22, "Parse Error: ");
      HIWORD(v22[1]) = -4864;
      sub_10019B190(v23);
      swift_bridgeObjectRelease();
      ((void (*)(void, void))a3)(v22[0], v22[1]);
    }
    else
    {
      swift_errorRelease();
      swift_getErrorValue();
      sub_10019B770();
      uint64_t v18 = sub_10019B130();
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))a3)(v18, v20);
    }
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    sub_10015F2F4((uint64_t)v10, (uint64_t)v14, type metadata accessor for ObservabilityReportWorkerParamsRange);
    uint64_t v17 = a5(v14);
    a3(v17);
    swift_bridgeObjectRelease();
    return sub_10015F35C((uint64_t)v14, type metadata accessor for ObservabilityReportWorkerParamsRange);
  }
}

uint64_t sub_10015EBE4@<X0>(uint64_t a1@<X1>, _OWORD *a2@<X8>)
{
  uint64_t v5 = sub_10019B100();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = xmmword_1001D8EC0;
  long long v11 = 0uLL;
  if (a1)
  {
    v17[0] = xmmword_1001D8EC0;
    sub_10019A830();
    swift_allocObject();
    sub_10019A820();
    sub_10019B0F0();
    uint64_t v12 = sub_10019B0C0();
    unint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    if (v14 >> 60 == 15)
    {
      uint64_t result = swift_release();
      long long v15 = 0uLL;
      long long v16 = 0uLL;
      long long v10 = v17[0];
      long long v11 = 0uLL;
    }
    else
    {
      sub_10015F2A0();
      sub_10019A810();
      sub_10007FF14(v12, v14);
      uint64_t result = swift_release();
      if (v2) {
        return result;
      }
      long long v11 = v17[1];
      long long v10 = v17[2];
      long long v15 = v17[3];
      long long v16 = v17[4];
    }
  }
  else
  {
    long long v15 = 0uLL;
    long long v16 = 0uLL;
  }
  *a2 = v11;
  a2[1] = v10;
  a2[2] = v15;
  a2[3] = v16;
  return result;
}

uint64_t sub_10015EDA4@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(void)@<X2>, unint64_t *a3@<X3>, void (*a4)(uint64_t)@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v24 = a4;
  Swift::String v23 = a3;
  uint64_t v11 = sub_10019B100();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v22 = a5;
    sub_10019A830();
    swift_allocObject();
    sub_10019A820();
    sub_10019B0F0();
    uint64_t v15 = sub_10019B0C0();
    unint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v18 = a2(0);
    uint64_t v19 = v18;
    if (v17 >> 60 == 15)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a6, 1, 1, v18);
    }
    else
    {
      sub_10015F3BC(v23, v24);
      sub_10019A810();
      if (!v6) {
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a6, 0, 1, v19);
      }
      sub_10007FF14(v15, v17);
    }
    return swift_release();
  }
  else
  {
    uint64_t v20 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a6, 1, 1, v20);
  }
}

uint64_t sub_10015F008(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, void *), uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_10019B0B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_retain();
  v4(v5, v7, sub_10015F244, v9);
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10015F0D8(uint64_t a1, NSString a2, uint64_t a3)
{
  if (a2) {
    a2 = sub_10019B0A0();
  }
  id v4 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_10015F134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeriodicWorkRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10015F198(long long *a1)
{
  return sub_10015D358(a1, v1);
}

uint64_t sub_10015F1B4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10015F1EC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_10015E294(a1, a2, a3, a4, *(uint64_t (**)(Swift::String *))(v4 + 16));
}

uint64_t sub_10015F1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10015F204()
{
  return swift_release();
}

uint64_t sub_10015F20C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10015F244(uint64_t a1, void *a2)
{
  sub_10015F0D8(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_10015F24C()
{
  unint64_t result = qword_1002875E8;
  if (!qword_1002875E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002875E8);
  }
  return result;
}

unint64_t sub_10015F2A0()
{
  unint64_t result = qword_1002875F0;
  if (!qword_1002875F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002875F0);
  }
  return result;
}

uint64_t sub_10015F2F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10015F35C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10015F3BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for PlannerTestParams()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PlannerTestParams(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PlannerTestParams(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PlannerTestParams(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PlannerTestParams(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlannerTestParams(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PlannerTestParams(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlannerTestParams()
{
  return &type metadata for PlannerTestParams;
}

uint64_t sub_10015F67C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x79616C6544776F6CLL && a2 == 0xE800000000000000;
  if (v2 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D6954776F6CLL && a2 == 0xE700000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616C654468676968 && a2 == 0xE900000000000079 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D695468676968 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10019B720();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10015F844@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000C440(&qword_100287638);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10007FDE0(a1, a1[3]);
  sub_10015FAA0();
  sub_10019B820();
  if (v2)
  {
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v29 = 0;
    uint64_t v9 = sub_10019B610();
    int v25 = v10;
    char v28 = 1;
    uint64_t v11 = sub_10019B600();
    uint64_t v13 = v12;
    uint64_t v24 = v11;
    char v27 = 2;
    uint64_t v14 = sub_10019B610();
    int v22 = v15;
    uint64_t v23 = v14;
    char v26 = 3;
    uint64_t v16 = sub_10019B600();
    unint64_t v17 = v8;
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
    uint64_t result = _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
    *(void *)a2 = v9;
    *(unsigned char *)(a2 + 8) = v25 & 1;
    *(void *)(a2 + 16) = v24;
    *(void *)(a2 + 24) = v13;
    *(void *)(a2 + 32) = v23;
    *(unsigned char *)(a2 + 40) = v22 & 1;
    *(void *)(a2 + 48) = v16;
    *(void *)(a2 + 56) = v19;
  }
  return result;
}

unint64_t sub_10015FAA0()
{
  unint64_t result = qword_100287640;
  if (!qword_100287640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287640);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PlannerTestParams.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10015FBC0);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlannerTestParams.CodingKeys()
{
  return &type metadata for PlannerTestParams.CodingKeys;
}

unint64_t sub_10015FBFC()
{
  unint64_t result = qword_100287650;
  if (!qword_100287650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287650);
  }
  return result;
}

unint64_t sub_10015FC54()
{
  unint64_t result = qword_100287658;
  if (!qword_100287658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287658);
  }
  return result;
}

unint64_t sub_10015FCAC()
{
  unint64_t result = qword_100287660;
  if (!qword_100287660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287660);
  }
  return result;
}

uint64_t sub_10015FD00()
{
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ECPrimitiveEventSink()
{
  return self;
}

uint64_t sub_10015FD5C(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = v1 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime;
  sub_10019AAB0();
  uint64_t v5 = sub_10019ABA0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  uint64_t v6 = OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock;
  *(void *)(v2 + v6) = [objc_allocWithZone((Class)APUnfairLock) initWithOptions:1];
  uint64_t v7 = v2 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_xpcActivity;
  sub_10010B568(a1, v2 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_xpcActivity);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 24);
  uint64_t v9 = *(void *)(v7 + 32);
  sub_100132FEC(v7, v8);
  int v10 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v9 + 16);
  uint64_t v11 = swift_retain();
  v10(v11, &off_100238000, v8, v9);
  swift_endAccess();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
  return v2;
}

id sub_10015FEAC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10019ACD0();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v61 = v4;
  __chkstk_darwin(v4);
  uint64_t v59 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10019ABA0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  int v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = sub_10000C440(&qword_100282D10);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v58 = (uint64_t)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v57 = (char *)&v52 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v52 - v19;
  __chkstk_darwin(v18);
  int v22 = (char *)&v52 - v21;
  uint64_t v23 = OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock;
  [*(id *)(v2 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock) lock];
  uint64_t v24 = v2 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime;
  swift_beginAccess();
  sub_10000C660(v24, (uint64_t)v22);
  sub_10000C660((uint64_t)v22, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v20, 1, v6) == 1)
  {
    sub_10000C4EC((uint64_t)v20);
    sub_10000C4EC((uint64_t)v22);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v20, v6);
    char v25 = sub_10019AB10();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    sub_10000C4EC((uint64_t)v22);
    if ((v25 & 1) == 0) {
      return [*(id *)(v2 + v23) unlock];
    }
  }
  uint64_t v62 = v23;
  uint64_t v63 = v2;
  sub_10019B3A0();
  uint64_t v26 = sub_10000C6C8(0, (unint64_t *)&qword_100284870);
  unint64_t v54 = 0x800000010020C420;
  uint64_t v55 = v26;
  char v27 = (void *)sub_10019B470();
  uint64_t v53 = sub_10000C440((uint64_t *)&unk_100285520);
  uint64_t v28 = a1;
  uint64_t v29 = swift_allocObject();
  long long v52 = xmmword_1001D69A0;
  *(_OWORD *)(v29 + 16) = xmmword_1001D69A0;
  uint64_t v30 = sub_10019AAD0();
  uint64_t v32 = v31;
  *(void *)(v29 + 56) = &type metadata for String;
  unint64_t v56 = sub_100078904();
  *(void *)(v29 + 64) = v56;
  *(void *)(v29 + 32) = v30;
  *(void *)(v29 + 40) = v32;
  sub_10019AF50();

  uint64_t v33 = v28;
  swift_bridgeObjectRelease();
  sub_10019AB90();
  LOBYTE(v32) = sub_10019AB00();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  if (v32)
  {
    uint64_t v34 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v57, v28, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v34, 0, 1, v6);
    uint64_t v35 = (uint64_t)v34;
    uint64_t v36 = v58;
    sub_10000C54C(v35, v58);
    swift_beginAccess();
    sub_10000C484(v36, v24);
    swift_endAccess();
    uint64_t v2 = v63;
    uint64_t v37 = v63 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_xpcActivity;
    swift_beginAccess();
    sub_10010B568(v37, (uint64_t)v64);
    uint64_t v38 = v65;
    uint64_t v39 = v66;
    sub_10007FDE0(v64, v65);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v33, v38, v39);
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v64);
  }
  else
  {
    sub_10019B3B0();
    uint64_t v40 = (void *)sub_10019B470();
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = v52;
    id v42 = [self apLocalSharedFormatter];
    uint64_t v43 = v59;
    sub_10019ACC0();
    Class isa = sub_10019ACB0().super.isa;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v43, v61);
    [v42 setTimeZone:isa];

    Class v45 = sub_10019AAF0().super.isa;
    id v46 = [v42 stringFromDate:v45];

    uint64_t v47 = sub_10019B0B0();
    uint64_t v49 = v48;

    unint64_t v50 = v56;
    *(void *)(v41 + 56) = &type metadata for String;
    *(void *)(v41 + 64) = v50;
    *(void *)(v41 + 32) = v47;
    *(void *)(v41 + 40) = v49;
    sub_10019AF50();

    swift_bridgeObjectRelease();
    uint64_t v2 = v63;
  }
  uint64_t v23 = v62;
  return [*(id *)(v2 + v23) unlock];
}

uint64_t sub_100160540()
{
  sub_10000C7B8(v0 + 16);
  sub_10000C4EC(v0 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_xpcActivity);

  return swift_deallocClassInstance();
}

uint64_t sub_1001605CC()
{
  return type metadata accessor for ObservabilityXPCTimer();
}

uint64_t type metadata accessor for ObservabilityXPCTimer()
{
  uint64_t result = qword_100287748;
  if (!qword_100287748) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100160620()
{
  sub_10000C3E8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1001606D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime;
  swift_beginAccess();
  return sub_10000C660(v3, a1);
}

id sub_10016072C(uint64_t a1)
{
  return sub_10015FEAC(a1);
}

uint64_t sub_100160750(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10019AF90();
  uint64_t v62 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10019AFB0();
  uint64_t v61 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v60 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10019ABA0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000C440(&qword_100282D10);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v57 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v52 - v18;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return a1();
  }
  uint64_t v59 = (void (*)(void))a1;
  unint64_t v54 = v8;
  uint64_t v55 = v9;
  uint64_t v56 = v6;
  uint64_t v64 = a2;
  LODWORD(v58) = sub_10019B3A0();
  sub_10000C6C8(0, (unint64_t *)&qword_100284870);
  uint64_t v20 = (void *)sub_10019B470();
  sub_10000C440((uint64_t *)&unk_100285520);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1001D69A0;
  uint64_t v22 = v3;
  uint64_t v23 = v3 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime;
  swift_beginAccess();
  sub_10000C660(v23, (uint64_t)v19);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v19, 1, v11);
  uint64_t v53 = v11;
  if (v24)
  {
    sub_10000C4EC((uint64_t)v19);
    uint64_t v25 = 0;
    unint64_t v26 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v19, v11);
    sub_10000C4EC((uint64_t)v19);
    uint64_t v25 = sub_10019AAD0();
    unint64_t v26 = v28;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v29 = v59;
  *(void *)(v21 + 56) = &type metadata for String;
  *(void *)(v21 + 64) = sub_100078904();
  uint64_t v30 = 7104878;
  if (v26) {
    uint64_t v30 = v25;
  }
  unint64_t v31 = 0xE300000000000000;
  if (v26) {
    unint64_t v31 = v26;
  }
  *(void *)(v21 + 32) = v30;
  *(void *)(v21 + 40) = v31;
  sub_10019AF50();

  swift_bridgeObjectRelease();
  uint64_t v32 = (void *)swift_allocObject();
  uint64_t v33 = v64;
  v32[2] = v29;
  v32[3] = v33;
  uint64_t v34 = v22;
  v32[4] = v22;
  uint64_t v35 = qword_100284FA8;
  swift_retain_n();
  swift_retain_n();
  if (v35 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_10019AF80();
  sub_100128E40(v36, (uint64_t)qword_10028D348);
  uint64_t v37 = sub_10019AF60();
  os_log_type_t v38 = sub_10019B3A0();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "ObservabilityPeriodicPlanner got 'Timer Fired' signal from underlying timer", v39, 2u);
    swift_slowDealloc();
  }

  uint64_t v40 = Strong;
  uint64_t v41 = swift_unknownObjectWeakLoadStrong();
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)(v40 + 24);
    uint64_t v44 = os_transaction_create();
    uint64_t v59 = *(void (**)(void))(v40 + 112);
    Class v45 = (void *)swift_allocObject();
    v45[2] = v44;
    v45[3] = v42;
    v45[4] = v43;
    v45[5] = sub_100161FA0;
    v45[6] = v32;
    aBlock[4] = sub_100161F5C;
    aBlock[5] = v45;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10014D6BC;
    aBlock[3] = &unk_100238118;
    id v46 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v47 = v60;
    sub_10019AFA0();
    uint64_t v65 = _swiftEmptyArrayStorage;
    sub_10014DAD8(&qword_1002869E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    uint64_t v58 = v22;
    sub_10000C440(&qword_1002869E8);
    sub_10014DB20(&qword_1002869F0, &qword_1002869E8);
    uint64_t v48 = v54;
    uint64_t v49 = v56;
    sub_10019B4E0();
    sub_10019B420();
    _Block_release(v46);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v48, v49);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v47, v55);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    v29();
    uint64_t v50 = OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock;
    [*(id *)(v22 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock) lock];
    uint64_t v51 = (uint64_t)v57;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v57, 1, 1, v53);
    swift_beginAccess();
    sub_10000C484(v51, v23);
    swift_endAccess();
    [*(id *)(v34 + v50) unlock];
    swift_unknownObjectRelease();
  }
  swift_release();
  swift_release();
  return swift_release();
}

id sub_100160F14(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000C440(&qword_100282D10);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1(v6);
  uint64_t v9 = OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock;
  [*(id *)(a3 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock) lock];
  uint64_t v10 = sub_10019ABA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  uint64_t v11 = a3 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime;
  swift_beginAccess();
  sub_10000C484((uint64_t)v8, v11);
  swift_endAccess();
  return [*(id *)(a3 + v9) unlock];
}

uint64_t sub_100161038(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10019AF90();
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v70 = v4;
  __chkstk_darwin(v4);
  uint64_t v66 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10019AFD0();
  uint64_t v67 = *(void *)(v6 - 8);
  uint64_t v68 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v61 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v65 = (char *)v54 - v9;
  uint64_t v57 = sub_10019B410();
  uint64_t v60 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v56 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_10019B3E0();
  __chkstk_darwin(v58);
  uint64_t v59 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10019AFB0();
  uint64_t v63 = *(void *)(v12 - 8);
  uint64_t v64 = v12;
  __chkstk_darwin(v12);
  uint64_t v62 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10019ACD0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000C440(&qword_100282D10);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54[1] = sub_10019B3A0();
  sub_10000C6C8(0, (unint64_t *)&qword_100284870);
  uint64_t v21 = (void *)sub_10019B470();
  sub_10000C440((uint64_t *)&unk_100285520);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1001D69A0;
  uint64_t v55 = a1;
  sub_10000C660(a1, (uint64_t)v20);
  uint64_t v23 = sub_10019ABA0();
  uint64_t v24 = *(void *)(v23 - 8);
  int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v20, 1, v23);
  uint64_t v71 = v1;
  if (v25 == 1)
  {
    sub_10000C4EC((uint64_t)v20);
    uint64_t v26 = 0;
    unint64_t v27 = 0;
  }
  else
  {
    id v28 = [self apLocalSharedFormatter];
    sub_10019ACC0();
    Class isa = sub_10019ACB0().super.isa;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    [v28 setTimeZone:isa];

    Class v30 = sub_10019AAF0().super.isa;
    id v31 = [v28 stringFromDate:v30];

    uint64_t v26 = sub_10019B0B0();
    unint64_t v27 = v32;

    uint64_t v2 = v71;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v20, v23);
  }
  uint64_t v33 = v57;
  uint64_t v34 = v56;
  uint64_t v35 = v55;
  *(void *)(v22 + 56) = &type metadata for String;
  *(void *)(v22 + 64) = sub_100078904();
  uint64_t v36 = 7104878;
  if (v27) {
    uint64_t v36 = v26;
  }
  unint64_t v37 = 0xE300000000000000;
  if (v27) {
    unint64_t v37 = v27;
  }
  *(void *)(v22 + 32) = v36;
  *(void *)(v22 + 40) = v37;
  sub_10019AF50();

  swift_bridgeObjectRelease();
  uint64_t v38 = OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock;
  [*(id *)(v2 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_lock) lock];
  uint64_t v39 = v2 + OBJC_IVAR____TtC7Metrics21ObservabilityXPCTimer_scheduledTime;
  swift_beginAccess();
  sub_100161ED0(v35, v39);
  swift_endAccess();
  [*(id *)(v2 + v38) unlock];
  uint64_t v40 = self;
  sub_10000C6C8(0, (unint64_t *)&qword_100282D20);
  id v41 = [v40 configurationForClass:swift_getObjCClassFromMetadata()];
  self;
  uint64_t v42 = (void *)swift_dynamicCastObjCClass();
  if (v42)
  {
    id v43 = [v42 regularJobDaemonStartDelay];
    if (v43)
    {
      uint64_t v44 = v43;
      [v43 doubleValue];
    }
  }
  swift_unknownObjectRelease();
  sub_10000C6C8(0, (unint64_t *)&unk_1002869C0);
  Class v45 = v62;
  sub_10019AFA0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10014DAD8(&qword_100286500, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000C440((uint64_t *)&unk_1002869D0);
  sub_10014DB20((unint64_t *)&qword_100286508, (uint64_t *)&unk_1002869D0);
  sub_10019B4E0();
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v34, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v33);
  id v46 = (void *)sub_10019B430();
  uint64_t v47 = v61;
  sub_10019AFC0();
  uint64_t v48 = v65;
  sub_10019B010();
  uint64_t v49 = v68;
  uint64_t v67 = *(void *)(v67 + 8);
  ((void (*)(char *, uint64_t))v67)(v47, v68);
  aBlock[4] = sub_100161F38;
  aBlock[5] = v71;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10014D6BC;
  aBlock[3] = &unk_100238050;
  uint64_t v50 = _Block_copy(aBlock);
  swift_retain();
  sub_10019AFA0();
  uint64_t v72 = _swiftEmptyArrayStorage;
  sub_10014DAD8(&qword_1002869E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000C440(&qword_1002869E8);
  sub_10014DB20(&qword_1002869F0, &qword_1002869E8);
  uint64_t v51 = v66;
  uint64_t v52 = v70;
  sub_10019B4E0();
  sub_10019B3F0();
  _Block_release(v50);

  (*(void (**)(char *, uint64_t))(v69 + 8))(v51, v52);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v45, v64);
  ((void (*)(char *, uint64_t))v67)(v48, v49);
  return swift_release();
}

uint64_t sub_1001619F4()
{
  uint64_t v0 = sub_10019AF90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10019AFB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10019B3A0();
  sub_10000C6C8(0, (unint64_t *)&qword_100284870);
  uint64_t v8 = (void *)sub_10019B470();
  sub_10019AF50();

  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    if (qword_100284FA8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10019AF80();
    sub_100128E40(v11, (uint64_t)qword_10028D348);
    uint64_t v12 = sub_10019AF60();
    os_log_type_t v13 = sub_10019B3A0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "ObservabilityPeriodicPlanner got 'Timer Fired' signal from underlying timer", v14, 2u);
      swift_slowDealloc();
    }

    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v16 = Strong;
      uint64_t v17 = *(void *)(v10 + 24);
      uint64_t v18 = os_transaction_create();
      uint64_t v26 = v5;
      uint64_t v19 = v18;
      uint64_t v25 = *(void *)(v10 + 112);
      uint64_t v20 = (void *)swift_allocObject();
      v20[2] = v19;
      v20[3] = v16;
      uint64_t v24 = v19;
      v20[4] = v17;
      v20[5] = nullsub_1;
      v20[6] = 0;
      aBlock[4] = sub_100161F5C;
      aBlock[5] = v20;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10014D6BC;
      aBlock[3] = &unk_1002380A0;
      uint64_t v21 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_10019AFA0();
      unint64_t v27 = _swiftEmptyArrayStorage;
      sub_10014DAD8(&qword_1002869E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000C440(&qword_1002869E8);
      uint64_t v23 = v4;
      sub_10014DB20(&qword_1002869F0, &qword_1002869E8);
      sub_10019B4E0();
      sub_10019B420();
      _Block_release(v21);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v23);
      swift_unknownObjectRelease();
      return swift_release();
    }
    else
    {
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_100161EA8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100161ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C440(&qword_100282D10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100161F38()
{
  return sub_1001619F4();
}

uint64_t sub_100161F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100161F50()
{
  return swift_release();
}

uint64_t sub_100161F60()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_100161FA0()
{
  return sub_100160F14(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100161FB0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

BOOL sub_100162008(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && sub_1001684E4(*(void **)(a1 + 8), *(void **)(a2 + 8));
}

uint64_t sub_10016202C()
{
  sub_10019B530(17);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = sub_10019B700();
  sub_10019B190(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  sub_10019B190(v2);
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = sub_10019B2C0();
  sub_10019B190(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x6172676F74736968;
}

uint64_t sub_100162110()
{
  return sub_10016202C();
}

ValueMetadata *type metadata accessor for HistogramCounts()
{
  return &type metadata for HistogramCounts;
}

uint64_t sub_10016212C(uint64_t a1)
{
  Swift::String v2 = (void *)v1;
  uint64_t v4 = type metadata accessor for BatchID();
  v23[0] = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v25);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10019ABA0();
  uint64_t v9 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v1 + 88);
  uint64_t v12 = *(void *)(v1 + 96);
  v23[1] = sub_10007FDE0((void *)(v1 + 64), v13);
  id v14 = [*(id *)(v1 + 16) now];
  sub_10019AB70();

  Swift::Int v15 = sub_100162BF8();
  (*(void (**)(char *, uint64_t, Swift::Int, uint64_t, uint64_t))(v12 + 40))(v11, a1, v15, v13, v12);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  sub_10007FDE0(v2 + 3, v2[6]);
  sub_10014F408();
  sub_100152830(a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  if (swift_getEnumCaseMultiPayload() != 6) {
    return sub_100153024((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  }
  uint64_t v16 = *((void *)v8 + 2);
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v18 = *(void *)v8;
  char v19 = v8[8];
  uint64_t v20 = v16 + ((*(unsigned __int8 *)(v23[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23[0] + 80));
  uint64_t v21 = *(void *)(v23[0] + 72);
  swift_bridgeObjectRetain();
  do
  {
    sub_100152830(v20, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BatchID);
    sub_10007FDE0(v2 + 13, v2[16]);
    sub_100157038(v18, v19);
    sub_100153024((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BatchID);
    v20 += v21;
    --v17;
  }
  while (v17);
  return swift_bridgeObjectRelease_n();
}

uint64_t type metadata accessor for ObservabilitySignalMonitor()
{
  return self;
}

uint64_t sub_100162484()
{
  uint64_t v1 = sub_10019ABA0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BatchID();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100152830(v0, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  uint64_t v11 = 0x732064616F6C7075;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v13 = v10[1];
      uint64_t v14 = sub_10000C440(&qword_100285CB0);
      sub_1001395E0((uint64_t)v10 + *(int *)(v14 + 64), (uint64_t)v7);
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(63);
      v25._countAndFlagsBits = 0xD00000000000001DLL;
      v25._object = (void *)0x8000000100214B70;
      sub_10019B190(v25);
      sub_10019B330();
      v26._object = (void *)0x8000000100214B90;
      v26._countAndFlagsBits = 0xD000000000000010;
      sub_10019B190(v26);
      uint64_t v19 = v13;
      v27._countAndFlagsBits = sub_10019B700();
      sub_10019B190(v27);
      swift_bridgeObjectRelease();
      v28._countAndFlagsBits = 0x206863746162202CLL;
      v28._object = (void *)0xEC000000203A4449;
      sub_10019B190(v28);
      goto LABEL_6;
    case 2u:
      uint64_t v15 = *v10;
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(26);
      swift_bridgeObjectRelease();
      v21[0] = 0xD000000000000010;
      v21[1] = 0x8000000100214B50;
      goto LABEL_12;
    case 3u:
      sub_1001395E0((uint64_t)v10, (uint64_t)v7);
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(17);
      v29._countAndFlagsBits = 0x7865206863746162;
      v29._object = (void *)0xEF203A6465726970;
      sub_10019B190(v29);
LABEL_6:
      sub_10019B570();
      uint64_t v11 = v21[0];
      sub_100153024((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BatchID);
      return v11;
    case 4u:
      (*(void (**)(char *, void *, uint64_t))(v2 + 32))(v4, v10, v1);
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(19);
      swift_bridgeObjectRelease();
      v21[0] = 0xD000000000000011;
      v21[1] = 0x8000000100214B30;
      sub_100162BA0();
      v30._countAndFlagsBits = sub_10019B700();
      sub_10019B190(v30);
      swift_bridgeObjectRelease();
      uint64_t v11 = v21[0];
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      return v11;
    case 5u:
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(29);
      v31._countAndFlagsBits = 0xD00000000000001BLL;
      v31._object = (void *)0x8000000100214B10;
      sub_10019B190(v31);
      sub_10019B330();
      return v21[0];
    case 6u:
      uint64_t v16 = *v10;
      char v17 = *((unsigned char *)v10 + 8);
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(34);
      v32._object = (void *)0x8000000100214AF0;
      v32._countAndFlagsBits = 0xD000000000000010;
      sub_10019B190(v32);
      uint64_t v19 = v16;
      char v20 = v17;
      sub_10019B570();
      v33._countAndFlagsBits = 0x74616220726F6620;
      v33._object = (void *)0xEE00203A73656863;
      sub_10019B190(v33);
      v34._countAndFlagsBits = sub_10019B2C0();
      sub_10019B190(v34);
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 7u:
      uint64_t v15 = *v10;
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(22);
      swift_bridgeObjectRelease();
      strcpy((char *)v21, "will upload ");
      BYTE5(v21[1]) = 0;
      HIWORD(v21[1]) = -5120;
LABEL_12:
      uint64_t v19 = v15;
      v35._countAndFlagsBits = sub_10019B700();
      sub_10019B190(v35);
      swift_bridgeObjectRelease();
      v36._countAndFlagsBits = 0x7365686374616220;
      v36._object = (void *)0xE800000000000000;
      sub_10019B190(v36);
      return v21[0];
    case 8u:
      return v11;
    default:
      uint64_t v12 = v10[1];
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      sub_10019B530(42);
      v22._countAndFlagsBits = 0xD000000000000017;
      v22._object = (void *)0x8000000100214BB0;
      sub_10019B190(v22);
      sub_10019B330();
      v23._countAndFlagsBits = 0x73746E657665202CLL;
      v23._object = (void *)0xEF203A746E756F43;
      sub_10019B190(v23);
      uint64_t v19 = v12;
      v24._countAndFlagsBits = sub_10019B700();
      sub_10019B190(v24);
LABEL_10:
      swift_bridgeObjectRelease();
      return v21[0];
  }
}

uint64_t type metadata accessor for ObservabilitySignal()
{
  uint64_t result = qword_1002879A0;
  if (!qword_1002879A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100162BA0()
{
  unint64_t result = qword_100287920;
  if (!qword_100287920)
  {
    sub_10019ABA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287920);
  }
  return result;
}

Swift::Int sub_100162BF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100152830(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v4 += *(int *)(sub_10000C440(&qword_100285CB0) + 64);
      uint64_t v6 = &off_100236BB8;
      goto LABEL_6;
    case 2u:
      uint64_t v5 = &off_100236BE0;
      return sub_10013A49C((uint64_t)v5);
    case 3u:
      uint64_t v6 = &off_100236C08;
LABEL_6:
      Swift::Int v7 = sub_10013A49C((uint64_t)v6);
      sub_100153024((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BatchID);
      return v7;
    case 4u:
      Swift::Int v7 = sub_10013A49C((uint64_t)&off_100236C30);
      uint64_t v8 = sub_10019ABA0();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v4, v8);
      return v7;
    case 5u:
      uint64_t v5 = &off_100236C58;
      return sub_10013A49C((uint64_t)v5);
    case 6u:
      swift_bridgeObjectRelease();
      uint64_t v5 = &off_100236C80;
      return sub_10013A49C((uint64_t)v5);
    case 7u:
      uint64_t v5 = &off_100236CD0;
      return sub_10013A49C((uint64_t)v5);
    case 8u:
      uint64_t v5 = &off_100236CA8;
      return sub_10013A49C((uint64_t)v5);
    default:
      uint64_t v5 = &off_100236B90;
      return sub_10013A49C((uint64_t)v5);
  }
}

uint64_t sub_100162DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  uint64_t v2 = sub_10019ABA0();
  uint64_t v70 = *(void *)(v2 - 8);
  uint64_t v71 = v2;
  __chkstk_darwin(v2);
  uint64_t v65 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for BatchID();
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v64 = (uint64_t)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v66 = (uint64_t)&v64 - v8;
  __chkstk_darwin(v7);
  uint64_t v67 = (uint64_t)&v64 - v9;
  uint64_t v10 = type metadata accessor for ObservabilitySignal();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v68 = (uint64_t *)((char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v64 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (double *)((char *)&v64 - v17);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v69 = (uint64_t)&v64 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  Swift::String v23 = (char *)&v64 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  Swift::String v26 = (uint64_t *)((char *)&v64 - v25);
  uint64_t v27 = __chkstk_darwin(v24);
  Swift::String v29 = (char *)&v64 - v28;
  __chkstk_darwin(v27);
  Swift::String v31 = (char *)&v64 - v30;
  uint64_t v32 = sub_10000C440(&qword_1002879D8);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  Swift::String v35 = (char *)&v64 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = (uint64_t)&v35[*(int *)(v33 + 56)];
  sub_100152830(v72, (uint64_t)v35, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  sub_100152830(v73, v36, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v39 = (uint64_t)v35;
      sub_100152830((uint64_t)v35, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      uint64_t v40 = *((void *)v29 + 1);
      uint64_t v41 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
      uint64_t v42 = (uint64_t)&v29[v41];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_100153024((uint64_t)&v29[v41], (uint64_t (*)(void))type metadata accessor for BatchID);
        Swift::String v35 = (char *)v39;
        goto LABEL_36;
      }
      double v43 = *(double *)v29;
      double v44 = *(double *)v36;
      uint64_t v45 = v36 + v41;
      uint64_t v46 = *(void *)(v36 + 8);
      uint64_t v47 = v67;
      sub_1001395E0(v42, v67);
      uint64_t v48 = v45;
      uint64_t v49 = v66;
      sub_1001395E0(v48, v66);
      if (v43 != v44 || v40 != v46)
      {
        sub_100153024(v49, (uint64_t (*)(void))type metadata accessor for BatchID);
        sub_100153024(v47, (uint64_t (*)(void))type metadata accessor for BatchID);
        sub_100153024(v39, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
        goto LABEL_37;
      }
      char v50 = sub_10019AD00();
      sub_100153024(v49, (uint64_t (*)(void))type metadata accessor for BatchID);
      sub_100153024(v47, (uint64_t (*)(void))type metadata accessor for BatchID);
      sub_100153024(v39, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      return v50 & 1;
    case 2u:
      sub_100152830((uint64_t)v35, (uint64_t)v26, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_36;
      }
      uint64_t v51 = *v26;
      goto LABEL_25;
    case 3u:
      sub_100152830((uint64_t)v35, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v52 = v64;
        sub_1001395E0(v36, v64);
        char v50 = sub_10019AD00();
        sub_100153024(v52, (uint64_t (*)(void))type metadata accessor for BatchID);
        sub_100153024((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for BatchID);
        goto LABEL_29;
      }
      sub_100153024((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for BatchID);
      goto LABEL_36;
    case 4u:
      uint64_t v53 = v69;
      sub_100152830((uint64_t)v35, v69, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      if (swift_getEnumCaseMultiPayload() == 4)
      {
        uint64_t v55 = v70;
        uint64_t v54 = v71;
        uint64_t v56 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v65, v36, v71);
        char v50 = sub_10019AB60();
        uint64_t v57 = *(void (**)(char *, uint64_t))(v55 + 8);
        v57(v56, v54);
        v57((char *)v53, v54);
        goto LABEL_29;
      }
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v53, v71);
      goto LABEL_36;
    case 5u:
      sub_100152830((uint64_t)v35, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_36;
      }
      BOOL v38 = *v18 == *(double *)v36;
      goto LABEL_26;
    case 6u:
      uint64_t v58 = (uint64_t)v35;
      sub_100152830((uint64_t)v35, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      uint64_t v59 = *(void *)v15;
      uint64_t v60 = *((void *)v15 + 2);
      if (swift_getEnumCaseMultiPayload() == 6)
      {
        int v61 = *(unsigned __int8 *)(v36 + 8);
        if (v15[8])
        {
          if (v59 != *(void *)v36) {
            int v61 = 0;
          }
          if (v61 != 1)
          {
LABEL_22:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_100153024(v58, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
            goto LABEL_37;
          }
        }
        else
        {
          if (v59 != *(void *)v36) {
            LOBYTE(v61) = 1;
          }
          if (v61) {
            goto LABEL_22;
          }
        }
        char v50 = sub_100168384(v60, *(void *)(v36 + 16));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100153024(v58, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      }
      else
      {
        swift_bridgeObjectRelease();
        Swift::String v35 = (char *)v58;
LABEL_36:
        sub_100164220((uint64_t)v35);
LABEL_37:
        char v50 = 0;
      }
      return v50 & 1;
    case 7u:
      uint64_t v62 = v68;
      sub_100152830((uint64_t)v35, (uint64_t)v68, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      if (swift_getEnumCaseMultiPayload() != 7) {
        goto LABEL_36;
      }
      uint64_t v51 = *v62;
LABEL_25:
      BOOL v38 = v51 == *(void *)v36;
      goto LABEL_26;
    case 8u:
      if (swift_getEnumCaseMultiPayload() != 8) {
        goto LABEL_36;
      }
      sub_100153024((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      char v50 = 1;
      return v50 & 1;
    default:
      sub_100152830((uint64_t)v35, (uint64_t)v31, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      uint64_t v37 = *((void *)v31 + 1);
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_36;
      }
      if (*(double *)v31 != *(double *)v36)
      {
        sub_100153024((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
        goto LABEL_37;
      }
      BOOL v38 = v37 == *(void *)(v36 + 8);
LABEL_26:
      char v50 = v38;
LABEL_29:
      sub_100153024((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
      return v50 & 1;
  }
}

char *sub_100163680(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v7 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
        uint64_t v8 = &a1[v7];
        uint64_t v9 = &a2[v7];
        uint64_t v10 = sub_10019AD30();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v13 = sub_10019AD30();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v14 = sub_10019ABA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *(void *)a1 = *(void *)a2;
        a1[8] = a2[8];
        *((void *)a1 + 2) = *((void *)a2 + 2);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1001638A8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      a1 += *(int *)(sub_10000C440(&qword_100285CB0) + 64);
      goto LABEL_3;
    case 3:
LABEL_3:
      uint64_t v3 = sub_10019AD30();
      goto LABEL_5;
    case 4:
      uint64_t v3 = sub_10019ABA0();
LABEL_5:
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 6:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

char *sub_1001639A0(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v6 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
      uint64_t v7 = &a1[v6];
      uint64_t v8 = &a2[v6];
      uint64_t v9 = sub_10019AD30();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      goto LABEL_7;
    case 3u:
      uint64_t v10 = sub_10019AD30();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      goto LABEL_7;
    case 4u:
      uint64_t v11 = sub_10019ABA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      goto LABEL_7;
    case 6u:
      *(void *)a1 = *(void *)a2;
      a1[8] = a2[8];
      *((void *)a1 + 2) = *((void *)a2 + 2);
      swift_bridgeObjectRetain();
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_100163B78(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100153024((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v6 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_10019AD30();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
        goto LABEL_8;
      case 3u:
        uint64_t v10 = sub_10019AD30();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        goto LABEL_8;
      case 4u:
        uint64_t v11 = sub_10019ABA0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        goto LABEL_8;
      case 6u:
        uint64_t v12 = *a2;
        *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
        *a1 = v12;
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_100163D7C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 4:
      uint64_t v11 = sub_10019ABA0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
      break;
    case 3:
      uint64_t v12 = sub_10019AD30();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
      swift_storeEnumTagMultiPayload();
      break;
    case 1:
      *a1 = *a2;
      uint64_t v7 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_10019AD30();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *sub_100163F04(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100153024((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 4:
        uint64_t v11 = sub_10019ABA0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 3:
        uint64_t v12 = sub_10019AD30();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
        swift_storeEnumTagMultiPayload();
        break;
      case 1:
        *a1 = *a2;
        uint64_t v7 = *(int *)(sub_10000C440(&qword_100285CB0) + 64);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_10019AD30();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1001640B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1001640D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100164104()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100164114()
{
  v4[4] = &unk_1001D92C8;
  uint64_t result = sub_10019AD30();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout3();
    v4[5] = v4;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[7] = v2;
    uint64_t result = sub_10019ABA0();
    if (v3 <= 0x3F)
    {
      v4[8] = *(void *)(result - 8) + 64;
      v4[9] = (char *)&value witness table for Builtin.Int64 + 64;
      v4[10] = &unk_1001D92E0;
      v4[11] = (char *)&value witness table for Builtin.Int64 + 64;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100164220(uint64_t a1)
{
  uint64_t v2 = sub_10000C440(&qword_1002879D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for NormalizedScaleFactorPropertyListStore()
{
  return self;
}

unint64_t sub_1001642A4()
{
  sub_10007FDE0((void *)(v0 + 16), *(void *)(v0 + 40));
  uint64_t v1 = sub_10013029C(0xD000000000000012, 0x8000000100214C10);
  if (!v1) {
    goto LABEL_11;
  }
  if (!*(void *)(v1 + 16) || (sub_100076504(0x636146656C616373, 0xEB00000000726F74), (v2 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v7 = 0;
    LOBYTE(v6) = 1;
    return v7 | ((unint64_t)v6 << 32);
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  self;
  unint64_t v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)
  {
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  [v3 floatValue];
  float v5 = v4;
  swift_unknownObjectRelease();
  BOOL v6 = v5 < 0.0;
  if (v5 >= 1.0) {
    BOOL v6 = 1;
  }
  uint64_t v7 = LODWORD(v5);
  if (v6) {
    uint64_t v7 = 0;
  }
  return v7 | ((unint64_t)v6 << 32);
}

uint64_t sub_1001643C8()
{
  sub_10007FDE0((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_10000C440(&qword_100285C90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001D69A0;
  *(void *)(inited + 32) = 0x636146656C616373;
  *(void *)(inited + 40) = 0xEB00000000726F74;
  *(NSNumber *)(inited + 48) = sub_10019B340();
  unint64_t v2 = sub_10013ECE4(inited);
  sub_1001306E8(v2, 0xD000000000000012, 0x8000000100214C10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100164494()
{
  unint64_t v0 = sub_1001642A4();
  return v0 | ((HIDWORD(v0) & 1) << 32);
}

uint64_t sub_1001644CC()
{
  return sub_1001643C8();
}

uint64_t destroy for GroupConfig()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GroupConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GroupConfig(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v4;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for GroupConfig(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for GroupConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupConfig(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GroupConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupConfig()
{
  return &type metadata for GroupConfig;
}

uint64_t sub_100164858(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000C440(&qword_100287A98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10007FDE0(a1, a1[3]);
  sub_100165560();
  sub_10019B830();
  v11[0] = 0;
  sub_10019B6C0();
  if (!v2)
  {
    v11[0] = 1;
    sub_10019B680();
    v11[0] = 2;
    sub_10019B680();
    v11[0] = 3;
    sub_10019B680();
    v11[0] = 4;
    sub_10019B6A0();
    sub_1001655B4(v3 + 80, (uint64_t)v12);
    sub_1001655B4((uint64_t)v12, (uint64_t)v11);
    v10[15] = 5;
    sub_10000C440(&qword_1002864F8);
    sub_10016561C(&qword_100287AA8);
    sub_10019B6B0();
    v11[0] = 6;
    sub_10019B680();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100164ADC()
{
  uint64_t result = 1701667182;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6F72477265707573;
      break;
    case 2:
      uint64_t result = 0x646F69726570;
      break;
    case 3:
      uint64_t result = 0x746E65696C63;
      break;
    case 4:
      uint64_t result = 0x65736F70727570;
      break;
    case 5:
      uint64_t result = 0x65676E6172;
      break;
    case 6:
      uint64_t result = 0x7265506563617267;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100164BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100164D10(a1, a2);
  *a3 = result;
  return result;
}

void sub_100164BE0(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_100164BEC(uint64_t a1)
{
  unint64_t v2 = sub_100165560();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100164C28(uint64_t a1)
{
  unint64_t v2 = sub_100165560();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100164C64@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100164FF4(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(void *)(a2 + 96) = v8;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_100164CC4(void *a1)
{
  return sub_100164858(a1);
}

uint64_t sub_100164D10(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F72477265707573 && a2 == 0xEA00000000007075 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646F69726570 && a2 == 0xE600000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E65696C63 && a2 == 0xE600000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65736F70727570 && a2 == 0xE700000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7265506563617267 && a2 == 0xEB00000000646F69)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_10019B720();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_100164FF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000C440(&qword_100287A80);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10007FDE0(a1, a1[3]);
  sub_100165560();
  sub_10019B820();
  if (v2) {
    return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
  }
  char v49 = 0;
  uint64_t v9 = sub_10019B640();
  uint64_t v11 = v10;
  uint64_t v41 = v9;
  char v48 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_10019B600();
  uint64_t v14 = v13;
  uint64_t v39 = v12;
  uint64_t v40 = v11;
  char v47 = 2;
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_10019B600();
  uint64_t v38 = v14;
  char v46 = 3;
  uint64_t v16 = v15;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10019B600();
  uint64_t v37 = v18;
  uint64_t v34 = v17;
  char v45 = 4;
  swift_bridgeObjectRetain();
  uint64_t v35 = 0;
  uint64_t v19 = sub_10019B620();
  int v32 = v20;
  uint64_t v33 = v19;
  sub_10000C440(&qword_1002864F8);
  char v44 = 5;
  sub_10016561C(&qword_100287A90);
  sub_10019B630();
  char v43 = 6;
  uint64_t v31 = v42;
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_10019B600();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v23 = v31;
  swift_bridgeObjectRelease();
  uint64_t v24 = v37;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = v38;
  swift_bridgeObjectRelease();
  uint64_t v26 = v40;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = v26;
  *(void *)(a2 + 16) = v39;
  *(void *)(a2 + 24) = v25;
  *(void *)(a2 + 32) = v36;
  *(void *)(a2 + 40) = v16;
  *(void *)(a2 + 48) = v34;
  *(void *)(a2 + 56) = v24;
  *(void *)(a2 + 64) = v33;
  *(unsigned char *)(a2 + 72) = v32 & 1;
  uint64_t v28 = v30;
  *(void *)(a2 + 80) = v23;
  *(void *)(a2 + 88) = v28;
  *(void *)(a2 + 96) = v22;
  return result;
}

unint64_t sub_100165560()
{
  unint64_t result = qword_100287A88;
  if (!qword_100287A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287A88);
  }
  return result;
}

uint64_t sub_1001655B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C440(&qword_100287AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10016561C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000788B8(&qword_1002864F8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GroupConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GroupConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1001657DCLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupConfig.CodingKeys()
{
  return &type metadata for GroupConfig.CodingKeys;
}

unint64_t sub_100165818()
{
  unint64_t result = qword_100287AB0;
  if (!qword_100287AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287AB0);
  }
  return result;
}

unint64_t sub_100165870()
{
  unint64_t result = qword_100287AB8;
  if (!qword_100287AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287AB8);
  }
  return result;
}

unint64_t sub_1001658C8()
{
  unint64_t result = qword_100287AC0;
  if (!qword_100287AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287AC0);
  }
  return result;
}

uint64_t sub_10016591C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10000C440(&qword_100285CA0);
  __chkstk_darwin(v6 - 8);
  int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10019AD30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_10019AD10();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100165FA4((uint64_t)v8);
    uint64_t v18 = 0;
    unint64_t v19 = 0xE000000000000000;
    sub_10019B530(52);
    v20._object = (void *)0x8000000100213A40;
    v20._countAndFlagsBits = 0xD000000000000031;
    sub_10019B190(v20);
    v21._countAndFlagsBits = a1;
    v21._object = a2;
    sub_10019B190(v21);
    swift_bridgeObjectRelease();
    v22._countAndFlagsBits = 34;
    v22._object = (void *)0xE100000000000000;
    sub_10019B190(v22);
    uint64_t v13 = v18;
    unint64_t v14 = v19;
    sub_1001546F0();
    swift_allocError();
    *uint64_t v15 = v13;
    v15[1] = v14;
    return swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v17(v12, v8, v9);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v17)(a3, v12, v9);
  }
}

uint64_t sub_100165B3C()
{
  uint64_t v1 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v1);
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100149ED4(v0, (uint64_t)v3);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      uint64_t v5 = sub_10000C440(&qword_100285CB0);
      sub_100154744((uint64_t)&v3[*(int *)(v5 + 64)]);
      uint64_t result = 1;
      break;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      sub_100154744((uint64_t)v3);
      uint64_t result = 3;
      break;
    case 4:
      uint64_t v6 = sub_10019ABA0();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v3, v6);
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      swift_bridgeObjectRelease();
      uint64_t result = 6;
      break;
    case 7:
      uint64_t result = 8;
      break;
    case 8:
      uint64_t result = 7;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100165CC0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 > 2)
  {
    sub_10019B530(64);
    v4._object = (void *)0x8000000100214C70;
    v4._countAndFlagsBits = 0xD00000000000003DLL;
    sub_10019B190(v4);
    v5._countAndFlagsBits = sub_10019B700();
    sub_10019B190(v5);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = 34;
    v6._object = (void *)0xE100000000000000;
    sub_10019B190(v6);
    unint64_t v1 = 0;
    sub_1001546F0();
    swift_allocError();
    void *v2 = 0;
    v2[1] = 0xE000000000000000;
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_100165DB4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 > 8)
  {
    sub_10019B530(64);
    v4._object = (void *)0x8000000100214C70;
    v4._countAndFlagsBits = 0xD00000000000003DLL;
    sub_10019B190(v4);
    v5._countAndFlagsBits = sub_10019B700();
    sub_10019B190(v5);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = 34;
    v6._object = (void *)0xE100000000000000;
    sub_10019B190(v6);
    sub_1001546F0();
    swift_allocError();
    void *v2 = 0;
    v2[1] = 0xE000000000000000;
    swift_willThrow();
    return 9;
  }
  return v1;
}

uint64_t sub_100165EAC(uint64_t result)
{
  if (result)
  {
    if (result == 1)
    {
      return 1;
    }
    else
    {
      sub_10019B530(63);
      v2._object = (void *)0x8000000100214C30;
      v2._countAndFlagsBits = 0xD00000000000003CLL;
      sub_10019B190(v2);
      v3._countAndFlagsBits = sub_10019B700();
      sub_10019B190(v3);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = 34;
      v4._object = (void *)0xE100000000000000;
      sub_10019B190(v4);
      sub_1001546F0();
      swift_allocError();
      *unint64_t v1 = 0;
      v1[1] = 0xE000000000000000;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_100165FA4(uint64_t a1)
{
  uint64_t v2 = sub_10000C440(&qword_100285CA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DeserializationError()
{
  return &type metadata for DeserializationError;
}

uint64_t static ObservabilityManager.create(with:database:)(uint64_t a1, void *a2)
{
  sub_10010B568(a1, (uint64_t)v7);
  type metadata accessor for ObservabilityManagerBuilder();
  uint64_t inited = swift_initStackObject();
  sub_100132A7C(v7, inited + 16);
  *(void *)(inited + 56) = a2;
  id v4 = a2;
  uint64_t v5 = sub_100146444();
  swift_setDeallocating();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(inited + 16);

  return v5;
}

uint64_t ObservabilityManager.deinit()
{
  swift_unknownObjectRelease();
  sub_100148374(v0 + 24);
  return v0;
}

uint64_t ObservabilityManager.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  sub_100148374(v0 + 24);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ObservabilityManager()
{
  return self;
}

Swift::Int sub_100166128()
{
  return sub_10019B7F0();
}

uint64_t sub_1001661B0()
{
  sub_10019AD30();
  sub_100166744(&qword_100287C40, (void (*)(uint64_t))&type metadata accessor for ExtendedUUID);

  return sub_10019B060();
}

Swift::Int sub_100166234()
{
  return sub_10019B7F0();
}

uint64_t sub_1001662C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10016632C(uint64_t a1)
{
  uint64_t v2 = sub_10019AD30();
  Swift::String v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100166390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1001663F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100166458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1001664BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100166520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100166534);
}

uint64_t sub_100166534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1001665A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001665B4);
}

uint64_t sub_1001665B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019AD30();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for BatchID()
{
  uint64_t result = qword_100287C00;
  if (!qword_100287C00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100166670()
{
  uint64_t result = sub_10019AD30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1001666FC()
{
  return sub_100166744(&qword_100287C38, (void (*)(uint64_t))type metadata accessor for BatchID);
}

uint64_t sub_100166744(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1001667E4()
{
  [self batchClass];
  swift_getObjCClassMetadata();
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_10019B0A0();
  id v2 = [v0 initWithPath:v1];

  if (!v2)
  {
    sub_10019B3B0();
    sub_10000C6C8(0, (unint64_t *)&qword_100284870);
    uint64_t v25 = (void *)sub_10019B470();
    sub_10019AF50();

    NSString v45 = sub_10019B0A0();
    APSimulateCrash();

    return;
  }
  id v3 = [v2 nextMetric];
  id v44 = v2;
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      id v6 = [(id)swift_unknownObjectRetain() metric];
      id v7 = [v4 metric];
      uint64_t v8 = *((void *)&_swiftEmptyDictionarySingleton + 2);
      if (v8)
      {
        unint64_t v9 = sub_100136A30((uint64_t)v7);
        if (v10) {
          uint64_t v8 = *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 7) + 8 * v9);
        }
        else {
          uint64_t v8 = 0;
        }
      }
      uint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v14 = sub_100136A30((uint64_t)v6);
      uint64_t v15 = *((void *)&_swiftEmptyDictionarySingleton + 2);
      BOOL v16 = (v13 & 1) == 0;
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16)) {
        goto LABEL_48;
      }
      char v18 = v13;
      if (*((void *)&_swiftEmptyDictionarySingleton + 3) >= v17)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v13) {
            goto LABEL_4;
          }
        }
        else
        {
          sub_100141DC8();
          if (v18) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        sub_100140E6C(v17, isUniquelyReferenced_nonNull_native);
        unint64_t v19 = sub_100136A30((uint64_t)v6);
        if ((v18 & 1) != (v20 & 1)) {
          goto LABEL_52;
        }
        unint64_t v14 = v19;
        if (v18)
        {
LABEL_4:
          *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 7) + 8 * v14) = v11;
          goto LABEL_5;
        }
      }
      *((void *)&_swiftEmptyDictionarySingleton + (v14 >> 6) + 8) |= 1 << v14;
      uint64_t v21 = 8 * v14;
      *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 6) + v21) = v6;
      *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 7) + v21) = v11;
      uint64_t v22 = *((void *)&_swiftEmptyDictionarySingleton + 2);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_50;
      }
      *((void *)&_swiftEmptyDictionarySingleton + 2) = v24;
LABEL_5:
      swift_bridgeObjectRelease();
      id v5 = [v44 nextMetric];
      swift_unknownObjectRelease_n();
      uint64_t v4 = v5;
    }
    while (v5);
  }
  uint64_t v26 = (char *)&_swiftEmptyDictionarySingleton + 64;
  uint64_t v27 = 1 << *((unsigned char *)&_swiftEmptyDictionarySingleton + 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & *((void *)&_swiftEmptyDictionarySingleton + 8);
  int64_t v30 = (unint64_t)(v27 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v31 = 0;
  while (v29)
  {
    unint64_t v32 = __clz(__rbit64(v29));
    v29 &= v29 - 1;
    unint64_t v33 = v32 | (v31 << 6);
LABEL_44:
    uint64_t v37 = *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 6) + 8 * v33);
    if ((unint64_t)(v37 - 2801) < 3)
    {
      uint64_t v38 = *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 7) + 8 * v33);
      uint64_t v39 = 2803 - v37;
      sub_10000C440(&qword_1002860A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1001D6A80;
      strcpy((char *)(inited + 32), "metricsCount");
      *(unsigned char *)(inited + 45) = 0;
      *(_WORD *)(inited + 46) = -5120;
      *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v38];
      *(void *)(inited + 56) = 1701869940;
      *(void *)(inited + 64) = 0xE400000000000000;
      *(void *)(inited + 72) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v39];
      sub_10013EE20(inited);
      uint64_t v41 = self;
      NSString v42 = sub_10019B0A0();
      sub_10000C6C8(0, (unint64_t *)&qword_1002860A8);
      Class isa = sub_10019B020().super.isa;
      swift_bridgeObjectRelease();
      [v41 sendEvent:v42 customPayload:isa];
    }
  }
  int64_t v34 = v31 + 1;
  if (__OFADD__(v31, 1)) {
    goto LABEL_49;
  }
  if (v34 >= v30)
  {
LABEL_46:
    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return;
  }
  unint64_t v35 = *(void *)&v26[8 * v34];
  ++v31;
  if (v35) {
    goto LABEL_43;
  }
  int64_t v31 = v34 + 1;
  if (v34 + 1 >= v30) {
    goto LABEL_46;
  }
  unint64_t v35 = *(void *)&v26[8 * v31];
  if (v35) {
    goto LABEL_43;
  }
  int64_t v31 = v34 + 2;
  if (v34 + 2 >= v30) {
    goto LABEL_46;
  }
  unint64_t v35 = *(void *)&v26[8 * v31];
  if (v35)
  {
LABEL_43:
    unint64_t v29 = (v35 - 1) & v35;
    unint64_t v33 = __clz(__rbit64(v35)) + (v31 << 6);
    goto LABEL_44;
  }
  int64_t v36 = v34 + 3;
  if (v36 >= v30) {
    goto LABEL_46;
  }
  unint64_t v35 = *(void *)&v26[8 * v36];
  if (v35)
  {
    int64_t v31 = v36;
    goto LABEL_43;
  }
  while (1)
  {
    int64_t v31 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v31 >= v30) {
      goto LABEL_46;
    }
    unint64_t v35 = *(void *)&v26[8 * v31];
    ++v36;
    if (v35) {
      goto LABEL_43;
    }
  }
LABEL_51:
  __break(1u);
LABEL_52:
  sub_10019B760();
  __break(1u);
}

id sub_100166E1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExpiredObservabilityBatchesReporter();
  return [super dealloc];
}

uint64_t type metadata accessor for ExpiredObservabilityBatchesReporter()
{
  return self;
}

unint64_t sub_100166E88(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = 8 * result;
  *(void *)(a4[6] + v4) = a2;
  *(void *)(a4[7] + v4) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_100166ED0(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_10019ABA0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_100166F7C(uint64_t a1, void *a2)
{
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v34 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v35)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      int64_t v35 = i;
    }
    else
    {
      int64_t v9 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_38;
      }
      if (v9 >= v34) {
        return swift_release();
      }
      uint64_t v10 = *(void *)(v33 + 8 * v9);
      int64_t v11 = i + 1;
      if (!v10)
      {
        int64_t v11 = i + 2;
        if (i + 2 >= v34) {
          return swift_release();
        }
        uint64_t v10 = *(void *)(v33 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = i + 3;
          if (i + 3 >= v34) {
            return swift_release();
          }
          uint64_t v10 = *(void *)(v33 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = i + 4;
            if (i + 4 >= v34) {
              return swift_release();
            }
            uint64_t v10 = *(void *)(v33 + 8 * v11);
            if (!v10)
            {
              uint64_t v12 = i + 5;
              if (i + 5 >= v34) {
                return swift_release();
              }
              uint64_t v10 = *(void *)(v33 + 8 * v12);
              if (!v10)
              {
                while (1)
                {
                  int64_t v11 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v34) {
                    return swift_release();
                  }
                  uint64_t v10 = *(void *)(v33 + 8 * v11);
                  ++v12;
                  if (v10) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = i + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v5 = (v10 - 1) & v10;
      int64_t v35 = v11;
    }
    uint64_t v13 = sub_10019B700();
    uint64_t v15 = v14;
    v16.super.super.Class isa = sub_10019B370().super.super.isa;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v18 = (void *)*a2;
    int64_t v36 = (void *)*a2;
    *a2 = 0x8000000000000000;
    unint64_t v20 = sub_100076504(v13, v15);
    uint64_t v21 = v18[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v18[3] >= v23)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v27 = v36;
        if (v19) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_100141F58();
        uint64_t v27 = v36;
        if (v24) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_100141114(v23, isUniquelyReferenced_nonNull_native);
      unint64_t v25 = sub_100076504(v13, v15);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_40;
      }
      unint64_t v20 = v25;
      uint64_t v27 = v36;
      if (v24)
      {
LABEL_4:
        uint64_t v7 = v27[7];
        uint64_t v8 = 8 * v20;

        *(NSNumber *)(v7 + v8) = v16;
        goto LABEL_5;
      }
    }
    v27[(v20 >> 6) + 8] |= 1 << v20;
    uint64_t v28 = (uint64_t *)(v27[6] + 16 * v20);
    *uint64_t v28 = v13;
    v28[1] = v15;
    *(NSNumber *)(v27[7] + 8 * v20) = v16;
    uint64_t v29 = v27[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_37;
    }
    v27[2] = v31;
    swift_bridgeObjectRetain();
LABEL_5:
    *a2 = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = sub_10019B760();
  __break(1u);
  return result;
}

unint64_t sub_100167294()
{
  sub_10000C440(&qword_1002860D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001D6A80;
  strcpy((char *)(inited + 32), "date_MMDDHHmm");
  *(_WORD *)(inited + 46) = -4864;
  *(void *)(inited + 48) = sub_1001673BC();
  *(void *)(inited + 56) = 0x73726F727265;
  *(void *)(inited + 64) = 0xE600000000000000;
  unint64_t v4 = sub_10013ECF0((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for ObservabilityCommunicationReport();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_100166F7C(v1, &v4);
  swift_bridgeObjectRelease();
  sub_10000C6C8(0, (unint64_t *)&qword_1002860E0);
  swift_bridgeObjectRetain();
  Class isa = sub_10019B020().super.isa;
  swift_bridgeObjectRelease_n();
  *(void *)(inited + 72) = isa;
  return sub_10013ECFC(inited);
}

unint64_t sub_1001673BC()
{
  uint64_t v0 = sub_10019ACD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10019AC90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10019A9C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100284F90 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100128E40(v4, (uint64_t)qword_10028D320);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
  if (qword_100284FB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100128E40(v0, (uint64_t)qword_10028D368);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v0);
  sub_10019AC30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_10000C6C8(0, (unint64_t *)&qword_100286100);
  uint64_t v14 = (void *)sub_10019B450();
  sub_10000C440((uint64_t *)&unk_100285520);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1001D7600;
  unint64_t result = sub_10019A920();
  if (v17)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(v15 + 56) = &type metadata for Int;
  *(void *)(v15 + 64) = &protocol witness table for Int;
  *(void *)(v15 + 32) = result;
  unint64_t result = sub_10019A8D0();
  if (v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(void *)(v15 + 96) = &type metadata for Int;
  *(void *)(v15 + 104) = &protocol witness table for Int;
  *(void *)(v15 + 72) = result;
  unint64_t result = sub_10019A8F0();
  if (v19)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(void *)(v15 + 136) = &type metadata for Int;
  *(void *)(v15 + 144) = &protocol witness table for Int;
  *(void *)(v15 + 112) = result;
  unint64_t result = sub_10019A930();
  if ((v20 & 1) == 0)
  {
    *(void *)(v15 + 176) = &type metadata for Int;
    *(void *)(v15 + 184) = &protocol witness table for Int;
    if ((result & 0x8000000000000000) == 0)
    {
      unint64_t v21 = 15 * (result / 0xF);
LABEL_13:
      *(void *)(v15 + 152) = v21;
      uint64_t v23 = sub_10019B460();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return v23;
    }
    unint64_t v21 = -15 * (-(uint64_t)result / 0xFuLL);
    if (v21 == result) {
      goto LABEL_13;
    }
    BOOL v22 = __OFSUB__(v21, 15);
    v21 -= 15;
    if (!v22) {
      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1001677BC()
{
  sub_10000C440(&qword_100285608);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10019ACD0();
  sub_100128DDC(v2, qword_10028D368);
  uint64_t v3 = sub_100128E40(v2, (uint64_t)qword_10028D368);
  sub_10019ACA0();
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v3, v1, v2);
  }
  __break(1u);
  return result;
}

uint64_t destroy for GroupConfigOutput()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v9;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupConfigOutput(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GroupConfigOutput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
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
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupConfigOutput()
{
  return &type metadata for GroupConfigOutput;
}

uint64_t sub_100167D24(char a1)
{
  uint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x61566D6F646E6172;
      break;
    case 2:
      uint64_t result = 0x65736F70727570;
      break;
    case 3:
      uint64_t result = 0x746E65696C63;
      break;
    case 4:
      uint64_t result = 0x7461447472617473;
      break;
    case 5:
      uint64_t result = 0x6144657269707865;
      break;
    case 6:
      uint64_t result = 0x6F72477265707573;
      break;
    case 7:
      uint64_t result = 0x7265506563617267;
      break;
    case 8:
      uint64_t result = 0x6E656B6F74;
      break;
    case 9:
      uint64_t result = 0x65676E6172;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100167E6C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000C440(&qword_100287C88);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10007FDE0(a1, a1[3]);
  sub_100169474();
  sub_10019B830();
  v11[0] = 0;
  sub_10019B6C0();
  if (!v2)
  {
    v11[0] = 1;
    sub_10019B6A0();
    v11[0] = 2;
    sub_10019B6A0();
    v11[0] = 3;
    sub_10019B680();
    v11[0] = 4;
    sub_10019B680();
    v11[0] = 5;
    sub_10019B680();
    v11[0] = 6;
    sub_10019B680();
    v11[0] = 7;
    sub_10019B680();
    v11[0] = 8;
    sub_10019B680();
    sub_1001655B4(v3 + 144, (uint64_t)v12);
    sub_1001655B4((uint64_t)v12, (uint64_t)v11);
    v10[15] = 9;
    sub_10000C440(&qword_1002864F8);
    sub_10016561C(&qword_100287AA8);
    sub_10019B6B0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10016816C()
{
  return sub_100167D24(*v0);
}

uint64_t sub_100168174@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1001687C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_10016819C(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_1001681A8(uint64_t a1)
{
  unint64_t v2 = sub_100169474();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001681E4(uint64_t a1)
{
  unint64_t v2 = sub_100169474();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100168220@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100168C00(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(void *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_100168294(void *a1)
{
  return sub_100167E6C(a1);
}

BOOL sub_1001682F0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  char v11[8] = *(_OWORD *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 144);
  long long v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  uint64_t v14 = *(void *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_100168550((uint64_t)v11, (uint64_t)v13);
}

uint64_t sub_100168384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BatchID() - 8;
  uint64_t v5 = __chkstk_darwin(v4);
  long long v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_100139644(a1 + v12, (uint64_t)v10);
        sub_100139644(a2 + v12, (uint64_t)v7);
        char v15 = sub_10019AD00();
        sub_100154744((uint64_t)v7);
        sub_100154744((uint64_t)v10);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

BOOL sub_1001684E4(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  long long v3 = a1 + 5;
  uint64_t v4 = a2 + 5;
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    uint64_t v8 = *v3++;
    uint64_t v7 = v8;
    uint64_t v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

BOOL sub_100168550(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v5 = sub_10019B720();
    BOOL result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  char v7 = *(unsigned char *)(a2 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
      char v7 = 1;
    }
    if (v7) {
      return 0;
    }
  }
  char v8 = *(unsigned char *)(a2 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    if (!*(unsigned char *)(a2 + 40)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 32) != *(void *)(a2 + 32)) {
      char v8 = 1;
    }
    if (v8) {
      return 0;
    }
  }
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a2 + 56);
  if (v9)
  {
    if (!v10) {
      return 0;
    }
    if (*(void *)(a1 + 48) != *(void *)(a2 + 48) || v9 != v10)
    {
      char v11 = sub_10019B720();
      BOOL result = 0;
      if ((v11 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v10)
  {
    return 0;
  }
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a2 + 72);
  if (v12)
  {
    if (!v13) {
      return 0;
    }
    if (*(void *)(a1 + 64) != *(void *)(a2 + 64) || v12 != v13)
    {
      char v14 = sub_10019B720();
      BOOL result = 0;
      if ((v14 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v13)
  {
    return 0;
  }
  uint64_t v15 = *(void *)(a1 + 88);
  uint64_t v16 = *(void *)(a2 + 88);
  if (v15)
  {
    if (!v16) {
      return 0;
    }
    if (*(void *)(a1 + 80) != *(void *)(a2 + 80) || v15 != v16)
    {
      char v17 = sub_10019B720();
      BOOL result = 0;
      if ((v17 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v16)
  {
    return 0;
  }
  uint64_t v18 = *(void *)(a1 + 104);
  uint64_t v19 = *(void *)(a2 + 104);
  if (v18)
  {
    if (!v19) {
      return 0;
    }
    if (*(void *)(a1 + 96) != *(void *)(a2 + 96) || v18 != v19)
    {
      char v20 = sub_10019B720();
      BOOL result = 0;
      if ((v20 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v19)
  {
    return 0;
  }
  uint64_t v21 = *(void *)(a1 + 120);
  uint64_t v22 = *(void *)(a2 + 120);
  if (v21)
  {
    if (!v22) {
      return 0;
    }
    if (*(void *)(a1 + 112) != *(void *)(a2 + 112) || v21 != v22)
    {
      char v23 = sub_10019B720();
      BOOL result = 0;
      if ((v23 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v22)
  {
    return 0;
  }
  uint64_t v24 = *(void *)(a1 + 136);
  uint64_t v25 = *(void *)(a2 + 136);
  if (v24)
  {
    if (v25)
    {
      if (*(void *)(a1 + 128) != *(void *)(a2 + 128) || v24 != v25)
      {
        char v26 = sub_10019B720();
        BOOL result = 0;
        if ((v26 & 1) == 0) {
          return result;
        }
      }
      goto LABEL_62;
    }
    return 0;
  }
  if (v25) {
    return 0;
  }
LABEL_62:
  uint64_t v27 = *(void *)(a1 + 144);
  unint64_t v28 = *(void *)(a2 + 144);
  BOOL result = (v27 | v28) == 0;
  if (v27 && v28)
  {
    uint64_t v29 = *(void **)(a1 + 144);
    return sub_1001684E4(v29, (void *)v28);
  }
  return result;
}

uint64_t sub_1001687C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61566D6F646E6172 && a2 == 0xEB0000000065756CLL || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65736F70727570 && a2 == 0xE700000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E65696C63 && a2 == 0xE600000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6144657269707865 && a2 == 0xEA00000000006574 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6F72477265707573 && a2 == 0xEA00000000007075 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7265506563617267 && a2 == 0xEB00000000646F69 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_10019B720();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_100168C00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v95 = sub_10000C440(&qword_100287C78);
  uint64_t v5 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  char v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v94 = 1;
  char v92 = 1;
  sub_10007FDE0(a1, a1[3]);
  sub_100169474();
  sub_10019B820();
  if (v2)
  {
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v58 = a1;
    uint64_t v59 = v5;
    LOBYTE(v70[0]) = 0;
    uint64_t v8 = sub_10019B640();
    uint64_t v10 = v9;
    LOBYTE(v70[0]) = 1;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_10019B620();
    uint64_t v57 = v10;
    char v94 = v11 & 1;
    LOBYTE(v70[0]) = 2;
    LODWORD(v10) = v11;
    uint64_t v12 = sub_10019B620();
    int v54 = v10;
    uint64_t v55 = v12;
    char v92 = v13 & 1;
    LOBYTE(v70[0]) = 3;
    LODWORD(v10) = v13;
    uint64_t v14 = sub_10019B600();
    int v52 = v10;
    uint64_t v53 = v14;
    LOBYTE(v70[0]) = 4;
    uint64_t v16 = v15;
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_10019B600();
    uint64_t v51 = v16;
    LOBYTE(v70[0]) = 5;
    uint64_t v18 = v17;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_10019B600();
    uint64_t v49 = v18;
    LOBYTE(v70[0]) = 6;
    uint64_t v20 = v19;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_10019B600();
    uint64_t v47 = v20;
    LOBYTE(v70[0]) = 7;
    uint64_t v22 = v21;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_10019B600();
    uint64_t v25 = v24;
    uint64_t v43 = v23;
    uint64_t v44 = v8;
    uint64_t v45 = v22;
    LOBYTE(v70[0]) = 8;
    swift_bridgeObjectRetain();
    uint64_t v26 = v25;
    uint64_t v42 = sub_10019B600();
    uint64_t v28 = v27;
    sub_10000C440(&qword_1002864F8);
    char v89 = 9;
    sub_10016561C(&qword_100287A90);
    swift_bridgeObjectRetain();
    sub_10019B630();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v95);
    uint64_t v29 = v90;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&long long v60 = v44;
    *((void *)&v60 + 1) = v57;
    *(void *)&long long v61 = v56;
    BYTE8(v61) = v54 & 1;
    *(void *)&long long v62 = v55;
    BYTE8(v62) = v52 & 1;
    *(void *)&long long v63 = v53;
    *((void *)&v63 + 1) = v51;
    *(void *)&long long v64 = v50;
    *((void *)&v64 + 1) = v49;
    uint64_t v30 = v47;
    *(void *)&long long v65 = v48;
    *((void *)&v65 + 1) = v47;
    *(void *)&long long v66 = v46;
    *((void *)&v66 + 1) = v45;
    *(void *)&long long v67 = v43;
    *((void *)&v67 + 1) = v26;
    uint64_t v41 = v26;
    *(void *)&long long v68 = v42;
    *((void *)&v68 + 1) = v28;
    uint64_t v69 = v29;
    sub_1001694C8((uint64_t)&v60);
    uint64_t v31 = v57;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = v30;
    swift_bridgeObjectRelease();
    uint64_t v33 = v45;
    swift_bridgeObjectRelease();
    uint64_t v34 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v58);
    v70[0] = v44;
    v70[1] = v31;
    v70[2] = v56;
    char v71 = v94;
    *(_DWORD *)uint64_t v72 = *(_DWORD *)v93;
    *(_DWORD *)&void v72[3] = *(_DWORD *)&v93[3];
    uint64_t v73 = v55;
    char v74 = v92;
    *(_DWORD *)uint64_t v75 = *(_DWORD *)v91;
    *(_DWORD *)&v75[3] = *(_DWORD *)&v91[3];
    uint64_t v76 = v53;
    uint64_t v77 = v51;
    uint64_t v78 = v50;
    uint64_t v79 = v49;
    uint64_t v80 = v48;
    uint64_t v81 = v32;
    uint64_t v82 = v46;
    uint64_t v83 = v33;
    uint64_t v84 = v43;
    uint64_t v85 = v34;
    uint64_t v86 = v42;
    uint64_t v87 = v28;
    uint64_t v88 = v29;
    uint64_t result = sub_10016955C((uint64_t)v70);
    long long v36 = v67;
    *(_OWORD *)(a2 + 96) = v66;
    *(_OWORD *)(a2 + 112) = v36;
    *(_OWORD *)(a2 + 128) = v68;
    *(void *)(a2 + 144) = v69;
    long long v37 = v63;
    *(_OWORD *)(a2 + 32) = v62;
    *(_OWORD *)(a2 + 48) = v37;
    long long v38 = v65;
    *(_OWORD *)(a2 + 64) = v64;
    *(_OWORD *)(a2 + 80) = v38;
    long long v39 = v61;
    *(_OWORD *)a2 = v60;
    *(_OWORD *)(a2 + 16) = v39;
  }
  return result;
}

unint64_t sub_100169474()
{
  unint64_t result = qword_100287C80;
  if (!qword_100287C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287C80);
  }
  return result;
}

uint64_t sub_1001694C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10016955C(uint64_t a1)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupConfigOutput.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GroupConfigOutput.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x10016974CLL);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupConfigOutput.CodingKeys()
{
  return &type metadata for GroupConfigOutput.CodingKeys;
}

unint64_t sub_100169788()
{
  unint64_t result = qword_100287C90;
  if (!qword_100287C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287C90);
  }
  return result;
}

unint64_t sub_1001697E0()
{
  unint64_t result = qword_100287C98;
  if (!qword_100287C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100287C98);
  }
  return result;
}

unint64_t sub_100169838()
{
  unint64_t result = qword_100287CA0[0];
  if (!qword_100287CA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100287CA0);
  }
  return result;
}

uint64_t sub_10016988C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_100169894()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100169938(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((((v7 + 7 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v15 = ~v8;
    uint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    unint64_t v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    unint64_t v19 = (v9 + v18) & v15;
    v16((uint64_t *)((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15), (uint64_t *)v19, v5);
    uint64_t v20 = (void *)((v10 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v21 = (void *)((v10 + v19) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v20 = *v21;
    *(void *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_100169AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10(a1, v3);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + v5;
  uint64_t v7 = (v6 + a1) & ~v5;
  v10(v7, v3);
  uint64_t v8 = (v6 + v7) & ~v5;
  v10(v8, v3);

  return ((uint64_t (*)(uint64_t, uint64_t))v10)((v6 + v8) & ~v5, v3);
}

uint64_t sub_100169BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  *(void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_100169D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  *(void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_100169E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  *(void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_100169F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  *(void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10016A07C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    unint64_t v8 = ((((v6 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7) & ~v7)) & ~v7)) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v5;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10016A1B8);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_18:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v5 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_10016A1CC(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v7 = v6;
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((*(void *)(v6 + 64)
          + ((*(void *)(v6 + 64) + v9 + ((*(void *)(v6 + 64) + v9 + ((*(void *)(v6 + 64) + v9) & ~v9)) & ~v9)) & ~v9)
          + 7) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_14:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            unint64_t v18 = *(void (**)(void))(v7 + 56);
            v18();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((*(_DWORD *)(v6 + 64)
           + ((*(_DWORD *)(v6 + 64)
             + v9
             + ((*(_DWORD *)(v6 + 64) + v9 + ((*(_DWORD *)(v6 + 64) + v9) & ~v9)) & ~v9)) & ~v9)
           + 7) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_14;
    }
  }
  if (v10) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  if (v10)
  {
    unsigned int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x10016A3A0);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for SixNumberSummary()
{
  return sub_10012B520();
}

BOOL sub_10016A3E0(uint64_t a1, uint64_t a2)
{
  if ((sub_10019B090() & 1) != 0
    && (uint64_t v4 = type metadata accessor for SixNumberSummary(), (sub_10019B090() & 1) != 0)
    && (sub_10019B090() & 1) != 0
    && (sub_10019B090() & 1) != 0
    && *(void *)(a1 + *(int *)(v4 + 56)) == *(void *)(a2 + *(int *)(v4 + 56)))
  {
    return *(void *)(a1 + *(int *)(v4 + 60)) == *(void *)(a2 + *(int *)(v4 + 60));
  }
  else
  {
    return 0;
  }
}

BOOL sub_10016A4CC(uint64_t a1, uint64_t a2)
{
  return sub_10016A3E0(a1, a2);
}

uint64_t *sub_10016A4DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v8 = sub_10019ABA0();
      uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      uint64_t v10 = sub_10000C440(&qword_100286BE0);
      v9((uint64_t *)((char *)a1 + *(int *)(v10 + 48)), (uint64_t *)((char *)a2 + *(int *)(v10 + 48)), v8);
    }
    else
    {
      uint64_t v6 = sub_10019ABA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10016A694(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v7 = sub_10019ABA0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v7 - 8), a1, v7);
    uint64_t v6 = a1 + *(int *)(sub_10000C440(&qword_100286BE0) + 48);
    uint64_t v5 = v7;
    uint64_t v4 = v8;
  }
  else
  {
    if (result > 1) {
      return result;
    }
    uint64_t v3 = sub_10019ABA0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
  }

  return v4(v6, v5);
}

uint64_t sub_10016A78C(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v5 = sub_10019ABA0();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
    v6(a1, a2, v5);
    uint64_t v7 = sub_10000C440(&qword_100286BE0);
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    uint64_t v4 = sub_10019ABA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10016A8A4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10016A9CC(a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v5 = sub_10019ABA0();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
      v6(a1, a2, v5);
      uint64_t v7 = sub_10000C440(&qword_100286BE0);
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      uint64_t v4 = sub_10019ABA0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10016A9CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeriodicWorkRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for PeriodicWorkRequest()
{
  uint64_t result = qword_100287D98;
  if (!qword_100287D98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10016AA74(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v5 = sub_10019ABA0();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
    v6(a1, a2, v5);
    uint64_t v7 = sub_10000C440(&qword_100286BE0);
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    uint64_t v4 = sub_10019ABA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10016AB8C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10016A9CC(a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v5 = sub_10019ABA0();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
      v6(a1, a2, v5);
      uint64_t v7 = sub_10000C440(&qword_100286BE0);
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      uint64_t v4 = sub_10019ABA0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10016ACB4()
{
  uint64_t result = sub_10019ABA0();
  if (v1 <= 0x3F)
  {
    uint64_t v3 = *(void *)(result - 8) + 64;
    uint64_t v4 = v3;
    swift_getTupleTypeLayout2();
    uint64_t v5 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_10016AD54(uint64_t a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v54 = sub_10019ABA0();
  uint64_t v3 = *(void *)(v54 - 8);
  uint64_t v4 = __chkstk_darwin(v54);
  uint64_t v51 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  int v52 = (char *)&v50 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v53 = (char *)&v50 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  unsigned int v12 = (char *)&v50 - v11;
  __chkstk_darwin(v10);
  int v14 = (char *)&v50 - v13;
  uint64_t v15 = type metadata accessor for PeriodicWorkRequest();
  uint64_t v16 = __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v50 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v50 - v22;
  uint64_t v24 = sub_10000C440((uint64_t *)&unk_100287DD0);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v27 = (char *)&v50 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = (uint64_t)&v27[*(int *)(v25 + 56)];
  sub_10015F134(a1, (uint64_t)v27);
  sub_10015F134(v55, v28);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_10015F134((uint64_t)v27, (uint64_t)v21);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v30 = v28;
        uint64_t v31 = v54;
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v12, v30, v54);
        char v32 = sub_10019AB60();
        uint64_t v33 = *(void (**)(char *, uint64_t))(v3 + 8);
        v33(v12, v31);
        v33(v21, v31);
LABEL_17:
        sub_10016A9CC((uint64_t)v27);
        return v32 & 1;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v21, v54);
      goto LABEL_13;
    }
    sub_10015F134((uint64_t)v27, (uint64_t)v18);
    uint64_t v34 = *(int *)(sub_10000C440(&qword_100286BE0) + 48);
    int64_t v35 = &v18[v34];
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v55 = v28 + v34;
      long long v36 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
      long long v37 = v53;
      uint64_t v38 = v28;
      uint64_t v39 = v54;
      v36(v53, v38, v54);
      uint64_t v40 = v52;
      v36(v52, (uint64_t)v35, v39);
      uint64_t v41 = v51;
      v36(v51, v55, v39);
      uint64_t v42 = v37;
      char v43 = sub_10019AB60();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v3 + 8);
      v44(v18, v39);
      if ((v43 & 1) == 0)
      {
        v44(v41, v39);
        v44(v40, v39);
        v44(v42, v39);
        sub_10016A9CC((uint64_t)v27);
        goto LABEL_14;
      }
      char v32 = sub_10019AB60();
      v44(v41, v39);
      v44(v40, v39);
      uint64_t v45 = v42;
LABEL_16:
      v44(v45, v39);
      goto LABEL_17;
    }
    uint64_t v46 = *(void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v47 = v54;
    v46(&v18[v34], v54);
    v46(v18, v47);
  }
  else
  {
    sub_10015F134((uint64_t)v27, (uint64_t)v23);
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v48 = v28;
      uint64_t v39 = v54;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v14, v48, v54);
      char v32 = sub_10019AB60();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v3 + 8);
      v44(v14, v39);
      uint64_t v45 = v23;
      goto LABEL_16;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v54);
  }
LABEL_13:
  sub_10016B278((uint64_t)v27);
LABEL_14:
  char v32 = 0;
  return v32 & 1;
}

uint64_t sub_10016B278(uint64_t a1)
{
  uint64_t v2 = sub_10000C440((uint64_t *)&unk_100287DD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10016B2D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v18 = type metadata accessor for UtcDate();
  __chkstk_darwin(v18);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000C440(&qword_1002880A0);
  uint64_t v17 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ObservabilityReportWorkerParamsRange(0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10007FDE0(a1, a1[3]);
  sub_10016EE8C();
  uint64_t v10 = (uint64_t)v20;
  sub_10019B820();
  if (v10) {
    return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
  }
  uint64_t v20 = a1;
  uint64_t v11 = v17;
  unsigned int v12 = v9;
  char v24 = 0;
  sub_10016EEE0();
  uint64_t v13 = v19;
  sub_10019B660();
  *unsigned int v12 = v25;
  char v23 = 1;
  sub_10012F1BC(&qword_1002854A0, (void (*)(uint64_t))type metadata accessor for UtcDate);
  sub_10019B660();
  sub_10016EFDC((uint64_t)v4, (uint64_t)&v12[*(int *)(v7 + 20)], (uint64_t (*)(void))type metadata accessor for UtcDate);
  char v21 = 2;
  sub_10016EF34();
  sub_10019B660();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v13);
  v12[*(int *)(v7 + 24)] = v22;
  sub_10016E3FC((uint64_t)v12, v16, type metadata accessor for ObservabilityReportWorkerParamsRange);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v20);
  return sub_10016E4E4((uint64_t)v12, type metadata accessor for ObservabilityReportWorkerParamsRange);
}

uint64_t sub_10016B658@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v4 = type metadata accessor for UtcDate();
  __chkstk_darwin(v4);
  uint64_t v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000C440(&qword_1002880C8);
  uint64_t v14 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ObservabilityReportWorkerParamsTime(0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10007FDE0(a1, a1[3]);
  sub_10016EF88();
  sub_10019B820();
  if (!v2)
  {
    sub_10012F1BC(&qword_1002854A0, (void (*)(uint64_t))type metadata accessor for UtcDate);
    sub_10019B660();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_10016EFDC(v15, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for UtcDate);
    sub_10016EFDC((uint64_t)v11, v13, type metadata accessor for ObservabilityReportWorkerParamsTime);
  }
  return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
}

uint64_t sub_10016B8C0()
{
  uint64_t v1 = 0x7472617473;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E6F697461727564;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x74726F706572;
  }
}

uint64_t sub_10016B914@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10016F42C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10016B93C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10016B948(uint64_t a1)
{
  unint64_t v2 = sub_10016EE8C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016B984(uint64_t a1)
{
  unint64_t v2 = sub_10016EE8C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016B9C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10016B2D8(a1, a2);
}

uint64_t sub_10016B9D8(uint64_t a1)
{
  unint64_t v2 = sub_10016EF88();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016BA14(uint64_t a1)
{
  unint64_t v2 = sub_10016EF88();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016BA50@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10016B658(a1, a2);
}

void sub_10016BA68()
{
  if ([self isAppleInternalInstall])
  {
    uint64_t v0 = self;
    id v1 = [v0 sharedInstance];
    if (v1)
    {
      unint64_t v2 = v1;
      uint64_t v3 = swift_allocObject();
      swift_weakInit();
      id v4 = [v0 sharedInstance];
      if (v4)
      {
        uint64_t v5 = v4;
        NSString v6 = sub_10019B0A0();
        uint64_t v7 = swift_allocObject();
        *(void *)(v7 + 16) = sub_10016E3B8;
        *(void *)(v7 + 24) = v3;
        char v21 = sub_10016E3D4;
        uint64_t v22 = v7;
        uint64_t v17 = _NSConcreteStackBlock;
        uint64_t v18 = 1107296256;
        uint64_t v19 = sub_10015F008;
        uint64_t v20 = &unk_1002385D8;
        uint64_t v8 = _Block_copy(&v17);
        swift_retain();
        swift_release();
        [v5 subscribeForMessage:v6 handler:v8];
        _Block_release(v8);

        swift_release();
      }
      else
      {

        swift_release();
      }
    }
    id v9 = [v0 sharedInstance];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = swift_allocObject();
      swift_weakInit();
      id v12 = [v0 sharedInstance];
      if (v12)
      {
        uint64_t v13 = v12;
        NSString v14 = sub_10019B0A0();
        uint64_t v15 = swift_allocObject();
        *(void *)(v15 + 16) = sub_10016E344;
        *(void *)(v15 + 24) = v11;
        char v21 = sub_10016E398;
        uint64_t v22 = v15;
        uint64_t v17 = _NSConcreteStackBlock;
        uint64_t v18 = 1107296256;
        uint64_t v19 = sub_10015F008;
        uint64_t v20 = &unk_100238588;
        uint64_t v16 = _Block_copy(&v17);
        swift_retain();
        swift_release();
        [v13 subscribeForMessage:v14 handler:v16];
        _Block_release(v16);

        swift_release();
      }
      else
      {

        swift_release();
      }
    }
  }
}

uint64_t sub_10016BD9C()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 40);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 80);
  swift_bridgeObjectRelease();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 136);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 176);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 216);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 256);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 296);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 336);
  return v0;
}

uint64_t sub_10016BE0C()
{
  sub_10016BD9C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ObservabilityProductionWorkerFactory()
{
  return self;
}

uint64_t sub_10016BE64(unsigned __int8 *a1)
{
  uint64_t v3 = type metadata accessor for UtcDate();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TimeRange();
  uint64_t v7 = __chkstk_darwin(v6);
  id v9 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v52 - v10;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return 1701736270;
  }
  uint64_t v13 = Strong;
  uint64_t v14 = type metadata accessor for ObservabilityReportWorkerParamsRange(0);
  sub_10016E3FC((uint64_t)&a1[*(int *)(v14 + 20)], (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for UtcDate);
  uint64_t v15 = sub_10019ABA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v11, v5, v15);
  uint64_t v16 = *(int *)(v14 + 24);
  uint64_t v53 = a1;
  v11[*(int *)(v6 + 20)] = a1[v16];
  if (qword_100284FA8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_10019AF80();
  sub_100128E40(v17, (uint64_t)qword_10028D348);
  uint64_t v55 = v11;
  sub_10016E3FC((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for TimeRange);
  uint64_t v18 = sub_10019AF60();
  os_log_type_t v19 = sub_10019B3A0();
  BOOL v20 = os_log_type_enabled(v18, v19);
  v52[1] = v1;
  v52[2] = v13;
  if (v20)
  {
    char v21 = (uint8_t *)swift_slowAlloc();
    v59[0] = swift_slowAlloc();
    *(_DWORD *)char v21 = 136315138;
    uint64_t v22 = sub_100155DB0();
    *(void *)&long long v57 = sub_10007C26C(v22, v23, v59);
    sub_10019B4A0();
    swift_bridgeObjectRelease();
    sub_10016E4E4((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for TimeRange);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Running manual reports for %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10016E4E4((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for TimeRange);
  }

  unint64_t v25 = (unint64_t)sub_10016C4C0();
  unint64_t v26 = v25;
  uint64_t v27 = v53;
  if (!(v25 >> 62))
  {
    uint64_t v28 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v28) {
      goto LABEL_10;
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
    swift_release();
    sub_10016E4E4((uint64_t)v55, (uint64_t (*)(void))type metadata accessor for TimeRange);
    return 19279;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10019B5A0();
  uint64_t v28 = result;
  if (!result) {
    goto LABEL_23;
  }
LABEL_10:
  if (v28 >= 1)
  {
    uint64_t v29 = 0;
    unint64_t v56 = v26 & 0xC000000000000001;
    unint64_t v54 = v26;
    uint64_t v62 = v28;
    do
    {
      if (v56)
      {
        uint64_t v30 = (void *)sub_10019B550();
      }
      else
      {
        uint64_t v30 = *(void **)(v26 + 8 * v29 + 32);
        swift_retain();
      }
      int v31 = *v27;
      uint64_t v32 = v30[16];
      uint64_t v33 = v30[17];
      sub_10007FDE0(v30 + 13, v32);
      if (v31 == (*(unsigned __int8 (**)(uint64_t, uint64_t))(v33 + 8))(v32, v33))
      {
        uint64_t v34 = v30[16];
        uint64_t v35 = v30[17];
        sub_10007FDE0(v30 + 13, v34);
        uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
        uint64_t v37 = v30[16];
        uint64_t v38 = v30[17];
        sub_10007FDE0(v30 + 13, v37);
        uint64_t v39 = (uint64_t)v55;
        (*(void (**)(long long *__return_ptr, char *, uint64_t, uint64_t))(v38 + 16))(&v57, v55, v37, v38);
        if (v58)
        {
          sub_100132A7C(&v57, (uint64_t)v59);
          uint64_t v40 = sub_10007FDE0(v30 + 3, v30[6]);
          uint64_t v41 = v30[16];
          uint64_t v42 = v30[17];
          sub_10007FDE0(v30 + 13, v41);
          uint64_t v43 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v42 + 8))(v41, v42) + 2801;
          uint64_t v44 = v60;
          uint64_t v45 = v61;
          sub_10007FDE0(v59, v60);
          uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
          uint64_t v47 = v45;
          uint64_t v27 = v53;
          v46(v44, v47);
          uint64_t v48 = *(void **)(*v40 + 16);
          sub_10000C440(&qword_100285600);
          Class isa = sub_10019B020().super.isa;
          [v48 recordMetric:v43 forPurpose:8501 properties:isa internalProperties:0 order:0 options:0];
          swift_bridgeObjectRelease();

          uint64_t v50 = v30[21];
          uint64_t v51 = v30[22];
          sub_10007FDE0(v30 + 18, v50);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 32))(v39, v36, v50, v51);
          _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v59);
        }
        else
        {
          sub_10016E464((uint64_t)&v57);
        }
        swift_release();
        unint64_t v26 = v54;
      }
      else
      {
        swift_release();
      }
      ++v29;
    }
    while (v62 != v29);
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

void *sub_10016C4C0()
{
  uint64_t v0 = sub_10016CAD4();
  uint64_t v1 = &_swiftEmptyArrayStorage;
  unint64_t v8 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v2 = v0[2];
  if (v2)
  {
    uint64_t v3 = (uint64_t)(v0 + 4);
    do
    {
      sub_10010B568(v3, (uint64_t)v7);
      sub_10010B568((uint64_t)v7, (uint64_t)&v5);
      sub_10000C440(&qword_100287EE8);
      type metadata accessor for ObservabilityReportWorker();
      if ((swift_dynamicCast() & 1) == 0) {
        uint64_t v6 = 0;
      }
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v7);
      if (v6)
      {
        sub_10019B290();
        if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10019B2E0();
        }
        sub_10019B300();
        sub_10019B2D0();
      }
      v3 += 40;
      --v2;
    }
    while (v2);
    uint64_t v1 = (void *)v8;
  }
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_10016C5E4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UtcDate();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10019ABA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ObservabilityReportWorkerParamsTime(0);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return 1701736270;
  }
  uint64_t v14 = Strong;
  uint64_t v37 = v1;
  if (qword_100284FA8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10019AF80();
  sub_100128E40(v15, (uint64_t)qword_10028D348);
  sub_10016E3FC(a1, (uint64_t)v12, type metadata accessor for ObservabilityReportWorkerParamsTime);
  uint64_t v16 = sub_10019AF60();
  os_log_type_t v17 = sub_10019B3A0();
  int v18 = v17;
  BOOL v19 = os_log_type_enabled(v16, v17);
  uint64_t v38 = v14;
  uint64_t v36 = v7;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    int v34 = v18;
    char v21 = (uint8_t *)v20;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v40 = v35;
    os_log_t v32 = v16;
    uint64_t v33 = v21;
    *(_DWORD *)char v21 = 136315138;
    int v31 = v21 + 4;
    sub_10016E3FC((uint64_t)v12, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for UtcDate);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    sub_10012F1BC((unint64_t *)&qword_100287920, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v22 = sub_10019B700();
    unint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v39 = sub_10007C26C(v22, v24, &v40);
    sub_10019B4A0();
    swift_bridgeObjectRelease();
    sub_10016E4E4((uint64_t)v12, type metadata accessor for ObservabilityReportWorkerParamsTime);
    uint64_t v16 = v32;
    _os_log_impl((void *)&_mh_execute_header, v32, (os_log_type_t)v34, "Running manual reports at %s", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10016E4E4((uint64_t)v12, type metadata accessor for ObservabilityReportWorkerParamsTime);
  }

  unint64_t v26 = (unint64_t)sub_10016C4C0();
  unint64_t v27 = v26;
  if (!(v26 >> 62))
  {
    uint64_t v28 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v28) {
      goto LABEL_10;
    }
LABEL_17:
    swift_bridgeObjectRelease_n();
    swift_release();
    return 19279;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10019B5A0();
  uint64_t v28 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_10:
  if (v28 >= 1)
  {
    uint64_t v29 = 0;
    uint64_t v30 = (void (**)(char *, uint64_t))(v36 + 8);
    do
    {
      if ((v27 & 0xC000000000000001) != 0) {
        sub_10019B550();
      }
      else {
        swift_retain();
      }
      ++v29;
      sub_10016E3FC(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for UtcDate);
      sub_1001313D0((uint64_t)v5);
      (*v30)(v5, v6);
      swift_release();
    }
    while (v28 != v29);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void *sub_10016CAD4()
{
  sub_10000C440(&qword_100287ED0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001D6910;
  sub_10010B568((uint64_t)(v0 + 5), (uint64_t)v48);
  sub_10010B568((uint64_t)(v0 + 10), (uint64_t)&v46);
  uint64_t v38 = v0 + 37;
  sub_10010B568((uint64_t)(v0 + 37), (uint64_t)&v43);
  uint64_t v2 = type metadata accessor for ObservabilityCommunicationReporter();
  uint64_t v3 = swift_allocObject();
  sub_100132A7C(v48, v3 + 16);
  sub_100132A7C(&v46, v3 + 56);
  sub_100132A7C(&v43, v3 + 96);
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 64) = &off_100237CE8;
  *(void *)(inited + 32) = v3;
  uint64_t v40 = inited + 32;
  sub_10010B568((uint64_t)(v0 + 37), (uint64_t)v48);
  uint64_t v39 = v0 + 42;
  sub_10010B568((uint64_t)(v0 + 42), (uint64_t)&v46);
  uint64_t v4 = sub_100132FEC((uint64_t)&v46, v47);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v7 + 16))(v6);
  uint64_t v8 = *v6;
  uint64_t v9 = type metadata accessor for ObservabilityStateStoreDatabase();
  uint64_t v44 = v9;
  uint64_t v45 = &off_100237CB8;
  *(void *)&long long v43 = v8;
  uint64_t v10 = type metadata accessor for ObservabilityHourlyReporter();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = sub_100132FEC((uint64_t)&v43, v9);
  uint64_t v13 = *(void *)(v9 - 8);
  uint64_t v36 = *(void *)(v13 + 64);
  __chkstk_darwin(v12);
  unint64_t v37 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = (uint64_t *)((char *)&v32 - v37);
  uint64_t v35 = *(void (**)(char *))(v13 + 16);
  v35((char *)&v32 - v37);
  uint64_t v16 = *v15;
  v11[10] = v9;
  v11[11] = &off_100237CB8;
  v11[7] = v16;
  sub_100132A7C(v48, (uint64_t)(v11 + 2));
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)&v43);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)&v46);
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = &off_100237E28;
  *(void *)(inited + 72) = v11;
  uint64_t v17 = v0[2];
  uint64_t v18 = v0[3];
  uint64_t v33 = v0[15];
  uint64_t v34 = v17;
  uint64_t v32 = v0[16];
  sub_10010B568((uint64_t)(v0 + 17), (uint64_t)v48);
  sub_10010B568((uint64_t)(v0 + 22), (uint64_t)&v46);
  sub_10010B568((uint64_t)v38, (uint64_t)&v43);
  sub_10010B568((uint64_t)v39, (uint64_t)v42);
  uint64_t v19 = sub_100132FEC((uint64_t)v42, v42[3]);
  __chkstk_darwin(v19);
  char v21 = (uint64_t *)((char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v22 + 16))(v21);
  uint64_t v23 = *v21;
  v41[3] = v9;
  v41[4] = &off_100237CB8;
  v41[0] = v23;
  uint64_t v24 = type metadata accessor for ObservabilityDailyReporter();
  unint64_t v25 = (void *)swift_allocObject();
  uint64_t v26 = sub_100132FEC((uint64_t)v41, v9);
  __chkstk_darwin(v26);
  unint64_t v27 = (uint64_t *)((char *)&v32 - v37);
  v35((char *)&v32 - v37);
  uint64_t v28 = *v27;
  v25[24] = v9;
  v25[25] = &off_100237CB8;
  v25[21] = v28;
  v25[2] = v34;
  v25[3] = v18;
  uint64_t v29 = v32;
  v25[4] = v33;
  uint64_t v25[5] = v29;
  sub_100132A7C(v48, (uint64_t)(v25 + 6));
  sub_100132A7C(&v46, (uint64_t)(v25 + 11));
  sub_100132A7C(&v43, (uint64_t)(v25 + 16));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v41);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v42);
  *(void *)(inited + 136) = v24;
  *(void *)(inited + 144) = &off_1002374B8;
  *(void *)(inited + 112) = v25;
  swift_retain();
  uint64_t v30 = sub_10016DD0C(inited, (uint64_t)v0);
  swift_release();
  swift_setDeallocating();
  sub_10000C440(&qword_100287ED8);
  swift_arrayDestroy();
  return v30;
}

uint64_t sub_10016CFA4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D154(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10016CFC4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D414(a1, a2, a3, (void *)*v3, &qword_100286BF8, (uint64_t *)&unk_100287F20);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10016CFF4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D89C(a1, a2, a3, (void *)*v3, &qword_100285E68, &qword_100287F30);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10016D024(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D2B4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10016D044(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D414(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_100287F40, &qword_100285E50);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10016D074(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D89C(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_100287F50, &qword_100286610);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10016D0A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D5C0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10016D0C4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D720(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10016D0E4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016D89C(a1, a2, a3, (void *)*v3, &qword_100287EE0, &qword_100287EE8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10016D114(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016DA44(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10016D134(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10016DBB0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10016D154(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C440((uint64_t *)&unk_100287F10);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016D2B4(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C440(&qword_100287F38);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016D414(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_10000C440(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 48);
  }
  else
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 48 * v11) {
      memmove(v13 + 4, a4 + 4, 48 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 48 * v11 || v15 >= v16 + 48 * v11)
  {
    sub_10000C440(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016D5C0(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C440((uint64_t *)&unk_100287F60);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016D720(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000C440(&qword_100286C00);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016D89C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_10000C440(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    sub_10000C440(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016DA44(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C440(&qword_100286C08);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

uint64_t sub_10016DBB0(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C440((uint64_t *)&unk_100287EF0);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    memcpy(v13, v14, v15);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10019B5E0();
  __break(1u);
  return result;
}

void *sub_10016DD0C(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t v61 = &_swiftEmptyArrayStorage;
    sub_10016D0E4(0, v2, 0);
    uint64_t v6 = a1 + 32;
    uint64_t v43 = a2 + 216;
    uint64_t v42 = a2 + 256;
    uint64_t v41 = *(void *)(a2 + 32);
    uint64_t v40 = a2 + 296;
    do
    {
      int64_t v48 = v2;
      sub_10010B568(v43, (uint64_t)&v58);
      sub_10010B568(v42, (uint64_t)&v55);
      uint64_t v47 = v6;
      sub_10010B568(v6, (uint64_t)v54);
      sub_10010B568(v40, (uint64_t)v53);
      uint64_t v7 = sub_100132FEC((uint64_t)&v58, v59);
      long long v46 = v39;
      __chkstk_darwin(v7);
      uint64_t v9 = (uint64_t *)&v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v10 + 16))(v9);
      uint64_t v11 = sub_100132FEC((uint64_t)&v55, v56);
      uint64_t v45 = v39;
      __chkstk_darwin(v11);
      uint64_t v13 = (uint64_t *)&v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v14 + 16))(v13);
      uint64_t v15 = *v9;
      uint64_t v16 = *v13;
      uint64_t v17 = type metadata accessor for ECPrimitiveEventSink();
      v52[4] = &off_100237FF0;
      void v52[3] = v17;
      v52[0] = v15;
      uint64_t v18 = type metadata accessor for OffsetTimeRangeReferenceFrame();
      uint64_t v51 = &off_100237980;
      uint64_t v50 = v18;
      v49[0] = v16;
      uint64_t v19 = type metadata accessor for ObservabilityReportWorker();
      uint64_t v20 = (void *)swift_allocObject();
      uint64_t v21 = sub_100132FEC((uint64_t)v52, v17);
      uint64_t v44 = v39;
      __chkstk_darwin(v21);
      uint64_t v23 = (uint64_t *)&v39[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v24 + 16))(v23);
      uint64_t v25 = sub_100132FEC((uint64_t)v49, v50);
      __chkstk_darwin(v25);
      unint64_t v27 = (uint64_t *)&v39[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v28 + 16))(v27);
      uint64_t v29 = *v23;
      uint64_t v30 = *v27;
      v20[6] = v17;
      v20[7] = &off_100237FF0;
      v20[11] = v18;
      v20[12] = &off_100237980;
      v20[8] = v30;
      v20[2] = v41;
      v20[3] = v29;
      sub_100132A7C(v54, (uint64_t)(v20 + 13));
      sub_100132A7C(v53, (uint64_t)(v20 + 18));
      swift_unknownObjectRetain();
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v49);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v52);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)&v55);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)&v58);
      uint64_t v59 = v19;
      uint64_t v60 = &off_100237308;
      uint64_t v58 = v20;
      uint64_t v3 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10016D0E4(0, v3[2] + 1, 1);
        uint64_t v3 = v61;
      }
      unint64_t v32 = v3[2];
      unint64_t v31 = v3[3];
      if (v32 >= v31 >> 1)
      {
        sub_10016D0E4(v31 > 1, v32 + 1, 1);
        uint64_t v3 = v61;
      }
      uint64_t v33 = sub_100132FEC((uint64_t)&v58, v59);
      __chkstk_darwin(v33);
      uint64_t v35 = (uint64_t *)&v39[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v36 + 16))(v35);
      uint64_t v37 = *v35;
      uint64_t v56 = v19;
      long long v57 = &off_100237308;
      *(void *)&long long v55 = v37;
      v3[2] = v32 + 1;
      sub_100132A7C(&v55, (uint64_t)&v3[5 * v32 + 4]);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)&v58);
      uint64_t v6 = v47 + 40;
      int64_t v2 = v48 - 1;
    }
    while (v48 != 1);
  }
  return v3;
}

uint64_t sub_10016E30C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10016E344(uint64_t a1)
{
  return sub_10016C5E4(a1);
}

uint64_t sub_10016E360()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10016E398(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_10015E4FC(a1, a2, a3, a4, *(uint64_t (**)(char *))(v4 + 16));
}

uint64_t sub_10016E3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10016E3B0()
{
  return swift_release();
}

uint64_t sub_10016E3B8(unsigned __int8 *a1)
{
  return sub_10016BE64(a1);
}

uint64_t sub_10016E3D4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_10015E870(a1, a2, a3, a4, *(uint64_t (**)(char *))(v4 + 16));
}

uint64_t type metadata accessor for ObservabilityReportWorkerParamsRange(uint64_t a1)
{
  return sub_10007DA28(a1, qword_100288060);
}

uint64_t sub_10016E3FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10016E464(uint64_t a1)
{
  uint64_t v2 = sub_10000C440(&qword_100287F70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ObservabilityReportWorkerParamsTime(uint64_t a1)
{
  return sub_10007DA28(a1, qword_100287FD0);
}

uint64_t sub_10016E4E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10016E544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10016E5B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10016E614(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10016E678(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10016E6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10016E740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016E754);
}

uint64_t sub_10016E754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UtcDate();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10016E7C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10016E7D4);
}

uint64_t sub_10016E7D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UtcDate();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_10016E844()
{
  uint64_t result = sub_10019ABA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_10016E8D0(unsigned char *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_10019ABA0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_10016E9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_10019ABA0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *sub_10016EA20(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_10019ABA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_10016EAB8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_10019ABA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_10016EB50(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_10019ABA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_10016EBE8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_10019ABA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_10016EC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016EC94);
}

uint64_t sub_10016EC94(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *a1;
    if (v4 >= 3) {
      return v4 - 2;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UtcDate();
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10016ED3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10016ED50);
}

unsigned char *sub_10016ED50(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 253)
  {
    *uint64_t result = a2 + 2;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UtcDate();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10016EDF4()
{
  uint64_t result = sub_10019ABA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10016EE8C()
{
  unint64_t result = qword_1002880A8;
  if (!qword_1002880A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880A8);
  }
  return result;
}

unint64_t sub_10016EEE0()
{
  unint64_t result = qword_1002880B0;
  if (!qword_1002880B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880B0);
  }
  return result;
}

unint64_t sub_10016EF34()
{
  unint64_t result = qword_1002880C0;
  if (!qword_1002880C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880C0);
  }
  return result;
}

unint64_t sub_10016EF88()
{
  unint64_t result = qword_1002880D0;
  if (!qword_1002880D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880D0);
  }
  return result;
}

uint64_t sub_10016EFDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unsigned char *storeEnumTagSinglePayload for ObservabilityReportWorkerParamsTime.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10016F0E0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ObservabilityReportWorkerParamsTime.CodingKeys()
{
  return &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ObservabilityReportWorkerParamsRange.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x10016F1E4);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ObservabilityReportWorkerParamsRange.CodingKeys()
{
  return &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys;
}

unint64_t sub_10016F220()
{
  unint64_t result = qword_1002880D8;
  if (!qword_1002880D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880D8);
  }
  return result;
}

unint64_t sub_10016F278()
{
  unint64_t result = qword_1002880E0;
  if (!qword_1002880E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880E0);
  }
  return result;
}

unint64_t sub_10016F2D0()
{
  unint64_t result = qword_1002880E8;
  if (!qword_1002880E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880E8);
  }
  return result;
}

unint64_t sub_10016F328()
{
  unint64_t result = qword_1002880F0;
  if (!qword_1002880F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880F0);
  }
  return result;
}

unint64_t sub_10016F380()
{
  unint64_t result = qword_1002880F8;
  if (!qword_1002880F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002880F8);
  }
  return result;
}

unint64_t sub_10016F3D8()
{
  unint64_t result = qword_100288100;
  if (!qword_100288100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100288100);
  }
  return result;
}

uint64_t sub_10016F42C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74726F706572 && a2 == 0xE600000000000000;
  if (v2 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7472617473 && a2 == 0xE500000000000000 || (sub_10019B720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10019B720();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t *sub_10016F580(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10019ABA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v9 = (_OWORD *)((char *)a1 + v8);
    uint64_t v10 = (_OWORD *)((char *)a2 + v8);
    long long v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    long long v9[2] = v10[2];
    uint64_t v12 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v12) = *(uint64_t *)((char *)a2 + v12);
    uint64_t v13 = a3[9];
    uint64_t v14 = a3[10];
    uint64_t v15 = (char *)a1 + v13;
    uint64_t v16 = (char *)a2 + v13;
    long long v17 = *((_OWORD *)v16 + 1);
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    *((_OWORD *)v15 + 1) = v17;
    *((_OWORD *)v15 + 2) = *((_OWORD *)v16 + 2);
    v15[48] = v16[48];
    *(uint64_t *)((char *)a1 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v18 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v18) = *(uint64_t *)((char *)a2 + v18);
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
  }
  return a1;
}

uint64_t sub_10016F6C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(unsigned char *)(v14 + 48) = *(unsigned char *)(v15 + 48);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v17 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_10016F7B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v10 = a3[9];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  char v13 = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = v13;
  char v14 = *(unsigned char *)(v12 + 24);
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  *(unsigned char *)(v11 + 24) = v14;
  *(void *)(v11 + 32) = *(void *)(v12 + 32);
  uint64_t v15 = *(void *)(v12 + 40);
  *(unsigned char *)(v11 + 48) = *(unsigned char *)(v12 + 48);
  *(void *)(v11 + 40) = v15;
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_10016F8FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(unsigned char *)(v14 + 48) = *(unsigned char *)(v15 + 48);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v17 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_10016F9F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10019ABA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)(v14 + 16) = *(void *)(v15 + 16);
  *(unsigned char *)(v14 + 24) = *(unsigned char *)(v15 + 24);
  uint64_t v16 = *(void *)(v15 + 40);
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  *(void *)(v14 + 40) = v16;
  *(unsigned char *)(v14 + 48) = *(unsigned char *)(v15 + 48);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v17 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_10016FAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016FB10);
}

uint64_t sub_10016FB10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10016FB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10016FB90);
}

uint64_t sub_10016FB90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ObservabilityHourlyReport()
{
  uint64_t result = qword_100288168;
  if (!qword_100288168) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10016FC4C()
{
  uint64_t result = sub_10019ABA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10016FD04(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = sub_10019B100();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    goto LABEL_4;
  }
  sub_10019A830();
  swift_allocObject();
  sub_10019A820();
  sub_10019B0F0();
  uint64_t v9 = sub_10019B0C0();
  unint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v11 >> 60 == 15)
  {
    swift_release();
LABEL_4:
    sub_100170BCC((uint64_t)v24);
    sub_100170BF0((uint64_t)v24, (uint64_t)v23);
    goto LABEL_5;
  }
  sub_100170D64();
  sub_10019A810();
  nullsub_1(v23);
  sub_10007FF14(v9, v11);
  swift_release();
LABEL_5:
  sub_100170BF0((uint64_t)v23, (uint64_t)v21);
  sub_100170BF0((uint64_t)v21, (uint64_t)v22);
  if (sub_100170C58((uint64_t)v22) == 1)
  {
    sub_10015F24C();
    uint64_t v12 = swift_allocError();
    *uint64_t v13 = 0xD00000000000001DLL;
    v13[1] = 0x80000001002148E0;
    swift_willThrow();
    v21[0] = v12;
    swift_errorRetain();
    sub_10000C440(&qword_1002875D8);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      strcpy((char *)v22, "Parse Error: ");
      HIWORD(v22[1]) = -4864;
      sub_10019B190(v23[0]);
      swift_bridgeObjectRelease();
      ((void (*)(void, void))a3)(v22[0], v22[1]);
    }
    else
    {
      swift_errorRelease();
      swift_getErrorValue();
      sub_10019B770();
      uint64_t v15 = sub_10019B130();
      uint64_t v17 = v16;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))a3)(v15, v17);
    }
    swift_bridgeObjectRelease();
    return (uint64_t *)swift_errorRelease();
  }
  else
  {
    sub_100170BF0((uint64_t)v21, (uint64_t)v20);
    v24[6] = v20[6];
    v24[7] = v20[7];
    v24[8] = v20[8];
    uint64_t v24[2] = v20[2];
    v24[3] = v20[3];
    v24[4] = v20[4];
    v24[5] = v20[5];
    v24[0] = v20[0];
    v24[1] = v20[1];
    uint64_t v14 = sub_100144FE0((uint64_t)v24);
    a3(v14);
    swift_bridgeObjectRelease();
    return sub_100170C7C(v21);
  }
}

uint64_t sub_1001700C4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100170774(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1001700F0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10017099C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

id sub_10017011C()
{
  id result = sub_10017013C();
  qword_10028D380 = (uint64_t)result;
  return result;
}

id sub_10017013C()
{
  uint64_t v0 = sub_10019ACD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10019AC00();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_10019ABE0();
  Class isa = sub_10019ABF0().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [v8 setLocale:isa];

  NSString v10 = sub_10019B0A0();
  [v8 setDateFormat:v10];

  if (qword_100284FB0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100128E40(v0, (uint64_t)qword_10028D368);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v11, v0);
  Class v12 = sub_10019ACB0().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  [v8 setTimeZone:v12];

  return v8;
}

uint64_t sub_1001703B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v4 = sub_10000C440(&qword_100282D10);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10019ABA0();
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  NSString v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  Class v12 = (char *)&v33 - v11;
  uint64_t v13 = type metadata accessor for UtcDate();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v43 = a1;
  sub_10007FDE0(a1, v16);
  sub_10019B810();
  if (!v2)
  {
    uint64_t v36 = v10;
    uint64_t v37 = v15;
    uint64_t v38 = v12;
    uint64_t v39 = v6;
    sub_10007FDE0(v42, v42[3]);
    uint64_t v17 = sub_10019B730();
    uint64_t v19 = v18;
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v42);
    if (qword_100284FB8 != -1) {
      swift_once();
    }
    id v20 = (id)qword_10028D380;
    uint64_t v34 = v17;
    uint64_t v35 = v19;
    NSString v21 = sub_10019B0A0();
    id v22 = [v20 dateFromString:v21];

    uint64_t v23 = v7;
    uint64_t v25 = v38;
    uint64_t v24 = (uint64_t)v39;
    uint64_t v26 = v36;
    uint64_t v27 = (uint64_t)v37;
    if (v22)
    {
      sub_10019AB70();

      uint64_t v28 = v41;
      uint64_t v29 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 32);
      v29(v24, v26, v23);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v24, 0, 1, v23);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v24, 1, v23) != 1)
      {
        swift_bridgeObjectRelease();
        v29((uint64_t)v25, (char *)v24, v23);
        v29(v27, v25, v23);
        sub_100170F18(v27, v40);
        return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v43);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v39, 1, 1, v23);
    }
    sub_10000C4EC(v24);
    sub_10015F24C();
    swift_allocError();
    uint64_t v30 = v35;
    *unint64_t v31 = v34;
    v31[1] = v30;
    swift_willThrow();
  }
  return _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v43);
}

uint64_t sub_10017075C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1001703B4(a1, a2);
}

uint64_t sub_100170774(void *a1)
{
  uint64_t v3 = (uint64_t)sub_10007FDE0(a1, a1[3]);
  sub_10019B810();
  if (!v1)
  {
    sub_10007FDE0(v9, v9[3]);
    uint64_t v4 = sub_10019B730();
    uint64_t v3 = v5;
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v9);
    BOOL v7 = v4 == 0x63696E756D6D6F63 && v3 == 0xED00006E6F697461;
    if (v7 || (sub_10019B720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 0;
    }
    else if (v4 == 0x796C72756F68 && v3 == 0xE600000000000000 || (sub_10019B720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 1;
    }
    else if (v4 == 0x796C696164 && v3 == 0xE500000000000000 || (sub_10019B720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 2;
    }
    else
    {
      sub_10015F24C();
      swift_allocError();
      *uint64_t v8 = v4;
      v8[1] = v3;
      swift_willThrow();
    }
  }
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
  return v3;
}

uint64_t sub_10017099C(void *a1)
{
  uint64_t v3 = (uint64_t)sub_10007FDE0(a1, a1[3]);
  sub_10019B810();
  if (!v1)
  {
    sub_10007FDE0(v9, v9[3]);
    uint64_t v4 = sub_10019B730();
    uint64_t v3 = v5;
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)v9);
    BOOL v7 = v4 == 0x796144656E6FLL && v3 == 0xE600000000000000;
    if (v7 || (sub_10019B720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 0;
    }
    else if (v4 == 0x72756F48656E6FLL && v3 == 0xE700000000000000 || (sub_10019B720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 1;
    }
    else if (v4 == 0x4D6E656574666966 && v3 == 0xEE00736574756E69 || (sub_10019B720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 2;
    }
    else
    {
      sub_10015F24C();
      swift_allocError();
      *uint64_t v8 = v4;
      v8[1] = v3;
      swift_willThrow();
    }
  }
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((uint64_t)a1);
  return v3;
}

double sub_100170BCC(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 1;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  return result;
}

uint64_t sub_100170BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C440(&qword_1002881C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100170C58(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t *sub_100170C7C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100170CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100170D64()
{
  unint64_t result = qword_1002881C8;
  if (!qword_1002881C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002881C8);
  }
  return result;
}

uint64_t sub_100170DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100170DCC);
}

uint64_t sub_100170DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100170E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100170E4C);
}

uint64_t sub_100170E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10019ABA0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for UtcDate()
{
  uint64_t result = qword_100288228;
  if (!qword_100288228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *type metadata accessor for TestingRigError()
{
  return &type metadata for TestingRigError;
}

uint64_t sub_100170F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UtcDate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100173100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100173118(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _commit];
}

id sub_100173314(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 commit];
  }
  else {
    return [a2 rollBack];
  }
}

BOOL sub_100174494(double *a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = [a1 filesEnumerator];
  uint64_t v3 = [v2 nextObject];

  BOOL v4 = v3 != 0;
  if (v3)
  {
    uint64_t v5 = sub_100175F24(v3);
    [v5 timeIntervalSince1970];
    double v7 = v6;
    double v8 = a1[1];

    if (v7 >= v8)
    {
      uint64_t v11 = [a1 ancientItemBlock];

      if (!v11) {
        goto LABEL_10;
      }
      Class v12 = [a1 now];
      uint64_t v13 = sub_100175E94(v3);
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v15 <= a1[2]) {
        goto LABEL_10;
      }
      uint64_t v10 = [a1 ancientItemBlock];
      goto LABEL_9;
    }
    uint64_t v9 = [a1 removalBlock];

    if (v9)
    {
      uint64_t v10 = [a1 removalBlock];
LABEL_9:
      uint64_t v16 = (void *)v10;
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v3);
    }
  }
LABEL_10:

  return v4;
}

void sub_100174B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100174B90(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a1 + 32);
  sub_1000E84A4(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _removeItem:v3];
}

void sub_100174BE8(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a1 + 32);
  sub_1000E84A4(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _handleAncientItem:v3];
}

void sub_100174C40(uint64_t a1)
{
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) isCancelled];
    BOOL v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"completed";
      unsigned int v6 = atomic_load(WeakRetained + 2);
      unsigned int v7 = atomic_load(WeakRetained + 3);
      int v10 = 138543874;
      if (v3) {
        CFStringRef v5 = @"cancelled";
      }
      CFStringRef v11 = v5;
      __int16 v12 = 1026;
      unsigned int v13 = v6;
      __int16 v14 = 1026;
      unsigned int v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Garbage collection was %{public}@. Removed objects: %{public}d, ancient objects: %{public}d.", (uint8_t *)&v10, 0x18u);
    }

    [*(id *)(a1 + 32) duration];
    [WeakRetained _reportStatisticsForDuration:*(void *)(a1 + 40) storageInfo:v3];
    double v8 = [WeakRetained completionHandler];

    if (v8)
    {
      uint64_t v9 = [WeakRetained completionHandler];
      ((void (**)(void, id))v9)[2](v9, v3);

      [WeakRetained setCompletionHandler:0];
    }
  }
}

void sub_100174FA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100174FCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeItemInBlockForKey:*(void *)(a1 + 32)];
}

id sub_1001758AC(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  CFStringRef v5 = self;
  if ([v4 length] && objc_msgSend(v4, "hasPrefix:", @"/"))
  {
    uint64_t v6 = [v4 substringFromIndex:1];

    id v4 = (id)v6;
  }
  if ([v5 validateName:v4 error:a3])
  {
    unsigned int v7 = [v4 stringByDeletingPathExtension];
    if ((unint64_t)[v7 length] > 2)
    {
      uint64_t v9 = [v4 pathExtension];
      int v10 = [v7 substringToIndex:2];
      CFStringRef v11 = [v7 substringFromIndex:2];
      __int16 v12 = [v10 stringByAppendingPathComponent:v11];

      id v8 = [v12 stringByAppendingPathExtension:v9];
    }
    else
    {
      id v8 = v4;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id sub_100175A00(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  self;
  if ([v4 length])
  {
    CFStringRef v5 = [v4 pathComponents];
    if ([v5 count])
    {
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
      unsigned int v7 = [v6 isEqualToString:@"/"];

      if (v7)
      {
        uint64_t v8 = [v5 subarrayWithRange:1, (char *)[v5 count] - 1];

        CFStringRef v5 = (void *)v8;
      }
    }
    if ([v5 count] == (id)1 || objc_msgSend(v5, "count") == (id)2)
    {
      uint64_t v9 = [v5 componentsJoinedByString:&stru_1002392C0];
    }
    else
    {
      CFStringRef v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "File path contains illegal characters. %{private}@", buf, 0xCu);
      }

      if (a3)
      {
        v14[0] = @"name";
        v14[1] = @"reason";
        v15[0] = v4;
        v15[1] = @"File path contains illegal characters.";
        __int16 v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
        *a3 = +[NSError errorWithDomain:@"APFileSystemNameErrorDomain" code:2 userInfo:v12];
      }
      uint64_t v9 = 0;
    }
    goto LABEL_17;
  }
  int v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "File path is empty. %{private}@", buf, 0xCu);
  }

  if (a3)
  {
    CFStringRef v16 = @"reason";
    CFStringRef v17 = @"File path is empty.";
    CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    +[NSError errorWithDomain:@"APFileSystemNameErrorDomain" code:2 userInfo:v5];
    uint64_t v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v9 = 0;
LABEL_18:

  return v9;
}

id *sub_100175CDC(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    CFStringRef v11 = [a1 init];
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 5, a4);
      objc_storeStrong(a1 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
    }
  }

  return a1;
}

void *sub_100175E94(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[1];
    if (!v3)
    {
      id v4 = [a1 fileManager];
      id v5 = (id)v2[4];
      uint64_t v6 = [v4 createdDateForFileAtPath:v5 error:0];
      unsigned int v7 = (void *)v2[1];
      v2[1] = v6;

      id v3 = (void *)v2[1];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void *sub_100175F24(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      id v4 = [a1 fileManager];
      id v5 = (id)v2[4];
      uint64_t v6 = [v4 lastModifiedDateForFileAtPath:v5 error:0];
      unsigned int v7 = (void *)v2[2];
      v2[2] = v6;

      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

NSString *__cdecl sub_100177220(id a1, id a2)
{
  return (NSString *)sub_1000E84A4((uint64_t)a2);
}

void sub_1001773DC(uint64_t a1)
{
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (data != 1)
  {
    CFStringRef v2 = @"WARNING";
    if (data != 2) {
      CFStringRef v2 = 0;
    }
    if (data == 4) {
      CFStringRef v3 = @"CRITICAL";
    }
    else {
      CFStringRef v3 = v2;
    }
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138543362;
      CFStringRef v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Cache Stats: Received a memory pressure event: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_1001774B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _printCacheStatistics];
}

void sub_100177868(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _printCacheStatistics];
}

void sub_10017A5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10017A60C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = APLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v13 = 134349314;
      id v14 = [v5 count];
      __int16 v15 = 2114;
      id v16 = v6;
      id v9 = "Got %{public}lu items from Media API. Error: %{public}@";
      id v10 = v7;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v8)
  {
    int v13 = 134349056;
    id v14 = [v5 count];
    id v9 = "Got %{public}lu items from Media API. Success.";
    id v10 = v7;
    uint32_t v11 = 12;
    goto LABEL_6;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleMediaServiceResponse:v5 params:*(void *)(a1 + 32) error:v6 completionHandler:*(void *)(a1 + 40)];
}

void sub_10017AB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10017AB64(uint64_t a1, void *a2)
{
  CFStringRef v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleRankedRepresentations:v4 params:*(void *)(a1 + 32)];
}

void sub_10017AF08(id *a1, void *a2)
{
  id v9 = a2;
  CFStringRef v3 = [a1[4] addContentDataOnly:v9];
  if (a1[5] == v9 || [a1[6] deliverEntireBatch])
  {
    id v4 = [a1[7] bundleID];
    [v3 markInUseByClientWithId:v4];
  }
  id v5 = [a1[7] _loadJourneyStartRelayValuesFromContentData:v9];
  id v6 = [a1[7] _loadInternalPropertiesFromContentData:v9];
  unsigned int v7 = [[APJourneyDaemonMetricHelper alloc] initWithContentData:v9];
  BOOL v8 = [a1[7] bundleID];
  [a1[7] responseTime];
  -[APJourneyDaemonMetricHelper receivedForBundleID:adServer:elapsedTime:relayValues:internalProperties:](v7, "receivedForBundleID:adServer:elapsedTime:relayValues:internalProperties:", v8, 3, v5, v6);
}

id *sub_10017B78C(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)APPCControllerCoordinator;
    a1 = (id *)[super init];
    if (a1)
    {
      uint32_t v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136643331;
        NSString v21 = "-[APPCControllerCoordinator initWithBundleID:requesterID:promotedContentDeliveryBlock:]";
        __int16 v22 = 2048;
        uint64_t v23 = a1;
        __int16 v24 = 2114;
        id v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{sensitive}s: bundleID for controller %p is %{public}@.", buf, 0x20u);
      }

      objc_storeStrong(a1 + 3, a2);
      id v12 = [v10 copy];
      id v13 = a1[4];
      a1[4] = v12;

      uint64_t v14 = +[NSMutableSet set];
      id v15 = a1[5];
      a1[5] = (id)v14;

      id v16 = objc_alloc_init((Class)APUnfairRecursiveLock);
      id v17 = a1[6];
      a1[6] = v16;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

void sub_10017B9FC(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (a1)
  {
    uint64_t v18 = +[APIDAccountProvider privateUserAccount];
    unsigned int v19 = [v18 isNoServicesRegion];
    unsigned int v20 = [v18 isChild];
    if ((v19 & 1) == 0 && !v20)
    {
      if ([a1 isBlockedForNewsSubscriber:v14 bundleID:v15])
      {
        NSString v21 = APLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "This context can not be used to generate ads for this user due to subscription status.", buf, 2u);
        }

        __int16 v22 = a1;
        id v23 = v14;
        uint64_t v24 = 1029;
        id v25 = v13;
        uint64_t v26 = -1;
        goto LABEL_15;
      }
      id v30 = [v13 indexOfObject:&off_10024A3B8];
      if (v30 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v67 = 0x7FFFFFFFFFFFFFFFLL;
        unsigned int v62 = a6;
        id v60 = 0;
        goto LABEL_30;
      }
      if ((unint64_t)[v13 count] < 2)
      {
        id v31 = [a1 _getAppStorePlacement:v14];
        id v32 = v31;
        if (v31 == (id)7005)
        {
          if ([a1 hasRunningLandingPageRequest])
          {
            uint64_t v33 = APLogForCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "There is a Media API operation in flight, ignoring current request.", buf, 2u);
            }

            __int16 v22 = a1;
            id v23 = v14;
            uint64_t v24 = 1025;
            id v25 = v13;
            uint64_t v26 = 5;
            goto LABEL_15;
          }
        }
        else if (!v31)
        {
          __int16 v22 = a1;
          id v23 = v14;
          uint64_t v24 = 1028;
          id v25 = v13;
          uint64_t v26 = 4;
          goto LABEL_15;
        }
        uint64_t v67 = (uint64_t)v30;
        unsigned int v62 = a6;
        id v60 = v32;
        [(id)objc_opt_class() _sendFirstRequestMetricIfRequiredForPlacement:v32];
LABEL_30:
        uint64_t v69 = +[NSUUID UUID];
        uint64_t v34 = [v14 fingerprint];
        uint64_t v35 = +[APManagedContext findManagedContextByFingerprint:v34];

        if (v35)
        {
          uint64_t v36 = APLogForCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = [v14 fingerprint];
            *(_DWORD *)buf = 138543362;
            char v71 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Context with fingerprint %{public}@ is found in the cache.", buf, 0xCu);
          }
          id v38 = [a1 queryCacheForRequests:v13 managedContext:v35];
          uint64_t v39 = (void *)v35;
          uint64_t v40 = (void *)v69;
        }
        else
        {
          if (v67 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v41 = [v14 supplementalContext];

            if (!v41)
            {
              [a1 createContentDatasFromContext:v14 unfilledReasonCode:1025 types:v13 diagnosticCode:6 completionHandler:v17];
              goto LABEL_54;
            }
          }
          uint64_t v63 = +[APManagedContext createManagedContextWithContext:v14 idAccount:v18];
          uint64_t v42 = APLogForCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v43 = [v14 fingerprint];
            *(_DWORD *)buf = 138543362;
            char v71 = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Context with fingerprint %{public}@ was not found in the cache and is just created.", buf, 0xCu);
          }
          id v38 = v13;
          uint64_t v40 = (void *)v69;
          uint64_t v39 = (void *)v63;
        }
        long long v66 = v38;
        if (![v38 count])
        {
          unint64_t v54 = APLogForCategory();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            long long v55 = [v40 UUIDString];
            [v14 identifier];
            v56 = long long v65 = v39;
            *(_DWORD *)buf = 138543618;
            char v71 = v55;
            __int16 v72 = 2114;
            uint64_t v73 = (uint64_t)v56;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "The request %{public}@ for Context %{public}@ was completely satisfied by the cache.", buf, 0x16u);

            uint64_t v39 = v65;
          }

          v17[2](v17);
          goto LABEL_55;
        }
        id v44 = [v39 idAccount];
        if (!v44) {
          id v44 = v18;
        }
        if (v67 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v68 = v44;
          long long v64 = v39;
          uint64_t v45 = [a1 lock];
          [v45 lock];
          long long v46 = [a1 tokens];
          [v46 addObject:v40];

          [v45 unlock];
          APLogForCategory();
          v48 = uint64_t v47 = v40;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v59 = [v14 identifier];
            uint64_t v61 = v45;
            uint64_t v49 = [v47 UUIDString];
            *(_DWORD *)buf = 138543618;
            char v71 = v59;
            __int16 v72 = 2114;
            uint64_t v73 = v49;
            uint64_t v50 = (void *)v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Context %{public}@ makes a request %{public}@ to the legacy interface.", buf, 0x16u);

            uint64_t v45 = v61;
          }

          LOBYTE(v58) = v62;
          uint64_t v51 = a1;
          int v52 = v66;
          uint64_t v53 = v68;
          [v51 requestFromLegacyInterfaceForPromotedContents:v66 context:v14 withToken:v47 andBundleID:v15 clientInfo:v16 idAccount:v68 deliverEntireBatch:v58 completionHandler:v17];

          uint64_t v39 = v64;
        }
        else
        {
          uint64_t v53 = v44;
          if (v35)
          {
            [a1 createContentDatasFromContext:v14 unfilledReasonCode:1025 types:v13 diagnosticCode:7 completionHandler:v17];
          }
          else
          {
            long long v57 = objc_alloc_init(APMediaServiceRequestParameters);
            [(APMediaServiceRequestParameters *)v57 setContext:v14];
            [(APMediaServiceRequestParameters *)v57 setRequestID:v69];
            [(APMediaServiceRequestParameters *)v57 setClientInfo:v16];
            [(APMediaServiceRequestParameters *)v57 setIdAccount:v53];
            [(APMediaServiceRequestParameters *)v57 setPlacement:v60];
            [(APMediaServiceRequestParameters *)v57 setDeliverEntireBatch:v62];
            [a1 _requestFromMediaWithParams:v57 completionHandler:v17];
          }
          int v52 = v66;
        }

LABEL_54:
        uint64_t v40 = (void *)v69;
LABEL_55:

        goto LABEL_16;
      }
      APSimulateCrash();
      __int16 v22 = a1;
      id v23 = v14;
      uint64_t v24 = 1027;
      id v25 = v13;
      uint64_t v26 = 3;
LABEL_15:
      [v22 createContentDatasFromContext:v23 unfilledReasonCode:v24 types:v25 diagnosticCode:v26 completionHandler:v17];
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v27 = APLogForCategory();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        uint64_t v29 = "This is a no services region. No ad requests allowed to server.";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, v29, buf, 2u);
      }
    }
    else if (v28)
    {
      *(_WORD *)buf = 0;
      uint64_t v29 = "This is a U13 user. No ad requests allowed to server.";
      goto LABEL_13;
    }

    __int16 v22 = a1;
    id v23 = v14;
    uint64_t v24 = 1025;
    id v25 = v13;
    uint64_t v26 = 2;
    goto LABEL_15;
  }
LABEL_17:
}

void sub_10017C7E0(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([a1[4] countForObject:v6])
  {
    id v7 = a1[5];
    id v8 = [a1[6] bundleID];
    [v7 markInUseByClientWithId:v8];

    [a1[4] removeObject:v6];
    id v9 = [a1[6] deliveryBlock];
    id v10 = [a1[5] contentData];
    id v12 = v10;
    uint32_t v11 = +[NSArray arrayWithObjects:&v12 count:1];
    ((void (**)(void, void *))v9)[2](v9, v11);

    *a4 = 1;
  }
}

void sub_10017CD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Block_object_dispose((const void *)(v26 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10017CDB8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8) + 24;
    id v8 = [*(id *)(a1 + 32) count];
    LOBYTE(v11) = *(unsigned char *)(a1 + 80);
    [WeakRetained handleNewPromotedContent:v5 adsReceived:v7 adsRequested:v8 token:*(void *)(a1 + 40) context:*(void *)(a1 + 48) lastInBatch:a3 deliverEntireBatch:v11 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "APPCControllerCoordinator was destroyed by the time when we got a response back.", buf, 2u);
    }

    id v10 = +[APPCControllerCoordinator _addToCacheContentData:v5 context:*(void *)(a1 + 48)];
  }
}

void sub_10017D3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

uint64_t sub_10017D414(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10017D424(uint64_t a1)
{
}

void sub_10017D42C(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 7005)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setHasRunningLandingPageRequest:0];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_10017D6B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10017DE60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10017DF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10017DF78(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v6 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017E080;
  block[3] = &unk_10022E368;
  objc_copyWeak(&v12, a1);
  id v10 = v3;
  id v11 = v4;
  id v7 = v4;
  id v8 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void sub_10017E080(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _storeIntegrityEvent:*(void *)(a1 + 32)];
}

void sub_10017E5E4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  switch(a2)
  {
    case 1:
      id v6 = APLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v15 = 136380675;
        uint64_t v16 = v7;
        id v8 = "connection at %{private}s waiting";
        goto LABEL_12;
      }
      break;
    case 3:
      id v6 = APLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v15 = 136380675;
        uint64_t v16 = v12;
        id v8 = "connection at %{private}s is ready";
        goto LABEL_12;
      }
      break;
    case 4:
      id v6 = APLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v15 = 136380675;
        uint64_t v16 = v13;
        id v8 = "connection at %{private}s failed";
        goto LABEL_12;
      }
      break;
    case 5:
      id v6 = APLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = 136380675;
        uint64_t v16 = v14;
        id v8 = "connection at %{private}s is cancelled ";
LABEL_12:
        id v10 = v6;
        uint32_t v11 = 12;
        goto LABEL_13;
      }
      break;
    default:
      id v6 = APLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 136380931;
        uint64_t v16 = v9;
        __int16 v17 = 1026;
        int v18 = a2;
        id v8 = "connection at %{private}s state %{public}d";
        id v10 = v6;
        uint32_t v11 = 18;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v15, v11);
      }
      break;
  }
}

void sub_10017E940(id a1, OS_nw_error *a2)
{
  CFStringRef v2 = a2;
  id v3 = v2;
  if (v2)
  {
    int error_code = nw_error_get_error_code((nw_error_t)v2);
    id v5 = APLogForCategory();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (error_code == 57)
    {
      if (v6)
      {
        int v8 = 138543362;
        uint64_t v9 = v3;
        uint64_t v7 = "Error sending data socket not connected %{public}@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v6)
    {
      int v8 = 138543362;
      uint64_t v9 = v3;
      uint64_t v7 = "Error sending data %{public}@";
      goto LABEL_7;
    }
  }
}

void sub_10017EF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10017EF58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishedWithRequestsForCoordinator:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t sub_10017F104(uint64_t a1, uint64_t a2)
{
  id v3 = sub_1000E8498(a2);
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void sub_10017F68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10017F6D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        uint64_t v9 = +[APDeviceInfo current];
        [v8 setIsPAAvailableForAd:[v9 personalizedAdsEnabled]];

        [v8 setIsLocationAvailableForAd:[*(id *)(a1 + 32) isLocationAvailableForAd]];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint32_t v11 = [WeakRetained connection];
  uint64_t v12 = [v11 remoteObjectProxy];
  [v12 contentResponses:v3 requester:*(void *)(a1 + 40)];
}

void sub_10017FA68(id a1)
{
  uint64_t v1 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  CFStringRef v2 = [v1 lastObject];

  v16[0] = v2;
  v16[1] = @"com.apple.ap.promotedcontentd";
  v16[2] = @"ecs";
  id v3 = +[NSArray arrayWithObjects:v16 count:3];
  uint64_t v4 = +[NSURL fileURLWithPathComponents:v3];
  id v5 = (void *)qword_10028D238;
  qword_10028D238 = v4;

  id v6 = objc_alloc_init((Class)NSFileManager);
  id v11 = 0;
  [v6 createDirectoryAtURL:qword_10028D238 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v7 = v11;
  if (v7)
  {
    int v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 code];
      *(_DWORD *)buf = 134349315;
      id v13 = v9;
      __int16 v14 = 2113;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create sessions folder. Code: %{public}ld. %{private}@", buf, 0x16u);
    }

    id v10 = (void *)qword_10028D238;
    qword_10028D238 = 0;
  }
}

APPersistentCachedStoreTransactionalProtocol *sub_10017FE74()
{
  self;

  return +[APPersistentCacheStoreProvider persistentCacheStore];
}

id sub_10017FEA4(void *a1)
{
  if (a1)
  {
    a1 = +[APPersistentCacheStoreProvider persistentCacheStore];
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_10017FEDC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [self cacheKeyForIdentifier:v2];

  self;
  uint64_t v4 = +[APPersistentCacheStoreProvider persistentCacheStore];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

id sub_10017FF74(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  self;
  uint64_t v4 = +[APPersistentCacheStoreProvider persistentCacheStore];
  id v5 = [v3 cacheKeyForIdentifier:v2];

  id v6 = [v4 isObjectAliveForKey:v5];
  return v6;
}

void sub_10017FFFC(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a1;
    id v4 = a2;
    id v7 = v3;
    if (+[APCacheableObjectProxy objectIsLoaded:v3])
    {
      id v7 = [v3 proxyObject];
    }
    id v5 = +[APPersistentCacheStoreProvider persistentCacheStore];
    id v6 = [v3 cacheKey];
    [v5 setObject:v7 forKey:v6 transaction:v4];
  }
}

id sub_1001800CC(id result)
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = +[APPersistentCacheStoreProvider persistentCacheStore];
    id v3 = [v2 createTransaction];

    sub_10017FFFC(v1, v3);
    id v4 = [v3 commit];

    return v4;
  }
  return result;
}

id sub_100180140(id result)
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = +[APPersistentCacheStoreProvider persistentCacheStore];
    id v3 = [v2 createTransaction];

    id v4 = +[APPersistentCacheStoreProvider persistentCacheStore];
    id v5 = [v1 cacheKey];
    [v4 removeObjectForKey:v5 transaction:v3];

    id v6 = [v3 commit];
    return v6;
  }
  return result;
}

void sub_1001801E0(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v5 = +[APPersistentCacheStoreProvider persistentCacheStore];
    id v4 = [a1 cacheKey];
    [v5 removeObjectForKey:v4 transaction:v3];
  }
}

void sub_100180274(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v7 = [self cacheKeyForIdentifier:v5];

  self;
  id v6 = +[APPersistentCacheStoreProvider persistentCacheStore];
  [v6 removeObjectForKey:v7 transaction:v4];
}

id sub_10018031C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [self cacheKeyForIdentifier:v2];

  self;
  id v4 = +[APPersistentCacheStoreProvider persistentCacheStore];
  id v5 = [v4 hasObjectForKey:v3];

  return v5;
}

void sub_1001803A0(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v5 = +[APPersistentCacheStoreProvider persistentCacheStore];
    id v4 = [a1 cacheKey];
    [v5 touchObjectForKey:v4 transaction:v3];
  }
}

id cloneSecureCodingObject(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
  id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:a2 fromData:v3 error:0];

  return v4;
}

void sub_100181354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1001814D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1001814F4(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)os_transaction_create();
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v6 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001815FC;
  block[3] = &unk_10022E368;
  objc_copyWeak(&v12, a1);
  id v10 = v3;
  id v11 = v4;
  id v7 = v4;
  id v8 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void sub_1001815FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _storeEvent:*(void *)(a1 + 32)];
}

void sub_100182008(uint64_t a1)
{
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  uint64_t v24[2] = sub_1001822B0;
  v24[3] = &unk_100238A78;
  char v26 = *(unsigned char *)(a1 + 72);
  id v25 = *(id *)(a1 + 32);
  +[APAMSBagManager shouldUseAMSMescalWithCompletionHandler:v24];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_100182380;
  v21[3] = &unk_100238A78;
  id v22 = *(id *)(a1 + 32);
  char v23 = *(unsigned char *)(a1 + 73);
  +[APAMSBagManager httpUseFixedHttpSessionManagerWithCompletionHandler:v21];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10018246C;
  v18[3] = &unk_100238AA0;
  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  +[APAMSBagManager httpLookBackWindowWithCompletionHandler:v18];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_10018255C;
  v15[3] = &unk_100238AC8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v16 = v3;
  uint64_t v17 = v4;
  +[APAMSBagManager httpMaximumConnectionsPerHostWithCompletionHandler:v15];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100182644;
  v12[3] = &unk_100238AC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v13 = v5;
  uint64_t v14 = v6;
  +[APAMSBagManager httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  long long v9[2] = sub_10018272C;
  v9[3] = &unk_100238AC8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  id v10 = v7;
  uint64_t v11 = v8;
  +[APAMSBagManager cacheSizeWithCompletionHandler:v9];
}

id *sub_1001822B0(id *result, uint64_t a2)
{
  if (*((unsigned __int8 *)result + 40) != a2)
  {
    id v3 = result;
    uint64_t v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 134349056;
      uint64_t v6 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Loaded new 'useAMSMescal' value from Bag: %{public}ld", (uint8_t *)&v5, 0xCu);
    }

    return (id *)[v3[4] setUseAMSMescalValue:a2];
  }
  return result;
}

void sub_100182380(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    a2 = [*(id *)(a1 + 32) httpUseFixedHttpSessionManagerDefaultValue];
  }
  if (*(unsigned __int8 *)(a1 + 40) != a2)
  {
    uint64_t v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349056;
      uint64_t v8 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Loaded new 'useFixedHttpSessionManager' value from Bag: %{public}ld", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) setHttpUseFixedHttpSessionManagerValue:a2];
  }
}

void sub_10018246C(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(a1 + 32) httpLookBackWindowDefaultValue];
    a3 = v6;
  }
  if (*(double *)(a1 + 40) != a3)
  {
    int v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134349056;
      double v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Loaded new 'httpLookBackWindow' value from Bag: %{public}f", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) setHttpLookBackWindowValue:a3];
  }
}

void sub_10018255C(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    a2 = [*(id *)(a1 + 32) httpMaximumConnectionsPerHostDefaultValue];
  }
  if (*(id *)(a1 + 40) != a2)
  {
    double v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349056;
      id v8 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Loaded new 'httpMaximumConnectionsPerHost' value from Bag: %{public}ld", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) setHttpMaximumConnectionsPerHostValue:a2];
  }
}

void sub_100182644(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    a2 = [*(id *)(a1 + 32) httpMaximumConnectionsPerHostTempSessionDefaultValue];
  }
  if (*(id *)(a1 + 40) != a2)
  {
    double v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349056;
      id v8 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Loaded new 'httpMaximumConnectionsPerHostTempSession' value from Bag: %{public}ld", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) setHttpMaximumConnectionsPerHostTempSessionValue:a2];
  }
}

void sub_10018272C(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    a2 = [*(id *)(a1 + 32) cacheSizeLimitDefaultValue];
  }
  if (*(id *)(a1 + 40) != a2)
  {
    double v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349056;
      id v8 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Loaded new 'cacheSize' value from Bag: %{public}ld", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) setCacheSizeLimitValue:a2];
  }
}

void sub_1001828C8(id a1)
{
  qword_10028D250 = objc_alloc_init(APIDAccountsWeakContainer);

  _objc_release_x1();
}

void sub_100182C30(id a1, APMetricProtocol *a2)
{
  id v2 = a2;
  id v3 = metricPropertyValue(v2, (void *)5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = metricPropertyValue(v2, (void *)5);
    unsigned int v5 = [v4 BOOLValue];

    if (!v5)
    {
      double v6 = [(APMetricProtocol *)v2 contentIdentifier];
      int v7 = +[APManagedContentData findById:v6];
      id v8 = v7;
      if (v7)
      {
        if ([v7 state] == (id)3)
        {
          double v9 = APLogForCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v13 = 138543362;
            uint64_t v14 = v6;
            id v10 = "%{public}@ was already marked as used.";
LABEL_14:
            uint64_t v11 = v9;
            os_log_type_t v12 = OS_LOG_TYPE_INFO;
            goto LABEL_15;
          }
        }
        else
        {
          [v8 markUsed];
          double v9 = APLogForCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v13 = 138543362;
            uint64_t v14 = v6;
            id v10 = "%{public}@ is now on screen and mark it as used in the cache.";
            goto LABEL_14;
          }
        }
      }
      else
      {
        double v9 = APLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          uint64_t v14 = v6;
          id v10 = "Trying to mark promoted content with content id: %@ as used, but couldn't find it.";
          uint64_t v11 = v9;
          os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v13, 0xCu);
        }
      }

      goto LABEL_17;
    }
  }
  else
  {
  }
  double v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = [(APMetricProtocol *)v2 contentIdentifier];
    int v13 = 138543362;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ is now on screen but is is collapsed. Do not mark it as used in the cache.", (uint8_t *)&v13, 0xCu);
LABEL_17:
  }
}

void sub_100183930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10018394C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = [a2 identifier];
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t sub_100183AA8(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void sub_100183E44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100183E7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v8 = [WeakRetained gcSchedulerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183F88;
  block[3] = &unk_100234B00;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  dispatch_async(v8, block);

  v6[2](v6, @"Started...");
  objc_destroyWeak(&v10);
}

void sub_100183F74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100183F88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = +[NSDate now];
  [WeakRetained _performGC:v1 completionHandler:0];
}

void sub_100183FF4(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  double v6 = [WeakRetained gcSchedulerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001840D8;
  v8[3] = &unk_100238BF0;
  id v9 = v4;
  id v7 = v4;
  objc_copyWeak(&v10, a1);
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
}

void sub_1001840D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _dumpCache];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void sub_100184448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100184470(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setGarbageCollector:0];
  if ((a2 & 1) == 0)
  {
    id v4 = +[NSDate now];
    [WeakRetained _setLastGCDate:v4];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

int64_t sub_100184C84(id a1, APContentData *a2, APContentData *a3)
{
  id v4 = a3;
  uint64_t v5 = [(APContentData *)a2 representations];
  double v6 = [v5 anyObject];

  id v7 = [(APContentData *)v4 representations];

  unsigned int v8 = [v7 anyObject];

  id v9 = [v6 rank];
  if ((uint64_t)v9 >= (uint64_t)[v8 rank])
  {
    id v11 = [v6 rank];
    int64_t v10 = (uint64_t)v11 > (uint64_t)[v8 rank];
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

BOOL sub_100184DC4(id a1, APContentData *a2, NSDictionary *a3)
{
  return [(APContentData *)a2 hasValidRepresentation];
}

void sub_100185688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1001856B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _heavyContentKeyNames];

  return v2;
}

void sub_100185ECC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a2 placementType]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_1001874D0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(a1 + 32)];
  id v6 = +[APContentData createForServerUnfilledReason:0 placementType:5 contextIdentifier:v2];

  id v3 = [[APJourneyDaemonMetricHelper alloc] initWithContentData:v6];
  id v4 = [*(id *)(a1 + 40) requestID];
  uint64_t v5 = [v4 UUIDString];
  -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v3, "requestFailedForBundleID:withCode:requestID:placement:placementType:", @"com.apple.AppStore", 3303, v5, [*(id *)(a1 + 40) placement], 5);
}

void sub_100187944(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[MetricsModule storage];
  id v7 = [v6 notificationRegistrar];
  id v8 = [v7 registerHandlerForPurpose:a2 closure:v5];

  id v9 = *(void **)(a1 + 32);
  id v10 = +[NSNumber numberWithInteger:v8];
  [v9 addObject:v10];
}

void sub_100187A04(id a1, APMetricProtocol *a2)
{
}

void sub_100187A14(id a1, APMetricProtocol *a2)
{
}

void sub_100187A24(id a1, APMetricProtocol *a2)
{
}

void sub_100187A34(id a1, APMetricProtocol *a2)
{
}

void sub_100187A44(id a1, APMetricProtocol *a2)
{
}

void sub_100187A54(id a1, APMetricProtocol *a2)
{
}

id sub_100187D20(uint64_t a1)
{
  return _[*(id *)(a1 + 32) processInternalMetric:*(void *)(a1 + 40)];
}

id sub_100187DF8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) processMetric:*(void *)(a1 + 40)];
}

id sub_100187ED0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) processSignalMetric:*(void *)(a1 + 40)];
}

void sub_1001880A8(id *a1)
{
  id v2 = [a1[4] clientConnection];

  if (!v2)
  {
    id v3 = [APMetricClientConnection alloc];
    id v4 = [a1[5] objectAtIndexedSubscript:0];
    id v5 = [a1[5] objectAtIndexedSubscript:1];
    id v6 = [(APMetricClientConnection *)v3 initWithHost:v4 port:v5];
    [a1[4] setClientConnection:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [a1[6] ecServerDictionaryRepresentation];
    id v8 = [a1[6] additives:v7];

    id v9 = [v8 jsonDataWithOptions:0x400000];
    id v10 = +[NSData dataWithData:v9];

    if (v10 && [v10 length])
    {
      id v11 = [a1[4] clientConnection];
      [v11 send:v10];
    }
    else
    {
      id v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543362;
        uint64_t v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error representation %{public}@ to json", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    id v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v12 = a1[6];
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error converting metric to dictionary representation %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
}

id sub_1001883A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _provideEnvironmentForMetric:*(void *)(a1 + 40)];
}

id sub_100188AB8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _provideEnvironmentForMetric:*(void *)(a1 + 40)];
}

float sub_100188AC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [a3 objectForKey:v5];
    float v7 = 1.0;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 floatValue];
        float v7 = 0.0;
        if (v8 >= 0.0)
        {
          [v6 floatValue];
          float v7 = 1.0;
          if (v9 <= 1.0)
          {
            [v6 floatValue];
            float v7 = v10;
          }
        }
      }
      else
      {
        id v11 = APLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          id v14 = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "APInternalMessageRateLimitAdRequests metric must have NSNumber %@ property.", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

BOOL sub_10018E328(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    float v7 = [(NSURL *)v4 path];
    float v8 = [(NSError *)v5 localizedDescription];
    int v10 = 141558530;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2112;
    int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "An error occurred enumerating url:%{mask.hash}@. %{public}@", (uint8_t *)&v10, 0x20u);
  }
  return 1;
}

void sub_10018EAF8(id a1)
{
  v18[0] = @"com.apple.news";
  id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"751A1F1B-43AB-40F2-BB35-C6731882A9F7"];
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0900CB86-3865-4C60-8D49-A05C853628D4"];
  id v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v16, 0);
  v19[0] = v15;
  v18[1] = @"com.apple.appstored";
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"876F12EE-055C-49EB-8909-3BE6753CA832"];
  int v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, 0);
  v19[1] = v13;
  v18[2] = @"com.apple.appstoreagent";
  id v1 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"876F12EE-055C-49EB-8909-3BE6753CA832"];
  id v2 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, 0);
  v19[2] = v2;
  v18[3] = @"com.apple.passd";
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5DE1449E-0748-6CC5-CA7D-548E7E7AC24C"];
  id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, 0);
  v19[3] = v4;
  void v18[4] = @"com.apple.watchlistd";
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"25EF2050-5D1D-419D-AC15-CCA299E77EE0"];
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, 0);
  v19[4] = v6;
  v18[5] = @"com.apple.fitcored";
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"13616005-2862-4801-8CC1-662AD06477DE"];
  float v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, 0);
  v19[5] = v8;
  v18[6] = @"com.apple.stocks";
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"751A1F1B-43AB-40F2-BB35-C6731882A9F7"];
  int v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, 0);
  v19[6] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:7];
  __int16 v12 = (void *)qword_10028D278;
  qword_10028D278 = v11;
}

void sub_10018EEF8(id a1)
{
  id v1 = (void *)qword_10028D288;
  qword_10028D288 = (uint64_t)&off_10024B670;
}

void sub_10018EFEC(id *a1)
{
  if ([a1[4] hasWriteEntitlement])
  {
    id v2 = a1[5];
    id v3 = [a1[4] bundleID];
    unsigned __int8 v4 = +[PCStatusConditionsReceiver validateWhitelistingForCondition:v2 forBundleIdentifier:v3];

    if (v4)
    {
LABEL_11:
      id v12 = a1[4];
      id v13 = a1[5];
      id v14 = [v12 bundleID];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10018F2A8;
      v18[3] = &unk_100238F40;
      id v15 = a1[5];
      id v16 = a1[4];
      id v19 = v15;
      id v20 = v16;
      id v21 = a1[6];
      [v12 _isStatusConditionRegistered:v13 bundleIdentifier:v14 completionHandler:v18];

      id v6 = v19;
      goto LABEL_12;
    }
    id v5 = [a1[4] bundleID];
    +[NSString stringWithFormat:@"%@ : %@ is not a whitelisted status condition.", v5, a1[5]];
  }
  else
  {
    id v5 = [a1[4] bundleID];
    +[NSString stringWithFormat:@"Ignoring request from unentitled client %@", v5, v17];
  id v6 = };

  if (!v6) {
    goto LABEL_11;
  }
  id v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136643075;
    id v25 = "-[PCStatusConditionsReceiver setStatusCondition:completionHandler:]_block_invoke";
    __int16 v26 = 2114;
    uint64_t v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{sensitive}s]: %{public}@", buf, 0x16u);
  }

  float v8 = (void (**)(id, void *))a1[6];
  if (v8)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    char v23 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    int v10 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1100 userInfo:v9];
    v8[2](v8, v10);
  }
  uint64_t v11 = [a1[4] connection];
  [v11 invalidate];

  [a1[4] setConnection:0];
LABEL_12:
}

uint64_t sub_10018F2A8(uint64_t a1, char a2, void *a3)
{
  if (!a3)
  {
    id v5 = [PCBooleanCondition alloc];
    id v6 = [*(id *)(a1 + 32) UUIDString];
    id v7 = [*(id *)(a1 + 40) bundleID];
    float v8 = [(PCBooleanCondition *)v5 initWithType:@"sc" value:v6 identifier:v7];

    +[PCStatusConditionStorage setStatusCondition:v8];
    objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) == 0)
    {
      id v9 = [*(id *)(a1 + 40) conditionsService];
      [v9 clearCache];
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }

  return _objc_release_x1();
}

void sub_10018F490(id *a1)
{
  if ([a1[4] hasWriteEntitlement])
  {
    id v2 = a1[5];
    id v3 = [a1[4] bundleID];
    unsigned __int8 v4 = +[PCStatusConditionsReceiver validateWhitelistingForCondition:v2 forBundleIdentifier:v3];

    if (v4)
    {
LABEL_11:
      id v12 = a1[4];
      id v13 = a1[5];
      id v14 = [v12 bundleID];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10018F74C;
      v18[3] = &unk_100238F40;
      id v15 = a1[5];
      id v16 = a1[4];
      id v19 = v15;
      id v20 = v16;
      id v21 = a1[6];
      [v12 _isStatusConditionRegistered:v13 bundleIdentifier:v14 completionHandler:v18];

      id v6 = v19;
      goto LABEL_12;
    }
    id v5 = [a1[4] bundleID];
    +[NSString stringWithFormat:@"%@ : %@ is not a whitelisted status condition.", v5, a1[5]];
  }
  else
  {
    id v5 = [a1[4] bundleID];
    +[NSString stringWithFormat:@"Ignoring request from unentitled client %@", v5, v17];
  id v6 = };

  if (!v6) {
    goto LABEL_11;
  }
  id v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136643075;
    id v25 = "-[PCStatusConditionsReceiver clearStatusCondition:completionHandler:]_block_invoke";
    __int16 v26 = 2114;
    uint64_t v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{sensitive}s]: %{public}@", buf, 0x16u);
  }

  float v8 = (void (**)(id, void *))a1[6];
  if (v8)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    char v23 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1100 userInfo:v9];
    v8[2](v8, v10);
  }
  uint64_t v11 = [a1[4] connection];
  [v11 invalidate];

  [a1[4] setConnection:0];
LABEL_12:
}

uint64_t sub_10018F74C(uint64_t a1, int a2, void *a3)
{
  if (!a3)
  {
    id v5 = [PCBooleanCondition alloc];
    id v6 = [*(id *)(a1 + 32) UUIDString];
    id v7 = [*(id *)(a1 + 40) bundleID];
    float v8 = [(PCBooleanCondition *)v5 initWithType:@"sc" value:v6 identifier:v7];

    +[PCStatusConditionStorage clearStatusCondition:v8];
    objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      id v9 = [*(id *)(a1 + 40) conditionsService];
      [v9 clearCache];
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }

  return _objc_release_x1();
}

void sub_10018F95C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) hasReadEntitlement];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    unsigned __int8 v4 = [v3 bundleID];
    unsigned __int8 v5 = +[PCStatusConditionsReceiver validateWhitelistingForRead:v4];

    if (v5) {
      goto LABEL_11;
    }
    id v6 = [*(id *)(a1 + 32) bundleID];
    +[NSString stringWithFormat:@"%@ : %@ is not a whitelisted status condition reader.", v6, *(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v3 bundleID];
    +[NSString stringWithFormat:@"Ignoring request from unentitled client %@", v6, v19];
  id v7 = };

  if (v7)
  {
    float v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136643075;
      char v23 = "-[PCStatusConditionsReceiver isStatusConditionRegistered:bundleIdentifier:completionHandler:]_block_invoke";
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{sensitive}s]: %{public}@", buf, 0x16u);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      uint64_t v29 = v7;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      uint64_t v11 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1100 userInfo:v10];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v11);
    }
    id v12 = [*(id *)(a1 + 32) connection];
    [v12 invalidate];

    [*(id *)(a1 + 32) setConnection:0];
    goto LABEL_14;
  }
LABEL_11:
  id v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136643331;
    char v23 = "-[PCStatusConditionsReceiver isStatusConditionRegistered:bundleIdentifier:completionHandler:]_block_invoke";
    __int16 v24 = 2114;
    id v25 = v14;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{sensitive}s]: retrieving registration for condition %{public}@ and bundle %{public}@.", buf, 0x20u);
  }

  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10018FC60;
  v20[3] = &unk_100238F68;
  uint64_t v18 = *(void *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  [v16 _isStatusConditionRegistered:v17 bundleIdentifier:v18 completionHandler:v20];
  id v7 = v21;
LABEL_14:
}

uint64_t sub_10018FC60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10019107C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100191098(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1001910A8(uint64_t a1)
{
}

void sub_1001910B0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = [a2 description];
  unsigned __int8 v4 = +[NSString stringWithFormat:@"\n%@", v8];
  uint64_t v5 = [v3 stringByAppendingString:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_1001911BC(id a1)
{
  id v1 = (void *)qword_10028D298;
  qword_10028D298 = (uint64_t)&off_10024B688;
}

void sub_100191A00(id a1)
{
  qword_10028D2A8 = objc_alloc_init(PCStatusConditionsService);

  _objc_release_x1();
}

void sub_100191B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100191BA0(uint64_t a1)
{
  unsigned __int8 v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136642819;
    uint64_t v5 = "-[PCStatusConditionsService init]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[%{sensitive}s]: User account changed, clearing cached status condition evaluations.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCache];
}

void sub_100191CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100192424(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10019244C(id a1)
{
  id v1 = +[APDataAdaptorRepository sharedRepository];
  unsigned __int8 v2 = [v1 registerAdaptorClass:objc_opt_class()];

  if (v2)
  {
    id v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [v2 code];
      uint64_t v5 = [v2 localizedDescription];
      int v6 = 134218242;
      id v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error %ld registering status condition data adaptor: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_100194E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id location)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v65 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100194F20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100194F30(uint64_t a1)
{
}

void sub_100194F38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412546;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v7;
      id v13 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: Error fetching API host from AMSMediaTask bag. Error: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v14 = +[NSURLComponents componentsWithString:@"https://amp-api-edge.apps.apple.com"];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    id v8 = objc_alloc_init((Class)NSURLComponents);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v5 absoluteString];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setHost:v11];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setScheme:@"https"];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1001950CC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v6 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: Error fetching country code from AMSMediaTask bag", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = @"us";
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_1001951E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_1001951EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    APSimulateCrashNoKillProcess();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) dataTaskPromiseWithRequest:v5];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    long long v10[2] = sub_10019537C;
    v10[3] = &unk_1002390C8;
    objc_copyWeak(v15, (id *)(a1 + 72));
    id v11 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    int v9 = *(void **)(a1 + 80);
    id v12 = v8;
    v15[1] = v9;
    void v15[2] = *(id *)(a1 + 88);
    id v13 = *(id *)(a1 + 56);
    char v16 = *(unsigned char *)(a1 + 96);
    id v14 = *(id *)(a1 + 64);
    [v7 addFinishBlock:v10];

    objc_destroyWeak(v15);
  }
}

void sub_100195368(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10019537C(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 64);
  id v6 = a3;
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained endSignpostForPlacement:[*(id *)(a1 + 32) placement] log:*(void *)(a1 + 40) logID:*(void *)(a1 + 72)];

  id v8 = +[NSDate now];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  double v11 = v10 - *(double *)(a1 + 80);
  id v12 = objc_loadWeakRetained(v5);
  [v12 setResponseTime:v11];

  +[APMediaServiceRequest _logResponse:v13 requestID:*(void *)(a1 + 48) error:v6 prettyPrint:*(unsigned __int8 *)(a1 + 88)];
  +[APMediaServiceRequest _handleResult:v13 error:v6 params:*(void *)(a1 + 32) responseReceivedTimestamp:*(void *)(a1 + 56) completionHandler:v10];
}

void sub_100196770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[NSURLQueryItem queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

uint64_t _checkClassType(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a1;
  id v7 = a3;
  if (!v6)
  {
    if (!a4) {
      goto LABEL_9;
    }
    CFStringRef v15 = @"reason";
    id v8 = +[NSString stringWithFormat:@"%@ is nil", v7];
    char v16 = v8;
    double v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    *(void *)a4 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2201 userInfo:v9];
LABEL_8:

    a4 = 0;
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    CFStringRef v13 = @"reason";
    double v10 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v10);
    double v9 = +[NSString stringWithFormat:@"%@ is of the wrong type (%@)", v7, v8];
    id v14 = v9;
    double v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    *(void *)a4 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2201 userInfo:v11];

    goto LABEL_8;
  }
  a4 = 1;
LABEL_9:

  return a4;
}

id _contentDataWithContextID(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)APContentData);
  [v2 setContextIdentifier:v1];

  return v2;
}

id _contentDataWithContextIDAndError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = _contentDataWithContextID(v3);
  id v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 identifier];
    int v9 = 138543874;
    double v10 = v7;
    __int16 v11 = 2114;
    id v12 = v3;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content %{public}@ for context %{public}@ is being returned with error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [v5 setError:v4];

  return v5;
}

void sub_10019A520()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_10019A5A8()
{
  __assert_rtn("-[APPBAdDataUpdate writeTo:]", "APPBAdDataUpdate.m", 157, "nil != self->_uniqueIdentifier");
}

void sub_10019A5D4()
{
  __assert_rtn("-[APPBMediaAsset writeTo:]", "APPBMediaAsset.m", 378, "nil != self->_mediaURL");
}

void sub_10019A600()
{
  __assert_rtn("-[APPBParameter writeTo:]", "APPBParameter.m", 96, "nil != self->_key");
}

void sub_10019A62C()
{
  __assert_rtn("-[APPBParameter writeTo:]", "APPBParameter.m", 101, "nil != self->_value");
}

void sub_10019A658()
{
  __assert_rtn("-[APPBUserTransparencyResponse writeTo:]", "APPBUserTransparencyResponse.m", 86, "self->_transparencyDetails != nil");
}

void sub_10019A684()
{
  __assert_rtn("-[APPBAdAction writeTo:]", "APPBAdAction.m", 794, "nil != self->_identifier");
}

void sub_10019A6B0()
{
  __assert_rtn("-[APPBLocalizedStringEntry writeTo:]", "APPBLocalizedStringEntry.m", 83, "nil != self->_languageIdentifier");
}

void sub_10019A6DC()
{
  __assert_rtn("-[APPBLocalizedStringEntry writeTo:]", "APPBLocalizedStringEntry.m", 88, "nil != self->_value");
}

void sub_10019A708()
{
  __assert_rtn("-[APPBTargetingCriteria writeTo:]", "APPBTargetingCriteria.m", 110, "nil != self->_criteriaIdentifier");
}

void sub_10019A734()
{
  __assert_rtn("-[APPBMerchant writeTo:]", "APPBMerchant.m", 281, "nil != self->_identifier");
}

void sub_10019A760()
{
  __assert_rtn("-[APPBMerchant writeTo:]", "APPBMerchant.m", 286, "nil != self->_countryCode");
}

void sub_10019A78C()
{
  __assert_rtn("-[APPBMerchant writeTo:]", "APPBMerchant.m", 313, "nil != self->_paymentProcessingURL");
}

void sub_10019A7B8()
{
  __assert_rtn("-[APPBNumericParameter writeTo:]", "APPBNumericParameter.m", 92, "nil != self->_key");
}

void sub_10019A7E4()
{
  __assert_rtn("-[APPBKeyedParameterList writeTo:]", "APPBKeyedParameterList.m", 139, "nil != self->_key");
}

uint64_t sub_10019A810()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10019A820()
{
  return JSONDecoder.init()();
}

uint64_t sub_10019A830()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10019A840()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10019A850()
{
  return JSONEncoder.init()();
}

uint64_t sub_10019A860()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_10019A870()
{
  return DateComponents.nanosecond.getter();
}

uint64_t sub_10019A880()
{
  return DateComponents.nanosecond.setter();
}

uint64_t sub_10019A890()
{
  return DateComponents.weekOfYear.getter();
}

uint64_t sub_10019A8A0()
{
  return DateComponents.weekOfMonth.getter();
}

uint64_t sub_10019A8B0()
{
  return DateComponents.weekdayOrdinal.getter();
}

uint64_t sub_10019A8C0()
{
  return DateComponents.yearForWeekOfYear.getter();
}

uint64_t sub_10019A8D0()
{
  return DateComponents.day.getter();
}

uint64_t sub_10019A8E0()
{
  return DateComponents.era.getter();
}

uint64_t sub_10019A8F0()
{
  return DateComponents.hour.getter();
}

uint64_t sub_10019A900()
{
  return DateComponents.hour.setter();
}

uint64_t sub_10019A910()
{
  return DateComponents.year.getter();
}

uint64_t sub_10019A920()
{
  return DateComponents.month.getter();
}

uint64_t sub_10019A930()
{
  return DateComponents.minute.getter();
}

uint64_t sub_10019A940()
{
  return DateComponents.minute.setter();
}

uint64_t sub_10019A950()
{
  return DateComponents.second.getter();
}

uint64_t sub_10019A960()
{
  return DateComponents.second.setter();
}

uint64_t sub_10019A970()
{
  return DateComponents.quarter.getter();
}

uint64_t sub_10019A980()
{
  return DateComponents.weekday.getter();
}

uint64_t sub_10019A990()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_10019A9A0()
{
  return DateComponents.calendar.getter();
}

uint64_t sub_10019A9B0()
{
  return DateComponents.timeZone.getter();
}

uint64_t sub_10019A9C0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10019A9D0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10019A9E0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10019A9F0()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_10019AA00(NSURL *retstr@<X8>)
{
}

uint64_t sub_10019AA10()
{
  return URL.deletingLastPathComponent()();
}

uint64_t sub_10019AA20()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10019AA30(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10019AA40()
{
  return URL.init(string:encodingInvalidCharacters:)();
}

uint64_t sub_10019AA50()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10019AA60()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10019AA70()
{
  return type metadata accessor for URL();
}

NSData sub_10019AA80()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10019AA90()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10019AAA0()
{
  return Date.description.getter();
}

uint64_t sub_10019AAB0()
{
  return static Date.distantPast.getter();
}

uint64_t sub_10019AAC0()
{
  return static Date.distantFuture.getter();
}

uint64_t sub_10019AAD0()
{
  return Date.debugDescription.getter();
}

uint64_t sub_10019AAE0()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_10019AAF0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10019AB00()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10019AB10()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_10019AB20()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_10019AB30()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_10019AB40()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_10019AB50()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10019AB60()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_10019AB70()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10019AB80()
{
  return static Date.now.getter();
}

uint64_t sub_10019AB90()
{
  return Date.init()();
}

uint64_t sub_10019ABA0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10019ABB0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10019ABC0()
{
  return UUID.init()();
}

uint64_t sub_10019ABD0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10019ABE0()
{
  return Locale.init(identifier:)();
}

NSLocale sub_10019ABF0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10019AC00()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10019AC10()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_10019AC20()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_10019AC30()
{
  return Calendar.dateComponents(in:from:)();
}

uint64_t sub_10019AC40()
{
  return Calendar.dateComponents(_:from:to:)();
}

NSCalendar sub_10019AC50()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_10019AC60()
{
  return Calendar.date(from:)();
}

uint64_t sub_10019AC70()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t sub_10019AC80()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10019AC90()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10019ACA0()
{
  return TimeZone.init(abbreviation:)();
}

NSTimeZone sub_10019ACB0()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_10019ACC0()
{
  return static TimeZone.current.getter();
}

uint64_t sub_10019ACD0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10019ACE0()
{
  return type metadata accessor for WorkResult();
}

uint64_t sub_10019ACF0()
{
  return ExtendedUUID.debugDescription.getter();
}

uint64_t sub_10019AD00()
{
  return static ExtendedUUID.== infix(_:_:)();
}

uint64_t sub_10019AD10()
{
  return ExtendedUUID.init(string:)();
}

uint64_t sub_10019AD20()
{
  return ExtendedUUID.string.getter();
}

uint64_t sub_10019AD30()
{
  return type metadata accessor for ExtendedUUID();
}

uint64_t sub_10019AD40()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019AD50()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019AD60()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019AD70()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019AD80()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019AD90()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019ADA0()
{
  return dispatch thunk of DatabaseCursor.read(_:)();
}

uint64_t sub_10019ADB0()
{
  return static WorkOrderFlags.useTransaction.getter();
}

uint64_t sub_10019ADC0()
{
  return type metadata accessor for WorkOrderFlags();
}

uint64_t sub_10019ADD0()
{
  return dispatch thunk of DatabaseManager.executeQuery(_:withParameters:)();
}

uint64_t sub_10019ADE0()
{
  return dispatch thunk of DatabaseManager.reduceFromQuery<A>(_:parameters:into:_:)();
}

uint64_t sub_10019ADF0()
{
  return dispatch thunk of DatabaseManager.singleValueFromQuery<A>(_:parameters:transform:)();
}

uint64_t sub_10019AE00()
{
  return dispatch thunk of DatabaseManager.multipleValuesFromQuery<A>(_:parameters:transform:)();
}

uint64_t sub_10019AE10()
{
  return DatabaseManager.init(database:log:)();
}

uint64_t sub_10019AE20()
{
  return type metadata accessor for DatabaseManager();
}

uint64_t sub_10019AE30()
{
  return WorkCoordinator.createAndRun(workerName:group:workData:requestorId:requestorData:flags:configClosure:)();
}

uint64_t sub_10019AE40()
{
  return dispatch thunk of static WorkCoordinator.create(database:)();
}

uint64_t sub_10019AE50()
{
  return static WorkCoordinator.shared.getter();
}

uint64_t sub_10019AE60()
{
  return dispatch thunk of WorkCoordinator.startNow()();
}

uint64_t sub_10019AE70()
{
  return type metadata accessor for WorkCoordinator();
}

uint64_t sub_10019AE80()
{
  return type metadata accessor for IntBucketContents();
}

uint64_t sub_10019AE90()
{
  return dispatch thunk of IntBucketStrategy.bucketFor(value:)();
}

uint64_t sub_10019AEA0()
{
  return ClassifiedIntBucket.init(name:contents:)();
}

uint64_t sub_10019AEB0()
{
  return type metadata accessor for ClassifiedIntBucket();
}

uint64_t sub_10019AED0()
{
  return ConfigurableIntBucketStrategy.init(configurationStore:)();
}

Swift::Int sub_10019AEE0(Swift::Int value)
{
  return ConfigurableIntBucketStrategy.bucketFor(value:)(value);
}

uint64_t sub_10019AEF0()
{
  return type metadata accessor for ConfigurableIntBucketStrategy();
}

uint64_t sub_10019AF00()
{
  return JSONIntBucketConfigurationStore.init(jsonSource:fallback:)();
}

uint64_t sub_10019AF10()
{
  return type metadata accessor for JSONIntBucketConfigurationStore();
}

uint64_t sub_10019AF20()
{
  return static Tools.fullClassName(_:)();
}

uint64_t sub_10019AF30()
{
  return static Tools.codableToBinaryData<A>(_:)();
}

uint64_t sub_10019AF40()
{
  return static Tools.codableFromBinaryData<A>(_:type:)();
}

uint64_t sub_10019AF50()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10019AF60()
{
  return Logger.logObject.getter();
}

uint64_t sub_10019AF70()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10019AF80()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10019AF90()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10019AFA0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10019AFB0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10019AFC0()
{
  return static DispatchTime.now()();
}

uint64_t sub_10019AFD0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10019AFE0()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_10019AFF0()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_10019B000()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_10019B010()
{
  return + infix(_:_:)();
}

NSDictionary sub_10019B020()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10019B030()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10019B040()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10019B050()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10019B060()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10019B070()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_10019B080()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_10019B090()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10019B0A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10019B0B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10019B0C0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10019B0D0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_10019B0E0()
{
  return String.init(format:_:)();
}

uint64_t sub_10019B0F0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10019B100()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10019B110()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10019B120()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_10019B130()
{
  return String.debugDescription.getter();
}

uint64_t sub_10019B140()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10019B150()
{
  return String.hash(into:)();
}

uint64_t sub_10019B160()
{
  return String.count.getter();
}

uint64_t sub_10019B170()
{
  return String.index(after:)();
}

uint64_t sub_10019B180()
{
  return String.index(_:offsetBy:)();
}

void sub_10019B190(Swift::String a1)
{
}

Swift::Int sub_10019B1A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10019B1B0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_10019B1C0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_10019B1D0()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t sub_10019B1E0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_10019B1F0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_10019B200()
{
  return String.subscript.getter();
}

uint64_t sub_10019B210()
{
  return String.init<A>(_:)();
}

uint64_t sub_10019B220()
{
  return String.subscript.getter();
}

uint64_t sub_10019B230()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_10019B240()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t sub_10019B250()
{
  return Sequence.forEach(_:)();
}

uint64_t sub_10019B260()
{
  return dispatch thunk of RangeExpression.contains(_:)();
}

uint64_t sub_10019B270()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10019B280()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10019B290()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10019B2A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10019B2B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10019B2C0()
{
  return Array.description.getter();
}

uint64_t sub_10019B2D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10019B2E0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10019B2F0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10019B300()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10019B310()
{
  return type metadata accessor for Array();
}

NSNumber sub_10019B320()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_10019B330()
{
  return Double.write<A>(to:)();
}

NSNumber sub_10019B340()
{
  return Float._bridgeToObjectiveC()();
}

uint64_t sub_10019B350()
{
  return Float.write<A>(to:)();
}

uint64_t sub_10019B360()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_10019B370()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10019B380()
{
  return Collection.isPopulated.getter();
}

uint64_t sub_10019B390()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10019B3A0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10019B3B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10019B3C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10019B3D0()
{
  return static os_log_type_t.defaultOnInternalInstall.getter();
}

uint64_t sub_10019B3E0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10019B3F0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10019B400()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_10019B410()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10019B420()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10019B430()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

NSNumber sub_10019B440(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_10019B450()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_10019B460()
{
  return NSString.init(format:_:)();
}

uint64_t sub_10019B470()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10019B480()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10019B490()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_10019B4A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10019B4B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10019B4C0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_10019B4D0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10019B4E0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10019B4F0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10019B500()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10019B510()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10019B520()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10019B530(Swift::Int a1)
{
}

uint64_t sub_10019B540()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10019B550()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10019B560()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10019B570()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10019B580()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10019B590()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10019B5A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10019B5B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10019B5C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10019B5D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10019B5E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10019B5F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10019B600()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10019B610()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10019B620()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10019B630()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10019B640()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10019B650()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10019B660()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10019B670()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10019B680()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10019B690()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10019B6A0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10019B6B0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10019B6C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10019B6D0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10019B6E0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10019B6F0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10019B700()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10019B710()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_10019B720()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10019B730()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t sub_10019B740()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_10019B750()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10019B760()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10019B770()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10019B780()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10019B790()
{
  return Error._code.getter();
}

uint64_t sub_10019B7A0()
{
  return Error._domain.getter();
}

uint64_t sub_10019B7B0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10019B7C0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10019B7D0()
{
  return Hasher.init(_seed:)();
}

void sub_10019B7E0(Swift::UInt a1)
{
}

Swift::Int sub_10019B7F0()
{
  return Hasher._finalize()();
}

NSNumber sub_10019B800()
{
  return UInt64._bridgeToObjectiveC()();
}

uint64_t sub_10019B810()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t sub_10019B820()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10019B830()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t APDiagnosticsSubmissionAllowed()
{
  return _APDiagnosticsSubmissionAllowed();
}

uint64_t APLogForCategory()
{
  return _APLogForCategory();
}

uint64_t APPerfLogForCategory()
{
  return _APPerfLogForCategory();
}

uint64_t APSimulateCrash()
{
  return _APSimulateCrash();
}

uint64_t APSimulateCrashNoKillProcess()
{
  return _APSimulateCrashNoKillProcess();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BMAdPlatformsDiscardReasonsDiscardReasonAsString()
{
  return _BMAdPlatformsDiscardReasonsDiscardReasonAsString();
}

uint64_t BMAdPlatformsDiscardReasonsPlacementAsString()
{
  return _BMAdPlatformsDiscardReasonsPlacementAsString();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

uint64_t CreateDiagnosticReport()
{
  return _CreateDiagnosticReport();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return _PBDataWriterWriteFixed32Field();
}

uint64_t PBDataWriterWriteFixed64Field()
{
  return _PBDataWriterWriteFixed64Field();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PBRepeatedInt32Add()
{
  return _PBRepeatedInt32Add();
}

uint64_t PBRepeatedInt32Clear()
{
  return _PBRepeatedInt32Clear();
}

uint64_t PBRepeatedInt32Copy()
{
  return _PBRepeatedInt32Copy();
}

uint64_t PBRepeatedInt32Hash()
{
  return _PBRepeatedInt32Hash();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return _PBRepeatedInt32IsEqual();
}

uint64_t PBRepeatedInt32NSArray()
{
  return _PBRepeatedInt32NSArray();
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return _SecKeyCreateEncryptedData(key, algorithm, plaintext, error);
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return _SecKeyCreateRSAPublicKey();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return _TCCAccessPreflightWithAuditToken();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

{
}

{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t ba_is_process_extension()
{
  return _ba_is_process_extension();
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return _class_copyPropertyList(cls, outCount);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

uint64_t isExternalPurpose()
{
  return _isExternalPurpose();
}

uint64_t isInternalPurpose()
{
  return _isInternalPurpose();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return _nw_connection_create(endpoint, parameters);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return _nw_endpoint_create_host(hostname, port);
}

int nw_error_get_error_code(nw_error_t error)
{
  return _nw_error_get_error_code(error);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return _nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return _nw_path_is_constrained(path);
}

BOOL nw_path_is_equal(nw_path_t path, nw_path_t other_path)
{
  return _nw_path_is_equal(path, other_path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return _nw_path_is_expensive(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return _nw_path_uses_interface_type(path, interface_type);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return _property_getName(property);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
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

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

id objc_msgSend_AdDataUnfilledReasonCodeToASECode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "AdDataUnfilledReasonCodeToASECode:");
}

id objc_msgSend_AdDataUnfilledReasonCodeToUnfilledReasonCode_(void *a1, const char *a2, ...)
{
  return [a1 AdDataUnfilledReasonCodeToUnfilledReasonCode:];
}

id objc_msgSend_AdPlatforms(void *a1, const char *a2, ...)
{
  return _[a1 AdPlatforms];
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return _[a1 App];
}

id objc_msgSend_DPID(void *a1, const char *a2, ...)
{
  return _[a1 DPID];
}

id objc_msgSend_DiscardReasons(void *a1, const char *a2, ...)
{
  return _[a1 DiscardReasons];
}

id objc_msgSend_IDAccountsRecord(void *a1, const char *a2, ...)
{
  return _[a1 IDAccountsRecord];
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return _[a1 InFocus];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_JSONObjectWithObject_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithObject:];
}

id objc_msgSend_MarketplaceHealth(void *a1, const char *a2, ...)
{
  return _[a1 MarketplaceHealth];
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return _[a1 Media];
}

id objc_msgSend_Notification(void *a1, const char *a2, ...)
{
  return _[a1 Notification];
}

id objc_msgSend_NowPlaying(void *a1, const char *a2, ...)
{
  return _[a1 NowPlaying];
}

id objc_msgSend_POST_client_headers_body_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 POST:client:headers:body:completionHandler:];
}

id objc_msgSend_POST_headers_body_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 POST:x0 headers:x1 body:x2 withCompletionHandler:x3];
}

id objc_msgSend_RelevantIdentifierToRelevantIdentifierType_(void *a1, const char *a2, ...)
{
  return [a1 RelevantIdentifierToRelevantIdentifierType:];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return [a1 URLForKey:];
}

id objc_msgSend_URLResponse(void *a1, const char *a2, ...)
{
  return _[a1 URLResponse];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_Usage(void *a1, const char *a2, ...)
{
  return _[a1 Usage];
}

id objc_msgSend__accountIDsDict(void *a1, const char *a2, ...)
{
  return _[a1 _accountIDsDict];
}

id objc_msgSend__accumulatePlaybackTimeIfNoDuration(void *a1, const char *a2, ...)
{
  return _[a1 _accumulatePlaybackTimeIfNoDuration];
}

id objc_msgSend__accumulationReasonToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_accumulationReasonToString:");
}

id objc_msgSend__adRequestDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _adRequestDictionary];
}

id objc_msgSend__addAdjacentContext(void *a1, const char *a2, ...)
{
  return _[a1 _addAdjacentContext];
}

id objc_msgSend__addContentDataWithErrorForError_identifier_toResults_journeyStartRelayValues_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addContentDataWithErrorForError:identifier:toResults:journeyStartRelayValues:");
}

id objc_msgSend__addContext_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addContext:");
}

id objc_msgSend__addCurrentArticleContext(void *a1, const char *a2, ...)
{
  return _[a1 _addCurrentArticleContext];
}

id objc_msgSend__addDays_toDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addDays:toDate:");
}

id objc_msgSend__addFrequencyCappingDataToRequestDictionary_fromSupplementalContext_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addFrequencyCappingDataToRequestDictionary:fromSupplementalContext:");
}

id objc_msgSend__addImpressionCap_clickCap_toDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addImpressionCap:clickCap:toDictionary:");
}

id objc_msgSend__addProperty_fromSupplementalContext_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addProperty:fromSupplementalContext:");
}

id objc_msgSend__addToCacheContentData_context_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addToCacheContentData:context:");
}

id objc_msgSend__appendMetricToFile_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_appendMetricToFile:");
}

id objc_msgSend__asyncProcessMetrics_forChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_asyncProcessMetrics:forChannel:");
}

id objc_msgSend__attributionTokenRequestTimestamp_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _attributionTokenRequestTimestamp:completionHandler:];
}

id objc_msgSend__backoffTimerReset(void *a1, const char *a2, ...)
{
  return _[a1 _backoffTimerReset];
}

id objc_msgSend__backoffTimerScheduleNextLevel(void *a1, const char *a2, ...)
{
  return _[a1 _backoffTimerScheduleNextLevel];
}

id objc_msgSend__batchClosedWithBatchLifetime_batchID_eventsCount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_batchClosedWithBatchLifetime:batchID:eventsCount:");
}

id objc_msgSend__biomeStream(void *a1, const char *a2, ...)
{
  return _[a1 _biomeStream];
}

id objc_msgSend__buildPayloadForTimingAnalytics_startDate_endDate_additionalFields_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildPayloadForTimingAnalytics:startDate:endDate:additionalFields:");
}

id objc_msgSend__buildQueryParamsForDevicePlatform_placement_parameters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildQueryParamsForDevicePlatform:placement:parameters:");
}

id objc_msgSend__callAccumulationHandlerWithReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_callAccumulationHandlerWithReason:");
}

id objc_msgSend__canSendLocationInformationForClientInfo_(void *a1, const char *a2, ...)
{
  return [a1 _canSendLocationInformationForClientInfo:];
}

id objc_msgSend__cancelConfigRequest(void *a1, const char *a2, ...)
{
  return _[a1 _cancelConfigRequest];
}

id objc_msgSend__capArray_(void *a1, const char *a2, ...)
{
  return [a1 _capArray:];
}

id objc_msgSend__checkClassType_name_expectedClass_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_checkClassType:name:expectedClass:error:");
}

id objc_msgSend__checkErrorState(void *a1, const char *a2, ...)
{
  return _[a1 _checkErrorState];
}

id objc_msgSend__cleanupLeftovers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupLeftovers];
}

id objc_msgSend__clearCapDownloadDataProperties(void *a1, const char *a2, ...)
{
  return _[a1 _clearCapDownloadDataProperties];
}

id objc_msgSend__clicked_(void *a1, const char *a2, ...)
{
  return [a1 _clicked:];
}

id objc_msgSend__clientProcessInfo(void *a1, const char *a2, ...)
{
  return _[a1 _clientProcessInfo];
}

id objc_msgSend__clientSourceIDMap(void *a1, const char *a2, ...)
{
  return _[a1 _clientSourceIDMap];
}

id objc_msgSend__closeBatchForChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_closeBatchForChannel:");
}

id objc_msgSend__closeBatchesForChannels_shelved_groupBatches_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_closeBatchesForChannels:shelved:groupBatches:");
}

id objc_msgSend__closedFileDirectory(void *a1, const char *a2, ...)
{
  return _[a1 _closedFileDirectory];
}

id objc_msgSend__closedFilePath(void *a1, const char *a2, ...)
{
  return _[a1 _closedFilePath];
}

id objc_msgSend__closedPathForChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_closedPathForChannel:");
}

id objc_msgSend__commit(void *a1, const char *a2, ...)
{
  return _[a1 _commit];
}

id objc_msgSend__completeServerRequestId_serverFailureCount_result_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_completeServerRequestId:serverFailureCount:result:");
}

id objc_msgSend__computeMinimumSize_(void *a1, const char *a2, ...)
{
  return [a1 _computeMinimumSize:];
}

id objc_msgSend__configurationPollValue(void *a1, const char *a2, ...)
{
  return _[a1 _configurationPollValue];
}

id objc_msgSend__configurePreparedDataObjects(void *a1, const char *a2, ...)
{
  return _[a1 _configurePreparedDataObjects];
}

id objc_msgSend__confirmed50PercentImpressionRequest_internalContent_context_clientInfo_idAccount_forClickInteraction_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_confirmed50PercentImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:");
}

id objc_msgSend__confirmedImpressionRequest_internalContent_context_clientInfo_idAccount_forClickInteraction_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_confirmedImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:");
}

id objc_msgSend__contextDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _contextDictionary];
}

id objc_msgSend__continueAttribution_token_cached_requestTimestamp_error_constructionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _continueAttribution:x0 token:x1 cached:x2 requestTimestamp:x3 error:x4 constructionWithCompletionHandler:x5];
}

id objc_msgSend__convertOperator_(void *a1, const char *a2, ...)
{
  return [a1 _convertOperator:];
}

id objc_msgSend__coordinatorForRequester_clientInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_coordinatorForRequester:clientInfo:")];
}

id objc_msgSend__countEventsInBatch_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_countEventsInBatch:");
}

id objc_msgSend__createBranchForEnvironments(void *a1, const char *a2, ...)
{
  return _[a1 _createBranchForEnvironments];
}

id objc_msgSend__createContentDataInternalFrom_newContentDataId_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createContentDataInternalFrom:newContentDataId:");
}

id objc_msgSend__createEventTableIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _createEventTableIfNeeded];
}

id objc_msgSend__createEventTableWithManager_dayOfYear_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createEventTableWithManager:dayOfYear:")];
}

id objc_msgSend__createEventViewForDay_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createEventViewForDay:");
}

id objc_msgSend__createEventViewQueryForDay_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createEventViewQueryForDay:");
}

id objc_msgSend__createInstallAttributionFromAdData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createInstallAttributionFromAdData:");
}

id objc_msgSend__createManagedContextWithId_(void *a1, const char *a2, ...)
{
  return [a1 _createManagedContextWithId:];
}

id objc_msgSend__createNodeFromDictionary_identifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createNodeFromDictionary:identifier:error:");
}

id objc_msgSend__createProperties(void *a1, const char *a2, ...)
{
  return _[a1 _createProperties];
}

id objc_msgSend__createRepresentationsFromAdData_placementType_maxSize_mediaAssets_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createRepresentationsFromAdData:placementType:maxSize:mediaAssets:");
}

id objc_msgSend__createSessionForBag_(void *a1, const char *a2, ...)
{
  return [a1 _createSessionForBag:];
}

id objc_msgSend__createTokenDetailed_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createTokenDetailed:error:");
}

id objc_msgSend__currentDayOfYear(void *a1, const char *a2, ...)
{
  return _[a1 _currentDayOfYear];
}

id objc_msgSend__currentRateLimits(void *a1, const char *a2, ...)
{
  return _[a1 _currentRateLimits];
}

id objc_msgSend__dataFromBatchDictionaries_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dataFromBatchDictionaries:");
}

id objc_msgSend__dayOfYearForDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dayOfYearForDate:");
}

id objc_msgSend__delay(void *a1, const char *a2, ...)
{
  return _[a1 _delay];
}

id objc_msgSend__deleteByFilePath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deleteByFilePath:");
}

id objc_msgSend__deliveryLeeway(void *a1, const char *a2, ...)
{
  return _[a1 _deliveryLeeway];
}

id objc_msgSend__descriptionWithFormat_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_descriptionWithFormat:");
}

id objc_msgSend__deserializeResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deserializeResponse:error:")];
}

id objc_msgSend__destinationHashFromPath_(void *a1, const char *a2, ...)
{
  return [a1 _destinationHashFromPath:];
}

id objc_msgSend__determineBillable_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_determineBillable:");
}

id objc_msgSend__devicePlatform(void *a1, const char *a2, ...)
{
  return _[a1 _devicePlatform];
}

id objc_msgSend__dictionariesFromBatchesInStorage_useShelvedData_channels_groupBatches_batchInfos_billing_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dictionariesFromBatchesInStorage:useShelvedData:channels:groupBatches:batchInfos:billing:");
}

id objc_msgSend__dropExpiredEventTables(void *a1, const char *a2, ...)
{
  return _[a1 _dropExpiredEventTables];
}

id objc_msgSend__dumpCache(void *a1, const char *a2, ...)
{
  return _[a1 _dumpCache];
}

id objc_msgSend__encryptIDs(void *a1, const char *a2, ...)
{
  return _[a1 _encryptIDs];
}

id objc_msgSend__evaluatableChildNode_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_evaluatableChildNode:error:");
}

id objc_msgSend__eventCountDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _eventCountDictionary];
}

id objc_msgSend__eventViewTableNamesForDay_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_eventViewTableNamesForDay:");
}

id objc_msgSend__executeOperation_(void *a1, const char *a2, ...)
{
  return [a1 _executeOperation:];
}

id objc_msgSend__expirationOfData(void *a1, const char *a2, ...)
{
  return _[a1 _expirationOfData];
}

id objc_msgSend__expireTask_(void *a1, const char *a2, ...)
{
  return [a1 _expireTask:];
}

id objc_msgSend__failedPath_(void *a1, const char *a2, ...)
{
  return [a1 _failedPath:];
}

id objc_msgSend__fakeID(void *a1, const char *a2, ...)
{
  return _[a1 _fakeID];
}

id objc_msgSend__findPotentiallyDeliverableRequest(void *a1, const char *a2, ...)
{
  return _[a1 _findPotentiallyDeliverableRequest];
}

id objc_msgSend__finishedWithAllRequests(void *a1, const char *a2, ...)
{
  return _[a1 _finishedWithAllRequests];
}

id objc_msgSend__finishedWithRequestsForCoordinator_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_finishedWithRequestsForCoordinator:");
}

id objc_msgSend__frequencyCapDataFromAdData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_frequencyCapDataFromAdData:");
}

id objc_msgSend__generateOnDemandToken_interval_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_generateOnDemandToken:interval:completionHandler:")];
}

id objc_msgSend__getAppStorePlacement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getAppStorePlacement:");
}

id objc_msgSend__getCachedToken_(void *a1, const char *a2, ...)
{
  return [a1 _getCachedToken:];
}

id objc_msgSend__getLastGCDate(void *a1, const char *a2, ...)
{
  return _[a1 _getLastGCDate];
}

id objc_msgSend__handleAdValidationErrorDomainWithJourneyMetricsHelper_code_internalContent_type_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleAdValidationErrorDomainWithJourneyMetricsHelper:code:internalContent:type:");
}

id objc_msgSend__handleAncientItem_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleAncientItem:");
}

id objc_msgSend__handleMediaServiceResponse_params_error_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleMediaServiceResponse:params:error:completionHandler:");
}

id objc_msgSend__handleMissingClientInfoForRequestOfTypes_forContext_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleMissingClientInfoForRequestOfTypes:forContext:");
}

id objc_msgSend__handleRankedRepresentations_params_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRankedRepresentations:params:");
}

id objc_msgSend__handleResponseJsonData_error_params_responseReceivedTimestamp_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleResponseJsonData:error:params:responseReceivedTimestamp:completionHandler:");
}

id objc_msgSend__handleResult_error_params_responseReceivedTimestamp_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleResult:error:params:responseReceivedTimestamp:completionHandler:");
}

id objc_msgSend__hasObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 _hasObjectForKey:];
}

id objc_msgSend__hasSentFinalEvent(void *a1, const char *a2, ...)
{
  return _[a1 _hasSentFinalEvent];
}

id objc_msgSend__hasSession_purpose_(void *a1, const char *a2, ...)
{
  return [a1 _hasSession:purpose:];
}

id objc_msgSend__hashAndSavePayloadForInternalTesting_signature_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_hashAndSavePayloadForInternalTesting:signature:");
}

id objc_msgSend__heavyContentKeyNames(void *a1, const char *a2, ...)
{
  return _[a1 _heavyContentKeyNames];
}

id objc_msgSend__incrementBundleIDCount_(void *a1, const char *a2, ...)
{
  return [a1 _incrementBundleIDCount:];
}

id objc_msgSend__incrementCount_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_incrementCount:forKey:");
}

id objc_msgSend__initWithExpression_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithExpression:subExpressions:data:error:");
}

id objc_msgSend__initWithReference_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithReference:subExpressions:data:error:");
}

id objc_msgSend__internalProperties(void *a1, const char *a2, ...)
{
  return _[a1 _internalProperties];
}

id objc_msgSend__invalidElementError_(void *a1, const char *a2, ...)
{
  return [a1 _invalidElementError:];
}

id objc_msgSend__isEventDatabaseStorageEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isEventDatabaseStorageEnabled];
}

id objc_msgSend__isStatusConditionRegistered_bundleIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isStatusConditionRegistered:bundleIdentifier:completionHandler:");
}

id objc_msgSend__lastEventInsertOrder(void *a1, const char *a2, ...)
{
  return _[a1 _lastEventInsertOrder];
}

id objc_msgSend__launchHandler(void *a1, const char *a2, ...)
{
  return _[a1 _launchHandler];
}

id objc_msgSend__loadAllDataFromKeychainForKey_clickCountData_downloadData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_loadAllDataFromKeychainForKey:clickCountData:downloadData:");
}

id objc_msgSend__loadAllSampleRates(void *a1, const char *a2, ...)
{
  return _[a1 _loadAllSampleRates];
}

id objc_msgSend__loadBatchesAsDataForChannel_useShelvedData_groupBatches_batchInfos_billing_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_loadBatchesAsDataForChannel:useShelvedData:groupBatches:batchInfos:billing:");
}

id objc_msgSend__loadFailedRequestsCache(void *a1, const char *a2, ...)
{
  return _[a1 _loadFailedRequestsCache];
}

id objc_msgSend__loadIDAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _loadIDAccounts];
}

id objc_msgSend__loadInternalPropertiesFromContentData_(void *a1, const char *a2, ...)
{
  return [a1 _loadInternalPropertiesFromContentData:];
}

id objc_msgSend__loadJourneyStartRelayValuesFromAdData_(void *a1, const char *a2, ...)
{
  return [a1 _loadJourneyStartRelayValuesFromAdData:];
}

id objc_msgSend__loadJourneyStartRelayValuesFromContentData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_loadJourneyStartRelayValuesFromContentData:");
}

id objc_msgSend__loadOverrideContextForMetric_(void *a1, const char *a2, ...)
{
  return [a1 _loadOverrideContextForMetric:];
}

id objc_msgSend__loadRateLimitSettings(void *a1, const char *a2, ...)
{
  return _[a1 _loadRateLimitSettings];
}

id objc_msgSend__loadRateLimitsFromUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _loadRateLimitsFromUserDefaults];
}

id objc_msgSend__loadSampleSessionsfromStorage(void *a1, const char *a2, ...)
{
  return _[a1 _loadSampleSessionsfromStorage];
}

id objc_msgSend__loadServerConfig(void *a1, const char *a2, ...)
{
  return _[a1 _loadServerConfig];
}

id objc_msgSend__loadSettings(void *a1, const char *a2, ...)
{
  return _[a1 _loadSettings];
}

id objc_msgSend__locationDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _locationDictionary];
}

id objc_msgSend__logRequestURL_headers_body_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logRequestURL:headers:body:");
}

id objc_msgSend__logRequestURL_requestID_headers_innerRequestJson_prettyPrint_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logRequestURL:requestID:headers:innerRequestJson:prettyPrint:");
}

id objc_msgSend__logResponse_requestID_error_prettyPrint_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logResponse:requestID:error:prettyPrint:");
}

id objc_msgSend__logResponse_responseProtobuf_requestProtobufClass_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logResponse:responseProtobuf:requestProtobufClass:error:");
}

id objc_msgSend__makeApplicationSupportSubdirectory_(void *a1, const char *a2, ...)
{
  return [a1 _makeApplicationSupportSubdirectory:];
}

id objc_msgSend__makeRequest_serverFailureCount_responseCallback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_makeRequest:serverFailureCount:responseCallback:");
}

id objc_msgSend__markRequestAsFailed_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_markRequestAsFailed:");
}

id objc_msgSend__markRequestsAsSucceeded_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_markRequestsAsSucceeded:");
}

id objc_msgSend__metric(void *a1, const char *a2, ...)
{
  return _[a1 _metric];
}

id objc_msgSend__metricsByNumber_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_metricsByNumber:");
}

id objc_msgSend__migrateData(void *a1, const char *a2, ...)
{
  return _[a1 _migrateData];
}

id objc_msgSend__moveAllPendingRequestsToFailed(void *a1, const char *a2, ...)
{
  return _[a1 _moveAllPendingRequestsToFailed];
}

id objc_msgSend__notifyListenersOfMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_notifyListenersOfMetric:");
}

id objc_msgSend__objectForKey_ignoreKeys_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_objectForKey:ignoreKeys:");
}

id objc_msgSend__odmlProperties(void *a1, const char *a2, ...)
{
  return _[a1 _odmlProperties];
}

id objc_msgSend__openBatchForChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_openBatchForChannel:");
}

id objc_msgSend__openFileDirectory(void *a1, const char *a2, ...)
{
  return _[a1 _openFileDirectory];
}

id objc_msgSend__openFilePath(void *a1, const char *a2, ...)
{
  return _[a1 _openFilePath];
}

id objc_msgSend__options(void *a1, const char *a2, ...)
{
  return _[a1 _options];
}

id objc_msgSend__optionsArray(void *a1, const char *a2, ...)
{
  return _[a1 _optionsArray];
}

id objc_msgSend__parseContentDataJson_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_parseContentDataJson:");
}

id objc_msgSend__pastDueDailyReportDates(void *a1, const char *a2, ...)
{
  return _[a1 _pastDueDailyReportDates];
}

id objc_msgSend__pastDueMonthlyReportDates(void *a1, const char *a2, ...)
{
  return _[a1 _pastDueMonthlyReportDates];
}

id objc_msgSend__pastDueWeeklyReportDates(void *a1, const char *a2, ...)
{
  return _[a1 _pastDueWeeklyReportDates];
}

id objc_msgSend__payloadUploadFailureWithType_code_batchInfos_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_payloadUploadFailureWithType:code:batchInfos:");
}

id objc_msgSend__payloadUploadSuccessForBatchInfos_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_payloadUploadSuccessForBatchInfos:");
}

id objc_msgSend__pendingPath_(void *a1, const char *a2, ...)
{
  return [a1 _pendingPath:];
}

id objc_msgSend__performForceReconcile(void *a1, const char *a2, ...)
{
  return _[a1 _performForceReconcile];
}

id objc_msgSend__performGC_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_performGC:completionHandler:");
}

id objc_msgSend__periodicDelay(void *a1, const char *a2, ...)
{
  return _[a1 _periodicDelay];
}

id objc_msgSend__persistNewReferences(void *a1, const char *a2, ...)
{
  return _[a1 _persistNewReferences];
}

id objc_msgSend__placementForPlacement_(void *a1, const char *a2, ...)
{
  return [a1 _placementForPlacement:];
}

id objc_msgSend__policyDataFromAdData_(void *a1, const char *a2, ...)
{
  return [a1 _policyDataFromAdData:];
}

id objc_msgSend__printCacheStatistics(void *a1, const char *a2, ...)
{
  return _[a1 _printCacheStatistics];
}

id objc_msgSend__processContentIdOverrideIfNecessaryForMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processContentIdOverrideIfNecessaryForMetric:");
}

id objc_msgSend__processMetric_(void *a1, const char *a2, ...)
{
  return [a1 _processMetric:];
}

id objc_msgSend__processNextFile_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processNextFile:completionHandler:");
}

id objc_msgSend__processSigningQueue_useFpdi_signingAuthorityPoolManager_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processSigningQueue:useFpdi:signingAuthorityPoolManager:");
}

id objc_msgSend__properties(void *a1, const char *a2, ...)
{
  return _[a1 _properties];
}

id objc_msgSend__propertiesDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _propertiesDictionary];
}

id objc_msgSend__proxiedObjectIsAlive(void *a1, const char *a2, ...)
{
  return _[a1 _proxiedObjectIsAlive];
}

id objc_msgSend__purpose(void *a1, const char *a2, ...)
{
  return _[a1 _purpose];
}

id objc_msgSend__purposeConfig_(void *a1, const char *a2, ...)
{
  return [a1 _purposeConfig:];
}

id objc_msgSend__purposeFromPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_purposeFromPath:");
}

id objc_msgSend__rateLimitPlacementTypes_context_token_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_rateLimitPlacementTypes:context:token:completionHandler:")];
}

id objc_msgSend__readChannels(void *a1, const char *a2, ...)
{
  return _[a1 _readChannels];
}

id objc_msgSend__readResponseJsonForPlacement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_readResponseJsonForPlacement:");
}

id objc_msgSend__refillCacheWithTokensDetail_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_refillCacheWithTokensDetail:");
}

id objc_msgSend__registerMetricRequest_(void *a1, const char *a2, ...)
{
  return [a1 _registerMetricRequest:];
}

id objc_msgSend__relayData(void *a1, const char *a2, ...)
{
  return _[a1 _relayData];
}

id objc_msgSend__removeItem_(void *a1, const char *a2, ...)
{
  return [a1 _removeItem:];
}

id objc_msgSend__removeItemInBlockForKey_(void *a1, const char *a2, ...)
{
  return [a1 _removeItemInBlockForKey:];
}

id objc_msgSend__removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeObjectForKey:");
}

id objc_msgSend__removePendingRequest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removePendingRequest:");
}

id objc_msgSend__reportBuildRequestForPlacement_duration_bagDuration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_reportBuildRequestForPlacement:duration:bagDuration:");
}

id objc_msgSend__reportStatisticsForDuration_storageInfo_cancelled_(void *a1, const char *a2, ...)
{
  return [a1 _reportStatisticsForDuration:x0 storageInfo:x1 cancelled:x2];
}

id objc_msgSend__requestDebugInfo(void *a1, const char *a2, ...)
{
  return _[a1 _requestDebugInfo];
}

id objc_msgSend__requestFromMediaApi_params_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_requestFromMediaApi:params:completionHandler:");
}

id objc_msgSend__requestFromMediaWithParams_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _requestFromMediaWithParams:x0 completionHandler:x1];
}

id objc_msgSend__requestJsonCatchingError_(void *a1, const char *a2, ...)
{
  return [a1 _requestJsonCatchingError:];
}

id objc_msgSend__requireClassType_name_expectedClass_error_(void *a1, const char *a2, ...)
{
  return [a1 _requireClassType:name:expectedClass:error:];
}

id objc_msgSend__resultForResponseStatusCode_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_resultForResponseStatusCode:error:");
}

id objc_msgSend__resumeTelephonyAndReachability(void *a1, const char *a2, ...)
{
  return _[a1 _resumeTelephonyAndReachability];
}

id objc_msgSend__retrievePersonalizedAdsValue(void *a1, const char *a2, ...)
{
  return _[a1 _retrievePersonalizedAdsValue];
}

id objc_msgSend__retryFailedIfAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _retryFailedIfAvailable];
}

id objc_msgSend__run_(void *a1, const char *a2, ...)
{
  return [a1 _run:];
}

id objc_msgSend__samplePeriodFromConfig_(void *a1, const char *a2, ...)
{
  return [a1 _samplePeriodFromConfig:];
}

id objc_msgSend__sampleRateFromConfig_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sampleRateFromConfig:")];
}

id objc_msgSend__sendEventDatabaseCoreAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 _sendEventDatabaseCoreAnalytics];
}

id objc_msgSend__sendFirstRequestMetricIfRequiredForPlacement_(void *a1, const char *a2, ...)
{
  return [a1 _sendFirstRequestMetricIfRequiredForPlacement:];
}

id objc_msgSend__sendPayload_successCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendPayload:successCompletionHandler:");
}

id objc_msgSend__sendRawData_(void *a1, const char *a2, ...)
{
  return [a1 _sendRawData:];
}

id objc_msgSend__sendReportWithProperties_environment_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendReportWithProperties:environment:");
}

id objc_msgSend__sendRequest_(void *a1, const char *a2, ...)
{
  return [a1 _sendRequest:];
}

id objc_msgSend__sendRequest_responseCallback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendRequest:responseCallback:");
}

id objc_msgSend__serverConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _serverConfiguration];
}

id objc_msgSend__serverEnvironmentTranslation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverEnvironmentTranslation:");
}

id objc_msgSend__serverPost_requestTimestamp_payloadDeliveryStartDate_interval_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverPost:requestTimestamp:payloadDeliveryStartDate:interval:completionHandler:");
}

id objc_msgSend__serverURLForPurpose_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverURLForPurpose:");
}

id objc_msgSend__setLastGCDate_(void *a1, const char *a2, ...)
{
  return [a1 _setLastGCDate:];
}

id objc_msgSend__setObject_objectSerializedData_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setObject:objectSerializedData:forKey:");
}

id objc_msgSend__setRateLimit_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setRateLimit:");
}

id objc_msgSend__setupAccumulator(void *a1, const char *a2, ...)
{
  return _[a1 _setupAccumulator];
}

id objc_msgSend__setupConnection_port_(void *a1, const char *a2, ...)
{
  return [a1 _setupConnection:x0 port:x1];
}

id objc_msgSend__setupNotifyListener(void *a1, const char *a2, ...)
{
  return _[a1 _setupNotifyListener];
}

id objc_msgSend__shelvedPathForChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shelvedPathForChannel:");
}

id objc_msgSend__shouldBackoffForDestination_(void *a1, const char *a2, ...)
{
  return [a1 _shouldBackoffForDestination:];
}

id objc_msgSend__shouldReturnFakeResponse(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReturnFakeResponse];
}

id objc_msgSend__shouldSample_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shouldSample:");
}

id objc_msgSend__signFile_usingSigningAuthority_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signFile:usingSigningAuthority:completionHandler:");
}

id objc_msgSend__sortByRank_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sortByRank:completionHandler:");
}

id objc_msgSend__startAccumulationSource(void *a1, const char *a2, ...)
{
  return _[a1 _startAccumulationSource];
}

id objc_msgSend__startInactivitySource(void *a1, const char *a2, ...)
{
  return _[a1 _startInactivitySource];
}

id objc_msgSend__startMonitoringTelephony(void *a1, const char *a2, ...)
{
  return _[a1 _startMonitoringTelephony];
}

id objc_msgSend__startTestCommandsListener(void *a1, const char *a2, ...)
{
  return _[a1 _startTestCommandsListener];
}

id objc_msgSend__stopAccumulationSource(void *a1, const char *a2, ...)
{
  return _[a1 _stopAccumulationSource];
}

id objc_msgSend__stopDeliveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopDeliveryTimer];
}

id objc_msgSend__stopInactivitySource(void *a1, const char *a2, ...)
{
  return _[a1 _stopInactivitySource];
}

id objc_msgSend__storeEvent_(void *a1, const char *a2, ...)
{
  return [a1 _storeEvent:];
}

id objc_msgSend__storeIntegrityEvent_(void *a1, const char *a2, ...)
{
  return [a1 _storeIntegrityEvent:];
}

id objc_msgSend__storefront(void *a1, const char *a2, ...)
{
  return _[a1 _storefront];
}

id objc_msgSend__submitNewTask(void *a1, const char *a2, ...)
{
  return _[a1 _submitNewTask];
}

id objc_msgSend__targetingDimensionsFromAdData_(void *a1, const char *a2, ...)
{
  return [a1 _targetingDimensionsFromAdData:];
}

id objc_msgSend__timeIntervalToTomorrow(void *a1, const char *a2, ...)
{
  return _[a1 _timeIntervalToTomorrow];
}

id objc_msgSend__translateAd_contextID_iAdID_placement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_translateAd:contextID:iAdID:placement:");
}

id objc_msgSend__translateAdResult_contextID_iAdID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_translateAdResult:contextID:iAdID:");
}

id objc_msgSend__translateChildNodesToExpressionFormat_dataDictionary_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_translateChildNodesToExpressionFormat:dataDictionary:error:");
}

id objc_msgSend__translateMediaApiResponseToAds_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_translateMediaApiResponseToAds:error:");
}

id objc_msgSend__translateNodeToDataAdaptor_dataDictionary_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_translateNodeToDataAdaptor:dataDictionary:error:");
}

id objc_msgSend__translateRootNodeToExpressionFormat_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_translateRootNodeToExpressionFormat:error:");
}

id objc_msgSend__typeDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _typeDictionary];
}

id objc_msgSend__unconfirmedImpressionRequest_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_unconfirmedImpressionRequest:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend__unloadHeavyContentFromContentData(void *a1, const char *a2, ...)
{
  return _[a1 _unloadHeavyContentFromContentData];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateLastPlaybackTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 _updateLastPlaybackTimestamp];
}

id objc_msgSend__updateRateAndTime_rate_purpose_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateRateAndTime:rate:purpose:")];
}

id objc_msgSend__updateSampleSessionStorage_(void *a1, const char *a2, ...)
{
  return [a1 _updateSampleSessionStorage:];
}

id objc_msgSend__uploadFile_(void *a1, const char *a2, ...)
{
  return [a1 _uploadFile:];
}

id objc_msgSend__validateAndAddReference_reference_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_validateAndAddReference:reference:");
}

id objc_msgSend__validateMetric_forKey_fromDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_validateMetric:forKey:fromDictionary:");
}

id objc_msgSend__validateMetric_withMetrics_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_validateMetric:withMetrics:");
}

id objc_msgSend__validateParameters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_validateParameters:");
}

id objc_msgSend__validateRouteDefinition_(void *a1, const char *a2, ...)
{
  return [a1 _validateRouteDefinition:];
}

id objc_msgSend__visibleStateChanged_duration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_visibleStateChanged:duration:");
}

id objc_msgSend__withdrawShelvedBatchesForChannel_groupBatches_signingAuthority_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_withdrawShelvedBatchesForChannel:groupBatches:signingAuthority:");
}

id objc_msgSend__writeChannels(void *a1, const char *a2, ...)
{
  return _[a1 _writeChannels];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessAdCopy(void *a1, const char *a2, ...)
{
  return _[a1 accessAdCopy];
}

id objc_msgSend_accessCaption(void *a1, const char *a2, ...)
{
  return _[a1 accessCaption];
}

id objc_msgSend_accessHeadline(void *a1, const char *a2, ...)
{
  return _[a1 accessHeadline];
}

id objc_msgSend_accessText(void *a1, const char *a2, ...)
{
  return _[a1 accessText];
}

id objc_msgSend_accessibilityDescription(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityDescription];
}

id objc_msgSend_accountSettings(void *a1, const char *a2, ...)
{
  return _[a1 accountSettings];
}

id objc_msgSend_accountStateAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 accountStateAtIndex:];
}

id objc_msgSend_accountStatesCount(void *a1, const char *a2, ...)
{
  return _[a1 accountStatesCount];
}

id objc_msgSend_accountTypeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 accountTypeAtIndex:];
}

id objc_msgSend_accountTypesCount(void *a1, const char *a2, ...)
{
  return _[a1 accountTypesCount];
}

id objc_msgSend_accumulate50PercentVisibilityTime_(void *a1, const char *a2, ...)
{
  return [a1 accumulate50PercentVisibilityTime:];
}

id objc_msgSend_accumulate_(void *a1, const char *a2, ...)
{
  return [a1 accumulate:];
}

id objc_msgSend_accumulateAdRequests_(void *a1, const char *a2, ...)
{
  return [a1 accumulateAdRequests];
}

id objc_msgSend_accumulateVisibilityTime_(void *a1, const char *a2, ...)
{
  return [a1 accumulateVisibilityTime:];
}

id objc_msgSend_accumulated50PercentVisibilityTime(void *a1, const char *a2, ...)
{
  return _[a1 accumulated50PercentVisibilityTime];
}

id objc_msgSend_accumulatedItems(void *a1, const char *a2, ...)
{
  return _[a1 accumulatedItems];
}

id objc_msgSend_accumulatedPlaybackTime(void *a1, const char *a2, ...)
{
  return _[a1 accumulatedPlaybackTime];
}

id objc_msgSend_accumulatedVisibilityTime(void *a1, const char *a2, ...)
{
  return _[a1 accumulatedVisibilityTime];
}

id objc_msgSend_accumulationHandler(void *a1, const char *a2, ...)
{
  return _[a1 accumulationHandler];
}

id objc_msgSend_accumulationTime(void *a1, const char *a2, ...)
{
  return _[a1 accumulationTime];
}

id objc_msgSend_accumulatorLock(void *a1, const char *a2, ...)
{
  return _[a1 accumulatorLock];
}

id objc_msgSend_acknowledgedVersionForPersonalizedAds(void *a1, const char *a2, ...)
{
  return _[a1 acknowledgedVersionForPersonalizedAds];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return _[a1 actionURL];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_actionsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 actionsAtIndex:];
}

id objc_msgSend_actionsCount(void *a1, const char *a2, ...)
{
  return _[a1 actionsCount];
}

id objc_msgSend_activeChannels(void *a1, const char *a2, ...)
{
  return _[a1 activeChannels];
}

id objc_msgSend_activeCleanupOperation(void *a1, const char *a2, ...)
{
  return _[a1 activeCleanupOperation];
}

id objc_msgSend_activeDataTask(void *a1, const char *a2, ...)
{
  return _[a1 activeDataTask];
}

id objc_msgSend_adAccumulator(void *a1, const char *a2, ...)
{
  return _[a1 adAccumulator];
}

id objc_msgSend_adAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 adAtIndex:];
}

id objc_msgSend_adCopy(void *a1, const char *a2, ...)
{
  return _[a1 adCopy];
}

id objc_msgSend_adDataResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 adDataResponseIdentifier];
}

id objc_msgSend_adFormatType(void *a1, const char *a2, ...)
{
  return _[a1 adFormatType];
}

id objc_msgSend_adFrequencyCapData(void *a1, const char *a2, ...)
{
  return _[a1 adFrequencyCapData];
}

id objc_msgSend_adFrequencyDuration(void *a1, const char *a2, ...)
{
  return _[a1 adFrequencyDuration];
}

id objc_msgSend_adFrequencyValue(void *a1, const char *a2, ...)
{
  return _[a1 adFrequencyValue];
}

id objc_msgSend_adLayoutDataAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 adLayoutDataAtIndex:];
}

id objc_msgSend_adLayoutDatas(void *a1, const char *a2, ...)
{
  return _[a1 adLayoutDatas];
}

id objc_msgSend_adLayoutDatasCount(void *a1, const char *a2, ...)
{
  return _[a1 adLayoutDatasCount];
}

id objc_msgSend_adLayoutDetails(void *a1, const char *a2, ...)
{
  return _[a1 adLayoutDetails];
}

id objc_msgSend_adMetadata(void *a1, const char *a2, ...)
{
  return _[a1 adMetadata];
}

id objc_msgSend_adNetworkId(void *a1, const char *a2, ...)
{
  return _[a1 adNetworkId];
}

id objc_msgSend_adOriginalRequesterId(void *a1, const char *a2, ...)
{
  return _[a1 adOriginalRequesterId];
}

id objc_msgSend_adPolicies(void *a1, const char *a2, ...)
{
  return _[a1 adPolicies];
}

id objc_msgSend_adPosition(void *a1, const char *a2, ...)
{
  return _[a1 adPosition];
}

id objc_msgSend_adPrivacyMarkPosition(void *a1, const char *a2, ...)
{
  return _[a1 adPrivacyMarkPosition];
}

id objc_msgSend_adPrivacyMarkPositionToAdPrivacyMarkerPosition_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "adPrivacyMarkPositionToAdPrivacyMarkerPosition:");
}

id objc_msgSend_adRequesterLock(void *a1, const char *a2, ...)
{
  return _[a1 adRequesterLock];
}

id objc_msgSend_adRequesters(void *a1, const char *a2, ...)
{
  return _[a1 adRequesters];
}

id objc_msgSend_adResponseAudio(void *a1, const char *a2, ...)
{
  return _[a1 adResponseAudio];
}

id objc_msgSend_adResponseBanner(void *a1, const char *a2, ...)
{
  return _[a1 adResponseBanner];
}

id objc_msgSend_adResponseDataForPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 adResponseDataForPlacementType:];
}

id objc_msgSend_adResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 adResponseIdentifier];
}

id objc_msgSend_adResponseInterstitial(void *a1, const char *a2, ...)
{
  return _[a1 adResponseInterstitial];
}

id objc_msgSend_adResponseNative(void *a1, const char *a2, ...)
{
  return _[a1 adResponseNative];
}

id objc_msgSend_adResponseSponsorship(void *a1, const char *a2, ...)
{
  return _[a1 adResponseSponsorship];
}

id objc_msgSend_adResponseVideo(void *a1, const char *a2, ...)
{
  return _[a1 adResponseVideo];
}

id objc_msgSend_adServerEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 adServerEnvironment];
}

id objc_msgSend_adSizeForContainerSize_adData_(void *a1, const char *a2, ...)
{
  return [a1 adSizeForContainerSize:adData:];
}

id objc_msgSend_adTag(void *a1, const char *a2, ...)
{
  return _[a1 adTag];
}

id objc_msgSend_adTagContentString(void *a1, const char *a2, ...)
{
  return _[a1 adTagContentString];
}

id objc_msgSend_adType(void *a1, const char *a2, ...)
{
  return _[a1 adType];
}

id objc_msgSend_adUpdatesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 adUpdatesAtIndex:];
}

id objc_msgSend_adUpdatesCount(void *a1, const char *a2, ...)
{
  return _[a1 adUpdatesCount];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _[a1 adamID];
}

id objc_msgSend_adamId(void *a1, const char *a2, ...)
{
  return _[a1 adamId];
}

id objc_msgSend_adaptorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 adaptorIdentifier];
}

id objc_msgSend_adaptorWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 adaptorWithIdentifier:];
}

id objc_msgSend_add_(void *a1, const char *a2, ...)
{
  return [a1 add:];
}

id objc_msgSend_addAccountProperties_(void *a1, const char *a2, ...)
{
  return [a1 addAccountProperties:];
}

id objc_msgSend_addAccountState_(void *a1, const char *a2, ...)
{
  return [a1 addAccountState:];
}

id objc_msgSend_addAccountType_(void *a1, const char *a2, ...)
{
  return [a1 addAccountType:];
}

id objc_msgSend_addActions_(void *a1, const char *a2, ...)
{
  return [a1 addActions:];
}

id objc_msgSend_addActiveChannel_(void *a1, const char *a2, ...)
{
  return [a1 addActiveChannel:];
}

id objc_msgSend_addAd_(void *a1, const char *a2, ...)
{
  return [a1 addAd:];
}

id objc_msgSend_addAdLayoutData_(void *a1, const char *a2, ...)
{
  return [a1 addAdLayoutData:];
}

id objc_msgSend_addAdUpdates_(void *a1, const char *a2, ...)
{
  return [a1 addAdUpdates:];
}

id objc_msgSend_addAdsToEvict_(void *a1, const char *a2, ...)
{
  return [a1 addAdsToEvict];
}

id objc_msgSend_addAllowedExternalDomains_(void *a1, const char *a2, ...)
{
  return [a1 addAllowedExternalDomains:];
}

id objc_msgSend_addAssetInfo_(void *a1, const char *a2, ...)
{
  return [a1 addAssetInfo:];
}

id objc_msgSend_addAssociatedObject_(void *a1, const char *a2, ...)
{
  return [a1 addAssociatedObject];
}

id objc_msgSend_addCachedAds_(void *a1, const char *a2, ...)
{
  return [a1 addCachedAds:];
}

id objc_msgSend_addCapData_(void *a1, const char *a2, ...)
{
  return [a1 addCapData:];
}

id objc_msgSend_addClasses_(void *a1, const char *a2, ...)
{
  return [a1 addClasses:];
}

id objc_msgSend_addClientInfoProperties_(void *a1, const char *a2, ...)
{
  return [a1 addClientInfoProperties:];
}

id objc_msgSend_addClientToSegments_token_bundleID_replaceExisting_privateSegment_(void *a1, const char *a2, ...)
{
  return [a1 addClientToSegments:x0 token:x1 bundleID:x2 replaceExisting:x3 privateSegment:x4];
}

id objc_msgSend_addColors_(void *a1, const char *a2, ...)
{
  return [a1 addColors:];
}

id objc_msgSend_addConfirmedClickPixelURLs_(void *a1, const char *a2, ...)
{
  return [a1 addConfirmedClickPixelURLs:];
}

id objc_msgSend_addContentData_(void *a1, const char *a2, ...)
{
  return [a1 addContentData:];
}

id objc_msgSend_addContentDataOnly_(void *a1, const char *a2, ...)
{
  return [a1 addContentDataOnly:];
}

id objc_msgSend_addContentRestrictionProperties_(void *a1, const char *a2, ...)
{
  return [a1 addContentRestrictionProperties:];
}

id objc_msgSend_addCountForDayOfYear_purpose_event_value_environment_branch_(void *a1, const char *a2, ...)
{
  return [a1 addCountForDayOfYear:x0 purpose:x1 event:x2 value:x3 environment:x4 branch:x5];
}

id objc_msgSend_addCreativeSizes_(void *a1, const char *a2, ...)
{
  return [a1 addCreativeSizes:];
}

id objc_msgSend_addCriteriaValues_(void *a1, const char *a2, ...)
{
  return [a1 addCriteriaValues:];
}

id objc_msgSend_addCurrentConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 addCurrentConfiguration:];
}

id objc_msgSend_addDarkModeColors_(void *a1, const char *a2, ...)
{
  return [a1 addDarkModeColors:];
}

id objc_msgSend_addData_error_(void *a1, const char *a2, ...)
{
  return [a1 addData:error:];
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:];
}

id objc_msgSend_addDeviceInfoProperties_(void *a1, const char *a2, ...)
{
  return [a1 addDeviceInfoProperties:];
}

id objc_msgSend_addDeviceMode_(void *a1, const char *a2, ...)
{
  return [a1 addDeviceMode:];
}

id objc_msgSend_addDistributionMetrics_(void *a1, const char *a2, ...)
{
  return [a1 addDistributionMetrics:];
}

id objc_msgSend_addElements_(void *a1, const char *a2, ...)
{
  return [a1 addElements:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addEvent_(void *a1, const char *a2, ...)
{
  return [a1 addEvent:];
}

id objc_msgSend_addEvents_(void *a1, const char *a2, ...)
{
  return [a1 addEvents:];
}

id objc_msgSend_addExcludeTag_(void *a1, const char *a2, ...)
{
  return [a1 addExcludeTag:];
}

id objc_msgSend_addExclusionCriteria_(void *a1, const char *a2, ...)
{
  return [a1 addExclusionCriteria:];
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return [a1 addExecutionBlock:];
}

id objc_msgSend_addFailingURLs_(void *a1, const char *a2, ...)
{
  return [a1 addFailingURLs:];
}

id objc_msgSend_addFakeResponseHeadersToHeaders_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addFakeResponseHeadersToHeaders:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return [a1 addFinishBlock:];
}

id objc_msgSend_addFunctionNames_(void *a1, const char *a2, ...)
{
  return [a1 addFunctionNames:];
}

id objc_msgSend_addGeofences_(void *a1, const char *a2, ...)
{
  return [a1 addGeofences:];
}

id objc_msgSend_addIDAccount_(void *a1, const char *a2, ...)
{
  return [a1 addIDAccount:];
}

id objc_msgSend_addITunesMetadata_(void *a1, const char *a2, ...)
{
  return [a1 addITunesMetadata:];
}

id objc_msgSend_addInclusionCriteria_(void *a1, const char *a2, ...)
{
  return [a1 addInclusionCriteria:];
}

id objc_msgSend_addInfo_(void *a1, const char *a2, ...)
{
  return [a1 addInfo:];
}

id objc_msgSend_addInternalPropertyValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addInternalPropertyValue:forKey:];
}

id objc_msgSend_addJourneyStartRelayValues_(void *a1, const char *a2, ...)
{
  return [a1 addJourneyStartRelayValues:];
}

id objc_msgSend_addLines_(void *a1, const char *a2, ...)
{
  return [a1 addLines:];
}

id objc_msgSend_addLocalizedHeadlines_(void *a1, const char *a2, ...)
{
  return [a1 addLocalizedHeadlines:];
}

id objc_msgSend_addMatchTagClause_(void *a1, const char *a2, ...)
{
  return [a1 addMatchTagClause:];
}

id objc_msgSend_addMediaAssets_(void *a1, const char *a2, ...)
{
  return [a1 addMediaAssets:];
}

id objc_msgSend_addMetaData_(void *a1, const char *a2, ...)
{
  return [a1 addMetaData:];
}

id objc_msgSend_addMetric_(void *a1, const char *a2, ...)
{
  return [a1 addMetric:];
}

id objc_msgSend_addMiscellaneousProperties_(void *a1, const char *a2, ...)
{
  return [a1 addMiscellaneousProperties:];
}

id objc_msgSend_addNativeMetadata_(void *a1, const char *a2, ...)
{
  return [a1 addNativeMetadata:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObject_error_(void *a1, const char *a2, ...)
{
  return [a1 addObject:error:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addOffset_(void *a1, const char *a2, ...)
{
  return [a1 addOffset:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return [a1 addOperations:waitUntilFinished:];
}

id objc_msgSend_addPandoraTestProperties_(void *a1, const char *a2, ...)
{
  return [a1 addPandoraTestProperties:];
}

id objc_msgSend_addParameter_value_parameters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addParameter:value:parameters:");
}

id objc_msgSend_addParameterList_(void *a1, const char *a2, ...)
{
  return [a1 addParameterList:];
}

id objc_msgSend_addParameters_(void *a1, const char *a2, ...)
{
  return [a1 addParameters:];
}

id objc_msgSend_addPaymentCapabilities_(void *a1, const char *a2, ...)
{
  return [a1 addPaymentCapabilities:];
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return [a1 addPointer:];
}

id objc_msgSend_addPolicyValues_(void *a1, const char *a2, ...)
{
  return [a1 addPolicyValues:];
}

id objc_msgSend_addReference_(void *a1, const char *a2, ...)
{
  return [a1 addReference:];
}

id objc_msgSend_addRepeatingObject_count_(void *a1, const char *a2, ...)
{
  return [a1 addRepeatingObject:x0 count:x1];
}

id objc_msgSend_addRepresentation_(void *a1, const char *a2, ...)
{
  return [a1 addRepresentation:];
}

id objc_msgSend_addRepresentationWithSize_andPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 addRepresentationWithSize:andPlacementType:];
}

id objc_msgSend_addRepresentations_(void *a1, const char *a2, ...)
{
  return [a1 addRepresentations:];
}

id objc_msgSend_addRequesters_(void *a1, const char *a2, ...)
{
  return [a1 addRequesters:];
}

id objc_msgSend_addRequestersToRequest_(void *a1, const char *a2, ...)
{
  return [a1 addRequestersToRequest:];
}

id objc_msgSend_addRequiredTags_(void *a1, const char *a2, ...)
{
  return [a1 addRequiredTags:];
}

id objc_msgSend_addResourceCacheEntries_(void *a1, const char *a2, ...)
{
  return [a1 addResourceCacheEntries:];
}

id objc_msgSend_addResultTags_(void *a1, const char *a2, ...)
{
  return [a1 addResultTags:];
}

id objc_msgSend_addRewardTokens_(void *a1, const char *a2, ...)
{
  return [a1 addRewardTokens:];
}

id objc_msgSend_addScalarMetrics_(void *a1, const char *a2, ...)
{
  return [a1 addScalarMetrics:];
}

id objc_msgSend_addScreenSaverImageURL_(void *a1, const char *a2, ...)
{
  return [a1 addScreenSaverImageURL:];
}

id objc_msgSend_addSegmentIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 addSegmentIdentifiers:];
}

id objc_msgSend_addStoryboardSizes_(void *a1, const char *a2, ...)
{
  return [a1 addStoryboardSizes:];
}

id objc_msgSend_addSupportedPaymentNetworks_(void *a1, const char *a2, ...)
{
  return [a1 addSupportedPaymentNetworks:];
}

id objc_msgSend_addTagTransformations_(void *a1, const char *a2, ...)
{
  return [a1 addTagTransformations:];
}

id objc_msgSend_addTags_(void *a1, const char *a2, ...)
{
  return [a1 addTags:];
}

id objc_msgSend_addTheConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 addTheConfiguration:];
}

id objc_msgSend_addTiltTrackBlob_(void *a1, const char *a2, ...)
{
  return [a1 addTiltTrackBlob:];
}

id objc_msgSend_addToken_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 addToken:bundleID:];
}

id objc_msgSend_addTokens_isDetailed_error_(void *a1, const char *a2, ...)
{
  return [a1 addTokens:isDetailed:error:];
}

id objc_msgSend_addTrackingURL_(void *a1, const char *a2, ...)
{
  return [a1 addTrackingURL:];
}

id objc_msgSend_addURLsToEvict_(void *a1, const char *a2, ...)
{
  return [a1 addURLsToEvict:];
}

id objc_msgSend_addUserKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 addUserKeyboard:];
}

id objc_msgSend_addVersionedAttributionDetails_(void *a1, const char *a2, ...)
{
  return [a1 addVersionedAttributionDetails:];
}

id objc_msgSend_addVideoAsset_(void *a1, const char *a2, ...)
{
  return [a1 addVideoAsset:];
}

id objc_msgSend_addedToDirectoryDateForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addedToDirectoryDateForFileAtPath:error:");
}

id objc_msgSend_additionalRequestDescription(void *a1, const char *a2, ...)
{
  return _[a1 additionalRequestDescription];
}

id objc_msgSend_additives_(void *a1, const char *a2, ...)
{
  return [a1 additives:];
}

id objc_msgSend_adjacency(void *a1, const char *a2, ...)
{
  return _[a1 adjacency];
}

id objc_msgSend_adjacent(void *a1, const char *a2, ...)
{
  return _[a1 adjacent];
}

id objc_msgSend_adminArea(void *a1, const char *a2, ...)
{
  return _[a1 adminArea];
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return _[a1 administrativeArea];
}

id objc_msgSend_adprivacydBag(void *a1, const char *a2, ...)
{
  return _[a1 adprivacydBag];
}

id objc_msgSend_ads(void *a1, const char *a2, ...)
{
  return _[a1 ads];
}

id objc_msgSend_adsCount(void *a1, const char *a2, ...)
{
  return _[a1 adsCount];
}

id objc_msgSend_adsToEvictAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 adsToEvictAtIndex:];
}

id objc_msgSend_adsToEvictsCount(void *a1, const char *a2, ...)
{
  return _[a1 adsToEvictsCount];
}

id objc_msgSend_ageGenderData(void *a1, const char *a2, ...)
{
  return _[a1 ageGenderData];
}

id objc_msgSend_ageUnknown(void *a1, const char *a2, ...)
{
  return _[a1 ageUnknown];
}

id objc_msgSend_alias(void *a1, const char *a2, ...)
{
  return _[a1 alias];
}

id objc_msgSend_aliasTransformedPolicies_alias_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "aliasTransformedPolicies:alias:");
}

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return _[a1 allEvents];
}

id objc_msgSend_allEventsForHandle_(void *a1, const char *a2, ...)
{
  return [a1 allEventsForHandle:];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 allIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return [a1 allKeysForObject:];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPlacementTypesForContentData_(void *a1, const char *a2, ...)
{
  return [a1 allPlacementTypesForContentData:];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allocatedSize(void *a1, const char *a2, ...)
{
  return _[a1 allocatedSize];
}

id objc_msgSend_allowEmptyParameters(void *a1, const char *a2, ...)
{
  return _[a1 allowEmptyParameters];
}

id objc_msgSend_allowList(void *a1, const char *a2, ...)
{
  return _[a1 allowList];
}

id objc_msgSend_allowedExternalDomainsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 allowedExternalDomainsAtIndex:];
}

id objc_msgSend_allowedExternalDomainsCount(void *a1, const char *a2, ...)
{
  return _[a1 allowedExternalDomainsCount];
}

id objc_msgSend_allowedPurposes(void *a1, const char *a2, ...)
{
  return _[a1 allowedPurposes];
}

id objc_msgSend_allowedSources(void *a1, const char *a2, ...)
{
  return _[a1 allowedSources];
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return _[a1 analytics];
}

id objc_msgSend_ancientItemBlock(void *a1, const char *a2, ...)
{
  return _[a1 ancientItemBlock];
}

id objc_msgSend_anonymousDemandID(void *a1, const char *a2, ...)
{
  return _[a1 anonymousDemandID];
}

id objc_msgSend_anonymousDemandId(void *a1, const char *a2, ...)
{
  return _[a1 anonymousDemandId];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_apDefaultSharedFormatter(void *a1, const char *a2, ...)
{
  return _[a1 apDefaultSharedFormatter];
}

id objc_msgSend_apLocalSharedFormatter(void *a1, const char *a2, ...)
{
  return _[a1 apLocalSharedFormatter];
}

id objc_msgSend_apUTCSharedFormatter(void *a1, const char *a2, ...)
{
  return _[a1 apUTCSharedFormatter];
}

id objc_msgSend_appAdTrackingStatus(void *a1, const char *a2, ...)
{
  return _[a1 appAdTrackingStatus];
}

id objc_msgSend_appMetadataFields(void *a1, const char *a2, ...)
{
  return _[a1 appMetadataFields];
}

id objc_msgSend_appTrackingStatus_(void *a1, const char *a2, ...)
{
  return [a1 appTrackingStatus:];
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _[a1 appVersion];
}

id objc_msgSend_appearedOnScreenWithStatus_(void *a1, const char *a2, ...)
{
  return [a1 appearedOnScreenWithStatus:];
}

id objc_msgSend_appendBytes_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:x0 length:x1];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayByAddingObject_forIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "arrayByAddingObject:forIdentifier:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayByRemovingObjectForIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "arrayByRemovingObjectForIdentifier:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return [a1 arrayForKey:];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithCountedSet_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCountedSet:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _[a1 artist];
}

id objc_msgSend_asHexString(void *a1, const char *a2, ...)
{
  return _[a1 asHexString];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _[a1 asset];
}

id objc_msgSend_assetInfoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 assetInfoAtIndex:];
}

id objc_msgSend_assetInfos(void *a1, const char *a2, ...)
{
  return _[a1 assetInfos];
}

id objc_msgSend_assetInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 assetInfosCount];
}

id objc_msgSend_assignPersistentCacheStore_(void *a1, const char *a2, ...)
{
  return [a1 assignPersistentCacheStore:];
}

id objc_msgSend_associatedObjectFileNameForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 associatedObjectFileNameForIdentifier:];
}

id objc_msgSend_associatedObjects(void *a1, const char *a2, ...)
{
  return _[a1 associatedObjects];
}

id objc_msgSend_attemptId(void *a1, const char *a2, ...)
{
  return _[a1 attemptId];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_attributionDownloadType(void *a1, const char *a2, ...)
{
  return _[a1 attributionDownloadType];
}

id objc_msgSend_attributionKey(void *a1, const char *a2, ...)
{
  return _[a1 attributionKey];
}

id objc_msgSend_attributionMetadataExistsOnDevice(void *a1, const char *a2, ...)
{
  return _[a1 attributionMetadataExistsOnDevice];
}

id objc_msgSend_attributionSignature(void *a1, const char *a2, ...)
{
  return _[a1 attributionSignature];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_autoloop(void *a1, const char *a2, ...)
{
  return _[a1 autoloop];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backoffFromResponse_(void *a1, const char *a2, ...)
{
  return [a1 backoffFromResponse:];
}

id objc_msgSend_backoffIndex(void *a1, const char *a2, ...)
{
  return _[a1 backoffIndex];
}

id objc_msgSend_backoffLevels(void *a1, const char *a2, ...)
{
  return _[a1 backoffLevels];
}

id objc_msgSend_backoffTimer(void *a1, const char *a2, ...)
{
  return _[a1 backoffTimer];
}

id objc_msgSend_backoffTimerForDestination_(void *a1, const char *a2, ...)
{
  return [a1 backoffTimerForDestination:];
}

id objc_msgSend_backoffTimers(void *a1, const char *a2, ...)
{
  return _[a1 backoffTimers];
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bagForProfile:profileVersion:")];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfileVersion];
}

id objc_msgSend_bannerImpressionThreshold(void *a1, const char *a2, ...)
{
  return _[a1 bannerImpressionThreshold];
}

id objc_msgSend_bars(void *a1, const char *a2, ...)
{
  return _[a1 bars];
}

id objc_msgSend_base64Decode_(void *a1, const char *a2, ...)
{
  return [a1 base64Decode:];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_base64FilenameSafeEncoded(void *a1, const char *a2, ...)
{
  return _[a1 base64FilenameSafeEncoded];
}

id objc_msgSend_baseHandleInterfaceOnScreen_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "baseHandleInterfaceOnScreen:internalContent:context:idAccount:");
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return _[a1 baseURL];
}

id objc_msgSend_batchClass(void *a1, const char *a2, ...)
{
  return _[a1 batchClass];
}

id objc_msgSend_batchClosedWithBatchLifetime_eventsCount_(void *a1, const char *a2, ...)
{
  return [a1 batchClosedWithBatchLifetime:x0 eventsCount:x1];
}

id objc_msgSend_batchDeliveredClosure(void *a1, const char *a2, ...)
{
  return _[a1 batchDeliveredClosure];
}

id objc_msgSend_batchDequeuedWithWaitingTime_queueLength_batchID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "batchDequeuedWithWaitingTime:queueLength:batchID:");
}

id objc_msgSend_batchEnqueuedWithQueueLength_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "batchEnqueuedWithQueueLength:");
}

id objc_msgSend_batchExpiredWithBatchID_(void *a1, const char *a2, ...)
{
  return [a1 batchExpiredWithBatchID:];
}

id objc_msgSend_batchId(void *a1, const char *a2, ...)
{
  return _[a1 batchId];
}

id objc_msgSend_batchInfos(void *a1, const char *a2, ...)
{
  return _[a1 batchInfos];
}

id objc_msgSend_batchPathToPurpose_(void *a1, const char *a2, ...)
{
  return [a1 batchPathToPurpose:];
}

id objc_msgSend_batchResponseFromBase64EncodedString_(void *a1, const char *a2, ...)
{
  return [a1 batchResponseFromBase64EncodedString:];
}

id objc_msgSend_batchResponseID(void *a1, const char *a2, ...)
{
  return _[a1 batchResponseID];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return _[a1 batchSize];
}

id objc_msgSend_batchSizeUInteger(void *a1, const char *a2, ...)
{
  return _[a1 batchSizeUInteger];
}

id objc_msgSend_batchedRequests(void *a1, const char *a2, ...)
{
  return _[a1 batchedRequests];
}

id objc_msgSend_batchesData(void *a1, const char *a2, ...)
{
  return _[a1 batchesData];
}

id objc_msgSend_beginSignpostForPlacement_log_logID_(void *a1, const char *a2, ...)
{
  return [a1 beginSignpostForPlacement:log:logID:];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _[a1 beginTransaction];
}

id objc_msgSend_billing(void *a1, const char *a2, ...)
{
  return _[a1 billing];
}

id objc_msgSend_bitrate(void *a1, const char *a2, ...)
{
  return _[a1 bitrate];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_blockAdsForSubscribers(void *a1, const char *a2, ...)
{
  return _[a1 blockAdsForSubscribers];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_bodyContext(void *a1, const char *a2, ...)
{
  return _[a1 bodyContext];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_borderStyle(void *a1, const char *a2, ...)
{
  return _[a1 borderStyle];
}

id objc_msgSend_branch(void *a1, const char *a2, ...)
{
  return _[a1 branch];
}

id objc_msgSend_brandIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 brandIdentifier];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return _[a1 buffer];
}

id objc_msgSend_buildFinalPolicies_policyValue_policyType_expression_(void *a1, const char *a2, ...)
{
  return [a1 buildFinalPolicies:policyValue:policyType:expression:];
}

id objc_msgSend_buildMetricDeliveryRequestFromData_toChannel_billing_signingAuthority_failIfSignatureIsNotAvailable_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildMetricDeliveryRequestFromData:toChannel:billing:signingAuthority:failIfSignatureIsNotAvailable:error:");
}

id objc_msgSend_buildSignatureUsingSigningAuthority_error_(void *a1, const char *a2, ...)
{
  return [a1 buildSignatureUsingSigningAuthority:error:];
}

id objc_msgSend_buildURLForRequestProtobuf_(void *a1, const char *a2, ...)
{
  return [a1 buildURLForRequestProtobuf:];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleContainerURL];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 bundleIDs];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleIdentifierAllowList(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifierAllowList];
}

id objc_msgSend_bundles(void *a1, const char *a2, ...)
{
  return _[a1 bundles];
}

id objc_msgSend_buttonStyle(void *a1, const char *a2, ...)
{
  return _[a1 buttonStyle];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheKey(void *a1, const char *a2, ...)
{
  return _[a1 cacheKey];
}

id objc_msgSend_cacheKeyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cacheKeyForIdentifier:];
}

id objc_msgSend_cacheObjectTTL(void *a1, const char *a2, ...)
{
  return _[a1 cacheObjectTTL];
}

id objc_msgSend_cacheSizeLimit(void *a1, const char *a2, ...)
{
  return _[a1 cacheSizeLimit];
}

id objc_msgSend_cacheSizeLimitDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 cacheSizeLimitDefaultValue];
}

id objc_msgSend_cacheSizeLimitValue(void *a1, const char *a2, ...)
{
  return _[a1 cacheSizeLimitValue];
}

id objc_msgSend_cacheSizeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 cacheSizeWithCompletionHandler:];
}

id objc_msgSend_cacheStore(void *a1, const char *a2, ...)
{
  return _[a1 cacheStore];
}

id objc_msgSend_cachedAdsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 cachedAdsAtIndex:];
}

id objc_msgSend_cachedAdsCount(void *a1, const char *a2, ...)
{
  return _[a1 cachedAdsCount];
}

id objc_msgSend_cachedCertificate(void *a1, const char *a2, ...)
{
  return _[a1 cachedCertificate];
}

id objc_msgSend_cachedElementForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cachedElementForBundleIdentifier:];
}

id objc_msgSend_calculateDuration(void *a1, const char *a2, ...)
{
  return _[a1 calculateDuration];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 calendarWithIdentifier:];
}

id objc_msgSend_campaignId(void *a1, const char *a2, ...)
{
  return _[a1 campaignId];
}

id objc_msgSend_campaignNamespace(void *a1, const char *a2, ...)
{
  return _[a1 campaignNamespace];
}

id objc_msgSend_campaignNamespaceForPlacement_(void *a1, const char *a2, ...)
{
  return [a1 campaignNamespaceForPlacement:];
}

id objc_msgSend_canBeGarbageCollected(void *a1, const char *a2, ...)
{
  return _[a1 canBeGarbageCollected];
}

id objc_msgSend_canReturnToken_(void *a1, const char *a2, ...)
{
  return [a1 canReturnToken:];
}

id objc_msgSend_canSend50PercentImpression_(void *a1, const char *a2, ...)
{
  return [a1 canSend50PercentImpression:];
}

id objc_msgSend_canSendImpression_(void *a1, const char *a2, ...)
{
  return [a1 canSendImpression:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancel_(void *a1, const char *a2, ...)
{
  return [a1 cancel:];
}

id objc_msgSend_cancelActiveWork_(void *a1, const char *a2, ...)
{
  return [a1 cancelActiveWork:];
}

id objc_msgSend_cancelConfigurationUpdate(void *a1, const char *a2, ...)
{
  return _[a1 cancelConfigurationUpdate];
}

id objc_msgSend_cancelDelayedRequest(void *a1, const char *a2, ...)
{
  return _[a1 cancelDelayedRequest];
}

id objc_msgSend_cancelRequest(void *a1, const char *a2, ...)
{
  return _[a1 cancelRequest];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return _[a1 cancelled];
}

id objc_msgSend_capDataFromKeyChain_adamID_(void *a1, const char *a2, ...)
{
  return [a1 capDataFromKeyChain:adamID];
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return _[a1 caption];
}

id objc_msgSend_carousel50PercentVisibleTime(void *a1, const char *a2, ...)
{
  return _[a1 carousel50PercentVisibleTime];
}

id objc_msgSend_carouselElementClicked_element_(void *a1, const char *a2, ...)
{
  return [a1 carouselElementClicked:element];
}

id objc_msgSend_carouselElementsPartiallyVisible(void *a1, const char *a2, ...)
{
  return _[a1 carouselElementsPartiallyVisible];
}

id objc_msgSend_carouselElementsVisible(void *a1, const char *a2, ...)
{
  return _[a1 carouselElementsVisible];
}

id objc_msgSend_carouselFinishedSent(void *a1, const char *a2, ...)
{
  return _[a1 carouselFinishedSent];
}

id objc_msgSend_carouselVisibleStateChanged_duration_elements_partialElements_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "carouselVisibleStateChanged:duration:elements:partialElements:");
}

id objc_msgSend_carouselVisibleTime(void *a1, const char *a2, ...)
{
  return _[a1 carouselVisibleTime];
}

id objc_msgSend_cartesianProduct_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "cartesianProduct:");
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return _[a1 categories];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return _[a1 certificate];
}

id objc_msgSend_certificateRetrievalDidFinish_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "certificateRetrievalDidFinish:error:");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _[a1 channel];
}

id objc_msgSend_channels(void *a1, const char *a2, ...)
{
  return _[a1 channels];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return _[a1 charValue];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_checkExpiry(void *a1, const char *a2, ...)
{
  return _[a1 checkExpiry];
}

id objc_msgSend_checkForDiscards_placementType_(void *a1, const char *a2, ...)
{
  return [a1 checkForDiscards:placementType:];
}

id objc_msgSend_checkForNonWKDiscardOverrides_forAdamID_(void *a1, const char *a2, ...)
{
  return [a1 checkForNonWKDiscardOverrides:forAdamID:];
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return _[a1 checkin];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_cleanCache(void *a1, const char *a2, ...)
{
  return _[a1 cleanCache];
}

id objc_msgSend_cleanupOldStorage(void *a1, const char *a2, ...)
{
  return _[a1 cleanupOldStorage];
}

id objc_msgSend_clearAccountStates(void *a1, const char *a2, ...)
{
  return _[a1 clearAccountStates];
}

id objc_msgSend_clearAccountTypes(void *a1, const char *a2, ...)
{
  return _[a1 clearAccountTypes];
}

id objc_msgSend_clearActions(void *a1, const char *a2, ...)
{
  return _[a1 clearActions];
}

id objc_msgSend_clearAdLayoutDatas(void *a1, const char *a2, ...)
{
  return _[a1 clearAdLayoutDatas];
}

id objc_msgSend_clearAdUpdates(void *a1, const char *a2, ...)
{
  return _[a1 clearAdUpdates];
}

id objc_msgSend_clearAds(void *a1, const char *a2, ...)
{
  return _[a1 clearAds];
}

id objc_msgSend_clearAdsToEvicts(void *a1, const char *a2, ...)
{
  return _[a1 clearAdsToEvicts];
}

id objc_msgSend_clearAllowedExternalDomains(void *a1, const char *a2, ...)
{
  return _[a1 clearAllowedExternalDomains];
}

id objc_msgSend_clearAssetInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearAssetInfos];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return _[a1 clearCache];
}

id objc_msgSend_clearCachedAds(void *a1, const char *a2, ...)
{
  return _[a1 clearCachedAds];
}

id objc_msgSend_clearColors(void *a1, const char *a2, ...)
{
  return _[a1 clearColors];
}

id objc_msgSend_clearConfirmedClickPixelURLs(void *a1, const char *a2, ...)
{
  return _[a1 clearConfirmedClickPixelURLs];
}

id objc_msgSend_clearCreativeSizes(void *a1, const char *a2, ...)
{
  return _[a1 clearCreativeSizes];
}

id objc_msgSend_clearCriteriaValues(void *a1, const char *a2, ...)
{
  return _[a1 clearCriteriaValues];
}

id objc_msgSend_clearCurrentConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 clearCurrentConfigurations];
}

id objc_msgSend_clearDarkModeColors(void *a1, const char *a2, ...)
{
  return _[a1 clearDarkModeColors];
}

id objc_msgSend_clearDeviceModes(void *a1, const char *a2, ...)
{
  return _[a1 clearDeviceModes];
}

id objc_msgSend_clearDistributionMetrics(void *a1, const char *a2, ...)
{
  return _[a1 clearDistributionMetrics];
}

id objc_msgSend_clearElements(void *a1, const char *a2, ...)
{
  return _[a1 clearElements];
}

id objc_msgSend_clearEvents(void *a1, const char *a2, ...)
{
  return _[a1 clearEvents];
}

id objc_msgSend_clearExcludeTags(void *a1, const char *a2, ...)
{
  return _[a1 clearExcludeTags];
}

id objc_msgSend_clearExclusionCriterias(void *a1, const char *a2, ...)
{
  return _[a1 clearExclusionCriterias];
}

id objc_msgSend_clearFailingURLs(void *a1, const char *a2, ...)
{
  return _[a1 clearFailingURLs];
}

id objc_msgSend_clearFunctionNames(void *a1, const char *a2, ...)
{
  return _[a1 clearFunctionNames];
}

id objc_msgSend_clearGeofences(void *a1, const char *a2, ...)
{
  return _[a1 clearGeofences];
}

id objc_msgSend_clearITunesMetadatas(void *a1, const char *a2, ...)
{
  return _[a1 clearITunesMetadatas];
}

id objc_msgSend_clearInclusionCriterias(void *a1, const char *a2, ...)
{
  return _[a1 clearInclusionCriterias];
}

id objc_msgSend_clearInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearInfos];
}

id objc_msgSend_clearJourneyStartRelayValues(void *a1, const char *a2, ...)
{
  return _[a1 clearJourneyStartRelayValues];
}

id objc_msgSend_clearLines(void *a1, const char *a2, ...)
{
  return _[a1 clearLines];
}

id objc_msgSend_clearLocalizedHeadlines(void *a1, const char *a2, ...)
{
  return _[a1 clearLocalizedHeadlines];
}

id objc_msgSend_clearMatchTagClauses(void *a1, const char *a2, ...)
{
  return _[a1 clearMatchTagClauses];
}

id objc_msgSend_clearMediaAssets(void *a1, const char *a2, ...)
{
  return _[a1 clearMediaAssets];
}

id objc_msgSend_clearMetrics(void *a1, const char *a2, ...)
{
  return _[a1 clearMetrics];
}

id objc_msgSend_clearNativeMetadatas(void *a1, const char *a2, ...)
{
  return _[a1 clearNativeMetadatas];
}

id objc_msgSend_clearOffsets(void *a1, const char *a2, ...)
{
  return _[a1 clearOffsets];
}

id objc_msgSend_clearOneofValuesForValue(void *a1, const char *a2, ...)
{
  return _[a1 clearOneofValuesForValue];
}

id objc_msgSend_clearParameterLists(void *a1, const char *a2, ...)
{
  return _[a1 clearParameterLists];
}

id objc_msgSend_clearParameters(void *a1, const char *a2, ...)
{
  return _[a1 clearParameters];
}

id objc_msgSend_clearPaymentCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 clearPaymentCapabilities];
}

id objc_msgSend_clearPolicyValues(void *a1, const char *a2, ...)
{
  return _[a1 clearPolicyValues];
}

id objc_msgSend_clearRequesters(void *a1, const char *a2, ...)
{
  return _[a1 clearRequesters];
}

id objc_msgSend_clearRequiredTags(void *a1, const char *a2, ...)
{
  return _[a1 clearRequiredTags];
}

id objc_msgSend_clearResourceCacheEntries(void *a1, const char *a2, ...)
{
  return _[a1 clearResourceCacheEntries];
}

id objc_msgSend_clearResultTags(void *a1, const char *a2, ...)
{
  return _[a1 clearResultTags];
}

id objc_msgSend_clearRewardTokens(void *a1, const char *a2, ...)
{
  return _[a1 clearRewardTokens];
}

id objc_msgSend_clearScalarMetrics(void *a1, const char *a2, ...)
{
  return _[a1 clearScalarMetrics];
}

id objc_msgSend_clearScreenSaverImageURLs(void *a1, const char *a2, ...)
{
  return _[a1 clearScreenSaverImageURLs];
}

id objc_msgSend_clearSegmentIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 clearSegmentIdentifiers];
}

id objc_msgSend_clearStatusCondition_(void *a1, const char *a2, ...)
{
  return [a1 clearStatusCondition:];
}

id objc_msgSend_clearStoryboardSizes(void *a1, const char *a2, ...)
{
  return _[a1 clearStoryboardSizes];
}

id objc_msgSend_clearSupportedPaymentNetworks(void *a1, const char *a2, ...)
{
  return _[a1 clearSupportedPaymentNetworks];
}

id objc_msgSend_clearTagTransformations(void *a1, const char *a2, ...)
{
  return _[a1 clearTagTransformations];
}

id objc_msgSend_clearTags(void *a1, const char *a2, ...)
{
  return _[a1 clearTags];
}

id objc_msgSend_clearTheConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 clearTheConfigurations];
}

id objc_msgSend_clearTiltTrackBlobs(void *a1, const char *a2, ...)
{
  return _[a1 clearTiltTrackBlobs];
}

id objc_msgSend_clearTrackingURLs(void *a1, const char *a2, ...)
{
  return _[a1 clearTrackingURLs];
}

id objc_msgSend_clearURLsToEvicts(void *a1, const char *a2, ...)
{
  return _[a1 clearURLsToEvicts];
}

id objc_msgSend_clearUserKeyboards(void *a1, const char *a2, ...)
{
  return _[a1 clearUserKeyboards];
}

id objc_msgSend_clearVersionedAttributionDetails(void *a1, const char *a2, ...)
{
  return _[a1 clearVersionedAttributionDetails];
}

id objc_msgSend_clearVideoAssets(void *a1, const char *a2, ...)
{
  return _[a1 clearVideoAssets];
}

id objc_msgSend_clickCount(void *a1, const char *a2, ...)
{
  return _[a1 clickCount];
}

id objc_msgSend_clickLocation(void *a1, const char *a2, ...)
{
  return _[a1 clickLocation];
}

id objc_msgSend_clickTime(void *a1, const char *a2, ...)
{
  return _[a1 clickTime];
}

id objc_msgSend_clicked_(void *a1, const char *a2, ...)
{
  return [a1 clicked:];
}

id objc_msgSend_clickedCarouselElement(void *a1, const char *a2, ...)
{
  return _[a1 clickedCarouselElement];
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return _[a1 clientConnection];
}

id objc_msgSend_clientId(void *a1, const char *a2, ...)
{
  return _[a1 clientId];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return _[a1 clock];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeActiveBatches(void *a1, const char *a2, ...)
{
  return _[a1 closeActiveBatches];
}

id objc_msgSend_closeBatchesForChannels_(void *a1, const char *a2, ...)
{
  return [a1 closeBatchesForChannels:];
}

id objc_msgSend_closeShelvedBatchesForChannel_groupBatches_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "closeShelvedBatchesForChannel:groupBatches:");
}

id objc_msgSend_closedStoragePathPrefix(void *a1, const char *a2, ...)
{
  return _[a1 closedStoragePathPrefix];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collect(void *a1, const char *a2, ...)
{
  return _[a1 collect];
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return _[a1 collection];
}

id objc_msgSend_collectionProvider(void *a1, const char *a2, ...)
{
  return _[a1 collectionProvider];
}

id objc_msgSend_collectionProviderLock(void *a1, const char *a2, ...)
{
  return _[a1 collectionProviderLock];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return _[a1 collectionType];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colors(void *a1, const char *a2, ...)
{
  return _[a1 colors];
}

id objc_msgSend_colorsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 colorsAtIndex:];
}

id objc_msgSend_colorsCount(void *a1, const char *a2, ...)
{
  return _[a1 colorsCount];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return _[a1 columns];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commitTransaction(void *a1, const char *a2, ...)
{
  return _[a1 commitTransaction];
}

id objc_msgSend_compactMapObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "compactMapObjectsUsingBlock:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_completeServerRequestId_result_(void *a1, const char *a2, ...)
{
  return [a1 completeServerRequestId:result:];
}

id objc_msgSend_completeServerRequestId_serverFailureCount_result_(void *a1, const char *a2, ...)
{
  return [a1 completeServerRequestId:serverFailureCount:result:];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 component:fromDate:];
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:toDate:options:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithString:];
}

id objc_msgSend_conditionsService(void *a1, const char *a2, ...)
{
  return _[a1 conditionsService];
}

id objc_msgSend_configDictionary(void *a1, const char *a2, ...)
{
  return _[a1 configDictionary];
}

id objc_msgSend_configRequester(void *a1, const char *a2, ...)
{
  return _[a1 configRequester];
}

id objc_msgSend_configurationForClass_(void *a1, const char *a2, ...)
{
  return [a1 configurationForClass:];
}

id objc_msgSend_configurationForClass_usingCache_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "configurationForClass:usingCache:");
}

id objc_msgSend_configurationStorage(void *a1, const char *a2, ...)
{
  return _[a1 configurationStorage];
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return _[a1 configurations];
}

id objc_msgSend_confirm50PercentImpression(void *a1, const char *a2, ...)
{
  return _[a1 confirm50PercentImpression];
}

id objc_msgSend_confirmClick(void *a1, const char *a2, ...)
{
  return _[a1 confirmClick];
}

id objc_msgSend_confirmImpression(void *a1, const char *a2, ...)
{
  return _[a1 confirmImpression];
}

id objc_msgSend_confirmedClickInterval(void *a1, const char *a2, ...)
{
  return _[a1 confirmedClickInterval];
}

id objc_msgSend_confirmedClickLock(void *a1, const char *a2, ...)
{
  return _[a1 confirmedClickLock];
}

id objc_msgSend_confirmedClickPixelURLsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 confirmedClickPixelURLsAtIndex:];
}

id objc_msgSend_confirmedClickPixelURLsCount(void *a1, const char *a2, ...)
{
  return _[a1 confirmedClickPixelURLsCount];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return _[a1 connectionType];
}

id objc_msgSend_connectionTypeToAPPBAdConnection_(void *a1, const char *a2, ...)
{
  return [a1 connectionTypeToAPPBAdConnection:];
}

id objc_msgSend_connectionTypeToString_(void *a1, const char *a2, ...)
{
  return [a1 connectionTypeToString:];
}

id objc_msgSend_consumed50PercentImpressions(void *a1, const char *a2, ...)
{
  return _[a1 consumed50PercentImpressions];
}

id objc_msgSend_consumedImpressions(void *a1, const char *a2, ...)
{
  return _[a1 consumedImpressions];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return _[a1 containerType];
}

id objc_msgSend_containsDate_(void *a1, const char *a2, ...)
{
  return [a1 containsDate:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentData(void *a1, const char *a2, ...)
{
  return _[a1 contentData];
}

id objc_msgSend_contentDataItemIds(void *a1, const char *a2, ...)
{
  return _[a1 contentDataItemIds];
}

id objc_msgSend_contentDataItems(void *a1, const char *a2, ...)
{
  return _[a1 contentDataItems];
}

id objc_msgSend_contentDataObjects(void *a1, const char *a2, ...)
{
  return _[a1 contentDataObjects];
}

id objc_msgSend_contentDataPrivate(void *a1, const char *a2, ...)
{
  return _[a1 contentDataPrivate];
}

id objc_msgSend_contentDataPrivateWrapper(void *a1, const char *a2, ...)
{
  return _[a1 contentDataPrivateWrapper];
}

id objc_msgSend_contentDataTransient(void *a1, const char *a2, ...)
{
  return _[a1 contentDataTransient];
}

id objc_msgSend_contentDataTransientWrapper(void *a1, const char *a2, ...)
{
  return _[a1 contentDataTransientWrapper];
}

id objc_msgSend_contentDataWithError_identifier_journeyStartRelayValues_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "contentDataWithError:identifier:journeyStartRelayValues:");
}

id objc_msgSend_contentDataWrapper(void *a1, const char *a2, ...)
{
  return _[a1 contentDataWrapper];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return _[a1 contentID];
}

id objc_msgSend_contentId(void *a1, const char *a2, ...)
{
  return _[a1 contentId];
}

id objc_msgSend_contentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contentIdentifier];
}

id objc_msgSend_contentResponses_requester_(void *a1, const char *a2, ...)
{
  return [a1 contentResponses:requester];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:error:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextFingerprint(void *a1, const char *a2, ...)
{
  return _[a1 contextFingerprint];
}

id objc_msgSend_contextIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contextIdentifier];
}

id objc_msgSend_contextJSONForRequest_andPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 contextJSONForRequest:andPlacementType:];
}

id objc_msgSend_contextWrapper(void *a1, const char *a2, ...)
{
  return _[a1 contextWrapper];
}

id objc_msgSend_conversionDate(void *a1, const char *a2, ...)
{
  return _[a1 conversionDate];
}

id objc_msgSend_coordinators(void *a1, const char *a2, ...)
{
  return _[a1 coordinators];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyContentDataId_toNewContentDataId_(void *a1, const char *a2, ...)
{
  return [a1 copyContentDataId:x0 toNewContentDataId:x1];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createChildrenFromExpression_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return [a1 createChildrenFromExpression:subExpressions:data:error:];
}

id objc_msgSend_createContentDataForContextId_contentId_withServerUnfilledReason_(void *a1, const char *a2, ...)
{
  return [a1 createContentDataForContextId:x0 contentId:x1 withServerUnfilledReason:x2];
}

id objc_msgSend_createContentDatasFromContext_unfilledReasonCode_types_diagnosticCode_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 createContentDatasFromContext:x0 unfilledReasonCode:x1 types:x2 diagnosticCode:x3 completionHandler:x4];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:x0 withIntermediateDirectories:x1 attributes:x2 error:x3];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createEventViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createEventViewIfNeeded];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:x0 contents:x1 attributes:x2];
}

id objc_msgSend_createForServerUnfilledReason_placementType_contextIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 createForServerUnfilledReason:placementType:contextIdentifier:];
}

id objc_msgSend_createForServerUnfilledReason_placementType_contextIdentifier_size_(void *a1, const char *a2, ...)
{
  return [a1 createForServerUnfilledReason:placementType:contextIdentifier:size:];
}

id objc_msgSend_createItemWithRequest_requestTimestamp_interval_jsonBody_startDate_deliveryStartDate_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:");
}

id objc_msgSend_createManagedContextWithContext_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createManagedContextWithContext:idAccount:");
}

id objc_msgSend_createServiceWithAMSProvider_(void *a1, const char *a2, ...)
{
  return [a1 createServiceWithAMSProvider:];
}

id objc_msgSend_createSharedNetworkClientWithConfig_(void *a1, const char *a2, ...)
{
  return [a1 createSharedNetworkClientWithConfig:];
}

id objc_msgSend_createTableLock(void *a1, const char *a2, ...)
{
  return _[a1 createTableLock];
}

id objc_msgSend_createTransaction(void *a1, const char *a2, ...)
{
  return _[a1 createTransaction];
}

id objc_msgSend_createViewLock(void *a1, const char *a2, ...)
{
  return _[a1 createViewLock];
}

id objc_msgSend_createWithTimerXPCActivity_database_(void *a1, const char *a2, ...)
{
  return [a1 createWithTimerXPCActivity:database:];
}

id objc_msgSend_createWithTotalCostLimit_(void *a1, const char *a2, ...)
{
  return [a1 createWithTotalCostLimit:];
}

id objc_msgSend_createdDateForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 createdDateForFileAtPath:x0 error:x1];
}

id objc_msgSend_creativeSizes(void *a1, const char *a2, ...)
{
  return _[a1 creativeSizes];
}

id objc_msgSend_creativeSizesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 creativeSizesAtIndex:];
}

id objc_msgSend_creativeSizesCount(void *a1, const char *a2, ...)
{
  return _[a1 creativeSizesCount];
}

id objc_msgSend_creativeTypeToPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 creativeTypeToPlacementType:];
}

id objc_msgSend_criteriaIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 criteriaIdentifier];
}

id objc_msgSend_criteriaValues(void *a1, const char *a2, ...)
{
  return _[a1 criteriaValues];
}

id objc_msgSend_criteriaValuesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 criteriaValuesAtIndex:];
}

id objc_msgSend_criteriaValuesCount(void *a1, const char *a2, ...)
{
  return _[a1 criteriaValuesCount];
}

id objc_msgSend_crossAppTrackingAllowedSwitchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 crossAppTrackingAllowedSwitchEnabled];
}

id objc_msgSend_ctClient(void *a1, const char *a2, ...)
{
  return _[a1 ctClient];
}

id objc_msgSend_ctSubscriptionContext(void *a1, const char *a2, ...)
{
  return _[a1 ctSubscriptionContext];
}

id objc_msgSend_ctaButton(void *a1, const char *a2, ...)
{
  return _[a1 ctaButton];
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return _[a1 current];
}

id objc_msgSend_currentBatches(void *a1, const char *a2, ...)
{
  return _[a1 currentBatches];
}

id objc_msgSend_currentConfigurationAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 currentConfigurationAtIndex:];
}

id objc_msgSend_currentConfigurationsCount(void *a1, const char *a2, ...)
{
  return _[a1 currentConfigurationsCount];
}

id objc_msgSend_currentContentDataItemIdIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentContentDataItemIdIndex];
}

id objc_msgSend_currentDateMinusDays_(void *a1, const char *a2, ...)
{
  return [a1 currentDateMinusDays:];
}

id objc_msgSend_currentEncryptedIDs(void *a1, const char *a2, ...)
{
  return _[a1 currentEncryptedIDs];
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentIndex];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentSigningAuthority(void *a1, const char *a2, ...)
{
  return _[a1 currentSigningAuthority];
}

id objc_msgSend_currentStatus(void *a1, const char *a2, ...)
{
  return _[a1 currentStatus];
}

id objc_msgSend_currentTimer(void *a1, const char *a2, ...)
{
  return _[a1 currentTimer];
}

id objc_msgSend_daemonBundleId(void *a1, const char *a2, ...)
{
  return _[a1 daemonBundleId];
}

id objc_msgSend_daemonStartTime(void *a1, const char *a2, ...)
{
  return _[a1 daemonStartTime];
}

id objc_msgSend_darkModeColors(void *a1, const char *a2, ...)
{
  return _[a1 darkModeColors];
}

id objc_msgSend_darkModeColorsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 darkModeColorsAtIndex:];
}

id objc_msgSend_darkModeColorsCount(void *a1, const char *a2, ...)
{
  return _[a1 darkModeColorsCount];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataAdapters(void *a1, const char *a2, ...)
{
  return _[a1 dataAdapters];
}

id objc_msgSend_dataFetchedFromServer(void *a1, const char *a2, ...)
{
  return _[a1 dataFetchedFromServer];
}

id objc_msgSend_dataIndicatorToConnectionType_(void *a1, const char *a2, ...)
{
  return [a1 dataIndicatorToConnectionType:];
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskPromiseWithRequest:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_databaseFilePath(void *a1, const char *a2, ...)
{
  return _[a1 databaseFilePath];
}

id objc_msgSend_databaseManager(void *a1, const char *a2, ...)
{
  return _[a1 databaseManager];
}

id objc_msgSend_datasource(void *a1, const char *a2, ...)
{
  return _[a1 datasource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingComponents:toDate:options:];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return [a1 dateFromString:];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSince1970:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_dbManager(void *a1, const char *a2, ...)
{
  return _[a1 dbManager];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decimalNumberByRoundingAccordingToBehavior_(void *a1, const char *a2, ...)
{
  return [a1 decimalNumberByRoundingAccordingToBehavior:];
}

id objc_msgSend_decimalNumberHandlerWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:");
}

id objc_msgSend_decimalNumberWithDecimal_(void *a1, const char *a2, ...)
{
  return [a1 decimalNumberWithDecimal:];
}

id objc_msgSend_decimalValue(void *a1, const char *a2, ...)
{
  return _[a1 decimalValue];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeDoubleForKey:];
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeInt32ForKey:];
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntForKey:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decodeTopLevelObjectOfClasses_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 decodeTopLevelObjectOfClasses:forKey:error:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultTracker(void *a1, const char *a2, ...)
{
  return _[a1 defaultTracker];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return _[a1 defaults];
}

id objc_msgSend_delayedRequestLock(void *a1, const char *a2, ...)
{
  return _[a1 delayedRequestLock];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delete(void *a1, const char *a2, ...)
{
  return _[a1 delete];
}

id objc_msgSend_deleteAdInstancesWithNoEvents(void *a1, const char *a2, ...)
{
  return _[a1 deleteAdInstancesWithNoEvents];
}

id objc_msgSend_deleteCountsOlderThan_(void *a1, const char *a2, ...)
{
  return [a1 deleteCountsOlderThan:];
}

id objc_msgSend_deleteEventsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 deleteEventsPassingTest:];
}

id objc_msgSend_deleteReportsOlderThan_(void *a1, const char *a2, ...)
{
  return [a1 deleteReportsOlderThan:];
}

id objc_msgSend_deliverEntireBatch(void *a1, const char *a2, ...)
{
  return _[a1 deliverEntireBatch];
}

id objc_msgSend_deliveredReport(void *a1, const char *a2, ...)
{
  return _[a1 deliveredReport];
}

id objc_msgSend_deliveryBlock(void *a1, const char *a2, ...)
{
  return _[a1 deliveryBlock];
}

id objc_msgSend_deliveryLeeway(void *a1, const char *a2, ...)
{
  return _[a1 deliveryLeeway];
}

id objc_msgSend_deliveryReportWithType_dayOfYear_(void *a1, const char *a2, ...)
{
  return [a1 deliveryReportWithType:dayOfYear:];
}

id objc_msgSend_deliveryReportsWithType_(void *a1, const char *a2, ...)
{
  return [a1 deliveryReportsWithType:];
}

id objc_msgSend_deliveryStartDate(void *a1, const char *a2, ...)
{
  return _[a1 deliveryStartDate];
}

id objc_msgSend_dequeue(void *a1, const char *a2, ...)
{
  return _[a1 dequeue];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deserializeFromData_ignoreKeys_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deserializeFromData:ignoreKeys:");
}

id objc_msgSend_deserializeProtobufferData_ofClass_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deserializeProtobufferData:ofClass:error:");
}

id objc_msgSend_desiredPosition(void *a1, const char *a2, ...)
{
  return _[a1 desiredPosition];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_destinationHash(void *a1, const char *a2, ...)
{
  return _[a1 destinationHash];
}

id objc_msgSend_destinationsStoragePath(void *a1, const char *a2, ...)
{
  return _[a1 destinationsStoragePath];
}

id objc_msgSend_developmentApp(void *a1, const char *a2, ...)
{
  return _[a1 developmentApp];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceIsAppleTV(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAppleTV];
}

id objc_msgSend_deviceIsAppleWatch(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAppleWatch];
}

id objc_msgSend_deviceIsLocked(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsLocked];
}

id objc_msgSend_deviceIsMac(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsMac];
}

id objc_msgSend_deviceIsiPad(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPad];
}

id objc_msgSend_deviceIsiPhone(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPhone];
}

id objc_msgSend_deviceIsiPod(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPod];
}

id objc_msgSend_deviceModeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 deviceModeAtIndex:];
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return _[a1 deviceModel];
}

id objc_msgSend_deviceModesCount(void *a1, const char *a2, ...)
{
  return _[a1 deviceModesCount];
}

id objc_msgSend_deviceNewsPlusSubscriberID(void *a1, const char *a2, ...)
{
  return _[a1 deviceNewsPlusSubscriberID];
}

id objc_msgSend_devicePlatform(void *a1, const char *a2, ...)
{
  return _[a1 devicePlatform];
}

id objc_msgSend_deviceTypeOverride(void *a1, const char *a2, ...)
{
  return _[a1 deviceTypeOverride];
}

id objc_msgSend_dfsWithStartPath_nodeCallback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dfsWithStartPath:nodeCallback:");
}

id objc_msgSend_diagnosticDaemonMetricHelper(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticDaemonMetricHelper];
}

id objc_msgSend_diagnosticsInterval(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticsInterval];
}

id objc_msgSend_diagnosticsIntervalValue(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticsIntervalValue];
}

id objc_msgSend_diary(void *a1, const char *a2, ...)
{
  return _[a1 diary];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForKey:];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_didAppTrackingStateChange_(void *a1, const char *a2, ...)
{
  return [a1 didAppTrackingStateChange:];
}

id objc_msgSend_didFetchFromServer(void *a1, const char *a2, ...)
{
  return _[a1 didFetchFromServer];
}

id objc_msgSend_didToroIDChange_(void *a1, const char *a2, ...)
{
  return [a1 didToroIDChange:];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _[a1 direction];
}

id objc_msgSend_directionToGradientOrientation_(void *a1, const char *a2, ...)
{
  return [a1 directionToGradientOrientation:];
}

id objc_msgSend_directoryExistsAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "directoryExistsAtPath:error:");
}

id objc_msgSend_disablePlacementParam(void *a1, const char *a2, ...)
{
  return _[a1 disablePlacementParam];
}

id objc_msgSend_disablePlacementParamValue(void *a1, const char *a2, ...)
{
  return _[a1 disablePlacementParamValue];
}

id objc_msgSend_disableTelephonyMethod(void *a1, const char *a2, ...)
{
  return _[a1 disableTelephonyMethod];
}

id objc_msgSend_disabledColor(void *a1, const char *a2, ...)
{
  return _[a1 disabledColor];
}

id objc_msgSend_discardReason(void *a1, const char *a2, ...)
{
  return _[a1 discardReason];
}

id objc_msgSend_discarded(void *a1, const char *a2, ...)
{
  return _[a1 discarded];
}

id objc_msgSend_discardedErrorWithCode_andReason_(void *a1, const char *a2, ...)
{
  return [a1 discardedErrorWithCode:andReason:];
}

id objc_msgSend_discardedForBundleID_withCode_(void *a1, const char *a2, ...)
{
  return [a1 discardedForBundleID:withCode:];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_dispatchSourceAccumulation(void *a1, const char *a2, ...)
{
  return _[a1 dispatchSourceAccumulation];
}

id objc_msgSend_dispatchSourceInactivity(void *a1, const char *a2, ...)
{
  return _[a1 dispatchSourceInactivity];
}

id objc_msgSend_displayOrder(void *a1, const char *a2, ...)
{
  return _[a1 displayOrder];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_distributionMetricsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 distributionMetricsAtIndex:];
}

id objc_msgSend_distributionMetricsCount(void *a1, const char *a2, ...)
{
  return _[a1 distributionMetricsCount];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return _[a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return _[a1 distributorInfo];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 doubleForKey:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadClickTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 downloadClickTimestamp];
}

id objc_msgSend_downloadType(void *a1, const char *a2, ...)
{
  return _[a1 downloadType];
}

id objc_msgSend_downloadedApps(void *a1, const char *a2, ...)
{
  return _[a1 downloadedApps];
}

id objc_msgSend_dropExpiredEventTables(void *a1, const char *a2, ...)
{
  return _[a1 dropExpiredEventTables];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_eCServerURL(void *a1, const char *a2, ...)
{
  return _[a1 eCServerURL];
}

id objc_msgSend_ecRouter(void *a1, const char *a2, ...)
{
  return _[a1 ecRouter];
}

id objc_msgSend_ecServerDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 ecServerDictionaryRepresentation];
}

id objc_msgSend_educationModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 educationModeEnabled];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return [a1 effectiveBoolValueForSetting:];
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return [a1 effectiveValueForSetting:];
}

id objc_msgSend_elementID(void *a1, const char *a2, ...)
{
  return _[a1 elementID];
}

id objc_msgSend_elementWithToken_andBundle_andAppTrackingStatus_andToroID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "elementWithToken:andBundle:andAppTrackingStatus:andToroID:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_elementsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 elementsAtIndex:];
}

id objc_msgSend_elementsCount(void *a1, const char *a2, ...)
{
  return _[a1 elementsCount];
}

id objc_msgSend_enableDiagnosticsWithInterval_(void *a1, const char *a2, ...)
{
  return [a1 enableDiagnosticsWithInterval:];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:forKey:];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeDouble:x0 forKey:x1];
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt32:x0 forKey:x1];
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encryptedIDsForIDAccountPrivate_(void *a1, const char *a2, ...)
{
  return [a1 encryptedIDsForIDAccountPrivate:];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endSignpostForPlacement_log_logID_(void *a1, const char *a2, ...)
{
  return [a1 endSignpostForPlacement:x0 log:x1 logID:x2];
}

id objc_msgSend_enqueue_(void *a1, const char *a2, ...)
{
  return [a1 enqueue:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumeratorForFilesWithExtension_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorForFilesWithExtension:];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_environmentToBranchDic(void *a1, const char *a2, ...)
{
  return _[a1 environmentToBranchDic];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorAdSizeForContainerSize_(void *a1, const char *a2, ...)
{
  return [a1 errorAdSizeForContainerSize:];
}

id objc_msgSend_errorDetails(void *a1, const char *a2, ...)
{
  return _[a1 errorDetails];
}

id objc_msgSend_errorWithBatchParseErrors_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "errorWithBatchParseErrors:");
}

id objc_msgSend_errorWithCode_internalError_(void *a1, const char *a2, ...)
{
  return [a1 errorWithCode:internalError:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_evaluate_(void *a1, const char *a2, ...)
{
  return [a1 evaluate:];
}

id objc_msgSend_evaluate_error_(void *a1, const char *a2, ...)
{
  return [a1 evaluate:error];
}

id objc_msgSend_evaluateUsingLibrary_error_(void *a1, const char *a2, ...)
{
  return [a1 evaluateUsingLibrary:error:];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _[a1 event];
}

id objc_msgSend_eventAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 eventAtIndex:];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _[a1 eventBody];
}

id objc_msgSend_eventSavedWithCreatedToSavedTimeInterval_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "eventSavedWithCreatedToSavedTimeInterval:");
}

id objc_msgSend_eventSent(void *a1, const char *a2, ...)
{
  return _[a1 eventSent];
}

id objc_msgSend_eventStorageListener(void *a1, const char *a2, ...)
{
  return _[a1 eventStorageListener];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _[a1 eventType];
}

id objc_msgSend_eventsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 eventsAtIndex:];
}

id objc_msgSend_eventsCount(void *a1, const char *a2, ...)
{
  return _[a1 eventsCount];
}

id objc_msgSend_evictObjectFromMemoryCacheForKey_(void *a1, const char *a2, ...)
{
  return [a1 evictObjectFromMemoryCacheForKey:];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_excludeTagAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 excludeTagAtIndex:];
}

id objc_msgSend_excludeTagsCount(void *a1, const char *a2, ...)
{
  return _[a1 excludeTagsCount];
}

id objc_msgSend_exclusionCriteriaAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 exclusionCriteriaAtIndex:];
}

id objc_msgSend_exclusionCriterias(void *a1, const char *a2, ...)
{
  return _[a1 exclusionCriterias];
}

id objc_msgSend_exclusionCriteriasCount(void *a1, const char *a2, ...)
{
  return _[a1 exclusionCriteriasCount];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return _[a1 execute];
}

id objc_msgSend_executeBlock_(void *a1, const char *a2, ...)
{
  return [a1 executeBlock:];
}

id objc_msgSend_executeInsertQuery_withParameters_(void *a1, const char *a2, ...)
{
  return [a1 executeInsertQuery:withParameters:];
}

id objc_msgSend_executeQuery_withParameters_(void *a1, const char *a2, ...)
{
  return [a1 executeQuery:withParameters:];
}

id objc_msgSend_executeQueryFromString_(void *a1, const char *a2, ...)
{
  return [a1 executeQueryFromString:];
}

id objc_msgSend_executeSelectNumberQuery_withParameters_(void *a1, const char *a2, ...)
{
  return [a1 executeSelectNumberQuery:];
}

id objc_msgSend_executeSelectQuery_forTable_withParameters_(void *a1, const char *a2, ...)
{
  return [a1 executeSelectQuery:forTable:withParameters:];
}

id objc_msgSend_executeSelectQuery_forTable_withParameters_groupedByColumn_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "executeSelectQuery:forTable:withParameters:groupedByColumn:");
}

id objc_msgSend_executeSelectStringsQuery_withParameters_(void *a1, const char *a2, ...)
{
  return [a1 executeSelectStringsQuery:];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_expirationOfData(void *a1, const char *a2, ...)
{
  return _[a1 expirationOfData];
}

id objc_msgSend_expression(void *a1, const char *a2, ...)
{
  return _[a1 expression];
}

id objc_msgSend_expressionDict(void *a1, const char *a2, ...)
{
  return _[a1 expressionDict];
}

id objc_msgSend_expressionToEvaluate(void *a1, const char *a2, ...)
{
  return _[a1 expressionToEvaluate];
}

id objc_msgSend_expressions(void *a1, const char *a2, ...)
{
  return _[a1 expressions];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _[a1 extension];
}

id objc_msgSend_failedRequests(void *a1, const char *a2, ...)
{
  return _[a1 failedRequests];
}

id objc_msgSend_failingURLsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 failingURLsAtIndex:];
}

id objc_msgSend_failingURLsCount(void *a1, const char *a2, ...)
{
  return _[a1 failingURLsCount];
}

id objc_msgSend_fairPlaySAPExchange_certificateIsCached_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fairPlaySAPExchange:certificateIsCached:");
}

id objc_msgSend_fakeNetworkResponse(void *a1, const char *a2, ...)
{
  return _[a1 fakeNetworkResponse];
}

id objc_msgSend_fetchGenderAndAgeData_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchGenderAndAgeData:completionHandler:");
}

id objc_msgSend_fileExists_(void *a1, const char *a2, ...)
{
  return [a1 fileExists:];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:x0 error:x1];
}

id objc_msgSend_fileForAppendingAtKeyPath_error_(void *a1, const char *a2, ...)
{
  return [a1 fileForAppendingAtKeyPath:error:];
}

id objc_msgSend_fileForReadingAtKeyPath_error_(void *a1, const char *a2, ...)
{
  return [a1 fileForReadingAtKeyPath:error:];
}

id objc_msgSend_fileForWritingAtKeyPath_error_(void *a1, const char *a2, ...)
{
  return [a1 fileForWritingAtKeyPath:error:];
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return _[a1 fileManager];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return _[a1 fileName];
}

id objc_msgSend_fileNameForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 fileNameForIdentifier:];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileStorage(void *a1, const char *a2, ...)
{
  return _[a1 fileStorage];
}

id objc_msgSend_fileSystemToken(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemToken];
}

id objc_msgSend_fileToFilePath_error_(void *a1, const char *a2, ...)
{
  return [a1 fileToFilePath:error:];
}

id objc_msgSend_fileURLForCondition_(void *a1, const char *a2, ...)
{
  return [a1 fileURLForCondition:];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithFileSystemRepresentation:x0 isDirectory:x1 relativeToURL:x2];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPathComponents:];
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return _[a1 files];
}

id objc_msgSend_filesCount(void *a1, const char *a2, ...)
{
  return _[a1 filesCount];
}

id objc_msgSend_filesEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 filesEnumerator];
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filterUsingPredicate:];
}

id objc_msgSend_filteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 filteredArrayUsingBlock:];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return _[a1 finalize];
}

id objc_msgSend_find_(void *a1, const char *a2, ...)
{
  return [a1 find:];
}

id objc_msgSend_findBucketForCode_type_(void *a1, const char *a2, ...)
{
  return [a1 findBucketForCode:type:];
}

id objc_msgSend_findBucketForDaemonRunningTime_(void *a1, const char *a2, ...)
{
  return [a1 findBucketForDaemonRunningTime:];
}

id objc_msgSend_findById_(void *a1, const char *a2, ...)
{
  return [a1 findById:];
}

id objc_msgSend_findCacheableObjectForId_inPersistentStore_(void *a1, const char *a2, ...)
{
  return [a1 findCacheableObjectForId:inPersistentStore:];
}

id objc_msgSend_findInternalContentDataById_(void *a1, const char *a2, ...)
{
  return [a1 findInternalContentDataById:];
}

id objc_msgSend_findManagedContextByFingerprint_(void *a1, const char *a2, ...)
{
  return [a1 findManagedContextByFingerprint:];
}

id objc_msgSend_findQualifiedPlacementFromCachedData_forRequests_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "findQualifiedPlacementFromCachedData:forRequests:");
}

id objc_msgSend_findValidObjectsInContentDataItems_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "findValidObjectsInContentDataItems:");
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return _[a1 fingerprint];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_finishedWithRequests(void *a1, const char *a2, ...)
{
  return _[a1 finishedWithRequests];
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 firstMatchInString:x0 options:x1 range:x2];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstRunSinceReboot(void *a1, const char *a2, ...)
{
  return _[a1 firstRunSinceReboot];
}

id objc_msgSend_fixupFormattedText_(void *a1, const char *a2, ...)
{
  return [a1 fixupFormattedText:];
}

id objc_msgSend_flattenPolicy_policyType_(void *a1, const char *a2, ...)
{
  return [a1 flattenPolicy:policyType:];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceReconcile_(void *a1, const char *a2, ...)
{
  return [a1 forceReconcile:];
}

id objc_msgSend_formattedText(void *a1, const char *a2, ...)
{
  return _[a1 formattedText];
}

id objc_msgSend_foundArtists(void *a1, const char *a2, ...)
{
  return _[a1 foundArtists];
}

id objc_msgSend_foundBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 foundBundleIDs];
}

id objc_msgSend_foundGenres(void *a1, const char *a2, ...)
{
  return _[a1 foundGenres];
}

id objc_msgSend_fpdiSignature(void *a1, const char *a2, ...)
{
  return _[a1 fpdiSignature];
}

id objc_msgSend_functionNamesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 functionNamesAtIndex:];
}

id objc_msgSend_functionNamesCount(void *a1, const char *a2, ...)
{
  return _[a1 functionNamesCount];
}

id objc_msgSend_garbageCollect(void *a1, const char *a2, ...)
{
  return _[a1 garbageCollect];
}

id objc_msgSend_garbageCollector(void *a1, const char *a2, ...)
{
  return _[a1 garbageCollector];
}

id objc_msgSend_gcSchedulerQueue(void *a1, const char *a2, ...)
{
  return _[a1 gcSchedulerQueue];
}

id objc_msgSend_generatePolicyDataObjects_(void *a1, const char *a2, ...)
{
  return [a1 generatePolicyDataObjects:];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return _[a1 genre];
}

id objc_msgSend_geofencesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 geofencesAtIndex:];
}

id objc_msgSend_geofencesCount(void *a1, const char *a2, ...)
{
  return _[a1 geofencesCount];
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:];
}

id objc_msgSend_getDataStatus_error_(void *a1, const char *a2, ...)
{
  return [a1 getDataStatus:error];
}

id objc_msgSend_getPreferredDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return [a1 getPreferredDataSubscriptionContextSync:];
}

id objc_msgSend_getRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 getRepresentation];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSignalStrengthInfo_error_(void *a1, const char *a2, ...)
{
  return [a1 getSignalStrengthInfo:error];
}

id objc_msgSend_getStorageInfo(void *a1, const char *a2, ...)
{
  return _[a1 getStorageInfo];
}

id objc_msgSend_getStorageSize_allocatedSize_files_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getStorageSize:allocatedSize:files:")];
}

id objc_msgSend_getTableForClass_(void *a1, const char *a2, ...)
{
  return [a1 getTableForClass:];
}

id objc_msgSend_getToken_error_(void *a1, const char *a2, ...)
{
  return [a1 getToken:error];
}

id objc_msgSend_gregorianCalendar(void *a1, const char *a2, ...)
{
  return _[a1 gregorianCalendar];
}

id objc_msgSend_groupedEventCountForDayOfYear_purpose_(void *a1, const char *a2, ...)
{
  return [a1 groupedEventCountForDayOfYear:x0 purpose:x1];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleArticleLoadFailure_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleArticleLoadFailure:internalContent:context:idAccount:");
}

id objc_msgSend_handleClientDiscarded_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 handleClientDiscarded:internalContent:context:idAccount:];
}

id objc_msgSend_handleDaemonRequestFailed_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 handleDaemonRequestFailed:x0 internalContent:x1 context:x2 idAccount:x3];
}

id objc_msgSend_handleExpandedPlaceholderWithUnfilledReason_metric_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleExpandedPlaceholderWithUnfilledReason:metric:internalContent:context:idAccount:");
}

id objc_msgSend_handleInterfaceExceededContainer_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 handleInterfaceExceededContainer:internalContent:context:idAccount:];
}

id objc_msgSend_handleInterfaceInteracted_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInterfaceInteracted:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleInterfaceOffScreen_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 handleInterfaceOffScreen:internalContent:context:clientInfo:idAccount:];
}

id objc_msgSend_handleInterfaceOnScreen_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInterfaceOnScreen:internalContent:context:idAccount:");
}

id objc_msgSend_handleInterfaceReady_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInterfaceReady:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleInterfaceReplaced_metricEnvironment_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInterfaceReplaced:metricEnvironment:");
}

id objc_msgSend_handleInterfaceVisible_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 handleInterfaceVisible:internalContent:context:clientInfo:idAccount:];
}

id objc_msgSend_handleInterstitialOnScreen_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInterstitialOnScreen:internalContent:context:idAccount:");
}

id objc_msgSend_handleLoadFailed_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 handleLoadFailed:x0 internalContent:x1 context:x2 idAccount:x3];
}

id objc_msgSend_handleMediaComplete_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleMediaComplete:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleMetricResponse_error_forRequest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleMetricResponse:error:forRequest:");
}

id objc_msgSend_handleNewPromotedContent_adsReceived_adsRequested_token_context_lastInBatch_deliverEntireBatch_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleNewPromotedContent:adsReceived:adsRequested:token:context:lastInBatch:deliverEntireBatch:completionHandler:");
}

id objc_msgSend_handlePrivacyAdMetric_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handlePrivacyAdMetric:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleQuickReturn_internalContent_context_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleQuickReturn:internalContent:context:");
}

id objc_msgSend_handleSubscription_(void *a1, const char *a2, ...)
{
  return [a1 handleSubscription:];
}

id objc_msgSend_handleValidationFailed_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleValidationFailed:internalContent:context:idAccount:");
}

id objc_msgSend_handleVideoMetric_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleVideoMetric:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _[a1 handler];
}

id objc_msgSend_hasAccessibilityDescription(void *a1, const char *a2, ...)
{
  return _[a1 hasAccessibilityDescription];
}

id objc_msgSend_hasAdDataResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hasAdDataResponseIdentifier];
}

id objc_msgSend_hasAdFormatType(void *a1, const char *a2, ...)
{
  return _[a1 hasAdFormatType];
}

id objc_msgSend_hasAdFrequencyCapData(void *a1, const char *a2, ...)
{
  return _[a1 hasAdFrequencyCapData];
}

id objc_msgSend_hasAdPrivacyMarkPosition(void *a1, const char *a2, ...)
{
  return _[a1 hasAdPrivacyMarkPosition];
}

id objc_msgSend_hasAdTagContentString(void *a1, const char *a2, ...)
{
  return _[a1 hasAdTagContentString];
}

id objc_msgSend_hasAdType(void *a1, const char *a2, ...)
{
  return _[a1 hasAdType];
}

id objc_msgSend_hasAnonymousDemandiAdID(void *a1, const char *a2, ...)
{
  return _[a1 hasAnonymousDemandiAdID];
}

id objc_msgSend_hasAppStoreViewTemplate(void *a1, const char *a2, ...)
{
  return _[a1 hasAppStoreViewTemplate];
}

id objc_msgSend_hasBacklogForChannel_(void *a1, const char *a2, ...)
{
  return [a1 hasBacklogForChannel:];
}

id objc_msgSend_hasBannerImpressionThreshold(void *a1, const char *a2, ...)
{
  return _[a1 hasBannerImpressionThreshold];
}

id objc_msgSend_hasBeenOnScreen(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenOnScreen];
}

id objc_msgSend_hasConfirmed50PercentImpression(void *a1, const char *a2, ...)
{
  return _[a1 hasConfirmed50PercentImpression];
}

id objc_msgSend_hasConfirmedClick(void *a1, const char *a2, ...)
{
  return _[a1 hasConfirmedClick];
}

id objc_msgSend_hasConfirmedImpression(void *a1, const char *a2, ...)
{
  return _[a1 hasConfirmedImpression];
}

id objc_msgSend_hasContentiAdID(void *a1, const char *a2, ...)
{
  return _[a1 hasContentiAdID];
}

id objc_msgSend_hasDesiredPosition(void *a1, const char *a2, ...)
{
  return _[a1 hasDesiredPosition];
}

id objc_msgSend_hasDuration(void *a1, const char *a2, ...)
{
  return _[a1 hasDuration];
}

id objc_msgSend_hasElementID(void *a1, const char *a2, ...)
{
  return _[a1 hasElementID];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlement:];
}

id objc_msgSend_hasError(void *a1, const char *a2, ...)
{
  return _[a1 hasError];
}

id objc_msgSend_hasExpirationDate(void *a1, const char *a2, ...)
{
  return _[a1 hasExpirationDate];
}

id objc_msgSend_hasExpressionToEvaluate(void *a1, const char *a2, ...)
{
  return _[a1 hasExpressionToEvaluate];
}

id objc_msgSend_hasHumanReadableName(void *a1, const char *a2, ...)
{
  return _[a1 hasHumanReadableName];
}

id objc_msgSend_hasIAdID(void *a1, const char *a2, ...)
{
  return _[a1 hasIAdID];
}

id objc_msgSend_hasImpressionIdentifierData(void *a1, const char *a2, ...)
{
  return _[a1 hasImpressionIdentifierData];
}

id objc_msgSend_hasInstallAttribution(void *a1, const char *a2, ...)
{
  return _[a1 hasInstallAttribution];
}

id objc_msgSend_hasKey(void *a1, const char *a2, ...)
{
  return _[a1 hasKey];
}

id objc_msgSend_hasMediaFiles(void *a1, const char *a2, ...)
{
  return _[a1 hasMediaFiles];
}

id objc_msgSend_hasMinimumIntervalBetweenPresentations(void *a1, const char *a2, ...)
{
  return _[a1 hasMinimumIntervalBetweenPresentations];
}

id objc_msgSend_hasObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 hasObjectForKey:];
}

id objc_msgSend_hasOdml(void *a1, const char *a2, ...)
{
  return _[a1 hasOdml];
}

id objc_msgSend_hasPolicyData(void *a1, const char *a2, ...)
{
  return _[a1 hasPolicyData];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasReadEntitlement(void *a1, const char *a2, ...)
{
  return _[a1 hasReadEntitlement];
}

id objc_msgSend_hasRunningLandingPageRequest(void *a1, const char *a2, ...)
{
  return _[a1 hasRunningLandingPageRequest];
}

id objc_msgSend_hasSentStatusEvent_(void *a1, const char *a2, ...)
{
  return [a1 hasSentStatusEvent:];
}

id objc_msgSend_hasSpecification(void *a1, const char *a2, ...)
{
  return _[a1 hasSpecification];
}

id objc_msgSend_hasTargetingDimensions(void *a1, const char *a2, ...)
{
  return _[a1 hasTargetingDimensions];
}

id objc_msgSend_hasTransparencyDetails(void *a1, const char *a2, ...)
{
  return _[a1 hasTransparencyDetails];
}

id objc_msgSend_hasTransparencyRendererURL(void *a1, const char *a2, ...)
{
  return _[a1 hasTransparencyRendererURL];
}

id objc_msgSend_hasType(void *a1, const char *a2, ...)
{
  return _[a1 hasType];
}

id objc_msgSend_hasUnfilledReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 hasUnfilledReasonCode];
}

id objc_msgSend_hasUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hasUniqueIdentifier];
}

id objc_msgSend_hasValueBool(void *a1, const char *a2, ...)
{
  return _[a1 hasValueBool];
}

id objc_msgSend_hasValueDouble(void *a1, const char *a2, ...)
{
  return _[a1 hasValueDouble];
}

id objc_msgSend_hasValueInt(void *a1, const char *a2, ...)
{
  return _[a1 hasValueInt];
}

id objc_msgSend_hasValueString(void *a1, const char *a2, ...)
{
  return _[a1 hasValueString];
}

id objc_msgSend_hasWriteEntitlement(void *a1, const char *a2, ...)
{
  return _[a1 hasWriteEntitlement];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return _[a1 header];
}

id objc_msgSend_headerContext(void *a1, const char *a2, ...)
{
  return _[a1 headerContext];
}

id objc_msgSend_headerName(void *a1, const char *a2, ...)
{
  return _[a1 headerName];
}

id objc_msgSend_headerValue(void *a1, const char *a2, ...)
{
  return _[a1 headerValue];
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return _[a1 headers];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _[a1 headline];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_highlightedColor(void *a1, const char *a2, ...)
{
  return _[a1 highlightedColor];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_httpDelivery(void *a1, const char *a2, ...)
{
  return _[a1 httpDelivery];
}

id objc_msgSend_httpDeliveryClass(void *a1, const char *a2, ...)
{
  return _[a1 httpDeliveryClass];
}

id objc_msgSend_httpLookBackWindow(void *a1, const char *a2, ...)
{
  return _[a1 httpLookBackWindow];
}

id objc_msgSend_httpLookBackWindowDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 httpLookBackWindowDefaultValue];
}

id objc_msgSend_httpLookBackWindowValue(void *a1, const char *a2, ...)
{
  return _[a1 httpLookBackWindowValue];
}

id objc_msgSend_httpLookBackWindowWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 httpLookBackWindowWithCompletionHandler:];
}

id objc_msgSend_httpMaximumConnectionsPerHost(void *a1, const char *a2, ...)
{
  return _[a1 httpMaximumConnectionsPerHost];
}

id objc_msgSend_httpMaximumConnectionsPerHostDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 httpMaximumConnectionsPerHostDefaultValue];
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSession(void *a1, const char *a2, ...)
{
  return _[a1 httpMaximumConnectionsPerHostTempSession];
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSessionDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 httpMaximumConnectionsPerHostTempSessionDefaultValue];
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSessionValue(void *a1, const char *a2, ...)
{
  return _[a1 httpMaximumConnectionsPerHostTempSessionValue];
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSessionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:");
}

id objc_msgSend_httpMaximumConnectionsPerHostValue(void *a1, const char *a2, ...)
{
  return _[a1 httpMaximumConnectionsPerHostValue];
}

id objc_msgSend_httpMaximumConnectionsPerHostWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 httpMaximumConnectionsPerHostWithCompletionHandler:];
}

id objc_msgSend_httpUseFixedHttpSessionManager(void *a1, const char *a2, ...)
{
  return _[a1 httpUseFixedHttpSessionManager];
}

id objc_msgSend_httpUseFixedHttpSessionManagerDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 httpUseFixedHttpSessionManagerDefaultValue];
}

id objc_msgSend_httpUseFixedHttpSessionManagerValue(void *a1, const char *a2, ...)
{
  return _[a1 httpUseFixedHttpSessionManagerValue];
}

id objc_msgSend_httpUseFixedHttpSessionManagerWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 httpUseFixedHttpSessionManagerWithCompletionHandler:];
}

id objc_msgSend_humanReadableName(void *a1, const char *a2, ...)
{
  return _[a1 humanReadableName];
}

id objc_msgSend_iAdAttribution(void *a1, const char *a2, ...)
{
  return _[a1 iAdAttribution];
}

id objc_msgSend_iAdConversionDate(void *a1, const char *a2, ...)
{
  return _[a1 iAdConversionDate];
}

id objc_msgSend_iAdConversionTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 iAdConversionTimestamp];
}

id objc_msgSend_iAdID(void *a1, const char *a2, ...)
{
  return _[a1 iAdID];
}

id objc_msgSend_iAdImpressionDate(void *a1, const char *a2, ...)
{
  return _[a1 iAdImpressionDate];
}

id objc_msgSend_iAdImpressionTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 iAdImpressionTimestamp];
}

id objc_msgSend_iTunesDSID(void *a1, const char *a2, ...)
{
  return _[a1 iTunesDSID];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadata];
}

id objc_msgSend_iTunesMetadataAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadataAtIndex:];
}

id objc_msgSend_iTunesMetadatas(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadatas];
}

id objc_msgSend_iTunesMetadatasCount(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadatasCount];
}

id objc_msgSend_idAccount(void *a1, const char *a2, ...)
{
  return _[a1 idAccount];
}

id objc_msgSend_idAccounts(void *a1, const char *a2, ...)
{
  return _[a1 idAccounts];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idsAsString(void *a1, const char *a2, ...)
{
  return _[a1 idsAsString];
}

id objc_msgSend_ignoreBagKeyCheck(void *a1, const char *a2, ...)
{
  return _[a1 ignoreBagKeyCheck];
}

id objc_msgSend_ignoreBagKeyCheckValue(void *a1, const char *a2, ...)
{
  return _[a1 ignoreBagKeyCheckValue];
}

id objc_msgSend_ignoreKeys(void *a1, const char *a2, ...)
{
  return _[a1 ignoreKeys];
}

id objc_msgSend_impressionCount(void *a1, const char *a2, ...)
{
  return _[a1 impressionCount];
}

id objc_msgSend_impressionDate(void *a1, const char *a2, ...)
{
  return _[a1 impressionDate];
}

id objc_msgSend_impressionEventsForHandle_(void *a1, const char *a2, ...)
{
  return [a1 impressionEventsForHandle:];
}

id objc_msgSend_impressionID(void *a1, const char *a2, ...)
{
  return _[a1 impressionID];
}

id objc_msgSend_impressionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 impressionIdentifier];
}

id objc_msgSend_impressionIdentifierData(void *a1, const char *a2, ...)
{
  return _[a1 impressionIdentifierData];
}

id objc_msgSend_impressionSequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 impressionSequenceNumber];
}

id objc_msgSend_impressionThreshold(void *a1, const char *a2, ...)
{
  return _[a1 impressionThreshold];
}

id objc_msgSend_impressionsRemaining(void *a1, const char *a2, ...)
{
  return _[a1 impressionsRemaining];
}

id objc_msgSend_inactivityTime(void *a1, const char *a2, ...)
{
  return _[a1 inactivityTime];
}

id objc_msgSend_inclusionCriteriaAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 inclusionCriteriaAtIndex:];
}

id objc_msgSend_inclusionCriterias(void *a1, const char *a2, ...)
{
  return _[a1 inclusionCriterias];
}

id objc_msgSend_inclusionCriteriasCount(void *a1, const char *a2, ...)
{
  return _[a1 inclusionCriteriasCount];
}

id objc_msgSend_incrementVideoEventSequence(void *a1, const char *a2, ...)
{
  return _[a1 incrementVideoEventSequence];
}

id objc_msgSend_incrementalVacuumIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 incrementalVacuumIfNeeded];
}

id objc_msgSend_indexContainingDuration_(void *a1, const char *a2, ...)
{
  return [a1 indexContainingDuration:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indicator(void *a1, const char *a2, ...)
{
  return _[a1 indicator];
}

id objc_msgSend_infoAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 infoAtIndex:];
}

id objc_msgSend_infosCount(void *a1, const char *a2, ...)
{
  return _[a1 infosCount];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 initForReadingFromData:x0 error:x1];
}

id objc_msgSend_initFromServerRequest_(void *a1, const char *a2, ...)
{
  return [a1 initFromServerRequest:];
}

id objc_msgSend_initHandle_bundleId_adamId_adMetadata_properties_table_(void *a1, const char *a2, ...)
{
  return [a1 initHandle:x0 bundleId:x1 adamId:x2 adMetadata:x3 properties:x4 table:x5];
}

id objc_msgSend_initHandle_campaign_adGroup_ad_creative_bundleId_searchTermId_adamId_adType_adFormatType_containerType_relay_adMetadata_properties_brand_advertiserCategory_table_(void *a1, const char *a2, ...)
{
  return [a1 initHandle:x0 campaign:x1 adGroup:x2 ad:x3 creative:x4 bundleId:x5 searchTermId:x6 adamId:x7 adType:x8 adFormatType:x9 containerType:x10 relay:x11 adMetadata:x12 properties:x13 brand:x14 advertiserCategory:x15 table:x16];
}

id objc_msgSend_initHandle_timestamp_event_impression_insertOrder_table_(void *a1, const char *a2, ...)
{
  return [a1 initHandle:x0 timestamp:x1 event:x2 impression:x3 insertOrder:x4 table:x5];
}

id objc_msgSend_initHandle_timestamp_purpose_event_source_unknownSource_handleSet_eventOrder_trace_branch_environment_impression_properties_internalProperties_insertOrder_table_(void *a1, const char *a2, ...)
{
  return [a1 initHandle:x0 timestamp:x1 purpose:x2 event:x3 source:x4 unknownSource:x5 handleSet:x6 eventOrder:x7 trace:x8 branch:x9 environment:x10 impression:x11 properties:x12 internalProperties:x13 insertOrder:x14 table:x15];
}

id objc_msgSend_initInPersistentStore_(void *a1, const char *a2, ...)
{
  return [a1 initInPersistentStore:];
}

id objc_msgSend_initRateLimitedForContextId_containerSize_placementType_(void *a1, const char *a2, ...)
{
  return [a1 initRateLimitedForContextId:x0 containerSize:x1 placementType:x2];
}

id objc_msgSend_initType_dayOfYear_frequency_reportDate_table_(void *a1, const char *a2, ...)
{
  return [a1 initType:dayOfYear:frequency:reportDate:table:];
}

id objc_msgSend_initWith_andToken_andAppTrackingStatus_andToroID_(void *a1, const char *a2, ...)
{
  return [a1 initWith:a2 andToken:a3 andAppTrackingStatus:a4 andToroID:a5];
}

id objc_msgSend_initWithAMSProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithAMSProvider:];
}

id objc_msgSend_initWithAccumulationTime_inactivityTime_itemLimit_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccumulationTime:inactivityTime:itemLimit:];
}

id objc_msgSend_initWithAdData_element_elementIndex_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdData:x0 element:x1 elementIndex:x2 error:x3];
}

id objc_msgSend_initWithAdData_forPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdData:forPlacementType:];
}

id objc_msgSend_initWithAdData_identifier_contextIdentifier_placementType_maxSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdData:x0 identifier:x1 contextIdentifier:x2 placementType:x3 maxSize:x4];
}

id objc_msgSend_initWithAdData_placementType_maxSize_mediaAsset_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdData:x0 placementType:x1 maxSize:x2 mediaAsset:x3 error:x4];
}

id objc_msgSend_initWithAdData_placementType_maxSize_nativeLayout_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdData:x0 placementType:x1 maxSize:x2 nativeLayout:x3 error:x4];
}

id objc_msgSend_initWithAsset_(void *a1, const char *a2, ...)
{
  return [a1 initWithAsset:];
}

id objc_msgSend_initWithAssetInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetInfo:];
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:x0 options:x1];
}

id objc_msgSend_initWithBatch_bundleID_requestIdentifier_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithBatch:x0 bundleID:x1 requestIdentifier:x2 clientInfo:x3 idAccount:x4];
}

id objc_msgSend_initWithBatchPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithBatchPath:];
}

id objc_msgSend_initWithBorderStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithBorderStyle:];
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:];
}

id objc_msgSend_initWithBundleID_connection_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:connection:];
}

id objc_msgSend_initWithBundleID_idAccount_contentId_contextId_adDataResponseIdentifier_batchId_impressionIdentifierData_timeSpent_databaseManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:idAccount:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:databaseManager:];
}

id objc_msgSend_initWithBundleID_identifier_clientInfo_idAccount_accumulateRequests_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:identifier:clientInfo:idAccount:accumulateRequests:];
}

id objc_msgSend_initWithBundleID_identifier_segmentIdentifiers_replaceExisting_privateSegment_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:x0 identifier:x1 segmentIdentifiers:x2 replaceExisting:x3 privateSegment:x4];
}

id objc_msgSend_initWithBundleID_requestIdentifier_contextIdentifier_contentIdentifier_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:x0 requestIdentifier:x1 contextIdentifier:x2 contentIdentifier:x3 idAccount:x4];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:x0 allowPlaceholder:x1 error:x2];
}

id objc_msgSend_initWithButton_(void *a1, const char *a2, ...)
{
  return [a1 initWithButton:];
}

id objc_msgSend_initWithButtonStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithButtonStyle:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:x0 length:x1];
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithCString:x0 encoding:x1];
}

id objc_msgSend_initWithCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithCache:];
}

id objc_msgSend_initWithCacheSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheSize:];
}

id objc_msgSend_initWithCacheStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheStore:];
}

id objc_msgSend_initWithCacheStore_expirationDate_timeSincePrevLaunch_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheStore:x0 expirationDate:x1 timeSincePrevLaunch:x2];
}

id objc_msgSend_initWithCacheStore_key_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheStore:key];
}

id objc_msgSend_initWithCacheStore_key_object_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheStore:x0 key:x1 object:x2];
}

id objc_msgSend_initWithCacheStore_key_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheStore:x0 key:x1 timestamp:x2];
}

id objc_msgSend_initWithCachedToken_detailed_(void *a1, const char *a2, ...)
{
  return [a1 initWithCachedToken:detailed:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithClientIdentifier_bag_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientIdentifier:bag];
}

id objc_msgSend_initWithClock_(void *a1, const char *a2, ...)
{
  return [a1 initWithClock:];
}

id objc_msgSend_initWithColor_(void *a1, const char *a2, ...)
{
  return [a1 initWithColor:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithConfigurationStorage_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfigurationStorage:];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return [a1 initWithContent:];
}

id objc_msgSend_initWithContent_privateContent_andTransientContent_(void *a1, const char *a2, ...)
{
  return [a1 initWithContent:x0 privateContent:x1 andTransientContent:x2];
}

id objc_msgSend_initWithContentData_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentData:];
}

id objc_msgSend_initWithContentDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentDataProvider:];
}

id objc_msgSend_initWithContext_bundleID_identifier_placement_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:x0 bundleID:x1 identifier:x2 placement:x3 completionHandler:x4];
}

id objc_msgSend_initWithContext_contentIdentifier_placementType_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:x0 contentIdentifier:x1 placementType:x2];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return [a1 initWithDatabase:];
}

id objc_msgSend_initWithDatasource_(void *a1, const char *a2, ...)
{
  return [a1 initWithDatasource:];
}

id objc_msgSend_initWithDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDate:x0];
}

id objc_msgSend_initWithDbManager_retryManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithDbManager:retryManager:];
}

id objc_msgSend_initWithDefaultValues_(void *a1, const char *a2, ...)
{
  return [a1 initWithDefaultValues:];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDestination_purpose_(void *a1, const char *a2, ...)
{
  return [a1 initWithDestination:purpose:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return [a1 initWithError:];
}

id objc_msgSend_initWithExpression_version_andParent_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initWithExpression:version:andParent:error:");
}

id objc_msgSend_initWithFileManager_startDirectory_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileManager:[a1 fileManager] startDirectory:[a1 startDirectory]];
}

id objc_msgSend_initWithFileStorage_memoryCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileStorage:memoryCache:];
}

id objc_msgSend_initWithFilesEnumerator_expirationDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithFilesEnumerator:x0 expirationDate:x1];
}

id objc_msgSend_initWithHost_port_(void *a1, const char *a2, ...)
{
  return [a1 initWithHost:port:];
}

id objc_msgSend_initWithHttpHeaders_(void *a1, const char *a2, ...)
{
  return [a1 initWithHttpHeaders:];
}

id objc_msgSend_initWithID_ofType_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:ofType:];
}

id objc_msgSend_initWithIDAccountPrivate_(void *a1, const char *a2, ...)
{
  return [a1 initWithIDAccountPrivate:];
}

id objc_msgSend_initWithIDAccountsRecord_storefront_monthlyIDResetCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithIDAccountsRecord:x0 storefront:x1 monthlyIDResetCount:x2];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithIdentifier_inPersistentStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:inPersistentStore:];
}

id objc_msgSend_initWithIdentifier_maxSize_requestedAdIdentifier_currentContent_adjacentContent_supplementalContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 maxSize:x1 requestedAdIdentifier:x2 currentContent:x3 adjacentContent:x4 supplementalContext:x5];
}

id objc_msgSend_initWithInterval_(void *a1, const char *a2, ...)
{
  return [a1 initWithInterval:];
}

id objc_msgSend_initWithKey_payload_token_signature_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:x0 payload:x1 token:x2 signature:x3];
}

id objc_msgSend_initWithLegacyInterface_(void *a1, const char *a2, ...)
{
  return [a1 initWithLegacyInterface:];
}

id objc_msgSend_initWithLocalizedStringEntry_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocalizedStringEntry:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:x0 options:x1];
}

id objc_msgSend_initWithManagedContext_contentData_transaction_(void *a1, const char *a2, ...)
{
  return [a1 initWithManagedContext:a2 contentData:a3 transaction:a4];
}

id objc_msgSend_initWithManagedContext_contentDataItemIds_(void *a1, const char *a2, ...)
{
  return [a1 initWithManagedContext:contentDataItemIds:];
}

id objc_msgSend_initWithMetric_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetric:x0 bundleID:x1];
}

id objc_msgSend_initWithMetric_internalContent_andContext_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetric:x0 internalContent:x1 andContext:x2 clientInfo:x3 idAccount:x4];
}

id objc_msgSend_initWithMetric_internalContent_andContext_idAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetric:x0 internalContent:x1 andContext:x2 idAccount:x3];
}

id objc_msgSend_initWithMetric_internalContent_context_idAccount_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetric:x0 internalContent:x1 context:x2 idAccount:x3 error:x4];
}

id objc_msgSend_initWithName_forColumnType_withValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:forColumnType:withValue:];
}

id objc_msgSend_initWithName_poolSize_numberToStash_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 poolSize:x1 numberToStash:x2];
}

id objc_msgSend_initWithName_poolSize_numberToStash_setupCompletion_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 poolSize:x1 numberToStash:x2 setupCompletion:x3];
}

id objc_msgSend_initWithNotificationRegister_(void *a1, const char *a2, ...)
{
  return [a1 initWithNotificationRegister:];
}

id objc_msgSend_initWithObject_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithObject:identifier:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjectsAndKeys:];
}

id objc_msgSend_initWithObjectsIterator_fileManager_extension_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjectsIterator:v1 fileManager:v2 extension:v3];
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:];
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:x0 capacity:x1];
}

id objc_msgSend_initWithParams_(void *a1, const char *a2, ...)
{
  return [a1 initWithParams:];
}

id objc_msgSend_initWithParent_identifier_dataSource_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithParent:a2 identifier:a3 dataSource:a4 error:a5];
}

id objc_msgSend_initWithParent_identifier_expressionOrReference_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithParent:a2 identifier:a3 expressionOrReference:a4 subExpressions:a5 data:a6 error:a7];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPathPrefix_(void *a1, const char *a2, ...)
{
  return [a1 initWithPathPrefix:];
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithPattern:x0 options:x1 error:x2];
}

id objc_msgSend_initWithPolicyType_policyValue_isXLFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithPolicyType:policyType policyValue:policyValue isXLFormat:isXLFormat];
}

id objc_msgSend_initWithPoolName_(void *a1, const char *a2, ...)
{
  return [a1 initWithPoolName:];
}

id objc_msgSend_initWithPurpose_metric_contentIdentifier_contextIdentifier_handle_branch_properties_internalProperties_relayData_environment_order_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithPurpose:x0 metric:x1 contentIdentifier:x2 contextIdentifier:x3 handle:x4 branch:x5 properties:x6 internalProperties:x7 relayData:x8 environment:x9 order:x10 options:x11];
}

id objc_msgSend_initWithPurposeDefinition_(void *a1, const char *a2, ...)
{
  return [a1 initWithPurposeDefinition:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithRGBA_(void *a1, const char *a2, ...)
{
  return [a1 initWithRGBA:];
}

id objc_msgSend_initWithReportDatasource_deliveredReport_currentDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithReportDatasource:v1 deliveredReport:v2 currentDate:v3];
}

id objc_msgSend_initWithReportDate_purpose_reportEventCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithReportDate:x0 purpose:x1 reportEventCount:x2];
}

id objc_msgSend_initWithResponse_forRequester_(void *a1, const char *a2, ...)
{
  return [a1 initWithResponse:forRequester:];
}

id objc_msgSend_initWithResponse_forRequester_contentIdentifier_withContext_placement_(void *a1, const char *a2, ...)
{
  return [a1 initWithResponse:v1 forRequester:v2 contentIdentifier:v3 withContext:v4 placement:v5];
}

id objc_msgSend_initWithRetryManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithRetryManager:];
}

id objc_msgSend_initWithRetryManager_databaseManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithRetryManager:a2 databaseManager:a3];
}

id objc_msgSend_initWithRoutingType_preferencesStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithRoutingType:preferencesStore:];
}

id objc_msgSend_initWithSchedule_name_(void *a1, const char *a2, ...)
{
  return [a1 initWithSchedule:name:];
}

id objc_msgSend_initWithSecureFileManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithSecureFileManager:];
}

id objc_msgSend_initWithShadowStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithShadowStyle:];
}

id objc_msgSend_initWithSigningPercentageFPDIValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithSigningPercentageFPDIValue:];
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartDate:x0 duration:x1];
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartDate:x0 endDate:x1 maxEvents:x2 lastN:x3 reversed:x4];
}

id objc_msgSend_initWithStorage_(void *a1, const char *a2, ...)
{
  return [a1 initWithStorage:];
}

id objc_msgSend_initWithStorage_andSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithStorage:x0 andSize:x1];
}

id objc_msgSend_initWithStorefront_(void *a1, const char *a2, ...)
{
  return [a1 initWithStorefront:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithToken_source_(void *a1, const char *a2, ...)
{
  return [a1 initWithToken:x0 source:x1];
}

id objc_msgSend_initWithTokenService_(void *a1, const char *a2, ...)
{
  return [a1 initWithTokenService:];
}

id objc_msgSend_initWithTokenService_bag_(void *a1, const char *a2, ...)
{
  return [a1 initWithTokenService:bag];
}

id objc_msgSend_initWithTokens_legacyInterface_(void *a1, const char *a2, ...)
{
  return [a1 initWithTokens:x0 legacyInterface:x1];
}

id objc_msgSend_initWithTotalCostLimit_(void *a1, const char *a2, ...)
{
  return [a1 initWithTotalCostLimit:];
}

id objc_msgSend_initWithTransmitter_(void *a1, const char *a2, ...)
{
  return [a1 initWithTransmitter:];
}

id objc_msgSend_initWithType_value_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:value:identifier:];
}

id objc_msgSend_initWithURL_HTTPMethod_HTTPHeaders_HTTPBody_serviceName_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 HTTPMethod:x1 HTTPHeaders:x2 HTTPBody:x3 serviceName:x4 completionHandler:x5];
}

id objc_msgSend_initWithURL_bundleID_header_body_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 bundleID:x1 header:x2 body:x3];
}

id objc_msgSend_initWithURL_headers_defaultValues_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 headers:x1 defaultValues:x2];
}

id objc_msgSend_initWithURL_statusCode_HTTPVersion_headerFields_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 statusCode:x1 HTTPVersion:x2 headerFields:x3];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUnfilledReason_error_contentIdentifier_contextIdentifier_containerSize_placementType_(void *a1, const char *a2, ...)
{
  return [a1 initWithUnfilledReason:x0 error:x1 contentIdentifier:x2 contextIdentifier:x3 containerSize:x4 placementType:x5];
}

id objc_msgSend_initWithUnfilledReason_error_contentIdentifier_contextIdentifier_containerSize_placementType_journeyStartRelayValues_(void *a1, const char *a2, ...)
{
  return [a1 initWithUnfilledReason:x0 error:x1 contentIdentifier:x2 contextIdentifier:x3 containerSize:x4 placementType:x5 journeyStartRelayValues:x6];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _[a1 initialize];
}

id objc_msgSend_initializeFairPlay(void *a1, const char *a2, ...)
{
  return _[a1 initializeFairPlay];
}

id objc_msgSend_initializeMescalProvider_interval_(void *a1, const char *a2, ...)
{
  return [a1 initializeMescalProvider:x0 interval:x1];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return _[a1 inputs];
}

id objc_msgSend_insertAdInstanceWithHandle_bundleId_adamId_adMetadata_properties_(void *a1, const char *a2, ...)
{
  return [a1 insertAdInstanceWithHandle:x0 bundleId:x1 adamId:x2 adMetadata:x3 properties:x4];
}

id objc_msgSend_insertEvent_handle_impression_timestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "insertEvent:handle:impression:timestamp:");
}

id objc_msgSend_insertOrUpdateAdInstanceWithHandle_campaign_adGroup_ad_creative_bundleId_searchTermId_adamId_adType_adFormatType_containerType_relay_adMetadata_properties_brand_advertiserCategory_(void *a1, const char *a2, ...)
{
  return [a1 insertOrUpdateAdInstanceWithHandle:x0 campaign:x1 adGroup:x2 ad:x3 creative:x4 bundleId:x5 searchTermId:x6 adamId:x7 adType:x8 adFormatType:x9 containerType:x10 relay:x11 adMetadata:x12 properties:x13 brand:x14 advertiserCategory:x15];
}

id objc_msgSend_insertOrUpdateIgnoringNilColumns(void *a1, const char *a2, ...)
{
  return _[a1 insertOrUpdateIgnoringNilColumns];
}

id objc_msgSend_insertOrder(void *a1, const char *a2, ...)
{
  return _[a1 insertOrder];
}

id objc_msgSend_insertReceivedEventWithHandle_bundleId_adamId_adMetadata_adProperties_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "insertReceivedEventWithHandle:bundleId:adamId:adMetadata:adProperties:");
}

id objc_msgSend_installAttribution(void *a1, const char *a2, ...)
{
  return _[a1 installAttribution];
}

id objc_msgSend_installedAsTestApp(void *a1, const char *a2, ...)
{
  return _[a1 installedAsTestApp];
}

id objc_msgSend_installedByAppStore(void *a1, const char *a2, ...)
{
  return _[a1 installedByAppStore];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_integrityReportEventListener(void *a1, const char *a2, ...)
{
  return _[a1 integrityReportEventListener];
}

id objc_msgSend_interactedEventsForHandle_(void *a1, const char *a2, ...)
{
  return [a1 interactedEventsForHandle:];
}

id objc_msgSend_interfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 interfaceIdiom];
}

id objc_msgSend_interfaceReady(void *a1, const char *a2, ...)
{
  return _[a1 interfaceReady];
}

id objc_msgSend_interfaceReplaced(void *a1, const char *a2, ...)
{
  return _[a1 interfaceReplaced];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalContent(void *a1, const char *a2, ...)
{
  return _[a1 internalContent];
}

id objc_msgSend_internalErrors(void *a1, const char *a2, ...)
{
  return _[a1 internalErrors];
}

id objc_msgSend_internalProperties(void *a1, const char *a2, ...)
{
  return _[a1 internalProperties];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectsSet:];
}

id objc_msgSend_intervalId(void *a1, const char *a2, ...)
{
  return _[a1 intervalId];
}

id objc_msgSend_invalidRequestErrorWithCode_reason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "invalidRequestErrorWithCode:reason:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_invokeHandlerForMessage_payload_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "invokeHandlerForMessage:payload:completionHandler:");
}

id objc_msgSend_isAdResponseMockedForPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 isAdResponseMockedForPlacementType:];
}

id objc_msgSend_isAdolescent(void *a1, const char *a2, ...)
{
  return _[a1 isAdolescent];
}

id objc_msgSend_isAdult(void *a1, const char *a2, ...)
{
  return _[a1 isAdult];
}

id objc_msgSend_isAllowedEmptyResponse(void *a1, const char *a2, ...)
{
  return _[a1 isAllowedEmptyResponse];
}

id objc_msgSend_isAppTrackingAuthorizedByUser_(void *a1, const char *a2, ...)
{
  return [a1 isAppTrackingAuthorizedByUser:];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isAppleInternalInstall];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAttributed(void *a1, const char *a2, ...)
{
  return _[a1 isAttributed];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBefore_(void *a1, const char *a2, ...)
{
  return [a1 isBefore:];
}

id objc_msgSend_isBlockedForNewsSubscriber_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 isBlockedForNewsSubscriber:bundleID];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCapableOfAction_capabilities_(void *a1, const char *a2, ...)
{
  return [a1 isCapableOfAction:capabilities:];
}

id objc_msgSend_isCarouselAd(void *a1, const char *a2, ...)
{
  return _[a1 isCarouselAd];
}

id objc_msgSend_isChild(void *a1, const char *a2, ...)
{
  return _[a1 isChild];
}

id objc_msgSend_isClientRenderedAd(void *a1, const char *a2, ...)
{
  return _[a1 isClientRenderedAd];
}

id objc_msgSend_isDNUEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDNUEnabled];
}

id objc_msgSend_isEarlierThan_(void *a1, const char *a2, ...)
{
  return [a1 isEarlierThan:];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isEmpty];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToDestination_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDestination:];
}

id objc_msgSend_isEqualToEventChannel_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToEventChannel:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEventDatabaseStorageEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEventDatabaseStorageEnabled];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return _[a1 isExpired];
}

id objc_msgSend_isFinalMessage_(void *a1, const char *a2, ...)
{
  return [a1 isFinalMessage:];
}

id objc_msgSend_isFirstMessage_(void *a1, const char *a2, ...)
{
  return [a1 isFirstMessage:];
}

id objc_msgSend_isLocationAvailableForAd(void *a1, const char *a2, ...)
{
  return _[a1 isLocationAvailableForAd];
}

id objc_msgSend_isManagedAccount(void *a1, const char *a2, ...)
{
  return _[a1 isManagedAccount];
}

id objc_msgSend_isMasterObject(void *a1, const char *a2, ...)
{
  return _[a1 isMasterObject];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_isNativeAd(void *a1, const char *a2, ...)
{
  return _[a1 isNativeAd];
}

id objc_msgSend_isNewObject(void *a1, const char *a2, ...)
{
  return _[a1 isNewObject];
}

id objc_msgSend_isNoServicesRegion(void *a1, const char *a2, ...)
{
  return _[a1 isNoServicesRegion];
}

id objc_msgSend_isObjectAliveForKey_(void *a1, const char *a2, ...)
{
  return [a1 isObjectAliveForKey:];
}

id objc_msgSend_isOnDeviceAppInstallationAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isOnDeviceAppInstallationAllowed];
}

id objc_msgSend_isOutstreamVideo(void *a1, const char *a2, ...)
{
  return _[a1 isOutstreamVideo];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isPlaceholderIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholderIdentifier:];
}

id objc_msgSend_isPrerollVideo(void *a1, const char *a2, ...)
{
  return _[a1 isPrerollVideo];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isRunningTests(void *a1, const char *a2, ...)
{
  return _[a1 isRunningTests];
}

id objc_msgSend_isSampleRateExpired_purpose_(void *a1, const char *a2, ...)
{
  return [a1 isSampleRateExpired:purpose:];
}

id objc_msgSend_isSearchLandingAdsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSearchLandingAdsEnabled];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _[a1 isSharedIPad];
}

id objc_msgSend_isSponsorshipAd(void *a1, const char *a2, ...)
{
  return _[a1 isSponsorshipAd];
}

id objc_msgSend_isStatusConditionRegistered_error_(void *a1, const char *a2, ...)
{
  return [a1 isStatusConditionRegistered:error];
}

id objc_msgSend_isStorefrontAdPlatformsEnabledForBag_(void *a1, const char *a2, ...)
{
  return [a1 isStorefrontAdPlatformsEnabledForBag:];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isSubclassOfClass:];
}

id objc_msgSend_isSubscriber(void *a1, const char *a2, ...)
{
  return _[a1 isSubscriber];
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return [a1 isSubsetOfSet:];
}

id objc_msgSend_isTest(void *a1, const char *a2, ...)
{
  return _[a1 isTest];
}

id objc_msgSend_isTokenUsed_(void *a1, const char *a2, ...)
{
  return [a1 isTokenUsed:];
}

id objc_msgSend_isTokenUsedByOtherBundle_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 isTokenUsedByOtherBundle:bundleID];
}

id objc_msgSend_isValidCheckWithToroID_andTrackingStatus_(void *a1, const char *a2, ...)
{
  return [a1 isValidCheckWithToroID:andTrackingStatus:];
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return [a1 isValidJSONObject:];
}

id objc_msgSend_isValidPolicy_(void *a1, const char *a2, ...)
{
  return [a1 isValidPolicy:];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _[a1 isVideo];
}

id objc_msgSend_isViewableImpression(void *a1, const char *a2, ...)
{
  return _[a1 isViewableImpression];
}

id objc_msgSend_isWaitingForBackoff(void *a1, const char *a2, ...)
{
  return _[a1 isWaitingForBackoff];
}

id objc_msgSend_isXLFormat(void *a1, const char *a2, ...)
{
  return _[a1 isXLFormat];
}

id objc_msgSend_isiCloudLoggedIn(void *a1, const char *a2, ...)
{
  return _[a1 isiCloudLoggedIn];
}

id objc_msgSend_isiCloudSameAsiTunes(void *a1, const char *a2, ...)
{
  return _[a1 isiCloudSameAsiTunes];
}

id objc_msgSend_isiTunesLoggedIn(void *a1, const char *a2, ...)
{
  return _[a1 isiTunesLoggedIn];
}

id objc_msgSend_iso8601TruncatedToMinutes(void *a1, const char *a2, ...)
{
  return _[a1 iso8601TruncatedToMinutes];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return _[a1 itemID];
}

id objc_msgSend_itemLimit(void *a1, const char *a2, ...)
{
  return _[a1 itemLimit];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_iterateObjectsIncludingFolders_(void *a1, const char *a2, ...)
{
  return [a1 iterateObjectsIncludingFolders:];
}

id objc_msgSend_journeyBatchSettings(void *a1, const char *a2, ...)
{
  return _[a1 journeyBatchSettings];
}

id objc_msgSend_journeyDaemonMetricHelper(void *a1, const char *a2, ...)
{
  return _[a1 journeyDaemonMetricHelper];
}

id objc_msgSend_journeyIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 journeyIdentifier];
}

id objc_msgSend_journeyRelayAdGroupId(void *a1, const char *a2, ...)
{
  return _[a1 journeyRelayAdGroupId];
}

id objc_msgSend_journeyRelayCampaignId(void *a1, const char *a2, ...)
{
  return _[a1 journeyRelayCampaignId];
}

id objc_msgSend_journeySettings(void *a1, const char *a2, ...)
{
  return _[a1 journeySettings];
}

id objc_msgSend_journeyStartRelayValues(void *a1, const char *a2, ...)
{
  return _[a1 journeyStartRelayValues];
}

id objc_msgSend_journeyStartRelayValuesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 journeyStartRelayValuesAtIndex:];
}

id objc_msgSend_journeyStartRelayValuesCount(void *a1, const char *a2, ...)
{
  return _[a1 journeyStartRelayValuesCount];
}

id objc_msgSend_jsonBody(void *a1, const char *a2, ...)
{
  return _[a1 jsonBody];
}

id objc_msgSend_jsonDataWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 jsonDataWithOptions:];
}

id objc_msgSend_jsonRepresentationWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 jsonRepresentationWithOptions:];
}

id objc_msgSend_jsonString(void *a1, const char *a2, ...)
{
  return _[a1 jsonString];
}

id objc_msgSend_jsonStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 jsonStringWithOptions:];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyChainLock(void *a1, const char *a2, ...)
{
  return _[a1 keyChainLock];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keyboardOverride(void *a1, const char *a2, ...)
{
  return _[a1 keyboardOverride];
}

id objc_msgSend_keyboards(void *a1, const char *a2, ...)
{
  return _[a1 keyboards];
}

id objc_msgSend_keywords(void *a1, const char *a2, ...)
{
  return _[a1 keywords];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_languageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 languageIdentifier];
}

id objc_msgSend_lastActivity(void *a1, const char *a2, ...)
{
  return _[a1 lastActivity];
}

id objc_msgSend_lastDeliveryReportWithType_(void *a1, const char *a2, ...)
{
  return [a1 lastDeliveryReportWithType:];
}

id objc_msgSend_lastGarbageCollected(void *a1, const char *a2, ...)
{
  return _[a1 lastGarbageCollected];
}

id objc_msgSend_lastModifiedDateForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "lastModifiedDateForFileAtPath:error:")];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastPlaybackTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastPlaybackTimestamp];
}

id objc_msgSend_lastPosition(void *a1, const char *a2, ...)
{
  return _[a1 lastPosition];
}

id objc_msgSend_lastProcessingDateForDestination_(void *a1, const char *a2, ...)
{
  return [a1 lastProcessingDateForDestination:];
}

id objc_msgSend_lastProcessingDates(void *a1, const char *a2, ...)
{
  return _[a1 lastProcessingDates];
}

id objc_msgSend_lastReport(void *a1, const char *a2, ...)
{
  return _[a1 lastReport];
}

id objc_msgSend_lastSentEventTime(void *a1, const char *a2, ...)
{
  return _[a1 lastSentEventTime];
}

id objc_msgSend_lastStatusCode(void *a1, const char *a2, ...)
{
  return _[a1 lastStatusCode];
}

id objc_msgSend_lastUpdated(void *a1, const char *a2, ...)
{
  return _[a1 lastUpdated];
}

id objc_msgSend_latestCellularSignalStrength(void *a1, const char *a2, ...)
{
  return _[a1 latestCellularSignalStrength];
}

id objc_msgSend_legacyInterface(void *a1, const char *a2, ...)
{
  return _[a1 legacyInterface];
}

id objc_msgSend_legacyMetrics(void *a1, const char *a2, ...)
{
  return _[a1 legacyMetrics];
}

id objc_msgSend_legacyServerErrorCode(void *a1, const char *a2, ...)
{
  return _[a1 legacyServerErrorCode];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_lineBreakFramer_(void *a1, const char *a2, ...)
{
  return [a1 lineBreakFramer:];
}

id objc_msgSend_linesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 linesAtIndex:];
}

id objc_msgSend_linesCount(void *a1, const char *a2, ...)
{
  return _[a1 linesCount];
}

id objc_msgSend_liveObjectsTracker(void *a1, const char *a2, ...)
{
  return _[a1 liveObjectsTracker];
}

id objc_msgSend_loadCapData_(void *a1, const char *a2, ...)
{
  return [a1 loadCapData:];
}

id objc_msgSend_loadConfig_(void *a1, const char *a2, ...)
{
  return [a1 loadConfig:];
}

id objc_msgSend_loadDeviceHeaderInfo(void *a1, const char *a2, ...)
{
  return _[a1 loadDeviceHeaderInfo];
}

id objc_msgSend_loadDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 loadDeviceInfo];
}

id objc_msgSend_loadFailed(void *a1, const char *a2, ...)
{
  return _[a1 loadFailed];
}

id objc_msgSend_loadIDAccountDetails(void *a1, const char *a2, ...)
{
  return _[a1 loadIDAccountDetails];
}

id objc_msgSend_loadMetaDataWithError_(void *a1, const char *a2, ...)
{
  return [a1 loadMetaDataWithError:];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _[a1 locality];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_localizedHeadlines(void *a1, const char *a2, ...)
{
  return _[a1 localizedHeadlines];
}

id objc_msgSend_localizedHeadlinesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 localizedHeadlinesAtIndex:];
}

id objc_msgSend_localizedHeadlinesCount(void *a1, const char *a2, ...)
{
  return _[a1 localizedHeadlinesCount];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationInfo(void *a1, const char *a2, ...)
{
  return _[a1 locationInfo];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockObject(void *a1, const char *a2, ...)
{
  return _[a1 lockObject];
}

id objc_msgSend_logAdResponsesAsText(void *a1, const char *a2, ...)
{
  return _[a1 logAdResponsesAsText];
}

id objc_msgSend_logMetadata(void *a1, const char *a2, ...)
{
  return _[a1 logMetadata];
}

id objc_msgSend_longBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 longBuildVersion];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDatabase(void *a1, const char *a2, ...)
{
  return _[a1 mainDatabase];
}

id objc_msgSend_makeDelayedRequest_requestSentHandler_responseCallback_(void *a1, const char *a2, ...)
{
  return [a1 makeDelayedRequest:requestSentHandler:responseCallback:];
}

id objc_msgSend_makeNetworkRequest_(void *a1, const char *a2, ...)
{
  return [a1 makeNetworkRequest:];
}

id objc_msgSend_makeRequest_(void *a1, const char *a2, ...)
{
  return [a1 makeRequest:];
}

id objc_msgSend_makeTapActionWithLegacyAction_iTunesMetadata_error_(void *a1, const char *a2, ...)
{
  return [a1 makeTapActionWithLegacyAction:iTunesMetadata:error:];
}

id objc_msgSend_makeTimeSpentRequests_activity_(void *a1, const char *a2, ...)
{
  return [a1 makeTimeSpentRequests:activity:];
}

id objc_msgSend_managedContentDataEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 managedContentDataEnumerator];
}

id objc_msgSend_managedContentDataForId_(void *a1, const char *a2, ...)
{
  return [a1 managedContentDataForId:];
}

id objc_msgSend_managedContext(void *a1, const char *a2, ...)
{
  return _[a1 managedContext];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_mapObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 mapObjectsUsingBlock:];
}

id objc_msgSend_markInUseByClientWithId_(void *a1, const char *a2, ...)
{
  return [a1 markInUseByClientWithId:];
}

id objc_msgSend_markUsed(void *a1, const char *a2, ...)
{
  return _[a1 markUsed];
}

id objc_msgSend_masterId(void *a1, const char *a2, ...)
{
  return _[a1 masterId];
}

id objc_msgSend_masterObject(void *a1, const char *a2, ...)
{
  return _[a1 masterObject];
}

id objc_msgSend_masterObjectFileNameForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 masterObjectFileNameForIdentifier:];
}

id objc_msgSend_matchTagClauseAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 matchTagClauseAtIndex:];
}

id objc_msgSend_matchTagClausesCount(void *a1, const char *a2, ...)
{
  return _[a1 matchTagClausesCount];
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "matchesInString:options:range:");
}

id objc_msgSend_maxDisplayBars(void *a1, const char *a2, ...)
{
  return _[a1 maxDisplayBars];
}

id objc_msgSend_maxObjectLifeTimeDays(void *a1, const char *a2, ...)
{
  return _[a1 maxObjectLifeTimeDays];
}

id objc_msgSend_maxObjectLifetime(void *a1, const char *a2, ...)
{
  return _[a1 maxObjectLifetime];
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return _[a1 maxSize];
}

id objc_msgSend_maxVersion(void *a1, const char *a2, ...)
{
  return _[a1 maxVersion];
}

id objc_msgSend_mediaAPICountryCode(void *a1, const char *a2, ...)
{
  return _[a1 mediaAPICountryCode];
}

id objc_msgSend_mediaAPIHostURL(void *a1, const char *a2, ...)
{
  return _[a1 mediaAPIHostURL];
}

id objc_msgSend_mediaAssets(void *a1, const char *a2, ...)
{
  return _[a1 mediaAssets];
}

id objc_msgSend_mediaAssetsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 mediaAssetsAtIndex:];
}

id objc_msgSend_mediaAssetsCount(void *a1, const char *a2, ...)
{
  return _[a1 mediaAssetsCount];
}

id objc_msgSend_mediaFiles(void *a1, const char *a2, ...)
{
  return _[a1 mediaFiles];
}

id objc_msgSend_mediaServiceRequest(void *a1, const char *a2, ...)
{
  return _[a1 mediaServiceRequest];
}

id objc_msgSend_mediaServiceRequestClass(void *a1, const char *a2, ...)
{
  return _[a1 mediaServiceRequestClass];
}

id objc_msgSend_mediaServiceSession(void *a1, const char *a2, ...)
{
  return _[a1 mediaServiceSession];
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return _[a1 mediaURL];
}

id objc_msgSend_memoryCache(void *a1, const char *a2, ...)
{
  return _[a1 memoryCache];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return [a1 mergeFrom:];
}

id objc_msgSend_mescalSignature(void *a1, const char *a2, ...)
{
  return _[a1 mescalSignature];
}

id objc_msgSend_mescalSigningSettings(void *a1, const char *a2, ...)
{
  return _[a1 mescalSigningSettings];
}

id objc_msgSend_mescalStateChanged_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "mescalStateChanged:");
}

id objc_msgSend_mescalStateDelegates(void *a1, const char *a2, ...)
{
  return _[a1 mescalStateDelegates];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metadataForBundleContainerURL_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "metadataForBundleContainerURL:error:");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodSignatureForSelector:];
}

id objc_msgSend_metric(void *a1, const char *a2, ...)
{
  return _[a1 metric];
}

id objc_msgSend_metricAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 metricAtIndex:];
}

id objc_msgSend_metricClass(void *a1, const char *a2, ...)
{
  return _[a1 metricClass];
}

id objc_msgSend_metricIsDefined_(void *a1, const char *a2, ...)
{
  return [a1 metricIsDefined:];
}

id objc_msgSend_metricIsDiagnosticsAndUsage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "metricIsDiagnosticsAndUsage:");
}

id objc_msgSend_metricRetryManager(void *a1, const char *a2, ...)
{
  return _[a1 metricRetryManager];
}

id objc_msgSend_metricRoute(void *a1, const char *a2, ...)
{
  return _[a1 metricRoute];
}

id objc_msgSend_metricRouteForPurpose_(void *a1, const char *a2, ...)
{
  return [a1 metricRouteForPurpose:];
}

id objc_msgSend_metricsCount(void *a1, const char *a2, ...)
{
  return _[a1 metricsCount];
}

id objc_msgSend_metricsFileManager(void *a1, const char *a2, ...)
{
  return _[a1 metricsFileManager];
}

id objc_msgSend_metricsQueue(void *a1, const char *a2, ...)
{
  return _[a1 metricsQueue];
}

id objc_msgSend_minCount(void *a1, const char *a2, ...)
{
  return _[a1 minCount];
}

id objc_msgSend_minimumIntervalBetweenPresentations(void *a1, const char *a2, ...)
{
  return _[a1 minimumIntervalBetweenPresentations];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_mockAdServerUrl(void *a1, const char *a2, ...)
{
  return _[a1 mockAdServerUrl];
}

id objc_msgSend_mockRequestJson(void *a1, const char *a2, ...)
{
  return _[a1 mockRequestJson];
}

id objc_msgSend_mockResponseResultForPlacement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "mockResponseResultForPlacement:")];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return _[a1 monitor];
}

id objc_msgSend_monitorQueue(void *a1, const char *a2, ...)
{
  return _[a1 monitorQueue];
}

id objc_msgSend_monthDayInteger(void *a1, const char *a2, ...)
{
  return _[a1 monthDayInteger];
}

id objc_msgSend_monthlyIDResetCount(void *a1, const char *a2, ...)
{
  return _[a1 monthlyIDResetCount];
}

id objc_msgSend_moveExistingOpenFilesToClosed_closedPrefix_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveExistingOpenFilesToClosed:closedPrefix:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [a1 moveItemAtPath:toPath:error:];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableResults(void *a1, const char *a2, ...)
{
  return _[a1 mutableResults];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nativeMetadataAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 nativeMetadataAtIndex:];
}

id objc_msgSend_nativeMetadatas(void *a1, const char *a2, ...)
{
  return _[a1 nativeMetadatas];
}

id objc_msgSend_nativeMetadatasCount(void *a1, const char *a2, ...)
{
  return _[a1 nativeMetadatasCount];
}

id objc_msgSend_networkDataValid(void *a1, const char *a2, ...)
{
  return _[a1 networkDataValid];
}

id objc_msgSend_networkInfoUpdatingInProgress(void *a1, const char *a2, ...)
{
  return _[a1 networkInfoUpdatingInProgress];
}

id objc_msgSend_networkType(void *a1, const char *a2, ...)
{
  return _[a1 networkType];
}

id objc_msgSend_nextDateAfterDate_matchingComponents_options_(void *a1, const char *a2, ...)
{
  return [a1 nextDateAfterDate:x0 matchingComponents:x1 options:x2];
}

id objc_msgSend_nextIndex(void *a1, const char *a2, ...)
{
  return _[a1 nextIndex];
}

id objc_msgSend_nextMetric(void *a1, const char *a2, ...)
{
  return _[a1 nextMetric];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextObjectData(void *a1, const char *a2, ...)
{
  return _[a1 nextObjectData];
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return _[a1 notANumber];
}

id objc_msgSend_notificationRegistrar(void *a1, const char *a2, ...)
{
  return _[a1 notificationRegistrar];
}

id objc_msgSend_notificationRegistrarClass(void *a1, const char *a2, ...)
{
  return _[a1 notificationRegistrarClass];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return [a1 numberFromString:];
}

id objc_msgSend_numberOfDaysSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 numberOfDaysSinceDate:x0];
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRanges];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLong:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithShort:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numericParameterArrayToDictionary_(void *a1, const char *a2, ...)
{
  return [a1 numericParameterArrayToDictionary];
}

id objc_msgSend_o11y(void *a1, const char *a2, ...)
{
  return _[a1 o11y];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectClass(void *a1, const char *a2, ...)
{
  return _[a1 objectClass];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 objectForIdentifier:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKey_error_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:error];
}

id objc_msgSend_objectForKey_ignoreKeys_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:x0 ignoreKeys:x1];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectForPropertyListKey_error_(void *a1, const char *a2, ...)
{
  return [a1 objectForPropertyListKey:error:];
}

id objc_msgSend_objectIsLoaded_(void *a1, const char *a2, ...)
{
  return [a1 objectIsLoaded:];
}

id objc_msgSend_objectSize(void *a1, const char *a2, ...)
{
  return _[a1 objectSize];
}

id objc_msgSend_objectStoredAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 objectStoredAtPath:x0 error:x1];
}

id objc_msgSend_objectsIterator(void *a1, const char *a2, ...)
{
  return _[a1 objectsIterator];
}

id objc_msgSend_observeClientError_(void *a1, const char *a2, ...)
{
  return [a1 observeClientError:];
}

id objc_msgSend_observeClientTimeout(void *a1, const char *a2, ...)
{
  return _[a1 observeClientTimeout];
}

id objc_msgSend_observerServerResponse_(void *a1, const char *a2, ...)
{
  return [a1 observerServerResponse:];
}

id objc_msgSend_offsetAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 offsetAtIndex:];
}

id objc_msgSend_offsets(void *a1, const char *a2, ...)
{
  return _[a1 offsets];
}

id objc_msgSend_offsetsCount(void *a1, const char *a2, ...)
{
  return _[a1 offsetsCount];
}

id objc_msgSend_oldEncryptedIDs(void *a1, const char *a2, ...)
{
  return _[a1 oldEncryptedIDs];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _[a1 opacity];
}

id objc_msgSend_openStoragePathPrefix(void *a1, const char *a2, ...)
{
  return _[a1 openStoragePathPrefix];
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersionString];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _[a1 operationQueue];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_operator(void *a1, const char *a2, ...)
{
  return _[a1 operator];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return _[a1 order];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return [a1 orderedSetWithArray:];
}

id objc_msgSend_ordinalityOfUnit_inUnit_forDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "ordinalityOfUnit:inUnit:forDate:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_originalContext(void *a1, const char *a2, ...)
{
  return _[a1 originalContext];
}

id objc_msgSend_osBuild(void *a1, const char *a2, ...)
{
  return _[a1 osBuild];
}

id objc_msgSend_osIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 osIdentifier];
}

id objc_msgSend_osPlatform(void *a1, const char *a2, ...)
{
  return _[a1 osPlatform];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _[a1 osVersion];
}

id objc_msgSend_osVersionAndBuild(void *a1, const char *a2, ...)
{
  return _[a1 osVersionAndBuild];
}

id objc_msgSend_osVersionOverride(void *a1, const char *a2, ...)
{
  return _[a1 osVersionOverride];
}

id objc_msgSend_parameterArrayToDictionary_(void *a1, const char *a2, ...)
{
  return [a1 parameterArrayToDictionary:];
}

id objc_msgSend_parameterArrayToDictionaryForMetadata_(void *a1, const char *a2, ...)
{
  return [a1 parameterArrayToDictionaryForMetadata:];
}

id objc_msgSend_parameterListAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 parameterListAtIndex:];
}

id objc_msgSend_parameterListsCount(void *a1, const char *a2, ...)
{
  return _[a1 parameterListsCount];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parametersAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 parametersAtIndex:];
}

id objc_msgSend_parametersCount(void *a1, const char *a2, ...)
{
  return _[a1 parametersCount];
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return _[a1 params];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _[a1 parent];
}

id objc_msgSend_pastDueReportDates(void *a1, const char *a2, ...)
{
  return _[a1 pastDueReportDates];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForName_(void *a1, const char *a2, ...)
{
  return [a1 pathForName:];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return [a1 pathWithComponents:];
}

id objc_msgSend_pathsToExpiredBatchesWithFileManager_closedPathPrefix_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "pathsToExpiredBatchesWithFileManager:closedPathPrefix:")
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_payloadForRequestBodyABCLog(void *a1, const char *a2, ...)
{
  return _[a1 payloadForRequestBodyABCLog];
}

id objc_msgSend_payloadForRequestHeaderABCLog(void *a1, const char *a2, ...)
{
  return _[a1 payloadForRequestHeaderABCLog];
}

id objc_msgSend_paymentCapabilitiesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 paymentCapabilitiesAtIndex:];
}

id objc_msgSend_paymentCapabilitiesCount(void *a1, const char *a2, ...)
{
  return _[a1 paymentCapabilitiesCount];
}

id objc_msgSend_pendingConfirmedClick(void *a1, const char *a2, ...)
{
  return _[a1 pendingConfirmedClick];
}

id objc_msgSend_pendingConfirmedClick_(void *a1, const char *a2, ...)
{
  return [a1 pendingConfirmedClick:];
}

id objc_msgSend_pendingDelayedRequests(void *a1, const char *a2, ...)
{
  return _[a1 pendingDelayedRequests];
}

id objc_msgSend_pendingRequestsForContent_filterPredicate_(void *a1, const char *a2, ...)
{
  return [a1 pendingRequestsForContent:x0 filterPredicate:x1];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_periodicDelay(void *a1, const char *a2, ...)
{
  return _[a1 periodicDelay];
}

id objc_msgSend_periodicDelayTimeInterval(void *a1, const char *a2, ...)
{
  return _[a1 periodicDelayTimeInterval];
}

id objc_msgSend_persist_(void *a1, const char *a2, ...)
{
  return [a1 persist:];
}

id objc_msgSend_persistentCacheStore(void *a1, const char *a2, ...)
{
  return _[a1 persistentCacheStore];
}

id objc_msgSend_persistentStore(void *a1, const char *a2, ...)
{
  return _[a1 persistentStore];
}

id objc_msgSend_personalizedAds(void *a1, const char *a2, ...)
{
  return _[a1 personalizedAds];
}

id objc_msgSend_personalizedAdsAcknowledged(void *a1, const char *a2, ...)
{
  return _[a1 personalizedAdsAcknowledged];
}

id objc_msgSend_personalizedAdsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 personalizedAdsEnabled];
}

id objc_msgSend_placement(void *a1, const char *a2, ...)
{
  return _[a1 placement];
}

id objc_msgSend_placementDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 placementDescriptor];
}

id objc_msgSend_placementType(void *a1, const char *a2, ...)
{
  return _[a1 placementType];
}

id objc_msgSend_placementTypeToCreativeType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "placementTypeToCreativeType:");
}

id objc_msgSend_placementTypes(void *a1, const char *a2, ...)
{
  return _[a1 placementTypes];
}

id objc_msgSend_playbackInProgress(void *a1, const char *a2, ...)
{
  return _[a1 playbackInProgress];
}

id objc_msgSend_playbackTime(void *a1, const char *a2, ...)
{
  return _[a1 playbackTime];
}

id objc_msgSend_policiesForContainerType_adType_adFormatType_(void *a1, const char *a2, ...)
{
  return [a1 policiesForContainerType:adType:adFormatType:];
}

id objc_msgSend_policiesToEnforce(void *a1, const char *a2, ...)
{
  return _[a1 policiesToEnforce];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return _[a1 policy];
}

id objc_msgSend_policyData(void *a1, const char *a2, ...)
{
  return _[a1 policyData];
}

id objc_msgSend_policySettings(void *a1, const char *a2, ...)
{
  return _[a1 policySettings];
}

id objc_msgSend_policySettingsURL(void *a1, const char *a2, ...)
{
  return _[a1 policySettingsURL];
}

id objc_msgSend_policyType(void *a1, const char *a2, ...)
{
  return _[a1 policyType];
}

id objc_msgSend_policyValue(void *a1, const char *a2, ...)
{
  return _[a1 policyValue];
}

id objc_msgSend_policyValues(void *a1, const char *a2, ...)
{
  return _[a1 policyValues];
}

id objc_msgSend_policyValuesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 policyValuesAtIndex:];
}

id objc_msgSend_policyValuesCount(void *a1, const char *a2, ...)
{
  return _[a1 policyValuesCount];
}

id objc_msgSend_poll(void *a1, const char *a2, ...)
{
  return _[a1 poll];
}

id objc_msgSend_positionInformation(void *a1, const char *a2, ...)
{
  return _[a1 positionInformation];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return _[a1 postalCode];
}

id objc_msgSend_predefined(void *a1, const char *a2, ...)
{
  return _[a1 predefined];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_prefetchTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 prefetchTimestamp];
}

id objc_msgSend_prepareDelivery(void *a1, const char *a2, ...)
{
  return _[a1 prepareDelivery];
}

id objc_msgSend_preparedDataPathForDestination_purpose_containsSignature_(void *a1, const char *a2, ...)
{
  return [a1 preparedDataPathForDestination:x0 purpose:x1 containsSignature:x2];
}

id objc_msgSend_preparedDataServerDelivery(void *a1, const char *a2, ...)
{
  return _[a1 preparedDataServerDelivery];
}

id objc_msgSend_preparedMetricDataForDestination_purpose_containsSignature_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "preparedMetricDataForDestination:purpose:containsSignature:");
}

id objc_msgSend_preparedUnsignedDataProcessor(void *a1, const char *a2, ...)
{
  return _[a1 preparedUnsignedDataProcessor];
}

id objc_msgSend_prettyPrintJson(void *a1, const char *a2, ...)
{
  return _[a1 prettyPrintJson];
}

id objc_msgSend_prettyPrintJsonValue(void *a1, const char *a2, ...)
{
  return _[a1 prettyPrintJsonValue];
}

id objc_msgSend_privateContent(void *a1, const char *a2, ...)
{
  return _[a1 privateContent];
}

id objc_msgSend_privateDataDidChange(void *a1, const char *a2, ...)
{
  return _[a1 privateDataDidChange];
}

id objc_msgSend_privateSegment(void *a1, const char *a2, ...)
{
  return _[a1 privateSegment];
}

id objc_msgSend_privateUserAccount(void *a1, const char *a2, ...)
{
  return _[a1 privateUserAccount];
}

id objc_msgSend_processAdPolicyData(void *a1, const char *a2, ...)
{
  return _[a1 processAdPolicyData];
}

id objc_msgSend_processErrorsForContentDataItems_error_contextFingerprint_params_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processErrorsForContentDataItems:error:contextFingerprint:params:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processMetric_environmentProvider_(void *a1, const char *a2, ...)
{
  return [a1 processMetric:environmentProvider:];
}

id objc_msgSend_processMetrics_forChannel_(void *a1, const char *a2, ...)
{
  return [a1 processMetrics:forChannel:];
}

id objc_msgSend_processServerDeliveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 processServerDeliveryTimer];
}

id objc_msgSend_processWithFPDISigningAuthorityPoolManager_(void *a1, const char *a2, ...)
{
  return [a1 processWithFPDISigningAuthorityPoolManager:];
}

id objc_msgSend_processWithMescal(void *a1, const char *a2, ...)
{
  return _[a1 processWithMescal];
}

id objc_msgSend_processingDestinations(void *a1, const char *a2, ...)
{
  return _[a1 processingDestinations];
}

id objc_msgSend_processingDestinationsLock(void *a1, const char *a2, ...)
{
  return _[a1 processingDestinationsLock];
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return _[a1 processor];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protectedDestination(void *a1, const char *a2, ...)
{
  return _[a1 protectedDestination];
}

id objc_msgSend_protectedEventChannel(void *a1, const char *a2, ...)
{
  return _[a1 protectedEventChannel];
}

id objc_msgSend_protoBuffer(void *a1, const char *a2, ...)
{
  return _[a1 protoBuffer];
}

id objc_msgSend_protocolHandler(void *a1, const char *a2, ...)
{
  return _[a1 protocolHandler];
}

id objc_msgSend_provideIgnorableKeyNamesBlock(void *a1, const char *a2, ...)
{
  return _[a1 provideIgnorableKeyNamesBlock];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return _[a1 proxy];
}

id objc_msgSend_proxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 proxyForIdentifier:];
}

id objc_msgSend_proxyObject(void *a1, const char *a2, ...)
{
  return _[a1 proxyObject];
}

id objc_msgSend_proxyWithCacheKey_object_identifier_inPersistentStore_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "proxyWithCacheKey:object:identifier:inPersistentStore:");
}

id objc_msgSend_proxyWithCacheKey_object_inPersistentStore_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "proxyWithCacheKey:object:inPersistentStore:")
}

id objc_msgSend_pruner(void *a1, const char *a2, ...)
{
  return _[a1 pruner];
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 publisherWithOptions:];
}

id objc_msgSend_purchaseDate(void *a1, const char *a2, ...)
{
  return _[a1 purchaseDate];
}

id objc_msgSend_purchaseTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 purchaseTimestamp];
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return _[a1 purpose];
}

id objc_msgSend_purposeClass(void *a1, const char *a2, ...)
{
  return _[a1 purposeClass];
}

id objc_msgSend_purposeConfig_(void *a1, const char *a2, ...)
{
  return [a1 purposeConfig:];
}

id objc_msgSend_qToken(void *a1, const char *a2, ...)
{
  return _[a1 qToken];
}

id objc_msgSend_queryCacheForRequests_managedContext_(void *a1, const char *a2, ...)
{
  return [a1 queryCacheForRequests:managedContext:];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueRawSignatureRequest_waitTime_completion_(void *a1, const char *a2, ...)
{
  return [a1 queueRawSignatureRequest:waitTime:completion:];
}

id objc_msgSend_queueSignatureRequest_waitTime_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "queueSignatureRequest:waitTime:completion:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rangeAtIndex:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_rank(void *a1, const char *a2, ...)
{
  return _[a1 rank];
}

id objc_msgSend_rankRepresentations_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "rankRepresentations:completionHandler:")];
}

id objc_msgSend_rateLimitLock(void *a1, const char *a2, ...)
{
  return _[a1 rateLimitLock];
}

id objc_msgSend_rateLimits(void *a1, const char *a2, ...)
{
  return _[a1 rateLimits];
}

id objc_msgSend_rateLimitsLastUpdatedOn(void *a1, const char *a2, ...)
{
  return _[a1 rateLimitsLastUpdatedOn];
}

id objc_msgSend_rateLimitsObject(void *a1, const char *a2, ...)
{
  return _[a1 rateLimitsObject];
}

id objc_msgSend_rawSignatureForData_error_(void *a1, const char *a2, ...)
{
  return [a1 rawSignatureForData:error:];
}

id objc_msgSend_rawSignatureForData_waitTime_completion_(void *a1, const char *a2, ...)
{
  return [a1 rawSignatureForData:x0 waitTime:x1 completion:x2];
}

id objc_msgSend_reachability(void *a1, const char *a2, ...)
{
  return _[a1 reachability];
}

id objc_msgSend_reachabilityChanged_(void *a1, const char *a2, ...)
{
  return [a1 reachabilityChanged:];
}

id objc_msgSend_readDataFromFile_error_(void *a1, const char *a2, ...)
{
  return [a1 readDataFromFile:x0 error:x1];
}

id objc_msgSend_readFrom_(void *a1, const char *a2, ...)
{
  return [a1 readFrom:];
}

id objc_msgSend_readMessageType_fromString_(void *a1, const char *a2, ...)
{
  return [a1 readMessageType:fromString:];
}

id objc_msgSend_receivedContentDataItems(void *a1, const char *a2, ...)
{
  return _[a1 receivedContentDataItems];
}

id objc_msgSend_receivedForBundleID_adServer_elapsedTime_relayValues_internalProperties_(void *a1, const char *a2, ...)
{
  return [a1 receivedForBundleID:adServer:elapsedTime:relayValues:internalProperties:];
}

id objc_msgSend_receivedForBundleID_elapsedTime_relayValues_internalProperties_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "receivedForBundleID:elapsedTime:relayValues:internalProperties:");
}

id objc_msgSend_receivedMetric_(void *a1, const char *a2, ...)
{
  return [a1 receivedMetric:];
}

id objc_msgSend_recordCount(void *a1, const char *a2, ...)
{
  return _[a1 recordCount];
}

id objc_msgSend_recordFailure(void *a1, const char *a2, ...)
{
  return _[a1 recordFailure];
}

id objc_msgSend_recordFailure_(void *a1, const char *a2, ...)
{
  return [a1 recordFailure:];
}

id objc_msgSend_recordMetric_forPurpose_bundleID_handleOverride_properties_internalProperties_relayData_order_options_(void *a1, const char *a2, ...)
{
  return [a1 recordMetric:x0 forPurpose:x1 bundleID:x2 handleOverride:x3 properties:x4 internalProperties:x5 relayData:x6 order:x7 options:x8];
}

id objc_msgSend_recordMetric_forPurpose_properties_internalProperties_order_options_(void *a1, const char *a2, ...)
{
  return [a1 recordMetric:x0 forPurpose:x1 properties:x2 internalProperties:x3 order:x4 options:x5];
}

id objc_msgSend_recordSuccess(void *a1, const char *a2, ...)
{
  return _[a1 recordSuccess];
}

id objc_msgSend_referenceCache(void *a1, const char *a2, ...)
{
  return _[a1 referenceCache];
}

id objc_msgSend_referenceFromIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 referenceFromIdentifier:x0 error:x1];
}

id objc_msgSend_registerAdaptorClass_(void *a1, const char *a2, ...)
{
  return [a1 registerAdaptorClass:];
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerForTaskWithIdentifier:usingQueue:launchHandler:];
}

id objc_msgSend_registerHandlerForExternalPurposesAndAllMetricsWithClosure_(void *a1, const char *a2, ...)
{
  return [a1 registerHandlerForExternalPurposesAndAllMetricsWithClosure:];
}

id objc_msgSend_registerHandlerForPurpose_andMetric_closure_(void *a1, const char *a2, ...)
{
  return [a1 registerHandlerForPurpose:andMetric:closure:];
}

id objc_msgSend_registerHandlerForPurpose_closure_(void *a1, const char *a2, ...)
{
  return [a1 registerHandlerForPurpose:x0 closure:x1];
}

id objc_msgSend_registerMetricRequest_(void *a1, const char *a2, ...)
{
  return [a1 registerMetricRequest:];
}

id objc_msgSend_registerTask(void *a1, const char *a2, ...)
{
  return _[a1 registerTask];
}

id objc_msgSend_registeredAdaptors(void *a1, const char *a2, ...)
{
  return _[a1 registeredAdaptors];
}

id objc_msgSend_registrationTokens(void *a1, const char *a2, ...)
{
  return _[a1 registrationTokens];
}

id objc_msgSend_relayData(void *a1, const char *a2, ...)
{
  return _[a1 relayData];
}

id objc_msgSend_relevantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 relevantIdentifier];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removalBlock(void *a1, const char *a2, ...)
{
  return _[a1 removalBlock];
}

id objc_msgSend_remove_(void *a1, const char *a2, ...)
{
  return [a1 remove:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAssociatedObject_(void *a1, const char *a2, ...)
{
  return [a1 removeAssociatedObject:];
}

id objc_msgSend_removeBatchByFileSystemToken_(void *a1, const char *a2, ...)
{
  return [a1 removeBatchByFileSystemToken:];
}

id objc_msgSend_removeDataAfterDays(void *a1, const char *a2, ...)
{
  return _[a1 removeDataAfterDays];
}

id objc_msgSend_removeDelayedRequest_cancel_(void *a1, const char *a2, ...)
{
  return [a1 removeDelayedRequest:cancel:];
}

id objc_msgSend_removeEntriesForContentIds_(void *a1, const char *a2, ...)
{
  return [a1 removeEntriesForContentIds:];
}

id objc_msgSend_removeExpiredBatchesFromClosedPrefix_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeExpiredBatchesFromClosedPrefix:");
}

id objc_msgSend_removeFile_error_(void *a1, const char *a2, ...)
{
  return [a1 removeFile:error:];
}

id objc_msgSend_removeHandlerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeHandlerWithIdentifier:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeManagedContentDataForId_(void *a1, const char *a2, ...)
{
  return [a1 removeManagedContentDataForId:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeObjectAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectForKey_transaction_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeObjectForKey:transaction:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeWaitingForNetworkDateDirectory(void *a1, const char *a2, ...)
{
  return _[a1 removeWaitingForNetworkDateDirectory];
}

id objc_msgSend_replaceExisting(void *a1, const char *a2, ...)
{
  return _[a1 replaceExisting];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectAtIndex:withObject:];
}

id objc_msgSend_reportDate(void *a1, const char *a2, ...)
{
  return _[a1 reportDate];
}

id objc_msgSend_reportDayMinus_(void *a1, const char *a2, ...)
{
  return [a1 reportDayMinus:];
}

id objc_msgSend_reportDayString(void *a1, const char *a2, ...)
{
  return _[a1 reportDayString];
}

id objc_msgSend_reportEndDay(void *a1, const char *a2, ...)
{
  return _[a1 reportEndDay];
}

id objc_msgSend_reportEventCount(void *a1, const char *a2, ...)
{
  return _[a1 reportEventCount];
}

id objc_msgSend_reportFrequency(void *a1, const char *a2, ...)
{
  return _[a1 reportFrequency];
}

id objc_msgSend_reportFrequencyStringKey(void *a1, const char *a2, ...)
{
  return _[a1 reportFrequencyStringKey];
}

id objc_msgSend_reportType(void *a1, const char *a2, ...)
{
  return _[a1 reportType];
}

id objc_msgSend_reportingFrequency(void *a1, const char *a2, ...)
{
  return _[a1 reportingFrequency];
}

id objc_msgSend_reportingPurposes(void *a1, const char *a2, ...)
{
  return _[a1 reportingPurposes];
}

id objc_msgSend_reportingStorefront(void *a1, const char *a2, ...)
{
  return _[a1 reportingStorefront];
}

id objc_msgSend_representationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 representationWithIdentifier:];
}

id objc_msgSend_representations(void *a1, const char *a2, ...)
{
  return _[a1 representations];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestAds_(void *a1, const char *a2, ...)
{
  return [a1 requestAds:];
}

id objc_msgSend_requestBody(void *a1, const char *a2, ...)
{
  return _[a1 requestBody];
}

id objc_msgSend_requestByEncodingRequest_parameters_(void *a1, const char *a2, ...)
{
  return [a1 requestByEncodingRequest:x0 parameters:x1];
}

id objc_msgSend_requestCertificate(void *a1, const char *a2, ...)
{
  return _[a1 requestCertificate];
}

id objc_msgSend_requestCertificateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 requestCertificateWithCompletion:];
}

id objc_msgSend_requestConfigurationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestConfigurationWithCompletionHandler:];
}

id objc_msgSend_requestFailedForBundleID_withCode_requestID_placement_placementType_(void *a1, const char *a2, ...)
{
  return [a1 requestFailedForBundleID:withCode:requestID:placement:placementType:];
}

id objc_msgSend_requestFromLegacyInterfaceForPromotedContents_context_withToken_andBundleID_clientInfo_idAccount_deliverEntireBatch_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestFromLegacyInterfaceForPromotedContents:x0 context:x1 withToken:x2 andBundleID:x3 clientInfo:x4 idAccount:x5 deliverEntireBatch:x6 completionHandler:x7];
}

id objc_msgSend_requestFromRequestID_(void *a1, const char *a2, ...)
{
  return [a1 requestFromRequestID:];
}

id objc_msgSend_requestHeader(void *a1, const char *a2, ...)
{
  return _[a1 requestHeader];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _[a1 requestID];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_requestMescalSetupForData_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestMescalSetupForData:x0 completionHandler:x1];
}

id objc_msgSend_requestParameters(void *a1, const char *a2, ...)
{
  return _[a1 requestParameters];
}

id objc_msgSend_requestPromotedContentOfTypes_forContext_withToken_andBundleID_clientInfo_idAccount_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "requestPromotedContentOfTypes:forContext:withToken:andBundleID:clientInfo:idAccount:completionHandler:");
}

id objc_msgSend_requestProperties(void *a1, const char *a2, ...)
{
  return _[a1 requestProperties];
}

id objc_msgSend_requestQueue(void *a1, const char *a2, ...)
{
  return _[a1 requestQueue];
}

id objc_msgSend_requestTime(void *a1, const char *a2, ...)
{
  return _[a1 requestTime];
}

id objc_msgSend_requestTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 requestTimestamp];
}

id objc_msgSend_requestWillSend_headers_request_(void *a1, const char *a2, ...)
{
  return [a1 requestWillSend:headers:request:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_requestedAdIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestedAdIdentifier];
}

id objc_msgSend_requester(void *a1, const char *a2, ...)
{
  return _[a1 requester];
}

id objc_msgSend_requesters(void *a1, const char *a2, ...)
{
  return _[a1 requesters];
}

id objc_msgSend_requestersAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 requestersAtIndex:];
}

id objc_msgSend_requestersCount(void *a1, const char *a2, ...)
{
  return _[a1 requestersCount];
}

id objc_msgSend_requestsWhileInitializing(void *a1, const char *a2, ...)
{
  return _[a1 requestsWhileInitializing];
}

id objc_msgSend_requiredTagsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 requiredTagsAtIndex:];
}

id objc_msgSend_requiredTagsCount(void *a1, const char *a2, ...)
{
  return _[a1 requiredTagsCount];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetConfigurationSystem(void *a1, const char *a2, ...)
{
  return _[a1 resetConfigurationSystem];
}

id objc_msgSend_resetRouteOffsets(void *a1, const char *a2, ...)
{
  return _[a1 resetRouteOffsets];
}

id objc_msgSend_resetTimer(void *a1, const char *a2, ...)
{
  return _[a1 resetTimer];
}

id objc_msgSend_resourceCacheEntriesAtIndex_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "resourceCacheEntriesAtIndex:");
}

id objc_msgSend_resourceCacheEntriesCount(void *a1, const char *a2, ...)
{
  return _[a1 resourceCacheEntriesCount];
}

id objc_msgSend_resourceConnectProxyURL(void *a1, const char *a2, ...)
{
  return _[a1 resourceConnectProxyURL];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseBody(void *a1, const char *a2, ...)
{
  return _[a1 responseBody];
}

id objc_msgSend_responseClass(void *a1, const char *a2, ...)
{
  return _[a1 responseClass];
}

id objc_msgSend_responseError(void *a1, const char *a2, ...)
{
  return _[a1 responseError];
}

id objc_msgSend_responseHeaders(void *a1, const char *a2, ...)
{
  return _[a1 responseHeaders];
}

id objc_msgSend_responseJson(void *a1, const char *a2, ...)
{
  return _[a1 responseJson];
}

id objc_msgSend_responseReceived_responseProtobuf_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "responseReceived:responseProtobuf:error:");
}

id objc_msgSend_responseResult(void *a1, const char *a2, ...)
{
  return _[a1 responseResult];
}

id objc_msgSend_responseStatusCode(void *a1, const char *a2, ...)
{
  return _[a1 responseStatusCode];
}

id objc_msgSend_responseTTL(void *a1, const char *a2, ...)
{
  return _[a1 responseTTL];
}

id objc_msgSend_responseTime(void *a1, const char *a2, ...)
{
  return _[a1 responseTime];
}

id objc_msgSend_restoreCapDataArrayFromPlist_(void *a1, const char *a2, ...)
{
  return [a1 restoreCapDataArrayFromPlist:];
}

id objc_msgSend_resultForResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "resultForResponse:error:");
}

id objc_msgSend_resultTagsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 resultTagsAtIndex:];
}

id objc_msgSend_resultTagsCount(void *a1, const char *a2, ...)
{
  return _[a1 resultTagsCount];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveTimeSpentEntriesOlderThan_(void *a1, const char *a2, ...)
{
  return [a1 retrieveTimeSpentEntriesOlderThan:];
}

id objc_msgSend_retrieveTimeSpentTTLConfigValue(void *a1, const char *a2, ...)
{
  return _[a1 retrieveTimeSpentTTLConfigValue];
}

id objc_msgSend_retryManager(void *a1, const char *a2, ...)
{
  return _[a1 retryManager];
}

id objc_msgSend_retrySetup(void *a1, const char *a2, ...)
{
  return _[a1 retrySetup];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rewardTokensAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rewardTokensAtIndex:];
}

id objc_msgSend_rewardTokensCount(void *a1, const char *a2, ...)
{
  return _[a1 rewardTokensCount];
}

id objc_msgSend_rollBack(void *a1, const char *a2, ...)
{
  return _[a1 rollBack];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return _[a1 rootNode];
}

id objc_msgSend_rotateIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 rotateIdentifiers];
}

id objc_msgSend_rotateWithError_(void *a1, const char *a2, ...)
{
  return [a1 rotateWithError:];
}

id objc_msgSend_roundedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 roundedTimestamp];
}

id objc_msgSend_rowid(void *a1, const char *a2, ...)
{
  return _[a1 rowid];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runWithParameters_handler_(void *a1, const char *a2, ...)
{
  return [a1 runWithParameters:x0 handler:x1];
}

id objc_msgSend_runWithParameters_mediaServiceSession_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "runWithParameters:mediaServiceSession:completionHandler:");
}

id objc_msgSend_runWithParametersSync_handler_(void *a1, const char *a2, ...)
{
  return [a1 runWithParametersSync:x0 handler:x1];
}

id objc_msgSend_sampleEvent_(void *a1, const char *a2, ...)
{
  return [a1 sampleEvent:];
}

id objc_msgSend_samplePercentage(void *a1, const char *a2, ...)
{
  return _[a1 samplePercentage];
}

id objc_msgSend_samplePeriod(void *a1, const char *a2, ...)
{
  return _[a1 samplePeriod];
}

id objc_msgSend_sampleSessionStartTimeFromPurpose_purpose_(void *a1, const char *a2, ...)
{
  return [a1 sampleSessionStartTimeFromPurpose:purpose:];
}

id objc_msgSend_sampler(void *a1, const char *a2, ...)
{
  return _[a1 sampler];
}

id objc_msgSend_samplingSettings(void *a1, const char *a2, ...)
{
  return _[a1 samplingSettings];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return _[a1 save];
}

id objc_msgSend_savedPolicies(void *a1, const char *a2, ...)
{
  return _[a1 savedPolicies];
}

id objc_msgSend_scalarMetricsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 scalarMetricsAtIndex:];
}

id objc_msgSend_scalarMetricsCount(void *a1, const char *a2, ...)
{
  return _[a1 scalarMetricsCount];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return [a1 scanInt:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _[a1 schedule];
}

id objc_msgSend_scheduleNextLevelWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 scheduleNextLevelWithQueue:];
}

id objc_msgSend_scheduledDate(void *a1, const char *a2, ...)
{
  return _[a1 scheduledDate];
}

id objc_msgSend_screenHeight(void *a1, const char *a2, ...)
{
  return _[a1 screenHeight];
}

id objc_msgSend_screenSaverImageURLAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 screenSaverImageURLAtIndex:];
}

id objc_msgSend_screenSaverImageURLsCount(void *a1, const char *a2, ...)
{
  return _[a1 screenSaverImageURLsCount];
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return _[a1 screenSize];
}

id objc_msgSend_screenWidth(void *a1, const char *a2, ...)
{
  return _[a1 screenWidth];
}

id objc_msgSend_searchAdClickTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 searchAdClickTimestamp];
}

id objc_msgSend_searchTerms(void *a1, const char *a2, ...)
{
  return _[a1 searchTerms];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _[a1 secondsFromGMT];
}

id objc_msgSend_secureFile(void *a1, const char *a2, ...)
{
  return _[a1 secureFile];
}

id objc_msgSend_secureFileManager(void *a1, const char *a2, ...)
{
  return _[a1 secureFileManager];
}

id objc_msgSend_segmentData(void *a1, const char *a2, ...)
{
  return _[a1 segmentData];
}

id objc_msgSend_segmentIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 segmentIdentifiers];
}

id objc_msgSend_segmentIdentifiersAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 segmentIdentifiersAtIndex:];
}

id objc_msgSend_segmentIdentifiersCount(void *a1, const char *a2, ...)
{
  return _[a1 segmentIdentifiersCount];
}

id objc_msgSend_selectRandomSigningService(void *a1, const char *a2, ...)
{
  return _[a1 selectRandomSigningService];
}

id objc_msgSend_selectedCreativeSize(void *a1, const char *a2, ...)
{
  return _[a1 selectedCreativeSize];
}

id objc_msgSend_selectorWithAttributionConfig(void *a1, const char *a2, ...)
{
  return _[a1 selectorWithAttributionConfig];
}

id objc_msgSend_send_(void *a1, const char *a2, ...)
{
  return [a1 send];
}

id objc_msgSend_send_ofType_withMetadata_forIDs_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "send:ofType:withMetadata:forIDs:");
}

id objc_msgSend_send_withMetadata_forIDs_(void *a1, const char *a2, ...)
{
  return [a1 send:withMetadata:forIDs:];
}

id objc_msgSend_sendAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sendAnalytics];
}

id objc_msgSend_sendAnalyticsForGettingAdResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendAnalyticsForGettingAdResponse:");
}

id objc_msgSend_sendAnalyticsForMakingRequest(void *a1, const char *a2, ...)
{
  return _[a1 sendAnalyticsForMakingRequest];
}

id objc_msgSend_sendDeliveryEventWithError_successCount_backoffIndex_(void *a1, const char *a2, ...)
{
  return [a1 sendDeliveryEventWithError:nil successCount:0 backoffIndex:0];
}

id objc_msgSend_sendDiagnosticReport_context_isUserChanged_(void *a1, const char *a2, ...)
{
  return [a1 sendDiagnosticReport:x0 context:x1 isUserChanged:x2];
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:];
}

id objc_msgSend_sendEvent_customPayload_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:customPayload:];
}

id objc_msgSend_sendEvent_statusDetail_startDate_error_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:statusDetail:startDate:error:];
}

id objc_msgSend_sendHTTPDeliveryRequest_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendHTTPDeliveryRequest:error:");
}

id objc_msgSend_sendLegacyMetric_(void *a1, const char *a2, ...)
{
  return [a1 sendLegacyMetric];
}

id objc_msgSend_sendLegacyMetricWithDelay_legacyMetric_requestSentHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendLegacyMetricWithDelay:x0 legacyMetric:x1 requestSentHandler:x2];
}

id objc_msgSend_sendPayload_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendPayload:error:");
}

id objc_msgSend_sendRequest_params_mediaServiceSession_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendRequest:params:mediaServiceSession:completionHandler:");
}

id objc_msgSend_sendRequestToServer_requestTimestamp_payloadDeliveryTimestamp_interval_error_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestToServer:x0 requestTimestamp:x1 payloadDeliveryTimestamp:x2 interval:x3 error:x4 completionHandler:x5];
}

id objc_msgSend_sendTimeSpentMetric(void *a1, const char *a2, ...)
{
  return _[a1 sendTimeSpentMetric];
}

id objc_msgSend_sendTimeSpentMetricFor_contentId_contextId_adDataResponseIdentifier_batchId_impressionIdentifierData_timeSpent_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend a1 sendTimeSpentMetricFor:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:completionHandler:];
}

id objc_msgSend_sendTimedAnalytic_fieldName_startDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 sendTimedAnalytic:fieldName:startDate:endDate:];
}

id objc_msgSend_sendTimedAnalytic_fieldName_startDate_endDate_additionalFields_(void *a1, const char *a2, ...)
{
  return [a1 sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:];
}

id objc_msgSend_sendTimingAnalytics_startDate_endDate_additionalFields_(void *a1, const char *a2, ...)
{
  return [a1 sendTimingAnalytics:startDate:endDate:additionalFields:];
}

id objc_msgSend_sendTokenAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sendTokenAnalytics];
}

id objc_msgSend_sendTokenDuplicateAnalytics_(void *a1, const char *a2, ...)
{
  return [a1 sendTokenDuplicateAnalytics];
}

id objc_msgSend_sensitiveContentEligible(void *a1, const char *a2, ...)
{
  return _[a1 sensitiveContentEligible];
}

id objc_msgSend_sentStatusCodes(void *a1, const char *a2, ...)
{
  return _[a1 sentStatusCodes];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 sequenceNumber];
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return _[a1 serialize];
}

id objc_msgSend_serializeProtobuffer_(void *a1, const char *a2, ...)
{
  return [a1 serializeProtobuffer:];
}

id objc_msgSend_serveProductionAds(void *a1, const char *a2, ...)
{
  return _[a1 serveProductionAds];
}

id objc_msgSend_serverConfig(void *a1, const char *a2, ...)
{
  return _[a1 serverConfig];
}

id objc_msgSend_serverConfigRecord(void *a1, const char *a2, ...)
{
  return _[a1 serverConfigRecord];
}

id objc_msgSend_serverDelivery(void *a1, const char *a2, ...)
{
  return _[a1 serverDelivery];
}

id objc_msgSend_serverDeliveryClass(void *a1, const char *a2, ...)
{
  return _[a1 serverDeliveryClass];
}

id objc_msgSend_serverDeliveryLock(void *a1, const char *a2, ...)
{
  return _[a1 serverDeliveryLock];
}

id objc_msgSend_serverDeliveryQueue(void *a1, const char *a2, ...)
{
  return _[a1 serverDeliveryQueue];
}

id objc_msgSend_serverDeliveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 serverDeliveryTimer];
}

id objc_msgSend_serverDeliveryTimerWasRunningWhenPaused(void *a1, const char *a2, ...)
{
  return _[a1 serverDeliveryTimerWasRunningWhenPaused];
}

id objc_msgSend_serverDictionaryRepresentationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 serverDictionaryRepresentationWithBlock:];
}

id objc_msgSend_serverEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 serverEnvironment];
}

id objc_msgSend_serverRequest(void *a1, const char *a2, ...)
{
  return _[a1 serverRequest];
}

id objc_msgSend_serverSettings(void *a1, const char *a2, ...)
{
  return _[a1 serverSettings];
}

id objc_msgSend_serverURLForMessageID_andBundleID_(void *a1, const char *a2, ...)
{
  return [a1 serverURLForMessageID:andBundleID:];
}

id objc_msgSend_serverUnfilledReason(void *a1, const char *a2, ...)
{
  return _[a1 serverUnfilledReason];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setATVTunerImageURL_(void *a1, const char *a2, ...)
{
  return [a1 setATVTunerImageURL:];
}

id objc_msgSend_setAccessAdCopy_(void *a1, const char *a2, ...)
{
  return [a1 setAccessAdCopy:];
}

id objc_msgSend_setAccessCaption_(void *a1, const char *a2, ...)
{
  return [a1 setAccessCaption:];
}

id objc_msgSend_setAccessHeadline_(void *a1, const char *a2, ...)
{
  return [a1 setAccessHeadline:];
}

id objc_msgSend_setAccessText_(void *a1, const char *a2, ...)
{
  return [a1 setAccessText:];
}

id objc_msgSend_setAccessibilityDescription_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityDescription:];
}

id objc_msgSend_setAccessibleAdCopy_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibleAdCopy:];
}

id objc_msgSend_setAccessibleCaption_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibleCaption:];
}

id objc_msgSend_setAccessibleHeadline_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibleHeadline:];
}

id objc_msgSend_setAccessibleText_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibleText:];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return [a1 setAccount:];
}

id objc_msgSend_setAccountType_(void *a1, const char *a2, ...)
{
  return [a1 setAccountType:];
}

id objc_msgSend_setAccumulated50PercentVisibilityTime_(void *a1, const char *a2, ...)
{
  return [a1 setAccumulated50PercentVisibilityTime:];
}

id objc_msgSend_setAccumulatedPlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 setAccumulatedPlaybackTime:];
}

id objc_msgSend_setAccumulatedVisibilityTime_(void *a1, const char *a2, ...)
{
  return [a1 setAccumulatedVisibilityTime:];
}

id objc_msgSend_setAccumulationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAccumulationHandler:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setActionIdentifier:];
}

id objc_msgSend_setActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setActionURL:];
}

id objc_msgSend_setActionWebArchiveURL_(void *a1, const char *a2, ...)
{
  return [a1 setActionWebArchiveURL:];
}

id objc_msgSend_setActiveCleanupOperation_(void *a1, const char *a2, ...)
{
  return [a1 setActiveCleanupOperation:];
}

id objc_msgSend_setActiveDataTask_(void *a1, const char *a2, ...)
{
  return [a1 setActiveDataTask:];
}

id objc_msgSend_setAdCopy_(void *a1, const char *a2, ...)
{
  return [a1 setAdCopy:];
}

id objc_msgSend_setAdDataResponseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAdDataResponseIdentifier:];
}

id objc_msgSend_setAdFormatType_(void *a1, const char *a2, ...)
{
  return [a1 setAdFormatType:];
}

id objc_msgSend_setAdFrequencyCapData_(void *a1, const char *a2, ...)
{
  return [a1 setAdFrequencyCapData:];
}

id objc_msgSend_setAdIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAdIdentifier:];
}

id objc_msgSend_setAdLayoutDetails_(void *a1, const char *a2, ...)
{
  return [a1 setAdLayoutDetails:];
}

id objc_msgSend_setAdMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setAdMetadata:];
}

id objc_msgSend_setAdNetworkId_(void *a1, const char *a2, ...)
{
  return [a1 setAdNetworkId:];
}

id objc_msgSend_setAdOriginIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAdOriginIdentifier:];
}

id objc_msgSend_setAdOriginalRequesterId_(void *a1, const char *a2, ...)
{
  return [a1 setAdOriginalRequesterId:];
}

id objc_msgSend_setAdServerEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setAdServerEnvironment:];
}

id objc_msgSend_setAdServerResponseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAdServerResponseIdentifier];
}

id objc_msgSend_setAdTag_(void *a1, const char *a2, ...)
{
  return [a1 setAdTag:];
}

id objc_msgSend_setAdTagContentString_(void *a1, const char *a2, ...)
{
  return [a1 setAdTagContentString:];
}

id objc_msgSend_setAdType_(void *a1, const char *a2, ...)
{
  return [a1 setAdType:];
}

id objc_msgSend_setAdamID_(void *a1, const char *a2, ...)
{
  return [a1 setAdamID:];
}

id objc_msgSend_setAdamId_(void *a1, const char *a2, ...)
{
  return [a1 setAdamId:];
}

id objc_msgSend_setAdministrativeArea_(void *a1, const char *a2, ...)
{
  return [a1 setAdministrativeArea:];
}

id objc_msgSend_setAdvertiserName_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertiserName:];
}

id objc_msgSend_setAdvertisingIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertisingIdentifier:];
}

id objc_msgSend_setAdvertisingIdentifierMonthResetCount_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertisingIdentifierMonthResetCount:];
}

id objc_msgSend_setAllocatedSize_(void *a1, const char *a2, ...)
{
  return [a1 setAllocatedSize:];
}

id objc_msgSend_setAllowITunes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowITunes:];
}

id objc_msgSend_setAllowInstallApps_(void *a1, const char *a2, ...)
{
  return [a1 setAllowInstallApps:];
}

id objc_msgSend_setAncientItemBlock_(void *a1, const char *a2, ...)
{
  return [a1 setAncientItemBlock:];
}

id objc_msgSend_setAnonymousDemandId_(void *a1, const char *a2, ...)
{
  return [a1 setAnonymousDemandId:];
}

id objc_msgSend_setAnonymousDemandiAdID_(void *a1, const char *a2, ...)
{
  return [a1 setAnonymousDemandiAdID:];
}

id objc_msgSend_setApiFramework_(void *a1, const char *a2, ...)
{
  return [a1 setApiFramework:];
}

id objc_msgSend_setAppID_(void *a1, const char *a2, ...)
{
  return [a1 setAppID:];
}

id objc_msgSend_setAppMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setAppMetadata:];
}

id objc_msgSend_setAppStoreViewAdVersion_(void *a1, const char *a2, ...)
{
  return [a1 setAppStoreViewAdVersion:];
}

id objc_msgSend_setAppVersion_(void *a1, const char *a2, ...)
{
  return [a1 setAppVersion:];
}

id objc_msgSend_setApplicationLinkedOnOS_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationLinkedOnOS:];
}

id objc_msgSend_setAppsRank_(void *a1, const char *a2, ...)
{
  return [a1 setAppsRank:];
}

id objc_msgSend_setArticleID_(void *a1, const char *a2, ...)
{
  return [a1 setArticleID:];
}

id objc_msgSend_setArticleTitle_(void *a1, const char *a2, ...)
{
  return [a1 setArticleTitle:];
}

id objc_msgSend_setArtist_(void *a1, const char *a2, ...)
{
  return [a1 setArtist:];
}

id objc_msgSend_setAsset_(void *a1, const char *a2, ...)
{
  return [a1 setAsset:];
}

id objc_msgSend_setAssetInformation_(void *a1, const char *a2, ...)
{
  return [a1 setAssetInformation:];
}

id objc_msgSend_setAttemptId_(void *a1, const char *a2, ...)
{
  return [a1 setAttemptId:];
}

id objc_msgSend_setAttributionDownloadType_(void *a1, const char *a2, ...)
{
  return [a1 setAttributionDownloadType:];
}

id objc_msgSend_setAttributionKey_(void *a1, const char *a2, ...)
{
  return [a1 setAttributionKey:];
}

id objc_msgSend_setAttributionMetadataExistsOnDevice_(void *a1, const char *a2, ...)
{
  return [a1 setAttributionMetadataExistsOnDevice:];
}

id objc_msgSend_setAttributionSignature_(void *a1, const char *a2, ...)
{
  return [a1 setAttributionSignature:];
}

id objc_msgSend_setAudioURL_(void *a1, const char *a2, ...)
{
  return [a1 setAudioURL:];
}

id objc_msgSend_setAutoloop_(void *a1, const char *a2, ...)
{
  return [a1 setAutoloop:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundImage_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundImage:];
}

id objc_msgSend_setBackoffTimer_(void *a1, const char *a2, ...)
{
  return [a1 setBackoffTimer:];
}

id objc_msgSend_setBadResponse_(void *a1, const char *a2, ...)
{
  return [a1 setBadResponse:];
}

id objc_msgSend_setBannerCustomMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setBannerCustomMetadata:];
}

id objc_msgSend_setBannerQueryString_(void *a1, const char *a2, ...)
{
  return [a1 setBannerQueryString];
}

id objc_msgSend_setBannerURL_(void *a1, const char *a2, ...)
{
  return [a1 setBannerURL:];
}

id objc_msgSend_setBannerWebArchiveURL_(void *a1, const char *a2, ...)
{
  return [a1 setBannerWebArchiveURL:];
}

id objc_msgSend_setBaseUrl_(void *a1, const char *a2, ...)
{
  return [a1 setBaseUrl:];
}

id objc_msgSend_setBatchId_(void *a1, const char *a2, ...)
{
  return [a1 setBatchId:];
}

id objc_msgSend_setBatchInfos_(void *a1, const char *a2, ...)
{
  return [a1 setBatchInfos:];
}

id objc_msgSend_setBatchResponseID_(void *a1, const char *a2, ...)
{
  return [a1 setBatchResponseID:];
}

id objc_msgSend_setBatchesData_(void *a1, const char *a2, ...)
{
  return [a1 setBatchesData:];
}

id objc_msgSend_setBilling_(void *a1, const char *a2, ...)
{
  return [a1 setBilling:];
}

id objc_msgSend_setBitrate_(void *a1, const char *a2, ...)
{
  return [a1 setBitrate:];
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return [a1 setBlock:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBorderStyle:];
}

id objc_msgSend_setBranch_(void *a1, const char *a2, ...)
{
  return [a1 setBranch:];
}

id objc_msgSend_setBrandName_(void *a1, const char *a2, ...)
{
  return [a1 setBrandName:];
}

id objc_msgSend_setBuffer_(void *a1, const char *a2, ...)
{
  return [a1 setBuffer:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setBundleIDs_(void *a1, const char *a2, ...)
{
  return [a1 setBundleIDs:];
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setBundleId:];
}

id objc_msgSend_setButton_(void *a1, const char *a2, ...)
{
  return [a1 setButton:];
}

id objc_msgSend_setButtonStyle_(void *a1, const char *a2, ...)
{
  return [a1 setButtonStyle:];
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObject:];
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromSet:];
}

id objc_msgSend_setCacheSizeLimit_(void *a1, const char *a2, ...)
{
  return [a1 setCacheSizeLimit:];
}

id objc_msgSend_setCacheSizeLimitValue_(void *a1, const char *a2, ...)
{
  return [a1 setCacheSizeLimitValue:];
}

id objc_msgSend_setCachedCertificate_(void *a1, const char *a2, ...)
{
  return [a1 setCachedCertificate:];
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return [a1 setCalendar:];
}

id objc_msgSend_setCampaignData_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignData:];
}

id objc_msgSend_setCampaignId_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignId:];
}

id objc_msgSend_setCampaignNameSpace_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignNameSpace:];
}

id objc_msgSend_setCampaignText_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignText:];
}

id objc_msgSend_setCancelButtonForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return [a1 setCancelButtonForPurchaseDialog];
}

id objc_msgSend_setCancelLabelForExitDialog_(void *a1, const char *a2, ...)
{
  return [a1 setCancelLabelForExitDialog:];
}

id objc_msgSend_setCancelled_(void *a1, const char *a2, ...)
{
  return [a1 setCancelled:];
}

id objc_msgSend_setCaption_(void *a1, const char *a2, ...)
{
  return [a1 setCaption:];
}

id objc_msgSend_setCarousel50PercentVisibleTime_(void *a1, const char *a2, ...)
{
  return [a1 setCarousel50PercentVisibleTime:];
}

id objc_msgSend_setCarouselElementsPartiallyVisible_(void *a1, const char *a2, ...)
{
  return [a1 setCarouselElementsPartiallyVisible:];
}

id objc_msgSend_setCarouselElementsVisible_(void *a1, const char *a2, ...)
{
  return [a1 setCarouselElementsVisible:];
}

id objc_msgSend_setCarouselFinishedSent_(void *a1, const char *a2, ...)
{
  return [a1 setCarouselFinishedSent:];
}

id objc_msgSend_setCarouselVisibleTime_(void *a1, const char *a2, ...)
{
  return [a1 setCarouselVisibleTime:];
}

id objc_msgSend_setCarrierMCC_(void *a1, const char *a2, ...)
{
  return [a1 setCarrierMCC:];
}

id objc_msgSend_setCarrierMNC_(void *a1, const char *a2, ...)
{
  return [a1 setCarrierMNC:];
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return [a1 setChannel:];
}

id objc_msgSend_setChannels_(void *a1, const char *a2, ...)
{
  return [a1 setChannels:];
}

id objc_msgSend_setChildren_(void *a1, const char *a2, ...)
{
  return [a1 setChildren:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClickCount_(void *a1, const char *a2, ...)
{
  return [a1 setClickCount:];
}

id objc_msgSend_setClickLocation_(void *a1, const char *a2, ...)
{
  return [a1 setClickLocation:];
}

id objc_msgSend_setClickOrigin_(void *a1, const char *a2, ...)
{
  return [a1 setClickOrigin:];
}

id objc_msgSend_setClickTime_(void *a1, const char *a2, ...)
{
  return [a1 setClickTime:];
}

id objc_msgSend_setClickedCarouselElement_(void *a1, const char *a2, ...)
{
  return [a1 setClickedCarouselElement:];
}

id objc_msgSend_setClientClockTime_(void *a1, const char *a2, ...)
{
  return [a1 setClientClockTime:];
}

id objc_msgSend_setClientConnection_(void *a1, const char *a2, ...)
{
  return [a1 setClientConnection:];
}

id objc_msgSend_setClientId_(void *a1, const char *a2, ...)
{
  return [a1 setClientId:];
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return [a1 setClientInfo:];
}

id objc_msgSend_setClientRequestID_(void *a1, const char *a2, ...)
{
  return [a1 setClientRequestID:];
}

id objc_msgSend_setClientViewSize_(void *a1, const char *a2, ...)
{
  return [a1 setClientViewSize:];
}

id objc_msgSend_setCollection_(void *a1, const char *a2, ...)
{
  return [a1 setCollection:];
}

id objc_msgSend_setCollectionProvider_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionProvider:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionHandler:];
}

id objc_msgSend_setConfigRequester_(void *a1, const char *a2, ...)
{
  return [a1 setConfigRequester:];
}

id objc_msgSend_setConfigVersion_(void *a1, const char *a2, ...)
{
  return [a1 setConfigVersion:];
}

id objc_msgSend_setConfigurations_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurations:];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return [a1 setConnection:];
}

id objc_msgSend_setConnectionType_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionType:];
}

id objc_msgSend_setConsumed50PercentImpressions_(void *a1, const char *a2, ...)
{
  return [a1 setConsumed50PercentImpressions:];
}

id objc_msgSend_setConsumedImpressions_(void *a1, const char *a2, ...)
{
  return [a1 setConsumedImpressions:];
}

id objc_msgSend_setContainerType_(void *a1, const char *a2, ...)
{
  return [a1 setContainerType:];
}

id objc_msgSend_setContentData_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setContentData:forIdentifier:];
}

id objc_msgSend_setContentDataIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setContentDataIdentifier:];
}

id objc_msgSend_setContentDataItems_(void *a1, const char *a2, ...)
{
  return [a1 setContentDataItems:];
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return [a1 setContentType:];
}

id objc_msgSend_setContentiAdID_(void *a1, const char *a2, ...)
{
  return [a1 setContentiAdID:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setContextFingerprint_(void *a1, const char *a2, ...)
{
  return [a1 setContextFingerprint:];
}

id objc_msgSend_setContextIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setContextIdentifier:];
}

id objc_msgSend_setContextJSON_(void *a1, const char *a2, ...)
{
  return [a1 setContextJSON:];
}

id objc_msgSend_setContextString_(void *a1, const char *a2, ...)
{
  return [a1 setContextString:];
}

id objc_msgSend_setContextWrapper_(void *a1, const char *a2, ...)
{
  return [a1 setContextWrapper:];
}

id objc_msgSend_setContinueLabelForExitDialog_(void *a1, const char *a2, ...)
{
  return [a1 setContinueLabelForExitDialog];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 setCountryCode:];
}

id objc_msgSend_setCppIds_(void *a1, const char *a2, ...)
{
  return [a1 setCppIds:];
}

id objc_msgSend_setCreativeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCreativeIdentifier:];
}

id objc_msgSend_setCriteriaIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCriteriaIdentifier:];
}

id objc_msgSend_setCtClient_(void *a1, const char *a2, ...)
{
  return [a1 setCtClient:];
}

id objc_msgSend_setCtSubscriptionContext_(void *a1, const char *a2, ...)
{
  return [a1 setCtSubscriptionContext:];
}

id objc_msgSend_setCtaButton_(void *a1, const char *a2, ...)
{
  return [a1 setCtaButton:];
}

id objc_msgSend_setCurrentContentDataItemIdIndex_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentContentDataItemIdIndex:];
}

id objc_msgSend_setCurrentEncryptedIDs_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentEncryptedIDs:];
}

id objc_msgSend_setCurrentIndex_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentIndex:];
}

id objc_msgSend_setCurrentPlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPlaybackTime:];
}

id objc_msgSend_setCurrentTimer_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTimer:];
}

id objc_msgSend_setDPID_(void *a1, const char *a2, ...)
{
  return [a1 setDPID:];
}

id objc_msgSend_setDaemonBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setDaemonBundleId:];
}

id objc_msgSend_setDaemonRunningTime_(void *a1, const char *a2, ...)
{
  return [a1 setDaemonRunningTime:];
}

id objc_msgSend_setDarkModeColors_(void *a1, const char *a2, ...)
{
  return [a1 setDarkModeColors:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDataAdapters_(void *a1, const char *a2, ...)
{
  return [a1 setDataAdapters:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return [a1 setDay:];
}

id objc_msgSend_setDecodingFailurePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setDecodingFailurePolicy:];
}

id objc_msgSend_setDefaultStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultStyle:];
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return [a1 setDelay:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeliverEntireBatch_(void *a1, const char *a2, ...)
{
  return [a1 setDeliverEntireBatch:];
}

id objc_msgSend_setDeliveryBlock_(void *a1, const char *a2, ...)
{
  return [a1 setDeliveryBlock:];
}

id objc_msgSend_setDeliveryStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setDeliveryStartDate:];
}

id objc_msgSend_setDenyExplicit_(void *a1, const char *a2, ...)
{
  return [a1 setDenyExplicit:];
}

id objc_msgSend_setDescriptionForLCD_(void *a1, const char *a2, ...)
{
  return [a1 setDescriptionForLCD];
}

id objc_msgSend_setDesiredPosition_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredPosition:];
}

id objc_msgSend_setDestination_(void *a1, const char *a2, ...)
{
  return [a1 setDestination:];
}

id objc_msgSend_setDevelopmentApp_(void *a1, const char *a2, ...)
{
  return [a1 setDevelopmentApp:];
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDevice:];
}

id objc_msgSend_setDeviceIsLocked_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceIsLocked:];
}

id objc_msgSend_setDeviceMode_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceMode:];
}

id objc_msgSend_setDeviceModel_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceModel:];
}

id objc_msgSend_setDiagnosticCode_(void *a1, const char *a2, ...)
{
  return [a1 setDiagnosticCode:];
}

id objc_msgSend_setDisableTelephonyMethod_(void *a1, const char *a2, ...)
{
  return [a1 setDisableTelephonyMethod];
}

id objc_msgSend_setDisabledColor_(void *a1, const char *a2, ...)
{
  return [a1 setDisabledColor:];
}

id objc_msgSend_setDiscarded_(void *a1, const char *a2, ...)
{
  return [a1 setDiscarded:];
}

id objc_msgSend_setDisclosureRendererPayload_(void *a1, const char *a2, ...)
{
  return [a1 setDisclosureRendererPayload:];
}

id objc_msgSend_setDisclosureURL_(void *a1, const char *a2, ...)
{
  return [a1 setDisclosureURL:];
}

id objc_msgSend_setDispatchSourceAccumulation_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchSourceAccumulation:];
}

id objc_msgSend_setDispatchSourceInactivity_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchSourceInactivity:];
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDouble:forKey:];
}

id objc_msgSend_setDownloadClickTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadClickTimestamp:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setElementID_(void *a1, const char *a2, ...)
{
  return [a1 setElementID:];
}

id objc_msgSend_setElements_(void *a1, const char *a2, ...)
{
  return [a1 setElements:];
}

id objc_msgSend_setEnd_(void *a1, const char *a2, ...)
{
  return [a1 setEnd:];
}

id objc_msgSend_setEndCard_(void *a1, const char *a2, ...)
{
  return [a1 setEndCard:];
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setEnvironment:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return [a1 setErrorCode:];
}

id objc_msgSend_setErrorDetails_(void *a1, const char *a2, ...)
{
  return [a1 setErrorDetails:];
}

id objc_msgSend_setErrorMessage_(void *a1, const char *a2, ...)
{
  return [a1 setErrorMessage:];
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return [a1 setEvent:];
}

id objc_msgSend_setEventCollectionDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setEventCollectionDisabled:];
}

id objc_msgSend_setEventSequence_(void *a1, const char *a2, ...)
{
  return [a1 setEventSequence:];
}

id objc_msgSend_setEventStorageListener_(void *a1, const char *a2, ...)
{
  return [a1 setEventStorageListener:];
}

id objc_msgSend_setEventTime_(void *a1, const char *a2, ...)
{
  return [a1 setEventTime:];
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return [a1 setEventType:];
}

id objc_msgSend_setExclusionCriteria_(void *a1, const char *a2, ...)
{
  return [a1 setExclusionCriteria:];
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationDate:];
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationHandler:];
}

id objc_msgSend_setExpression_(void *a1, const char *a2, ...)
{
  return [a1 setExpression:];
}

id objc_msgSend_setExpressionToEvaluate_(void *a1, const char *a2, ...)
{
  return [a1 setExpressionToEvaluate:];
}

id objc_msgSend_setFakeNetworkResponse_(void *a1, const char *a2, ...)
{
  return [a1 setFakeNetworkResponse:];
}

id objc_msgSend_setFileSystemToken_(void *a1, const char *a2, ...)
{
  return [a1 setFileSystemToken:];
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return [a1 setFiles:];
}

id objc_msgSend_setFilesCount_(void *a1, const char *a2, ...)
{
  return [a1 setFilesCount:];
}

id objc_msgSend_setFirstMessage_(void *a1, const char *a2, ...)
{
  return [a1 setFirstMessage:];
}

id objc_msgSend_setFoundArtists_(void *a1, const char *a2, ...)
{
  return [a1 setFoundArtists:];
}

id objc_msgSend_setFoundBundleIDs_(void *a1, const char *a2, ...)
{
  return [a1 setFoundBundleIDs:];
}

id objc_msgSend_setFoundGenres_(void *a1, const char *a2, ...)
{
  return [a1 setFoundGenres:];
}

id objc_msgSend_setFpdiSignature_(void *a1, const char *a2, ...)
{
  return [a1 setFpdiSignature:];
}

id objc_msgSend_setFrequencyCapData_(void *a1, const char *a2, ...)
{
  return [a1 setFrequencyCapData:];
}

id objc_msgSend_setGarbageCollector_(void *a1, const char *a2, ...)
{
  return [a1 setGarbageCollector:];
}

id objc_msgSend_setGenre_(void *a1, const char *a2, ...)
{
  return [a1 setGenre:];
}

id objc_msgSend_setGracePeriod_(void *a1, const char *a2, ...)
{
  return [a1 setGracePeriod:];
}

id objc_msgSend_setGradientOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setGradientOrientation:];
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPBody:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHandler:];
}

id objc_msgSend_setHasBeenOnScreen_(void *a1, const char *a2, ...)
{
  return [a1 setHasBeenOnScreen:];
}

id objc_msgSend_setHasConfirmed50PercentImpression_(void *a1, const char *a2, ...)
{
  return [a1 setHasConfirmed50PercentImpression:];
}

id objc_msgSend_setHasConfirmedClick_(void *a1, const char *a2, ...)
{
  return [a1 setHasConfirmedClick:];
}

id objc_msgSend_setHasConfirmedImpression_(void *a1, const char *a2, ...)
{
  return [a1 setHasConfirmedImpression:];
}

id objc_msgSend_setHasIsTest_(void *a1, const char *a2, ...)
{
  return [a1 setHasIsTest:];
}

id objc_msgSend_setHasOdml_(void *a1, const char *a2, ...)
{
  return [a1 setHasOdml:];
}

id objc_msgSend_setHasRunningLandingPageRequest_(void *a1, const char *a2, ...)
{
  return [a1 setHasRunningLandingPageRequest:];
}

id objc_msgSend_setHeaderName_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderName:];
}

id objc_msgSend_setHeaderValue_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderValue:];
}

id objc_msgSend_setHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setHeaders:];
}

id objc_msgSend_setHeadline_(void *a1, const char *a2, ...)
{
  return [a1 setHeadline:];
}

id objc_msgSend_setHeadlineForLCD_(void *a1, const char *a2, ...)
{
  return [a1 setHeadlineForLCD];
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return [a1 setHeight:];
}

id objc_msgSend_setHighlightColor_(void *a1, const char *a2, ...)
{
  return [a1 setHighlightColor:];
}

id objc_msgSend_setHighlightedColor_(void *a1, const char *a2, ...)
{
  return [a1 setHighlightedColor:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return [a1 setHour:];
}

id objc_msgSend_setHttpLookBackWindow_(void *a1, const char *a2, ...)
{
  return [a1 setHttpLookBackWindow:];
}

id objc_msgSend_setHttpLookBackWindowValue_(void *a1, const char *a2, ...)
{
  return [a1 setHttpLookBackWindowValue:];
}

id objc_msgSend_setHttpMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return [a1 setHttpMaximumConnectionsPerHost:];
}

id objc_msgSend_setHttpMaximumConnectionsPerHostTempSession_(void *a1, const char *a2, ...)
{
  return [a1 setHttpMaximumConnectionsPerHostTempSession];
}

id objc_msgSend_setHttpMaximumConnectionsPerHostTempSessionValue_(void *a1, const char *a2, ...)
{
  return [a1 setHttpMaximumConnectionsPerHostTempSessionValue:];
}

id objc_msgSend_setHttpMaximumConnectionsPerHostValue_(void *a1, const char *a2, ...)
{
  return [a1 setHttpMaximumConnectionsPerHostValue:];
}

id objc_msgSend_setHttpUseFixedHttpSessionManager_(void *a1, const char *a2, ...)
{
  return [a1 setHttpUseFixedHttpSessionManager:];
}

id objc_msgSend_setHttpUseFixedHttpSessionManagerValue_(void *a1, const char *a2, ...)
{
  return [a1 setHttpUseFixedHttpSessionManagerValue:];
}

id objc_msgSend_setHumanReadableName_(void *a1, const char *a2, ...)
{
  return [a1 setHumanReadableName:];
}

id objc_msgSend_setIAdConversionTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setIAdConversionTimestamp:];
}

id objc_msgSend_setIAdID_(void *a1, const char *a2, ...)
{
  return [a1 setIAdID:];
}

id objc_msgSend_setIAdImpressionTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setIAdImpressionTimestamp:];
}

id objc_msgSend_setIAdJSURL_(void *a1, const char *a2, ...)
{
  return [a1 setIAdJSURL:];
}

id objc_msgSend_setIAdJSVersion_(void *a1, const char *a2, ...)
{
  return [a1 setIAdJSVersion:];
}

id objc_msgSend_setITunesStore_(void *a1, const char *a2, ...)
{
  return [a1 setITunesStore:];
}

id objc_msgSend_setIdAccount_(void *a1, const char *a2, ...)
{
  return [a1 setIdAccount:];
}

id objc_msgSend_setIdDebug_(void *a1, const char *a2, ...)
{
  return [a1 setIdDebug:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIgnoreKeys_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreKeys:];
}

id objc_msgSend_setImpressionID_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionID:];
}

id objc_msgSend_setImpressionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionIdentifier:];
}

id objc_msgSend_setImpressionIdentifierData_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionIdentifierData:];
}

id objc_msgSend_setImpressionSequence_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionSequence:];
}

id objc_msgSend_setImpressionThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionThreshold:];
}

id objc_msgSend_setInclusionCriteria_(void *a1, const char *a2, ...)
{
  return [a1 setInclusionCriteria:];
}

id objc_msgSend_setInfos_(void *a1, const char *a2, ...)
{
  return [a1 setInfos:];
}

id objc_msgSend_setInsertOrder_(void *a1, const char *a2, ...)
{
  return [a1 setInsertOrder:];
}

id objc_msgSend_setInstallAttribution_(void *a1, const char *a2, ...)
{
  return [a1 setInstallAttribution:];
}

id objc_msgSend_setInsufficientPlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 setInsufficientPlaybackTime:];
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setInteger:forKey:];
}

id objc_msgSend_setIntegrityReportEventListener_(void *a1, const char *a2, ...)
{
  return [a1 setIntegrityReportEventListener:];
}

id objc_msgSend_setInterfaceReady_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceReady:];
}

id objc_msgSend_setInterfaceReplaced_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceReplaced:];
}

id objc_msgSend_setInternalContent_(void *a1, const char *a2, ...)
{
  return [a1 setInternalContent:];
}

id objc_msgSend_setInternalProperties_(void *a1, const char *a2, ...)
{
  return [a1 setInternalProperties:];
}

id objc_msgSend_setInternalUserWantsProdAds_(void *a1, const char *a2, ...)
{
  return [a1 setInternalUserWantsProdAds:];
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return [a1 setInterval:];
}

id objc_msgSend_setIntervalId_(void *a1, const char *a2, ...)
{
  return [a1 setIntervalId:];
}

id objc_msgSend_setIsCPUIntensive_(void *a1, const char *a2, ...)
{
  return [a1 setIsCPUIntensive:];
}

id objc_msgSend_setIsCancelled_(void *a1, const char *a2, ...)
{
  return [a1 setIsCancelled:];
}

id objc_msgSend_setIsLocationAvailableForAd_(void *a1, const char *a2, ...)
{
  return [a1 setIsLocationAvailableForAd:];
}

id objc_msgSend_setIsNewObject_(void *a1, const char *a2, ...)
{
  return [a1 setIsNewObject:];
}

id objc_msgSend_setIsPAAvailableForAd_(void *a1, const char *a2, ...)
{
  return [a1 setIsPAAvailableForAd:];
}

id objc_msgSend_setIsRepeating_(void *a1, const char *a2, ...)
{
  return [a1 setIsRepeating:];
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return [a1 setIsRunning:];
}

id objc_msgSend_setIsTest_(void *a1, const char *a2, ...)
{
  return [a1 setIsTest:];
}

id objc_msgSend_setIsoCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 setIsoCountryCode:];
}

id objc_msgSend_setJourneyRelayAdGroupId_(void *a1, const char *a2, ...)
{
  return [a1 setJourneyRelayAdGroupId:];
}

id objc_msgSend_setJourneyRelayCampaignId_(void *a1, const char *a2, ...)
{
  return [a1 setJourneyRelayCampaignId:];
}

id objc_msgSend_setJsonBody_(void *a1, const char *a2, ...)
{
  return [a1 setJsonBody:];
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return [a1 setKey:];
}

id objc_msgSend_setLanguageIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setLanguageIdentifier:];
}

id objc_msgSend_setLastActivity_(void *a1, const char *a2, ...)
{
  return [a1 setLastActivity:];
}

id objc_msgSend_setLastGarbageCollected_(void *a1, const char *a2, ...)
{
  return [a1 setLastGarbageCollected:];
}

id objc_msgSend_setLastModifiedDate_toFile_error_(void *a1, const char *a2, ...)
{
  return [a1 setLastModifiedDate:toFile:error:];
}

id objc_msgSend_setLastPlaybackTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLastPlaybackTimestamp:];
}

id objc_msgSend_setLastPosition_(void *a1, const char *a2, ...)
{
  return [a1 setLastPosition:];
}

id objc_msgSend_setLastProcessingDate_forDestination_(void *a1, const char *a2, ...)
{
  return [a1 setLastProcessingDate:forDestination:];
}

id objc_msgSend_setLastSentEventTime_(void *a1, const char *a2, ...)
{
  return [a1 setLastSentEventTime:];
}

id objc_msgSend_setLastStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setLastStatusCode:];
}

id objc_msgSend_setLastUpdated_(void *a1, const char *a2, ...)
{
  return [a1 setLastUpdated:];
}

id objc_msgSend_setLatestCellularSignalStrength_(void *a1, const char *a2, ...)
{
  return [a1 setLatestCellularSignalStrength:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setLightModeColors_(void *a1, const char *a2, ...)
{
  return [a1 setLightModeColors:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setLocaleIdentifier:];
}

id objc_msgSend_setLocality_(void *a1, const char *a2, ...)
{
  return [a1 setLocality:];
}

id objc_msgSend_setLocalizedHeadlines_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedHeadlines:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setLock_(void *a1, const char *a2, ...)
{
  return [a1 setLock:];
}

id objc_msgSend_setLogoImageURL_(void *a1, const char *a2, ...)
{
  return [a1 setLogoImageURL:];
}

id objc_msgSend_setLookBackWindow_(void *a1, const char *a2, ...)
{
  return [a1 setLookBackWindow:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMaxObjectLifeTimeDays_(void *a1, const char *a2, ...)
{
  return [a1 setMaxObjectLifeTimeDays:];
}

id objc_msgSend_setMediaContentHash_(void *a1, const char *a2, ...)
{
  return [a1 setMediaContentHash:];
}

id objc_msgSend_setMediaFiles_(void *a1, const char *a2, ...)
{
  return [a1 setMediaFiles:];
}

id objc_msgSend_setMediaServiceRequest_(void *a1, const char *a2, ...)
{
  return [a1 setMediaServiceRequest:];
}

id objc_msgSend_setMediaServiceSession_(void *a1, const char *a2, ...)
{
  return [a1 setMediaServiceSession:];
}

id objc_msgSend_setMediaURL_(void *a1, const char *a2, ...)
{
  return [a1 setMediaURL:];
}

id objc_msgSend_setMerchant_(void *a1, const char *a2, ...)
{
  return [a1 setMerchant:];
}

id objc_msgSend_setMescalSignature_(void *a1, const char *a2, ...)
{
  return [a1 setMescalSignature:];
}

id objc_msgSend_setMessageForExitDialog_(void *a1, const char *a2, ...)
{
  return [a1 setMessageForExitDialog:];
}

id objc_msgSend_setMessageForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return [a1 setMessageForPurchaseDialog:];
}

id objc_msgSend_setMessageSequence_(void *a1, const char *a2, ...)
{
  return [a1 setMessageSequence:];
}

id objc_msgSend_setMetaData_(void *a1, const char *a2, ...)
{
  return [a1 setMetaData:];
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setMetadata:];
}

id objc_msgSend_setMetric_(void *a1, const char *a2, ...)
{
  return [a1 setMetric:];
}

id objc_msgSend_setMetricPurpose_(void *a1, const char *a2, ...)
{
  return [a1 setMetricPurpose:];
}

id objc_msgSend_setMetricsCount_(void *a1, const char *a2, ...)
{
  return [a1 setMetricsCount:];
}

id objc_msgSend_setMinCount_(void *a1, const char *a2, ...)
{
  return [a1 setMinCount:];
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return [a1 setMinDurationBetweenInstances:];
}

id objc_msgSend_setMinimumTimeBetweenPresentation_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumTimeBetweenPresentation:];
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return [a1 setMinute:];
}

id objc_msgSend_setMockData_(void *a1, const char *a2, ...)
{
  return [a1 setMockData:];
}

id objc_msgSend_setMockResponseHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setMockResponseHeaders:];
}

id objc_msgSend_setMockResponseStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setMockResponseStatusCode:];
}

id objc_msgSend_setMoviesRank_(void *a1, const char *a2, ...)
{
  return [a1 setMoviesRank:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNativeMediaCreativeMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setNativeMediaCreativeMetadata:];
}

id objc_msgSend_setNetworkError_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkError:];
}

id objc_msgSend_setNetworkInfoUpdatingInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkInfoUpdatingInProgress:];
}

id objc_msgSend_setNetworkType_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkType:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKey_cost_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:cost:];
}

id objc_msgSend_setObject_forKey_transaction_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:transaction:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObjectSize_(void *a1, const char *a2, ...)
{
  return [a1 setObjectSize:];
}

id objc_msgSend_setOffsets_(void *a1, const char *a2, ...)
{
  return [a1 setOffsets:];
}

id objc_msgSend_setOkButtonForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return [a1 setOkButtonForPurchaseDialog:];
}

id objc_msgSend_setOldEncryptedIDs_(void *a1, const char *a2, ...)
{
  return [a1 setOldEncryptedIDs:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOperatingSystemDescription_(void *a1, const char *a2, ...)
{
  return [a1 setOperatingSystemDescription:];
}

id objc_msgSend_setOperator_(void *a1, const char *a2, ...)
{
  return [a1 setOperator:];
}

id objc_msgSend_setOsBuild_(void *a1, const char *a2, ...)
{
  return [a1 setOsBuild:];
}

id objc_msgSend_setOsPlatform_(void *a1, const char *a2, ...)
{
  return [a1 setOsPlatform:];
}

id objc_msgSend_setOsVersion_(void *a1, const char *a2, ...)
{
  return [a1 setOsVersion:];
}

id objc_msgSend_setOsVersionAndBuild_(void *a1, const char *a2, ...)
{
  return [a1 setOsVersionAndBuild:];
}

id objc_msgSend_setOverclickCount_(void *a1, const char *a2, ...)
{
  return [a1 setOverclickCount:];
}

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return [a1 setParameters:];
}

id objc_msgSend_setParams_(void *a1, const char *a2, ...)
{
  return [a1 setParams:];
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return [a1 setParent:];
}

id objc_msgSend_setParentAppCheckEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setParentAppCheckEnabled:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPaymentProcessingCertificate_(void *a1, const char *a2, ...)
{
  return [a1 setPaymentProcessingCertificate:];
}

id objc_msgSend_setPaymentProcessingURL_(void *a1, const char *a2, ...)
{
  return [a1 setPaymentProcessingURL:];
}

id objc_msgSend_setPendingConfirmedClick_(void *a1, const char *a2, ...)
{
  return [a1 setPendingConfirmedClick:];
}

id objc_msgSend_setPersistentStore_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentStore:];
}

id objc_msgSend_setPersonalizedAdsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPersonalizedAdsEnabled:];
}

id objc_msgSend_setPlacement_(void *a1, const char *a2, ...)
{
  return [a1 setPlacement:];
}

id objc_msgSend_setPlacementDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setPlacementDescriptor:];
}

id objc_msgSend_setPlacementType_(void *a1, const char *a2, ...)
{
  return [a1 setPlacementType:];
}

id objc_msgSend_setPlaybackInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setPlaybackInProgress:];
}

id objc_msgSend_setPlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 setPlaybackTime:];
}

id objc_msgSend_setPolicyData_(void *a1, const char *a2, ...)
{
  return [a1 setPolicyData:];
}

id objc_msgSend_setPolicyValue_(void *a1, const char *a2, ...)
{
  return [a1 setPolicyValue:];
}

id objc_msgSend_setPositionInformation_(void *a1, const char *a2, ...)
{
  return [a1 setPositionInformation:];
}

id objc_msgSend_setPostalCode_(void *a1, const char *a2, ...)
{
  return [a1 setPostalCode:];
}

id objc_msgSend_setPreparedDataServerDelivery_(void *a1, const char *a2, ...)
{
  return [a1 setPreparedDataServerDelivery:];
}

id objc_msgSend_setPreparedUnsignedDataProcessor_(void *a1, const char *a2, ...)
{
  return [a1 setPreparedUnsignedDataProcessor:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setPrivacyMarkerPosition_(void *a1, const char *a2, ...)
{
  return [a1 setPrivacyMarkerPosition:];
}

id objc_msgSend_setPrivateSegment_(void *a1, const char *a2, ...)
{
  return [a1 setPrivateSegment:];
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return [a1 setProperties:];
}

id objc_msgSend_setProtocolHandler_(void *a1, const char *a2, ...)
{
  return [a1 setProtocolHandler:];
}

id objc_msgSend_setProvideIgnorableKeyNamesBlock_(void *a1, const char *a2, ...)
{
  return [a1 setProvideIgnorableKeyNamesBlock:];
}

id objc_msgSend_setPurchaseTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setPurchaseTimestamp:];
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return [a1 setPurpose:];
}

id objc_msgSend_setQToken_(void *a1, const char *a2, ...)
{
  return [a1 setQToken:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRadius_(void *a1, const char *a2, ...)
{
  return [a1 setRadius:];
}

id objc_msgSend_setRank_(void *a1, const char *a2, ...)
{
  return [a1 setRank:];
}

id objc_msgSend_setRateLimitRequestsInFeed_inArticle_betweenArticle_videoInArticle_nativeInFeed_nativeInArticle_(void *a1, const char *a2, ...)
{
  return [a1 setRateLimitRequestsInFeed:x0 inArticle:x1 betweenArticle:x2 videoInArticle:x3 nativeInFeed:x4 nativeInArticle:x5];
}

id objc_msgSend_setRateLimits_(void *a1, const char *a2, ...)
{
  return [a1 setRateLimits:];
}

id objc_msgSend_setRateLimitsLastUpdatedOn_(void *a1, const char *a2, ...)
{
  return [a1 setRateLimitsLastUpdatedOn:];
}

id objc_msgSend_setRateLimitsObject_(void *a1, const char *a2, ...)
{
  return [a1 setRateLimitsObject:];
}

id objc_msgSend_setRawAdFormatType_(void *a1, const char *a2, ...)
{
  return [a1 setRawAdFormatType:];
}

id objc_msgSend_setRawAdType_(void *a1, const char *a2, ...)
{
  return [a1 setRawAdType:];
}

id objc_msgSend_setReceivedContentDataItems_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedContentDataItems:];
}

id objc_msgSend_setReceivedReferenceTime_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedReferenceTime:];
}

id objc_msgSend_setRelay_(void *a1, const char *a2, ...)
{
  return [a1 setRelay:];
}

id objc_msgSend_setRelevantIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setRelevantIdentifier:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemovalBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRemovalBlock:];
}

id objc_msgSend_setReportDate_(void *a1, const char *a2, ...)
{
  return [a1 setReportDate:];
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return [a1 setRequest:];
}

id objc_msgSend_setRequestID_(void *a1, const char *a2, ...)
{
  return [a1 setRequestID:];
}

id objc_msgSend_setRequestProperties_(void *a1, const char *a2, ...)
{
  return [a1 setRequestProperties:];
}

id objc_msgSend_setRequestTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setRequestTimestamp:];
}

id objc_msgSend_setRequesters_(void *a1, const char *a2, ...)
{
  return [a1 setRequesters:];
}

id objc_msgSend_setRequestsWhileInitializing_(void *a1, const char *a2, ...)
{
  return [a1 setRequestsWhileInitializing:];
}

id objc_msgSend_setRequireClassCData_(void *a1, const char *a2, ...)
{
  return [a1 setRequireClassCData:];
}

id objc_msgSend_setRequireSleep_(void *a1, const char *a2, ...)
{
  return [a1 setRequireSleep:];
}

id objc_msgSend_setRequiresExternalPower_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresExternalPower:];
}

id objc_msgSend_setRequiresNetworkConnectivity_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresNetworkConnectivity:];
}

id objc_msgSend_setRequiresProtectionClass_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresProtectionClass:];
}

id objc_msgSend_setRequiresSecureCoding_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresSecureCoding:];
}

id objc_msgSend_setResetSegmentMembership_(void *a1, const char *a2, ...)
{
  return [a1 setResetSegmentMembership:];
}

id objc_msgSend_setResourceConnectProxyURL_(void *a1, const char *a2, ...)
{
  return [a1 setResourceConnectProxyURL:];
}

id objc_msgSend_setResourceProxyURL_(void *a1, const char *a2, ...)
{
  return [a1 setResourceProxyURL:];
}

id objc_msgSend_setResponseTime_(void *a1, const char *a2, ...)
{
  return [a1 setResponseTime:];
}

id objc_msgSend_setRetryManager_(void *a1, const char *a2, ...)
{
  return [a1 setRetryManager:];
}

id objc_msgSend_setRunState_(void *a1, const char *a2, ...)
{
  return [a1 setRunState:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setScreenDPI_(void *a1, const char *a2, ...)
{
  return [a1 setScreenDPI:];
}

id objc_msgSend_setScreenHeight_(void *a1, const char *a2, ...)
{
  return [a1 setScreenHeight:];
}

id objc_msgSend_setScreenScale_(void *a1, const char *a2, ...)
{
  return [a1 setScreenScale:];
}

id objc_msgSend_setScreenSize_(void *a1, const char *a2, ...)
{
  return [a1 setScreenSize:];
}

id objc_msgSend_setScreenWidth_(void *a1, const char *a2, ...)
{
  return [a1 setScreenWidth:];
}

id objc_msgSend_setSearchAdClickTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setSearchAdClickTimestamp:];
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return [a1 setSecond:];
}

id objc_msgSend_setSection_(void *a1, const char *a2, ...)
{
  return [a1 setSection:];
}

id objc_msgSend_setSegmentIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setSegmentIdentifiers:];
}

id objc_msgSend_setSegmentInfo_(void *a1, const char *a2, ...)
{
  return [a1 setSegmentInfo:];
}

id objc_msgSend_setSelectedCreativeSize_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedCreativeSize:];
}

id objc_msgSend_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return [a1 setSequenceNumber:];
}

id objc_msgSend_setServerDeliveryTimer_(void *a1, const char *a2, ...)
{
  return [a1 setServerDeliveryTimer:];
}

id objc_msgSend_setServerDeliveryTimerWasRunningWhenPaused_(void *a1, const char *a2, ...)
{
  return [a1 setServerDeliveryTimerWasRunningWhenPaused:];
}

id objc_msgSend_setServerPostStart_(void *a1, const char *a2, ...)
{
  return [a1 setServerPostStart:];
}

id objc_msgSend_setServerResponseReceivedTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setServerResponseReceivedTimestamp:];
}

id objc_msgSend_setServerUnfilledReason_(void *a1, const char *a2, ...)
{
  return [a1 setServerUnfilledReason:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setSetupStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setSetupStartTime:];
}

id objc_msgSend_setShadowStyle_(void *a1, const char *a2, ...)
{
  return [a1 setShadowStyle:];
}

id objc_msgSend_setShippingUpdateCertificate_(void *a1, const char *a2, ...)
{
  return [a1 setShippingUpdateCertificate:];
}

id objc_msgSend_setShippingUpdateURL_(void *a1, const char *a2, ...)
{
  return [a1 setShippingUpdateURL:];
}

id objc_msgSend_setSignalStrength_(void *a1, const char *a2, ...)
{
  return [a1 setSignalStrength:];
}

id objc_msgSend_setSignature_(void *a1, const char *a2, ...)
{
  return [a1 setSignature:];
}

id objc_msgSend_setSigningAuthorityPoolManager_(void *a1, const char *a2, ...)
{
  return [a1 setSigningAuthorityPoolManager:];
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return [a1 setSize:];
}

id objc_msgSend_setSkipEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setSkipEnabled:];
}

id objc_msgSend_setSkipThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setSkipThreshold:];
}

id objc_msgSend_setSlateImageURL_(void *a1, const char *a2, ...)
{
  return [a1 setSlateImageURL:];
}

id objc_msgSend_setSlotIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSlotIdentifier:];
}

id objc_msgSend_setSlotNumber_(void *a1, const char *a2, ...)
{
  return [a1 setSlotNumber:];
}

id objc_msgSend_setSlotPosition_(void *a1, const char *a2, ...)
{
  return [a1 setSlotPosition:];
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return [a1 setSource:];
}

id objc_msgSend_setSourceAppAdamId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceAppAdamId:];
}

id objc_msgSend_setSpecification_(void *a1, const char *a2, ...)
{
  return [a1 setSpecification:];
}

id objc_msgSend_setSponsor_(void *a1, const char *a2, ...)
{
  return [a1 setSponsor:];
}

id objc_msgSend_setSponsoredBy_(void *a1, const char *a2, ...)
{
  return [a1 setSponsoredBy:];
}

id objc_msgSend_setSponsoredByAssetURL_(void *a1, const char *a2, ...)
{
  return [a1 setSponsoredByAssetURL:];
}

id objc_msgSend_setSponsoredByAssetURLForDarkMode_(void *a1, const char *a2, ...)
{
  return [a1 setSponsoredByAssetURLForDarkMode:];
}

id objc_msgSend_setSrcEnumerator_(void *a1, const char *a2, ...)
{
  return [a1 setSrcEnumerator:];
}

id objc_msgSend_setStart_(void *a1, const char *a2, ...)
{
  return [a1 setStart:];
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setStartDate:];
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setStartTime:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return [a1 setStatus:];
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCode:];
}

id objc_msgSend_setStatusCondition_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCondition:];
}

id objc_msgSend_setStoreFront_(void *a1, const char *a2, ...)
{
  return [a1 setStoreFront:];
}

id objc_msgSend_setStoreFrontLocale_(void *a1, const char *a2, ...)
{
  return [a1 setStoreFrontLocale:];
}

id objc_msgSend_setStorefront_(void *a1, const char *a2, ...)
{
  return [a1 setStorefront:];
}

id objc_msgSend_setStorefrontID_(void *a1, const char *a2, ...)
{
  return [a1 setStorefrontID:];
}

id objc_msgSend_setStream_(void *a1, const char *a2, ...)
{
  return [a1 setStream:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSubAdministrativeArea_(void *a1, const char *a2, ...)
{
  return [a1 setSubAdministrativeArea:];
}

id objc_msgSend_setSubscriptionSourceID_(void *a1, const char *a2, ...)
{
  return [a1 setSubscriptionSourceID:];
}

id objc_msgSend_setSuccessCount_(void *a1, const char *a2, ...)
{
  return [a1 setSuccessCount:];
}

id objc_msgSend_setTableDayOfYear_(void *a1, const char *a2, ...)
{
  return [a1 setTableDayOfYear:];
}

id objc_msgSend_setTapAction_(void *a1, const char *a2, ...)
{
  return [a1 setTapAction:];
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return [a1 setTarget:];
}

id objc_msgSend_setTargetAppBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setTargetAppBundleID:];
}

id objc_msgSend_setTargetAppURLScheme_(void *a1, const char *a2, ...)
{
  return [a1 setTargetAppURLScheme:];
}

id objc_msgSend_setTargetingDimensions_(void *a1, const char *a2, ...)
{
  return [a1 setTargetingDimensions:];
}

id objc_msgSend_setTargetingExpression_(void *a1, const char *a2, ...)
{
  return [a1 setTargetingExpression:];
}

id objc_msgSend_setTargetingExpressionId_(void *a1, const char *a2, ...)
{
  return [a1 setTargetingExpressionId:];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setTaskCompleted];
}

id objc_msgSend_setTaskExpiredWithRetryAfter_error_(void *a1, const char *a2, ...)
{
  return [a1 setTaskExpiredWithRetryAfter:x0 error:x1];
}

id objc_msgSend_setTelephonyError_(void *a1, const char *a2, ...)
{
  return [a1 setTelephonyError:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTiltID_(void *a1, const char *a2, ...)
{
  return [a1 setTiltID:];
}

id objc_msgSend_setTiltStationBlob_(void *a1, const char *a2, ...)
{
  return [a1 setTiltStationBlob:];
}

id objc_msgSend_setTimeSinceAppResume_(void *a1, const char *a2, ...)
{
  return [a1 setTimeSinceAppResume:];
}

id objc_msgSend_setTimeSpent_(void *a1, const char *a2, ...)
{
  return [a1 setTimeSpent:];
}

id objc_msgSend_setTimeSpentLegacyInterface_(void *a1, const char *a2, ...)
{
  return [a1 setTimeSpentLegacyInterface:];
}

id objc_msgSend_setTimeStamp_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStamp:];
}

id objc_msgSend_setTimeToDisplay_(void *a1, const char *a2, ...)
{
  return [a1 setTimeToDisplay:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTimestamp:];
}

id objc_msgSend_setTimezone_(void *a1, const char *a2, ...)
{
  return [a1 setTimezone:];
}

id objc_msgSend_setTitleForExitDialog_(void *a1, const char *a2, ...)
{
  return [a1 setTitleForExitDialog];
}

id objc_msgSend_setTitleForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return [a1 setTitleForPurchaseDialog:];
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return [a1 setToken:];
}

id objc_msgSend_setTokenDaemonEnd_(void *a1, const char *a2, ...)
{
  return [a1 setTokenDaemonEnd:];
}

id objc_msgSend_setTokenDaemonStart_(void *a1, const char *a2, ...)
{
  return [a1 setTokenDaemonStart:];
}

id objc_msgSend_setTokenEnd_(void *a1, const char *a2, ...)
{
  return [a1 setTokenEnd:];
}

id objc_msgSend_setTokenStart_(void *a1, const char *a2, ...)
{
  return [a1 setTokenStart:];
}

id objc_msgSend_setToroID_(void *a1, const char *a2, ...)
{
  return [a1 setToroID:];
}

id objc_msgSend_setToroId_(void *a1, const char *a2, ...)
{
  return [a1 setToroId:];
}

id objc_msgSend_setTotalCostLimit_(void *a1, const char *a2, ...)
{
  return [a1 setTotalCostLimit:];
}

id objc_msgSend_setTotalDuration_(void *a1, const char *a2, ...)
{
  return [a1 setTotalDuration:];
}

id objc_msgSend_setTotalSize_(void *a1, const char *a2, ...)
{
  return [a1 setTotalSize:];
}

id objc_msgSend_setTrackingURLSubstitutionParameter_(void *a1, const char *a2, ...)
{
  return [a1 setTrackingURLSubstitutionParameter:];
}

id objc_msgSend_setTransformationBlock_(void *a1, const char *a2, ...)
{
  return [a1 setTransformationBlock:];
}

id objc_msgSend_setTransparencyDetails_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyDetails:];
}

id objc_msgSend_setTransparencyDetailsUnavailableMessage_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyDetailsUnavailableMessage:];
}

id objc_msgSend_setTransparencyRendererPayload_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyRendererPayload:];
}

id objc_msgSend_setTransparencyRendererURL_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyRendererURL:];
}

id objc_msgSend_setTreatment_(void *a1, const char *a2, ...)
{
  return [a1 setTreatment:];
}

id objc_msgSend_setTvshowsRank_(void *a1, const char *a2, ...)
{
  return [a1 setTvshowsRank:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return [a1 setURL:];
}

id objc_msgSend_setUnbranded_(void *a1, const char *a2, ...)
{
  return [a1 setUnbranded:];
}

id objc_msgSend_setUnfilledReasonInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUnfilledReasonInfo:];
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setUniqueIdentifier:];
}

id objc_msgSend_setUpMainDatabase(void *a1, const char *a2, ...)
{
  return _[a1 setUpMainDatabase];
}

id objc_msgSend_setUpdateCount_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateCount:];
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return [a1 setUrl:];
}

id objc_msgSend_setUseAMSMescal_(void *a1, const char *a2, ...)
{
  return [a1 setUseAMSMescal:];
}

id objc_msgSend_setUseAMSMescalObject_(void *a1, const char *a2, ...)
{
  return [a1 setUseAMSMescalObject:];
}

id objc_msgSend_setUseAMSMescalValue_(void *a1, const char *a2, ...)
{
  return [a1 setUseAMSMescalValue:];
}

id objc_msgSend_setUseFixedHttpSessionManager_(void *a1, const char *a2, ...)
{
  return [a1 setUseFixedHttpSessionManager:];
}

id objc_msgSend_setUserAgent_(void *a1, const char *a2, ...)
{
  return [a1 setUserAgent:];
}

id objc_msgSend_setUserKeyboards_(void *a1, const char *a2, ...)
{
  return [a1 setUserKeyboards:];
}

id objc_msgSend_setUserStatus_(void *a1, const char *a2, ...)
{
  return [a1 setUserStatus:];
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return [a1 setUuid:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forColumnName_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forColumnName:];
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forHTTPHeaderField:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValue_forKey_settings_error_(void *a1, const char *a2, ...)
{
  return [a1 setValue:x0 forKey:x1 settings:x2 error:x3];
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKeyPath:];
}

id objc_msgSend_setValueString_(void *a1, const char *a2, ...)
{
  return [a1 setValueString:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return [a1 setVersion:];
}

id objc_msgSend_setVideoEventSequence_(void *a1, const char *a2, ...)
{
  return [a1 setVideoEventSequence:];
}

id objc_msgSend_setVideoFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setVideoFileURL:];
}

id objc_msgSend_setVideoFormat_(void *a1, const char *a2, ...)
{
  return [a1 setVideoFormat:];
}

id objc_msgSend_setVideoSoundCheckData_(void *a1, const char *a2, ...)
{
  return [a1 setVideoSoundCheckData:];
}

id objc_msgSend_setVideoState_(void *a1, const char *a2, ...)
{
  return [a1 setVideoState:];
}

id objc_msgSend_setVideoURL_(void *a1, const char *a2, ...)
{
  return [a1 setVideoURL:];
}

id objc_msgSend_setVideoUnloadedSent_(void *a1, const char *a2, ...)
{
  return [a1 setVideoUnloadedSent:];
}

id objc_msgSend_setVideoVisibility_(void *a1, const char *a2, ...)
{
  return [a1 setVideoVisibility:];
}

id objc_msgSend_setViewDayOfYear_(void *a1, const char *a2, ...)
{
  return [a1 setViewDayOfYear:];
}

id objc_msgSend_setVisibilityTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setVisibilityTimestamp:];
}

id objc_msgSend_setVisiblePercentage_(void *a1, const char *a2, ...)
{
  return [a1 setVisiblePercentage:];
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return [a1 setVolume:];
}

id objc_msgSend_setWasFullyVisible_(void *a1, const char *a2, ...)
{
  return [a1 setWasFullyVisible:];
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return [a1 setWidth:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setWithCapacity:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setX_(void *a1, const char *a2, ...)
{
  return [a1 setX:];
}

id objc_msgSend_setY_(void *a1, const char *a2, ...)
{
  return [a1 setY:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsForThisDeviceOnly_(void *a1, const char *a2, ...)
{
  return [a1 settingsForThisDeviceOnly:];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}

id objc_msgSend_setupNegotiationStepDidFinish_certificateIsCached_error_(void *a1, const char *a2, ...)
{
  return [a1 setupNegotiationStepDidFinish:certificateIsCached:error:];
}

id objc_msgSend_setupQueue(void *a1, const char *a2, ...)
{
  return _[a1 setupQueue];
}

id objc_msgSend_setupStartTime(void *a1, const char *a2, ...)
{
  return _[a1 setupStartTime];
}

id objc_msgSend_setupWithCompletion_completion_(void *a1, const char *a2, ...)
{
  return [a1 setupWithCompletion:completion:];
}

id objc_msgSend_setupWithTimeout_completion_(void *a1, const char *a2, ...)
{
  return [a1 setupWithTimeout:x0 completion:x1];
}

id objc_msgSend_sha1(void *a1, const char *a2, ...)
{
  return _[a1 sha1];
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return _[a1 sha256];
}

id objc_msgSend_sha256hash(void *a1, const char *a2, ...)
{
  return _[a1 sha256hash];
}

id objc_msgSend_shadowStyle(void *a1, const char *a2, ...)
{
  return _[a1 shadowStyle];
}

id objc_msgSend_sharedAPNetworkClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedAPNetworkClient];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedRepository(void *a1, const char *a2, ...)
{
  return _[a1 sharedRepository];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_shelveClosedForChannel_(void *a1, const char *a2, ...)
{
  return [a1 shelveClosedForChannel:];
}

id objc_msgSend_shortCircuitBundleIdentifier_condition_(void *a1, const char *a2, ...)
{
  return [a1 shortCircuitBundleIdentifier:condition:];
}

id objc_msgSend_shouldIgnoreMetric_(void *a1, const char *a2, ...)
{
  return [a1 shouldIgnoreMetric:];
}

id objc_msgSend_shouldRotate(void *a1, const char *a2, ...)
{
  return _[a1 shouldRotate];
}

id objc_msgSend_shouldSendAdSpaceStatusEvent_(void *a1, const char *a2, ...)
{
  return [a1 shouldSendAdSpaceStatusEvent:];
}

id objc_msgSend_shouldSignRequestWithMessageId_(void *a1, const char *a2, ...)
{
  return [a1 shouldSignRequestWithMessageId:];
}

id objc_msgSend_shouldUseAMSMescalWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 shouldUseAMSMescalWithCompletionHandler:];
}

id objc_msgSend_signPayloadWithFpdi_requestTimestamp_interval_jsonBody_startDate_payloadDeliveryStartDate_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 signPayloadWithFpdi:x0 requestTimestamp:x1 interval:x2 jsonBody:x3 startDate:x4 payloadDeliveryStartDate:x5 completionHandler:x6];
}

id objc_msgSend_signPayloadWithMescal_requestTimestamp_interval_jsonBody_startDate_deliveryStartDate_isFallback_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:");
}

id objc_msgSend_signalMonitor(void *a1, const char *a2, ...)
{
  return _[a1 signalMonitor];
}

id objc_msgSend_signalStrength(void *a1, const char *a2, ...)
{
  return _[a1 signalStrength];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _[a1 signature];
}

id objc_msgSend_signatureForData_error_(void *a1, const char *a2, ...)
{
  return [a1 signatureForData:x0 error:x1];
}

id objc_msgSend_signatureForData_waitTime_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signatureForData:waitTime:completion:");
}

id objc_msgSend_signatureFromData_type_bag_error_(void *a1, const char *a2, ...)
{
  return [a1 signatureFromData:x0 type:x1 bag:x2 error:x3];
}

id objc_msgSend_signatureIsValid_data_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signatureIsValid:data:error:")];
}

id objc_msgSend_signatureWithObjCTypes_(void *a1, const char *a2, ...)
{
  return [a1 signatureWithObjCTypes:];
}

id objc_msgSend_signedAttributionToken(void *a1, const char *a2, ...)
{
  return _[a1 signedAttributionToken];
}

id objc_msgSend_signedPathFromUnsigned_(void *a1, const char *a2, ...)
{
  return [a1 signedPathFromUnsigned:];
}

id objc_msgSend_signingAuthorityPoolManager(void *a1, const char *a2, ...)
{
  return _[a1 signingAuthorityPoolManager];
}

id objc_msgSend_signingPercentageFPDI(void *a1, const char *a2, ...)
{
  return _[a1 signingPercentageFPDI];
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return _[a1 signpostID];
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return [a1 sinkWithCompletion:x0 receiveInput:x1];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_skipThreshold(void *a1, const char *a2, ...)
{
  return _[a1 skipThreshold];
}

id objc_msgSend_sortByRank_(void *a1, const char *a2, ...)
{
  return [a1 sortByRank:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceAppAdamId(void *a1, const char *a2, ...)
{
  return _[a1 sourceAppAdamId];
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return _[a1 specification];
}

id objc_msgSend_splitCapData_(void *a1, const char *a2, ...)
{
  return [a1 splitCapData:];
}

id objc_msgSend_sponsoredBy(void *a1, const char *a2, ...)
{
  return _[a1 sponsoredBy];
}

id objc_msgSend_sponsoredByAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 sponsoredByAssetURL];
}

id objc_msgSend_sponsoredByAssetURLForDarkMode(void *a1, const char *a2, ...)
{
  return _[a1 sponsoredByAssetURLForDarkMode];
}

id objc_msgSend_srcEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 srcEnumerator];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startDeliveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 startDeliveryTimer];
}

id objc_msgSend_startDirectory(void *a1, const char *a2, ...)
{
  return _[a1 startDirectory];
}

id objc_msgSend_startGCWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 startGCWithCompletionHandler:];
}

id objc_msgSend_startListeners(void *a1, const char *a2, ...)
{
  return _[a1 startListeners];
}

id objc_msgSend_startMinimumTimer_(void *a1, const char *a2, ...)
{
  return [a1 startMinimumTimer:];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoring];
}

id objc_msgSend_startNextTimer(void *a1, const char *a2, ...)
{
  return _[a1 startNextTimer];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_startTimer_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 startTimer:withResponse:];
}

id objc_msgSend_startWithLegacyInterface_(void *a1, const char *a2, ...)
{
  return [a1 startWithLegacyInterface:];
}

id objc_msgSend_startWithSession_request_requestorId_intervalId_reportingStorefront_requestTimestamp_daemonStartTime_tokenReturnedToClientDate_payloadDeliveryStartDate_(void *a1, const char *a2, ...)
{
  return [a1 startWithSession:x0 request:x1 requestorId:x2 intervalId:x3 reportingStorefront:x4 requestTimestamp:x5 daemonStartTime:x6 tokenReturnedToClientDate:x7 payloadDeliveryStartDate:x8];
}

id objc_msgSend_startWorkCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 startWorkCoordinator];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return _[a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return _[a1 stateLock];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusConditionExpression(void *a1, const char *a2, ...)
{
  return _[a1 statusConditionExpression];
}

id objc_msgSend_statusEventSent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "statusEventSent:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopGC(void *a1, const char *a2, ...)
{
  return _[a1 stopGC];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoring];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return _[a1 storage];
}

id objc_msgSend_storageClass(void *a1, const char *a2, ...)
{
  return _[a1 storageClass];
}

id objc_msgSend_storageLock(void *a1, const char *a2, ...)
{
  return _[a1 storageLock];
}

id objc_msgSend_storageRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 storageRepresentation];
}

id objc_msgSend_storeAdPolicies_(void *a1, const char *a2, ...)
{
  return [a1 storeAdPolicies:];
}

id objc_msgSend_storeDeliveryReportType_dayOfYear_frequency_reportDate_(void *a1, const char *a2, ...)
{
  return [a1 storeDeliveryReportType:dayOfYear:frequency:reportDate:];
}

id objc_msgSend_storeEntryForContentId_(void *a1, const char *a2, ...)
{
  return [a1 storeEntryForContentId:];
}

id objc_msgSend_storeFront(void *a1, const char *a2, ...)
{
  return _[a1 storeFront];
}

id objc_msgSend_storeFrontLocale(void *a1, const char *a2, ...)
{
  return _[a1 storeFrontLocale];
}

id objc_msgSend_storeObject_atPath_error_(void *a1, const char *a2, ...)
{
  return [a1 storeObject:x0 atPath:x1 error:x2];
}

id objc_msgSend_storefront(void *a1, const char *a2, ...)
{
  return _[a1 storefront];
}

id objc_msgSend_storefrontCountryOnly_(void *a1, const char *a2, ...)
{
  return [a1 storefrontCountryOnly:];
}

id objc_msgSend_storefrontOverride(void *a1, const char *a2, ...)
{
  return _[a1 storefrontOverride];
}

id objc_msgSend_storyboardSizesAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 storyboardSizesAtIndex:];
}

id objc_msgSend_storyboardSizesCount(void *a1, const char *a2, ...)
{
  return _[a1 storyboardSizesCount];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _[a1 stream];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingCharactersInRange:withString:];
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingMatchesInString:options:range:withTemplate:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:];
}

id objc_msgSend_stringForMetric_(void *a1, const char *a2, ...)
{
  return [a1 stringForMetric:];
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return [a1 stringFromByteCount:x0 countStyle:x1];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return [a1 stringWithValidatedFormat:x0 validFormatSpecifiers:x1 error:x2];
}

id objc_msgSend_stringsToColorArray_(void *a1, const char *a2, ...)
{
  return [a1 stringsToColorArray];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subAdminArea(void *a1, const char *a2, ...)
{
  return _[a1 subAdminArea];
}

id objc_msgSend_subAdministrativeArea(void *a1, const char *a2, ...)
{
  return _[a1 subAdministrativeArea];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subdataWithRange:];
}

id objc_msgSend_submitReport(void *a1, const char *a2, ...)
{
  return _[a1 submitReport];
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 submitTaskRequest:error];
}

id objc_msgSend_subscribeForDictMessage_handler_(void *a1, const char *a2, ...)
{
  return [a1 subscribeForDictMessage:x0 handler:x1];
}

id objc_msgSend_subscribeForMessage_handler_(void *a1, const char *a2, ...)
{
  return [a1 subscribeForMessage:x0 handler:x1];
}

id objc_msgSend_subscriptionSourceID(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionSourceID];
}

id objc_msgSend_subscriptionType(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionType];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_successCount(void *a1, const char *a2, ...)
{
  return _[a1 successCount];
}

id objc_msgSend_supplementalContext(void *a1, const char *a2, ...)
{
  return _[a1 supplementalContext];
}

id objc_msgSend_supportedPaymentNetworksAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 supportedPaymentNetworksAtIndex:];
}

id objc_msgSend_supportedPaymentNetworksCount(void *a1, const char *a2, ...)
{
  return _[a1 supportedPaymentNetworksCount];
}

id objc_msgSend_syncRequestsLock(void *a1, const char *a2, ...)
{
  return _[a1 syncRequestsLock];
}

id objc_msgSend_systemDescription(void *a1, const char *a2, ...)
{
  return _[a1 systemDescription];
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _[a1 systemName];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _[a1 systemVersion];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableDayOfYear(void *a1, const char *a2, ...)
{
  return _[a1 tableDayOfYear];
}

id objc_msgSend_tagTransformationsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 tagTransformationsAtIndex:];
}

id objc_msgSend_tagTransformationsCount(void *a1, const char *a2, ...)
{
  return _[a1 tagTransformationsCount];
}

id objc_msgSend_tagsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 tagsAtIndex:];
}

id objc_msgSend_tagsCount(void *a1, const char *a2, ...)
{
  return _[a1 tagsCount];
}

id objc_msgSend_tapAction(void *a1, const char *a2, ...)
{
  return _[a1 tapAction];
}

id objc_msgSend_targetingDimensions(void *a1, const char *a2, ...)
{
  return _[a1 targetingDimensions];
}

id objc_msgSend_targetingExpression(void *a1, const char *a2, ...)
{
  return _[a1 targetingExpression];
}

id objc_msgSend_targetingExpressionId(void *a1, const char *a2, ...)
{
  return _[a1 targetingExpressionId];
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 taskRequestForIdentifier:];
}

id objc_msgSend_telephony(void *a1, const char *a2, ...)
{
  return _[a1 telephony];
}

id objc_msgSend_telephonyError(void *a1, const char *a2, ...)
{
  return _[a1 telephonyError];
}

id objc_msgSend_temporarySessionForClient_(void *a1, const char *a2, ...)
{
  return [a1 temporarySessionForClient:];
}

id objc_msgSend_terminateConnection(void *a1, const char *a2, ...)
{
  return _[a1 terminateConnection];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_theConfigurationAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 theConfigurationAtIndex:];
}

id objc_msgSend_theConfigurationsCount(void *a1, const char *a2, ...)
{
  return _[a1 theConfigurationsCount];
}

id objc_msgSend_tiltStationBlob(void *a1, const char *a2, ...)
{
  return _[a1 tiltStationBlob];
}

id objc_msgSend_tiltTrackBlobAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 tiltTrackBlobAtIndex:];
}

id objc_msgSend_tiltTrackBlobs(void *a1, const char *a2, ...)
{
  return _[a1 tiltTrackBlobs];
}

id objc_msgSend_tiltTrackBlobsCount(void *a1, const char *a2, ...)
{
  return _[a1 tiltTrackBlobsCount];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeSincePrevLaunch(void *a1, const char *a2, ...)
{
  return _[a1 timeSincePrevLaunch];
}

id objc_msgSend_timeSpent(void *a1, const char *a2, ...)
{
  return _[a1 timeSpent];
}

id objc_msgSend_timeSpentLegacyInterface(void *a1, const char *a2, ...)
{
  return _[a1 timeSpentLegacyInterface];
}

id objc_msgSend_timeSpentMetricTTL(void *a1, const char *a2, ...)
{
  return _[a1 timeSpentMetricTTL];
}

id objc_msgSend_timeSpentProcessor(void *a1, const char *a2, ...)
{
  return _[a1 timeSpentProcessor];
}

id objc_msgSend_timeZoneWithAbbreviation_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithAbbreviation:];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithName:];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toJSONObject(void *a1, const char *a2, ...)
{
  return _[a1 toJSONObject];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenCount_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "tokenCount:error:")];
}

id objc_msgSend_tokenDaemonStart(void *a1, const char *a2, ...)
{
  return _[a1 tokenDaemonStart];
}

id objc_msgSend_tokenPayloadDeliveryStartTime(void *a1, const char *a2, ...)
{
  return _[a1 tokenPayloadDeliveryStartTime];
}

id objc_msgSend_tokenReturnedToClientDate(void *a1, const char *a2, ...)
{
  return _[a1 tokenReturnedToClientDate];
}

id objc_msgSend_tokenService(void *a1, const char *a2, ...)
{
  return _[a1 tokenService];
}

id objc_msgSend_tokenWithDetail_interval_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 tokenWithDetail:x0 interval:x1 completionHandler:x2];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return _[a1 tokens];
}

id objc_msgSend_tokensLock(void *a1, const char *a2, ...)
{
  return _[a1 tokensLock];
}

id objc_msgSend_toroID(void *a1, const char *a2, ...)
{
  return _[a1 toroID];
}

id objc_msgSend_toroId(void *a1, const char *a2, ...)
{
  return _[a1 toroId];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return _[a1 totalSize];
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_touchFileAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 touchFileAtPath:error:];
}

id objc_msgSend_touchObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 touchObjectForKey:];
}

id objc_msgSend_touchObjectForKey_transaction_(void *a1, const char *a2, ...)
{
  return [a1 touchObjectForKey:transaction:];
}

id objc_msgSend_trace(void *a1, const char *a2, ...)
{
  return _[a1 trace];
}

id objc_msgSend_trackingURLAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 trackingURLAtIndex:];
}

id objc_msgSend_trackingURLsCount(void *a1, const char *a2, ...)
{
  return _[a1 trackingURLsCount];
}

id objc_msgSend_transformationBlock(void *a1, const char *a2, ...)
{
  return _[a1 transformationBlock];
}

id objc_msgSend_transformedContext(void *a1, const char *a2, ...)
{
  return _[a1 transformedContext];
}

id objc_msgSend_transformedContextJSON_(void *a1, const char *a2, ...)
{
  return [a1 transformedContextJSON];
}

id objc_msgSend_transientContent(void *a1, const char *a2, ...)
{
  return _[a1 transientContent];
}

id objc_msgSend_transientDataDidChange(void *a1, const char *a2, ...)
{
  return _[a1 transientDataDidChange];
}

id objc_msgSend_translate_(void *a1, const char *a2, ...)
{
  return [a1 translate:];
}

id objc_msgSend_translateResponse_requestParams_responseReceivedTimestamp_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "translateResponse:requestParams:responseReceivedTimestamp:error:");
}

id objc_msgSend_translateWithPromotedContent_placement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "translateWithPromotedContent:placement:");
}

id objc_msgSend_transmitter(void *a1, const char *a2, ...)
{
  return _[a1 transmitter];
}

id objc_msgSend_transparencyDetails(void *a1, const char *a2, ...)
{
  return _[a1 transparencyDetails];
}

id objc_msgSend_transparencyRendererPayload(void *a1, const char *a2, ...)
{
  return _[a1 transparencyRendererPayload];
}

id objc_msgSend_transparencyRendererURL(void *a1, const char *a2, ...)
{
  return _[a1 transparencyRendererURL];
}

id objc_msgSend_treatment(void *a1, const char *a2, ...)
{
  return _[a1 treatment];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uRLsToEvictAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 uRLsToEvictAtIndex:];
}

id objc_msgSend_uRLsToEvictsCount(void *a1, const char *a2, ...)
{
  return _[a1 uRLsToEvictsCount];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClass:x0 fromData:x1 error:x2];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return _[a1 underlyingErrors];
}

id objc_msgSend_unencryptedIAdID(void *a1, const char *a2, ...)
{
  return _[a1 unencryptedIAdID];
}

id objc_msgSend_unfilledReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 unfilledReasonCode];
}

id objc_msgSend_unfilledReasonCodeToASEStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 unfilledReasonCodeToASEStatusCode:];
}

id objc_msgSend_unfilledReasonInfo(void *a1, const char *a2, ...)
{
  return _[a1 unfilledReasonInfo];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockObject(void *a1, const char *a2, ...)
{
  return _[a1 unlockObject];
}

id objc_msgSend_unsavedReferences(void *a1, const char *a2, ...)
{
  return _[a1 unsavedReferences];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unused(void *a1, const char *a2, ...)
{
  return _[a1 unused];
}

id objc_msgSend_updateCellularSignalStrength(void *a1, const char *a2, ...)
{
  return _[a1 updateCellularSignalStrength];
}

id objc_msgSend_updateClientBundleID_(void *a1, const char *a2, ...)
{
  return [a1 updateClientBundleID:];
}

id objc_msgSend_updateConfigurationSystemWithData_(void *a1, const char *a2, ...)
{
  return [a1 updateConfigurationSystemWithData:];
}

id objc_msgSend_updateCount(void *a1, const char *a2, ...)
{
  return _[a1 updateCount];
}

id objc_msgSend_updateTelephonyProperties(void *a1, const char *a2, ...)
{
  return _[a1 updateTelephonyProperties];
}

id objc_msgSend_uploadFailureWithType_code_batchIDs_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "uploadFailureWithType:code:batchIDs:");
}

id objc_msgSend_uploadSuccess(void *a1, const char *a2, ...)
{
  return _[a1 uploadSuccess];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_useAMSBag(void *a1, const char *a2, ...)
{
  return _[a1 useAMSBag];
}

id objc_msgSend_useAMSBagValue(void *a1, const char *a2, ...)
{
  return _[a1 useAMSBagValue];
}

id objc_msgSend_useAMSMescal(void *a1, const char *a2, ...)
{
  return _[a1 useAMSMescal];
}

id objc_msgSend_useAMSMescalObject(void *a1, const char *a2, ...)
{
  return _[a1 useAMSMescalObject];
}

id objc_msgSend_useAMSMescalValue(void *a1, const char *a2, ...)
{
  return _[a1 useAMSMescalValue];
}

id objc_msgSend_userAccount(void *a1, const char *a2, ...)
{
  return _[a1 userAccount];
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return _[a1 userAgent];
}

id objc_msgSend_userAgentStringForBundleID_storefront_(void *a1, const char *a2, ...)
{
  return [a1 userAgentStringForBundleID:storefront:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userKeyboardAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 userKeyboardAtIndex:];
}

id objc_msgSend_userKeyboardsCount(void *a1, const char *a2, ...)
{
  return _[a1 userKeyboardsCount];
}

id objc_msgSend_userStatus(void *a1, const char *a2, ...)
{
  return _[a1 userStatus];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _[a1 valid];
}

id objc_msgSend_validClassInputs(void *a1, const char *a2, ...)
{
  return _[a1 validClassInputs];
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return _[a1 validate];
}

id objc_msgSend_validateCurrent(void *a1, const char *a2, ...)
{
  return _[a1 validateCurrent];
}

id objc_msgSend_validateName_error_(void *a1, const char *a2, ...)
{
  return [a1 validateName:error];
}

id objc_msgSend_validateWhitelistingForCondition_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 validateWhitelistingForCondition:forBundleIdentifier:];
}

id objc_msgSend_validateWhitelistingForRead_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "validateWhitelistingForRead:");
}

id objc_msgSend_validationErrorWithCode_andReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "validationErrorWithCode:andReason:");
}

id objc_msgSend_validationFailed_reason_(void *a1, const char *a2, ...)
{
  return [a1 validationFailed:reason:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueBool(void *a1, const char *a2, ...)
{
  return _[a1 valueBool];
}

id objc_msgSend_valueDouble(void *a1, const char *a2, ...)
{
  return _[a1 valueDouble];
}

id objc_msgSend_valueForColumnName_(void *a1, const char *a2, ...)
{
  return [a1 valueForColumnName:];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 valueForHTTPHeaderField:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForKey_settings_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "valueForKey:settings:error:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 valueForKeyPath:];
}

id objc_msgSend_valueInt(void *a1, const char *a2, ...)
{
  return _[a1 valueInt];
}

id objc_msgSend_valuePromise(void *a1, const char *a2, ...)
{
  return _[a1 valuePromise];
}

id objc_msgSend_valueString(void *a1, const char *a2, ...)
{
  return _[a1 valueString];
}

id objc_msgSend_valueTranslated_forKey_(void *a1, const char *a2, ...)
{
  return [a1 valueTranslated:forKey:];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCompletion:];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_versionedAttributionDetailsAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 versionedAttributionDetailsAtIndex:];
}

id objc_msgSend_versionedAttributionDetailsCount(void *a1, const char *a2, ...)
{
  return _[a1 versionedAttributionDetailsCount];
}

id objc_msgSend_videoAssetAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 videoAssetAtIndex:];
}

id objc_msgSend_videoAssetsCount(void *a1, const char *a2, ...)
{
  return _[a1 videoAssetsCount];
}

id objc_msgSend_videoEventSequence(void *a1, const char *a2, ...)
{
  return _[a1 videoEventSequence];
}

id objc_msgSend_videoLoaded_(void *a1, const char *a2, ...)
{
  return [a1 videoLoaded:];
}

id objc_msgSend_videoState(void *a1, const char *a2, ...)
{
  return _[a1 videoState];
}

id objc_msgSend_videoStateChanged_fromMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "videoStateChanged:fromMetric:");
}

id objc_msgSend_videoUnloaded(void *a1, const char *a2, ...)
{
  return _[a1 videoUnloaded];
}

id objc_msgSend_videoUnloadedSent(void *a1, const char *a2, ...)
{
  return _[a1 videoUnloadedSent];
}

id objc_msgSend_videoVisibility(void *a1, const char *a2, ...)
{
  return _[a1 videoVisibility];
}

id objc_msgSend_viewDayOfYear(void *a1, const char *a2, ...)
{
  return _[a1 viewDayOfYear];
}

id objc_msgSend_visibilityTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 visibilityTimestamp];
}

id objc_msgSend_visiblePercent(void *a1, const char *a2, ...)
{
  return _[a1 visiblePercent];
}

id objc_msgSend_visibleStateChanged_duration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "visibleStateChanged:duration:");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _[a1 volume];
}

id objc_msgSend_volumeChanged_(void *a1, const char *a2, ...)
{
  return [a1 volumeChanged:];
}

id objc_msgSend_wasFullyVisible(void *a1, const char *a2, ...)
{
  return _[a1 wasFullyVisible];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsPointerArray];
}

id objc_msgSend_weakToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToWeakObjectsMapTable];
}

id objc_msgSend_whitelistingsDisabled(void *a1, const char *a2, ...)
{
  return _[a1 whitelistingsDisabled];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _[a1 width];
}

id objc_msgSend_willUploadWithBatchCount_(void *a1, const char *a2, ...)
{
  return [a1 willUploadWithBatchCount:];
}

id objc_msgSend_withdrawShelvedBatchesForChannel_groupBatches_withSaveObjectBlock_(void *a1, const char *a2, ...)
{
  return [a1 withdrawShelvedBatchesForChannel:groupBatches:withSaveObjectBlock:];
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return _[a1 workBlock];
}

id objc_msgSend_wrapper(void *a1, const char *a2, ...)
{
  return _[a1 wrapper];
}

id objc_msgSend_writable(void *a1, const char *a2, ...)
{
  return _[a1 writable];
}

id objc_msgSend_writeData_toFile_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeData:toFile:error:");
}

id objc_msgSend_writeTo_(void *a1, const char *a2, ...)
{
  return [a1 writeTo:];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_yearDayOfYearHourMinute(void *a1, const char *a2, ...)
{
  return _[a1 yearDayOfYearHourMinute];
}