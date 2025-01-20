uint64_t sub_1000024A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_100002CF8(&qword_1000183C8);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002CA4();
  sub_10000EF00();
  v4 = sub_10000EE90();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_10000EF00();
  v6 = sub_10000EE90();
  v5(v3, v0);
  sub_10000EF00();
  v7 = sub_10000EE90();
  v5(v3, v0);
  sub_100002CF8(&qword_1000183D0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10000FC30;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  v9 = sub_10000EE80();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000026AC()
{
  uint64_t v0 = sub_10000EEF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002D58();
  sub_10000EE70();
  swift_release();
  sub_100002CA4();
  sub_10000EEE0();
  uint64_t v4 = sub_10000EED0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002CF8(&qword_1000183C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000FC40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10000EEC0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002814@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000EDF0();
  *a1 = v3;
  return result;
}

uint64_t sub_100002850()
{
  return sub_10000EE00();
}

uint64_t sub_100002888()
{
  uint64_t v0 = sub_10000EEB0();
  uint64_t v1 = sub_10000EEB0();
  uint64_t v2 = sub_10000EEB0();
  sub_100002CF8(&qword_1000183A8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000FC30;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_10000EEA0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100002954()
{
  uint64_t v0 = sub_10000EEB0();
  uint64_t v1 = sub_10000EEB0();
  sub_100002CF8(&qword_1000183A8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000FC50;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_10000EEA0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000029FC()
{
  uint64_t v0 = sub_10000EF30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_1000036B4();
  sub_100002CA4();
  sub_10000EF40();
  uint64_t v4 = sub_10000EF20();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002CF8(&qword_1000183B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000FC40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10000EF10();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002B5C()
{
  uint64_t v0 = sub_10000EE60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002CA4();
  sub_10000EE50();
  uint64_t v4 = sub_10000EE40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002CF8(&qword_1000183A0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000FC40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10000EE30();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for TranslateAssistantIntents()
{
  return &type metadata for TranslateAssistantIntents;
}

unint64_t sub_100002CA4()
{
  unint64_t result = qword_100018398;
  if (!qword_100018398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018398);
  }
  return result;
}

uint64_t sub_100002CF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100002D3C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002D4C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_100002D58()
{
  unint64_t result = qword_1000183B8;
  if (!qword_1000183B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183B8);
  }
  return result;
}

void type metadata accessor for SNAInvalidationReason(uint64_t a1)
{
}

void type metadata accessor for SNAAssertionState(uint64_t a1)
{
}

void sub_100002DD4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100002E1C()
{
  uint64_t v0 = sub_10000F2A0();
  sub_100002E9C(v0, qword_10001AC70);
  sub_100002F00(v0, (uint64_t)qword_10001AC70);
  return sub_10000F290();
}

uint64_t *sub_100002E9C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002F00(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100002F3C()
{
  unint64_t result = qword_1000183F8;
  if (!qword_1000183F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183F8);
  }
  return result;
}

unint64_t sub_100002F94()
{
  unint64_t result = qword_100018400;
  if (!qword_100018400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018400);
  }
  return result;
}

uint64_t sub_100002FE8()
{
  sub_10000EDF0();
  return v1;
}

uint64_t sub_10000301C()
{
  uint64_t v0 = sub_10000F0B0();
  sub_100002E9C(v0, qword_10001AC88);
  sub_100002F00(v0, (uint64_t)qword_10001AC88);
  return sub_10000F090();
}

uint64_t sub_100003080@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000EDF0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000030BC()
{
  return sub_10000EE00();
}

void (*sub_1000030F4(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000EDE0();
  return sub_100003150;
}

void sub_100003150(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000031A4()
{
  unint64_t result = qword_100018408;
  if (!qword_100018408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018408);
  }
  return result;
}

uint64_t sub_1000031F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100003B5C();
  unint64_t v5 = sub_100003C04();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100003264()
{
  uint64_t v0 = qword_1000183E8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000032A4()
{
  unint64_t result = qword_100018410;
  if (!qword_100018410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018410);
  }
  return result;
}

unint64_t sub_1000032FC()
{
  unint64_t result = qword_100018418;
  if (!qword_100018418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018418);
  }
  return result;
}

uint64_t sub_100003350()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000033A0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018358 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000F0B0();
  uint64_t v3 = sub_100002F00(v2, (uint64_t)qword_10001AC88);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100003448()
{
  return 0;
}

uint64_t sub_100003454()
{
  return 1;
}

uint64_t sub_100003464(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003B5C();
  unint64_t v7 = sub_100003BB0();
  unint64_t v8 = sub_100003C04();
  *unint64_t v5 = v2;
  v5[1] = sub_100003538;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100003538()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100003640@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000036B4();
  *a1 = result;
  return result;
}

uint64_t sub_100003668(uint64_t a1)
{
  unint64_t v2 = sub_100002CA4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenTranslationDeepLinksIntent()
{
  return &type metadata for OpenTranslationDeepLinksIntent;
}

uint64_t sub_1000036B4()
{
  uint64_t v0 = sub_10000F010();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v22 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002CF8(&qword_100018428);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - v4;
  uint64_t v6 = sub_100002CF8(&qword_100018430);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000F0A0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000F190();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10000F420();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10000F0B0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v20 = sub_100002CF8(&qword_100018438);
  sub_10000F410();
  sub_10000F150();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  sub_10000F0C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v25 = 3;
  uint64_t v17 = sub_10000EDC0();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v5, 1, 1, v17);
  v18(v21, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100003B08();
  return sub_10000EE10();
}

unint64_t sub_100003B08()
{
  unint64_t result = qword_100018440;
  if (!qword_100018440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018440);
  }
  return result;
}

unint64_t sub_100003B5C()
{
  unint64_t result = qword_100018448;
  if (!qword_100018448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018448);
  }
  return result;
}

unint64_t sub_100003BB0()
{
  unint64_t result = qword_100018450;
  if (!qword_100018450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018450);
  }
  return result;
}

unint64_t sub_100003C04()
{
  unint64_t result = qword_100018458;
  if (!qword_100018458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018458);
  }
  return result;
}

uint64_t sub_100003C58()
{
  return 0;
}

uint64_t sub_100003C64()
{
  return 0;
}

void sub_100003C70(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100003C7C(uint64_t a1)
{
  unint64_t v2 = sub_100007298();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003CB8(uint64_t a1)
{
  unint64_t v2 = sub_100007298();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003CF4(uint64_t a1)
{
  return sub_100008428(a1);
}

uint64_t sub_100003D1C(void *a1)
{
  uint64_t v2 = sub_100002CF8(&qword_1000184C8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007254(a1, a1[3]);
  sub_100007298();
  sub_10000F710();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int sub_100003E2C()
{
  return sub_10000F6F0();
}

Swift::Int sub_100003E68()
{
  return sub_10000F6F0();
}

uint64_t sub_100003E9C(char a1)
{
  if (a1) {
    return 0x436C6F72746E6F63;
  }
  else {
    return 0x75426E6F69746361;
  }
}

uint64_t sub_100003EE8(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_100002CF8(&qword_1000185D8);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100002CF8(&qword_1000185E0);
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002CF8(&qword_1000185E8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007254(a1, a1[3]);
  sub_1000093E8();
  sub_10000F710();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_10000943C();
    sub_10000F650();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_100009490();
    sub_10000F650();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

uint64_t sub_100004198(void *a1, char a2)
{
  char v3 = a2 & 1;
  uint64_t v4 = sub_100002CF8(&qword_1000184F0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100007254(a1, a1[3]);
  sub_10000832C();
  sub_10000F710();
  v9[15] = v3;
  sub_1000083D4();
  sub_10000F660();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000042DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10000430C(uint64_t a1)
{
  unint64_t v2 = sub_100009490();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004348(uint64_t a1)
{
  unint64_t v2 = sub_100009490();

  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_100004384(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_1000043A0()
{
  sub_10000F6E0(*v0);
}

uint64_t sub_1000043D0()
{
  return sub_100003E9C(*v0);
}

uint64_t sub_1000043D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100007BA4(a1, a2);
  *a3 = result;
  return result;
}

void sub_100004400(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000440C(uint64_t a1)
{
  unint64_t v2 = sub_1000093E8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004448(uint64_t a1)
{
  unint64_t v2 = sub_1000093E8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100004484(uint64_t a1)
{
  unint64_t v2 = sub_10000943C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000044C0(uint64_t a1)
{
  unint64_t v2 = sub_10000943C();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1000044FC()
{
  Swift::UInt v1 = *v0;
  sub_10000F6D0();
  sub_10000F6E0(v1);
  return sub_10000F6F0();
}

Swift::Int sub_100004544()
{
  Swift::UInt v1 = *v0;
  sub_10000F6D0();
  sub_10000F6E0(v1);
  return sub_10000F6F0();
}

uint64_t sub_100004588@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100007CB8(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_1000045B8(void *a1)
{
  return sub_100003EE8(a1, *v1);
}

Swift::Int sub_1000045D4()
{
  return sub_10000F6F0();
}

void sub_100004618()
{
}

Swift::Int sub_100004640()
{
  return sub_10000F6F0();
}

uint64_t sub_100004684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100008108(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000046B0(uint64_t a1)
{
  unint64_t v2 = sub_10000832C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000046EC(uint64_t a1)
{
  unint64_t v2 = sub_10000832C();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100004728@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000081C0(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_100004758(void *a1)
{
  return sub_100004198(a1, *v1);
}

id sub_100004774()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for SpeechTranslationActivityManager()) init];
  qword_10001ACA0 = (uint64_t)result;
  return result;
}

void sub_1000047FC(char a1)
{
  uint64_t v2 = v1;
  char v3 = a1 & 1;
  uint64_t v4 = sub_10000F2A0();
  uint64_t v47 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000F240();
  uint64_t v49 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002CF8(&qword_100018558);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100002CF8(&qword_100018550);
  uint64_t v13 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005160(0);
  if (qword_100018350 != -1) {
    swift_once();
  }
  v46 = v6;
  uint64_t v51 = sub_100002F00(v4, (uint64_t)qword_10001AC70);
  uint64_t v16 = sub_10000F280();
  os_log_type_t v17 = sub_10000F510();
  if (os_log_type_enabled(v16, v17))
  {
    int v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Requesting begin activity", v18, 2u);
    swift_slowDealloc();
  }

  uint64_t v19 = sub_10000F0F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 1, 1, v19);
  sub_1000070F8();
  sub_100007150();
  sub_1000071A8();
  sub_10000F270();
  sub_100002CF8(&qword_100018560);
  uint64_t v20 = sub_10000F200();
  uint64_t v21 = *(void *)(v20 - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_10000FC40;
  (*(void (**)(unint64_t, void, uint64_t))(v21 + 104))(v23 + v22, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v20);
  sub_10000F210();
  sub_10000F220();
  sub_10000F230();
  sub_100002CF8(&qword_100018568);
  LOBYTE(v53[0]) = v3;
  uint64_t v24 = sub_10000F1D0();
  uint64_t v44 = v13;
  uint64_t v25 = OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity;
  *(void *)&v2[OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity] = v24;
  swift_release();
  v27 = v46;
  uint64_t v26 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v51, v4);
  v28 = v2;
  uint64_t v29 = v4;
  v30 = sub_10000F280();
  int v42 = sub_10000F510();
  BOOL v31 = os_log_type_enabled(v30, (os_log_type_t)v42);
  v45 = v2;
  uint64_t v43 = v25;
  if (v31)
  {
    os_log_t v40 = v30;
    uint64_t v41 = v29;
    v32 = (uint8_t *)swift_slowAlloc();
    v53[0] = swift_slowAlloc();
    *(_DWORD *)v32 = 136446210;
    if (!*(void *)&v2[v25]) {
      goto LABEL_12;
    }
    swift_retain();
    uint64_t v33 = sub_10000F1B0();
    unint64_t v35 = v34;
    swift_release();
    uint64_t v52 = sub_10000754C(v33, v35, v53);
    sub_10000F540();
    swift_bridgeObjectRelease();

    os_log_t v36 = v40;
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v42, "Requested an activity successfully [id: %{public}s]", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v41);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v50);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v48);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v29);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v50);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v48);
  }
  if (*(void *)&v45[v43])
  {
    swift_retain();
    uint64_t v37 = sub_10000F1B0();
    unint64_t v39 = v38;
    swift_release();
    sub_1000058B8(v37, v39);
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
LABEL_12:

  __break(1u);
}

void sub_100005160(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000F1F0();
  uint64_t v52 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = &v47[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100002CF8(&qword_100018540);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v47[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10000F260();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = &v47[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  uint64_t v16 = &v47[-v15];
  if (a1)
  {
    uint64_t v51 = v4;
  }
  else
  {
    if (!*(void *)(v2
                    + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity))
      return;
    uint64_t v51 = v4;
    swift_retain();
  }
  swift_retain();
  sub_10000F1A0();
  (*(void (**)(unsigned char *, void, uint64_t))(v11 + 104))(v14, enum case for ActivityState.dismissed(_:), v10);
  sub_100008CC8();
  char v17 = sub_10000F400();
  int v18 = *(void (**)(unsigned char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  v18(v16, v10);
  if ((v17 & 1) == 0)
  {
    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_10000F2A0();
    sub_100002F00(v27, (uint64_t)qword_10001AC70);
    swift_retain_n();
    v28 = sub_10000F280();
    os_log_type_t v29 = sub_10000F510();
    int v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v50 = v2;
      uint64_t v32 = v31;
      uint64_t v49 = swift_slowAlloc();
      uint64_t v54 = v49;
      *(_DWORD *)uint64_t v32 = 136315394;
      int v48 = v30;
      uint64_t v33 = sub_10000F1B0();
      uint64_t v53 = sub_10000754C(v33, v34, &v54);
      sub_10000F540();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      sub_10000F1A0();
      uint64_t v35 = sub_10000F460();
      uint64_t v53 = sub_10000754C(v35, v36, &v54);
      sub_10000F540();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v48, "Requesting end activity [id: %s activityState: %s]", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v50;
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v37 = sub_10000F1B0();
    sub_100006994(v37, v38);
    swift_bridgeObjectRelease();
    uint64_t v39 = sub_100002CF8(&qword_100018550);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v9, 1, 1, v39);
    sub_10000F1E0();
    sub_10000F1C0();
    (*(void (**)(unsigned char *, uint64_t))(v52 + 8))(v6, v51);
    sub_100008D20((uint64_t)v9, &qword_100018540);
    uint64_t v40 = OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity;
    if (*(void *)(v2 + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity))
    {
      swift_retain();
      uint64_t v41 = sub_10000F1B0();
      uint64_t v43 = v42;
      swift_release();
      uint64_t v44 = sub_10000F1B0();
      if (v43)
      {
        if (v41 == v44 && v43 == v45)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v46 = sub_10000F670();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v46 & 1) == 0)
          {
LABEL_25:
            swift_release();
            return;
          }
        }
        *(void *)(v2 + v40) = 0;
        swift_release();
        goto LABEL_25;
      }
    }
    else
    {
      sub_10000F1B0();
    }
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  if (qword_100018350 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_10000F2A0();
  sub_100002F00(v19, (uint64_t)qword_10001AC70);
  swift_retain_n();
  uint64_t v20 = sub_10000F280();
  os_log_type_t v21 = sub_10000F510();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v23 = sub_10000F1B0();
    uint64_t v53 = sub_10000754C(v23, v24, &v54);
    sub_10000F540();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    sub_10000F1A0();
    uint64_t v25 = sub_10000F460();
    uint64_t v53 = sub_10000754C(v25, v26, &v54);
    sub_10000F540();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Skipping end activity [id: %s activityState: %s] ", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {

    swift_release_n();
  }
}

void sub_1000058B8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000F260();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v92 = v6;
  uint64_t v93 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v91 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v90 = (char *)&v85 - v10;
  uint64_t v11 = OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_assertion;
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_assertion);
  if (!v12) {
    goto LABEL_19;
  }
  id v13 = v12;
  uint64_t v14 = &SpeechTranslationActivityManager;
  id v15 = [v13 sessionIdentifier];
  uint64_t v16 = sub_10000F440();
  uint64_t v18 = v17;

  if (v16 == a1 && v18 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_12:

    if (!*(void *)(v3 + v11)) {
      goto LABEL_19;
    }
LABEL_13:
    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_10000F2A0();
    sub_100002F00(v36, (uint64_t)qword_10001AC70);
    uint64_t v37 = sub_10000F280();
    os_log_type_t v38 = sub_10000F510();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Not taking assertion as it is non-nil", v39, 2u);
      swift_slowDealloc();
    }
LABEL_29:

    return;
  }
  char v20 = sub_10000F670();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_12;
  }
  if (qword_100018350 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_10000F2A0();
  sub_100002F00(v21, (uint64_t)qword_10001AC70);
  id v22 = v13;
  swift_bridgeObjectRetain_n();
  id v23 = v22;
  unint64_t v24 = sub_10000F280();
  os_log_type_t v25 = sub_10000F510();
  int v26 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v27 = swift_slowAlloc();
    LODWORD(v88) = v26;
    uint64_t v28 = v27;
    uint64_t v89 = swift_slowAlloc();
    aBlock[0] = v89;
    *(_DWORD *)uint64_t v28 = 136446466;
    id v29 = [v23 sessionIdentifier:v28 + 4];
    uint64_t v30 = sub_10000F440();
    os_log_t v87 = v24;
    uint64_t v31 = v30;
    id v32 = v23;
    unint64_t v34 = v33;

    uint64_t v95 = sub_10000754C(v31, v34, aBlock);
    sub_10000F540();
    id v23 = v32;
    uint64_t v14 = &SpeechTranslationActivityManager;
    swift_bridgeObjectRelease();

    *(_WORD *)(v28 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v95 = sub_10000754C(a1, a2, aBlock);
    sub_10000F540();
    swift_bridgeObjectRelease_n();
    os_log_t v35 = v87;
    _os_log_impl((void *)&_mh_execute_header, v87, (os_log_type_t)v88, "Releasing assertion for other activity [id: %{public}s] in favour of new assertion for activity [id: %{public}s]", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v40 = [v23 v14[6].base_meths];
  uint64_t v41 = sub_10000F440();
  unint64_t v43 = v42;

  sub_100006994(v41, v43);
  swift_bridgeObjectRelease();

  if (*(void *)(v3 + v11)) {
    goto LABEL_13;
  }
LABEL_19:
  uint64_t v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v45 = (void *)swift_allocObject();
  v45[2] = v44;
  v45[3] = a1;
  v45[4] = a2;
  id v46 = objc_allocWithZone((Class)SNAProminentPresentationAssertion);
  swift_bridgeObjectRetain();
  NSString v47 = sub_10000F430();
  NSString v48 = sub_10000F430();
  aBlock[4] = (uint64_t)sub_100008550;
  aBlock[5] = (uint64_t)v45;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000072EC;
  aBlock[3] = (uint64_t)&unk_100015278;
  uint64_t v49 = _Block_copy(aBlock);
  swift_release();
  id v50 = [v46 initWithExplanation:v47 sessionIdentifier:v48 invalidationHandler:v49];
  _Block_release(v49);

  if ([v50 state] == (id)1)
  {
    uint64_t v51 = *(void **)(v3 + v11);
    *(void *)(v3 + v11) = v50;
    id v52 = v50;

    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_10000F2A0();
    sub_100002F00(v53, (uint64_t)qword_10001AC70);
    swift_bridgeObjectRetain_n();
    id v54 = v52;
    uint64_t v37 = sub_10000F280();
    os_log_type_t v55 = sub_10000F530();
    if (os_log_type_enabled(v37, v55))
    {
      uint64_t v56 = swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v95 = sub_10000754C(a1, a2, aBlock);
      sub_10000F540();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v56 + 12) = 2050;
      id v57 = [v54 state];

      uint64_t v95 = (uint64_t)v57;
      sub_10000F540();

      _os_log_impl((void *)&_mh_execute_header, v37, v55, "Assertion acquired [id: %{public}s, assertion state %{public}lu]", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }

    swift_bridgeObjectRelease_n();
    goto LABEL_29;
  }
  v58 = *(NSObject **)(v3
                     + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity);
  if (!v58) {
    goto LABEL_39;
  }
  uint64_t v88 = OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity;
  uint64_t v89 = v3;
  swift_retain();
  uint64_t v59 = sub_10000F1B0();
  uint64_t v86 = a1;
  if (v59 == a1 && v60 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_31:
    v62 = v90;
    sub_10000F1A0();
    os_log_t v87 = v58;
    uint64_t v63 = v92;
    uint64_t v64 = v93;
    v65 = v91;
    v85 = *(void (**)(char *, void, uint64_t))(v93 + 104);
    v85(v91, enum case for ActivityState.dismissed(_:), v92);
    char v66 = sub_10000F250();
    v67 = *(void (**)(char *, uint64_t))(v64 + 8);
    v67(v65, v63);
    uint64_t v93 = v64 + 8;
    v67(v62, v63);
    if (v66) {
      goto LABEL_33;
    }
    v68 = v90;
    sub_10000F1A0();
    v69 = v91;
    uint64_t v70 = v92;
    v85(v91, enum case for ActivityState.ended(_:), v92);
    char v71 = sub_10000F250();
    v67(v69, v70);
    v67(v68, v70);
    if (v71)
    {
LABEL_33:
      if (qword_100018350 != -1) {
        swift_once();
      }
      uint64_t v72 = sub_10000F2A0();
      sub_100002F00(v72, (uint64_t)qword_10001AC70);
      v73 = sub_10000F280();
      os_log_type_t v74 = sub_10000F530();
      BOOL v75 = os_log_type_enabled(v73, v74);
      uint64_t v76 = v89;
      if (v75)
      {
        v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v73, v74, "Assertion acquisition failed due to activity having already ended", v77, 2u);
        swift_slowDealloc();
      }

      *(void *)(v76 + v88) = 0;
      swift_release();

      swift_release();
      return;
    }
    goto LABEL_38;
  }
  char v61 = sub_10000F670();
  swift_bridgeObjectRelease();
  if (v61) {
    goto LABEL_31;
  }
LABEL_38:
  swift_release();
  a1 = v86;
LABEL_39:
  if (qword_100018350 != -1) {
    swift_once();
  }
  uint64_t v78 = sub_10000F2A0();
  sub_100002F00(v78, (uint64_t)qword_10001AC70);
  swift_bridgeObjectRetain_n();
  id v79 = v50;
  v80 = sub_10000F280();
  os_log_type_t v81 = sub_10000F520();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v82 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v95 = sub_10000754C(a1, a2, aBlock);
    sub_10000F540();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v82 + 12) = 2050;
    id v83 = [v79 state];

    uint64_t v95 = (uint64_t)v83;
    sub_10000F540();

    _os_log_impl((void *)&_mh_execute_header, v80, v81, "Acquire assertion FAIL [id:%{public}s, assertion state %{public}lu]", (uint8_t *)v82, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  sub_100008574();
  swift_allocError();
  void *v84 = 0;
  v84[1] = 0;
  v84[2] = 1;
  swift_willThrow();
}

uint64_t sub_1000064A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_100002CF8(&qword_100018510);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000F500();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  sub_10000F4E0();
  swift_retain();
  swift_bridgeObjectRetain();
  id v15 = a1;
  swift_errorRetain();
  uint64_t v16 = sub_10000F4D0();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  v17[5] = a4;
  v17[6] = a5;
  v17[7] = v15;
  v17[8] = a2;
  swift_release();
  sub_1000067E8((uint64_t)v11, (uint64_t)&unk_100018520, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_10000665C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[5] = a4;
  sub_10000F4E0();
  v8[10] = sub_10000F4D0();
  uint64_t v10 = sub_10000F4C0();
  return _swift_task_switch(sub_1000066FC, v10, v9);
}

uint64_t sub_1000066FC()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    sub_1000088E0(*(void *)(v0 + 48), *(void *)(v0 + 56), (uint64_t)[*(id *)(v0 + 64) state], (uint64_t)objc_msgSend(*(id *)(v0 + 64), "invalidationReason"), 0, *(void *)(v0 + 72));
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000067E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000F500();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000F4F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008D20(a1, &qword_100018510);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000F4C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100006994(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_assertion;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_assertion);
  if (v6)
  {
    id v7 = v6;
    [v7 invalidate];
    uint64_t v8 = *(void **)(v2 + v5);
    *(void *)(v2 + v5) = 0;

    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10000F2A0();
    sub_100002F00(v9, (uint64_t)qword_10001AC70);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = sub_10000F280();
    os_log_type_t v11 = sub_10000F530();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136446210;
      swift_bridgeObjectRetain();
      sub_10000754C(a1, a2, &v17);
      sub_10000F540();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Assertion Released [id: %{public}s]", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10000F2A0();
    sub_100002F00(v13, (uint64_t)qword_10001AC70);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_10000F280();
    os_log_type_t v15 = sub_10000F510();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446210;
      swift_bridgeObjectRetain();
      sub_10000754C(a1, a2, &v17);
      sub_10000F540();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Not releasing assertion for session [id: %{public}s] since assertion is nil", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  swift_bridgeObjectRelease_n();
}

unint64_t sub_100006CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 1) {
    return 0xD00000000000001BLL;
  }
  id v7 = (void *)0x80000001000115F0;
  uint64_t v8 = 0xD000000000000020;
  switch(a2)
  {
    case 0:
      if (a1) {
        uint64_t v8 = 0xD000000000000037;
      }
      else {
        uint64_t v8 = 0xD00000000000001ELL;
      }
      if (a1) {
        id v7 = (void *)0x8000000100011480;
      }
      else {
        id v7 = (void *)0x80000001000114C0;
      }
      goto LABEL_19;
    case 1:
      goto LABEL_19;
    case 2:
      uint64_t v8 = 0xD00000000000001CLL;
      uint64_t v9 = "a session request was denied";
      goto LABEL_18;
    case 3:
      uint64_t v8 = 0xD000000000000023;
      uint64_t v9 = "the owner requested an invalidation";
      goto LABEL_18;
    case 4:
      uint64_t v9 = "the server disconnected from XPC";
      goto LABEL_18;
    case 5:
      uint64_t v8 = 0xD000000000000018;
      uint64_t v9 = "the app was foregrounded";
      goto LABEL_18;
    case 6:
      uint64_t v8 = 0xD000000000000017;
      uint64_t v9 = "the assertion timed out";
      goto LABEL_18;
    case 7:
      uint64_t v9 = "the assertion request was denied";
      goto LABEL_18;
    case 8:
      uint64_t v8 = 0xD00000000000001ALL;
      uint64_t v9 = "the relevant session ended";
      goto LABEL_18;
    default:
      uint64_t v8 = 0xD000000000000014;
      uint64_t v9 = "something went wrong";
LABEL_18:
      id v7 = (void *)((unint64_t)(v9 - 32) | 0x8000000000000000);
LABEL_19:
      uint64_t v10 = (void *)0xE000000000000000;
      swift_errorRetain();
      sub_10000F570(47);
      swift_bridgeObjectRelease();
      v13._countAndFlagsBits = v8;
      v13._object = v7;
      sub_10000F480(v13);
      swift_bridgeObjectRelease();
      v14._countAndFlagsBits = 0x3A726F727245202ELL;
      v14._object = (void *)0xE900000000000020;
      sub_10000F480(v14);
      if (a3)
      {
        swift_getErrorValue();
        sub_1000094F8(a1, a2, a3);
        uint64_t v11 = sub_10000F680();
        uint64_t v10 = v12;
        sub_1000094E4(a1, a2, a3);
      }
      else
      {
        uint64_t v11 = 0;
      }
      v15._countAndFlagsBits = v11;
      v15._object = v10;
      sub_10000F480(v15);
      swift_bridgeObjectRelease();
      sub_1000094E4(a1, a2, a3);
      unint64_t result = 0xD000000000000022;
      break;
  }
  return result;
}

unint64_t sub_100006F6C()
{
  return sub_100006CD8(*v0, v0[1], v0[2]);
}

id sub_100006F78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpeechTranslationActivityManager();
  [super dealloc];
}

uint64_t type metadata accessor for SpeechTranslationActivityManager()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for TranslationDeepLinks(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes()
{
  return &type metadata for SpeechTranslationActivityAttributes;
}

unint64_t sub_100007048()
{
  unint64_t result = qword_100018498;
  if (!qword_100018498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018498);
  }
  return result;
}

unint64_t sub_1000070A0()
{
  unint64_t result = qword_1000184A0;
  if (!qword_1000184A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184A0);
  }
  return result;
}

unint64_t sub_1000070F8()
{
  unint64_t result = qword_1000184A8;
  if (!qword_1000184A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184A8);
  }
  return result;
}

unint64_t sub_100007150()
{
  unint64_t result = qword_1000184B0;
  if (!qword_1000184B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184B0);
  }
  return result;
}

unint64_t sub_1000071A8()
{
  unint64_t result = qword_1000184B8;
  if (!qword_1000184B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184B8);
  }
  return result;
}

unint64_t sub_100007200()
{
  unint64_t result = qword_1000184C0;
  if (!qword_1000184C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184C0);
  }
  return result;
}

void *sub_100007254(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100007298()
{
  unint64_t result = qword_1000184D0;
  if (!qword_1000184D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184D0);
  }
  return result;
}

void sub_1000072EC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_100007378(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100007454;
  return v6(a1);
}

uint64_t sub_100007454()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000754C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007620(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008478((uint64_t)v12, *a3);
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
      sub_100008478((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008428((uint64_t)v12);
  return v7;
}

uint64_t sub_100007620(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000F550();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000077DC(a5, a6);
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
  uint64_t v8 = sub_10000F5B0();
  if (!v8)
  {
    sub_10000F5C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000F5F0();
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

uint64_t sub_1000077DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007874(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007A54(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007A54(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007874(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000079EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000F580();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000F5C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000F490();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000F5F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000F5C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000079EC(uint64_t a1, uint64_t a2)
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
  sub_100002CF8(&qword_100018500);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007A54(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002CF8(&qword_100018500);
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
  Swift::String v13 = a4 + 32;
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
  uint64_t result = sub_10000F5F0();
  __break(1u);
  return result;
}

uint64_t sub_100007BA4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x75426E6F69746361 && a2 == 0xEC0000006E6F7474;
  if (v3 || (sub_10000F670() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x436C6F72746E6F63 && a2 == 0xED00007265746E65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10000F670();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100007CB8(uint64_t a1)
{
  uint64_t v2 = sub_100002CF8(&qword_1000185A0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  __chkstk_darwin(v2);
  size_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002CF8(&qword_1000185A8);
  uint64_t v25 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002CF8(&qword_1000185B0);
  uint64_t v24 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  size_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007254((void *)a1, *(void *)(a1 + 24));
  sub_1000093E8();
  uint64_t v12 = v26;
  sub_10000F700();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_10000F640();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_10000F5A0();
    swift_allocError();
    uint64_t v18 = v17;
    sub_100002CF8(&qword_1000185C0);
    *uint64_t v18 = &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin;
    sub_10000F620();
    sub_10000F590();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, enum case for DecodingError.typeMismatch(_:), v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_100008428(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_10000943C();
    sub_10000F610();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_100009490();
    sub_10000F610();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_100008428(v26);
  return a1;
}

uint64_t sub_100008108(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x724F656372756F73 && a2 == 0xEC0000006E696769)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10000F670();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1000081A0()
{
  return 0x724F656372756F73;
}

void *sub_1000081C0(void *a1)
{
  uint64_t v3 = sub_100002CF8(&qword_1000184D8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100007254(a1, a1[3]);
  sub_10000832C();
  sub_10000F700();
  if (v1)
  {
    sub_100008428((uint64_t)a1);
  }
  else
  {
    sub_100008380();
    sub_10000F630();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[15];
    sub_100008428((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_10000832C()
{
  unint64_t result = qword_1000184E0;
  if (!qword_1000184E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184E0);
  }
  return result;
}

unint64_t sub_100008380()
{
  unint64_t result = qword_1000184E8;
  if (!qword_1000184E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184E8);
  }
  return result;
}

unint64_t sub_1000083D4()
{
  unint64_t result = qword_1000184F8;
  if (!qword_1000184F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184F8);
  }
  return result;
}

uint64_t sub_100008428(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008478(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000084D8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008510()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100008550(void *a1, uint64_t a2)
{
  return sub_1000064A0(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_10000855C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000856C()
{
  return swift_release();
}

unint64_t sub_100008574()
{
  unint64_t result = qword_100018508;
  if (!qword_100018508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018508);
  }
  return result;
}

uint64_t sub_1000085C8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_errorRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100008620(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *size_t v11 = v2;
  v11[1] = sub_1000086FC;
  return sub_10000665C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000086FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000087F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008828(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000086FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100018528 + dword_100018528);
  return v6(a1, v4);
}

void sub_1000088E0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  if (qword_100018350 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10000F2A0();
  sub_100002F00(v12, (uint64_t)qword_10001AC70);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_10000F280();
  os_log_type_t v14 = sub_10000F530();
  if (!os_log_type_enabled(v13, v14))
  {
    swift_bridgeObjectRelease_n();

    if (a3) {
      goto LABEL_5;
    }
LABEL_11:
    if (a5) {
      a4 = 7;
    }
    sub_100008574();
    swift_allocError();
    *uint64_t v16 = 0;
    goto LABEL_14;
  }
  char v22 = a5;
  uint64_t v15 = (uint8_t *)swift_slowAlloc();
  uint64_t v23 = swift_slowAlloc();
  *(_DWORD *)uint64_t v15 = 136446210;
  swift_bridgeObjectRetain();
  sub_10000754C(a1, a2, &v23);
  sub_10000F540();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v13, v14, "Assertion invalidated [id: %{public}s]", v15, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  a5 = v22;
  swift_slowDealloc();

  if (!a3) {
    goto LABEL_11;
  }
LABEL_5:
  if (a3 == 1) {
    return;
  }
  if (a3 != 2)
  {
    sub_10000F5D0();
    __break(1u);
    return;
  }
  if (a5) {
    a4 = 0;
  }
  sub_100008574();
  swift_allocError();
  *uint64_t v16 = 2;
LABEL_14:
  v16[1] = a4;
  v16[2] = a6;
  swift_errorRetain();
  swift_willThrow();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v17 = sub_10000F280();
  os_log_type_t v18 = sub_10000F530();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    char v20 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 138412290;
    swift_errorRetain();
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v23 = v21;
    sub_10000F540();
    *char v20 = v21;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Assertion invalidation reason: %@", v19, 0xCu);
    sub_100002CF8(&qword_100018538);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
}

unint64_t sub_100008CC8()
{
  unint64_t result = qword_100018548;
  if (!qword_100018548)
  {
    sub_10000F260();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018548);
  }
  return result;
}

uint64_t sub_100008D20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002CF8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t destroy for SpeechTranslationActivityManager.AssertionError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 16);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t _s27TranslationWidgetsExtension32SpeechTranslationActivityManagerC14AssertionErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 16);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  if ((int)v4 - 1 < 0)
  {
    swift_errorRetain();
    *(void *)(a1 + 16) = v3;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  return a1;
}

void *assignWithCopy for SpeechTranslationActivityManager.AssertionError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[2] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[2];
  }
  int v6 = v5 - 1;
  if (a2[2] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[2];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v11 = a2[2];
      swift_errorRetain();
      a1[2] = v11;
      swift_errorRelease();
      return a1;
    }
    swift_errorRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    long long v9 = *(_OWORD *)a2;
    a1[2] = a2[2];
    *(_OWORD *)a1 = v9;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v8 = a2[2];
  swift_errorRetain();
  a1[2] = v8;
  return a1;
}

__n128 initializeWithTake for SpeechTranslationActivityManager.AssertionError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SpeechTranslationActivityManager.AssertionError(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = *(void *)(a2 + 16);
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = *(void *)(a2 + 16);
    }
    if ((int)v7 - 1 < 0)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = v6;
      swift_errorRelease();
      return a1;
    }
    swift_errorRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SpeechTranslationActivityManager.AssertionError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SpeechTranslationActivityManager.AssertionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_10000901C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_100009040(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[1] = 0;
    result[2] = 0;
    *__n128 result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[2] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityManager.AssertionError()
{
  return &type metadata for SpeechTranslationActivityManager.AssertionError;
}

uint64_t getEnumTagSinglePayload for SpeechTranslationActivityAttributes.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SpeechTranslationActivityAttributes.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100009170);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.CodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.ContentState()
{
  return &type metadata for SpeechTranslationActivityAttributes.ContentState;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin;
}

unint64_t sub_1000091DC()
{
  unint64_t result = qword_100018570;
  if (!qword_100018570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018570);
  }
  return result;
}

unint64_t sub_100009234()
{
  unint64_t result = qword_100018578;
  if (!qword_100018578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018578);
  }
  return result;
}

unint64_t sub_10000928C()
{
  unint64_t result = qword_100018580;
  if (!qword_100018580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018580);
  }
  return result;
}

unint64_t sub_1000092E4()
{
  unint64_t result = qword_100018588;
  if (!qword_100018588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018588);
  }
  return result;
}

unint64_t sub_10000933C()
{
  unint64_t result = qword_100018590;
  if (!qword_100018590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018590);
  }
  return result;
}

unint64_t sub_100009394()
{
  unint64_t result = qword_100018598;
  if (!qword_100018598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018598);
  }
  return result;
}

unint64_t sub_1000093E8()
{
  unint64_t result = qword_1000185B8;
  if (!qword_1000185B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185B8);
  }
  return result;
}

unint64_t sub_10000943C()
{
  unint64_t result = qword_1000185C8;
  if (!qword_1000185C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185C8);
  }
  return result;
}

unint64_t sub_100009490()
{
  unint64_t result = qword_1000185D0;
  if (!qword_1000185D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185D0);
  }
  return result;
}

uint64_t sub_1000094E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_1000094F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t _s27TranslationWidgetsExtension35SpeechTranslationActivityAttributesV24LiveActivitySourceOriginOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s27TranslationWidgetsExtension35SpeechTranslationActivityAttributesV24LiveActivitySourceOriginOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009668);
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

uint64_t sub_100009690(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100009698(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys;
}

unint64_t sub_1000096D8()
{
  unint64_t result = qword_1000185F0;
  if (!qword_1000185F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185F0);
  }
  return result;
}

unint64_t sub_100009730()
{
  unint64_t result = qword_1000185F8;
  if (!qword_1000185F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185F8);
  }
  return result;
}

unint64_t sub_100009788()
{
  unint64_t result = qword_100018600;
  if (!qword_100018600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018600);
  }
  return result;
}

unint64_t sub_1000097E0()
{
  unint64_t result = qword_100018608;
  if (!qword_100018608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018608);
  }
  return result;
}

unint64_t sub_100009838()
{
  unint64_t result = qword_100018610;
  if (!qword_100018610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018610);
  }
  return result;
}

unint64_t sub_100009890()
{
  unint64_t result = qword_100018618;
  if (!qword_100018618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018618);
  }
  return result;
}

unint64_t sub_1000098E8()
{
  unint64_t result = qword_100018620;
  if (!qword_100018620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018620);
  }
  return result;
}

unint64_t sub_100009954()
{
  unint64_t result = qword_100018630;
  if (!qword_100018630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018630);
  }
  return result;
}

unint64_t sub_1000099AC()
{
  unint64_t result = qword_100018638;
  if (!qword_100018638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018638);
  }
  return result;
}

uint64_t sub_100009A00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A90C(a1, a2, a3, (void (*)(void))sub_100009A34);
}

