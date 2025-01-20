uint64_t sub_1000054CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  v37 = a1;
  v36 = sub_100005A10(&qword_100040B38);
  ((void (*)(void))__chkstk_darwin)();
  sub_100005BF8();
  v35 = (char *)(v2 - v1);
  v3 = sub_100005A10(&qword_100040B40);
  v29 = v3;
  sub_100005BE0();
  v5 = v4;
  v31 = v4;
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v28 - v9;
  v11 = sub_100005A10(&qword_100040B48);
  sub_100005BE0();
  v13 = v12;
  v34 = v12;
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v28 - v18;
  sub_100005AA8();
  v33 = v19;
  sub_100031FF0();
  sub_100005AF4();
  v30 = v10;
  sub_100031FF0();
  v20 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v32 = v17;
  v20(v17, v19, v11);
  v21 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v21(v8, v10, v3);
  v23 = v35;
  v22 = v36;
  *(void *)v35 = 0xD000000000000011;
  *((void *)v23 + 1) = 0x8000000100033030;
  v20(&v23[*(int *)(v22 + 48)], v17, v11);
  v24 = v29;
  v21(&v23[*(int *)(v22 + 64)], v8, v29);
  swift_bridgeObjectRetain();
  sub_100031E30();
  v25 = *(void (**)(char *, uint64_t))(v31 + 8);
  v25(v30, v24);
  v26 = *(void (**)(char *, uint64_t))(v34 + 8);
  v26(v33, v11);
  v25(v8, v24);
  v26(v32, v11);
  return swift_bridgeObjectRelease();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000057EC()
{
  unint64_t result = qword_100040B20;
  if (!qword_100040B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040B20);
  }
  return result;
}

uint64_t variable initialization expression of OpenAppIntent._app()
{
  uint64_t v0 = sub_100031A60();
  sub_100005BE0();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_100005BF8();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100005A10(&qword_100040B28);
  __chkstk_darwin(v7 - 8);
  sub_100005BF8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_100005A10((uint64_t *)&unk_100041F00);
  __chkstk_darwin(v11 - 8);
  sub_100005BF8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_100031C50();
  __chkstk_darwin(v15);
  sub_100005BF8();
  sub_100005A10(&qword_100040B30);
  sub_100031C20();
  sub_100005A54(v14, 1, 1, v15);
  uint64_t v16 = sub_100031800();
  sub_100005A54(v10, 1, 1, v16);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, enum case for InputConnectionBehavior.default(_:), v0);
  return sub_1000318E0();
}

uint64_t sub_100005A10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

ValueMetadata *type metadata accessor for ShortcutsWidgetBundle()
{
  return &type metadata for ShortcutsWidgetBundle;
}

uint64_t sub_100005A8C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005AA8()
{
  unint64_t result = qword_100040B50;
  if (!qword_100040B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040B50);
  }
  return result;
}

unint64_t sub_100005AF4()
{
  unint64_t result = qword_100040B58;
  if (!qword_100040B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040B58);
  }
  return result;
}

unint64_t sub_100005B44()
{
  unint64_t result = qword_100040B60;
  if (!qword_100040B60)
  {
    sub_100005B98(&qword_100040B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040B60);
  }
  return result;
}

uint64_t sub_100005B98(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100005C08(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(sub_100005A10(&qword_100040B70) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_1000323D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100005D14(uint64_t a1)
{
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_1000323D0();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100005DB8(void *a1, void *a2)
{
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000323D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_100005E74(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_100006978((uint64_t)a1, &qword_100040B70);
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_1000323D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100005F48(void *a1, const void *a2)
{
  uint64_t v4 = sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000323D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_10000600C(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_100006978((uint64_t)a1, &qword_100040B70);
    uint64_t v4 = sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_1000323D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000060E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000060FC);
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_100040B78);

  return sub_100006148(a1, a2, v4);
}

uint64_t sub_100006148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100006170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006184);
}

uint64_t sub_100006184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_100040B78);

  return sub_100005A54(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ComplicationPaddingModifier()
{
  uint64_t result = qword_100040BD8;
  if (!qword_100040BD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000621C()
{
  sub_1000062A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000062A8()
{
  if (!qword_100040BE8)
  {
    sub_1000323D0();
    unint64_t v0 = sub_100031E20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040BE8);
    }
  }
}

uint64_t sub_100006300()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000631C(uint64_t a1)
{
  uint64_t v46 = sub_100005A10(&qword_100040C18);
  sub_100006AA4();
  __chkstk_darwin(v5);
  sub_100005BF8();
  uint64_t v44 = v7 - v6;
  sub_100005A10(&qword_100040C20);
  sub_100006AA4();
  __chkstk_darwin(v8);
  sub_100005BF8();
  uint64_t v11 = v10 - v9;
  sub_100005A10(&qword_100040C28);
  sub_100006AA4();
  __chkstk_darwin(v12);
  sub_100005BF8();
  uint64_t v15 = v14 - v13;
  sub_100005A10(&qword_100040C30);
  sub_100006AA4();
  __chkstk_darwin(v16);
  sub_100005BF8();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_100005A10(&qword_100040C38);
  sub_100006A88();
  uint64_t v22 = v21;
  __chkstk_darwin(v23);
  sub_100005BF8();
  uint64_t v26 = v25 - v24;
  uint64_t v27 = sub_1000323D0();
  sub_100006A88();
  uint64_t v29 = v28;
  __chkstk_darwin(v30);
  sub_100005BF8();
  uint64_t v33 = v32 - v31;
  sub_10002585C(v32 - v31);
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 88))(v33, v27);
  if (&enum case for WidgetFamily.accessoryCorner(_:) && v34 == enum case for WidgetFamily.accessoryCorner(_:))
  {
    char v35 = sub_1000320B0();
    sub_100031E00();
    sub_100006AB4();
    v36(v44, a1, v20);
    uint64_t v37 = v44 + *(int *)(v46 + 36);
    *(unsigned char *)uint64_t v37 = v35;
    *(void *)(v37 + 8) = v1;
    *(void *)(v37 + 16) = v2;
    *(void *)(v37 + 24) = v3;
    *(void *)(v37 + 32) = v4;
    *(unsigned char *)(v37 + 40) = 0;
    sub_10000691C(v44, v15, &qword_100040C18);
    swift_storeEnumTagMultiPayload();
    sub_10000684C();
    sub_1000068A0();
    sub_100031FD0();
    sub_10000691C(v19, v11, &qword_100040C30);
    swift_storeEnumTagMultiPayload();
    sub_100006824();
    sub_100006ACC();
    sub_100031FD0();
    sub_100006978(v19, &qword_100040C30);
    return sub_100006978(v44, &qword_100040C18);
  }
  else if (v34 == enum case for WidgetFamily.accessoryRectangular(_:) {
         || v34 == enum case for WidgetFamily.accessoryInline(_:))
  }
  {
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
    v40(v26, a1, v20);
    v40(v15, v26, v20);
    swift_storeEnumTagMultiPayload();
    sub_10000684C();
    sub_1000068A0();
    sub_100031FD0();
    sub_10000691C(v19, v11, &qword_100040C30);
    swift_storeEnumTagMultiPayload();
    sub_100006824();
    sub_100006ACC();
    sub_100031FD0();
    sub_100006978(v19, &qword_100040C30);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v26, v20);
  }
  else
  {
    char v41 = sub_1000320B0();
    sub_100031E00();
    sub_100006AB4();
    v42(v44, a1, v20);
    uint64_t v43 = v44 + *(int *)(v46 + 36);
    *(unsigned char *)uint64_t v43 = v41;
    *(void *)(v43 + 8) = v1;
    *(void *)(v43 + 16) = v2;
    *(void *)(v43 + 24) = v3;
    *(void *)(v43 + 32) = v4;
    *(unsigned char *)(v43 + 40) = 0;
    sub_10000691C(v44, v11, &qword_100040C18);
    swift_storeEnumTagMultiPayload();
    sub_100006824();
    sub_1000068A0();
    sub_100006ACC();
    sub_100031FD0();
    sub_100006978(v44, &qword_100040C18);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v33, v27);
  }
}

uint64_t sub_100006804()
{
  return sub_100031E60();
}

uint64_t sub_100006824()
{
  return sub_100006A08(&qword_100040C40, &qword_100040C30, (void (*)(void))sub_10000684C);
}

unint64_t sub_10000684C()
{
  unint64_t result = qword_100040C48;
  if (!qword_100040C48)
  {
    sub_100005B98(&qword_100040C38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C48);
  }
  return result;
}

unint64_t sub_1000068A0()
{
  unint64_t result = qword_100040C50;
  if (!qword_100040C50)
  {
    sub_100005B98(&qword_100040C18);
    sub_10000684C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C50);
  }
  return result;
}

uint64_t sub_10000691C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005A10(a3);
  sub_100006AA4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_100006978(uint64_t a1, uint64_t *a2)
{
  sub_100005A10(a2);
  sub_100006AA4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1000069CC()
{
  return sub_100006A08(&qword_100040C58, &qword_100040C60, (void (*)(void))sub_100006824);
}

uint64_t sub_100006A08(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B98(a2);
    a3();
    sub_1000068A0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006ACC()
{
  return v0;
}

void sub_100006ADC()
{
  algn_1000457F8[7] = -18;
}

uint64_t sub_100006B0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v1 = sub_100032550();
  uint64_t v2 = sub_10000927C(v1);
  __chkstk_darwin(v2);
  sub_100009340();
  uint64_t v59 = v3;
  __chkstk_darwin(v4);
  uint64_t v61 = sub_100031C30();
  sub_100006A88();
  uint64_t v57 = v5;
  __chkstk_darwin(v6);
  sub_100009250();
  uint64_t v8 = v7;
  uint64_t v9 = sub_100031D30();
  uint64_t v10 = sub_10000927C(v9);
  __chkstk_darwin(v10);
  sub_100009304();
  uint64_t v58 = sub_100031C50();
  sub_100006A88();
  uint64_t v56 = v11;
  __chkstk_darwin(v12);
  sub_100009340();
  uint64_t v55 = v13;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v48 = sub_100005A10(&qword_100040CC0);
  sub_100006A88();
  uint64_t v44 = v17;
  __chkstk_darwin(v18);
  sub_100009264();
  uint64_t v53 = sub_100005A10(&qword_100040CC8);
  sub_100006A88();
  uint64_t v49 = v19;
  __chkstk_darwin(v20);
  sub_100009250();
  uint64_t v45 = v21;
  uint64_t v54 = sub_100005A10(&qword_100040CD0);
  sub_100006A88();
  uint64_t v50 = v22;
  __chkstk_darwin(v23);
  sub_100009250();
  uint64_t v46 = v24;
  sub_100005A10(&qword_100040CD8);
  sub_100006A88();
  uint64_t v51 = v26;
  uint64_t v52 = v25;
  __chkstk_darwin(v25);
  sub_100009250();
  uint64_t v47 = v27;
  if (qword_100040A70 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100005A10(&qword_100040CE0);
  sub_100008F74();
  sub_100009060(&qword_100040CF0, &qword_100040CE0);
  sub_100032480();
  sub_1000092E0();
  sub_100031D20();
  unsigned int v43 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v57 = *(void *)(v57 + 104);
  ((void (*)(uint64_t))v57)(v8);
  sub_100009214();
  uint64_t v28 = sub_100009060(&qword_100040CF8, &qword_100040CC0);
  uint64_t v29 = v48;
  sub_100032060();
  uint64_t v56 = *(void *)(v56 + 8);
  uint64_t v30 = v16;
  uint64_t v31 = v58;
  ((void (*)(char *, uint64_t))v56)(v30, v58);
  sub_100009354();
  v32();
  sub_1000324E0();
  sub_100031D20();
  ((void (*)(uint64_t, void, uint64_t))v57)(v8, v43, v61);
  uint64_t v33 = v55;
  sub_100009214();
  uint64_t v62 = v29;
  uint64_t v63 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v35 = v53;
  sub_100032050();
  ((void (*)(uint64_t, uint64_t))v56)(v33, v31);
  sub_100009354();
  v36();
  uint64_t v62 = v35;
  uint64_t v63 = OpaqueTypeConformance2;
  uint64_t v37 = swift_getOpaqueTypeConformance2();
  uint64_t v38 = v54;
  sub_100032030();
  sub_100009354();
  v39();
  uint64_t v62 = v38;
  uint64_t v63 = v37;
  swift_getOpaqueTypeConformance2();
  sub_100032070();
  sub_100009354();
  return v40();
}

uint64_t sub_1000070D8()
{
  return sub_100032330();
}

uint64_t sub_100007170@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v34 = sub_100005A10(&qword_100040D20);
  __chkstk_darwin(v34);
  uint64_t v2 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005A10(&qword_100040D18);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v33 - v8;
  uint64_t v10 = sub_100031910();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005A10(&qword_100040C78);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031880();
  if (sub_100006148((uint64_t)v16, 1, v10))
  {
    sub_10000866C((uint64_t)v16);
    NSString v21 = sub_100032560();
    NSString v22 = sub_100032560();
    id v23 = sub_100031508(v21);

    uint64_t v24 = sub_100032570();
    uint64_t v26 = v25;

    uint64_t v36 = v24;
    uint64_t v37 = v26;
    sub_1000090A4();
    sub_1000322A0();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v2, v7, v3);
    swift_storeEnumTagMultiPayload();
    sub_100009060(&qword_100040D10, &qword_100040D18);
    sub_100031FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
    sub_10000866C((uint64_t)v16);
    uint64_t v17 = sub_100031900();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    id v20 = objc_allocWithZone((Class)LSApplicationRecord);
    id v28 = sub_100008A14(v17, v19, 1);
    id v29 = [v28 localizedName];

    uint64_t v30 = sub_100032570();
    uint64_t v32 = v31;

    uint64_t v36 = v30;
    uint64_t v37 = v32;
    sub_1000090A4();
    sub_1000322A0();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v2, v9, v3);
    swift_storeEnumTagMultiPayload();
    sub_100009060(&qword_100040D10, &qword_100040D18);
    sub_100031FD0();
    uint64_t v7 = v9;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_100007640()
{
  NSString v0 = sub_100032560();
  NSString v1 = sub_100032560();
  id v2 = sub_100031508(v0);

  uint64_t v3 = sub_100032570();
  return v3;
}

void sub_1000076E4()
{
}

Swift::Int sub_10000770C()
{
  return sub_100032880();
}

uint64_t sub_100007750()
{
  return 1;
}

Swift::Int sub_100007760()
{
  return sub_100032880();
}

char *OpenAppIntent.isDiscoverable.unsafeMutableAddressor()
{
  return &static OpenAppIntent.isDiscoverable;
}

uint64_t static OpenAppIntent.isDiscoverable.getter()
{
  return static OpenAppIntent.isDiscoverable;
}

uint64_t static OpenAppIntent.isDiscoverable.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static OpenAppIntent.isDiscoverable = a1;
  return result;
}

uint64_t (*static OpenAppIntent.isDiscoverable.modify())()
{
  return j__swift_endAccess;
}

uint64_t static OpenAppIntent.title.getter()
{
  uint64_t v1 = sub_100032550();
  uint64_t v2 = sub_10000927C(v1);
  __chkstk_darwin(v2);
  sub_100009264();
  uint64_t v3 = sub_100031C30();
  sub_100006A88();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_1000092A8();
  uint64_t v7 = sub_100031D30();
  uint64_t v8 = sub_10000927C(v7);
  __chkstk_darwin(v8);
  sub_100009304();
  sub_1000092E0();
  sub_100031D20();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v0, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  return sub_100031C60();
}

uint64_t OpenAppIntent.init()()
{
  uint64_t v2 = sub_100031A60();
  sub_100006A88();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100009264();
  uint64_t v6 = sub_100005A10(&qword_100040B28);
  uint64_t v7 = sub_10000927C(v6);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v11 = sub_10000927C(v10);
  __chkstk_darwin(v11);
  sub_1000092A8();
  uint64_t v12 = sub_100031C50();
  __chkstk_darwin(v12);
  sub_100005A10(&qword_100040B30);
  sub_100031C20();
  sub_100005A54(v1, 1, 1, v12);
  uint64_t v13 = sub_100031800();
  sub_100005A54((uint64_t)v9, 1, 1, v13);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v0, enum case for InputConnectionBehavior.default(_:), v2);
  return sub_1000318E0();
}

uint64_t OpenAppIntent.perform()()
{
  sub_10000931C();
  v0[41] = v1;
  v0[42] = v2;
  uint64_t v3 = sub_100005A10(&qword_100040C70);
  sub_10000927C(v3);
  v0[43] = swift_task_alloc();
  uint64_t v4 = sub_100031910();
  v0[44] = v4;
  v0[45] = *(void *)(v4 - 8);
  v0[46] = swift_task_alloc();
  uint64_t v5 = sub_100005A10(&qword_100040C78);
  sub_10000927C(v5);
  v0[47] = swift_task_alloc();
  sub_100009368();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_100007CCC()
{
  uint64_t v1 = v0[47];
  uint64_t v2 = v0[44];
  sub_100031880();
  if (sub_100006148(v1, 1, v2))
  {
    sub_10000866C(v0[47]);
    sub_1000086CC();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_100009328();
    return v3();
  }
  else
  {
    uint64_t v6 = v0[46];
    uint64_t v5 = v0[47];
    uint64_t v7 = v0[44];
    uint64_t v8 = v0[45];
    uint64_t v9 = v0[43];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    sub_10000866C(v5);
    uint64_t v10 = sub_100031900();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    uint64_t v13 = sub_1000324B0();
    uint64_t v14 = sub_100031CB0();
    sub_100005A54(v9, 1, 1, v14);
    id v15 = objc_allocWithZone((Class)WFAppLaunchRequest);
    id v16 = sub_100008AF0(v10, v12, v13, v9, 0, 0);
    v0[48] = v16;
    [v16 setRequiresUserFacingApp:1];
    v0[10] = v0;
    v0[15] = (char *)v0 + 418;
    v0[11] = sub_100007F78;
    uint64_t v17 = swift_continuation_init();
    v0[36] = _NSConcreteStackBlock;
    v0[37] = 0x40000000;
    v0[38] = sub_100008718;
    v0[39] = &unk_10003DE28;
    v0[40] = v17;
    [v16 performWithCompletionHandler:v0 + 36];
    return _swift_continuation_await(v0 + 10);
  }
}

uint64_t sub_100007F78()
{
  sub_10000931C();
  sub_1000091FC();
  sub_100009334();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 392) = *(void *)(v3 + 112);
  sub_100009368();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100008058()
{
  sub_1000092D4();
  if ((*(unsigned char *)(v0 + 418) & 1) != 0 || !VCIsDeviceLocked())
  {
    sub_100009288();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1000092C4();
    return v4();
  }
  else
  {
    id v2 = [objc_allocWithZone((Class)WFCompactUnlockService) init];
    *(void *)(v0 + 400) = v2;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 416;
    *(void *)(v0 + 24) = sub_1000081CC;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 248) = _NSConcreteStackBlock;
    *(void *)(v0 + 256) = 0x40000000;
    *(void *)(v0 + 264) = sub_1000087E4;
    *(void *)(v0 + 272) = &unk_10003DE40;
    *(void *)(v0 + 280) = v3;
    [v2 requestUnlockIfNeeded:v0 + 248];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_1000081CC()
{
  sub_10000931C();
  uint64_t v1 = *v0;
  sub_100009334();
  *id v2 = v1;
  sub_100009368();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_1000082A0()
{
  sub_1000092D4();
  if (*(unsigned char *)(v0 + 416) == 1)
  {
    id v2 = *(void **)(v0 + 384);
    *(void *)(v0 + 144) = v0;
    *(void *)(v0 + 184) = v0 + 417;
    *(void *)(v0 + 152) = sub_1000083FC;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 208) = _NSConcreteStackBlock;
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = sub_100008718;
    *(void *)(v0 + 232) = &unk_10003DE58;
    *(void *)(v0 + 240) = v3;
    [v2 performWithCompletionHandler:v0 + 208];
    return _swift_continuation_await(v0 + 144);
  }
  else
  {

    sub_100009288();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1000092C4();
    return v4();
  }
}

uint64_t sub_1000083FC()
{
  sub_10000931C();
  sub_1000091FC();
  sub_100009334();
  *id v2 = v1;
  *id v2 = *v0;
  *(void *)(v1 + 408) = *(void *)(v3 + 176);
  sub_100009368();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1000084DC()
{
  sub_1000092D4();

  sub_100009288();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000092C4();
  return v2();
}

uint64_t sub_10000855C()
{
  sub_1000092D4();
  uint64_t v1 = *(void **)(v0 + 384);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100009328();
  return v2();
}

uint64_t sub_1000085E0()
{
  sub_1000092D4();
  uint64_t v1 = *(void **)(v0 + 400);
  id v2 = *(void **)(v0 + 384);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100009328();
  return v3();
}

uint64_t sub_10000866C(uint64_t a1)
{
  uint64_t v2 = sub_100005A10(&qword_100040C78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000086CC()
{
  unint64_t result = qword_100040C80;
  if (!qword_100040C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C80);
  }
  return result;
}

uint64_t sub_100008718(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!a3) {
    return sub_100008814(*(void *)(a1 + 32), a2, (uint64_t (*)(void))&swift_continuation_throwingResume);
  }
  id v4 = a3;

  return sub_100008780(v3, (uint64_t)v4);
}

uint64_t sub_100008780(uint64_t a1, uint64_t a2)
{
  sub_100005A10(&qword_100040CB8);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;

  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_1000087E4(uint64_t a1, char a2)
{
  return sub_100008814(*(void *)(a1 + 32), a2, (uint64_t (*)(void))&swift_continuation_resume);
}

uint64_t sub_100008814(uint64_t a1, char a2, uint64_t (*a3)(void))
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return a3();
}

uint64_t sub_10000884C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000088EC;
  return OpenAppIntent.perform()();
}

uint64_t sub_1000088EC()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v1 = *v0;
  sub_100009334();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100009328();
  return v3();
}

uint64_t sub_1000089B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OpenAppIntent.init()();
  *a1 = result;
  return result;
}

uint64_t sub_1000089D8(uint64_t a1)
{
  unint64_t v2 = sub_100008C28();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

id sub_100008A14(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_100032560();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100031C10();

    swift_willThrow();
  }
  return v6;
}

id sub_100008AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  id v7 = v6;
  NSString v12 = sub_100032560();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v13.super.isa = sub_1000324A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  uint64_t v14 = sub_100031CB0();
  id v16 = 0;
  if (sub_100006148(a4, 1, v14) != 1)
  {
    sub_100031C90(v15);
    id v16 = v17;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a4, v14);
  }
  id v18 = [v7 initWithBundleIdentifier:v12 options:v13.super.isa URL:v16 userActivity:a5 retainsSiri:a6 & 1];

  return v18;
}

unint64_t sub_100008C28()
{
  unint64_t result = qword_100040C88;
  if (!qword_100040C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C88);
  }
  return result;
}

unint64_t sub_100008C78()
{
  unint64_t result = qword_100040C90;
  if (!qword_100040C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C90);
  }
  return result;
}

unint64_t sub_100008CC8()
{
  unint64_t result = qword_100040C98;
  if (!qword_100040C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C98);
  }
  return result;
}

uint64_t sub_100008D14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008D30()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for OpenAppIntent()
{
}

uint64_t sub_100008D8C()
{
  return sub_100009060((unint64_t *)&qword_100041E90, &qword_100040CA8);
}

uint64_t sub_100008DD0(unsigned int *a1, int a2)
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

unsigned char *sub_100008E20(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100008EBCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100008EE4()
{
  return 0;
}

void type metadata accessor for OpenAppIntent.OpenAppIntentError()
{
}

unint64_t sub_100008F00()
{
  unint64_t result = qword_100040CB0;
  if (!qword_100040CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040CB0);
  }
  return result;
}

void type metadata accessor for OpenAppControl()
{
}

uint64_t sub_100008F58()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008F74()
{
  unint64_t result = qword_100040CE8;
  if (!qword_100040CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040CE8);
  }
  return result;
}

uint64_t sub_100008FC0@<X0>(uint64_t a1@<X8>)
{
  return sub_100007170(a1);
}

unint64_t sub_100008FC8()
{
  unint64_t result = qword_100040D08;
  if (!qword_100040D08)
  {
    sub_100005B98(&qword_100040D00);
    sub_100009060(&qword_100040D10, &qword_100040D18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040D08);
  }
  return result;
}

uint64_t sub_100009060(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B98(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000090A4()
{
  unint64_t result = qword_100040D28;
  if (!qword_100040D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040D28);
  }
  return result;
}

uint64_t sub_1000090F0()
{
  return sub_100009374();
}

uint64_t sub_100009214()
{
  return sub_100031C60();
}

uint64_t sub_10000927C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100009288()
{
  return sub_100031810();
}

uint64_t sub_1000092A8()
{
  return 0;
}

uint64_t sub_1000092C4()
{
  return v0 + 8;
}

uint64_t sub_1000092E0()
{
  return sub_1000324E0();
}

uint64_t sub_100009328()
{
  return v0 + 8;
}

uint64_t sub_100009374()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000938C()
{
  type metadata accessor for RunningShortcutTracker();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  type metadata accessor for RunningShortcutTracker.State();
  uint64_t result = sub_1000324B0();
  *(void *)(v0 + 112) = result;
  qword_100045808 = v0;
  return result;
}

uint64_t sub_1000093F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031D10();
  sub_100006A88();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100005BF8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for RunningShortcutTracker.State();
  __chkstk_darwin(v9);
  sub_100005BF8();
  uint64_t v12 = v11 - v10;
  sub_10000AAA0(v1, v11 - v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v12, v2);
    sub_100005A10(&qword_100040E98);
    unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100035A40;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v14 + v13, v8, v2);
    sub_100031CF0();
    sub_100031CF0();
    sub_100031CF0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  }
  else
  {
    uint64_t v15 = sub_100005A10(&qword_100040DD8);

    id v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v16(v8, v12, v2);
    sub_100005A10(&qword_100040E98);
    unint64_t v17 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100035A30;
    v16(v14 + v17, v8, v2);
  }
  return v14;
}

uint64_t sub_100009634(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100005A10(&qword_100040E88);
  __chkstk_darwin(v5 - 8);
  sub_10000AB4C();
  uint64_t v6 = sub_100005A10(&qword_100040DD8);
  uint64_t v7 = *(int *)(v6 + 48);
  uint64_t v8 = *(int *)(v6 + 64);
  swift_bridgeObjectRetain();
  sub_100031D00();
  *(void *)(v2 + v7) = 0;
  *(void *)(v2 + v8) = 0;
  type metadata accessor for RunningShortcutTracker.State();
  swift_storeEnumTagMultiPayload();
  sub_10000AB04();
  sub_10000972C(v2, a1, a2);
  swift_endAccess();
  sub_1000323C0();
  sub_1000323B0();
  sub_1000323A0();
  return swift_release();
}

uint64_t sub_10000972C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005A10(&qword_100040E88);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RunningShortcutTracker.State();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100006148(a1, 1, v12) == 1)
  {
    sub_10000A400(a1);
    sub_10000A5BC(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease();
    return sub_10000A400((uint64_t)v8);
  }
  else
  {
    sub_10000A720(a1, (uint64_t)v11);
    sub_10000A784((uint64_t)v11, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100009860(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100005A10(&qword_100040E88);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v13 = sub_100031D10();
  sub_100006A88();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_100005BF8();
  uint64_t v19 = v18 - v17;
  swift_beginAccess();
  uint64_t v20 = *(void *)(v3 + 112);
  if (!*(void *)(v20 + 16))
  {
    uint64_t v28 = type metadata accessor for RunningShortcutTracker.State();
    sub_100005A54((uint64_t)v12, 1, 1, v28);
LABEL_7:
    sub_10000A400((uint64_t)v12);
    return swift_endAccess();
  }
  char v41 = a1;
  uint64_t v42 = v15;
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_10000A460(a2, a3);
  if (v22)
  {
    unint64_t v23 = v21;
    uint64_t v24 = *(void *)(v20 + 56);
    uint64_t v25 = type metadata accessor for RunningShortcutTracker.State();
    sub_10000AAA0(v24 + *(void *)(*(void *)(v25 - 8) + 72) * v23, (uint64_t)v12);
    uint64_t v26 = (uint64_t)v12;
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v25 = type metadata accessor for RunningShortcutTracker.State();
    uint64_t v26 = (uint64_t)v12;
    uint64_t v27 = 1;
  }
  sub_100005A54(v26, v27, 1, v25);
  swift_bridgeObjectRelease();
  type metadata accessor for RunningShortcutTracker.State();
  if (sub_100006148((uint64_t)v12, 1, v25) == 1) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10000A0D4((uint64_t)v12);
    return swift_endAccess();
  }
  uint64_t v30 = sub_100005A10(&qword_100040DD8);
  uint64_t v31 = *(void **)&v12[*(int *)(v30 + 48)];
  uint64_t v32 = *(int *)(v30 + 64);
  uint64_t v40 = a2;
  uint64_t v33 = *(void **)&v12[v32];
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v19, v12, v13);
  swift_endAccess();

  unsigned int v43 = v41;
  swift_getKeyPath();
  uint64_t v34 = (void *)sub_100031C70();
  swift_release();
  uint64_t v35 = *(int *)(v30 + 48);
  uint64_t v36 = *(int *)(v30 + 64);
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v10, v19, v13);
  uint64_t v37 = v41;
  *(void *)&v10[v35] = v41;
  *(void *)&v10[v36] = v34;
  swift_storeEnumTagMultiPayload();
  sub_100005A54((uint64_t)v10, 0, 1, v25);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v38 = v37;
  id v39 = v34;
  sub_10000972C((uint64_t)v10, v40, a3);
  swift_endAccess();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v19, v13);
}

uint64_t sub_100009BE0()
{
  sub_1000323C0();
  sub_1000323B0();
  sub_1000323A0();

  return swift_release();
}

uint64_t sub_100009C28(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100005A10(&qword_100040E88);
  __chkstk_darwin(v5 - 8);
  sub_10000AB4C();
  swift_bridgeObjectRetain();
  sub_100031D00();
  type metadata accessor for RunningShortcutTracker.State();
  swift_storeEnumTagMultiPayload();
  sub_10000AB04();
  sub_10000972C(v2, a1, a2);
  swift_endAccess();
  sub_1000323C0();
  sub_1000323B0();
  sub_1000323A0();
  return swift_release();
}

uint64_t sub_100009D04()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for RunningShortcutTracker()
{
  return self;
}

uint64_t *sub_100009D60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_100031D10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v9 = sub_100005A10(&qword_100040DD8);
      uint64_t v10 = *(int *)(v9 + 48);
      uint64_t v11 = *(void **)((char *)a2 + v10);
      *(uint64_t *)((char *)a1 + v10) = (uint64_t)v11;
      uint64_t v12 = *(int *)(v9 + 64);
      uint64_t v13 = *(void **)((char *)a2 + v12);
      *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
      id v14 = v11;
      id v15 = v13;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_100009E84(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = sub_100031D10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v4 = sub_100005A10(&qword_100040DD8);

    int v5 = *(void **)(a1 + *(int *)(v4 + 64));
  }
}

