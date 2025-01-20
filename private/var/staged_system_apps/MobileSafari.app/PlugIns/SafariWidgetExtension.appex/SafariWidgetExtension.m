uint64_t sub_1000019F4()
{
  uint64_t result;

  result = sub_10004E270();
  qword_10006A578 = result;
  return result;
}

uint64_t sub_100001A30()
{
  uint64_t result = sub_10004E270();
  qword_10006A580 = result;
  return result;
}

uint64_t sub_100001A6C()
{
  uint64_t result = sub_10004E170();
  qword_10006A588 = result;
  return result;
}

uint64_t sub_100001A8C()
{
  uint64_t result = sub_10004E180();
  qword_10006A590 = result;
  return result;
}

uint64_t sub_100001AAC()
{
  uint64_t result = sub_10004E140();
  qword_10006A598 = result;
  return result;
}

ValueMetadata *type metadata accessor for ReadingListWidgetHeader()
{
  return &type metadata for ReadingListWidgetHeader;
}

uint64_t sub_100001ADC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100001AF8()
{
  uint64_t v0 = sub_100002388(&qword_1000683F0);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_1000683F8);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068400);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v2 = sub_10004DFC0();
  *((void *)v2 + 1) = 0x4008000000000000;
  v2[16] = 0;
  uint64_t v9 = sub_100002388(&qword_100068408);
  sub_100001D58((uint64_t)&v2[*(int *)(v9 + 44)]);
  if (qword_1000681E0 != -1) {
    swift_once();
  }
  sub_10004E150();
  uint64_t v10 = sub_10004E160();
  uint64_t KeyPath = swift_getKeyPath();
  sub_10000274C((uint64_t)v2, (uint64_t)v5, &qword_1000683F0);
  v12 = (uint64_t *)&v5[*(int *)(v3 + 36)];
  uint64_t *v12 = KeyPath;
  v12[1] = v10;
  sub_1000027C0((uint64_t)v2, &qword_1000683F0);
  sub_10004E360();
  sub_1000021A0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v8, 0.0, 1, 0.0, 1);
  sub_1000027C0((uint64_t)v5, &qword_1000683F8);
  sub_1000023D4();
  sub_10004E210();
  return sub_1000027C0((uint64_t)v8, &qword_100068400);
}

uint64_t sub_100001D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v1 = sub_10004DDD0();
  uint64_t v42 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v41 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v40 = (char *)&v39 - v4;
  uint64_t v5 = sub_100002388(&qword_100068438);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_10004E2C0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002388(&qword_100068440);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (uint64_t *)((char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v15);
  v19 = (char *)&v39 - v18;
  uint64_t v20 = sub_10004E290();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Image.Scale.large(_:), v9);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v8 + *(int *)(v6 + 36), v12, v9);
  uint64_t *v8 = KeyPath;
  sub_10000274C((uint64_t)v8, (uint64_t)v17 + *(int *)(v14 + 44), &qword_100068438);
  uint64_t *v17 = v20;
  swift_retain();
  sub_1000027C0((uint64_t)v8, &qword_100068438);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  sub_100002690((uint64_t)v17, (uint64_t)v19);
  v22 = v40;
  sub_10004DDC0();
  v23 = v41;
  sub_10004DDC0();
  uint64_t v24 = sub_10004DDA0();
  uint64_t v26 = v25;
  v27 = *(void (**)(char *, uint64_t))(v42 + 8);
  v28 = v23;
  uint64_t v29 = v43;
  v27(v28, v43);
  v27(v22, v29);
  uint64_t v45 = v24;
  uint64_t v46 = v26;
  sub_1000026F8();
  uint64_t v30 = sub_10004E1C0();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  LOBYTE(v29) = v35 & 1;
  sub_10000274C((uint64_t)v19, (uint64_t)v17, &qword_100068440);
  uint64_t v36 = v44;
  sub_10000274C((uint64_t)v17, v44, &qword_100068440);
  uint64_t v37 = v36 + *(int *)(sub_100002388(&qword_100068450) + 48);
  *(void *)uint64_t v37 = v30;
  *(void *)(v37 + 8) = v32;
  *(unsigned char *)(v37 + 16) = v29;
  *(void *)(v37 + 24) = v34;
  sub_1000027B0(v30, v32, v29);
  swift_bridgeObjectRetain();
  sub_1000027C0((uint64_t)v19, &qword_100068440);
  sub_10000281C(v30, v32, v29);
  swift_bridgeObjectRelease();
  return sub_1000027C0((uint64_t)v17, &qword_100068440);
}

__n128 sub_1000021A0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004E630();
    v23 = (void *)sub_10004E110();
    sub_10004DDE0();
  }
  sub_10004DEA0();
  sub_10000274C(v13, a9, &qword_1000683F8);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100002388(&qword_100068400) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_100002368()
{
  return sub_10004E220();
}

uint64_t sub_100002388(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000023D4()
{
  unint64_t result = qword_100068410;
  if (!qword_100068410)
  {
    sub_100002450(&qword_100068400);
    sub_100002498();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068410);
  }
  return result;
}

uint64_t sub_100002450(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002498()
{
  unint64_t result = qword_100068418;
  if (!qword_100068418)
  {
    sub_100002450(&qword_1000683F8);
    sub_10000255C(&qword_100068420, &qword_1000683F0);
    sub_10000255C(&qword_100068428, &qword_100068430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068418);
  }
  return result;
}

uint64_t sub_10000255C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002450(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000025A0()
{
  return sub_10004DEB0();
}

uint64_t sub_1000025C4(uint64_t a1)
{
  uint64_t v2 = sub_10004E2C0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10004DEC0();
}

uint64_t sub_100002690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002388(&qword_100068440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000026F8()
{
  unint64_t result = qword_100068448;
  if (!qword_100068448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068448);
  }
  return result;
}

uint64_t sub_10000274C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002388(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000027B0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000027C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002388(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000281C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000282C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsControlToggle()
{
  return &type metadata for SearchEngineSuggestionsControlToggle;
}

uint64_t sub_100002898()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000028B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  __n128 v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_1000030DC();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_100002E6C()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_100002F9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unint64_t sub_1000030DC()
{
  unint64_t result = qword_100068480;
  if (!qword_100068480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068480);
  }
  return result;
}

uint64_t sub_100003130()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for TabBarLayoutControlPicker()
{
  return &type metadata for TabBarLayoutControlPicker;
}

uint64_t sub_100003280()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000329C@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_10002993C(KeyPath, a1);

  return swift_release();
}

uint64_t sub_1000032EC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000033CC()
{
  unint64_t result = qword_1000684B0;
  if (!qword_1000684B0)
  {
    sub_100002450(&qword_1000684A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000684B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariSuggestionsControlToggle()
{
  return &type metadata for SafariSuggestionsControlToggle;
}

uint64_t sub_100003438()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003454@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  __n128 v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_100003C78();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_100003A0C()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_100003B3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unint64_t sub_100003C78()
{
  unint64_t result = qword_1000684B8;
  if (!qword_1000684B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000684B8);
  }
  return result;
}

unint64_t sub_100003CD0()
{
  unint64_t result = qword_1000684E0;
  if (!qword_1000684E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000684E0);
  }
  return result;
}

uint64_t sub_100003D24()
{
  return sub_10000255C(&qword_1000684E8, &qword_1000684F0);
}

uint64_t sub_100003D60(uint64_t a1)
{
  return sub_100005DE4(a1, qword_10006A5A0, 0x800000010004F210, (uint64_t)"AutoFill Use Credit Cards");
}

uint64_t sub_100003D7C(uint64_t a1)
{
  return sub_100006110(a1, qword_10006A5B8);
}

uint64_t sub_100003DA0(uint64_t a1)
{
  return sub_100006194(a1, qword_10006A5D0);
}

uint64_t sub_100003DC4()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A5E8 = result;
  return result;
}

uint64_t sub_100003DF0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100003DFC()
{
  sub_10004D850();
  return v1;
}

uint64_t sub_100003E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_1000687D8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_1000687E0);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100003FF4, 0, 0);
}

uint64_t sub_100003FF4()
{
  sub_10004D850();
  unsigned __int8 v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000052AC();
  *unsigned __int8 v1 = v0;
  v1[1] = sub_1000040C8;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100004784, 0, &type metadata for AutoFillCreditCardEntity, v2);
}

uint64_t sub_1000040C8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000041C4, 0, 0);
}

uint64_t sub_1000041C4()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100068208 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A5E8;
  *(void *)(v0 + 168) = qword_10006A5E8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_1000687C0, &qword_1000687C8);
  *uint64_t v3 = v0;
  v3[1] = sub_10000431C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000431C()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_100004470;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004470()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100003CD0();
  sub_1000055C0();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000046C0()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100004788()
{
  uint64_t v0 = sub_100002388(&qword_1000687E8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068208 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_1000055C0();
  sub_10000255C(&qword_1000687F0, &qword_1000687E8);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000048F0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t (*sub_100004930(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004D840();
  return sub_10000498C;
}

uint64_t sub_100004990@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t (*sub_1000049D0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004D840();
  return sub_10000498C;
}

uint64_t sub_100004A2C(uint64_t a1, uint64_t a2)
{
  return sub_100006D5C(a1, a2, &qword_100068208);
}

unint64_t sub_100004A54()
{
  return 0xD000000000000015;
}

unint64_t sub_100004A78()
{
  unint64_t result = qword_1000684F8;
  if (!qword_1000684F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000684F8);
  }
  return result;
}

unint64_t sub_100004AD0()
{
  unint64_t result = qword_100068500;
  if (!qword_100068500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068500);
  }
  return result;
}

uint64_t sub_100004B24()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100004B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006EA8(a1, a2, a3, (void (*)(void))sub_100003CD0);
}

uint64_t sub_100004B70@<X0>(uint64_t a1@<X8>)
{
  return sub_100007D38(&qword_1000681F8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A5B8, a1);
}

uint64_t sub_100004BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_100006F58(&qword_100068200, (uint64_t)qword_10006A5D0, a1);
}

uint64_t sub_100004BDC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_100003E30(a1, v5, v4);
}

uint64_t sub_100004C88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000825C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100004CB0()
{
  return 0xD000000000000029;
}

unint64_t sub_100004CD0()
{
  unint64_t result = qword_100068510;
  if (!qword_100068510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068510);
  }
  return result;
}

unint64_t sub_100004D28()
{
  unint64_t result = qword_100068518;
  if (!qword_100068518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068518);
  }
  return result;
}

uint64_t sub_100004D7C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100004D9C, 0, 0);
}

uint64_t sub_100004D9C()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)WBUFormDataController) init];
  unsigned __int8 v3 = [v2 shouldAutoFillFromCreditCardData];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100004E38(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100004E5C, 0, 0);
}

uint64_t sub_100004E5C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)WBUFormDataController) init];
  [v2 setShouldAutoFillFromCreditCardData:v1];
  id v3 = [self defaultCenter];
  [v3 postNotificationName:WBSAutoFillUseCreditCardsChangedNotification object:0 userInfo:0 deliverImmediately:1];

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100004F38(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000687A8 + dword_1000687A8);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_100004FE0()
{
  unint64_t result = qword_100068528;
  if (!qword_100068528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068528);
  }
  return result;
}

uint64_t sub_100005034(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000058B8();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_1000050E4(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_1000051FC()
{
  unint64_t result = qword_100068538;
  if (!qword_100068538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068538);
  }
  return result;
}

unint64_t sub_100005254()
{
  unint64_t result = qword_100068540;
  if (!qword_100068540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068540);
  }
  return result;
}

unint64_t sub_1000052AC()
{
  unint64_t result = qword_100068548[0];
  if (!qword_100068548[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100068548);
  }
  return result;
}

uint64_t sub_100005300(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000058B8();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000053B4(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000054B4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000058B8();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100005568()
{
  unint64_t result = qword_100068560;
  if (!qword_100068560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068560);
  }
  return result;
}

unint64_t sub_1000055C0()
{
  unint64_t result = qword_100068568;
  if (!qword_100068568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068568);
  }
  return result;
}

uint64_t sub_100005614()
{
  return sub_100007820(&qword_100068570, qword_100068578, (void (*)(void))sub_1000055C0);
}

uint64_t sub_100005650(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004FE0();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100005704()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000057F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005704;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_1000058B8()
{
  unint64_t result = qword_100068590;
  if (!qword_100068590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068590);
  }
  return result;
}

uint64_t sub_10000590C()
{
  uint64_t v0 = qword_1000684C0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005948()
{
  unint64_t result = qword_100068598;
  if (!qword_100068598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068598);
  }
  return result;
}

unint64_t sub_1000059A0()
{
  unint64_t result = qword_1000685A0;
  if (!qword_1000685A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685A0);
  }
  return result;
}

unint64_t sub_1000059F8()
{
  unint64_t result = qword_1000685A8;
  if (!qword_1000685A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685A8);
  }
  return result;
}

void *sub_100005A4C()
{
  return &protocol witness table for String;
}

unint64_t sub_100005A5C()
{
  unint64_t result = qword_1000685B0;
  if (!qword_1000685B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685B0);
  }
  return result;
}

unint64_t sub_100005AB4()
{
  unint64_t result = qword_1000685B8;
  if (!qword_1000685B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685B8);
  }
  return result;
}

unint64_t sub_100005B0C()
{
  unint64_t result = qword_1000685C0;
  if (!qword_1000685C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685C0);
  }
  return result;
}

void *sub_100005B60()
{
  return &protocol witness table for String;
}

uint64_t sub_100005B6C@<X0>(uint64_t *a1@<X8>)
{
  return sub_100007CBC((void (*)(void))sub_100004D28, a1);
}

uint64_t sub_100005B84@<X0>(uint64_t a1@<X8>)
{
  return sub_100007D38(&qword_1000681F0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A5A0, a1);
}

uint64_t sub_100005BBC()
{
  return sub_10000255C(&qword_1000685C8, &qword_1000685D0);
}

uint64_t sub_100005BF8(uint64_t a1)
{
  unint64_t v2 = sub_1000052AC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005C48()
{
  unint64_t result = qword_1000685D8;
  if (!qword_1000685D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685D8);
  }
  return result;
}

uint64_t sub_100005C9C(uint64_t a1)
{
  unint64_t v2 = sub_100004D28();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100005CE8(uint64_t a1)
{
  unint64_t v2 = sub_100005B0C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005D38()
{
  unint64_t result = qword_1000685E0;
  if (!qword_1000685E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685E0);
  }
  return result;
}

uint64_t sub_100005D8C()
{
  return sub_10000255C(&qword_1000685E8, &qword_1000685F0);
}

uint64_t sub_100005DC8(uint64_t a1)
{
  return sub_100005DE4(a1, qword_10006A5F0, 0x800000010004F0C0, (uint64_t)"AutoFill Use Contact Info");
}

uint64_t sub_100005DE4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a4;
  uint64_t v17 = a3;
  uint64_t v5 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v5 - 8);
  uint64_t v18 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DC60();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DD90();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004E550();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004DC80();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = sub_10004DBF0();
  sub_100008E14(v15, a2);
  sub_100008DDC(v15, (uint64_t)a2);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_10004DC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v18, 1, 1, v13);
  return sub_10004DBE0();
}

uint64_t sub_1000060EC(uint64_t a1)
{
  return sub_100006110(a1, qword_10006A608);
}

uint64_t sub_100006110(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10004DC80();
  sub_100008E14(v3, a2);
  sub_100008DDC(v3, (uint64_t)a2);
  return sub_10004DC50();
}

uint64_t sub_100006170(uint64_t a1)
{
  return sub_100006194(a1, qword_10006A620);
}

uint64_t sub_100006194(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v3, a2);
  uint64_t v4 = sub_100008DDC(v3, (uint64_t)a2);
  sub_10004D9D0();
  uint64_t v5 = sub_10004D9E0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 0, 1, v5);
}

uint64_t sub_100006248()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A638 = result;
  return result;
}

uint64_t sub_100006270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_100068780);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100068788);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100006434, 0, 0);
}

uint64_t sub_100006434()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000757C();
  *uint64_t v1 = v0;
  v1[1] = sub_100006508;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100006B00, 0, &type metadata for AutoFillContactInfoEntity, v2);
}

uint64_t sub_100006508()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006604, 0, 0);
}

uint64_t sub_100006604()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100068228 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A638;
  *(void *)(v0 + 168) = qword_10006A638;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_100068758, &qword_100068760);
  *uint64_t v3 = v0;
  v3[1] = sub_10000675C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000675C()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100009200;
  }
  else {
    uint64_t v2 = sub_1000068B0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000068B0()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100005D38();
  sub_100007790();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100006B04()
{
  uint64_t v0 = sub_100002388(&qword_100068790);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068228 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100007790();
  sub_10000255C(&qword_100068798, &qword_100068790);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100006C6C()
{
  return swift_release();
}

uint64_t sub_100006CB4()
{
  return sub_10004D860();
}

void sub_100006CEC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100006D38(uint64_t a1, uint64_t a2)
{
  return sub_100006D5C(a1, a2, &qword_100068228);
}

uint64_t sub_100006D5C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100006DB0()
{
  unint64_t result = qword_1000685F8;
  if (!qword_1000685F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000685F8);
  }
  return result;
}

unint64_t sub_100006E08()
{
  unint64_t result = qword_100068600;
  if (!qword_100068600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068600);
  }
  return result;
}

uint64_t sub_100006E5C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006EA8(a1, a2, a3, (void (*)(void))sub_100005D38);
}

uint64_t sub_100006EA8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006EFC@<X0>(uint64_t a1@<X8>)
{
  return sub_100007D38(&qword_100068218, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A608, a1);
}

uint64_t sub_100006F34@<X0>(uint64_t a1@<X8>)
{
  return sub_100006F58(&qword_100068220, (uint64_t)qword_10006A620, a1);
}

uint64_t sub_100006F58@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100002388(&qword_1000687A0);
  uint64_t v6 = sub_100008DDC(v5, a2);

  return sub_100009178(v6, a3);
}

uint64_t sub_100006FC0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_100006270(a1, v5, v4);
}

uint64_t sub_10000706C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100008988();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100007094()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_1000070B4()
{
  unint64_t result = qword_100068610;
  if (!qword_100068610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068610);
  }
  return result;
}

unint64_t sub_10000710C()
{
  unint64_t result = qword_100068618;
  if (!qword_100068618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068618);
  }
  return result;
}

uint64_t sub_100007160(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007180, 0, 0);
}

uint64_t sub_100007180()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)WBUFormDataController) init];
  unsigned __int8 v3 = [v2 shouldAutoFillFromAddressBook];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000721C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100007240, 0, 0);
}

uint64_t sub_100007240()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)WBUFormDataController) init];
  [v2 setShouldAutoFillFromAddressBook:v1];
  id v3 = [self defaultCenter];
  [v3 postNotificationName:WBSAutoFillUseContactInfoChangedNotification object:0 userInfo:0 deliverImmediately:1];

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000731C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100068740 + dword_100068740);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_1000073C4()
{
  unint64_t result = qword_100068628;
  if (!qword_100068628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068628);
  }
  return result;
}

uint64_t sub_100007418(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007A04();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000074CC()
{
  unint64_t result = qword_100068638;
  if (!qword_100068638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068638);
  }
  return result;
}

unint64_t sub_100007524()
{
  unint64_t result = qword_100068640;
  if (!qword_100068640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068640);
  }
  return result;
}

unint64_t sub_10000757C()
{
  unint64_t result = qword_100068648[0];
  if (!qword_100068648[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100068648);
  }
  return result;
}

uint64_t sub_1000075D0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007A04();
  void *v5 = v2;
  v5[1] = sub_1000091EC;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100007684(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007A04();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100007738()
{
  unint64_t result = qword_100068660;
  if (!qword_100068660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068660);
  }
  return result;
}

unint64_t sub_100007790()
{
  unint64_t result = qword_100068668;
  if (!qword_100068668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068668);
  }
  return result;
}

uint64_t sub_1000077E4()
{
  return sub_100007820(&qword_100068670, qword_100068678, (void (*)(void))sub_100007790);
}

uint64_t sub_100007820(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002450(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007898(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000073C4();
  void *v5 = v2;
  v5[1] = sub_100009208;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000794C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100009208;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100007A04()
{
  unint64_t result = qword_100068690;
  if (!qword_100068690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068690);
  }
  return result;
}

uint64_t sub_100007A58()
{
  uint64_t v0 = qword_1000684D0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100007A94()
{
  unint64_t result = qword_100068698;
  if (!qword_100068698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068698);
  }
  return result;
}

unint64_t sub_100007AEC()
{
  unint64_t result = qword_1000686A0;
  if (!qword_1000686A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000686A0);
  }
  return result;
}

unint64_t sub_100007B44()
{
  unint64_t result = qword_1000686A8;
  if (!qword_1000686A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000686A8);
  }
  return result;
}

unint64_t sub_100007B9C()
{
  unint64_t result = qword_1000686B0;
  if (!qword_1000686B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000686B0);
  }
  return result;
}

unint64_t sub_100007BF4()
{
  unint64_t result = qword_1000686B8;
  if (!qword_1000686B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000686B8);
  }
  return result;
}

unint64_t sub_100007C50()
{
  unint64_t result = qword_1000686C0;
  if (!qword_1000686C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000686C0);
  }
  return result;
}

uint64_t sub_100007CA4@<X0>(uint64_t *a1@<X8>)
{
  return sub_100007CBC((void (*)(void))sub_10000710C, a1);
}

uint64_t sub_100007CBC@<X0>(void (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  a1();
  uint64_t result = sub_10004D800();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_100007D00@<X0>(uint64_t a1@<X8>)
{
  return sub_100007D38(&qword_100068210, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A5F0, a1);
}

uint64_t sub_100007D38@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008DDC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100007DDC()
{
  return sub_10000255C(&qword_1000686C8, &qword_1000686D0);
}

uint64_t sub_100007E18(uint64_t a1)
{
  unint64_t v2 = sub_10000757C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007E68()
{
  unint64_t result = qword_1000686D8;
  if (!qword_1000686D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000686D8);
  }
  return result;
}

uint64_t sub_100007EBC(uint64_t a1)
{
  unint64_t v2 = sub_10000710C();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100007F08(uint64_t a1)
{
  unint64_t v2 = sub_100007C50();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery()
{
  return &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery;
}

ValueMetadata *type metadata accessor for AutoFillContactInfoEntity()
{
  return &type metadata for AutoFillContactInfoEntity;
}

__n128 initializeWithTake for AutoFillContactInfoEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AutoFillContactInfoEntity.UpdateIntent_value()
{
  return &type metadata for AutoFillContactInfoEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery()
{
  return &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery;
}

ValueMetadata *type metadata accessor for AutoFillCreditCardEntity()
{
  return &type metadata for AutoFillCreditCardEntity;
}

uint64_t destroy for AutoFillCreditCardEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s21SafariWidgetExtension25AutoFillContactInfoEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for BlockPopUpsEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for BlockPopUpsEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BlockPopUpsEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BlockPopUpsEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AutoFillCreditCardEntity.UpdateIntent_value()
{
  return &type metadata for AutoFillCreditCardEntity.UpdateIntent_value;
}

uint64_t sub_10000816C()
{
  return sub_10000255C(&qword_1000686E0, &qword_1000686E8);
}

uint64_t sub_1000081A8()
{
  return sub_10000255C(&qword_1000686F0, &qword_1000686E8);
}

uint64_t sub_1000081E4()
{
  return sub_10000255C(&qword_1000686F8, &qword_100068700);
}

uint64_t sub_100008220()
{
  return sub_10000255C(&qword_100068708, &qword_100068700);
}

uint64_t sub_10000825C()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100068738);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  long long v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000052AC();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

uint64_t sub_10000869C()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000087DC, 0, 0);
}

uint64_t sub_1000087DC()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_1000684F0);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_1000687C0, &qword_1000687C8);
  uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100008988()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100068728);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v23 = v10;
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  long long v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000757C();
  uint64_t v19 = v22;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v23, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

uint64_t sub_100008DDC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008E14(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008E78()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100008FB8, 0, 0);
}

uint64_t sub_100008FB8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_1000685F0);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100068758, &qword_100068760);
  uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10000916C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100009178(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002388(&qword_1000687A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000920C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_bridgeObjectRetain();
    sub_100002388(&qword_1000687F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004DE80();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = *(void *)v14;
    char v16 = v14[8];
    sub_100009364(*(void *)v14, v16);
    *(void *)uint64_t v13 = v15;
    v13[8] = v16;
  }
  return v4;
}

uint64_t sub_100009364(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100009370(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100002388(&qword_1000687F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004DE80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);

  return sub_100009430(v7, v8);
}

uint64_t sub_100009430(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000943C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (void *)(a2 + v6);
  swift_bridgeObjectRetain();
  sub_100002388(&qword_1000687F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10004DE80();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  char v14 = *(unsigned char *)(v12 + 8);
  sub_100009364(*(void *)v12, v14);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = v14;
  return a1;
}

uint64_t sub_100009544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    char v8 = (void *)(a2 + v6);
    sub_100009674(a1 + v6);
    sub_100002388(&qword_1000687F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_10004DE80();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  char v14 = *(unsigned char *)(v12 + 8);
  sub_100009364(*(void *)v12, v14);
  uint64_t v15 = *(void *)v11;
  char v16 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = v14;
  sub_100009430(v15, v16);
  return a1;
}

uint64_t sub_100009674(uint64_t a1)
{
  uint64_t v2 = sub_100002388(&qword_1000687F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_1000096D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  char v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100002388(&qword_1000687F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004DE80();
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
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  return a1;
}

uint64_t sub_1000097D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    char v8 = (const void *)(a2 + v6);
    sub_100009674(a1 + v6);
    uint64_t v9 = sub_100002388(&qword_1000687F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004DE80();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  LOBYTE(v13) = *((unsigned char *)v13 + 8);
  uint64_t v15 = *(void *)v12;
  char v16 = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = (_BYTE)v13;
  sub_100009430(v15, v16);
  return a1;
}

uint64_t sub_100009900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009914);
}

uint64_t sub_100009914(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100002388(&qword_100068800);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000099C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000099DC);
}

uint64_t sub_1000099DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100002388(&qword_100068800);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SmallReadingListWidgetBackgroundView()
{
  uint64_t result = qword_100068860;
  if (!qword_100068860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100009AD4()
{
  sub_100009B74();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100009B74()
{
  if (!qword_100068870)
  {
    sub_10004DE80();
    unint64_t v0 = sub_10004DE20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100068870);
    }
  }
}

uint64_t sub_100009BCC()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_100009BE8@<D0>(uint64_t a1@<X8>)
{
  if (sub_100009D34())
  {
    sub_10004E350();
    sub_10000A008(v1, (uint64_t)v9);
  }
  else
  {
    if (qword_1000681D0 != -1) {
      swift_once();
    }
    swift_retain();
  }
  sub_100002388(&qword_1000688A8);
  sub_10000A68C();
  sub_10004E0B0();
  double result = *(double *)v9;
  long long v4 = v9[1];
  long long v5 = v9[2];
  long long v6 = v9[3];
  long long v7 = v9[4];
  char v8 = v10;
  *(_OWORD *)a1 = v9[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 80) = v8;
  return result;
}

uint64_t sub_100009D34()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004DE80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  long long v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v8 = (char *)&v24 - v7;
  uint64_t v9 = type metadata accessor for SmallReadingListWidgetBackgroundView();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v24 - v13;
  uint64_t v15 = *(void *)(v0 + 8);
  if (!*(void *)(v15 + 16)
    || (uint64_t v16 = type metadata accessor for BookmarkItem(),
        !*(void *)(v15
                   + ((*(unsigned __int8 *)(*(void *)(v16 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80))
                   + *(int *)(v16 + 28))))
  {
    sub_10000A6E8(v1, (uint64_t)v14);
    sub_10000A74C((uint64_t)v14);
    sub_10000A6E8(v1, (uint64_t)v12);
    goto LABEL_6;
  }
  sub_10000A6E8(v1, (uint64_t)v14);
  sub_100013A2C((uint64_t)v8);
  sub_10000A7A8(&qword_1000688C0);
  sub_10004E660();
  sub_10000A7A8(&qword_1000688C8);
  char v17 = sub_10004E4F0();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v6, v2);
  v18(v8, v2);
  sub_10000A74C((uint64_t)v14);
  sub_10000A6E8(v1, (uint64_t)v12);
  if ((v17 & 1) == 0)
  {
LABEL_6:
    char v22 = 0;
    goto LABEL_7;
  }
  uint64_t v19 = &v12[*(int *)(v9 + 24)];
  uint64_t v20 = *(void *)v19;
  char v21 = v19[8];
  sub_100009364(*(void *)v19, v21);
  char v22 = sub_100013A64(v20, v21);
  sub_100009430(v20, v21);
LABEL_7:
  sub_10000A74C((uint64_t)v12);
  return v22 & 1;
}

double sub_10000A008@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004E2A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 8);
  if (*(void *)(v8 + 16)
    && (uint64_t v9 = type metadata accessor for BookmarkItem(),
        *(void *)(v8
                  + ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80))
                  + *(int *)(v9 + 28))))
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    swift_retain();
    uint64_t v10 = sub_10004E2E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    uint64_t v10 = 0;
  }
  sub_10000A1BC((uint64_t)&v15);
  uint64_t v11 = v15;
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v11;
  double result = *(double *)&v16;
  long long v13 = v17;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v13;
  *(_WORD *)(a2 + 48) = 256;
  *(void *)(a2 + 56) = 0x3FE3333333333333;
  return result;
}

double sub_10000A1BC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004E240();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002388(&qword_1000688B8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100052AC0;
  uint64_t v7 = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v8(v5, enum case for Color.RGBColorSpace.sRGB(_:), v2);
  sub_10004E260();
  *(void *)(v6 + 32) = sub_10004E330();
  *(void *)(v6 + 40) = v9;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 48) = sub_10004E330();
  *(void *)(v6 + 56) = v10;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 64) = sub_10004E330();
  *(void *)(v6 + 72) = v11;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 80) = sub_10004E330();
  *(void *)(v6 + 88) = v12;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 96) = sub_10004E330();
  *(void *)(v6 + 104) = v13;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 112) = sub_10004E330();
  *(void *)(v6 + 120) = v14;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 128) = sub_10004E330();
  *(void *)(v6 + 136) = v15;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 144) = sub_10004E330();
  *(void *)(v6 + 152) = v16;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 160) = sub_10004E330();
  *(void *)(v6 + 168) = v17;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 176) = sub_10004E330();
  *(void *)(v6 + 184) = v18;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 192) = sub_10004E330();
  *(void *)(v6 + 200) = v19;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 208) = sub_10004E330();
  *(void *)(v6 + 216) = v20;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 224) = sub_10004E330();
  *(void *)(v6 + 232) = v21;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 240) = sub_10004E330();
  *(void *)(v6 + 248) = v22;
  v8(v5, v7, v2);
  sub_10004E260();
  *(void *)(v6 + 256) = sub_10004E330();
  *(void *)(v6 + 264) = v23;
  sub_10004E380();
  sub_10004E340();
  sub_10004DE70();
  double result = *(double *)&v27;
  long long v25 = v28;
  *(_OWORD *)a1 = v27;
  *(_OWORD *)(a1 + 16) = v25;
  *(void *)(a1 + 32) = v29;
  return result;
}

unint64_t sub_10000A68C()
{
  unint64_t result = qword_1000688B0;
  if (!qword_1000688B0)
  {
    sub_100002450(&qword_1000688A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000688B0);
  }
  return result;
}

uint64_t sub_10000A6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SmallReadingListWidgetBackgroundView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A74C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SmallReadingListWidgetBackgroundView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A7A8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10004DE80();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A7F0()
{
  unint64_t result = qword_1000688D0;
  if (!qword_1000688D0)
  {
    sub_100002450(&qword_1000688D8);
    sub_10000A68C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000688D0);
  }
  return result;
}

uint64_t destroy for ReadingListWidget()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s21SafariWidgetExtension17ReadingListWidgetVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ReadingListWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ReadingListWidget(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ReadingListWidget(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReadingListWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReadingListWidget()
{
  return &type metadata for ReadingListWidget;
}

uint64_t sub_10000AA48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AA64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v57 = a1;
  uint64_t v69 = a4;
  uint64_t v5 = sub_10004DDD0();
  uint64_t v55 = v5;
  uint64_t v71 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002388(&qword_1000688E0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  uint64_t v59 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100002388(&qword_1000688E8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v62 = v12;
  uint64_t v63 = v13;
  __chkstk_darwin(v12);
  v70 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100002388(&qword_1000688F0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v65 = v15;
  uint64_t v66 = v16;
  __chkstk_darwin(v15);
  v60 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100002388(&qword_1000688F8);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v67 = v18;
  uint64_t v68 = v19;
  __chkstk_darwin(v18);
  v64 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002388(&qword_100068900);
  uint64_t v21 = sub_10004E3E0();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(void *)(v22 + 72);
  unint64_t v24 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v25 = swift_allocObject();
  uint64_t v61 = v25;
  *(_OWORD *)(v25 + 16) = xmmword_100052BF0;
  unint64_t v26 = v25 + v24;
  long long v27 = *(void (**)(unint64_t, void, uint64_t))(v22 + 104);
  v27(v26, enum case for WidgetFamily.systemSmall(_:), v21);
  v27(v26 + v23, enum case for WidgetFamily.systemMedium(_:), v21);
  v27(v26 + 2 * v23, enum case for WidgetFamily.systemLarge(_:), v21);
  uint64_t v74 = type metadata accessor for ReadingListWidgetWebBookmarksDataSource();
  v75 = &off_1000664D0;
  uint64_t v72 = a3;
  type metadata accessor for ReadingListWidgetView();
  sub_10000B33C();
  sub_10000B394();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10004E490();
  sub_10004DDC0();
  uint64_t v28 = sub_10004DDB0();
  unint64_t v30 = v29;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v71 + 8);
  v71 += 8;
  v31(v7, v5);
  uint64_t v72 = v28;
  unint64_t v73 = v30;
  sub_1000026F8();
  uint64_t v32 = sub_10004E1C0();
  uint64_t v34 = v33;
  LOBYTE(v22) = v35 & 1;
  unint64_t v36 = sub_10000B3E8();
  uint64_t v37 = v58;
  sub_10004E080();
  sub_10000281C(v32, v34, v22);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v11, v37);
  sub_10004DDC0();
  uint64_t v38 = sub_10004DDB0();
  unint64_t v40 = v39;
  v31(v7, v55);
  uint64_t v72 = v38;
  unint64_t v73 = v40;
  uint64_t v41 = sub_10004E1C0();
  uint64_t v43 = v42;
  LOBYTE(v32) = v44 & 1;
  uint64_t v72 = v37;
  unint64_t v73 = v36;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v46 = v60;
  uint64_t v47 = v62;
  v48 = v70;
  sub_10004E020();
  sub_10000281C(v41, v43, v32);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v48, v47);
  sub_100002388(&qword_100068920);
  sub_10004E400();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
  sub_10004E3F0();
  uint64_t v72 = v47;
  unint64_t v73 = OpaqueTypeConformance2;
  uint64_t v49 = swift_getOpaqueTypeConformance2();
  v51 = v64;
  uint64_t v50 = v65;
  sub_10004E060();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v46, v50);
  uint64_t v72 = v50;
  unint64_t v73 = v49;
  swift_getOpaqueTypeConformance2();
  uint64_t v52 = v67;
  sub_10004E050();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v51, v52);
}

uint64_t sub_10000B210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ReadingListWidgetView();
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v6) = *(unsigned char *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *uint64_t v7 = v6;
  *((void *)v7 + 1) = v8;
  uint64_t v9 = (uint64_t *)&v7[*(int *)(v5 + 28)];
  *uint64_t v9 = swift_getKeyPath();
  sub_100002388(&qword_100068928);
  swift_storeEnumTagMultiPayload();
  sub_10000B48C((uint64_t)v7, a2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B2DC@<X0>(void *a1@<X8>)
{
  type metadata accessor for ReadingListWidgetWebBookmarksDataSource();
  uint64_t result = swift_initStaticObject();
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000100052BF0;
  a1[2] = result;
  return result;
}

uint64_t sub_10000B330@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AA64(*v1, v1[1], v1[2], a1);
}

unint64_t sub_10000B33C()
{
  unint64_t result = qword_100068908;
  if (!qword_100068908)
  {
    type metadata accessor for ReadingListWidgetView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068908);
  }
  return result;
}

unint64_t sub_10000B394()
{
  unint64_t result = qword_100068910;
  if (!qword_100068910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068910);
  }
  return result;
}

unint64_t sub_10000B3E8()
{
  unint64_t result = qword_100068918;
  if (!qword_100068918)
  {
    sub_100002450(&qword_1000688E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068918);
  }
  return result;
}

uint64_t sub_10000B444()
{
  return sub_10004DF50();
}

uint64_t sub_10000B468()
{
  return sub_10004DF50();
}

uint64_t sub_10000B48C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReadingListWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B4F0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for LandscapeTabBarControlToggle()
{
  return &type metadata for LandscapeTabBarControlToggle;
}

uint64_t sub_10000B600()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B61C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  unint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  unint64_t v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_10000BE40();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  unint64_t v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  unint64_t v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  unint64_t v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_10000BBD4()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_10000BD04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unint64_t sub_10000BE40()
{
  unint64_t result = qword_100068930;
  if (!qword_100068930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068930);
  }
  return result;
}

id sub_10000BE94(void *a1)
{
  uint64_t v2 = sub_10004DD10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  id v9 = [a1 readingListIconUUID];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  sub_10004E570();

  id v11 = [self bookmarkImagesDirectoryPath];
  sub_10004E570();

  sub_10004DCB0();
  swift_bridgeObjectRelease();
  sub_10004DCC0();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  sub_10004DCF0();
  id v13 = objc_allocWithZone((Class)UIImage);
  NSString v14 = sub_10004E560();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithContentsOfFile:v14];

  if (v15) {
    id v15 = (id)sub_10004E280();
  }
  v12(v8, v2);
  return v15;
}

uint64_t sub_10000C0A4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ReadingListWidgetWebBookmarksDataSource()
{
  return self;
}

size_t sub_10000C0D8(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    id v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100002388(qword_1000689F8);
  uint64_t v10 = *(void *)(type metadata accessor for BookmarkItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  unint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for BookmarkItem() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_10000C2AC(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_10004E710();
  unint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10004E710();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10004E710();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_10000D7C0();
    Swift::Int v10 = 0;
    do
    {
      Swift::Int v11 = v10 + 1;
      sub_10004E6A0(v10);
      Swift::Int v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_10004E720();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

id sub_10000C440(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v6 = sub_100002388(&qword_1000689D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10004DD70();
  uint64_t v9 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  Swift::Int v11 = (char *)v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for BookmarkItem();
  uint64_t v83 = *(void *)(v12 - 8);
  uint64_t v84 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v91 = (uint64_t)v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v82 = (void *)((char *)v72 - v16);
  __chkstk_darwin(v15);
  uint64_t v81 = (uint64_t)v72 - v17;
  uint64_t v18 = type metadata accessor for ReadingListWidgetEntry();
  __chkstk_darwin(v18);
  unint64_t v20 = (char *)v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = self;
  swift_retain_n();
  id v22 = [v21 readonlySafariBookmarkCollectionConfiguration];
  id v23 = [objc_allocWithZone((Class)WebBookmarkCollection) initWithConfiguration:v22];

  if (!v23)
  {
    swift_retain();
    sub_10004DD20();
    *unint64_t v20 = 1;
    *((void *)v20 + 1) = &_swiftEmptyArrayStorage;
    a2(v20);
    sub_10000D764((uint64_t)v20);
    return (id)swift_release_n();
  }
  uint64_t v74 = v18;
  v75 = v20;
  v93 = v11;
  v76 = (void (*)(uint64_t))a2;
  uint64_t v77 = a3;
  id v78 = v23;
  id v24 = [v23 readingListWithUnreadOnly:0];
  id v25 = [v24 bookmarkArrayRequestingCount:1];

  sub_10000D7C0();
  unint64_t v26 = sub_10004E5E0();

  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_10004E710();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v28 = v85;
  swift_bridgeObjectRelease();
  uint64_t v73 = v27;
  if (!v27)
  {
    uint64_t v32 = &_swiftEmptyArrayStorage;
    goto LABEL_10;
  }
  id result = [v78 readingListWithUnreadOnly:1];
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (HIDWORD(a1))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v30 = result;
  id v31 = [result bookmarkArrayRequestingCount:a1];

  uint64_t v32 = (void *)sub_10004E5E0();
LABEL_10:
  uint64_t v33 = sub_10000C2AC(a1, (unint64_t)v32);
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  unint64_t v39 = v38;
  id result = (id)swift_bridgeObjectRelease();
  unint64_t v40 = (v39 >> 1) - v37;
  if (v39 >> 1 == v37)
  {
    swift_unknownObjectRelease();
    uint64_t v41 = &_swiftEmptyArrayStorage;
    unint64_t v42 = v76;
    uint64_t v43 = (uint64_t)v75;
    uint64_t v44 = v73;
LABEL_28:
    BOOL v71 = v44 == 0;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10004DD20();
    *(unsigned char *)uint64_t v43 = v71;
    *(void *)(v43 + 8) = v41;
    v42(v43);
    sub_10000D764(v43);

    swift_bridgeObjectRelease();
    return (id)swift_release_n();
  }
  if ((uint64_t)(v39 >> 1) > v37)
  {
    v72[1] = v33;
    uint64_t v45 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    v86 = (void (**)(char *, char *, uint64_t))(v9 + 32);
    v79 = (void (**)(char *, uint64_t))(v9 + 8);
    v90 = &_swiftEmptyArrayStorage;
    uint64_t v46 = (id *)(v35 + 8 * v37);
    v80 = v8;
    v87 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    do
    {
      id v47 = *v46;
      NSString v48 = [*v46 address];
      if (!v48)
      {
        sub_10004E570();
        NSString v48 = sub_10004E560();
        swift_bridgeObjectRelease();
      }
      id v49 = [v47 UUID];
      sub_10004E570();

      sub_10004DD40();
      if ((*v45)(v8, 1, v28) == 1)
      {
        swift_bridgeObjectRelease();

        sub_10000D800((uint64_t)v8);
      }
      else
      {
        v92 = *v86;
        v92(v93, v8, v28);
        id v50 = [v48 safari_userVisibleURL];

        if (v50)
        {
          uint64_t v51 = v28;
          id v52 = [v50 safari_simplifiedUserVisibleURLStringWithSimplifications:511 forDisplayOnly:1 simplifiedStringOffset:0];

          uint64_t v53 = sub_10004E570();
          uint64_t v88 = v54;
          uint64_t v89 = v53;

          id v55 = sub_10000BE94(v47);
          uint64_t v56 = self;
          NSString v57 = sub_10004E560();
          id v58 = [v56 safari_URLForReadingListItemWithUUIDString:v57];

          uint64_t v59 = v84;
          v60 = v82;
          sub_10004DCE0();
          swift_bridgeObjectRelease();

          id v61 = [v47 title];
          uint64_t v62 = sub_10004E570();
          uint64_t v64 = v63;

          v92((char *)v60 + *(int *)(v59 + 32), v93, v51);
          uint64_t *v60 = v62;
          v60[1] = v64;
          uint64_t v65 = v88;
          v60[2] = v89;
          v60[3] = v65;
          *(uint64_t *)((char *)v60 + *(int *)(v59 + 28)) = (uint64_t)v55;
          uint64_t v66 = v81;
          sub_10000D860((uint64_t)v60, v81);
          sub_10000D860(v66, v91);
          uint64_t v67 = v90;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v67 = (void *)sub_10000C0D8(0, v67[2] + 1, 1, v67);
          }
          unint64_t v69 = v67[2];
          unint64_t v68 = v67[3];
          uint64_t v8 = v80;
          if (v69 >= v68 >> 1) {
            uint64_t v67 = (void *)sub_10000C0D8(v68 > 1, v69 + 1, 1, v67);
          }
          v67[2] = v69 + 1;
          unint64_t v70 = (*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80);
          v90 = v67;
          sub_10000D860(v91, (uint64_t)v67 + v70 + *(void *)(v83 + 72) * v69);
          uint64_t v28 = v85;
        }
        else
        {
          swift_bridgeObjectRelease();
          (*v79)(v93, v28);
        }
        uint64_t v45 = v87;
      }
      ++v46;
      --v40;
    }
    while (v40);
    swift_unknownObjectRelease();
    unint64_t v42 = v76;
    uint64_t v43 = (uint64_t)v75;
    uint64_t v44 = v73;
    uint64_t v41 = v90;
    goto LABEL_28;
  }
LABEL_33:
  __break(1u);
  return result;
}

id sub_10000CC38(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v91 = a2;
  unint64_t v104 = a1;
  uint64_t v4 = sub_100002388(&qword_1000689D0);
  __chkstk_darwin(v4 - 8);
  v100 = (char *)v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_10004DD70();
  v103 = *(char **)(v108 - 8);
  __chkstk_darwin(v108);
  v106 = (char *)v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BookmarkItem();
  uint64_t v95 = *(void *)(v7 - 8);
  uint64_t v96 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v102 = (uint64_t)v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v94 = (void *)((char *)v83 - v11);
  __chkstk_darwin(v10);
  uint64_t v93 = (uint64_t)v83 - v12;
  uint64_t v13 = sub_10004E4B0();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100002388(&qword_1000689D8);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for ReadingListWidgetEntry();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v23 = (char *)v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = self;
  swift_retain_n();
  id v25 = [v24 readonlySafariBookmarkCollectionConfiguration];
  id v26 = [objc_allocWithZone((Class)WebBookmarkCollection) initWithConfiguration:v25];

  if (!v26)
  {
    swift_retain();
    sub_10004DD20();
    char *v23 = 1;
    *((void *)v23 + 1) = &_swiftEmptyArrayStorage;
    sub_100002388(&qword_1000689E0);
    uint64_t v37 = *(unsigned __int8 *)(v21 + 80);
    uint64_t v38 = (uint64_t)v23;
    uint64_t v39 = (v37 + 32) & ~v37;
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_100052C00;
    sub_10000D6A8(v38, v40 + v39);
    sub_10004E4A0();
    sub_10000D70C();
    sub_10004E4D0();
    v91(v19);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    sub_10000D764(v38);
    return (id)swift_release_n();
  }
  uint64_t v86 = v21;
  uint64_t v89 = v20;
  v87 = v23;
  v107 = v15;
  v105 = v19;
  id v27 = [v26 readingListWithUnreadOnly:0];
  id v28 = [v27 bookmarkArrayRequestingCount:1];

  sub_10000D7C0();
  unint64_t v29 = sub_10004E5E0();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_10004E710();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  id v85 = v26;
  uint64_t v88 = v30;
  if (!v30)
  {
    uint64_t v36 = &_swiftEmptyArrayStorage;
    uint64_t v33 = v91;
    uint64_t v32 = v104;
    goto LABEL_10;
  }
  id result = [v26 readingListWithUnreadOnly:1];
  uint64_t v32 = v104;
  if ((v104 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v33 = v91;
  if (HIDWORD(v104))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v34 = result;
  id v35 = [result bookmarkArrayRequestingCount:v104];

  uint64_t v36 = (void *)sub_10004E5E0();
LABEL_10:
  uint64_t v41 = sub_10000C2AC(v32, (unint64_t)v36);
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  unint64_t v47 = v46;
  id result = (id)swift_bridgeObjectRelease();
  BOOL v48 = __OFSUB__(v47 >> 1, v45);
  uint64_t v49 = (v47 >> 1) - v45;
  uint64_t v84 = v16;
  if (!v49)
  {
    swift_unknownObjectRelease();
    id v50 = &_swiftEmptyArrayStorage;
    uint64_t v51 = v105;
    uint64_t v52 = v88;
LABEL_27:
    BOOL v79 = v52 == 0;
    uint64_t v80 = (uint64_t)v87;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10004DD20();
    *(unsigned char *)uint64_t v80 = v79;
    *(void *)(v80 + 8) = v50;
    sub_100002388(&qword_1000689E0);
    unint64_t v81 = (*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
    uint64_t v82 = swift_allocObject();
    *(_OWORD *)(v82 + 16) = xmmword_100052C00;
    sub_10000D6A8(v80, v82 + v81);
    sub_10004E4A0();
    sub_10000D70C();
    sub_10004E4D0();
    v33(v51);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v51, v84);
    sub_10000D764(v80);

    swift_bridgeObjectRelease();
    return (id)swift_release_n();
  }
  if (!((v49 < 0) ^ v48 | (v49 == 0)))
  {
    v83[0] = v41;
    v83[1] = a3;
    unint64_t v104 = (unint64_t)(v103 + 48);
    v97 = (char **)(v103 + 32);
    v90 = (void (**)(char *, uint64_t))(v103 + 8);
    v101 = &_swiftEmptyArrayStorage;
    uint64_t v53 = (id *)(v43 + 8 * v45);
    uint64_t v54 = (uint64_t)v100;
    uint64_t v92 = v17;
    do
    {
      id v55 = *v53;
      NSString v56 = [*v53 address:v83[0]];
      if (!v56)
      {
        sub_10004E570();
        NSString v56 = sub_10004E560();
        swift_bridgeObjectRelease();
      }
      id v57 = [v55 UUID];
      sub_10004E570();

      sub_10004DD40();
      uint64_t v58 = v108;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v104)(v54, 1, v108) == 1)
      {
        swift_bridgeObjectRelease();

        sub_10000D800(v54);
        uint64_t v51 = v105;
      }
      else
      {
        v103 = *v97;
        ((void (*)(char *, uint64_t, uint64_t))v103)(v106, v54, v58);
        id v59 = [v56 safari_userVisibleURL];

        if (v59)
        {
          id v60 = [v59 safari_simplifiedUserVisibleURLStringWithSimplifications:511 forDisplayOnly:1 simplifiedStringOffset:0];

          uint64_t v61 = sub_10004E570();
          uint64_t v98 = v62;
          uint64_t v99 = v61;

          id v63 = sub_10000BE94(v55);
          uint64_t v64 = self;
          NSString v65 = sub_10004E560();
          id v66 = [v64 safari_URLForReadingListItemWithUUIDString:v65];

          uint64_t v67 = v96;
          unint64_t v68 = v94;
          sub_10004DCE0();
          swift_bridgeObjectRelease();

          id v69 = [v55 title];
          uint64_t v70 = sub_10004E570();
          uint64_t v72 = v71;

          ((void (*)(char *, char *, uint64_t))v103)((char *)v68 + *(int *)(v67 + 32), v106, v108);
          *unint64_t v68 = v70;
          v68[1] = v72;
          uint64_t v73 = v98;
          v68[2] = v99;
          v68[3] = v73;
          *(uint64_t *)((char *)v68 + *(int *)(v67 + 28)) = (uint64_t)v63;
          uint64_t v74 = v93;
          sub_10000D860((uint64_t)v68, v93);
          sub_10000D860(v74, v102);
          v75 = v101;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v75 = (void *)sub_10000C0D8(0, v75[2] + 1, 1, v75);
          }
          uint64_t v51 = v105;
          uint64_t v54 = (uint64_t)v100;
          unint64_t v77 = v75[2];
          unint64_t v76 = v75[3];
          uint64_t v17 = v92;
          if (v77 >= v76 >> 1) {
            v75 = (void *)sub_10000C0D8(v76 > 1, v77 + 1, 1, v75);
          }
          v75[2] = v77 + 1;
          unint64_t v78 = (*(unsigned __int8 *)(v95 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v95 + 80);
          v101 = v75;
          sub_10000D860(v102, (uint64_t)v75 + v78 + *(void *)(v95 + 72) * v77);
        }
        else
        {
          swift_bridgeObjectRelease();
          (*v90)(v106, v108);
          uint64_t v51 = v105;
          uint64_t v54 = (uint64_t)v100;
        }
      }
      ++v53;
      --v49;
    }
    while (v49);
    swift_unknownObjectRelease();
    uint64_t v33 = v91;
    uint64_t v52 = v88;
    id v50 = v101;
    goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_10000D6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReadingListWidgetEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000D70C()
{
  unint64_t result = qword_1000689E8;
  if (!qword_1000689E8)
  {
    type metadata accessor for ReadingListWidgetEntry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000689E8);
  }
  return result;
}

uint64_t sub_10000D764(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReadingListWidgetEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000D7C0()
{
  unint64_t result = qword_1000689F0;
  if (!qword_1000689F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000689F0);
  }
  return result;
}

uint64_t sub_10000D800(uint64_t a1)
{
  uint64_t v2 = sub_100002388(&qword_1000689D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BookmarkItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for ReadingListWidgetTimelineProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_10000D900(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for ReadingListWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ReadingListWidgetTimelineProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_10000D9D0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
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
        *long long v3 = v12;
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
          *long long v3 = *a2;
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

__n128 initializeWithTake for ReadingListWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ReadingListWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  sub_10000D900(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidgetTimelineProvider(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReadingListWidgetTimelineProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReadingListWidgetTimelineProvider()
{
  return &type metadata for ReadingListWidgetTimelineProvider;
}

uint64_t type metadata accessor for ReadingListWidgetEntry()
{
  uint64_t result = qword_100068A68;
  if (!qword_100068A68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000DD40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_10004DD30();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10000DDB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004E3E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - v7;
  sub_10004E4C0();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v9 == enum case for WidgetFamily.systemSmall(_:)) {
    goto LABEL_7;
  }
  if (v9 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v9 == enum case for WidgetFamily.systemLarge(_:))
    {
      int64_t v10 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_7:
    int64_t v10 = 1;
    goto LABEL_8;
  }
  int64_t v10 = 2;
LABEL_8:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  char v11 = sub_100044C90(v10);
  uint64_t v13 = v12;
  type metadata accessor for ReadingListWidgetEntry();
  uint64_t result = sub_10004DD20();
  *(unsigned char *)a1 = v11 & 1;
  *(void *)(a1 + 8) = v13;
  return result;
}

uint64_t sub_10000DF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000DFAC(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t))sub_10000C440);
}

uint64_t sub_10000DF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000DFAC(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t))sub_10000CC38);
}

uint64_t sub_10000DFAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = sub_10004E3E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v19 - v14;
  swift_retain_n();
  sub_10004E4C0();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v13, v9);
  if (v16 == enum case for WidgetFamily.systemSmall(_:)) {
    goto LABEL_7;
  }
  if (v16 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v16 == enum case for WidgetFamily.systemLarge(_:))
    {
      uint64_t v17 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
LABEL_7:
    uint64_t v17 = 1;
    goto LABEL_8;
  }
  uint64_t v17 = 2;
LABEL_8:
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  swift_retain();
  a6(v17, a2, a3);
  return swift_release_n();
}

uint64_t sub_10000E188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005704;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000E23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100009208;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t *sub_10000E2F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_10004DD30();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    swift_bridgeObjectRetain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_10000E3E0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_10004DD30();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10000E458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10004DD30();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t sub_10000E4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10004DD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_10000E594(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_10004DD30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10000E610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10004DD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_10000E6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E6B8);
}

uint64_t sub_10000E6B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10004DD30();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000E768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E77C);
}

uint64_t sub_10000E77C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10004DD30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10000E824()
{
  uint64_t result = sub_10004DD30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10000E8BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[5];
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_bridgeObjectRetain();
    sub_100002388(&qword_100068AA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004DE10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[6];
    uint64_t v13 = (uint64_t *)((char *)v4 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    sub_100002388(&qword_1000687F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_10004DE80();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = *(void *)v18;
    char v20 = v18[8];
    sub_100009364(*(void *)v18, v20);
    *(void *)uint64_t v17 = v19;
    v17[8] = v20;
    uint64_t v21 = a3[8];
    uint64_t v22 = (uint64_t *)((char *)v4 + v21);
    id v23 = (uint64_t *)((char *)a2 + v21);
    sub_100002388(&qword_100068AA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_10004E3B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    }
    else
    {
      void *v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_10000EB3C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  sub_100002388(&qword_100068AA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004DE10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[6];
  sub_100002388(&qword_1000687F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004DE80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  sub_100009430(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  uint64_t v8 = a1 + a2[8];
  sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10004E3B0();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10000ECEC(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  swift_bridgeObjectRetain();
  sub_100002388(&qword_100068AA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10004DE10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  sub_100002388(&qword_1000687F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_10004DE80();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  else
  {
    *uint64_t v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = *(unsigned char *)(v16 + 8);
  sub_100009364(*(void *)v16, v18);
  *(void *)uint64_t v15 = v17;
  *(unsigned char *)(v15 + 8) = v18;
  uint64_t v19 = a3[8];
  char v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_10004E3B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  }
  else
  {
    *char v20 = *v21;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10000EF14(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_1000027C0(a1 + v6, &qword_100068AA0);
    sub_100002388(&qword_100068AA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_10004DE10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_1000027C0(a1 + v10, &qword_1000687F8);
    sub_100002388(&qword_1000687F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_10004DE80();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = *(unsigned char *)(v16 + 8);
  sub_100009364(*(void *)v16, v18);
  uint64_t v19 = *(void *)v15;
  char v20 = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v15 = v17;
  *(unsigned char *)(v15 + 8) = v18;
  sub_100009430(v19, v20);
  if (a1 != a2)
  {
    uint64_t v21 = a3[8];
    uint64_t v22 = (void *)(a1 + v21);
    id v23 = (void *)(a2 + v21);
    sub_1000027C0(a1 + v21, &qword_100068AA8);
    sub_100002388(&qword_100068AA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_10004E3B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    }
    else
    {
      void *v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10000F194(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100002388(&qword_100068AA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004DE10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100002388(&qword_1000687F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_10004DE80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  char v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)char v18 = *(void *)v19;
  v18[8] = v19[8];
  char v20 = (char *)a1 + v17;
  uint64_t v21 = (char *)a2 + v17;
  uint64_t v22 = sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_10004E3B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10000F3D0(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_1000027C0(a1 + v6, &qword_100068AA0);
    uint64_t v9 = sub_100002388(&qword_100068AA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004DE10();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_1000027C0(a1 + v11, &qword_1000687F8);
    uint64_t v14 = sub_100002388(&qword_1000687F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_10004DE80();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  char v18 = (uint64_t *)(a2 + v16);
  uint64_t v19 = *v18;
  LOBYTE(v18) = *((unsigned char *)v18 + 8);
  uint64_t v20 = *(void *)v17;
  char v21 = *(unsigned char *)(v17 + 8);
  *(void *)uint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = (_BYTE)v18;
  sub_100009430(v20, v21);
  if (a1 != a2)
  {
    uint64_t v22 = a3[8];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (const void *)(a2 + v22);
    sub_1000027C0(a1 + v22, &qword_100068AA8);
    uint64_t v25 = sub_100002388(&qword_100068AA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_10004E3B0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000F66C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F680);
}

uint64_t sub_10000F680(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_100002388(&qword_100068AB0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_100002388(&qword_100068800);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = sub_100002388(&qword_100068AB8);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[8];

  return v15(v17, a2, v16);
}

uint64_t sub_10000F804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F818);
}

uint64_t sub_10000F818(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_100002388(&qword_100068AB0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_100002388(&qword_100068800);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_100002388(&qword_100068AB8);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[8];

  return v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for SmallReadingListWidgetView()
{
  uint64_t result = qword_100068B18;
  if (!qword_100068B18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000F9E8()
{
  sub_10000FB54(319, (unint64_t *)&qword_100068B28, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v0 <= 0x3F)
  {
    sub_10000FB54(319, (unint64_t *)&qword_100068870, (void (*)(uint64_t))&type metadata accessor for RedactionReasons);
    if (v1 <= 0x3F)
    {
      sub_10000FB54(319, (unint64_t *)&unk_100068B30, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_10000FB54(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004DE20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10000FBA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FBC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v42 = a1;
  uint64_t v3 = sub_10004E100();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068B70);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = sub_100002388(&qword_100068B78);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_100002388(&qword_100068B80);
  uint64_t v37 = *(void *)(v15 - 8);
  uint64_t v38 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100002388(&qword_100068B88);
  uint64_t v35 = *(void *)(v18 - 8);
  uint64_t v36 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v14 = sub_10004E350();
  v14[1] = v21;
  uint64_t v22 = sub_100002388(&qword_100068B90);
  sub_1000101CC((unsigned __int8 *)v2, (uint64_t)v14 + *(int *)(v22 + 44));
  uint64_t v39 = v2;
  uint64_t v23 = *(void *)(v2 + 8);
  if (!*(void *)(v23 + 16))
  {
    uint64_t v28 = sub_10004DD10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 1, 1, v28);
    goto LABEL_5;
  }
  uint64_t v24 = type metadata accessor for BookmarkItem();
  unint64_t v25 = v23
      + *(int *)(v24 + 24)
      + ((*(unsigned __int8 *)(*(void *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v24 - 8) + 80));
  uint64_t v26 = sub_10004DD10();
  uint64_t v27 = *(void *)(v26 - 8);
  (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v9, v25, v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v9, 0, 1, v26);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v9, 1, v26) == 1)
  {
LABEL_5:
    id v29 = [self safari_readingListURL];
    sub_10004DCE0();

    sub_1000027C0((uint64_t)v9, &qword_100068B70);
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v11, v9, v26);
LABEL_6:
  uint64_t v30 = sub_10004DD10();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v11, 0, 1, v30);
  uint64_t v31 = sub_10000255C(&qword_100068B98, &qword_100068B78);
  sub_10004E1E0();
  sub_1000027C0((uint64_t)v11, &qword_100068B70);
  sub_1000027C0((uint64_t)v14, &qword_100068B78);
  uint64_t v32 = sub_10004E0F0();
  __chkstk_darwin(v32);
  sub_10004E350();
  type metadata accessor for SmallReadingListWidgetBackgroundView();
  uint64_t v43 = v12;
  uint64_t v44 = v31;
  swift_getOpaqueTypeConformance2();
  sub_10001202C(&qword_100068BA0, (void (*)(uint64_t))type metadata accessor for SmallReadingListWidgetBackgroundView);
  uint64_t v33 = v38;
  sub_10004E230();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v5, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v33);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v42, v20, v36);
}

uint64_t sub_1000101CC@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = type metadata accessor for SmallReadingListWidgetView();
  __chkstk_darwin(v3);
  uint64_t v51 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068BA8);
  __chkstk_darwin(v5 - 8);
  uint64_t v49 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DE10();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002388(&qword_100068BB0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002388(&qword_100068BB8);
  uint64_t v15 = __chkstk_darwin(v14);
  id v50 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v48 - v18;
  __chkstk_darwin(v17);
  uint64_t v53 = (uint64_t)&v48 - v20;
  *(void *)uint64_t v13 = sub_10004E000();
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  uint64_t v21 = sub_100002388(&qword_100068BC0);
  sub_100010778(a1, (uint64_t)&v13[*(int *)(v21 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  char v23 = sub_1000116D8();
  uint64_t v48 = v3;
  if (v23) {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for ColorScheme.dark(_:), v7);
  }
  else {
    sub_100013EFC((uint64_t)v10);
  }
  uint64_t v24 = (uint64_t *)&v19[*(int *)(v14 + 36)];
  uint64_t v25 = sub_100002388(&qword_100068BC8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v24 + *(int *)(v25 + 28), v10, v7);
  *uint64_t v24 = KeyPath;
  sub_10000274C((uint64_t)v13, (uint64_t)v19, &qword_100068BB0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1000027C0((uint64_t)v13, &qword_100068BB0);
  uint64_t v26 = v53;
  sub_1000127A8((uint64_t)v19, v53, &qword_100068BB8);
  uint64_t v27 = *((void *)a1 + 1);
  uint64_t v28 = *(void *)(v27 + 16);
  uint64_t v29 = type metadata accessor for BookmarkItem();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = v30;
  if (v28)
  {
    uint64_t v32 = v27 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
    uint64_t v33 = v49;
    sub_100011F8C(v32, v49, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v33, 0, 1, v29);
    sub_1000027C0(v33, &qword_100068BA8);
    uint64_t v34 = v51;
    sub_100011F8C((uint64_t)a1, v51, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    sub_100012204(v34, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    uint64_t v35 = 0;
    __int16 v36 = 255;
    uint64_t v37 = v52;
    uint64_t v38 = (uint64_t)v50;
  }
  else
  {
    uint64_t v39 = v49;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v49, 1, 1, v29);
    sub_1000027C0(v39, &qword_100068BA8);
    uint64_t v40 = v51;
    sub_100011F8C((uint64_t)a1, v51, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    uint64_t v41 = v40 + *(int *)(v48 + 28);
    uint64_t v42 = *(void *)v41;
    char v43 = *(unsigned char *)(v41 + 8);
    sub_100009364(*(void *)v41, v43);
    uint64_t v44 = sub_100013A64(v42, v43);
    sub_100009430(v42, v43);
    sub_100012204(v40, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    uint64_t v37 = v52;
    uint64_t v38 = (uint64_t)v50;
    if (v44)
    {
      int v45 = *a1;
      uint64_t v35 = swift_getKeyPath();
      if (v45) {
        __int16 v36 = 0;
      }
      else {
        __int16 v36 = 256;
      }
    }
    else
    {
      uint64_t v35 = 0;
      __int16 v36 = 255;
    }
  }
  sub_10000274C(v26, v38, &qword_100068BB8);
  sub_10000274C(v38, v37, &qword_100068BB8);
  uint64_t v46 = v37 + *(int *)(sub_100002388(&qword_100068BD0) + 48);
  *(void *)uint64_t v46 = v35;
  *(_WORD *)(v46 + 8) = v36;
  sub_100011FF4(v35, v36);
  sub_1000027C0(v26, &qword_100068BB8);
  sub_100012010(v35, v36);
  return sub_1000027C0(v38, &qword_100068BB8);
}

uint64_t sub_100010778@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = type metadata accessor for SmallReadingListWidgetView();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068BA8);
  __chkstk_darwin(v6 - 8);
  uint64_t v55 = (uint64_t)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for BookmarkItem();
  uint64_t v8 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002388(&qword_100068BD8);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v50 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v50 - v18;
  *(void *)uint64_t v17 = sub_10004E010();
  *((void *)v17 + 1) = 0x4000000000000000;
  v17[16] = 0;
  uint64_t v20 = sub_100002388(&qword_100068BE0);
  sub_100010F94((uint64_t)a1, (uint64_t)&v17[*(int *)(v20 + 44)]);
  sub_1000127A8((uint64_t)v17, (uint64_t)v19, &qword_100068BD8);
  uint64_t v53 = v3;
  uint64_t v21 = &a1[*(int *)(v3 + 28)];
  uint64_t v22 = *(void *)v21;
  LOBYTE(v17) = v21[8];
  sub_100009364(*(void *)v21, (char)v17);
  int v56 = sub_100013A64(v22, (char)v17);
  sub_100009430(v22, (char)v17);
  uint64_t v23 = *((void *)a1 + 1);
  uint64_t v24 = *(void *)(v23 + 16);
  id v57 = v19;
  uint64_t v58 = v14;
  if (v24)
  {
    uint64_t v52 = v5;
    sub_100011F8C(v23 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
    uint64_t v51 = sub_10004DFE0();
    uint64_t v25 = sub_10004E010();
    sub_100011B5C((uint64_t)v71);
    char v74 = 0;
    *(_OWORD *)((char *)&v73[3] + 7) = v71[3];
    *(_OWORD *)((char *)&v73[2] + 7) = v71[2];
    *(_OWORD *)((char *)&v73[7] + 7) = v71[7];
    *(_OWORD *)((char *)&v73[6] + 7) = v71[6];
    *(_OWORD *)((char *)&v73[8] + 7) = v71[8];
    *(_DWORD *)((char *)&v73[9] + 7) = v72;
    *(_OWORD *)((char *)&v73[4] + 7) = v71[4];
    *(_OWORD *)((char *)&v73[5] + 7) = v71[5];
    *(_OWORD *)((char *)v73 + 7) = v71[0];
    *(_OWORD *)((char *)&v73[1] + 7) = v71[1];
    *(void *)&long long v75 = v25;
    *((void *)&v75 + 1) = 0x4000000000000000;
    LOBYTE(v76[0]) = 0;
    *(_OWORD *)((char *)&v76[7] + 1) = v73[7];
    *(_OWORD *)((char *)&v76[6] + 1) = v73[6];
    *(_OWORD *)((char *)&v76[8] + 1) = v73[8];
    *(_OWORD *)((char *)&v76[8] + 12) = *(_OWORD *)((char *)&v73[8] + 11);
    *(_OWORD *)((char *)&v76[2] + 1) = v73[2];
    *(_OWORD *)((char *)&v76[3] + 1) = v73[3];
    *(_OWORD *)((char *)&v76[4] + 1) = v73[4];
    *(_OWORD *)((char *)&v76[5] + 1) = v73[5];
    *(_OWORD *)((char *)v76 + 1) = v73[0];
    *(_OWORD *)((char *)&v76[1] + 1) = v73[1];
    long long v68 = v76[7];
    v69[0] = v76[8];
    uint64_t v5 = v52;
    *(_OWORD *)((char *)v69 + 12) = *(_OWORD *)((char *)&v73[8] + 11);
    long long v64 = v76[3];
    long long v65 = v76[4];
    long long v66 = v76[5];
    long long v67 = v76[6];
    long long v60 = v75;
    long long v61 = v76[0];
    long long v62 = v76[1];
    long long v63 = v76[2];
    long long v86 = v73[6];
    long long v87 = v73[7];
    *(_OWORD *)uint64_t v88 = v73[8];
    *(_OWORD *)&v88[11] = *(_OWORD *)((char *)&v73[8] + 11);
    long long v82 = v73[2];
    long long v83 = v73[3];
    long long v84 = v73[4];
    long long v85 = v73[5];
    long long v80 = v73[0];
    char v77 = 0;
    v78[0] = v25;
    v78[1] = 0x4000000000000000;
    char v79 = 0;
    long long v81 = v73[1];
    sub_100012074((uint64_t)&v75);
    sub_10001213C((uint64_t)v78);
    *(_OWORD *)&v70[119] = v67;
    *(_OWORD *)&v70[135] = v68;
    *(_OWORD *)&v70[151] = v69[0];
    *(_OWORD *)&v70[167] = v69[1];
    *(_OWORD *)&v70[55] = v63;
    *(_OWORD *)&v70[71] = v64;
    *(_OWORD *)&v70[87] = v65;
    *(_OWORD *)&v70[103] = v66;
    *(_OWORD *)&v70[7] = v60;
    *(_OWORD *)&v70[23] = v61;
    *(_OWORD *)&v70[39] = v62;
    long long v100 = *(_OWORD *)&v70[128];
    long long v101 = *(_OWORD *)&v70[144];
    *(_OWORD *)uint64_t v102 = *(_OWORD *)&v70[160];
    long long v96 = *(_OWORD *)&v70[64];
    long long v97 = *(_OWORD *)&v70[80];
    long long v98 = *(_OWORD *)&v70[96];
    long long v99 = *(_OWORD *)&v70[112];
    long long v92 = *(_OWORD *)v70;
    long long v93 = *(_OWORD *)&v70[16];
    long long v94 = *(_OWORD *)&v70[32];
    char v89 = 1;
    long long v95 = *(_OWORD *)&v70[48];
    v90[0] = v51;
    v90[1] = 0;
    char v91 = 1;
    *(void *)&v102[15] = *((void *)&v69[1] + 1);
    uint64_t v103 = 0;
    char v104 = 0;
    nullsub_1(v90);
    sub_100012204((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
  }
  else
  {
    sub_100012514((uint64_t)v90);
  }
  sub_1000127A8((uint64_t)v90, (uint64_t)v105, &qword_100068BE8);
  uint64_t v26 = *((void *)a1 + 1);
  if (*(void *)(v26 + 16))
  {
    uint64_t v27 = v55;
    sub_100011F8C(v26 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v55, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v27, 0, 1, v54);
    sub_1000027C0(v27, &qword_100068BA8);
    sub_100011F8C((uint64_t)a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    sub_100012204((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
LABEL_7:
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v33 = 0;
    char v34 = 0;
    uint64_t v35 = 255;
    goto LABEL_12;
  }
  uint64_t v28 = v55;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v55, 1, 1, v54);
  sub_1000027C0(v28, &qword_100068BA8);
  sub_100011F8C((uint64_t)a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
  uint64_t v29 = &v5[*(int *)(v53 + 28)];
  uint64_t v30 = *(void *)v29;
  char v31 = v29[8];
  sub_100009364(*(void *)v29, v31);
  char v32 = sub_100013A64(v30, v31);
  sub_100009430(v30, v31);
  sub_100012204((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
  if (v32) {
    goto LABEL_7;
  }
  uint64_t v55 = sub_10004DFE0();
  int v36 = *a1;
  uint64_t KeyPath = swift_getKeyPath();
  sub_100009364(KeyPath, 0);
  uint64_t v54 = KeyPath;
  sub_100009430(KeyPath, 0);
  if (v36) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = 256;
  }
  uint64_t v33 = 1;
  char v34 = 1;
LABEL_12:
  char v38 = v56;
  char v39 = v56 & 1;
  uint64_t v41 = (uint64_t)v57;
  uint64_t v40 = (uint64_t)v58;
  sub_10000274C((uint64_t)v57, (uint64_t)v58, &qword_100068BD8);
  sub_1000127A8((uint64_t)v105, (uint64_t)&v60, &qword_100068BE8);
  uint64_t v42 = v59;
  sub_10000274C(v40, v59, &qword_100068BD8);
  char v43 = (int *)sub_100002388(&qword_100068BF0);
  uint64_t v44 = v42 + v43[12];
  *(void *)uint64_t v44 = 0;
  *(unsigned char *)(v44 + 8) = v39;
  *(unsigned char *)(v44 + 9) = (v38 & 1) == 0;
  uint64_t v45 = v42 + v43[16];
  sub_1000127A8((uint64_t)&v60, (uint64_t)v70, &qword_100068BE8);
  sub_1000127A8((uint64_t)v70, v45, &qword_100068BE8);
  uint64_t v46 = v42 + v43[20];
  uint64_t v48 = v54;
  uint64_t v47 = v55;
  *(void *)uint64_t v46 = v55;
  *(void *)(v46 + 8) = 0;
  *(void *)(v46 + 16) = v33;
  *(void *)(v46 + 24) = v48;
  *(void *)(v46 + 32) = v35;
  *(void *)(v46 + 40) = 0;
  *(unsigned char *)(v46 + 48) = v34;
  sub_100012398((uint64_t)v70, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100012264);
  sub_100012360(v47, 0, v33, v48, v35);
  sub_1000027C0(v41, &qword_100068BD8);
  sub_10001237C(v47, 0, v33, v48, v35);
  sub_1000127A8((uint64_t)&v60, (uint64_t)v90, &qword_100068BE8);
  sub_100012398((uint64_t)v90, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100012414);
  return sub_1000027C0(v40, &qword_100068BD8);
}

uint64_t sub_100010F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = sub_10004E240();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100002388(&qword_100068BF8);
  uint64_t v7 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v9 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068C00);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100002388(&qword_100068C08) - 8;
  __chkstk_darwin(v44);
  uint64_t v42 = (uint64_t)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100002388(&qword_100068C10) - 8;
  __chkstk_darwin(v46);
  uint64_t v45 = (uint64_t)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = a1;
  int v48 = sub_100011424();
  sub_100002388(&qword_100068C18);
  sub_1000126B4();
  sub_10004E1D0();
  sub_1000116D8();
  uint64_t v16 = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v40[1] = v4 + 104;
  uint64_t v18 = v3;
  v17(v6, enum case for Color.RGBColorSpace.sRGB(_:), v3);
  uint64_t v19 = v6;
  uint64_t v20 = sub_10004E260();
  uint64_t v21 = v43;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v43);
  uint64_t v22 = &v13[*(int *)(v11 + 44)];
  *(void *)uint64_t v22 = v20;
  *(_OWORD *)(v22 + 8) = xmmword_100052E60;
  *((void *)v22 + 3) = 0x4000000000000000;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  uint64_t v23 = v41;
  sub_1000116D8();
  v17(v19, v16, v18);
  uint64_t v24 = sub_10004E260();
  uint64_t v25 = v42;
  sub_10000274C((uint64_t)v13, v42, &qword_100068C00);
  uint64_t v26 = v25 + *(int *)(v44 + 44);
  *(void *)uint64_t v26 = v24;
  *(_OWORD *)(v26 + 8) = xmmword_100052E70;
  *(void *)(v26 + 24) = 0x3FF0000000000000;
  sub_1000027C0((uint64_t)v13, &qword_100068C00);
  LOBYTE(v24) = sub_10004E130();
  uint64_t v27 = v23 + *(int *)(type metadata accessor for SmallReadingListWidgetView() + 28);
  uint64_t v28 = *(void *)v27;
  LOBYTE(v11) = *(unsigned char *)(v27 + 8);
  sub_100009364(*(void *)v27, v11);
  sub_100013A64(v28, v11);
  sub_100009430(v28, v11);
  sub_10004DDF0();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v37 = v45;
  sub_10000274C(v25, v45, &qword_100068C08);
  uint64_t v38 = v37 + *(int *)(v46 + 44);
  *(unsigned char *)uint64_t v38 = v24;
  *(void *)(v38 + 8) = v30;
  *(void *)(v38 + 16) = v32;
  *(void *)(v38 + 24) = v34;
  *(void *)(v38 + 32) = v36;
  *(unsigned char *)(v38 + 40) = 0;
  sub_1000027C0(v25, &qword_100068C08);
  return sub_1000127A8(v37, v47, &qword_100068C10);
}

uint64_t sub_100011424()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SmallReadingListWidgetView();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v23 - v6;
  uint64_t v8 = sub_10004E3B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v23 - v13;
  sub_100013C3C((uint64_t)&v23 - v13);
  sub_10004E3A0();
  char v15 = sub_10004E390();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v16(v14, v8);
  sub_100011F8C(v1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
  if (v15)
  {
    sub_100012204((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    return sub_10004E0C0();
  }
  char v18 = sub_1000116D8();
  sub_100011F8C((uint64_t)v7, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
  if (v18)
  {
    uint64_t v19 = &v5[*(int *)(v2 + 28)];
    uint64_t v20 = *(void *)v19;
    char v21 = v19[8];
    sub_100009364(*(void *)v19, v21);
    char v22 = sub_100013A64(v20, v21);
    sub_100009430(v20, v21);
    sub_100012204((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    sub_100012204((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    if (v22) {
      return sub_10004E0C0();
    }
  }
  else
  {
    sub_100012204((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    sub_100012204((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
  }
  return sub_10004E0E0();
}

uint64_t sub_1000116D8()
{
  uint64_t v1 = sub_10004DE80();
  uint64_t v42 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v41 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v40 = (char *)&v38 - v4;
  uint64_t v5 = type metadata accessor for SmallReadingListWidgetView();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = sub_10004E3B0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  char v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v18 = v0;
  sub_100013C3C((uint64_t)&v38 - v16);
  sub_10004E3A0();
  char v19 = sub_10004E390();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v15, v11);
  v20(v17, v11);
  if ((v19 & 1) == 0)
  {
    uint64_t v22 = (uint64_t)v10;
    uint64_t v23 = (uint64_t)v40;
    uint64_t v24 = v41;
    uint64_t v26 = v42;
    uint64_t v25 = v43;
    char v39 = v8;
    uint64_t v27 = *(void *)(v18 + 8);
    uint64_t v28 = v18;
    if (*(void *)(v27 + 16)
      && (uint64_t v29 = type metadata accessor for BookmarkItem(),
          *(void *)(v27
                    + ((*(unsigned __int8 *)(*(void *)(v29 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v29 - 8) + 80))
                    + *(int *)(v29 + 28))))
    {
      uint64_t v38 = type metadata accessor for SmallReadingListWidgetView;
      sub_100011F8C(v18, v22, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
      sub_100013A2C(v23);
      sub_10001202C(&qword_1000688C0, (void (*)(uint64_t))&type metadata accessor for RedactionReasons);
      sub_10004E660();
      sub_10001202C(&qword_1000688C8, (void (*)(uint64_t))&type metadata accessor for RedactionReasons);
      char v30 = sub_10004E4F0();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v26 + 8);
      v31(v24, v25);
      v31((char *)v23, v25);
      sub_100012204(v22, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
      uint64_t v32 = (uint64_t)v39;
      sub_100011F8C(v28, (uint64_t)v39, (uint64_t (*)(void))v38);
      if (v30)
      {
        uint64_t v33 = v32 + *(int *)(v5 + 28);
        uint64_t v34 = *(void *)v33;
        char v35 = *(unsigned char *)(v33 + 8);
        sub_100009364(*(void *)v33, v35);
        char v21 = sub_100013A64(v34, v35);
        sub_100009430(v34, v35);
LABEL_9:
        sub_100012204(v32, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
        return v21 & 1;
      }
    }
    else
    {
      sub_100011F8C(v18, v22, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
      sub_100012204(v22, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
      uint64_t v36 = v18;
      uint64_t v32 = (uint64_t)v39;
      sub_100011F8C(v36, (uint64_t)v39, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
    }
    char v21 = 0;
    goto LABEL_9;
  }
  char v21 = 0;
  return v21 & 1;
}

uint64_t sub_100011B5C@<X0>(uint64_t a1@<X8>)
{
  sub_1000026F8();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_10004E1C0();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v25 = v7;
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_1000681E8 != -1) {
    swift_once();
  }
  sub_10004E150();
  uint64_t v23 = sub_10004E160();
  uint64_t v8 = swift_getKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10004E1C0();
  uint64_t v21 = v10;
  uint64_t v22 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = swift_getKeyPath();
  if (qword_1000681E0 != -1) {
    swift_once();
  }
  char v16 = v6 & 1;
  uint64_t v17 = qword_10006A590;
  uint64_t v18 = swift_getKeyPath();
  swift_retain();
  int v19 = sub_10004E0E0();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v25;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 4;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v23;
  *(void *)(a1 + 72) = v22;
  *(void *)(a1 + 80) = v21;
  *(unsigned char *)(a1 + 88) = v12 & 1;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = 1;
  *(unsigned char *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v18;
  *(void *)(a1 + 136) = v17;
  *(_DWORD *)(a1 + 144) = v19;
  sub_1000027B0(v2, v4, v16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000027B0(v22, v21, v12 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000281C(v22, v21, v12 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000281C(v2, v4, v16);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100011E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SmallReadingListWidgetBackgroundView();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v6) = *(unsigned char *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *uint64_t v7 = v6;
  *((void *)v7 + 1) = v8;
  uint64_t v9 = (uint64_t *)&v7[*(int *)(v5 + 28)];
  *uint64_t v9 = swift_getKeyPath();
  sub_100002388(&qword_1000687F8);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = &v7[*(int *)(v5 + 32)];
  *(void *)uint64_t v10 = swift_getKeyPath();
  v10[8] = 0;
  sub_100011F20((uint64_t)v7, a2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100011F0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011E14(*(void *)(v1 + 16), a1);
}

uint64_t sub_100011F20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SmallReadingListWidgetBackgroundView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011F8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011FF4(uint64_t result, char a2)
{
  if (a2 != -1) {
    return sub_100009364(result, a2 & 1);
  }
  return result;
}

uint64_t sub_100012010(uint64_t result, char a2)
{
  if (a2 != -1) {
    return sub_100009430(result, a2 & 1);
  }
  return result;
}

uint64_t sub_10001202C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100012074(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_1000027B0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1000027B0(v2, v3, v4);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10001213C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_10000281C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000281C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_100012204(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100012264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a10)
  {
    sub_1000027B0(a7, a8, a9 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_1000027B0(a16, a17, a18 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100012360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != -1) {
    return sub_100009364(a4, a5 & 1);
  }
  return result;
}

uint64_t sub_10001237C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != -1) {
    return sub_100009430(a4, a5 & 1);
  }
  return result;
}

uint64_t sub_100012398(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 208);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v4);
  return a1;
}

uint64_t sub_100012414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a10)
  {
    sub_10000281C(a7, a8, a9 & 1);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    sub_10000281C(a16, a17, a18 & 1);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

double sub_100012514(uint64_t a1)
{
  *(unsigned char *)(a1 + 208) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_10001253C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004DF20();
  *a1 = result;
  return result;
}

uint64_t sub_100012568()
{
  return sub_10004DF30();
}

uint64_t sub_100012594@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10004DF70();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000125C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10004DF70();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000125FC()
{
  return sub_10004DF80();
}

uint64_t sub_10001262C()
{
  return sub_10004DF80();
}

uint64_t sub_10001265C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004DF20();
  *a1 = result;
  return result;
}

uint64_t sub_100012688()
{
  return sub_10004DF30();
}

unint64_t sub_1000126B4()
{
  unint64_t result = qword_100068C20;
  if (!qword_100068C20)
  {
    sub_100002450(&qword_100068C18);
    sub_100012754();
    sub_10000255C(&qword_100068C30, &qword_100068C38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068C20);
  }
  return result;
}

unint64_t sub_100012754()
{
  unint64_t result = qword_100068C28;
  if (!qword_100068C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068C28);
  }
  return result;
}

uint64_t sub_1000127A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002388(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001280C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100012910(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (uint64_t *)((char *)a1 + v5);
    uint64_t v7 = (uint64_t *)((char *)a2 + v5);
    swift_bridgeObjectRetain();
    sub_100002388(&qword_100068928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_10004E3E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    }
    else
    {
      *uint64_t v6 = *v7;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t sub_100012A38(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004E3E0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100012AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (void *)(a2 + v4);
  swift_bridgeObjectRetain();
  sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004E3E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    void *v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100012BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_1000027C0(a1 + v6, &qword_100068928);
    sub_100002388(&qword_100068928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_10004E3E0();
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

_OWORD *sub_100012CBC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004E3E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100012D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_1000027C0(a1 + v6, &qword_100068928);
    uint64_t v9 = sub_100002388(&qword_100068928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004E3E0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100012E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012EA8);
}

uint64_t sub_100012EA8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100002388(&qword_100068C40);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100012F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012F70);
}

uint64_t sub_100012F70(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100002388(&qword_100068C40);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ReadingListWidgetView()
{
  uint64_t result = qword_100068CA0;
  if (!qword_100068CA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100013068()
{
  sub_100013100();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100013100()
{
  if (!qword_100068CB0)
  {
    sub_10004E3E0();
    unint64_t v0 = sub_10004DE20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100068CB0);
    }
  }
}

uint64_t sub_100013158()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100013174()
{
  return sub_10004DED0();
}

uint64_t sub_100013198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000142D4(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_1000131C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v60 = a1;
  uint64_t v3 = sub_100002388(&qword_100068B70);
  __chkstk_darwin(v3 - 8);
  uint64_t v52 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for LargeReadingListWidgetView();
  __chkstk_darwin(v58);
  uint64_t v51 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100002388(&qword_100068CE0);
  uint64_t v54 = *(void *)(v59 - 8);
  uint64_t v6 = __chkstk_darwin(v59);
  uint64_t v50 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v53 = (char *)&v48 - v8;
  uint64_t v55 = sub_100002388(&qword_100068CE8);
  __chkstk_darwin(v55);
  uint64_t v57 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068AB8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v56 = type metadata accessor for SmallReadingListWidgetView();
  uint64_t v13 = __chkstk_darwin(v56);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v49 = (uint64_t)&v48 - v16;
  uint64_t v17 = sub_10004E3E0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v48 - v22;
  type metadata accessor for ReadingListWidgetView();
  sub_100013C74(&qword_100068928, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v23);
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v21, enum case for WidgetFamily.systemSmall(_:), v17);
  sub_100014644(&qword_100068CF0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10004E5D0();
  sub_10004E5D0();
  uint64_t v24 = v61;
  uint64_t v25 = v63;
  uint64_t v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  v26(v21, v17);
  v26(v23, v17);
  char v27 = *v1;
  uint64_t v28 = *((void *)v2 + 1);
  uint64_t *v12 = swift_getKeyPath();
  sub_100002388(&qword_100068AA8);
  swift_storeEnumTagMultiPayload();
  if (v24 == v25)
  {
    *uint64_t v15 = v27;
    *((void *)v15 + 1) = v28;
    uint64_t v29 = (int *)v56;
    char v30 = (uint64_t *)&v15[*(int *)(v56 + 20)];
    *char v30 = swift_getKeyPath();
    sub_100002388(&qword_100068AA0);
    swift_storeEnumTagMultiPayload();
    uint64_t v31 = (uint64_t *)&v15[v29[6]];
    *uint64_t v31 = swift_getKeyPath();
    sub_100002388(&qword_1000687F8);
    swift_storeEnumTagMultiPayload();
    uint64_t v32 = &v15[v29[7]];
    *(void *)uint64_t v32 = swift_getKeyPath();
    v32[8] = 0;
    sub_1000143E8((uint64_t)v12, (uint64_t)&v15[v29[8]]);
    uint64_t v33 = v49;
    sub_10001451C((uint64_t)v15, v49);
    sub_100014580(v33, v57);
    swift_storeEnumTagMultiPayload();
    sub_100014644(&qword_100068D00, (void (*)(uint64_t))type metadata accessor for SmallReadingListWidgetView);
    uint64_t v34 = sub_100014644(&qword_100068CF8, (void (*)(uint64_t))type metadata accessor for LargeReadingListWidgetView);
    swift_bridgeObjectRetain();
    uint64_t v61 = v58;
    uint64_t v62 = v34;
    swift_getOpaqueTypeConformance2();
    sub_10004E0B0();
    return sub_1000145E4(v33, (uint64_t (*)(void))type metadata accessor for SmallReadingListWidgetView);
  }
  else
  {
    uint64_t v36 = (uint64_t)v51;
    char *v51 = v27;
    *(void *)(v36 + 8) = v28;
    uint64_t v37 = v58;
    uint64_t v38 = (uint64_t *)(v36 + *(int *)(v58 + 20));
    *uint64_t v38 = swift_getKeyPath();
    sub_100002388(&qword_100068928);
    swift_storeEnumTagMultiPayload();
    sub_1000143E8((uint64_t)v12, v36 + *(int *)(v37 + 24));
    char v39 = self;
    swift_bridgeObjectRetain();
    id v40 = [v39 safari_readingListURL];
    uint64_t v41 = (uint64_t)v52;
    sub_10004DCE0();

    uint64_t v42 = sub_10004DD10();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
    uint64_t v43 = sub_100014644(&qword_100068CF8, (void (*)(uint64_t))type metadata accessor for LargeReadingListWidgetView);
    uint64_t v44 = v50;
    sub_10004E1E0();
    sub_1000027C0(v41, &qword_100068B70);
    sub_1000145E4(v36, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
    uint64_t v46 = v53;
    uint64_t v45 = v54;
    uint64_t v47 = v59;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v53, v44, v59);
    (*(void (**)(uint64_t, char *, uint64_t))(v45 + 16))(v57, v46, v47);
    swift_storeEnumTagMultiPayload();
    sub_100014644(&qword_100068D00, (void (*)(uint64_t))type metadata accessor for SmallReadingListWidgetView);
    uint64_t v61 = v37;
    uint64_t v62 = v43;
    swift_getOpaqueTypeConformance2();
    sub_10004E0B0();
    return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  }
}

uint64_t sub_100013A2C@<X0>(uint64_t a1@<X8>)
{
  return sub_100013C74(&qword_1000687F8, (uint64_t (*)(void))&type metadata accessor for RedactionReasons, 0xD000000000000010, 0x800000010004F410, a1);
}

uint64_t sub_100013A64(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10004DFA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_10004E630();
  uint64_t v9 = sub_10004E110();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_10001468C(1819242306, 0xE400000000000000, &v12);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10004DF90();
  swift_getAtKeyPath();
  sub_100009430(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

uint64_t sub_100013C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_100013C74(&qword_100068AA8, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x800000010004F3F0, a1);
}

uint64_t sub_100013C74@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_10004DFA0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100002388(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000274C(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_10004E630();
    uint64_t v21 = sub_10004E110();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_10001468C(a3, v23, &v24);
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10004DF90();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100013EFC@<X0>(uint64_t a1@<X8>)
{
  return sub_100013C74(&qword_100068AA0, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_100013F38@<X0>(uint64_t a1@<X8>)
{
  return sub_100013C74(&qword_100068928, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

double sub_100013F74(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10004DFA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_10004E630();
  uint64_t v9 = sub_10004E110();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_10001468C(0x74616F6C464743, 0xE700000000000000, &v13);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10004DF90();
  swift_getAtKeyPath();
  sub_100009430(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v13;
}

uint64_t sub_100014154()
{
  return sub_10004DEF0();
}

uint64_t sub_100014178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000142D4(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

uint64_t sub_1000141A4()
{
  sub_10004DF40();
  sub_100014644(&qword_100068D08, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_10004DFB0();
  return v1;
}

uint64_t sub_100014220@<X0>(unsigned char *a1@<X8>)
{
  sub_10004DF40();
  sub_100014644(&qword_100068D08, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  uint64_t result = sub_10004DFB0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000142B0()
{
  return sub_10004DF60();
}

uint64_t sub_1000142D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1000143A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000142D4(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_1000143E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002388(&qword_100068AB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014450()
{
  return sub_10004DED0();
}

uint64_t sub_100014474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000142D4(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_1000144B4()
{
  return sub_10004DEF0();
}

uint64_t sub_1000144D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000142D4(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

uint64_t sub_10001451C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SmallReadingListWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SmallReadingListWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000145E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100014644(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001468C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_100014760(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100014860((uint64_t)v12, *a3);
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
      sub_100014860((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D900((uint64_t)v12);
  return v7;
}

unint64_t sub_100014760(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = (unint64_t)sub_1000148BC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_10004E6B0();
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

uint64_t sub_100014860(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_1000148BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_100014954(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014A58(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100014A58((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100014954(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000149F0(v2, 0);
      unint64_t result = (void *)sub_10004E690();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_10004E5C0();
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

void *sub_1000149F0(uint64_t a1, uint64_t a2)
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
  sub_100002388(&qword_100068D10);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100014A58(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002388(&qword_100068D10);
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
    if (v10 != a4 || v12 >= &v13[v8]) {
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

unint64_t sub_100014B48()
{
  unint64_t result = qword_100068D18;
  if (!qword_100068D18)
  {
    sub_100002450(&qword_100068D20);
    sub_100014644(&qword_100068D00, (void (*)(uint64_t))type metadata accessor for SmallReadingListWidgetView);
    type metadata accessor for LargeReadingListWidgetView();
    sub_100014644(&qword_100068CF8, (void (*)(uint64_t))type metadata accessor for LargeReadingListWidgetView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D18);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabLayoutControlPicker()
{
  return &type metadata for TabLayoutControlPicker;
}

uint64_t sub_100014C6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014C88@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_10002A034(KeyPath, a1);

  return swift_release();
}

unint64_t sub_100014CDC()
{
  unint64_t result = qword_100068D38;
  if (!qword_100068D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D38);
  }
  return result;
}

uint64_t sub_100014D30()
{
  return sub_10000255C(&qword_100068D40, &qword_100068D48);
}

uint64_t sub_100014D6C()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  char v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A640);
  sub_100008DDC(v10, (uint64_t)qword_10006A640);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_100015058()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A658);
  sub_100008DDC(v0, (uint64_t)qword_10006A658);
  return sub_10004DC50();
}

uint64_t sub_1000150BC()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A670);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A670);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100015174()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A688 = result;
  return result;
}

uint64_t sub_10001519C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_100068E90);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100068E98);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100015360, 0, 0);
}

uint64_t sub_100015360()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10001635C();
  *uint64_t v1 = v0;
  v1[1] = sub_100015434;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100015A2C, 0, &type metadata for BlockPopUpsEntity, v2);
}

uint64_t sub_100015434()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100015530, 0, 0);
}

uint64_t sub_100015530()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100068248 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A688;
  *(void *)(v0 + 168) = qword_10006A688;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_100068E70, &qword_100068E78);
  *uint64_t v3 = v0;
  v3[1] = sub_100015688;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100015688()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_1000157DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000157DC()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100014CDC();
  sub_100016570();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100015A30()
{
  uint64_t v0 = sub_100002388(&qword_100068EA0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068248 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100016570();
  sub_10000255C(&qword_100068EA8, &qword_100068EA0);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100015B98()
{
  if (qword_100068248 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100015BF8()
{
  unint64_t result = qword_100068D50;
  if (!qword_100068D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D50);
  }
  return result;
}

unint64_t sub_100015C50()
{
  unint64_t result = qword_100068D58;
  if (!qword_100068D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D58);
  }
  return result;
}

uint64_t sub_100015CA4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100015CD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015D28@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068238, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A658, a1);
}

uint64_t sub_100015D60@<X0>(uint64_t a1@<X8>)
{
  if (qword_100068240 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A670);

  return sub_100009178(v3, a1);
}

uint64_t sub_100015DDC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_10001519C(a1, v5, v4);
}

uint64_t sub_100015E88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100016CCC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100015EB0()
{
  return 0xD000000000000022;
}

unint64_t sub_100015ED0()
{
  unint64_t result = qword_100068D68;
  if (!qword_100068D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D68);
  }
  return result;
}

unint64_t sub_100015F28()
{
  unint64_t result = qword_100068D70;
  if (!qword_100068D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D70);
  }
  return result;
}

uint64_t sub_100015F7C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100015F9C, 0, 0);
}

uint64_t sub_100015F9C()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  id v2 = [self safari_browserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:_SFJavaScriptCanOpenWindowsAutomaticallyDefaultsKey];

  *uint64_t v1 = v3 ^ 1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100016050(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 16) = v3;
  return _swift_task_switch(sub_10001712C, 0, 0);
}

uint64_t sub_1000160FC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100068E58 + dword_100068E58);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_1000161A4()
{
  unint64_t result = qword_100068D80;
  if (!qword_100068D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D80);
  }
  return result;
}

uint64_t sub_1000161F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000166F4();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000162AC()
{
  unint64_t result = qword_100068D90;
  if (!qword_100068D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D90);
  }
  return result;
}

unint64_t sub_100016304()
{
  unint64_t result = qword_100068D98;
  if (!qword_100068D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D98);
  }
  return result;
}

unint64_t sub_10001635C()
{
  unint64_t result = qword_100068DA0[0];
  if (!qword_100068DA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100068DA0);
  }
  return result;
}

uint64_t sub_1000163B0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000166F4();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100016464(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000166F4();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100016518()
{
  unint64_t result = qword_100068DB8;
  if (!qword_100068DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068DB8);
  }
  return result;
}

unint64_t sub_100016570()
{
  unint64_t result = qword_100068DC0;
  if (!qword_100068DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068DC0);
  }
  return result;
}

unint64_t sub_1000165C8()
{
  unint64_t result = qword_100068DC8;
  if (!qword_100068DC8)
  {
    sub_100002450(qword_100068DD0);
    sub_100016570();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068DC8);
  }
  return result;
}

uint64_t sub_10001663C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000161A4();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000166F4()
{
  unint64_t result = qword_100068DE8;
  if (!qword_100068DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068DE8);
  }
  return result;
}

uint64_t sub_100016748()
{
  uint64_t v0 = qword_100068D28;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100016784()
{
  unint64_t result = qword_100068DF0;
  if (!qword_100068DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068DF0);
  }
  return result;
}

unint64_t sub_1000167DC()
{
  unint64_t result = qword_100068DF8;
  if (!qword_100068DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068DF8);
  }
  return result;
}

unint64_t sub_100016834()
{
  unint64_t result = qword_100068E00;
  if (!qword_100068E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068E00);
  }
  return result;
}

unint64_t sub_10001688C()
{
  unint64_t result = qword_100068E08;
  if (!qword_100068E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068E08);
  }
  return result;
}

unint64_t sub_1000168E4()
{
  unint64_t result = qword_100068E10;
  if (!qword_100068E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068E10);
  }
  return result;
}

unint64_t sub_10001693C()
{
  unint64_t result = qword_100068E18;
  if (!qword_100068E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068E18);
  }
  return result;
}

uint64_t sub_100016990@<X0>(uint64_t *a1@<X8>)
{
  sub_100015F28();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000169D0@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068230, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A640, a1);
}

uint64_t sub_100016A08@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008DDC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100016AAC()
{
  return sub_10000255C(&qword_100068E20, &qword_100068E28);
}

uint64_t sub_100016AE8(uint64_t a1)
{
  unint64_t v2 = sub_10001635C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100016B38()
{
  unint64_t result = qword_100068E30;
  if (!qword_100068E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068E30);
  }
  return result;
}

uint64_t sub_100016B8C(uint64_t a1)
{
  unint64_t v2 = sub_100015F28();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100016BD8(uint64_t a1)
{
  unint64_t v2 = sub_10001693C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for BlockPopUpsEntity.BlockPopUpsEntityQuery()
{
  return &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery;
}

ValueMetadata *type metadata accessor for BlockPopUpsEntity()
{
  return &type metadata for BlockPopUpsEntity;
}

ValueMetadata *type metadata accessor for BlockPopUpsEntity.UpdateIntent_value()
{
  return &type metadata for BlockPopUpsEntity.UpdateIntent_value;
}

uint64_t sub_100016C54()
{
  return sub_10000255C(&qword_100068E38, &qword_100068E40);
}

uint64_t sub_100016C90()
{
  return sub_10000255C(&qword_100068E48, &qword_100068E40);
}

uint64_t sub_100016CCC()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  char v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v23 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100068E50);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001635C();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

uint64_t sub_10001710C(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001712C, 0, 0);
}

uint64_t sub_10001712C()
{
  char v1 = *(unsigned char *)(v0 + 16);
  uint64_t v2 = self;
  id v3 = [v2 safari_browserDefaults];
  uint64_t v4 = _SFJavaScriptCanOpenWindowsAutomaticallyDefaultsKey;
  [v3 setBool:(v1 & 1) == 0 forKey:_SFJavaScriptCanOpenWindowsAutomaticallyDefaultsKey];

  id v5 = [self defaultCenter];
  id v6 = [v2 safari_notificationNameForUserDefaultsKey:v4];
  [v5 postNotificationName:v6 object:0 userInfo:0 deliverImmediately:1];

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100017250()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100017390, 0, 0);
}

uint64_t sub_100017390()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100068D48);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100068E70, &qword_100068E78);
  uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100017540@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100017550()
{
  unint64_t result = qword_100068ED0;
  if (!qword_100068ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068ED0);
  }
  return result;
}

uint64_t sub_1000175A4()
{
  return sub_10000255C(&qword_100068ED8, &qword_100068EE0);
}

uint64_t sub_1000175E0()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004DC60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A690);
  sub_100008DDC(v10, (uint64_t)qword_10006A690);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DC90();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_1000178F8(uint64_t a1)
{
  return sub_100006110(a1, qword_10006A6A8);
}

uint64_t sub_10001791C(uint64_t a1)
{
  return sub_100006194(a1, qword_10006A6C0);
}

uint64_t sub_100017940()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A6D8 = result;
  return result;
}

uint64_t sub_100017968()
{
  sub_10004D850();
  return v1;
}

uint64_t sub_10001799C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  sub_100002388(&qword_100068770);
  v3[11] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[12] = swift_task_alloc();
  sub_100002388(&qword_100069290);
  v3[13] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100069298);
  v3[17] = v5;
  v3[18] = *(void *)(v5 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return _swift_task_switch(sub_100017B60, 0, 0);
}

uint64_t sub_100017B60()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v1;
  unint64_t v2 = sub_100018E14();
  *uint64_t v1 = v0;
  v1[1] = sub_100017C34;
  uint64_t v3 = *(void *)(v0 + 160);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100018310, 0, &type metadata for SearchEngineEntity, v2);
}

uint64_t sub_100017C34()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100017D30, 0, 0);
}

uint64_t sub_100017D30()
{
  sub_10004D850();
  uint64_t v1 = v0[3];
  v0[4] = v1;
  v0[22] = v1;
  sub_10004D850();
  uint64_t v2 = v0[5];
  v0[6] = v2;
  v0[23] = v2;
  if (qword_100068268 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10006A6D8;
  v0[24] = qword_10006A6D8;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[25] = v4;
  uint64_t v5 = sub_10000255C(&qword_100069278, &qword_100069280);
  *uint64_t v4 = v0;
  v4[1] = sub_100017E8C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 6, v3, &type metadata for SearchEngineOption, v5);
}

uint64_t sub_100017E8C()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10001824C;
  }
  else {
    uint64_t v2 = sub_100017FFC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100017FFC()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v11 = v0[16];
  uint64_t v12 = v0[15];
  uint64_t v13 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[12];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100017550();
  sub_100019028();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001824C()
{
  (*(void (**)(void, void))(v0[18] + 8))(v0[20], v0[17]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100018314()
{
  uint64_t v0 = sub_100002388(&qword_1000692A0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068268 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100019028();
  sub_10000255C(&qword_1000692A8, &qword_1000692A0);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001847C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t sub_1000184BC(uint64_t a1, uint64_t a2)
{
  return sub_100006D5C(a1, a2, &qword_100068268);
}

unint64_t sub_1000184E4()
{
  unint64_t result = qword_100068EE8;
  if (!qword_100068EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068EE8);
  }
  return result;
}

unint64_t sub_10001853C()
{
  unint64_t result = qword_100068EF0;
  if (!qword_100068EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068EF0);
  }
  return result;
}

uint64_t sub_100018590()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000185C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A570(a1, a2, a3, (void (*)(void))sub_100017550);
}

uint64_t sub_1000185DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001CB18(&qword_100068258, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A6A8, a1);
}

uint64_t sub_100018614@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A620(&qword_100068260, (uint64_t)qword_10006A6C0, a1);
}

uint64_t sub_100018638(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_10001799C(a1, v5, v4);
}

uint64_t sub_1000186E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001D648();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001870C()
{
  return 0xD000000000000023;
}

unint64_t sub_10001872C()
{
  unint64_t result = qword_100068F00;
  if (!qword_100068F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F00);
  }
  return result;
}

unint64_t sub_100018784()
{
  unint64_t result = qword_100068F08;
  if (!qword_100068F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F08);
  }
  return result;
}

uint64_t sub_1000187D8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000187F8, 0, 0);
}

uint64_t sub_1000187F8()
{
  id v1 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];
  id v2 = [v1 defaultSearchEngineName];
  if (v2)
  {
    uint64_t v3 = *(uint64_t **)(v0 + 16);
    uint64_t v4 = sub_10004E570();
    uint64_t v6 = v5;

    uint64_t v7 = sub_10001DA20(v4, v6);
    *uint64_t v3 = v7;
  }
  else
  {
    sub_10004D6B0();
    sub_10001F1B4((unint64_t *)&qword_1000691F0, (void (*)(uint64_t))&type metadata accessor for _PrebuiltAppIntentError);
    swift_allocError();
    sub_10004DA30();
    swift_willThrow();
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10001894C(uint64_t a1, void *a2)
{
  *(void *)(v2 + 48) = *a2;
  return _swift_task_switch(sub_100018970, 0, 0);
}

id sub_100018970()
{
  id v1 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];
  id result = [v1 currentSearchEngineNames];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_10004E5E0();

    uint64_t v5 = *(void *)(v4 + 16);
    if (v5)
    {
      id v11 = v1;
      swift_bridgeObjectRetain();
      uint64_t v6 = (uint64_t *)(v4 + 40);
      while (1)
      {
        uint64_t v7 = *v6;
        v0[2] = *(v6 - 1);
        v0[3] = v7;
        swift_bridgeObjectRetain();
        sub_10004D810();
        sub_1000026F8();
        uint64_t v8 = sub_10004E640();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!v8) {
          break;
        }
        v6 += 2;
        if (!--v5)
        {
          swift_bridgeObjectRelease();
          id v1 = v11;
          goto LABEL_7;
        }
      }
      swift_bridgeObjectRelease_n();
      sub_10004D810();
      NSString v10 = sub_10004E560();
      swift_bridgeObjectRelease();
      [v11 setDefaultSearchEngine:v10 forPrivateBrowsing:0];

      uint64_t v9 = (uint64_t (*)(void))v0[1];
    }
    else
    {
LABEL_7:
      swift_bridgeObjectRelease();

      sub_10004D6B0();
      sub_10001F1B4((unint64_t *)&qword_1000691F0, (void (*)(uint64_t))&type metadata accessor for _PrebuiltAppIntentError);
      swift_allocError();
      sub_10004DA30();
      swift_willThrow();

      uint64_t v9 = (uint64_t (*)(void))v0[1];
    }
    return (id)v9();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018BB4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069260 + dword_100069260);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_100018C5C()
{
  unint64_t result = qword_100068F18;
  if (!qword_100068F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F18);
  }
  return result;
}

uint64_t sub_100018CB0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100019170();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100018D64()
{
  unint64_t result = qword_100068F28;
  if (!qword_100068F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F28);
  }
  return result;
}

unint64_t sub_100018DBC()
{
  unint64_t result = qword_100068F30;
  if (!qword_100068F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F30);
  }
  return result;
}

unint64_t sub_100018E14()
{
  unint64_t result = qword_100068F38[0];
  if (!qword_100068F38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100068F38);
  }
  return result;
}

uint64_t sub_100018E68(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100019170();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100018F1C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100019170();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100018FD0()
{
  unint64_t result = qword_100068F50;
  if (!qword_100068F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F50);
  }
  return result;
}

unint64_t sub_100019028()
{
  unint64_t result = qword_100068F58;
  if (!qword_100068F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F58);
  }
  return result;
}

uint64_t sub_10001907C()
{
  return sub_10001C764(&qword_100068F60, qword_100068F68, (void (*)(void))sub_100019028);
}

uint64_t sub_1000190B8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100018C5C();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100019170()
{
  unint64_t result = qword_100068F80;
  if (!qword_100068F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F80);
  }
  return result;
}

uint64_t sub_1000191C4()
{
  uint64_t v0 = qword_100068EB0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100019200()
{
  unint64_t result = qword_100068F88;
  if (!qword_100068F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F88);
  }
  return result;
}

unint64_t sub_100019258()
{
  unint64_t result = qword_100068F90;
  if (!qword_100068F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F90);
  }
  return result;
}

unint64_t sub_1000192B0()
{
  unint64_t result = qword_100068F98;
  if (!qword_100068F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068F98);
  }
  return result;
}

unint64_t sub_100019308()
{
  unint64_t result = qword_100068FA0;
  if (!qword_100068FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FA0);
  }
  return result;
}

unint64_t sub_100019360()
{
  unint64_t result = qword_100068FA8;
  if (!qword_100068FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FA8);
  }
  return result;
}

unint64_t sub_1000193B8()
{
  unint64_t result = qword_100068FB0;
  if (!qword_100068FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FB0);
  }
  return result;
}

uint64_t sub_10001940C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001BBCC((void (*)(void))sub_100018784, a1);
}

uint64_t sub_100019424@<X0>(uint64_t a1@<X8>)
{
  return sub_10001CB18(&qword_100068250, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A690, a1);
}

uint64_t sub_10001945C()
{
  return sub_10000255C(&qword_100068FB8, &qword_100068FC0);
}

uint64_t sub_100019498(uint64_t a1)
{
  unint64_t v2 = sub_100018E14();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000194E8()
{
  unint64_t result = qword_100068FC8;
  if (!qword_100068FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FC8);
  }
  return result;
}

uint64_t sub_10001953C(uint64_t a1)
{
  unint64_t v2 = sub_100018784();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100019588(uint64_t a1)
{
  unint64_t v2 = sub_1000193B8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000195D8()
{
  unint64_t result = qword_100068FD0;
  if (!qword_100068FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FD0);
  }
  return result;
}

uint64_t sub_10001962C()
{
  return sub_10000255C(&qword_100068FD8, &qword_100068FE0);
}

uint64_t sub_100019668()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004DC60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A6E0);
  sub_100008DDC(v10, (uint64_t)qword_10006A6E0);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DC90();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_10001997C(uint64_t a1)
{
  return sub_100006110(a1, qword_10006A6F8);
}

uint64_t sub_1000199A0(uint64_t a1)
{
  return sub_100006194(a1, qword_10006A710);
}

uint64_t sub_1000199C4()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A728 = result;
  return result;
}

uint64_t sub_1000199EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  sub_100002388(&qword_100068770);
  v3[11] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[12] = swift_task_alloc();
  sub_100002388(&qword_100069240);
  v3[13] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100069248);
  v3[17] = v5;
  v3[18] = *(void *)(v5 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return _swift_task_switch(sub_100019BB0, 0, 0);
}

uint64_t sub_100019BB0()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v1;
  unint64_t v2 = sub_10001B5BC();
  *uint64_t v1 = v0;
  v1[1] = sub_100019C84;
  uint64_t v3 = *(void *)(v0 + 160);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10001A29C, 0, &type metadata for PrivateSearchEngineEntity, v2);
}

uint64_t sub_100019C84()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100019D80, 0, 0);
}

uint64_t sub_100019D80()
{
  sub_10004D850();
  uint64_t v1 = v0[3];
  v0[4] = v1;
  v0[22] = v1;
  sub_10004D850();
  uint64_t v2 = v0[5];
  v0[6] = v2;
  v0[23] = v2;
  if (qword_100068288 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10006A728;
  v0[24] = qword_10006A728;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[25] = v4;
  uint64_t v5 = sub_10000255C(&qword_100069218, &qword_100069220);
  *uint64_t v4 = v0;
  v4[1] = sub_100019EDC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 6, v3, &type metadata for SearchEngineOption, v5);
}

uint64_t sub_100019EDC()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10001F64C;
  }
  else {
    uint64_t v2 = sub_10001A04C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001A04C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v11 = v0[16];
  uint64_t v12 = v0[15];
  uint64_t v13 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[12];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1000195D8();
  sub_10001B7D0();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001A2A0()
{
  uint64_t v0 = sub_100002388(&qword_100069250);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068288 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_10001B7D0();
  sub_10000255C(&qword_100069258, &qword_100069250);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001A408()
{
  return swift_release();
}

uint64_t sub_10001A450(uint64_t a1, uint64_t a2)
{
  return sub_100006D5C(a1, a2, &qword_100068288);
}

unint64_t sub_10001A478()
{
  unint64_t result = qword_100068FE8;
  if (!qword_100068FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FE8);
  }
  return result;
}

unint64_t sub_10001A4D0()
{
  unint64_t result = qword_100068FF0;
  if (!qword_100068FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068FF0);
  }
  return result;
}

uint64_t sub_10001A524()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001A558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A570(a1, a2, a3, (void (*)(void))sub_1000195D8);
}

uint64_t sub_10001A570(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A5C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001CB18(&qword_100068278, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A6F8, a1);
}

uint64_t sub_10001A5FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A620(&qword_100068280, (uint64_t)qword_10006A710, a1);
}

uint64_t sub_10001A620@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100002388(&qword_1000687A0);
  uint64_t v6 = sub_100008DDC(v5, a2);
  return sub_10000274C(v6, a3, &qword_1000687A0);
}

uint64_t sub_10001A68C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_1000199EC(a1, v5, v4);
}

uint64_t sub_10001A738@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001DF90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001A760()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_10001A780()
{
  unint64_t result = qword_100069000;
  if (!qword_100069000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069000);
  }
  return result;
}

unint64_t sub_10001A7D8()
{
  unint64_t result = qword_100069008;
  if (!qword_100069008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069008);
  }
  return result;
}

uint64_t sub_10001A82C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001A84C, 0, 0);
}

uint64_t sub_10001A84C()
{
  id v1 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];
  id v2 = [v1 privateSearchEngineName];
  if (v2)
  {
    uint64_t v3 = *(uint64_t **)(v0 + 16);
    uint64_t v4 = sub_10004E570();
    uint64_t v6 = v5;

    uint64_t v7 = sub_10001DA20(v4, v6);
    *uint64_t v3 = v7;
  }
  else
  {
    sub_10004D6B0();
    sub_10001F1B4((unint64_t *)&qword_1000691F0, (void (*)(uint64_t))&type metadata accessor for _PrebuiltAppIntentError);
    swift_allocError();
    sub_10004DA30();
    swift_willThrow();
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10001A9A0(uint64_t a1, void *a2)
{
  *(void *)(v2 + 48) = *a2;
  return _swift_task_switch(sub_10001A9C4, 0, 0);
}

id sub_10001A9C4()
{
  id v1 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];

  id result = [v1 currentSearchEngineNames];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = sub_10004E5E0();

  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v22 = v1;
    swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t *)(v4 + 40);
    while (1)
    {
      uint64_t v7 = *v6;
      v0[2] = *(v6 - 1);
      v0[3] = v7;
      swift_bridgeObjectRetain();
      sub_10004D810();
      sub_1000026F8();
      uint64_t v8 = sub_10004E640();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!v8) {
        break;
      }
      v6 += 2;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        id v1 = v22;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease_n();
    id v10 = [self safari_browserSharedDefaults];
    NSString v11 = sub_10004E560();
    unsigned int v12 = [v10 BOOLForKey:v11];

    id v13 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];
    id v14 = [v13 defaultSearchEngineName];

    if (v14)
    {
      uint64_t v15 = sub_10004E570();
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    sub_10004D810();
    if (v17)
    {
      if (v15 == v0[2] && v17 == v0[3])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_20:
        sub_10004D810();
        NSString v21 = sub_10004E560();
        swift_bridgeObjectRelease();
        [v22 setDefaultSearchEngine:v21 forPrivateBrowsing:1];

        uint64_t v9 = (uint64_t (*)(void))v0[1];
        goto LABEL_21;
      }
      char v18 = sub_10004E750();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18 & 1) != 0 || ((v12 ^ 1)) {
        goto LABEL_20;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (!v12) {
        goto LABEL_20;
      }
    }
    NSString v19 = sub_10004E560();
    sub_10001ADD4((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_10004E4E0().super.isa;
    swift_bridgeObjectRelease();
    [v10 safari_setBool:0 forKey:v19 andNotifyWithUserInfo:isa];

    goto LABEL_20;
  }
LABEL_7:
  swift_bridgeObjectRelease();

  sub_10004D6B0();
  sub_10001F1B4((unint64_t *)&qword_1000691F0, (void (*)(uint64_t))&type metadata accessor for _PrebuiltAppIntentError);
  swift_allocError();
  sub_10004DA30();
  swift_willThrow();

  uint64_t v9 = (uint64_t (*)(void))v0[1];
LABEL_21:
  return (id)v9();
}

unint64_t sub_10001ADD4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002388(&qword_100069228);
  uint64_t v2 = sub_10004E730();
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
    sub_10000274C(v6, (uint64_t)v15, &qword_100069230);
    unint64_t result = sub_10001CFBC((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10001F574(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10001AF18(uint64_t a1)
{
  return sub_10001B160(a1, &qword_1000692D0, &qword_1000692D8, (uint64_t (*)(void))sub_10001CE60);
}

unint64_t sub_10001AF40(uint64_t a1)
{
  uint64_t v2 = sub_100002388(&qword_1000692C0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002388(&qword_1000692C8);
  uint64_t v6 = sub_10004E730();
  uint64_t v7 = (void *)v6;
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
    sub_10000274C(v12, (uint64_t)v5, &qword_1000692C0);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_10001D000(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10004DAC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

unint64_t sub_10001B138(uint64_t a1)
{
  return sub_10001B160(a1, &qword_1000692B0, &qword_1000692B8, (uint64_t (*)(void))sub_10001CEFC);
}

unint64_t sub_10001B160(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v29 = a4;
  uint64_t v7 = sub_100002388(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v12 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002388(a3);
  uint64_t v11 = sub_10004E730();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  unsigned __int8 v14 = &v10[*(int *)(v7 + 48)];
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v8 + 72);
  swift_retain();
  while (1)
  {
    sub_10000274C(v17, (uint64_t)v10, a2);
    char v19 = *v10;
    unint64_t result = v29(*v10);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v12[6] + result) = v19;
    uint64_t v23 = v12[7];
    uint64_t v24 = sub_10004DAC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v14, v24);
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    void v12[2] = v27;
    v17 += v18;
    if (!--v13)
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

uint64_t sub_10001B35C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069200 + dword_100069200);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_10001B404()
{
  unint64_t result = qword_100069018;
  if (!qword_100069018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069018);
  }
  return result;
}

uint64_t sub_10001B458(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001B918();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001B50C()
{
  unint64_t result = qword_100069028;
  if (!qword_100069028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069028);
  }
  return result;
}

unint64_t sub_10001B564()
{
  unint64_t result = qword_100069030;
  if (!qword_100069030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069030);
  }
  return result;
}

unint64_t sub_10001B5BC()
{
  unint64_t result = qword_100069038[0];
  if (!qword_100069038[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100069038);
  }
  return result;
}

uint64_t sub_10001B610(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001B918();
  void *v5 = v2;
  v5[1] = sub_1000091EC;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001B6C4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001B918();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001B778()
{
  unint64_t result = qword_100069050;
  if (!qword_100069050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069050);
  }
  return result;
}

unint64_t sub_10001B7D0()
{
  unint64_t result = qword_100069058;
  if (!qword_100069058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069058);
  }
  return result;
}

uint64_t sub_10001B824()
{
  return sub_10001C764(&qword_100069060, qword_100069068, (void (*)(void))sub_10001B7D0);
}

uint64_t sub_10001B860(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001B404();
  void *v5 = v2;
  v5[1] = sub_100009208;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001B918()
{
  unint64_t result = qword_100069080;
  if (!qword_100069080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069080);
  }
  return result;
}

uint64_t sub_10001B96C()
{
  uint64_t v0 = qword_100068EC0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10001B9A8()
{
  unint64_t result = qword_100069088;
  if (!qword_100069088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069088);
  }
  return result;
}

unint64_t sub_10001BA00()
{
  unint64_t result = qword_100069090;
  if (!qword_100069090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069090);
  }
  return result;
}

unint64_t sub_10001BA58()
{
  unint64_t result = qword_100069098;
  if (!qword_100069098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069098);
  }
  return result;
}

unint64_t sub_10001BAB0()
{
  unint64_t result = qword_1000690A0;
  if (!qword_1000690A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690A0);
  }
  return result;
}

unint64_t sub_10001BB08()
{
  unint64_t result = qword_1000690A8;
  if (!qword_1000690A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690A8);
  }
  return result;
}

unint64_t sub_10001BB60()
{
  unint64_t result = qword_1000690B0;
  if (!qword_1000690B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690B0);
  }
  return result;
}

uint64_t sub_10001BBB4@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001BBCC((void (*)(void))sub_10001A7D8, a1);
}

uint64_t sub_10001BBCC@<X0>(void (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  a1();
  uint64_t result = sub_10004D800();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10001BC10@<X0>(uint64_t a1@<X8>)
{
  return sub_10001CB18(&qword_100068270, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A6E0, a1);
}

uint64_t sub_10001BC48()
{
  return sub_10000255C(&qword_1000690B8, &qword_1000690C0);
}

uint64_t sub_10001BC84(uint64_t a1)
{
  unint64_t v2 = sub_10001B5BC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001BCD4()
{
  unint64_t result = qword_1000690C8;
  if (!qword_1000690C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690C8);
  }
  return result;
}

uint64_t sub_10001BD28(uint64_t a1)
{
  unint64_t v2 = sub_10001A7D8();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10001BD74(uint64_t a1)
{
  unint64_t v2 = sub_10001BB60();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001BDC4()
{
  unint64_t result = qword_1000690D0;
  if (!qword_1000690D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690D0);
  }
  return result;
}

unint64_t sub_10001BE1C()
{
  unint64_t result = qword_1000690D8;
  if (!qword_1000690D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690D8);
  }
  return result;
}

unint64_t sub_10001BE74()
{
  unint64_t result = qword_1000690E0[0];
  if (!qword_1000690E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000690E0);
  }
  return result;
}

uint64_t sub_10001BEC8()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A730);
  sub_100008DDC(v10, (uint64_t)qword_10006A730);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_10001C1B4()
{
  uint64_t v0 = sub_100002388(&qword_1000691C8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DC80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = sub_10004E540();
  __chkstk_darwin(v8 - 8);
  sub_10004E530();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  sub_10004E520(v12);
  sub_10004D810();
  sub_10004E510(v11);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004E520(v13);
  sub_10004DC70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v9 = sub_10004DA80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  return sub_10004DAB0();
}

uint64_t sub_10001C41C(uint64_t a1)
{
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000691F8 + dword_1000691F8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000091EC;
  return v5(a1);
}

uint64_t sub_10001C4C4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000691E8 + dword_1000691E8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_10001C56C()
{
  unint64_t result = qword_1000690F8;
  if (!qword_1000690F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000690F8);
  }
  return result;
}

uint64_t sub_10001C5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000691D0 + dword_1000691D0);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1000091E0;
  return v8(a2, a3);
}

unint64_t sub_10001C67C()
{
  unint64_t result = qword_100069108;
  if (!qword_100069108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069108);
  }
  return result;
}

unint64_t sub_10001C6D4()
{
  unint64_t result = qword_100069110;
  if (!qword_100069110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069110);
  }
  return result;
}

uint64_t sub_10001C728()
{
  return sub_10001C764(&qword_100069118, qword_100069120, (void (*)(void))sub_10001C6D4);
}

uint64_t sub_10001C764(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002450(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001C7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001C56C();
  void *v5 = v2;
  v5[1] = sub_100009208;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001C894()
{
  unint64_t result = qword_100069138;
  if (!qword_100069138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069138);
  }
  return result;
}

unint64_t sub_10001C8EC()
{
  unint64_t result = qword_100069140;
  if (!qword_100069140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069140);
  }
  return result;
}

unint64_t sub_10001C944()
{
  unint64_t result = qword_100069148;
  if (!qword_100069148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069148);
  }
  return result;
}

unint64_t sub_10001C99C()
{
  unint64_t result = qword_100069150;
  if (!qword_100069150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069150);
  }
  return result;
}

unint64_t sub_10001C9F4()
{
  unint64_t result = qword_100069158;
  if (!qword_100069158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069158);
  }
  return result;
}

unint64_t sub_10001CA50()
{
  unint64_t result = qword_100069160;
  if (!qword_100069160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069160);
  }
  return result;
}

uint64_t sub_10001CAA4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004D810();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001CAE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10001CB18(&qword_100068290, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A730, a1);
}

uint64_t sub_10001CB18@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008DDC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10001CBBC()
{
  return sub_10000255C(&qword_100069168, &qword_100069170);
}

uint64_t sub_10001CBF8(uint64_t a1)
{
  unint64_t v2 = sub_10001BE74();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001CC48()
{
  unint64_t result = qword_100069178;
  if (!qword_100069178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069178);
  }
  return result;
}

uint64_t sub_10001CC9C()
{
  return sub_10001C1B4();
}

uint64_t sub_10001CCA4(uint64_t a1)
{
  unint64_t v2 = sub_10001CA50();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SearchEngineOption.Query()
{
  return &type metadata for SearchEngineOption.Query;
}

ValueMetadata *type metadata accessor for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery()
{
  return &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery;
}

ValueMetadata *type metadata accessor for PrivateSearchEngineEntity()
{
  return &type metadata for PrivateSearchEngineEntity;
}

ValueMetadata *type metadata accessor for PrivateSearchEngineEntity.UpdateIntent_value()
{
  return &type metadata for PrivateSearchEngineEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for SearchEngineEntity.SearchEngineEntityQuery()
{
  return &type metadata for SearchEngineEntity.SearchEngineEntityQuery;
}

ValueMetadata *type metadata accessor for SearchEngineOption()
{
  return &type metadata for SearchEngineOption;
}

ValueMetadata *type metadata accessor for SearchEngineEntity()
{
  return &type metadata for SearchEngineEntity;
}

ValueMetadata *type metadata accessor for SearchEngineEntity.UpdateIntent_value()
{
  return &type metadata for SearchEngineEntity.UpdateIntent_value;
}

uint64_t sub_10001CD70()
{
  return sub_10000255C(&qword_100069180, &qword_100069188);
}

uint64_t sub_10001CDAC()
{
  return sub_10000255C(&qword_100069190, &qword_100069188);
}

uint64_t sub_10001CDE8()
{
  return sub_10000255C(&qword_100069198, &qword_1000691A0);
}

uint64_t sub_10001CE24()
{
  return sub_10000255C(&qword_1000691A8, &qword_1000691A0);
}

unint64_t sub_10001CE60(char a1)
{
  sub_10004E770();
  sub_10004E5A0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10004E790();

  return sub_10001D0F8(a1 & 1, v2);
}

unint64_t sub_10001CEFC(char a1)
{
  sub_10004E770();
  sub_10004E5A0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10004E790();

  return sub_10001D228(a1 & 1, v2);
}

unint64_t sub_10001CFBC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10004E670(*(void *)(v2 + 40));

  return sub_10001D388(a1, v4);
}

unint64_t sub_10001D000(unsigned __int8 a1)
{
  sub_10004E770();
  sub_10004E5A0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10004E790();

  return sub_10001D450(a1, v2);
}

unint64_t sub_10001D0F8(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x6D6F74746F62;
    }
    else {
      uint64_t v6 = 7368564;
    }
    if (a1) {
      unint64_t v7 = 0xE600000000000000;
    }
    else {
      unint64_t v7 = 0xE300000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x6D6F74746F62 : 7368564;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE600000000000000 : 0xE300000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_10004E750();
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

unint64_t sub_10001D228(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x54746361706D6F63;
    }
    else {
      uint64_t v6 = 0x6574617261706573;
    }
    if (a1) {
      unint64_t v7 = 0xED00007261426261;
    }
    else {
      unint64_t v7 = 0xEE00726142626154;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x54746361706D6F63 : 0x6574617261706573;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xED00007261426261 : 0xEE00726142626154;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_10004E750();
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

unint64_t sub_10001D388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001F584(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10004E680();
      sub_10001F5E0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10001D450(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE800000000000000;
      uint64_t v8 = 0x796C6C61756E616DLL;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x796144656E6FLL;
          break;
        case 2:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x6B656557656E6FLL;
          break;
        case 3:
          uint64_t v8 = 0x68746E6F4D656E6FLL;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE800000000000000;
      uint64_t v10 = 0x796C6C61756E616DLL;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE600000000000000;
          if (v8 == 0x796144656E6FLL) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x6B656557656E6FLL;
          goto LABEL_11;
        case 3:
          if (v8 == 0x68746E6F4D656E6FLL) {
            goto LABEL_14;
          }
          goto LABEL_15;
        default:
LABEL_11:
          if (v8 != v10) {
            goto LABEL_15;
          }
LABEL_14:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_15:
          char v11 = sub_10004E750();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_10001D648()
{
  uint64_t v26 = sub_10004DB10();
  uint64_t v0 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v25 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068718);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)v19 - v6;
  uint64_t v8 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v24 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v22 = sub_100002388(&qword_1000691C0);
  sub_10004DC50();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v23(v10, 1, 1, v11);
  uint64_t v27 = 0;
  uint64_t v13 = sub_10004D7D0();
  unsigned __int8 v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  uint64_t v15 = v5;
  v14(v5, 1, 1, v13);
  unsigned int v21 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v16 = *(void (**)(void))(v0 + 104);
  v19[1] = v0 + 104;
  uint64_t v20 = (void (*)(char *, void, uint64_t))v16;
  uint64_t v17 = v25;
  v16(v25);
  sub_100018E14();
  uint64_t v22 = sub_10004D880();
  sub_100002388(&qword_1000691B8);
  sub_10004DC50();
  v23(v10, 1, 1, v24);
  uint64_t v27 = 0;
  v14(v7, 1, 1, v13);
  v14(v15, 1, 1, v13);
  v20(v17, v21, v26);
  sub_10001BE74();
  sub_10004D880();
  return v22;
}

uint64_t sub_10001DA20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004DC60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004DD90();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004E550();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_10004DC80();
  __chkstk_darwin(v10 - 8);
  sub_100002388(&qword_1000691E0);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  sub_10004DC90();
  uint64_t v11 = sub_10004D830();
  v13[1] = a1;
  void v13[2] = a2;
  swift_retain();
  sub_10004D820();
  swift_release();
  return v11;
}

uint64_t sub_10001DC98()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10001DDD8, 0, 0);
}

uint64_t sub_10001DDD8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100068EE0);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100069278, &qword_100069280);
  sub_10001BE74();
  uint64_t v4 = sub_10004DC30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10001DF90()
{
  uint64_t v26 = sub_10004DB10();
  uint64_t v0 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v25 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068718);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v19 - v6;
  uint64_t v8 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v24 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v22 = sub_100002388(&qword_1000691B0);
  sub_10004DC50();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v23(v10, 1, 1, v11);
  uint64_t v27 = 0;
  uint64_t v13 = sub_10004D7D0();
  unsigned __int8 v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  uint64_t v15 = v5;
  v14(v5, 1, 1, v13);
  unsigned int v21 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v16 = *(void (**)(void))(v0 + 104);
  v19[1] = v0 + 104;
  uint64_t v20 = (void (*)(char *, void, uint64_t))v16;
  uint64_t v17 = v25;
  v16(v25);
  sub_10001B5BC();
  uint64_t v22 = sub_10004D880();
  sub_100002388(&qword_1000691B8);
  sub_10004DC50();
  v23(v10, 1, 1, v24);
  uint64_t v27 = 0;
  v14(v7, 1, 1, v13);
  v14(v15, 1, 1, v13);
  v20(v17, v21, v26);
  sub_10001BE74();
  sub_10004D880();
  return v22;
}

uint64_t sub_10001E368()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10001E4A8, 0, 0);
}

uint64_t sub_10001E4A8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100068FE0);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100069218, &qword_100069220);
  sub_10001BE74();
  uint64_t v4 = sub_10004DC30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10001E660(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    unint64_t v2 = 0;
    uint64_t v3 = result + 40;
    uint64_t v4 = -(uint64_t)v1;
    uint64_t v13 = result + 40;
    unint64_t v14 = *(void *)(result + 16);
    do
    {
      if (v2 <= v1) {
        unint64_t v5 = v1;
      }
      else {
        unint64_t v5 = v2;
      }
      uint64_t v6 = -(uint64_t)v5;
      for (i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
      {
        if (v6 + v2 == 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v9 = *(i - 1);
        uint64_t v8 = *i;
        sub_1000026F8();
        swift_bridgeObjectRetain();
        if (sub_10004E650()) {
          break;
        }
        unint64_t result = swift_bridgeObjectRelease();
        ++v2;
        if (v4 + v2 == 1) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
      }
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        unint64_t result = (uint64_t)sub_100037DD0(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      if (v11 >= v10 >> 1) {
        unint64_t result = (uint64_t)sub_100037DD0((char *)(v10 > 1), v11 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v11 + 1;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage[2 * v11];
      *((void *)v12 + 4) = v9;
      *((void *)v12 + 5) = v8;
      uint64_t v3 = v13;
      unint64_t v1 = v14;
    }
    while (v4 + v2);
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_10001E7F4(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_10004DC60();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  sub_10004DD90();
  v2[9] = swift_task_alloc();
  sub_10004E550();
  v2[10] = swift_task_alloc();
  sub_10004DC80();
  v2[11] = swift_task_alloc();
  return _swift_task_switch(sub_10001E938, 0, 0);
}

uint64_t sub_10001E938()
{
  id v1 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];
  id v2 = [v1 currentSearchEngineNames];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_10004E5E0();

    swift_bridgeObjectRetain();
    uint64_t v5 = sub_10001E660(v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = *(void *)(v5 + 16);
    if (v6)
    {
      unint64_t v16 = v1;
      uint64_t v7 = v0[7];
      sub_10004E6E0();
      sub_100002388(&qword_1000691E0);
      unsigned int v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v8 = (uint64_t *)(v5 + 40);
      do
      {
        uint64_t v9 = v0[8];
        uint64_t v10 = v0[6];
        uint64_t v12 = *(v8 - 1);
        uint64_t v11 = *v8;
        swift_bridgeObjectRetain();
        sub_10004E500();
        sub_10004DD80();
        (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v9, v17, v10);
        sub_10004DC90();
        sub_10004D830();
        v0[2] = v12;
        v0[3] = v11;
        swift_retain();
        sub_10004D820();
        swift_release();
        sub_10004E6C0();
        sub_10004E6F0();
        sub_10004E700();
        sub_10004E6D0();
        v8 += 2;
        --v6;
      }
      while (v6);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void *))v0[1];
    return v15(_swiftEmptyArrayStorage);
  }
  else
  {
    sub_10004D6D0();
    sub_10001F1B4(&qword_1000691D8, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_10004D6C0();
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_10001ECF0()
{
  uint64_t v1 = sub_10004DC60();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  sub_10004DD90();
  v0[7] = swift_task_alloc();
  sub_10004E550();
  v0[8] = swift_task_alloc();
  sub_10004DC80();
  v0[9] = swift_task_alloc();
  return _swift_task_switch(sub_10001EE30, 0, 0);
}

uint64_t sub_10001EE30()
{
  id v1 = [objc_allocWithZone((Class)SFSearchEngineControllerWrapper) init];
  id v2 = [v1 currentSearchEngineNames];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_10004E5E0();

    uint64_t v5 = *(void *)(v4 + 16);
    if (v5)
    {
      uint64_t v15 = v1;
      uint64_t v6 = v0[5];
      sub_10004E6E0();
      sub_100002388(&qword_1000691E0);
      unsigned int v16 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v7 = (uint64_t *)(v4 + 40);
      do
      {
        uint64_t v8 = v0[6];
        uint64_t v9 = v0[4];
        uint64_t v11 = *(v7 - 1);
        uint64_t v10 = *v7;
        swift_bridgeObjectRetain();
        sub_10004E500();
        sub_10004DD80();
        (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v8, v16, v9);
        sub_10004DC90();
        sub_10004D830();
        v0[2] = v11;
        v0[3] = v10;
        swift_retain();
        sub_10004D820();
        swift_release();
        sub_10004E6C0();
        sub_10004E6F0();
        sub_10004E700();
        sub_10004E6D0();
        v7 += 2;
        --v5;
      }
      while (v5);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v14 = (uint64_t (*)(void *))v0[1];
    return v14(&_swiftEmptyArrayStorage);
  }
  else
  {
    sub_10004D6B0();
    sub_10001F1B4((unint64_t *)&qword_1000691F0, (void (*)(uint64_t))&type metadata accessor for _PrebuiltAppIntentError);
    swift_allocError();
    sub_10004DA20();
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_10001F1B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001F1FC(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = sub_10004DC60();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_10004DD90();
  v1[8] = swift_task_alloc();
  sub_10004E550();
  v1[9] = swift_task_alloc();
  sub_10004DC80();
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_10001F340, 0, 0);
}

uint64_t sub_10001F340()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[6];
    sub_10004E6E0();
    sub_100002388(&qword_1000691E0);
    unsigned int v12 = enum case for LocalizedStringResource.BundleDescription.main(_:);
    uint64_t v4 = (uint64_t *)(v1 + 40);
    uint64_t v11 = (void (**)(uint64_t, void, uint64_t))(v3 + 104);
    do
    {
      uint64_t v5 = v0[7];
      uint64_t v6 = v0[5];
      uint64_t v8 = *(v4 - 1);
      uint64_t v7 = *v4;
      swift_bridgeObjectRetain();
      sub_10004E500();
      sub_10004DD80();
      (*v11)(v5, v12, v6);
      sub_10004DC90();
      sub_10004D830();
      v0[2] = v8;
      v0[3] = v7;
      swift_retain();
      sub_10004D820();
      swift_release();
      sub_10004E6C0();
      sub_10004E6F0();
      sub_10004E700();
      sub_10004E6D0();
      v4 += 2;
      --v2;
    }
    while (v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void *))v0[1];
  return v9(&_swiftEmptyArrayStorage);
}

_OWORD *sub_10001F574(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001F584(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001F5E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F634@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10001F650()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  uint64_t v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10004DC60();
  uint64_t v2 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004DD90();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004E550();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004DC80();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_10004DBF0();
  sub_100008E14(v9, qword_10006A748);
  sub_100008DDC(v9, (uint64_t)qword_10006A748);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  sub_10004DC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, 1, 1, v7);
  return sub_10004DBE0();
}

uint64_t sub_10001F960()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A760);
  sub_100008DDC(v0, (uint64_t)qword_10006A760);
  return sub_10004DC50();
}

uint64_t sub_10001F9C4()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A778);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A778);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10001FA7C()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A790 = result;
  return result;
}

uint64_t sub_10001FAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_1000694C0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_1000694C8);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10001FC68, 0, 0);
}

uint64_t sub_10001FC68()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100022050();
  *uint64_t v1 = v0;
  v1[1] = sub_10001FD3C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100020334, 0, &type metadata for TabBarLayoutEntity, v2);
}

uint64_t sub_10001FD3C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001FE38, 0, 0);
}

uint64_t sub_10001FE38()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000682B0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A790;
  *(void *)(v0 + 168) = qword_10006A790;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_1000694A0, &qword_1000694A8);
  *uint64_t v3 = v0;
  v3[1] = sub_10001FF90;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for CapsuleLayoutStyle, v4);
}

uint64_t sub_10001FF90()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_1000200E4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000200E4()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100021CF4();
  sub_100022100();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100020338()
{
  uint64_t v0 = sub_100002388(&qword_1000694D0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000682B0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100022100();
  sub_10000255C(&qword_1000694D8, &qword_1000694D0);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000204A0()
{
  if (qword_1000682B0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_1000204FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_1000682A0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A760, a1);
}

uint64_t sub_100020534@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000682A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A778);

  return sub_100009178(v3, a1);
}

uint64_t sub_1000205B0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_10001FAA4(a1, v5, v4);
}

uint64_t sub_10002065C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100022E98();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100020684()
{
  return 0xD000000000000023;
}

uint64_t sub_1000206A0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000206C0, 0, 0);
}

uint64_t sub_1000206C0()
{
  v0[3] = self;
  v0[4] = sub_10004E620();
  v0[5] = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100020768, v2, v1);
}

uint64_t sub_100020768()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = [v1 currentDevice];
  return _swift_task_switch(sub_1000207F0, 0, 0);
}

uint64_t sub_1000207F0()
{
  *(void *)(v0 + 56) = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_10002087C, v2, v1);
}

uint64_t sub_10002087C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  *(void *)(v0 + 64) = [v1 userInterfaceIdiom];

  return _swift_task_switch(sub_1000208FC, 0, 0);
}

uint64_t sub_1000208FC()
{
  if (*(void *)(v0 + 64) == 1) {
    goto LABEL_4;
  }
  id v1 = [self safari_browserDefaults];
  id v2 = [v1 integerForKey:SFPreferredCapsuleLayoutStyleKey];

  if (v2 == (id)1)
  {
    char v3 = 1;
    goto LABEL_6;
  }
  if (v2 == (id)2)
  {
LABEL_4:
    char v3 = 0;
LABEL_6:
    **(unsigned char **)(v0 + 16) = v3;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_7;
  }
  sub_10004D6B0();
  sub_10002398C();
  swift_allocError();
  sub_10004DA30();
  swift_willThrow();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
LABEL_7:
  return v4();
}

uint64_t sub_100020A18(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 64) = v3;
  return _swift_task_switch(sub_1000232A4, 0, 0);
}

uint64_t sub_100020AC4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069488 + dword_100069488);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

uint64_t sub_100020B68(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000221D0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100020C18(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000221D0();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100020CCC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000221D0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

uint64_t sub_100020D7C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100021F48();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100020E30()
{
  uint64_t v0 = qword_1000692E0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_100020E68@<X0>(uint64_t *a1@<X8>)
{
  sub_100021EF0();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100020EA8@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068298, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A748, a1);
}

uint64_t sub_100020EE0(uint64_t a1)
{
  unint64_t v2 = sub_100022050();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100020F2C(uint64_t a1)
{
  unint64_t v2 = sub_100021EF0();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100020F78(uint64_t a1)
{
  unint64_t v2 = sub_1000223E0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t CapsuleLayoutStyle.rawValue.getter(char a1)
{
  if (a1) {
    return 0x6D6F74746F62;
  }
  else {
    return 7368564;
  }
}

uint64_t sub_100020FF0()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, static CapsuleLayoutStyle.typeDisplayRepresentation);
  sub_100008DDC(v10, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t CapsuleLayoutStyle.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_1000682B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10004DBF0();

  return sub_100008DDC(v0, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
}

uint64_t static CapsuleLayoutStyle.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000682B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004DBF0();
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CapsuleLayoutStyle.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (qword_1000682B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004DBF0();
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CapsuleLayoutStyle.typeDisplayRepresentation.modify())()
{
  if (qword_1000682B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10004DBF0();
  sub_100008DDC(v0, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_100021590()
{
  uint64_t v0 = sub_100002388(&qword_1000691C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v38 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v2 - 8);
  uint64_t v37 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10004DC60();
  uint64_t v4 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DD90();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004E550();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10004DC80();
  uint64_t v39 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  sub_100002388(&qword_1000694E0);
  uint64_t v11 = (int *)(sub_100002388(&qword_1000692D0) - 8);
  uint64_t v12 = *(void *)v11;
  uint64_t v34 = *(void *)(*(void *)v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  uint64_t v36 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_1000546C0;
  unint64_t v15 = v14 + v13;
  unint64_t v29 = v14 + v13 + v11[14];
  *(unsigned char *)(v14 + v13) = 0;
  uint64_t v25 = v10;
  sub_10004E500();
  sub_10004DD80();
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  unsigned int v16 = *(void (**)(void))(v4 + 104);
  uint64_t v31 = v4 + 104;
  uint64_t v33 = (void (*)(char *, void, uint64_t))v16;
  uint64_t v26 = v6;
  v16(v6);
  unint64_t v28 = 0x800000010004F0E0;
  sub_10004DCA0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
  v39 += 56;
  uint64_t v27 = v17;
  uint64_t v18 = v37;
  uint64_t v19 = v35;
  v17(v37, 1, 1, v35);
  uint64_t v20 = sub_10004DA80();
  unsigned int v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  uint64_t v22 = v38;
  v21(v38, 1, 1, v20);
  sub_10004DAB0();
  uint64_t v23 = (unsigned char *)(v15 + v34);
  v34 += v15 + v11[14];
  unsigned char *v23 = 1;
  sub_10004E500();
  sub_10004DD80();
  v33(v26, v30, v32);
  sub_10004DCA0();
  v27(v18, 1, 1, v19);
  v21(v22, 1, 1, v20);
  sub_10004DAB0();
  unint64_t result = sub_10001AF18(v36);
  static CapsuleLayoutStyle.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CapsuleLayoutStyle.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_1000682C0 != -1) {
    swift_once();
  }
  return &static CapsuleLayoutStyle.caseDisplayRepresentations;
}

uint64_t static CapsuleLayoutStyle.caseDisplayRepresentations.getter()
{
  if (qword_1000682C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static CapsuleLayoutStyle.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_1000682C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static CapsuleLayoutStyle.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CapsuleLayoutStyle.caseDisplayRepresentations.modify())()
{
  if (qword_1000682C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

SafariWidgetExtension::CapsuleLayoutStyle_optional __swiftcall CapsuleLayoutStyle.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_100065DB8;
  v6._object = object;
  Swift::Int v3 = sub_10004E740(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = SafariWidgetExtension_CapsuleLayoutStyle_bottom;
  }
  else {
    v4.value = SafariWidgetExtension_CapsuleLayoutStyle_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

_UNKNOWN **static CapsuleLayoutStyle.allCases.getter()
{
  return &off_100065E08;
}

unint64_t sub_100021CF4()
{
  unint64_t result = qword_1000692F0;
  if (!qword_1000692F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000692F0);
  }
  return result;
}

uint64_t sub_100021D48()
{
  return sub_10000255C(&qword_1000692F8, &qword_100069300);
}

unint64_t sub_100021D88()
{
  unint64_t result = qword_100069308;
  if (!qword_100069308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069308);
  }
  return result;
}

unint64_t sub_100021DE0()
{
  unint64_t result = qword_100069310;
  if (!qword_100069310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069310);
  }
  return result;
}

uint64_t sub_100021E34()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100021E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000229B0(a1, a2, a3, (void (*)(void))sub_100021CF4);
}

unint64_t sub_100021E98()
{
  unint64_t result = qword_100069320;
  if (!qword_100069320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069320);
  }
  return result;
}

unint64_t sub_100021EF0()
{
  unint64_t result = qword_100069328;
  if (!qword_100069328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069328);
  }
  return result;
}

unint64_t sub_100021F48()
{
  unint64_t result = qword_100069338;
  if (!qword_100069338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069338);
  }
  return result;
}

unint64_t sub_100021FA0()
{
  unint64_t result = qword_100069348;
  if (!qword_100069348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069348);
  }
  return result;
}

unint64_t sub_100021FF8()
{
  unint64_t result = qword_100069350;
  if (!qword_100069350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069350);
  }
  return result;
}

unint64_t sub_100022050()
{
  unint64_t result = qword_100069358[0];
  if (!qword_100069358[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100069358);
  }
  return result;
}

unint64_t sub_1000220A8()
{
  unint64_t result = qword_100069370;
  if (!qword_100069370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069370);
  }
  return result;
}

unint64_t sub_100022100()
{
  unint64_t result = qword_100069378;
  if (!qword_100069378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069378);
  }
  return result;
}

unint64_t sub_100022158()
{
  unint64_t result = qword_100069380;
  if (!qword_100069380)
  {
    sub_100002450(qword_100069388);
    sub_100022100();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069380);
  }
  return result;
}

unint64_t sub_1000221D0()
{
  unint64_t result = qword_1000693A0;
  if (!qword_1000693A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693A0);
  }
  return result;
}

unint64_t sub_100022228()
{
  unint64_t result = qword_1000693A8;
  if (!qword_1000693A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693A8);
  }
  return result;
}

unint64_t sub_100022280()
{
  unint64_t result = qword_1000693B0;
  if (!qword_1000693B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693B0);
  }
  return result;
}

unint64_t sub_1000222D8()
{
  unint64_t result = qword_1000693B8;
  if (!qword_1000693B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693B8);
  }
  return result;
}

unint64_t sub_100022330()
{
  unint64_t result = qword_1000693C0;
  if (!qword_1000693C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693C0);
  }
  return result;
}

unint64_t sub_100022388()
{
  unint64_t result = qword_1000693C8;
  if (!qword_1000693C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693C8);
  }
  return result;
}

unint64_t sub_1000223E0()
{
  unint64_t result = qword_1000693D0;
  if (!qword_1000693D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693D0);
  }
  return result;
}

uint64_t sub_100022434()
{
  return sub_10000255C(&qword_1000693D8, &qword_1000693E0);
}

unint64_t sub_100022474()
{
  unint64_t result = qword_1000693E8;
  if (!qword_1000693E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693E8);
  }
  return result;
}

uint64_t sub_1000224C8(char *a1, char *a2)
{
  return sub_10004662C(*a1, *a2);
}

unint64_t sub_1000224D8()
{
  unint64_t result = qword_1000693F0;
  if (!qword_1000693F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693F0);
  }
  return result;
}

Swift::Int sub_10002252C()
{
  return sub_10004E790();
}

uint64_t sub_1000225A4()
{
  sub_10004E5A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100022608()
{
  return sub_10004E790();
}

uint64_t sub_10002267C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  Swift::Int v3 = (void *)a1[1];
  v4._rawValue = &off_100065DB8;
  v8._object = v3;
  Swift::Int v5 = sub_10004E740(v4, v8);
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

void sub_1000226DC(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7368564;
  if (*v1) {
    uint64_t v2 = 0x6D6F74746F62;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_100022714()
{
  unint64_t result = qword_1000693F8;
  if (!qword_1000693F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000693F8);
  }
  return result;
}

unint64_t sub_10002276C()
{
  unint64_t result = qword_100069400;
  if (!qword_100069400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069400);
  }
  return result;
}

unint64_t sub_1000227C4()
{
  unint64_t result = qword_100069408;
  if (!qword_100069408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069408);
  }
  return result;
}

void *sub_100022818()
{
  return &protocol witness table for String;
}

unint64_t sub_100022828()
{
  unint64_t result = qword_100069410;
  if (!qword_100069410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069410);
  }
  return result;
}

unint64_t sub_100022880()
{
  unint64_t result = qword_100069418;
  if (!qword_100069418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069418);
  }
  return result;
}

unint64_t sub_1000228D8()
{
  unint64_t result = qword_100069420;
  if (!qword_100069420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069420);
  }
  return result;
}

unint64_t sub_100022930()
{
  unint64_t result = qword_100069428;
  if (!qword_100069428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069428);
  }
  return result;
}

uint64_t sub_100022984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000229B0(a1, a2, a3, (void (*)(void))sub_1000229F8);
}

uint64_t sub_1000229B0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000229F8()
{
  unint64_t result = qword_100069430;
  if (!qword_100069430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069430);
  }
  return result;
}

uint64_t sub_100022A4C(uint64_t a1)
{
  unint64_t v2 = sub_1000229F8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100022A9C()
{
  unint64_t result = qword_100069438;
  if (!qword_100069438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069438);
  }
  return result;
}

unint64_t sub_100022AF4()
{
  unint64_t result = qword_100069440;
  if (!qword_100069440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069440);
  }
  return result;
}

unint64_t sub_100022B4C()
{
  unint64_t result = qword_100069448;
  if (!qword_100069448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069448);
  }
  return result;
}

uint64_t sub_100022BA0(uint64_t a1)
{
  unint64_t v2 = sub_100022930();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100022BEC()
{
  return sub_10000255C(&qword_100069450, &qword_100069458);
}

void sub_100022C28(void *a1@<X8>)
{
  *a1 = &off_100065E30;
}

unsigned char *initializeBufferWithCopyOfBuffer for CapsuleLayoutStyle(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CapsuleLayoutStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CapsuleLayoutStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100022DA4);
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

uint64_t sub_100022DCC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100022DD4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CapsuleLayoutStyle()
{
  return &type metadata for CapsuleLayoutStyle;
}

ValueMetadata *type metadata accessor for TabBarLayoutEntity.TabBarLayoutEntityQuery()
{
  return &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery;
}

ValueMetadata *type metadata accessor for TabBarLayoutEntity()
{
  return &type metadata for TabBarLayoutEntity;
}

ValueMetadata *type metadata accessor for TabBarLayoutEntity.UpdateIntent_value()
{
  return &type metadata for TabBarLayoutEntity.UpdateIntent_value;
}

uint64_t sub_100022E20()
{
  return sub_10000255C(&qword_100069460, &qword_100069468);
}

uint64_t sub_100022E5C()
{
  return sub_10000255C(&qword_100069470, &qword_100069468);
}

uint64_t sub_100022E98()
{
  uint64_t v28 = sub_10004DB10();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068718);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100002388(&qword_100069478);
  sub_10004DC50();
  unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_10004D7D0();
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  unsigned int v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  unsigned int v21 = (void (*)(char *, void, uint64_t))v17;
  uint64_t v18 = v27;
  v17(v27);
  sub_100022050();
  uint64_t v23 = sub_10004D880();
  sub_100002388(&qword_100069480);
  sub_10004DC50();
  v25(v10, 1, 1, v26);
  char v29 = 2;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_1000229F8();
  sub_10004D870();
  return v23;
}

uint64_t sub_100023284(char a1)
{
  *(unsigned char *)(v1 + 64) = a1;
  return _swift_task_switch(sub_1000232A4, 0, 0);
}

uint64_t sub_1000232A4()
{
  v0[2] = self;
  v0[3] = sub_10004E620();
  v0[4] = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_10002334C, v2, v1);
}

uint64_t sub_10002334C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = [v1 currentDevice];
  return _swift_task_switch(sub_1000233D4, 0, 0);
}

uint64_t sub_1000233D4()
{
  *(void *)(v0 + 48) = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100023460, v2, v1);
}

uint64_t sub_100023460()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  *(void *)(v0 + 56) = [v1 userInterfaceIdiom];

  return _swift_task_switch(sub_1000234E0, 0, 0);
}

uint64_t sub_1000234E0()
{
  if (*(void *)(v0 + 56) == 1)
  {
    sub_10004D6B0();
    sub_10002398C();
    swift_allocError();
    sub_10004DA40();
    swift_willThrow();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    char v2 = *(unsigned char *)(v0 + 64);
    uint64_t v3 = self;
    id v4 = [v3 safari_browserDefaults];
    if (v2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    id v6 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v5];
    uint64_t v7 = SFPreferredCapsuleLayoutStyleKey;
    [v4 setObject:v6 forKey:SFPreferredCapsuleLayoutStyleKey];

    id v8 = [self defaultCenter];
    id v9 = [v3 safari_notificationNameForUserDefaultsKey:v7];
    [v8 postNotificationName:v9 object:0 userInfo:0 deliverImmediately:1];

    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v1();
}

uint64_t sub_10002368C()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000237CC, 0, 0);
}

uint64_t sub_1000237CC()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100069300);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_1000694A0, &qword_1000694A8);
  sub_1000229F8();
  uint64_t v4 = sub_10004DC20();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

unint64_t sub_10002398C()
{
  unint64_t result = qword_1000691F0;
  if (!qword_1000691F0)
  {
    sub_10004D6B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000691F0);
  }
  return result;
}

uint64_t sub_1000239E4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for BlockPopUpsControlToggle()
{
  return &type metadata for BlockPopUpsControlToggle;
}

uint64_t sub_100023A04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100023A20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  id v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  char v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_100015F28();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  id v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  id v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  id v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_100023FD8()
{
  uint64_t v0 = sub_10004DFF0();

  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_100024044@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unint64_t sub_100024184()
{
  unint64_t result = qword_1000694F8;
  if (!qword_1000694F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000694F8);
  }
  return result;
}

uint64_t sub_1000241D8()
{
  return sub_10000255C(&qword_100069500, &qword_100069508);
}

uint64_t sub_100024214()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004DC60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A7B8);
  sub_100008DDC(v10, (uint64_t)qword_10006A7B8);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DC90();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_100024528()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A7D0);
  sub_100008DDC(v0, (uint64_t)qword_10006A7D0);
  return sub_10004DC50();
}

uint64_t sub_10002458C()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A7E8);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A7E8);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100024644()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A800 = result;
  return result;
}

uint64_t sub_10002466C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_100069648);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100069650);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100024830, 0, 0);
}

uint64_t sub_100024830()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000257D8();
  *uint64_t v1 = v0;
  v1[1] = sub_100024904;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100024EFC, 0, &type metadata for SearchEngineSuggestionsEntity, v2);
}

uint64_t sub_100024904()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100024A00, 0, 0);
}

uint64_t sub_100024A00()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000682E0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A800;
  *(void *)(v0 + 168) = qword_10006A800;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_100069628, &qword_100069630);
  *uint64_t v3 = v0;
  v3[1] = sub_100024B58;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100024B58()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_100024CAC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100024CAC()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100024184();
  sub_1000259EC();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100024F00()
{
  uint64_t v0 = sub_100002388(&qword_100069658);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000682E0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_1000259EC();
  sub_10000255C(&qword_100069660, &qword_100069658);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100025068()
{
  if (qword_1000682E0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000250C8()
{
  unint64_t result = qword_100069510;
  if (!qword_100069510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069510);
  }
  return result;
}

unint64_t sub_100025120()
{
  unint64_t result = qword_100069518;
  if (!qword_100069518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069518);
  }
  return result;
}

uint64_t sub_100025174()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000251A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000251F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_1000682D0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A7D0, a1);
}

uint64_t sub_100025230@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000682D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A7E8);

  return sub_100009178(v3, a1);
}

uint64_t sub_1000252AC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_10002466C(a1, v5, v4);
}

uint64_t sub_100025358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000260A4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100025380()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_1000253A0()
{
  unint64_t result = qword_100069528;
  if (!qword_100069528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069528);
  }
  return result;
}

uint64_t sub_1000253F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100025418, 0, 0);
}

uint64_t sub_100025418()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  id v2 = [self safari_browserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:SuppressSearchSuggestionsDefaultsKey];

  *uint64_t v1 = v3 ^ 1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000254CC(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 16) = v3;
  return _swift_task_switch(sub_100026504, 0, 0);
}

uint64_t sub_100025578(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069610 + dword_100069610);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_100025620()
{
  unint64_t result = qword_100069538;
  if (!qword_100069538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069538);
  }
  return result;
}

uint64_t sub_100025674(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100025B70();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100025728()
{
  unint64_t result = qword_100069548;
  if (!qword_100069548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069548);
  }
  return result;
}

unint64_t sub_100025780()
{
  unint64_t result = qword_100069550;
  if (!qword_100069550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069550);
  }
  return result;
}

unint64_t sub_1000257D8()
{
  unint64_t result = qword_100069558[0];
  if (!qword_100069558[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100069558);
  }
  return result;
}

uint64_t sub_10002582C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100025B70();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000258E0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100025B70();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100025994()
{
  unint64_t result = qword_100069570;
  if (!qword_100069570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069570);
  }
  return result;
}

unint64_t sub_1000259EC()
{
  unint64_t result = qword_100069578;
  if (!qword_100069578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069578);
  }
  return result;
}

unint64_t sub_100025A44()
{
  unint64_t result = qword_100069580;
  if (!qword_100069580)
  {
    sub_100002450(qword_100069588);
    sub_1000259EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069580);
  }
  return result;
}

uint64_t sub_100025AB8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100025620();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100025B70()
{
  unint64_t result = qword_1000695A0;
  if (!qword_1000695A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695A0);
  }
  return result;
}

uint64_t sub_100025BC4()
{
  uint64_t v0 = qword_1000694E8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100025C00()
{
  unint64_t result = qword_1000695A8;
  if (!qword_1000695A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695A8);
  }
  return result;
}

unint64_t sub_100025C58()
{
  unint64_t result = qword_1000695B0;
  if (!qword_1000695B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695B0);
  }
  return result;
}

unint64_t sub_100025CB0()
{
  unint64_t result = qword_1000695B8;
  if (!qword_1000695B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695B8);
  }
  return result;
}

unint64_t sub_100025D08()
{
  unint64_t result = qword_1000695C0;
  if (!qword_1000695C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695C0);
  }
  return result;
}

unint64_t sub_100025D60()
{
  unint64_t result = qword_1000695C8;
  if (!qword_1000695C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695C8);
  }
  return result;
}

unint64_t sub_100025DB8()
{
  unint64_t result = qword_1000695D0;
  if (!qword_1000695D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695D0);
  }
  return result;
}

uint64_t sub_100025E0C@<X0>(uint64_t *a1@<X8>)
{
  sub_1000030DC();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100025E4C@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_1000682C8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A7B8, a1);
}

uint64_t sub_100025E84()
{
  return sub_10000255C(&qword_1000695D8, &qword_1000695E0);
}

uint64_t sub_100025EC0(uint64_t a1)
{
  unint64_t v2 = sub_1000257D8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100025F10()
{
  unint64_t result = qword_1000695E8;
  if (!qword_1000695E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000695E8);
  }
  return result;
}

uint64_t sub_100025F64(uint64_t a1)
{
  unint64_t v2 = sub_1000030DC();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100025FB0(uint64_t a1)
{
  unint64_t v2 = sub_100025DB8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery()
{
  return &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery;
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsEntity()
{
  return &type metadata for SearchEngineSuggestionsEntity;
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsEntity.UpdateIntent_value()
{
  return &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value;
}

uint64_t sub_10002602C()
{
  return sub_10000255C(&qword_1000695F0, &qword_1000695F8);
}

uint64_t sub_100026068()
{
  return sub_10000255C(&qword_100069600, &qword_1000695F8);
}

uint64_t sub_1000260A4()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100069608);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000257D8();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

uint64_t sub_1000264E4(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100026504, 0, 0);
}

uint64_t sub_100026504()
{
  char v1 = *(unsigned char *)(v0 + 16);
  uint64_t v2 = self;
  id v3 = [v2 safari_browserDefaults];
  uint64_t v4 = SuppressSearchSuggestionsDefaultsKey;
  [v3 setBool:(v1 & 1) == 0 forKey:SuppressSearchSuggestionsDefaultsKey];

  id v5 = [self defaultCenter];
  id v6 = [v2 safari_notificationNameForUserDefaultsKey:v4];
  [v5 postNotificationName:v6 object:0 userInfo:0 deliverImmediately:1];

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100026628()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100026768, 0, 0);
}

uint64_t sub_100026768()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100069508);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100069628, &qword_100069630);
  uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100026914@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100026924()
{
  unint64_t result = qword_100069678;
  if (!qword_100069678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069678);
  }
  return result;
}

uint64_t sub_100026978()
{
  return sub_10000255C(&qword_100069680, &qword_100069688);
}

uint64_t sub_1000269B4()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  uint64_t v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10004DC60();
  uint64_t v2 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004DD90();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004E550();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004DC80();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_10004DBF0();
  sub_100008E14(v9, qword_10006A808);
  sub_100008DDC(v9, (uint64_t)qword_10006A808);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  sub_10004DC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, 1, 1, v7);
  return sub_10004DBE0();
}

uint64_t sub_100026CC4()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A820);
  sub_100008DDC(v0, (uint64_t)qword_10006A820);
  return sub_10004DC50();
}

uint64_t sub_100026D28()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A838);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A838);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100026DE0()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A850 = result;
  return result;
}

uint64_t sub_100026E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_1000697C8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_1000697D0);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100026FCC, 0, 0);
}

uint64_t sub_100026FCC()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100027F70();
  *uint64_t v1 = v0;
  v1[1] = sub_1000270A0;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100027698, 0, &type metadata for SafariSuggestionsEntity, v2);
}

uint64_t sub_1000270A0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002719C, 0, 0);
}

uint64_t sub_10002719C()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100068300 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A850;
  *(void *)(v0 + 168) = qword_10006A850;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_1000697A8, &qword_1000697B0);
  *uint64_t v3 = v0;
  v3[1] = sub_1000272F4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000272F4()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_100027448;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100027448()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100026924();
  sub_100028184();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10002769C()
{
  uint64_t v0 = sub_100002388(&qword_1000697D8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068300 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100028184();
  sub_10000255C(&qword_1000697E0, &qword_1000697D8);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100027804()
{
  if (qword_100068300 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100027864()
{
  unint64_t result = qword_100069690;
  if (!qword_100069690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069690);
  }
  return result;
}

unint64_t sub_1000278BC()
{
  unint64_t result = qword_100069698;
  if (!qword_100069698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069698);
  }
  return result;
}

uint64_t sub_100027910()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100027944()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100027994@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_1000682F0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A820, a1);
}

uint64_t sub_1000279CC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000682F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A838);

  return sub_100009178(v3, a1);
}

uint64_t sub_100027A48(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_100026E08(a1, v5, v4);
}

uint64_t sub_100027AF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002883C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100027B1C()
{
  return 0xD000000000000028;
}

unint64_t sub_100027B3C()
{
  unint64_t result = qword_1000696A8;
  if (!qword_1000696A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000696A8);
  }
  return result;
}

uint64_t sub_100027B94(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100027BB4, 0, 0);
}

uint64_t sub_100027BB4()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self safari_browserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:WBSUniversalSearchEnabledPreferenceKey];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100027C64(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 16) = v3;
  return _swift_task_switch(sub_100028C9C, 0, 0);
}

uint64_t sub_100027D10(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069790 + dword_100069790);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_100027DB8()
{
  unint64_t result = qword_1000696B8;
  if (!qword_1000696B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000696B8);
  }
  return result;
}

uint64_t sub_100027E0C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100028308();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100027EC0()
{
  unint64_t result = qword_1000696C8;
  if (!qword_1000696C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000696C8);
  }
  return result;
}

unint64_t sub_100027F18()
{
  unint64_t result = qword_1000696D0;
  if (!qword_1000696D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000696D0);
  }
  return result;
}

unint64_t sub_100027F70()
{
  unint64_t result = qword_1000696D8[0];
  if (!qword_1000696D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000696D8);
  }
  return result;
}

uint64_t sub_100027FC4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100028308();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100028078(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100028308();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10002812C()
{
  unint64_t result = qword_1000696F0;
  if (!qword_1000696F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000696F0);
  }
  return result;
}

unint64_t sub_100028184()
{
  unint64_t result = qword_1000696F8;
  if (!qword_1000696F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000696F8);
  }
  return result;
}

unint64_t sub_1000281DC()
{
  unint64_t result = qword_100069700;
  if (!qword_100069700)
  {
    sub_100002450(qword_100069708);
    sub_100028184();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069700);
  }
  return result;
}

uint64_t sub_100028250(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100027DB8();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100028308()
{
  unint64_t result = qword_100069720;
  if (!qword_100069720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069720);
  }
  return result;
}

uint64_t sub_10002835C()
{
  uint64_t v0 = qword_100069668;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100028398()
{
  unint64_t result = qword_100069728;
  if (!qword_100069728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069728);
  }
  return result;
}

unint64_t sub_1000283F0()
{
  unint64_t result = qword_100069730;
  if (!qword_100069730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069730);
  }
  return result;
}

unint64_t sub_100028448()
{
  unint64_t result = qword_100069738;
  if (!qword_100069738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069738);
  }
  return result;
}

unint64_t sub_1000284A0()
{
  unint64_t result = qword_100069740;
  if (!qword_100069740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069740);
  }
  return result;
}

unint64_t sub_1000284F8()
{
  unint64_t result = qword_100069748;
  if (!qword_100069748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069748);
  }
  return result;
}

unint64_t sub_100028550()
{
  unint64_t result = qword_100069750;
  if (!qword_100069750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069750);
  }
  return result;
}

uint64_t sub_1000285A4@<X0>(uint64_t *a1@<X8>)
{
  sub_100003C78();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000285E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_1000682E8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A808, a1);
}

uint64_t sub_10002861C()
{
  return sub_10000255C(&qword_100069758, &qword_100069760);
}

uint64_t sub_100028658(uint64_t a1)
{
  unint64_t v2 = sub_100027F70();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000286A8()
{
  unint64_t result = qword_100069768;
  if (!qword_100069768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069768);
  }
  return result;
}

uint64_t sub_1000286FC(uint64_t a1)
{
  unint64_t v2 = sub_100003C78();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100028748(uint64_t a1)
{
  unint64_t v2 = sub_100028550();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SafariSuggestionsEntity.SafariSuggestionsEntityQuery()
{
  return &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery;
}

ValueMetadata *type metadata accessor for SafariSuggestionsEntity()
{
  return &type metadata for SafariSuggestionsEntity;
}

ValueMetadata *type metadata accessor for SafariSuggestionsEntity.UpdateIntent_value()
{
  return &type metadata for SafariSuggestionsEntity.UpdateIntent_value;
}

uint64_t sub_1000287C4()
{
  return sub_10000255C(&qword_100069770, &qword_100069778);
}

uint64_t sub_100028800()
{
  return sub_10000255C(&qword_100069780, &qword_100069778);
}

uint64_t sub_10002883C()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100069788);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100027F70();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

uint64_t sub_100028C7C(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100028C9C, 0, 0);
}

uint64_t sub_100028C9C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v2 = self;
  id v3 = [v2 safari_browserDefaults];
  uint64_t v4 = WBSUniversalSearchEnabledPreferenceKey;
  [v3 setBool:v1 forKey:WBSUniversalSearchEnabledPreferenceKey];

  id v5 = [self defaultCenter];
  id v6 = [v2 safari_notificationNameForUserDefaultsKey:v4];
  [v5 postNotificationName:v6 object:0 userInfo:0 deliverImmediately:1];

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100028DBC()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100028EFC, 0, 0);
}

uint64_t sub_100028EFC()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100069688);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_1000697A8, &qword_1000697B0);
  uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_1000290B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for AutoFillContactInfoControlToggle()
{
  return &type metadata for AutoFillContactInfoControlToggle;
}

uint64_t sub_1000290CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000290E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_10000710C();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  id v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  id v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  id v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_1000296A4()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_1000297D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

ValueMetadata *type metadata accessor for CloseTabsControlPicker()
{
  return &type metadata for CloseTabsControlPicker;
}

uint64_t sub_100029920()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002993C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v58 = a2;
  uint64_t v2 = sub_10004E420();
  __chkstk_darwin(v2 - 8);
  uint64_t v47 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100002388(&qword_1000684A8);
  uint64_t v51 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v48 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100002388(&qword_1000684A0);
  uint64_t v53 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v49 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100002388(&qword_100068498);
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v50 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DBF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v42 - v16;
  if (qword_1000682B8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_100008DDC(v7, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v18, v7);
  sub_10004DBD0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v19(v15, v17, v11);
  uint64_t v43 = sub_10004E580();
  v42[0] = v20;
  uint64_t v59 = &type metadata for TabBarLayoutControlPicker;
  sub_100002388(&qword_100069850);
  uint64_t v21 = v11;
  uint64_t v22 = sub_10004E590();
  uint64_t v23 = v12;
  uint64_t v24 = v17;
  uint64_t v46 = v17;
  uint64_t v26 = v25;
  sub_100022330();
  uint64_t v59 = (ValueMetadata *)sub_10004DB60();
  uint64_t v60 = v27;
  v63._countAndFlagsBits = 46;
  v63._object = (void *)0xE100000000000000;
  sub_10004E5B0(v63);
  v64._countAndFlagsBits = v22;
  v64._object = v26;
  sub_10004E5B0(v64);
  swift_bridgeObjectRelease();
  v42[1] = v59;
  uint64_t v45 = v21;
  v19(v15, v24, v21);
  uint64_t v44 = v23;
  unint64_t v28 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v29 + v28, v15, v21);
  uint64_t v30 = (void *)v42[0];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10004E410();
  sub_100002388(&qword_1000697F8);
  sub_1000229F8();
  sub_10002B970();
  sub_100021EF0();
  sub_10002B63C();
  uint64_t v31 = v48;
  uint64_t v32 = (ValueMetadata *)v43;
  sub_10004E430();
  uint64_t v59 = v32;
  uint64_t v60 = v30;
  unint64_t v33 = sub_1000033CC();
  unint64_t v34 = sub_1000026F8();
  uint64_t v35 = v49;
  uint64_t v36 = (ValueMetadata *)v55;
  sub_10004E090();
  (*(void (**)(char *, ValueMetadata *))(v51 + 8))(v31, v36);
  swift_bridgeObjectRelease();
  uint64_t v59 = v36;
  uint64_t v60 = &type metadata for String;
  unint64_t v61 = v33;
  unint64_t v62 = v34;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v38 = v50;
  uint64_t v39 = (ValueMetadata *)v57;
  sub_10004E0A0();
  (*(void (**)(char *, ValueMetadata *))(v53 + 8))(v35, v39);
  uint64_t v59 = v39;
  uint64_t v60 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v56;
  sub_10004E040();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v46, v45);
}

uint64_t sub_10002A034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v52 = a2;
  uint64_t v2 = sub_10004E420();
  __chkstk_darwin(v2 - 8);
  uint64_t v41 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100002388(&qword_1000684A8);
  uint64_t v45 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  unint64_t v42 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100002388(&qword_1000684A0);
  uint64_t v47 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v43 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100002388(&qword_100068498);
  uint64_t v48 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v44 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DC80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v38 - v12;
  if (qword_1000683B8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10004DBF0();
  sub_100008DDC(v14, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
  sub_10004DBD0();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v15(v11, v13, v7);
  uint64_t v39 = sub_10004E580();
  v38[0] = v8;
  uint64_t v16 = v7;
  uint64_t v18 = v17;
  uint64_t v53 = &type metadata for TabLayoutControlPicker;
  sub_100002388(&qword_100069828);
  uint64_t v19 = sub_10004E590();
  uint64_t v21 = v20;
  sub_10002B708();
  uint64_t v53 = (ValueMetadata *)sub_10004DB60();
  uint64_t v54 = v22;
  v57._countAndFlagsBits = 46;
  v57._object = (void *)0xE100000000000000;
  sub_10004E5B0(v57);
  v58._countAndFlagsBits = v19;
  v58._object = v21;
  sub_10004E5B0(v58);
  swift_bridgeObjectRelease();
  v38[1] = v54;
  v38[2] = v53;
  uint64_t v23 = v16;
  uint64_t v40 = v16;
  v15(v11, v13, v16);
  uint64_t v24 = v38[0];
  unint64_t v25 = (*(unsigned __int8 *)(v38[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38[0] + 80);
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v26 + v25, v11, v23);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10004E410();
  sub_100002388(&qword_1000697F8);
  sub_10002B760();
  sub_10002B7B4();
  sub_10002B808();
  sub_10002B63C();
  uint64_t v27 = v42;
  unint64_t v28 = (ValueMetadata *)v39;
  sub_10004E430();
  uint64_t v53 = v28;
  uint64_t v54 = v18;
  unint64_t v29 = sub_1000033CC();
  unint64_t v30 = sub_1000026F8();
  uint64_t v31 = v43;
  uint64_t v32 = (ValueMetadata *)v49;
  sub_10004E090();
  (*(void (**)(char *, ValueMetadata *))(v45 + 8))(v27, v32);
  swift_bridgeObjectRelease();
  uint64_t v53 = v32;
  uint64_t v54 = &type metadata for String;
  unint64_t v55 = v29;
  unint64_t v56 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v34 = v44;
  uint64_t v35 = (ValueMetadata *)v51;
  sub_10004E0A0();
  (*(void (**)(char *, ValueMetadata *))(v47 + 8))(v31, v35);
  uint64_t v53 = v35;
  uint64_t v54 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v36 = v50;
  sub_10004E040();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v40);
}

uint64_t sub_10002A650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v58 = a2;
  uint64_t v2 = sub_10004E420();
  __chkstk_darwin(v2 - 8);
  uint64_t v47 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100002388(&qword_1000684A8);
  uint64_t v51 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v48 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100002388(&qword_1000684A0);
  uint64_t v53 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v49 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100002388(&qword_100068498);
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v50 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DBF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v42 - v16;
  if (qword_100068328 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_100008DDC(v7, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v18, v7);
  sub_10004DBD0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v19(v15, v17, v11);
  uint64_t v43 = sub_10004E580();
  v42[0] = v20;
  uint64_t v59 = &type metadata for CloseTabsControlPicker;
  sub_100002388(&qword_1000697E8);
  uint64_t v21 = v11;
  uint64_t v22 = sub_10004E590();
  uint64_t v23 = v12;
  uint64_t v24 = v17;
  uint64_t v46 = v17;
  uint64_t v26 = v25;
  sub_10002AD98();
  uint64_t v59 = (ValueMetadata *)sub_10004DB60();
  uint64_t v60 = v27;
  v63._countAndFlagsBits = 46;
  v63._object = (void *)0xE100000000000000;
  sub_10004E5B0(v63);
  v64._countAndFlagsBits = v22;
  v64._object = v26;
  sub_10004E5B0(v64);
  swift_bridgeObjectRelease();
  v42[1] = v59;
  uint64_t v45 = v21;
  v19(v15, v24, v21);
  uint64_t v44 = v23;
  unint64_t v28 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v29 + v28, v15, v21);
  unint64_t v30 = (void *)v42[0];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10004E410();
  sub_100002388(&qword_1000697F8);
  sub_10002B540();
  sub_10002B594();
  sub_10002B5E8();
  sub_10002B63C();
  uint64_t v31 = v48;
  uint64_t v32 = (ValueMetadata *)v43;
  sub_10004E430();
  uint64_t v59 = v32;
  uint64_t v60 = v30;
  unint64_t v33 = sub_1000033CC();
  unint64_t v34 = sub_1000026F8();
  uint64_t v35 = v49;
  uint64_t v36 = (ValueMetadata *)v55;
  sub_10004E090();
  (*(void (**)(char *, ValueMetadata *))(v51 + 8))(v31, v36);
  swift_bridgeObjectRelease();
  uint64_t v59 = v36;
  uint64_t v60 = &type metadata for String;
  unint64_t v61 = v33;
  unint64_t v62 = v34;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v38 = v50;
  uint64_t v39 = (ValueMetadata *)v57;
  sub_10004E0A0();
  (*(void (**)(char *, ValueMetadata *))(v53 + 8))(v35, v39);
  uint64_t v59 = v39;
  uint64_t v60 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v56;
  sub_10004E040();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v46, v45);
}

uint64_t sub_10002AD48@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_10002A650(KeyPath, a1);

  return swift_release();
}

unint64_t sub_10002AD98()
{
  unint64_t result = qword_1000697F0;
  if (!qword_1000697F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000697F0);
  }
  return result;
}

uint64_t sub_10002ADF4(char a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v9 = sub_10004DC80();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100002388(&qword_100069820);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v13 = *a4;
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = a5(a1 & 1);
    if (v15)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)(v13 + 56);
      uint64_t v18 = sub_10004DAC0();
      uint64_t v19 = *(void *)(v18 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v12, v17 + *(void *)(v19 + 72) * v16, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
    }
    else
    {
      uint64_t v18 = sub_10004DAC0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
    }
    swift_bridgeObjectRelease();
    sub_10004DAC0();
    uint64_t v21 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v12, 1, v18) != 1)
    {
      sub_10004DA90();
      uint64_t v22 = sub_10004E1B0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v18);
      return v22;
    }
  }
  else
  {
    uint64_t v20 = sub_10004DAC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
  }
  sub_10002B6A8((uint64_t)v12);
  return 0;
}

uint64_t sub_10002B130(unsigned __int8 a1)
{
  uint64_t v2 = sub_10004DC80();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100002388(&qword_100069820);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068330 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = static CloseTabsIntervalType.caseDisplayRepresentations;
  if (*(void *)(static CloseTabsIntervalType.caseDisplayRepresentations + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_10001D000(a1);
    if (v8)
    {
      unint64_t v9 = v7;
      uint64_t v10 = *(void *)(v6 + 56);
      uint64_t v11 = sub_10004DAC0();
      uint64_t v12 = *(void *)(v11 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v5, v10 + *(void *)(v12 + 72) * v9, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v5, 0, 1, v11);
    }
    else
    {
      uint64_t v11 = sub_10004DAC0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
    }
    swift_bridgeObjectRelease();
    sub_10004DAC0();
    uint64_t v14 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v5, 1, v11) != 1)
    {
      sub_10004DA90();
      uint64_t v15 = sub_10004E1B0();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v11);
      return v15;
    }
  }
  else
  {
    uint64_t v13 = sub_10004DAC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  }
  sub_10002B6A8((uint64_t)v5);
  return 0;
}

uint64_t sub_10002B470@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_10002B4E0(a1, a2, &qword_1000682C0, &static CapsuleLayoutStyle.caseDisplayRepresentations, (uint64_t (*)(void))sub_10001CE60, a3);
}

uint64_t sub_10002B4A8@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_10002B4E0(a1, a2, &qword_1000683C0, &static TabLayoutConfigurationType.caseDisplayRepresentations, (uint64_t (*)(void))sub_10001CEFC, a3);
}

uint64_t sub_10002B4E0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t *a6@<X8>)
{
  uint64_t result = sub_10002ADF4(*a1, a2, a3, a4, a5);
  *a6 = result;
  a6[1] = v8;
  a6[2] = v9;
  a6[3] = v10;
  return result;
}

uint64_t sub_10002B510@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10002B130(*a1);
  *a2 = result;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  return result;
}

unint64_t sub_10002B540()
{
  unint64_t result = qword_100069800;
  if (!qword_100069800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069800);
  }
  return result;
}

unint64_t sub_10002B594()
{
  unint64_t result = qword_100069808;
  if (!qword_100069808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069808);
  }
  return result;
}

unint64_t sub_10002B5E8()
{
  unint64_t result = qword_100069810;
  if (!qword_100069810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069810);
  }
  return result;
}

unint64_t sub_10002B63C()
{
  unint64_t result = qword_100069818;
  if (!qword_100069818)
  {
    sub_100002450(&qword_1000697F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069818);
  }
  return result;
}

uint64_t sub_10002B6A8(uint64_t a1)
{
  uint64_t v2 = sub_100002388(&qword_100069820);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002B708()
{
  unint64_t result = qword_100069830;
  if (!qword_100069830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069830);
  }
  return result;
}

unint64_t sub_10002B760()
{
  unint64_t result = qword_100069838;
  if (!qword_100069838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069838);
  }
  return result;
}

unint64_t sub_10002B7B4()
{
  unint64_t result = qword_100069840;
  if (!qword_100069840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069840);
  }
  return result;
}

unint64_t sub_10002B808()
{
  unint64_t result = qword_100069848;
  if (!qword_100069848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069848);
  }
  return result;
}

uint64_t sub_10002B860()
{
  uint64_t v1 = sub_10004DC80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002B8F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_10004DC80() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10003F200(v4, a1);
}

unint64_t sub_10002B970()
{
  unint64_t result = qword_100069858;
  if (!qword_100069858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069858);
  }
  return result;
}

uint64_t sub_10002B9C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002BAA4()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004DC60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A858);
  sub_100008DDC(v10, (uint64_t)qword_10006A858);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DC90();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_10002BDB4()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A870);
  sub_100008DDC(v0, (uint64_t)qword_10006A870);
  return sub_10004DC50();
}

uint64_t sub_10002BE18()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A888);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A888);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10002BED0()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A8A0 = result;
  return result;
}

uint64_t sub_10002BEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_100069A28);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100069A30);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10002C0BC, 0, 0);
}

uint64_t sub_10002C0BC()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10002F130();
  *uint64_t v1 = v0;
  v1[1] = sub_10002C190;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10002C780, 0, &type metadata for CloseTabsModeEntity, v2);
}

uint64_t sub_10002C190()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002C28C, 0, 0);
}

uint64_t sub_10002C28C()
{
  sub_10004D850();
  uint64_t v1 = v0[3];
  v0[4] = v1;
  v0[20] = v1;
  sub_10004D850();
  if (qword_100068320 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A8A0;
  v0[21] = qword_10006A8A0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[22] = v3;
  uint64_t v4 = sub_10000255C(&qword_100069A08, &qword_100069A10);
  *uint64_t v3 = v0;
  v3[1] = sub_10002C3DC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 24, v2, &type metadata for CloseTabsIntervalType, v4);
}

uint64_t sub_10002C3DC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_10002C530;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002C530()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10002EE28();
  sub_10002F1E0();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10002C784()
{
  uint64_t v0 = sub_100002388(&qword_100069A38);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068320 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_10002F1E0();
  sub_10000255C(&qword_100069A40, &qword_100069A38);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10002C8EC()
{
  if (qword_100068320 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_10002C948@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068310, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A870, a1);
}

uint64_t sub_10002C980@<X0>(uint64_t a1@<X8>)
{
  if (qword_100068318 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A888);

  return sub_100009178(v3, a1);
}

uint64_t sub_10002C9FC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_10002BEF8(a1, v5, v4);
}

uint64_t sub_10002CAA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002E5E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10002CAD0()
{
  return 0xD000000000000024;
}

uint64_t sub_10002CAEC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002CB0C, 0, 0);
}

uint64_t sub_10002CB0C()
{
  id v1 = [self automaticTabClosingInterval];
  if ((unint64_t)v1 >= 4)
  {
    sub_10004D6B0();
    sub_10002398C();
    swift_allocError();
    sub_10004DA30();
    swift_willThrow();
  }
  else
  {
    **(unsigned char **)(v0 + 16) = (_BYTE)v1;
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10002CBDC(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 16) = v3;
  return _swift_task_switch(sub_10002E9EC, 0, 0);
}

uint64_t sub_10002CC88(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000699F0 + dword_1000699F0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

uint64_t sub_10002CD2C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10002F2B0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10002CDDC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002F2B0();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10002CE90(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10002F2B0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

uint64_t sub_10002CF40(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002F028();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10002CFF4()
{
  uint64_t v0 = qword_100069860;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10002D02C@<X0>(uint64_t *a1@<X8>)
{
  sub_10002B5E8();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002D06C@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068308, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A858, a1);
}

uint64_t sub_10002D0A4(uint64_t a1)
{
  unint64_t v2 = sub_10002F130();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10002D0F0(uint64_t a1)
{
  unint64_t v2 = sub_10002B5E8();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10002D13C(uint64_t a1)
{
  unint64_t v2 = sub_10002F46C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t CloseTabsIntervalType.id.getter(char a1)
{
  uint64_t result = 0x796C6C61756E616DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x796144656E6FLL;
      break;
    case 2:
      uint64_t result = 0x6B656557656E6FLL;
      break;
    case 3:
      uint64_t result = 0x68746E6F4D656E6FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t CloseTabsIntervalType.rawValue.getter(char a1)
{
  uint64_t result = 0x796C6C61756E616DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x796144656E6FLL;
      break;
    case 2:
      uint64_t result = 0x6B656557656E6FLL;
      break;
    case 3:
      uint64_t result = 0x68746E6F4D656E6FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002D2A0()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, static CloseTabsIntervalType.typeDisplayRepresentation);
  sub_100008DDC(v10, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t CloseTabsIntervalType.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100068328 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10004DBF0();

  return sub_100008DDC(v0, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
}

uint64_t static CloseTabsIntervalType.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100068328 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004DBF0();
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CloseTabsIntervalType.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (qword_100068328 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004DBF0();
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CloseTabsIntervalType.typeDisplayRepresentation.modify())()
{
  if (qword_100068328 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10004DBF0();
  sub_100008DDC(v0, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_10002D838()
{
  uint64_t v0 = sub_100002388(&qword_1000691C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v58 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v2 - 8);
  uint64_t v53 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10004DC60();
  uint64_t v4 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DD90();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004E550();
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10004DC80();
  uint64_t v45 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_100002388(&qword_100069A48);
  uint64_t v15 = sub_100002388(&qword_1000692C0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v50 = *(void *)(v16 + 72);
  uint64_t v17 = v15 - 8;
  uint64_t v55 = v15 - 8;
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  uint64_t v41 = v19;
  *(_OWORD *)(v19 + 16) = xmmword_100055CE0;
  unint64_t v49 = v19 + v18;
  uint64_t v39 = (unsigned char *)(v19 + v18 + *(int *)(v17 + 56));
  *(unsigned char *)(v19 + v18) = 0;
  unint64_t v40 = 0xD000000000000015;
  sub_10004E500();
  sub_10004DD80();
  unsigned int v56 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v47 = *(void (**)(char *))(v4 + 104);
  uint64_t v48 = v4 + 104;
  uint64_t v43 = v6;
  uint64_t v20 = v57;
  v47(v6);
  unint64_t v54 = 0x800000010004F0E0;
  sub_10004DCA0();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v46 = v14 + 56;
  uint64_t v52 = v21;
  uint64_t v22 = v53;
  v21(v53, 1, 1, v13);
  uint64_t v23 = sub_10004DA80();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
  uint64_t v51 = v24 + 56;
  uint64_t v38 = v23;
  v44(v58, 1, 1, v23);
  sub_10004DAB0();
  unint64_t v26 = v49;
  uint64_t v25 = v50;
  uint64_t v39 = (unsigned char *)(v49 + v50 + *(int *)(v55 + 56));
  *(unsigned char *)(v49 + v50) = 1;
  unint64_t v42 = v12;
  sub_10004E500();
  uint64_t v37 = v9;
  sub_10004DD80();
  uint64_t v27 = v47;
  ((void (*)(char *, void, uint64_t))v47)(v43, v56, v20);
  sub_10004DCA0();
  uint64_t v28 = v45;
  v52(v22, 1, 1, v45);
  uint64_t v29 = v23;
  unint64_t v30 = v44;
  v44(v58, 1, 1, v29);
  sub_10004DAB0();
  uint64_t v31 = (unsigned char *)(v26 + 2 * v25);
  uint64_t v39 = &v31[*(int *)(v55 + 56)];
  *uint64_t v31 = 2;
  sub_10004E500();
  sub_10004DD80();
  uint64_t v32 = v43;
  ((void (*)(char *, void, uint64_t))v27)(v43, v56, v57);
  sub_10004DCA0();
  unint64_t v33 = v52;
  unint64_t v34 = v53;
  v52(v53, 1, 1, v28);
  uint64_t v35 = v38;
  v30(v58, 1, 1, v38);
  sub_10004DAB0();
  *(unsigned char *)(v49 + 2 * v25 + v50) = 3;
  sub_10004E500();
  sub_10004DD80();
  ((void (*)(char *, void, uint64_t))v47)(v32, v56, v57);
  sub_10004DCA0();
  v33(v34, 1, 1, v45);
  v44(v58, 1, 1, v35);
  sub_10004DAB0();
  unint64_t result = sub_10001AF40(v41);
  static CloseTabsIntervalType.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CloseTabsIntervalType.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_100068330 != -1) {
    swift_once();
  }
  return &static CloseTabsIntervalType.caseDisplayRepresentations;
}

uint64_t static CloseTabsIntervalType.caseDisplayRepresentations.getter()
{
  if (qword_100068330 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static CloseTabsIntervalType.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_100068330 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static CloseTabsIntervalType.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CloseTabsIntervalType.caseDisplayRepresentations.modify())()
{
  if (qword_100068330 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

_UNKNOWN **static CloseTabsIntervalType.allCases.getter()
{
  return &off_100065F00;
}

uint64_t sub_10002E174(unsigned __int8 *a1, char *a2)
{
  return sub_100046788(*a1, *a2);
}

Swift::Int sub_10002E180()
{
  return sub_10004E790();
}

uint64_t sub_10002E254()
{
  sub_10004E5A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10002E310()
{
  return sub_10004E790();
}

uint64_t sub_10002E3E0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s21SafariWidgetExtension21CloseTabsIntervalTypeO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10002E410(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE800000000000000;
  uint64_t v3 = 0x796C6C61756E616DLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x796144656E6FLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x6B656557656E6FLL;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x68746E6F4D656E6FLL;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

void sub_10002E4A4(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE800000000000000;
  uint64_t v3 = 0x796C6C61756E616DLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x796144656E6FLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x6B656557656E6FLL;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x68746E6F4D656E6FLL;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10002E538(uint64_t a1)
{
  unint64_t v2 = sub_10002B540();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10002E584(uint64_t a1)
{
  unint64_t v2 = sub_10002F7C0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_10002E5D0(void *a1@<X8>)
{
  *a1 = &off_100065F28;
}

uint64_t sub_10002E5E0()
{
  uint64_t v28 = sub_10004DB10();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068718);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100002388(&qword_1000699E0);
  sub_10004DC50();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_10004D7D0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  uint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  unint64_t v18 = v27;
  v17(v27);
  sub_10002F130();
  uint64_t v23 = sub_10004D880();
  sub_100002388(&qword_1000699E8);
  sub_10004DC50();
  v25(v10, 1, 1, v26);
  char v29 = 4;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_10002B540();
  sub_10004D870();
  return v23;
}

uint64_t sub_10002E9CC(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002E9EC, 0, 0);
}

uint64_t sub_10002E9EC()
{
  [self setAutomaticTabClosingInterval:*(unsigned __int8 *)(v0 + 16)];
  id v1 = [self defaultCenter];
  id v2 = [self safari_notificationNameForUserDefaultsKey:WBSCloseTabsAutomaticallyDefaultsKey];
  [v1 postNotificationName:v2 object:0 userInfo:0 deliverImmediately:1];

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10002EAE4()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10002EC24, 0, 0);
}

uint64_t sub_10002EC24()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100069880);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100069A08, &qword_100069A10);
  sub_10002B540();
  uint64_t v4 = sub_10004DC20();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t _s21SafariWidgetExtension21CloseTabsIntervalTypeO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100065E80;
  v6._object = a2;
  unint64_t v4 = sub_10004E740(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

unint64_t sub_10002EE28()
{
  unint64_t result = qword_100069870;
  if (!qword_100069870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069870);
  }
  return result;
}

uint64_t sub_10002EE7C()
{
  return sub_10000255C(&qword_100069878, &qword_100069880);
}

unint64_t sub_10002EEBC()
{
  unint64_t result = qword_100069888;
  if (!qword_100069888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069888);
  }
  return result;
}

unint64_t sub_10002EF14()
{
  unint64_t result = qword_100069890;
  if (!qword_100069890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069890);
  }
  return result;
}

uint64_t sub_10002EF68()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10002EF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002F840(a1, a2, a3, (void (*)(void))sub_10002EE28);
}

unint64_t sub_10002EFCC()
{
  unint64_t result = qword_1000698A0;
  if (!qword_1000698A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698A0);
  }
  return result;
}

unint64_t sub_10002F028()
{
  unint64_t result = qword_1000698B0;
  if (!qword_1000698B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698B0);
  }
  return result;
}

unint64_t sub_10002F080()
{
  unint64_t result = qword_1000698C0;
  if (!qword_1000698C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698C0);
  }
  return result;
}

unint64_t sub_10002F0D8()
{
  unint64_t result = qword_1000698C8;
  if (!qword_1000698C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698C8);
  }
  return result;
}

unint64_t sub_10002F130()
{
  unint64_t result = qword_1000698D0[0];
  if (!qword_1000698D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000698D0);
  }
  return result;
}

unint64_t sub_10002F188()
{
  unint64_t result = qword_1000698E8;
  if (!qword_1000698E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698E8);
  }
  return result;
}

unint64_t sub_10002F1E0()
{
  unint64_t result = qword_1000698F0;
  if (!qword_1000698F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698F0);
  }
  return result;
}

unint64_t sub_10002F238()
{
  unint64_t result = qword_1000698F8;
  if (!qword_1000698F8)
  {
    sub_100002450(qword_100069900);
    sub_10002F1E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000698F8);
  }
  return result;
}

unint64_t sub_10002F2B0()
{
  unint64_t result = qword_100069918;
  if (!qword_100069918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069918);
  }
  return result;
}

unint64_t sub_10002F308()
{
  unint64_t result = qword_100069920;
  if (!qword_100069920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069920);
  }
  return result;
}

unint64_t sub_10002F360()
{
  unint64_t result = qword_100069928;
  if (!qword_100069928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069928);
  }
  return result;
}

unint64_t sub_10002F3B8()
{
  unint64_t result = qword_100069930;
  if (!qword_100069930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069930);
  }
  return result;
}

unint64_t sub_10002F414()
{
  unint64_t result = qword_100069938;
  if (!qword_100069938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069938);
  }
  return result;
}

unint64_t sub_10002F46C()
{
  unint64_t result = qword_100069940;
  if (!qword_100069940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069940);
  }
  return result;
}

uint64_t sub_10002F4C0()
{
  return sub_10000255C(&qword_100069948, &qword_100069950);
}

unint64_t sub_10002F500()
{
  unint64_t result = qword_100069958;
  if (!qword_100069958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069958);
  }
  return result;
}

unint64_t sub_10002F558()
{
  unint64_t result = qword_100069960;
  if (!qword_100069960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069960);
  }
  return result;
}

unint64_t sub_10002F5B0()
{
  unint64_t result = qword_100069968;
  if (!qword_100069968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069968);
  }
  return result;
}

unint64_t sub_10002F608()
{
  unint64_t result = qword_100069970;
  if (!qword_100069970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069970);
  }
  return result;
}

unint64_t sub_10002F660()
{
  unint64_t result = qword_100069978;
  if (!qword_100069978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069978);
  }
  return result;
}

unint64_t sub_10002F6B8()
{
  unint64_t result = qword_100069980;
  if (!qword_100069980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069980);
  }
  return result;
}

unint64_t sub_10002F710()
{
  unint64_t result = qword_100069988;
  if (!qword_100069988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069988);
  }
  return result;
}

unint64_t sub_10002F768()
{
  unint64_t result = qword_100069990;
  if (!qword_100069990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069990);
  }
  return result;
}

unint64_t sub_10002F7C0()
{
  unint64_t result = qword_100069998;
  if (!qword_100069998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069998);
  }
  return result;
}

uint64_t sub_10002F814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002F840(a1, a2, a3, (void (*)(void))sub_10002B540);
}

uint64_t sub_10002F840(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002F88C()
{
  unint64_t result = qword_1000699A0;
  if (!qword_1000699A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000699A0);
  }
  return result;
}

unint64_t sub_10002F8E4()
{
  unint64_t result = qword_1000699A8;
  if (!qword_1000699A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000699A8);
  }
  return result;
}

unint64_t sub_10002F93C()
{
  unint64_t result = qword_1000699B0;
  if (!qword_1000699B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000699B0);
  }
  return result;
}

uint64_t sub_10002F990()
{
  return sub_10000255C(&qword_1000699B8, &qword_1000699C0);
}

uint64_t getEnumTagSinglePayload for CloseTabsIntervalType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CloseTabsIntervalType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002FB28);
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

unsigned char *sub_10002FB50(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CloseTabsIntervalType()
{
  return &type metadata for CloseTabsIntervalType;
}

ValueMetadata *type metadata accessor for CloseTabsModeEntity.CloseTabsModeEntityQuery()
{
  return &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery;
}

ValueMetadata *type metadata accessor for CloseTabsModeEntity()
{
  return &type metadata for CloseTabsModeEntity;
}

ValueMetadata *type metadata accessor for CloseTabsModeEntity.UpdateIntent_value()
{
  return &type metadata for CloseTabsModeEntity.UpdateIntent_value;
}

uint64_t sub_10002FB98()
{
  return sub_10000255C(&qword_1000699C8, &qword_1000699D0);
}

uint64_t sub_10002FBD4()
{
  return sub_10000255C(&qword_1000699D8, &qword_1000699D0);
}

uint64_t sub_10002FC10@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10002FC20()
{
  unint64_t result = qword_100069A60;
  if (!qword_100069A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A60);
  }
  return result;
}

uint64_t sub_10002FC74()
{
  return sub_10000255C(&qword_100069A68, &qword_100069A70);
}

uint64_t sub_10002FCB0()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  int v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A8C8);
  sub_100008DDC(v10, (uint64_t)qword_10006A8C8);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_10002FF98()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A8E0);
  sub_100008DDC(v0, (uint64_t)qword_10006A8E0);
  return sub_10004DC50();
}

uint64_t sub_10002FFFC()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A8F8);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A8F8);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000300B4()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A910 = result;
  return result;
}

uint64_t sub_1000300DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_100069B60);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_100069B68);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000302A0, 0, 0);
}

uint64_t sub_1000302A0()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100030E10();
  *uint64_t v1 = v0;
  v1[1] = sub_100030374;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10003096C, 0, &type metadata for OpenLinksInBackgroundEntity, v2);
}

uint64_t sub_100030374()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100030470, 0, 0);
}

uint64_t sub_100030470()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100068350 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A910;
  *(void *)(v0 + 168) = qword_10006A910;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_100069B40, &qword_100069B48);
  *uint64_t v3 = v0;
  v3[1] = sub_1000305C8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000305C8()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_10003071C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003071C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10002FC20();
  sub_10003166C();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100030970()
{
  uint64_t v0 = sub_100002388(&qword_100069B70);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068350 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_10003166C();
  sub_10000255C(&qword_100069B78, &qword_100069B70);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100030AD8()
{
  if (qword_100068350 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100030B38()
{
  unint64_t result = qword_100069A78;
  if (!qword_100069A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A78);
  }
  return result;
}

unint64_t sub_100030B90()
{
  unint64_t result = qword_100069A80;
  if (!qword_100069A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A80);
  }
  return result;
}

uint64_t sub_100030BE4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100030C18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100030C68@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068340, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A8E0, a1);
}

uint64_t sub_100030CA0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100068348 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A8F8);

  return sub_100009178(v3, a1);
}

uint64_t sub_100030D1C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100005704;
  return sub_1000300DC(a1, v5, v4);
}

uint64_t sub_100030DC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000319A0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100030DF0()
{
  return 0xD00000000000002CLL;
}

unint64_t sub_100030E10()
{
  unint64_t result = qword_100069A90;
  if (!qword_100069A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A90);
  }
  return result;
}

uint64_t sub_100030E64()
{
  return sub_10000255C(&qword_100069A98, &qword_100069AA0);
}

uint64_t sub_100030EA0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100030EC0, 0, 0);
}

uint64_t sub_100030EC0()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self safari_browserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:_SFOpenLinksInBackgroundDefaultsKey];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100030F70(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 16) = v3;
  return _swift_task_switch(sub_100031E54, 0, 0);
}

uint64_t sub_10003101C()
{
  uint64_t v0 = sub_100002388(&qword_100069AA0);
  sub_100008E14(v0, qword_10006A918);
  sub_100008DDC(v0, (uint64_t)qword_10006A918);
  sub_100031DE0();
  return sub_10004DAE0();
}

uint64_t sub_100031098(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_10004DC60();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_10004DD90();
  v1[6] = swift_task_alloc();
  sub_10004E550();
  v1[7] = swift_task_alloc();
  sub_10004DC80();
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000311DC, 0, 0);
}

uint64_t sub_1000311DC()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = (uint64_t *)v0[2];
  sub_100002388(&qword_100069A70);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100069B40, &qword_100069B48);
  *uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100031390()
{
  uint64_t v0 = qword_100069A50;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000313CC()
{
  unint64_t result = qword_100069AA8;
  if (!qword_100069AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AA8);
  }
  return result;
}

unint64_t sub_100031424()
{
  unint64_t result = qword_100069AB0;
  if (!qword_100069AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AB0);
  }
  return result;
}

unint64_t sub_10003147C()
{
  unint64_t result = qword_100069AB8;
  if (!qword_100069AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AB8);
  }
  return result;
}

uint64_t sub_1000314D0()
{
  return sub_10000255C(&qword_100069AC0, &qword_100069AA0);
}

uint64_t sub_10003150C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100068358 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_100069AA0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A918);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000315BC()
{
  unint64_t result = qword_100069AC8;
  if (!qword_100069AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AC8);
  }
  return result;
}

unint64_t sub_100031614()
{
  unint64_t result = qword_100069AD0;
  if (!qword_100069AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AD0);
  }
  return result;
}

unint64_t sub_10003166C()
{
  unint64_t result = qword_100069AD8;
  if (!qword_100069AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AD8);
  }
  return result;
}

unint64_t sub_1000316C4()
{
  unint64_t result = qword_100069AE0;
  if (!qword_100069AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AE0);
  }
  return result;
}

uint64_t sub_100031718@<X0>(uint64_t *a1@<X8>)
{
  sub_100031DE0();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100031758@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068338, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A8C8, a1);
}

uint64_t sub_100031790()
{
  return sub_10000255C(&qword_100069AE8, &qword_100069AF0);
}

uint64_t sub_1000317CC(uint64_t a1)
{
  unint64_t v2 = sub_100030E10();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10003181C()
{
  unint64_t result = qword_100069AF8;
  if (!qword_100069AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AF8);
  }
  return result;
}

uint64_t sub_100031870(uint64_t a1)
{
  unint64_t v2 = sub_100031DE0();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000318BC(uint64_t a1)
{
  unint64_t v2 = sub_1000316C4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenLinksInBackgroundEntity()
{
  return &type metadata for OpenLinksInBackgroundEntity;
}

ValueMetadata *type metadata accessor for OpenLinksInBackgroundEntity.UpdateIntent_value()
{
  return &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value;
}

uint64_t sub_100031928()
{
  return sub_10000255C(&qword_100069B00, &qword_100069B08);
}

uint64_t sub_100031964()
{
  return sub_10000255C(&qword_100069B10, &qword_100069B08);
}

uint64_t sub_1000319A0()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100069B18);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100030E10();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

unint64_t sub_100031DE0()
{
  unint64_t result = qword_100069B20;
  if (!qword_100069B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069B20);
  }
  return result;
}

uint64_t sub_100031E34(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100031E54, 0, 0);
}

uint64_t sub_100031E54()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v2 = self;
  id v3 = [v2 safari_browserDefaults];
  uint64_t v4 = _SFOpenLinksInBackgroundDefaultsKey;
  [v3 setBool:v1 forKey:_SFOpenLinksInBackgroundDefaultsKey];

  id v5 = [self defaultCenter];
  id v6 = [v2 safari_notificationNameForUserDefaultsKey:v4];
  [v5 postNotificationName:v6 object:0 userInfo:0 deliverImmediately:1];

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100031F74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SearchEngineControlPicker()
{
  return &type metadata for SearchEngineControlPicker;
}

uint64_t sub_100031F90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100031FAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_10004E420();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_1000684A8);
  uint64_t v24 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100002388(&qword_100069B80);
  uint64_t v25 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002388(&qword_100069B88);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v26 = v11;
  uint64_t v27 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v15 = sub_10004DDB0();
  v22[0] = v16;
  v22[1] = v15;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  sub_10004E410();
  sub_100002388(&qword_100068478);
  sub_10001BE74();
  sub_100018784();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E440();
  sub_10004DFF0();
  uint64_t v17 = sub_10000255C((unint64_t *)&qword_1000684B0, &qword_1000684A8);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  uint64_t v29 = v6;
  uint64_t v30 = v17;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v23;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v19);
  uint64_t v29 = v19;
  uint64_t v30 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, v20);
}

uint64_t sub_1000324B4()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_1000325EC@<X0>(uint64_t a1@<X8>)
{
  sub_10004D810();
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100032658()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for PrivateSearchEngineControlPicker()
{
  return &type metadata for PrivateSearchEngineControlPicker;
}

uint64_t sub_100032758()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100032774@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_10004E420();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_1000684A8);
  uint64_t v25 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002388(&qword_100069B80);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  uint64_t v27 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002388(&qword_100069B88);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v28 = v13;
  uint64_t v29 = v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v17 = sub_10004DDB0();
  v24[0] = v18;
  v24[1] = v17;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  sub_10004E410();
  sub_100002388(&qword_100068478);
  sub_10001BE74();
  sub_10001A7D8();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E440();
  sub_10004DFF0();
  uint64_t v19 = sub_10000255C((unint64_t *)&qword_1000684B0, &qword_1000684A8);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
  uint64_t v31 = v6;
  uint64_t v32 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v26;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v21);
  uint64_t v31 = v21;
  uint64_t v32 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v28;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v22);
}

uint64_t sub_100032C78()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

unint64_t sub_100032DB4()
{
  unint64_t result = qword_100069BB0;
  if (!qword_100069BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BB0);
  }
  return result;
}

unint64_t sub_100032E0C()
{
  unint64_t result = qword_100069BB8;
  if (!qword_100069BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BB8);
  }
  return result;
}

unint64_t sub_100032E64()
{
  unint64_t result = qword_100069BC0[0];
  if (!qword_100069BC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100069BC0);
  }
  return result;
}

uint64_t sub_100032EB8@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v3 = sub_100002388(&qword_1000691C8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v78[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v6 - 8);
  uint64_t v88 = &v78[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_10004DC60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v78[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_10004DD90();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004E550();
  __chkstk_darwin(v13 - 8);
  uint64_t v84 = sub_10004DC80();
  uint64_t v14 = *(void *)(v84 - 8);
  uint64_t v15 = __chkstk_darwin(v84);
  long long v85 = &v78[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  uint64_t v18 = &v78[-v17];
  long long v87 = v5;
  switch(a1)
  {
    case 1:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v26 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v27 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      v27(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      long long v81 = v27;
      uint64_t v82 = v8;
      long long v83 = v18;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v27(v11, v26, v8);
      uint64_t v28 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v28, 0, 1, v84);
      uint64_t v29 = v87;
      sub_10004DA70();
      uint64_t v30 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      v81(v11, v26, v82);
      sub_10004DCA0();
      sub_10004DC50();
      return sub_10004DAA0();
    case 2:
    case 13:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v57 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v20 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      LODWORD(v81) = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v20(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      uint64_t v82 = v8;
      long long v83 = v18;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v20(v11, v57, v8);
      uint64_t v58 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v58, 0, 1, v84);
      uint64_t v59 = v87;
      sub_10004DA70();
      uint64_t v60 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 0, 1, v60);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v25 = v81;
      uint64_t v21 = v82;
      v20(v11, v81, v82);
      sub_10004DCA0();
      goto LABEL_10;
    case 3:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v31 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v32 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      LODWORD(v81) = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v32(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      uint64_t v82 = v8;
      long long v83 = v18;
      unint64_t v80 = 0x800000010004F0E0;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v32(v11, v31, v8);
      uint64_t v33 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v33, 0, 1, v84);
      unint64_t v34 = v87;
      sub_10004DA70();
      uint64_t v35 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 0, 1, v35);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v36 = v81;
      uint64_t v37 = v82;
      v32(v11, v81, v82);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v32(v11, v36, v37);
      goto LABEL_11;
    case 5:
    case 11:
    case 12:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v52 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      v52(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      uint64_t v82 = v8;
      long long v83 = v18;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v52(v11, v51, v8);
      uint64_t v53 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v53, 0, 1, v84);
      unint64_t v54 = v87;
      sub_10004DA70();
      uint64_t v55 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v54, 0, 1, v55);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v56 = v82;
      v52(v11, v51, v82);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v52(v11, v51, v56);
      goto LABEL_11;
    case 6:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v38 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v20 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      LODWORD(v81) = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v20(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      long long v83 = v18;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      uint64_t v21 = v8;
      v20(v11, v38, v8);
      uint64_t v39 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v39, 0, 1, v84);
      unint64_t v40 = v87;
      sub_10004DA70();
      uint64_t v41 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v25 = v81;
      v20(v11, v81, v21);
      sub_10004DCA0();
      goto LABEL_10;
    case 8:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v42 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v43 = v5;
      uint64_t v44 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      v44(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      long long v81 = v44;
      uint64_t v82 = v8;
      long long v83 = v18;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v44(v11, v42, v8);
      uint64_t v45 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v45, 0, 1, v84);
      sub_10004DA70();
      uint64_t v46 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v43, 0, 1, v46);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v47 = v42;
      uint64_t v48 = v42;
      unint64_t v49 = v81;
      uint64_t v50 = v82;
      v81(v11, v48, v82);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v49(v11, v47, v50);
      goto LABEL_11;
    case 14:
      sub_10004E500();
      sub_10004DD80();
      unsigned int v79 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      unint64_t v62 = *(void (**)(unsigned char *))(v9 + 104);
      v62(v11);
      long long v81 = (void (*)(unsigned char *, uint64_t, uint64_t))v62;
      uint64_t v82 = v8;
      long long v83 = v18;
      unint64_t v80 = 0x800000010004F0E0;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      uint64_t v63 = v79;
      ((void (*)(unsigned char *, void, uint64_t))v62)(v11, v79, v8);
      Swift::String v64 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v64, 0, 1, v84);
      sub_10004DA70();
      uint64_t v65 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v5, 0, 1, v65);
      sub_100002388(&qword_100069CE8);
      uint64_t v84 = swift_allocObject();
      *(_OWORD *)(v84 + 16) = xmmword_1000546C0;
      sub_10004E500();
      sub_10004DD80();
      long long v66 = v81;
      uint64_t v67 = v82;
      v81(v11, v63, v82);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v66(v11, v63, v67);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v66(v11, v63, v67);
      goto LABEL_11;
    case 15:
      sub_10004E500();
      sub_10004DD80();
      LODWORD(v81) = enum case for LocalizedStringResource.BundleDescription.main(_:);
      long long v68 = *(void (**)(unsigned char *))(v9 + 104);
      v68(v11);
      uint64_t v82 = v8;
      long long v83 = v18;
      unint64_t v80 = 0x800000010004F0E0;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      ((void (*)(unsigned char *, void, uint64_t))v68)(v11, v81, v8);
      id v69 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v69, 0, 1, v84);
      sub_10004DA70();
      uint64_t v70 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v5, 0, 1, v70);
      sub_100002388(&qword_100069CE8);
      uint64_t v84 = swift_allocObject();
      *(_OWORD *)(v84 + 16) = xmmword_1000546C0;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v71 = v81;
      uint64_t v72 = v82;
      ((void (*)(unsigned char *, void, uint64_t))v68)(v11, v81, v82);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      ((void (*)(unsigned char *, uint64_t, uint64_t))v68)(v11, v71, v72);
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      ((void (*)(unsigned char *, uint64_t, uint64_t))v68)(v11, v71, v72);
      goto LABEL_11;
    case 16:
    case 17:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v73 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      char v74 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      v74(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      uint64_t v82 = v8;
      long long v81 = (void (*)(unsigned char *, uint64_t, uint64_t))0x8000000100050360;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      v74(v11, v73, v8);
      long long v75 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v75, 0, 1, v84);
      unint64_t v76 = v87;
      sub_10004DA70();
      uint64_t v77 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v76, 0, 1, v77);
      sub_10004E500();
      sub_10004DD80();
      v74(v11, v73, v82);
      sub_10004DCA0();
      return sub_10004DAA0();
    default:
      sub_10004E500();
      sub_10004DD80();
      uint64_t v19 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      uint64_t v20 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 104);
      LODWORD(v81) = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v20(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
      long long v83 = v18;
      sub_10004DCA0();
      sub_10004E500();
      sub_10004DD80();
      uint64_t v21 = v8;
      v20(v11, v19, v8);
      uint64_t v22 = v88;
      sub_10004DCA0();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v22, 0, 1, v84);
      uint64_t v23 = v87;
      sub_10004DA70();
      uint64_t v24 = sub_10004DA80();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
      sub_100002388(&qword_100069CE8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100052C00;
      sub_10004E500();
      sub_10004DD80();
      uint64_t v25 = v81;
      v20(v11, v81, v21);
      sub_10004DCA0();
LABEL_10:
      sub_10004E500();
      sub_10004DD80();
      v20(v11, v25, v21);
LABEL_11:
      sub_10004DCA0();
      return sub_10004DAA0();
  }
}

uint64_t sub_100035F58()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004DC80();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10004DBF0();
  sub_100008E14(v5, qword_10006A930);
  sub_100008DDC(v5, (uint64_t)qword_10006A930);
  sub_10004DC50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10004DBE0();
}

uint64_t sub_1000360CC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100069D20 + dword_100069D20);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000053B4;
  return v5(a1);
}

uint64_t sub_100036174(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069D10 + dword_100069D10);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_10003621C()
{
  unint64_t result = qword_100069BD8;
  if (!qword_100069BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BD8);
  }
  return result;
}

uint64_t sub_100036270(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069D00 + dword_100069D00);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000050E4;
  return v4();
}

unint64_t sub_100036318()
{
  unint64_t result = qword_100069BE8;
  if (!qword_100069BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BE8);
  }
  return result;
}

unint64_t sub_100036370()
{
  unint64_t result = qword_100069BF0;
  if (!qword_100069BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BF0);
  }
  return result;
}

unint64_t sub_1000363C8()
{
  unint64_t result = qword_100069BF8;
  if (!qword_100069BF8)
  {
    sub_100002450(qword_100069C00);
    sub_100036370();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BF8);
  }
  return result;
}

uint64_t sub_10003643C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10003621C();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000364F4()
{
  unint64_t result = qword_100069C18;
  if (!qword_100069C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C18);
  }
  return result;
}

uint64_t sub_100036548()
{
  uint64_t v0 = sub_100002388(&qword_100069CF0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002388(&qword_100069CF8);
  __chkstk_darwin(v4);
  sub_100032E64();
  sub_10004DBA0();
  v7._object = (void *)0x8000000100051210;
  v7._countAndFlagsBits = 0xD000000000000045;
  sub_10004DB90(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10004DB80();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_10004DB90(v8);
  return sub_10004DBB0();
}

uint64_t sub_100036704()
{
  uint64_t v0 = qword_100069B90;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100036740()
{
  unint64_t result = qword_100069C20;
  if (!qword_100069C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C20);
  }
  return result;
}

unint64_t sub_100036798()
{
  unint64_t result = qword_100069C28;
  if (!qword_100069C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C28);
  }
  return result;
}

unint64_t sub_1000367F0()
{
  unint64_t result = qword_100069C30;
  if (!qword_100069C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C30);
  }
  return result;
}

unint64_t sub_100036848()
{
  unint64_t result = qword_100069C38;
  if (!qword_100069C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C38);
  }
  return result;
}

uint64_t sub_10003689C()
{
  sub_100038E64();
  uint64_t v2 = sub_10004DB20();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100038EB8(v3, v0, v2, v1);
}

unint64_t sub_100036934()
{
  unint64_t result = qword_100069C48;
  if (!qword_100069C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C48);
  }
  return result;
}

unint64_t sub_10003698C()
{
  unint64_t result = qword_100069C50;
  if (!qword_100069C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C50);
  }
  return result;
}

unint64_t sub_1000369E4()
{
  unint64_t result = qword_100069C58;
  if (!qword_100069C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C58);
  }
  return result;
}

unint64_t sub_100036A3C()
{
  unint64_t result = qword_100069C60;
  if (!qword_100069C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C60);
  }
  return result;
}

void sub_100036A90(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100036A9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000378EC(&qword_100068360, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A930, a1);
}

uint64_t sub_100036AD4()
{
  return sub_10000255C(&qword_100069C68, &qword_100069C70);
}

uint64_t sub_100036B10(uint64_t a1)
{
  unint64_t v2 = sub_100032E64();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100036B60()
{
  unint64_t result = qword_100069C78;
  if (!qword_100069C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C78);
  }
  return result;
}

uint64_t sub_100036BB4@<X0>(uint64_t a1@<X8>)
{
  return sub_100032EB8(*v1, a1);
}

uint64_t sub_100036BBC(uint64_t a1)
{
  unint64_t v2 = sub_1000369E4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100036C08(char a1)
{
  unint64_t result = 0xD00000000000001FLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000024;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x44414F4C4E574F44;
      break;
    case 5:
      unint64_t result = 0x5323495241464153;
      break;
    case 6:
      unint64_t result = 0x4C49465F4F545541;
      break;
    case 7:
      unint64_t result = 0x464F52505F57454ELL;
      break;
    case 8:
      unint64_t result = 0x455458455F424557;
      break;
    case 9:
      unint64_t result = 0x41545F45534F4C43;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    case 12:
      unint64_t result = 0xD000000000000017;
      break;
    case 13:
      unint64_t result = 0xD000000000000020;
      break;
    case 14:
      unint64_t result = 0xD000000000000020;
      break;
    case 15:
      unint64_t result = 0xD000000000000021;
      break;
    case 16:
      unint64_t result = 0xD000000000000014;
      break;
    case 17:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100036E14(char a1)
{
  unint64_t result = 0xD00000000000001FLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000024;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x44414F4C4E574F44;
      break;
    case 5:
      unint64_t result = 0x5323495241464153;
      break;
    case 6:
      unint64_t result = 0x4C49465F4F545541;
      break;
    case 7:
      unint64_t result = 0x464F52505F57454ELL;
      break;
    case 8:
      unint64_t result = 0x455458455F424557;
      break;
    case 9:
      unint64_t result = 0x41545F45534F4C43;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    case 12:
      unint64_t result = 0xD000000000000017;
      break;
    case 13:
      unint64_t result = 0xD000000000000020;
      break;
    case 14:
      unint64_t result = 0xD000000000000020;
      break;
    case 15:
      unint64_t result = 0xD000000000000021;
      break;
    case 16:
      unint64_t result = 0xD000000000000014;
      break;
    case 17:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100037020(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100036E14(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100036E14(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10004E750();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_1000370B0()
{
  unint64_t result = qword_100069C80;
  if (!qword_100069C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C80);
  }
  return result;
}

Swift::Int sub_100037104()
{
  char v1 = *v0;
  sub_10004E770();
  sub_100036E14(v1);
  sub_10004E5A0();
  swift_bridgeObjectRelease();
  return sub_10004E790();
}

uint64_t sub_100037168()
{
  sub_100036E14(*v0);
  sub_10004E5A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000371BC()
{
  char v1 = *v0;
  sub_10004E770();
  sub_100036E14(v1);
  sub_10004E5A0();
  swift_bridgeObjectRelease();
  return sub_10004E790();
}

uint64_t sub_10003721C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100038904();
  *a1 = result;
  return result;
}

unint64_t sub_10003724C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100036E14(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100037278()
{
  return sub_10000255C(&qword_100069C88, &qword_100069C90);
}

void sub_1000372B4(void *a1@<X8>)
{
  *a1 = &off_100065F50;
}

unint64_t sub_1000372C4()
{
  return sub_100036C08(*v0);
}

uint64_t sub_1000372CC@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100038904();
  *a1 = result;
  return result;
}

unint64_t sub_100037318()
{
  unint64_t result = qword_100069C98;
  if (!qword_100069C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C98);
  }
  return result;
}

uint64_t sub_10003736C()
{
  uint64_t v0 = sub_10004DC60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004DD90();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004E550();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004DC80();
  sub_100008E14(v6, qword_10006A948);
  sub_100008DDC(v6, (uint64_t)qword_10006A948);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004DCA0();
}

uint64_t sub_100037560()
{
  sub_10004D850();
  return v1;
}

uint64_t sub_100037594@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t sub_1000375D0()
{
  return sub_10004D860();
}

void (*sub_100037608(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004D840();
  return sub_100006CEC;
}

unint64_t sub_100037668()
{
  unint64_t result = qword_100069CA0;
  if (!qword_100069CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CA0);
  }
  return result;
}

unint64_t sub_1000376C0()
{
  unint64_t result = qword_100069CA8;
  if (!qword_100069CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CA8);
  }
  return result;
}

uint64_t sub_100037714(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100038DBC();
  unint64_t v5 = sub_100038E64();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10003777C()
{
  uint64_t v0 = qword_100069BA0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000377B8()
{
  unint64_t result = qword_100069CB0;
  if (!qword_100069CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CB0);
  }
  return result;
}

unint64_t sub_100037810()
{
  unint64_t result = qword_100069CB8;
  if (!qword_100069CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CB8);
  }
  return result;
}

uint64_t sub_100037864()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000378B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000378EC(&qword_100068368, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A948, a1);
}

uint64_t sub_1000378EC@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008DDC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100037990()
{
  return 0;
}

uint64_t sub_100037998()
{
  return 1;
}

uint64_t sub_1000379A4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100038DBC();
  unint64_t v7 = sub_100038E10();
  unint64_t v8 = sub_100038E64();
  void *v5 = v2;
  v5[1] = sub_100037A78;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100037A78()
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

uint64_t sub_100037B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100038958();
  *a1 = result;
  return result;
}

uint64_t sub_100037BA8(uint64_t a1)
{
  unint64_t v2 = sub_100037668();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenSafariSettingDeepLinks()
{
  return &type metadata for OpenSafariSettingDeepLinks;
}

ValueMetadata *type metadata accessor for SafariSettingsDestination()
{
  return &type metadata for SafariSettingsDestination;
}

uint64_t _s21SafariWidgetExtension25SafariSettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s21SafariWidgetExtension25SafariSettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
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
        JUMPOUT(0x100037D68);
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
          *uint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariSettingsDeepLinks()
{
  return &type metadata for SafariSettingsDeepLinks;
}

ValueMetadata *type metadata accessor for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery()
{
  return &type metadata for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery;
}

size_t sub_100037DB0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100037E30(a1, a2, a3, (void *)*v3);
  *int v3 = result;
  return result;
}

char *sub_100037DD0(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100038004(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_100037DF0(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100038108(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_100037E10(char *a1, int64_t a2, char a3)
{
  size_t result = sub_1000381F4(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

size_t sub_100037E30(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100002388(qword_1000689F8);
  uint64_t v10 = *(void *)(type metadata accessor for BookmarkItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for BookmarkItem() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_100038004(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002388(&qword_100069D28);
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
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
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

char *sub_100038108(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002388(&qword_100069D08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_1000381F4(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002388(&qword_100069D18);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

void *sub_1000382E0(uint64_t a1)
{
  unint64_t v17 = *(void *)(a1 + 16);
  if (!v17) {
    return _swiftEmptyArrayStorage;
  }
  unint64_t v1 = 0;
  uint64_t v16 = a1 + 32;
  int v2 = _swiftEmptyArrayStorage;
  while (2)
  {
    uint64_t v18 = v2;
    uint64_t v3 = 0;
    uint64_t v4 = v16;
    unint64_t v5 = v17;
    if (v1 <= v17) {
      unint64_t v6 = v17;
    }
    else {
      unint64_t v6 = v1;
    }
    unint64_t v7 = v1 - v6;
LABEL_9:
    if (!(v7 + v3))
    {
      __break(1u);
      JUMPOUT(0x1000384D4);
    }
    char v8 = *(unsigned char *)(v4 + v1);
    switch(v8)
    {
      case 1:
        if (_SFDeviceIsPad()) {
          goto LABEL_16;
        }
        goto LABEL_8;
      case 2:
        id v9 = [self safari_browserSharedDefaults];
        NSString v10 = sub_10004E560();
        unsigned __int8 v11 = [v9 BOOLForKey:v10];

        if ((v11 & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_8;
      case 3:
        if ((_SFDeviceIsPad() & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_8;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        goto LABEL_16;
      default:
        if (!_SFDeviceIsPad())
        {
LABEL_16:
          int v2 = v18;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_100037E10(0, v18[2] + 1, 1);
            int v2 = v18;
          }
          unint64_t v13 = v2[2];
          unint64_t v12 = v2[3];
          if (v13 >= v12 >> 1)
          {
            sub_100037E10((char *)(v12 > 1), v13 + 1, 1);
            int v2 = v18;
          }
          unint64_t v14 = v1 + 1;
          v1 += 1 + v3;
          v2[2] = v13 + 1;
          *((unsigned char *)v2 + v13 + 32) = v8;
          if (v14 == v5) {
            return v2;
          }
          continue;
        }
LABEL_8:
        ++v3;
        ++v4;
        if (v1 != --v5) {
          goto LABEL_9;
        }
        return v18;
    }
  }
}

uint64_t sub_10003851C()
{
  return _swift_task_switch(sub_100038538, 0, 0);
}

uint64_t sub_100038538()
{
  uint64_t v1 = 18;
  sub_100037DF0(0, 18, 0);
  int v2 = _swiftEmptyArrayStorage;
  unint64_t v3 = _swiftEmptyArrayStorage[2];
  uint64_t v4 = &byte_100065F70;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    NSString v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_100037DF0((char *)(v7 > 1), v3 + 1, 1);
      int v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  char v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10003863C()
{
  return _swift_task_switch(sub_100038658, 0, 0);
}

uint64_t sub_100038658()
{
  uint64_t v1 = sub_1000382E0((uint64_t)&off_100065F50);
  int64_t v2 = v1[2];
  if (v2)
  {
    sub_100037DF0(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = _swiftEmptyArrayStorage[2];
    do
    {
      char v5 = *((unsigned char *)v1 + v3 + 32);
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v6 >> 1) {
        sub_100037DF0((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v4 + v3++) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  unint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(_swiftEmptyArrayStorage);
}

uint64_t sub_100038798(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000387B8, 0, 0);
}

uint64_t sub_1000387B8()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  int64_t v2 = sub_1000382E0(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_100037DF0(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    do
    {
      char v6 = *((unsigned char *)v2 + v4 + 32);
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v5 + v4 >= v7 >> 1) {
        sub_100037DF0((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v5 + v4++) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  char v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(_swiftEmptyArrayStorage);
}

uint64_t sub_100038904()
{
  unint64_t v0 = sub_10004E760();
  swift_bridgeObjectRelease();
  if (v0 >= 0x12) {
    return 18;
  }
  else {
    return v0;
  }
}

uint64_t sub_100038958()
{
  uint64_t v0 = sub_10004DB10();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068718);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004DC60();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10004DD90();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004E550();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10004DC80();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_100002388(&qword_100069CC8);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 18;
  uint64_t v18 = sub_10004D7D0();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_100032E64();
  return sub_10004D880();
}

unint64_t sub_100038DBC()
{
  unint64_t result = qword_100069CD0;
  if (!qword_100069CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CD0);
  }
  return result;
}

unint64_t sub_100038E10()
{
  unint64_t result = qword_100069CD8;
  if (!qword_100069CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CD8);
  }
  return result;
}

unint64_t sub_100038E64()
{
  unint64_t result = qword_100069CE0;
  if (!qword_100069CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069CE0);
  }
  return result;
}

uint64_t sub_100038EB8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100038ECC(uint64_t a1)
{
  uint64_t v2 = sub_10004D8B0();
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  __chkstk_darwin(v2);
  uint64_t v23 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002388(&qword_100069E88);
  v18[0] = v4;
  uint64_t v26 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002388(&qword_100069E90);
  __chkstk_darwin(v7);
  sub_10002EE28();
  sub_10004D970();
  v27._countAndFlagsBits = 0xD000000000000017;
  v27._object = (void *)0x8000000100051720;
  sub_10004D960(v27);
  swift_getKeyPath();
  v18[1] = sub_10002F768();
  uint64_t v20 = a1;
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_10004D960(v28);
  sub_10004D980();
  uint64_t v22 = sub_10004D8D0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v26 + 8);
  v26 += 8;
  v8(v6, v4);
  uint64_t v19 = v8;
  sub_10004D970();
  v29._countAndFlagsBits = 0xD00000000000001DLL;
  v29._object = (void *)0x8000000100051740;
  sub_10004D960(v29);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10004D960(v30);
  sub_10004D980();
  uint64_t v21 = sub_10004D8D0();
  uint64_t v9 = v18[0];
  v8(v6, v18[0]);
  sub_10004D970();
  v31._countAndFlagsBits = 0x61542065736F6C43;
  v31._object = (void *)0xEE00206E69207362;
  sub_10004D960(v31);
  uint64_t v10 = v23;
  uint64_t v11 = v24;
  uint64_t v12 = v25;
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v25);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v12);
  v32._object = (void *)0x8000000100051760;
  v32._countAndFlagsBits = 0xD000000000000015;
  sub_10004D960(v32);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10004D960(v33);
  sub_10004D980();
  uint64_t v13 = sub_10004D8D0();
  v19(v6, v9);
  sub_100002388(&qword_100069E98);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100052BF0;
  uint64_t v15 = v21;
  *(void *)(v14 + 32) = v22;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v13;
  uint64_t v16 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1000393E8(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057490, (void (*)(void))sub_10002F768, (void (*)(uint64_t))sub_10002EE28);
}

uint64_t sub_100039430()
{
  uint64_t v0 = sub_10004D8F0();
  uint64_t v1 = sub_10004D8F0();
  uint64_t v2 = sub_10004D8F0();
  uint64_t v3 = sub_10004D8F0();
  sub_100002388(&qword_100069D50);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100055CE0;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10004D8E0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100039514(uint64_t a1)
{
  uint64_t v2 = sub_10004D8B0();
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  __chkstk_darwin(v2);
  uint64_t v23 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100002388(&qword_100069E70);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100069E78);
  __chkstk_darwin(v6);
  sub_100024184();
  sub_10004D970();
  v29._countAndFlagsBits = 0x206E727554;
  v29._object = (void *)0xE500000000000000;
  sub_10004D960(v29);
  swift_getKeyPath();
  unint64_t v27 = sub_10003E840();
  v18[1] = a1;
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v30._object = (void *)0x8000000100051680;
  v30._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10004D960(v30);
  sub_10004D980();
  uint64_t v22 = sub_10004D8D0();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  uint64_t v7 = v26;
  v19(v5, v26);
  sub_10004D970();
  v31._countAndFlagsBits = 0xD000000000000021;
  v31._object = (void *)0x80000001000516A0;
  sub_10004D960(v31);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v32._countAndFlagsBits = 46;
  v32._object = (void *)0xE100000000000000;
  sub_10004D960(v32);
  sub_10004D980();
  uint64_t v21 = sub_10004D8D0();
  uint64_t v8 = v19;
  v19(v5, v7);
  sub_10004D970();
  v33._countAndFlagsBits = 0xD000000000000024;
  v33._object = (void *)0x80000001000516D0;
  sub_10004D960(v33);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v34._countAndFlagsBits = 46;
  v34._object = (void *)0xE100000000000000;
  sub_10004D960(v34);
  sub_10004D980();
  uint64_t v20 = sub_10004D8D0();
  uint64_t v9 = v26;
  v8(v5, v26);
  sub_10004D970();
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_10004D960(v35);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v36._countAndFlagsBits = 0xD00000000000001ELL;
  v36._object = (void *)0x8000000100051700;
  sub_10004D960(v36);
  uint64_t v10 = v23;
  uint64_t v11 = v24;
  uint64_t v12 = v25;
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v25);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v12);
  v37._countAndFlagsBits = 46;
  v37._object = (void *)0xE100000000000000;
  sub_10004D960(v37);
  sub_10004D980();
  uint64_t v13 = sub_10004D8D0();
  v8(v5, v9);
  sub_100002388(&qword_100069E80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100055CE0;
  uint64_t v15 = v21;
  *(void *)(v14 + 32) = v22;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v20;
  *(void *)(v14 + 56) = v13;
  uint64_t v16 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_100039B00(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057468, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_100024184);
}

uint64_t sub_100039B48(uint64_t a1)
{
  uint64_t v2 = sub_10004D8B0();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2);
  uint64_t v24 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100002388(&qword_100069E58);
  uint64_t v29 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100069E60);
  __chkstk_darwin(v6);
  sub_100026924();
  sub_10004D970();
  v30._countAndFlagsBits = 0x206E727554;
  v30._object = (void *)0xE500000000000000;
  sub_10004D960(v30);
  swift_getKeyPath();
  unint64_t v28 = sub_10003E840();
  uint64_t v20 = a1;
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v31._object = (void *)0x8000000100051600;
  v31._countAndFlagsBits = 0xD000000000000014;
  sub_10004D960(v31);
  sub_10004D980();
  uint64_t v23 = sub_10004D8D0();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v29 + 8);
  v29 += 8;
  uint64_t v7 = v27;
  v19(v5, v27);
  sub_10004D970();
  v32._countAndFlagsBits = 0xD00000000000001ALL;
  v32._object = (void *)0x8000000100051620;
  sub_10004D960(v32);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v33._countAndFlagsBits = 46;
  v33._object = (void *)0xE100000000000000;
  sub_10004D960(v33);
  sub_10004D980();
  uint64_t v22 = sub_10004D8D0();
  uint64_t v8 = v19;
  v19(v5, v7);
  sub_10004D970();
  v34._countAndFlagsBits = 0xD00000000000001DLL;
  v34._object = (void *)0x8000000100051640;
  sub_10004D960(v34);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v35._countAndFlagsBits = 46;
  v35._object = (void *)0xE100000000000000;
  sub_10004D960(v35);
  sub_10004D980();
  uint64_t v21 = sub_10004D8D0();
  uint64_t v9 = v27;
  v8(v5, v27);
  sub_10004D970();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10004D960(v36);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v37._countAndFlagsBits = 0xD000000000000017;
  v37._object = (void *)0x8000000100051660;
  sub_10004D960(v37);
  uint64_t v10 = v24;
  uint64_t v11 = v25;
  uint64_t v12 = v26;
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v24, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v26);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v12);
  v38._countAndFlagsBits = 46;
  v38._object = (void *)0xE100000000000000;
  sub_10004D960(v38);
  sub_10004D980();
  uint64_t v13 = sub_10004D8D0();
  v8(v5, v9);
  sub_100002388(&qword_100069E68);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100055CE0;
  uint64_t v15 = v22;
  *(void *)(v14 + 32) = v23;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v21;
  *(void *)(v14 + 56) = v13;
  uint64_t v16 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_10003A138(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057440, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_100026924);
}

uint64_t sub_10003A180()
{
  uint64_t v0 = sub_10004D8F0();
  uint64_t v1 = sub_10004D8F0();
  uint64_t v2 = sub_10004D8F0();
  uint64_t v3 = sub_10004D8F0();
  sub_100002388(&qword_100069D50);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100055CE0;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10004D8E0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10003A248(uint64_t a1)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100002388(&qword_100069E40);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v20 = v1;
  uint64_t v21 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100069E48);
  __chkstk_darwin(v5);
  sub_100003CD0();
  sub_10004D970();
  v23._countAndFlagsBits = 0x206E727554;
  v23._object = (void *)0xE500000000000000;
  sub_10004D960(v23);
  swift_getKeyPath();
  unint64_t v15 = sub_10003E840();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v24._countAndFlagsBits = 0xD000000000000021;
  v24._object = (void *)0x8000000100051550;
  sub_10004D960(v24);
  sub_10004D980();
  uint64_t v19 = sub_10004D8D0();
  uint64_t v6 = v20;
  uint64_t v7 = v21 + 8;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v21 + 8);
  v16(v4, v20);
  uint64_t v21 = v7;
  sub_10004D970();
  v25._countAndFlagsBits = 0xD000000000000027;
  v25._object = (void *)0x8000000100051580;
  sub_10004D960(v25);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v26._countAndFlagsBits = 46;
  v26._object = (void *)0xE100000000000000;
  sub_10004D960(v26);
  sub_10004D980();
  uint64_t v18 = sub_10004D8D0();
  uint64_t v8 = v16;
  v16(v4, v6);
  sub_10004D970();
  v27._countAndFlagsBits = 0xD000000000000024;
  v27._object = (void *)0x80000001000515B0;
  sub_10004D960(v27);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v28._countAndFlagsBits = 46;
  v28._object = (void *)0xE100000000000000;
  sub_10004D960(v28);
  sub_10004D980();
  uint64_t v17 = sub_10004D8D0();
  uint64_t v9 = v20;
  v8(v4, v20);
  sub_10004D970();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_10004D960(v29);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v30._object = (void *)0x80000001000515E0;
  v30._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10004D960(v30);
  sub_10004D980();
  uint64_t v10 = sub_10004D8D0();
  v8(v4, v9);
  sub_100002388(&qword_100069E50);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100055CE0;
  uint64_t v12 = v18;
  *(void *)(v11 + 32) = v19;
  *(void *)(v11 + 40) = v12;
  *(void *)(v11 + 48) = v17;
  *(void *)(v11 + 56) = v10;
  uint64_t v13 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10003A740(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057418, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_100003CD0);
}

uint64_t sub_10003A788(uint64_t a1)
{
  uint64_t v19 = sub_100002388(&qword_100069E28);
  uint64_t v21 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002388(&qword_100069E30);
  __chkstk_darwin(v4);
  sub_100005D38();
  sub_10004D970();
  v22._countAndFlagsBits = 0x206E727554;
  v22._object = (void *)0xE500000000000000;
  sub_10004D960(v22);
  swift_getKeyPath();
  unint64_t v20 = sub_10003E840();
  v13[1] = a1;
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v23._object = (void *)0x80000001000514C0;
  uint64_t v17 = (void *)0x80000001000514C0;
  v23._countAndFlagsBits = 0xD000000000000021;
  sub_10004D960(v23);
  sub_10004D980();
  uint64_t v18 = sub_10004D8D0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v21 + 8);
  v21 += 8;
  uint64_t v5 = v19;
  v14(v3, v19);
  sub_10004D970();
  v24._countAndFlagsBits = 0xD000000000000027;
  v24._object = (void *)0x80000001000514F0;
  sub_10004D960(v24);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v25._countAndFlagsBits = 46;
  v25._object = (void *)0xE100000000000000;
  sub_10004D960(v25);
  sub_10004D980();
  uint64_t v16 = sub_10004D8D0();
  uint64_t v6 = v14;
  v14(v3, v5);
  sub_10004D970();
  v26._countAndFlagsBits = 0xD00000000000002ALL;
  v26._object = (void *)0x8000000100051520;
  sub_10004D960(v26);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v27._countAndFlagsBits = 46;
  v27._object = (void *)0xE100000000000000;
  sub_10004D960(v27);
  sub_10004D980();
  uint64_t v15 = sub_10004D8D0();
  uint64_t v7 = v19;
  v6(v3, v19);
  sub_10004D970();
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_10004D960(v28);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v29._countAndFlagsBits = 0xD000000000000021;
  v29._object = v17;
  sub_10004D960(v29);
  sub_10004D980();
  uint64_t v8 = sub_10004D8D0();
  v6(v3, v7);
  sub_100002388(&qword_100069E38);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100055CE0;
  uint64_t v10 = v16;
  *(void *)(v9 + 32) = v18;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + 56) = v8;
  uint64_t v11 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10003AC80(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_1000573F0, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_100005D38);
}

uint64_t sub_10003ACC8(uint64_t a1)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_100002388(&qword_100069E10);
  uint64_t v36 = *(void *)(v1 - 8);
  uint64_t v37 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004D8B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002388(&qword_100069E18);
  __chkstk_darwin(v8);
  sub_100014CDC();
  sub_10004D970();
  v38._countAndFlagsBits = 0x206E727554;
  v38._object = (void *)0xE500000000000000;
  sub_10004D960(v38);
  swift_getKeyPath();
  unint64_t v22 = sub_10003E840();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v39._object = (void *)0x8000000100051460;
  Swift::String v32 = (void *)0x8000000100051460;
  v39._countAndFlagsBits = 0xD000000000000015;
  sub_10004D960(v39);
  unsigned int v31 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v9 = *(void (**)(void))(v5 + 104);
  uint64_t v29 = v5 + 104;
  Swift::String v30 = (void (*)(char *, void, uint64_t))v9;
  Swift::String v25 = v7;
  uint64_t v26 = v4;
  v9(v7);
  sub_10004D940();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v27 = v5 + 8;
  Swift::String v28 = v10;
  v10(v7, v4);
  v40._countAndFlagsBits = 46;
  v40._object = (void *)0xE100000000000000;
  sub_10004D960(v40);
  sub_10004D980();
  uint64_t v11 = sub_10004D8D0();
  uint64_t v12 = v37;
  uint64_t v13 = *(void (**)(char *, uint64_t))(v36 + 8);
  v36 += 8;
  uint64_t v33 = v11;
  Swift::String v34 = v13;
  v13(v3, v37);
  sub_10004D970();
  v41._countAndFlagsBits = 0xD000000000000017;
  v41._object = (void *)0x8000000100051480;
  sub_10004D960(v41);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v42._countAndFlagsBits = 46;
  v42._object = (void *)0xE100000000000000;
  sub_10004D960(v42);
  sub_10004D980();
  uint64_t v24 = sub_10004D8D0();
  v34(v3, v12);
  sub_10004D970();
  v43._countAndFlagsBits = 0xD00000000000001ALL;
  v43._object = (void *)0x80000001000514A0;
  sub_10004D960(v43);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v44._countAndFlagsBits = 46;
  v44._object = (void *)0xE100000000000000;
  sub_10004D960(v44);
  sub_10004D980();
  uint64_t v23 = sub_10004D8D0();
  uint64_t v14 = v34;
  v34(v3, v37);
  sub_10004D970();
  v45._countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  sub_10004D960(v45);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v46._countAndFlagsBits = 0xD000000000000015;
  v46._object = v32;
  sub_10004D960(v46);
  uint64_t v16 = v25;
  uint64_t v15 = v26;
  v30(v25, v31, v26);
  sub_10004D940();
  v28(v16, v15);
  v47._countAndFlagsBits = 46;
  v47._object = (void *)0xE100000000000000;
  sub_10004D960(v47);
  sub_10004D980();
  uint64_t v17 = sub_10004D8D0();
  v14(v3, v37);
  sub_100002388(&qword_100069E20);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100055CE0;
  uint64_t v19 = v24;
  *(void *)(v18 + 32) = v33;
  *(void *)(v18 + 40) = v19;
  *(void *)(v18 + 48) = v23;
  *(void *)(v18 + 56) = v17;
  uint64_t v20 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_10003B2E0(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_1000573C8, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_100014CDC);
}

uint64_t sub_10003B328(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v33 = sub_100002388(&qword_100069DF8);
  uint64_t v25 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10004D8B0();
  uint64_t v3 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100069E00);
  __chkstk_darwin(v6);
  sub_10003E630();
  sub_10004D970();
  v34._countAndFlagsBits = 0x206E727554;
  v34._object = (void *)0xE500000000000000;
  sub_10004D960(v34);
  swift_getKeyPath();
  v21[1] = sub_10003E840();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v35._countAndFlagsBits = 0xD000000000000016;
  v35._object = (void *)0x8000000100051400;
  sub_10004D960(v35);
  unsigned int v30 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v7 = v3;
  uint64_t v8 = *(void (**)(void))(v3 + 104);
  uint64_t v28 = v3 + 104;
  uint64_t v29 = (void (*)(char *, void, uint64_t))v8;
  uint64_t v24 = v5;
  uint64_t v9 = v32;
  v8(v5);
  sub_10004D940();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v26 = v7 + 8;
  uint64_t v27 = v10;
  v10(v5, v9);
  v36._countAndFlagsBits = 46;
  v36._object = (void *)0xE100000000000000;
  sub_10004D960(v36);
  sub_10004D980();
  uint64_t v31 = sub_10004D8D0();
  unint64_t v22 = *(void (**)(char *, uint64_t))(v25 + 8);
  uint64_t v11 = v33;
  v22(v2, v33);
  sub_10004D970();
  v37._countAndFlagsBits = 0xD00000000000001BLL;
  v37._object = (void *)0x8000000100051420;
  sub_10004D960(v37);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v38._countAndFlagsBits = 46;
  v38._object = (void *)0xE100000000000000;
  sub_10004D960(v38);
  sub_10004D980();
  uint64_t v25 = sub_10004D8D0();
  uint64_t v12 = v11;
  uint64_t v13 = v22;
  v22(v2, v12);
  sub_10004D970();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_10004D960(v39);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v40._object = (void *)0x8000000100051440;
  v40._countAndFlagsBits = 0xD000000000000013;
  sub_10004D960(v40);
  uint64_t v14 = v24;
  uint64_t v15 = v32;
  v29(v24, v30, v32);
  sub_10004D940();
  v27(v14, v15);
  v41._countAndFlagsBits = 46;
  v41._object = (void *)0xE100000000000000;
  sub_10004D960(v41);
  sub_10004D980();
  uint64_t v16 = sub_10004D8D0();
  v13(v2, v33);
  sub_100002388(&qword_100069E08);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100052BF0;
  uint64_t v18 = v25;
  *(void *)(v17 + 32) = v31;
  *(void *)(v17 + 40) = v18;
  *(void *)(v17 + 48) = v16;
  uint64_t v19 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_10003B880(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_1000573A0, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_10003E630);
}

uint64_t sub_10003B8C8(uint64_t a1)
{
  uint64_t v2 = sub_10004D8B0();
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  __chkstk_darwin(v2);
  uint64_t v23 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002388(&qword_100069DE0);
  v18[0] = v4;
  uint64_t v26 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002388(&qword_100069DE8);
  __chkstk_darwin(v7);
  sub_10002FC20();
  sub_10004D970();
  v27._countAndFlagsBits = 0xD000000000000020;
  v27._object = (void *)0x80000001000513B0;
  sub_10004D960(v27);
  swift_getKeyPath();
  v18[1] = sub_10003E840();
  uint64_t v20 = a1;
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_10004D960(v28);
  sub_10004D980();
  uint64_t v22 = sub_10004D8D0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v26 + 8);
  v26 += 8;
  v8(v6, v4);
  uint64_t v19 = v8;
  sub_10004D970();
  v29._object = (void *)0x80000001000513E0;
  v29._countAndFlagsBits = 0xD00000000000001DLL;
  sub_10004D960(v29);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10004D960(v30);
  sub_10004D980();
  uint64_t v21 = sub_10004D8D0();
  uint64_t v9 = v18[0];
  v8(v6, v18[0]);
  sub_10004D970();
  v31._countAndFlagsBits = 0x6E696C206E65704FLL;
  v31._object = (void *)0xEE00206E6920736BLL;
  sub_10004D960(v31);
  uint64_t v11 = v23;
  uint64_t v10 = v24;
  uint64_t v12 = v25;
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v25);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  sub_10004D960(v32);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10004D960(v33);
  sub_10004D980();
  uint64_t v13 = sub_10004D8D0();
  v19(v6, v9);
  sub_100002388(&qword_100069DF0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100052BF0;
  uint64_t v15 = v21;
  *(void *)(v14 + 32) = v22;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v13;
  uint64_t v16 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_10003BDD0(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057378, (void (*)(void))sub_10003E840, (void (*)(uint64_t))sub_10002FC20);
}

uint64_t sub_10003BE18()
{
  uint64_t v0 = sub_10004D8F0();
  uint64_t v1 = sub_10004D8F0();
  uint64_t v2 = sub_10004D8F0();
  uint64_t v3 = sub_10004D8F0();
  sub_100002388(&qword_100069D50);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100055CE0;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10004D8E0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10003BEF4(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_10004D8B0();
  uint64_t v22 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  __chkstk_darwin(v1);
  uint64_t v21 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100069DC0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002388(&qword_100069DC8);
  __chkstk_darwin(v7);
  sub_100017550();
  sub_10004D970();
  v26._countAndFlagsBits = 0xD000000000000020;
  v26._object = (void *)0x8000000100051340;
  sub_10004D960(v26);
  swift_getKeyPath();
  unint64_t v24 = sub_10001C6D4();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_10004D960(v27);
  sub_10004D980();
  uint64_t v20 = sub_10004D8D0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  v8(v6, v3);
  uint64_t v18 = v8;
  sub_10004D970();
  v28._countAndFlagsBits = 0xD000000000000018;
  v28._object = (void *)0x8000000100051370;
  sub_10004D960(v28);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_10004D960(v29);
  sub_10004D980();
  uint64_t v19 = sub_10004D8D0();
  uint64_t v9 = v3;
  v8(v6, v3);
  sub_10004D970();
  v30._countAndFlagsBits = 0x20656B614DLL;
  v30._object = (void *)0xE500000000000000;
  sub_10004D960(v30);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v31._object = (void *)0x8000000100051390;
  v31._countAndFlagsBits = 0xD000000000000015;
  sub_10004D960(v31);
  uint64_t v11 = v21;
  uint64_t v10 = v22;
  uint64_t v12 = v23;
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v23);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004D960(v32);
  sub_10004D980();
  uint64_t v13 = sub_10004D8D0();
  v18(v6, v9);
  sub_100002388(&qword_100069DD0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100052BF0;
  uint64_t v15 = v19;
  *(void *)(v14 + 32) = v20;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v13;
  uint64_t v16 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_10003C3D8(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057350, (void (*)(void))sub_10001C6D4, (void (*)(uint64_t))sub_100017550);
}

uint64_t sub_10003C424(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_10004D8B0();
  uint64_t v22 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  __chkstk_darwin(v1);
  uint64_t v21 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100069DA8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002388(&qword_100069DB0);
  __chkstk_darwin(v7);
  sub_1000195D8();
  sub_10004D970();
  v26._object = (void *)0x80000001000512C0;
  v26._countAndFlagsBits = 0xD000000000000020;
  sub_10004D960(v26);
  swift_getKeyPath();
  unint64_t v24 = sub_10001C6D4();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_10004D960(v27);
  sub_10004D980();
  uint64_t v20 = sub_10004D8D0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  v8(v6, v3);
  uint64_t v18 = v8;
  sub_10004D970();
  v28._object = (void *)0x80000001000512F0;
  v28._countAndFlagsBits = 0xD000000000000020;
  sub_10004D960(v28);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_10004D960(v29);
  sub_10004D980();
  uint64_t v19 = sub_10004D8D0();
  uint64_t v9 = v3;
  v8(v6, v3);
  sub_10004D970();
  v30._countAndFlagsBits = 0x20656B614DLL;
  v30._object = (void *)0xE500000000000000;
  sub_10004D960(v30);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v31._countAndFlagsBits = 0xD00000000000001DLL;
  v31._object = (void *)0x8000000100051320;
  sub_10004D960(v31);
  uint64_t v11 = v21;
  uint64_t v10 = v22;
  uint64_t v12 = v23;
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v23);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004D960(v32);
  sub_10004D980();
  uint64_t v13 = sub_10004D8D0();
  v18(v6, v9);
  sub_100002388(&qword_100069DB8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100052BF0;
  uint64_t v15 = v19;
  *(void *)(v14 + 32) = v20;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v13;
  uint64_t v16 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_10003C904(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057328, (void (*)(void))sub_10001C6D4, (void (*)(uint64_t))sub_1000195D8);
}

uint64_t sub_10003C94C()
{
  uint64_t v0 = sub_10004D8F0();
  uint64_t v1 = sub_10004D8F0();
  uint64_t v2 = sub_10004D8F0();
  uint64_t v3 = sub_10004D8F0();
  uint64_t v4 = sub_10004D8F0();
  sub_100002388(&qword_100069D50);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100057230;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_10004D8E0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10003CA3C(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_100002388(&qword_100069D90);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  uint64_t v30 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004D8B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002388(&qword_100069D98);
  __chkstk_darwin(v9);
  sub_100021CF4();
  sub_10004D970();
  v31._countAndFlagsBits = 0x20656B614DLL;
  v31._object = (void *)0xE500000000000000;
  sub_10004D960(v31);
  unsigned int v28 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  Swift::String v27 = *(void (**)(char *))(v6 + 104);
  v27(v8);
  sub_10004D940();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v25 = v6 + 8;
  Swift::String v26 = v10;
  v10(v8, v5);
  v32._countAndFlagsBits = 0xD00000000000001BLL;
  v32._object = (void *)0x8000000100051260;
  sub_10004D960(v32);
  swift_getKeyPath();
  unint64_t v23 = sub_1000228D8();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v33._countAndFlagsBits = 46;
  v33._object = (void *)0xE100000000000000;
  sub_10004D960(v33);
  sub_10004D980();
  uint64_t v11 = sub_10004D8D0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v30 + 8);
  v30 += 8;
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  v12(v4, v29);
  sub_10004D970();
  v34._countAndFlagsBits = 544503120;
  v34._object = (void *)0xE400000000000000;
  sub_10004D960(v34);
  ((void (*)(char *, void, uint64_t))v27)(v8, v28, v5);
  sub_10004D940();
  v26(v8, v5);
  v35._object = (void *)0x8000000100051280;
  v35._countAndFlagsBits = 0xD000000000000015;
  sub_10004D960(v35);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v36._countAndFlagsBits = 46;
  v36._object = (void *)0xE100000000000000;
  sub_10004D960(v36);
  sub_10004D980();
  uint64_t v20 = sub_10004D8D0();
  uint64_t v13 = v29;
  v22(v4, v29);
  sub_10004D970();
  v37._countAndFlagsBits = 544499027;
  v37._object = (void *)0xE400000000000000;
  sub_10004D960(v37);
  ((void (*)(char *, void, uint64_t))v27)(v8, v28, v5);
  sub_10004D940();
  v26(v8, v5);
  v38._countAndFlagsBits = 0xD000000000000016;
  v38._object = (void *)0x80000001000512A0;
  sub_10004D960(v38);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v39._countAndFlagsBits = 46;
  v39._object = (void *)0xE100000000000000;
  sub_10004D960(v39);
  sub_10004D980();
  uint64_t v14 = sub_10004D8D0();
  v22(v4, v13);
  sub_100002388(&qword_100069DA0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100052BF0;
  uint64_t v16 = v20;
  *(void *)(v15 + 32) = v21;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10003CFD8(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_100057300, (void (*)(void))sub_1000228D8, (void (*)(uint64_t))sub_100021CF4);
}

uint64_t sub_10003D020()
{
  return sub_10003D648();
}

uint64_t sub_10003D040(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_100002388(&qword_100069D78);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  uint64_t v30 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004D8B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002388(&qword_100069D80);
  __chkstk_darwin(v9);
  sub_10003E684();
  sub_10004D970();
  v31._countAndFlagsBits = 0x20656B614DLL;
  v31._object = (void *)0xE500000000000000;
  sub_10004D960(v31);
  unsigned int v28 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  Swift::String v27 = *(void (**)(char *))(v6 + 104);
  v27(v8);
  sub_10004D940();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v25 = v6 + 8;
  Swift::String v26 = v10;
  v10(v8, v5);
  v32._countAndFlagsBits = 0x207362617420;
  v32._object = (void *)0xE600000000000000;
  sub_10004D960(v32);
  swift_getKeyPath();
  unint64_t v23 = sub_10003E754();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v33._countAndFlagsBits = 46;
  v33._object = (void *)0xE100000000000000;
  sub_10004D960(v33);
  sub_10004D980();
  uint64_t v11 = sub_10004D8D0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v30 + 8);
  v30 += 8;
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  v12(v4, v29);
  sub_10004D970();
  v34._countAndFlagsBits = 0x742065676E616843;
  v34._object = (void *)0xEF206E6920736261;
  sub_10004D960(v34);
  ((void (*)(char *, void, uint64_t))v27)(v8, v28, v5);
  sub_10004D940();
  v26(v8, v5);
  v35._countAndFlagsBits = 544175136;
  v35._object = (void *)0xE400000000000000;
  sub_10004D960(v35);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v36._countAndFlagsBits = 46;
  v36._object = (void *)0xE100000000000000;
  sub_10004D960(v36);
  sub_10004D980();
  uint64_t v20 = sub_10004D8D0();
  uint64_t v13 = v29;
  v22(v4, v29);
  sub_10004D970();
  v37._countAndFlagsBits = 544499027;
  v37._object = (void *)0xE400000000000000;
  sub_10004D960(v37);
  ((void (*)(char *, void, uint64_t))v27)(v8, v28, v5);
  sub_10004D940();
  v26(v8, v5);
  v38._countAndFlagsBits = 0x6F74207362617420;
  v38._object = (void *)0xEC00000020656220;
  sub_10004D960(v38);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v39._countAndFlagsBits = 46;
  v39._object = (void *)0xE100000000000000;
  sub_10004D960(v39);
  sub_10004D980();
  uint64_t v14 = sub_10004D8D0();
  v22(v4, v13);
  sub_100002388(&qword_100069D88);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100052BF0;
  uint64_t v16 = v20;
  *(void *)(v15 + 32) = v21;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10003D5D4(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_1000572D8, (void (*)(void))sub_10003E754, (void (*)(uint64_t))sub_10003E684);
}

uint64_t sub_10003D61C()
{
  return sub_10003D648();
}

uint64_t sub_10003D648()
{
  uint64_t v0 = sub_10004D8F0();
  uint64_t v1 = sub_10004D8F0();
  sub_100002388(&qword_100069D50);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000546C0;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_10004D8E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_10003D6CC(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100002388(&qword_100069D58);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  uint64_t v24 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004D8B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002388(&qword_100069D60);
  __chkstk_darwin(v9);
  sub_100037668();
  sub_10004D970();
  v25._countAndFlagsBits = 0x206E65704FLL;
  v25._object = (void *)0xE500000000000000;
  sub_10004D960(v25);
  swift_getKeyPath();
  unint64_t v20 = sub_100036370();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v26._countAndFlagsBits = 544106784;
  v26._object = (void *)0xE400000000000000;
  sub_10004D960(v26);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v5);
  sub_10004D940();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v27._countAndFlagsBits = 0x6E69747465532029;
  v27._object = (void *)0xEA00000000007367;
  sub_10004D960(v27);
  sub_10004D980();
  uint64_t v22 = sub_10004D8D0();
  uint64_t v10 = v23;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v24 + 8);
  v24 += 8;
  v18(v4, v23);
  sub_10004D970();
  v28._countAndFlagsBits = 0x206E65704FLL;
  v28._object = (void *)0xE500000000000000;
  sub_10004D960(v28);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v29._countAndFlagsBits = 0x676E697474657320;
  v29._object = (void *)0xE800000000000000;
  sub_10004D960(v29);
  sub_10004D980();
  uint64_t v19 = sub_10004D8D0();
  uint64_t v11 = v18;
  v18(v4, v10);
  sub_10004D970();
  v30._countAndFlagsBits = 0x20656D20656B6154;
  v30._object = (void *)0xEB00000000206F74;
  sub_10004D960(v30);
  swift_getKeyPath();
  sub_10004D8A0();
  swift_release();
  sub_10004D950();
  swift_release();
  v31._countAndFlagsBits = 0x676E697474657320;
  v31._object = (void *)0xE800000000000000;
  sub_10004D960(v31);
  sub_10004D980();
  uint64_t v12 = sub_10004D8D0();
  v11(v4, v23);
  sub_100002388(&qword_100069D68);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100052BF0;
  uint64_t v14 = v19;
  *(void *)(v13 + 32) = v22;
  *(void *)(v13 + 40) = v14;
  *(void *)(v13 + 48) = v12;
  uint64_t v15 = sub_10004D8C0();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10003DBC4(uint64_t a1)
{
  return sub_10003DC0C(a1, (uint64_t)&unk_1000572B0, (void (*)(void))sub_100036370, (void (*)(uint64_t))sub_100037668);
}

uint64_t sub_10003DC0C(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_10004D930();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_10004D8A0();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_10004D920();
  uint64_t v11 = sub_10004D910();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100002388(&qword_100069D48);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100052C00;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_10004D900();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10003DD84()
{
  uint64_t v0 = sub_10004D8F0();
  uint64_t v1 = sub_10004D8F0();
  uint64_t v2 = sub_10004D8F0();
  uint64_t v3 = sub_10004D8F0();
  uint64_t v4 = sub_10004D8F0();
  sub_100002388(&qword_100069D50);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100057230;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_10004D8E0();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_10003DE90()
{
  qword_10006A960 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10003DEAC()
{
  if (qword_100068370 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for DeviceExpertAssistantProvider()
{
  return &type metadata for DeviceExpertAssistantProvider;
}

uint64_t sub_10003DF18()
{
  uint64_t v0 = sub_10004D9B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10002E5E0();
  uint64_t v38 = v4;
  sub_10002EE28();
  sub_10004D9C0();
  uint64_t v36 = sub_10004D9A0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v37 = sub_1000260A4();
  uint64_t v38 = v6;
  sub_100024184();
  sub_10004D9C0();
  uint64_t v35 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_10002883C();
  uint64_t v38 = v7;
  sub_100026924();
  sub_10004D9C0();
  uint64_t v34 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_10000825C();
  uint64_t v38 = v8;
  sub_100003CD0();
  sub_10004D9C0();
  uint64_t v33 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_100008988();
  uint64_t v38 = v9;
  sub_100005D38();
  sub_10004D9C0();
  uint64_t v32 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_100016CCC();
  uint64_t v38 = v10;
  sub_100014CDC();
  sub_10004D9C0();
  uint64_t v31 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_100041404();
  uint64_t v38 = v11;
  sub_10003E630();
  sub_10004D9C0();
  uint64_t v30 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_1000319A0();
  uint64_t v38 = v12;
  sub_10002FC20();
  sub_10004D9C0();
  uint64_t v13 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_10001D648();
  uint64_t v38 = v14;
  sub_100017550();
  sub_10004D9C0();
  uint64_t v15 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_10001DF90();
  uint64_t v38 = v16;
  sub_1000195D8();
  sub_10004D9C0();
  uint64_t v17 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_100022E98();
  uint64_t v38 = v18;
  sub_100021CF4();
  sub_10004D9C0();
  uint64_t v19 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_10004A258();
  uint64_t v38 = v20;
  sub_10003E684();
  sub_10004D9C0();
  uint64_t v21 = sub_10004D9A0();
  v5(v3, v0);
  uint64_t v37 = sub_100038958();
  sub_100037668();
  sub_10004D9C0();
  uint64_t v22 = sub_10004D9A0();
  v5(v3, v0);
  sub_100002388(&qword_100069D40);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100057240;
  uint64_t v24 = v35;
  *(void *)(v23 + 32) = v36;
  *(void *)(v23 + 40) = v24;
  uint64_t v25 = v33;
  *(void *)(v23 + 48) = v34;
  *(void *)(v23 + 56) = v25;
  uint64_t v26 = v31;
  *(void *)(v23 + 64) = v32;
  *(void *)(v23 + 72) = v26;
  *(void *)(v23 + 80) = v30;
  *(void *)(v23 + 88) = v13;
  *(void *)(v23 + 96) = v15;
  *(void *)(v23 + 104) = v17;
  *(void *)(v23 + 112) = v19;
  *(void *)(v23 + 120) = v21;
  *(void *)(v23 + 128) = v22;
  uint64_t v27 = sub_10004D990();
  swift_bridgeObjectRelease();
  return v27;
}

unint64_t sub_10003E630()
{
  unint64_t result = qword_100069D30;
  if (!qword_100069D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069D30);
  }
  return result;
}

unint64_t sub_10003E684()
{
  unint64_t result = qword_100069D38;
  if (!qword_100069D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069D38);
  }
  return result;
}

uint64_t sub_10003E6D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t sub_10003E714()
{
  return sub_10004D860();
}

unint64_t sub_10003E754()
{
  unint64_t result = qword_100069D70;
  if (!qword_100069D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069D70);
  }
  return result;
}

uint64_t sub_10003E7BC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t sub_10003E7FC()
{
  return sub_10004D860();
}

unint64_t sub_10003E840()
{
  unint64_t result = qword_100069DD8;
  if (!qword_100069DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069DD8);
  }
  return result;
}

uint64_t sub_10003E8C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t sub_10003E900()
{
  return sub_10004D860();
}

uint64_t sub_10003E938@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004D850();
  *a1 = v3;
  return result;
}

uint64_t sub_10003E974()
{
  return sub_10004D860();
}

ValueMetadata *type metadata accessor for AutoFillCreditCardControlToggle()
{
  return &type metadata for AutoFillCreditCardControlToggle;
}

uint64_t sub_10003E9C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003E9DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_100004D28();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  Swift::String v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  Swift::String v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  Swift::String v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_10003EF94()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_10003F0C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10003F200@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004DC80();
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t result = sub_10004E1B0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v9 & 1;
  *(void *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_10003F2DC()
{
  return sub_10000255C(&qword_100069EB0, &qword_100069EB8);
}

uint64_t sub_10003F318()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A968);
  sub_100008DDC(v10, (uint64_t)qword_10006A968);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_10003F600()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A980);
  sub_100008DDC(v0, (uint64_t)qword_10006A980);
  return sub_10004DC50();
}

uint64_t sub_10003F664()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A998);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A998);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10003F71C()
{
  uint64_t result = swift_getKeyPath();
  qword_10006A9B0 = result;
  return result;
}

uint64_t sub_10003F744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_100069FF8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_10006A000);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10003F908, 0, 0);
}

uint64_t sub_10003F908()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100040B38();
  *uint64_t v1 = v0;
  v1[1] = sub_10003F9DC;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10003FFD4, 0, &type metadata for LandscapeTabBarEntity, v2);
}

uint64_t sub_10003F9DC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003FAD8, 0, 0);
}

uint64_t sub_10003FAD8()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100068390 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006A9B0;
  *(void *)(v0 + 168) = qword_10006A9B0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_100069FD0, &qword_100069FD8);
  *uint64_t v3 = v0;
  v3[1] = sub_10003FC30;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10003FC30()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_10003FD84;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003FD84()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10003E630();
  sub_100040D4C();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10003FFD8()
{
  uint64_t v0 = sub_100002388(&qword_10006A008);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068390 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100040D4C();
  sub_10000255C(&qword_10006A010, &qword_10006A008);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100040140()
{
  if (qword_100068390 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000401A0()
{
  unint64_t result = qword_100069EC0;
  if (!qword_100069EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069EC0);
  }
  return result;
}

unint64_t sub_1000401F8()
{
  unint64_t result = qword_100069EC8;
  if (!qword_100069EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069EC8);
  }
  return result;
}

uint64_t sub_10004024C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100040280()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000402D0@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068380, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A980, a1);
}

uint64_t sub_100040308@<X0>(uint64_t a1@<X8>)
{
  if (qword_100068388 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A998);

  return sub_100009178(v3, a1);
}

uint64_t sub_100040384(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_10003F744(a1, v5, v4);
}

uint64_t sub_100040430@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100041404();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100040458()
{
  return 0xD000000000000026;
}

unint64_t sub_100040478()
{
  unint64_t result = qword_100069ED8;
  if (!qword_100069ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069ED8);
  }
  return result;
}

uint64_t sub_1000404D0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000404F0, 0, 0);
}

uint64_t sub_1000404F0()
{
  v0[3] = self;
  v0[4] = sub_10004E620();
  v0[5] = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100040598, v2, v1);
}

uint64_t sub_100040598()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = [v1 currentDevice];
  return _swift_task_switch(sub_100040620, 0, 0);
}

uint64_t sub_100040620()
{
  *(void *)(v0 + 56) = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_1000406AC, v2, v1);
}

uint64_t sub_1000406AC()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  *(void *)(v0 + 64) = [v1 userInterfaceIdiom];

  return _swift_task_switch(sub_10004072C, 0, 0);
}

uint64_t sub_10004072C()
{
  if (v0[8] == 1)
  {
    sub_10004D6B0();
    sub_10002398C();
    swift_allocError();
    sub_10004DA40();
    swift_willThrow();
  }
  else
  {
    uint64_t v2 = (unsigned __int8 *)v0[2];
    id v3 = [self safari_browserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:kShowTabBarDefaultsKey];

    unsigned __int8 *v2 = v4;
  }
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10004082C(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100009208;
  *(unsigned char *)(v4 + 64) = v3;
  return _swift_task_switch(sub_100041864, 0, 0);
}

uint64_t sub_1000408D8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100069FB8 + dword_100069FB8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

unint64_t sub_100040980()
{
  unint64_t result = qword_100069EE8;
  if (!qword_100069EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069EE8);
  }
  return result;
}

uint64_t sub_1000409D4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100040ED0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100040A88()
{
  unint64_t result = qword_100069EF8;
  if (!qword_100069EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069EF8);
  }
  return result;
}

unint64_t sub_100040AE0()
{
  unint64_t result = qword_100069F00;
  if (!qword_100069F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F00);
  }
  return result;
}

unint64_t sub_100040B38()
{
  unint64_t result = qword_100069F08[0];
  if (!qword_100069F08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100069F08);
  }
  return result;
}

uint64_t sub_100040B8C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100040ED0();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100040C40(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100040ED0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100040CF4()
{
  unint64_t result = qword_100069F20;
  if (!qword_100069F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F20);
  }
  return result;
}

unint64_t sub_100040D4C()
{
  unint64_t result = qword_100069F28;
  if (!qword_100069F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F28);
  }
  return result;
}

unint64_t sub_100040DA4()
{
  unint64_t result = qword_100069F30;
  if (!qword_100069F30)
  {
    sub_100002450(qword_100069F38);
    sub_100040D4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F30);
  }
  return result;
}

uint64_t sub_100040E18(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100040980();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100040ED0()
{
  unint64_t result = qword_100069F50;
  if (!qword_100069F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F50);
  }
  return result;
}

uint64_t sub_100040F24()
{
  uint64_t v0 = qword_100069EA0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100040F60()
{
  unint64_t result = qword_100069F58;
  if (!qword_100069F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F58);
  }
  return result;
}

unint64_t sub_100040FB8()
{
  unint64_t result = qword_100069F60;
  if (!qword_100069F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F60);
  }
  return result;
}

unint64_t sub_100041010()
{
  unint64_t result = qword_100069F68;
  if (!qword_100069F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F68);
  }
  return result;
}

unint64_t sub_100041068()
{
  unint64_t result = qword_100069F70;
  if (!qword_100069F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F70);
  }
  return result;
}

unint64_t sub_1000410C0()
{
  unint64_t result = qword_100069F78;
  if (!qword_100069F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F78);
  }
  return result;
}

unint64_t sub_100041118()
{
  unint64_t result = qword_100069F80;
  if (!qword_100069F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F80);
  }
  return result;
}

uint64_t sub_10004116C@<X0>(uint64_t *a1@<X8>)
{
  sub_10000BE40();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000411AC@<X0>(uint64_t a1@<X8>)
{
  return sub_100016A08(&qword_100068378, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A968, a1);
}

uint64_t sub_1000411E4()
{
  return sub_10000255C(&qword_100069F88, &qword_100069F90);
}

uint64_t sub_100041220(uint64_t a1)
{
  unint64_t v2 = sub_100040B38();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100041270()
{
  unint64_t result = qword_100069F98;
  if (!qword_100069F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069F98);
  }
  return result;
}

uint64_t sub_1000412C4(uint64_t a1)
{
  unint64_t v2 = sub_10000BE40();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100041310(uint64_t a1)
{
  unint64_t v2 = sub_100041118();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for LandscapeTabBarEntity.LandscapeTabBarEntityQuery()
{
  return &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery;
}

ValueMetadata *type metadata accessor for LandscapeTabBarEntity()
{
  return &type metadata for LandscapeTabBarEntity;
}

ValueMetadata *type metadata accessor for LandscapeTabBarEntity.UpdateIntent_value()
{
  return &type metadata for LandscapeTabBarEntity.UpdateIntent_value;
}

uint64_t sub_10004138C()
{
  return sub_10000255C(&qword_100069FA0, &qword_100069FA8);
}

uint64_t sub_1000413C8()
{
  return sub_10000255C(&qword_100069FB0, &qword_100069FA8);
}

uint64_t sub_100041404()
{
  uint64_t v0 = sub_100002388(&qword_100068710);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10004DB10();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_100068718);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10004DC80();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100002388(&qword_100069FE8);
  sub_10004DC50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10004D7D0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100040B38();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10004D880();
  sub_100002388(&qword_100068730);
  sub_10004DC50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10004E5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10004D890();
  return v24;
}

uint64_t sub_100041844(char a1)
{
  *(unsigned char *)(v1 + 64) = a1;
  return _swift_task_switch(sub_100041864, 0, 0);
}

uint64_t sub_100041864()
{
  v0[2] = self;
  v0[3] = sub_10004E620();
  v0[4] = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_10004190C, v2, v1);
}

uint64_t sub_10004190C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = [v1 currentDevice];
  return _swift_task_switch(sub_100041994, 0, 0);
}

uint64_t sub_100041994()
{
  *(void *)(v0 + 48) = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100041A20, v2, v1);
}

uint64_t sub_100041A20()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  *(void *)(v0 + 56) = [v1 userInterfaceIdiom];

  return _swift_task_switch(sub_100041AA0, 0, 0);
}

uint64_t sub_100041AA0()
{
  if (*(void *)(v0 + 56) == 1)
  {
    sub_10004D6B0();
    sub_10002398C();
    swift_allocError();
    sub_10004DA40();
    swift_willThrow();
  }
  else
  {
    uint64_t v2 = *(unsigned __int8 *)(v0 + 64);
    uint64_t v3 = self;
    id v4 = [v3 safari_browserDefaults];
    uint64_t v5 = kShowTabBarDefaultsKey;
    [v4 setBool:v2 forKey:kShowTabBarDefaultsKey];

    id v6 = [self defaultCenter];
    id v7 = [v3 safari_notificationNameForUserDefaultsKey:v5];
    [v6 postNotificationName:v7 object:0 userInfo:0 deliverImmediately:1];
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100041C18()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100041D58, 0, 0);
}

uint64_t sub_100041D58()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_100069EB8);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_100069FD0, &qword_100069FD8);
  uint64_t v4 = sub_10004DC40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100041F0C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t *sub_100041F18(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = (int *)type metadata accessor for BookmarkItem();
    uint64_t v10 = v9[6];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_10004DD10();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    uint64_t v31 = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    *(uint64_t *)((char *)v4 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
    uint64_t v15 = v9[8];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_10004DD70();
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
    swift_retain();
    v19(v16, v17, v18);
    uint64_t v20 = *(int *)(v31 + 20);
    uint64_t v21 = (uint64_t *)((char *)v4 + v20);
    uint64_t v22 = (uint64_t *)((char *)a2 + v20);
    sub_100002388(&qword_100068AA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_10004DE10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *uint64_t v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = *(int *)(v31 + 24);
    uint64_t v26 = (char *)v4 + v25;
    unsigned int v27 = (char *)a2 + v25;
    uint64_t v28 = *(void *)v27;
    char v29 = v27[8];
    sub_100009364(*(void *)v27, v29);
    *(void *)uint64_t v26 = v28;
    v26[8] = v29;
  }
  return v4;
}

uint64_t sub_100042154(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for BookmarkItem();
  uint64_t v5 = a1 + *(int *)(v4 + 24);
  uint64_t v6 = sub_10004DD10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  uint64_t v7 = a1 + *(int *)(v4 + 32);
  uint64_t v8 = sub_10004DD70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + *(int *)(a2 + 20);
  sub_100002388(&qword_100068AA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004DE10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = a1 + *(int *)(a2 + 24);
  uint64_t v12 = *(void *)v11;
  char v13 = *(unsigned char *)(v11 + 8);

  return sub_100009430(v12, v13);
}

void *sub_1000422B4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = (int *)type metadata accessor for BookmarkItem();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10004DD10();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *(void *)((char *)a1 + v7[7]) = *(void *)((char *)a2 + v7[7]);
  uint64_t v13 = v7[8];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_10004DD70();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_retain();
  v17(v14, v15, v16);
  uint64_t v18 = *(int *)(a3 + 20);
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  sub_100002388(&qword_100068AA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = sub_10004DE10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  }
  else
  {
    void *v19 = *v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = *(int *)(a3 + 24);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  char v26 = v24[8];
  sub_100009364(*(void *)v24, v26);
  *(void *)uint64_t v23 = v25;
  v23[8] = v26;
  return a1;
}

void *sub_10004249C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for BookmarkItem();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10004DD10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
  swift_retain();
  swift_release();
  uint64_t v11 = v6[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10004DD70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  if (a1 != a2)
  {
    uint64_t v15 = *(int *)(a3 + 20);
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    sub_1000027C0((uint64_t)a1 + v15, &qword_100068AA0);
    sub_100002388(&qword_100068AA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_10004DE10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = *(void *)v21;
  char v23 = v21[8];
  sub_100009364(*(void *)v21, v23);
  uint64_t v24 = *(void *)v20;
  char v25 = v20[8];
  *(void *)uint64_t v20 = v22;
  v20[8] = v23;
  sub_100009430(v24, v25);
  return a1;
}

_OWORD *sub_1000426AC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = (int *)type metadata accessor for BookmarkItem();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10004DD10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(void *)((char *)a1 + v7[7]) = *(void *)((char *)a2 + v7[7]);
  uint64_t v12 = v7[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_10004DD70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_100002388(&qword_100068AA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_10004DE10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v21 = *(int *)(a3 + 24);
  uint64_t v22 = (char *)a1 + v21;
  char v23 = (char *)a2 + v21;
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  return a1;
}

void *sub_100042854(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for BookmarkItem();
  uint64_t v9 = v8[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10004DD10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(void *)((char *)a1 + v8[7]) = *(void *)((char *)a2 + v8[7]);
  swift_release();
  uint64_t v13 = v8[8];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_10004DD70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  if (a1 != a2)
  {
    uint64_t v17 = *(int *)(a3 + 20);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    sub_1000027C0((uint64_t)a1 + v17, &qword_100068AA0);
    uint64_t v20 = sub_100002388(&qword_100068AA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_10004DE10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
  }
  uint64_t v22 = *(int *)(a3 + 24);
  char v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  LOBYTE(v24) = v24[8];
  uint64_t v26 = *(void *)v23;
  char v27 = v23[8];
  *(void *)char v23 = v25;
  v23[8] = (char)v24;
  sub_100009430(v26, v27);
  return a1;
}

uint64_t sub_100042A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100042A54);
}

uint64_t sub_100042A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for BookmarkItem();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_100002388(&qword_100068AB0);
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24) + 8);
      if (v14 > 1) {
        return (v14 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_100042B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100042B80);
}

uint64_t sub_100042B80(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for BookmarkItem();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100002388(&qword_100068AB0);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 24) + 8) = -(char)a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for ReadingListWidgetCell()
{
  uint64_t result = qword_10006A070;
  if (!qword_10006A070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100042CE4()
{
  type metadata accessor for BookmarkItem();
  if (v0 <= 0x3F)
  {
    sub_100042DB4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100042DB4()
{
  if (!qword_100068B28)
  {
    sub_10004DE10();
    unint64_t v0 = sub_10004DE20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100068B28);
    }
  }
}

uint64_t sub_100042E0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100042E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_10004DFD0();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_100002388(&qword_10006A0D0);
  return sub_100042E78(a1, (_OWORD *)(a2 + *(int *)(v4 + 44)));
}

uint64_t sub_100042E78@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v70 = sub_100002388(&qword_10006A0D8);
  __chkstk_darwin(v70);
  Swift::String v64 = (uint64_t *)((char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100002388(&qword_10006A0E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004E2A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100002388(&qword_10006A0E8);
  uint64_t v59 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  unint64_t v54 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100002388(&qword_10006A0F0);
  __chkstk_darwin(v56);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100002388(&qword_10006A0F8);
  __chkstk_darwin(v57);
  uint64_t v58 = (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100002388(&qword_10006A100);
  uint64_t v16 = __chkstk_darwin(v55);
  uint64_t v60 = (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v62 = (char *)&v53 - v18;
  uint64_t v65 = sub_100002388(&qword_10006A108);
  __chkstk_darwin(v65);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100002388(&qword_10006A110);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v68 = (uint64_t)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v67 = (char *)&v53 - v24;
  uint64_t v69 = sub_10004E010();
  sub_100043764((uint64_t)v84);
  char v87 = 1;
  *(_OWORD *)((char *)&v86[7] + 7) = v84[7];
  *(_OWORD *)((char *)&v86[6] + 7) = v84[6];
  *(_OWORD *)((char *)&v86[3] + 7) = v84[3];
  *(_OWORD *)((char *)&v86[2] + 7) = v84[2];
  *(_OWORD *)((char *)&v86[8] + 7) = v84[8];
  *(_DWORD *)((char *)&v86[9] + 7) = v85;
  *(_OWORD *)((char *)&v86[4] + 7) = v84[4];
  *(_OWORD *)((char *)&v86[5] + 7) = v84[5];
  *(_OWORD *)((char *)v86 + 7) = v84[0];
  *(_OWORD *)((char *)&v86[1] + 7) = v84[1];
  int v66 = 1;
  long long v94 = v86[6];
  long long v95 = v86[7];
  v96[0] = v86[8];
  *(_OWORD *)((char *)v96 + 11) = *(_OWORD *)((char *)&v86[8] + 11);
  long long v90 = v86[2];
  long long v91 = v86[3];
  long long v92 = v86[4];
  long long v93 = v86[5];
  long long v88 = v86[0];
  long long v89 = v86[1];
  uint64_t v25 = *(int *)(type metadata accessor for BookmarkItem() + 28);
  uint64_t v63 = a1;
  if (*(void *)(a1 + v25))
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v8);
    swift_retain();
    sub_10004E2E0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_10004E3C0();
    uint64_t v26 = sub_10004E3D0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 0, 1, v26);
    char v27 = v54;
    sub_10004E2D0();
    swift_release();
    sub_1000027C0((uint64_t)v7, &qword_10006A0E0);
    sub_10004E350();
    sub_10004DE60();
    uint64_t v28 = v59;
    uint64_t v29 = v61;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v14, v27, v61);
    uint64_t v30 = &v14[*(int *)(v56 + 36)];
    long long v31 = *(_OWORD *)&v83[47];
    *(_OWORD *)uint64_t v30 = *(_OWORD *)&v83[31];
    *((_OWORD *)v30 + 1) = v31;
    *((_OWORD *)v30 + 2) = *(_OWORD *)&v83[63];
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
    uint64_t v32 = v58;
    sub_10000274C((uint64_t)v14, v58, &qword_10006A0F0);
    *(_WORD *)(v32 + *(int *)(v57 + 36)) = 256;
    sub_1000027C0((uint64_t)v14, &qword_10006A0F0);
    uint64_t v33 = sub_10004E350();
    uint64_t v35 = v34;
    uint64_t v36 = (uint64_t)v62;
    uint64_t v37 = (uint64_t)&v62[*(int *)(v55 + 36)];
    sub_100043A1C(v63, v37);
    uint64_t v38 = (uint64_t *)(v37 + *(int *)(sub_100002388(&qword_10006A128) + 36));
    *uint64_t v38 = v33;
    v38[1] = v35;
    sub_1000127A8(v32, v36, &qword_10006A0F8);
    uint64_t v39 = v60;
    sub_10000274C(v36, v60, &qword_10006A100);
    uint64_t v40 = (uint64_t)v64;
    void *v64 = 0;
    *(unsigned char *)(v40 + 8) = 1;
    uint64_t v41 = sub_100002388(&qword_10006A130);
    sub_10000274C(v39, v40 + *(int *)(v41 + 48), &qword_10006A100);
    sub_1000027C0(v39, &qword_10006A100);
    sub_10000274C(v40, (uint64_t)v20, &qword_10006A0D8);
    swift_storeEnumTagMultiPayload();
    sub_10000255C(&qword_10006A118, &qword_10006A0D8);
    uint64_t v42 = (uint64_t)v67;
    sub_10004E0B0();
    swift_release();
    sub_1000027C0(v40, &qword_10006A0D8);
    sub_1000027C0(v36, &qword_10006A100);
  }
  else
  {
    *(void *)uint64_t v20 = 0;
    v20[8] = 0;
    swift_storeEnumTagMultiPayload();
    sub_10000255C(&qword_10006A118, &qword_10006A0D8);
    uint64_t v42 = (uint64_t)v67;
    sub_10004E0B0();
  }
  uint64_t v43 = v68;
  sub_10000274C(v42, v68, &qword_10006A110);
  uint64_t v44 = v69;
  long long v71 = (unint64_t)v69;
  char v45 = v66;
  LOBYTE(v72[0]) = v66;
  *(_OWORD *)((char *)&v72[7] + 1) = v95;
  *(_OWORD *)((char *)&v72[6] + 1) = v94;
  *(_OWORD *)((char *)&v72[8] + 1) = v96[0];
  *(_OWORD *)((char *)&v72[8] + 12) = *(_OWORD *)((char *)v96 + 11);
  *(_OWORD *)((char *)&v72[2] + 1) = v90;
  *(_OWORD *)((char *)&v72[3] + 1) = v91;
  *(_OWORD *)((char *)&v72[4] + 1) = v92;
  *(_OWORD *)((char *)&v72[5] + 1) = v93;
  *(_OWORD *)((char *)v72 + 1) = v88;
  *(_OWORD *)((char *)&v72[1] + 1) = v89;
  long long v46 = v72[8];
  a2[8] = v72[7];
  a2[9] = v46;
  *(_OWORD *)((char *)a2 + 156) = *(_OWORD *)((char *)&v72[8] + 12);
  long long v47 = v72[4];
  a2[4] = v72[3];
  a2[5] = v47;
  long long v48 = v72[6];
  a2[6] = v72[5];
  a2[7] = v48;
  long long v49 = v72[0];
  *a2 = v71;
  a2[1] = v49;
  long long v50 = v72[2];
  a2[2] = v72[1];
  a2[3] = v50;
  uint64_t v51 = sub_100002388(&qword_10006A120);
  sub_10000274C(v43, (uint64_t)a2 + *(int *)(v51 + 48), &qword_10006A110);
  sub_100012074((uint64_t)&v71);
  sub_1000027C0(v42, &qword_10006A110);
  sub_1000027C0(v43, &qword_10006A110);
  long long v81 = v94;
  long long v82 = v95;
  *(_OWORD *)long long v83 = v96[0];
  *(_OWORD *)&v83[11] = *(_OWORD *)((char *)v96 + 11);
  long long v77 = v90;
  long long v78 = v91;
  long long v79 = v92;
  long long v80 = v93;
  long long v75 = v88;
  v73[0] = v44;
  v73[1] = 0;
  char v74 = v45;
  long long v76 = v89;
  return sub_10001213C((uint64_t)v73);
}

uint64_t sub_100043764@<X0>(uint64_t a1@<X8>)
{
  sub_1000026F8();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_10004E1C0();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v25 = v7;
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_1000681E0 != -1) {
    swift_once();
  }
  sub_10004E150();
  uint64_t v23 = sub_10004E160();
  uint64_t v8 = swift_getKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10004E1C0();
  uint64_t v21 = v10;
  uint64_t v22 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = swift_getKeyPath();
  if (qword_1000681D8 != -1) {
    swift_once();
  }
  char v16 = v6 & 1;
  uint64_t v17 = qword_10006A588;
  uint64_t v18 = swift_getKeyPath();
  swift_retain();
  int v19 = sub_10004E0E0();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v25;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 2;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v23;
  *(void *)(a1 + 72) = v22;
  *(void *)(a1 + 80) = v21;
  *(unsigned char *)(a1 + 88) = v12 & 1;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = 1;
  *(unsigned char *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v18;
  *(void *)(a1 + 136) = v17;
  *(_DWORD *)(a1 + 144) = v19;
  sub_1000027B0(v2, v4, v16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000027B0(v22, v21, v12 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000281C(v22, v21, v12 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000281C(v2, v4, v16);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100043A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_10004DE90();
  __chkstk_darwin(v3 - 8);
  uint64_t v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10004DE10();
  uint64_t v5 = *(void *)(v39 - 8);
  uint64_t v6 = __chkstk_darwin(v39);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v41 = sub_10004E370();
  uint64_t v11 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v40 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100002388(&qword_10006A138);
  __chkstk_darwin(v38);
  uint64_t v14 = (double *)((char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1000681C8 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_10006A578;
  uint64_t v16 = a1 + *(int *)(type metadata accessor for ReadingListWidgetCell() + 24);
  uint64_t v17 = *(void *)v16;
  char v18 = *(unsigned char *)(v16 + 8);
  swift_retain();
  sub_100009364(v17, v18);
  sub_100013F74(v17, v18);
  sub_100009430(v17, v18);
  sub_10004DE30();
  double v19 = v44;
  uint64_t v20 = v46;
  uint64_t v21 = v47;
  uint64_t v22 = v48;
  uint64_t v23 = sub_10004E350();
  uint64_t v36 = v24;
  uint64_t v37 = v23;
  sub_100013EFC((uint64_t)v10);
  uint64_t v25 = v45;
  uint64_t v26 = v39;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v39);
  char v27 = sub_10004DE00();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  v28(v8, v26);
  v28(v10, v26);
  uint64_t v29 = (unsigned int *)&enum case for BlendMode.lighten(_:);
  if ((v27 & 1) == 0) {
    uint64_t v29 = (unsigned int *)&enum case for BlendMode.darken(_:);
  }
  long long v31 = v40;
  uint64_t v30 = v41;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v40, *v29, v41);
  double v32 = v44 * 0.5;
  uint64_t v33 = (uint64_t)v42;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v42, v31, v30);
  sub_1000440B0(v33, (uint64_t)v14 + *(int *)(v38 + 36));
  *uint64_t v14 = v32;
  v14[1] = v19;
  *((void *)v14 + 2) = v25;
  *((void *)v14 + 3) = v20;
  *((void *)v14 + 4) = v21;
  *((void *)v14 + 5) = v22;
  *((void *)v14 + 6) = v15;
  *((_WORD *)v14 + 28) = 256;
  uint64_t v34 = v36;
  *((void *)v14 + 8) = v37;
  *((void *)v14 + 9) = v34;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100044114(v33);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v31, v30);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1000127A8((uint64_t)v14, v43, &qword_10006A138);
}

uint64_t sub_100043E64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10004DD10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100002388(&qword_10006A0B0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for BookmarkItem();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(v11 + 24), v3);
  uint64_t v16 = v1;
  sub_100002388(&qword_10006A0B8);
  sub_10000255C(&qword_10006A0C0, &qword_10006A0B8);
  sub_10004E190();
  sub_10004E350();
  sub_10004DE60();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 16))(a1, v10, v7);
  uint64_t v12 = (_OWORD *)(a1 + *(int *)(sub_100002388(&qword_10006A0C8) + 36));
  long long v13 = v18;
  _OWORD *v12 = v17;
  v12[1] = v13;
  void v12[2] = v19;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000440A8@<X0>(uint64_t a1@<X8>)
{
  return sub_100042E28(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000440B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004DE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100044114(uint64_t a1)
{
  uint64_t v2 = sub_10004DE90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100044184()
{
  unint64_t result = qword_10006A140;
  if (!qword_10006A140)
  {
    sub_100002450(&qword_10006A0C8);
    sub_10000255C(&qword_10006A148, &qword_10006A0B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A140);
  }
  return result;
}

uint64_t destroy for ReadingListWidgetContentUnavailableView(uint64_t a1)
{
  return sub_100009430(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t _s21SafariWidgetExtension39ReadingListWidgetContentUnavailableViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_100009364(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t assignWithCopy for ReadingListWidgetContentUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_100009364(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100009430(v6, v7);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t initializeWithTake for ReadingListWidgetContentUnavailableView(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ReadingListWidgetContentUnavailableView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100009430(v6, v7);
  *(unsigned char *)(a1 + 9) = *((unsigned char *)a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidgetContentUnavailableView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ReadingListWidgetContentUnavailableView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReadingListWidgetContentUnavailableView()
{
  return &type metadata for ReadingListWidgetContentUnavailableView;
}

uint64_t sub_1000443E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100044404@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  char v5 = a2 & 1;
  uint64_t v28 = sub_10004E000();
  uint64_t v6 = sub_1000446CC();
  uint64_t v8 = v7;
  char v10 = v9;
  if (qword_1000681E0 != -1) {
    swift_once();
  }
  sub_10004E150();
  sub_10004E160();
  uint64_t v26 = sub_10004E1A0();
  uint64_t v27 = v11;
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_10000281C(v6, v8, v10 & 1);
  swift_bridgeObjectRelease();
  sub_100009364(a1, v5);
  char v16 = sub_100013A64(a1, v5);
  sub_100009430(a1, v5);
  uint64_t KeyPath = swift_getKeyPath();
  int v18 = sub_10004E0D0();
  char v19 = sub_10004E120();
  sub_100009364(a1, v5);
  char v20 = sub_100013A64(a1, v5);
  uint64_t result = sub_100009430(a1, v5);
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if ((v20 & 1) == 0) {
    uint64_t result = sub_10004DDF0();
  }
  *(void *)a3 = v28;
  *(void *)(a3 + 8) = 0x4010000000000000;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v26;
  *(void *)(a3 + 32) = v13;
  *(unsigned char *)(a3 + 40) = v15 & 1;
  *(void *)(a3 + 48) = v27;
  *(void *)(a3 + 56) = KeyPath;
  *(unsigned char *)(a3 + 64) = v16 & 1;
  *(_DWORD *)(a3 + 68) = v18;
  *(unsigned char *)(a3 + 72) = v19;
  *(void *)(a3 + 80) = v22;
  *(void *)(a3 + 88) = v23;
  *(void *)(a3 + 96) = v24;
  *(void *)(a3 + 104) = v25;
  *(unsigned char *)(a3 + 112) = v20 & 1;
  return result;
}

BOOL sub_1000445D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000445EC()
{
  Swift::UInt v1 = *v0;
  sub_10004E770();
  sub_10004E780(v1);
  return sub_10004E790();
}

void sub_100044634()
{
  sub_10004E780(*v0);
}

Swift::Int sub_100044660()
{
  Swift::UInt v1 = *v0;
  sub_10004E770();
  sub_10004E780(v1);
  return sub_10004E790();
}

uint64_t sub_1000446A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100044404(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_1000446CC()
{
  uint64_t v0 = sub_10004DDD0();
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v4 = (void (**)(char *, uint64_t))(v3 + 8);
  sub_10004DDC0();
  uint64_t v5 = sub_10004DDB0();
  uint64_t v7 = v6;
  (*v4)(v2, v0);
  v9[2] = v5;
  v9[3] = v7;
  sub_1000026F8();
  return sub_10004E1C0();
}

uint64_t sub_100044814@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004DF00();
  *a1 = result;
  return result;
}

uint64_t sub_100044840()
{
  return sub_10004DF10();
}

unsigned char *storeEnumTagSinglePayload for ReadingListWidgetContentUnavailableView.Variant(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100044934);
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

ValueMetadata *type metadata accessor for ReadingListWidgetContentUnavailableView.Variant()
{
  return &type metadata for ReadingListWidgetContentUnavailableView.Variant;
}

unint64_t sub_100044970()
{
  unint64_t result = qword_10006A150;
  if (!qword_10006A150)
  {
    sub_100002450(&qword_10006A158);
    sub_1000449EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A150);
  }
  return result;
}

unint64_t sub_1000449EC()
{
  unint64_t result = qword_10006A160;
  if (!qword_10006A160)
  {
    sub_100002450(&qword_10006A168);
    sub_10000255C(&qword_10006A170, &qword_10006A178);
    sub_10000255C(&qword_100068C30, &qword_100068C38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A160);
  }
  return result;
}

unint64_t sub_100044AB4()
{
  unint64_t result = qword_10006A180;
  if (!qword_10006A180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A180);
  }
  return result;
}

uint64_t sub_100044B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_10004DD70();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100044B7C(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_10004E750() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_10004E750() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = type metadata accessor for BookmarkItem();
  if ((sub_10004DCD0() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = *(void *)((char *)a2 + v7);
  if (!*(void *)((char *)a1 + v7))
  {
    if (!v8) {
      goto LABEL_15;
    }
    return 0;
  }
  if (!v8) {
    return 0;
  }
  swift_retain();
  swift_retain();
  char v9 = sub_10004E2B0();
  swift_release();
  swift_release();
  if ((v9 & 1) == 0) {
    return 0;
  }
LABEL_15:
  uint64_t v10 = *(int *)(v6 + 32);

  return static UUID.== infix(_:_:)((char *)a1 + v10, (char *)a2 + v10);
}

uint64_t sub_100044C90(int64_t a1)
{
  uint64_t v2 = sub_100002388(&qword_100068B70);
  __chkstk_darwin(v2 - 8);
  BOOL v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BookmarkItem();
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 < 1)
  {
LABEL_16:
    __break(1u);
  }
  else
  {
    uint64_t v22 = &_swiftEmptyArrayStorage;
    uint64_t result = sub_100037DB0(0, a1, 0);
    BOOL v9 = 0;
    uint64_t v10 = 1;
    uint64_t v11 = v22;
    v20[0] = 0x8000000100051980;
    v20[1] = 0x8000000100051910;
    int64_t v12 = a1;
    while (!v9)
    {
      sub_10004DD00();
      uint64_t v13 = sub_10004DD10();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v4, 1, v13);
      if (result == 1) {
        goto LABEL_18;
      }
      uint64_t v15 = sub_10004E290();
      sub_10004DD60();
      *(void *)uint64_t v8 = 0x1000000000000049;
      *((void *)v8 + 1) = v20[0];
      *((void *)v8 + 2) = 0x6F632E656C707061;
      *((void *)v8 + 3) = 0xE90000000000006DLL;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v8[*(int *)(v5 + 24)], v4, v13);
      *(void *)&v8[*(int *)(v5 + 28)] = v15;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v22 = v11;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_100037DB0(0, v11[2] + 1, 1);
        uint64_t v11 = v22;
      }
      unint64_t v18 = v11[2];
      unint64_t v17 = v11[3];
      if (v18 >= v17 >> 1)
      {
        sub_100037DB0(v17 > 1, v18 + 1, 1);
        uint64_t v11 = v22;
      }
      v11[2] = v18 + 1;
      uint64_t result = sub_10000D860((uint64_t)v8, (uint64_t)v11+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v18);
      BOOL v9 = v10 == a1;
      if (v10 == a1)
      {
        uint64_t v10 = 0;
      }
      else if (__OFADD__(v10++, 1))
      {
        __break(1u);
        goto LABEL_16;
      }
      if (!--v12) {
        return 0;
      }
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BookmarkItem()
{
  uint64_t result = qword_10006A1E0;
  if (!qword_10006A1E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_100045000(uint64_t *a1, uint64_t *a2, int *a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *BOOL v4 = *a2;
    BOOL v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_10004DD10();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v15 = (char *)v4 + v14;
    char v16 = (char *)a2 + v14;
    uint64_t v17 = sub_10004DD70();
    unint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_retain();
    v18(v15, v16, v17);
  }
  return v4;
}

uint64_t sub_100045164(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10004DD10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = sub_10004DD70();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *sub_100045238(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10004DD10();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_10004DD70();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_retain();
  v17(v14, v15, v16);
  return a1;
}

void *sub_10004534C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10004DD10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_10004DD70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_100045474(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10004DD10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10004DD70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

void *sub_100045550(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10004DD10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_release();
  uint64_t v12 = a3[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_10004DD70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_100045650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100045664);
}

uint64_t sub_100045664(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10004DD10();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_10004DD70();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100045790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000457A4);
}

uint64_t sub_1000457A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_10004DD10();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_10004DD70();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_1000458D0()
{
  uint64_t result = sub_10004DD10();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10004DD70();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ReadingListWidgetData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ReadingListWidgetData()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ReadingListWidgetData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ReadingListWidgetData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidgetData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReadingListWidgetData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReadingListWidgetData()
{
  return &type metadata for ReadingListWidgetData;
}

unint64_t sub_100045B04()
{
  unint64_t result = qword_10006A228;
  if (!qword_10006A228)
  {
    sub_10004DD70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A228);
  }
  return result;
}

uint64_t sub_100045B60()
{
  type metadata accessor for ReadingListWidgetWebBookmarksDataSource();
  v1[0] = 0xD000000000000011;
  v1[1] = 0x80000001000519D0;
  v1[2] = swift_initStaticObject();
  v1[3] = v1;
  sub_100045BDC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100045BDC()
{
  return sub_10004DE40();
}

void sub_100045C40()
{
  id v0 = [self safari_browserDefaults];
  [v0 safari_registerMobileSafariDefaults];
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100045CDC()
{
  unint64_t result = qword_10006A230;
  if (!qword_10006A230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A230);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariWidgets()
{
  return &type metadata for SafariWidgets;
}

uint64_t sub_100045D40()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100045D60()
{
  unint64_t result = qword_10006A240;
  if (!qword_10006A240)
  {
    sub_100002450(&qword_10006A248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A240);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenLinksInBackgroundControlToggle()
{
  return &type metadata for OpenLinksInBackgroundControlToggle;
}

uint64_t sub_100045DCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100045DE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v36 = sub_10004DDD0();
  uint64_t v32 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  unint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002388(&qword_100068458);
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002388(&qword_100068460);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002388(&qword_100068468);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100002388(&qword_100068470);
  uint64_t v37 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v29 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002388(&qword_100068478);
  sub_100031DE0();
  sub_10000255C(&qword_100068488, &qword_100068478);
  sub_10004E450();
  sub_10004DFF0();
  uint64_t v15 = sub_10000255C(&qword_100068490, &qword_100068458);
  sub_10004E070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  sub_10004DDC0();
  uint64_t v16 = sub_10004DDB0();
  unint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v2, v36);
  uint64_t v39 = v16;
  uint64_t v40 = v18;
  uint64_t v43 = v3;
  uint64_t v44 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_1000026F8();
  uint64_t v21 = v30;
  sub_10004E030();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  uint64_t v39 = v21;
  uint64_t v40 = &type metadata for String;
  uint64_t v41 = OpaqueTypeConformance2;
  unint64_t v42 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v29;
  uint64_t v24 = v33;
  sub_10004E0A0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v24);
  uint64_t v39 = v24;
  uint64_t v40 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  sub_10004E040();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v23, v25);
}

uint64_t sub_10004639C()
{
  uint64_t v0 = sub_10004DDD0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v4 = sub_10004DDB0();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8[0] = v4;
  v8[1] = v6;
  sub_1000026F8();
  return sub_10004E300();
}

uint64_t sub_1000464CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004DDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DDC0();
  uint64_t v6 = sub_10004DDB0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13[0] = v6;
  v13[1] = v8;
  sub_1000026F8();
  uint64_t result = sub_10004E1C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10004662C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6D6F74746F62;
  }
  else {
    uint64_t v3 = 7368564;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6D6F74746F62;
  }
  else {
    uint64_t v5 = 7368564;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10004E750();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1000466C8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x54746361706D6F63;
  }
  else {
    uint64_t v3 = 0x6574617261706573;
  }
  if (v2) {
    unint64_t v4 = 0xEE00726142626154;
  }
  else {
    unint64_t v4 = 0xED00007261426261;
  }
  if (a2) {
    uint64_t v5 = 0x54746361706D6F63;
  }
  else {
    uint64_t v5 = 0x6574617261706573;
  }
  if (a2) {
    unint64_t v6 = 0xED00007261426261;
  }
  else {
    unint64_t v6 = 0xEE00726142626154;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10004E750();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100046788(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x796C6C61756E616DLL;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x796C6C61756E616DLL;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x796144656E6FLL;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6B656557656E6FLL;
      break;
    case 3:
      uint64_t v5 = 0x68746E6F4D656E6FLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE800000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x796144656E6FLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x6B656557656E6FLL;
      goto LABEL_9;
    case 3:
      if (v5 == 0x68746E6F4D656E6FLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_10004E750();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100046908()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, qword_10006A9B8);
  sub_100008DDC(v10, (uint64_t)qword_10006A9B8);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t sub_100046BF0()
{
  uint64_t v0 = sub_10004DC80();
  sub_100008E14(v0, qword_10006A9D0);
  sub_100008DDC(v0, (uint64_t)qword_10006A9D0);
  return sub_10004DC50();
}

uint64_t sub_100046C54()
{
  uint64_t v0 = sub_100002388(&qword_1000687A0);
  sub_100008E14(v0, qword_10006A9E8);
  uint64_t v1 = sub_100008DDC(v0, (uint64_t)qword_10006A9E8);
  sub_10004D9D0();
  uint64_t v2 = sub_10004D9E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100046D0C()
{
  uint64_t result = swift_getKeyPath();
  qword_10006AA00 = result;
  return result;
}

uint64_t sub_100046D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100002388(&qword_100068770);
  v3[9] = swift_task_alloc();
  sub_100002388(&qword_100068778);
  v3[10] = swift_task_alloc();
  sub_100002388(&qword_10006A400);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_10004D7D0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100002388(&qword_10006A408);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100046EF8, 0, 0);
}

uint64_t sub_100046EF8()
{
  sub_10004D850();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100049460();
  *uint64_t v1 = v0;
  v1[1] = sub_100046FCC;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_1000475C4, 0, &type metadata for TabLayoutEntity, v2);
}

uint64_t sub_100046FCC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000470C8, 0, 0);
}

uint64_t sub_1000470C8()
{
  sub_10004D850();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_10004D850();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000683B0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006AA00;
  *(void *)(v0 + 168) = qword_10006AA00;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000255C(&qword_10006A3D8, &qword_10006A3E0);
  *uint64_t v3 = v0;
  v3[1] = sub_100047220;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for TabLayoutConfigurationType, v4);
}

uint64_t sub_100047220()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000046C0;
  }
  else {
    uint64_t v2 = sub_100047374;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100047374()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_10004D850();
  uint64_t v7 = sub_10004DBC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_10004DC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10003E684();
  sub_100049510();
  sub_10004D7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_10004D7C0();
  sub_10004D7E0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000475C8()
{
  uint64_t v0 = sub_100002388(&qword_10006A410);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000683B0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004DA60();
  swift_release();
  sub_100049510();
  sub_10000255C(&qword_10006A418, &qword_10006A410);
  sub_10004DA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100047730()
{
  if (qword_1000683B0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_10004778C@<X0>(uint64_t a1@<X8>)
{
  return sub_100049DA8(&qword_1000683A0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006A9D0, a1);
}

uint64_t sub_1000477C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000683A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100002388(&qword_1000687A0);
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)qword_10006A9E8);

  return sub_100009178(v3, a1);
}

uint64_t sub_100047840(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009208;
  return sub_100046D34(a1, v5, v4);
}

uint64_t sub_1000478EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004A258();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100047914()
{
  return 0xD000000000000020;
}

uint64_t sub_100047930(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100047950, 0, 0);
}

uint64_t sub_100047950()
{
  v0[3] = self;
  v0[4] = sub_10004E620();
  v0[5] = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_1000479F8, v2, v1);
}

uint64_t sub_1000479F8()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = [v1 currentDevice];
  return _swift_task_switch(sub_100047A80, 0, 0);
}

uint64_t sub_100047A80()
{
  *(void *)(v0 + 56) = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100047B0C, v2, v1);
}

uint64_t sub_100047B0C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  *(void *)(v0 + 64) = [v1 userInterfaceIdiom];

  return _swift_task_switch(sub_100047B8C, 0, 0);
}

uint64_t sub_100047B8C()
{
  if (v0[8])
  {
    uint64_t v1 = (unsigned char *)v0[2];
    uint64_t v2 = (void *)SFEnableStandaloneTabBarKey;
    uint64_t v3 = self;
    id v4 = v2;
    id v5 = [v3 safari_browserDefaults];
    unsigned __int8 v6 = [v5 BOOLForKey:v4];

    *uint64_t v1 = v6 ^ 1;
  }
  else
  {
    sub_10004D6B0();
    sub_10002398C();
    swift_allocError();
    sub_10004DA40();
    swift_willThrow();
  }
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100047CAC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 64) = *a2;
  return _swift_task_switch(sub_100047CD0, 0, 0);
}

uint64_t sub_100047CD0()
{
  v0[2] = self;
  v0[3] = sub_10004E620();
  v0[4] = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100047D78, v2, v1);
}

uint64_t sub_100047D78()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = [v1 currentDevice];
  return _swift_task_switch(sub_100047E00, 0, 0);
}

uint64_t sub_100047E00()
{
  *(void *)(v0 + 48) = sub_10004E610();
  uint64_t v2 = sub_10004E600();
  return _swift_task_switch(sub_100047E8C, v2, v1);
}

uint64_t sub_100047E8C()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  *(void *)(v0 + 56) = [v1 userInterfaceIdiom];

  return _swift_task_switch(sub_100047F0C, 0, 0);
}

uint64_t sub_100047F0C()
{
  if (*(void *)(v0 + 56))
  {
    uint64_t v1 = (void *)SFEnableStandaloneTabBarKey;
    if (*(unsigned char *)(v0 + 64)) {
      char v2 = sub_10004E750();
    }
    else {
      char v2 = 1;
    }
    id v4 = v1;
    swift_bridgeObjectRelease();
    id v5 = self;
    id v6 = [v5 safari_browserDefaults];
    [v6 setBool:v2 & 1 forKey:v4];

    id v7 = [self defaultCenter];
    id v8 = [v5 safari_notificationNameForUserDefaultsKey:v4];

    [v7 postNotificationName:v8 object:0 userInfo:0 deliverImmediately:1];
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_10004D6B0();
    sub_10002398C();
    swift_allocError();
    sub_10004DA40();
    swift_willThrow();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v3();
}

uint64_t sub_100048114(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  id v4 = (uint64_t (__cdecl *)())((char *)&dword_10006A3C0 + dword_10006A3C0);
  char v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000091E0;
  return v4();
}

uint64_t sub_1000481B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000495E0();
  *id v4 = v2;
  v4[1] = sub_1000050E4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100048268(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000495E0();
  void *v5 = v2;
  v5[1] = sub_1000053B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10004831C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000495E0();
  *id v4 = v2;
  v4[1] = sub_1000091E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

uint64_t sub_1000483CC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100049358();
  void *v5 = v2;
  v5[1] = sub_100005704;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100048480()
{
  uint64_t v0 = qword_10006A250;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000484B8@<X0>(uint64_t *a1@<X8>)
{
  sub_10002B808();
  uint64_t result = sub_10004D800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000484F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100049DA8(&qword_100068398, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006A9B8, a1);
}

uint64_t sub_100048530(uint64_t a1)
{
  unint64_t v2 = sub_100049460();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10004857C(uint64_t a1)
{
  unint64_t v2 = sub_10002B808();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000485C8(uint64_t a1)
{
  unint64_t v2 = sub_10004979C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100048614()
{
  uint64_t v0 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004DC60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DD90();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004E550();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004DC80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004DBF0();
  sub_100008E14(v10, static TabLayoutConfigurationType.typeDisplayRepresentation);
  sub_100008DDC(v10, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004DCA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004DBE0();
}

uint64_t TabLayoutConfigurationType.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_1000683B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10004DBF0();

  return sub_100008DDC(v0, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
}

uint64_t static TabLayoutConfigurationType.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000683B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004DBF0();
  uint64_t v3 = sub_100008DDC(v2, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t TabLayoutConfigurationType.rawValue.getter(char a1)
{
  if (a1) {
    return 0x54746361706D6F63;
  }
  else {
    return 0x6574617261706573;
  }
}

unint64_t sub_100048A48()
{
  uint64_t v0 = sub_100002388(&qword_1000691C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v38 = (char *)v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v2 - 8);
  uint64_t v37 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10004DC60();
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DD90();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004E550();
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10004DC80();
  uint64_t v28 = v13;
  uint64_t v40 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_100002388(&qword_10006A420);
  uint64_t v14 = (int *)(sub_100002388(&qword_1000692B0) - 8);
  uint64_t v15 = *(void *)v14;
  uint64_t v35 = *(void *)(*(void *)v14 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v36 = v17;
  *(_OWORD *)(v17 + 16) = xmmword_1000546C0;
  unint64_t v18 = v17 + v16;
  unint64_t v34 = v17 + v16 + v14[14];
  *(unsigned char *)(v17 + v16) = 0;
  v27[0] = v12;
  sub_10004E500();
  v27[1] = v9;
  sub_10004DD80();
  unsigned int v31 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v19 = *(void (**)(void))(v4 + 104);
  uint64_t v32 = v4 + 104;
  uint64_t v33 = (void (*)(char *, void, uint64_t))v19;
  v19(v6);
  unint64_t v30 = 0x800000010004F0E0;
  unint64_t v20 = v6;
  sub_10004DCA0();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56);
  v40 += 56;
  uint64_t v29 = v21;
  uint64_t v22 = v37;
  v21(v37, 1, 1, v13);
  uint64_t v23 = sub_10004DA80();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  uint64_t v25 = v38;
  v24(v38, 1, 1, v23);
  sub_10004DAB0();
  *(unsigned char *)(v18 + v35) = 1;
  sub_10004E500();
  sub_10004DD80();
  v33(v20, v31, v39);
  sub_10004DCA0();
  v29(v22, 1, 1, v28);
  v24(v25, 1, 1, v23);
  sub_10004DAB0();
  unint64_t result = sub_10001B138(v36);
  static TabLayoutConfigurationType.caseDisplayRepresentations = result;
  return result;
}

uint64_t *TabLayoutConfigurationType.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_1000683C0 != -1) {
    swift_once();
  }
  return &static TabLayoutConfigurationType.caseDisplayRepresentations;
}

uint64_t static TabLayoutConfigurationType.caseDisplayRepresentations.getter()
{
  if (qword_1000683C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static TabLayoutConfigurationType.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_1000683C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static TabLayoutConfigurationType.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static TabLayoutConfigurationType.caseDisplayRepresentations.modify())()
{
  if (qword_1000683C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

SafariWidgetExtension::TabLayoutConfigurationType_optional __swiftcall TabLayoutConfigurationType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_100066180;
  v6._object = object;
  Swift::Int v3 = sub_10004E740(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = SafariWidgetExtension_TabLayoutConfigurationType_compactTabBar;
  }
  else {
    v4.value = SafariWidgetExtension_TabLayoutConfigurationType_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

_UNKNOWN **static TabLayoutConfigurationType.allCases.getter()
{
  return &off_1000661D0;
}

uint64_t sub_1000491AC()
{
  return sub_10000255C(&qword_10006A260, &qword_10006A268);
}

unint64_t sub_1000491EC()
{
  unint64_t result = qword_10006A270;
  if (!qword_10006A270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A270);
  }
  return result;
}

unint64_t sub_100049244()
{
  unint64_t result = qword_10006A278;
  if (!qword_10006A278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A278);
  }
  return result;
}

uint64_t sub_100049298()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000492CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100049E78(a1, a2, a3, (void (*)(void))sub_10003E684);
}

unint64_t sub_1000492FC()
{
  unint64_t result = qword_10006A288;
  if (!qword_10006A288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A288);
  }
  return result;
}

unint64_t sub_100049358()
{
  unint64_t result = qword_10006A298;
  if (!qword_10006A298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A298);
  }
  return result;
}

unint64_t sub_1000493B0()
{
  unint64_t result = qword_10006A2A8;
  if (!qword_10006A2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A2A8);
  }
  return result;
}

unint64_t sub_100049408()
{
  unint64_t result = qword_10006A2B0;
  if (!qword_10006A2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A2B0);
  }
  return result;
}

unint64_t sub_100049460()
{
  unint64_t result = qword_10006A2B8[0];
  if (!qword_10006A2B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006A2B8);
  }
  return result;
}

unint64_t sub_1000494B8()
{
  unint64_t result = qword_10006A2D0;
  if (!qword_10006A2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A2D0);
  }
  return result;
}

unint64_t sub_100049510()
{
  unint64_t result = qword_10006A2D8;
  if (!qword_10006A2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A2D8);
  }
  return result;
}

unint64_t sub_100049568()
{
  unint64_t result = qword_10006A2E0;
  if (!qword_10006A2E0)
  {
    sub_100002450(qword_10006A2E8);
    sub_100049510();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A2E0);
  }
  return result;
}

unint64_t sub_1000495E0()
{
  unint64_t result = qword_10006A300;
  if (!qword_10006A300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A300);
  }
  return result;
}

unint64_t sub_100049638()
{
  unint64_t result = qword_10006A308;
  if (!qword_10006A308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A308);
  }
  return result;
}

unint64_t sub_100049690()
{
  unint64_t result = qword_10006A310;
  if (!qword_10006A310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A310);
  }
  return result;
}

unint64_t sub_1000496E8()
{
  unint64_t result = qword_10006A318;
  if (!qword_10006A318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A318);
  }
  return result;
}

unint64_t sub_100049744()
{
  unint64_t result = qword_10006A320;
  if (!qword_10006A320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A320);
  }
  return result;
}

unint64_t sub_10004979C()
{
  unint64_t result = qword_10006A328;
  if (!qword_10006A328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A328);
  }
  return result;
}

uint64_t sub_1000497F0()
{
  return sub_10000255C(&qword_10006A330, &qword_10006A338);
}

unint64_t sub_100049830()
{
  unint64_t result = qword_10006A340;
  if (!qword_10006A340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A340);
  }
  return result;
}

uint64_t sub_100049884(char *a1, char *a2)
{
  return sub_1000466C8(*a1, *a2);
}

uint64_t sub_100049890@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  Swift::Int v3 = (void *)a1[1];
  v4._rawValue = &off_100066180;
  v8._object = v3;
  Swift::Int v5 = sub_10004E740(v4, v8);
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

void sub_1000498F0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6574617261706573;
  if (*v1) {
    uint64_t v2 = 0x54746361706D6F63;
  }
  unint64_t v3 = 0xEE00726142626154;
  if (*v1) {
    unint64_t v3 = 0xED00007261426261;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_10004994C()
{
  unint64_t result = qword_10006A348;
  if (!qword_10006A348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A348);
  }
  return result;
}

Swift::Int sub_1000499A0()
{
  return sub_10004E790();
}

uint64_t sub_100049A3C()
{
  sub_10004E5A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100049AC4()
{
  return sub_10004E790();
}

unint64_t sub_100049B60()
{
  unint64_t result = qword_10006A350;
  if (!qword_10006A350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A350);
  }
  return result;
}

unint64_t sub_100049BB8()
{
  unint64_t result = qword_10006A358;
  if (!qword_10006A358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A358);
  }
  return result;
}

unint64_t sub_100049C10()
{
  unint64_t result = qword_10006A360;
  if (!qword_10006A360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A360);
  }
  return result;
}

unint64_t sub_100049C68()
{
  unint64_t result = qword_10006A368;
  if (!qword_10006A368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A368);
  }
  return result;
}

unint64_t sub_100049CC0()
{
  unint64_t result = qword_10006A370;
  if (!qword_10006A370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A370);
  }
  return result;
}

unint64_t sub_100049D1C()
{
  unint64_t result = qword_10006A378;
  if (!qword_10006A378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A378);
  }
  return result;
}

uint64_t sub_100049D70@<X0>(uint64_t a1@<X8>)
{
  return sub_100049DA8(&qword_1000683B8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation, a1);
}

uint64_t sub_100049DA8@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008DDC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100049E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100049E78(a1, a2, a3, (void (*)(void))sub_10002B760);
}

uint64_t sub_100049E78(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100049EC0(uint64_t a1)
{
  unint64_t v2 = sub_10002B760();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100049F10()
{
  unint64_t result = qword_10006A380;
  if (!qword_10006A380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A380);
  }
  return result;
}

unint64_t sub_100049F68()
{
  unint64_t result = qword_10006A388;
  if (!qword_10006A388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A388);
  }
  return result;
}

unint64_t sub_100049FC0()
{
  unint64_t result = qword_10006A390;
  if (!qword_10006A390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A390);
  }
  return result;
}

uint64_t sub_10004A014(uint64_t a1)
{
  unint64_t v2 = sub_100049D1C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10004A060()
{
  return sub_10000255C(&qword_10006A398, &qword_10006A3A0);
}

void sub_10004A09C(void *a1@<X8>)
{
  *a1 = &off_1000661F8;
}

unsigned char *storeEnumTagSinglePayload for TabLayoutConfigurationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10004A178);
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

ValueMetadata *type metadata accessor for TabLayoutConfigurationType()
{
  return &type metadata for TabLayoutConfigurationType;
}

ValueMetadata *type metadata accessor for TabLayoutEntity.TabLayoutEntityQuery()
{
  return &type metadata for TabLayoutEntity.TabLayoutEntityQuery;
}

ValueMetadata *type metadata accessor for TabLayoutEntity()
{
  return &type metadata for TabLayoutEntity;
}

ValueMetadata *type metadata accessor for TabLayoutEntity.UpdateIntent_value()
{
  return &type metadata for TabLayoutEntity.UpdateIntent_value;
}

uint64_t sub_10004A1E0()
{
  return sub_10000255C(&qword_10006A3A8, &qword_10006A3B0);
}

uint64_t sub_10004A21C()
{
  return sub_10000255C(&qword_10006A3B8, &qword_10006A3B0);
}

uint64_t sub_10004A258()
{
  uint64_t v28 = sub_10004DB10();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100002388(&qword_100068718);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100002388(&qword_100068720);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DC80();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100002388(&qword_10006A3E8);
  sub_10004DC50();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_10004D7D0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  unint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  uint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  unint64_t v18 = v27;
  v17(v27);
  sub_100049460();
  uint64_t v23 = sub_10004D880();
  sub_100002388(&qword_10006A3F0);
  sub_10004DC50();
  v25(v10, 1, 1, v26);
  char v29 = 2;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_10002B760();
  sub_10004D870();
  return v23;
}

uint64_t sub_10004A644()
{
  uint64_t v1 = sub_10004DC60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004DD90();
  v0[5] = swift_task_alloc();
  sub_10004E550();
  v0[6] = swift_task_alloc();
  sub_10004DC80();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10004A784, 0, 0);
}

uint64_t sub_10004A784()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100002388(&qword_10006A268);
  sub_10004E500();
  sub_10004DD80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004DCA0();
  sub_10000255C(&qword_10006A3D8, &qword_10006A3E0);
  sub_10002B760();
  uint64_t v4 = sub_10004DC20();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10004A944@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t *sub_10004A950(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_bridgeObjectRetain();
    sub_100002388(&qword_100068928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004E3E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)v4 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    sub_100002388(&qword_100068AA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_10004E3B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_10004AB18(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004E3E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004E3B0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10004AC48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  swift_bridgeObjectRetain();
  sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10004E3E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_10004E3B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  else
  {
    *uint64_t v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10004ADB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_1000027C0(a1 + v6, &qword_100068928);
    sub_100002388(&qword_100068928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_10004E3E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_1000027C0(a1 + v10, &qword_100068AA8);
    sub_100002388(&qword_100068AA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_10004E3B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10004AF5C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004E3E0();
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
  uint64_t v14 = sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_10004E3B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10004B0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_1000027C0(a1 + v6, &qword_100068928);
    uint64_t v9 = sub_100002388(&qword_100068928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004E3E0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_1000027C0(a1 + v11, &qword_100068AA8);
    uint64_t v14 = sub_100002388(&qword_100068AA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_10004E3B0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10004B29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004B2B0);
}

uint64_t sub_10004B2B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100002388(&qword_100068C40);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100002388(&qword_100068AB8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_10004B3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004B3F8);
}

uint64_t sub_10004B3F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100002388(&qword_100068C40);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100002388(&qword_100068AB8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for LargeReadingListWidgetView()
{
  uint64_t result = qword_10006A480;
  if (!qword_10006A480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10004B578()
{
  sub_10004B684(319, (unint64_t *)&qword_100068CB0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_10004B684(319, (unint64_t *)&unk_100068B30, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10004B684(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004DE20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10004B6D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004B6F4@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100002388(&qword_10006A4D8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v19 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - v11;
  *(void *)uint64_t v10 = sub_10004E000();
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v13 = sub_100002388(&qword_10006A4E0);
  sub_10004B898((uint64_t)a1, (uint64_t)&v10[*(int *)(v13 + 44)]);
  sub_10004D07C((uint64_t)v10, (uint64_t)v12);
  if (*(void *)(*((void *)a1 + 1) + 16))
  {
    uint64_t KeyPath = 0;
    __int16 v15 = 255;
  }
  else
  {
    int v16 = *a1;
    uint64_t KeyPath = swift_getKeyPath();
    if (v16) {
      __int16 v15 = 0;
    }
    else {
      __int16 v15 = 256;
    }
  }
  sub_10000274C((uint64_t)v12, (uint64_t)v7, &qword_10006A4D8);
  sub_10000274C((uint64_t)v7, a2, &qword_10006A4D8);
  uint64_t v17 = a2 + *(int *)(sub_100002388(&qword_10006A4E8) + 48);
  *(void *)uint64_t v17 = KeyPath;
  *(_WORD *)(v17 + 8) = v15;
  sub_100011FF4(KeyPath, v15);
  sub_1000027C0((uint64_t)v12, &qword_10006A4D8);
  sub_100012010(KeyPath, v15);
  return sub_1000027C0((uint64_t)v7, &qword_10006A4D8);
}

uint64_t sub_10004B898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v3 = sub_10004E3E0();
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v59 = (char *)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v58 = (char *)v56 - v6;
  uint64_t v7 = sub_100002388(&qword_10006A4F0);
  uint64_t v66 = *(void *)(v7 - 8);
  uint64_t v67 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v73 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v62 = (char *)v56 - v11;
  __chkstk_darwin(v10);
  uint64_t v72 = (char *)v56 - v12;
  uint64_t v13 = type metadata accessor for LargeReadingListWidgetView();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13);
  int v16 = (char *)v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100002388(&qword_10006A4F8);
  uint64_t v64 = *(void *)(v17 - 8);
  uint64_t v65 = v17;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v63 = (char *)v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v56 - v20;
  uint64_t v22 = sub_100002388(&qword_10006A500);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v70 = (uint64_t)v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)v56 - v25;
  *(void *)uint64_t v26 = sub_10004DFC0();
  *((void *)v26 + 1) = 0;
  v26[16] = 1;
  uint64_t v27 = *(int *)(sub_100002388(&qword_10006A508) + 44);
  uint64_t v69 = v26;
  sub_10004C0A4((uint64_t)&v26[v27]);
  uint64_t v74 = *(void *)(a1 + 8);
  sub_10004D4DC(a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  uint64_t v28 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v29 = (v28 + 16) & ~v28;
  v56[0] = v28 | 7;
  v56[1] = v29 + v15;
  uint64_t v30 = swift_allocObject();
  uint64_t v57 = v29;
  sub_10004D5A4((uint64_t)v16, v30 + v29, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  swift_bridgeObjectRetain();
  sub_100002388(&qword_10006A510);
  sub_10004DD70();
  sub_100002388(&qword_10006A518);
  sub_10000255C(&qword_10006A520, &qword_10006A510);
  sub_10000255C(&qword_10006A528, &qword_10006A518);
  sub_10004D16C();
  long long v71 = v21;
  uint64_t v32 = v60;
  uint64_t v31 = v61;
  uint64_t v33 = (uint64_t)v58;
  sub_10004E320();
  sub_100013F38(v33);
  unint64_t v34 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v59, v33, v31);
  int v35 = (*(uint64_t (**)(char *, uint64_t))(v32 + 88))(v34, v31);
  if (v35 == enum case for WidgetFamily.systemSmall(_:)) {
    goto LABEL_7;
  }
  if (v35 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v35 == enum case for WidgetFamily.systemLarge(_:))
    {
      uint64_t v36 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
LABEL_7:
    uint64_t v36 = 1;
    goto LABEL_8;
  }
  uint64_t v36 = 2;
LABEL_8:
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v31);
  uint64_t v37 = v36 - *(void *)(*(void *)(a1 + 8) + 16);
  uint64_t v74 = 0;
  uint64_t v75 = v37 & ~(v37 >> 63);
  swift_getKeyPath();
  sub_10004D4DC(a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  uint64_t v38 = swift_allocObject();
  sub_10004D5A4((uint64_t)v16, v38 + v57, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  sub_100002388(&qword_10006A538);
  sub_100002388(&qword_10006A540);
  sub_10004D3D8();
  sub_10000255C(&qword_10006A558, &qword_10006A540);
  uint64_t v39 = v62;
  sub_10004E310();
  uint64_t v41 = v66;
  uint64_t v40 = v67;
  unint64_t v42 = v72;
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v72, v39, v67);
  uint64_t v43 = v70;
  sub_10000274C((uint64_t)v69, v70, &qword_10006A500);
  uint64_t v45 = v63;
  uint64_t v44 = v64;
  unint64_t v62 = *(char **)(v64 + 16);
  uint64_t v46 = v65;
  ((void (*)(char *, char *, uint64_t))v62)(v63, v71, v65);
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v47(v73, v42, v40);
  uint64_t v48 = v68;
  sub_10000274C(v43, v68, &qword_10006A500);
  long long v49 = (int *)sub_100002388(&qword_10006A560);
  uint64_t v50 = v48 + v49[12];
  *(void *)uint64_t v50 = 0;
  *(unsigned char *)(v50 + 8) = 1;
  ((void (*)(uint64_t, char *, uint64_t))v62)(v48 + v49[16], v45, v46);
  uint64_t v51 = v48 + v49[20];
  uint64_t v52 = v73;
  v47((char *)v51, v73, v40);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v41 + 8);
  v53(v72, v40);
  unint64_t v54 = *(void (**)(char *, uint64_t))(v44 + 8);
  v54(v71, v46);
  sub_1000027C0((uint64_t)v69, &qword_10006A500);
  v53(v52, v40);
  v54(v45, v46);
  return sub_1000027C0(v70, &qword_10006A500);
}

uint64_t sub_10004C0A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004E3B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100002388(&qword_100068BF8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LargeReadingListWidgetView();
  sub_100013C3C((uint64_t)v8);
  sub_10004E3A0();
  char v13 = sub_10004E390();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v6, v2);
  v14(v8, v2);
  if (v13) {
    int v15 = sub_10004E0C0();
  }
  else {
    int v15 = sub_10004E0E0();
  }
  v17[3] = v15;
  sub_100002388(&qword_100068C18);
  sub_1000126B4();
  sub_10004E1D0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v12, v9);
}

uint64_t sub_10004C2BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ReadingListWidgetCell();
  uint64_t v5 = v4 - 8;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  sub_10004D4DC(a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
  uint64_t v11 = (uint64_t *)&v8[*(int *)(v5 + 28)];
  *uint64_t v11 = swift_getKeyPath();
  sub_100002388(&qword_100068AA0);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = &v8[*(int *)(v5 + 32)];
  *(void *)uint64_t v12 = swift_getKeyPath();
  v12[8] = 0;
  sub_10004D5A4((uint64_t)v8, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ReadingListWidgetCell);
  BOOL v13 = sub_10004C490(a1);
  sub_10004D4DC((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ReadingListWidgetCell);
  sub_10004D4DC((uint64_t)v8, a2, (uint64_t (*)(void))type metadata accessor for ReadingListWidgetCell);
  uint64_t v14 = a2 + *(int *)(sub_100002388(&qword_10006A568) + 48);
  *(void *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 8) = !v13;
  *(unsigned char *)(v14 + 9) = v13;
  sub_10004D544((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ReadingListWidgetCell);
  return sub_10004D544((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ReadingListWidgetCell);
}

BOOL sub_10004C490(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10004E3E0();
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v46 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v47 = (uint64_t)&v45 - v7;
  uint64_t v45 = type metadata accessor for LargeReadingListWidgetView();
  uint64_t v8 = __chkstk_darwin(v45);
  uint64_t v51 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v54 = (uint64_t)&v45 - v10;
  uint64_t v11 = type metadata accessor for BookmarkItem();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v50 = (uint64_t *)((char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_100002388(&qword_10006A570);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100002388(&qword_100068BA8);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v52 = (uint64_t *)((char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v45 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v45 - v23;
  sub_10004D4DC(a1, (uint64_t)&v45 - v23, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v26 = 1;
  v25(v24, 0, 1, v11);
  uint64_t v53 = v2;
  uint64_t v27 = *(void *)(v2 + 8);
  uint64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    sub_10004D4DC(v27+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * (v28 - 1), (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
    uint64_t v26 = 0;
  }
  v25(v22, v26, 1, v11);
  uint64_t v29 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_10000274C((uint64_t)v24, (uint64_t)v16, &qword_100068BA8);
  sub_10000274C((uint64_t)v22, v29, &qword_100068BA8);
  uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (v30((uint64_t)v16, 1, v11) != 1)
  {
    uint64_t v32 = v52;
    sub_10000274C((uint64_t)v16, (uint64_t)v52, &qword_100068BA8);
    if (v30(v29, 1, v11) != 1)
    {
      unint64_t v34 = v50;
      sub_10004D5A4(v29, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
      char v35 = sub_100044B7C(v32, v34);
      sub_10004D544((uint64_t)v34, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
      sub_1000027C0((uint64_t)v22, &qword_100068BA8);
      sub_1000027C0((uint64_t)v24, &qword_100068BA8);
      sub_10004D544((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
      sub_1000027C0((uint64_t)v16, &qword_100068BA8);
      uint64_t v31 = v54;
      sub_10004D4DC(v53, v54, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
      if ((v35 & 1) == 0)
      {
        BOOL v33 = 0;
        goto LABEL_20;
      }
      goto LABEL_10;
    }
    sub_1000027C0((uint64_t)v22, &qword_100068BA8);
    sub_1000027C0((uint64_t)v24, &qword_100068BA8);
    sub_10004D544((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for BookmarkItem);
LABEL_8:
    sub_1000027C0((uint64_t)v16, &qword_10006A570);
    uint64_t v31 = v54;
    sub_10004D4DC(v53, v54, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
    BOOL v33 = 0;
    goto LABEL_20;
  }
  sub_1000027C0((uint64_t)v22, &qword_100068BA8);
  sub_1000027C0((uint64_t)v24, &qword_100068BA8);
  if (v30(v29, 1, v11) != 1) {
    goto LABEL_8;
  }
  sub_1000027C0((uint64_t)v16, &qword_100068BA8);
  uint64_t v31 = v54;
  sub_10004D4DC(v53, v54, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
LABEL_10:
  unint64_t v36 = *(void *)(*(void *)(v31 + 8) + 16);
  uint64_t v37 = v51;
  sub_10004D4DC(v31, v51, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  if (v36)
  {
    uint64_t v38 = v47;
    sub_100013F38(v47);
    uint64_t v40 = v48;
    uint64_t v39 = v49;
    uint64_t v41 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v46, v38, v49);
    int v42 = (*(uint64_t (**)(char *, uint64_t))(v40 + 88))(v41, v39);
    if (v42 != enum case for WidgetFamily.systemSmall(_:))
    {
      if (v42 == enum case for WidgetFamily.systemMedium(_:))
      {
        unint64_t v43 = 2;
        goto LABEL_19;
      }
      if (v42 == enum case for WidgetFamily.systemLarge(_:))
      {
        unint64_t v43 = 5;
        goto LABEL_19;
      }
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
    }
    unint64_t v43 = 1;
LABEL_19:
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    sub_10004D544(v37, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
    BOOL v33 = v36 >= v43;
    goto LABEL_20;
  }
  sub_10004D544(v37, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  BOOL v33 = 1;
LABEL_20:
  sub_10004D544(v31, (uint64_t (*)(void))type metadata accessor for LargeReadingListWidgetView);
  return v33;
}

BOOL sub_10004CB9C@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = sub_10004E250();
  sub_10004E350();
  sub_10004DE60();
  BOOL result = sub_10004CC60(v3);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v8;
  *(unsigned char *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = v11;
  *(void *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 64) = !result;
  *(unsigned char *)(a2 + 65) = result;
  return result;
}

BOOL sub_10004CC60(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10004E3E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v15 - v9;
  type metadata accessor for LargeReadingListWidgetView();
  sub_100013F38((uint64_t)v10);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v11 == enum case for WidgetFamily.systemSmall(_:)) {
    goto LABEL_7;
  }
  if (v11 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v11 == enum case for WidgetFamily.systemLarge(_:))
    {
      uint64_t v12 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
LABEL_7:
    uint64_t v12 = 1;
    goto LABEL_8;
  }
  uint64_t v12 = 2;
LABEL_8:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  uint64_t v13 = v12 - *(void *)(*(void *)(v2 + 8) + 16);
  return (v13 & ~(v13 >> 63)) - 1 == a1;
}

uint64_t sub_10004CE2C@<X0>(void *a1@<X8>)
{
  if (qword_1000681D0 != -1) {
    swift_once();
  }
  *a1 = qword_10006A580;

  return swift_retain();
}

uint64_t sub_10004CE98()
{
  uint64_t v1 = sub_10004E100();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002388(&qword_10006A4C0);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v7 = sub_10004E350();
  v7[1] = v8;
  uint64_t v9 = sub_100002388(&qword_10006A4C8);
  sub_10004B6F4(v0, (uint64_t)v7 + *(int *)(v9 + 44));
  sub_10004E0F0();
  sub_10004E350();
  sub_10000255C(&qword_10006A4D0, &qword_10006A4C0);
  sub_10004E230();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_1000027C0((uint64_t)v7, &qword_10006A4C0);
}

uint64_t sub_10004D07C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002388(&qword_10006A4D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004D0EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for LargeReadingListWidgetView();

  return sub_10004C2BC(a1, a2);
}

unint64_t sub_10004D16C()
{
  unint64_t result = qword_10006A530;
  if (!qword_10006A530)
  {
    type metadata accessor for BookmarkItem();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A530);
  }
  return result;
}

uint64_t sub_10004D1C8()
{
  uint64_t v1 = type metadata accessor for LargeReadingListWidgetView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_100002388(&qword_100068928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004E3E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 24);
  sub_100002388(&qword_100068AA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10004E3B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

BOOL sub_10004D358@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for LargeReadingListWidgetView();

  return sub_10004CB9C(a1, a2);
}

unint64_t sub_10004D3D8()
{
  unint64_t result = qword_10006A548;
  if (!qword_10006A548)
  {
    sub_100002450(&qword_10006A538);
    sub_10004D454();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A548);
  }
  return result;
}

unint64_t sub_10004D454()
{
  unint64_t result = qword_10006A550;
  if (!qword_10006A550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A550);
  }
  return result;
}

uint64_t sub_10004D4B0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004DEE0();
  *a1 = v3;
  return result;
}

uint64_t sub_10004D4DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004D544(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004D5A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004D60C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004D6A0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10004D6B0()
{
  return type metadata accessor for _PrebuiltAppIntentError();
}

uint64_t sub_10004D6C0()
{
  return static AppIntentError.Unrecoverable.entityNotFound.getter();
}

uint64_t sub_10004D6D0()
{
  return type metadata accessor for AppIntentError();
}

uint64_t sub_10004D6E0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10004D6F0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10004D730()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10004D740()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10004D750()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10004D760()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10004D770()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10004D7A0()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_10004D7C0()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_10004D7D0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10004D7E0()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_10004D800()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_10004D810()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_10004D820()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_10004D830()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10004D840()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10004D850()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10004D860()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10004D870()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10004D880()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10004D890()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10004D8A0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10004D8B0()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_10004D8C0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10004D8D0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10004D8E0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10004D8F0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10004D900()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10004D910()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10004D920()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10004D930()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10004D940()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_10004D950()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10004D960(Swift::String a1)
{
}

uint64_t sub_10004D970()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10004D980()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10004D990()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10004D9A0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10004D9B0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10004D9C0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10004D9D0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10004D9E0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10004DA20()
{
  return static _UnrecoverableError.unknownError.getter();
}

uint64_t sub_10004DA30()
{
  return static _UnrecoverableError.entityNotFound.getter();
}

uint64_t sub_10004DA40()
{
  return static _UnrecoverableError.unsupportedOnDevice.getter();
}

uint64_t sub_10004DA50()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_10004DA60()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_10004DA70()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_10004DA80()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10004DA90()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_10004DAA0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10004DAB0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10004DAC0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10004DAD0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10004DAE0()
{
  return _UniqueEntityProvider.init(_:)();
}

uint64_t sub_10004DB00()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10004DB10()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10004DB20()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10004DB60()
{
  return dispatch thunk of static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10004DB70()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10004DB80()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_10004DB90(Swift::String a1)
{
}

uint64_t sub_10004DBA0()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10004DBB0()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_10004DBC0()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_10004DBD0()
{
  return TypeDisplayRepresentation.name.getter();
}

uint64_t sub_10004DBE0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10004DBF0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10004DC00()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_10004DC20()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10004DC30()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10004DC40()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10004DC50()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10004DC60()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10004DC70()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_10004DC80()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10004DC90()
{
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
}

uint64_t sub_10004DCA0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10004DCB0()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_10004DCC0()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10004DCD0()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_10004DCE0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004DCF0()
{
  return URL.path.getter();
}

uint64_t sub_10004DD00()
{
  return URL.init(string:)();
}

uint64_t sub_10004DD10()
{
  return type metadata accessor for URL();
}

uint64_t sub_10004DD20()
{
  return static Date.now.getter();
}

uint64_t sub_10004DD30()
{
  return type metadata accessor for Date();
}

uint64_t sub_10004DD40()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10004DD60()
{
  return UUID.init()();
}

uint64_t sub_10004DD70()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10004DD80()
{
  return static Locale.current.getter();
}

uint64_t sub_10004DD90()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10004DDA0()
{
  return WBSLookUpLocalizedString(_:key:dsohandle:)();
}

uint64_t sub_10004DDB0()
{
  return WBSLookUpLocalizedString(_:dsohandle:)();
}

uint64_t sub_10004DDC0()
{
  return WBSLocalizedStringLiteral.init(stringLiteral:)();
}

uint64_t sub_10004DDD0()
{
  return type metadata accessor for WBSLocalizedStringLiteral();
}

uint64_t sub_10004DDE0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10004DDF0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10004DE00()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_10004DE10()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_10004DE20()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10004DE30()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_10004DE40()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_10004DE50()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10004DE60()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10004DE70()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_10004DE80()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_10004DE90()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t sub_10004DEA0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10004DEB0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_10004DEC0()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_10004DED0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10004DEE0()
{
  return EnvironmentValues.pixelLength.getter();
}

uint64_t sub_10004DEF0()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_10004DF00()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10004DF10()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10004DF20()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10004DF30()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10004DF40()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_10004DF50()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10004DF60()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_10004DF70()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10004DF80()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10004DF90()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10004DFA0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10004DFB0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_10004DFC0()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_10004DFD0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_10004DFE0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10004DFF0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10004E000()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10004E010()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10004E020()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10004E030()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_10004E040()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_10004E050()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_10004E060()
{
  return WidgetConfiguration.disfavoredLocations(_:for:)();
}

uint64_t sub_10004E070()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10004E080()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10004E090()
{
  return WidgetConfiguration.configurationDisplayName<A>(_:)();
}

uint64_t sub_10004E0A0()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_10004E0B0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10004E0C0()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_10004E0D0()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_10004E0E0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_10004E0F0()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_10004E100()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_10004E110()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10004E120()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10004E130()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10004E140()
{
  return static Font.subheadline.getter();
}

uint64_t sub_10004E150()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_10004E160()
{
  return Font.weight(_:)();
}

uint64_t sub_10004E170()
{
  return static Font.caption.getter();
}

uint64_t sub_10004E180()
{
  return static Font.footnote.getter();
}

uint64_t sub_10004E190()
{
  return Link.init(destination:label:)();
}

uint64_t sub_10004E1A0()
{
  return Text.font(_:)();
}

uint64_t sub_10004E1B0()
{
  return Text.init(_:)();
}

uint64_t sub_10004E1C0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10004E1D0()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_10004E1E0()
{
  return View.widgetURL(_:)();
}

uint64_t sub_10004E1F0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10004E200()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10004E210()
{
  return View.unredacted()();
}

uint64_t sub_10004E220()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10004E230()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_10004E240()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10004E250()
{
  return static Color.clear.getter();
}

uint64_t sub_10004E260()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10004E270()
{
  return Color.init(_:bundle:)();
}

uint64_t sub_10004E280()
{
  return Image.init(uiImage:)();
}

uint64_t sub_10004E290()
{
  return Image.init(systemName:)();
}

uint64_t sub_10004E2A0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10004E2B0()
{
  return static Image.== infix(_:_:)();
}

uint64_t sub_10004E2C0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_10004E2D0()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_10004E2E0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10004E300()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_10004E310()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10004E320()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10004E330()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_10004E340()
{
  return Gradient.init(stops:)();
}

uint64_t sub_10004E350()
{
  return static Alignment.center.getter();
}

uint64_t sub_10004E360()
{
  return static Alignment.leading.getter();
}

uint64_t sub_10004E370()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_10004E380()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_10004E390()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_10004E3A0()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_10004E3B0()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_10004E3C0()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_10004E3D0()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_10004E3E0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_10004E3F0()
{
  return static WidgetLocation.continuityMac.getter();
}

uint64_t sub_10004E400()
{
  return type metadata accessor for WidgetLocation();
}

uint64_t sub_10004E410()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_10004E420()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_10004E430()
{
  return ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)();
}

uint64_t sub_10004E440()
{
  return ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)();
}

uint64_t sub_10004E450()
{
  return ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)();
}

uint64_t sub_10004E460()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_10004E490()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_10004E4A0()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_10004E4B0()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_10004E4C0()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_10004E4D0()
{
  return Timeline.init(entries:policy:)();
}

NSDictionary sub_10004E4E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10004E4F0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_10004E500()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_10004E510(Swift::String a1)
{
}

void sub_10004E520(Swift::String a1)
{
}

uint64_t sub_10004E530()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10004E540()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_10004E550()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10004E560()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10004E570()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004E580()
{
  return String.init(localized:)();
}

uint64_t sub_10004E590()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10004E5A0()
{
  return String.hash(into:)();
}

void sub_10004E5B0(Swift::String a1)
{
}

Swift::Int sub_10004E5C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10004E5D0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10004E5E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004E5F0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10004E600()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10004E610()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10004E620()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10004E630()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10004E640()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_10004E650()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_10004E660()
{
  return dispatch thunk of SetAlgebra.init()();
}

Swift::Int sub_10004E670(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10004E680()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10004E690()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_10004E6A0(Swift::Int a1)
{
}

uint64_t sub_10004E6B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10004E6C0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10004E6D0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10004E6E0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10004E6F0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10004E700()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10004E710()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10004E720()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_10004E730()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10004E740(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10004E750()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10004E760()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_10004E770()
{
  return Hasher.init(_seed:)();
}

void sub_10004E780(Swift::UInt a1)
{
}

Swift::Int sub_10004E790()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _SFDeviceIsPad()
{
  return __SFDeviceIsPad();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
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