unint64_t sub_100009A34()
{
  unint64_t result = qword_100018640;
  if (!qword_100018640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018640);
  }
  return result;
}

uint64_t sub_100009A88(uint64_t a1)
{
  return sub_10000AA28(a1, qword_10001ACA8);
}

uint64_t sub_100009AAC()
{
  uint64_t v0 = sub_100002CF8(&qword_1000187C0);
  sub_100002E9C(v0, qword_10001ACC0);
  uint64_t v1 = sub_100002F00(v0, (uint64_t)qword_10001ACC0);
  sub_10000EF50();
  uint64_t v2 = sub_10000EF60();
  int v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100009B64(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  sub_100002CF8(&qword_100018510);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_10000EF70();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = sub_100002CF8(&qword_100018798);
  v2[10] = swift_task_alloc();
  sub_100002CF8(&qword_1000187A0);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_10000EF90();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  return _swift_task_switch(sub_100009D30, 0, 0);
}

uint64_t sub_100009D30()
{
  v0[2] = v0[4];
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[10];
  uint64_t v34 = v0[9];
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[7];
  sub_100009A34();
  sub_10000ED80();
  sub_10000EF80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v5, enum case for IntentSystemContext.Source.actionButton(_:), v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  uint64_t v9 = v6 + *(int *)(v34 + 48);
  sub_10000BE28(v4, v6, &qword_1000187A0);
  sub_10000BE28(v5, v9, &qword_1000187A0);
  uint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v10(v6, 1, v7) == 1)
  {
    uint64_t v11 = v0[13];
    uint64_t v12 = v0[6];
    sub_100008D20(v0[12], &qword_1000187A0);
    sub_100008D20(v11, &qword_1000187A0);
    if (v10(v9, 1, v12) == 1)
    {
      sub_100008D20(v0[10], &qword_1000187A0);
LABEL_15:
      v0[17] = sub_10000F4E0();
      v0[18] = sub_10000F4D0();
      uint64_t v33 = sub_10000F4C0();
      return _swift_task_switch(sub_10000A1C0, v33, v32);
    }
    goto LABEL_6;
  }
  uint64_t v13 = v0[6];
  sub_10000BE28(v0[10], v0[11], &qword_1000187A0);
  unsigned int v14 = v10(v9, 1, v13);
  uint64_t v16 = v0[12];
  uint64_t v15 = v0[13];
  uint64_t v17 = v0[11];
  if (v14 == 1)
  {
    uint64_t v18 = v0[6];
    uint64_t v19 = v0[7];
    sub_100008D20(v0[12], &qword_1000187A0);
    sub_100008D20(v15, &qword_1000187A0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
LABEL_6:
    sub_100008D20(v0[10], &qword_100018798);
    goto LABEL_7;
  }
  uint64_t v26 = v0[10];
  uint64_t v28 = v0[7];
  uint64_t v27 = v0[8];
  uint64_t v29 = v0[6];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v27, v9, v29);
  sub_10000BDD0();
  char v30 = sub_10000F400();
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  v31(v27, v29);
  sub_100008D20(v16, &qword_1000187A0);
  sub_100008D20(v15, &qword_1000187A0);
  v31(v17, v29);
  sub_100008D20(v26, &qword_1000187A0);
  if (v30) {
    goto LABEL_15;
  }
LABEL_7:
  if (qword_100018350 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_10000F2A0();
  sub_100002F00(v20, (uint64_t)qword_10001AC70);
  uint64_t v21 = sub_10000F280();
  os_log_type_t v22 = sub_10000F510();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "No DynamicIsland support. Launching the Translate App.", v23, 2u);
    swift_slowDealloc();
  }

  sub_10000EDD0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_10000A1C0()
{
  swift_release();
  return _swift_task_switch(sub_10000A228, 0, 0);
}