uint64_t sub_100009F2C(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_100031D10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v6 = sub_100005A10(&qword_100040DD8);
    uint64_t v7 = *(int *)(v6 + 48);
    uint64_t v8 = *(void **)(a2 + v7);
    *(void *)(a1 + v7) = v8;
    uint64_t v9 = *(int *)(v6 + 64);
    uint64_t v10 = *(void **)(a2 + v9);
    *(void *)(a1 + v9) = v10;
    id v11 = v8;
    id v12 = v10;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100009FF8(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10000A0D4(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_100031D10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v6 = sub_100005A10(&qword_100040DD8);
      uint64_t v7 = *(int *)(v6 + 48);
      uint64_t v8 = *(void **)(a2 + v7);
      *(void *)(a1 + v7) = v8;
      uint64_t v9 = *(int *)(v6 + 64);
      uint64_t v10 = *(void **)(a2 + v9);
      *(void *)(a1 + v9) = v10;
      id v11 = v8;
      id v12 = v10;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000A0D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RunningShortcutTracker.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RunningShortcutTracker.State()
{
  uint64_t result = qword_100040E50;
  if (!qword_100040E50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A178(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_100031D10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v6 = sub_100005A10(&qword_100040DD8);
    *(void *)(a1 + *(int *)(v6 + 48)) = *(void *)(a2 + *(int *)(v6 + 48));
    *(void *)(a1 + *(int *)(v6 + 64)) = *(void *)(a2 + *(int *)(v6 + 64));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10000A23C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10000A0D4(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_100031D10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v6 = sub_100005A10(&qword_100040DD8);
      *(void *)(a1 + *(int *)(v6 + 48)) = *(void *)(a2 + *(int *)(v6 + 48));
      *(void *)(a1 + *(int *)(v6 + 64)) = *(void *)(a2 + *(int *)(v6 + 64));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000A31C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10000A32C()
{
  uint64_t result = sub_100031D10();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout3();
    v3[4] = v3;
    v3[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_10000A3D8()
{
  return v0;
}

uint64_t sub_10000A3E4()
{
  return sub_10000A3D8();
}

uint64_t sub_10000A400(uint64_t a1)
{
  uint64_t v2 = sub_100005A10(&qword_100040E88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000A460(uint64_t a1, uint64_t a2)
{
  sub_100032850();
  sub_1000325A0();
  Swift::Int v4 = sub_100032880();

  return sub_10000A4D8(a1, a2, v4);
}

unint64_t sub_10000A4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000327E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000327E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000A5BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10000A460(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v4;
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100005A10(&qword_100040E90);
    sub_100032770(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v19 + 56);
    uint64_t v14 = type metadata accessor for RunningShortcutTracker.State();
    sub_10000A720(v13 + *(void *)(*(void *)(v14 - 8) + 72) * v8, a3);
    sub_100032780();
    *uint64_t v4 = v19;
    swift_bridgeObjectRelease();
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v14;
  }
  else
  {
    uint64_t v17 = type metadata accessor for RunningShortcutTracker.State();
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return sub_100005A54(v15, v16, 1, v17);
}

uint64_t sub_10000A720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunningShortcutTracker.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_10000A814(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A814(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10000A460(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005A10(&qword_100040E90);
  if (!sub_100032770(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10000A460(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = sub_100032800();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t v22 = v21 + *(void *)(*(void *)(type metadata accessor for RunningShortcutTracker.State() - 8) + 72) * v16;
    return sub_10000A9FC(a1, v22);
  }
  else
  {
    sub_10000A964(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000A964(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for RunningShortcutTracker.State();
  uint64_t result = sub_10000A720(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_10000A9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunningShortcutTracker.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

const char *sub_10000AA60()
{
  return "fractionCompleted";
}

id sub_10000AA6C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 fractionCompleted];
  *a2 = v4;
  return result;
}

uint64_t sub_10000AAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunningShortcutTracker.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AB04()
{
  sub_100005A54(v0, 0, 1, v1);
  return swift_beginAccess();
}

unint64_t sub_10000AB64()
{
  return 0xD000000000000011;
}

void *initializeBufferWithCopyOfBuffer for RunShortcutWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RunShortcutWidget()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RunShortcutWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for RunShortcutWidget(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RunShortcutWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RunShortcutWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RunShortcutWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RunShortcutWidget()
{
  return &type metadata for RunShortcutWidget;
}

uint64_t sub_10000ACC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000ACE4@<X0>(uint64_t a1@<X8>)
{
  sub_100031D00();
  unint64_t v2 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  *(unsigned char *)(a1 + v2[8]) = 0;
  *(void *)(a1 + v2[5]) = 0;
  uint64_t v3 = a1 + v2[6];
  *(void *)(v3 + 48) = 0;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  uint64_t v4 = a1 + v2[7];
  uint64_t v5 = type metadata accessor for RunningShortcutTracker.State();

  return sub_100005A54(v4, 1, 1, v5);
}

uint64_t sub_10000AD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a2;
  v4[11] = a4;
  v4[9] = a1;
  return _swift_task_switch(sub_10000AD8C, 0, 0);
}

uint64_t sub_10000AD8C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  sub_100031880();
  long long v10 = *(_OWORD *)(v0 + 32);
  long long v11 = *(_OWORD *)(v0 + 16);
  long long v9 = *(_OWORD *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v4 = v1 + v3[7];
  uint64_t v5 = type metadata accessor for RunningShortcutTracker.State();
  sub_100005A54(v4, 1, 1, v5);
  LOBYTE(v4) = sub_100032420();
  sub_100031D00();
  uint64_t v6 = v1 + v3[6];
  *(_OWORD *)uint64_t v6 = v11;
  *(_OWORD *)(v6 + 16) = v10;
  *(_OWORD *)(v6 + 32) = v9;
  *(void *)(v6 + 48) = v2;
  *(unsigned char *)(v1 + v3[8]) = (v4 & 1) == 0;
  *(void *)(v1 + v3[5]) = 0;
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_10000AEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a2;
  v4[19] = a4;
  v4[17] = a1;
  uint64_t v5 = type metadata accessor for RunShortcutWidgetEntry(0);
  v4[20] = v5;
  sub_100010664(v5);
  v4[21] = v6;
  v4[22] = swift_task_alloc();
  sub_100032400();
  v4[23] = swift_task_alloc();
  sub_100005A10(&qword_100040E88);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  return _swift_task_switch(sub_10000AFAC, 0, 0);
}

uint64_t sub_10000AFAC()
{
  sub_100031880();
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v6 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[15];
  if (v2)
  {
    uint64_t v8 = v0[24];
    uint64_t v9 = v0[25];
    v0[2] = v2;
    v0[3] = v1;
    v0[4] = v4;
    v0[5] = v3;
    v0[6] = v6;
    v0[7] = v5;
    v0[8] = v7;
    uint64_t v10 = type metadata accessor for RunningShortcutTracker.State();
    sub_100005A54(v9, 1, 1, v10);
    sub_10000691C(v9, v8, &qword_100040E88);
    int v11 = sub_100006148(v8, 1, v10);
    uint64_t v12 = v0[24];
    if (v11 == 1)
    {
      sub_100010484(v12, &qword_100040E88);
      sub_100005A10(&qword_100040E98);
      uint64_t v13 = sub_100031D10();
      sub_100010664(v13);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_100035A30;
      sub_100031D00();
    }
    else
    {
      uint64_t v14 = sub_1000093F4();
      sub_100010238(v12, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    }
    uint64_t v23 = v0[25];
    uint64_t v24 = v0[19];
    uint64_t v25 = (void *)swift_task_alloc();
    v25[2] = v0 + 2;
    v25[3] = v23;
    v25[4] = v24;
    sub_10000B48C((void (*)(uint64_t))sub_1000104D4, (uint64_t)v25, v14);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_1000323F0();
    sub_10000FBA8(&qword_100041018, (void (*)(uint64_t))type metadata accessor for RunShortcutWidgetEntry);
    sub_100032490();
    sub_1000102C4(v2);
    sub_100010484(v23, &qword_100040E88);
  }
  else
  {
    uint64_t v15 = v0[22];
    char v17 = (int *)v0[20];
    uint64_t v16 = v0[21];
    uint64_t v18 = v0[12];
    sub_100031D00();
    *(unsigned char *)(v15 + v17[8]) = 1;
    *(void *)(v15 + v17[5]) = 0;
    char v19 = (void *)(v15 + v17[6]);
    *char v19 = 0;
    v19[1] = v1;
    v19[2] = v4;
    v19[3] = v18;
    v19[4] = v6;
    v19[5] = v5;
    v19[6] = v7;
    uint64_t v20 = type metadata accessor for RunningShortcutTracker.State();
    sub_1000106F4(v20);
    sub_100005A10(&qword_1000410F8);
    unint64_t v21 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100035A30;
    sub_10000D6E0(v15, v22 + v21);
    sub_1000323F0();
    sub_10000FBA8(&qword_100041018, (void (*)(uint64_t))type metadata accessor for RunShortcutWidgetEntry);
    sub_100032490();
    sub_100010238(v15, (void (*)(void))type metadata accessor for RunShortcutWidgetEntry);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_10000B378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v15 = *(_OWORD *)(a2 + 16);
  long long v16 = *(_OWORD *)a2;
  long long v14 = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = sub_100031D10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a4, a1, v9);
  uint64_t v10 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  sub_10000691C(a3, a4 + v10[7], &qword_100040E88);
  char v11 = sub_100032420();
  uint64_t v12 = a4 + v10[6];
  *(_OWORD *)uint64_t v12 = v16;
  *(_OWORD *)(v12 + 16) = v15;
  *(_OWORD *)(v12 + 32) = v14;
  *(void *)(v12 + 48) = v8;
  *(unsigned char *)(a4 + v10[8]) = (v11 & 1) == 0;
  *(void *)(a4 + v10[5]) = 0;
  return sub_10001055C(a2);
}

unint64_t *sub_10000B48C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  char v19 = a1;
  uint64_t v20 = a2;
  uint64_t v6 = type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  char v11 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v10)
  {
    unint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000196C0(0, v10, 0);
    char v11 = v21;
    uint64_t v12 = *(void *)(sub_100031D10() - 8);
    uint64_t v13 = a3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v18 = *(void *)(v12 + 72);
    while (1)
    {
      v19(v13);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      unint64_t v21 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000196C0(v14 > 1, v15 + 1, 1);
        char v11 = v21;
      }
      v11[2] = v15 + 1;
      sub_1000104F8((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v15);
      v13 += v18;
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

uint64_t sub_10000B67C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100010660;
  return sub_10000AD68(a1, v6, v7, a3);
}

uint64_t sub_10000B72C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100010660;
  return sub_10000AEA0(a1, v6, v7, a3);
}

uint64_t sub_10000B7E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000B898;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000B898()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B98C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100010660;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10000BA40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(v3 + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t v8 = v4[2];
  uint64_t v9 = v4[3];
  uint64_t v10 = v4[4];
  uint64_t v11 = v4[5];
  uint64_t v12 = v4[6];
  if (!*v4)
  {
    uint64_t v13 = *(void **)(v1 + *(int *)(v3 + 20));
    if (v13)
    {
      sub_1000161A8(v13, (uint64_t)v16);
      uint64_t v6 = v16[0];
      uint64_t v7 = v16[1];
      uint64_t v8 = v16[2];
      uint64_t v9 = v16[3];
      uint64_t v10 = v16[4];
      uint64_t v11 = v16[5];
      uint64_t v12 = v16[6];
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
  }
  uint64_t v14 = v6;
  uint64_t result = sub_1000103F8(v5);
  *a1 = v14;
  a1[1] = v7;
  a1[2] = v8;
  a1[3] = v9;
  a1[4] = v10;
  a1[5] = v11;
  a1[6] = v12;
  return result;
}

void sub_10000BB58()
{
  uint64_t v1 = type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v2 = *(void **)(v0 + *(int *)(v1 + 20));
  if (!v2)
  {
    uint64_t v3 = *(void *)(v0 + *(int *)(v1 + 24));
    if (v3)
    {
      uint64_t v4 = qword_100040B18;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      if (v4 != -1) {
        swift_once();
      }
      sub_100005A10(&qword_1000410D0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_100035A30;
      sub_100031820();
      *(void *)(v5 + 32) = v31;
      *(void *)(v5 + 40) = v32;
      unint64_t v6 = sub_100030A18();
      swift_bridgeObjectRelease();
      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v7 = sub_1000327A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v7)
      {
        sub_10001969C(0, (v6 & 0xC000000000000001) == 0, v6);
        if ((v6 & 0xC000000000000001) != 0) {
          id v8 = (id)sub_100032710();
        }
        else {
          id v8 = *(id *)(v6 + 32);
        }
        uint64_t v9 = v8;
        swift_bridgeObjectRelease();
        sub_10000C030();

        uint64_t v10 = sub_100010694();
LABEL_14:
        sub_1000102C4(v10);
        return;
      }
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_100010694();
      sub_1000102C4(v11);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_100031820();
      if (v32)
      {
        uint64_t v28 = sub_100031CC0();
        unint64_t v13 = v12;
        swift_bridgeObjectRelease();
        if (v13 >> 60 == 15
          || (sub_100010350(0, &qword_1000410D8),
              sub_100010350(0, &qword_100041F40),
              long long v16 = (void *)sub_1000326A0(),
              sub_10001038C(v28, v13),
              !v16))
        {
          uint64_t v14 = sub_1000106AC();
        }
        else
        {
          self;
          uint64_t v17 = swift_dynamicCastObjCClass();
          if (!v17)
          {
            sub_1000102C4(v3);

            goto LABEL_22;
          }
          uint64_t v18 = (void *)v17;
          id v29 = v16;
          uint64_t v19 = swift_allocObject();
          *(_OWORD *)(v19 + 16) = xmmword_100035A30;
          id v20 = [v18 workflowIdentifier];
          uint64_t v21 = sub_100032570();
          uint64_t v23 = v22;

          *(void *)(v19 + 32) = v21;
          *(void *)(v19 + 40) = v23;
          unint64_t v24 = sub_100030A18();
          swift_bridgeObjectRelease();
          if (v24 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v25 = sub_1000327A0();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          if (v25)
          {
            sub_10001969C(0, (v24 & 0xC000000000000001) == 0, v24);
            if ((v24 & 0xC000000000000001) != 0) {
              id v26 = (id)sub_100032710();
            }
            else {
              id v26 = *(id *)(v24 + 32);
            }
            uint64_t v27 = v26;
            swift_bridgeObjectRelease();
            sub_10000C030();

            uint64_t v10 = sub_1000106C4();
            goto LABEL_14;
          }

          swift_bridgeObjectRelease();
          uint64_t v14 = sub_1000106C4();
        }
      }
      else
      {
        uint64_t v14 = sub_100010694();
      }
      sub_1000102C4(v14);
    }
LABEL_22:
    uint64_t v15 = sub_100031CB0();
    sub_1000106F4(v15);
    return;
  }
  id v30 = v2;
  sub_10000C030();
}

uint64_t sub_10000C030()
{
  uint64_t v1 = sub_100031BD0();
  sub_100006A88();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100009264();
  sub_100031BC0();
  sub_100031BB0();
  sub_100031B90();
  sub_100005A10(&qword_1000410E0);
  uint64_t v5 = sub_100031B20();
  sub_100010664(v5);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100035B10;
  id v6 = [v0 identifier];
  sub_100032570();

  sub_100031B10();
  swift_bridgeObjectRelease();
  id v7 = [v0 name];
  sub_100032570();

  sub_100031B10();
  swift_bridgeObjectRelease();
  sub_100032570();
  sub_100031B10();
  swift_bridgeObjectRelease();
  sub_100031B30();
  sub_100031B50();
  return (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v0, v1);
}

void sub_10000C270()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for RunShortcutWidgetEntry(0) + 20));
  if (v1)
  {
    id v2 = [v1 name];
    sub_100032570();

    sub_100032870(1u);
    swift_bridgeObjectRetain();
    sub_1000325A0();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_100032870(0);
  }
}

uint64_t sub_10000C310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v5 = *(int *)(v4 + 20);
  id v6 = *(void **)(a1 + v5);
  if (v6)
  {
    id v7 = [v6 name];
    uint64_t v8 = sub_100032570();
    uint64_t v10 = v9;

    uint64_t v11 = *(void **)(a2 + *(int *)(v4 + 20));
    if (!v11)
    {
      if (!v10) {
        goto LABEL_17;
      }
LABEL_14:
      char v17 = 0;
LABEL_19:
      swift_bridgeObjectRelease();
      return v17 & 1;
    }
  }
  else
  {
    uint64_t v11 = *(void **)(a2 + v5);
    if (!v11) {
      goto LABEL_17;
    }
    uint64_t v10 = 0;
    uint64_t v8 = 0;
  }
  id v12 = [v11 name];
  uint64_t v13 = sub_100032570();
  uint64_t v15 = v14;

  if (v10)
  {
    if (v15)
    {
      if (v8 == v13 && v10 == v15)
      {
        swift_bridgeObjectRelease();
        char v17 = 1;
      }
      else
      {
        char v17 = sub_1000327E0();
        swift_bridgeObjectRelease();
      }
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (v15)
  {
    char v17 = 0;
    goto LABEL_19;
  }
LABEL_17:
  char v17 = 1;
  return v17 & 1;
}

Swift::Int sub_10000C440()
{
  return sub_100032880();
}

uint64_t sub_10000C480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100031D10();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

Swift::Int sub_10000C4F4()
{
  return sub_100032880();
}

uint64_t sub_10000C534()
{
  uint64_t v2 = sub_100005A10(&qword_100041048);
  __chkstk_darwin(v2 - 8);
  sub_1000106DC();
  uint64_t v3 = sub_100005A10(&qword_100041050);
  sub_100006AA4();
  __chkstk_darwin(v4);
  sub_100005BF8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_100005A10(&qword_100041058);
  sub_100006A88();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_100005BF8();
  uint64_t v14 = v13 - v12;
  sub_10000C758(v0, v1);
  char v15 = *(unsigned char *)(v0 + *(int *)(type metadata accessor for RunShortcutWidgetEntry(0) + 32));
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = (v15 & 1) == 0;
  sub_10000691C(v1, v7, &qword_100041048);
  uint64_t v18 = (uint64_t *)(v7 + *(int *)(v3 + 36));
  *uint64_t v18 = KeyPath;
  v18[1] = (uint64_t)sub_10000FE98;
  v18[2] = v17;
  sub_100010484(v1, &qword_100041048);
  sub_10000FEB0();
  sub_1000321D0();
  sub_100010484(v7, &qword_100041050);
  swift_getOpaqueTypeConformance2();
  sub_1000321A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
}

uint64_t sub_10000C758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v3 = sub_100005A10(&qword_100040C70);
  __chkstk_darwin(v3 - 8);
  uint64_t v61 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for RunShortcutComplicationView();
  __chkstk_darwin(v64);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100005A10(&qword_100041080);
  uint64_t v59 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v58 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100005A10(&qword_1000410A8);
  uint64_t v8 = *(void *)(v69 - 8);
  uint64_t v9 = __chkstk_darwin(v69);
  uint64_t v57 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v62 = (char *)&v53 - v11;
  uint64_t v63 = sub_100005A10(&qword_1000410B0);
  __chkstk_darwin(v63);
  v67 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for EmptyShortcutComplicationView();
  __chkstk_darwin(v65);
  uint64_t v14 = (uint64_t *)((char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v66 = sub_100005A10(&qword_1000410B8);
  uint64_t v55 = *(void *)(v66 - 8);
  uint64_t v15 = __chkstk_darwin(v66);
  uint64_t v53 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v54 = (char *)&v53 - v17;
  uint64_t v60 = a1;
  sub_10000BA40(v75);
  uint64_t v56 = v75[5];
  uint64_t v18 = v75[6];
  sub_100010154((uint64_t)v75, (uint64_t)v76);
  uint64_t v19 = v76[0];
  if (v76[0])
  {
    uint64_t v54 = (char *)v18;
    uint64_t v20 = v76[1];
    long long v80 = v77;
    long long v81 = v78;
    uint64_t v82 = v79;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v55 = v8;
    uint64_t v22 = v64;
    *(void *)&v6[*(int *)(v64 + 20)] = KeyPath;
    sub_100005A10(&qword_100040B70);
    swift_storeEnumTagMultiPayload();
    *(void *)uint64_t v6 = v19;
    *((void *)v6 + 1) = v20;
    long long v23 = v81;
    *((_OWORD *)v6 + 1) = v80;
    *((_OWORD *)v6 + 2) = v23;
    *((void *)v6 + 6) = v82;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100031820();
    uint64_t v24 = sub_10000FBA8(&qword_100041088, (void (*)(uint64_t))type metadata accessor for RunShortcutComplicationView);
    unint64_t v25 = sub_1000090A4();
    id v26 = v58;
    sub_100032150();
    swift_bridgeObjectRelease();
    sub_100010238((uint64_t)v6, (void (*)(void))type metadata accessor for RunShortcutComplicationView);
    uint64_t v27 = (uint64_t)v61;
    sub_10000BB58();
    uint64_t v71 = v22;
    v72 = &type metadata for String;
    uint64_t v73 = v24;
    unint64_t v74 = v25;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    id v29 = v57;
    uint64_t v30 = v68;
    sub_100032170();
    sub_100010484(v27, &qword_100040C70);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v26, v30);
    uint64_t v31 = v55;
    uint64_t v32 = v62;
    uint64_t v33 = v69;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v62, v29, v69);
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v67, v32, v33);
    swift_storeEnumTagMultiPayload();
    uint64_t v71 = v30;
    v72 = (void *)OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v34 = sub_10000FBA8(&qword_100041090, (void (*)(uint64_t))type metadata accessor for EmptyShortcutComplicationView);
    uint64_t v71 = v65;
    v72 = &type metadata for String;
    uint64_t v73 = v34;
    unint64_t v74 = v25;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    sub_10001028C(v75);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  }
  else
  {
    *uint64_t v14 = swift_getKeyPath();
    sub_100005A10(&qword_100040B70);
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = v65;
    uint64_t v37 = (uint64_t *)((char *)v14 + *(int *)(v65 + 20));
    *uint64_t v37 = swift_getKeyPath();
    sub_100005A10(&qword_1000410C8);
    swift_storeEnumTagMultiPayload();
    id v38 = (char *)v14 + *(int *)(v36 + 24);
    *(void *)id v38 = swift_getKeyPath();
    v38[8] = 0;
    NSString v39 = sub_100032560();
    NSString v40 = sub_100032560();
    id v41 = sub_100031508(v39);

    uint64_t v42 = sub_100032570();
    uint64_t v44 = v43;

    *(void *)&long long v80 = v42;
    *((void *)&v80 + 1) = v44;
    uint64_t v45 = sub_10000FBA8(&qword_100041090, (void (*)(uint64_t))type metadata accessor for EmptyShortcutComplicationView);
    unint64_t v46 = sub_1000090A4();
    uint64_t v47 = v53;
    sub_100032150();
    swift_bridgeObjectRelease();
    sub_100010238((uint64_t)v14, (void (*)(void))type metadata accessor for EmptyShortcutComplicationView);
    uint64_t v48 = v55;
    uint64_t v49 = v54;
    uint64_t v50 = v66;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v54, v47, v66);
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v67, v49, v50);
    swift_storeEnumTagMultiPayload();
    uint64_t v51 = sub_10000FBA8(&qword_100041088, (void (*)(uint64_t))type metadata accessor for RunShortcutComplicationView);
    *(void *)&long long v80 = v64;
    *((void *)&v80 + 1) = &type metadata for String;
    *(void *)&long long v81 = v51;
    *((void *)&v81 + 1) = v46;
    uint64_t v52 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v80 = v68;
    *((void *)&v80 + 1) = v52;
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v80 = v36;
    *((void *)&v80 + 1) = &type metadata for String;
    *(void *)&long long v81 = v45;
    *((void *)&v81 + 1) = v46;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  }
}

uint64_t sub_10000D184()
{
  return sub_1000321C0();
}

uint64_t sub_10000D1A4()
{
  uint64_t v1 = sub_100005A10(&qword_100040EA0);
  sub_100006A88();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100009264();
  sub_100005A10(&qword_100040EA8);
  sub_100006A88();
  __chkstk_darwin(v5);
  sub_1000106DC();
  sub_100005A10(&qword_100040EB0);
  sub_100006A88();
  __chkstk_darwin(v6);
  sub_100005BF8();
  type metadata accessor for RunShortcutWidgetEntryView(0);
  sub_10000FBA8(&qword_100040EB8, (void (*)(uint64_t))type metadata accessor for RunShortcutWidgetEntryView);
  sub_10000D694();
  swift_bridgeObjectRetain();
  sub_100032410();
  NSString v7 = sub_100032560();
  NSString v8 = sub_100032560();
  id v9 = sub_100031508(v7);

  sub_100032570();
  sub_100009060(&qword_100040EC8, &qword_100040EA0);
  sub_1000090A4();
  sub_100031FC0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  NSString v10 = sub_100032560();
  NSString v11 = sub_100032560();
  id v12 = sub_100031508(v10);

  sub_100032570();
  swift_getOpaqueTypeConformance2();
  sub_100031FA0();
  swift_bridgeObjectRelease();
  sub_100009354();
  v13();
  sub_100005A10(&qword_100040ED0);
  uint64_t v14 = sub_1000323D0();
  sub_100006A88();
  uint64_t v16 = v15;
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100035A30;
  (*(void (**)(unint64_t, void, uint64_t))(v16 + 104))(v18 + v17, enum case for WidgetFamily.accessoryCircular(_:), v14);
  swift_getOpaqueTypeConformance2();
  sub_100031FB0();
  swift_bridgeObjectRelease();
  sub_100009354();
  return v19();
}

uint64_t sub_10000D634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000D6E0(a1, a2);
}

unint64_t sub_10000D63C@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_10000AB64();
  *a1 = 0xD000000000000011;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000D66C()
{
  return sub_10000D1A4();
}

uint64_t type metadata accessor for RunShortcutWidgetEntryView(uint64_t a1)
{
  return sub_10000D764(a1, qword_100040FD8);
}

unint64_t sub_10000D694()
{
  unint64_t result = qword_100040EC0;
  if (!qword_100040EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040EC0);
  }
  return result;
}

uint64_t sub_10000D6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RunShortcutWidgetEntry(uint64_t a1)
{
  return sub_10000D764(a1, (uint64_t *)&unk_100040F30);
}

uint64_t sub_10000D764(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_10000D798(void *a1, void *a2, int *a3)
{
  uint64_t v3 = a2;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100031D10();
    NSString v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, v3, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    NSString v11 = *(void **)((char *)v3 + v9);
    *(void *)((char *)a1 + v9) = v11;
    id v12 = (void *)((char *)a1 + v10);
    uint64_t v13 = (char *)v3 + v10;
    uint64_t v14 = *(void *)((char *)v3 + v10);
    id v15 = v11;
    if (v14)
    {
      uint64_t v16 = *((void *)v13 + 1);
      uint64_t v17 = *((void *)v13 + 2);
      *id v12 = v14;
      v12[1] = v16;
      uint64_t v39 = v7;
      NSString v40 = v3;
      uint64_t v18 = *((void *)v13 + 3);
      uint64_t v19 = *((void *)v13 + 4);
      v12[2] = v17;
      v12[3] = v18;
      id v38 = v8;
      uint64_t v21 = *((void *)v13 + 5);
      uint64_t v20 = *((void *)v13 + 6);
      v12[4] = v19;
      v12[5] = v21;
      v12[6] = v20;
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v3 = v40;
      swift_retain();
      uint64_t v7 = v39;
      swift_retain();
      NSString v8 = v38;
      swift_retain();
      swift_retain();
    }
    else
    {
      long long v23 = *((_OWORD *)v13 + 1);
      *(_OWORD *)id v12 = *(_OWORD *)v13;
      *((_OWORD *)v12 + 1) = v23;
      *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
      v12[6] = *((void *)v13 + 6);
    }
    uint64_t v24 = a3[7];
    unint64_t v25 = (char *)a1 + v24;
    id v26 = (char *)v3 + v24;
    uint64_t v27 = type metadata accessor for RunningShortcutTracker.State();
    if (sub_100006148((uint64_t)v26, 1, v27))
    {
      uint64_t v28 = sub_100005A10(&qword_100040E88);
      memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v8(v25, v26, v7);
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v30 = sub_100005A10(&qword_100040DD8);
        uint64_t v31 = *(int *)(v30 + 48);
        uint64_t v32 = *(void **)&v26[v31];
        *(void *)&v25[v31] = v32;
        uint64_t v33 = *(int *)(v30 + 64);
        uint64_t v34 = *(void **)&v26[v33];
        *(void *)&v25[v33] = v34;
        id v35 = v32;
        id v36 = v34;
      }
      swift_storeEnumTagMultiPayload();
      sub_100005A54((uint64_t)v25, 0, 1, v27);
    }
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)v3 + a3[8]);
  }
  return a1;
}

void sub_10000DA18(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100031D10();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);

  if (*(void *)(a1 + a2[6]))
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = type metadata accessor for RunningShortcutTracker.State();
  if (!sub_100006148(v6, 1, v7))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5(v6, v4);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v9 = sub_100005A10(&qword_100040DD8);

      uint64_t v10 = *(void **)(v6 + *(int *)(v9 + 64));
    }
  }
}

uint64_t sub_10000DB74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100031D10();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  NSString v11 = (void *)(a1 + v9);
  uint64_t v12 = a2 + v9;
  uint64_t v13 = *(void *)(a2 + v9);
  id v14 = v10;
  if (v13)
  {
    uint64_t v15 = *(void *)(v12 + 8);
    uint64_t v16 = *(void *)(v12 + 16);
    *NSString v11 = v13;
    v11[1] = v15;
    uint64_t v37 = v6;
    id v38 = a3;
    uint64_t v17 = *(void *)(v12 + 24);
    uint64_t v18 = *(void *)(v12 + 32);
    v11[2] = v16;
    v11[3] = v17;
    id v36 = v7;
    uint64_t v20 = *(void *)(v12 + 40);
    uint64_t v19 = *(void *)(v12 + 48);
    v11[4] = v18;
    v11[5] = v20;
    v11[6] = v19;
    swift_retain();
    swift_retain();
    swift_retain();
    a3 = v38;
    swift_retain();
    uint64_t v6 = v37;
    swift_retain();
    uint64_t v7 = v36;
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v21 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)NSString v11 = *(_OWORD *)v12;
    *((_OWORD *)v11 + 1) = v21;
    *((_OWORD *)v11 + 2) = *(_OWORD *)(v12 + 32);
    v11[6] = *(void *)(v12 + 48);
  }
  uint64_t v22 = a3[7];
  long long v23 = (char *)(a1 + v22);
  uint64_t v24 = (char *)(a2 + v22);
  uint64_t v25 = type metadata accessor for RunningShortcutTracker.State();
  if (sub_100006148((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = sub_100005A10(&qword_100040E88);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7((uint64_t)v23, (uint64_t)v24, v6);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v28 = sub_100005A10(&qword_100040DD8);
      uint64_t v29 = *(int *)(v28 + 48);
      uint64_t v30 = *(void **)&v24[v29];
      *(void *)&v23[v29] = v30;
      uint64_t v31 = *(int *)(v28 + 64);
      uint64_t v32 = *(void **)&v24[v31];
      *(void *)&v23[v31] = v32;
      id v33 = v30;
      id v34 = v32;
    }
    swift_storeEnumTagMultiPayload();
    sub_100005A54((uint64_t)v23, 0, 1, v25);
  }
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_10000DDA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100031D10();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)(a1 + v8);
  uint64_t v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  id v11 = v10;

  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  id v14 = (long long *)(a2 + v12);
  uint64_t v15 = *(void *)(a2 + v12);
  if (*(void *)(a1 + v12))
  {
    if (v15)
    {
      *uint64_t v13 = v15;
      swift_retain();
      swift_release();
      v13[1] = *((void *)v14 + 1);
      swift_retain();
      swift_release();
      v13[2] = *((void *)v14 + 2);
      swift_retain();
      swift_release();
      v13[3] = *((void *)v14 + 3);
      swift_retain();
      swift_release();
      v13[4] = *((void *)v14 + 4);
      swift_retain();
      swift_release();
      v13[5] = *((void *)v14 + 5);
      swift_retain();
      swift_release();
      v13[6] = *((void *)v14 + 6);
      swift_retain();
      swift_release();
    }
    else
    {
      sub_10000E1C8(a1 + v12);
      long long v17 = v14[1];
      long long v16 = v14[2];
      long long v18 = *v14;
      v13[6] = *((void *)v14 + 6);
      *((_OWORD *)v13 + 1) = v17;
      *((_OWORD *)v13 + 2) = v16;
      *(_OWORD *)uint64_t v13 = v18;
    }
  }
  else if (v15)
  {
    *uint64_t v13 = v15;
    v13[1] = *((void *)v14 + 1);
    v13[2] = *((void *)v14 + 2);
    v13[3] = *((void *)v14 + 3);
    v13[4] = *((void *)v14 + 4);
    v13[5] = *((void *)v14 + 5);
    v13[6] = *((void *)v14 + 6);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v19 = *v14;
    long long v20 = v14[1];
    long long v21 = v14[2];
    v13[6] = *((void *)v14 + 6);
    *((_OWORD *)v13 + 1) = v20;
    *((_OWORD *)v13 + 2) = v21;
    *(_OWORD *)uint64_t v13 = v19;
  }
  uint64_t v22 = a3[7];
  long long v23 = (char *)(a1 + v22);
  uint64_t v24 = (char *)(a2 + v22);
  uint64_t v25 = type metadata accessor for RunningShortcutTracker.State();
  int v26 = sub_100006148((uint64_t)v23, 1, v25);
  int v27 = sub_100006148((uint64_t)v24, 1, v25);
  if (v26)
  {
    if (!v27)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v23, v24, v6);
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v31 = sub_100005A10(&qword_100040DD8);
        uint64_t v32 = *(int *)(v31 + 48);
        id v33 = *(void **)&v24[v32];
        *(void *)&v23[v32] = v33;
        uint64_t v34 = *(int *)(v31 + 64);
        id v35 = *(void **)&v24[v34];
        *(void *)&v23[v34] = v35;
        id v36 = v33;
        id v37 = v35;
      }
      swift_storeEnumTagMultiPayload();
      sub_100005A54((uint64_t)v23, 0, 1, v25);
      goto LABEL_22;
    }
LABEL_14:
    uint64_t v29 = sub_100005A10(&qword_100040E88);
    memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_22;
  }
  if (v27)
  {
    sub_100010238((uint64_t)v23, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_14;
  }
  if (a1 != a2)
  {
    sub_100010238((uint64_t)v23, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    int v30 = swift_getEnumCaseMultiPayload();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v23, v24, v6);
    if (v30 != 1)
    {
      uint64_t v38 = sub_100005A10(&qword_100040DD8);
      uint64_t v39 = *(int *)(v38 + 48);
      NSString v40 = *(void **)&v24[v39];
      *(void *)&v23[v39] = v40;
      uint64_t v41 = *(int *)(v38 + 64);
      uint64_t v42 = *(void **)&v24[v41];
      *(void *)&v23[v41] = v42;
      id v43 = v40;
      id v44 = v42;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_22:
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_10000E1C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000E21C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100031D10();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(void *)(v9 + 48) = *(void *)(v10 + 48);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)(a1 + v12);
  id v14 = (char *)(a2 + v12);
  uint64_t v15 = type metadata accessor for RunningShortcutTracker.State();
  if (sub_100006148((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_100005A10(&qword_100040E88);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7((uint64_t)v13, (uint64_t)v14, v6);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v18 = sub_100005A10(&qword_100040DD8);
      *(void *)&v13[*(int *)(v18 + 48)] = *(void *)&v14[*(int *)(v18 + 48)];
      *(void *)&v13[*(int *)(v18 + 64)] = *(void *)&v14[*(int *)(v18 + 64)];
    }
    swift_storeEnumTagMultiPayload();
    sub_100005A54((uint64_t)v13, 0, 1, v15);
  }
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_10000E3BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100031D10();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  uint64_t v10 = a3[6];
  long long v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  if (*(void *)(a1 + v10))
  {
    if (*v12)
    {
      *long long v11 = *v12;
      swift_release();
      v11[1] = v12[1];
      swift_release();
      v11[2] = v12[2];
      swift_release();
      v11[3] = v12[3];
      swift_release();
      v11[4] = v12[4];
      swift_release();
      v11[5] = v12[5];
      swift_release();
      v11[6] = v12[6];
      swift_release();
      goto LABEL_6;
    }
    sub_10000E1C8((uint64_t)v11);
  }
  long long v13 = *((_OWORD *)v12 + 1);
  *(_OWORD *)long long v11 = *(_OWORD *)v12;
  *((_OWORD *)v11 + 1) = v13;
  *((_OWORD *)v11 + 2) = *((_OWORD *)v12 + 2);
  v11[6] = v12[6];
LABEL_6:
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for RunningShortcutTracker.State();
  int v18 = sub_100006148((uint64_t)v15, 1, v17);
  int v19 = sub_100006148((uint64_t)v16, 1, v17);
  if (v18)
  {
    if (!v19)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v16, v6);
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v23 = sub_100005A10(&qword_100040DD8);
        *(void *)&v15[*(int *)(v23 + 48)] = *(void *)&v16[*(int *)(v23 + 48)];
        *(void *)&v15[*(int *)(v23 + 64)] = *(void *)&v16[*(int *)(v23 + 64)];
      }
      swift_storeEnumTagMultiPayload();
      sub_100005A54((uint64_t)v15, 0, 1, v17);
      goto LABEL_20;
    }
LABEL_12:
    uint64_t v21 = sub_100005A10(&qword_100040E88);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_20;
  }
  if (v19)
  {
    sub_100010238((uint64_t)v15, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_12;
  }
  if (a1 != a2)
  {
    sub_100010238((uint64_t)v15, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    int v22 = swift_getEnumCaseMultiPayload();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v16, v6);
    if (v22 != 1)
    {
      uint64_t v24 = sub_100005A10(&qword_100040DD8);
      *(void *)&v15[*(int *)(v24 + 48)] = *(void *)&v16[*(int *)(v24 + 48)];
      *(void *)&v15[*(int *)(v24 + 64)] = *(void *)&v16[*(int *)(v24 + 64)];
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_20:
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_10000E6F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E708);
}

uint64_t sub_10000E708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100031D10();
  sub_10001067C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return sub_100006148(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_100005A10(&qword_100040E88);
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t sub_10000E7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E7DC);
}

void sub_10000E7DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100031D10();
  sub_10001067C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_100005A10(&qword_100040E88);
    uint64_t v11 = a1 + *(int *)(a4 + 28);
  }

  sub_100005A54(v11, a2, a2, v10);
}

void sub_10000E88C()
{
  sub_100031D10();
  if (v0 <= 0x3F)
  {
    sub_10000E970();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000E970()
{
  if (!qword_100040F40)
  {
    type metadata accessor for RunningShortcutTracker.State();
    unint64_t v0 = sub_1000326C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040F40);
    }
  }
}

ValueMetadata *type metadata accessor for RunShortcutWidgetProvider()
{
  return &type metadata for RunShortcutWidgetProvider;
}

void *sub_10000E9D8(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = sub_100031D10();
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = v6[5];
    uint64_t v10 = *(void **)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v10;
    uint64_t v11 = v6[6];
    uint64_t v12 = (void *)((char *)a1 + v11);
    long long v13 = (char *)a2 + v11;
    uint64_t v14 = *(void *)((char *)a2 + v11);
    id v15 = v10;
    if (v14)
    {
      uint64_t v16 = *((void *)v13 + 1);
      uint64_t v17 = *((void *)v13 + 2);
      *uint64_t v12 = v14;
      v12[1] = v16;
      uint64_t v39 = v7;
      NSString v40 = a2;
      uint64_t v18 = *((void *)v13 + 3);
      uint64_t v19 = *((void *)v13 + 4);
      v12[2] = v17;
      v12[3] = v18;
      uint64_t v38 = v8;
      uint64_t v21 = *((void *)v13 + 5);
      uint64_t v20 = *((void *)v13 + 6);
      v12[4] = v19;
      v12[5] = v21;
      v12[6] = v20;
      swift_retain();
      swift_retain();
      swift_retain();
      a2 = v40;
      swift_retain();
      uint64_t v7 = v39;
      swift_retain();
      uint64_t v8 = v38;
      swift_retain();
      swift_retain();
    }
    else
    {
      long long v23 = *((_OWORD *)v13 + 1);
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      *((_OWORD *)v12 + 1) = v23;
      *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
      v12[6] = *((void *)v13 + 6);
    }
    uint64_t v24 = v6[7];
    uint64_t v25 = (char *)a1 + v24;
    int v26 = (char *)a2 + v24;
    uint64_t v27 = type metadata accessor for RunningShortcutTracker.State();
    if (sub_100006148((uint64_t)v26, 1, v27))
    {
      uint64_t v28 = sub_100005A10(&qword_100040E88);
      memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v8(v25, v26, v7);
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v30 = sub_100005A10(&qword_100040DD8);
        uint64_t v31 = *(int *)(v30 + 48);
        uint64_t v32 = *(void **)&v26[v31];
        *(void *)&v25[v31] = v32;
        uint64_t v33 = *(int *)(v30 + 64);
        uint64_t v34 = *(void **)&v26[v33];
        *(void *)&v25[v33] = v34;
        id v35 = v32;
        id v36 = v34;
      }
      swift_storeEnumTagMultiPayload();
      sub_100005A54((uint64_t)v25, 0, 1, v27);
    }
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
  }
  return a1;
}

void sub_10000EC64(uint64_t a1)
{
  uint64_t v2 = sub_100031D10();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(a1, v2);
  uint64_t v4 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);

  if (*(void *)(a1 + v4[6]))
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v5 = a1 + v4[7];
  uint64_t v6 = type metadata accessor for RunningShortcutTracker.State();
  if (!sub_100006148(v5, 1, v6))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v3(v5, v2);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v8 = sub_100005A10(&qword_100040DD8);

      uint64_t v9 = *(void **)(v5 + *(int *)(v8 + 64));
    }
  }
}

uint64_t sub_10000EDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031D10();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  uint64_t v9 = v6[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  uint64_t v12 = *(void *)(a2 + v9);
  id v13 = v8;
  if (v12)
  {
    uint64_t v14 = *(void *)(v11 + 8);
    uint64_t v15 = *(void *)(v11 + 16);
    *uint64_t v10 = v12;
    v10[1] = v14;
    uint64_t v36 = v4;
    id v37 = v6;
    uint64_t v16 = *(void *)(v11 + 24);
    uint64_t v17 = *(void *)(v11 + 32);
    v10[2] = v15;
    v10[3] = v16;
    id v35 = v5;
    uint64_t v19 = *(void *)(v11 + 40);
    uint64_t v18 = *(void *)(v11 + 48);
    v10[4] = v17;
    v10[5] = v19;
    v10[6] = v18;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v6 = v37;
    swift_retain();
    uint64_t v4 = v36;
    swift_retain();
    uint64_t v5 = v35;
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v20 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v20;
    *((_OWORD *)v10 + 2) = *(_OWORD *)(v11 + 32);
    v10[6] = *(void *)(v11 + 48);
  }
  uint64_t v21 = v6[7];
  uint64_t v22 = (char *)(a1 + v21);
  long long v23 = (char *)(a2 + v21);
  uint64_t v24 = type metadata accessor for RunningShortcutTracker.State();
  if (sub_100006148((uint64_t)v23, 1, v24))
  {
    uint64_t v25 = sub_100005A10(&qword_100040E88);
    memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5((uint64_t)v22, (uint64_t)v23, v4);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v27 = sub_100005A10(&qword_100040DD8);
      uint64_t v28 = *(int *)(v27 + 48);
      uint64_t v29 = *(void **)&v23[v28];
      *(void *)&v22[v28] = v29;
      uint64_t v30 = *(int *)(v27 + 64);
      uint64_t v31 = *(void **)&v23[v30];
      *(void *)&v22[v30] = v31;
      id v32 = v29;
      id v33 = v31;
    }
    swift_storeEnumTagMultiPayload();
    sub_100005A54((uint64_t)v22, 0, 1, v24);
  }
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  return a1;
}

uint64_t sub_10000F004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031D10();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  uint64_t v11 = v6[6];
  uint64_t v12 = (void *)(a1 + v11);
  id v13 = (long long *)(a2 + v11);
  uint64_t v14 = *(void *)(a2 + v11);
  if (*(void *)(a1 + v11))
  {
    if (v14)
    {
      *uint64_t v12 = v14;
      swift_retain();
      swift_release();
      v12[1] = *((void *)v13 + 1);
      swift_retain();
      swift_release();
      v12[2] = *((void *)v13 + 2);
      swift_retain();
      swift_release();
      v12[3] = *((void *)v13 + 3);
      swift_retain();
      swift_release();
      v12[4] = *((void *)v13 + 4);
      swift_retain();
      swift_release();
      v12[5] = *((void *)v13 + 5);
      swift_retain();
      swift_release();
      v12[6] = *((void *)v13 + 6);
      swift_retain();
      swift_release();
    }
    else
    {
      sub_10000E1C8(a1 + v11);
      long long v16 = v13[1];
      long long v15 = v13[2];
      long long v17 = *v13;
      v12[6] = *((void *)v13 + 6);
      *((_OWORD *)v12 + 1) = v16;
      *((_OWORD *)v12 + 2) = v15;
      *(_OWORD *)uint64_t v12 = v17;
    }
  }
  else if (v14)
  {
    *uint64_t v12 = v14;
    v12[1] = *((void *)v13 + 1);
    v12[2] = *((void *)v13 + 2);
    v12[3] = *((void *)v13 + 3);
    v12[4] = *((void *)v13 + 4);
    v12[5] = *((void *)v13 + 5);
    v12[6] = *((void *)v13 + 6);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v18 = *v13;
    long long v19 = v13[1];
    long long v20 = v13[2];
    v12[6] = *((void *)v13 + 6);
    *((_OWORD *)v12 + 1) = v19;
    *((_OWORD *)v12 + 2) = v20;
    *(_OWORD *)uint64_t v12 = v18;
  }
  uint64_t v21 = v6[7];
  uint64_t v22 = (char *)(a1 + v21);
  long long v23 = (char *)(a2 + v21);
  uint64_t v24 = type metadata accessor for RunningShortcutTracker.State();
  int v25 = sub_100006148((uint64_t)v22, 1, v24);
  int v26 = sub_100006148((uint64_t)v23, 1, v24);
  if (v25)
  {
    if (!v26)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v22, v23, v4);
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v30 = sub_100005A10(&qword_100040DD8);
        uint64_t v31 = *(int *)(v30 + 48);
        id v32 = *(void **)&v23[v31];
        *(void *)&v22[v31] = v32;
        uint64_t v33 = *(int *)(v30 + 64);
        uint64_t v34 = *(void **)&v23[v33];
        *(void *)&v22[v33] = v34;
        id v35 = v32;
        id v36 = v34;
      }
      swift_storeEnumTagMultiPayload();
      sub_100005A54((uint64_t)v22, 0, 1, v24);
      goto LABEL_22;
    }