uint64_t sub_10000A228()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = sub_10000F500();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  swift_retain();
  uint64_t v4 = sub_10000F4D0();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = &protocol witness table for MainActor;
  v5[4] = v2;
  sub_1000067E8(v1, (uint64_t)&unk_1000187B0, (uint64_t)v5);
  swift_release();
  sub_10000EDD0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10000A390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_10000F4E0();
  *(void *)(v4 + 24) = sub_10000F4D0();
  uint64_t v6 = sub_10000F4C0();
  return _swift_task_switch(sub_10000A428, v6, v5);
}

uint64_t sub_10000A428()
{
  swift_release();
  if (qword_100018350 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10000F2A0();
  sub_100002F00(v1, (uint64_t)qword_10001AC70);
  uint64_t v2 = sub_10000F280();
  os_log_type_t v3 = sub_10000F530();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Launching Activity from intent.perform()", v4, 2u);
    swift_slowDealloc();
  }

  sub_10000EDF0();
  sub_10000EDF0();
  if (qword_100018360 != -1) {
    swift_once();
  }
  sub_10000EDF0();
  sub_1000047FC(*(unsigned char *)(v0 + 32));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10000A5B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AAAC(&qword_100018368, (uint64_t)qword_10001ACA8, a1);
}

uint64_t sub_10000A5DC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018370 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002CF8(&qword_1000187C0);
  uint64_t v3 = sub_100002F00(v2, (uint64_t)qword_10001ACC0);
  return sub_10000BE28(v3, a1, &qword_1000187C0);
}