LABEL_14:
    uint64_t v28 = sub_100005A10(&qword_100040E88);
    memcpy(v22, v23, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_22;
  }
  if (v26)
  {
    sub_100010238((uint64_t)v22, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_14;
  }
  if (a1 != a2)
  {
    sub_100010238((uint64_t)v22, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    int v29 = swift_getEnumCaseMultiPayload();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v22, v23, v4);
    if (v29 != 1)
    {
      uint64_t v37 = sub_100005A10(&qword_100040DD8);
      uint64_t v38 = *(int *)(v37 + 48);
      uint64_t v39 = *(void **)&v23[v38];
      *(void *)&v22[v38] = v39;
      uint64_t v40 = *(int *)(v37 + 64);
      uint64_t v41 = *(void **)&v23[v40];
      *(void *)&v22[v40] = v41;
      id v42 = v39;
      id v43 = v41;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_22:
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  return a1;
}

uint64_t sub_10000F430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031D10();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  *(void *)(a1 + v6[5]) = *(void *)(a2 + v6[5]);
  uint64_t v7 = v6[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  *(void *)(v8 + 48) = *((void *)v9 + 6);
  long long v10 = v9[2];
  long long v11 = *v9;
  *(_OWORD *)(v8 + 16) = v9[1];
  *(_OWORD *)(v8 + 32) = v10;
  *(_OWORD *)uint64_t v8 = v11;
  uint64_t v12 = v6[7];
  id v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = type metadata accessor for RunningShortcutTracker.State();
  if (sub_100006148((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_100005A10(&qword_100040E88);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5((uint64_t)v13, (uint64_t)v14, v4);
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v18 = sub_100005A10(&qword_100040DD8);
      *(void *)&v13[*(int *)(v18 + 48)] = *(void *)&v14[*(int *)(v18 + 48)];
      *(void *)&v13[*(int *)(v18 + 64)] = *(void *)&v14[*(int *)(v18 + 64)];
    }
    swift_storeEnumTagMultiPayload();
    sub_100005A54((uint64_t)v13, 0, 1, v15);
  }
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  return a1;
}

uint64_t sub_10000F5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031D10();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = v6[6];
  long long v10 = (void *)(a1 + v9);
  long long v11 = (void *)(a2 + v9);
  if (*(void *)(a1 + v9))
  {
    if (*v11)
    {
      *long long v10 = *v11;
      swift_release();
      v10[1] = v11[1];
      swift_release();
      v10[2] = v11[2];
      swift_release();
      v10[3] = v11[3];
      swift_release();
      v10[4] = v11[4];
      swift_release();
      v10[5] = v11[5];
      swift_release();
      v10[6] = v11[6];
      swift_release();
      goto LABEL_6;
    }
    sub_10000E1C8((uint64_t)v10);
  }
  long long v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)long long v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v12;
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  v10[6] = v11[6];
LABEL_6:
  uint64_t v13 = v6[7];
  uint64_t v14 = (char *)(a1 + v13);
  uint64_t v15 = (char *)(a2 + v13);
  uint64_t v16 = type metadata accessor for RunningShortcutTracker.State();
  int v17 = sub_100006148((uint64_t)v14, 1, v16);
  int v18 = sub_100006148((uint64_t)v15, 1, v16);
  if (v17)
  {
    if (!v18)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v15, v4);
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v22 = sub_100005A10(&qword_100040DD8);
        *(void *)&v14[*(int *)(v22 + 48)] = *(void *)&v15[*(int *)(v22 + 48)];
        *(void *)&v14[*(int *)(v22 + 64)] = *(void *)&v15[*(int *)(v22 + 64)];
      }
      swift_storeEnumTagMultiPayload();
      sub_100005A54((uint64_t)v14, 0, 1, v16);
      goto LABEL_20;
    }
LABEL_12:
    uint64_t v20 = sub_100005A10(&qword_100040E88);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_20;
  }
  if (v18)
  {
    sub_100010238((uint64_t)v14, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_12;
  }
  if (a1 != a2)
  {
    sub_100010238((uint64_t)v14, (void (*)(void))type metadata accessor for RunningShortcutTracker.State);
    int v21 = swift_getEnumCaseMultiPayload();
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v15, v4);
    if (v21 != 1)
    {
      uint64_t v23 = sub_100005A10(&qword_100040DD8);
      *(void *)&v14[*(int *)(v23 + 48)] = *(void *)&v15[*(int *)(v23 + 48)];
      *(void *)&v14[*(int *)(v23 + 64)] = *(void *)&v15[*(int *)(v23 + 64)];
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_20:
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  return a1;
}

uint64_t sub_10000F91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F930);
}

uint64_t sub_10000F930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutWidgetEntry(0);

  return sub_100006148(a1, a2, v4);
}

uint64_t sub_10000F978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F98C);
}

uint64_t sub_10000F98C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutWidgetEntry(0);

  return sub_100005A54(a1, a2, a2, v4);
}

uint64_t sub_10000F9D8()
{
  uint64_t result = type metadata accessor for RunShortcutWidgetEntry(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000FA64()
{
  return sub_100009374();
}

uint64_t sub_10000FB60()
{
  return sub_10000FBA8(&qword_100041010, (void (*)(uint64_t))type metadata accessor for RunShortcutWidgetEntry);
}

uint64_t sub_10000FBA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000FBF0()
{
  return sub_10000FBA8(&qword_100041018, (void (*)(uint64_t))type metadata accessor for RunShortcutWidgetEntry);
}

unint64_t sub_10000FC3C()
{
  unint64_t result = qword_100041020[0];
  if (!qword_100041020[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041020);
  }
  return result;
}

uint64_t sub_10000FC88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FCA4()
{
  sub_100031EE0();
  sub_10000FBA8(&qword_1000410E8, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_100031F80();
  return v1;
}

uint64_t sub_10000FD20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000FCA4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000FD50()
{
  return sub_100031EF0();
}

uint64_t sub_10000FD74()
{
  return sub_100031F00();
}

uint64_t sub_10000FD98(uint64_t a1)
{
  sub_100032390();
  sub_100006A88();
  __chkstk_darwin(v2);
  sub_100005BF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4 - v3, a1);
  return sub_100031F10();
}

uint64_t sub_10000FE30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100031F20();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000FE60()
{
  return sub_100031F30();
}

uint64_t sub_10000FE88()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10000FE98(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_10000FEB0()
{
  unint64_t result = qword_100041060;
  if (!qword_100041060)
  {
    sub_100005B98(&qword_100041050);
    sub_10000FF50();
    sub_100009060(&qword_100041098, &qword_1000410A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041060);
  }
  return result;
}

unint64_t sub_10000FF50()
{
  unint64_t result = qword_100041068;
  if (!qword_100041068)
  {
    sub_100005B98(&qword_100041048);
    sub_10000FFC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041068);
  }
  return result;
}

unint64_t sub_10000FFC4()
{
  unint64_t result = qword_100041070;
  if (!qword_100041070)
  {
    sub_100005B98(&qword_100041078);
    sub_100005B98(&qword_100041080);
    type metadata accessor for RunShortcutComplicationView();
    sub_10000FBA8(&qword_100041088, (void (*)(uint64_t))type metadata accessor for RunShortcutComplicationView);
    sub_1000090A4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    type metadata accessor for EmptyShortcutComplicationView();
    sub_10000FBA8(&qword_100041090, (void (*)(uint64_t))type metadata accessor for EmptyShortcutComplicationView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041070);
  }
  return result;
}

uint64_t sub_100010154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_1000410C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000101BC()
{
  return sub_100031EF0();
}

uint64_t sub_1000101E0()
{
  return sub_100031F00();
}

uint64_t sub_100010208@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000FCA4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100010238(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100006AA4();
  sub_100009354();
  v3();
  return a1;
}

uint64_t *sub_10001028C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_1000102C4(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100010350(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001038C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000103A0(a1, a2);
  }
  return a1;
}

uint64_t sub_1000103A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000103F8(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100010484(uint64_t a1, uint64_t *a2)
{
  sub_100005A10(a2);
  sub_100006AA4();
  sub_100009354();
  v3();
  return a1;
}

uint64_t sub_1000104D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000B378(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1000104F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001055C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000105DC()
{
  return sub_100009374();
}

uint64_t sub_100010664(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100010694()
{
  return v0;
}

uint64_t sub_1000106AC()
{
  return v0;
}

uint64_t sub_1000106C4()
{
  return v0;
}

uint64_t sub_1000106F4(uint64_t a1)
{
  return sub_100005A54(v1, 1, 1, a1);
}

char *sub_100010714(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    *((void *)a1 + 3) = a2[3];
    uint64_t v9 = *(int *)(a3 + 28);
    long long v10 = &a1[v9];
    long long v11 = (char **)((char *)a2 + v9);
    long long v12 = v5;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100005A10(&qword_100041108);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_100031E10();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
    }
    else
    {
      *(void *)long long v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 32);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = *(void *)v16;
    char v18 = *(unsigned char *)(v16 + 8);
    sub_100010884(*(void *)v16, v18);
    *(void *)uint64_t v15 = v17;
    v15[8] = v18;
  }
  return a1;
}

uint64_t sub_100010884(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100010890(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  int v4 = (char *)a1 + *(int *)(a2 + 28);
  sub_100005A10(&qword_100041108);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100031E10();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v7 = *(void *)v6;
  char v8 = v6[8];

  return sub_100010960(v7, v8);
}

uint64_t sub_100010960(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *sub_10001096C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 28);
  long long v10 = (void *)((char *)a1 + v9);
  long long v11 = (void *)(a2 + v9);
  id v12 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100005A10(&qword_100041108);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_100031E10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
  }
  else
  {
    *long long v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = *(unsigned char *)(v16 + 8);
  sub_100010884(*(void *)v16, v18);
  *(void *)uint64_t v15 = v17;
  v15[8] = v18;
  return a1;
}

uint64_t sub_100010A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    long long v10 = (void *)(a1 + v9);
    long long v11 = (void *)(a2 + v9);
    sub_100006978(a1 + v9, &qword_100041108);
    sub_100005A10(&qword_100041108);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100031E10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *long long v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)v15;
  char v17 = *(unsigned char *)(v15 + 8);
  sub_100010884(*(void *)v15, v17);
  uint64_t v18 = *(void *)v14;
  char v19 = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = v17;
  sub_100010960(v18, v19);
  return a1;
}

uint64_t sub_100010BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  id v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100005A10(&qword_100041108);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100031E10();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  return a1;
}

void **sub_100010D00(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a2[2];
  a1[1] = a2[1];
  a1[2] = v7;
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    sub_100006978((uint64_t)a1 + v8, &qword_100041108);
    uint64_t v11 = sub_100005A10(&qword_100041108);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100031E10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  LOBYTE(v15) = v15[8];
  uint64_t v17 = *(void *)v14;
  char v18 = v14[8];
  *(void *)uint64_t v14 = v16;
  v14[8] = (char)v15;
  sub_100010960(v17, v18);
  return a1;
}

uint64_t sub_100010E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010E60);
}

uint64_t sub_100010E60(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005A10(&qword_100041110);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 28);
    return sub_100006148(v9, a2, v8);
  }
}

uint64_t sub_100010EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010F00);
}

void *sub_100010F00(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005A10(&qword_100041110);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 28);
    return (void *)sub_100005A54(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for RunShortcutRectangularWidgetView()
{
  uint64_t result = qword_100041170;
  if (!qword_100041170) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100010FCC()
{
  sub_100011084();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100011084()
{
  if (!qword_100041180)
  {
    sub_100031E10();
    unint64_t v0 = sub_100031E20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041180);
    }
  }
}

uint64_t sub_1000110DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000110F8()
{
  uint64_t v1 = sub_100032090();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_100005BF8();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_100005A10(&qword_1000411C0);
  __chkstk_darwin(v6 - 8);
  sub_100005BF8();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_100005A10(&qword_1000411C8);
  sub_100006AA4();
  __chkstk_darwin(v11);
  sub_100005BF8();
  uint64_t v14 = v13 - v12;
  *(void *)uint64_t v9 = sub_100031F90();
  *(void *)(v9 + 8) = 0x4024000000000000;
  *(unsigned char *)(v9 + 16) = 0;
  uint64_t v15 = sub_100005A10(&qword_1000411D0);
  sub_1000113AC((uint64_t)v0, (char *)(v9 + *(int *)(v15 + 44)));
  sub_1000322E0();
  sub_100031E80();
  sub_100011EFC(v9, v14);
  uint64_t v16 = (_OWORD *)(v14 + *(int *)(v10 + 36));
  *uint64_t v16 = v21;
  v16[1] = v22;
  v16[2] = v23;
  sub_100006978(v9, &qword_1000411C0);
  id v17 = [*v0 backgroundColor];
  id v18 = [v17 paletteGradient];

  id v19 = [v18 darkBaseColor];
  sub_100032220();
  sub_100032080();
  sub_100012248(&qword_1000411D8, &qword_1000411C8, (void (*)(void))sub_100011F64);
  sub_1000321F0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  swift_release();
  return sub_100006978(v14, &qword_1000411C8);
}

uint64_t sub_1000113AC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v62 = a2;
  uint64_t v3 = sub_100031E10();
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  __chkstk_darwin(v3);
  uint64_t v54 = (uint64_t)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005A10(&qword_1000411E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100032100();
  uint64_t v8 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for RunShortcutRectangularWidgetView();
  uint64_t v11 = *(void *)(v53 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v53);
  uint64_t v13 = sub_100005A10(&qword_1000411F0);
  uint64_t v60 = *(void *)(v13 - 8);
  uint64_t v61 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v59 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v17 = (char *)&v53 - v16;
  id v18 = [*(id *)a1 backgroundColor:v53];
  id v19 = [v18 paletteGradient];

  sub_100011FB8(a1, (uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = swift_allocObject();
  sub_100012164((uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
  sub_100005A10(&qword_1000411F8);
  uint64_t v22 = sub_100005B98(&qword_100041200);
  uint64_t v23 = sub_100012248(&qword_100041208, &qword_100041200, (void (*)(void))sub_1000122C4);
  uint64_t v63 = v22;
  uint64_t v64 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v58 = v17;
  sub_100031D60();
  uint64_t v24 = v57;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Font.TextStyle.body(_:), v57);
  uint64_t v25 = sub_1000320C0();
  sub_100005A54((uint64_t)v7, 1, 1, v25);
  swift_bridgeObjectRetain();
  sub_1000320E0();
  sub_100006978((uint64_t)v7, &qword_1000411E8);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
  sub_1000320D0();
  sub_1000320F0();
  swift_release();
  uint64_t v26 = sub_100032120();
  uint64_t v28 = v27;
  char v30 = v29;
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    uint64_t v31 = v54;
    sub_100025A54(v54);
    sub_100032210();
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v31, v56);
    uint64_t v32 = sub_100032220();
  }
  else
  {
    uint64_t v32 = sub_100032230();
  }
  uint64_t v63 = v32;
  uint64_t v56 = sub_100032110();
  uint64_t v57 = v33;
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_100012314(v26, v28, v30 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = v59;
  uint64_t v40 = v60;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  id v42 = v58;
  uint64_t v43 = v61;
  v41(v59, v58, v61);
  id v44 = v62;
  v41(v62, v39, v43);
  uint64_t v45 = sub_100005A10(&qword_100041218);
  unint64_t v46 = &v44[*(int *)(v45 + 48)];
  uint64_t v47 = v56;
  uint64_t v48 = v57;
  *(void *)unint64_t v46 = v56;
  *((void *)v46 + 1) = v35;
  v46[16] = v37;
  *((void *)v46 + 3) = v48;
  *((void *)v46 + 4) = KeyPath;
  *((void *)v46 + 5) = 2;
  v46[48] = 0;
  uint64_t v49 = &v44[*(int *)(v45 + 64)];
  *(void *)uint64_t v49 = 0;
  v49[8] = 1;
  uint64_t v50 = v47;
  sub_100012390(v47, v35, v37);
  uint64_t v51 = *(void (**)(char *, uint64_t))(v40 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v51(v42, v43);
  sub_100012314(v50, v35, v37);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v51)(v39, v43);
}

uint64_t sub_100011A04@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v37 = a1;
  uint64_t v5 = sub_100031D80();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100031D70();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  __chkstk_darwin(v8);
  id v44 = (uint64_t *)((char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = sub_100031D90();
  uint64_t v45 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v43 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100005A10(&qword_100041200);
  __chkstk_darwin(v46);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for RunShortcutRectangularWidgetView();
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100031E10();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v20 = (char *)&v36 - v19;
  uint64_t v21 = *(void *)(a2 + 24);
  uint64_t v47 = a3;
  if (v21)
  {
    sub_100025A54((uint64_t)&v36 - v19);
    id v22 = (id)sub_100032210();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v24 = v39;
  uint64_t v23 = v40;
  uint64_t v25 = v38;
  sub_100011FB8(a2, (uint64_t)v15);
  if (!v22)
  {
    uint64_t v26 = &v15[*(int *)(v13 + 32)];
    uint64_t v27 = *(void *)v26;
    uint64_t v28 = v26[8];
    sub_100010884(*(void *)v26, v26[8]);
    char v29 = sub_1000258C4(v27, v28);
    sub_100010960(v27, v28);
    if ((v29 & 1) == 0)
    {
      sub_1000123A0((uint64_t)v15);
      id v22 = v37;
      goto LABEL_9;
    }
    id v22 = [self whiteColor];
  }
  sub_1000123A0((uint64_t)v15);
LABEL_9:
  id v30 = [*(id *)a2 icon];
  uint64_t v31 = v44;
  *id v44 = 0x403E000000000000;
  (*(void (**)(void *, void, uint64_t))(v41 + 104))(v31, enum case for IconSize.customHeight(_:), v42);
  *(void *)uint64_t v7 = v22;
  v7[8] = 0;
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v7, enum case for IconView.DisplayMode.customColor(_:), v23);
  id v32 = v22;
  uint64_t v33 = v43;
  sub_100031DA0();
  uint64_t v34 = v45;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v12, v33, v25);
  *(_WORD *)&v12[*(int *)(v46 + 36)] = 257;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v25);
  sub_100012248(&qword_100041208, &qword_100041200, (void (*)(void))sub_1000122C4);
  sub_100032160();

  return sub_100006978((uint64_t)v12, &qword_100041200);
}

uint64_t sub_100011EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_1000411C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100011F64()
{
  unint64_t result = qword_1000411E0;
  if (!qword_1000411E0)
  {
    sub_100005B98(&qword_1000411C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000411E0);
  }
  return result;
}

uint64_t sub_100011FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutRectangularWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001201C()
{
  uint64_t v1 = type metadata accessor for RunShortcutRectangularWidgetView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  sub_100005A10(&qword_100041108);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100031E10();
    sub_100006AA4();
    (*(void (**)(uint64_t))(v6 + 8))(v5);
  }
  else
  {
    swift_release();
  }
  sub_100010960(*(void *)(v0 + v3 + *(int *)(v1 + 32)), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 32) + 8));

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100012164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RunShortcutRectangularWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000121C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for RunShortcutRectangularWidgetView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100011A04(a1, v6, a2);
}

uint64_t sub_100012248(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005B98(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000122C4()
{
  unint64_t result = qword_100041210;
  if (!qword_100041210)
  {
    sub_100031D90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041210);
  }
  return result;
}

uint64_t sub_100012314(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100012324@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100031F40();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10001235C()
{
  return sub_100031F50();
}

uint64_t sub_100012390(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000123A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RunShortcutRectangularWidgetView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000123FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100012498(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000323D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100005A10(&qword_1000410C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100032390();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = v15[8];
    sub_100010884(*(void *)v15, v17);
    *(void *)uint64_t v14 = v16;
    v14[8] = v17;
  }
  return a1;
}

uint64_t sub_100012670(uint64_t a1, uint64_t a2)
{
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000323D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100032390();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = *(void *)v7;
  char v9 = *(unsigned char *)(v7 + 8);

  return sub_100010960(v8, v9);
}

void *sub_10001278C(void *a1, void *a2, uint64_t a3)
{
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000323D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  char v9 = (void *)((char *)a2 + v7);
  sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100032390();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_100010884(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  return a1;
}

void *sub_100012914(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100006978((uint64_t)a1, &qword_100040B70);
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000323D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    char v9 = (void *)((char *)a2 + v7);
    sub_100006978((uint64_t)a1 + v7, &qword_1000410C8);
    sub_100005A10(&qword_1000410C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100032390();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_100010884(*(void *)v13, v15);
  uint64_t v16 = *(void *)v12;
  char v17 = v12[8];
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  sub_100010960(v16, v17);
  return a1;
}

char *sub_100012AD0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000323D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  char v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100032390();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  return a1;
}

char *sub_100012C5C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100006978((uint64_t)a1, &qword_100040B70);
    uint64_t v6 = sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000323D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    char v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100006978((uint64_t)&a1[v8], &qword_1000410C8);
    uint64_t v11 = sub_100005A10(&qword_1000410C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100032390();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  uint64_t v16 = *(void *)v15;
  LOBYTE(v15) = v15[8];
  uint64_t v17 = *(void *)v14;
  char v18 = v14[8];
  *(void *)uint64_t v14 = v16;
  v14[8] = (char)v15;
  sub_100010960(v17, v18);
  return a1;
}

uint64_t sub_100012E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012E30);
}

uint64_t sub_100012E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100005A10(&qword_100040B78);
  sub_10001067C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_100005A10(&qword_100041220);
    sub_10001067C();
    if (*(_DWORD *)(v11 + 84) != a2)
    {
      unsigned int v13 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24) + 8);
      if (v13 > 1) {
        return (v13 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return sub_100006148(v9, a2, v8);
}

uint64_t sub_100012EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012F00);
}

void sub_100012F00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100005A10(&qword_100040B78);
  sub_10001067C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_100005A10(&qword_100041220);
    sub_10001067C();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 24) + 8) = -(char)a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  sub_100005A54(v11, a2, a2, v10);
}

uint64_t type metadata accessor for EmptyShortcutComplicationView()
{
  uint64_t result = qword_100041280;
  if (!qword_100041280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100013004()
{
  sub_10001310C(319, (unint64_t *)&qword_100040BE8, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_10001310C(319, (unint64_t *)&unk_100041290, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10001310C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100031E20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100013160()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001317C()
{
  sub_100005A10(&qword_1000412C8);
  sub_100006AA4();
  __chkstk_darwin(v2);
  sub_100005BF8();
  uint64_t v5 = (uint64_t *)(v4 - v3);
  sub_100005A10(&qword_1000412D0);
  sub_100006AA4();
  __chkstk_darwin(v6);
  sub_100005BF8();
  uint64_t v9 = v8 - v7;
  sub_100005A10(&qword_1000412D8);
  sub_100006AA4();
  __chkstk_darwin(v10);
  sub_10000AB4C();
  sub_100005A10(&qword_1000412E0);
  sub_100006AA4();
  __chkstk_darwin(v11);
  sub_100005BF8();
  uint64_t v14 = v13 - v12;
  sub_100005A10(&qword_1000412E8);
  sub_100006AA4();
  __chkstk_darwin(v15);
  sub_100005BF8();
  uint64_t v39 = v17 - v16;
  uint64_t v18 = type metadata accessor for RunShortcutRectangularWidgetView();
  sub_100006AA4();
  __chkstk_darwin(v19);
  sub_100005BF8();
  id v22 = (void *)(v21 - v20);
  uint64_t v23 = sub_1000323D0();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  sub_100014E54();
  sub_10002585C(v0);
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 88))(v0, v23);
  if (&enum case for WidgetFamily.accessoryCorner(_:) && v25 == enum case for WidgetFamily.accessoryCorner(_:))
  {
    sub_1000137AC(v9);
    sub_100014BB4(v9, v14, &qword_1000412D0);
    swift_storeEnumTagMultiPayload();
    sub_100014CE0(&qword_100041300, (void (*)(uint64_t))type metadata accessor for RunShortcutRectangularWidgetView);
    sub_10001492C();
    sub_100031FD0();
    sub_100014BB4(v39, v1, &qword_1000412E8);
    swift_storeEnumTagMultiPayload();
    sub_100014880();
    sub_100014B60();
    sub_100014E6C();
    sub_100006978(v39, &qword_1000412E8);
    return sub_100006978(v9, &qword_1000412D0);
  }
  else if (v25 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    id v27 = sub_100013730();
    NSString v28 = sub_100032560();
    NSString v29 = sub_100032560();
    id v30 = sub_100031508(v28);

    uint64_t v31 = sub_100032570();
    uint64_t v33 = v32;

    uint64_t v34 = sub_100032250();
    uint64_t v35 = (void *)((char *)v22 + *(int *)(v18 + 28));
    *uint64_t v35 = swift_getKeyPath();
    sub_100005A10(&qword_100041108);
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = (char *)v22 + *(int *)(v18 + 32);
    *(void *)uint64_t v36 = swift_getKeyPath();
    v36[8] = 0;
    *id v22 = v27;
    v22[1] = v31;
    v22[2] = v33;
    v22[3] = v34;
    sub_100014D28((uint64_t)v22, v14, (void (*)(void))type metadata accessor for RunShortcutRectangularWidgetView);
    swift_storeEnumTagMultiPayload();
    sub_100014CE0(&qword_100041300, (void (*)(uint64_t))type metadata accessor for RunShortcutRectangularWidgetView);
    sub_10001492C();
    sub_100031FD0();
    sub_100014BB4(v39, v1, &qword_1000412E8);
    swift_storeEnumTagMultiPayload();
    sub_100014880();
    sub_100014B60();
    sub_100014E6C();
    sub_100006978(v39, &qword_1000412E8);
    return sub_100014D7C((uint64_t)v22, (void (*)(void))type metadata accessor for RunShortcutRectangularWidgetView);
  }
  else
  {
    *uint64_t v5 = sub_1000322D0();
    v5[1] = v37;
    uint64_t v38 = sub_100005A10(&qword_1000412F0);
    sub_1000138A4((char *)v5 + *(int *)(v38 + 44));
    sub_100014BB4((uint64_t)v5, v1, &qword_1000412C8);
    swift_storeEnumTagMultiPayload();
    sub_100014880();
    sub_100014B60();
    sub_100031FD0();
    sub_100006978((uint64_t)v5, &qword_1000412C8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v0, v23);
  }
}

id sub_100013730()
{
  id v0 = [self whiteColor];
  unsigned int v1 = [v0 RGBAValue];

  id v2 = objc_allocWithZone((Class)WFWorkflowIcon);
  return sub_100019050(v1, 0xF000u, 0, 0xF000000000000000);
}

uint64_t sub_1000137AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = type metadata accessor for ComplicationPaddingModifier();
  __chkstk_darwin(v5 - 8);
  sub_100014E54();
  uint64_t v6 = sub_100005A10(&qword_100041318);
  __chkstk_darwin(v6 - 8);
  sub_10000AB4C();
  sub_100013AAC(v1, v3);
  *id v2 = swift_getKeyPath();
  sub_100005A10(&qword_100040B70);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = sub_100005A10(&qword_1000412D0);
  sub_100014C14((uint64_t)v2, a1 + *(int *)(v7 + 36));
  return sub_100014C78(v3, a1);
}

uint64_t sub_1000138A4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_100005A10(&qword_1000412D0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = sub_100032350();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - v13;
  sub_100032340();
  sub_1000137AC((uint64_t)v7);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  sub_100014BB4((uint64_t)v7, (uint64_t)v5, &qword_1000412D0);
  v15(a1, v12, v8);
  uint64_t v16 = sub_100005A10(&qword_100041360);
  sub_100014BB4((uint64_t)v5, (uint64_t)&a1[*(int *)(v16 + 48)], &qword_1000412D0);
  sub_100006978((uint64_t)v7, &qword_1000412D0);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v14, v8);
  sub_100006978((uint64_t)v5, &qword_1000412D0);
  return ((uint64_t (*)(char *, uint64_t))v17)(v12, v8);
}

uint64_t sub_100013AAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v108 = a2;
  uint64_t v89 = sub_1000322F0();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  v87 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100032200();
  uint64_t v75 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  unint64_t v74 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100032390();
  uint64_t v83 = *(void *)(v84 - 8);
  uint64_t v5 = __chkstk_darwin(v84);
  uint64_t v82 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v94 = (uint64_t)&v74 - v7;
  uint64_t v8 = sub_100031D40();
  uint64_t v92 = *(void *)(v8 - 8);
  uint64_t v93 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v79 = (uint64_t *)((char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v91 = (uint64_t *)((char *)&v74 - v11);
  uint64_t v109 = type metadata accessor for WidgetSStackView(0);
  __chkstk_darwin(v109);
  long long v81 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_100005A10(&qword_100041348);
  uint64_t v86 = *(void *)(v107 - 8);
  uint64_t v13 = __chkstk_darwin(v107);
  long long v80 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v85 = (char *)&v74 - v15;
  uint64_t v104 = sub_100005A10(&qword_100041350);
  __chkstk_darwin(v104);
  v106 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100031D80();
  uint64_t v99 = *(void *)(v17 - 8);
  uint64_t v100 = v17;
  __chkstk_darwin(v17);
  v98 = (char **)((char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = sub_100031D70();
  uint64_t v95 = *(void *)(v19 - 8);
  uint64_t v96 = v19;
  __chkstk_darwin(v19);
  v97 = (char **)((char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v105 = sub_100031D90();
  uint64_t v102 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v101 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for EmptyShortcutComplicationView();
  __chkstk_darwin(v77);
  uint64_t v103 = (uint64_t)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000323D0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  id v27 = (char *)&v74 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  NSString v29 = (char *)&v74 - v28;
  sub_10002585C((uint64_t)&v74 - v28);
  v90 = *(void (**)(char *, void, uint64_t))(v24 + 104);
  v90(v27, enum case for WidgetFamily.accessoryInline(_:), v23);
  sub_100014CE0(&qword_100041358, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_1000325D0();
  sub_1000325D0();
  uint64_t v30 = v110;
  uint64_t v31 = v112;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v24 + 8);
  v32(v27, v23);
  v32(v29, v23);
  uint64_t v33 = a1;
  uint64_t v34 = v103;
  uint64_t v78 = v33;
  sub_100014D28(v33, v103, (void (*)(void))type metadata accessor for EmptyShortcutComplicationView);
  if (v30 == v31)
  {
    sub_100014D7C(v34, (void (*)(void))type metadata accessor for EmptyShortcutComplicationView);
LABEL_4:
    id v37 = sub_100013730();
    id v38 = [v37 icon];

    uint64_t v39 = v96;
    uint64_t v40 = v97;
    void *v97 = 0x403E000000000000;
    (*(void (**)(void *, void, uint64_t))(v95 + 104))(v40, enum case for IconSize.customHeight(_:), v39);
    id v41 = [self whiteColor];
    uint64_t v43 = v98;
    uint64_t v42 = v99;
    void *v98 = v41;
    *((unsigned char *)v43 + 8) = 0;
    (*(void (**)(void *, void, uint64_t))(v42 + 104))(v43, enum case for IconView.DisplayMode.customColor(_:), v100);
    id v44 = v101;
    sub_100031DA0();
    uint64_t v45 = v102;
    uint64_t v46 = v105;
    (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v106, v44, v105);
    swift_storeEnumTagMultiPayload();
    sub_100014CE0((unint64_t *)&qword_100041210, (void (*)(uint64_t))&type metadata accessor for IconView);
    uint64_t v47 = sub_100014CE0(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    uint64_t v110 = v109;
    uint64_t v111 = v47;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v44, v46);
  }
  sub_10002585C((uint64_t)v29);
  v90(v27, enum case for WidgetFamily.accessoryRectangular(_:), v23);
  sub_1000325D0();
  sub_1000325D0();
  uint64_t v35 = v110;
  uint64_t v36 = v112;
  v32(v27, v23);
  v32(v29, v23);
  sub_100014D7C(v34, (void (*)(void))type metadata accessor for EmptyShortcutComplicationView);
  if (v35 == v36) {
    goto LABEL_4;
  }
  uint64_t v49 = sub_100032230();
  uint64_t v50 = v91;
  uint64_t *v91 = v49;
  uint64_t v51 = enum case for SStackFill.color(_:);
  uint64_t v52 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v92 + 104);
  v52(v50, enum case for SStackFill.color(_:), v93);
  uint64_t v53 = v94;
  sub_100025CC0(v94);
  uint64_t v54 = v82;
  sub_100032370();
  char v55 = sub_100032360();
  uint64_t v56 = *(void (**)(char *, uint64_t))(v83 + 8);
  uint64_t v57 = v84;
  v56(v54, v84);
  v56((char *)v53, v57);
  if (v55)
  {
    (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, enum case for Color.RGBColorSpace.sRGB(_:), v76);
    uint64_t v58 = sub_100032260();
  }
  else
  {
    sub_100032230();
    uint64_t v58 = sub_100032240();
    swift_release();
  }
  uint64_t v59 = v79;
  *uint64_t v79 = v58;
  uint64_t v60 = v93;
  v52(v59, v51, v93);
  uint64_t v61 = *(void (**)(char *, uint64_t *, uint64_t))(v92 + 32);
  uint64_t v62 = (uint64_t)v81;
  v61(v81, v91, v60);
  type metadata accessor for WidgetSStackView.Content(0);
  swift_storeEnumTagMultiPayload();
  v61((char *)(v62 + *(int *)(v109 + 20)), v59, v60);
  uint64_t v63 = v94;
  sub_100025CC0(v94);
  sub_100032380();
  LOBYTE(v61) = sub_100032360();
  v56(v54, v57);
  v56((char *)v63, v57);
  uint64_t v64 = v88;
  uint64_t v65 = (unsigned int *)&enum case for BlendMode.destinationOut(_:);
  if ((v61 & 1) == 0) {
    uint64_t v65 = (unsigned int *)&enum case for BlendMode.normal(_:);
  }
  uint64_t v66 = v87;
  uint64_t v67 = v89;
  (*(void (**)(char *, void, uint64_t))(v88 + 104))(v87, *v65, v89);
  uint64_t v68 = sub_100014CE0(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
  uint64_t v69 = v80;
  uint64_t v70 = v109;
  sub_100032140();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v67);
  sub_100014D7C(v62, (void (*)(void))type metadata accessor for WidgetSStackView);
  uint64_t v71 = v86;
  v72 = v85;
  uint64_t v73 = v107;
  (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v85, v69, v107);
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v106, v72, v73);
  swift_storeEnumTagMultiPayload();
  sub_100014CE0((unint64_t *)&qword_100041210, (void (*)(uint64_t))&type metadata accessor for IconView);
  uint64_t v110 = v70;
  uint64_t v111 = v68;
  swift_getOpaqueTypeConformance2();
  sub_100031FD0();
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v72, v73);
}

unint64_t sub_100014880()
{
  unint64_t result = qword_1000412F8;
  if (!qword_1000412F8)
  {
    sub_100005B98(&qword_1000412E8);
    sub_100014CE0(&qword_100041300, (void (*)(uint64_t))type metadata accessor for RunShortcutRectangularWidgetView);
    sub_10001492C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000412F8);
  }
  return result;
}

unint64_t sub_10001492C()
{
  unint64_t result = qword_100041308;
  if (!qword_100041308)
  {
    sub_100005B98(&qword_1000412D0);
    sub_1000149D8();
    sub_100014CE0(&qword_100041338, (void (*)(uint64_t))type metadata accessor for ComplicationPaddingModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041308);
  }
  return result;
}

unint64_t sub_1000149D8()
{
  unint64_t result = qword_100041310;
  if (!qword_100041310)
  {
    sub_100005B98(&qword_100041318);
    sub_100014A4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041310);
  }
  return result;
}

unint64_t sub_100014A4C()
{
  unint64_t result = qword_100041320;
  if (!qword_100041320)
  {
    sub_100005B98(&qword_100041328);
    sub_100014CE0((unint64_t *)&qword_100041210, (void (*)(uint64_t))&type metadata accessor for IconView);
    type metadata accessor for WidgetSStackView(255);
    sub_100014CE0(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041320);
  }
  return result;
}

unint64_t sub_100014B60()
{
  unint64_t result = qword_100041340;
  if (!qword_100041340)
  {
    sub_100005B98(&qword_1000412C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041340);
  }
  return result;
}

uint64_t sub_100014BB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005A10(a3);
  sub_100006AA4();
  uint64_t v4 = sub_100014E90();
  v5(v4);
  return a2;
}

uint64_t sub_100014C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComplicationPaddingModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_100041318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014CE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100014D28(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100006AA4();
  uint64_t v4 = sub_100014E90();
  v5(v4);
  return a2;
}

uint64_t sub_100014D7C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100006AA4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_100014DD8()
{
  unint64_t result = qword_100041368;
  if (!qword_100041368)
  {
    sub_100005B98(&qword_100041370);
    sub_100014880();
    sub_100014B60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041368);
  }
  return result;
}

uint64_t sub_100014E6C()
{
  return sub_100031FD0();
}

uint64_t sub_100014E90()
{
  return v0;
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result) {
      return sub_100032590();
    }
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return sub_100032590();
  }
  if (result >> 11 == 27) {
    goto LABEL_14;
  }
  if (WORD1(result) > 0x10u) {
    goto LABEL_11;
  }
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF) {
    return sub_100032590();
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t *NSBundle._current.unsafeMutableAddressor()
{
  if (qword_100040A80 != -1) {
    swift_once();
  }
  return &static NSBundle._current;
}

id sub_100015000()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  static NSBundle._current = (uint64_t)result;
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_100040A80 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static NSBundle._current;

  return v0;
}

uint64_t sub_1000150B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

unint64_t sub_1000150EC()
{
  unint64_t result = qword_100041410;
  if (!qword_100041410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041410);
  }
  return result;
}

unint64_t sub_10001513C()
{
  unint64_t result = qword_100041418;
  if (!qword_100041418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041418);
  }
  return result;
}

unint64_t sub_10001518C()
{
  unint64_t result = qword_100041420;
  if (!qword_100041420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041420);
  }
  return result;
}

unint64_t sub_1000151DC()
{
  unint64_t result = qword_100041428;
  if (!qword_100041428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041428);
  }
  return result;
}

uint64_t sub_100015228()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015278()
{
  uint64_t v0 = sub_100032550();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100031C30();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031D30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100031C50();
  sub_100015DDC(v6, qword_100045818);
  sub_100015DA4(v6, (uint64_t)qword_100045818);
  sub_1000324E0();
  sub_100031D20();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  return sub_100031C60();
}

uint64_t sub_100015460()
{
  if (qword_100040A88 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031C50();

  return sub_100015DA4(v0, (uint64_t)qword_100045818);
}

uint64_t sub_1000154C4()
{
  uint64_t v0 = sub_100032550();
  uint64_t v1 = sub_10000927C(v0);
  __chkstk_darwin(v1);
  sub_100005BF8();
  sub_100031A60();
  sub_100006A88();
  uint64_t v32 = v3;
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  sub_100005BF8();
  uint64_t v31 = v5 - v4;
  uint64_t v6 = sub_100005A10(&qword_100040B28);
  uint64_t v7 = sub_10000927C(v6);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v14 = sub_10000927C(v13);
  __chkstk_darwin(v14);
  sub_100005BF8();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_100031C30();
  sub_100006A88();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_100005BF8();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = sub_100031D30();
  uint64_t v26 = sub_10000927C(v25);
  __chkstk_darwin(v26);
  sub_100005BF8();
  uint64_t v27 = sub_100031C50();
  __chkstk_darwin(v27);
  sub_100005BF8();
  sub_1000324E0();
  uint64_t v30 = sub_100005A10(&qword_100041438);
  sub_100031D20();
  (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v24, enum case for LocalizedStringResource.BundleDescription.main(_:), v18);
  sub_100031C60();
  sub_100015E40(v17);
  sub_100031800();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v37 = 0;
  sub_100015E40((uint64_t)v12);
  sub_100015E40((uint64_t)v10);
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v31, enum case for InputConnectionBehavior.default(_:), v33);
  sub_100015C90();
  uint64_t v28 = sub_1000318D0();
  sub_100005A10(&qword_100041440);
  sub_100031760();
  long long v34 = 0u;
  long long v35 = 0u;
  *(void *)&long long v36 = 0;
  sub_100031750();
  sub_100031710();
  return v28;
}

uint64_t sub_100015860@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100015460();
  uint64_t v3 = sub_100031C50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_1000158D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000FC3C();
  *uint64_t v4 = v2;
  v4[1] = sub_100015980;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_100015980()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100015A88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000154C4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100015AB0(uint64_t a1)
{
  unint64_t v2 = sub_1000150EC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for RunShortcutConfigurationIntent()
{
  swift_release();

  return swift_release();
}

void *_s24ShortcutsWidgetExtension30RunShortcutConfigurationIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for RunShortcutConfigurationIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for RunShortcutConfigurationIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RunShortcutConfigurationIntent(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
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

uint64_t storeEnumTagSinglePayload for RunShortcutConfigurationIntent(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RunShortcutConfigurationIntent()
{
  return &type metadata for RunShortcutConfigurationIntent;
}

unint64_t sub_100015C90()
{
  unint64_t result = qword_100041D90[0];
  if (!qword_100041D90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041D90);
  }
  return result;
}

uint64_t sub_100015CDC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100015CFC, 0, 0);
}

uint64_t sub_100015CFC()
{
  if (qword_100040B18 != -1) {
    swift_once();
  }
  **(void **)(v0 + 16) = qword_100045948;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  return v2();
}

uint64_t sub_100015DA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100015DDC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100015E40(uint64_t a1)
{
  return sub_100005A54(a1, 1, 1, v1);
}

ValueMetadata *type metadata accessor for WidgetChicletButonStyle()
{
  return &type metadata for WidgetChicletButonStyle;
}

uint64_t sub_100015E6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015E88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100032000();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005A10(&qword_100041450);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100032010();
  if (sub_100032020()) {
    double v10 = 0.97;
  }
  else {
    double v10 = 1.0;
  }
  sub_100032300();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v2);
  uint64_t v15 = &v9[*(int *)(v7 + 44)];
  *(double *)uint64_t v15 = v10;
  *((double *)v15 + 1) = v10;
  *((void *)v15 + 2) = v12;
  *((void *)v15 + 3) = v14;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_100016020((uint64_t)v9, a1);
}

uint64_t sub_100016020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_100041450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001608C()
{
  unint64_t result = qword_100041458;
  if (!qword_100041458)
  {
    sub_100005B98(&qword_100041450);
    sub_100016108();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041458);
  }
  return result;
}

unint64_t sub_100016108()
{
  unint64_t result = qword_100041460;
  if (!qword_100041460)
  {
    sub_100032000();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041460);
  }
  return result;
}

unint64_t sub_10001615C()
{
  unint64_t result = qword_100041468;
  if (!qword_100041468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041468);
  }
  return result;
}

double sub_1000161A8@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [a1 identifier];
  sub_100032570();

  id v5 = [a1 name];
  sub_100032570();

  sub_100019A94(a1);
  [a1 color];
  [a1 glyphCharacter];
  id v6 = a1;
  sub_100019AF8(v6);
  sub_1000174BC((uint64_t)v9);

  long long v7 = v9[1];
  *(_OWORD *)a2 = v9[0];
  *(_OWORD *)(a2 + 16) = v7;
  double result = *(double *)&v10;
  *(_OWORD *)(a2 + 32) = v10;
  *(void *)(a2 + 48) = v11;
  return result;
}

id sub_1000162D8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_100031820();
  NSString v2 = sub_100032560();
  swift_bridgeObjectRelease();
  id v3 = [v1 referenceForWorkflowID:v2];

  if (!v3)
  {
    sub_100031820();
    NSString v4 = sub_100032560();
    swift_bridgeObjectRelease();
    id v3 = [v1 uniqueVisibleReferenceForWorkflowName:v4];
  }
  return v3;
}

uint64_t sub_1000163A4()
{
  sub_100031820();
  return v1;
}

id sub_1000163D8()
{
  sub_100031820();
  if ((v28 & 1) == 0)
  {
    unint64_t v0 = v27;
    sub_100031820();
    if ((v27 & 0x8000000000000000) == 0)
    {
      if (!(v27 >> 16))
      {
        id v6 = objc_allocWithZone((Class)WFWorkflowIcon);
        uint64_t v7 = v27;
        unsigned __int16 v8 = v27;
        return sub_100019050(v7, v8, 0, 0xF000000000000000);
      }
      goto LABEL_29;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000327A0();
    id result = (id)swift_bridgeObjectRelease();
    if (!v19) {
      goto LABEL_31;
    }
    goto LABEL_20;
  }
  if (qword_100040B18 != -1) {
    swift_once();
  }
  unint64_t v0 = sub_100005A10(&qword_1000410D0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100035A30;
  sub_100031820();
  *(void *)(v1 + 32) = v27;
  *(void *)(v1 + 40) = v28;
  unint64_t v2 = sub_100030A18();
  swift_bridgeObjectRelease();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000327A0();
    swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_7:
      if ((v2 & 0xC000000000000001) != 0)
      {
        id v3 = (id)sub_100032710();
      }
      else
      {
        if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_28;
        }
        id v3 = *(id *)(v2 + 32);
      }
      id v4 = v3;
      swift_bridgeObjectRelease();
      id v5 = [v4 icon];
      goto LABEL_34;
    }
  }
  else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  sub_100031820();
  if (v28)
  {
    uint64_t v10 = sub_100031CC0();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v12 >> 60 != 15)
    {
      sub_100010350(0, &qword_1000410D8);
      sub_100010350(0, &qword_100041F40);
      uint64_t v18 = (void *)sub_1000326A0();
      sub_10001038C(v10, v12);
      if (v18)
      {
        id v4 = [v18 previewIcon];

        goto LABEL_32;
      }
    }
  }
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100035A30;
  sub_100031820();
  *(void *)(v13 + 32) = v27;
  *(void *)(v13 + 40) = v28;
  unint64_t v0 = sub_100030A18();
  id result = (id)swift_bridgeObjectRelease();
  if (v0 >> 62) {
    goto LABEL_30;
  }
  if (!*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_31:
    swift_bridgeObjectRelease();
    id v20 = [self clearBackground];
    id v21 = objc_allocWithZone((Class)WFSymbolIcon);
    id v4 = sub_1000190E4(0x74732E322E707061, 0xEE0064332E6B6361, v20);
    goto LABEL_32;
  }
LABEL_20:
  if ((v0 & 0xC000000000000001) != 0)
  {
    id v15 = (id)sub_100032710();
    goto LABEL_23;
  }
  if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v15 = *(id *)(v0 + 32);
LABEL_23:
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    id v17 = [v16 icon];
    id v4 = [v17 icon];

LABEL_32:
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClass();
    if (!v22)
    {

      id v26 = objc_allocWithZone((Class)WFWorkflowIcon);
      uint64_t v7 = 0;
      unsigned __int16 v8 = -4096;
      return sub_100019050(v7, v8, 0, 0xF000000000000000);
    }
    unsigned __int16 v23 = (unsigned __int16)[v22 glyph];
    id v24 = objc_allocWithZone((Class)WFWorkflowIcon);
    id v5 = sub_100019050(0, v23, 0, 0xF000000000000000);
LABEL_34:
    id v25 = v5;

    return v25;
  }
  __break(1u);
  return result;
}

uint64_t sub_100016890()
{
  uint64_t v28 = sub_1000324D0();
  uint64_t v26 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v1 = (char *)v21 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100032530();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100005A10((uint64_t *)&unk_100041F00);
  __chkstk_darwin(v3 - 8);
  unint64_t v27 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031C30();
  uint64_t v22 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unsigned __int16 v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100031D30();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100032550();
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  id v24 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v25 = sub_100031C50();
  __chkstk_darwin(v25);
  uint64_t v13 = sub_100031AC0();
  sub_100015DDC(v13, qword_100045830);
  uint64_t v23 = sub_100015DA4(v13, (uint64_t)qword_100045830);
  sub_1000324E0();
  sub_100031D20();
  uint64_t v14 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v15 = v6 + 104;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v21[1] = v15;
  v16(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  sub_100031C60();
  sub_100032520();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_100032510(v29);
  uint64_t v17 = v26;
  uint64_t v18 = v28;
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v1, enum case for String.LocalizationValue.Placeholder.int(_:), v28);
  sub_100023624();
  sub_1000324F0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v1, v18);
  v30._countAndFlagsBits = 0x756374726F687320;
  v30._object = (void *)0xEA00000000007374;
  sub_100032510(v30);
  sub_100032540();
  sub_100031D20();
  v16(v8, v14, v22);
  uint64_t v19 = (uint64_t)v27;
  sub_100031C60();
  sub_100005A54(v19, 0, 1, v25);
  return sub_100031AB0();
}

uint64_t sub_100016D40()
{
  if (qword_100040A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031AC0();

  return sub_100015DA4(v0, (uint64_t)qword_100045830);
}

uint64_t sub_100016DA4()
{
  uint64_t v0 = sub_100005A10(&qword_100041538);
  uint64_t v1 = sub_10000927C(v0);
  __chkstk_darwin(v1);
  sub_100005BF8();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v6 = sub_10000927C(v5);
  __chkstk_darwin(v6);
  sub_100005BF8();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_100031C50();
  __chkstk_darwin(v10);
  sub_100005BF8();
  uint64_t v11 = sub_100032530();
  uint64_t v12 = sub_10000927C(v11);
  __chkstk_darwin(v12);
  sub_100005BF8();
  sub_100031820();
  uint64_t v33 = v9;
  uint64_t v32 = v10;
  if (v35)
  {
    uint64_t v14 = (uint64_t)sub_10001716C(31.0, 31.0);
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = self;
    id v18 = sub_1000163D8();
    id v19 = [v17 imageWithIcon:v18 size:31.0, 31.0];

    if (v19)
    {
      uint64_t v14 = sub_100019C44(v19);
      unint64_t v16 = v20;
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v16 = 0xF000000000000000;
    }
  }
  sub_100031820();
  if (v35
    && (uint64_t v21 = sub_100031CC0(), v23 = v22, swift_bridgeObjectRelease(), v23 >> 60 != 15)
    && (sub_100010350(0, &qword_1000410D8),
        sub_100010350(0, &qword_100041F40),
        Swift::String v29 = (void *)sub_1000326A0(),
        sub_10001038C(v21, v23),
        v29))
  {
    id v30 = [v29 name];

    uint64_t v25 = sub_100032570();
    id v24 = v31;
  }
  else
  {
    sub_100031820();
    uint64_t v25 = v34;
    id v24 = v35;
  }
  uint64_t v26 = 1;
  sub_100032520();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_100032510(v36);
  v37._countAndFlagsBits = v25;
  v37._object = v24;
  sub_100032500(v37);
  swift_bridgeObjectRelease();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_100032510(v38);
  sub_100031C40();
  sub_100005A54(v33, 1, 1, v32);
  if (v16 >> 60 != 15)
  {
    sub_100019BEC(v14, v16);
    sub_100031970();
    uint64_t v26 = 0;
  }
  uint64_t v27 = sub_100031980();
  sub_100005A54(v4, v26, 1, v27);
  sub_100031990();
  return sub_10001038C(v14, v16);
}

void *sub_10001716C(double a1, double a2)
{
  id v4 = [self mainScreen];
  [v4 scale];
  double v6 = v5;

  id v7 = [objc_allocWithZone((Class)ISImageDescriptor) initWithSize:a1 scale:a2];
  sub_100010350(0, &qword_100041540);
  swift_bridgeObjectRetain();
  id v8 = sub_10001733C();
  id v9 = [v8 prepareImageForDescriptor:v7];
  uint64_t v10 = v9;
  if (!v9)
  {

    return v10;
  }
  id v11 = [v9 CGImage];

  if (!v11)
  {

    return 0;
  }
  id v12 = [self imageWithCGImage:v11];
  id v13 = [v12 PNGRepresentation];
  if (!v13)
  {

    return 0;
  }
  uint64_t v14 = v13;
  uint64_t v10 = (void *)sub_100031CE0();

  return v10;
}

id sub_10001733C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100032560();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithBundleIdentifier:v1];

  return v2;
}

uint64_t sub_1000173B0()
{
  if (qword_100040B18 != -1) {
    swift_once();
  }
  qword_100045848 = qword_100045948;

  return swift_retain();
}

uint64_t sub_100017414()
{
  if (qword_100040B18 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t *sub_100017470()
{
  if (qword_100040A98 != -1) {
    swift_once();
  }
  return &qword_100045848;
}

double sub_1000174BC@<D0>(uint64_t a1@<X8>)
{
  sub_1000175DC((uint64_t *)v4);
  sub_10001055C((uint64_t)v4);
  sub_100031830();
  sub_100031830();
  sub_100031830();
  sub_100031830();
  sub_100031830();
  sub_100031830();
  sub_100019B68((uint64_t)v4);
  long long v2 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v2;
  double result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = v6;
  return result;
}

uint64_t sub_1000175DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100031C50();
  uint64_t v3 = sub_10000927C(v2);
  __chkstk_darwin(v3);
  sub_100005BF8();
  sub_100005A10(&qword_100041500);
  sub_100031C20();
  uint64_t v4 = sub_100031850();
  sub_100031C20();
  uint64_t v5 = sub_100031850();
  sub_100005A10(&qword_100041508);
  sub_100031C20();
  uint64_t v6 = sub_100031850();
  sub_100005A10(&qword_100041510);
  sub_100031C20();
  uint64_t v7 = sub_100031860();
  sub_100031C20();
  uint64_t v8 = sub_100031860();
  sub_100031C20();
  uint64_t v9 = sub_100031850();
  sub_100031C20();
  uint64_t result = sub_100031850();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = result;
  return result;
}

uint64_t sub_1000177E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return sub_100019CBC((uint64_t)sub_1000177FC);
}

uint64_t sub_1000177FC()
{
  sub_10000931C();
  NSString v1 = (void *)sub_100030C08();
  if (v1)
  {
    sub_1000161A8(v1, v0 + 16);
    long long v2 = *(_OWORD *)(v0 + 16);
    long long v3 = *(_OWORD *)(v0 + 32);
    long long v4 = *(_OWORD *)(v0 + 48);
    uint64_t v5 = *(void *)(v0 + 64);
  }
  else
  {
    uint64_t v5 = 0;
    long long v2 = 0uLL;
    long long v3 = 0uLL;
    long long v4 = 0uLL;
  }
  uint64_t v6 = *(void *)(v0 + 72);
  *(_OWORD *)uint64_t v6 = v2;
  *(_OWORD *)(v6 + 16) = v3;
  *(_OWORD *)(v6 + 32) = v4;
  *(void *)(v6 + 48) = v5;
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100017894()
{
  sub_10000931C();
  uint64_t v2 = v1;
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v3;
  *long long v3 = v0;
  v3[1] = sub_100019CB8;
  return sub_100017928(v2);
}

uint64_t sub_100017928(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return sub_100019CBC((uint64_t)sub_100017940);
}

char *sub_100017940()
{
  unint64_t v1 = sub_100030A18();
  uint64_t v2 = v1;
  if (v1 >> 62)
  {
    uint64_t v3 = sub_100019D90();
    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_14;
    }
  }
  uint64_t result = sub_100019DAC();
  if (v3 < 0)
  {
    __break(1u);
    return result;
  }
  sub_100019D74();
  do
  {
    if (v15) {
      id v5 = (id)sub_100032710();
    }
    else {
      id v5 = *(id *)(v2 + 8 * v0 + 32);
    }
    uint64_t v6 = v5;
    id v7 = [v5 identifier];
    sub_100032570();

    id v8 = [v6 name];
    uint64_t v2 = sub_100032570();

    sub_100019A94(v6);
    [v6 color];
    [v6 glyphCharacter];
    id v9 = v6;
    sub_100019AF8(v9);
    sub_100019D10();

    sub_100019E18();
    if (v11) {
      sub_100019DF4(v10);
    }
    sub_100019CC8();
  }
  while (!v12);
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_100019E2C();
  return (char *)v14(v13);
}

uint64_t sub_100017AFC(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_100019CB8;
  return sub_100017BA4(a1, a2);
}

uint64_t sub_100017BA4(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return sub_100019CBC((uint64_t)sub_100017BC0);
}

char *sub_100017BC0()
{
  unint64_t v1 = sub_100030DD4();
  uint64_t v2 = v1;
  if (v1 >> 62)
  {
    uint64_t v3 = sub_100019D90();
    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_14;
    }
  }
  uint64_t result = sub_100019DAC();
  if (v3 < 0)
  {
    __break(1u);
    return result;
  }
  sub_100019D74();
  do
  {
    if (v15) {
      id v5 = (id)sub_100032710();
    }
    else {
      id v5 = *(id *)(v2 + 8 * v0 + 32);
    }
    uint64_t v6 = v5;
    id v7 = [v5 identifier];
    sub_100032570();

    id v8 = [v6 name];
    uint64_t v2 = sub_100032570();

    sub_100019A94(v6);
    [v6 color];
    [v6 glyphCharacter];
    id v9 = v6;
    sub_100019AF8(v9);
    sub_100019D10();

    sub_100019E18();
    if (v11) {
      sub_100019DF4(v10);
    }
    sub_100019CC8();
  }
  while (!v12);
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_100019E2C();
  return (char *)v14(v13);
}

uint64_t sub_100017D80(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_100019CBC((uint64_t)sub_100017D98);
}

uint64_t sub_100017D98()
{
  sub_10000931C();
  uint64_t v1 = sub_100017DF8();
  uint64_t v2 = *(uint64_t (**)(char *))(v0 + 8);
  return v2(v1);
}

char *sub_100017DF8()
{
  unint64_t v0 = sub_100030D4C();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v2 = sub_100019D90();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t result = sub_1000196E0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    unint64_t v19 = v1 & 0xC000000000000001;
    unint64_t v20 = v1;
    do
    {
      if (v19) {
        id v5 = (id)sub_100032710();
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 identifier:v17, v18];
      sub_100032570();

      id v8 = [v6 name];
      sub_100032570();

      sub_100019A94(v6);
      [v6 color];
      [v6 glyphCharacter];
      id v9 = v6;
      uint64_t v17 = sub_100019AF8(v9);
      uint64_t v18 = v10;
      sub_1000174BC((uint64_t)v21);

      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v12 >= v11 >> 1) {
        sub_1000196E0((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v4;
      *((void *)&_swiftEmptyArrayStorage + 2) = v12 + 1;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 56 * v12;
      long long v14 = v21[0];
      long long v15 = v21[1];
      long long v16 = v21[2];
      *((void *)v13 + 10) = v22;
      *((_OWORD *)v13 + 3) = v15;
      *((_OWORD *)v13 + 4) = v16;
      *((_OWORD *)v13 + 2) = v14;
      unint64_t v1 = v20;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return (char *)&_swiftEmptyArrayStorage;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1000180D0;
  return sub_100017AFC(a2, a3);
}

uint64_t sub_1000180D0(uint64_t a1)
{
  sub_1000091FC();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_100019D44();
  *id v7 = v6;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v5 + 16) = a1;
  }
  uint64_t v8 = *(uint64_t (**)(void))(v6 + 8);
  return v8();
}

unint64_t sub_1000181B8()
{
  unint64_t result = qword_100041478;
  if (!qword_100041478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041478);
  }
  return result;
}

unint64_t sub_100018208()
{
  unint64_t result = qword_100041480[0];
  if (!qword_100041480[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041480);
  }
  return result;
}

uint64_t sub_100018258@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100017414();
  *a1 = result;
  return result;
}

uint64_t sub_100018280()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10001831C;
  return sub_100017894();
}

uint64_t sub_10001831C()
{
  sub_10000931C();
  uint64_t v3 = v2;
  sub_1000091FC();
  uint64_t v4 = *v1;
  sub_100019D44();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  id v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_1000183EC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100019CB4;
  return sub_100017D80(v3);
}

unint64_t sub_100018488()
{
  unint64_t result = qword_100041498;
  if (!qword_100041498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041498);
  }
  return result;
}

unint64_t sub_1000184D8()
{
  unint64_t result = qword_100041DB0;
  if (!qword_100041DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DB0);
  }
  return result;
}

unint64_t sub_100018528()
{
  unint64_t result = qword_1000414A0[0];
  if (!qword_1000414A0[0])
  {
    sub_100005B98(qword_100041DC0);
    sub_1000184D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000414A0);
  }
  return result;
}

uint64_t sub_10001859C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001615C();
  *uint64_t v5 = v2;
  v5[1] = sub_100018650;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100018650()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v1 = *v0;
  sub_100019D44();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_100018714(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 80) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000187B8;
  return sub_1000177E4(v2 + 16, v3);
}

uint64_t sub_1000187B8()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v2 = v1 + 16;
  uint64_t v4 = *(void *)(v3 + 72);
  uint64_t v5 = *v0;
  sub_100019D44();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  sub_100010154(v2, v4);
  id v7 = *(uint64_t (**)(void))(v5 + 8);
  return v7();
}

double sub_1000188A8@<D0>(uint64_t a1@<X8>)
{
  sub_1000175DC((uint64_t *)v4);
  long long v2 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v2;
  double result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = v6;
  return result;
}

unint64_t sub_1000188F8()
{
  unint64_t result = qword_1000414B8;
  if (!qword_1000414B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414B8);
  }
  return result;
}

unint64_t sub_100018948()
{
  unint64_t result = qword_1000414C0;
  if (!qword_1000414C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414C0);
  }
  return result;
}

unint64_t sub_100018998()
{
  unint64_t result = qword_1000414C8;
  if (!qword_1000414C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414C8);
  }
  return result;
}

void *sub_1000189E4()
{
  return &protocol witness table for String;
}

uint64_t sub_1000189F0@<X0>(void *a1@<X8>)
{
  sub_100017470();
  *a1 = qword_100045848;

  return swift_retain();
}

unint64_t sub_100018A34()
{
  unint64_t result = qword_1000414D0;
  if (!qword_1000414D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414D0);
  }
  return result;
}

unint64_t sub_100018A84()
{
  unint64_t result = qword_1000414D8;
  if (!qword_1000414D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414D8);
  }
  return result;
}

unint64_t sub_100018AD4()
{
  unint64_t result = qword_1000414E0;
  if (!qword_1000414E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414E0);
  }
  return result;
}

void *sub_100018B20()
{
  return &protocol witness table for String;
}

uint64_t sub_100018B2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000163A4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100018B54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100016D40();
  uint64_t v3 = sub_100031AC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

unint64_t sub_100018BC8()
{
  unint64_t result = qword_1000414E8;
  if (!qword_1000414E8)
  {
    sub_100005B98(&qword_1000414F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414E8);
  }
  return result;
}

uint64_t sub_100018C1C(uint64_t a1)
{
  unint64_t v2 = sub_100015C90();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100018C6C()
{
  unint64_t result = qword_1000414F8;
  if (!qword_1000414F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414F8);
  }
  return result;
}

uint64_t sub_100018CBC(uint64_t a1)
{
  unint64_t v2 = sub_100018AD4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ConfiguredShortcut(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ConfiguredShortcut()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for ConfiguredShortcut(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ConfiguredShortcut(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ConfiguredShortcut(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ConfiguredShortcut(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfiguredShortcut(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 56))
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

uint64_t storeEnumTagSinglePayload for ConfiguredShortcut(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfiguredShortcut()
{
  return &type metadata for ConfiguredShortcut;
}

ValueMetadata *type metadata accessor for ConfiguredShortcut.SortedVisibleShortcutsQuery()
{
  return &type metadata for ConfiguredShortcut.SortedVisibleShortcutsQuery;
}

id sub_100019050(uint64_t a1, unsigned __int16 a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100031CD0().super.isa;
    sub_10001038C(a3, a4);
  }
  id v10 = [v4 initWithBackgroundColorValue:a1 glyphCharacter:a2 customImageData:isa];

  return v10;
}

id sub_1000190E4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = sub_100032560();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithSymbolName:v5 background:a3];

  return v6;
}

uint64_t sub_100019148(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_1000327B0();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1
    || (uint64_t result = type metadata accessor for RunShortcutWidgetEntry(0),
        a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = type metadata accessor for RunShortcutWidgetEntry(0);
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  return result;
}

char *sub_100019278(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1000327B0();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

char *sub_100019314(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100019CFC();
    uint64_t result = (char *)sub_100019DD0();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)sub_100019D54(a3, result);
  }
  return result;
}

char *sub_100019374(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100019CFC();
    uint64_t result = (char *)sub_100019DD0();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)sub_100019D54(a3, result);
  }
  return result;
}

uint64_t sub_1000193D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(type metadata accessor for RunShortcutWidgetEntry(0) - 8) + 72) * a2,
         unint64_t v6 = a3 + v5,
         unint64_t v7 = a1 + v5,
         v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_1000327B0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1000194E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 56 * a2 > a1 ? (BOOL v3 = a1 + 56 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1000327B0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1000195D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    sub_100019CFC();
    uint64_t result = sub_1000327B0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_10001969C(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

size_t sub_1000196C0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100019720(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

char *sub_1000196E0(char *a1, int64_t a2, char a3)
{
  size_t result = sub_1000198BC(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_100019700(char *a1, int64_t a2, char a3)
{
  size_t result = sub_1000199A8(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

size_t sub_100019720(size_t result, int64_t a2, char a3, uint64_t a4)
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
  sub_100005A10(&qword_1000410F8);
  uint64_t v10 = *(void *)(type metadata accessor for RunShortcutWidgetEntry(0) - 8);
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
  uint64_t v15 = *(void *)(type metadata accessor for RunShortcutWidgetEntry(0) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_100019148(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000193D0(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_1000198BC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  if (v9)
  {
    sub_100005A10(&qword_100041518);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100019278(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000194E8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_1000199A8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  if (v9)
  {
    sub_100005A10(&qword_100041530);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100019314(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000195D0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_100019A94(void *a1)
{
  id v1 = [a1 subtitle];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100032570();

  return v3;
}

uint64_t sub_100019AF8(void *a1)
{
  id v2 = [a1 associatedAppBundleIdentifier];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100032570();

  return v3;
}

uint64_t sub_100019B68(uint64_t a1)
{
  return a1;
}

uint64_t sub_100019BEC(uint64_t a1, unint64_t a2)
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

uint64_t sub_100019C44(void *a1)
{
  id v2 = [a1 PNGRepresentation];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100031CE0();

  return v3;
}

uint64_t sub_100019CBC(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

__n128 sub_100019CC8()
{
  *(void *)(v0 + 16) = v3;
  uint64_t v4 = v0 + 56 * v1;
  __n128 result = *(__n128 *)v2;
  long long v6 = *(_OWORD *)(v2 + 16);
  long long v7 = *(_OWORD *)(v2 + 32);
  *(void *)(v4 + 80) = *(void *)(v2 + 48);
  *(_OWORD *)(v4 + 48) = v6;
  *(_OWORD *)(v4 + 64) = v7;
  *(__n128 *)(v4 + 32) = result;
  return result;
}

double sub_100019D10()
{
  return sub_1000174BC(v0);
}

void *sub_100019D54@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, 8 * v2);
}

uint64_t sub_100019D90()
{
  return sub_1000327A0();
}

char *sub_100019DAC()
{
  return sub_1000196E0(0, v0 & ~(v0 >> 63), 0);
}

uint64_t sub_100019DD0()
{
  return sub_1000327B0();
}

char *sub_100019DF4@<X0>(unint64_t a1@<X8>)
{
  return sub_1000196E0((char *)(a1 > 1), v1, 1);
}

uint64_t sub_100019E2C()
{
  return v0;
}

unint64_t sub_100019E44()
{
  unint64_t result = qword_100041D60;
  if (!qword_100041D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D60);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShortcutsControl()
{
  return &type metadata for ShortcutsControl;
}

uint64_t sub_100019EA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100019EBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v81 = a1;
  sub_100032320();
  sub_100006A88();
  uint64_t v79 = v2;
  uint64_t v80 = v1;
  __chkstk_darwin(v1);
  sub_100009250();
  uint64_t v78 = v3;
  uint64_t v4 = sub_100032550();
  __chkstk_darwin(v4 - 8);
  sub_100009340();
  uint64_t v65 = v5;
  __chkstk_darwin(v6);
  uint64_t v77 = (char *)&v56 - v7;
  uint64_t v66 = sub_100031C30();
  sub_100006A88();
  uint64_t v83 = v8;
  __chkstk_darwin(v9);
  sub_10001BA90();
  uint64_t v11 = v10;
  uint64_t v12 = sub_100031D30();
  __chkstk_darwin(v12 - 8);
  sub_10001BA90();
  uint64_t v67 = sub_100031C50();
  sub_100006A88();
  uint64_t v64 = v13;
  __chkstk_darwin(v14);
  sub_100009340();
  uint64_t v70 = v15;
  __chkstk_darwin(v16);
  unint64_t v18 = (char *)&v56 - v17;
  uint64_t v59 = sub_100005A10(&qword_100041578);
  sub_100006A88();
  uint64_t v61 = v19;
  __chkstk_darwin(v20);
  sub_100005A10(&qword_100041580);
  sub_100006A88();
  uint64_t v68 = v21;
  uint64_t v69 = v22;
  __chkstk_darwin(v21);
  sub_100009250();
  uint64_t v82 = v23;
  sub_100005A10(&qword_100041588);
  sub_100006A88();
  uint64_t v71 = v24;
  uint64_t v72 = v25;
  __chkstk_darwin(v24);
  sub_100009250();
  uint64_t v60 = v26;
  sub_100005A10(&qword_100041590);
  sub_100006A88();
  uint64_t v73 = v27;
  uint64_t v74 = v28;
  __chkstk_darwin(v27);
  sub_100009250();
  uint64_t v62 = v29;
  sub_100005A10(&qword_100041598);
  sub_100006A88();
  uint64_t v75 = v30;
  uint64_t v76 = v31;
  __chkstk_darwin(v30);
  sub_100009250();
  uint64_t v63 = v32;
  swift_bridgeObjectRetain();
  sub_100005A10(&qword_1000415A0);
  sub_10001B658();
  uint64_t v33 = sub_100005B98(&qword_1000415B0);
  uint64_t v34 = sub_100009060(&qword_1000415B8, &qword_1000415B0);
  uint64_t v84 = v33;
  uint64_t v85 = v34;
  sub_10001BAA8();
  sub_100032480();
  sub_1000324E0();
  sub_100031D20();
  unsigned int v58 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  long long v35 = *(void (**)(void))(v83 + 104);
  v83 += 104;
  uint64_t v57 = (void (*)(uint64_t, void, uint64_t))v35;
  uint64_t v36 = v66;
  v35(v11);
  sub_10001BA34();
  sub_100031C60();
  uint64_t v37 = sub_100009060(&qword_1000415C0, &qword_100041578);
  uint64_t v38 = v59;
  sub_100032060();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v64 + 8);
  uint64_t v40 = v18;
  uint64_t v41 = v67;
  v39(v40, v67);
  sub_100009354();
  v42();
  sub_1000324E0();
  sub_100031D20();
  v57(v11, v58, v36);
  uint64_t v43 = v70;
  sub_10001BA34();
  sub_100031C60();
  uint64_t v84 = v38;
  uint64_t v85 = v37;
  uint64_t v44 = sub_10001BAA8();
  uint64_t v45 = v68;
  sub_100032050();
  v39(v43, v41);
  sub_100009354();
  v46();
  sub_100032310();
  uint64_t v84 = v45;
  uint64_t v85 = v44;
  uint64_t v47 = sub_10001BAA8();
  uint64_t v48 = v71;
  sub_100032040();
  sub_100009354();
  v49();
  sub_100009354();
  v50();
  uint64_t v84 = v48;
  uint64_t v85 = v47;
  uint64_t v51 = sub_10001BAA8();
  uint64_t v52 = v73;
  sub_100032030();
  sub_100009354();
  v53();
  uint64_t v84 = v52;
  uint64_t v85 = v51;
  sub_10001BAA8();
  sub_100032070();
  sub_100009354();
  return v54();
}

uint64_t sub_10001A610(uint64_t *a1)
{
  uint64_t v2 = sub_100005A10(&qword_1000415B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  v10[0] = v7;
  v10[1] = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  swift_retain_n();
  swift_retain_n();
  sub_100005A10(&qword_100040D18);
  sub_100009060(&qword_100040D10, &qword_100040D18);
  sub_100019E44();
  sub_100032330();
  sub_100009060(&qword_1000415B8, &qword_1000415B0);
  sub_100031FE0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_10001A7D8()
{
  sub_100031880();
  sub_100010154((uint64_t)v5, (uint64_t)v6);
  uint64_t v0 = sub_10001A8B4(v6);
  uint64_t v2 = v1;
  char v4 = v3;
  sub_100032290();
  sub_10001B728(v0, v2, v4);
}

void *sub_10001A8B4(uint64_t *a1)
{
  sub_100010154((uint64_t)a1, (uint64_t)&v22);
  sub_100010154((uint64_t)a1, (uint64_t)v23);
  if (!*(void *)&v23[0]) {
    return 0;
  }
  long long v25 = v23[0];
  long long v26 = v23[1];
  long long v27 = v23[2];
  uint64_t v28 = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100031820();
  if (v21)
  {
    uint64_t v2 = sub_100031CC0();
    unint64_t v4 = v3;
    swift_bridgeObjectRelease();
    if (v4 >> 60 != 15)
    {
      sub_100010350(0, &qword_1000410D8);
      sub_100010350(0, &qword_100041F40);
      uint64_t v8 = (void *)sub_1000326A0();
      sub_10001038C(v2, v4);
      if (v8)
      {
        self;
        uint64_t v9 = swift_dynamicCastObjCClass();
        if (!v9)
        {
          sub_10001028C(a1);
          sub_10001028C(a1);
          return v8;
        }
        uint64_t v10 = (void *)v9;
        uint64_t v11 = qword_100040B18;
        id v12 = v8;
        if (v11 != -1) {
          swift_once();
        }
        sub_100005A10(&qword_1000410D0);
        uint64_t v13 = swift_allocObject();
        *(_OWORD *)(v13 + 16) = xmmword_100035A30;
        id v14 = [v10 identifier];
        uint64_t v15 = sub_100032570();
        uint64_t v17 = v16;

        *(void *)(v13 + 32) = v15;
        *(void *)(v13 + 40) = v17;
        unint64_t v18 = sub_100030A18();
        swift_bridgeObjectRelease();
        if (v18 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v20 = sub_1000327A0();
          swift_bridgeObjectRelease();
          if (v20) {
            goto LABEL_18;
          }
        }
        else if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_18:
          sub_10001969C(0, (v18 & 0xC000000000000001) == 0, v18);
          if ((v18 & 0xC000000000000001) != 0) {
            sub_100032710();
          }
          else {
            id v19 = *(id *)(v18 + 32);
          }
          sub_10001028C(a1);
          sub_10001028C(a1);

          swift_bridgeObjectRelease();
          return v10;
        }
        sub_10001028C(a1);
        sub_10001028C(a1);

        swift_bridgeObjectRelease();
        return v8;
      }
    }
  }
  if (qword_100040B18 != -1) {
    swift_once();
  }
  id v5 = sub_1000162D8();
  if (v5)
  {
    id v6 = objc_allocWithZone((Class)WFConfiguredSystemWorkflowAction);
    uint64_t v8 = sub_10001B774(v5, 0, 0xF000000000000000);
    sub_10001028C(a1);
    sub_10001028C(a1);
  }
  else
  {
    sub_10001028C(a1);
    sub_10001028C(a1);
    return 0;
  }
  return v8;
}

uint64_t sub_10001AC84@<X0>(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  sub_10001ACDC(a1, a2, a3);
  sub_1000090A4();
  uint64_t result = sub_100032130();
  *(void *)a4 = result;
  *(void *)(a4 + 8) = v6;
  *(unsigned char *)(a4 + 16) = v7 & 1;
  *(void *)(a4 + 24) = v8;
  return result;
}

uint64_t sub_10001ACDC(void *a1, void *a2, char a3)
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = a2;
      id v5 = [v4 name];
      uint64_t v6 = sub_100032570();

      return v6;
    }
    else
    {
      NSString v11 = sub_10001BA6C();
      NSString v12 = sub_10001BA6C();
      id v13 = sub_100031508(v11);

      uint64_t v14 = sub_100032570();
      return v14;
    }
  }
  else
  {
    id v9 = [a1 name];
    uint64_t v10 = sub_100032570();

    sub_10001B728(a1, a2, 0);
    return v10;
  }
}

uint64_t sub_10001ADF8(void *a1, void *a2, char a3)
{
  if (!a3)
  {
    id v6 = a1;
    id v7 = [v6 previewIcon];
    self;
    uint64_t v8 = sub_10001BAC0();
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = v7;
      id v11 = [v9 bundleIdentifier];
      sub_100032570();

      id v12 = sub_10001B330();
      swift_bridgeObjectRelease();
      if (v12)
      {
        id v13 = [self mainScreen];
        [v13 scale];

        id v14 = [v6 name];
LABEL_21:
        id v36 = v14;
        sub_100032570();

        sub_1000090A4();
        sub_100032130();
        uint64_t v37 = sub_100032280();

        sub_10001BA50();
        return v37;
      }
    }
    self;
    uint64_t v15 = sub_10001BAC0();
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      id v17 = v7;
      id v18 = [v16 symbolName];
      sub_100032570();

      uint64_t v19 = sub_100032270();
      sub_10001BA50();
      return v19;
    }
    self;
    uint64_t v20 = sub_10001BAC0();
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      uint64_t v22 = self;
      id v23 = v7;
      LOWORD(v21) = (unsigned __int16)[v21 glyph];
      id v24 = objc_allocWithZone((Class)WFWorkflowIcon);
      id v25 = sub_10001B804(9, (unsigned __int16)v21, 0, 0xF000000000000000);
      id v26 = [self mainScreen];
      [v26 scale];
      double v28 = v27;

      id v29 = [self whiteColor];
      id v30 = [v22 imageWithIcon:v25 size:v29 scale:0 padding:40.0 glyphColor:v28 background:0.0];

      if (v30)
      {
        uint64_t v19 = sub_1000326B0();

        sub_10001BA50();
        return v19;
      }
    }
    self;
    uint64_t v31 = sub_10001BAC0();
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      id v10 = v7;
      id v33 = [v32 image];
      id v34 = [v33 CGImage];

      if (v34)
      {
        id v35 = [v32 image];
        [v35 scale];

        id v14 = [v6 name];
        goto LABEL_21;
      }
    }
    sub_1000326F0(31);
    swift_bridgeObjectRelease();
    id v38 = [v7 description];
    uint64_t v39 = sub_100032570();
    uint64_t v41 = v40;

    v43._countAndFlagsBits = v39;
    v43._object = v41;
    sub_1000325B0(v43);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100032790();
    __break(1u);
    return result;
  }
  if (a3 == 1)
  {
    id v3 = a2;
    uint64_t v4 = sub_10001B45C(v3);

    return v4;
  }
  else
  {
    return sub_100032270();
  }
}

id sub_10001B330()
{
  id v0 = [self mainScreen];
  [v0 scale];
  double v2 = v1;

  id v3 = [objc_allocWithZone((Class)ISImageDescriptor) initWithSize:40.0 scale:40.0];
  [v3 setShouldApplyMask:0];
  sub_100010350(0, &qword_100041540);
  swift_bridgeObjectRetain();
  id v4 = sub_10001733C();
  id v5 = [v4 prepareImageForDescriptor:v3];
  id v6 = [v5 CGImage];

  return v6;
}

uint64_t sub_10001B45C(void *a1)
{
  sub_10001B898(a1);
  if (v2 && (id v3 = sub_10001B330(), swift_bridgeObjectRelease(), v3))
  {
    id v4 = [self mainScreen];
    [v4 scale];

    id v5 = [a1 name];
    sub_100032570();

    sub_1000090A4();
    sub_100032130();
    return sub_100032280();
  }
  else
  {
    id v7 = [a1 icon];
    id v8 = [v7 icon];

    self;
    id v9 = (void *)swift_dynamicCastObjCClass();
    if (v9)
    {
      id v10 = [v9 symbolName];

      sub_100032570();
    }
    else
    {
    }
    return sub_100032270();
  }
}

unint64_t sub_10001B658()
{
  unint64_t result = qword_1000415A8;
  if (!qword_1000415A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000415A8);
  }
  return result;
}

uint64_t sub_10001B6A4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001B6E4()
{
}

uint64_t sub_10001B6EC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001AC84(*(void **)(v1 + 16), *(void **)(v1 + 24), *(unsigned char *)(v1 + 32), a1);
}

uint64_t sub_10001B6F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001ADF8(*(void **)(v1 + 16), *(void **)(v1 + 24), *(unsigned char *)(v1 + 32));
  *a1 = result;
  return result;
}

void sub_10001B728(void *a1, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }

    a1 = a2;
  }
}

id sub_10001B774(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100031CD0().super.isa;
    sub_10001038C(a2, a3);
  }
  id v8 = [v3 initWithWorkflow:a1 shortcutsMetadata:isa];

  return v8;
}