uint64_t sub_10000A654(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000086FC;
  return sub_100009B64(a1, v4);
}

uint64_t sub_10000A6F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000AD74();
  *a1 = result;
  return result;
}

unint64_t sub_10000A720()
{
  unint64_t result = qword_100018650;
  if (!qword_100018650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018650);
  }
  return result;
}

unint64_t sub_10000A77C()
{
  unint64_t result = qword_100018658;
  if (!qword_100018658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018658);
  }
  return result;
}

unint64_t sub_10000A7D0()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_10000A7F0()
{
  unint64_t result = qword_100018660;
  if (!qword_100018660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018660);
  }
  return result;
}

unint64_t sub_10000A848()
{
  unint64_t result = qword_100018668;
  if (!qword_100018668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018668);
  }
  return result;
}

unint64_t sub_10000A8A0()
{
  unint64_t result = qword_100018670;
  if (!qword_100018670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018670);
  }
  return result;
}

uint64_t sub_10000A8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A90C(a1, a2, a3, (void (*)(void))sub_10000A7F0);
}

uint64_t sub_10000A90C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A960()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

void sub_10000A970(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10000A978(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000A998, 0, 0);
}

uint64_t sub_10000A998()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_10000BB58() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000AA04(uint64_t a1)
{
  return sub_10000AA28(a1, qword_10001ACD8);
}

uint64_t sub_10000AA28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000F0B0();
  sub_100002E9C(v3, a2);
  sub_100002F00(v3, (uint64_t)a2);
  return sub_10000F090();
}

uint64_t sub_10000AA88@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AAAC(&qword_100018378, (uint64_t)qword_10001ACD8, a1);
}

uint64_t sub_10000AAAC@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000F0B0();
  uint64_t v6 = sub_100002F00(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_10000AB48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000AD20();
  *uint64_t v4 = v2;
  v4[1] = sub_100003538;
  return ControlConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10000ABF4(uint64_t a1)
{
  unint64_t v2 = sub_10000A7F0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for ToggleControlStateProvider()
{
  return self;
}

ValueMetadata *type metadata accessor for ToggleSpeechTranslationIntentConfiguration()
{
  return &type metadata for ToggleSpeechTranslationIntentConfiguration;
}

ValueMetadata *type metadata accessor for ToggleSpeechTranslationIntent()
{
  return &type metadata for ToggleSpeechTranslationIntent;
}

unint64_t sub_10000AC78()
{
  unint64_t result = qword_100018758;
  if (!qword_100018758)
  {
    sub_10000ACD4(&qword_100018760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018758);
  }
  return result;
}

uint64_t sub_10000ACD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000AD20()
{
  unint64_t result = qword_100018768;
  if (!qword_100018768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018768);
  }
  return result;
}

uint64_t sub_10000AD74()
{
  uint64_t v0 = sub_10000F010();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100002CF8(&qword_100018428);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100002CF8(&qword_100018780);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100002CF8(&qword_100018430);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10000F0B0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_100002CF8(&qword_100018788);
  sub_10000F090();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v18[15] = 2;
  uint64_t v15 = sub_10000F4B0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  uint64_t v16 = sub_10000EDC0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return sub_10000EE20();
}

void *sub_10000B09C()
{
  uint64_t v0 = sub_10000F0E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002CF8(&qword_100018778);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)qword_100018628;
  if (qword_100018628) {
    goto LABEL_2;
  }
  id v9 = [self defaultManager];
  NSString v10 = sub_10000F430();
  id v11 = [v9 containerURLForSecurityApplicationGroupIdentifier:v10];

  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
    goto LABEL_8;
  }
  sub_10000F0D0();

  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) == 1)
  {
LABEL_8:
    sub_100008D20((uint64_t)v6, &qword_100018778);
    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_10000F2A0();
    sub_100002F00(v16, (uint64_t)qword_10001AC70);
    uint64_t v17 = sub_10000F280();
    os_log_type_t v18 = sub_10000F520();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_13;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    uint64_t v20 = "Failed to obtain application group container directory to load translation group defaults";
    goto LABEL_12;
  }
  sub_100008D20((uint64_t)v6, &qword_100018778);
  id v12 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v13 = sub_10000F430();
  id v14 = [v12 initWithSuiteName:v13];

  if (!v14)
  {
    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_10000F2A0();
    sub_100002F00(v22, (uint64_t)qword_10001AC70);
    uint64_t v17 = sub_10000F280();
    os_log_type_t v18 = sub_10000F520();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_13;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    uint64_t v20 = "Failed to load translation group defaults";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v20, v19, 2u);
    swift_slowDealloc();