id sub_10001B804(uint64_t a1, unsigned __int16 a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100031CD0().super.isa;
    sub_10001038C(a3, a4);
  }
  id v10 = [v4 initWithPaletteColor:a1 glyphCharacter:a2 customImageData:isa];

  return v10;
}

uint64_t sub_10001B898(void *a1)
{
  id v1 = [a1 associatedAppBundleIdentifier];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100032570();

  return v3;
}

uint64_t sub_10001B8FC()
{
  return sub_100009374();
}

void sub_10001BA50()
{
  sub_10001B728(v1, v0, 0);
}

NSString sub_10001BA6C()
{
  return sub_100032560();
}

uint64_t sub_10001BAA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001BAC0()
{
  return swift_dynamicCastObjCClass();
}

char *sub_10001BAD8(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    id v7 = *a2;
    *(void *)a1 = *a2;
    a1 = &v7[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100031D40();
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      id v8 = *a2;
      id v9 = a2[1];
      *(void *)a1 = v8;
      *((void *)a1 + 1) = v9;
      id v10 = v8;
      id v11 = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_10001BBDC(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100031D40();
    uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    v3(a1, v2);
  }
  else
  {

    id v4 = *(void **)(a1 + 8);
  }
}

void *sub_10001BC74(void *a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100031D40();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    int v5 = *(void **)a2;
    uint64_t v6 = *(void **)(a2 + 8);
    *a1 = v5;
    a1[1] = v6;
    id v7 = v5;
    id v8 = v6;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_10001BD28(void **a1, void **a2)
{
  if (a1 != a2)
  {
    sub_10001BDF4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_100031D40();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      int v5 = *a2;
      *a1 = *a2;
      uint64_t v6 = a2[1];
      a1[1] = v6;
      id v7 = v5;
      id v8 = v6;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10001BDF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WidgetSStackView.Content(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for WidgetSStackView.Content(uint64_t a1)
{
  return sub_10000D764(a1, qword_100041638);
}

void *sub_10001BE70(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100031D40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10001BF28(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001BDF4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100031D40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10001BFF0()
{
  uint64_t result = sub_100031D40();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_10001C084(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    id v8 = *a2;
    *(void *)a1 = *a2;
    a1 = &v8[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    type metadata accessor for WidgetSStackView.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100031D40();
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      id v9 = *a2;
      id v10 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v10;
      id v11 = v9;
      id v12 = v10;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 20);
    id v14 = &a1[v13];
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100031D40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_10001C1E4(id *a1, uint64_t a2)
{
  type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100031D40();
    (*(void (**)(id *, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
  }
  int v5 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100031D40();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_10001C2BC(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100031D40();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    uint64_t v7 = *(void **)a2;
    id v8 = *(void **)(a2 + 8);
    *a1 = *(void *)a2;
    a1[1] = v8;
    id v9 = v7;
    id v10 = v8;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 20);
  id v12 = (char *)a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100031D40();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

void **sub_10001C3CC(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001BDF4((uint64_t)a1);
    type metadata accessor for WidgetSStackView.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100031D40();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v7 = *a2;
      *a1 = *a2;
      id v8 = a2[1];
      a1[1] = v8;
      id v9 = v7;
      id v10 = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 20);
  id v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100031D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

char *sub_10001C4F4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100031D40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  id v9 = &a1[v8];
  id v10 = &a2[v8];
  uint64_t v11 = sub_100031D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_10001C600(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001BDF4((uint64_t)a1);
    uint64_t v6 = type metadata accessor for WidgetSStackView.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100031D40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  id v9 = &a1[v8];
  id v10 = &a2[v8];
  uint64_t v11 = sub_100031D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10001C71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001C730);
}

uint64_t sub_10001C730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001D730();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    uint64_t v8 = sub_100031D40();
    uint64_t v9 = v4 + *(int *)(a3 + 20);
  }

  return sub_100006148(v9, v3, v8);
}

uint64_t sub_10001C79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001C7B0);
}

uint64_t sub_10001C7B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_10001D730();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }
  else
  {
    uint64_t v10 = sub_100031D40();
    uint64_t v11 = v5 + *(int *)(a4 + 20);
  }

  return sub_100005A54(v11, v4, v4, v10);
}

uint64_t type metadata accessor for WidgetSStackView(uint64_t a1)
{
  return sub_10000D764(a1, qword_1000416C8);
}

uint64_t sub_10001C844()
{
  uint64_t result = type metadata accessor for WidgetSStackView.Content(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100031D40();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001C90C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001C928()
{
  uint64_t v1 = type metadata accessor for WidgetSStackView(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D64C(v0, (uint64_t)v4, (void (*)(void))type metadata accessor for WidgetSStackView);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10001D2C0((uint64_t)v4, v6 + v5);
  sub_10001D64C(v0, (uint64_t)v4, (void (*)(void))type metadata accessor for WidgetSStackView);
  uint64_t v7 = swift_allocObject();
  sub_10001D2C0((uint64_t)v4, v7 + v5);
  sub_100005A10(&qword_100041700);
  sub_100005A10(&qword_100041708);
  sub_10001D524();
  uint64_t v8 = sub_100031DC0();
  unint64_t v9 = sub_10001D5FC();
  v11[0] = v8;
  v11[1] = v9;
  swift_getOpaqueTypeConformance2();
  return sub_100031D50();
}

uint64_t sub_10001CB10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v35 = a2;
  uint64_t v33 = sub_100031DC0();
  uint64_t v30 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100005A10(&qword_100041708);
  uint64_t v4 = *(void *)(v34 - 8);
  uint64_t v5 = __chkstk_darwin(v34);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v31 = (char *)&v28 - v8;
  uint64_t v9 = sub_100031D40();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005A10(&qword_100041730);
  __chkstk_darwin(v13);
  uint64_t v15 = (uint64_t (**)@<X0>(uint64_t@<X8>))((char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = type metadata accessor for WidgetSStackView.Content(0);
  __chkstk_darwin(v16);
  id v18 = (_OWORD *)((char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001D64C(v32, (uint64_t)v18, (void (*)(void))type metadata accessor for WidgetSStackView.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = *(void (**)(char *, _OWORD *, uint64_t))(v10 + 32);
    double v28 = v12;
    uint64_t v29 = v9;
    v19(v12, v18, v9);
    sub_100031DB0();
    unint64_t v20 = sub_10001D5FC();
    uint64_t v21 = v33;
    sub_1000322B0();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v21);
    uint64_t v22 = v31;
    id v23 = v7;
    uint64_t v24 = v34;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v31, v23, v34);
    (*(void (**)(uint64_t (**)@<X0>(uint64_t@<X8>), char *, uint64_t))(v4 + 16))(v15, v22, v24);
    swift_storeEnumTagMultiPayload();
    sub_100005A10(&qword_100041720);
    sub_100009060(&qword_100041718, &qword_100041720);
    uint64_t v36 = v21;
    unint64_t v37 = v20;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v22, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v28, v29);
  }
  else
  {
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = *v18;
    *uint64_t v15 = sub_10001D6EC;
    v15[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v26;
    swift_storeEnumTagMultiPayload();
    sub_100005A10(&qword_100041720);
    sub_100009060(&qword_100041718, &qword_100041720);
    unint64_t v27 = sub_10001D5FC();
    uint64_t v36 = v33;
    unint64_t v37 = v27;
    swift_getOpaqueTypeConformance2();
    return sub_100031FD0();
  }
}

uint64_t sub_10001CFF0@<X0>(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X8>)
{
  v17[1] = a3;
  uint64_t v5 = sub_100031D80();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100031D70();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (void *)((char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v13 = a1;
  sub_100031E90();
  *id v12 = v14;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, enum case for IconSize.sstack(_:), v9);
  *(void *)uint64_t v8 = a2;
  v8[8] = 1;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for IconView.DisplayMode.customColor(_:), v5);
  id v15 = a2;
  return sub_100031DA0();
}

uint64_t sub_10001D1B8()
{
  uint64_t v0 = sub_100031DC0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031DB0();
  type metadata accessor for WidgetSStackView(0);
  sub_10001D5FC();
  sub_1000322B0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001D2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetSStackView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D324()
{
  return sub_10001D4A0((uint64_t (*)(uint64_t))sub_10001CB10);
}

uint64_t sub_10001D340()
{
  uint64_t v1 = type metadata accessor for WidgetSStackView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = (id *)(v0 + v3);
  type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100031D40();
    sub_100006AA4();
    (*(void (**)(uint64_t))(v6 + 8))(v0 + v3);
  }
  else
  {
  }
  uint64_t v7 = (char *)v5 + *(int *)(v1 + 20);
  sub_100031D40();
  sub_100006AA4();
  (*(void (**)(char *))(v8 + 8))(v7);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10001D488()
{
  return sub_10001D4A0((uint64_t (*)(uint64_t))sub_10001D1B8);
}

uint64_t sub_10001D4A0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for WidgetSStackView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_10001D524()
{
  unint64_t result = qword_100041710;
  if (!qword_100041710)
  {
    sub_100005B98(&qword_100041700);
    sub_100009060(&qword_100041718, &qword_100041720);
    sub_100031DC0();
    sub_10001D5FC();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041710);
  }
  return result;
}

unint64_t sub_10001D5FC()
{
  unint64_t result = qword_100041728;
  if (!qword_100041728)
  {
    sub_100031DC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041728);
  }
  return result;
}

uint64_t sub_10001D64C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100006AA4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_10001D6AC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001D6EC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001CFF0(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_10001D6F4()
{
  return sub_100009060(&qword_100041738, &qword_100041740);
}

uint64_t sub_10001D730()
{
  return type metadata accessor for WidgetSStackView.Content(0);
}

uint64_t sub_10001D764()
{
  uint64_t v0 = sub_100032550();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100005A10((uint64_t *)&unk_100041F00);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100031C30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100031D30();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100031C50();
  __chkstk_darwin(v9);
  uint64_t v10 = sub_100031AC0();
  sub_100015DDC(v10, qword_100045850);
  sub_100015DA4(v10, (uint64_t)qword_100045850);
  sub_1000324E0();
  sub_100031D20();
  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  sub_100031C60();
  sub_100005A54((uint64_t)v3, 1, 1, v9);
  return sub_100031AB0();
}

uint64_t sub_10001DA10()
{
  uint64_t v0 = sub_100005A10(&qword_100041538);
  __chkstk_darwin(v0 - 8);
  uint64_t v65 = (uint64_t)v49 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100032550();
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v57 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  unsigned int v58 = (char *)v49 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v52 = (char *)v49 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  char v55 = (char *)v49 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v62 = (uint64_t)v49 - v12;
  __chkstk_darwin(v11);
  uint64_t v13 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v56 = (char *)v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v53 = (char *)v49 - v17;
  __chkstk_darwin(v16);
  uint64_t v50 = (char *)v49 - v18;
  uint64_t v19 = sub_100031C30();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100031D30();
  __chkstk_darwin(v23 - 8);
  uint64_t v64 = sub_100031C50();
  uint64_t v24 = __chkstk_darwin(v64);
  uint64_t v51 = (char *)v49 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v49[1] = (char *)v49 - v27;
  __chkstk_darwin(v26);
  v49[0] = (char *)v49 - v28;
  sub_100005A10(&qword_100041810);
  uint64_t v29 = sub_100005A10(&qword_100041818);
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(void *)(v30 + 72);
  uint64_t v61 = v29 - 8;
  uint64_t v63 = v31;
  unint64_t v32 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v33 = swift_allocObject();
  uint64_t v54 = v33;
  *(_OWORD *)(v33 + 16) = xmmword_100035B10;
  unint64_t v34 = v33 + v32;
  *(unsigned char *)(v33 + v32) = 0;
  sub_1000324E0();
  sub_100031D20();
  uint64_t v35 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 104);
  uint64_t v59 = v19;
  v36(v22, enum case for LocalizedStringResource.BundleDescription.main(_:), v19);
  uint64_t v60 = v36;
  sub_100031C60();
  sub_1000324E0();
  sub_100031D20();
  uint64_t v37 = v35;
  v36(v22, v35, v19);
  uint64_t v38 = (uint64_t)v50;
  sub_100031C60();
  sub_100005A54(v38, 0, 1, v64);
  uint64_t v62 = sub_100031980();
  sub_100005A54(v65, 1, 1, v62);
  sub_100031990();
  *(unsigned char *)(v34 + v63) = 1;
  sub_1000324E0();
  sub_100031D20();
  uint64_t v39 = v35;
  uint64_t v41 = v59;
  uint64_t v40 = v60;
  v60(v22, v39, v59);
  sub_100031C60();
  sub_1000324E0();
  sub_100031D20();
  v40(v22, v37, v41);
  uint64_t v42 = (uint64_t)v53;
  sub_100031C60();
  sub_100005A54(v42, 0, 1, v64);
  sub_100005A54(v65, 1, 1, v62);
  sub_100031990();
  *(unsigned char *)(v34 + 2 * v63) = 2;
  sub_1000324E0();
  sub_100031D20();
  uint64_t v43 = v37;
  uint64_t v44 = v37;
  uint64_t v45 = v59;
  uint64_t v46 = v60;
  v60(v22, v44, v59);
  sub_100031C60();
  sub_1000324E0();
  sub_100031D20();
  v46(v22, v43, v45);
  uint64_t v47 = (uint64_t)v56;
  sub_100031C60();
  sub_100005A54(v47, 0, 1, v64);
  sub_100005A54(v65, 1, 1, v62);
  sub_100031990();
  sub_1000319A0();
  sub_10001EDE4();
  uint64_t result = sub_1000324B0();
  qword_100045868 = result;
  return result;
}

uint64_t *sub_10001E290()
{
  if (qword_100040AA8 != -1) {
    swift_once();
  }
  return &qword_100045868;
}

uint64_t sub_10001E2DC()
{
  uint64_t v0 = sub_100005A10(&qword_100041820);
  sub_100015DDC(v0, qword_100045870);
  sub_100015DA4(v0, (uint64_t)qword_100045870);
  sub_100005A10(&qword_100041828);
  uint64_t v1 = *(void *)(sub_100005A10(&qword_100041830) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100035B10;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_10001E844();
  sub_1000319B0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_1000319B0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_1000319B0();
  sub_100005A10(&qword_100041838);
  sub_10001EDE4();
  sub_1000324B0();
  return sub_1000319C0();
}

uint64_t sub_10001E4CC()
{
  if (qword_100040AB0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100005A10(&qword_100041820);

  return sub_100015DA4(v0, (uint64_t)qword_100045870);
}

uint64_t sub_10001E534(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10003DD28;
  v6._object = a2;
  unint64_t v4 = sub_1000327C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001E580(char a1)
{
  return *(void *)&aRoot_1[8 * a1];
}

uint64_t sub_10001E5A0(char *a1, char *a2)
{
  return sub_100030B80(*a1, *a2);
}

unint64_t sub_10001E5B0()
{
  unint64_t result = qword_100041748;
  if (!qword_100041748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041748);
  }
  return result;
}

Swift::Int sub_10001E5FC()
{
  return sub_10001E604();
}

Swift::Int sub_10001E604()
{
  return sub_10001E6F4();
}

Swift::Int sub_10001E610()
{
  return sub_10001E75C();
}

uint64_t sub_10001E61C()
{
  return sub_10001E698();
}

uint64_t sub_10001E624()
{
  sub_1000325A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001E698()
{
  sub_1000325A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001E6EC()
{
  return sub_10001E6F4();
}

Swift::Int sub_10001E6F4()
{
  return sub_100032880();
}

Swift::Int sub_10001E75C()
{
  return sub_100032880();
}

uint64_t sub_10001E7E4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001E534(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10001E814@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001E580(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10001E844()
{
  unint64_t result = qword_100041750;
  if (!qword_100041750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041750);
  }
  return result;
}

unint64_t sub_10001E894()
{
  unint64_t result = qword_100041758;
  if (!qword_100041758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041758);
  }
  return result;
}

uint64_t sub_10001E8E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001E4CC();
  uint64_t v3 = sub_100005A10(&qword_100041820);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

unint64_t sub_10001E958()
{
  unint64_t result = qword_100041760;
  if (!qword_100041760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041760);
  }
  return result;
}

unint64_t sub_10001E9A8()
{
  unint64_t result = qword_100041768;
  if (!qword_100041768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041768);
  }
  return result;
}

unint64_t sub_10001E9F8()
{
  unint64_t result = qword_100041770;
  if (!qword_100041770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041770);
  }
  return result;
}

void *sub_10001EA44()
{
  return &protocol witness table for String;
}

uint64_t sub_10001EA50()
{
  sub_10001FC5C();
  uint64_t v2 = sub_100031950();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10001FCA8(v3, v0, v2, v1);
}

unint64_t sub_10001EAE8()
{
  unint64_t result = qword_100041780;
  if (!qword_100041780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041780);
  }
  return result;
}

unint64_t sub_10001EB38()
{
  unint64_t result = qword_100041788;
  if (!qword_100041788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041788);
  }
  return result;
}

unint64_t sub_10001EB88()
{
  unint64_t result = qword_100041790;
  if (!qword_100041790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041790);
  }
  return result;
}

unint64_t sub_10001EBD8()
{
  unint64_t result = qword_100041798;
  if (!qword_100041798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041798);
  }
  return result;
}

uint64_t sub_10001EC24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001F150(&qword_100040AA0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100045850);
  uint64_t v3 = sub_100031AC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10001ECC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F7F0(a1, a2, a3, (void (*)(void))sub_10001E844);
}

uint64_t sub_10001ECF4(uint64_t a1)
{
  unint64_t v2 = sub_10001E844();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001ED44()
{
  unint64_t result = qword_1000417A0;
  if (!qword_1000417A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417A0);
  }
  return result;
}

unint64_t sub_10001ED94()
{
  unint64_t result = qword_1000417A8;
  if (!qword_1000417A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417A8);
  }
  return result;
}

unint64_t sub_10001EDE4()
{
  unint64_t result = qword_1000417B0;
  if (!qword_1000417B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417B0);
  }
  return result;
}

uint64_t sub_10001EE30()
{
  sub_10001E290();

  return swift_bridgeObjectRetain();
}

uint64_t sub_10001EE60(uint64_t a1)
{
  unint64_t v2 = sub_10001EBD8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001EEB0()
{
  unint64_t result = qword_1000417B8;
  if (!qword_1000417B8)
  {
    sub_100005B98(&qword_1000417C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417B8);
  }
  return result;
}

void sub_10001EF04(void *a1@<X8>)
{
  *a1 = &off_10003DD90;
}

unint64_t sub_10001EF18()
{
  unint64_t result = qword_1000417C8;
  if (!qword_1000417C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417C8);
  }
  return result;
}

uint64_t sub_10001EF64()
{
  uint64_t v0 = sub_100031C30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100031D30();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100032550();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100031C50();
  sub_100015DDC(v6, qword_100045888);
  sub_100015DA4(v6, (uint64_t)qword_100045888);
  sub_1000324E0();
  sub_100031D20();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100031C60();
}

uint64_t sub_10001F150(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return sub_100015DA4(v5, a3);
}

uint64_t sub_10001F1AC()
{
  sub_100031880();
  return v1;
}

uint64_t sub_10001F1E0()
{
  return sub_100031890();
}

uint64_t sub_10001F214()
{
  sub_100031A60();
  sub_100006A88();
  uint64_t v32 = v1;
  uint64_t v33 = v0;
  __chkstk_darwin(v0);
  sub_100005BF8();
  uint64_t v31 = v3 - v2;
  uint64_t v4 = sub_100005A10(&qword_100040B28);
  uint64_t v5 = sub_10000927C(v4);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v30 = (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v11 = sub_10000927C(v10);
  __chkstk_darwin(v11);
  sub_100005BF8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_100031C30();
  sub_100006A88();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_100005BF8();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_100031D30();
  uint64_t v23 = sub_10000927C(v22);
  __chkstk_darwin(v23);
  sub_100005BF8();
  uint64_t v24 = sub_100032550();
  uint64_t v25 = sub_10000927C(v24);
  __chkstk_darwin(v25);
  sub_100005BF8();
  uint64_t v26 = sub_100031C50();
  __chkstk_darwin(v26);
  sub_100005BF8();
  sub_1000324E0();
  sub_100005A10(&qword_1000417F0);
  sub_100031D20();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v21, enum case for LocalizedStringResource.BundleDescription.main(_:), v15);
  sub_100031C60();
  sub_100005A54(v14, 1, 1, v26);
  char v34 = 3;
  uint64_t v27 = sub_100031800();
  sub_100005A54((uint64_t)v9, 1, 1, v27);
  sub_100005A54(v30, 1, 1, v27);
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v31, enum case for InputConnectionBehavior.default(_:), v33);
  sub_10001E844();
  return sub_1000318B0();
}

uint64_t sub_10001F580@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001F1AC();
  *a1 = result;
  return result;
}

uint64_t sub_10001F5AC()
{
  return sub_10001F1E0();
}

void (*sub_10001F5B8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100031870();
  return sub_10001F614;
}

void sub_10001F614(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10001F664()
{
  unint64_t result = qword_1000417D0;
  if (!qword_1000417D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417D0);
  }
  return result;
}

uint64_t sub_10001F6B0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001FBC4();
  unint64_t v5 = sub_10001FC5C();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10001F728()
{
  unint64_t result = qword_1000417D8;
  if (!qword_1000417D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417D8);
  }
  return result;
}

unint64_t sub_10001F778()
{
  unint64_t result = qword_1000417E0;
  if (!qword_1000417E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417E0);
  }
  return result;
}

uint64_t sub_10001F7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F7F0(a1, a2, a3, (void (*)(void))sub_10001F664);
}

uint64_t sub_10001F7F0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001F838@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001F150(&qword_100040AB8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100045888);
  uint64_t v3 = sub_100031C50();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10001F8DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10001FBC4();
  unint64_t v6 = sub_10001FC10();
  unint64_t v7 = sub_10001FC5C();
  *unint64_t v4 = v2;
  v4[1] = sub_100015980;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10001F9A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001F214();
  *a1 = result;
  return result;
}

uint64_t sub_10001F9D0(uint64_t a1)
{
  unint64_t v2 = sub_10001F664();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenShortcutsStaticDeepLinks()
{
  return &type metadata for OpenShortcutsStaticDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for ShortcutsStaticDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShortcutsStaticDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ShortcutsStaticDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001FB7CLL);
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

uint64_t sub_10001FBA4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001FBAC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShortcutsStaticDeepLinks()
{
  return &type metadata for ShortcutsStaticDeepLinks;
}

unint64_t sub_10001FBC4()
{
  unint64_t result = qword_1000417F8;
  if (!qword_1000417F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417F8);
  }
  return result;
}

unint64_t sub_10001FC10()
{
  unint64_t result = qword_100041800;
  if (!qword_100041800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041800);
  }
  return result;
}

unint64_t sub_10001FC5C()
{
  unint64_t result = qword_100041808;
  if (!qword_100041808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041808);
  }
  return result;
}

uint64_t sub_10001FCA8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_10001FCC0()
{
  unint64_t result = qword_100041880;
  if (!qword_100041880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041880);
  }
  return result;
}

uint64_t sub_10001FD0C()
{
  uint64_t v0 = sub_100031CB0();
  sub_100006A88();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031820();
  uint64_t v6 = sub_100031C80();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  return v6;
}

void sub_10001FDC8()
{
  sub_100023CD4();
  uint64_t v3 = sub_100005A10(&qword_100041948);
  uint64_t v4 = sub_10000927C(v3);
  __chkstk_darwin(v4);
  sub_100009264();
  uint64_t v5 = sub_100031BD0();
  sub_100006A88();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_10000AB4C();
  sub_100031B40();
  if (sub_100006148(v0, 1, v5) == 1)
  {
    sub_100031CB0();
    sub_100006AA4();
    uint64_t v9 = sub_100023CEC();
    v10(v9);
    sub_100006978(v0, &qword_100041948);
    goto LABEL_24;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1, v0, v5);
  uint64_t v12 = sub_100031BA0();
  uint64_t v13 = v11;
  if (qword_100040AD8 == -1)
  {
    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
    swift_once();
    if (!v13) {
      goto LABEL_23;
    }
  }
  if (v12 == qword_100041840 && v13 == *(void *)algn_100041848)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_1000327E0();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_23;
    }
  }
  uint64_t v17 = sub_100031B60();
  uint64_t v18 = v16;
  if (qword_100040AE0 == -1)
  {
    if (v16) {
      goto LABEL_14;
    }
LABEL_23:
    sub_100031CB0();
    sub_100006AA4();
    uint64_t v22 = sub_100023CEC();
    v23(v22);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
    goto LABEL_24;
  }
  swift_once();
  if (!v18) {
    goto LABEL_23;
  }