LABEL_13:

    return 0;
  }
  uint64_t v15 = (void *)qword_100018628;
  qword_100018628 = (uint64_t)v14;

  uint64_t v7 = (void *)qword_100018628;
LABEL_2:
  id v8 = v7;
  return v7;
}

uint64_t sub_10000B47C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v58 = a3;
  uint64_t v3 = sub_10000F0B0();
  __chkstk_darwin(v3 - 8);
  uint64_t v51 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000F170();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v53 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v10 = (char *)&v47 - v9;
  uint64_t v11 = sub_100002CF8(&qword_1000187C8);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  id v54 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v47 - v14;
  uint64_t v16 = sub_10000F190();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  id v57 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v47 - v20;
  swift_bridgeObjectRetain();
  sub_10000F100();
  sub_10000F180();
  sub_10000F160();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v55 = v6 + 8;
  uint64_t v56 = v5;
  v22(v10, v5);
  uint64_t v23 = sub_10000F130();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
  if (v25((uint64_t)v15, 1, v23) != 1)
  {
    uint64_t v49 = v16;
    id v50 = v22;
    id v52 = v21;
    uint64_t v48 = v17;
    uint64_t v27 = sub_10000F120();
    uint64_t v29 = v28;
    char v30 = *(void (**)(char *, uint64_t))(v24 + 8);
    v30(v15, v23);
    v61._countAndFlagsBits = v27;
    v61._object = v29;
    uint64_t v26 = sub_10000F140(v61);
    uint64_t v32 = v31;
    swift_bridgeObjectRelease();
    if (v32)
    {
      uint64_t v59 = v26;
      uint64_t v60 = v32;
      sub_10000BE8C();
      uint64_t v26 = sub_10000F560();
      swift_bridgeObjectRelease();
    }
    uint64_t v33 = v53;
    uint64_t v34 = (uint64_t)v54;
    sub_10000F180();
    sub_10000F160();
    v50(v33, v56);
    if (v25(v34, 1, v23) == 1)
    {
      sub_100008D20(v34, &qword_1000187C8);
      BOOL v35 = 0;
    }
    else
    {
      sub_10000F120();
      v30((char *)v34, v23);
      v62._countAndFlagsBits = 2975866;
      v62._object = (void *)0xE300000000000000;
      BOOL v35 = sub_10000F4A0(v62);
      swift_bridgeObjectRelease();
    }
    uint64_t v37 = v48;
    uint64_t v36 = v49;
    os_log_type_t v38 = v57;
    sub_10000F150();
    uint64_t v39 = sub_10000F110();
    uint64_t v41 = v40;
    unint64_t v42 = *(void (**)(char *, uint64_t))(v37 + 8);
    v42(v38, v36);
    if (v39 == sub_10000F110() && v41 == v43)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v44 = v52;
      if (!v35) {
        goto LABEL_14;
      }
    }
    else
    {
      int v45 = sub_10000F670();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v44 = v52;
      if ((v45 & v35 & 1) == 0)
      {
LABEL_14:
        v42(v44, v36);
        return v26;
      }
    }
    swift_bridgeObjectRelease();
    sub_10000F090();
    uint64_t v26 = sub_10000F450();
    goto LABEL_14;
  }
  sub_100008D20((uint64_t)v15, &qword_1000187C8);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
  return 0;
}

uint64_t sub_10000B9D8()
{
  uint64_t v0 = 0x53455F7365;
  uint64_t v1 = sub_10000F190();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000B09C();
  if (v5
    && (uint64_t v6 = v5,
        NSString v7 = sub_10000F430(),
        id v8 = [v6 stringForKey:v7],
        v6,
        v7,
        v8))
  {
    uint64_t v0 = sub_10000F440();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0xE500000000000000;
  }
  sub_10000F150();
  uint64_t v11 = sub_10000B47C(v0, v10, (uint64_t)v4);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v13) {
    return v11;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000BB58()
{
  uint64_t v0 = sub_10000B09C();
  if (v0
    && (uint64_t v1 = v0,
        NSString v2 = sub_10000F430(),
        unsigned int v3 = [v1 BOOLForKey:v2],
        v1,
        v2,
        v3))
  {
    if (qword_100018350 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10000F2A0();
    sub_100002F00(v4, (uint64_t)qword_10001AC70);
    uint64_t v5 = sub_10000F280();
    os_log_type_t v6 = sub_10000F510();
    if (os_log_type_enabled(v5, v6))
    {
      NSString v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "AssumeIsLiveActivityListening is on. Skip checking IsLiveActivityListening", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = sub_10000B09C();
    if (!v9) {
      return 0;
    }
    uint64_t v10 = v9;
    uint64_t v5 = sub_10000F430();
    uint64_t v8 = (uint64_t)[v10 BOOLForKey:v5];
  }
  return v8;
}

uint64_t sub_10000BCDC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000BD1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  NSString v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *NSString v7 = v2;
  v7[1] = sub_1000086FC;
  return sub_10000A390(a1, v4, v5, v6);
}

unint64_t sub_10000BDD0()
{
  unint64_t result = qword_1000187B8;
  if (!qword_1000187B8)
  {
    sub_10000EF70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000187B8);
  }
  return result;
}

uint64_t sub_10000BE28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002CF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000BE8C()
{
  unint64_t result = qword_1000187D0;
  if (!qword_1000187D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000187D0);
  }
  return result;
}

uint64_t sub_10000BEE0(char a1, char a2)
{
  if (*(void *)&aRoot_1[8 * a1] == *(void *)&aRoot_1[8 * a2]
    && *(void *)&aManagelaondevi[8 * a1 + 16] == *(void *)&aManagelaondevi[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10000F670();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10000BF68()
{
  uint64_t v0 = sub_100002CF8(&qword_100018868);
  sub_100002E9C(v0, qword_10001ACF0);
  sub_100002F00(v0, (uint64_t)qword_10001ACF0);
  sub_100002CF8(&qword_100018870);
  uint64_t v1 = *(void *)(sub_100002CF8(&qword_100018878) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000FC30;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100003B08();
  sub_10000EFF0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_10000EFF0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_10000EFF0();
  sub_10000C13C(v4);
  return sub_10000F000();
}

unint64_t sub_10000C13C(uint64_t a1)
{
  uint64_t v2 = sub_100002CF8(&qword_100018878);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    NSString v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002CF8(&qword_100018880);
  uint64_t v6 = sub_10000F5E0();
  NSString v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000BE28(v12, (uint64_t)v5, &qword_100018878);
    char v14 = *v5;
    unint64_t result = sub_10000D0D0(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100002CF8(&qword_100018888);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_10000C33C(uint64_t a1)
{
  uint64_t v2 = sub_100002CF8(&qword_100018850);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    NSString v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002CF8(&qword_100018860);
  uint64_t v6 = sub_10000F5E0();
  NSString v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000BE28(v12, (uint64_t)v5, &qword_100018850);
    char v14 = *v5;
    unint64_t result = sub_10000D0D0(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10000EFD0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

uint64_t sub_10000C534()
{
  uint64_t v0 = sub_100002CF8(&qword_100018430);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000F0B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10000F070();
  sub_100002E9C(v5, qword_10001AD08);
  sub_100002F00(v5, (uint64_t)qword_10001AD08);
  sub_10000F090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10000F060();
}

uint64_t sub_10000C6A0(char a1)
{
  return *(void *)&aRoot_1[8 * a1];
}

uint64_t sub_10000C6C0(char *a1, char *a2)
{
  return sub_10000BEE0(*a1, *a2);
}

unint64_t sub_10000C6D0()
{
  unint64_t result = qword_1000187D8;
  if (!qword_1000187D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000187D8);
  }
  return result;
}

Swift::Int sub_10000C724()
{
  return sub_10000C72C();
}

Swift::Int sub_10000C72C()
{
  return sub_10000F6F0();
}

uint64_t sub_10000C798()
{
  return sub_10000C7A0();
}

uint64_t sub_10000C7A0()
{
  sub_10000F470();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000C7F4()
{
  return sub_10000C7FC();
}

Swift::Int sub_10000C7FC()
{
  return sub_10000F6F0();
}

uint64_t sub_10000C864@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000D800(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10000C894@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C6A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000C8C8()
{
  unint64_t result = qword_1000187E0;
  if (!qword_1000187E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000187E0);
  }
  return result;
}

uint64_t sub_10000C91C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018380 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002CF8(&qword_100018868);
  uint64_t v3 = sub_100002F00(v2, (uint64_t)qword_10001ACF0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000C9CC()
{
  unint64_t result = qword_1000187E8;
  if (!qword_1000187E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000187E8);
  }
  return result;
}

unint64_t sub_10000CA24()
{
  unint64_t result = qword_1000187F0;
  if (!qword_1000187F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000187F0);
  }
  return result;
}

void *sub_10000CA78()
{
  return &protocol witness table for String;
}

uint64_t sub_10000CA84()
{
  sub_100003C04();
  uint64_t v2 = sub_10000EFE0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000D7EC(v3, v0, v2, v1);
}

unint64_t sub_10000CB1C()
{
  unint64_t result = qword_100018800;
  if (!qword_100018800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018800);
  }
  return result;
}

unint64_t sub_10000CB74()
{
  unint64_t result = qword_100018808;
  if (!qword_100018808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018808);
  }
  return result;
}

unint64_t sub_10000CBD0()
{
  unint64_t result = qword_100018810;
  if (!qword_100018810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018810);
  }
  return result;
}

uint64_t sub_10000CC28@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018388 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000F070();
  uint64_t v3 = sub_100002F00(v2, (uint64_t)qword_10001AD08);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000CCD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CD20(uint64_t a1)
{
  unint64_t v2 = sub_100003B08();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000CD70()
{
  unint64_t result = qword_100018818;
  if (!qword_100018818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018818);
  }
  return result;
}

unint64_t sub_10000CDC8()
{
  unint64_t result = qword_100018820;
  if (!qword_100018820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018820);
  }
  return result;
}

unint64_t sub_10000CE20()
{
  unint64_t result = qword_100018828;
  if (!qword_100018828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018828);
  }
  return result;
}

uint64_t sub_10000CE78(uint64_t a1)
{
  unint64_t v2 = sub_10000CBD0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000CEC8()
{
  unint64_t result = qword_100018830;
  if (!qword_100018830)
  {
    sub_10000ACD4(&qword_100018838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018830);
  }
  return result;
}

void sub_10000CF24(void *a1@<X8>)
{
  *a1 = &off_1000150F8;
}

uint64_t getEnumTagSinglePayload for TranslationDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TranslationDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000D090);
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

unsigned char *sub_10000D0B8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TranslationDeepLinks()
{
  return &type metadata for TranslationDeepLinks;
}

unint64_t sub_10000D0D0(char a1)
{
  sub_10000F6D0();
  sub_10000F470();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10000F6F0();

  return sub_10000D160(a1, v2);
}

unint64_t sub_10000D160(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aRoot_1[v6];
    uint64_t v8 = *(void *)&aManagelaondevi[v6 + 16];
    while (*(void *)&aRoot_1[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aManagelaondevi[8 * *(char *)(*(void *)(v2 + 48) + v4) + 16] != v8)
    {
      char v10 = sub_10000F670();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_10000D274()
{
  uint64_t v0 = sub_100002CF8(&qword_100018840);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v36 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v33 = (char *)v27 - v4;
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100002CF8(&qword_100018430);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  BOOL v35 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v37 = (char *)v27 - v9;
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)v27 - v10;
  uint64_t v12 = sub_10000F0B0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v34 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v29 = (char *)v27 - v17;
  __chkstk_darwin(v16);
  sub_100002CF8(&qword_100018848);
  uint64_t v18 = (int *)(sub_100002CF8(&qword_100018850) - 8);
  uint64_t v19 = *(void *)(*(void *)v18 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(*(void *)v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v18 + 80);
  uint64_t v31 = 2 * v19;
  uint64_t v21 = swift_allocObject();
  uint64_t v32 = v21;
  *(_OWORD *)(v21 + 16) = xmmword_10000FC30;
  unint64_t v22 = v21 + v20;
  *(unsigned char *)(v21 + v20) = 0;
  sub_10000F090();
  unint64_t v30 = 0x80000001000117C0;
  sub_10000F090();
  uint64_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
  uint64_t v28 = v12;
  v23(v11, 0, 1, v12);
  sub_10000EFA0();
  sub_10000EFC0();
  *(unsigned char *)(v22 + v19) = 1;
  sub_10000F090();
  uint64_t v24 = v37;
  sub_10000F090();
  v23(v24, 0, 1, v12);
  v27[1] = v22 + v19 + v18[14];
  sub_10000EFA0();
  sub_100002CF8(&qword_100018858);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000FC50;
  sub_10000F090();
  sub_10000F090();
  sub_10000EFB0();
  *(unsigned char *)(v22 + v31) = 2;
  sub_10000F090();
  uint64_t v25 = v35;
  sub_10000F090();
  v23(v25, 0, 1, v28);
  sub_10000EFA0();
  sub_10000EFC0();
  return sub_10000C33C(v32);
}

uint64_t sub_10000D7EC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10000D800(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100015090;
  v6._object = a2;
  unint64_t v4 = sub_10000F600(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

ValueMetadata *type metadata accessor for TranslationLiveActivityControl()
{
  return &type metadata for TranslationLiveActivityControl;
}

uint64_t sub_10000D85C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D878()
{
  type metadata accessor for ToggleControlStateProvider();
  uint64_t result = swift_allocObject();
  qword_10001AD20 = result;
  return result;
}

uint64_t sub_10000D8A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_10000F0B0();
  uint64_t v28 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002CF8(&qword_1000188A0);
  uint64_t v23 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100002CF8(&qword_1000188A8);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002CF8(&qword_1000188B0);
  uint64_t v25 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = qword_100018890;
  uint64_t v12 = qword_100018390;
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_10001AD20;
  swift_retain();
  sub_100002CF8(&qword_1000188B8);
  type metadata accessor for ToggleControlStateProvider();
  uint64_t v13 = sub_10000ACD4(&qword_1000188C0);
  uint64_t v14 = sub_10000E818(&qword_1000188C8, &qword_1000188C0);
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  swift_getOpaqueTypeConformance2();
  sub_10000E8B0(&qword_1000188D0, (void (*)(uint64_t))type metadata accessor for ToggleControlStateProvider);
  sub_10000F3F0();
  sub_10000F090();
  uint64_t v15 = sub_10000E818(&qword_1000188D8, &qword_1000188A0);
  sub_10000F320();
  uint64_t v16 = v29;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v28 + 8);
  v17(v3, v29);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  sub_10000F090();
  uint64_t v31 = v4;
  uint64_t v32 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v27;
  sub_10000F310();
  v17(v3, v16);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v19);
  uint64_t v31 = v19;
  uint64_t v32 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10000F300();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v11, v20);
}

uint64_t sub_10000DDA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100002CF8(&qword_1000188C0);
  uint64_t v19 = *(void *)(v1 - 8);
  uint64_t v20 = v1;
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002CF8(&qword_1000188B8);
  uint64_t v17 = *(void *)(v4 - 8);
  uint64_t v18 = v4;
  __chkstk_darwin(v4);
  Swift::String v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F2C0();
  uint64_t v24 = sub_10000AD74();
  sub_100002CF8(&qword_1000188E0);
  uint64_t v7 = sub_10000ACD4(&qword_1000188E8);
  uint64_t v8 = sub_10000ACD4(&qword_1000188F0);
  unint64_t v9 = sub_10000E748();
  uint64_t v22 = v8;
  unint64_t v23 = v9;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v22 = v7;
  unint64_t v23 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_10000E85C();
  sub_10000F3E0();
  NSString v11 = sub_10000F430();
  uint64_t v12 = self;
  id v13 = [v12 colorNamed:v11];

  if (!v13) {
    id v14 = [v12 clearColor];
  }
  sub_10000F360();
  sub_10000E818(&qword_1000188C8, &qword_1000188C0);
  uint64_t v15 = v20;
  sub_10000F2E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v15);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v21, v6, v18);
}