LABEL_14:
  if (v17 == qword_100041850 && v18 == *(void *)algn_100041858)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = sub_1000327E0();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      goto LABEL_23;
    }
  }
  sub_100031B80();
  sub_1000090A4();
  uint64_t v21 = (void *)sub_1000326E0();
  swift_bridgeObjectRelease();
  if (v21[2] < 2uLL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v24 = v21[10];
  unint64_t v25 = v21[11];
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_100032580();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  if (v21[2])
  {
    unint64_t v25 = v21[4];
    unint64_t v38 = v21[5];
    uint64_t v2 = v21[6];
    uint64_t v24 = v21[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (qword_100040AE8 == -1) {
      goto LABEL_27;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_27:
  if (sub_100023788(qword_100041860, *(unint64_t *)algn_100041868, v25, v38, v2, v24))
  {
    swift_bridgeObjectRelease();
    sub_1000213CC(v26, v28);
    sub_100031CB0();
    sub_100006AA4();
    uint64_t v29 = sub_100023CEC();
    v30(v29);
    uint64_t v31 = sub_100023D9C();
    v32(v31);
  }
  else
  {
    if (qword_100040AF0 != -1) {
      swift_once();
    }
    char v33 = sub_100023788(qword_100041870, *(unint64_t *)algn_100041878, v25, v38, v2, v24);
    swift_bridgeObjectRelease();
    sub_100031CB0();
    sub_100006AA4();
    uint64_t v34 = sub_100023CEC();
    v35(v34);
    uint64_t v36 = sub_100023D9C();
    v37(v36);
    if ((v33 & 1) == 0) {
      swift_bridgeObjectRelease();
    }
  }
LABEL_24:
  sub_100023D28();
}

uint64_t sub_100020284()
{
  uint64_t v28 = sub_1000324D0();
  uint64_t v26 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v1 = (char *)v21 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100032530();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100005A10((uint64_t *)&unk_100041F00);
  __chkstk_darwin(v3 - 8);
  uint64_t v27 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031C30();
  uint64_t v22 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100031D30();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100032550();
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v24 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v25 = sub_100031C50();
  __chkstk_darwin(v25);
  uint64_t v13 = sub_100031AC0();
  sub_100015DDC(v13, qword_1000458A0);
  uint64_t v23 = sub_100015DA4(v13, (uint64_t)qword_1000458A0);
  sub_1000324E0();
  sub_100031D20();
  uint64_t v14 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v15 = v6 + 104;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v21[1] = v15;
  v16(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  sub_100031C60();
  sub_100032520();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_100032510(v29);
  uint64_t v17 = v26;
  uint64_t v18 = v28;
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v1, enum case for String.LocalizationValue.Placeholder.int(_:), v28);
  sub_100023624();
  sub_1000324F0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v1, v18);
  v30._countAndFlagsBits = 0x737265646C6F6620;
  v30._object = (void *)0xE800000000000000;
  sub_100032510(v30);
  sub_100032540();
  sub_100031D20();
  v16(v8, v14, v22);
  uint64_t v19 = (uint64_t)v27;
  sub_100031C60();
  sub_100005A54(v19, 0, 1, v25);
  return sub_100031AB0();
}

uint64_t sub_10002072C()
{
  if (qword_100040AC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031AC0();

  return sub_100015DA4(v0, (uint64_t)qword_1000458A0);
}

void sub_100020790()
{
  sub_100023CD4();
  uint64_t v3 = v2;
  uint64_t v28 = v4;
  uint64_t v5 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v6 = sub_10000927C(v5);
  __chkstk_darwin(v6);
  sub_100023D5C();
  uint64_t v7 = sub_100031C50();
  sub_100006AA4();
  __chkstk_darwin(v8);
  sub_10000AB4C();
  uint64_t v9 = sub_100032530();
  uint64_t v10 = sub_10000927C(v9);
  __chkstk_darwin(v10);
  uint64_t v11 = sub_100005A10(&qword_100041538);
  uint64_t v12 = sub_10000927C(v11);
  __chkstk_darwin(v12);
  sub_100023D40();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v25 - v17;
  uint64_t v19 = sub_100031980();
  sub_100005A54((uint64_t)v18, 1, 1, v19);
  sub_100031820();
  if ((uint64_t)v29._object)
  {
LABEL_9:
    sub_100032520();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_100032510(v30);
    sub_100031820();
    sub_100032500(v29);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 0;
    v31._object = (void *)0xE000000000000000;
    sub_100032510(v31);
    sub_100031C40();
    sub_100005A54(v0, 1, 1, v7);
    sub_10000691C((uint64_t)v18, v1, &qword_100041538);
    sub_100031990();
    sub_100006978((uint64_t)v18, &qword_100041538);
    sub_100023D28();
    return;
  }
  uint64_t v27 = v3;
  if (v29._countAndFlagsBits < 0)
  {
    __break(1u);
  }
  else if (!((unint64_t)v29._countAndFlagsBits >> 16))
  {
    uint64_t v26 = v7;
    id v20 = (id)WFSystemImageNameForOutlineGlyphCharacter();
    if (v20 && (uint64_t v21 = v20, sub_100032570(), v23 = v22, v21, v23))
    {
      swift_bridgeObjectRetain();
      sub_100031960();
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 1;
    }
    uint64_t v7 = v26;
    sub_100005A54((uint64_t)v16, v24, 1, v19);
    sub_100006978((uint64_t)v18, &qword_100041538);
    swift_bridgeObjectRelease();
    sub_1000237F0((uint64_t)v16, (uint64_t)v18);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_100020A70()
{
  if (qword_100040B18 != -1) {
    swift_once();
  }
  qword_1000458B8 = qword_100045948;

  return swift_retain();
}

uint64_t *sub_100020AD4()
{
  if (qword_100040AC8 != -1) {
    swift_once();
  }
  return &qword_1000458B8;
}

void sub_100020B20()
{
  sub_100023CD4();
  uint64_t v0 = sub_100031CB0();
  sub_100006A88();
  uint64_t v2 = v1;
  uint64_t v4 = __chkstk_darwin(v3);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v17 - v5;
  id v7 = (id)WFLocalizedAllShortcutsString();
  uint64_t v8 = sub_100032570();
  uint64_t v10 = v9;

  uint64_t v11 = sub_100020C9C();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100020F20();
  sub_100023DD4();
  v16();
  sub_100031830();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v0);
  v17[0] = v8;
  v17[1] = v10;
  sub_100031830();
  sub_100023DE0(61573);
  swift_release();
  swift_release();
  swift_release();
  qword_1000458C0 = v11;
  *(void *)algn_1000458C8 = v13;
  qword_1000458D0 = v15;
  sub_100023D28();
}

uint64_t sub_100020C9C()
{
  uint64_t v0 = sub_100031CB0();
  sub_100006A88();
  uint64_t v2 = v1;
  uint64_t v4 = __chkstk_darwin(v3);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - v5;
  uint64_t v7 = sub_100031C50();
  uint64_t v8 = sub_10000927C(v7);
  __chkstk_darwin(v8);
  sub_100009304();
  sub_100005A10(&qword_100041940);
  sub_100023C68();
  uint64_t v9 = sub_100031840();
  sub_100005A10(&qword_100041500);
  swift_retain();
  sub_100023CA0();
  sub_100031850();
  sub_100005A10(&qword_100041510);
  swift_retain();
  sub_100023CFC();
  sub_100031860();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100020F20();
  sub_100023DD4();
  v10();
  sub_100031830();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v0);
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  id v11 = (id)WFLocalizedAllShortcutsString();
  uint64_t v12 = sub_100032570();
  uint64_t v14 = v13;

  uint64_t v16 = v12;
  uint64_t v17 = v14;
  sub_100031830();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v16 = 61456;
  LOBYTE(v17) = 0;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100031830();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  return v9;
}

void sub_100020F20()
{
  sub_100023CD4();
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  uint64_t v10 = sub_100005A10(&qword_100040C70);
  uint64_t v11 = sub_10000927C(v10);
  __chkstk_darwin(v11);
  sub_100023D5C();
  uint64_t v12 = sub_100031BD0();
  sub_100006A88();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100009264();
  sub_100031BC0();
  if (qword_100040AD8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100031BB0();
  if (qword_100040AE0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100031B70();
  sub_100021568(v5, v3, v9);
  sub_100031B90();
  sub_100031B50();
  uint64_t v16 = sub_100031CB0();
  if (sub_100006148(v1, 1, v16) == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v12);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v7, v1, v16);
    sub_100023D28();
  }
}

void sub_100021108()
{
  sub_100023CD4();
  uint64_t v1 = v0;
  id v19 = v0;
  uint64_t v2 = sub_100031CB0();
  sub_100006A88();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100023D40();
  __chkstk_darwin(v6);
  char v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_100031C50();
  uint64_t v10 = sub_10000927C(v9);
  __chkstk_darwin(v10);
  sub_100009304();
  sub_100005A10(&qword_100041940);
  sub_100023C68();
  sub_100031840();
  sub_100005A10(&qword_100041500);
  swift_retain();
  sub_100023CA0();
  sub_100031850();
  sub_100005A10(&qword_100041510);
  swift_retain();
  sub_100023CFC();
  sub_100031860();
  swift_retain();
  id v11 = [v1 identifier];
  sub_100032570();

  swift_retain();
  swift_retain();
  swift_retain();
  sub_100020F20();
  swift_bridgeObjectRelease();
  sub_100023DD4();
  v12();
  sub_100031830();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  id v13 = v19;
  id v14 = [v19 name];
  uint64_t v15 = sub_100032570();
  uint64_t v17 = v16;

  uint64_t v20 = v15;
  uint64_t v21 = v17;
  sub_100031830();
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100023DE0([v13 glyphCharacter]);
  swift_release_n();
  swift_release_n();
  swift_release_n();

  sub_100023D28();
}

uint64_t sub_1000213CC(uint64_t a1, void *a2)
{
  v7._countAndFlagsBits = a1;
  v3._rawValue = &off_10003DDB8;
  v7._object = a2;
  Swift::Int v4 = sub_1000327C0(v3, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_100021420(char a1)
{
  if (a1) {
    return 0x6D6F74737563;
  }
  else {
    return 0x726F68732D6C6C61;
  }
}

uint64_t sub_100021460(char *a1, char *a2)
{
  return sub_100030AD8(*a1, *a2);
}

Swift::Int sub_10002146C()
{
  return sub_10001E610();
}

uint64_t sub_100021474()
{
  return sub_10001E624();
}

Swift::Int sub_10002147C()
{
  return sub_10001E75C();
}

uint64_t sub_100021484@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000213CC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000214B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021420(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1000214E0()
{
  qword_100041840 = 0x74756374726F6873;
  *(void *)algn_100041848 = 0xE900000000000073;
}

void sub_100021508()
{
  qword_100041850 = 0x746567646977;
  *(void *)algn_100041858 = 0xE600000000000000;
}

void sub_100021528()
{
  qword_100041860 = 0x6D6574737973;
  *(void *)algn_100041868 = 0xE600000000000000;
}

void sub_100021548()
{
  qword_100041870 = 0x7265646C6F66;
  *(void *)algn_100041878 = 0xE600000000000000;
}

uint64_t sub_100021568(uint64_t a1, unint64_t a2, char a3)
{
  if (a3)
  {
    unint64_t v7 = a2;
    sub_100005A10(&qword_1000410D0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100036C00;
    uint64_t v8 = qword_100040AF0;
    swift_bridgeObjectRetain();
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void *)algn_100041878;
    *(void *)(v4 + 32) = qword_100041870;
    *(void *)(v4 + 40) = v9;
  }
  else
  {
    sub_100005A10(&qword_1000410D0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100036C00;
    if (qword_100040AE8 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void *)algn_100041868;
    *(void *)(v4 + 32) = qword_100041860;
    *(void *)(v4 + 40) = v5;
    BOOL v6 = (a1 & 1) == 0;
    if (a1) {
      a1 = 0x6D6F74737563;
    }
    else {
      a1 = 0x726F68732D6C6C61;
    }
    if (v6) {
      unint64_t v7 = 0xED00007374756374;
    }
    else {
      unint64_t v7 = 0xE600000000000000;
    }
  }
  *(void *)(v4 + 48) = a1;
  *(void *)(v4 + 56) = v7;
  swift_bridgeObjectRetain();
  sub_100005A10(&qword_100041930);
  sub_100009060(&qword_100041938, &qword_100041930);
  uint64_t v10 = sub_1000324C0();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = v10;
  v14._object = v12;
  sub_1000325B0(v14);
  swift_bridgeObjectRelease();
  return 47;
}

uint64_t sub_100021754(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    sub_100032860(1uLL);
    return sub_1000325A0();
  }
  else
  {
    sub_100032860(0);
    sub_1000325A0();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100021820(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0) {
      return sub_100030AD8(a1 & 1, a4 & 1);
    }
    return 0;
  }
  if ((a6 & 1) == 0) {
    return 0;
  }
  if (a1 == a4 && a2 == a5) {
    return 1;
  }
  else {
    return sub_1000327E0();
  }
}

Swift::Int sub_100021864(uint64_t a1, uint64_t a2, char a3)
{
  char v5 = a3 & 1;
  sub_100032850();
  sub_100021754((uint64_t)v7, a1, a2, v5);
  return sub_100032880();
}

Swift::Int sub_1000218C4()
{
  return sub_100021864(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_1000218D0(uint64_t a1)
{
  return sub_100021754(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

Swift::Int sub_1000218DC()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_100032850();
  sub_100021754((uint64_t)v5, v1, v2, v3);
  return sub_100032880();
}

uint64_t sub_100021934(uint64_t a1, uint64_t a2)
{
  return sub_100021820(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_100021950()
{
  return sub_100019CBC((uint64_t)sub_100021964);
}

uint64_t sub_100021964()
{
  if (qword_100040AD0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1000458C0;
  uint64_t v1 = *(void *)algn_1000458C8;
  uint64_t v3 = qword_1000458D0;
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  return v5(v2, v1, v3);
}

uint64_t sub_100021A30(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_100031CB0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_100005A10(&qword_100040C70);
  sub_10000927C(v4);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  return _swift_task_switch(sub_100021B3C, 0, 0);
}

uint64_t sub_100021B3C()
{
  uint64_t v1 = *(void *)(v0[2] + 16);
  if (v1)
  {
    uint64_t v2 = v0[5];
    Swift::String v29 = (void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    Swift::String v30 = (void (**)(uint64_t, void, uint64_t))(v2 + 32);
    uint64_t v28 = (void (**)(uint64_t, uint64_t))(v2 + 8);
    uint64_t v3 = swift_bridgeObjectRetain() + 40;
    uint64_t v4 = _swiftEmptyArrayStorage;
    char v5 = &qword_100040C70;
    do
    {
      uint64_t v7 = v0[8];
      uint64_t v6 = v0[9];
      uint64_t v8 = v0[4];
      swift_bridgeObjectRetain();
      sub_100031CA0();
      sub_10000691C(v6, v7, v5);
      int v9 = sub_100006148(v7, 1, v8);
      uint64_t v10 = v0[9];
      if (v9 == 1)
      {
        sub_100006978(v0[9], v5);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = (uint64_t)v4;
        uint64_t v12 = v0[7];
        uint64_t v13 = v0[6];
        Swift::String v14 = v5;
        uint64_t v15 = v0[4];
        (*v30)(v12, v0[8], v15);
        (*v29)(v13, v12, v15);
        sub_10001FDC8();
        uint64_t v17 = v16;
        uint64_t v32 = v18;
        char v31 = v19;
        uint64_t v20 = v12;
        uint64_t v4 = (void *)v11;
        uint64_t v21 = v15;
        char v5 = v14;
        (*v28)(v20, v21);
        sub_100006978(v10, v14);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_10002C22C(0, *(void *)(v11 + 16) + 1, 1, v11);
        }
        unint64_t v23 = v4[2];
        unint64_t v22 = v4[3];
        if (v23 >= v22 >> 1) {
          uint64_t v4 = sub_10002C22C((void *)(v22 > 1), v23 + 1, 1, (uint64_t)v4);
        }
        _OWORD v4[2] = v23 + 1;
        uint64_t v24 = &v4[3 * v23];
        v24[4] = v17;
        v24[5] = v32;
        *((unsigned char *)v24 + 48) = v31 & 1;
      }
      v3 += 16;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = _swiftEmptyArrayStorage;
  }
  swift_retain();
  uint64_t v25 = sub_100021DE8((uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100023DB4();
  return v26(v25);
}

void *sub_100021DE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1)
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = (unsigned char *)(swift_bridgeObjectRetain() + 48);
  uint64_t v3 = _swiftEmptyArrayStorage;
  do
  {
    if (*v2)
    {
      uint64_t v4 = *((void *)v2 - 2);
      uint64_t v5 = *((void *)v2 - 1);
      swift_bridgeObjectRetain();
      sub_100021FA0();
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      sub_100023858(v4, v5, 1);
      if (!v7) {
        goto LABEL_14;
      }
    }
    else
    {
      if (qword_100040AD0 != -1) {
        swift_once();
      }
      uint64_t v7 = qword_1000458C0;
      uint64_t v9 = *(void *)algn_1000458C8;
      uint64_t v11 = qword_1000458D0;
      swift_retain();
      swift_retain();
      swift_retain();
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v3 = sub_10002C1F8(0, v3[2] + 1, 1, (uint64_t)v3);
    }
    unint64_t v13 = v3[2];
    unint64_t v12 = v3[3];
    if (v13 >= v12 >> 1) {
      uint64_t v3 = sub_10002C1F8((void *)(v12 > 1), v13 + 1, 1, (uint64_t)v3);
    }
    v3[2] = v13 + 1;
    Swift::String v14 = &v3[3 * v13];
    v14[4] = v7;
    v14[5] = v9;
    v14[6] = v11;
LABEL_14:
    v2 += 24;
    --v1;
  }
  while (v1);
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

void sub_100021FA0()
{
  sub_100030E90();
  swift_bridgeObjectRetain();
  unint64_t v0 = sub_100023DC0();
  uint64_t v3 = sub_1000232A8(v0, v1, v2);
  swift_bridgeObjectRelease();
  if (v3) {
    sub_100021108();
  }
}

uint64_t sub_100022014(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100023C64;
  return sub_1000220BC(a1, a2);
}

uint64_t sub_1000220BC(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_100019CBC((uint64_t)sub_1000220D8);
}

char *sub_1000220D8()
{
  sub_100030E90();
  swift_bridgeObjectRetain();
  unint64_t v0 = sub_100023DC0();
  unint64_t v1 = (unint64_t)sub_100023460(v0);
  unint64_t v2 = v1;
  if (v1 >> 62)
  {
    uint64_t v3 = sub_1000327A0();
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v6 = _swiftEmptyArrayStorage;
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t result = sub_100023D78();
  if (v3 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  uint64_t v6 = v18;
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      sub_100032710();
    }
    else {
      id v7 = *(id *)(v2 + 8 * v5 + 32);
    }
    sub_100021108();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v15 = v18[2];
    unint64_t v14 = v18[3];
    if (v15 >= v14 >> 1) {
      sub_100019700((char *)(v14 > 1), v15 + 1, 1);
    }
    ++v5;
    v18[2] = v15 + 1;
    uint64_t v16 = &v18[3 * v15];
    v16[4] = v9;
    v16[5] = v11;
    v16[6] = v13;
  }
  while (v3 != v5);
  swift_bridgeObjectRelease();
LABEL_14:
  sub_100023DB4();
  return (char *)v17(v6);
}

uint64_t sub_100022270(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_100019CBC((uint64_t)sub_100022288);
}

uint64_t sub_100022288()
{
  sub_100005A10(&qword_100041530);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100035A30;
  if (qword_100040AD0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_1000458C8;
  uint64_t v2 = qword_1000458D0;
  *(void *)(v0 + 32) = qword_1000458C0;
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v3 = sub_100022388();
  sub_10002C56C(v3);
  sub_100023DB4();
  return v4();
}

char *sub_100022388()
{
  unint64_t v0 = sub_100030E90();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = sub_1000327A0();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t result = sub_100023D78();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v16;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        sub_100032710();
      }
      else {
        id v6 = *(id *)(v1 + 8 * v4 + 32);
      }
      sub_100021108();
      uint64_t v8 = v7;
      uint64_t v10 = v9;
      uint64_t v12 = v11;
      unint64_t v14 = *(void *)(v16 + 16);
      unint64_t v13 = *(void *)(v16 + 24);
      if (v14 >= v13 >> 1) {
        sub_100019700((char *)(v13 > 1), v14 + 1, 1);
      }
      ++v4;
      *(void *)(v16 + 16) = v14 + 1;
      unint64_t v15 = (void *)(v16 + 24 * v14);
      v15[4] = v8;
      v15[5] = v10;
      v15[6] = v12;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return (char *)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000224C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  id v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *id v6 = v3;
  v6[1] = sub_1000180D0;
  return sub_100022014(a2, a3);
}

unint64_t sub_10002257C()
{
  unint64_t result = qword_100041890;
  if (!qword_100041890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041890);
  }
  return result;
}

unint64_t sub_1000225CC()
{
  unint64_t result = qword_100041898;
  if (!qword_100041898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041898);
  }
  return result;
}

unint64_t sub_10002261C()
{
  unint64_t result = qword_1000418A0[0];
  if (!qword_1000418A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000418A0);
  }
  return result;
}

uint64_t sub_100022668(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100022704;
  return sub_100021A30(a1, v4);
}

uint64_t sub_100022704(uint64_t a1)
{
  sub_1000091FC();
  uint64_t v4 = *v2;
  sub_100019D44();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_100023DB4();
  if (!v1) {
    uint64_t v6 = a1;
  }
  return v7(v6);
}

uint64_t sub_1000227D4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100019CB4;
  return sub_100022270(v3);
}

unint64_t sub_100022870()
{
  unint64_t result = qword_1000418B8;
  if (!qword_1000418B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418B8);
  }
  return result;
}

unint64_t sub_1000228C0()
{
  unint64_t result = qword_1000418C0;
  if (!qword_1000418C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418C0);
  }
  return result;
}

unint64_t sub_100022910()
{
  unint64_t result = qword_1000418C8;
  if (!qword_1000418C8)
  {
    sub_100005B98(qword_1000418D0);
    sub_1000228C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418C8);
  }
  return result;
}

uint64_t sub_100022984(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001FCC0();
  *uint64_t v5 = v2;
  v5[1] = sub_100022A38;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100022A38()
{
  sub_1000091FC();
  uint64_t v1 = *v0;
  sub_100019D44();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_100022B00(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100022B90;
  return sub_100021950();
}

uint64_t sub_100022B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000091FC();
  uint64_t v8 = *(void **)(v7 + 16);
  uint64_t v9 = *v3;
  sub_100019D44();
  *uint64_t v10 = v9;
  swift_task_dealloc();
  *uint64_t v8 = a1;
  v8[1] = a2;
  v8[2] = a3;
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_100022C88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020C9C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

unint64_t sub_100022CB8()
{
  unint64_t result = qword_1000418E8;
  if (!qword_1000418E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418E8);
  }
  return result;
}

unint64_t sub_100022D08()
{
  unint64_t result = qword_1000418F0;
  if (!qword_1000418F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418F0);
  }
  return result;
}

unint64_t sub_100022D58()
{
  unint64_t result = qword_1000418F8;
  if (!qword_1000418F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418F8);
  }
  return result;
}

uint64_t sub_100022DA4@<X0>(void *a1@<X8>)
{
  sub_100020AD4();
  *a1 = qword_1000458B8;

  return swift_retain();
}

unint64_t sub_100022DE8()
{
  unint64_t result = qword_100041900;
  if (!qword_100041900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041900);
  }
  return result;
}

unint64_t sub_100022E38()
{
  unint64_t result = qword_100041908;
  if (!qword_100041908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041908);
  }
  return result;
}

unint64_t sub_100022E88()
{
  unint64_t result = qword_100041910;
  if (!qword_100041910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041910);
  }
  return result;
}

uint64_t sub_100022ED4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001FD0C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100022F00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002072C();
  uint64_t v3 = sub_100031AC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_100022F70()
{
  return sub_100009060(&qword_100041918, &qword_100041920);
}

uint64_t sub_100022FAC(uint64_t a1)
{
  unint64_t v2 = sub_10002261C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100022FFC()
{
  unint64_t result = qword_100041928;
  if (!qword_100041928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041928);
  }
  return result;
}

void sub_100023048()
{
}

uint64_t sub_100023050(uint64_t a1)
{
  unint64_t v2 = sub_100022E88();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000230A0()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_1000230E4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100023134(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_1000231AC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1000231C0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t sub_100023210(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t sub_100023250(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ConfiguredCollection()
{
}

void type metadata accessor for ConfiguredCollection.SortedVisibleCollectionsQuery()
{
}

void *sub_1000232A8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_1000327A0())
  {
    unint64_t v20 = v5;
    unint64_t v21 = v5 & 0xC000000000000001;
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = v21 ? (id)sub_100032710() : *(id *)(v5 + 8 * v7);
      uint64_t v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v10 = v6;
      uint64_t v11 = v8;
      uint64_t v12 = a3;
      id v13 = [v8 identifier];
      uint64_t v14 = sub_100032570();
      uint64_t v16 = v15;

      a3 = v12;
      BOOL v17 = v14 == a2 && v16 == v12;
      if (v17)
      {
        swift_bridgeObjectRelease();
LABEL_17:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v11;
      }
      char v18 = sub_1000327E0();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_17;
      }

      ++v7;
      uint64_t v6 = v10;
      BOOL v17 = v9 == v10;
      unint64_t v5 = v20;
      if (v17) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_100023460(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_100032710();
LABEL_7:
        unint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        id v7 = [v4 name];
        sub_100032570();

        sub_1000090A4();
        char v8 = sub_1000326D0();
        swift_bridgeObjectRelease();
        if (v8)
        {
          sub_100032730();
          sub_100032750();
          sub_100032760();
          sub_100032740();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          goto LABEL_17;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_1000327A0();
      if (!v2) {
        goto LABEL_17;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100023624()
{
  uint64_t v1 = sub_1000324D0();
  sub_100006A88();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100009264();
  sub_100023DD4();
  v5();
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v0, v1);
  if (v6 == enum case for String.LocalizationValue.Placeholder.int(_:)) {
    return 1684827173;
  }
  if (v6 == enum case for String.LocalizationValue.Placeholder.uint(_:)) {
    return 1970039845;
  }
  if (v6 == enum case for String.LocalizationValue.Placeholder.float(_:)) {
    return 26149;
  }
  if (v6 == enum case for String.LocalizationValue.Placeholder.double(_:)) {
    return 6712357;
  }
  if (v6 != enum case for String.LocalizationValue.Placeholder.object(_:)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  }
  return 16421;
}

uint64_t sub_100023788(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v7 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v8 = a1 == a5 && a2 == a6;
  if (v8 && !(a3 >> 16) && v7 == a4 >> 16) {
    return 1;
  }
  else {
    return sub_1000327D0() & 1;
  }
}

uint64_t sub_1000237F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_100041538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023858(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10002386C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10002387C(uint64_t a1)
{
  return sub_100023858(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10002388C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10002386C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1000238D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10002386C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100023858(v6, v7, v8);
  return a1;
}

__n128 sub_100023930(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_100023944(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100023858(v4, v5, v6);
  return a1;
}

uint64_t sub_10002398C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t sub_1000239CC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100023A10(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100023A18(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for ConfiguredCollection.Identifier()
{
}

unint64_t sub_100023A34()
{
  unint64_t result = qword_100041978;
  if (!qword_100041978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041978);
  }
  return result;
}

uint64_t sub_100023A80(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_100023B08(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100023BD4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100023BFC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for ConfiguredCollection.Identifier.SystemCollectionIdentifier()
{
}

unint64_t sub_100023C18()
{
  unint64_t result = qword_100041980;
  if (!qword_100041980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041980);
  }
  return result;
}

uint64_t sub_100023C68()
{
  return sub_100031C20();
}

uint64_t sub_100023CA0()
{
  return sub_100031C20();
}

uint64_t sub_100023CEC()
{
  return v0;
}

uint64_t sub_100023CFC()
{
  return sub_100031C20();
}

uint64_t sub_100023D5C()
{
  return 0;
}

char *sub_100023D78()
{
  return sub_100019700(0, v0 & ~(v0 >> 63), 0);
}

uint64_t sub_100023D9C()
{
  return v0;
}

uint64_t sub_100023DC0()
{
  return v0;
}

uint64_t sub_100023DE0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 96) = a1;
  *(unsigned char *)(v1 - 88) = 0;
  return sub_100031830();
}

uint64_t *sub_100023E00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = a2[4];
    a1[3] = a2[3];
    a1[4] = v7;
    uint64_t v8 = a2[6];
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    a1[5] = a2[5];
    a1[6] = v8;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1000323D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100023F78(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000323D0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100024060(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  a1[6] = a2[6];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1000323D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_100024188(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_100006978((uint64_t)a1 + v6, &qword_100040B70);
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1000323D0();
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

uint64_t sub_10002430C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_1000323D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

void *sub_1000243F0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_100006978((uint64_t)a1 + v6, &qword_100040B70);
    uint64_t v9 = sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_1000323D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10002454C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024560);
}

uint64_t sub_100024560(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005A10(&qword_100040B78);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return sub_100006148(v9, a2, v8);
  }
}

uint64_t sub_1000245EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024600);
}

void *sub_100024600(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005A10(&qword_100040B78);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)sub_100005A54(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for RunShortcutComplicationView()
{
  uint64_t result = qword_1000419E0;
  if (!qword_1000419E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000246CC()
{
  sub_1000062A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100024764()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100024780()
{
  return sub_100031EA0();
}

uint64_t sub_1000247A4(uint64_t a1)
{
  sub_100031E10();
  sub_100006A88();
  __chkstk_darwin(v3);
  sub_100014E54();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  return sub_100031EB0();
}

uint64_t sub_100024834()
{
  sub_100005A10(&qword_100041A18);
  sub_100006AA4();
  __chkstk_darwin(v2);
  sub_100009304();
  sub_10002490C(v0, v1);
  sub_100031820();
  sub_1000255C0();
  sub_1000090A4();
  sub_1000321E0();
  swift_bridgeObjectRelease();
  return sub_100006978(v1, &qword_100041A18);
}

uint64_t sub_10002490C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = sub_100005A10(&qword_100041A68);
  __chkstk_darwin(v38);
  uint64_t v4 = (uint64_t *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v33 = sub_100005A10(&qword_100041A50);
  __chkstk_darwin(v33);
  uint64_t v31 = (uint64_t)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100005A10(&qword_100041A70);
  __chkstk_darwin(v35);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100005A10(&qword_100041A78);
  __chkstk_darwin(v32);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100005A10(&qword_100041A40);
  __chkstk_darwin(v36);
  uint64_t v34 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for RunShortcutRectangularWidgetView();
  __chkstk_darwin(v11);
  id v13 = (uint64_t *)((char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_1000323D0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  BOOL v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RunShortcutComplicationView();
  sub_100025A90(&qword_100040B70, (void (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v17);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (&enum case for WidgetFamily.accessoryCorner(_:) && v18 == enum case for WidgetFamily.accessoryCorner(_:))
  {
    uint64_t v19 = v31;
    sub_100024FA8(v31);
    sub_10000691C(v19, (uint64_t)v9, &qword_100041A50);
    swift_storeEnumTagMultiPayload();
    sub_1000263F4(&qword_100041300, (void (*)(uint64_t))type metadata accessor for RunShortcutRectangularWidgetView);
    sub_100025780();
    uint64_t v20 = (uint64_t)v34;
    sub_100031FD0();
    sub_10000691C(v20, (uint64_t)v7, &qword_100041A40);
    swift_storeEnumTagMultiPayload();
    sub_1000256D4();
    sub_100009060(&qword_100041A60, &qword_100041A68);
    sub_100031FD0();
    sub_100006978(v20, &qword_100041A40);
    return sub_100006978(v19, &qword_100041A50);
  }
  else if (v18 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    long long v22 = *(_OWORD *)(a1 + 16);
    long long v41 = *(_OWORD *)a1;
    long long v42 = v22;
    long long v43 = *(_OWORD *)(a1 + 32);
    uint64_t v44 = *(void *)(a1 + 48);
    id v23 = sub_1000163D8();
    sub_100031820();
    uint64_t v24 = v39;
    uint64_t v25 = v40;
    uint64_t v26 = (void *)((char *)v13 + *(int *)(v11 + 28));
    *uint64_t v26 = swift_getKeyPath();
    sub_100005A10(&qword_100041108);
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = (char *)v13 + *(int *)(v11 + 32);
    *(void *)uint64_t v27 = swift_getKeyPath();
    v27[8] = 0;
    *id v13 = v23;
    v13[1] = v24;
    v13[2] = v25;
    v13[3] = 0;
    sub_100011FB8((uint64_t)v13, (uint64_t)v9);
    swift_storeEnumTagMultiPayload();
    sub_1000263F4(&qword_100041300, (void (*)(uint64_t))type metadata accessor for RunShortcutRectangularWidgetView);
    sub_100025780();
    uint64_t v28 = (uint64_t)v34;
    sub_100031FD0();
    sub_10000691C(v28, (uint64_t)v7, &qword_100041A40);
    swift_storeEnumTagMultiPayload();
    sub_1000256D4();
    sub_100009060(&qword_100041A60, &qword_100041A68);
    sub_100031FD0();
    sub_100006978(v28, &qword_100041A40);
    return sub_1000123A0((uint64_t)v13);
  }
  else
  {
    *uint64_t v4 = sub_1000322D0();
    v4[1] = v29;
    uint64_t v30 = sub_100005A10(&qword_100041A80);
    sub_1000251B0(a1, (char *)v4 + *(int *)(v30 + 44));
    sub_10000691C((uint64_t)v4, (uint64_t)v7, &qword_100041A68);
    swift_storeEnumTagMultiPayload();
    sub_1000256D4();
    sub_100009060(&qword_100041A60, &qword_100041A68);
    sub_100031FD0();
    sub_100006978((uint64_t)v4, &qword_100041A68);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_100024FA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = type metadata accessor for ComplicationPaddingModifier();
  __chkstk_darwin(v5 - 8);
  sub_100014E54();
  uint64_t v6 = sub_100005A10(&qword_100040B78);
  __chkstk_darwin(v6 - 8);
  sub_100009304();
  uint64_t v7 = type metadata accessor for ComplicationWorkflowIcon();
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (void *)((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v11 = *(_OWORD *)(v1 + 16);
  v15[0] = *(_OWORD *)v1;
  v15[1] = v11;
  v15[2] = *(_OWORD *)(v1 + 32);
  uint64_t v16 = *(void *)(v1 + 48);
  id v12 = sub_1000163D8();
  *uint64_t v3 = swift_getKeyPath();
  sub_100005A10(&qword_100040B70);
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)v10 + *(int *)(v8 + 32)) = swift_getKeyPath();
  sub_100005A10(&qword_1000410C8);
  swift_storeEnumTagMultiPayload();
  *uint64_t v10 = v12;
  sub_100025D04((uint64_t)v3, (uint64_t)v10 + *(int *)(v8 + 28));
  *uint64_t v2 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = sub_100005A10(&qword_100041A50);
  sub_100025D6C((uint64_t)v2, a1 + *(int *)(v13 + 36), (void (*)(void))type metadata accessor for ComplicationPaddingModifier);
  return sub_100025D6C((uint64_t)v10, a1, (void (*)(void))type metadata accessor for ComplicationWorkflowIcon);
}

uint64_t sub_1000251B0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_100005A10(&qword_100041A88);
  uint64_t v36 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100005A10(&qword_100041A90);
  uint64_t v6 = *(void *)(v35 - 8);
  uint64_t v7 = __chkstk_darwin(v35);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  long long v11 = (char *)&v30 - v10;
  uint64_t v12 = sub_100032350();
  uint64_t v33 = *(void *)(v12 - 8);
  uint64_t v13 = v33;
  uint64_t v34 = v12;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  int v18 = (char *)&v30 - v17;
  uint64_t v32 = (char *)&v30 - v17;
  sub_100032340();
  long long v19 = *(_OWORD *)(a1 + 16);
  v41[0] = *(_OWORD *)a1;
  v41[1] = v19;
  v41[2] = *(_OWORD *)(a1 + 32);
  uint64_t v42 = *(void *)(a1 + 48);
  sub_10001055C((uint64_t)v41);
  uint64_t v39 = sub_10002C854((uint64_t)v41);
  uint64_t v40 = v20;
  uint64_t v38 = a1;
  sub_100005A10(&qword_100041A50);
  sub_100025780();
  sub_100019E44();
  sub_1000322C0();
  sub_100009060(&qword_100041A98, &qword_100041A88);
  sub_100025DF0();
  sub_1000321B0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v3);
  uint64_t v30 = v6;
  uint64_t v21 = v35;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v9, v35);
  long long v22 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v31 = v16;
  uint64_t v23 = v34;
  v22(v16, v18, v34);
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v24(v9, v11, v21);
  uint64_t v25 = v37;
  v22(v37, v16, v23);
  uint64_t v26 = sub_100005A10(&qword_100041AA8);
  v24(&v25[*(int *)(v26 + 48)], v9, v21);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v30 + 8);
  v27(v11, v21);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v33 + 8);
  v28(v32, v23);
  v27(v9, v21);
  return ((uint64_t (*)(char *, uint64_t))v28)(v31, v23);
}

unint64_t sub_1000255C0()
{
  unint64_t result = qword_100041A20;
  if (!qword_100041A20)
  {
    sub_100005B98(&qword_100041A18);
    sub_100025634();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A20);
  }
  return result;
}

unint64_t sub_100025634()
{
  unint64_t result = qword_100041A28;
  if (!qword_100041A28)
  {
    sub_100005B98(&qword_100041A30);
    sub_1000256D4();
    sub_100009060(&qword_100041A60, &qword_100041A68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A28);
  }
  return result;
}

unint64_t sub_1000256D4()
{
  unint64_t result = qword_100041A38;
  if (!qword_100041A38)
  {
    sub_100005B98(&qword_100041A40);
    sub_1000263F4(&qword_100041300, (void (*)(uint64_t))type metadata accessor for RunShortcutRectangularWidgetView);
    sub_100025780();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A38);
  }
  return result;
}

unint64_t sub_100025780()
{
  unint64_t result = qword_100041A48;
  if (!qword_100041A48)
  {
    sub_100005B98(&qword_100041A50);
    sub_1000263F4(&qword_100041A58, (void (*)(uint64_t))type metadata accessor for ComplicationWorkflowIcon);
    sub_1000263F4(&qword_100041338, (void (*)(uint64_t))type metadata accessor for ComplicationPaddingModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A48);
  }
  return result;
}

uint64_t sub_10002585C@<X0>(uint64_t a1@<X8>)
{
  return sub_100025A90(&qword_100040B70, (void (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_100025898()
{
  return sub_100031EA0();
}

uint64_t sub_1000258C4(uint64_t a1, char a2)
{
  uint64_t v5 = sub_100031F70();
  sub_100006A88();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_100014E54();
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v9 = sub_100032690();
  uint64_t v10 = sub_1000320A0();
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = sub_100025E3C(1819242306, 0xE400000000000000, &v13);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy();
    sub_10002643C();
    sub_10002643C();
  }

  sub_100031F60();
  swift_getAtKeyPath();
  sub_100010960(a1, 0);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  return v14;
}

uint64_t sub_100025A54@<X0>(uint64_t a1@<X8>)
{
  return sub_100025A90(&qword_100041108, (void (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_100025A90@<X0>(uint64_t *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v10 = v5;
  uint64_t v12 = sub_100031F70();
  sub_100006A88();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100014E54();
  sub_100005A10(a1);
  sub_100006AA4();
  __chkstk_darwin(v16);
  int v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000691C(v10, (uint64_t)v18, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    a2(0);
    sub_100006AA4();
    return (*(uint64_t (**)(uint64_t, char *))(v19 + 32))(a5, v18);
  }
  else
  {
    os_log_type_t v21 = sub_100032690();
    long long v22 = sub_1000320A0();
    if (os_log_type_enabled(v22, v21))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      *(void *)(v23 + 4) = sub_100025E3C(a3, v24, &v25);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy();
      sub_10002643C();
      sub_10002643C();
    }

    sub_100031F60();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v6, v12);
  }
}

uint64_t sub_100025CC0@<X0>(uint64_t a1@<X8>)
{
  return sub_100025A90(&qword_1000410C8, (void (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x8000000100033560, a1);
}

uint64_t sub_100025D04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A10(&qword_100040B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025D6C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100006AA4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_100025DCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100024FA8(a1);
}

unint64_t sub_100025DF0()
{
  unint64_t result = qword_100041AA0;
  if (!qword_100041AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AA0);
  }
  return result;
}

unint64_t sub_100025E3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_100025F10(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100026060((uint64_t)v12, *a3);
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
      sub_100026060((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100026010((uint64_t)v12);
  return v7;
}

unint64_t sub_100025F10(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_1000260BC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_100032720();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100026010(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100026060(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_1000260BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_100026154(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100026258(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100026258((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100026154(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_1000261F0(v2, 0);
      unint64_t result = (void *)sub_100032700();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1000325C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000261F0(uint64_t a1, uint64_t a2)
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
  sub_100005A10(&qword_100041AB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100026258(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005A10(&qword_100041AB0);
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
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_100026348()
{
  unint64_t result = qword_100041AB8;
  if (!qword_100041AB8)
  {
    sub_100005B98(&qword_100041AC0);
    sub_1000255C0();
    sub_1000263F4(&qword_100041AC8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AB8);
  }
  return result;
}

uint64_t sub_1000263F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002643C()
{
  return swift_slowDealloc();
}

unint64_t sub_100026458()
{
  unint64_t result = qword_100041AE0;
  if (!qword_100041AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AE0);
  }
  return result;
}

uint64_t sub_1000264A4()
{
  uint64_t v0 = sub_100032550();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100031C30();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031D30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100031C50();
  sub_100015DDC(v6, qword_1000458D8);
  sub_100015DA4(v6, (uint64_t)qword_1000458D8);
  sub_1000324E0();
  sub_100031D20();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  return sub_100031C60();
}

uint64_t sub_10002668C()
{
  if (qword_100040AF8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031C50();

  return sub_100015DA4(v0, (uint64_t)qword_1000458D8);
}

uint64_t sub_1000266F0()
{
  uint64_t v0 = sub_100032550();
  uint64_t v1 = sub_10000927C(v0);
  __chkstk_darwin(v1);
  sub_100005BF8();
  sub_100031A60();
  sub_100006A88();
  uint64_t v32 = v3;
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  sub_100005BF8();
  uint64_t v31 = v5 - v4;
  uint64_t v6 = sub_100005A10(&qword_100040B28);
  uint64_t v7 = sub_10000927C(v6);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v14 = sub_10000927C(v13);
  __chkstk_darwin(v14);
  sub_100005BF8();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_100031C30();
  sub_100006A88();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_100005BF8();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = sub_100031D30();
  uint64_t v26 = sub_10000927C(v25);
  __chkstk_darwin(v26);
  sub_100005BF8();
  uint64_t v27 = sub_100031C50();
  __chkstk_darwin(v27);
  sub_100005BF8();
  sub_1000324E0();
  uint64_t v30 = sub_100005A10(&qword_100041438);
  sub_100031D20();
  (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v24, enum case for LocalizedStringResource.BundleDescription.main(_:), v18);
  sub_100031C60();
  sub_100015E40(v17);
  sub_100031800();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v37 = 0;
  sub_100015E40((uint64_t)v12);
  sub_100015E40((uint64_t)v10);
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v31, enum case for InputConnectionBehavior.default(_:), v33);
  sub_100015C90();
  uint64_t v28 = sub_1000318D0();
  sub_100005A10(&qword_100041440);
  sub_100031760();
  long long v34 = 0u;
  long long v35 = 0u;
  *(void *)&long long v36 = 0;
  sub_100031750();
  sub_100031710();
  return v28;
}

uint64_t sub_100026A8C()
{
  uint64_t v0 = qword_100041AD0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100026AC8()
{
  unint64_t result = qword_100041AE8;
  if (!qword_100041AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AE8);
  }
  return result;
}

unint64_t sub_100026B18()
{
  unint64_t result = qword_100041AF0;
  if (!qword_100041AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AF0);
  }
  return result;
}

uint64_t sub_100026B64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100026BB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002668C();
  uint64_t v3 = sub_100031C50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_100026C24()
{
  return byte_1000458F0;
}

uint64_t sub_100026C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100026D9C();
  *uint64_t v4 = v2;
  v4[1] = sub_100015980;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_100026CDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000266F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100026D04(uint64_t a1)
{
  unint64_t v2 = sub_100026D50();

  return static CustomIntentMigratedAppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for RunShortcutWidgetConfigurationIntent()
{
  return &type metadata for RunShortcutWidgetConfigurationIntent;
}

unint64_t sub_100026D50()
{
  unint64_t result = qword_100041B00;
  if (!qword_100041B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B00);
  }
  return result;
}

unint64_t sub_100026D9C()
{
  unint64_t result = qword_100041B10;
  if (!qword_100041B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B10);
  }
  return result;
}

void **sub_100026DE8(void **a1, void **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void **)((char *)a1 + v8);
    uint64_t v10 = (void **)((char *)a2 + v8);
    uint64_t v11 = v5;
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1000323D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (void **)((char *)a1 + v13);
    uint64_t v15 = (void **)((char *)a2 + v13);
    sub_100005A10(&qword_1000410C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_100032390();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100026FA0(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000323D0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100032390();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

void **sub_1000270D0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void **)((char *)a1 + v7);
  uint64_t v9 = (void **)((char *)a2 + v7);
  id v10 = v6;
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1000323D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void **)((char *)a1 + v12);
  uint64_t v14 = (void **)((char *)a2 + v12);
  sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100032390();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_100027238(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    id v10 = (void **)((char *)a1 + v9);
    uint64_t v11 = (void **)((char *)a2 + v9);
    sub_100029518((uint64_t)a1 + v9, &qword_100040B70);
    sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1000323D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *id v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (void **)((char *)a1 + v13);
    uint64_t v15 = (void **)((char *)a2 + v13);
    sub_100029518((uint64_t)a1 + v13, &qword_1000410C8);
    sub_100005A10(&qword_1000410C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_100032390();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1000273D0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1000323D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100032390();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

void **sub_100027554(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_100029518((uint64_t)a1 + v7, &qword_100040B70);
    uint64_t v10 = sub_100005A10(&qword_100040B70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1000323D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    sub_100029518((uint64_t)a1 + v12, &qword_1000410C8);
    uint64_t v15 = sub_100005A10(&qword_1000410C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_100032390();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100027708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002771C);
}

uint64_t sub_10002771C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_100005A10(&qword_100040B78);
    sub_10001067C();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v10 = sub_100005A10(&qword_100041220);
      uint64_t v11 = *(int *)(a3 + 24);
    }
    return sub_100006148((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t sub_1000277D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000277E4);
}

void *sub_1000277E4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    sub_100005A10(&qword_100040B78);
    sub_10001067C();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_100005A10(&qword_100041220);
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return (void *)sub_100005A54((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for ComplicationWorkflowIcon()
{
  uint64_t result = qword_100041B70;
  if (!qword_100041B70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000278DC()
{
  sub_10001310C(319, (unint64_t *)&qword_100040BE8, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_10001310C(319, (unint64_t *)&unk_100041290, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_1000279EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100027A08()
{
  uint64_t v1 = type metadata accessor for ComplicationWorkflowIcon();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  uint64_t v4 = sub_100005A10(&qword_100041BB0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [*v0 backgroundColor];
  id v9 = [v8 paletteGradient];

  sub_1000294C4((uint64_t)v0, (uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ComplicationWorkflowIcon);
  unint64_t v10 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v11 = swift_allocObject();
  sub_100029018((uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  sub_100005A10(&qword_100041BB8);
  sub_1000290FC();
  sub_100031D60();
  sub_100009060(&qword_100041C08, &qword_100041BB0);
  sub_100032160();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100027C5C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100005A10(&qword_100041BD0);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027D44(a2, (uint64_t)a1, (uint64_t)v8);
  id v9 = a1;
  uint64_t v10 = sub_100032220();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100014BB4((uint64_t)v8, a3, &qword_100041BD0);
  uint64_t v12 = (uint64_t *)(a3 + *(int *)(sub_100005A10(&qword_100041BB8) + 36));
  *uint64_t v12 = KeyPath;
  v12[1] = v10;
  return sub_100029518((uint64_t)v8, &qword_100041BD0);
}

uint64_t sub_100027D44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v115 = (void *)a2;
  uint64_t v123 = a3;
  uint64_t v95 = sub_1000322F0();
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v93 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_100005A10(&qword_100041348);
  uint64_t v97 = *(void *)(v122 - 8);
  uint64_t v5 = __chkstk_darwin(v122);
  uint64_t v92 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v96 = (char *)&v87 - v7;
  uint64_t v89 = sub_100032200();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  v87 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for WidgetSStackView(0);
  uint64_t v9 = __chkstk_darwin(v124);
  v90 = (id **)((char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v91 = (char *)&v87 - v11;
  uint64_t v100 = sub_100032390();
  uint64_t v103 = *(void *)(v100 - 8);
  uint64_t v12 = __chkstk_darwin(v100);
  uint64_t v99 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v98 = (uint64_t)&v87 - v14;
  uint64_t v119 = sub_100005A10(&qword_100041C10);
  __chkstk_darwin(v119);
  uint64_t v121 = (uint64_t)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_100005A10(&qword_100041C18);
  __chkstk_darwin(v112);
  uint64_t v114 = (uint64_t)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_100005A10(&qword_100041BF0);
  __chkstk_darwin(v120);
  v116 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_100031D80();
  uint64_t v107 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  uint64_t v108 = (char **)((char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v105 = sub_100031D70();
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v106 = (char **)((char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v113 = sub_100031D90();
  uint64_t v111 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v110 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for ComplicationWorkflowIcon();
  __chkstk_darwin(v21);
  uint64_t v117 = (uint64_t)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000323D0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v87 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v87 - v28;
  uint64_t v102 = v21;
  sub_10002585C((uint64_t)&v87 - v28);
  v101 = *(void (**)(char *, void, uint64_t))(v24 + 104);
  v101(v27, enum case for WidgetFamily.accessoryInline(_:), v23);
  sub_10002942C(&qword_100041358, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_1000325D0();
  sub_1000325D0();
  uint64_t v30 = v125;
  uint64_t v31 = v127;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v24 + 8);
  v32(v27, v23);
  v32(v29, v23);
  uint64_t v33 = a1;
  uint64_t v34 = v117;
  v118 = (id *)v33;
  sub_1000294C4(v33, v117, (void (*)(void))type metadata accessor for ComplicationWorkflowIcon);
  if (v30 == v31)
  {
    sub_100029474(v34, (void (*)(void))type metadata accessor for ComplicationWorkflowIcon);
LABEL_4:
    id v37 = [*v118 icon];
    uint64_t v38 = v106;
    void *v106 = 0x403E000000000000;
    (*(void (**)(void *, void, uint64_t))(v104 + 104))(v38, enum case for IconSize.customHeight(_:), v105);
    uint64_t v39 = v115;
    uint64_t v40 = v107;
    long long v41 = v108;
    *uint64_t v108 = v115;
    *((unsigned char *)v41 + 8) = 0;
    (*(void (**)(void *, void, uint64_t))(v40 + 104))(v41, enum case for IconView.DisplayMode.customColor(_:), v109);
    id v42 = v39;
    long long v43 = v110;
    sub_100031DA0();
    uint64_t v44 = v111;
    uint64_t v45 = v113;
    (*(void (**)(uint64_t, char *, uint64_t))(v111 + 16))(v114, v43, v113);
    swift_storeEnumTagMultiPayload();
    sub_10002942C((unint64_t *)&qword_100041210, (void (*)(uint64_t))&type metadata accessor for IconView);
    uint64_t v46 = sub_10002942C(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    uint64_t v47 = (uint64_t)v116;
    uint64_t v48 = v124;
    sub_100031FD0();
    sub_100014BB4(v47, v121, &qword_100041BF0);
    swift_storeEnumTagMultiPayload();
    sub_1000292F4();
    uint64_t v125 = v48;
    uint64_t v126 = v46;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    sub_100029518(v47, &qword_100041BF0);
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  }
  sub_10002585C((uint64_t)v29);
  v101(v27, enum case for WidgetFamily.accessoryRectangular(_:), v23);
  sub_1000325D0();
  sub_1000325D0();
  uint64_t v35 = v125;
  uint64_t v36 = v127;
  v32(v27, v23);
  v32(v29, v23);
  sub_100029474(v34, (void (*)(void))type metadata accessor for ComplicationWorkflowIcon);
  if (v35 == v36) {
    goto LABEL_4;
  }
  uint64_t v50 = v98;
  sub_100025CC0(v98);
  uint64_t v51 = v99;
  sub_100032370();
  char v52 = sub_100032360();
  uint64_t v54 = v103 + 8;
  uint64_t v53 = *(void (**)(char *, uint64_t))(v103 + 8);
  uint64_t v55 = v100;
  v53(v51, v100);
  v53((char *)v50, v55);
  if (v52)
  {
    id v56 = [self whiteColor];
    id v57 = sub_100028DBC((uint64_t)v56);

    id v58 = [objc_allocWithZone((Class)WFColor) initWithWhite:0.2 alpha:1.0];
    uint64_t v59 = v124;
    uint64_t v60 = v91;
    uint64_t v61 = (uint64_t *)&v91[*(int *)(v124 + 20)];
    (*(void (**)(char *, void, uint64_t))(v88 + 104))(v87, enum case for Color.RGBColorSpace.sRGB(_:), v89);
    *uint64_t v61 = sub_100032260();
    uint64_t v62 = enum case for SStackFill.color(_:);
    uint64_t v63 = sub_100031D40();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 104))(v61, v62, v63);
    *uint64_t v60 = v57;
    v60[1] = v58;
    type metadata accessor for WidgetSStackView.Content(0);
    swift_storeEnumTagMultiPayload();
    sub_1000294C4((uint64_t)v60, v114, (void (*)(void))type metadata accessor for WidgetSStackView);
    swift_storeEnumTagMultiPayload();
    sub_10002942C((unint64_t *)&qword_100041210, (void (*)(uint64_t))&type metadata accessor for IconView);
    uint64_t v64 = sub_10002942C(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    uint64_t v65 = (uint64_t)v116;
    sub_100031FD0();
    sub_100014BB4(v65, v121, &qword_100041BF0);
    swift_storeEnumTagMultiPayload();
    sub_1000292F4();
    uint64_t v125 = v59;
    uint64_t v126 = v64;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    sub_100029518(v65, &qword_100041BF0);
    return sub_100029474((uint64_t)v60, (void (*)(void))type metadata accessor for WidgetSStackView);
  }
  else
  {
    uint64_t v103 = v54;
    uint64_t v66 = v51;
    uint64_t v67 = v115;
    v118 = (id *)sub_100028DBC((uint64_t)v115);
    uint64_t v68 = (id *)[self whiteColor];
    uint64_t v69 = v90;
    uint64_t v70 = (uint64_t *)((char *)v90 + *(int *)(v124 + 20));
    id v71 = v67;
    sub_100032220();
    uint64_t v72 = v50;
    uint64_t v73 = sub_100032240();
    swift_release();
    *uint64_t v70 = v73;
    uint64_t v74 = enum case for SStackFill.color(_:);
    uint64_t v75 = sub_100031D40();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v75 - 8) + 104))(v70, v74, v75);
    *uint64_t v69 = v118;
    v69[1] = v68;
    type metadata accessor for WidgetSStackView.Content(0);
    swift_storeEnumTagMultiPayload();
    sub_100025CC0(v72);
    sub_100032380();
    char v76 = sub_100032360();
    v53(v66, v55);
    v53((char *)v72, v55);
    uint64_t v77 = v94;
    uint64_t v78 = (unsigned int *)&enum case for BlendMode.destinationOut(_:);
    if ((v76 & 1) == 0) {
      uint64_t v78 = (unsigned int *)&enum case for BlendMode.normal(_:);
    }
    uint64_t v79 = v93;
    uint64_t v80 = v95;
    (*(void (**)(char *, void, uint64_t))(v94 + 104))(v93, *v78, v95);
    uint64_t v81 = sub_10002942C(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    uint64_t v82 = v92;
    uint64_t v83 = v124;
    sub_100032140();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v80);
    sub_100029474((uint64_t)v69, (void (*)(void))type metadata accessor for WidgetSStackView);
    uint64_t v84 = v97;
    uint64_t v85 = v96;
    uint64_t v86 = v122;
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v96, v82, v122);
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 16))(v121, v85, v86);
    swift_storeEnumTagMultiPayload();
    sub_1000292F4();
    uint64_t v125 = v83;
    uint64_t v126 = v81;
    swift_getOpaqueTypeConformance2();
    sub_100031FD0();
    return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v85, v86);
  }
}

id sub_100028DBC(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)WFIconColorBackground) initWithColor:a1];
  [v1 glyphCharacter];
  id v3 = (id)WFSystemImageNameForGlyphCharacter();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100032570();
    uint64_t v7 = v6;

    id v8 = objc_allocWithZone((Class)WFSymbolIcon);
    return sub_1000190E4(v5, v7, v2);
  }
  else
  {
    id v10 = [objc_allocWithZone((Class)WFWorkflowGlyphIcon) initWithGlyph:[v1 glyphCharacter] background:v2];

    return v10;
  }
}

uint64_t sub_100028EA0()
{
  uint64_t v1 = type metadata accessor for ComplicationWorkflowIcon();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_100005A10(&qword_100040B70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000323D0();
    sub_100006AA4();
    (*(void (**)(uint64_t))(v6 + 8))(v5);
  }
  else
  {
    swift_release();
  }
  sub_100005A10(&qword_1000410C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100032390();
    sub_100006AA4();
    uint64_t v7 = sub_1000295E4();
    v8(v7);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100029018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComplicationWorkflowIcon();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002907C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ComplicationWorkflowIcon() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100027C5C(a1, v6, a2);
}

unint64_t sub_1000290FC()
{
  unint64_t result = qword_100041BC0;
  if (!qword_100041BC0)
  {
    sub_100005B98(&qword_100041BB8);
    sub_10002919C();
    sub_100009060(&qword_100041BF8, &qword_100041C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041BC0);
  }
  return result;
}

unint64_t sub_10002919C()
{
  unint64_t result = qword_100041BC8;
  if (!qword_100041BC8)
  {
    sub_100005B98(&qword_100041BD0);
    sub_100029210();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041BC8);
  }
  return result;
}

unint64_t sub_100029210()
{
  unint64_t result = qword_100041BD8;
  if (!qword_100041BD8)
  {
    sub_100005B98(&qword_100041BE0);
    sub_1000292F4();
    type metadata accessor for WidgetSStackView(255);
    sub_10002942C(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041BD8);
  }
  return result;
}

unint64_t sub_1000292F4()
{
  unint64_t result = qword_100041BE8;
  if (!qword_100041BE8)
  {
    sub_100005B98(&qword_100041BF0);
    sub_10002942C((unint64_t *)&qword_100041210, (void (*)(uint64_t))&type metadata accessor for IconView);
    sub_10002942C(&qword_100041330, (void (*)(uint64_t))type metadata accessor for WidgetSStackView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041BE8);
  }
  return result;
}

uint64_t sub_1000293D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100031EC0();
  *a1 = result;
  return result;
}

uint64_t sub_1000293FC()
{
  return sub_100031ED0();
}

uint64_t sub_10002942C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100029474(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100006AA4();
  uint64_t v3 = sub_1000295E4();
  v4(v3);
  return a1;
}

uint64_t sub_1000294C4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100006AA4();
  uint64_t v4 = sub_100014E90();
  v5(v4);
  return a2;
}

uint64_t sub_100029518(uint64_t a1, uint64_t *a2)
{
  sub_100005A10(a2);
  sub_100006AA4();
  uint64_t v3 = sub_1000295E4();
  v4(v3);
  return a1;
}

uint64_t sub_100029564()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000295E4()
{
  return v0;
}

unint64_t sub_1000295F8()
{
  unint64_t result = qword_100041C30;
  if (!qword_100041C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041C30);
  }
  return result;
}

unint64_t sub_100029648()
{
  unint64_t result = qword_100041C38[0];
  if (!qword_100041C38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041C38);
  }
  return result;
}

void *sub_100029694(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1)
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = (unsigned char *)(swift_bridgeObjectRetain() + 48);
  uint64_t v3 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v4 = *((void *)v2 - 2);
    if (*v2)
    {
      uint64_t v5 = *((void *)v2 - 1);
      swift_bridgeObjectRetain();
      sub_100021FA0();
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      sub_100023858(v4, v5, 1);
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      if (v4)
      {
        uint64_t v12 = &qword_1000458F8;
        if (qword_100040B00 != -1)
        {
          swift_once();
          uint64_t v12 = &qword_1000458F8;
        }
      }
      else
      {
        uint64_t v12 = &qword_1000458C0;
        if (qword_100040AD0 != -1)
        {
          swift_once();
          uint64_t v12 = &qword_1000458C0;
        }
      }
      uint64_t v7 = *v12;
      uint64_t v9 = v12[1];
      uint64_t v11 = v12[2];
      swift_retain();
      swift_retain();
      swift_retain();
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v3 = sub_10002C260(0, v3[2] + 1, 1, (uint64_t)v3, &qword_100041530, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C36C, (void (*)(uint64_t, uint64_t, void *))sub_100019314);
    }
    unint64_t v14 = v3[2];
    unint64_t v13 = v3[3];
    if (v14 >= v13 >> 1) {
      uint64_t v3 = sub_10002C260((void *)(v13 > 1), v14 + 1, 1, (uint64_t)v3, &qword_100041530, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C36C, (void (*)(uint64_t, uint64_t, void *))sub_100019314);
    }
    v3[2] = v14 + 1;
    uint64_t v15 = &v3[3 * v14];
    v15[4] = v7;
    v15[5] = v9;
    v15[6] = v11;
LABEL_17:
    v2 += 24;
    --v1;
  }
  while (v1);
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000298FC()
{
  return sub_100019CBC((uint64_t)sub_100029910);
}

uint64_t sub_100029910()
{
  if (qword_100040AD0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1000458C0;
  uint64_t v0 = *(void *)algn_1000458C8;
  uint64_t v2 = qword_1000458D0;
  sub_100009328();
  uint64_t v5 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return v5(v1, v0, v2);
}

uint64_t sub_1000299D8()
{
  uint64_t v0 = sub_100031CB0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v19 - v5;
  NSString v7 = sub_100032560();
  NSString v8 = sub_100032560();
  id v9 = sub_100031508(v7);

  uint64_t v10 = sub_100032570();
  uint64_t v12 = v11;

  uint64_t v13 = sub_100020C9C();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100020F20();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  sub_100031830();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  uint64_t v19 = v10;
  uint64_t v20 = v12;
  sub_100031830();
  uint64_t v19 = 0;
  LOBYTE(v20) = 1;
  sub_100031830();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  qword_1000458F8 = v13;
  unk_100045900 = v15;
  qword_100045908 = v17;
  return result;
}

uint64_t sub_100029BEC()
{
  sub_10000931C();
  v0[2] = v1;
  v0[3] = v2;
  uint64_t v3 = sub_100005A10(&qword_100040C70);
  sub_10000927C(v3);
  v0[4] = swift_task_alloc();
  uint64_t v4 = sub_100031CB0();
  v0[5] = v4;
  v0[6] = *(void *)(v4 - 8);
  v0[7] = swift_task_alloc();
  v0[8] = swift_task_alloc();
  return _swift_task_switch(sub_100029CE4, 0, 0);
}

uint64_t sub_100029CE4()
{
  uint64_t v1 = *(void *)(v0[2] + 16);
  if (v1)
  {
    uint64_t v2 = v0[6];
    uint64_t v23 = (void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v24 = (void (**)(uint64_t, void, uint64_t))(v2 + 32);
    uint64_t v22 = (void (**)(uint64_t, uint64_t))(v2 + 8);
    uint64_t v3 = swift_bridgeObjectRetain() + 40;
    uint64_t v4 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v6 = v0[4];
      uint64_t v5 = v0[5];
      swift_bridgeObjectRetain();
      sub_100031CA0();
      if (sub_100006148(v6, 1, v5) == 1)
      {
        sub_10002C67C(v0[4]);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v7 = v0[7];
        uint64_t v8 = v0[8];
        uint64_t v9 = v0[5];
        (*v24)(v8, v0[4], v9);
        (*v23)(v7, v8, v9);
        sub_10001FDC8();
        uint64_t v11 = v10;
        uint64_t v13 = v12;
        char v15 = v14;
        (*v22)(v8, v9);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_10002C260(0, v4[2] + 1, 1, (uint64_t)v4, (uint64_t *)&unk_100041D40, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C46C, (void (*)(uint64_t, uint64_t, void *))sub_100019374);
        }
        unint64_t v17 = v4[2];
        unint64_t v16 = v4[3];
        if (v17 >= v16 >> 1) {
          uint64_t v4 = sub_10002C260((void *)(v16 > 1), v17 + 1, 1, (uint64_t)v4, (uint64_t *)&unk_100041D40, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C46C, (void (*)(uint64_t, uint64_t, void *))sub_100019374);
        }
        _OWORD v4[2] = v17 + 1;
        uint64_t v18 = &v4[3 * v17];
        v18[4] = v11;
        v18[5] = v13;
        *((unsigned char *)v18 + 48) = v15 & 1;
      }
      v3 += 16;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = _swiftEmptyArrayStorage;
  }
  swift_retain();
  uint64_t v19 = sub_100029694((uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void *))v0[1];
  return v20(v19);
}

uint64_t sub_100029F9C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_100019CBC((uint64_t)sub_100029FB4);
}

uint64_t sub_100029FB4()
{
  sub_100005A10(&qword_100041530);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100035A30;
  if (qword_100040AD0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_1000458C8;
  uint64_t v3 = qword_1000458D0;
  *(void *)(v1 + 32) = qword_1000458C0;
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v4 = sub_100022388();
  sub_10002C56C(v4);
  uint64_t v5 = v1;
  if (qword_100040B00 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1000458F8;
  uint64_t v6 = unk_100045900;
  uint64_t v8 = qword_100045908;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)v5;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v9 = sub_10002C260(0, *(void *)(v5 + 16) + 1, 1, v5, &qword_100041530, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C36C, (void (*)(uint64_t, uint64_t, void *))sub_100019314);
  }
  unint64_t v11 = v9[2];
  unint64_t v10 = v9[3];
  if (v11 >= v10 >> 1) {
    uint64_t v9 = sub_10002C260((void *)(v10 > 1), v11 + 1, 1, (uint64_t)v9, &qword_100041530, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C36C, (void (*)(uint64_t, uint64_t, void *))sub_100019314);
  }
  _OWORD v9[2] = v11 + 1;
  uint64_t v12 = &v9[3 * v11];
  v12[4] = v7;
  v12[5] = v6;
  v12[6] = v8;
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(uint64_t (**)(void *))(v0 + 8);
  return v13(v9);
}

uint64_t sub_10002A224()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10001831C;
  return sub_100029BEC();
}

uint64_t sub_10002A2C0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10002A358;
  return sub_100029F9C(v3);
}

uint64_t sub_10002A358()
{
  sub_1000092D4();
  uint64_t v3 = v2;
  sub_1000091FC();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  sub_100019D44();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  uint64_t v8 = *(uint64_t (**)(void))(v6 + 8);
  return v8();
}

unint64_t sub_10002A43C()
{
  unint64_t result = qword_100041C50[0];
  if (!qword_100041C50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041C50);
  }
  return result;
}

uint64_t sub_10002A488(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002BFA0();
  *uint64_t v5 = v2;
  v5[1] = sub_10002A53C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10002A53C()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v1 = *v0;
  sub_100019D44();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100009328();
  return v3();
}

uint64_t sub_10002A5FC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10002A68C;
  return sub_1000298FC();
}

uint64_t sub_10002A68C()
{
  sub_1000092D4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_1000091FC();
  uint64_t v8 = *(void **)(v7 + 16);
  uint64_t v9 = *v0;
  sub_100019D44();
  *uint64_t v10 = v9;
  swift_task_dealloc();
  *uint64_t v8 = v6;
  v8[1] = v4;
  v8[2] = v2;
  sub_100009328();
  return v11();
}

unint64_t sub_10002A780()
{
  unint64_t result = qword_100041C68;
  if (!qword_100041C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041C68);
  }
  return result;
}

uint64_t sub_10002A7CC()
{
  uint64_t v0 = sub_100032550();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100031C30();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031D30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100031C50();
  sub_100015DDC(v6, qword_100045910);
  sub_100015DA4(v6, (uint64_t)qword_100045910);
  sub_1000324E0();
  sub_100031D20();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  return sub_100031C60();
}

uint64_t sub_10002A9B8()
{
  if (qword_100040B08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031C50();

  return sub_100015DA4(v0, (uint64_t)qword_100045910);
}

uint64_t sub_10002AA1C()
{
  return sub_1000318A0();
}

uint64_t sub_10002AA40()
{
  return sub_1000318A0();
}

uint64_t sub_10002AA64()
{
  uint64_t v1 = sub_100031AE0();
  sub_100006A88();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100009264();
  swift_getKeyPath();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, enum case for EquatableComparisonOperator.equalTo(_:), v1);
  sub_100005A10(&qword_100041CF0);
  sub_10002A780();
  sub_100009060(&qword_100041CF8, &qword_100041CF0);
  sub_100009060(&qword_100041D00, &qword_100041CA0);
  sub_10002261C();
  return sub_100031B00();
}

uint64_t sub_10002ABF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002AA1C();
  *a1 = result;
  return result;
}

uint64_t sub_10002AC24@<X0>(uint64_t a1@<X8>)
{
  v12[1] = a1;
  uint64_t v1 = sub_100005A10(&qword_100041D08);
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100005A10(&qword_100041D10);
  __chkstk_darwin(v2);
  uint64_t v3 = sub_100005A10(&qword_100041CF0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v12 - v8;
  sub_10002A780();
  sub_100031A20();
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_100031A10(v13);
  swift_getKeyPath();
  sub_100005A10(&qword_100041D18);
  sub_100031A00();
  swift_release();
  v14._countAndFlagsBits = 32;
  v14._object = (void *)0xE100000000000000;
  sub_100031A10(v14);
  swift_getKeyPath();
  sub_100005A10(&qword_100041D20);
  sub_100031A00();
  swift_release();
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  sub_100031A10(v15);
  sub_100031A30();
  sub_1000319F0();
  sub_100009060(&qword_100041CF8, &qword_100041CF0);
  sub_100031A80();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  sub_100031A70();
  return ((uint64_t (*)(char *, uint64_t))v10)(v9, v3);
}

uint64_t sub_10002AF28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002AA40();
  *a1 = result;
  return result;
}

uint64_t sub_10002AF54@<X0>(uint64_t a1@<X8>)
{
  v12[1] = a1;
  uint64_t v1 = sub_100005A10(&qword_100041D08);
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100005A10(&qword_100041D10);
  __chkstk_darwin(v2);
  uint64_t v3 = sub_100005A10(&qword_100041CF0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v12 - v8;
  sub_10002A780();
  sub_100031A20();
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_100031A10(v13);
  swift_getKeyPath();
  sub_100005A10(&qword_100041D18);
  sub_100031A00();
  swift_release();
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  sub_100031A10(v14);
  sub_100031A30();
  sub_1000319F0();
  sub_100009060(&qword_100041CF8, &qword_100041CF0);
  sub_100031A80();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  sub_100031A70();
  return ((uint64_t (*)(char *, uint64_t))v10)(v9, v3);
}

uint64_t sub_10002B214()
{
  uint64_t v1 = sub_100032550();
  uint64_t v2 = sub_10000927C(v1);
  __chkstk_darwin(v2);
  sub_100009340();
  uint64_t v39 = v3;
  __chkstk_darwin(v4);
  uint64_t v44 = sub_100031A60();
  sub_100006A88();
  uint64_t v40 = v5;
  __chkstk_darwin(v6);
  sub_100005BF8();
  uint64_t v45 = v8 - v7;
  uint64_t v9 = sub_100005A10(&qword_100040B28);
  uint64_t v10 = sub_10000927C(v9);
  __chkstk_darwin(v10);
  sub_100009340();
  uint64_t v46 = v11;
  __chkstk_darwin(v12);
  uint64_t v41 = (uint64_t)&v35 - v13;
  uint64_t v14 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v15 = sub_10000927C(v14);
  __chkstk_darwin(v15);
  sub_100009264();
  uint64_t v16 = sub_100031C30();
  sub_100006A88();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_100005BF8();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_100031D30();
  uint64_t v24 = sub_10000927C(v23);
  __chkstk_darwin(v24);
  sub_100005BF8();
  uint64_t v25 = sub_100031C50();
  __chkstk_darwin(v25);
  sub_100009340();
  uint64_t v42 = v26;
  __chkstk_darwin(v27);
  sub_1000324E0();
  uint64_t v35 = sub_100005A10(&qword_100041CA0);
  sub_100031D20();
  uint64_t v28 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 104);
  uint64_t v38 = v16;
  uint64_t v36 = v29;
  v29(v22, enum case for LocalizedStringResource.BundleDescription.main(_:), v16);
  sub_10002C6DC();
  uint64_t v43 = v0;
  sub_100005A54(v0, 1, 1, v25);
  if (qword_100040AD0 != -1) {
    swift_once();
  }
  long long v47 = xmmword_1000458C0;
  *(void *)&long long v48 = qword_1000458D0;
  uint64_t v30 = sub_100031800();
  sub_100005A54(v41, 1, 1, v30);
  sub_100005A54(v46, 1, 1, v30);
  uint64_t v31 = qword_100040B18;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v50 = qword_100045948;
  unsigned int v37 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v40 = *(void *)(v40 + 104);
  ((void (*)(uint64_t))v40)(v45);
  sub_10002BFA0();
  swift_retain();
  uint64_t v32 = v43;
  uint64_t v46 = sub_1000318C0();
  sub_1000324E0();
  uint64_t v41 = sub_100005A10(&qword_100041CB0);
  sub_100031D20();
  v36(v22, v28, v38);
  sub_10002C6DC();
  sub_100005A54(v32, 1, 1, v25);
  *(void *)&long long v47 = _swiftEmptyArrayStorage;
  sub_100005A10(&qword_100041CB8);
  sub_100005A10(&qword_100041CC0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100035A40;
  uint64_t v33 = *(void (**)(void))(*(void *)(sub_100031920() - 8) + 104);
  sub_10002C718();
  v33();
  sub_100031930();
  sub_10002C718();
  v33();
  sub_100031930();
  sub_10002C718();
  v33();
  sub_100031930();
  sub_10002C718();
  v33();
  sub_100031930();
  sub_100031940();
  sub_10002BFEC();
  sub_1000324B0();
  ((void (*)(uint64_t, void, uint64_t))v40)(v45, v37, v44);
  sub_100009060(&qword_100041CD0, qword_100041DC0);
  sub_100015C90();
  sub_1000318F0();
  sub_100005A10(&qword_100041440);
  sub_100031760();
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v49 = 0;
  sub_100031750();
  sub_100031710();
  sub_100005A10(&qword_100041F10);
  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  sub_100031750();
  sub_100031710();
  return v46;
}

uint64_t sub_10002B984()
{
  uint64_t v0 = qword_100041C20;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10002B9C0()
{
  unint64_t result = qword_100041C70;
  if (!qword_100041C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041C70);
  }
  return result;
}

unint64_t sub_10002BA10()
{
  unint64_t result = qword_100041C78;
  if (!qword_100041C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041C78);
  }
  return result;
}

uint64_t sub_10002BA5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002BA78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002A9B8();
  uint64_t v3 = sub_100031C50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10002BAE8()
{
  return byte_100045928;
}

uint64_t sub_10002BAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10002C1A4();
  *uint64_t v4 = v2;
  v4[1] = sub_10002BBA4;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10002BBA4()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v2 = *v1;
  sub_100019D44();
  *uint64_t v3 = v2;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    sub_100009328();
    return v5();
  }
  return result;
}

uint64_t sub_10002BC78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002B214();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_10002BCA4(uint64_t a1)
{
  unint64_t v2 = sub_10002BF54();

  return static CustomIntentMigratedAppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for ShortcutFolderWidgetConfigurationIntent()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for ShortcutFolderWidgetConfigurationIntent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ShortcutFolderWidgetConfigurationIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ShortcutFolderWidgetConfigurationIntent(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for ShortcutFolderWidgetConfigurationIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShortcutFolderWidgetConfigurationIntent(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for ShortcutFolderWidgetConfigurationIntent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShortcutFolderWidgetConfigurationIntent()
{
  return &type metadata for ShortcutFolderWidgetConfigurationIntent;
}

ValueMetadata *type metadata accessor for SortedVisibleWidgetCollectionsQuery()
{
  return &type metadata for SortedVisibleWidgetCollectionsQuery;
}

uint64_t sub_10002BF18()
{
  return sub_100009060(&qword_100041C88, &qword_100041C90);
}

unint64_t sub_10002BF54()
{
  unint64_t result = qword_100041C98;
  if (!qword_100041C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041C98);
  }
  return result;
}

unint64_t sub_10002BFA0()
{
  unint64_t result = qword_100041CA8;
  if (!qword_100041CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041CA8);
  }
  return result;
}

unint64_t sub_10002BFEC()
{
  unint64_t result = qword_100041CC8;
  if (!qword_100041CC8)
  {
    sub_100031920();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041CC8);
  }
  return result;
}

uint64_t sub_10002C03C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002C05C, 0, 0);
}

uint64_t sub_10002C05C()
{
  sub_1000092D4();
  if (qword_100040B18 != -1) {
    swift_once();
  }
  sub_10002C728(qword_100045948, *(void **)(v0 + 16));
  return v2();
}

uint64_t sub_10002C0F0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002C110, 0, 0);
}

uint64_t sub_10002C110()
{
  sub_1000092D4();
  if (qword_100040A78 != -1) {
    swift_once();
  }
  sub_10002C728(qword_100045808, *(void **)(v0 + 16));
  return v2();
}

unint64_t sub_10002C1A4()
{
  unint64_t result = qword_100041CE8;
  if (!qword_100041CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041CE8);
  }
  return result;
}

void *sub_10002C1F8(void *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_10002C260(a1, a2, a3, a4, &qword_100041530, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C36C, (void (*)(uint64_t, uint64_t, void *))sub_100019314);
}

void *sub_10002C22C(void *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_10002C260(a1, a2, a3, a4, (uint64_t *)&unk_100041D40, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C46C, (void (*)(uint64_t, uint64_t, void *))sub_100019374);
}

void *sub_10002C260(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    sub_100005A10(a5);
    uint64_t v15 = (void *)swift_allocObject();
    size_t v16 = j__malloc_size(v15);
    v15[2] = v13;
    _OWORD v15[3] = 2 * ((uint64_t)(v16 - 32) / 24);
  }
  else
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
  }
  uint64_t v17 = v15 + 4;
  if (v10)
  {
    a7(a4 + 32, v13, v17);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  return v15;
}

uint64_t sub_10002C36C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1000327B0();
  __break(1u);
  return result;
}

uint64_t sub_10002C46C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1000327B0();
  __break(1u);
  return result;
}

void *sub_10002C56C(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = sub_10002C260(result, v7, 1, v3, &qword_100041530, (void (*)(void, uint64_t, void *, uint64_t))sub_10002C36C, (void (*)(uint64_t, uint64_t, void *))sub_100019314);
    uint64_t v3 = (uint64_t)result;
  }
  if (!v6[2])
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = (void *)sub_1000195D0((unint64_t)(v6 + 4), v2, v3 + 24 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    *(void *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10002C67C(uint64_t a1)
{
  uint64_t v2 = sub_100005A10(&qword_100040C70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002C6DC()
{
  return sub_100031C60();
}

uint64_t sub_10002C728@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_retain();
}

unint64_t sub_10002C74C()
{
  unint64_t result = qword_100041D50;
  if (!qword_100041D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D50);
  }
  return result;
}

unint64_t sub_10002C79C()
{
  unint64_t result = qword_100041D58;
  if (!qword_100041D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D58);
  }
  return result;
}

uint64_t sub_10002C7E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002C804()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002C854(uint64_t a1)
{
  long long v3 = *(_OWORD *)a1;
  long long v26 = *(_OWORD *)(a1 + 16);
  long long v27 = v3;
  long long v25 = *(_OWORD *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v4 = sub_100031A60();
  sub_100006A88();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100005BF8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_100005A10(&qword_100040B28);
  uint64_t v12 = sub_10000927C(v11);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v23 - v16;
  uint64_t v18 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v19 = sub_10000927C(v18);
  __chkstk_darwin(v19);
  sub_10003093C();
  uint64_t v20 = sub_100031C50();
  __chkstk_darwin(v20);
  sub_100005BF8();
  sub_100005A10(&qword_100041438);
  sub_1000309A8();
  sub_10003098C(v1);
  sub_100031800();
  sub_100030A04();
  sub_10003098C((uint64_t)v17);
  sub_10003098C((uint64_t)v15);
  if (qword_100040B18 != -1) {
    swift_once();
  }
  uint64_t v28 = qword_100045948;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, enum case for InputConnectionBehavior.default(_:), v4);
  sub_10002F82C();
  swift_retain();
  uint64_t v21 = sub_1000318C0();
  sub_100005A10(&qword_100041F10);
  sub_100031760();
  long long v29 = 0u;
  long long v30 = 0u;
  *(void *)&long long v31 = 0;
  swift_retain();
  sub_100031750();
  sub_100031710();
  long long v29 = v27;
  long long v30 = v26;
  long long v31 = v25;
  uint64_t v32 = v24;
  swift_retain();
  swift_retain();
  sub_10001055C(a1);
  sub_100031890();
  sub_100019B68(a1);
  swift_release();
  swift_release_n();
  return v21;
}

uint64_t sub_10002CB88()
{
  uint64_t v0 = sub_100032550();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100031C30();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031D30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100031C50();
  sub_100015DDC(v6, qword_100045930);
  sub_100015DA4(v6, (uint64_t)qword_100045930);
  sub_1000324E0();
  sub_100031D20();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  return sub_100031C60();
}

uint64_t sub_10002CD78()
{
  if (qword_100040B10 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031C50();

  return sub_100015DA4(v0, (uint64_t)qword_100045930);
}

uint64_t sub_10002CDDC()
{
  uint64_t v0 = sub_100031A60();
  sub_100006A88();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_100005BF8();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100005A10(&qword_100040B28);
  uint64_t v8 = sub_10000927C(v7);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v22 - v12;
  uint64_t v14 = sub_100005A10((uint64_t *)&unk_100041F00);
  uint64_t v15 = sub_10000927C(v14);
  __chkstk_darwin(v15);
  sub_100005BF8();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_100031C50();
  __chkstk_darwin(v19);
  sub_10003093C();
  sub_100005A10(&qword_100041438);
  sub_1000309A8();
  sub_100030970(v18);
  sub_100031800();
  sub_100030A04();
  sub_100030970((uint64_t)v13);
  sub_100030970((uint64_t)v11);
  if (qword_100040B18 != -1) {
    swift_once();
  }
  v22[1] = qword_100045948;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, enum case for InputConnectionBehavior.default(_:), v0);
  sub_10002F82C();
  swift_retain();
  uint64_t v20 = sub_1000318C0();
  sub_100005A10(&qword_100041F10);
  sub_100031760();
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v25 = 0;
  sub_100031750();
  sub_100031710();
  return v20;
}

uint64_t sub_10002D088()
{
  sub_10000931C();
  v0[62] = v1;
  v0[63] = v2;
  v0[61] = v3;
  uint64_t v4 = sub_100005A10(&qword_100040C70);
  sub_10000927C(v4);
  v0[64] = swift_task_alloc();
  sub_100009368();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_10002D114()
{
  sub_100031880();
  uint64_t v1 = *(void *)(v0 + 208);
  if (v1)
  {
    sub_100031820();
    if (!*(void *)(v0 + 464)
      || (sub_1000309E4(), v33 = sub_100031CC0(), unint64_t v3 = v2, swift_bridgeObjectRelease(), v3 >> 60 == 15))
    {
      sub_100030900(v1);
    }
    else
    {
      sub_100010350(0, &qword_1000410D8);
      sub_100010350(0, &qword_100041F40);
      uint64_t v4 = sub_1000326A0();
      *(void *)(v0 + 520) = v4;
      long long v24 = (void *)v4;
      sub_10001038C(v33, v3);
      sub_100030900(v1);
      if (v24)
      {
        id v25 = [objc_allocWithZone((Class)WFSystemActionRunnerClient) initWithSystemAction:v24];
        *(void *)(v0 + 528) = v25;
        if (!v25)
        {
          sub_100031810();

          swift_task_dealloc();
          sub_1000092C4();
          sub_100030954();
          __asm { BRAA            X1, X16 }
        }
        id v26 = v25;
        *(void *)(v0 + 472) = 0;
        uint64_t v27 = swift_task_alloc();
        *(void *)(v0 + 536) = v27;
        long long v28 = *(_OWORD *)(v0 + 496);
        *(void *)(v27 + 16) = v0 + 472;
        *(_OWORD *)(v27 + 24) = v28;
        *(void *)(v27 + 40) = v26;
        *(void *)(v27 + 48) = v24;
        long long v29 = (void *)swift_task_alloc();
        *(void *)(v0 + 544) = v29;
        *long long v29 = v0;
        v29[1] = sub_10002D5EC;
        sub_100030898();
        goto LABEL_8;
      }
    }
  }
  sub_100031880();
  long long v5 = *(_OWORD *)(v0 + 264);
  long long v6 = *(_OWORD *)(v0 + 280);
  *(_OWORD *)(v0 + 560) = v5;
  *(_OWORD *)(v0 + 576) = v6;
  *(_OWORD *)(v0 + 592) = *(_OWORD *)(v0 + 296);
  *(void *)(v0 + 608) = *(void *)(v0 + 312);
  if ((void)v5)
  {
    long long v34 = *(_OWORD *)(v0 + 496);
    sub_100031820();
    uint64_t v7 = *(void *)(v0 + 440);
    uint64_t v8 = *(void *)(v0 + 448);
    *(void *)(v0 + 616) = v8;
    sub_100010350(0, (unint64_t *)&unk_100041F30);
    swift_bridgeObjectRetain();
    id v9 = sub_10002E5F4(v7, v8, 1);
    *(void *)(v0 + 624) = v9;
    *(void *)(v0 + 480) = 0;
    uint64_t v10 = swift_task_alloc();
    *(void *)(v0 + 632) = v10;
    *(void *)(v10 + 16) = v0 + 480;
    *(_OWORD *)(v10 + 24) = v34;
    *(void *)(v10 + 40) = v9;
    *(void *)(v10 + 48) = v7;
    *(void *)(v10 + 56) = v8;
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 640) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_10002D754;
    sub_100030898();
LABEL_8:
    sub_100030954();
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  uint64_t v13 = *(void *)(v0 + 512);
  uint64_t v14 = sub_100032570();
  uint64_t v16 = v15;
  uint64_t v17 = sub_1000324B0();
  uint64_t v18 = sub_100031CB0();
  sub_100005A54(v13, 1, 1, v18);
  id v19 = objc_allocWithZone((Class)WFAppLaunchRequest);
  id v20 = sub_100008AF0(v14, v16, v17, v13, 0, 0);
  *(void *)(v0 + 656) = v20;
  *(void *)(v0 + 144) = v0;
  *(void *)(v0 + 184) = v0 + 688;
  *(void *)(v0 + 152) = sub_10002D914;
  uint64_t v21 = swift_continuation_init();
  *(void *)(v0 + 320) = _NSConcreteStackBlock;
  *(void *)(v0 + 328) = 0x40000000;
  *(void *)(v0 + 336) = sub_100008718;
  *(void *)(v0 + 344) = &unk_10003E758;
  *(void *)(v0 + 352) = v21;
  [v20 performWithCompletionHandler:v0 + 320];
  sub_100030954();
  return _swift_continuation_await(v22);
}

uint64_t sub_10002D5EC()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v3 = v2;
  sub_100009334();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_100019D44();
  *long long v6 = v5;
  *(void *)(v3 + 552) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  sub_100009368();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10002D6D0()
{
  sub_1000092D4();
  uint64_t v1 = *(void **)(v0 + 528);
  uint64_t v2 = *(void **)(v0 + 520);

  sub_100031810();
  swift_task_dealloc();
  sub_1000092C4();
  return v3();
}

uint64_t sub_10002D754()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v3 = v2;
  sub_100009334();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_100019D44();
  *long long v6 = v5;
  *(void *)(v3 + 648) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  sub_100009368();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10002D844()
{
  uint64_t v1 = *(void **)(v0 + 624);
  uint64_t v2 = *(void *)(v0 + 560);

  sub_100031810();
  sub_1000102C4(v2);
  swift_task_dealloc();
  sub_1000092C4();
  return v3();
}

uint64_t sub_10002D914()
{
  sub_10000931C();
  sub_1000091FC();
  sub_100009334();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 664) = *(void *)(v3 + 176);
  sub_100009368();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_10002D9F4()
{
  sub_1000092D4();
  if ((*(unsigned char *)(v0 + 688) & 1) != 0 || !VCIsDeviceLocked())
  {
    uint64_t v3 = *(void **)(v0 + 656);
    sub_100031810();

    swift_task_dealloc();
    sub_1000092C4();
    return v4();
  }
  else
  {
    id v1 = [objc_allocWithZone((Class)WFCompactUnlockService) init];
    *(void *)(v0 + 672) = v1;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 689;
    *(void *)(v0 + 24) = sub_10002DB60;
    uint64_t v2 = swift_continuation_init();
    *(void *)(v0 + 400) = _NSConcreteStackBlock;
    *(void *)(v0 + 408) = 0x40000000;
    *(void *)(v0 + 416) = sub_1000087E4;
    *(void *)(v0 + 424) = &unk_10003E770;
    *(void *)(v0 + 432) = v2;
    [v1 requestUnlockIfNeeded:v0 + 400];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_10002DB60()
{
  sub_10000931C();
  uint64_t v1 = *v0;
  sub_100019D44();
  *uint64_t v2 = v1;
  sub_100009368();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_10002DC30()
{
  sub_1000092D4();
  if (*(unsigned char *)(v0 + 689) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 656);
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 120) = v0 + 690;
    *(void *)(v0 + 88) = sub_10002DD84;
    uint64_t v2 = swift_continuation_init();
    *(void *)(v0 + 360) = _NSConcreteStackBlock;
    *(void *)(v0 + 368) = 0x40000000;
    *(void *)(v0 + 376) = sub_100008718;
    *(void *)(v0 + 384) = &unk_10003E788;
    *(void *)(v0 + 392) = v2;
    [v1 performWithCompletionHandler:v0 + 360];
    return _swift_continuation_await(v0 + 80);
  }
  else
  {

    uint64_t v3 = *(void **)(v0 + 656);
    sub_100031810();

    swift_task_dealloc();
    sub_1000092C4();
    return v4();
  }
}

uint64_t sub_10002DD84()
{
  sub_10000931C();
  sub_1000091FC();
  sub_100009334();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 680) = *(void *)(v3 + 112);
  sub_100009368();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_10002DE64()
{
  sub_10000931C();

  uint64_t v1 = *(void **)(v0 + 656);
  sub_100031810();

  swift_task_dealloc();
  sub_1000092C4();
  return v2();
}

uint64_t sub_10002DED4()
{
  sub_10000931C();
  uint64_t v1 = *(void **)(v0 + 520);

  swift_task_dealloc();
  swift_task_dealloc();
  sub_100009328();
  return v2();
}

uint64_t sub_10002DF54()
{
  sub_1000092D4();
  uint64_t v1 = *(void **)(v0 + 624);
  sub_1000102C4(*(void *)(v0 + 560));

  swift_bridgeObjectRelease();
  swift_task_dealloc();

  swift_task_dealloc();
  sub_100009328();
  return v2();
}

uint64_t sub_10002E000()
{
  sub_1000092D4();
  uint64_t v1 = *(void **)(v0 + 656);
  swift_willThrow();

  swift_task_dealloc();
  sub_100009328();
  return v2();
}

uint64_t sub_10002E074()
{
  sub_1000092D4();
  uint64_t v1 = *(void **)(v0 + 672);
  uint64_t v2 = *(void **)(v0 + 656);
  swift_willThrow();

  swift_task_dealloc();
  sub_100009328();
  return v3();
}

uint64_t sub_10002E0F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v12 = sub_100005A10(&qword_100041EA0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005A10(&qword_100041EC8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v18 + 16))(v17, a1);
  sub_100031700();
  uint64_t v19 = v28[1];
  id v20 = objc_allocWithZone((Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate());
  id v21 = sub_10002E9DC((uint64_t)v17, v19);
  uint64_t v22 = (void *)*a2;
  *a2 = v21;

  [a5 setDelegate:*a2];
  uint64_t v23 = sub_100032660();
  sub_100005A54((uint64_t)v14, 1, 1, v23);
  long long v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = a3;
  v24[5] = a4;
  v24[6] = a6;
  v24[7] = a5;
  swift_retain();
  swift_retain();
  id v25 = a6;
  id v26 = a5;
  sub_10002E48C((uint64_t)v14, (uint64_t)&unk_100041F50, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_10002E2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[3] = a5;
  return _swift_task_switch(sub_10002E310, 0, 0);
}

uint64_t sub_10002E310()
{
  sub_1000092D4();
  uint64_t v1 = (void *)v0[4];
  sub_100031700();
  v0[6] = v0[2];
  id v2 = [v1 identifier];
  uint64_t v3 = sub_100032570();
  uint64_t v5 = v4;

  v0[7] = v3;
  v0[8] = v5;
  sub_1000309E4();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_10002E3B4()
{
  sub_10000931C();
  sub_100009634(*(void *)(v0 + 56), *(void *)(v0 + 64));
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009368();
  return _swift_task_switch(v1, v2, v3);
}

uint64_t sub_10002E42C()
{
  sub_10000931C();
  [*(id *)(v0 + 40) start];
  sub_100009328();
  return v1();
}

uint64_t sub_10002E48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100032660();
  if (sub_100006148(a1, 1, v6) == 1)
  {
    sub_100030118(a1);
  }
  else
  {
    sub_100032650();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100032610();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

id sub_10002E5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = sub_100032560();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithWorkflowIdentifier:v5 location:a3];

  return v6;
}

uint64_t sub_10002E670(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_100005A10(&qword_100041EA0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005A10(&qword_100041EC8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v20 + 16))(v19, a1);
  sub_100031700();
  uint64_t v21 = v29[1];
  id v22 = objc_allocWithZone((Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate());
  id v23 = sub_10002E9DC((uint64_t)v19, v21);
  long long v24 = (void *)*a2;
  *a2 = v23;

  [a5 setDelegate:*a2];
  uint64_t v25 = sub_100032660();
  sub_100005A54((uint64_t)v16, 1, 1, v25);
  id v26 = (void *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = a3;
  v26[5] = a4;
  v26[6] = a6;
  v26[7] = a7;
  v26[8] = a5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v27 = a5;
  sub_10002E48C((uint64_t)v16, (uint64_t)&unk_100041F60, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_10002E880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  return _swift_task_switch(sub_10002E8A4, 0, 0);
}

uint64_t sub_10002E8A4()
{
  sub_10000931C();
  sub_100031700();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 56) = v1;
  return _swift_task_switch(sub_10002E910, v1, 0);
}

uint64_t sub_10002E910()
{
  sub_10000931C();
  sub_100009634(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_release();
  sub_100009368();
  return _swift_task_switch(v1, v2, v3);
}

uint64_t sub_10002E97C()
{
  sub_10000931C();
  [*(id *)(v0 + 48) start];
  sub_100009328();
  return v1();
}

id sub_10002E9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = &v2[OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_continuation];
  uint64_t v6 = sub_100005A10(&qword_100041EC8);
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  *(void *)&v2[OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker] = a2;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate();
  id v8 = [super init];
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v8;
}

uint64_t sub_10002EADC(void *a1, void *a2)
{
  uint64_t v5 = sub_100005A10(&qword_100041EA0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100032660();
  sub_100005A54((uint64_t)v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  _OWORD v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  v9[6] = v2;
  id v10 = a2;
  id v11 = v2;
  id v12 = a1;
  sub_10002E48C((uint64_t)v7, (uint64_t)&unk_100041ED8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_10002EBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return _swift_task_switch(sub_10002EBF0, 0, 0);
}

uint64_t sub_10002EBF0()
{
  sub_1000092D4();
  self;
  uint64_t v1 = sub_1000309CC();
  uint64_t v2 = *(void **)(v0 + 24);
  if (v1)
  {
    if (v2)
    {
      uint64_t v3 = (void *)v1;
      id v4 = *(id *)(v0 + 16);
      id v5 = v2;
      uint64_t v6 = sub_1000304BC([v3 context]);
      *(void *)(v0 + 40) = v7;
      if (v7)
      {
        uint64_t v8 = *(void *)(v0 + 32);
        *(void *)(v0 + 48) = v6;
        *(void *)(v0 + 56) = *(void *)(v8
                                         + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker);
        swift_retain();
LABEL_8:
        sub_1000309E4();
        return _swift_task_switch(v20, v21, v22);
      }
    }
  }
  else
  {
    self;
    uint64_t v9 = sub_1000309CC();
    if (v9 && v2)
    {
      id v10 = (void *)v9;
      id v11 = *(void **)(v0 + 24);
      id v12 = *(void **)(v0 + 16);
      *(void *)(v0 + 64) = *(void *)(*(void *)(v0 + 32)
                                       + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker);
      id v13 = v12;
      id v14 = v11;
      swift_retain();
      id v15 = [v10 action];
      id v16 = [v15 identifier];

      uint64_t v17 = sub_100032570();
      uint64_t v19 = v18;

      *(void *)(v0 + 72) = v17;
      *(void *)(v0 + 80) = v19;
      goto LABEL_8;
    }
  }
  sub_100009328();
  return v23();
}

uint64_t sub_10002EDB4()
{
  sub_10000931C();
  sub_100009860(*(void **)(v0 + 24), *(void *)(v0 + 48), *(void *)(v0 + 40));
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009368();
  return _swift_task_switch(v1, v2, v3);
}

uint64_t sub_10002EE30()
{
  sub_10000931C();
  uint64_t v1 = *(void **)(v0 + 24);

  sub_100009328();
  return v2();
}

uint64_t sub_10002EE8C()
{
  sub_10000931C();
  sub_100009860(*(void **)(v0 + 24), *(void *)(v0 + 72), *(void *)(v0 + 80));
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009368();
  return _swift_task_switch(v1, v2, v3);
}

uint64_t sub_10002EF84(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005A10(&qword_100041EA0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032660();
  sub_100005A54((uint64_t)v8, 1, 1, v9);
  id v10 = (void *)swift_allocObject();
  void v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a3;
  v10[6] = v3;
  id v11 = a1;
  swift_errorRetain();
  id v12 = v3;
  sub_10002E48C((uint64_t)v8, (uint64_t)&unk_100041EB0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_10002F078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = sub_100005A10(&qword_100041EC8);
  uint64_t v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return _swift_task_switch(sub_10002F140, 0, 0);
}

uint64_t sub_10002F140()
{
  self;
  uint64_t v1 = sub_1000309CC();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = *(id *)(v0 + 32);
    *(void *)(v0 + 80) = sub_1000304BC([v2 context]);
    *(void *)(v0 + 88) = v4;
    if (v4)
    {
      uint64_t v5 = *(void *)(v0 + 40);
      uint64_t v6 = sub_100030868();
      v7(v6);
      if (v5)
      {
        *(void *)(v0 + 24) = v5;
        swift_errorRetain();
        sub_100032620();
      }
      else
      {
        sub_100032630();
      }
      uint64_t v22 = sub_100030924();
      v23(v22);
      *(void *)(v0 + 96) = *(void *)(*(void *)(v0 + 48)
                                       + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker);
LABEL_16:
      swift_retain();
      sub_1000309E4();
      return _swift_task_switch(v28, v29, v30);
    }
  }
  else
  {
    self;
    uint64_t v8 = sub_1000309CC();
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = *(void *)(v0 + 40);
      id v11 = *(id *)(v0 + 32);
      id v12 = [v9 action];
      id v13 = [v12 identifier];

      uint64_t v14 = sub_100032570();
      uint64_t v16 = v15;

      *(void *)(v0 + 104) = v14;
      *(void *)(v0 + 112) = v16;
      if (v10)
      {
        uint64_t v17 = *(void *)(v0 + 40);
        uint64_t v18 = sub_100030868();
        v19(v18);
        *(void *)(v0 + 16) = v17;
        swift_errorRetain();
        sub_100032620();
      }
      else
      {
        uint64_t v24 = sub_100030868();
        v25(v24);
        sub_100032630();
      }
      uint64_t v26 = sub_100030924();
      v27(v26);
      *(void *)(v0 + 120) = *(void *)(*(void *)(v0 + 48)
                                        + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker);
      goto LABEL_16;
    }
  }
  swift_task_dealloc();
  sub_100009328();
  return v20();
}

uint64_t sub_10002F3AC()
{
  sub_10000931C();
  sub_100009C28(*(void *)(v0 + 80), *(void *)(v0 + 88));
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009368();
  return _swift_task_switch(v1, v2, v3);
}

uint64_t sub_10002F424()
{
  sub_10000931C();

  swift_task_dealloc();
  sub_100009328();
  return v1();
}

uint64_t sub_10002F484()
{
  sub_10000931C();
  sub_100009C28(*(void *)(v0 + 104), *(void *)(v0 + 112));
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009368();
  return _swift_task_switch(v1, v2, v3);
}

void sub_10002F598()
{
}

id sub_10002F5EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate();
  return [super dealloc];
}

uint64_t sub_10002F6A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002CD78();
  uint64_t v3 = sub_100031C50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10002F718()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100030864;
  return sub_10002D088();
}

uint64_t sub_10002F7C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002CDDC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002F7EC(uint64_t a1)
{
  unint64_t v2 = sub_100019E44();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10002F82C()
{
  unint64_t result = qword_100041D70;
  if (!qword_100041D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D70);
  }
  return result;
}

uint64_t sub_10002F878()
{
  sub_1000092D4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100019CB8;
  return sub_100017BA4(v4, v2);
}

uint64_t sub_10002F91C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100009368();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_10002F940(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10002F9F0;
  return sub_10002F878();
}

uint64_t sub_10002F9F0()
{
  sub_1000092D4();
  uint64_t v3 = v2;
  sub_1000091FC();
  uint64_t v5 = v4;
  sub_100009334();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_100019D44();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

unint64_t sub_10002FAD0()
{
  unint64_t result = qword_100041D80;
  if (!qword_100041D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D80);
  }
  return result;
}

unint64_t sub_10002FB20()
{
  unint64_t result = qword_100041D88;
  if (!qword_100041D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D88);
  }
  return result;
}

uint64_t sub_10002FB6C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10001831C;
  return sub_100017894();
}

uint64_t sub_10002FC08(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100030858;
  return sub_10002F91C(v3);
}

unint64_t sub_10002FCA4()
{
  unint64_t result = qword_100041DA8;
  if (!qword_100041DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DA8);
  }
  return result;
}

uint64_t sub_10002FCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002F82C();
  *uint64_t v5 = v2;
  v5[1] = sub_10002A53C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10002FDA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002A53C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t sub_10002FE58()
{
  return type metadata accessor for RunShortcutIntent.RunnerClientDelegate();
}

uint64_t type metadata accessor for RunShortcutIntent.RunnerClientDelegate()
{
  uint64_t result = qword_100041E70;
  if (!qword_100041E70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002FEA8()
{
  sub_10002FF44();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10002FF44()
{
  if (!qword_100041E80)
  {
    sub_100005B98(&qword_100040CB8);
    unint64_t v0 = sub_100032640();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041E80);
    }
  }
}

ValueMetadata *type metadata accessor for ControlSortedVisibleShortcutsQuery()
{
  return &type metadata for ControlSortedVisibleShortcutsQuery;
}

ValueMetadata *type metadata accessor for RunShortcutIntent()
{
  return &type metadata for RunShortcutIntent;
}

unint64_t sub_10002FFD8()
{
  unint64_t result = qword_100041E90;
  if (!qword_100041E90)
  {
    sub_100005B98(&qword_100040CA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E90);
  }
  return result;
}

uint64_t sub_10003002C()
{
  swift_unknownObjectRelease();

  swift_errorRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003007C()
{
  sub_1000309F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100030888(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100030864;
  uint64_t v3 = sub_1000308E0();
  return sub_10002F078(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_100030118(uint64_t a1)
{
  uint64_t v2 = sub_100005A10(&qword_100041EA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100030178(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100030198, 0, 0);
}

uint64_t sub_100030198()
{
  sub_1000092D4();
  if (qword_100040A78 != -1) {
    swift_once();
  }
  **(void **)(v0 + 16) = qword_100045808;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  return v2();
}

uint64_t sub_10003023C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100030318;
  return v6(a1);
}

uint64_t sub_100030318()
{
  sub_10000931C();
  sub_1000091FC();
  uint64_t v1 = *v0;
  sub_100019D44();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000092C4();
  return v3();
}

uint64_t sub_1000303D8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100030410()
{
  sub_1000092D4();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100030888(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_10002A53C;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100041EB8 + dword_100041EB8);
  return v7(v2, v3);
}

uint64_t sub_1000304BC(void *a1)
{
  id v2 = [a1 workflowIdentifier];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100032570();

  return v3;
}

uint64_t sub_10003052C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003057C()
{
  sub_1000309F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100030888(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100030864;
  uint64_t v3 = sub_1000308E0();
  return sub_10002EBCC(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_100030618(uint64_t a1)
{
  return sub_10002E670(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_100030628(uint64_t a1)
{
  return sub_10002E0F0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_100030638()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100030690()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_100030888(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_100030864;
  uint64_t v5 = sub_1000308C0();
  return sub_10002E2EC(v5, v6, v7, v8, v9, v10, v1);
}

uint64_t sub_100030744()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10003079C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)sub_100030888(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_100030864;
  uint64_t v6 = sub_1000308C0();
  return sub_10002E880(v6, v7, v8, v9, v10, v11, v1, v2);
}

uint64_t sub_100030868()
{
  return v0;
}

uint64_t sub_100030888(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_1000308C0()
{
  return v0;
}

uint64_t sub_1000308E0()
{
  return v0;
}

uint64_t sub_100030900(uint64_t result)
{
  return sub_1000102C4(result);
}

uint64_t sub_100030924()
{
  return v0;
}

uint64_t sub_100030970(uint64_t a1)
{
  return sub_100005A54(a1, 1, 1, v1);
}

uint64_t sub_10003098C(uint64_t a1)
{
  return sub_100005A54(a1, 1, 1, v1);
}

uint64_t sub_1000309A8()
{
  return sub_100031C20();
}

uint64_t sub_1000309CC()
{
  return swift_dynamicCastObjCClass();
}

double sub_100030A04()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(void *)(v0 - 96) = 0;
  return result;
}

uint64_t sub_100030A18()
{
  uint64_t v1 = *(void **)(v0 + 16);
  Class isa = sub_1000325E0().super.isa;
  LOWORD(v7) = 0;
  id v3 = [v1 visibleReferencesForWorkflowIDs:isa sortBy:0 nameContaining:0 nameEqualing:0 associatedAppBundleIdentifier:0 hasTombstonedConflicts:0 isRecentlyModified:0 isRecentlyRun:0 limitTo:v7];

  id v4 = [v3 descriptors];
  sub_100010350(0, &qword_100042078);
  uint64_t v5 = sub_1000314CC();

  return v5;
}

uint64_t sub_100030AD8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6D6F74737563;
  }
  else {
    uint64_t v3 = 0x726F68732D6C6C61;
  }
  if (v2) {
    unint64_t v4 = 0xED00007374756374;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6D6F74737563;
  }
  else {
    uint64_t v5 = 0x726F68732D6C6C61;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xED00007374756374;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000327E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100030B80(char a1, char a2)
{
  if (*(void *)&aRoot_2[8 * a1] == *(void *)&aRoot_2[8 * a2]
    && *(void *)&aAdvancedlegaln_0[8 * a1 + 16] == *(void *)&aAdvancedlegaln_0[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_1000327E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100030C08()
{
  id v1 = [objc_allocWithZone((Class)WFWorkflowQuery) initWithLocation:0];
  [v1 setResultsLimit:1];
  id v2 = [*(id *)(v0 + 16) sortedWorkflowsWithQuery:v1];
  id v3 = [v2 descriptors];

  sub_100010350(0, &qword_100042078);
  unint64_t v4 = sub_1000325F0();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000327A0();
    swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_6;
    }
  }
  sub_10001969C(0, (v4 & 0xC000000000000001) == 0, v4);
  if ((v4 & 0xC000000000000001) != 0) {
    id v6 = (id)sub_100032710();
  }
  else {
    id v6 = *(id *)(v4 + 32);
  }
  uint64_t v5 = (uint64_t)v6;
LABEL_6:
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_100030D4C()
{
  id v1 = [*(id *)(v0 + 16) sortedVisibleWorkflowsByNameWithLimit:300];
  id v2 = [v1 descriptors];
  sub_100010350(0, &qword_100042078);
  uint64_t v3 = sub_1000314CC();

  return v3;
}

uint64_t sub_100030DD4()
{
  id v1 = *(void **)(v0 + 16);
  NSString v2 = sub_100032560();
  LOWORD(v7) = 0;
  id v3 = [v1 visibleReferencesForWorkflowIDs:0 sortBy:0 nameContaining:v2 nameEqualing:0 associatedAppBundleIdentifier:0 hasTombstonedConflicts:0 isRecentlyModified:0 isRecentlyRun:0 limitTo:300];

  id v4 = [v3 descriptors];
  sub_100010350(0, &qword_100042078);
  uint64_t v5 = sub_1000314CC();

  return v5;
}

uint64_t sub_100030E90()
{
  id v1 = [*(id *)(v0 + 16) sortedVisibleFolders];
  id v2 = [v1 descriptors];

  sub_100010350(0, &qword_100042098);
  uint64_t v3 = sub_1000314CC();

  return v3;
}

uint64_t sub_100030F0C()
{
  type metadata accessor for ShortcutsWidgetDataSource();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_100030F48();
  qword_100045948 = v0;
  return result;
}

uint64_t sub_100030F48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031DF0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  char v8 = &v22[-v7];
  *(void *)(v0 + 24) = 300;
  id v9 = [self currentProcess];
  sub_100005A10(&qword_100042080);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000379A0;
  sub_100010350(0, &qword_100042088);
  *(void *)(v10 + 32) = sub_100031334();
  id v23 = (id)v10;
  sub_100032600();
  id v11 = objc_allocWithZone((Class)RBSAssertion);
  id v12 = sub_100031424(0xD000000000000013, 0x8000000100033790, v9);
  id v23 = 0;
  if ([v12 acquireWithError:&v23])
  {
    id v13 = v23;
  }
  else
  {
    id v14 = v23;
    sub_100031C10();

    swift_willThrow();
    sub_100031DD0();
    uint64_t v15 = sub_100031DE0();
    os_log_type_t v16 = sub_100032670();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to acquire database initialization assertion", v17, 2u);
      swift_slowDealloc();
    }
    swift_errorRelease();

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  }
  if ([self initializeProcessWithDatabase:1])
  {
    sub_100031DD0();
    uint64_t v18 = sub_100031DE0();
    os_log_type_t v19 = sub_100032680();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to initialize database", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
  }
  *(void *)(v1 + 16) = [self defaultDatabase];
  WFWorkflowIconDrawerGloballyCacheDrawerContext();
  [v12 invalidate];

  return v1;
}

id sub_100031334()
{
  NSString v0 = sub_100032560();
  swift_bridgeObjectRelease();
  NSString v1 = sub_100032560();
  swift_bridgeObjectRelease();
  id v2 = [(id)swift_getObjCClassFromMetadata() attributeWithDomain:v0 name:v1];

  return v2;
}

uint64_t sub_1000313C8()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ShortcutsWidgetDataSource()
{
  return self;
}

id sub_100031424(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = sub_100032560();
  swift_bridgeObjectRelease();
  sub_100010350(0, &qword_100042090);
  Class isa = sub_1000325E0().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 initWithExplanation:v5 target:a3 attributes:isa];

  return v7;
}

uint64_t sub_1000314CC()
{
  return sub_1000325F0();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_100031508(void *a1)
{
  id v1 = a1;
  id v2 = sub_100031574();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id sub_100031574()
{
  if (qword_1000457E8 != -1) {
    dispatch_once(&qword_1000457E8, &stru_10003E810);
  }
  uint64_t v0 = (void *)qword_1000457E0;

  return v0;
}

void sub_1000315C8(id a1)
{
  memset(&v5, 0, sizeof(v5));
  if (dladdr(sub_100031574, &v5) && v5.dli_fname)
  {
    id v1 = [objc_alloc((Class)NSURL) initFileURLWithFileSystemRepresentation:v5.dli_fname isDirectory:0 relativeToURL:0];
    id v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v3 = +[NSBundle bundleWithURL:v2];
    uint64_t v4 = (void *)qword_1000457E0;
    qword_1000457E0 = v3;
  }
  else
  {
    id v1 = getWFGeneralLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "WFCurrentBundle_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
}

uint64_t sub_100031700()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t sub_100031710()
{
  return AppDependency.__allocating_init(key:manager:default:)();
}

uint64_t sub_100031720()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100031730()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100031740()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100031750()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_100031760()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_100031790()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000317A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000317B0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_1000317C0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000317D0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100031800()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100031810()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100031820()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_100031830()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_100031840()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100031850()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100031860()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100031870()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100031880()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100031890()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000318A0()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_1000318B0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000318C0()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)();
}

uint64_t sub_1000318D0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000318E0()
{
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000318F0()
{
  return IntentParameter<>.init(title:description:default:size:inputConnectionBehavior:)();
}

uint64_t sub_100031900()
{
  return IntentApplication.bundleIdentifier.getter();
}

uint64_t sub_100031910()
{
  return type metadata accessor for IntentApplication();
}

uint64_t sub_100031920()
{
  return type metadata accessor for IntentWidgetFamily();
}

uint64_t sub_100031930()
{
  return IntentCollectionSize.init(integerLiteral:)();
}

uint64_t sub_100031940()
{
  return type metadata accessor for IntentCollectionSize();
}

uint64_t sub_100031950()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100031960()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_100031970()
{
  return DisplayRepresentation.Image.init(data:isTemplate:)();
}

uint64_t sub_100031980()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100031990()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_1000319A0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000319B0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000319C0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000319E0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000319F0()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_100031A00()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_100031A10(Swift::String a1)
{
}

uint64_t sub_100031A20()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100031A30()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t sub_100031A60()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100031A70()
{
  return static ParameterSummaryBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100031A80()
{
  return static ParameterSummaryBuilder.buildExpression<A>(_:)();
}

uint64_t sub_100031AA0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100031AB0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100031AC0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100031AE0()
{
  return type metadata accessor for EquatableComparisonOperator();
}

uint64_t sub_100031B00()
{
  return ParameterSummaryWhenCondition.init<A>(_:identifier:_:_:otherwise:)();
}

uint64_t sub_100031B10()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_100031B20()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100031B30()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_100031B40()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100031B50()
{
  return URLComponents.url.getter();
}

uint64_t sub_100031B60()
{
  return URLComponents.host.getter();
}

uint64_t sub_100031B70()
{
  return URLComponents.host.setter();
}

uint64_t sub_100031B80()
{
  return URLComponents.path.getter();
}

uint64_t sub_100031B90()
{
  return URLComponents.path.setter();
}

uint64_t sub_100031BA0()
{
  return URLComponents.scheme.getter();
}

uint64_t sub_100031BB0()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_100031BC0()
{
  return URLComponents.init()();
}

uint64_t sub_100031BD0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100031BE0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100031BF0()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100031C00()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100031C10()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100031C20()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100031C30()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100031C40()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_100031C50()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100031C60()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100031C70()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t sub_100031C80()
{
  return URL.absoluteString.getter();
}

void sub_100031C90(NSURL *retstr@<X8>)
{
}

uint64_t sub_100031CA0()
{
  return URL.init(string:)();
}

uint64_t sub_100031CB0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100031CC0()
{
  return Data.init(base64Encoded:options:)();
}

NSData sub_100031CD0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100031CE0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031CF0()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_100031D00()
{
  return Date.init()();
}

uint64_t sub_100031D10()
{
  return type metadata accessor for Date();
}

uint64_t sub_100031D20()
{
  return static Locale.current.getter();
}

uint64_t sub_100031D30()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100031D40()
{
  return type metadata accessor for SStackFill();
}

uint64_t sub_100031D50()
{
  return SStackView.init(top:bottom:)();
}

uint64_t sub_100031D60()
{
  return GradientColorResolverView.init(gradient:_:)();
}

uint64_t sub_100031D70()
{
  return type metadata accessor for IconSize();
}

uint64_t sub_100031D80()
{
  return type metadata accessor for IconView.DisplayMode();
}

uint64_t sub_100031D90()
{
  return type metadata accessor for IconView();
}

uint64_t sub_100031DA0()
{
  return IconView.init(_:size:displayMode:animated:)();
}

uint64_t sub_100031DB0()
{
  return IconShape.init(insetFraction:)();
}

uint64_t sub_100031DC0()
{
  return type metadata accessor for IconShape();
}

uint64_t sub_100031DD0()
{
  return static WFLog.subscript.getter();
}

uint64_t sub_100031DE0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100031DF0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100031E00()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100031E10()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100031E20()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100031E30()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_100031E40()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_100031E50()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_100031E60()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100031E70()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100031E80()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100031E90()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100031EA0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100031EB0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100031EC0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100031ED0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100031EE0()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_100031EF0()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100031F00()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100031F10()
{
  return EnvironmentValues.widgetRenderingMode.setter();
}

uint64_t sub_100031F20()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100031F30()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100031F40()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100031F50()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100031F60()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100031F70()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100031F80()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_100031F90()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100031FA0()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_100031FB0()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100031FC0()
{
  return WidgetConfiguration.configurationDisplayName<A>(_:)();
}

uint64_t sub_100031FD0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100031FE0()
{
  return ControlWidgetTemplate.rasterizedImagesAllowed()();
}

uint64_t sub_100031FF0()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100032000()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t sub_100032010()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t sub_100032020()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t sub_100032030()
{
  return ControlWidgetConfiguration.promptsForUserConfiguration()();
}

uint64_t sub_100032040()
{
  return ControlWidgetConfiguration.preferredControlSize(_:)();
}

uint64_t sub_100032050()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100032060()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100032070()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100032080()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_100032090()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_1000320A0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000320B0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000320C0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000320D0()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_1000320E0()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_1000320F0()
{
  return Font.weight(_:)();
}

uint64_t sub_100032100()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_100032110()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100032120()
{
  return Text.font(_:)();
}

uint64_t sub_100032130()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100032140()
{
  return View.iconBlendMode(_:)();
}

uint64_t sub_100032150()
{
  return View.widgetLabel<A>(_:)();
}

uint64_t sub_100032160()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_100032170()
{
  return View.widgetURL(_:)();
}

uint64_t sub_100032180()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100032190()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000321A0()
{
  return View.unredacted()();
}

uint64_t sub_1000321B0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_1000321C0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000321D0()
{
  return View.privacySensitive(_:)();
}

uint64_t sub_1000321E0()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_1000321F0()
{
  return View.containerBackground<A>(_:for:)();
}

uint64_t sub_100032200()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_100032210()
{
  return Color.wfColor(with:)();
}

uint64_t sub_100032220()
{
  return Color.init(_:)();
}

uint64_t sub_100032230()
{
  return static Color.white.getter();
}

uint64_t sub_100032240()
{
  return Color.opacity(_:)();
}

uint64_t sub_100032250()
{
  return static Color.secondary.getter();
}

uint64_t sub_100032260()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_100032270()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100032280()
{
  return Image.init(_:scale:orientation:label:)();
}

uint64_t sub_100032290()
{
  return Label.init(title:icon:)();
}

uint64_t sub_1000322A0()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_1000322B0()
{
  return Shape.fill(_:)();
}

uint64_t sub_1000322C0()
{
  return Button.init<A>(intent:label:)();
}

uint64_t sub_1000322D0()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000322E0()
{
  return static Alignment.leading.getter();
}

uint64_t sub_1000322F0()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_100032300()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_100032310()
{
  return static ControlWidgetSize.medium.getter();
}

uint64_t sub_100032320()
{
  return type metadata accessor for ControlWidgetSize();
}

uint64_t sub_100032330()
{
  return ControlWidgetButton.init<>(action:label:)();
}

uint64_t sub_100032340()
{
  return AccessoryWidgetBackground.init()();
}

uint64_t sub_100032350()
{
  return type metadata accessor for AccessoryWidgetBackground();
}

uint64_t sub_100032360()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_100032370()
{
  return static WidgetRenderingMode.vibrant.getter();
}

uint64_t sub_100032380()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_100032390()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_1000323A0()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t sub_1000323B0()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_1000323C0()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t sub_1000323D0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000323E0()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_1000323F0()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100032400()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100032410()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100032420()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_100032430()
{
  return AppIntentTimelineProvider.getTimeline(for:in:completion:)();
}

uint64_t sub_100032450()
{
  return AppIntentTimelineProvider.getSnapshot(for:in:completion:)();
}

uint64_t sub_100032460()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_100032480()
{
  return AppIntentControlConfiguration.init(kind:intent:content:)();
}

uint64_t sub_100032490()
{
  return Timeline.init(entries:policy:)();
}

NSDictionary sub_1000324A0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000324B0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_1000324C0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000324D0()
{
  return type metadata accessor for String.LocalizationValue.Placeholder();
}

uint64_t sub_1000324E0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000324F0()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation(placeholder:specifier:)();
}

void sub_100032500(Swift::String a1)
{
}

void sub_100032510(Swift::String a1)
{
}

uint64_t sub_100032520()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100032530()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100032540()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_100032550()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100032560()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100032570()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032580()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100032590()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t sub_1000325A0()
{
  return String.hash(into:)();
}

void sub_1000325B0(Swift::String a1)
{
}

Swift::Int sub_1000325C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000325D0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_1000325E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000325F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032600()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100032610()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100032620()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100032630()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100032640()
{
  return type metadata accessor for CheckedContinuation();
}

uint64_t sub_100032650()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100032660()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100032670()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100032680()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100032690()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000326A0()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_1000326B0()
{
  return WFImage.image.getter();
}

uint64_t sub_1000326C0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000326D0()
{
  return StringProtocol.localizedStandardContains<A>(_:)();
}

uint64_t sub_1000326E0()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

void sub_1000326F0(Swift::Int a1)
{
}

uint64_t sub_100032700()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100032710()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100032720()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100032730()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100032740()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100032750()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100032760()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

BOOL sub_100032770(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_100032780()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_100032790()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000327A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000327B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000327C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000327D0()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t sub_1000327E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100032800()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100032810()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100032820()
{
  return Error._code.getter();
}

uint64_t sub_100032830()
{
  return Error._domain.getter();
}

uint64_t sub_100032840()
{
  return Error._userInfo.getter();
}

uint64_t sub_100032850()
{
  return Hasher.init(_seed:)();
}

void sub_100032860(Swift::UInt a1)
{
}

void sub_100032870(Swift::UInt8 a1)
{
}

Swift::Int sub_100032880()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t VCIsDeviceLocked()
{
  return _VCIsDeviceLocked();
}

uint64_t WFLocalizedAllShortcutsString()
{
  return _WFLocalizedAllShortcutsString();
}

uint64_t WFSystemImageNameForGlyphCharacter()
{
  return _WFSystemImageNameForGlyphCharacter();
}

uint64_t WFSystemImageNameForOutlineGlyphCharacter()
{
  return _WFSystemImageNameForOutlineGlyphCharacter();
}

uint64_t WFWorkflowIconDrawerGloballyCacheDrawerContext()
{
  return _WFWorkflowIconDrawerGloballyCacheDrawerContext();
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void free(void *a1)
{
}

uint64_t getWFGeneralLogObject()
{
  return _getWFGeneralLogObject();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithURL:];
}

id objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}