uint64_t sub_10000E0F0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v40 = a1;
  uint64_t v47 = a2;
  uint64_t v36 = sub_10000F3D0();
  uint64_t v2 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000F3B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v11 = (char *)&v35 - v10;
  uint64_t v12 = sub_100002CF8(&qword_100018908);
  uint64_t v37 = *(void *)(v12 - 8);
  uint64_t v38 = v12;
  __chkstk_darwin(v12);
  id v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100002CF8(&qword_1000188F0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100002CF8(&qword_1000188E8);
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  __chkstk_darwin(v18);
  uint64_t v43 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100002CF8(&qword_1000188E0);
  uint64_t v42 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v41 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100018390 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_10000B9D8();
  unint64_t v50 = v21;
  sub_10000BE8C();
  sub_10000F370();
  sub_10000F3A0();
  sub_10000F390();
  BOOL v35 = *(void (**)(char *, uint64_t))(v6 + 8);
  v35(v11, v5);
  sub_10000F3C0();
  uint64_t v48 = v15;
  uint64_t v22 = &v17[*(int *)(v15 + 36)];
  sub_10000E8B0(&qword_100018920, (void (*)(uint64_t))&type metadata accessor for BreatheSymbolEffect);
  sub_10000F380();
  uint64_t v23 = sub_10000F330();
  uint64_t v24 = v36;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(&v22[*(int *)(v23 + 20)], v4, v36);
  v22[*(int *)(v23 + 24)] = v40 & 1;
  uint64_t v25 = v37;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v39 = v17;
  uint64_t v27 = v17;
  uint64_t v28 = v38;
  v26(v27, v14, v38);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v24);
  v35(v9, v5);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v28);
  sub_10000F2C0();
  uint64_t v29 = v43;
  unint64_t v30 = sub_10000E748();
  uint64_t v31 = (uint64_t)v39;
  sub_10000F350();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000E8F8(v31);
  sub_10000F2C0();
  uint64_t v49 = v48;
  unint64_t v50 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = v41;
  uint64_t v33 = v46;
  sub_10000F340();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v33);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v47, v32, v44);
}

unint64_t sub_10000E748()
{
  unint64_t result = qword_1000188F8;
  if (!qword_1000188F8)
  {
    sub_10000ACD4(&qword_1000188F0);
    sub_10000E818(&qword_100018900, &qword_100018908);
    sub_10000E8B0(&qword_100018910, (void (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000188F8);
  }
  return result;
}

uint64_t sub_10000E818(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000ACD4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000E85C()
{
  unint64_t result = qword_100018918;
  if (!qword_100018918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018918);
  }
  return result;
}

uint64_t sub_10000E8B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000E8F8(uint64_t a1)
{
  uint64_t v2 = sub_100002CF8(&qword_1000188F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E958()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000EA48()
{
  uint64_t v0 = sub_100002CF8(&qword_100018930);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EBF0();
  sub_10000F2F0();
  sub_10000EC44();
  sub_10000F2D0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000EB70()
{
  unint64_t result = qword_100018928;
  if (!qword_100018928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018928);
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationWidgetsBundle()
{
  return &type metadata for TranslationWidgetsBundle;
}

uint64_t sub_10000EBD4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000EBF0()
{
  unint64_t result = qword_100018938;
  if (!qword_100018938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018938);
  }
  return result;
}

unint64_t sub_10000EC44()
{
  unint64_t result = qword_100018940;
  if (!qword_100018940)
  {
    sub_10000ACD4(&qword_100018930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018940);
  }
  return result;
}

uint64_t sub_10000ECA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10000ED20()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10000ED30()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10000ED40()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10000ED60()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10000ED70()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10000ED80()
{
  return AppIntent.systemContext.getter();
}

uint64_t sub_10000ED90()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000EDA0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10000EDC0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10000EDD0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_10000EDE0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10000EDF0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000EE00()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000EE10()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10000EE20()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000EE30()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_10000EE40()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_10000EE50()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_10000EE60()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_10000EE70()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10000EE80()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10000EE90()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10000EEA0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10000EEB0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10000EEC0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10000EED0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10000EEE0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10000EEF0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10000EF00()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_10000EF10()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10000EF20()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10000EF30()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10000EF40()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10000EF50()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10000EF60()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10000EF70()
{
  return type metadata accessor for IntentSystemContext.Source();
}

uint64_t sub_10000EF80()
{
  return IntentSystemContext.source.getter();
}

uint64_t sub_10000EF90()
{
  return type metadata accessor for IntentSystemContext();
}

uint64_t sub_10000EFA0()
{
  return DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)();
}

uint64_t sub_10000EFB0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_10000EFC0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10000EFD0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10000EFE0()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_10000EFF0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10000F000()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_10000F010()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000F050()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000F060()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000F070()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10000F090()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000F0A0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10000F0B0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000F0C0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000F0D0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F0E0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000F0F0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000F100()
{
  return Locale.init(identifier:)();
}

uint64_t sub_10000F110()
{
  return Locale.identifier.getter();
}

uint64_t sub_10000F120()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t sub_10000F130()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t sub_10000F140(Swift::String forLanguageCode)
{
  return Locale.localizedString(forLanguageCode:)(forLanguageCode).value._countAndFlagsBits;
}

uint64_t sub_10000F150()
{
  return static Locale.current.getter();
}

uint64_t sub_10000F160()
{
  return Locale.Language.languageCode.getter();
}

uint64_t sub_10000F170()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_10000F180()
{
  return Locale.language.getter();
}

uint64_t sub_10000F190()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000F1A0()
{
  return dispatch thunk of Activity.activityState.getter();
}

uint64_t sub_10000F1B0()
{
  return Activity.id.getter();
}

uint64_t sub_10000F1C0()
{
  return dispatch thunk of Activity.endSync(_:dismissalPolicy:)();
}

uint64_t sub_10000F1D0()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:isMomentary:)();
}

uint64_t sub_10000F1E0()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t sub_10000F1F0()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t sub_10000F200()
{
  return type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
}

uint64_t sub_10000F210()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t sub_10000F220()
{
  return ActivityPresentationOptions.isActionButtonInitiated.setter();
}

uint64_t sub_10000F230()
{
  return ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter();
}

uint64_t sub_10000F240()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t sub_10000F250()
{
  return static ActivityState.== infix(_:_:)();
}

uint64_t sub_10000F260()
{
  return type metadata accessor for ActivityState();
}

uint64_t sub_10000F270()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t sub_10000F280()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000F290()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000F2A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000F2B0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10000F2C0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10000F2D0()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_10000F2E0()
{
  return ControlWidgetTemplate.tint(_:)();
}

uint64_t sub_10000F2F0()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_10000F300()
{
  return ControlWidgetConfiguration.showsInControlCenter()();
}

uint64_t sub_10000F310()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_10000F320()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_10000F330()
{
  return type metadata accessor for _IndefiniteSymbolEffectModifier();
}

uint64_t sub_10000F340()
{
  return View.controlWidgetActionHint(_:)();
}

uint64_t sub_10000F350()
{
  return View.controlWidgetStatus(_:)();
}

uint64_t sub_10000F360()
{
  return Color.init(_:)();
}

uint64_t sub_10000F370()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_10000F380()
{
  return dispatch thunk of SymbolEffect.configuration.getter();
}

uint64_t sub_10000F390()
{
  return BreatheSymbolEffect.plain.getter();
}

uint64_t sub_10000F3A0()
{
  return BreatheSymbolEffect.init()();
}

uint64_t sub_10000F3B0()
{
  return type metadata accessor for BreatheSymbolEffect();
}

uint64_t sub_10000F3C0()
{
  return static SymbolEffectOptions.default.getter();
}

uint64_t sub_10000F3D0()
{
  return type metadata accessor for SymbolEffectOptions();
}

uint64_t sub_10000F3E0()
{
  return ControlWidgetToggle<>.init<>(_:isOn:action:valueLabel:)();
}

uint64_t sub_10000F3F0()
{
  return AppIntentControlConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_10000F400()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_10000F410()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000F420()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10000F430()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000F440()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F450()
{
  return String.init(localized:)();
}

uint64_t sub_10000F460()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000F470()
{
  return String.hash(into:)();
}

void sub_10000F480(Swift::String a1)
{
}

Swift::Int sub_10000F490()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_10000F4A0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_10000F4B0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10000F4C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000F4D0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000F4E0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000F4F0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000F500()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000F510()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000F520()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000F530()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000F540()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000F550()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000F560()
{
  return StringProtocol.capitalized.getter();
}

void sub_10000F570(Swift::Int a1)
{
}

uint64_t sub_10000F580()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000F590()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_10000F5A0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_10000F5B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000F5C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000F5D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000F5E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000F5F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000F600(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000F610()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10000F620()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_10000F630()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10000F640()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_10000F650()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10000F660()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10000F670()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000F680()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000F690()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000F6A0()
{
  return Error._code.getter();
}

uint64_t sub_10000F6B0()
{
  return Error._domain.getter();
}

uint64_t sub_10000F6C0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000F6D0()
{
  return Hasher.init(_seed:)();
}

void sub_10000F6E0(Swift::UInt a1)
{
}

Swift::Int sub_10000F6F0()
{
  return Hasher._finalize()();
}

uint64_t sub_10000F700()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000F710()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}