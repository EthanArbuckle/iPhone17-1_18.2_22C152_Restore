BOOL sub_100003FC0(char a1, char a2)
{
  return a1 == a2;
}

void sub_100003FD0(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_100003FF8(unsigned __int8 a1)
{
  return sub_100030A10();
}

BOOL sub_100004040(char *a1, char *a2)
{
  return sub_100003FC0(*a1, *a2);
}

Swift::Int sub_10000404C()
{
  return sub_100003FF8(*v0);
}

void sub_100004054(uint64_t a1)
{
  sub_100003FD0(a1, *v1);
}

Swift::Int sub_10000405C()
{
  Swift::UInt v1 = *v0;
  sub_1000309F0();
  sub_100030A00(v1);
  return sub_100030A10();
}

uint64_t sub_1000040A0(uint64_t a1, unsigned __int8 a2)
{
  int v3 = a2;
  uint64_t v4 = sub_1000303B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = 0;
  if (!v3)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    int v10 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
    if (v10 == enum case for WidgetFamily.systemSmall(_:))
    {
      return 0x402C000000000000;
    }
    else if (v10 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      return 0x403E000000000000;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return 0x4034000000000000;
    }
  }
  return result;
}

uint64_t sub_1000041F4(uint64_t a1, unsigned __int8 a2)
{
  int v3 = a2;
  uint64_t v4 = sub_1000303B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3) {
    return 0x4028000000000000;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v10 == enum case for WidgetFamily.systemSmall(_:)) {
    return 0x402C000000000000;
  }
  if (v10 == enum case for WidgetFamily.systemExtraLarge(_:)) {
    return 0x403E000000000000;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 0x4034000000000000;
}

uint64_t sub_100004344@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  uint64_t v10 = sub_10000D85C(&qword_100040CF8);
  uint64_t v11 = (int *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = &v14[v11[11]];
  uint64_t v16 = sub_1000303B0();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a1, v16);
  v14[v11[12]] = a2;
  *(void *)&v14[v11[13]] = a3;
  *(void *)&v14[v11[14]] = a4;
  uint64_t v18 = sub_10002FEC0();
  sub_10000D5E0((uint64_t)&v30);
  uint64_t v19 = v30;
  char v20 = v31;
  uint64_t v21 = v32;
  uint64_t v22 = v33;
  char v23 = v34;
  uint64_t v24 = v35;
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v27, v16);
  *(void *)v14 = v18;
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  *((void *)v14 + 3) = v19;
  v14[32] = v20;
  *((void *)v14 + 5) = v21;
  *((void *)v14 + 6) = v22;
  v14[56] = v23;
  *((void *)v14 + 8) = v24;
  sub_10000F9A0((uint64_t)v14, v29, &qword_100040CF8);
  return swift_release();
}

uint64_t sub_1000044E4(uint64_t a1)
{
  uint64_t v3 = sub_1000303B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = 0;
  if (!*(unsigned char *)(v1 + *(int *)(a1 + 40)))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v1 + *(int *)(a1 + 36), v3);
    int v9 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
    if (v9 == enum case for WidgetFamily.systemSmall(_:))
    {
      return 0x402C000000000000;
    }
    else if (v9 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      return 0x403E000000000000;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      return 0x4034000000000000;
    }
  }
  return result;
}

uint64_t sub_10000463C(uint64_t a1)
{
  uint64_t v3 = sub_1000303B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + *(int *)(a1 + 40))) {
    return 0x4028000000000000;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v1 + *(int *)(a1 + 36), v3);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (v9 == enum case for WidgetFamily.systemSmall(_:)) {
    return 0x402C000000000000;
  }
  if (v9 == enum case for WidgetFamily.systemExtraLarge(_:)) {
    return 0x403E000000000000;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return 0x4034000000000000;
}

uint64_t sub_100004794@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v37 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v6 = sub_100030220();
  uint64_t v32 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  int v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10002FD40();
  uint64_t v35 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v11);
  v38 = (char *)&v31 - v12;
  uint64_t v13 = sub_10002FD40();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  uint64_t v33 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v18);
  char v34 = (char *)&v31 - v19;
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  uint64_t v41 = v2;
  sub_100030210();
  LOBYTE(v4) = sub_10002FFB0();
  unsigned __int8 v20 = sub_10002FFD0();
  sub_10002FFC0();
  sub_10002FFC0();
  if (sub_10002FFC0() != v4) {
    sub_10002FFC0();
  }
  sub_10002FFC0();
  if (sub_10002FFC0() != v20) {
    sub_10002FFC0();
  }
  uint64_t v36 = v2;
  sub_1000044E4(a1);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_100030130();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v6);
  unsigned __int8 v22 = sub_10002FFA0();
  unsigned __int8 v23 = sub_10002FF90();
  sub_10002FFC0();
  sub_10002FFC0();
  if (sub_10002FFC0() != v22) {
    sub_10002FFC0();
  }
  sub_10002FFC0();
  if (sub_10002FFC0() != v23) {
    sub_10002FFC0();
  }
  sub_10000463C(a1);
  uint64_t v44 = WitnessTable;
  v45 = &protocol witness table for _PaddingLayout;
  uint64_t v24 = swift_getWitnessTable();
  v25 = v33;
  uint64_t v26 = v38;
  sub_100030130();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v26, v10);
  uint64_t v42 = v24;
  v43 = &protocol witness table for _PaddingLayout;
  swift_getWitnessTable();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v28 = v34;
  v27(v34, v25, v13);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v25, v13);
  v27(v37, v28, v13);
  return ((uint64_t (*)(char *, uint64_t))v29)(v28, v13);
}

uint64_t sub_100004C14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t (*sub_100004D14())(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8, v4);
  sub_10000F9F0(v0, (uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10000F93C((uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (void (*)(void))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  return sub_10000FA60;
}

uint64_t (*sub_100004E28())(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8, v4);
  sub_10000F9F0(v0, (uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10000F93C((uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (void (*)(void))type metadata accessor for PhotosReliveWidgetMemoryContent);
  return sub_10000E87C;
}

uint64_t (*sub_100004F3C())@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000F990;
}

uint64_t (*sub_100004F7C())(uint64_t a1)
{
  return sub_10000F998;
}

uint64_t sub_100004FBC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), void (*a4)(void))
{
  uint64_t v10 = sub_10000D85C(&qword_100040960);
  uint64_t v11 = sub_1000119E8(v10);
  __chkstk_darwin(v11, v12);
  sub_1000119C4();
  sub_10000D85C(&qword_100040968);
  sub_100011958();
  __chkstk_darwin(v13, v14);
  sub_100011A40();
  *unint64_t v5 = sub_100030270();
  v5[1] = v15;
  sub_10000D85C(&qword_100040970);
  a3(a2, a1);
  a4(0);
  uint64_t v16 = sub_10002FAF0();
  sub_100011958();
  sub_100011C50();
  v17();
  sub_10000DA40(v4, 0, 1, v16);
  sub_10001148C(&qword_100040978, &qword_100040968);
  sub_1000300A0();
  sub_100011528(v4, &qword_100040960);
  return sub_100011528((uint64_t)v5, &qword_100040968);
}

uint64_t sub_100005170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = sub_10000D85C(&qword_100040960);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v29[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D85C(&qword_100040980);
  uint64_t v11 = __chkstk_darwin(v9 - 8, v10);
  uint64_t v13 = (char *)&v29[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v29[-1] - v15;
  uint64_t v17 = sub_10000D85C(&qword_100040CA8);
  __chkstk_darwin(v17, v18);
  unsigned __int8 v20 = (void *)((char *)&v29[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  *unsigned __int8 v20 = sub_100030270();
  v20[1] = v21;
  uint64_t v22 = (uint64_t)v20 + *(int *)(sub_10000D85C(&qword_100040CB0) + 44);
  swift_retain();
  sub_100005EC8(a2, (uint64_t)v16);
  swift_release();
  uint64_t v23 = swift_retain();
  sub_100005FC8(v29, v23, a1);
  swift_release();
  sub_1000114D0((uint64_t)v16, (uint64_t)v13, &qword_100040980);
  sub_1000114D0((uint64_t)v13, v22, &qword_100040980);
  uint64_t v24 = (void *)(v22 + *(int *)(sub_10000D85C(&qword_100040CB8) + 48));
  memcpy(v30, v29, sizeof(v30));
  memcpy(v24, v29, 0xA0uLL);
  sub_10000E9EC((uint64_t)v30);
  sub_100011528((uint64_t)v16, &qword_100040980);
  memcpy(__dst, v29, 0xA0uLL);
  sub_10000EA54((uint64_t)__dst);
  sub_100011528((uint64_t)v13, &qword_100040980);
  uint64_t v25 = a2 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  uint64_t v26 = sub_10002FAF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v8, v25, v26);
  sub_10000DA40((uint64_t)v8, 0, 1, v26);
  sub_10001148C(&qword_100040CC0, &qword_100040CA8);
  sub_1000300A0();
  sub_100011528((uint64_t)v8, &qword_100040960);
  return sub_100011528((uint64_t)v20, &qword_100040CA8);
}

uint64_t sub_100005474(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D85C(&qword_100040960);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D85C(&qword_100040CC8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (uint64_t *)((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = sub_100030270();
  v11[1] = v12;
  uint64_t v13 = sub_10000D85C(&qword_100040CD0);
  sub_100005B68(a2, a1, (uint64_t)v11 + *(int *)(v13 + 44));
  uint64_t v14 = a2 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  uint64_t v15 = sub_10002FAF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v14, v15);
  sub_10000DA40((uint64_t)v7, 0, 1, v15);
  sub_10001148C(&qword_100040CD8, &qword_100040CC8);
  sub_1000300A0();
  sub_100011528((uint64_t)v7, &qword_100040960);
  return sub_100011528((uint64_t)v11, &qword_100040CC8);
}

uint64_t sub_100005638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6, v9);
  uint64_t v10 = sub_10000D85C(&qword_100040980);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v14 = (char *)&v26[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v26[-1] - v16;
  swift_retain();
  sub_100005DCC((uint64_t)v17);
  swift_release();
  uint64_t v18 = swift_retain();
  sub_100005FC8(v26, v18, a2);
  swift_release();
  sub_10000F9F0(a1, (uint64_t)&v26[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  sub_10000F93C((uint64_t)&v26[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, (void (*)(void))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  sub_1000114D0((uint64_t)v17, (uint64_t)v14, &qword_100040980);
  sub_1000114D0((uint64_t)v14, a3, &qword_100040980);
  uint64_t v21 = sub_10000D85C(&qword_100040988);
  uint64_t v22 = (void *)(a3 + *(int *)(v21 + 48));
  memcpy(v27, v26, sizeof(v27));
  memcpy(v22, v26, 0xA0uLL);
  uint64_t v23 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(a3 + *(int *)(v21 + 64));
  *uint64_t v23 = sub_10000FB44;
  v23[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v20;
  sub_10000E9EC((uint64_t)v27);
  swift_retain();
  sub_100011528((uint64_t)v17, &qword_100040980);
  swift_release();
  memcpy(__dst, v26, 0xA0uLL);
  sub_10000EA54((uint64_t)__dst);
  return sub_100011528((uint64_t)v14, &qword_100040980);
}

uint64_t sub_1000058D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6, v9);
  uint64_t v10 = sub_10000D85C(&qword_100040980);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v14 = (char *)&v26[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v26[-1] - v16;
  swift_retain();
  sub_100005DCC((uint64_t)v17);
  swift_release();
  uint64_t v18 = swift_retain();
  sub_100005FC8(v26, v18, a2);
  swift_release();
  sub_10000F9F0(a1, (uint64_t)&v26[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  sub_10000F93C((uint64_t)&v26[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, (void (*)(void))type metadata accessor for PhotosReliveWidgetMemoryContent);
  sub_1000114D0((uint64_t)v17, (uint64_t)v14, &qword_100040980);
  sub_1000114D0((uint64_t)v14, a3, &qword_100040980);
  uint64_t v21 = sub_10000D85C(&qword_100040988);
  uint64_t v22 = (void *)(a3 + *(int *)(v21 + 48));
  memcpy(v27, v26, sizeof(v27));
  memcpy(v22, v26, 0xA0uLL);
  uint64_t v23 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(a3 + *(int *)(v21 + 64));
  *uint64_t v23 = sub_10000E9C0;
  v23[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v20;
  sub_10000E9EC((uint64_t)v27);
  swift_retain();
  sub_100011528((uint64_t)v17, &qword_100040980);
  swift_release();
  memcpy(__dst, v26, 0xA0uLL);
  sub_10000EA54((uint64_t)__dst);
  return sub_100011528((uint64_t)v14, &qword_100040980);
}

uint64_t sub_100005B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10000D85C(&qword_100040CE0);
  uint64_t v8 = __chkstk_darwin(v6 - 8, v7);
  uint64_t v10 = (char *)&v28[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  uint64_t v13 = (char *)&v28[-1] - v12;
  uint64_t v14 = sub_10000D85C(&qword_100040980);
  uint64_t v16 = __chkstk_darwin(v14 - 8, v15);
  uint64_t v18 = (char *)&v28[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  uint64_t v21 = (char *)&v28[-1] - v20;
  swift_retain();
  sub_100005EC8(a1, (uint64_t)v21);
  swift_release();
  uint64_t v22 = swift_retain();
  sub_100005FC8(v28, v22, a2);
  swift_release();
  *(void *)uint64_t v13 = sub_10002FE80();
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  uint64_t v23 = sub_10000D85C(&qword_100040CE8);
  sub_10000D35C(a1, (uint64_t)&v13[*(int *)(v23 + 44)]);
  sub_1000114D0((uint64_t)v21, (uint64_t)v18, &qword_100040980);
  sub_1000114D0((uint64_t)v13, (uint64_t)v10, &qword_100040CE0);
  sub_1000114D0((uint64_t)v18, a3, &qword_100040980);
  uint64_t v24 = sub_10000D85C(&qword_100040CF0);
  uint64_t v25 = (void *)(a3 + *(int *)(v24 + 48));
  memcpy(v29, v28, sizeof(v29));
  memcpy(v25, v28, 0xA0uLL);
  sub_1000114D0((uint64_t)v10, a3 + *(int *)(v24 + 64), &qword_100040CE0);
  sub_10000E9EC((uint64_t)v29);
  sub_100011528((uint64_t)v13, &qword_100040CE0);
  sub_100011528((uint64_t)v21, &qword_100040980);
  sub_100011528((uint64_t)v10, &qword_100040CE0);
  memcpy(__dst, v28, 0xA0uLL);
  sub_10000EA54((uint64_t)__dst);
  return sub_100011528((uint64_t)v18, &qword_100040980);
}

uint64_t sub_100005DCC@<X0>(uint64_t a1@<X8>)
{
  sub_100011D34();
  uint64_t v2 = sub_10002FE90();
  uint64_t v4 = v3;
  id v5 = [self mainBundle];
  sub_100012188();
  sub_10001240C();
  uint64_t v6 = sub_100030070();
  sub_100012104();
  uint64_t v14 = v7;
  uint64_t v8 = sub_100011F34();
  sub_10000614C(v8, v9, v10, v11, v12, v6, v2, v4, v14, v1, a1, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
  sub_100012368(v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100005EC8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_100011D34();
  uint64_t v3 = sub_10002FE90();
  uint64_t v5 = v4;
  id v6 = [self mainBundle];
  sub_100012188();
  sub_10001240C();
  uint64_t v7 = sub_100030070();
  sub_100012104();
  uint64_t v15 = v8;
  uint64_t v9 = sub_100011F34();
  sub_10000614C(v9, v10, v11, v12, v13, v7, v3, v5, v15, a1, a2, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  sub_100012368(v7);

  return swift_bridgeObjectRelease();
}

#error "100006134: call analysis failed (funcsize=92)"

void sub_10000614C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_1000119F4();
  a21 = v26;
  a22 = v27;
  uint64_t v29 = v28;
  uint64_t v30 = type metadata accessor for ImageAccentDesaturateModifier(0);
  uint64_t v31 = sub_1000119E8(v30);
  __chkstk_darwin(v31, v32);
  sub_100011AE0(v33, v82);
  uint64_t v34 = sub_10000D85C(&qword_100040C08);
  uint64_t v35 = sub_1000119E8(v34);
  __chkstk_darwin(v35, v36);
  sub_100011E7C();
  sub_10001193C();
  __chkstk_darwin(v37, v38);
  sub_1000119C4();
  sub_10000D85C(&qword_100040C10);
  sub_100011958();
  __chkstk_darwin(v39, v40);
  sub_10001198C();
  sub_10000D85C(&qword_100040C18);
  sub_10001193C();
  __chkstk_darwin(v41, v42);
  sub_100011C14();
  sub_10000D85C(&qword_100040C20);
  sub_10001193C();
  uint64_t v84 = v43;
  __chkstk_darwin(v44, v45);
  sub_100011A58();
  sub_10000D85C(&qword_100040C28);
  sub_100011958();
  __chkstk_darwin(v46, v47);
  sub_100011A40();
  sub_10000D85C(&qword_100040C30);
  sub_100011958();
  __chkstk_darwin(v48, v49);
  sub_100011BFC();
  uint64_t v50 = sub_10000D85C(&qword_100040C38);
  uint64_t v51 = sub_1000119E8(v50);
  __chkstk_darwin(v51, v52);
  sub_100011ECC(v53, v83);
  sub_10000D85C(&qword_100040C40);
  sub_100011958();
  __chkstk_darwin(v54, v55);
  sub_100011E28();
  __chkstk_darwin(v56, v57);
  if (v29)
  {
    sub_100011C2C();
    sub_100011AFC(v58);
    sub_10000F204();
    id v62 = v24;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_100030080();
    sub_100011B74(v63, v64, v65, v66, v67);
    uint64_t v68 = sub_100011B28();
    v70.n128_f64[0] = v69(v68);
    sub_100011D94(v70, v71, v72, v73);
    swift_release();
    uint64_t v74 = sub_1000120EC();
    v75(v74);
    sub_100030380();
    uint64_t v76 = sub_100030390();
    sub_100011EE8(v76);
    swift_release();
    sub_100011528(v23, &qword_100040C08);
    sub_1000119DC();
    v77();
    uint64_t v78 = sub_100011A70();
    v79(v78);
    sub_100030260();
    sub_100011FF0();
    sub_1000114D0(v25, v22, &qword_100040C28);
    sub_100011AA4();
    unint64_t v80 = sub_10000F82C();
    sub_100011BC8(v80);
    sub_100011528(v22, &qword_100040C30);
    uint64_t *v85 = swift_getKeyPath();
    sub_10000D85C(&qword_100040CA0);
    swift_storeEnumTagMultiPayload();
    sub_100011D78();
    sub_10000F93C((uint64_t)v85, v81, (void (*)(void))type metadata accessor for ImageAccentDesaturateModifier);
    sub_10000F9A0(v84, v22, &qword_100040C38);
    sub_1000120B0();
    sub_100011C90((uint64_t)v24, (uint64_t)&a11);
    swift_storeEnumTagMultiPayload();
    sub_10000F6D4();
    sub_10000D960(&qword_100040C48);
    sub_10000F5E8();
    swift_getOpaqueTypeConformance2();
    sub_100011CC8();
    sub_100012218();
  }
  else
  {
    sub_100030150();
    swift_getKeyPath();
    sub_10000D85C(&qword_100040C48);
    sub_10000F5E8();
    sub_100011DE4();
    swift_release();
    swift_release();
    sub_1000119DC();
    v59();
    swift_storeEnumTagMultiPayload();
    sub_10000F6D4();
    swift_getOpaqueTypeConformance2();
    sub_100011FC8();
    uint64_t v60 = sub_1000121A0();
    v61(v60);
  }
  sub_100011A10();
}

double sub_1000066D4()
{
  return 0.0;
}

uint64_t sub_1000066DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v36 = a2;
  uint64_t v2 = sub_10000D85C(&qword_100040E98);
  uint64_t v32 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_10000D85C(&qword_100040EA0);
  __chkstk_darwin(v34, v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10000D85C(&qword_100040EA8);
  __chkstk_darwin(v35, v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100030370();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = __chkstk_darwin(v12, v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  uint64_t v20 = (char *)&v31 - v19;
  sub_10001427C((uint64_t)&v31 - v19);
  sub_100030360();
  char v21 = sub_100030350();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v17, v12);
  v22(v20, v12);
  uint64_t v23 = v32;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  if (v21)
  {
    v24(v11, v33, v2);
    *(void *)&v11[*(int *)(sub_10000D85C(&qword_100040EC0) + 36)] = 0x3F847AE147AE147BLL;
    uint64_t v25 = sub_100030270();
    uint64_t v27 = v26;
    uint64_t v28 = (uint64_t)&v11[*(int *)(v35 + 36)];
    sub_100006AD0(v28);
    uint64_t v29 = (uint64_t *)(v28 + *(int *)(sub_10000D85C(&qword_100040ED8) + 36));
    *uint64_t v29 = v25;
    v29[1] = v27;
    sub_1000114D0((uint64_t)v11, (uint64_t)v8, &qword_100040EA8);
    swift_storeEnumTagMultiPayload();
    sub_10001134C();
    sub_10001148C(&qword_100040EC8, &qword_100040E98);
    sub_10002FF40();
    return sub_100011528((uint64_t)v11, &qword_100040EA8);
  }
  else
  {
    v24(v5, v33, v2);
    v24(v8, (uint64_t)v5, v2);
    swift_storeEnumTagMultiPayload();
    sub_10001134C();
    sub_10001148C(&qword_100040EC8, &qword_100040E98);
    sub_10002FF40();
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v5, v2);
  }
}

uint64_t sub_100006AD0@<X0>(uint64_t a1@<X8>)
{
  v19[0] = a1;
  uint64_t v1 = sub_100030280();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D85C(&qword_100040EE0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D85C(&qword_100040EE8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = sub_100030160();
  sub_100030090();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v10, v6);
  *(void *)&v15[*(int *)(v12 + 44)] = 0x3FD0000000000000;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for BlendMode.multiply(_:), v1);
  uint64_t v16 = sub_10000D85C(&qword_100040EF0);
  uint64_t v17 = v19[0];
  (*(void (**)(void, char *, uint64_t))(v2 + 16))(v19[0] + *(int *)(v16 + 36), v5, v1);
  sub_1000114D0((uint64_t)v15, v17, &qword_100040EE8);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return sub_100011528((uint64_t)v15, &qword_100040EE8);
}

uint64_t sub_100006D70()
{
  return sub_10002FCB0();
}

void sub_100006D90()
{
  sub_1000119F4();
  sub_100012420(v2, v3, v4);
  sub_10001193C();
  v34[3] = v5;
  __chkstk_darwin(v6, v7);
  uint64_t v8 = sub_100011EA4();
  sub_10001193C();
  __chkstk_darwin(v9, v10);
  sub_10001198C();
  uint64_t v11 = sub_10000D85C(&qword_100040AD8);
  uint64_t v12 = sub_1000119E8(v11);
  __chkstk_darwin(v12, v13);
  sub_100011E60();
  __chkstk_darwin(v14, v15);
  sub_100012314();
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)v34 - v18;
  uint64_t v20 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  if (v20)
  {
    char v21 = (void *)v20;
    sub_10002F9D0();

    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  sub_10000DA40(v0, v22, 1, v8);
  sub_10000F9A0(v0, (uint64_t)v19, &qword_100040AD8);
  sub_10001214C();
  if (sub_10000DA00(v1, 1, v8) == 1)
  {
    sub_10002FA00();
    sub_100011528(v1, &qword_100040AD8);
  }
  else
  {
    uint64_t v23 = sub_100011E0C();
    v24(v23);
  }
  sub_10000F204();
  sub_100011F6C();
  uint64_t v25 = sub_100011F50();
  v26(v25);
  sub_100011528((uint64_t)v19, &qword_100040AD8);
  uint64_t v27 = sub_10001213C();
  v28(v27);
  sub_1000119DC();
  v29();
  uint64_t v30 = sub_100011FAC();
  int v32 = v31(v30);
  if (v32 != enum case for WidgetFamily.systemSmall(_:)
    && v32 != enum case for WidgetFamily.systemMedium(_:)
    && v32 != enum case for WidgetFamily.systemLarge(_:)
    && v32 != enum case for WidgetFamily.systemExtraLarge(_:))
  {
    sub_100011F28();
    v33();
  }
  sub_100011A10();
}

void sub_100007054()
{
  sub_1000119F4();
  sub_100012420(v2, v3, v4);
  sub_10001193C();
  v34[3] = v5;
  __chkstk_darwin(v6, v7);
  uint64_t v8 = sub_100011EA4();
  sub_10001193C();
  __chkstk_darwin(v9, v10);
  sub_10001198C();
  uint64_t v11 = sub_10000D85C(&qword_100040AD8);
  uint64_t v12 = sub_1000119E8(v11);
  __chkstk_darwin(v12, v13);
  sub_100011E60();
  __chkstk_darwin(v14, v15);
  sub_100012314();
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)v34 - v18;
  uint64_t v20 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  if (v20)
  {
    char v21 = (void *)v20;
    sub_10002F9D0();

    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  sub_10000DA40(v0, v22, 1, v8);
  sub_10000F9A0(v0, (uint64_t)v19, &qword_100040AD8);
  sub_10001214C();
  if (sub_10000DA00(v1, 1, v8) == 1)
  {
    sub_10002FA00();
    sub_100011528(v1, &qword_100040AD8);
  }
  else
  {
    uint64_t v23 = sub_100011E0C();
    v24(v23);
  }
  sub_10000F204();
  sub_100011F6C();
  uint64_t v25 = sub_100011F50();
  v26(v25);
  sub_100011528((uint64_t)v19, &qword_100040AD8);
  uint64_t v27 = sub_10001213C();
  v28(v27);
  sub_1000119DC();
  v29();
  uint64_t v30 = sub_100011FAC();
  int v32 = v31(v30);
  if (v32 != enum case for WidgetFamily.systemSmall(_:)
    && v32 != enum case for WidgetFamily.systemMedium(_:)
    && v32 != enum case for WidgetFamily.systemLarge(_:)
    && v32 != enum case for WidgetFamily.systemExtraLarge(_:))
  {
    sub_100011F28();
    v33();
  }
  sub_100011A10();
}

uint64_t (*sub_100007310@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>))(uint64_t a1)
{
  uint64_t result = sub_100004D14();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id sub_100007338()
{
  sub_100012300();
  sub_10000D85C(&qword_100040AA8);
  if (v0 == 2)
  {
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000311D0;
    *(void *)(inited + 32) = UIFontWeightTrait;
    uint64_t v3 = UIFontWeightTrait;
    sub_10002FBD0();
    *(void *)(inited + 64) = sub_100012230();
    *(void *)(inited + 40) = v1;
    *(void *)(inited + 72) = sub_1000307A0();
    uint64_t v4 = sub_1000305B0();
    *(void *)(inited + 104) = &type metadata for String;
    *(void *)(inited + 80) = v4;
    *(void *)(inited + 88) = v5;
  }
  else
  {
    uint64_t v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_1000311E0;
    *(void *)(v6 + 32) = UIFontWidthTrait;
    uint64_t v7 = UIFontWidthTrait;
    sub_10002FBD0();
    unint64_t v8 = sub_100012230();
    *(void *)(v6 + 40) = v1;
    *(void *)(v6 + 64) = v8;
    *(void *)(v6 + 72) = UIFontWeightTrait;
    uint64_t v9 = UIFontWeightTrait;
    v10.super.super.Class isa = sub_10002FBD0().super.super.isa;
    *(void *)(v6 + 104) = v8;
    *(NSNumber *)(v6 + 80) = v10;
    *(void *)(v6 + 112) = sub_1000307A0();
    uint64_t v11 = sub_1000305B0();
    *(void *)(v6 + 144) = &type metadata for String;
    *(void *)(v6 + 120) = v11;
    *(void *)(v6 + 128) = v12;
  }
  type metadata accessor for TraitKey(0);
  sub_10000DFD4(&qword_100040AB8, type metadata accessor for TraitKey);
  uint64_t v13 = sub_100012274();
  sub_10000D85C(&qword_100040AC0);
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000311F0;
  *(void *)(v14 + 32) = UIFontDescriptorTraitsAttribute;
  *(void *)(v14 + 64) = sub_10000D85C(&qword_100040AC8);
  *(void *)(v14 + 40) = v13;
  type metadata accessor for AttributeName(0);
  sub_10000DFD4(&qword_100040AD0, type metadata accessor for AttributeName);
  uint64_t v15 = UIFontDescriptorTraitsAttribute;
  sub_1000122CC();
  id v16 = objc_allocWithZone((Class)UIFontDescriptor);
  Class isa = sub_100012054().super.isa;
  swift_bridgeObjectRelease();
  id v18 = [UIFontDescriptorTraitsAttribute initWithFontAttributes:isa];

  sub_100006D90();
  id result = [self fontWithDescriptor:v18 size:v19];
  if (result)
  {
    uint64_t v21 = sub_10002FFE0();

    return (id)v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100007630()
{
  sub_100012300();
  sub_10000D85C(&qword_100040AA8);
  if (v0 == 2)
  {
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000311D0;
    *(void *)(inited + 32) = UIFontWeightTrait;
    uint64_t v3 = UIFontWeightTrait;
    sub_10002FBD0();
    *(void *)(inited + 64) = sub_100012230();
    *(void *)(inited + 40) = v1;
    *(void *)(inited + 72) = sub_1000307A0();
    uint64_t v4 = sub_1000305B0();
    *(void *)(inited + 104) = &type metadata for String;
    *(void *)(inited + 80) = v4;
    *(void *)(inited + 88) = v5;
  }
  else
  {
    uint64_t v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_1000311E0;
    *(void *)(v6 + 32) = UIFontWidthTrait;
    uint64_t v7 = UIFontWidthTrait;
    sub_10002FBD0();
    unint64_t v8 = sub_100012230();
    *(void *)(v6 + 40) = v1;
    *(void *)(v6 + 64) = v8;
    *(void *)(v6 + 72) = UIFontWeightTrait;
    uint64_t v9 = UIFontWeightTrait;
    v10.super.super.Class isa = sub_10002FBD0().super.super.isa;
    *(void *)(v6 + 104) = v8;
    *(NSNumber *)(v6 + 80) = v10;
    *(void *)(v6 + 112) = sub_1000307A0();
    uint64_t v11 = sub_1000305B0();
    *(void *)(v6 + 144) = &type metadata for String;
    *(void *)(v6 + 120) = v11;
    *(void *)(v6 + 128) = v12;
  }
  type metadata accessor for TraitKey(0);
  sub_10000DFD4(&qword_100040AB8, type metadata accessor for TraitKey);
  uint64_t v13 = sub_100012274();
  sub_10000D85C(&qword_100040AC0);
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000311F0;
  *(void *)(v14 + 32) = UIFontDescriptorTraitsAttribute;
  *(void *)(v14 + 64) = sub_10000D85C(&qword_100040AC8);
  *(void *)(v14 + 40) = v13;
  type metadata accessor for AttributeName(0);
  sub_10000DFD4(&qword_100040AD0, type metadata accessor for AttributeName);
  uint64_t v15 = UIFontDescriptorTraitsAttribute;
  sub_1000122CC();
  id v16 = objc_allocWithZone((Class)UIFontDescriptor);
  Class isa = sub_100012054().super.isa;
  swift_bridgeObjectRelease();
  id v18 = [UIFontDescriptorTraitsAttribute initWithFontAttributes:isa];

  sub_100007054();
  id result = [self fontWithDescriptor:v18 size:v19];
  if (result)
  {
    uint64_t v21 = sub_10002FFE0();

    return (id)v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100007928(void *a1)
{
  type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  sub_1000122C0();
  if (!*(void *)(v2 + *a1 + 8)) {
    return 0;
  }
  sub_10000F204();
  return sub_1000307F0();
}

uint64_t sub_100007998()
{
  return sub_1000300F0();
}

uint64_t (*sub_1000079B4@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>))(uint64_t a1)
{
  id result = sub_100004E28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000079DC()
{
  uint64_t v1 = sub_1000303B0();
  uint64_t v55 = *(void *)(v1 - 8);
  uint64_t v56 = v1;
  __chkstk_darwin(v1, v2);
  uint64_t v54 = (char *)v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D85C(&qword_100040AD8);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v53 = (uint64_t)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)v50 - v10;
  __chkstk_darwin(v9, v12);
  uint64_t v57 = (void *)((char *)v50 - v13);
  uint64_t v14 = sub_10002FA10();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  double v19 = (char *)v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v17, v20);
  uint64_t v23 = (char *)v50 - v22;
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)v50 - v25;
  uint64_t v51 = v0;
  uint64_t v27 = sub_100007928(&OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  uint64_t v29 = v28;
  if (qword_1000405E8 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_10000F4F8(v14, (uint64_t)qword_1000405F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v26, v30, v14);
  uint64_t v59 = v27;
  uint64_t v60 = v29;
  sub_10002F9F0();
  uint64_t v31 = 1;
  v50[1] = sub_10000F204();
  sub_1000307E0();
  int v52 = v32;
  v50[0] = v15;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v15 + 8);
  v33(v23, v14);
  v33(v26, v14);
  swift_bridgeObjectRelease();
  uint64_t v34 = sub_100007928(&OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  uint64_t v36 = v35;
  uint64_t v37 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    sub_10002F9D0();

    uint64_t v31 = 0;
  }
  uint64_t v39 = v55;
  sub_10000DA40((uint64_t)v11, v31, 1, v14);
  uint64_t v40 = (uint64_t)v11;
  uint64_t v41 = (void (*)(void, void, void))v57;
  sub_10000F9A0(v40, (uint64_t)v57, &qword_100040AD8);
  uint64_t v59 = v34;
  uint64_t v60 = v36;
  uint64_t v42 = v53;
  sub_1000114D0((uint64_t)v41, v53, &qword_100040AD8);
  if (sub_10000DA00(v42, 1, v14) == 1)
  {
    sub_10002FA00();
    sub_100011528(v42, &qword_100040AD8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v50[0] + 32))(v19, v42, v14);
  }
  uint64_t v43 = v56;
  uint64_t v44 = v54;
  sub_1000307E0();
  LODWORD(v56) = v45;
  v33(v19, v14);
  sub_100011528((uint64_t)v57, &qword_100040AD8);
  swift_bridgeObjectRelease();
  type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  uint64_t v57 = *(void **)(v39 + 104);
  ((void (*)(char *, void, uint64_t))v57)(v44, enum case for WidgetFamily.systemSmall(_:), v43);
  sub_10000DFD4(&qword_100040BF0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100030610();
  sub_100030610();
  uint64_t v47 = v58;
  uint64_t v46 = v59;
  uint64_t v48 = *(uint64_t (**)(char *, uint64_t))(v39 + 8);
  uint64_t result = v48(v44, v43);
  if (v46 != v47)
  {
    ((void (*)(char *, void, uint64_t))v57)(v44, enum case for WidgetFamily.systemExtraLarge(_:), v43);
    sub_100030610();
    sub_100030610();
    return v48(v44, v43);
  }
  return result;
}

uint64_t sub_10000805C()
{
  uint64_t v1 = sub_1000303B0();
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v58 = v1;
  __chkstk_darwin(v1, v2);
  uint64_t v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000D85C(&qword_100040AD8);
  uint64_t v7 = __chkstk_darwin(v5 - 8, v6);
  uint64_t v55 = (uint64_t)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v12 = (char *)&v53 - v11;
  __chkstk_darwin(v10, v13);
  uint64_t v59 = (unint64_t *)((char *)&v53 - v14);
  uint64_t v15 = sub_10002FA10();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v18, v21);
  uint64_t v24 = (char *)&v53 - v23;
  __chkstk_darwin(v22, v25);
  uint64_t v27 = (char *)&v53 - v26;
  uint64_t v60 = *(int *)(type metadata accessor for PhotosReliveWidgetPlaceholderContent(0) + 20);
  uint64_t v61 = v0;
  uint64_t v28 = (uint64_t *)(*(void *)(v0 + v60) + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  unint64_t v29 = v28[1];
  uint64_t v56 = v4;
  if (v29)
  {
    uint64_t v30 = *v28;
    unint64_t v31 = v29;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
  }
  uint64_t v32 = qword_1000405E8;
  swift_bridgeObjectRetain();
  if (v32 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_10000F4F8(v15, (uint64_t)qword_1000405F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v27, v33, v15);
  uint64_t v63 = v30;
  unint64_t v64 = v31;
  sub_10002F9F0();
  unint64_t v53 = sub_10000F204();
  sub_1000307E0();
  int v54 = v34;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v16 + 8);
  v35(v24, v15);
  v35(v27, v15);
  swift_bridgeObjectRelease();
  uint64_t v36 = (uint64_t *)(*(void *)(v61 + v60) + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  if (v36[1])
  {
    uint64_t v37 = *v36;
    unint64_t v38 = v36[1];
  }
  else
  {
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
  }
  uint64_t v39 = v58;
  swift_bridgeObjectRetain();
  uint64_t v40 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  if (v40)
  {
    uint64_t v41 = (void *)v40;
    sub_10002F9D0();

    uint64_t v42 = 0;
  }
  else
  {
    uint64_t v42 = 1;
  }
  sub_10000DA40((uint64_t)v12, v42, 1, v15);
  uint64_t v43 = (uint64_t)v12;
  uint64_t v44 = (void (*)(void, void, void))v59;
  sub_10000F9A0(v43, (uint64_t)v59, &qword_100040AD8);
  uint64_t v63 = v37;
  unint64_t v64 = v38;
  uint64_t v45 = v55;
  sub_1000114D0((uint64_t)v44, v55, &qword_100040AD8);
  if (sub_10000DA00(v45, 1, v15) == 1)
  {
    sub_10002FA00();
    sub_100011528(v45, &qword_100040AD8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v20, v45, v15);
  }
  uint64_t v46 = v57;
  sub_1000307E0();
  LODWORD(v58) = v47;
  v35(v20, v15);
  sub_100011528((uint64_t)v59, &qword_100040AD8);
  swift_bridgeObjectRelease();
  uint64_t v48 = v56;
  uint64_t v59 = *(unint64_t **)(v46 + 104);
  ((void (*)(char *, void, uint64_t))v59)(v56, enum case for WidgetFamily.systemSmall(_:), v39);
  sub_10000DFD4(&qword_100040BF0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100030610();
  sub_100030610();
  uint64_t v50 = v62;
  uint64_t v49 = v63;
  uint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v46 + 8);
  uint64_t result = v51(v48, v39);
  if (v49 != v50)
  {
    ((void (*)(char *, void, uint64_t))v59)(v48, enum case for WidgetFamily.systemExtraLarge(_:), v39);
    sub_100030610();
    sub_100030610();
    return v51(v48, v39);
  }
  return result;
}

double sub_100008710(void (*a1)(uint64_t))
{
  sub_1000303B0();
  sub_10001193C();
  __chkstk_darwin(v2, v3);
  sub_1000119C4();
  uint64_t v4 = sub_100011F94();
  a1(v4);
  sub_1000122C0();
  sub_100011CAC();
  v5();
  sub_10000DFD4(&qword_100040BF0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100030610();
  sub_100030610();
  sub_100011FA0();
  v6();
  double result = 18.0;
  if (v9 == v8) {
    return 14.0;
  }
  return result;
}

uint64_t sub_10000884C(uint64_t a1, void *a2, void (*a3)(uint64_t))
{
  sub_100007928(a2);
  sub_10000F204();
  sub_100030080();
  sub_1000122EC();
  uint64_t v8 = sub_100007928(a2);
  a3(v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_100030060();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_10000EABC(v3, v4, v5);
  swift_bridgeObjectRelease();
  sub_100030180();
  sub_100012260();
  uint64_t v14 = sub_100030050();
  swift_release();
  sub_10000EABC(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_100008998(uint64_t a1, void *a2, void (*a3)(uint64_t, unint64_t, uint64_t, uint64_t (*)(uint64_t a1)))
{
  type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  sub_1000122C0();
  uint64_t v7 = (uint64_t *)(v6 + *a2);
  uint64_t v8 = v7[1];
  if (v8) {
    uint64_t v9 = *v7;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    unint64_t v10 = v7[1];
  }
  else {
    unint64_t v10 = 0xE000000000000000;
  }
  sub_10000F204();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_100030080();
  sub_100012104();
  swift_bridgeObjectRetain();
  a3(v9, v10, a1, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_100030060();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_100012368(v11);
  swift_bridgeObjectRelease();
  sub_100030180();
  sub_100012260();
  uint64_t v17 = sub_100030050();
  swift_release();
  sub_10000EABC(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  return v17;
}

void sub_100008B0C()
{
  sub_1000119F4();
  double v82 = v1;
  uint64_t v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_100011F94();
  uint64_t v12 = v11(v10);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12, v14);
  char v16 = (char *)&v73 - v15;
  uint64_t v17 = sub_10000D85C(&qword_100040BF8);
  uint64_t v18 = sub_1000119E8(v17);
  __chkstk_darwin(v18, v19);
  sub_100011978();
  uint64_t v83 = v20;
  sub_10002FC00();
  sub_10001193C();
  __chkstk_darwin(v21, v22);
  sub_100011A58();
  uint64_t v23 = *(int *)(v13 + 28);
  uint64_t v24 = *(void *)(v0 + v23);
  int v25 = *(unsigned __int8 *)(v24 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout);
  int v26 = *(unsigned __int8 *)(v24
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 1);
  double v27 = *(double *)(v24 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 8);
  int v28 = *(unsigned __int8 *)(v24
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 16);
  int v29 = *(unsigned __int8 *)(v24
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 24);
  int v30 = *(unsigned __int8 *)(v24
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 25);
  uint64_t v31 = *(void *)(v24 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 32);
  int v32 = *(unsigned __int8 *)(v24
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 40);
  if (!*(unsigned char *)(v24 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 1)) {
    goto LABEL_24;
  }
  if (v26 != 1)
  {
    if (!*(void *)(v24 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title + 8))
    {
      LOBYTE(v26) = 2;
      goto LABEL_24;
    }
    int v78 = *(unsigned __int8 *)(v24
                             + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                             + 40);
    int v79 = v25;
    int v80 = v30;
    uint64_t v81 = v31;
    uint64_t v45 = self;
    swift_bridgeObjectRetain();
    id v46 = [v45 defaultSpecs];
    NSString v47 = sub_100030580();
    swift_bridgeObjectRelease();
    [v46 maximumWidthForTitle:v47 containerSize:v7, v5];
    double v49 = v48;

    sub_10000F9F0(v0, (uint64_t)v16);
    if (v49 <= 0.0)
    {
      sub_10000FBFC((uint64_t)v16);
    }
    else
    {
      uint64_t v76 = v0;
      int v77 = v29;
      v75 = v3;
      uint64_t v50 = ((uint64_t (*)(uint64_t, uint64_t *, id (*)()))v3)(2, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_100007338);
      uint64_t v52 = v51;
      unint64_t v53 = v46;
      uint64_t v55 = v54;
      char v57 = v56 & 1;
      sub_100030000();
      uint64_t v58 = sub_1000121D0();
      uint64_t v74 = v59;
      sub_10000DA40(v58, v60, v61, v59);
      unint64_t v62 = sub_100030010();
      sub_10000EABC(v50, v52, v57);
      swift_bridgeObjectRelease();
      sub_100011528((uint64_t)v3, &qword_100040BF8);
      unint64_t v63 = (unint64_t)[v53 maximumNumberOfLinesForTitle];
      sub_10000FBFC((uint64_t)v16);
      if ((v63 & 0x8000000000000000) == 0 && v63 >= v62)
      {
        if (v80 == 2)
        {
          double v82 = v49;
          LOBYTE(v29) = v77;
          if (*(void *)(*(void *)(v76 + v23)
                         + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle
                         + 8))
          {
            swift_bridgeObjectRetain();
            NSString v64 = sub_100030580();
            swift_bridgeObjectRelease();
          }
          else
          {
            NSString v64 = 0;
          }
          [v53 maximumWidthForSubtitle:v64 titleWidth:v49];
          uint64_t v66 = v65;

          uint64_t v81 = v66;
          LOBYTE(v26) = 2;
          v75(2, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_100007630);
          sub_1000122EC();
          uint64_t v67 = sub_1000121D0();
          sub_10000DA40(v67, v68, v69, v74);
          unint64_t v70 = sub_100030010();
          sub_10000EABC(v23, v55, v52);
          swift_bridgeObjectRelease();
          sub_100011528((uint64_t)v64, &qword_100040BF8);
          id v71 = [v53 maximumNumberOfLinesForSubtitle];

          uint64_t v31 = v81;
          double v27 = v82;
          LOBYTE(v32) = 0;
          LOBYTE(v28) = 0;
          if ((unint64_t)v71 < v70 || (uint64_t)v71 < 0) {
            LOBYTE(v30) = 0;
          }
          else {
            LOBYTE(v30) = 2;
          }
          LOBYTE(v25) = v79;
        }
        else
        {

          double v27 = v49;
          LOBYTE(v25) = v79;
          LOBYTE(v30) = v80;
          LOBYTE(v28) = 0;
          LOBYTE(v26) = 2;
          LOBYTE(v29) = v77;
          LOBYTE(v32) = v78;
          uint64_t v31 = v81;
        }
        goto LABEL_24;
      }
    }
    uint64_t v31 = 0;
    LOBYTE(v30) = 0;
    double v27 = 0.0;
    LOBYTE(v26) = 0;
    LOBYTE(v29) = 2;
    LOBYTE(v32) = 1;
    LOBYTE(v28) = 1;
    LOBYTE(v25) = 2;
    goto LABEL_24;
  }
  int v79 = *(unsigned __int8 *)(v24 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout);
  int v80 = v30;
  uint64_t v81 = v31;
  double v82 = v27;
  int v78 = v32;
  LODWORD(v76) = v28;
  sub_10002FBF0();
  uint64_t v33 = ((uint64_t (*)(uint64_t, uint64_t *, id (*)()))v3)(1, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_100007338);
  uint64_t v35 = v34;
  int v77 = v29;
  char v37 = v36 & 1;
  uint64_t v38 = v83;
  sub_10002FFF0();
  uint64_t v39 = sub_100030000();
  sub_10000DA40(v38, 0, 1, v39);
  v75 = (void (*)(uint64_t, uint64_t *, id (*)()))sub_100030010();
  char v40 = v37;
  LOBYTE(v29) = v77;
  sub_10000EABC(v33, v35, v40);
  swift_bridgeObjectRelease();
  sub_100011528(v38, &qword_100040BF8);
  uint64_t v41 = sub_10002FBE0();
  sub_100011F28();
  v42();
  LOBYTE(v28) = v76;
  uint64_t v31 = v81;
  double v27 = v82;
  LOBYTE(v32) = v78;
  LOBYTE(v25) = v79;
  LOBYTE(v30) = v80;
  BOOL v43 = v41 >= 0 && v41 >= (unint64_t)v75;
  int v44 = !v43;
  if (!v43)
  {
    LOBYTE(v32) = 1;
    LOBYTE(v28) = 1;
  }
  if (v44)
  {
    uint64_t v31 = 0;
    LOBYTE(v30) = 0;
    LOBYTE(v29) = 2;
    double v27 = 0.0;
  }
  LOBYTE(v26) = v44 ^ 1;
  if (v44) {
    LOBYTE(v25) = 2;
  }
LABEL_24:
  *(unsigned char *)uint64_t v9 = v25;
  *(unsigned char *)(v9 + 1) = v26;
  *(double *)(v9 + 8) = v27;
  *(unsigned char *)(v9 + 16) = v28;
  *(unsigned char *)(v9 + 24) = v29;
  *(unsigned char *)(v9 + 25) = v30;
  *(void *)(v9 + 32) = v31;
  *(unsigned char *)(v9 + 40) = v32;
  sub_100011A10();
}

uint64_t sub_100009100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t *a4@<X8>)
{
  *a4 = sub_100030270();
  a4[1] = v8;
  sub_10000D85C(&qword_100040990);
  return a3(a1, a2);
}

uint64_t sub_100009160@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_10000D85C(&qword_100040998);
  uint64_t v5 = __chkstk_darwin(v3 - 8, v4);
  uint64_t v38 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = sub_10000D85C(&qword_1000409A0);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v36 - v16;
  sub_10002FCE0();
  uint64_t v18 = *(void *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetMemoryContent(0) + 20))
      + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily;
  sub_1000040A0(v18, 0);
  sub_10002FCE0();
  sub_1000041F4(v18, 0);
  sub_100008B0C();
  uint64_t v19 = v43;
  char v20 = v44;
  unsigned int v21 = v42;
  char v22 = sub_1000248D8(v39, v40, v41, v42, v43, v44);
  sub_1000079DC();
  double v24 = v23;
  double v26 = v25;
  double v27 = sub_100008710((void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
  *(void *)uint64_t v17 = sub_10002FE80();
  *((void *)v17 + 1) = 0;
  uint64_t v28 = 1;
  v17[16] = 1;
  uint64_t v29 = sub_10000D85C(&qword_1000409A8);
  sub_100009880(a1, &v39, v22 & 1, &v17[*(int *)(v29 + 44)], v24, v26, v27);
  if ((v22 & 1) == 0)
  {
    *(void *)uint64_t v9 = sub_10002FE80();
    *((void *)v9 + 1) = 0;
    v9[16] = 1;
    uint64_t v30 = sub_10000D85C(&qword_1000409B0);
    sub_10000C08C(a1, v21, v19, v20, (uint64_t)type metadata accessor for PhotosReliveWidgetMemoryContent, (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t))sub_10000C3A4, &v9[*(int *)(v30 + 44)]);
    uint64_t v28 = 0;
  }
  uint64_t v31 = sub_10000D85C(&qword_1000409B8);
  sub_10000DA40((uint64_t)v9, v28, 1, v31);
  sub_1000114D0((uint64_t)v17, (uint64_t)v14, &qword_1000409A0);
  uint64_t v32 = v38;
  sub_1000114D0((uint64_t)v9, v38, &qword_100040998);
  uint64_t v33 = v37;
  sub_1000114D0((uint64_t)v14, v37, &qword_1000409A0);
  uint64_t v34 = sub_10000D85C(&qword_1000409C0);
  sub_1000114D0(v32, v33 + *(int *)(v34 + 48), &qword_100040998);
  sub_100011528((uint64_t)v9, &qword_100040998);
  sub_100011528((uint64_t)v17, &qword_1000409A0);
  sub_100011528(v32, &qword_100040998);
  return sub_100011528((uint64_t)v14, &qword_1000409A0);
}

uint64_t sub_1000094F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_10000D85C(&qword_100040998);
  uint64_t v5 = __chkstk_darwin(v3 - 8, v4);
  uint64_t v38 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = sub_10000D85C(&qword_1000409A0);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v36 - v16;
  sub_10002FCE0();
  uint64_t v18 = *(void *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetPlaceholderContent(0) + 20))
      + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily;
  sub_1000040A0(v18, 0);
  sub_10002FCE0();
  sub_1000041F4(v18, 0);
  sub_100008B0C();
  uint64_t v19 = v43;
  char v20 = v44;
  unsigned int v21 = v42;
  char v22 = sub_1000248D8(v39, v40, v41, v42, v43, v44);
  sub_10000805C();
  double v24 = v23;
  double v26 = v25;
  double v27 = sub_100008710((void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  *(void *)uint64_t v17 = sub_10002FE80();
  *((void *)v17 + 1) = 0;
  uint64_t v28 = 1;
  v17[16] = 1;
  uint64_t v29 = sub_10000D85C(&qword_1000409A8);
  sub_100009F14(a1, &v39, v22 & 1, &v17[*(int *)(v29 + 44)], v24, v26, v27);
  if ((v22 & 1) == 0)
  {
    *(void *)uint64_t v9 = sub_10002FE80();
    *((void *)v9 + 1) = 0;
    v9[16] = 1;
    uint64_t v30 = sub_10000D85C(&qword_1000409B0);
    sub_10000C08C(a1, v21, v19, v20, (uint64_t)type metadata accessor for PhotosReliveWidgetPlaceholderContent, (void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t))sub_10000C3D0, &v9[*(int *)(v30 + 44)]);
    uint64_t v28 = 0;
  }
  uint64_t v31 = sub_10000D85C(&qword_1000409B8);
  sub_10000DA40((uint64_t)v9, v28, 1, v31);
  sub_1000114D0((uint64_t)v17, (uint64_t)v14, &qword_1000409A0);
  uint64_t v32 = v38;
  sub_1000114D0((uint64_t)v9, v38, &qword_100040998);
  uint64_t v33 = v37;
  sub_1000114D0((uint64_t)v14, v37, &qword_1000409A0);
  uint64_t v34 = sub_10000D85C(&qword_1000409C0);
  sub_1000114D0(v32, v33 + *(int *)(v34 + 48), &qword_100040998);
  sub_100011528((uint64_t)v9, &qword_100040998);
  sub_100011528((uint64_t)v17, &qword_1000409A0);
  sub_100011528(v32, &qword_100040998);
  return sub_100011528((uint64_t)v14, &qword_1000409A0);
}

uint64_t sub_100009880@<X0>(uint64_t a1@<X0>, _WORD *a2@<X1>, int a3@<W2>, void *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D3>)
{
  int v81 = a3;
  uint64_t v83 = a4;
  uint64_t v12 = sub_10000D85C(&qword_100040AE0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v73 = (_WORD **)((char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v69 = sub_1000303B0();
  uint64_t v15 = *(void *)(v69 - 8);
  __chkstk_darwin(v69, v16);
  uint64_t v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000D85C(&qword_100040AE8);
  char v20 = (int *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  double v23 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_10000D85C(&qword_100040AF0) - 8;
  __chkstk_darwin(v72, v24);
  uint64_t v70 = (uint64_t)&v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10000D85C(&qword_100040AF8) - 8;
  __chkstk_darwin(v75, v26);
  uint64_t v71 = (uint64_t)&v68 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_10000D85C(&qword_100040B00) - 8;
  __chkstk_darwin(v77, v28);
  uint64_t v74 = (uint64_t)&v68 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_10000D85C(&qword_100040B08) - 8;
  uint64_t v31 = __chkstk_darwin(v80, v30);
  uint64_t v82 = (uint64_t)&v68 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __chkstk_darwin(v31, v33);
  uint64_t v76 = (uint64_t)&v68 - v35;
  __chkstk_darwin(v34, v36);
  uint64_t v78 = (uint64_t)&v68 - v37;
  uint64_t v68 = a2;
  uint64_t v38 = sub_10000A5A8(*a2);
  uint64_t v40 = v39;
  sub_10002FED0();
  int v79 = sub_10002FEA0();
  uint64_t v41 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  unsigned __int16 v42 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v43 = v69;
  v42(v18, *(void *)(a1 + *(int *)(v41 + 20))+ OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v69);
  v42(&v23[v20[11]], (uint64_t)v18, v43);
  v23[v20[12]] = 0;
  *(void *)&v23[v20[13]] = v38;
  *(void *)&v23[v20[14]] = v40;
  char v44 = v73;
  sub_10000A638(v40, (uint64_t)v68, v38, v81, (uint64_t (*)(void, uint64_t *, id (*)()))sub_10000884C, v73, a5, a6);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v43);
  sub_10000F9A0((uint64_t)v44, (uint64_t)v23, &qword_100040AE0);
  uint64_t v45 = sub_10002FE60();
  uint64_t v46 = swift_allocObject();
  *(double *)(v46 + 16) = a7;
  uint64_t v47 = v70;
  sub_1000114D0((uint64_t)v23, v70, &qword_100040AE8);
  double v48 = (uint64_t *)(v47 + *(int *)(v72 + 44));
  *double v48 = v45;
  v48[1] = (uint64_t)sub_10000F2BC;
  v48[2] = v46;
  sub_100011528((uint64_t)v23, &qword_100040AE8);
  uint64_t v49 = sub_10002FEC0();
  uint64_t v50 = swift_allocObject();
  *(double *)(v50 + 16) = a7;
  uint64_t v51 = v71;
  sub_1000114D0(v47, v71, &qword_100040AF0);
  uint64_t v52 = (uint64_t *)(v51 + *(int *)(v75 + 44));
  *uint64_t v52 = v49;
  v52[1] = (uint64_t)sub_100011924;
  v52[2] = v50;
  sub_100011528(v47, &qword_100040AF0);
  uint64_t v53 = sub_10002FED0();
  uint64_t v54 = swift_allocObject();
  *(double *)(v54 + 16) = a7;
  uint64_t v55 = v74;
  sub_1000114D0(v51, v74, &qword_100040AF8);
  char v56 = (uint64_t *)(v55 + *(int *)(v77 + 44));
  *char v56 = v53;
  v56[1] = (uint64_t)sub_100011924;
  v56[2] = v54;
  sub_100011528(v51, &qword_100040AF8);
  uint64_t v57 = sub_10002FE70();
  uint64_t v58 = swift_allocObject();
  *(double *)(v58 + 16) = a7;
  uint64_t v59 = v76;
  sub_1000114D0(v55, v76, &qword_100040B00);
  uint64_t v60 = (uint64_t *)(v59 + *(int *)(v80 + 44));
  *uint64_t v60 = v57;
  v60[1] = (uint64_t)sub_100011924;
  v60[2] = v58;
  sub_100011528(v55, &qword_100040B00);
  uint64_t v61 = v78;
  sub_10000F9A0(v59, v78, &qword_100040B08);
  sub_10002FEC0();
  LOBYTE(v57) = sub_10002FEA0();
  uint64_t v62 = v82;
  sub_1000114D0(v61, v82, &qword_100040B08);
  unint64_t v63 = v83;
  *uint64_t v83 = 0;
  *((unsigned char *)v63 + 8) = 0;
  *((unsigned char *)v63 + 9) = (v79 & 1) == 0;
  NSString v64 = v63;
  uint64_t v65 = sub_10000D85C(&qword_100040B10);
  sub_1000114D0(v62, (uint64_t)v64 + *(int *)(v65 + 48), &qword_100040B08);
  uint64_t v66 = (uint64_t)v64 + *(int *)(v65 + 64);
  *(void *)uint64_t v66 = 0;
  *(unsigned char *)(v66 + 8) = 0;
  *(unsigned char *)(v66 + 9) = (v57 & 1) == 0;
  sub_100011528(v61, &qword_100040B08);
  return sub_100011528(v62, &qword_100040B08);
}

uint64_t sub_100009F14@<X0>(uint64_t a1@<X0>, _WORD *a2@<X1>, int a3@<W2>, void *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D3>)
{
  int v81 = a3;
  uint64_t v83 = a4;
  uint64_t v12 = sub_10000D85C(&qword_100040AE0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v73 = (_WORD **)((char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v69 = sub_1000303B0();
  uint64_t v15 = *(void *)(v69 - 8);
  __chkstk_darwin(v69, v16);
  uint64_t v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000D85C(&qword_100040AE8);
  char v20 = (int *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  double v23 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_10000D85C(&qword_100040AF0) - 8;
  __chkstk_darwin(v72, v24);
  uint64_t v70 = (uint64_t)&v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10000D85C(&qword_100040AF8) - 8;
  __chkstk_darwin(v75, v26);
  uint64_t v71 = (uint64_t)&v68 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_10000D85C(&qword_100040B00) - 8;
  __chkstk_darwin(v77, v28);
  uint64_t v74 = (uint64_t)&v68 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_10000D85C(&qword_100040B08) - 8;
  uint64_t v31 = __chkstk_darwin(v80, v30);
  uint64_t v82 = (uint64_t)&v68 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __chkstk_darwin(v31, v33);
  uint64_t v76 = (uint64_t)&v68 - v35;
  __chkstk_darwin(v34, v36);
  uint64_t v78 = (uint64_t)&v68 - v37;
  uint64_t v68 = a2;
  uint64_t v38 = sub_10000A5A8(*a2);
  uint64_t v40 = v39;
  sub_10002FED0();
  int v79 = sub_10002FEA0();
  uint64_t v41 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  unsigned __int16 v42 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v43 = v69;
  v42(v18, *(void *)(a1 + *(int *)(v41 + 20))+ OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v69);
  v42(&v23[v20[11]], (uint64_t)v18, v43);
  v23[v20[12]] = 0;
  *(void *)&v23[v20[13]] = v38;
  *(void *)&v23[v20[14]] = v40;
  char v44 = v73;
  sub_10000A638(v40, (uint64_t)v68, v38, v81, (uint64_t (*)(void, uint64_t *, id (*)()))sub_100008998, v73, a5, a6);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v43);
  sub_10000F9A0((uint64_t)v44, (uint64_t)v23, &qword_100040AE0);
  uint64_t v45 = sub_10002FE60();
  uint64_t v46 = swift_allocObject();
  *(double *)(v46 + 16) = a7;
  uint64_t v47 = v70;
  sub_1000114D0((uint64_t)v23, v70, &qword_100040AE8);
  double v48 = (uint64_t *)(v47 + *(int *)(v72 + 44));
  *double v48 = v45;
  v48[1] = (uint64_t)sub_100011924;
  v48[2] = v46;
  sub_100011528((uint64_t)v23, &qword_100040AE8);
  uint64_t v49 = sub_10002FEC0();
  uint64_t v50 = swift_allocObject();
  *(double *)(v50 + 16) = a7;
  uint64_t v51 = v71;
  sub_1000114D0(v47, v71, &qword_100040AF0);
  uint64_t v52 = (uint64_t *)(v51 + *(int *)(v75 + 44));
  *uint64_t v52 = v49;
  v52[1] = (uint64_t)sub_100011924;
  v52[2] = v50;
  sub_100011528(v47, &qword_100040AF0);
  uint64_t v53 = sub_10002FED0();
  uint64_t v54 = swift_allocObject();
  *(double *)(v54 + 16) = a7;
  uint64_t v55 = v74;
  sub_1000114D0(v51, v74, &qword_100040AF8);
  char v56 = (uint64_t *)(v55 + *(int *)(v77 + 44));
  *char v56 = v53;
  v56[1] = (uint64_t)sub_100011924;
  v56[2] = v54;
  sub_100011528(v51, &qword_100040AF8);
  uint64_t v57 = sub_10002FE70();
  uint64_t v58 = swift_allocObject();
  *(double *)(v58 + 16) = a7;
  uint64_t v59 = v76;
  sub_1000114D0(v55, v76, &qword_100040B00);
  uint64_t v60 = (uint64_t *)(v59 + *(int *)(v80 + 44));
  *uint64_t v60 = v57;
  v60[1] = (uint64_t)sub_100011924;
  v60[2] = v58;
  sub_100011528(v55, &qword_100040B00);
  uint64_t v61 = v78;
  sub_10000F9A0(v59, v78, &qword_100040B08);
  sub_10002FEC0();
  LOBYTE(v57) = sub_10002FEA0();
  uint64_t v62 = v82;
  sub_1000114D0(v61, v82, &qword_100040B08);
  unint64_t v63 = v83;
  *uint64_t v83 = 0;
  *((unsigned char *)v63 + 8) = 0;
  *((unsigned char *)v63 + 9) = (v79 & 1) == 0;
  NSString v64 = v63;
  uint64_t v65 = sub_10000D85C(&qword_100040B10);
  sub_1000114D0(v62, (uint64_t)v64 + *(int *)(v65 + 48), &qword_100040B08);
  uint64_t v66 = (uint64_t)v64 + *(int *)(v65 + 64);
  *(void *)uint64_t v66 = 0;
  *(unsigned char *)(v66 + 8) = 0;
  *(unsigned char *)(v66 + 9) = (v57 & 1) == 0;
  sub_100011528(v61, &qword_100040B08);
  return sub_100011528(v62, &qword_100040B08);
}

uint64_t sub_10000A5A8(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = sub_10002FED0();
      goto LABEL_4;
    case 2:
      uint64_t v3 = sub_10002FEC0();
      goto LABEL_8;
    case 3:
      uint64_t v3 = sub_10002FED0();
      goto LABEL_8;
    case 4:
      uint64_t v3 = sub_10002FEB0();
LABEL_8:
      uint64_t v2 = v3;
      sub_10002FE70();
      break;
    default:
      uint64_t v1 = sub_10002FEC0();
LABEL_4:
      uint64_t v2 = v1;
      sub_10002FE60();
      break;
  }
  return v2;
}

uint64_t sub_10000A638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, int a4@<W4>, uint64_t (*a5)(void, uint64_t *, id (*)())@<X5>, void *a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  v199 = a5;
  LODWORD(v186) = a4;
  uint64_t v187 = a3;
  v207 = a6;
  uint64_t v171 = sub_10002FE40();
  sub_10001193C();
  uint64_t v170 = v16;
  __chkstk_darwin(v17, v18);
  sub_100011978();
  sub_1000119A4(v19);
  uint64_t v175 = sub_10000D85C(&qword_100040B18);
  sub_10001193C();
  uint64_t v174 = v20;
  __chkstk_darwin(v21, v22);
  sub_100011978();
  sub_1000119A4(v23);
  uint64_t v205 = sub_10000D85C(&qword_100040B20);
  sub_100011958();
  __chkstk_darwin(v24, v25);
  sub_100011A2C();
  sub_100012038();
  __chkstk_darwin(v26, v27);
  sub_100011C84();
  sub_1000119A4(v28);
  uint64_t v29 = sub_10000D85C(&qword_100040B28);
  sub_100011958();
  __chkstk_darwin(v30, v31);
  sub_100011978();
  sub_1000119A4(v32);
  uint64_t v169 = sub_10000D85C(&qword_1000409E0);
  sub_100011958();
  __chkstk_darwin(v33, v34);
  sub_100011978();
  sub_1000119A4(v35);
  uint64_t v178 = sub_10000D85C(&qword_1000409E8);
  sub_100011958();
  __chkstk_darwin(v36, v37);
  sub_100011978();
  sub_1000119A4(v38);
  uint64_t v184 = sub_10000D85C(&qword_100040B30);
  sub_10001193C();
  uint64_t v183 = v39;
  __chkstk_darwin(v40, v41);
  sub_100011978();
  uint64_t v182 = v42;
  uint64_t v191 = sub_100030000();
  sub_10001193C();
  uint64_t v173 = v43;
  __chkstk_darwin(v44, v45);
  uint64_t v47 = (char *)&v167 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = sub_10000D85C(&qword_100040B38);
  sub_10001193C();
  uint64_t v180 = v48;
  __chkstk_darwin(v49, v50);
  sub_1000119A4((uint64_t)&v167 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v201 = sub_10000D85C(&qword_100040B40);
  sub_100011958();
  __chkstk_darwin(v52, v53);
  sub_100011978();
  sub_1000119A4(v54);
  uint64_t v195 = sub_10000D85C(&qword_100040B48);
  sub_100011958();
  __chkstk_darwin(v55, v56);
  sub_1000119A4((uint64_t)&v167 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v196 = sub_10000D85C(&qword_100040B50);
  sub_100011958();
  __chkstk_darwin(v58, v59);
  sub_1000120D4();
  uint64_t v203 = sub_10000D85C(&qword_100040B58);
  sub_100011958();
  __chkstk_darwin(v60, v61);
  sub_100011978();
  uint64_t v198 = v62;
  uint64_t v193 = sub_100030040();
  sub_10001193C();
  uint64_t v192 = v63;
  __chkstk_darwin(v64, v65);
  sub_1000119A4((uint64_t)&v167 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v189 = sub_10000D85C(&qword_100040A18);
  sub_10001193C();
  uint64_t v188 = v67;
  __chkstk_darwin(v68, v69);
  sub_1000119C4();
  uint64_t v70 = sub_10000D85C(&qword_100040A20);
  sub_100011958();
  __chkstk_darwin(v71, v72);
  sub_10001198C();
  uint64_t v168 = sub_10000D85C(&qword_100040A28);
  sub_100011958();
  __chkstk_darwin(v73, v74);
  sub_100011E44();
  __chkstk_darwin(v75, v76);
  sub_100011C84();
  sub_1000119A4(v77);
  uint64_t v78 = sub_10000D85C(&qword_100040B60);
  uint64_t v79 = sub_1000119E8(v78);
  __chkstk_darwin(v79, v80);
  sub_100011A2C();
  sub_100012038();
  __chkstk_darwin(v81, v82);
  sub_100011C84();
  sub_1000119A4(v83);
  sub_10002FE70();
  uint64_t v206 = a1;
  int v200 = sub_10002FE50();
  int v84 = *(unsigned __int8 *)(a2 + 1);
  double v85 = *(double *)(a2 + 8);
  char v221 = *(unsigned char *)(a2 + 16);
  if (v84)
  {
    if (v84 == 1)
    {
      v86 = v199;
      uint64_t v87 = v199(1, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_100007338);
      uint64_t v176 = v29;
      uint64_t v89 = v88;
      char v91 = v90;
      uint64_t v93 = v92;
      uint64_t KeyPath = swift_getKeyPath();
      v214 = (void *)v87;
      uint64_t v215 = v89;
      LOBYTE(v216) = v91 & 1;
      uint64_t v217 = v93;
      uint64_t v218 = KeyPath;
      uint64_t v219 = 1;
      char v220 = 0;
      sub_10002FFF0();
      sub_10000D85C(&qword_100040B68);
      sub_10000F2D0();
      sub_1000300D0();
      v190 = *(void (**)(char *, uint64_t))(v173 + 8);
      v190(v47, v191);
      sub_10000EABC((uint64_t)v214, v215, v216);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v95 = v86(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_100007630);
      uint64_t v97 = v96;
      v214 = (void *)v95;
      uint64_t v215 = v96;
      char v99 = v98 & 1;
      LOBYTE(v216) = v98 & 1;
      uint64_t v217 = v100;
      sub_100030090();
      sub_10000EABC(v95, v97, v99);
      swift_bridgeObjectRelease();
      uint64_t v101 = swift_getKeyPath();
      sub_100012400();
      uint64_t v102 = v177;
      sub_1000119DC();
      v103();
      sub_1000120A0();
      *(void *)uint64_t v104 = v101;
      *(void *)(v104 + 8) = 1;
      *(unsigned char *)(v104 + 16) = 0;
      sub_100011FA0();
      v105();
      sub_100011CAC();
      v106();
      uint64_t v107 = swift_getKeyPath();
      uint64_t v10 = v179;
      v108 = (uint64_t *)(v179 + *(int *)(v178 + 36));
      sub_10000D85C(&qword_100040A38);
      sub_100012400();
      sub_1000119DC();
      v109();
      uint64_t *v108 = v107;
      sub_1000114D0(v102, v10, &qword_1000409E0);
      sub_100011FA0();
      v110();
      sub_100011528(v102, &qword_1000409E0);
      sub_10002FFF0();
      sub_10000EE80();
      uint64_t v111 = v182;
      sub_1000300D0();
      v190(v47, v191);
      sub_100011528(v10, &qword_1000409E8);
      uint64_t v112 = (uint64_t)v185;
      void *v185 = v206;
      *(void *)(v112 + 8) = 0;
      *(unsigned char *)(v112 + 16) = 1;
      uint64_t v113 = sub_10000D85C(&qword_100040BA0);
      sub_10000B958(v187, v194, v186 & 1, v111, v112 + *(int *)(v113 + 44));
      sub_1000114D0(v112, v197, &qword_100040B28);
      swift_storeEnumTagMultiPayload();
      sub_10001148C(&qword_100040B80, &qword_100040B50);
      sub_10001148C(&qword_100040B88, &qword_100040B28);
      uint64_t v114 = v198;
      sub_100012204();
      sub_10002FF40();
      sub_1000114D0(v114, v204, &qword_100040B58);
      sub_1000122A8();
      sub_10000F370();
      sub_10000F434(&qword_100040B90, &qword_100040B20, &qword_100040B68, (void (*)(void))sub_10000F2D0);
      sub_100011CF4();
      sub_1000121E4();
      sub_100011528(v114, &qword_100040B58);
      sub_100011528(v112, &qword_100040B28);
      sub_100012048();
      sub_100011BAC();
      v115();
      sub_100012048();
      sub_100011BAC();
      v116();
    }
    else
    {
      uint64_t v143 = v199(2, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_100007338);
      uint64_t v145 = v144;
      char v147 = v146;
      uint64_t v149 = v148;
      uint64_t v150 = swift_getKeyPath();
      v214 = (void *)v143;
      uint64_t v215 = v145;
      LOBYTE(v216) = v147 & 1;
      uint64_t v217 = v149;
      uint64_t v218 = v150;
      uint64_t v219 = 2;
      char v220 = 0;
      sub_10002FE30();
      sub_10000D85C(&qword_100040B68);
      sub_10000F2D0();
      sub_1000300E0();
      sub_100012048();
      sub_100011BAC();
      v151();
      sub_10000EABC((uint64_t)v214, v215, v216);
      swift_bridgeObjectRelease();
      swift_release();
      LOBYTE(v145) = v221;
      uint64_t v165 = sub_100030270();
      uint64_t v166 = v152;
      uint64_t v153 = v172;
      uint64_t v154 = sub_1000123EC();
      sub_10000BEBC(*(double *)&v154, v155, v156, v157, v85, v145, 0.0, 1, v158, 0.0, 1, 0.0, 1, v165, v166, &qword_100040B18, &qword_100040B20);
      sub_100012048();
      sub_100011BAC();
      v159();
      uint64_t v160 = v176;
      sub_10000F9A0(v153, v176, &qword_100040B20);
      sub_1000114D0(v160, v204, &qword_100040B20);
      swift_storeEnumTagMultiPayload();
      sub_10000F370();
      sub_10000F434(&qword_100040B90, &qword_100040B20, &qword_100040B68, (void (*)(void))sub_10000F2D0);
      sub_100011CF4();
      sub_10002FF40();
      sub_100011528(v160, &qword_100040B20);
    }
  }
  else
  {
    v117 = v199;
    uint64_t v187 = v199(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_100007338);
    uint64_t v186 = v118;
    uint64_t v191 = v119;
    LODWORD(v194) = v120 & 1;
    uint64_t v210 = 0;
    LOBYTE(v211) = 1;
    uint64_t v175 = sub_10000D85C(&qword_100040A98);
    sub_1000301E0();
    v185 = v214;
    LODWORD(v184) = v215;
    uint64_t v183 = v216;
    sub_100030270();
    sub_10002FCD0();
    uint64_t v182 = (uint64_t)v214;
    LODWORD(v181) = v215;
    uint64_t v180 = v216;
    LODWORD(v179) = v217;
    uint64_t v178 = v218;
    uint64_t v177 = v219;
    uint64_t v121 = v117(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_100007630);
    uint64_t v176 = v29;
    uint64_t v123 = v122;
    uint64_t v210 = v121;
    uint64_t v211 = v122;
    char v125 = v124 & 1;
    LOBYTE(v212) = v124 & 1;
    uint64_t v213 = v126;
    sub_100030090();
    sub_10000EABC(v121, v123, v125);
    swift_bridgeObjectRelease();
    uint64_t v208 = 0;
    char v209 = 1;
    sub_1000301E0();
    uint64_t v127 = v188;
    uint64_t v128 = v189;
    sub_1000119DC();
    v129();
    *(double *)(v10 + *(int *)(v70 + 36)) = a8;
    sub_10001239C();
    *(void *)(v130 + 8) = v131;
    *(void *)(v130 + 16) = 1;
    sub_100012388(v130);
    (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v8, v128);
    sub_100011CAC();
    v132();
    uint64_t v133 = swift_getKeyPath();
    v134 = (uint64_t *)(v9 + *(int *)(v168 + 36));
    sub_10000D85C(&qword_100040A38);
    sub_1000119DC();
    v135();
    uint64_t *v134 = v133;
    sub_1000114D0(v10, v9, &qword_100040A20);
    sub_100011F28();
    v136();
    sub_100011528(v10, &qword_100040A20);
    v137 = v190;
    sub_10000F9A0(v9, (uint64_t)v190, &qword_100040A28);
    sub_1000114D0((uint64_t)v137, v9, &qword_100040A28);
    uint64_t v138 = v187;
    uint64_t v139 = v186;
    *(void *)uint64_t v11 = v187;
    *(void *)(v11 + 8) = v139;
    LOBYTE(v133) = v194;
    *(unsigned char *)(v11 + 16) = v194;
    *(void *)(v11 + 24) = v191;
    *(double *)(v11 + 32) = a7;
    *(void *)(v11 + 40) = 0x3FE3333333333333;
    *(void *)(v11 + 48) = 2;
    *(unsigned char *)(v11 + 56) = 0;
    *(void *)(v11 + 64) = v185;
    *(unsigned char *)(v11 + 72) = v184;
    *(void *)(v11 + 80) = v183;
    *(void *)(v11 + 88) = 0;
    *(unsigned char *)(v11 + 96) = 1;
    *(void *)(v11 + 104) = v182;
    *(unsigned char *)(v11 + 112) = v181;
    *(void *)(v11 + 120) = v180;
    *(unsigned char *)(v11 + 128) = v179;
    uint64_t v140 = v177;
    *(void *)(v11 + 136) = v178;
    *(void *)(v11 + 144) = v140;
    uint64_t v141 = sub_10000D85C(&qword_100040BA8);
    sub_1000114D0(v9, v11 + *(int *)(v141 + 64), &qword_100040A28);
    sub_10000F4E8(v138, v139, v133);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10000F4E8(v138, v139, v133);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100011528(v9, &qword_100040A28);
    sub_10000EABC(v138, v139, v133);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100011C90(v11, (uint64_t)&v222);
    sub_1000122A8();
    sub_10001148C(&qword_100040B80, &qword_100040B50);
    sub_10001148C(&qword_100040B88, &qword_100040B28);
    uint64_t v142 = v198;
    sub_100012204();
    sub_10002FF40();
    sub_100012350();
    sub_100011C90(v142, (uint64_t)&v223);
    sub_1000122A8();
    sub_10000F370();
    sub_10000F434(&qword_100040B90, &qword_100040B20, &qword_100040B68, (void (*)(void))sub_10000F2D0);
    sub_100011CF4();
    sub_1000121E4();
    sub_100012218();
    sub_100011528((uint64_t)v190, &qword_100040A28);
    sub_10000EABC(v138, v139, v194);
    swift_release();
    swift_bridgeObjectRelease();
  }
  sub_10002FE60();
  sub_10002FE50();
  uint64_t v161 = v202;
  sub_1000114D0(v10, v202, &qword_100040B60);
  v162 = v207;
  void *v207 = 0;
  *((unsigned char *)v162 + 8) = 0;
  *((unsigned char *)v162 + 9) = (v200 & 1) == 0;
  uint64_t v163 = sub_10000D85C(&qword_100040B98);
  sub_1000114D0(v161, (uint64_t)v162 + *(int *)(v163 + 48), &qword_100040B60);
  sub_100011DBC((uint64_t)v162 + *(int *)(v163 + 64));
  return sub_100011528(v161, &qword_100040B60);
}

uint64_t sub_10000B958@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v48[1] = a4;
  uint64_t v49 = a1;
  int v51 = a3;
  uint64_t v50 = a2;
  uint64_t v56 = a5;
  uint64_t v55 = sub_10000D85C(&qword_100040BB0);
  sub_100011958();
  __chkstk_darwin(v7, v8);
  sub_10001198C();
  uint64_t v52 = sub_10000D85C(&qword_100040BB8);
  sub_100011958();
  __chkstk_darwin(v9, v10);
  sub_100011978();
  uint64_t v54 = v11;
  uint64_t v53 = sub_10000D85C(&qword_100040BC0);
  sub_100011958();
  __chkstk_darwin(v12, v13);
  sub_100011C14();
  uint64_t v14 = sub_10000D85C(&qword_100040BC8);
  uint64_t v15 = sub_1000119E8(v14);
  uint64_t v17 = __chkstk_darwin(v15, v16);
  uint64_t v19 = (char *)v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v17, v20);
  uint64_t v23 = (char *)v48 - v22;
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)v48 - v25;
  sub_10000D85C(&qword_100040B38);
  sub_10001193C();
  uint64_t v28 = v27;
  __chkstk_darwin(v29, v30);
  sub_100011E44();
  uint64_t v33 = __chkstk_darwin(v31, v32);
  __chkstk_darwin(v33, v34);
  sub_10002FEC0();
  if (sub_10002FEA0())
  {
    uint64_t v35 = *(void (**)(void))(v28 + 16);
    sub_100012028();
    v35();
    uint64_t v36 = sub_10000D85C(&qword_100040B30);
    if (v51)
    {
      sub_100011C50();
      v37();
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v38 = 1;
    }
    sub_10000DA40((uint64_t)v26, v38, 1, v36);
    sub_100012028();
    v35();
    sub_1000114D0((uint64_t)v26, (uint64_t)v19, &qword_100040BC8);
    sub_100012028();
    v35();
    uint64_t v42 = sub_10000D85C(&qword_100040BE8);
    sub_1000114D0((uint64_t)v19, v6 + *(int *)(v42 + 48), &qword_100040BC8);
    sub_100012350();
    uint64_t v43 = *(void (**)(void))(v28 + 8);
    sub_100011C74();
    v43();
    sub_1000114D0(v6, v54, &qword_100040BC0);
    swift_storeEnumTagMultiPayload();
    sub_10001148C(&qword_100040BD8, &qword_100040BC0);
    sub_10001148C(&qword_100040BE0, &qword_100040BB0);
    sub_10002FF40();
    sub_100011528(v6, &qword_100040BC0);
    sub_100011528((uint64_t)v26, &qword_100040BC8);
    sub_100011C74();
    return ((uint64_t (*)(void))v43)();
  }
  else
  {
    uint64_t v49 = v5;
    uint64_t v39 = sub_10000D85C(&qword_100040B30);
    if (v51)
    {
      sub_100011C50();
      v40();
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v41 = 1;
    }
    sub_10000DA40((uint64_t)v23, v41, 1, v39);
    uint64_t v45 = *(void (**)(void))(v28 + 16);
    sub_100012018();
    v45();
    sub_1000114D0((uint64_t)v23, (uint64_t)v19, &qword_100040BC8);
    sub_100012018();
    v45();
    uint64_t v46 = v49;
    sub_1000114D0((uint64_t)v19, v49, &qword_100040BC8);
    sub_10000D85C(&qword_100040BD0);
    sub_100012018();
    v45();
    uint64_t v47 = *(void (**)(void))(v28 + 8);
    sub_100011C74();
    v47();
    sub_100011528((uint64_t)v19, &qword_100040BC8);
    sub_1000114D0(v46, v54, &qword_100040BB0);
    swift_storeEnumTagMultiPayload();
    sub_10001148C(&qword_100040BD8, &qword_100040BC0);
    sub_10001148C(&qword_100040BE0, &qword_100040BB0);
    sub_10002FF40();
    sub_100011528(v46, &qword_100040BB0);
    sub_100011C74();
    v47();
    return sub_100011528((uint64_t)v23, &qword_100040BC8);
  }
}

void *sub_10000BEBC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v18 = a16;
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
    sub_1000306D0();
    uint64_t v27 = (void *)sub_10002FF70();
    sub_10002FC10();

    uint64_t v18 = a16;
  }
  sub_10002FD70();
  sub_10000D85C(v18);
  sub_100011958();
  sub_100011C50();
  v34(v28, v29, v30, v31, v32, v33);
  uint64_t v35 = sub_10000D85C(a17);
  return memcpy((void *)(a9 + *(int *)(v35 + 36)), __src, 0x70uLL);
}

uint64_t sub_10000C08C@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, void (*a6)(uint64_t, void, uint64_t, uint64_t, uint64_t)@<X5>, void *a7@<X8>)
{
  uint64_t v59 = a6;
  uint64_t v60 = a7;
  uint64_t v56 = a5;
  uint64_t v52 = a3;
  char v9 = a2;
  unsigned int v51 = a2;
  uint64_t v11 = sub_10000D85C(&qword_1000409C8);
  uint64_t v12 = sub_1000119E8(v11);
  __chkstk_darwin(v12, v13);
  sub_100011978();
  uint64_t v58 = v14;
  uint64_t v15 = sub_1000303B0();
  sub_10001193C();
  uint64_t v17 = v16;
  __chkstk_darwin(v18, v19);
  sub_100011A40();
  uint64_t v20 = sub_10000D85C(&qword_1000409D0);
  uint64_t v21 = (int *)(v20 - 8);
  __chkstk_darwin(v20, v22);
  sub_100011A2C();
  uint64_t v57 = v23;
  uint64_t v26 = __chkstk_darwin(v24, v25);
  uint64_t v28 = (char *)&v49 - v27;
  __chkstk_darwin(v26, v29);
  sub_100011C84();
  uint64_t v54 = v30;
  uint64_t v31 = a4 & 1;
  uint64_t v49 = a1;
  uint64_t v53 = sub_10000A5A8(v9);
  uint64_t v50 = v32;
  sub_10002FED0();
  int v55 = sub_10002FEA0();
  uint64_t v33 = sub_10001213C();
  v34(v33);
  sub_1000122C0();
  uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v36(v7, v35 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v15);
  uint64_t v37 = sub_10002FEB0();
  uint64_t v38 = sub_10002FE70();
  v36((uint64_t)&v28[v21[11]], v7, v15);
  v28[v21[12]] = 0;
  *(void *)&v28[v21[13]] = v37;
  *(void *)&v28[v21[14]] = v38;
  uint64_t v39 = v58;
  v59(v50, v51, v52, v31, v49);
  sub_100011FA0();
  v40();
  sub_10000F9A0(v39, (uint64_t)v28, &qword_1000409C8);
  uint64_t v41 = (uint64_t)v28;
  uint64_t v42 = v54;
  sub_10000F9A0(v41, v54, &qword_1000409D0);
  sub_10002FEC0();
  LOBYTE(v39) = sub_10002FEA0();
  uint64_t v43 = v57;
  sub_1000114D0(v42, v57, &qword_1000409D0);
  uint64_t v44 = v60;
  *uint64_t v60 = 0;
  *((unsigned char *)v44 + 8) = 0;
  *((unsigned char *)v44 + 9) = (v55 & 1) == 0;
  uint64_t v45 = v44;
  uint64_t v46 = sub_10000D85C(&qword_1000409D8);
  sub_1000114D0(v43, (uint64_t)v45 + *(int *)(v46 + 48), &qword_1000409D0);
  uint64_t v47 = (uint64_t)v45 + *(int *)(v46 + 64);
  *(void *)uint64_t v47 = 0;
  *(unsigned char *)(v47 + 8) = 0;
  *(unsigned char *)(v47 + 9) = (v39 & 1) == 0;
  sub_100011528(v42, &qword_1000409D0);
  return sub_100011528(v43, &qword_1000409D0);
}

void sub_10000C3A4()
{
}

void sub_10000C3D0()
{
}

void sub_10000C3FC()
{
  sub_1000119F4();
  uint64_t v2 = v1;
  uint64_t v139 = v3;
  int v123 = v4;
  v134 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  int v11 = v10;
  uint64_t v133 = sub_10002FE40();
  sub_10001193C();
  uint64_t v132 = v12;
  __chkstk_darwin(v13, v14);
  sub_1000119A4((uint64_t)v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v124 = sub_10000D85C(&qword_1000409E0);
  sub_100011958();
  __chkstk_darwin(v16, v17);
  sub_1000119A4((uint64_t)v121 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v126 = sub_10000D85C(&qword_1000409E8);
  sub_100011958();
  __chkstk_darwin(v19, v20);
  sub_1000119A4((uint64_t)v121 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v130 = sub_10000D85C(&qword_1000409F0);
  sub_10001193C();
  __chkstk_darwin(v22, v23);
  sub_100011978();
  sub_1000119A4(v24);
  uint64_t v25 = sub_10000D85C(&qword_1000409F8);
  sub_100011958();
  __chkstk_darwin(v26, v27);
  sub_100011A2C();
  sub_100012038();
  __chkstk_darwin(v28, v29);
  sub_100011C84();
  sub_1000119A4(v30);
  uint64_t v150 = sub_10000D85C(&qword_100040A00);
  sub_100011958();
  __chkstk_darwin(v31, v32);
  sub_100011AE0(v33, v121[0]);
  uint64_t v138 = sub_10000D85C(&qword_100040A08);
  sub_100011958();
  __chkstk_darwin(v34, v35);
  sub_100011978();
  uint64_t v140 = v36;
  uint64_t v151 = sub_10000D85C(&qword_100040A10);
  sub_100011958();
  __chkstk_darwin(v37, v38);
  sub_100011978();
  uint64_t v144 = v39;
  sub_100030040();
  sub_10001193C();
  uint64_t v142 = v41;
  uint64_t v143 = v40;
  __chkstk_darwin(v40, v42);
  sub_100011978();
  uint64_t v141 = v43;
  uint64_t v137 = sub_10000D85C(&qword_100040A18);
  sub_10001193C();
  uint64_t v136 = v44;
  __chkstk_darwin(v45, v46);
  sub_100011A58();
  v121[1] = sub_10000D85C(&qword_100040A20);
  sub_100011958();
  __chkstk_darwin(v47, v48);
  sub_1000120D4();
  uint64_t v135 = sub_10000D85C(&qword_100040A28);
  sub_100011958();
  uint64_t v51 = __chkstk_darwin(v49, v50);
  uint64_t v53 = (char *)v121 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v51, v54);
  sub_100011C84();
  sub_1000119A4(v55);
  uint64_t v56 = sub_10000D85C(&qword_100040A30);
  uint64_t v57 = sub_1000119E8(v56);
  __chkstk_darwin(v57, v58);
  sub_100011A2C();
  uint64_t v149 = v59;
  __chkstk_darwin(v60, v61);
  sub_100011C84();
  uint64_t v148 = v62;
  sub_10002FE70();
  uint64_t v146 = v7;
  int v147 = sub_10002FE50();
  if (v11)
  {
    if (v11 != 1)
    {
      LODWORD(v144) = v123 & 1;
      uint64_t v88 = v139(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_100007630);
      uint64_t v90 = v89;
      sub_100012294(v88, v89);
      char v92 = v91 & 1;
      char v154 = v91 & 1;
      uint64_t v155 = v93;
      sub_100030090();
      sub_10000EABC(v88, v90, v92);
      uint64_t v9 = v25;
      swift_bridgeObjectRelease();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v95 = v125;
      sub_1000119DC();
      v96();
      sub_1000120A0();
      *(void *)uint64_t v97 = KeyPath;
      *(void *)(v97 + 8) = 1;
      *(unsigned char *)(v97 + 16) = 0;
      sub_100011F28();
      v98();
      uint64_t v100 = v141;
      uint64_t v99 = v142;
      uint64_t v101 = v143;
      sub_100011CAC();
      v102();
      uint64_t v103 = swift_getKeyPath();
      uint64_t v104 = v128;
      v105 = (uint64_t *)(v128 + *(int *)(v126 + 36));
      sub_10000D85C(&qword_100040A38);
      sub_1000119DC();
      v106();
      uint64_t *v105 = v103;
      sub_1000114D0(v95, v104, &qword_1000409E0);
      (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v100, v101);
      sub_100012350();
      sub_10002FE30();
      sub_10000EE80();
      uint64_t v53 = v129;
      sub_1000300E0();
      sub_100012048();
      sub_100011BAC();
      v107();
      sub_100012218();
      uint64_t v119 = sub_100030270();
      uint64_t v120 = v108;
      uint64_t v109 = v127;
      uint64_t v110 = sub_1000123EC();
      sub_10000BEBC(*(double *)&v110, v111, v112, v113, *(double *)&v134, v144, 0.0, 1, v114, 0.0, 1, 0.0, 1, v119, v120, &qword_1000409F0, &qword_1000409F8);
      sub_100011F28();
      v115();
      uint64_t v116 = v131;
      sub_10000F9A0(v109, v131, &qword_1000409F8);
      sub_1000114D0(v116, v145, &qword_1000409F8);
      swift_storeEnumTagMultiPayload();
      sub_10000EFF0();
      sub_10000F434(&qword_100040A88, &qword_1000409F8, &qword_1000409E8, (void (*)(void))sub_10000EE80);
      sub_1000121B8();
      sub_10002FF40();
      uint64_t v65 = v116;
      uint64_t v87 = &qword_1000409F8;
      goto LABEL_7;
    }
    swift_storeEnumTagMultiPayload();
    sub_10000F06C();
    uint64_t v63 = v144;
    sub_10002FF40();
    uint64_t v64 = &qword_100040A10;
    sub_1000114D0(v63, v145, &qword_100040A10);
    swift_storeEnumTagMultiPayload();
    sub_10000EFF0();
    sub_10000F434(&qword_100040A88, &qword_1000409F8, &qword_1000409E8, (void (*)(void))sub_10000EE80);
    sub_1000121B8();
    sub_10002FF40();
    uint64_t v65 = v63;
  }
  else
  {
    v134 = v2;
    uint64_t v66 = v139(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_100007630);
    uint64_t v68 = v67;
    sub_100012294(v66, v67);
    char v70 = v69 & 1;
    char v154 = v69 & 1;
    uint64_t v155 = v71;
    sub_100030090();
    sub_10000EABC(v66, v68, v70);
    uint64_t v9 = v25;
    uint64_t v72 = swift_bridgeObjectRelease();
    v134(v72);
    uint64_t v74 = v73;
    uint64_t v152 = 0;
    char v153 = 1;
    sub_10000D85C(&qword_100040A98);
    sub_1000301E0();
    sub_100012400();
    sub_1000119DC();
    v75();
    sub_1000120A0();
    *uint64_t v76 = v74;
    sub_10001239C();
    *(void *)(v77 + 8) = v78;
    *(void *)(v77 + 16) = 1;
    sub_100012388(v77);
    sub_100011FA0();
    v79();
    sub_100011CAC();
    v80();
    uint64_t v81 = swift_getKeyPath();
    uint64_t v82 = (uint64_t *)&v53[*(int *)(v135 + 36)];
    sub_10000D85C(&qword_100040A38);
    sub_100012400();
    sub_1000119DC();
    v83();
    *uint64_t v82 = v81;
    sub_1000114D0(v0, (uint64_t)v53, &qword_100040A20);
    sub_100011FA0();
    v84();
    sub_100012350();
    uint64_t v64 = &qword_100040A28;
    uint64_t v85 = v122;
    sub_10000F9A0((uint64_t)v53, v122, &qword_100040A28);
    sub_1000114D0(v85, v140, &qword_100040A28);
    sub_1000122A8();
    sub_10000F06C();
    uint64_t v86 = v144;
    sub_10002FF40();
    sub_1000114D0(v86, v145, &qword_100040A10);
    swift_storeEnumTagMultiPayload();
    sub_10000EFF0();
    sub_10000F434(&qword_100040A88, &qword_1000409F8, &qword_1000409E8, (void (*)(void))sub_10000EE80);
    uint64_t v53 = v148;
    sub_10002FF40();
    sub_100011528(v86, &qword_100040A10);
    uint64_t v65 = v85;
  }
  uint64_t v87 = v64;
LABEL_7:
  sub_100011528(v65, v87);
  sub_10002FE60();
  sub_10002FE50();
  uint64_t v117 = v149;
  sub_1000114D0((uint64_t)v53, v149, &qword_100040A30);
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 0;
  *(unsigned char *)(v9 + 9) = (v147 & 1) == 0;
  uint64_t v118 = sub_10000D85C(&qword_100040A90);
  sub_1000114D0(v117, v9 + *(int *)(v118 + 48), &qword_100040A30);
  sub_100011DBC(v9 + *(int *)(v118 + 64));
  sub_100011528(v117, &qword_100040A30);
  sub_100011A10();
}

uint64_t sub_10000CFAC()
{
  uint64_t v0 = sub_10002FA10();
  sub_10000F530(v0, qword_1000405F0);
  sub_10000F4F8(v0, (uint64_t)qword_1000405F0);
  return sub_10000CFF8();
}

uint64_t sub_10000CFF8()
{
  uint64_t v0 = sub_10002FA10();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v3, v6);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v13 = (char *)&v19 - v12;
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v19 - v15;
  sub_10002F990();
  sub_10002F9B0();
  sub_10002F9E0();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v1 + 8);
  v17(v5, v0);
  sub_10002F9C0();
  sub_10002F9E0();
  v17(v5, v0);
  v17(v9, v0);
  sub_10002F9A0();
  sub_10002F9E0();
  v17(v9, v0);
  v17(v13, v0);
  return ((uint64_t (*)(char *, uint64_t))v17)(v16, v0);
}

uint64_t (*sub_10000D1F8@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = sub_100004F3C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000D224()
{
  uint64_t v1 = sub_1000303B0();
  sub_10001193C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4, v5);
  sub_100011BFC();
  sub_1000119DC();
  v6();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v0, v1);
  BOOL v8 = v7 == enum case for WidgetFamily.systemSmall(_:) || v7 == enum case for WidgetFamily.systemMedium(_:);
  if (!v8 && v7 != enum case for WidgetFamily.systemLarge(_:) && v7 != enum case for WidgetFamily.systemExtraLarge(_:)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  }
  id v9 = (id)PXCappedFontWithTextStyleSymbolicTraits();
  return sub_10002FFE0();
}

uint64_t sub_10000D35C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000303B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  BOOL v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D85C(&qword_100040CF8);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000D85C(&qword_100040D00);
  uint64_t v14 = v13 - 8;
  uint64_t v16 = __chkstk_darwin(v13, v15);
  uint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  uint64_t v21 = (char *)&v28 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v4);
  swift_retain();
  uint64_t v22 = sub_10002FEC0();
  uint64_t v23 = sub_10002FE70();
  sub_100004344((uint64_t)v8, 2, v22, v23, a1, (uint64_t)v12);
  uint64_t v24 = sub_10002FEC0();
  sub_1000114D0((uint64_t)v12, (uint64_t)v18, &qword_100040CF8);
  uint64_t v25 = (uint64_t *)&v18[*(int *)(v14 + 44)];
  uint64_t *v25 = v24;
  v25[1] = (uint64_t)sub_10000D77C;
  v25[2] = 0;
  sub_100011528((uint64_t)v12, &qword_100040CF8);
  sub_10000F9A0((uint64_t)v18, (uint64_t)v21, &qword_100040D00);
  sub_1000114D0((uint64_t)v21, (uint64_t)v18, &qword_100040D00);
  sub_1000114D0((uint64_t)v18, a2, &qword_100040D00);
  uint64_t v26 = a2 + *(int *)(sub_10000D85C(&qword_100040D08) + 48);
  *(void *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 8) = 1;
  sub_100011528((uint64_t)v21, &qword_100040D00);
  return sub_100011528((uint64_t)v18, &qword_100040D00);
}

uint64_t sub_10000D5E0@<X0>(uint64_t a1@<X8>)
{
  sub_10000F204();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100030080();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_10000D224();
  uint64_t v7 = sub_100030060();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_10000EABC(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_100030180();
  uint64_t v13 = sub_100030050();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_10000EABC(v7, v9, v12);
  swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v15;
  *(unsigned char *)(a1 + 32) = v17 & 1;
  *(void *)(a1 + 40) = v19;
  sub_10000F4E8(v13, v15, v17 & 1);
  swift_bridgeObjectRetain();
  sub_10000EABC(v13, v15, v17 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D77C()
{
  return sub_10002FD30();
}

uint64_t (*sub_10000D7A4@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>))(uint64_t a1)
{
  double result = sub_100004F7C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t variable initialization expression of PhotosReliveWidgetView.entry()
{
  return 0;
}

uint64_t variable initialization expression of PhotosReliveWidgetView._widgetFamily@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_10000D85C(&qword_100040668);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10000D838()
{
  return sub_10002FDD0();
}

uint64_t sub_10000D85C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of PhotosReliveWidgetEntry.viewModel()
{
  return 0;
}

uint64_t sub_10000D8A8(long long *a1)
{
  long long v2 = *a1;
  if (sub_1000123B8()) {
    return swift_getOpaqueTypeMetadata2();
  }
  else {
    return v2;
  }
}

uint64_t sub_10000D90C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (sub_1000123B8()) {
    return sub_100011C5C();
  }
  return v1;
}

uint64_t sub_10000D960(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for PXTimelineContentType(uint64_t a1)
{
}

uint64_t sub_10000D9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D9FC);
}

uint64_t sub_10000DA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000DA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DA3C);
}

uint64_t sub_10000DA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for PhotosReliveWidgetPlaceholderContent(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_100040728);
}

void type metadata accessor for PhotosReliveWidgetFallbackContent()
{
}

void type metadata accessor for PhotosReliveWidgetFeaturedPhotoContent()
{
}

uint64_t *sub_10000DAA4(uint64_t *a1, uint64_t *a2)
{
  sub_1000119B0();
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
  }
  else
  {
    uint64_t v7 = v4;
    sub_100030030();
    sub_100011958();
    sub_100011C50();
    v8();
    *(uint64_t *)((char *)a1 + *(int *)(v7 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_10000DB44()
{
  sub_100030030();
  sub_100011958();
  sub_100011BBC();
  v0();

  return swift_release();
}

uint64_t sub_10000DBAC()
{
  sub_100011B54();
  sub_100011958();
  sub_100011C50();
  v3();
  *(void *)(v2 + *(int *)(v0 + 20)) = *(void *)(v1 + *(int *)(v0 + 20));
  swift_retain();
  return v2;
}

uint64_t sub_10000DC10()
{
  sub_100011B54();
  sub_100011958();
  uint64_t v3 = sub_100011CB8();
  v4(v3);
  *(void *)(v2 + *(int *)(v0 + 20)) = *(void *)(v1 + *(int *)(v0 + 20));
  swift_retain();
  swift_release();
  return v2;
}

uint64_t sub_10000DC7C()
{
  sub_100011B54();
  sub_100011958();
  uint64_t v3 = sub_100011CB8();
  v4(v3);
  *(void *)(v2 + *(int *)(v0 + 20)) = *(void *)(v1 + *(int *)(v0 + 20));
  return v2;
}

uint64_t sub_10000DCD8()
{
  sub_100011B54();
  sub_100011958();
  uint64_t v3 = sub_100011CB8();
  v4(v3);
  *(void *)(v2 + *(int *)(v0 + 20)) = *(void *)(v1 + *(int *)(v0 + 20));
  swift_release();
  return v2;
}

uint64_t sub_10000DD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000DD50);
}

uint64_t sub_10000DD54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100030030();
  sub_1000119B0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_10000DA00(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_10000DDE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DDF8);
}

void sub_10000DDFC(uint64_t a1, int a2, int a3, uint64_t a4)
{
  sub_100030030();
  sub_1000119B0();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = sub_100012328();
    sub_10000DA40(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for PhotosReliveWidgetMemoryContent(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_1000407B8);
}

uint64_t sub_10000DE9C()
{
  uint64_t result = sub_100030030();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000DF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E814(a1, a2, a3, &qword_1000407F0, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000DF7C(uint64_t a1)
{
  uint64_t result = sub_10000DFD4(&qword_100040840, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000DFD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000E01C(uint64_t a1)
{
  uint64_t result = sub_10000DFD4(&qword_100040848, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000E074()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000E090(uint64_t a1)
{
  unint64_t result = sub_10000E0B8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000E0B8()
{
  unint64_t result = qword_100040898;
  if (!qword_100040898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040898);
  }
  return result;
}

uint64_t sub_10000E104()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000E120(uint64_t a1)
{
  unint64_t result = sub_10000E148();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000E148()
{
  unint64_t result = qword_1000408E8;
  if (!qword_1000408E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000408E8);
  }
  return result;
}

uint64_t sub_10000E194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E814(a1, a2, a3, &qword_1000408F0, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

uint64_t sub_10000E1DC(uint64_t a1)
{
  uint64_t result = sub_10000DFD4(&qword_100040940, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000E234(uint64_t a1)
{
  uint64_t result = sub_10000DFD4(&qword_100040948, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000E28C()
{
  return sub_10002FDE0();
}

uint64_t sub_10000E2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000ED74(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_10000E2DC()
{
  return sub_10000E43C(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000E30C()
{
  return sub_10000E328();
}

uint64_t sub_10000E328()
{
  sub_1000305B0();
  sub_1000305E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E37C()
{
  return sub_10000E398();
}

Swift::Int sub_10000E398()
{
  sub_1000305B0();
  sub_1000309F0();
  sub_1000305E0();
  Swift::Int v0 = sub_100030A10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000E40C()
{
  return sub_10000E43C(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000E43C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_1000305B0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000E47C(uint64_t a1, id *a2)
{
  return sub_10000E494(a1, a2);
}

uint64_t sub_10000E494(uint64_t a1, id *a2)
{
  uint64_t result = sub_100030590();
  *a2 = 0;
  return result;
}

uint64_t sub_10000E50C(uint64_t a1, id *a2)
{
  return sub_10000E528(a1, a2) & 1;
}

uint64_t sub_10000E528(uint64_t a1, id *a2)
{
  char v3 = sub_1000305A0();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_10000E5A8@<X0>(void *a1@<X8>)
{
  NSString result = sub_10000E5D0();
  *a1 = result;
  return result;
}

NSString sub_10000E5D0()
{
  sub_1000305B0();
  NSString v0 = sub_100030580();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_10000E608(uint64_t a1@<X8>)
{
  sub_10000E63C();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

void sub_10000E644(void *a1@<X8>)
{
  PhotosReliveWidget.init()();
  *a1 = v2;
}

uint64_t sub_10000E670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E814(a1, a2, a3, &qword_100040948, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

uint64_t sub_10000E6B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E734(a1, a2, a3, (void (*)(void))sub_10000E6D0);
}

unint64_t sub_10000E6D0()
{
  unint64_t result = qword_100040950;
  if (!qword_100040950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040950);
  }
  return result;
}

uint64_t sub_10000E71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E734(a1, a2, a3, (void (*)(void))sub_10000E780);
}

uint64_t sub_10000E734(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return sub_100011C5C();
}

unint64_t sub_10000E780()
{
  unint64_t result = qword_100040958;
  if (!qword_100040958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040958);
  }
  return result;
}

uint64_t sub_10000E7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E814(a1, a2, a3, &qword_100040848, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000E814(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E864()
{
  return sub_10000E8D4(type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000E87C(uint64_t a1)
{
  return sub_10000FAA0(a1, (uint64_t)type metadata accessor for PhotosReliveWidgetMemoryContent, (void (*)(uint64_t, uint64_t))sub_1000058D0, (void (*)(void))type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000E8BC()
{
  return sub_10000E8D4(type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000E8D4(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = ((v3 + 16) & ~v3) + *(void *)(v2 + 64);
  uint64_t v5 = v3 | 7;
  sub_100030030();
  sub_100011958();
  sub_100011BBC();
  v6();
  swift_release();

  return _swift_deallocObject(v1, v4, v5);
}

uint64_t sub_10000E9C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000FB70(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100009160, a2);
}

uint64_t sub_10000E9EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000EA54(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000EABC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000EACC(void *a1, void *a2)
{
  return sub_10002484C(*a1, *a2);
}

uint64_t sub_10000EADC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000EB08(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000EB0C(uint64_t a1)
{
  uint64_t v2 = sub_10000DFD4(&qword_100040AB8, type metadata accessor for TraitKey);
  uint64_t v3 = sub_10000DFD4(&qword_100040F00, type metadata accessor for TraitKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000EBC8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100030580();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000EC10(uint64_t a1)
{
  uint64_t v2 = sub_10000DFD4(&qword_100040AD0, type metadata accessor for AttributeName);
  uint64_t v3 = sub_10000DFD4(&qword_100040EF8, type metadata accessor for AttributeName);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000ECCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002FD90();
  *a1 = result;
  return result;
}

uint64_t sub_10000ECF8()
{
  return sub_10002FDA0();
}

uint64_t sub_10000ED24()
{
  return sub_10002FD80();
}

uint64_t sub_10000ED48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000ED74(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Text.TruncationMode, (uint64_t (*)(char *))&EnvironmentValues.truncationMode.setter);
}

uint64_t sub_10000ED74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  sub_10001193C();
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)&v14 - v10, a1);
  return a6(v11);
}

uint64_t sub_10000EE1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10002FDF0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000EE50()
{
  return sub_10002FE00();
}

unint64_t sub_10000EE80()
{
  unint64_t result = qword_100040A40;
  if (!qword_100040A40)
  {
    sub_10000D960(&qword_1000409E8);
    sub_10000EF20();
    sub_10001148C(&qword_100040A60, &qword_100040A38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040A40);
  }
  return result;
}

unint64_t sub_10000EF20()
{
  unint64_t result = qword_100040A48;
  if (!qword_100040A48)
  {
    sub_10000D960(&qword_1000409E0);
    swift_getOpaqueTypeConformance2();
    sub_10001148C(&qword_100040A50, &qword_100040A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040A48);
  }
  return result;
}

unint64_t sub_10000EFF0()
{
  unint64_t result = qword_100040A68;
  if (!qword_100040A68)
  {
    sub_10000D960(&qword_100040A10);
    sub_10000F06C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040A68);
  }
  return result;
}

unint64_t sub_10000F06C()
{
  unint64_t result = qword_100040A70;
  if (!qword_100040A70)
  {
    sub_10000D960(&qword_100040A28);
    sub_10000F10C();
    sub_10001148C(&qword_100040A60, &qword_100040A38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040A70);
  }
  return result;
}

unint64_t sub_10000F10C()
{
  unint64_t result = qword_100040A78;
  if (!qword_100040A78)
  {
    sub_10000D960(&qword_100040A20);
    swift_getOpaqueTypeConformance2();
    sub_10000F1B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040A78);
  }
  return result;
}

unint64_t sub_10000F1B8()
{
  unint64_t result = qword_100040A80;
  if (!qword_100040A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040A80);
  }
  return result;
}

unint64_t sub_10000F204()
{
  unint64_t result = qword_100040AA0;
  if (!qword_100040AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040AA0);
  }
  return result;
}

unint64_t sub_10000F250()
{
  unint64_t result = qword_100040AB0;
  if (!qword_100040AB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100040AB0);
  }
  return result;
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

double sub_10000F2BC()
{
  return *(double *)(v0 + 16);
}

unint64_t sub_10000F2D0()
{
  unint64_t result = qword_100040B70;
  if (!qword_100040B70)
  {
    sub_10000D960(&qword_100040B68);
    sub_10001148C(&qword_100040A50, &qword_100040A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040B70);
  }
  return result;
}

unint64_t sub_10000F370()
{
  unint64_t result = qword_100040B78;
  if (!qword_100040B78)
  {
    sub_10000D960(&qword_100040B58);
    sub_10001148C(&qword_100040B80, &qword_100040B50);
    sub_10001148C(&qword_100040B88, &qword_100040B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040B78);
  }
  return result;
}

uint64_t sub_10000F434(unint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D960(a2);
    sub_10000D960(a3);
    a4();
    swift_getOpaqueTypeConformance2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F4E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000F4F8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000F530(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t type metadata accessor for ImageAccentDesaturateModifier(uint64_t a1)
{
  return sub_10000F5B4(a1, (uint64_t *)&unk_100040D80);
}

uint64_t sub_10000F5B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10000F5E8()
{
  unint64_t result = qword_100040C50;
  if (!qword_100040C50)
  {
    sub_10000D960(&qword_100040C48);
    sub_10000F688();
    sub_10001148C(&qword_100040C60, &qword_100040C68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C50);
  }
  return result;
}

unint64_t sub_10000F688()
{
  unint64_t result = qword_100040C58;
  if (!qword_100040C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C58);
  }
  return result;
}

unint64_t sub_10000F6D4()
{
  unint64_t result = qword_100040C70;
  if (!qword_100040C70)
  {
    sub_10000D960(&qword_100040C40);
    sub_10000F780();
    sub_10000DFD4(&qword_100040C98, (void (*)(uint64_t))type metadata accessor for ImageAccentDesaturateModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C70);
  }
  return result;
}

unint64_t sub_10000F780()
{
  unint64_t result = qword_100040C78;
  if (!qword_100040C78)
  {
    sub_10000D960(&qword_100040C38);
    sub_10000F82C();
    sub_10000DFD4(&qword_100040C90, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C78);
  }
  return result;
}

unint64_t sub_10000F82C()
{
  unint64_t result = qword_100040C80;
  if (!qword_100040C80)
  {
    sub_10000D960(&qword_100040C30);
    sub_10000F8A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C80);
  }
  return result;
}

unint64_t sub_10000F8A8()
{
  unint64_t result = qword_100040C88;
  if (!qword_100040C88)
  {
    sub_10000D960(&qword_100040C28);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040C88);
  }
  return result;
}

uint64_t sub_10000F93C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100011958();
  uint64_t v4 = sub_10001233C();
  v5(v4);
  return a2;
}

uint64_t sub_10000F990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100005170(a1, v2, a2);
}

uint64_t sub_10000F998(uint64_t a1)
{
  return sub_100005474(a1, v1);
}

uint64_t sub_10000F9A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D85C(a3);
  sub_100011958();
  uint64_t v4 = sub_10001233C();
  v5(v4);
  return a2;
}

uint64_t sub_10000F9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100011F94();
  v4(v3);
  sub_100011958();
  sub_100011C50();
  v5();
  return a2;
}

uint64_t sub_10000FA48()
{
  return sub_10000E8D4(type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

uint64_t sub_10000FA60(uint64_t a1)
{
  return sub_10000FAA0(a1, (uint64_t)type metadata accessor for PhotosReliveWidgetPlaceholderContent, (void (*)(uint64_t, uint64_t))sub_100005638, (void (*)(void))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

uint64_t sub_10000FAA0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), void (*a4)(void))
{
  uint64_t v8 = sub_100011F94();
  uint64_t v10 = *(void *)(v9(v8) - 8);
  return sub_100004FBC(a1, v4 + ((*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), a3, a4);
}

uint64_t sub_10000FB2C()
{
  return sub_10000E8D4(type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

uint64_t sub_10000FB44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000FB70(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000094F0, a2);
}

uint64_t sub_10000FB70@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v7 = sub_100011F94();
  uint64_t v9 = *(void *)(v8(v7) - 8);
  return sub_100009100(a1, v3 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a2, a3);
}

uint64_t sub_10000FBFC(uint64_t a1)
{
  uint64_t v2 = sub_100011F94();
  v3(v2);
  sub_100011958();
  sub_100011BBC();
  v4();
  return a1;
}

uint64_t *sub_10000FC4C(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(sub_10000D85C(&qword_100040CA0) - 8) + 80);
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
      uint64_t v5 = sub_100030370();
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

uint64_t sub_10000FD58(uint64_t a1)
{
  sub_10000D85C(&qword_100040CA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100030370();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_10000FDFC(void *a1, void *a2)
{
  sub_10000D85C(&qword_100040CA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100030370();
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

void *sub_10000FEB8(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_100011528((uint64_t)a1, &qword_100040CA0);
    sub_10000D85C(&qword_100040CA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_100030370();
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

void *sub_10000FF8C(void *a1, const void *a2)
{
  uint64_t v4 = sub_10000D85C(&qword_100040CA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100030370();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_100010050(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_100011528((uint64_t)a1, &qword_100040CA0);
    uint64_t v4 = sub_10000D85C(&qword_100040CA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_100030370();
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

uint64_t sub_10001012C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010140);
}

uint64_t sub_100010140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D85C(&qword_100040D20);

  return sub_10000DA00(a1, a2, v4);
}

uint64_t sub_10001018C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000101A0);
}

uint64_t sub_1000101A0()
{
  sub_10000D85C(&qword_100040D20);
  uint64_t v0 = sub_100012328();

  return sub_10000DA40(v0, v1, v2, v3);
}

void sub_1000101E4()
{
  sub_100010270();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100010270()
{
  if (!qword_100040D90)
  {
    sub_100030370();
    unint64_t v0 = sub_10002FC70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040D90);
    }
  }
}

uint64_t sub_1000102C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_1000102D0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000303B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1000103B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1000303B0();
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  uint64_t v12 = v7 + v10;
  uint64_t v13 = *(void *)(v9 + 64);
  unsigned int v14 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  int v15 = (*(_DWORD *)(v6 + 80) | v10) & 0x100000;
  if (v14 > 7 || v15 != 0 || (((((v12 & ~v11) + v13) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v14 | 7) + 16) & ~(unint64_t)(v14 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v19 = v8;
    uint64_t v20 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v21 = ((unint64_t)a1 + v12) & v20;
    unint64_t v22 = ((unint64_t)a2 + v12) & v20;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v21, v22, v19);
    *(unsigned char *)(v21 + v13) = *(unsigned char *)(v22 + v13);
    unint64_t v23 = (v21 + v13) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (v22 + v13) & 0xFFFFFFFFFFFFFFF8;
    *(void *)(v23 + 8) = *(void *)(v24 + 8);
    *(void *)((v23 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  }
  return a1;
}

uint64_t sub_100010580(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_1000303B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v5;
  unint64_t v9 = (v4 + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v9, v8);
}

uint64_t sub_100010624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = sub_1000303B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12, v13, v7);
  uint64_t v14 = *(void *)(v9 + 48);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(void *)((v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_100010714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = sub_1000303B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v12, v13, v7);
  uint64_t v14 = *(void *)(v9 + 40);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(void *)((v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_100010804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = sub_1000303B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v13, v7);
  uint64_t v14 = *(void *)(v9 + 32);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(void *)((v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000108F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = sub_1000303B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (v6 + v10 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v12, v13, v7);
  uint64_t v14 = *(void *)(v9 + 24);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(void *)((v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000109E4(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_1000303B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  if (v11 <= 0xFD) {
    unsigned int v11 = 253;
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = *(void *)(*(void *)(v8 - 8) + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v14 = v8;
  uint64_t v15 = *(void *)(v6 + 64) + v12;
  if (v11 < a2)
  {
    unint64_t v16 = (((((v15 & ~v12) + v13) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
    uint64_t v17 = v16 & 0xFFFFFFF8;
    if ((v16 & 0xFFFFFFF8) != 0) {
      unsigned int v18 = 2;
    }
    else {
      unsigned int v18 = a2 - v11 + 1;
    }
    if (v18 >= 0x10000) {
      unsigned int v19 = 4;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v18 < 0x100) {
      unsigned int v19 = 1;
    }
    if (v18 >= 2) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    switch(v20)
    {
      case 1:
        int v21 = *((unsigned __int8 *)a1 + v16);
        if (!v21) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v21 = *(unsigned __int16 *)((char *)a1 + v16);
        if (v21) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x100010BF4);
      case 4:
        int v21 = *(int *)((char *)a1 + v16);
        if (!v21) {
          break;
        }
LABEL_24:
        int v23 = v21 - 1;
        if (v17)
        {
          int v23 = 0;
          int v24 = *a1;
        }
        else
        {
          int v24 = 0;
        }
        return v11 + (v24 | v23) + 1;
      default:
        break;
    }
  }
  if (v7 == v11)
  {
    uint64_t v25 = (uint64_t)a1;
    uint64_t v10 = v7;
    uint64_t v14 = v5;
  }
  else
  {
    uint64_t v25 = ((unint64_t)a1 + v15) & ~v12;
    if (v10 != v11)
    {
      unsigned int v26 = *(unsigned __int8 *)(v25 + v13);
      if (v26 >= 3) {
        return v26 - 2;
      }
      else {
        return 0;
      }
    }
  }

  return sub_10000DA00(v25, v10, v14);
}

void sub_100010C08(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = sub_1000303B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  if (v13 <= 0xFD) {
    unsigned int v13 = 253;
  }
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = *(void *)(v8 + 64) + v14;
  uint64_t v16 = *(void *)(*(void *)(v10 - 8) + 64);
  size_t v17 = (((((v15 & ~v14) + v16) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v13 >= a3)
  {
    int v20 = 0;
  }
  else
  {
    if ((((((v15 & ~v14) + v16) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v18 = a3 - v13 + 1;
    }
    else {
      unsigned int v18 = 2;
    }
    if (v18 >= 0x10000) {
      int v19 = 4;
    }
    else {
      int v19 = 2;
    }
    if (v18 < 0x100) {
      int v19 = 1;
    }
    if (v18 >= 2) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
  }
  if (a2 > v13)
  {
    if ((((((v15 & ~v14) + v16) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v21 = a2 - v13;
    }
    else {
      int v21 = 1;
    }
    if ((((((v15 & ~v14) + v16) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v22 = ~v13 + a2;
      bzero(a1, v17);
      *a1 = v22;
    }
    switch(v20)
    {
      case 1:
        *((unsigned char *)a1 + v17) = v21;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v17) = v21;
        return;
      case 3:
        goto LABEL_45;
      case 4:
        *(_DWORD *)((char *)a1 + v17) = v21;
        return;
      default:
        return;
    }
  }
  uint64_t v23 = ~v14;
  switch(v20)
  {
    case 1:
      *((unsigned char *)a1 + v17) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_34;
    case 2:
      *(_WORD *)((char *)a1 + v17) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_34;
    case 3:
LABEL_45:
      __break(1u);
      JUMPOUT(0x100010E68);
    case 4:
      *(_DWORD *)((char *)a1 + v17) = 0;
      goto LABEL_33;
    default:
LABEL_33:
      if (!a2) {
        return;
      }
LABEL_34:
      if (v9 == v13)
      {
        uint64_t v24 = (uint64_t)a1;
        uint64_t v25 = a2;
        uint64_t v12 = v9;
        uint64_t v10 = v7;
      }
      else
      {
        uint64_t v24 = ((unint64_t)a1 + v15) & v23;
        if (v12 != v13)
        {
          *(unsigned char *)(v24 + v16) = a2 + 2;
          return;
        }
        uint64_t v25 = a2;
      }
      sub_10000DA40(v24, v25, v12, v10);
      return;
  }
}

uint64_t type metadata accessor for PhotosReliveWidgetPaddingVStack()
{
  return sub_100011584();
}

__n128 sub_100010EA8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100010EB8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100010ED8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_100010F14(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100010F5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000110B8()
{
  return sub_10001148C(&qword_100040E50, &qword_100040CE0);
}

void *sub_1000110F4()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_100011100()
{
  return sub_10001148C(&qword_100040E58, &qword_100040E60);
}

uint64_t sub_10001113C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011180()
{
  return sub_10000DFD4(&qword_100040E68, type metadata accessor for TraitKey);
}

uint64_t sub_1000111C8()
{
  return sub_10000DFD4(&qword_100040E70, type metadata accessor for TraitKey);
}

uint64_t sub_100011210()
{
  return sub_10000DFD4(&qword_100040E78, type metadata accessor for AttributeName);
}

uint64_t sub_100011258()
{
  return sub_10000DFD4(&qword_100040E80, type metadata accessor for AttributeName);
}

uint64_t sub_1000112A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000112BC()
{
  return sub_10000DFD4(&qword_100040E88, type metadata accessor for AttributeName);
}

uint64_t sub_100011304()
{
  return sub_10000DFD4(&qword_100040E90, type metadata accessor for TraitKey);
}

unint64_t sub_10001134C()
{
  unint64_t result = qword_100040EB0;
  if (!qword_100040EB0)
  {
    sub_10000D960(&qword_100040EA8);
    sub_1000113EC();
    sub_10001148C(&qword_100040ED0, &qword_100040ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040EB0);
  }
  return result;
}

unint64_t sub_1000113EC()
{
  unint64_t result = qword_100040EB8;
  if (!qword_100040EB8)
  {
    sub_10000D960(&qword_100040EC0);
    sub_10001148C(&qword_100040EC8, &qword_100040E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040EB8);
  }
  return result;
}

uint64_t sub_10001148C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D960(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000114D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D85C(a3);
  sub_100011958();
  sub_100011C50();
  v4();
  return a2;
}

uint64_t sub_100011528(uint64_t a1, uint64_t *a2)
{
  sub_10000D85C(a2);
  sub_100011958();
  sub_100011BBC();
  v3();
  return a1;
}

uint64_t sub_100011578@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C14(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_100011584()
{
  return swift_getGenericMetadata();
}

unsigned char *initializeBufferWithCopyOfBuffer for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_100011648(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100011714);
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

uint64_t sub_10001173C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100011748(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for PhotosReliveWidgetContentType()
{
}

unint64_t sub_100011760()
{
  unint64_t result = qword_100040F08;
  if (!qword_100040F08)
  {
    sub_10000D960(&qword_100040F10);
    sub_10001134C();
    sub_10001148C(&qword_100040EC8, &qword_100040E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F08);
  }
  return result;
}

uint64_t sub_100011800()
{
  return swift_getWitnessTable();
}

unint64_t sub_1000118D0()
{
  unint64_t result = qword_100040F18;
  if (!qword_100040F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F18);
  }
  return result;
}

uint64_t sub_100011968()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000119A4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_1000119E8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100011A70()
{
  uint64_t v3 = v0 + *(int *)(*(void *)(v2 - 312) + 36);
  *(void *)uint64_t v3 = 0;
  *(_WORD *)(v3 + 8) = 257;
  return v1;
}

uint64_t sub_100011AA4()
{
  uint64_t v5 = (_OWORD *)(v1 + *(int *)(*(void *)(v3 - 272) + 36));
  long long v6 = *(_OWORD *)(v3 - 136);
  *uint64_t v5 = *(_OWORD *)(v3 - 152);
  v5[1] = v6;
  v5[2] = *(_OWORD *)(v3 - 120);
  return sub_100011528(v2, v0);
}

void sub_100011AE0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100011AFC(uint64_t result)
{
  *(void *)(v3 - 344) = v1;
  *(void *)(v3 - 352) = result;
  *(void *)(v3 - 360) = v2;
  return result;
}

uint64_t sub_100011B28()
{
  return v0;
}

uint64_t sub_100011B54()
{
  return sub_100030030();
}

uint64_t sub_100011B74(uint64_t a1, uint64_t a2, char a3, uint64_t a4, __n128 a5)
{
  a5.n128_u64[0] = v7;
  return Image.init(_:scale:orientation:label:)(v5, 0, a1, a2, a3 & 1, a4, a5);
}

uint64_t sub_100011BC8(uint64_t a1)
{
  uint64_t v5 = *(_DWORD *)(v2 - 228) & 1;
  uint64_t v6 = *(void *)(v2 - 224);
  uint64_t v7 = *(void *)(v2 - 216);
  uint64_t v8 = *(void *)(v2 - 368);
  return View.accessibilityLabel(_:)(v6, v7, v5, v8, v1, a1);
}

void sub_100011C2C()
{
  *(void *)(v2 - 336) = v0;
  *(void *)(v2 - 328) = v1;
  *(void *)(v2 - 368) = *(void *)(v2 + 16);
}

uint64_t sub_100011C5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011C90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return sub_1000114D0(a1, v4, v2);
}

uint64_t sub_100011CB8()
{
  return v0;
}

uint64_t sub_100011CC8()
{
  return sub_10002FF40();
}

uint64_t sub_100011D08()
{
  return sub_10002FCD0();
}

unint64_t sub_100011D34()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_100011D50(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  a3.n128_u64[0] = a1.n128_u64[0];
  a4.n128_u64[0] = a2.n128_u64[0];
  a1.n128_u64[0] = v6;
  a2.n128_u64[0] = v7;
  return LinearGradient.init(gradient:startPoint:endPoint:)(v4, a1, a2, a3, a4);
}

uint64_t sub_100011D94(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  a1.n128_u64[0] = 0;
  a2.n128_u64[0] = 0;
  a3.n128_u64[0] = 0;
  a4.n128_u64[0] = 0;
  return Image.resizable(capInsets:resizingMode:)(v5, v4, a1, a2, a3, a4);
}

uint64_t sub_100011DBC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 9) = v3 & ~v1;
  return sub_100011528(v4, v2);
}

uint64_t sub_100011DE4()
{
  return sub_100030090();
}

uint64_t sub_100011E0C()
{
  return v0;
}

uint64_t sub_100011E7C()
{
  return type metadata accessor for Image.ResizingMode(0);
}

uint64_t sub_100011EA4()
{
  return sub_10002FA10();
}

void sub_100011ECC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100011EE8(uint64_t a1)
{
  sub_10000DA40(v1, 0, 1, a1);
  return Image.widgetAccentedRenderingMode(_:)(v1, v2);
}

uint64_t sub_100011F34()
{
  return v0;
}

uint64_t sub_100011F50()
{
  return v0;
}

uint64_t sub_100011F6C()
{
  return sub_1000307E0();
}

uint64_t sub_100011F94()
{
  return 0;
}

uint64_t sub_100011FAC()
{
  return v0;
}

uint64_t sub_100011FC8()
{
  return sub_10002FF40();
}

uint64_t sub_100011FF0()
{
  return sub_10002FCD0();
}

void sub_100012038()
{
  *(void *)(v1 - 256) = v0;
}

NSDictionary sub_100012054()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000120B0()
{
  uint64_t v4 = *(void *)(v2 - 344);
  return sub_10000F9A0(v1, v4, v0);
}

uint64_t sub_1000120EC()
{
  return v0;
}

uint64_t sub_10001213C()
{
  return 0;
}

uint64_t sub_10001214C()
{
  uint64_t v6 = *(void *)(v4 - 144);
  *(void *)(v4 - 112) = v0;
  *(void *)(v4 - 104) = v6;
  return sub_1000114D0(v2, v3, v1);
}

void sub_100012170()
{
  *(void *)uint64_t v0 = v2;
  *(void *)(v0 + 8) = v1;
  *(void *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v5;
  *(void *)(v0 + 32) = v6;
  *(void *)(v0 + 40) = v7;
  *(void *)(v0 + 48) = v8;
  *(unsigned char *)(v0 + 56) = v3;
}

uint64_t sub_1000121A0()
{
  return v0;
}

uint64_t sub_1000121B8()
{
  return v0;
}

uint64_t sub_1000121D0()
{
  return *(void *)(v0 - 128);
}

uint64_t sub_1000121E4()
{
  return sub_10002FF40();
}

uint64_t sub_100012218()
{
  return sub_100011528(v1, v0);
}

unint64_t sub_100012230()
{
  return sub_10000F250();
}

uint64_t sub_100012248()
{
  return swift_release();
}

uint64_t sub_100012274()
{
  return sub_1000304F0();
}

uint64_t sub_100012294(uint64_t result, uint64_t a2)
{
  *(void *)(v3 - 256) = v2;
  *(void *)(v3 - 136) = result;
  *(void *)(v3 - 128) = a2;
  return result;
}

uint64_t sub_1000122A8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000122CC()
{
  return sub_1000304F0();
}

uint64_t sub_100012328()
{
  return v0;
}

uint64_t sub_10001233C()
{
  return v0;
}

uint64_t sub_100012350()
{
  return sub_100011528(v1, v0);
}

uint64_t sub_100012368(uint64_t a1)
{
  sub_10000EABC(a1, v1, v3);
  return v2;
}

void sub_100012388(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = v1;
  *(unsigned char *)(a1 + 40) = v2;
  *(void *)(a1 + 48) = v3;
}

uint64_t sub_1000123B8()
{
  return sub_10002F1D4(2, 17, 0, 0);
}

__n128 sub_1000123D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, long long a16, __n128 a17)
{
  v17[7] = a15;
  v17[8] = a16;
  __n128 result = a17;
  v17[9] = a17;
  return result;
}

uint64_t sub_1000123EC()
{
  return 0;
}

uint64_t sub_10001240C()
{
  return v0;
}

uint64_t sub_100012420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 - 136) = a3;
  *(void *)(v4 - 128) = v3;
  *(void *)(v4 - 144) = a2;
  return sub_1000303B0();
}

BOOL sub_100012440()
{
  if (!*(void *)(v0 + 24)) {
    return 0;
  }
  type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
  if (swift_dynamicCastClass()) {
    return 0;
  }
  type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
  return !swift_dynamicCastClass() && *(unsigned char *)(v0 + 32) == 0;
}

uint64_t PhotosReliveWidgetView.body.getter()
{
  uint64_t v2 = sub_10002FF60();
  sub_10001193C();
  uint64_t v4 = v3;
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D85C(&qword_100040F20);
  sub_100011958();
  __chkstk_darwin(v9, v10);
  sub_10001198C();
  sub_100012610(v0, v1);
  sub_10002FF50();
  sub_100030270();
  sub_1000134B4();
  sub_100030120();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v2);
  return sub_100014588(v1, &qword_100040F20);
}

uint64_t sub_100012610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v120 = a2;
  uint64_t v101 = sub_10002FD60();
  uint64_t v100 = *(void *)(v101 - 8);
  __chkstk_darwin(v101, v3);
  uint64_t v99 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  __chkstk_darwin(v109, v5);
  uint64_t v114 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_10000D85C(&qword_100041018);
  uint64_t v103 = *(void *)(v110 - 8);
  uint64_t v8 = __chkstk_darwin(v110, v7);
  char v98 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  uint64_t v102 = (char *)&v92 - v11;
  uint64_t v106 = sub_10000D85C(&qword_100041020);
  __chkstk_darwin(v106, v12);
  uint64_t v108 = (uint64_t *)((char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_1000303B0();
  uint64_t v112 = *(void *)(v14 - 8);
  uint64_t v113 = v14;
  uint64_t v16 = __chkstk_darwin(v14, v15);
  char v111 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  v115 = (char *)&v92 - v20;
  uint64_t v22 = __chkstk_darwin(v19, v21);
  uint64_t v97 = (char *)&v92 - v23;
  __chkstk_darwin(v22, v24);
  uint64_t v104 = (char *)&v92 - v25;
  uint64_t v105 = type metadata accessor for PhotosReliveWidgetView();
  uint64_t v27 = __chkstk_darwin(v105, v26);
  uint64_t v29 = (char *)&v92 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27, v30);
  uint64_t v32 = (char *)&v92 - v31;
  uint64_t v119 = sub_10000D85C(&qword_100040F68);
  __chkstk_darwin(v119, v33);
  uint64_t v107 = (char *)&v92 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_10000D85C(&qword_100041028);
  __chkstk_darwin(v117, v35);
  uint64_t v118 = (uint64_t)&v92 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_10000D85C(&qword_100041030);
  __chkstk_darwin(v96, v37);
  uint64_t v39 = (char *)&v92 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_10000D85C(&qword_100041038);
  __chkstk_darwin(v40, v41);
  uint64_t v43 = (uint64_t *)((char *)&v92 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v94 = sub_10000D85C(&qword_100040F58);
  __chkstk_darwin(v94, v44);
  uint64_t v95 = (char *)&v92 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  __chkstk_darwin(v46, v47);
  uint64_t v93 = (char *)&v92 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_10000D85C(&qword_100040F48);
  __chkstk_darwin(v116, v49);
  uint64_t v51 = (char *)&v92 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 24) || (uint64_t v52 = *(void *)(a1 + 24), v53 = (uint64_t)v51, !sub_100012440()))
  {
    id v56 = *(id *)a1;
    sub_1000145DC(a1, (uint64_t)v32, (void (*)(void))type metadata accessor for PhotosReliveWidgetView);
    if (v56)
    {
      int v57 = v32[32];
      sub_100014524((uint64_t)v32, (uint64_t)v29);
      uint64_t v58 = (uint64_t)v114;
      uint64_t v59 = (uint64_t)v115;
      uint64_t v61 = v111;
      uint64_t v60 = v112;
      if (v57 == 1)
      {
        sub_100014630((uint64_t)v29, (void (*)(void))type metadata accessor for PhotosReliveWidgetView);
        uint64_t v62 = v113;
LABEL_10:
        id v64 = *(id *)a1;
        if (!*(void *)a1)
        {
          __break(1u);
          goto LABEL_29;
        }
        uint64_t v65 = *(void *)(a1 + 16);
        uint64_t v66 = *(unsigned __int8 *)(a1 + 8);
        swift_retain();
        id v67 = v64;
        uint64_t v68 = (uint64_t)v104;
        sub_1000142B4(&qword_100040668, (void (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v104);
        type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
        char v69 = v97;
        (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v97, v68, v62);
        uint64_t v70 = sub_100024910(v67, v66, v65, v69);
        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v68, v62);
        uint64_t *v108 = v70;
        swift_storeEnumTagMultiPayload();
        sub_10000E148();
        uint64_t v71 = sub_1000137B0(&qword_100040940, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
        uint64_t v121 = v109;
        uint64_t v122 = v71;
        swift_getOpaqueTypeConformance2();
        uint64_t v72 = (uint64_t)v107;
        sub_10002FF40();
LABEL_23:
        uint64_t v87 = &qword_100040F68;
        sub_100014688(v72, v118, &qword_100040F68);
        swift_storeEnumTagMultiPayload();
        sub_1000135A4();
        sub_1000136CC();
        sub_10002FF40();
        uint64_t v88 = v72;
        return sub_100014588(v88, v87);
      }
      int v63 = v29[32];
      sub_100014630((uint64_t)v29, (void (*)(void))type metadata accessor for PhotosReliveWidgetView);
      uint64_t v62 = v113;
      if (v63 == 3) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_100014630((uint64_t)v32, (void (*)(void))type metadata accessor for PhotosReliveWidgetView);
      uint64_t v62 = v113;
      uint64_t v58 = (uint64_t)v114;
      uint64_t v61 = v111;
      uint64_t v60 = v112;
      uint64_t v59 = (uint64_t)v115;
    }
    if (*(void *)(a1 + 24))
    {
      type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
      uint64_t v73 = swift_dynamicCastClass();
      if (v73) {
        swift_retain();
      }
    }
    else
    {
      uint64_t v73 = 0;
    }
    if (*(void *)a1) {
      id v74 = [*(id *)a1 contentType];
    }
    else {
      id v74 = 0;
    }
    swift_retain();
    sub_1000142B4(&qword_100040668, (void (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, v59);
    sub_100030020();
    uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
    v75(v61, v59, v62);
    if (v73)
    {
      uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
      v76(v59, v62);
      v76((uint64_t)v61, v62);
      uint64_t v77 = v73;
    }
    else
    {
      type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
      uint64_t v78 = (uint64_t)v104;
      v75(v104, (uint64_t)v61, v62);
      uint64_t v77 = sub_100024554(v74, 0, 0, v78);
      uint64_t v79 = *(void (**)(char *, uint64_t))(v60 + 8);
      v79(v115, v62);
      v79(v61, v62);
    }
    uint64_t v80 = v109;
    *(void *)(v58 + *(int *)(v109 + 20)) = v77;
    uint64_t v81 = v99;
    sub_10002FD50();
    uint64_t v82 = sub_1000137B0(&qword_100040940, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
    uint64_t v83 = v98;
    sub_100030140();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v81, v101);
    sub_100014630(v58, (void (*)(void))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
    uint64_t v85 = v102;
    uint64_t v84 = v103;
    uint64_t v86 = v110;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v102, v83, v110);
    (*(void (**)(uint64_t *, char *, uint64_t))(v84 + 16))(v108, v85, v86);
    swift_storeEnumTagMultiPayload();
    sub_10000E148();
    uint64_t v121 = v80;
    uint64_t v122 = v82;
    swift_getOpaqueTypeConformance2();
    uint64_t v72 = (uint64_t)v107;
    sub_10002FF40();
    swift_release();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
    goto LABEL_23;
  }
  uint64_t v54 = *(void *)(v52 + 16);
  if ((unint64_t)(v54 - 1) < 2)
  {
    void *v43 = v52;
    swift_storeEnumTagMultiPayload();
    sub_1000137B0(&qword_100040840, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
    sub_10000E0B8();
    swift_retain_n();
    uint64_t v55 = (uint64_t)v95;
    sub_10002FF40();
    sub_100014688(v55, (uint64_t)v39, &qword_100040F58);
    swift_storeEnumTagMultiPayload();
    sub_100013620();
    sub_10002FF40();
    sub_100014588(v55, &qword_100040F58);
LABEL_26:
    uint64_t v87 = &qword_100040F48;
    sub_100014688(v53, v118, &qword_100040F48);
    swift_storeEnumTagMultiPayload();
    sub_1000135A4();
    sub_1000136CC();
    sub_10002FF40();
    swift_release();
    uint64_t v88 = v53;
    return sub_100014588(v88, v87);
  }
  if (!v54)
  {
    swift_retain_n();
    uint64_t v89 = (uint64_t)v93;
    sub_100030020();
    *(void *)(v89 + *(int *)(v46 + 20)) = v52;
    sub_1000145DC(v89, (uint64_t)v43, (void (*)(void))type metadata accessor for PhotosReliveWidgetMemoryContent);
    swift_storeEnumTagMultiPayload();
    sub_1000137B0(&qword_100040840, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
    sub_10000E0B8();
    uint64_t v90 = (uint64_t)v95;
    sub_10002FF40();
    sub_100014688(v90, (uint64_t)v39, &qword_100040F58);
    swift_storeEnumTagMultiPayload();
    sub_100013620();
    sub_10002FF40();
    sub_100014588(v90, &qword_100040F58);
    sub_100014630(v89, (void (*)(void))type metadata accessor for PhotosReliveWidgetMemoryContent);
    goto LABEL_26;
  }
LABEL_29:
  uint64_t result = sub_1000308E0();
  __break(1u);
  return result;
}

uint64_t sub_10001348C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100030170();
  *a1 = result;
  return result;
}

unint64_t sub_1000134B4()
{
  unint64_t result = qword_100040F28;
  if (!qword_100040F28)
  {
    sub_10000D960(&qword_100040F20);
    sub_100013528();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F28);
  }
  return result;
}

unint64_t sub_100013528()
{
  unint64_t result = qword_100040F30;
  if (!qword_100040F30)
  {
    sub_10000D960(&qword_100040F38);
    sub_1000135A4();
    sub_1000136CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F30);
  }
  return result;
}

unint64_t sub_1000135A4()
{
  unint64_t result = qword_100040F40;
  if (!qword_100040F40)
  {
    sub_10000D960(&qword_100040F48);
    sub_100013620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F40);
  }
  return result;
}

unint64_t sub_100013620()
{
  unint64_t result = qword_100040F50;
  if (!qword_100040F50)
  {
    sub_10000D960(&qword_100040F58);
    sub_1000137B0(&qword_100040840, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetMemoryContent);
    sub_10000E0B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F50);
  }
  return result;
}

unint64_t sub_1000136CC()
{
  unint64_t result = qword_100040F60;
  if (!qword_100040F60)
  {
    sub_10000D960(&qword_100040F68);
    sub_10000E148();
    type metadata accessor for PhotosReliveWidgetPlaceholderContent(255);
    sub_1000137B0(&qword_100040940, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040F60);
  }
  return result;
}

uint64_t sub_1000137B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000137F8()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for PhotosReliveWidgetView(char *a1, char **a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    if (*a2)
    {
      *(void *)a1 = v7;
      a1[8] = *((unsigned char *)a2 + 8);
      *((void *)a1 + 2) = a2[2];
      uint64_t v8 = v7;
      swift_retain();
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((void *)a1 + 2) = a2[2];
    }
    *((void *)v4 + 3) = a2[3];
    v4[32] = *((unsigned char *)a2 + 32);
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = &v4[v10];
    uint64_t v12 = (char **)((char *)a2 + v10);
    swift_retain();
    sub_10000D85C(&qword_100040668);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1000303B0();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *(void *)uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t destroy for PhotosReliveWidgetView(id *a1, uint64_t a2)
{
  if (*a1)
  {

    swift_release();
  }
  swift_release();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  sub_10000D85C(&qword_100040668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000303B0();
    uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t initializeWithCopy for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)a1 = v6;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    id v7 = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  swift_retain();
  sub_10000D85C(&qword_100040668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1000303B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for PhotosReliveWidgetView(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  id v7 = *(void **)a2;
  if (*(void *)a1)
  {
    if (v7)
    {
      *(void *)a1 = v7;
      id v8 = v7;

      *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      swift_retain();
      swift_release();
    }
    else
    {
      sub_100013CF4(a1);
      uint64_t v10 = *((void *)a2 + 2);
      *(_OWORD *)a1 = *a2;
      *(void *)(a1 + 16) = v10;
    }
  }
  else if (v7)
  {
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    id v9 = v7;
    swift_retain();
  }
  else
  {
    long long v11 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v11;
  }
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  if ((long long *)a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 28);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    sub_100014588(a1 + v12, &qword_100040668);
    sub_10000D85C(&qword_100040668);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_1000303B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100013CF4(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (void *)(a1 + v5);
  id v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_10000D85C(&qword_100040668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_1000303B0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  if (*(void *)a1)
  {
    if (*(void *)a2)
    {
      *(void *)a1 = *(void *)a2;

      *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_release();
      goto LABEL_6;
    }
    sub_100013CF4(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
LABEL_6:
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_100014588(a1 + v7, &qword_100040668);
    uint64_t v10 = sub_10000D85C(&qword_100040668);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1000303B0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013F90);
}

uint64_t sub_100013F90(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_10000D85C(&qword_100040F70);
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 28);
    return sub_10000DA00(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001403C);
}

void *sub_10001403C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_10000D85C(&qword_100040F70);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 28);
    return (void *)sub_10000DA40(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotosReliveWidgetView()
{
  uint64_t result = qword_100040FD0;
  if (!qword_100040FD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100014108()
{
  sub_1000141B4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000141B4()
{
  if (!qword_100040FE0)
  {
    sub_1000303B0();
    unint64_t v0 = sub_10002FC70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040FE0);
    }
  }
}

uint64_t sub_10001420C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001427C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000142B4(&qword_100040CA0, (void (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x8000000100033420, a1);
}

uint64_t sub_1000142B4@<X0>(uint64_t *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v30 = a3;
  uint64_t v10 = v5;
  uint64_t v12 = sub_10002FE20();
  sub_10001193C();
  uint64_t v14 = v13;
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D85C(a1);
  sub_100011958();
  __chkstk_darwin(v19, v20);
  sub_10001198C();
  sub_100014688(v10, v6, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    a2(0);
    sub_100011958();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(a5, v6);
  }
  else
  {
    os_log_type_t v23 = sub_1000306D0();
    uint64_t v24 = sub_10002FF70();
    if (os_log_type_enabled(v24, v23))
    {
      unint64_t v28 = a4;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v29 = a5;
      uint64_t v26 = (uint8_t *)v25;
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v31 = sub_10001F274(v30, v28, &v32);
      sub_1000307C0();
      _os_log_impl((void *)&_mh_execute_header, v24, v23, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10002FE10();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v18, v12);
  }
}

uint64_t sub_100014524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotosReliveWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014588(uint64_t a1, uint64_t *a2)
{
  sub_10000D85C(a2);
  sub_100011958();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1000145DC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100011958();
  uint64_t v4 = sub_1000146D8();
  v5(v4);
  return a2;
}

uint64_t sub_100014630(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100011958();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100014688(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D85C(a3);
  sub_100011958();
  uint64_t v4 = sub_1000146D8();
  v5(v4);
  return a2;
}

uint64_t sub_1000146D8()
{
  return v0;
}

uint64_t sub_1000146EC()
{
  sub_1000303B0();
  sub_10001193C();
  __chkstk_darwin(v0, v1);
  sub_10002228C();
  sub_1000119DC();
  v2();
  uint64_t v3 = sub_100022410();
  int v5 = v4(v3);
  uint64_t result = 0;
  if (v5 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v5 == enum case for WidgetFamily.systemMedium(_:))
    {
      return 1;
    }
    else if (v5 == enum case for WidgetFamily.systemLarge(_:))
    {
      return 2;
    }
    else if (v5 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      return 3;
    }
    else
    {
      uint64_t v7 = sub_100022410();
      v8(v7);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100014824()
{
  sub_100030870(45);
  v1._object = (void *)0x80000001000337B0;
  v1._countAndFlagsBits = 0xD000000000000011;
  sub_1000305F0(v1);
  swift_bridgeObjectRetain();
  sub_10000D85C(&qword_1000412E0);
  v2._countAndFlagsBits = sub_1000305C0();
  sub_1000305F0(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x3A79616C656420;
  v3._object = (void *)0xE700000000000000;
  sub_1000305F0(v3);
  sub_1000306A0();
  v4._countAndFlagsBits = 0x6C75646568637320;
  v4._object = (void *)0xEF20657461446465;
  sub_1000305F0(v4);
  type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  sub_10002FBA0();
  sub_10002021C(&qword_1000412E8, (void (*)(uint64_t))&type metadata accessor for Date);
  v5._countAndFlagsBits = sub_1000309A0();
  sub_1000305F0(v5);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10001499C(uint64_t a1)
{
  unint64_t v1 = 0xED00006F746F6850;
  uint64_t v2 = 0x6465727574616566;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = 0x6E776F6E6B6E75;
  if (!a1)
  {
    uint64_t v4 = 0x79726F6D656DLL;
    unint64_t v3 = 0xE600000000000000;
  }
  if (a1 != 1)
  {
    uint64_t v2 = v4;
    unint64_t v1 = v3;
  }
  BOOL v5 = a1 == 2;
  if (a1 == 2) {
    v6._countAndFlagsBits = 0x6D75626C61;
  }
  else {
    v6._countAndFlagsBits = v2;
  }
  if (v5) {
    uint64_t v7 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v7 = (void *)v1;
  }
  v6._object = v7;
  sub_1000305F0(v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100014A4C()
{
  sub_1000216F4(0, &qword_100041238);
  uint64_t result = sub_1000307B0();
  qword_100041040 = result;
  return result;
}

uint64_t sub_100014AC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000303B0();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  uint64_t v6 = __chkstk_darwin(v4, v5);
  __chkstk_darwin(v6, v7);
  uint64_t v43 = (char *)&v37 - v8;
  uint64_t v9 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  uint64_t v11 = __chkstk_darwin(v9, v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v37 - v15;
  sub_100015294();
  id v17 = [self standardUserDefaults];
  NSString v18 = sub_100030580();
  swift_bridgeObjectRelease();
  id v19 = [v17 dataForKey:v18];

  if (v19)
  {
    uint64_t v42 = a2;
    uint64_t v20 = sub_10002FB10();
    unint64_t v22 = v21;

    sub_10002FA40();
    swift_allocObject();
    sub_10002FA30();
    sub_10002021C(&qword_100041338, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    sub_10002FA20();
    uint64_t v41 = v9;
    uint64_t v40 = v20;
    swift_release();
    os_log_type_t v24 = sub_1000306B0();
    os_log_type_t v25 = v24;
    uint64_t v26 = v44;
    uint64_t v27 = v45;
    if (qword_100040608 != -1) {
      swift_once();
    }
    unint64_t v28 = qword_100041040;
    sub_100021C00((uint64_t)v16, (uint64_t)v13, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    uint64_t v29 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v43, a1, v27);
    if (os_log_type_enabled(v28, v25))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v47[0] = v39;
      *(_DWORD *)uint64_t v30 = 136315394;
      os_log_t v38 = v28;
      uint64_t v31 = sub_100014824();
      uint64_t v46 = sub_10001F274(v31, v32, v47);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      sub_100021C5C((uint64_t)v13, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
      *(_WORD *)(v30 + 12) = 2080;
      sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
      uint64_t v33 = v43;
      uint64_t v34 = sub_1000309A0();
      uint64_t v46 = sub_10001F274(v34, v35, v47);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v33, v27);
      _os_log_impl((void *)&_mh_execute_header, v38, v25, "decoded saved scheduled reload config %s for widget family %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_100021DFC(v40, v22);
    }
    else
    {
      sub_100021DFC(v40, v22);
      sub_100021C5C((uint64_t)v13, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v27);
    }
    uint64_t v36 = v42;
    sub_100021CF4((uint64_t)v16, v42);
    return sub_10000DA40(v36, 0, 1, v41);
  }
  else
  {
    return sub_10000DA40(a2, 1, 1, v9);
  }
}

unint64_t sub_100015294()
{
  sub_100030870(18);
  swift_bridgeObjectRelease();
  sub_1000303A0();
  v1._countAndFlagsBits = sub_1000309A0();
  sub_1000305F0(v1);
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

uint64_t sub_100015330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000303B0();
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v58 = v4;
  __chkstk_darwin(v4, v5);
  id v56 = &v51[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10000D85C(&qword_100041068);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = &v51[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  uint64_t v13 = __chkstk_darwin(v11, v12);
  uint64_t v15 = &v51[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13, v16);
  uint64_t v59 = &v51[-v17];
  uint64_t v18 = sub_10002FC60();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v60 = v18;
  uint64_t v61 = v19;
  __chkstk_darwin(v18, v20);
  unint64_t v22 = &v51[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v62 = [self standardUserDefaults];
  sub_100015294();
  if (qword_100040608 != -1) {
    swift_once();
  }
  id v23 = (id)qword_100041040;
  sub_10002FC40();
  sub_10001FA4C(a1, (uint64_t)v10);
  if (sub_10000DA00((uint64_t)v10, 1, v11) == 1)
  {
    sub_100011528((uint64_t)v10, &qword_100041068);
    NSString v24 = sub_100030580();
    id v25 = v62;
    id v26 = [v62 objectForKey:v24];

    if (v26)
    {
      sub_100030820();
      swift_unknownObjectRelease();
      sub_100011528((uint64_t)v64, &qword_100041310);
      sub_100030770();
      sub_10002FC30();
      sub_1000306B0();
      sub_10002FC10();
      NSString v27 = sub_100030580();
      swift_bridgeObjectRelease();
      [v25 removeObjectForKey:v27];

      if (!CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication))
      {
        sub_1000306C0();
        sub_10002FC10();
      }
      sub_100030760();
      sub_10002FC30();
    }
    else
    {
      memset(v64, 0, sizeof(v64));

      swift_bridgeObjectRelease();
      sub_100011528((uint64_t)v64, &qword_100041310);
    }
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v61 + 8))(v22, v60);
  }
  else
  {
    unint64_t v28 = v59;
    sub_100021CF4((uint64_t)v10, (uint64_t)v59);
    sub_100030770();
    sub_10002FC30();
    sub_10002FA70();
    swift_allocObject();
    sub_10002FA60();
    sub_100021D58();
    uint64_t v29 = sub_10002FA50();
    unint64_t v31 = v30;
    swift_release();
    uint64_t v54 = v29;
    unint64_t v55 = v31;
    Class isa = sub_10002FB00().super.isa;
    NSString v33 = sub_100030580();
    swift_bridgeObjectRelease();
    id v34 = v62;
    [v62 setObject:isa forKey:v33];

    if (!CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication))
    {
      sub_1000306C0();
      sub_10002FC10();
    }
    os_log_type_t v36 = sub_1000306B0();
    uint64_t v37 = qword_100041040;
    sub_100021C00((uint64_t)v28, (uint64_t)v15, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    os_log_t v38 = v56;
    uint64_t v39 = v57;
    uint64_t v40 = a2;
    uint64_t v41 = v58;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v57 + 16))(v56, v40, v58);
    os_log_t v53 = v37;
    if (os_log_type_enabled(v37, v36))
    {
      uint64_t v42 = v39;
      uint64_t v43 = swift_slowAlloc();
      *(void *)&v64[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136315394;
      int v52 = v36;
      uint64_t v44 = sub_100014824();
      uint64_t v63 = sub_10001F274(v44, v45, (uint64_t *)v64);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      sub_100021C5C((uint64_t)v15, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
      *(_WORD *)(v43 + 12) = 2080;
      sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
      uint64_t v46 = sub_1000309A0();
      uint64_t v63 = sub_10001F274(v46, v47, (uint64_t *)v64);
      unint64_t v28 = v59;
      sub_1000307C0();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v38, v41);
      _os_log_impl((void *)&_mh_execute_header, v53, (os_log_type_t)v52, "saved scheduled reload configuration %s for widget family %s", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      id v34 = v62;
      swift_slowDealloc();
      swift_slowDealloc();
      sub_100021DFC(v54, v55);
    }
    else
    {
      sub_100021DFC(v54, v55);
      sub_100021C5C((uint64_t)v15, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
      (*(void (**)(unsigned char *, uint64_t))(v39 + 8))(v38, v41);
    }
    uint64_t v50 = v60;
    uint64_t v49 = v61;
    sub_100030760();
    sub_10002FC30();

    sub_100021C5C((uint64_t)v28, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v49 + 8))(v22, v50);
  }
}

uint64_t sub_100015CF4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6564497972746E65 && a2 == 0xEF7265696669746ELL;
  if (v2 || (sub_1000309C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x79616C6564 && a2 == 0xE500000000000000;
    if (v6 || (sub_1000309C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x656C756465686373 && a2 == 0xED00006574614464)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1000309C0();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_100015E84()
{
  return 3;
}

uint64_t sub_100015E8C()
{
  return 0;
}

uint64_t sub_100015E98(char a1)
{
  if (!a1) {
    return 0x6564497972746E65;
  }
  if (a1 == 1) {
    return 0x79616C6564;
  }
  return 0x656C756465686373;
}

Swift::Int sub_100015F04()
{
  return sub_100003FF8(*v0);
}

uint64_t sub_100015F20()
{
  return sub_100015E98(*v0);
}

uint64_t sub_100015F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100015CF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100015F50()
{
  return sub_100015E8C();
}

uint64_t sub_100015F70@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100015E84();
  *a1 = result;
  return result;
}

uint64_t sub_100015F98(uint64_t a1)
{
  unint64_t v2 = sub_100021BB4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100015FD4(uint64_t a1)
{
  unint64_t v2 = sub_100021BB4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100016010(void *a1)
{
  uint64_t v3 = sub_10000D85C(&qword_1000412D0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100021B70(a1, a1[3]);
  sub_100021BB4();
  sub_100030A30();
  v9[15] = 0;
  sub_100030970();
  if (!v1)
  {
    v9[14] = 1;
    sub_100030980();
    type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
    v9[13] = 2;
    sub_10002FBA0();
    sub_10002021C(&qword_1000412D8, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100030990();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_1000161F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = sub_10002FBA0();
  uint64_t v23 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000D85C(&qword_1000412B8);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (uint64_t *)((char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v13 = 0;
  v13[1] = 0;
  sub_100021B70(a1, a1[3]);
  sub_100021BB4();
  sub_100030A20();
  if (v2)
  {
    sub_100021EA0((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = v10;
    uint64_t v15 = v24;
    uint64_t v14 = v25;
    char v30 = 0;
    *uint64_t v13 = sub_100030940();
    v13[1] = v16;
    char v29 = 1;
    sub_100030950();
    v13[2] = v17;
    char v28 = 2;
    sub_10002021C(&qword_1000412C8, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v21 = v6;
    uint64_t v18 = v27;
    sub_100030960();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v18);
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v13 + *(int *)(v22 + 24), v21, v26);
    sub_100021C00((uint64_t)v13, v14, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    sub_100021EA0((uint64_t)a1);
    return sub_100021C5C((uint64_t)v13, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
  }
}

uint64_t sub_100016534@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000161F0(a1, a2);
}

uint64_t sub_10001654C(void *a1)
{
  return sub_100016010(a1);
}

id sub_100016568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    NSString v4 = sub_100030580();
  }
  else {
    NSString v4 = 0;
  }
  uint64_t v5 = self;
  id v6 = [v5 fallbackEntryForContentType:a1 sourceIdentifier:v4 size:sub_1000146EC()];

  return v6;
}

uint64_t PhotosReliveWidgetEntry.shouldReload.getter(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 || a2) {
    return 0;
  }
  if (*(void *)(a3 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image)) {
    return *(unsigned __int8 *)(a3 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded);
  }
  return 1;
}

uint64_t PhotosReliveWidgetEntry.date.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = sub_10002FBA0();
  sub_10001193C();
  uint64_t v8 = v7;
  __chkstk_darwin(v9, v10);
  sub_1000119C4();
  uint64_t v11 = sub_10000D85C(&qword_100041048);
  __chkstk_darwin(v11 - 8, v12);
  sub_10002241C();
  id v13 = [a1 startTime];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_10002FB80();

    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
    v15(v2, v3, v6);
    sub_10000DA40(v2, 0, 1, v6);
    if (sub_10000DA00(v2, 1, v6) != 1) {
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15)(a2, v2, v6);
    }
  }
  else
  {
    sub_10000DA40(v2, 1, 1, v6);
  }
  sub_10002FB90();
  return sub_100011528(v2, &qword_100041048);
}

uint64_t PhotosReliveWidgetEntry.endDate.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = sub_10002FBA0();
  sub_10001193C();
  uint64_t v8 = v7;
  __chkstk_darwin(v9, v10);
  sub_10002241C();
  uint64_t v11 = sub_10000D85C(&qword_100041048);
  __chkstk_darwin(v11 - 8, v12);
  sub_1000119C4();
  id v13 = [a1 endTime];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_10002FB80();

    uint64_t v15 = *(void (**)(void))(v8 + 32);
    sub_10002228C();
    v15();
    sub_10000DA40(v3, 0, 1, v6);
    if (sub_10000DA00(v3, 1, v6) != 1) {
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15)(a2, v3, v6);
    }
  }
  else
  {
    sub_10000DA40(v3, 1, 1, v6);
  }
  sub_10002FB90();
  sub_10002FB50();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v6);
  return sub_100011528(v3, &qword_100041048);
}

void PhotosReliveWidgetEntry.description.getter()
{
  sub_1000221D0();
  uint64_t v1 = v0;
  char v3 = v2;
  uint64_t v5 = v4;
  sub_10000D85C(&qword_100041048);
  sub_100011958();
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(v3)
  {
    case 1:
    case 3:
      goto LABEL_11;
    default:
      v22[0] = 0;
      v22[1] = 0xE000000000000000;
      sub_100030870(59);
      v23._countAndFlagsBits = 0xD000000000000012;
      v23._object = (void *)0x8000000100033440;
      sub_1000305F0(v23);
      id v10 = [v5 localIdentifier];
      uint64_t v11 = sub_1000305B0();
      id v13 = v12;

      v24._countAndFlagsBits = v11;
      v24._object = v13;
      sub_1000305F0(v24);
      swift_bridgeObjectRelease();
      v25._countAndFlagsBits = 0x746E65746E6F6320;
      v25._object = (void *)0xEE00203A65707954;
      sub_1000305F0(v25);
      sub_10001499C((uint64_t)[v5 contentType]);
      v26._countAndFlagsBits = 0x20746573736120;
      v26._object = (void *)0xE700000000000000;
      sub_1000305F0(v26);
      id v14 = [v5 assetLocalIdentifier];
      uint64_t v15 = sub_1000305B0();
      uint64_t v17 = v16;

      v27._countAndFlagsBits = v15;
      v27._object = v17;
      sub_1000305F0(v27);
      swift_bridgeObjectRelease();
      v28._countAndFlagsBits = 0x6954747261747320;
      v28._object = (void *)0xEC000000203A656DLL;
      sub_1000305F0(v28);
      id v18 = [v5 startTime];
      if (v18)
      {
        uint64_t v19 = v18;
        sub_10002FB80();

        uint64_t v20 = sub_10002FBA0();
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v20 = sub_10002FBA0();
        uint64_t v21 = 1;
      }
      sub_10000DA40((uint64_t)v9, v21, 1, v20);
      v29._countAndFlagsBits = sub_1000305C0();
      sub_1000305F0(v29);
      swift_bridgeObjectRelease();
      if (v3 == 2) {
        goto LABEL_8;
      }
      if (!v1) {
        goto LABEL_11;
      }
      type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
      if (!swift_dynamicCastClass()) {
        goto LABEL_9;
      }
LABEL_8:
      v30._countAndFlagsBits = 0xD000000000000016;
      v30._object = (void *)0x8000000100033460;
      sub_1000305F0(v30);
      if (v1)
      {
LABEL_9:
        if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded) == 1)
        {
          swift_retain();
          v31._countAndFlagsBits = 0x642D6567616D4920;
          v31._object = (void *)0xEF64656461726765;
          sub_1000305F0(v31);
          swift_release();
        }
      }
LABEL_11:
      sub_1000221E8();
      return;
  }
}

uint64_t sub_100016C8C@<X0>(uint64_t a1@<X8>)
{
  return PhotosReliveWidgetEntry.date.getter(*v1, a1);
}

void sub_100016C98()
{
}

id sub_100016CA8(uint64_t a1)
{
  return sub_10001B278(a1, &qword_1000446A8);
}

uint64_t sub_100016CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  *(void *)&long long v81 = a5;
  uint64_t v82 = a4;
  uint64_t v77 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v77, v7);
  uint64_t v76 = (uint64_t)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D85C(&qword_100041240);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000D85C(&qword_100041248);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10002F970();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10002FC60();
  __chkstk_darwin(v22, v23);
  Swift::String v26 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100040618 == -1)
  {
    if (a6) {
      goto LABEL_3;
    }
LABEL_29:
    sub_10000D85C(&qword_100041250);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_1000311F0;
    *(void *)(v54 + 32) = [self privacyDisclosureEntryForContentType:2];
    *(unsigned char *)(v54 + 40) = 3;
    *(void *)(v54 + 48) = 0;
    return v54;
  }
  uint64_t v79 = v24;
  swift_once();
  uint64_t v24 = v79;
  if (!a6) {
    goto LABEL_29;
  }
LABEL_3:
  uint64_t v78 = v22;
  uint64_t v79 = v24;
  Swift::String v27 = (void *)qword_1000446B0;
  id v28 = a6;
  id v29 = v27;
  sub_10002FC40();
  sub_100030770();
  id v80 = v29;
  sub_10002FC30();
  sub_10002F790();
  if (sub_10000DA00((uint64_t)v16, 1, v17) == 1)
  {
    sub_100011528((uint64_t)v16, &qword_100041248);
    sub_10002F790();
    if (v83)
    {
      uint64_t v31 = v84;
      unint64_t v30 = v85;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v31 = 0;
      unint64_t v30 = 0;
    }
    uint64_t v37 = v82;
    sub_10002F790();
    if (v83)
    {
      sub_10002F760();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v35 = v84;
    }
    else
    {
      unint64_t v35 = 0;
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, v17);
    uint64_t v32 = sub_10002F960();
    sub_100017694(v32, (uint64_t)v12);
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_10002F7F0();
    if (sub_10000DA00((uint64_t)v12, 1, v33) == 1)
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      sub_100011528((uint64_t)v12, &qword_100041240);
      uint64_t v34 = 0;
      unint64_t v35 = 0;
    }
    else
    {
      uint64_t v34 = sub_10002F7E0();
      unint64_t v35 = v36;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      (*(void (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v12, v33);
    }
    swift_bridgeObjectRetain();
    uint64_t v31 = v34;
    unint64_t v30 = v35;
    uint64_t v37 = v82;
  }
  uint64_t v38 = v31;
  uint64_t v39 = v28;
  uint64_t v40 = sub_10001773C(v38, v30, v28);
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  if (v42)
  {
    if (v35)
    {
      uint64_t v43 = self;
      swift_bridgeObjectRetain();
      NSString v44 = sub_100030580();
      swift_bridgeObjectRelease();
      NSString v45 = sub_100030580();
      swift_bridgeObjectRelease();
      id v46 = [v43 timelineFromLibrary:v28 albumIdentifier:v44 widgetIdentifier:v45 widgetSize:*(double *)(v37 + *(int *)(v77 + 20)) *(double *)(v37 + *(int *)(v77 + 20) + 8)];

      uint64_t v39 = v28;
      sub_1000216F4(0, &qword_100041260);
      unint64_t v47 = (void *)sub_100030640();

      goto LABEL_19;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unint64_t v47 = &_swiftEmptyArrayStorage;
LABEL_19:
  uint64_t v48 = sub_100018000(v81, (unint64_t)v47);
  __chkstk_darwin(v48, v49);
  *(&v75 - 2) = v37;
  *(&v75 - 1) = (uint64_t)v39;
  sub_1000181B0((void (*)(uint64_t *__return_ptr, id *))sub_100022168, (uint64_t)(&v75 - 4), v48, v50, v51, v52);
  uint64_t v54 = v53;
  sub_100030760();
  sub_10002FC30();
  if (!*(void *)(v54 + 16))
  {
    swift_bridgeObjectRelease();
    if (v42)
    {
      unint64_t v55 = self;
      sub_10000D85C(&qword_100041258);
      uint64_t v56 = swift_allocObject();
      long long v81 = xmmword_1000311F0;
      *(_OWORD *)(v56 + 16) = xmmword_1000311F0;
      *(void *)(v56 + 32) = v40;
      *(void *)(v56 + 40) = v42;
      swift_bridgeObjectRetain_n();
      Class isa = sub_100030630().super.isa;
      swift_bridgeObjectRelease();
      id v58 = [v39 librarySpecificFetchOptions];
      uint64_t v59 = v39;
      id v60 = [v55 fetchAssetCollectionsWithLocalIdentifiers:isa options:v58];

      id v61 = [v60 firstObject];
      if (!v61)
      {
        swift_bridgeObjectRelease();
        sub_1000306E0();
        sub_10002FC10();
        id v67 = self;
        uint64_t v68 = v82;
        uint64_t v69 = sub_1000146EC();
        id v70 = sub_100020140(v40, v42, v69, v67);
        uint64_t v71 = v76;
        sub_100021C00(v68, v76, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
        type metadata accessor for PhotosReliveWidgetViewModel(0);
        id v72 = v59;
        id v73 = v70;
        sub_100024A9C();

        sub_100021C5C(v71, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
        swift_release();
        sub_10000D85C(&qword_100041250);
        uint64_t v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = v81;
        *(void *)(v54 + 32) = v73;
        *(unsigned char *)(v54 + 40) = 1;
        *(void *)(v54 + 48) = 0;

        goto LABEL_26;
      }

      swift_bridgeObjectRelease();
      uint64_t v39 = v59;
    }
    sub_1000306E0();
    sub_10002FC10();
    sub_10000D85C(&qword_100041250);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_1000311F0;
    id v62 = sub_100016568(2, v40, v42);
    char v64 = v63;
    uint64_t v66 = v65;
    swift_bridgeObjectRelease();
    *(void *)(v54 + 32) = v62;
    *(unsigned char *)(v54 + 40) = v64;
    *(void *)(v54 + 48) = v66;

LABEL_26:
    swift_unknownObjectRelease();
    goto LABEL_27;
  }
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
LABEL_27:
  (*(void (**)(char *, uint64_t))(v79 + 8))(v26, v78);
  return v54;
}

void *sub_100017600(uint64_t a1)
{
  uint64_t result = (void *)sub_100021578(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_1000215F8(&v5, (uint64_t)result, v3, 0, a1);
  }
}

uint64_t sub_100017694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_10002F7F0();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return sub_10000DA40(a2, v7, 1, v6);
}

uint64_t sub_10001773C(uint64_t a1, unint64_t a2, void *a3)
{
  if (!a2) {
    return a1;
  }
  uint64_t v6 = qword_100040618;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1000446B0;
  if (sub_1000305B0() == a1 && v8 == a2) {
    goto LABEL_18;
  }
  char v10 = sub_1000309C0();
  swift_bridgeObjectRelease();
  if (v10) {
    goto LABEL_19;
  }
  if (sub_1000305B0() == a1 && v11 == a2)
  {
LABEL_18:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_1000309C0();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = self;
      if ((sub_1000200F8(a1, a2, v14) & 1) == 0)
      {
        os_log_type_t v39 = sub_1000306E0();
        if (os_log_type_enabled(v7, v39))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v40 = (uint8_t *)swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = 136315138;
          swift_bridgeObjectRetain();
          sub_10001F274(a1, a2, &v46);
          sub_1000307C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v7, v39, "using local identifier %s which will not support ICPL sync", v40, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        return a1;
      }
      sub_10000D85C(&qword_100041268);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_100031D30;
      sub_1000216F4(0, &qword_100041270);
      swift_bridgeObjectRetain();
      *(void *)(v15 + 32) = sub_100018338();
      uint64_t v46 = v15;
      sub_100030660();
      uint64_t v16 = sub_100030700();
      swift_bridgeObjectRelease();
      uint64_t v17 = sub_100017600(v16);
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      char v23 = v22;
      swift_bridgeObjectRelease();
      if (v17)
      {

        if ((v23 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          return v19;
        }
        swift_errorRetain();
        swift_errorRetain();
        os_log_type_t v42 = sub_1000306C0();
        if (os_log_type_enabled(v7, v42))
        {
          sub_100021568(v19, v21, 1);
          swift_bridgeObjectRetain();
          sub_100021568(v19, v21, 1);
          uint64_t v43 = swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          *(_DWORD *)uint64_t v43 = 136315394;
          swift_bridgeObjectRetain();
          sub_10001F274(a1, a2, &v46);
          sub_1000307C0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v43 + 12) = 2080;
          swift_getErrorValue();
          uint64_t v44 = sub_1000309E0();
          sub_10001F274(v44, v45, &v46);
          sub_1000307C0();
          swift_bridgeObjectRelease();
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
          _os_log_impl((void *)&_mh_execute_header, v7, v42, "could not get local identifier for cloud identifier %s with error %s", (uint8_t *)v43, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
          swift_errorRelease();
        }
        else
        {
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
          swift_bridgeObjectRelease();
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
          sub_100021554(v19, v21, 1, (uint64_t (*)(void))&_swift_errorRelease);
        }
        return 0;
      }
      os_log_type_t v33 = sub_1000306C0();
      if (os_log_type_enabled(v7, v33))
      {
        swift_bridgeObjectRetain();
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 136315138;
        swift_bridgeObjectRetain();
        sub_10001F274(a1, a2, &v46);
        sub_1000307C0();
        swift_bridgeObjectRelease_n();
        unint64_t v35 = "could not get local identifier for cloud identifier %s";
        goto LABEL_31;
      }
      goto LABEL_44;
    }
  }
LABEL_19:
  if (sub_1000305B0() == a1 && v24 == a2)
  {
    uint64_t v27 = 203;
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  char v26 = sub_1000309C0();
  swift_bridgeObjectRelease();
  if (v26)
  {
    uint64_t v27 = 203;
    goto LABEL_27;
  }
  if (sub_1000305B0() == a1 && v36 == a2)
  {
    uint64_t v27 = 212;
    goto LABEL_26;
  }
  char v38 = sub_1000309C0();
  swift_bridgeObjectRelease();
  if (v38)
  {
    uint64_t v27 = 212;
LABEL_27:
    id v28 = self;
    id v29 = [a3 librarySpecificFetchOptions];
    id v30 = [v28 fetchAssetCollectionsWithType:2 subtype:v27 options:v29];

    id v31 = [v30 firstObject];
    if (v31)
    {
      swift_bridgeObjectRelease();
      id v32 = [v31 localIdentifier];
      a1 = sub_1000305B0();

      return a1;
    }
    os_log_type_t v33 = sub_1000306C0();
    if (os_log_type_enabled(v7, v33))
    {
      swift_bridgeObjectRetain();
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      swift_bridgeObjectRetain();
      sub_10001F274(a1, a2, &v46);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      unint64_t v35 = "could not find smart album type %s";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v7, v33, v35, v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      return 0;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t result = sub_1000308E0();
  __break(1u);
  return result;
}

uint64_t sub_100018000(uint64_t a1, unint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = a1;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000308F0();
  swift_bridgeObjectRelease();
LABEL_4:
  uint64_t result = sub_100021508(0, v3, v5);
  if (v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = result;
  }
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000308F0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10 < 0)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000308F0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    sub_1000216F4(0, &qword_100041260);
    Swift::Int v11 = 0;
    do
    {
      Swift::Int v12 = v11 + 1;
      sub_100030890(v11);
      Swift::Int v11 = v12;
    }
    while (v8 != v12);
  }
  if (!v4) {
    return v2 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_100030900();
  swift_bridgeObjectRelease_n();
  return v13;
}

void sub_1000181B0(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v24 = a6 >> 1;
  uint64_t v7 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5)) {
    goto LABEL_20;
  }
  uint64_t v8 = v6;
  if (v7)
  {
    id v30 = &_swiftEmptyArrayStorage;
    sub_10001FB00(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
    {
LABEL_21:
      __break(1u);
      return;
    }
    uint64_t v10 = 0;
    Swift::Int v11 = v30;
    uint64_t v21 = v7;
    uint64_t v22 = a4 + 8 * a5;
    while (1)
    {
      uint64_t v12 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        break;
      }
      if (a5 + v10 >= v24 || v10 >= v7) {
        goto LABEL_19;
      }
      id v26 = *(id *)(v22 + 8 * v10);
      id v14 = v26;
      a1(&v27, &v26);
      if (v8)
      {
        swift_release();

        return;
      }

      uint64_t v15 = v27;
      char v16 = v28;
      uint64_t v17 = v29;
      id v30 = v11;
      unint64_t v19 = v11[2];
      unint64_t v18 = v11[3];
      if (v19 >= v18 >> 1)
      {
        sub_10001FB00((char *)(v18 > 1), v19 + 1, 1);
        Swift::Int v11 = v30;
      }
      v11[2] = v19 + 1;
      uint64_t v20 = &v11[3 * v19];
      v20[4] = v15;
      *((unsigned char *)v20 + 40) = v16;
      v20[6] = v17;
      ++v10;
      uint64_t v7 = v21;
      uint64_t v8 = 0;
      if (v12 == v21) {
        return;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
}

id sub_100018338()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100030580();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithStringValue:v1];

  return v2;
}

uint64_t sub_1000183AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  return sub_1000222F4((uint64_t)sub_1000183C8);
}

uint64_t sub_1000183C8()
{
  sub_100022458();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  long long v2 = *(_OWORD *)(v0 + 56);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000184B0;
  sub_100022570();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_1000184B0()
{
  sub_100022458();
  sub_100022194();
  uint64_t v1 = *v0;
  sub_100022268();
  *long long v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100018598, 0, 0);
}

uint64_t sub_100018598()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 8))(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000185B8(void *a1)
{
  swift_retain();
  id v2 = a1;
  sub_10000D85C(&qword_1000412B0);
  return sub_100030690();
}

uint64_t sub_100018614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v62 = a3;
  uint64_t v63 = a6;
  uint64_t v54 = a5;
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  uint64_t v58 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v58, v7);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100030470();
  uint64_t v66 = *(void (**)(char *, char *))(v10 - 8);
  __chkstk_darwin(v10, v11);
  id v67 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000303B0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  unint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  uint64_t v21 = (char *)&v53 - v20;
  id v64 = sub_100019FBC();
  sub_100030450();
  os_log_type_t v22 = sub_1000306E0();
  if (qword_100040610 != -1) {
    swift_once();
  }
  char v23 = qword_1000446A8;
  int64_t v24 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v65 = v21;
  uint64_t v57 = v24;
  v24(v18, v21, v13);
  uint64_t v25 = (void (*)(char *, uint64_t, uint64_t))*((void *)v66 + 2);
  uint64_t v59 = a4;
  v25(v67, a4, v10);
  os_log_t v53 = v23;
  BOOL v26 = os_log_type_enabled(v23, v22);
  uint64_t v55 = v14;
  uint64_t v56 = v9;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136446466;
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v28 = sub_1000309A0();
    uint64_t v68 = sub_10001F274(v28, v29, &v69);
    sub_1000307C0();
    swift_bridgeObjectRelease();
    id v30 = *(void (**)(char *, uint64_t))(v14 + 8);
    v30(v18, v13);
    *(_WORD *)(v27 + 12) = 1026;
    id v31 = v67;
    int v32 = sub_100030460() & 1;
    (*((void (**)(char *, uint64_t))v66 + 1))(v31, v10);
    LODWORD(v68) = v32;
    sub_1000307C0();
    _os_log_impl((void *)&_mh_execute_header, v53, v22, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v27, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v9 = v56;
    swift_slowDealloc();
  }
  else
  {
    (*((void (**)(char *, uint64_t))v66 + 1))(v67, v10);
    id v30 = *(void (**)(char *, uint64_t))(v14 + 8);
    v30(v18, v13);
  }
  v57(v9, v65, v13);
  sub_100030440();
  os_log_type_t v33 = &v9[*(int *)(v58 + 20)];
  *(void *)os_log_type_t v33 = v34;
  *((void *)v33 + 1) = v35;
  uint64_t result = sub_100016CB4(v60, v61, v62, (uint64_t)v9, 1, v64);
  if (*(void *)(result + 16))
  {
    uint64_t v66 = (void (*)(char *, char *))v30;
    id v67 = (char *)v13;
    uint64_t v37 = *(void **)(result + 32);
    char v38 = *(unsigned char *)(result + 40);
    uint64_t v39 = *(void *)(result + 48);
    swift_retain();
    id v40 = v37;
    swift_bridgeObjectRelease();
    uint64_t v69 = (uint64_t)v40;
    char v70 = v38;
    uint64_t v71 = v39;
    v54(&v69);
    os_log_type_t v41 = sub_1000306E0();
    os_log_type_t v42 = qword_1000446A8;
    os_log_type_t v43 = v41;
    if (os_log_type_enabled((os_log_t)qword_1000446A8, v41))
    {
      id v44 = v40;
      swift_retain_n();
      id v45 = v44;
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136446210;
      id v47 = v45;
      swift_retain();
      PhotosReliveWidgetEntry.description.getter();
      uint64_t v49 = v48;
      unint64_t v51 = v50;
      swift_release();

      uint64_t v68 = sub_10001F274(v49, v51, &v69);
      sub_1000307C0();
      swift_release_n();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "snapshot request completed with entry %{public}s", v46, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      uint64_t v52 = (uint64_t)v56;
    }
    else
    {
      swift_release();

      uint64_t v52 = (uint64_t)v9;
    }
    sub_100021C5C(v52, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
    v66(v65, v67);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100018CA8()
{
  sub_1000221D0();
  uint64_t v60 = v3;
  uint64_t v61 = v2;
  uint64_t v5 = v4;
  uint64_t v66 = v6;
  uint64_t v67 = v7;
  uint64_t v65 = v8;
  uint64_t v63 = type metadata accessor for PhotosReliveWidgetSize(0);
  sub_100011958();
  __chkstk_darwin(v9, v10);
  uint64_t v72 = sub_100022298(v11, v57);
  sub_10001193C();
  __chkstk_darwin(v12, v13);
  sub_10001198C();
  uint64_t v14 = sub_1000303B0();
  sub_10001193C();
  uint64_t v16 = v15;
  __chkstk_darwin(v17, v18);
  sub_100011E44();
  __chkstk_darwin(v19, v20);
  os_log_type_t v22 = (char *)&v57 - v21;
  id v70 = sub_100019FBC();
  sub_100030450();
  os_log_type_t v23 = sub_1000306E0();
  if (qword_100040610 != -1) {
    swift_once();
  }
  int64_t v24 = qword_1000446A8;
  uint64_t v25 = v16 + 16;
  uint64_t v62 = *(void *)(v16 + 16);
  sub_100022584();
  v26();
  id v64 = v5;
  sub_1000119DC();
  v27();
  os_log_t v58 = v24;
  BOOL v28 = os_log_type_enabled(v24, v23);
  uint64_t v71 = v14;
  uint64_t v68 = v16;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v57 = sub_1000223E0();
    uint64_t v73 = v57;
    *(_DWORD *)uint64_t v29 = 136446466;
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v30 = sub_1000309A0();
    uint64_t v32 = sub_10001F274(v30, v31, &v73);
    sub_1000224A0(v32);
    sub_1000307C0();
    swift_bridgeObjectRelease();
    sub_100022544();
    uint64_t v59 = v33;
    sub_100022328();
    v34();
    *(_WORD *)(v29 + 12) = 1026;
    sub_100030460();
    sub_1000222E4();
    v35();
    sub_100022434();
    _os_log_impl((void *)&_mh_execute_header, v58, v23, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v29, 0x12u);
    swift_arrayDestroy();
    sub_100022200();
    sub_100022200();
  }
  else
  {
    sub_1000222E4();
    v36();
    uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v59(v0, v14);
  }
  uint64_t v37 = v69;
  uint64_t v72 = (uint64_t)v22;
  sub_100022584();
  v38();
  uint64_t v39 = v64;
  sub_100030440();
  id v40 = (void *)(v37 + *(int *)(v63 + 20));
  *id v40 = v41;
  v40[1] = v42;
  if (*(void *)(sub_100016CB4(v65, v66, v67, v37, 1, v70) + 16))
  {
    sub_100022464();
    id v43 = v39;
    swift_bridgeObjectRelease();
    v61(v43, v25, v1);
    os_log_type_t v44 = sub_1000306E0();
    if (os_log_type_enabled((os_log_t)qword_1000446A8, v44))
    {
      id v45 = v43;
      swift_retain_n();
      id v46 = v45;
      id v47 = (_DWORD *)sub_1000224D4();
      uint64_t v73 = sub_1000223E0();
      *id v47 = 136446210;
      id v48 = v46;
      swift_retain();
      PhotosReliveWidgetEntry.description.getter();
      uint64_t v50 = v49;
      unint64_t v52 = v51;
      swift_release();

      uint64_t v53 = sub_10001F274(v50, v52, &v73);
      sub_100022300(v53);
      swift_release_n();

      swift_bridgeObjectRelease();
      sub_100022524((void *)&_mh_execute_header, v54, v55, "snapshot request completed with entry %{public}s");
      swift_arrayDestroy();
      sub_100022200();
      sub_100022200();
      swift_release();
    }
    else
    {
      swift_release();
    }
    sub_100021C5C(v69, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
    sub_100022328();
    v56();
    sub_1000221E8();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000191E0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100019224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_1000222F4((uint64_t)sub_100019244);
}

uint64_t sub_100019244()
{
  sub_100022458();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  sub_10000D85C(&qword_100041058);
  *uint64_t v3 = v0;
  v3[1] = sub_100019330;
  sub_100022570();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_100019330()
{
  sub_100022458();
  sub_100022194();
  uint64_t v1 = *v0;
  sub_100022268();
  *long long v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

void sub_100019410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  sub_1000221D0();
  uint64_t v66 = v21;
  v61[3] = v22;
  v61[4] = v23;
  uint64_t v25 = v24;
  uint64_t v63 = v26;
  uint64_t v64 = v27;
  uint64_t v29 = v28;
  v61[1] = v28;
  v61[2] = v30;
  uint64_t v67 = a21;
  uint64_t v69 = sub_1000302E0();
  sub_10001193C();
  uint64_t v72 = v31;
  __chkstk_darwin(v32, v33);
  sub_100011978();
  uint64_t v68 = v34;
  sub_100030310();
  sub_10001193C();
  uint64_t v70 = v36;
  uint64_t v71 = v35;
  __chkstk_darwin(v35, v37);
  sub_100011978();
  uint64_t v65 = v38;
  v61[0] = sub_10000D85C(v25);
  uint64_t v39 = *(void *)(v61[0] - 8);
  uint64_t v40 = *(void *)(v39 + 64);
  __chkstk_darwin(v61[0], v41);
  uint64_t v42 = (char *)v61 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100030470();
  sub_10001193C();
  uint64_t v45 = v44;
  uint64_t v47 = *(void *)(v46 + 64);
  __chkstk_darwin(v48, v49);
  uint64_t v50 = (char *)v61 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000216F4(0, &qword_100041288);
  uint64_t v62 = sub_100030730();
  sub_1000119DC();
  v51();
  sub_1000119DC();
  v52();
  unint64_t v53 = (*(unsigned __int8 *)(v45 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  unint64_t v54 = (v47 + *(unsigned __int8 *)(v39 + 80) + v53) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v55 = (char *)swift_allocObject();
  *((void *)v55 + 2) = v29;
  uint64_t v56 = v64;
  *((void *)v55 + 3) = v63;
  *((void *)v55 + 4) = v56;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(&v55[v53], v50, v43);
  (*(void (**)(char *, char *, void))(v39 + 32))(&v55[v54], v42, v61[0]);
  v74[4] = v66;
  v74[5] = v55;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 1107296256;
  v74[2] = sub_1000191E0;
  v74[3] = v67;
  uint64_t v57 = _Block_copy(v74);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000302F0();
  uint64_t v73 = &_swiftEmptyArrayStorage;
  sub_10002021C(&qword_100041290, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000D85C(&qword_100041298);
  sub_10001148C(&qword_1000412A0, &qword_100041298);
  sub_100030830();
  os_log_t v58 = (void *)v62;
  sub_100030740();
  _Block_release(v57);

  sub_100011BBC();
  v59();
  sub_100011BBC();
  v60();
  swift_release();
  sub_1000221E8();
}

void sub_100019814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_1000221D0();
  uint64_t v40 = v21;
  uint64_t v41 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = sub_10000D85C(v29);
  sub_10001193C();
  uint64_t v32 = v31;
  uint64_t v34 = *(void *)(v33 + 64);
  __chkstk_darwin(v35, v36);
  sub_1000119DC();
  v37();
  unint64_t v38 = (*(unsigned __int8 *)(v32 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v39 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v39 + v38, (char *)&v40 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0), v30);
  a21(v28, v26, v24, v40, v41, v39);
  swift_release();
  sub_1000221E8();
}

uint64_t sub_100019930(uint64_t a1)
{
  uint64_t v2 = sub_10000D85C(&qword_100041058);
  __chkstk_darwin(v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_10000D85C(&qword_100041280);
  return sub_100030690();
}

void sub_100019A0C()
{
  sub_1000221D0();
  uint64_t v72 = v2;
  uint64_t v73 = v1;
  id v74 = (void (*)(void))v3;
  uint64_t v70 = v4;
  uint64_t v71 = (unsigned char *)v5;
  uint64_t v76 = sub_10000D85C(&qword_100041058);
  sub_10001193C();
  uint64_t v67 = v6;
  __chkstk_darwin(v7, v8);
  sub_100011A2C();
  uint64_t v75 = v9;
  sub_1000223BC();
  __chkstk_darwin(v10, v11);
  uint64_t v77 = &v63[-v12];
  uint64_t v13 = sub_10000D85C(&qword_100041060);
  uint64_t v14 = v13 - 8;
  uint64_t v16 = __chkstk_darwin(v13, v15);
  uint64_t v18 = &v63[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16, v19);
  uint64_t v21 = &v63[-v20];
  uint64_t v22 = type metadata accessor for PhotosReliveWidgetSize(0);
  uint64_t v23 = v22 - 8;
  __chkstk_darwin(v22, v24);
  uint64_t v25 = sub_100022394();
  sub_10001193C();
  uint64_t v27 = v26;
  __chkstk_darwin(v28, v29);
  sub_100011A2C();
  uint64_t v66 = v30;
  sub_1000223BC();
  __chkstk_darwin(v31, v32);
  uint64_t v34 = (void (*)(void))&v63[-v33];
  id v35 = sub_100019FBC();
  sub_100030450();
  os_log_t v68 = v27;
  Class isa = (void (*)(uint64_t, void (*)(void), uint64_t))v27[2].isa;
  isa(v0, v34, v25);
  sub_100030440();
  uint64_t v36 = (void *)(v0 + *(int *)(v23 + 28));
  *uint64_t v36 = v37;
  v36[1] = v38;
  uint64_t v39 = sub_100016CB4(v70, (uint64_t)v71, (uint64_t)v74, v0, 2, v35);
  uint64_t v40 = (uint64_t)&v21[*(int *)(v14 + 56)];
  sub_10001A1D0((uint64_t)v21, v40, v39, (uint64_t)v34);
  uint64_t v41 = (uint64_t)&v18[*(int *)(v14 + 56)];
  sub_100030420();
  sub_100011958();
  uint64_t v71 = v21;
  sub_100011C50();
  v42();
  sub_10001FA4C(v40, v41);
  sub_10001FAB4();
  sub_100022410();
  sub_1000304B0();
  sub_100011528(v41, &qword_100041068);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  uint64_t v70 = v0;
  sub_100024D0C(v0, (double *)v79);
  id v69 = v35;
  [v35 setWidgetTimelineGeneratedForDisplaySize:*(double *)v79, *(double *)&v79[1]];
  id v74 = v34;
  sub_100015330(v40, (uint64_t)v34);
  os_log_type_t v43 = sub_1000306E0();
  if (qword_100040610 != -1) {
    swift_once();
  }
  uint64_t v44 = qword_1000446A8;
  isa(v66, v74, v25);
  uint64_t v45 = v67;
  uint64_t v46 = v76;
  uint64_t v47 = v77;
  sub_1000119DC();
  v48();
  uint64_t v49 = v25;
  if (os_log_type_enabled(v44, v43))
  {
    uint64_t v50 = swift_slowAlloc();
    Class isa = (void (*)(uint64_t, void (*)(void), uint64_t))swift_slowAlloc();
    v79[0] = (uint64_t)isa;
    *(_DWORD *)uint64_t v50 = 136446466;
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    int v64 = v43;
    uint64_t v51 = sub_1000309A0();
    uint64_t v78 = sub_10001F274(v51, v52, v79);
    sub_1000307C0();
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_100022238();
    v34(v53);
    *(_WORD *)(v50 + 12) = 2082;
    os_log_t v68 = v44;
    uint64_t v54 = v75;
    sub_1000304C0();
    uint64_t v55 = sub_100030650();
    uint64_t v66 = v49;
    unint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v58 = v55;
    uint64_t v46 = v76;
    uint64_t v78 = sub_10001F274(v58, v57, v79);
    uint64_t v47 = v77;
    sub_1000307C0();
    swift_bridgeObjectRelease();
    uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    uint64_t v60 = v54;
    uint64_t v61 = v66;
    v59(v60, v46);
    _os_log_impl((void *)&_mh_execute_header, v68, (os_log_type_t)v64, "timeline request completed for size %{public}s with entries %{public}s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    sub_100022200();
    sub_100022200();
  }
  else
  {
    uint64_t v62 = sub_100022238();
    v34(v62);
    uint64_t v61 = v25;
    uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v59(v75, v46);
  }
  v73(v47);

  v59((uint64_t)v47, v46);
  sub_100011528((uint64_t)v71, &qword_100041060);
  sub_100021C5C(v70, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
  ((void (*)(void (*)(void), uint64_t))v34)(v74, v61);
  sub_1000221E8();
}

id sub_100019FBC()
{
  if (sub_10001CEF0()) {
    return 0;
  }
  id v0 = [self sharedPhotoLibrary];
  id v11 = 0;
  unsigned int v1 = [v0 openAndWaitWithUpgrade:0 error:&v11];
  id v2 = v11;
  if (!v1)
  {
    uint64_t v4 = v2;
    sub_10002FA80();

    swift_willThrow();
    os_log_type_t v5 = sub_1000306C0();
    if (qword_100040620 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_1000446B8;
    os_log_type_t v7 = v5;
    if (os_log_type_enabled((os_log_t)qword_1000446B8, v5))
    {
      swift_errorRetain();
      uint64_t v8 = (uint8_t *)sub_1000224D4();
      uint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      swift_errorRetain();
      uint64_t v10 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v11 = v10;
      sub_1000307C0();
      *uint64_t v9 = v10;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Cannot open photo library %@", v8, 0xCu);
      sub_10000D85C(&qword_100041358);
      swift_arrayDestroy();
      sub_100022200();
      sub_100022200();
    }
    else
    {
      swift_errorRelease();
    }
    exit(0);
  }
  return v0;
}

void *sub_10001A1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v122 = a4;
  uint64_t v7 = sub_1000303B0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  id v11 = (char *)v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D85C(&qword_100041048);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002FBA0();
  uint64_t v18 = __chkstk_darwin(v16, v17);
  uint64_t v20 = __chkstk_darwin(v18, (char *)v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = __chkstk_darwin(v20, v21);
  uint64_t v24 = (char *)v105 - v23;
  uint64_t v26 = __chkstk_darwin(v22, v25);
  uint64_t v28 = (char *)v105 - v27;
  uint64_t v30 = __chkstk_darwin(v26, v29);
  uint64_t v32 = __chkstk_darwin(v30, v31);
  uint64_t v38 = *(void *)(a3 + 16);
  if (!v38)
  {
LABEL_8:
    uint64_t v41 = sub_10001D1DC(a3);
    sub_10001D244(a1, a2, v41, v42, v43, v122);
    return sub_100021CB4(v41);
  }
  uint64_t v39 = (void *)(a3 + 48);
  while (1)
  {
    uint64_t v40 = *v39;
    if (*v39)
    {
      if (!*((unsigned char *)v39 - 8)
        && (!*(void *)(v40 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image)
         || (*(unsigned char *)(v40 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded) & 1) != 0))
      {
        break;
      }
    }
    v39 += 3;
    if (!--v38) {
      goto LABEL_8;
    }
  }
  uint64_t v108 = v11;
  uint64_t v109 = v8;
  uint64_t v110 = v7;
  char v111 = (char *)v34;
  uint64_t v114 = (double *)a2;
  os_log_t v115 = v33;
  uint64_t v117 = v37;
  uint64_t v118 = a1;
  uint64_t v119 = v36;
  uint64_t v120 = v32;
  uint64_t v45 = (char *)v105 - v35;
  id v46 = (id)*(v39 - 2);
  swift_retain();
  id v47 = [v46 localIdentifier];
  uint64_t v48 = sub_1000305B0();
  unint64_t v50 = v49;

  uint64_t v116 = (uint64_t *)v48;
  unint64_t v112 = v50;
  double v51 = sub_10001D830(v48, v50, v122, 300.0);
  uint64_t v121 = v45;
  sub_10002FB70();
  id v113 = v46;
  id v52 = [v46 endTime];
  if (v52)
  {
    uint64_t v53 = v52;
    sub_10002FB80();

    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v117 + 32);
    uint64_t v55 = v28;
    uint64_t v56 = v120;
    v54(v15, v55, v120);
    sub_10000DA40((uint64_t)v15, 0, 1, v56);
    if (sub_10000DA00((uint64_t)v15, 1, v56) != 1)
    {
      v54(v119, v15, v120);
      goto LABEL_16;
    }
  }
  else
  {
    sub_10000DA40((uint64_t)v15, 1, 1, v120);
  }
  sub_10002FB30();
  sub_100011528((uint64_t)v15, &qword_100041048);
LABEL_16:
  os_log_t v57 = v115;
  uint64_t v58 = v110;
  sub_10002FB40();
  uint64_t v59 = v118;
  if (v60 <= 300.0)
  {
    os_log_type_t v79 = sub_1000306B0();
    if (qword_100040608 != -1) {
      swift_once();
    }
    id v80 = qword_100041040;
    uint64_t v81 = v117;
    uint64_t v82 = *(void (**)(char *, char *, uint64_t))(v117 + 16);
    uint64_t v83 = v120;
    v82(v24, v121, v120);
    v82(v111, v119, v83);
    os_log_t v115 = v80;
    BOOL v84 = os_log_type_enabled(v80, v79);
    unint64_t v85 = v112;
    uint64_t v86 = (uint64_t)v116;
    if (v84)
    {
      swift_bridgeObjectRetain();
      uint64_t v87 = swift_slowAlloc();
      uint64_t v110 = swift_slowAlloc();
      v124[0] = v110;
      *(_DWORD *)uint64_t v87 = 136446722;
      LODWORD(v109) = v79;
      swift_bridgeObjectRetain();
      uint64_t v123 = sub_10001F274(v86, v85, v124);
      uint64_t v116 = v124;
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 12) = 2082;
      sub_10002021C(&qword_1000412E8, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v88 = v120;
      uint64_t v89 = sub_1000309A0();
      uint64_t v123 = sub_10001F274(v89, v90, v124);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      char v91 = *(void (**)(char *, uint64_t))(v81 + 8);
      uint64_t v92 = v24;
      uint64_t v93 = v88;
      v91(v92, v88);
      *(_WORD *)(v87 + 22) = 2082;
      os_log_t v94 = (os_log_t)v111;
      uint64_t v95 = sub_1000309A0();
      uint64_t v123 = sub_10001F274(v95, v96, v124);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      v91((char *)v94, v88);
      _os_log_impl((void *)&_mh_execute_header, v115, (os_log_type_t)v109, "not enough time to schedule reload for entry id %{public}s at %{public}s for entry ending at %{public}s", (uint8_t *)v87, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v59 = v118;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
      char v91 = *(void (**)(char *, uint64_t))(v81 + 8);
      uint64_t v100 = v24;
      uint64_t v93 = v120;
      v91(v100, v120);
      v91(v111, v93);
    }
    uint64_t v101 = (uint64_t)v114;
    uint64_t v102 = sub_10001D1DC(a3);
    sub_10001D244(v59, v101, v102, v103, v104, v122);
    sub_100021CB4(v102);
    swift_release();

    v91(v119, v93);
    return (void *)((uint64_t (*)(char *, uint64_t))v91)(v121, v93);
  }
  else
  {
    os_log_type_t v61 = sub_1000306E0();
    if (qword_100040608 != -1) {
      swift_once();
    }
    uint64_t v62 = qword_100041040;
    int v64 = v108;
    uint64_t v63 = v109;
    (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v108, v122, v58);
    uint64_t v65 = v117;
    uint64_t v66 = *(void (**)(os_log_t, char *, uint64_t))(v117 + 16);
    uint64_t v67 = v120;
    uint64_t v122 = v117 + 16;
    v66(v57, v121, v120);
    char v111 = (char *)v62;
    if (os_log_type_enabled(v62, v61))
    {
      unint64_t v68 = v112;
      swift_bridgeObjectRetain_n();
      uint64_t v69 = swift_slowAlloc();
      uint64_t v110 = (uint64_t)v66;
      uint64_t v70 = v69;
      uint64_t v107 = swift_slowAlloc();
      v124[0] = v107;
      *(_DWORD *)uint64_t v70 = 136446722;
      v105[1] = v70 + 4;
      sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
      int v106 = v61;
      uint64_t v71 = sub_1000309A0();
      uint64_t v123 = sub_10001F274(v71, v72, v124);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v58);
      *(_WORD *)(v70 + 12) = 2082;
      unint64_t v73 = v68;
      swift_bridgeObjectRetain();
      uint64_t v123 = sub_10001F274((uint64_t)v116, v68, v124);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v70 + 22) = 2082;
      sub_10002021C(&qword_1000412E8, (void (*)(uint64_t))&type metadata accessor for Date);
      os_log_t v74 = v115;
      uint64_t v75 = sub_1000309A0();
      uint64_t v123 = sub_10001F274(v75, v76, v124);
      sub_1000307C0();
      swift_bridgeObjectRelease();
      uint64_t v77 = *(void (**)(os_log_t, uint64_t))(v65 + 8);
      v77(v74, v67);
      unint64_t v78 = v73;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v111, (os_log_type_t)v106, "scheduling reload for widget family %{public}s entry id %{public}s at %{public}s", (uint8_t *)v70, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v66 = (void (*)(os_log_t, char *, uint64_t))v110;
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v58);
      uint64_t v77 = *(void (**)(os_log_t, uint64_t))(v65 + 8);
      v77(v57, v67);
      unint64_t v78 = v112;
    }
    uint64_t v97 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
    char v98 = v114;
    uint64_t v99 = v121;
    v66((os_log_t)((char *)v114 + *(int *)(v97 + 24)), v121, v67);
    *(void *)char v98 = v116;
    *((void *)v98 + 1) = v78;
    v98[2] = v51;
    sub_100030400();
    swift_release();

    v77((os_log_t)v119, v67);
    v77(v99, v67);
    return (void *)sub_10000DA40((uint64_t)v98, 0, 1, v97);
  }
}

uint64_t sub_10001AD14()
{
  uint64_t v1 = type metadata accessor for PhotosReliveWidgetSize(0);
  uint64_t v2 = v1 - 8;
  __chkstk_darwin(v1, v3);
  sub_100022334();
  sub_100030440();
  uint64_t v4 = (void *)(v0 + *(int *)(v2 + 28));
  *uint64_t v4 = v5;
  v4[1] = v6;
  id v7 = [self placeholderEntryForContentType:2];
  sub_100021C5C(v0, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
  return sub_1000224EC();
}

uint64_t sub_10001ADD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10001AD14();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = 2;
  *(void *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_10001AE04(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v8;
  void *v8 = v3;
  v8[1] = sub_10001AEB8;
  return sub_1000183AC(v5, v6, v7, a3);
}

uint64_t sub_10001AEB8(uint64_t a1, char a2, uint64_t a3)
{
  sub_100022194();
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v9 = *v3;
  sub_100022268();
  *uint64_t v10 = v9;
  swift_task_dealloc();
  *(void *)uint64_t v8 = a1;
  *(unsigned char *)(v8 + 8) = a2;
  *(void *)(v8 + 16) = a3;
  id v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_10001AFB4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_10002218C;
  return sub_100019224(a1, v6, v7, v8, a3);
}

uint64_t sub_10001B078(uint64_t *a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  swift_retain();

  return sub_100018614(v7, v8, v9, a2, a3, a4);
}

void sub_10001B0E8()
{
}

uint64_t sub_10001B104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002218C;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10001B1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002218C;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

id sub_10001B26C(uint64_t a1)
{
  return sub_10001B278(a1, &qword_1000446B0);
}

id sub_10001B278(uint64_t a1, void *a2)
{
  if (qword_100040620 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_1000446B8;
  *a2 = qword_1000446B8;

  return v3;
}

uint64_t sub_10001B2E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10002FC60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100040618 != -1)
  {
    swift_once();
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    sub_10000D85C(&qword_100041250);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1000311F0;
    *(void *)(v24 + 32) = [self privacyDisclosureEntryForContentType:1];
    *(unsigned char *)(v24 + 40) = 3;
    *(void *)(v24 + 48) = 0;
    return v24;
  }
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v11 = (void *)qword_1000446B0;
  id v12 = a3;
  id v13 = v11;
  sub_10002FC40();
  sub_100030770();
  sub_10002FC30();
  uint64_t v14 = self;
  uint64_t v15 = (double *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetSize(0) + 20));
  id v16 = [v14 timelineFromLibrary:v12 forWidgetSize:sub_1000146EC() timelineSize:v15[1]];
  sub_1000216F4(0, &qword_100041260);
  unint64_t v17 = sub_100030640();

  uint64_t v18 = sub_100018000(a2, v17);
  __chkstk_darwin(v18, v19);
  *(void *)&v27[-16] = a1;
  *(void *)&v27[-8] = v12;
  sub_1000181B0((void (*)(uint64_t *__return_ptr, id *))sub_100021F4C, (uint64_t)&v27[-32], v18, v20, v21, v22);
  uint64_t v24 = v23;
  sub_100030760();
  sub_10002FC30();
  if (!*(void *)(v24 + 16))
  {
    swift_bridgeObjectRelease();
    sub_1000306E0();
    sub_10002FC10();
    sub_10000D85C(&qword_100041250);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1000311F0;
    uint64_t v25 = self;
    *(void *)(v24 + 32) = [v25 fallbackEntryForContentType:1 sourceIdentifier:0 size:sub_1000146EC()];
    *(unsigned char *)(v24 + 40) = 1;
    *(void *)(v24 + 48) = 0;
  }
  swift_unknownObjectRelease();

  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v6);
  return v24;
}

uint64_t sub_10001B68C@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v9 - 8, v10);
  sub_10001198C();
  uint64_t v11 = *a1;
  sub_100021C00(a2, v4, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  id v12 = v11;
  id v13 = a3;
  sub_100024A9C();
  uint64_t v15 = v14;

  uint64_t result = sub_100021C5C(v4, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
  *(void *)a4 = v12;
  *(unsigned char *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = v15;
  return result;
}

uint64_t sub_10001B794(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  uint64_t v57 = a3;
  double v51 = a2;
  uint64_t v55 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v55, v4);
  uint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100030470();
  double v60 = *(void (**)(char *, char *))(v7 - 8);
  __chkstk_darwin(v7, v8);
  os_log_type_t v61 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000303B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v50 - v17;
  sub_100030450();
  id v58 = sub_100019FBC();
  os_log_type_t v19 = sub_1000306E0();
  if (qword_100040618 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_1000446B0;
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v59 = v18;
  uint64_t v54 = v21;
  v21(v15, v18, v10);
  unint64_t v22 = (void (*)(char *, uint64_t, uint64_t))*((void *)v60 + 2);
  uint64_t v56 = a1;
  v22(v61, a1, v7);
  os_log_t v50 = v20;
  BOOL v23 = os_log_type_enabled(v20, v19);
  uint64_t v52 = v11;
  uint64_t v53 = v6;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136446466;
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v25 = sub_1000309A0();
    uint64_t v62 = sub_10001F274(v25, v26, &v63);
    sub_1000307C0();
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v11 + 8);
    v27(v15, v10);
    *(_WORD *)(v24 + 12) = 1026;
    uint64_t v28 = v61;
    int v29 = sub_100030460() & 1;
    (*((void (**)(char *, uint64_t))v60 + 1))(v28, v7);
    LODWORD(v62) = v29;
    sub_1000307C0();
    _os_log_impl((void *)&_mh_execute_header, v50, v19, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v24, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v53;
    swift_slowDealloc();
  }
  else
  {
    (*((void (**)(char *, uint64_t))v60 + 1))(v61, v7);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v11 + 8);
    v27(v15, v10);
  }
  v54(v6, v59, v10);
  sub_100030440();
  uint64_t v30 = &v6[*(int *)(v55 + 20)];
  *(void *)uint64_t v30 = v31;
  *((void *)v30 + 1) = v32;
  uint64_t result = sub_10001B2E4((uint64_t)v6, 1, v58);
  if (*(void *)(result + 16))
  {
    double v60 = (void (*)(char *, char *))v27;
    os_log_type_t v61 = (char *)v10;
    uint64_t v34 = *(void **)(result + 32);
    char v35 = *(unsigned char *)(result + 40);
    uint64_t v36 = *(void *)(result + 48);
    swift_retain();
    id v37 = v34;
    swift_bridgeObjectRelease();
    uint64_t v63 = (uint64_t)v37;
    char v64 = v35;
    uint64_t v65 = v36;
    v51(&v63);
    os_log_type_t v38 = sub_1000306E0();
    uint64_t v39 = qword_1000446B0;
    os_log_type_t v40 = v38;
    if (os_log_type_enabled((os_log_t)qword_1000446B0, v38))
    {
      id v41 = v37;
      swift_retain_n();
      id v42 = v41;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136446210;
      id v44 = v42;
      swift_retain();
      PhotosReliveWidgetEntry.description.getter();
      uint64_t v46 = v45;
      unint64_t v48 = v47;
      swift_release();

      uint64_t v62 = sub_10001F274(v46, v48, &v63);
      sub_1000307C0();
      swift_release_n();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "snapshot request completed with entry %{public}s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      uint64_t v49 = (uint64_t)v53;
    }
    else
    {
      swift_release();

      uint64_t v49 = (uint64_t)v6;
    }
    sub_100021C5C(v49, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
    v60(v59, v61);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void PhotosReliveWidgetEntryProvider.getSnapshot(in:completion:)()
{
  sub_1000221D0();
  uint64_t v57 = v2;
  id v58 = v1;
  uint64_t v4 = v3;
  uint64_t v60 = type metadata accessor for PhotosReliveWidgetSize(0);
  sub_100011958();
  __chkstk_darwin(v5, v6);
  uint64_t v66 = sub_100022298(v7, v53);
  sub_10001193C();
  __chkstk_darwin(v8, v9);
  uint64_t v10 = sub_100022394();
  sub_10001193C();
  uint64_t v12 = v11;
  __chkstk_darwin(v13, v14);
  sub_100011E44();
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v53 - v17;
  sub_100030450();
  id v64 = sub_100019FBC();
  os_log_type_t v19 = sub_1000306E0();
  if (qword_100040618 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_1000446B0;
  uint64_t v21 = v12 + 16;
  uint64_t v59 = *(void *)(v12 + 16);
  sub_100022584();
  v22();
  os_log_type_t v61 = v4;
  sub_1000119DC();
  v23();
  os_log_t v55 = v20;
  BOOL v24 = os_log_type_enabled(v20, v19);
  uint64_t v65 = v10;
  uint64_t v62 = v12;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v54 = sub_1000223E0();
    uint64_t v67 = v54;
    *(_DWORD *)uint64_t v25 = 136446466;
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v26 = sub_1000309A0();
    uint64_t v28 = sub_10001F274(v26, v27, &v67);
    sub_1000224A0(v28);
    sub_1000307C0();
    swift_bridgeObjectRelease();
    sub_100022544();
    uint64_t v56 = v29;
    sub_100022328();
    v30();
    *(_WORD *)(v25 + 12) = 1026;
    sub_100030460();
    sub_1000222E4();
    v31();
    sub_100022434();
    _os_log_impl((void *)&_mh_execute_header, v55, v19, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v25, 0x12u);
    swift_arrayDestroy();
    sub_100022200();
    sub_100022200();
  }
  else
  {
    sub_1000222E4();
    v32();
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v56(v0, v10);
  }
  uint64_t v33 = v63;
  uint64_t v66 = (uint64_t)v18;
  sub_100022584();
  v34();
  char v35 = v61;
  sub_100030440();
  uint64_t v36 = (void *)(v33 + *(int *)(v60 + 20));
  *uint64_t v36 = v37;
  v36[1] = v38;
  if (*(void *)(sub_10001B2E4(v33, 1, v64) + 16))
  {
    sub_100022464();
    id v39 = v35;
    swift_bridgeObjectRelease();
    v58(v39, v21, v18);
    os_log_type_t v40 = sub_1000306E0();
    if (os_log_type_enabled((os_log_t)qword_1000446B0, v40))
    {
      id v41 = v39;
      swift_retain_n();
      id v42 = v41;
      uint64_t v43 = (_DWORD *)sub_1000224D4();
      uint64_t v67 = sub_1000223E0();
      _DWORD *v43 = 136446210;
      id v44 = v42;
      swift_retain();
      PhotosReliveWidgetEntry.description.getter();
      uint64_t v46 = v45;
      unint64_t v48 = v47;
      swift_release();

      uint64_t v49 = sub_10001F274(v46, v48, &v67);
      sub_100022300(v49);
      swift_release_n();

      swift_bridgeObjectRelease();
      sub_100022524((void *)&_mh_execute_header, v50, v51, "snapshot request completed with entry %{public}s");
      swift_arrayDestroy();
      sub_100022200();
      sub_100022200();
      swift_release();
    }
    else
    {
      swift_release();
    }
    sub_100021C5C(v63, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
    sub_100022328();
    v52();
    sub_1000221E8();
  }
  else
  {
    __break(1u);
  }
}

void PhotosReliveWidgetEntryProvider.getTimeline(in:completion:)()
{
  sub_1000221D0();
  uint64_t v87 = v1;
  uint64_t v88 = v0;
  uint64_t v3 = v2;
  sub_10000D85C(&qword_100041058);
  sub_10001193C();
  uint64_t v100 = v5;
  uint64_t v101 = v4;
  __chkstk_darwin(v4, v6);
  sub_100011A2C();
  uint64_t v91 = v7;
  sub_1000223BC();
  __chkstk_darwin(v8, v9);
  uint64_t v99 = (char *)v84 - v10;
  uint64_t v11 = sub_10000D85C(&qword_100041060);
  sub_100011958();
  __chkstk_darwin(v12, v13);
  sub_100011A2C();
  uint64_t v86 = v14;
  sub_1000223BC();
  __chkstk_darwin(v15, v16);
  uint64_t v95 = (uint64_t)v84 - v17;
  uint64_t v18 = type metadata accessor for PhotosReliveWidgetSize(0);
  sub_100011958();
  __chkstk_darwin(v19, v20);
  sub_100011978();
  uint64_t v98 = v21;
  uint64_t v22 = sub_1000303B0();
  sub_10001193C();
  uint64_t v24 = v23;
  __chkstk_darwin(v25, v26);
  sub_100011A2C();
  uint64_t v89 = v27;
  sub_1000223BC();
  uint64_t v30 = __chkstk_darwin(v28, v29);
  __chkstk_darwin(v30, v31);
  uint64_t v33 = (char *)v84 - v32;
  sub_100030450();
  id v34 = sub_100019FBC();
  os_log_type_t v35 = sub_1000306E0();
  if (qword_100040618 != -1) {
    swift_once();
  }
  uint64_t v93 = v34;
  uint64_t v36 = qword_1000446B0;
  uint64_t v96 = *(void *)(v24 + 16);
  uint64_t v97 = v24 + 16;
  sub_1000119DC();
  v37();
  BOOL v38 = os_log_type_enabled(v36, v35);
  os_log_t v94 = v33;
  uint64_t v90 = v24;
  if (v38)
  {
    uint64_t v39 = sub_1000224D4();
    uint64_t v85 = v11;
    v84[1] = v3;
    uint64_t v40 = v18;
    id v41 = (uint8_t *)v39;
    v103[0] = sub_1000223E0();
    *(_DWORD *)id v41 = 136446210;
    uint64_t v92 = (void (*)(char *, uint64_t))(v41 + 4);
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v42 = sub_1000309A0();
    uint64_t v102 = sub_10001F274(v42, v43, v103);
    sub_1000307C0();
    uint64_t v33 = v94;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_100022488();
    v45(v44);
    _os_log_impl((void *)&_mh_execute_header, v36, v35, "timeline requested for size %{public}s", v41, 0xCu);
    swift_arrayDestroy();
    sub_100022200();
    uint64_t v18 = v40;
    uint64_t v11 = v85;
    sub_100022200();
  }
  else
  {
    uint64_t v46 = sub_100022488();
    v47(v46);
  }
  uint64_t v48 = v98;
  sub_100011C50();
  v49();
  sub_100030440();
  uint64_t v50 = (void *)(v48 + *(int *)(v18 + 20));
  *uint64_t v50 = v51;
  v50[1] = v52;
  uint64_t v53 = v93;
  uint64_t v54 = sub_10001B2E4(v48, 2, v93);
  uint64_t v55 = v95;
  uint64_t v56 = v95 + *(int *)(v11 + 48);
  sub_10001A1D0(v95, v56, v54, (uint64_t)v33);
  uint64_t v57 = v86 + *(int *)(v11 + 48);
  sub_100030420();
  sub_100011958();
  sub_100011C50();
  v58();
  sub_10001FA4C(v56, v57);
  sub_10001FAB4();
  uint64_t v59 = v99;
  sub_1000304B0();
  sub_100011528(v57, &qword_100041068);
  ((void (*)(char *))v88)(v59);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  uint64_t v60 = v48;
  os_log_type_t v61 = v53;
  sub_100024D0C(v60, (double *)v103);
  [v53 setWidgetTimelineGeneratedForDisplaySize:*(double *)v103, *(double *)&v103[1]];
  sub_100015330(v56, (uint64_t)v33);
  os_log_type_t v62 = sub_1000306E0();
  uint64_t v63 = qword_1000446B0;
  id v64 = v89;
  sub_100011C50();
  v65();
  uint64_t v66 = v91;
  sub_1000119DC();
  v67();
  if (os_log_type_enabled(v63, v62))
  {
    uint64_t v68 = swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    v103[0] = v97;
    *(_DWORD *)uint64_t v68 = 136446466;
    sub_10002021C(&qword_100041050, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    uint64_t v69 = sub_1000309A0();
    uint64_t v102 = sub_10001F274(v69, v70, v103);
    uint64_t v88 = v63;
    uint64_t v71 = v100;
    sub_1000307C0();
    swift_bridgeObjectRelease();
    uint64_t v96 = v90 + 8;
    sub_100011BBC();
    v72();
    *(_WORD *)(v68 + 12) = 2082;
    uint64_t v73 = v101;
    sub_1000304C0();
    uint64_t v74 = v66;
    uint64_t v75 = sub_100030650();
    uint64_t v90 = v22;
    unint64_t v77 = v76;
    swift_bridgeObjectRelease();
    uint64_t v102 = sub_10001F274(v75, v77, v103);
    sub_1000307C0();
    swift_bridgeObjectRelease();
    unint64_t v78 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
    v78(v74, v73);
    _os_log_impl((void *)&_mh_execute_header, v88, v62, "timeline request completed for size %{public}s with entries %{public}s", (uint8_t *)v68, 0x16u);
    swift_arrayDestroy();
    sub_100022200();
    sub_100022200();

    v78((uint64_t)v99, v73);
    sub_100011528(v95, &qword_100041060);
    sub_100021C5C(v98, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
    sub_100011BBC();
    v79();
  }
  else
  {
    uint64_t v80 = v101;
    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v100 + 8);
    v81(v66, v101);
    uint64_t v82 = v64;
    uint64_t v83 = v92;
    v92(v82, v22);

    v81((uint64_t)v99, v80);
    sub_100011528(v55, &qword_100041060);
    sub_100021C5C(v98, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
    v83(v94, v22);
  }
  sub_1000221E8();
}

uint64_t PhotosReliveWidgetEntryProvider.placeholder(in:)()
{
  uint64_t v1 = type metadata accessor for PhotosReliveWidgetSize(0);
  uint64_t v2 = v1 - 8;
  __chkstk_darwin(v1, v3);
  sub_100022334();
  sub_100030440();
  uint64_t v4 = (void *)(v0 + *(int *)(v2 + 28));
  *uint64_t v4 = v5;
  v4[1] = v6;
  id v7 = [self placeholderEntryForContentType:0];
  sub_100021C5C(v0, (void (*)(void))type metadata accessor for PhotosReliveWidgetSize);
  return sub_1000224EC();
}

uint64_t sub_10001CBC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = PhotosReliveWidgetEntryProvider.placeholder(in:)();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = 2;
  *(void *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_10001CBF4(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  swift_retain();

  return sub_10001B794(a1, a2, a3);
}

uint64_t sub_10001CC4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_10001CD00;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10001CD00()
{
  sub_100022458();
  sub_100022194();
  uint64_t v1 = *v0;
  sub_100022268();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_10001CDC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_10002218C;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10001CE78()
{
  sub_1000216F4(0, &qword_100041238);
  uint64_t result = sub_1000307B0();
  qword_1000446B8 = result;
  return result;
}

uint64_t sub_10001CEF0()
{
  if (![self isPreflightFeatureEnabled]) {
    return 0;
  }
  id v0 = objc_allocWithZone((Class)LSApplicationRecord);
  id v1 = sub_10001EB0C(0xD000000000000019, 0x8000000100033B20, 0);
  sub_1000216F4(0, &qword_100041288);
  uint64_t v2 = (void *)sub_100030730();
  id v3 = [objc_allocWithZone((Class)PDCPreflightManager) initWithTargetQueue:v2];

  if (![v3 requiresPreflightForApplicationRecord:v1])
  {

    return 0;
  }
  sub_1000306E0();
  if (qword_100040620 != -1) {
    swift_once();
  }
  sub_10002FC10();

  return 1;
}

void *sub_10001D1DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 24 * v1 + 8);
  swift_retain();
  id v3 = v2;
  return v2;
}

uint64_t sub_10001D244(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v64 = a1;
  uint64_t v65 = sub_10002FBA0();
  uint64_t v10 = *(void *)(v65 - 8);
  uint64_t v12 = __chkstk_darwin(v65, v11);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v12, v15);
  uint64_t v18 = (char *)&v58 - v17;
  uint64_t v20 = __chkstk_darwin(v16, v19);
  uint64_t v22 = (char *)&v58 - v21;
  __chkstk_darwin(v20, v23);
  uint64_t v25 = (char *)&v58 - v24;
  if (!a3)
  {
    unint64_t v29 = 0xE400000000000000;
    uint64_t v27 = 1701736302;
    goto LABEL_5;
  }
  if (!a4)
  {
    swift_retain();
    id v45 = a3;
    PhotosReliveWidgetEntry.date.getter(v45, (uint64_t)v25);
    sub_10002FB90();
    char v46 = sub_10002FB60();
    uint64_t v48 = (double *)(v10 + 8);
    unint64_t v47 = *(void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v49 = v65;
    v47(v22, v65);
    if ((v46 & 1) == 0)
    {
      sub_100030410();
      swift_release();

      v47(v25, v49);
      goto LABEL_16;
    }
    PhotosReliveWidgetEntry.endDate.getter(v45, (uint64_t)v22);
    sub_10002FB40();
    double v51 = v50;
    uint64_t v63 = v48;
    v47(v22, v49);
    if (v51 < 1200.0)
    {
      __break(1u);
    }
    else
    {
      sub_10001FFEC(1200.0, v51);
      sub_10002FB50();
      LODWORD(v62) = sub_1000306E0();
      if (qword_100040620 == -1)
      {
LABEL_14:
        sub_10000D85C(&qword_100041340);
        uint64_t v52 = swift_allocObject();
        *(_OWORD *)(v52 + 16) = xmmword_1000311D0;
        uint64_t v53 = sub_10002FB20();
        uint64_t v55 = v54;
        *(void *)(v52 + 56) = &type metadata for String;
        *(void *)(v52 + 64) = sub_100021E54();
        *(void *)(v52 + 32) = v53;
        *(void *)(v52 + 40) = v55;
        *(void *)(v52 + 96) = &type metadata for Double;
        *(void *)(v52 + 104) = &protocol witness table for Double;
        *(double *)(v52 + 72) = v51;
        sub_10002FC10();
        swift_bridgeObjectRelease();
        sub_100030400();
        swift_release();

        uint64_t v56 = v65;
        v47(v22, v65);
        v47(v25, v56);
LABEL_16:
        uint64_t v44 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
        uint64_t v42 = a2;
        uint64_t v43 = 1;
        return sub_10000DA40(v42, v43, 1, v44);
      }
    }
    swift_once();
    goto LABEL_14;
  }
  id v26 = [a3 localIdentifier];
  uint64_t v27 = sub_1000305B0();
  unint64_t v29 = v28;

LABEL_5:
  uint64_t v63 = (double *)a2;
  double v30 = sub_10001D830(v27, v29, a6, 1200.0);
  sub_10001FFEC(0.0, 300.0);
  sub_10002FB70();
  os_log_type_t v31 = sub_1000306E0();
  if (qword_100040620 != -1) {
    swift_once();
  }
  uint64_t v61 = v27;
  unint64_t v62 = v29;
  uint64_t v32 = qword_1000446B8;
  uint64_t v33 = v65;
  uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v60(v14, v18, v65);
  os_log_type_t v34 = v31;
  if (os_log_type_enabled(v32, v31))
  {
    os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v67 = v59;
    *(_DWORD *)os_log_type_t v35 = 136315138;
    uint64_t v36 = sub_10002FB20();
    uint64_t v66 = sub_10001F274(v36, v37, &v67);
    uint64_t v33 = v65;
    sub_1000307C0();
    swift_bridgeObjectRelease();
    BOOL v38 = *(void (**)(char *, uint64_t))(v10 + 8);
    v38(v14, v33);
    _os_log_impl((void *)&_mh_execute_header, v32, v34, "scheduled timeline reload because content unavailable at %s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    BOOL v38 = *(void (**)(char *, uint64_t))(v10 + 8);
    v38(v14, v33);
  }
  uint64_t v39 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  uint64_t v40 = v63;
  v60((char *)v63 + *(int *)(v39 + 24), v18, v33);
  unint64_t v41 = v62;
  *(void *)uint64_t v40 = v61;
  *((void *)v40 + 1) = v41;
  v40[2] = v30;
  sub_100030400();
  v38(v18, v33);
  uint64_t v42 = (uint64_t)v40;
  uint64_t v43 = 0;
  uint64_t v44 = v39;
  return sub_10000DA40(v42, v43, 1, v44);
}

double sub_10001D830(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = sub_10002FBA0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000D85C(&qword_100041068);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014AC4(a3, (uint64_t)v16);
  if (sub_10000DA00((uint64_t)v16, 1, v17) == 1)
  {
    sub_100011528((uint64_t)v16, &qword_100041068);
  }
  else
  {
    sub_100021CF4((uint64_t)v16, (uint64_t)v20);
    uint64_t v21 = *((void *)v20 + 1);
    if (v21)
    {
      BOOL v22 = *(void *)v20 == a1 && v21 == a2;
      if (v22 || (sub_1000309C0() & 1) != 0)
      {
        sub_10002FB90();
        sub_10002021C(&qword_100041330, (void (*)(uint64_t))&type metadata accessor for Date);
        char v23 = sub_100030500();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
        if (v23)
        {
          os_log_type_t v24 = sub_1000306B0();
          if (qword_100040608 != -1) {
            swift_once();
          }
          uint64_t v25 = qword_100041040;
          if (os_log_type_enabled((os_log_t)qword_100041040, v24))
          {
            swift_bridgeObjectRetain_n();
            id v26 = (uint8_t *)swift_slowAlloc();
            uint64_t v29 = swift_slowAlloc();
            *(_DWORD *)id v26 = 136446210;
            swift_bridgeObjectRetain();
            uint64_t v28 = sub_10001F274(a1, a2, &v29);
            sub_1000307C0();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v25, v24, "Not increasing reload delay for entry id %{public}s because reload occurred before scheduled time", v26, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          a4 = *((double *)v20 + 2);
        }
        else if (*((double *)v20 + 2) + *((double *)v20 + 2) <= 3600.0)
        {
          a4 = *((double *)v20 + 2) + *((double *)v20 + 2);
        }
        else
        {
          a4 = 3600.0;
        }
      }
    }
    sub_100021C5C((uint64_t)v20, (void (*)(void))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
  }
  return a4;
}

void PhotosReliveWidget.body.getter()
{
  sub_1000221D0();
  sub_10000D85C(&qword_100040688);
  sub_10001193C();
  __chkstk_darwin(v0, v1);
  sub_1000222C4(v2, v28);
  sub_10000D85C(&qword_100040680);
  sub_10001193C();
  __chkstk_darwin(v3, v4);
  sub_100011978();
  sub_10000D85C(&qword_100040678);
  sub_10001193C();
  __chkstk_darwin(v5, v6);
  sub_10002235C(v7, v29);
  sub_10000D85C(&qword_100040670);
  sub_10001193C();
  __chkstk_darwin(v8, v9);
  sub_100011978();
  sub_10000D85C(&qword_100041078);
  sub_10001193C();
  __chkstk_darwin(v10, v11);
  sub_100022378(v12, v30);
  uint64_t v13 = self;
  sub_1000201AC([v13 mainBundle]);
  if (v14)
  {
    sub_10000D85C(&qword_100041080);
    sub_1000303B0();
    sub_10001193C();
    uint64_t v16 = v15;
    sub_1000223F8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100031D40;
    uint64_t v17 = *(void (**)(void))(v16 + 104);
    sub_10002225C();
    v17();
    sub_10002225C();
    v17();
    sub_10002225C();
    v17();
    sub_10002225C();
    v17();
    sub_100022500();
    sub_100022500();
    id v18 = [v13 mainBundle];
    sub_1000224B4();
    uint64_t v35 = sub_100022218();
    uint64_t v36 = v19;
    char v34 = v20 & 1;
    id v21 = [v13 mainBundle];
    sub_1000224B4();
    uint64_t v31 = sub_100022218();
    uint64_t v33 = v22;
    type metadata accessor for PhotosReliveWidgetView();
    sub_10002021C(&qword_100041088, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetView);
    unint64_t v32 = sub_100020264();
    sub_1000303F0();
    sub_10001148C(&qword_100040690, &qword_100040688);
    sub_10002228C();
    sub_10002FF00();
    swift_bridgeObjectRelease();
    sub_1000221AC();
    v23();
    sub_100022558();
    sub_100022518();
    sub_10002FF20();
    sub_1000221AC();
    v24();
    sub_100022558();
    sub_100022518();
    sub_10002FEF0();
    sub_1000221AC();
    v25();
    sub_100022558();
    sub_10002228C();
    sub_10002FF30();
    sub_1000221AC();
    v26();
    sub_100022558();
    sub_10002FF10();
    sub_100021554(v31, v33, SBYTE4(v32), (uint64_t (*)(void))&_swift_release);
    swift_bridgeObjectRelease();
    sub_100021554(v35, v36, v34, (uint64_t (*)(void))&_swift_release);
    swift_bridgeObjectRelease();
    sub_1000221AC();
    v27();
    sub_1000221E8();
  }
  else
  {
    __break(1u);
  }
}

void PhotosReliveCollectionsWidget.body.getter()
{
  sub_1000221D0();
  sub_10000D85C(&qword_1000406B0);
  sub_10001193C();
  __chkstk_darwin(v0, v1);
  sub_100011978();
  sub_10000D85C(&qword_1000406A8);
  sub_10001193C();
  __chkstk_darwin(v2, v3);
  sub_100011978();
  sub_10000D85C(&qword_1000406A0);
  sub_10001193C();
  __chkstk_darwin(v4, v5);
  sub_1000222C4(v6, v35);
  sub_10000D85C(&qword_100040698);
  sub_10001193C();
  __chkstk_darwin(v7, v8);
  sub_10002235C(v9, v36);
  sub_10000D85C(&qword_100041098);
  sub_10001193C();
  __chkstk_darwin(v10, v11);
  sub_100011978();
  sub_10000D85C(&qword_1000410A0);
  sub_10001193C();
  __chkstk_darwin(v12, v13);
  sub_100022378(v14, v37);
  uint64_t v15 = self;
  sub_1000201AC([v15 mainBundle]);
  if (v16)
  {
    uint64_t v41 = v16;
    swift_bridgeObjectRetain();
    v42._countAndFlagsBits = 0x7463656C6C6F632ELL;
    v42._object = (void *)0xEC000000736E6F69;
    sub_1000305F0(v42);
    swift_bridgeObjectRelease();
    sub_10000D85C(&qword_100041080);
    sub_1000303B0();
    sub_10001193C();
    uint64_t v18 = v17;
    sub_1000223F8();
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_100031D40;
    uint64_t v19 = *(void (**)(void))(v18 + 104);
    sub_10002225C();
    v19();
    sub_10002225C();
    v19();
    sub_10002225C();
    v19();
    sub_10002225C();
    v19();
    sub_100022500();
    id v20 = [v15 mainBundle];
    sub_1000224B4();
    sub_100022410();
    uint64_t v39 = sub_100022218();
    uint64_t v40 = v21;
    id v22 = [v15 mainBundle];
    sub_1000224B4();
    uint64_t v23 = sub_100022218();
    uint64_t v25 = v24;
    char v27 = v26 & 1;
    type metadata accessor for PhotosReliveWidgetView();
    uint64_t v28 = sub_10002021C(&qword_100041088, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetView);
    sub_1000202B0();
    sub_100030430();
    sub_10001148C(&qword_1000406B8, &qword_1000406B0);
    sub_10002228C();
    sub_10002FF00();
    swift_bridgeObjectRelease();
    sub_1000221AC();
    v29();
    sub_1000223C8();
    sub_100022518();
    sub_10002FF20();
    sub_1000221AC();
    v30();
    sub_1000223C8();
    sub_100022518();
    sub_10002FEF0();
    sub_1000221AC();
    v31();
    sub_1000223C8();
    sub_10002228C();
    sub_10002FF30();
    sub_1000221AC();
    v32();
    sub_1000223C8();
    sub_10002FF10();
    sub_1000221AC();
    v33();
    sub_1000223C8();
    sub_10002FEE0();
    sub_100021554(v23, v25, v27, (uint64_t (*)(void))&_swift_release);
    swift_bridgeObjectRelease();
    sub_100021554(v39, v40, SBYTE4(v28), (uint64_t (*)(void))&_swift_release);
    swift_bridgeObjectRelease();
    sub_1000221AC();
    v34();
    sub_1000221E8();
  }
  else
  {
    __break(1u);
  }
}

void *sub_10001E9CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = type metadata accessor for PhotosReliveWidgetView();
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v7 = (uint64_t *)(a2 + *(int *)(v6 + 28));
  *uint64_t v7 = swift_getKeyPath();
  sub_10000D85C(&qword_100040668);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = *(void **)a2;
  swift_retain_n();
  id v9 = v3;
  uint64_t result = sub_100021CB4(v8);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v5;
  *(unsigned char *)(a2 + 32) = v4;
  return result;
}

uint64_t PhotosReliveWidgetBundle.body.getter()
{
  uint64_t v0 = sub_10000D85C(&qword_1000410B0);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

id sub_10001EB0C(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_100030580();
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
    sub_10002FA80();

    swift_willThrow();
  }
  return v6;
}

char *sub_10001EBE8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100030910();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_10001EC84(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100030910();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_10001ED18(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

void sub_10001ED24(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

void sub_10001ED30(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2 < 0)
  {
    sub_100022278();
    uint64_t v9 = sub_100030910();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    _swift_arrayInitWithTakeBackToFront(v9);
    return;
  }
  if (a3 < a1 || (sub_10000D85C(a4), sub_100011958(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    sub_10000D85C(a4);
    uint64_t v10 = sub_1000224C0();
    _swift_arrayInitWithTakeFrontToBack(v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_1000224C0();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

char *sub_10001EE38(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100030910();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_10001EED4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100030910();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_10001EFB8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100030910();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_10001F098(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((sub_10000D85C(&qword_1000412F8),
         sub_100011958(),
         uint64_t v7 = *(void *)(v6 + 72) * a2,
         unint64_t v8 = a3 + v7,
         unint64_t v9 = a1 + v7,
         v8 > a1)
      ? (BOOL v10 = v9 > a3)
      : (BOOL v10 = 0),
        v10))
  {
    sub_100022278();
    uint64_t result = sub_100030910();
    __break(1u);
  }
  else
  {
    sub_10002228C();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_10001F190(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (BOOL v3 = a1 + 40 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100030910();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_10001F274(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001F348(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100021EF0((uint64_t)v12, *a3);
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
      sub_100021EF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100021EA0((uint64_t)v12);
  return v7;
}

uint64_t sub_10001F348(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10001F4A0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1000307D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10001F578(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000308B0();
    if (!v8)
    {
      uint64_t result = sub_1000308D0();
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

void *sub_10001F4A0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100030910();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10001F578(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10001F610(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001F7EC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001F7EC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10001F610(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100030600();
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
  unint64_t v3 = sub_10001F784(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100030880();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100030910();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_1000308D0();
  __break(1u);
  return result;
}

void *sub_10001F784(uint64_t a1, uint64_t a2)
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
  sub_10000D85C(&qword_100041350);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10001F7EC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000D85C(&qword_100041350);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001F99C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001F8C4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10001F8C4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100030910();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10001F99C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100030910();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for PhotosReliveWidgetSize(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_1000411D0);
}

uint64_t sub_10001FA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D85C(&qword_100041068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001FAB4()
{
  unint64_t result = qword_100041070;
  if (!qword_100041070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041070);
  }
  return result;
}

char *sub_10001FB00(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10001FB80(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_10001FB20(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10001FC6C(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_10001FB40(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10001FD50(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

size_t sub_10001FB60(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_10001FE3C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10001FB80(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000D85C(&qword_100041250);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001EBE8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001EED4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_10001FC6C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000D85C(&qword_100041258);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001EC84(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001EFB8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_10001FD50(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000D85C(&qword_100041300);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001EE38(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001F190((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_10001FE3C(size_t result, int64_t a2, char a3, uint64_t a4)
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
  sub_10000D85C(&qword_100041308);
  uint64_t v10 = *(void *)(sub_10000D85C(&qword_1000412F8) - 8);
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
  uint64_t v15 = *(void *)(sub_10000D85C(&qword_1000412F8) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_10001ED30(v18, v8, v17, &qword_1000412F8);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001F098(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

void sub_10001FFEC(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0) {
    sub_10002006C(0x20000000000001uLL);
  }
  else {
    __break(1u);
  }
}

unint64_t sub_10002006C(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    size_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000200F8(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100030580();
  id v5 = [a3 isValidCloudIdentifierStringValue:v4];

  return v5;
}

id sub_100020140(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = sub_100030580();
  swift_bridgeObjectRelease();
  id v7 = [a4 fallbackEntryForAlbumNotFoundWithLocalIdentifier:v6 size:a3];

  return v7;
}

uint64_t sub_1000201AC(void *a1)
{
  id v2 = [a1 bundleIdentifier];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1000305B0();

  return v3;
}

uint64_t sub_10002021C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100020264()
{
  unint64_t result = qword_100041090;
  if (!qword_100041090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041090);
  }
  return result;
}

unint64_t sub_1000202B0()
{
  unint64_t result = qword_1000410A8;
  if (!qword_1000410A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000410A8);
  }
  return result;
}

unint64_t sub_1000202FC()
{
  unint64_t result = qword_1000410B8[0];
  if (!qword_1000410B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000410B8);
  }
  return result;
}

uint64_t sub_10002034C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100020368()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100020384()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PhotosReliveWidgetEntry(id *a1)
{
  return swift_release();
}

uint64_t _s18PhotosReliveWidget23PhotosReliveWidgetEntryVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PhotosReliveWidgetEntry(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PhotosReliveWidgetEntry(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotosReliveWidgetEntry(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetEntry(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetEntry(uint64_t result, int a2, int a3)
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

void type metadata accessor for PhotosReliveWidgetEntry()
{
}

void type metadata accessor for PhotosReliveWidgetEntryProvider()
{
}

void type metadata accessor for PhotosReliveWidget()
{
}

void type metadata accessor for PhotosReliveCollectionsWidget()
{
}

void type metadata accessor for PhotosReliveWidgetBundle()
{
}

uint64_t sub_1000205AC()
{
  return sub_100011C5C();
}

uint64_t sub_1000206E4()
{
  return sub_100011C5C();
}

uint64_t sub_100020850()
{
  return sub_10001148C(&qword_1000410D0, &qword_1000410D8);
}

uint64_t sub_10002088C(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_100020914(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x1000209E0);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetEntryRole()
{
}

void type metadata accessor for PhotosReliveWidgetCollectionsProvider()
{
}

uint64_t *sub_100020A20(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    BOOL v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_10002FBA0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_100020B10(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10002FBA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100020B88(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  BOOL v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10002FBA0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_100020C28(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = *(int *)(a3 + 24);
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10002FBA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_100020CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_10002FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_100020D50(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10002FBA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100020DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020DF8);
}

uint64_t sub_100020DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_10002FBA0();
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return sub_10000DA00(v10, a2, v9);
  }
}

uint64_t sub_100020E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020EA0);
}

uint64_t sub_100020EA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_10002FBA0();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_10000DA40(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_100041138);
}

uint64_t sub_100020F40()
{
  uint64_t result = sub_10002FBA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100020FE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1000303B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_1000210B0(uint64_t a1)
{
  uint64_t v2 = sub_1000303B0();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100021114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000303B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100021190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000303B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t sub_10002121C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000303B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100021298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000303B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100021314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100021328);
}

uint64_t sub_100021328(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000303B0();

  return sub_10000DA00(a1, a2, v4);
}

uint64_t sub_100021370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100021384);
}

uint64_t sub_100021384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000303B0();

  return sub_10000DA40(a1, a2, a2, v4);
}

uint64_t sub_1000213D0()
{
  uint64_t result = sub_1000303B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100021468()
{
  unint64_t result = qword_100041208;
  if (!qword_100041208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041208);
  }
  return result;
}

unint64_t sub_1000214B8()
{
  unint64_t result = qword_100041210[0];
  if (!qword_100041210[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041210);
  }
  return result;
}

uint64_t sub_100021508(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_100021554(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(void))
{
  if (a3) {
    return a4();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100021568(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_errorRetain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100021578(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *sub_1000215F8(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    char v5 = *(void **)(*(void *)(a5 + 48) + 8 * a2);
    uint64_t v6 = *(void *)(a5 + 56) + 24 * a2;
    uint64_t v7 = *(void *)v6;
    uint64_t v8 = *(void *)(v6 + 8);
    char v9 = *(unsigned char *)(v6 + 16);
    *unint64_t result = *(void *)v6;
    result[1] = v8;
    *((unsigned char *)result + 16) = v9;
    id v10 = v5;
    sub_100021568(v7, v8, v9);
    return v10;
  }
LABEL_8:
  __break(1u);
  return result;
}

#error "1000216E4: call analysis failed (funcsize=18)"

uint64_t sub_1000216F4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100021730()
{
  return sub_100021854();
}

uint64_t sub_10002173C()
{
  return sub_10002199C(&qword_100041280, &unk_10003E620, sub_10002179C, sub_100019A0C);
}

uint64_t sub_100021778(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100021788()
{
  return swift_release();
}

uint64_t sub_100021790()
{
  return sub_100021A88(&qword_100041280);
}

uint64_t sub_10002179C(uint64_t a1)
{
  uint64_t v2 = sub_10000D85C(&qword_100041280);
  sub_1000221BC(v2);

  return sub_100019930(a1);
}

#error "100021838: call analysis failed (funcsize=18)"

uint64_t sub_100021848()
{
  return sub_100021854();
}

uint64_t sub_100021854()
{
  sub_1000221D0();
  uint64_t v2 = v1;
  uint64_t v3 = sub_100030470();
  sub_10001193C();
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = sub_10000D85C(v2);
  sub_10001193C();
  uint64_t v11 = v10;
  unint64_t v12 = (v6 + v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v3);
  (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v0 + v12, v9);
  sub_1000221E8();
  return _swift_deallocObject(v13, v14, v15);
}

uint64_t sub_100021960()
{
  return sub_10002199C(&qword_1000412B0, &unk_10003E698, sub_100021B04, sub_100018CA8);
}

#error "100021A5C: call analysis failed (funcsize=56)"

uint64_t sub_100021A7C()
{
  return sub_100021A88(&qword_1000412B0);
}

uint64_t sub_100021A88(uint64_t *a1)
{
  sub_10000D85C(a1);
  sub_100011958();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80) | 7;
  sub_100011BBC();
  v3();
  uint64_t v4 = sub_100022410();

  return _swift_deallocObject(v4, v5, v2);
}

uint64_t sub_100021B04(void *a1)
{
  uint64_t v2 = sub_10000D85C(&qword_1000412B0);
  sub_1000221BC(v2);

  return sub_1000185B8(a1);
}

void *sub_100021B70(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100021BB4()
{
  unint64_t result = qword_1000412C0;
  if (!qword_1000412C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000412C0);
  }
  return result;
}

uint64_t sub_100021C00(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100011958();
  sub_100011C50();
  v4();
  return a2;
}

uint64_t sub_100021C5C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100011958();
  sub_100011BBC();
  v3();
  return a1;
}

void *sub_100021CB4(void *result)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_100021CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100021D58()
{
  unint64_t result = qword_100041318;
  if (!qword_100041318)
  {
    sub_10000D960(&qword_100041068);
    sub_10002021C(&qword_100041320, (void (*)(uint64_t))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041318);
  }
  return result;
}

uint64_t sub_100021DFC(uint64_t a1, unint64_t a2)
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

unint64_t sub_100021E54()
{
  unint64_t result = qword_100041348;
  if (!qword_100041348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041348);
  }
  return result;
}

uint64_t sub_100021EA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100021EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100021F4C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001B68C(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), a2);
}

unsigned char *storeEnumTagSinglePayload for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100022038);
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

ValueMetadata *type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys()
{
  return &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys;
}

unint64_t sub_100022074()
{
  unint64_t result = qword_100041360;
  if (!qword_100041360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041360);
  }
  return result;
}

unint64_t sub_1000220C4()
{
  unint64_t result = qword_100041368;
  if (!qword_100041368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041368);
  }
  return result;
}

unint64_t sub_100022114()
{
  unint64_t result = qword_100041370;
  if (!qword_100041370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041370);
  }
  return result;
}

uint64_t sub_100022168@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100021F4C(a1, a2);
}

uint64_t sub_1000221BC(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100022200()
{
  return swift_slowDealloc();
}

uint64_t sub_100022218()
{
  return sub_100030070();
}

uint64_t sub_100022238()
{
  return v0;
}

uint64_t sub_100022298@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_100030470();
}

void sub_1000222C4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 272) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_1000222F4(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_100022300(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1000307C0();
}

uint64_t sub_100022334()
{
  return sub_100030450();
}

void sub_10002235C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_100022378(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100022394()
{
  return sub_1000303B0();
}

uint64_t sub_1000223C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000223E0()
{
  return swift_slowAlloc();
}

uint64_t sub_100022410()
{
  return v0;
}

uint64_t sub_100022434()
{
  *(_DWORD *)(v1 - 96) = v0;
  return sub_1000307C0();
}

uint64_t sub_100022464()
{
  return swift_retain();
}

uint64_t sub_100022488()
{
  uint64_t result = v0;
  *(void *)(v2 - 216) = *(void *)(v1 + 8);
  return result;
}

uint64_t sub_1000224A0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_1000224C0()
{
  return v0;
}

uint64_t sub_1000224D4()
{
  return swift_slowAlloc();
}

uint64_t sub_1000224EC()
{
  return v0;
}

uint64_t sub_100022500()
{
  return sub_10002FE90();
}

void sub_100022524(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t sub_100022544()
{
  return v0;
}

uint64_t sub_100022558()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for ScaleTextToFitWithLineHeight(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ScaleTextToFitWithLineHeight()
{
  return swift_release();
}

uint64_t initializeWithCopy for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScaleTextToFitWithLineHeight(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 48);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScaleTextToFitWithLineHeight(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 48) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScaleTextToFitWithLineHeight()
{
  return &type metadata for ScaleTextToFitWithLineHeight;
}

uint64_t sub_1000227CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000227E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v100 = a2;
  uint64_t v98 = sub_10000D85C(&qword_100041388);
  sub_100011958();
  __chkstk_darwin(v5, v6);
  sub_100011978();
  uint64_t v99 = v7;
  uint64_t v91 = sub_10000D85C(&qword_100041390);
  sub_100011958();
  __chkstk_darwin(v8, v9);
  sub_100011978();
  sub_1000119A4(v10);
  sub_10000D85C(&qword_100041398);
  sub_10001193C();
  uint64_t v92 = v12;
  uint64_t v93 = v11;
  __chkstk_darwin(v11, v13);
  sub_100011978();
  sub_1000119A4(v14);
  v86[3] = sub_10000D85C(&qword_1000413A0);
  sub_100011958();
  __chkstk_darwin(v15, v16);
  sub_100011978();
  sub_1000119A4(v17);
  v86[4] = sub_10000D85C(&qword_1000413A8);
  sub_100011958();
  __chkstk_darwin(v18, v19);
  sub_100011978();
  uint64_t v96 = v20;
  uint64_t v94 = sub_10000D85C(&qword_1000413B0);
  sub_100011958();
  __chkstk_darwin(v21, v22);
  sub_100011978();
  uint64_t v95 = v23;
  uint64_t v24 = sub_10000D85C(&qword_1000413B8);
  __chkstk_darwin(v24 - 8, v25);
  sub_100011978();
  uint64_t v97 = v26;
  uint64_t v27 = sub_10000D85C(&qword_1000413C0);
  sub_10001193C();
  uint64_t v29 = v28;
  __chkstk_darwin(v30, v31);
  uint64_t v33 = (char *)v86 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_10000D85C(&qword_1000413C8);
  sub_100011958();
  __chkstk_darwin(v35, v36);
  uint64_t v38 = (char *)v86 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86[1] = sub_10000D85C(&qword_1000413D0);
  sub_100011958();
  __chkstk_darwin(v39, v40);
  sub_100011978();
  uint64_t v101 = v41;
  v86[2] = sub_10000D85C(&qword_1000413D8);
  sub_100011958();
  __chkstk_darwin(v42, v43);
  sub_100011978();
  sub_1000119A4(v44);
  long long v104 = *(_OWORD *)(v2 + 32);
  uint64_t v105 = *(void *)(v2 + 48);
  long long v102 = *(_OWORD *)(v2 + 32);
  uint64_t v103 = *(void *)(v2 + 48);
  sub_10000D85C(&qword_1000413E0);
  sub_1000301F0();
  uint64_t v45 = sub_10000D85C(&qword_1000413E8);
  sub_10001148C(&qword_1000413F0, &qword_1000413E8);
  sub_100030110();
  uint64_t v46 = *(void *)(v2 + 8);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v38, v33, v27);
  uint64_t v48 = (uint64_t *)&v38[*(int *)(v34 + 36)];
  *uint64_t v48 = KeyPath;
  v48[1] = v46;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v33, v27);
  uint64_t v49 = *(void *)(v2 + 16);
  LOBYTE(KeyPath) = *(unsigned char *)(v2 + 24);
  uint64_t v50 = swift_getKeyPath();
  uint64_t v51 = v101;
  sub_10002330C((uint64_t)v38, v101, &qword_1000413C8);
  sub_100023618();
  uint64_t v53 = v51 + v52;
  *(void *)uint64_t v53 = v50;
  *(void *)(v53 + 8) = v49;
  *(unsigned char *)(v53 + 16) = KeyPath;
  sub_100014588((uint64_t)v38, &qword_1000413C8);
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = v89;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 16))(v89, a1, v45);
  uint64_t v56 = (uint64_t *)(v55 + *(int *)(v91 + 36));
  *uint64_t v56 = v54;
  v56[1] = 0x3FF0000000000000;
  sub_100023178();
  uint64_t v57 = v90;
  sub_100030110();
  sub_100014588(v55, &qword_100041390);
  uint64_t v58 = swift_getKeyPath();
  uint64_t v60 = v92;
  uint64_t v59 = v93;
  uint64_t v61 = v87;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 16))(v87, v57, v93);
  sub_100023618();
  uint64_t v63 = v61 + v62;
  *(void *)uint64_t v63 = v58;
  *(void *)(v63 + 8) = 1;
  *(unsigned char *)(v63 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v57, v59);
  uint64_t v64 = v96;
  sub_10002330C(v61, v96, &qword_1000413A0);
  sub_100023618();
  *(_WORD *)(v64 + v65) = 256;
  sub_100014588(v61, &qword_1000413A0);
  uint64_t v66 = swift_allocObject();
  long long v67 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v66 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v66 + 32) = v67;
  *(_OWORD *)(v66 + 48) = *(_OWORD *)(v3 + 32);
  *(void *)(v66 + 64) = *(void *)(v3 + 48);
  sub_100023368((uint64_t)&v105, (uint64_t)&v102, &qword_100041410);
  sub_10002327C((uint64_t)&v102);
  uint64_t v68 = sub_100030270();
  unint64_t v70 = v69;
  uint64_t v71 = v99;
  sub_10002330C(v64, v99, &qword_1000413A8);
  unint64_t v72 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v71 + *(int *)(v98 + 36));
  *unint64_t v72 = sub_1000230DC;
  v72[1] = 0;
  v72[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v68;
  v72[3] = v70;
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = sub_100023274;
  *(void *)(v73 + 24) = v66;
  uint64_t v74 = v95;
  sub_10002330C(v71, v95, &qword_100041388);
  uint64_t v75 = (uint64_t (**)(double *))(v74 + *(int *)(v94 + 36));
  *uint64_t v75 = sub_1000232E0;
  v75[1] = (uint64_t (*)(double *))v73;
  sub_100014588(v71, &qword_100041388);
  sub_100014588(v64, &qword_1000413A8);
  uint64_t v76 = v97;
  sub_10002330C(v74, v97, &qword_1000413B0);
  sub_100014588(v74, &qword_1000413B0);
  uint64_t v77 = sub_100030270();
  uint64_t v79 = v78;
  sub_100023618();
  uint64_t v80 = v88;
  uint64_t v82 = v88 + v81;
  sub_10002330C(v76, v88 + v81, &qword_1000413B8);
  uint64_t v83 = (uint64_t *)(v82 + *(int *)(sub_10000D85C(&qword_100041418) + 36));
  *uint64_t v83 = v77;
  v83[1] = v79;
  uint64_t v84 = v101;
  sub_10002330C(v101, v80, &qword_1000413D0);
  sub_100014588(v76, &qword_1000413B8);
  sub_100014588(v84, &qword_1000413D0);
  return sub_100023368(v80, v100, &qword_1000413D8);
}

uint64_t sub_100022FA0()
{
  return sub_100030200();
}

void sub_100022FFC()
{
  qword_100041378 = 0;
  unk_100041380 = 0;
}

uint64_t *sub_10002300C()
{
  if (qword_100040628 != -1) {
    swift_once();
  }
  return &qword_100041378;
}

double sub_100023058(_OWORD *a1, void (*a2)(long long *__return_ptr))
{
  a2(&v4);
  double result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_100023098()
{
  return 1;
}

__n128 sub_1000230A0@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = (__n128 *)sub_10002300C();
  __n128 result = *v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_1000230DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100030170();
  uint64_t result = sub_10002FCE0();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_10002311C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10002FDB0();
  *a1 = v3;
  return result;
}

uint64_t sub_100023148()
{
  return sub_10002FDC0();
}

unint64_t sub_100023178()
{
  unint64_t result = qword_1000413F8;
  if (!qword_1000413F8)
  {
    sub_10000D960(&qword_100041390);
    sub_10001148C(&qword_1000413F0, &qword_1000413E8);
    sub_10001148C(&qword_100041400, &qword_100041408);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000413F8);
  }
  return result;
}

uint64_t sub_10002323C()
{
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100023274()
{
  return sub_100022FA0();
}

uint64_t sub_10002327C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000232A8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000232E0(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_10002330C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D85C(a3);
  sub_100011958();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_100023368(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D85C(a3);
  sub_100011958();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for ViewSizingKey()
{
  return &type metadata for ViewSizingKey;
}

unint64_t sub_1000233D8()
{
  unint64_t result = qword_100041420;
  if (!qword_100041420)
  {
    sub_10000D960(&qword_1000413D8);
    sub_100023478();
    sub_10001148C(&qword_100041438, &qword_100041418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041420);
  }
  return result;
}

unint64_t sub_100023478()
{
  unint64_t result = qword_100041428;
  if (!qword_100041428)
  {
    sub_10000D960(&qword_1000413D0);
    sub_100023518();
    sub_10001148C(&qword_100040A50, &qword_100040A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041428);
  }
  return result;
}

unint64_t sub_100023518()
{
  unint64_t result = qword_100041430;
  if (!qword_100041430)
  {
    sub_10000D960(&qword_1000413C8);
    sub_10000D960(&qword_1000413E8);
    sub_10001148C(&qword_1000413F0, &qword_1000413E8);
    swift_getOpaqueTypeConformance2();
    sub_10001148C(&qword_100041400, &qword_100041408);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041430);
  }
  return result;
}

unint64_t sub_100023628()
{
  unint64_t result = qword_100041440;
  if (!qword_100041440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041440);
  }
  return result;
}

uint64_t sub_100023674()
{
  uint64_t v0 = sub_10002FAC0();
  sub_10000F530(v0, qword_1000446C0);
  sub_10000F4F8(v0, (uint64_t)qword_1000446C0);
  return sub_10002FA90();
}

uint64_t sub_1000236D8()
{
  if (qword_100040630 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002FAC0();

  return sub_10000F4F8(v0, (uint64_t)qword_1000446C0);
}

uint64_t sub_10002373C()
{
  return sub_10002F7A0();
}

uint64_t sub_100023760()
{
  unint64_t v0 = sub_100023628();

  return IntentParameterSummary.init(_:)(sub_1000237BC, 0, &type metadata for PhotosReliveWidgetConfiguration, v0);
}

uint64_t sub_1000237BC()
{
  swift_getKeyPath();
  sub_100023628();
  uint64_t v0 = sub_10002F8D0();
  swift_release();
  sub_10000D85C(&qword_100041268);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100031D30;
  *(void *)(v1 + 32) = v0;
  sub_100030660();
  swift_retain();
  uint64_t v2 = sub_10002F8C0();
  swift_release();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100023884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002373C();
  *a1 = result;
  return result;
}

uint64_t sub_1000238B0()
{
  sub_10002F950();
  sub_1000244C0();
  uint64_t v62 = v1;
  uint64_t v63 = v0;
  __chkstk_darwin(v0, v2);
  sub_100011978();
  uint64_t v61 = v3;
  sub_100024534();
  uint64_t v51 = sub_10002FAA0();
  sub_1000244C0();
  uint64_t v69 = v4;
  __chkstk_darwin(v5, v6);
  sub_100011978();
  uint64_t v60 = v7;
  sub_100024534();
  uint64_t v8 = sub_10002FBC0();
  uint64_t v9 = sub_1000119E8(v8);
  __chkstk_darwin(v9, v10);
  sub_100011978();
  uint64_t v59 = v11;
  sub_100024534();
  uint64_t v12 = sub_100030570();
  uint64_t v13 = sub_1000119E8(v12);
  __chkstk_darwin(v13, v14);
  sub_100011978();
  uint64_t v57 = v15;
  sub_100024534();
  uint64_t v67 = sub_10002F8F0();
  sub_1000244C0();
  uint64_t v17 = v16;
  __chkstk_darwin(v18, v19);
  sub_100024524();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_10000D85C(&qword_100041480);
  uint64_t v24 = sub_1000119E8(v23);
  uint64_t v26 = __chkstk_darwin(v24, v25);
  uint64_t v28 = (char *)v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26, v29);
  uint64_t v31 = (char *)v49 - v30;
  uint64_t v32 = sub_10000D85C(&qword_100041488);
  uint64_t v33 = sub_1000119E8(v32);
  __chkstk_darwin(v33, v34);
  sub_100024524();
  uint64_t v37 = v36 - v35;
  uint64_t v56 = sub_10002FAC0();
  __chkstk_darwin(v56, v38);
  sub_100024524();
  sub_10000D85C(&qword_100041490);
  sub_10002FA90();
  sub_1000244D8(v37);
  LOBYTE(v70) = 0;
  uint64_t v39 = sub_10002F750();
  uint64_t v64 = v31;
  sub_10000DA40((uint64_t)v31, 1, 1, v39);
  v49[0] = (uint64_t)v28;
  sub_1000244D8((uint64_t)v28);
  int v65 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v40 = *(void (**)(void))(v17 + 104);
  uint64_t v66 = v17 + 104;
  uint64_t v68 = v40;
  v49[1] = v22;
  v40(v22);
  sub_100024424();
  uint64_t v58 = sub_10002F7C0();
  uint64_t v53 = sub_10000D85C(&qword_1000414A0);
  unint64_t v55 = 0xD000000000000022;
  unint64_t v54 = 0x8000000100033B70;
  sub_100030520();
  sub_10002FBB0();
  int v50 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v41 = *(void *)(v69 + 104);
  v69 += 104;
  uint64_t v52 = v41;
  sub_100024518();
  v42();
  v49[2] = 0x8000000100032540;
  sub_100024540();
  sub_1000244F4();
  uint64_t v43 = v56;
  sub_10000DA40(v37, 1, 1, v56);
  uint64_t v72 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  sub_10000DA40((uint64_t)v64, 1, 1, v39);
  sub_1000244D8(v49[0]);
  sub_100024518();
  v44();
  sub_100024470();
  uint64_t v53 = sub_10002F7D0();
  sub_10000D85C(&qword_1000414B0);
  sub_100030520();
  sub_10002FBB0();
  sub_100024518();
  v45();
  sub_100024540();
  sub_1000244F4();
  sub_10000DA40(v37, 1, 1, v43);
  sub_100024518();
  v46();
  sub_1000244D8((uint64_t)v64);
  sub_100024518();
  v47();
  sub_10002F7B0();
  return v58;
}

unint64_t sub_100023E48()
{
  return 0xD000000000000027;
}

unint64_t sub_100023E68()
{
  unint64_t result = qword_100041448;
  if (!qword_100041448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041448);
  }
  return result;
}

unint64_t sub_100023EB8()
{
  unint64_t result = qword_100041450;
  if (!qword_100041450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041450);
  }
  return result;
}

unint64_t sub_100023F08()
{
  unint64_t result = qword_100041458;
  if (!qword_100041458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041458);
  }
  return result;
}

uint64_t sub_100023F54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100023F70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000236D8();
  uint64_t v3 = sub_10002FAC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_100023FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000214B8();
  *uint64_t v4 = v2;
  v4[1] = sub_1000240A0;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_1000240A0()
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

uint64_t sub_1000241A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000238B0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1000241D4(uint64_t a1)
{
  unint64_t v2 = sub_1000243D8();

  return static CustomIntentMigratedAppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for PhotosReliveWidgetConfiguration()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s18PhotosReliveWidget31PhotosReliveWidgetConfigurationVwCP_0(void *a1, void *a2)
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

void *assignWithCopy for PhotosReliveWidgetConfiguration(void *a1, void *a2)
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

uint64_t assignWithTake for PhotosReliveWidgetConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetConfiguration()
{
  return &type metadata for PhotosReliveWidgetConfiguration;
}

unint64_t sub_100024384()
{
  unint64_t result = qword_100041468;
  if (!qword_100041468)
  {
    sub_10000D960(&qword_100041470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041468);
  }
  return result;
}

unint64_t sub_1000243D8()
{
  unint64_t result = qword_100041478;
  if (!qword_100041478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041478);
  }
  return result;
}

unint64_t sub_100024424()
{
  unint64_t result = qword_100041498;
  if (!qword_100041498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041498);
  }
  return result;
}

unint64_t sub_100024470()
{
  unint64_t result = qword_1000414A8;
  if (!qword_1000414A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414A8);
  }
  return result;
}

uint64_t sub_1000244D8(uint64_t a1)
{
  return sub_10000DA40(a1, 1, 1, v1);
}

uint64_t sub_1000244F4()
{
  return sub_10002FAD0();
}

uint64_t sub_100024534()
{
  return 0;
}

uint64_t sub_100024540()
{
  return v0;
}

#error "100024804: call analysis failed (funcsize=177)"

uint64_t sub_100024850()
{
  uint64_t v0 = sub_1000305B0();
  uint64_t v2 = v1;
  if (v0 == sub_1000305B0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000309C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000248D8(__int16 a1, uint64_t a2, char a3, __int16 a4, uint64_t a5, char a6)
{
  if (a1 == a4)
  {
    if (a3)
    {
      if (a6) {
        return 1;
      }
    }
    else if ((a6 & 1) == 0 && *(double *)&a2 == *(double *)&a5)
    {
      return 1;
    }
  }
  return 0;
}

#error "100024A58: call analysis failed (funcsize=95)"

void sub_100024A9C()
{
  sub_1000221D0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000303B0();
  sub_10001193C();
  uint64_t v19 = v18;
  __chkstk_darwin(v20, v21);
  sub_10002241C();
  if (v10 == 1)
  {
    type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v0, v4, v17);
    swift_retain();
    id v27 = v12;
    sub_100024910(v27, v28, v8, v0);
LABEL_10:
    sub_10002A1E8();
    sub_1000221E8();
    return;
  }
  if (v10 == 2)
  {
    type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
    id v22 = v12;
    id v23 = [v22 contentType];
    sub_100029838(v22, (SEL *)&selRef_sourceIdentifier);
    uint64_t v24 = sub_10002A198();
    uint64_t v26 = v4;
    goto LABEL_8;
  }
  uint64_t v30 = v4;
  if (v10 != 3)
  {
    type metadata accessor for PhotosReliveWidgetViewModel(0);
    sub_1000293C8(v6, (uint64_t)v16);
    swift_retain();
    id v22 = v12;
    if (sub_1000252D8(v22, v10, v8, (uint64_t)v16, v2))
    {
LABEL_9:

      goto LABEL_10;
    }
    type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
    id v23 = [v22 contentType];
    sub_100029838(v22, (SEL *)&selRef_sourceIdentifier);
    uint64_t v24 = sub_10002A198();
    uint64_t v26 = v30;
LABEL_8:
    v25(v24, v26, v17);
    sub_100024554(v23, v10, v2, v0);
    goto LABEL_9;
  }
  sub_1000308E0();
  __break(1u);
}

double sub_100024D0C@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_1000303B0();
  sub_10001193C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6, v7);
  sub_100011A2C();
  uint64_t v37 = v8;
  uint64_t v11 = __chkstk_darwin(v9, v10);
  uint64_t v13 = (char *)&v32 - v12;
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v32 - v15;
  uint64_t v17 = (double *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetSize(0) + 20));
  double v18 = *v17;
  double v19 = v17[1];
  uint64_t v34 = (void (*)(char *, uint64_t, uint64_t))v5[2];
  v34(v16, a1, v3);
  uint64_t v33 = (void (*)(char *, void, uint64_t))v5[13];
  v33(v13, enum case for WidgetFamily.systemLarge(_:), v3);
  sub_100029B2C(&qword_100040BF0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10002A1B8();
  sub_10002A1B8();
  uint64_t v21 = v38;
  uint64_t v20 = v39;
  id v22 = (void (*)(void))v5[1];
  sub_10002A0BC();
  v22();
  uint64_t v35 = v16;
  v34(v37, (uint64_t)v16, v3);
  if (v20 == v21)
  {
    sub_10002A0BC();
    v22();
    double v23 = 2.0;
  }
  else
  {
    v33(v13, enum case for WidgetFamily.systemExtraLarge(_:), v3);
    sub_10002A1B8();
    sub_10002A1B8();
    uint64_t v25 = v38;
    uint64_t v24 = v39;
    sub_10002A0BC();
    v22();
    sub_10002A0BC();
    v22();
    double v23 = 2.0;
    if (v24 != v25)
    {
      id v26 = [self mainScreen];
      [v26 scale];
      double v23 = v27;
    }
  }
  double v28 = v19 + 2.0;
  double v29 = v18 + 2.0;
  sub_10002A0BC();
  v22();
  double result = v29 * v23;
  uint64_t v31 = v36;
  *uint64_t v36 = v29 * v23;
  v31[1] = v28 * v23;
  v31[2] = v29;
  v31[3] = v28;
  v31[4] = v23;
  return result;
}

uint64_t sub_100024FC4()
{
  sub_1000216F4(0, &qword_100041238);
  uint64_t result = sub_1000307B0();
  qword_1000446D8 = result;
  return result;
}

uint64_t sub_10002503C()
{
  uint64_t v0 = sub_100030720();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100030710();
  __chkstk_darwin(v5, v6);
  uint64_t v7 = sub_100030310();
  __chkstk_darwin(v7 - 8, v8);
  sub_1000216F4(0, &qword_100041288);
  sub_100030300();
  v10[1] = &_swiftEmptyArrayStorage;
  sub_100029B2C(&qword_1000417C0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000D85C(&qword_1000417C8);
  sub_10001148C(&qword_1000417D0, &qword_1000417C8);
  sub_100030830();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  uint64_t result = sub_100030750();
  qword_1000446E0 = result;
  return result;
}

void sub_1000252A0(void *a1@<X8>)
{
  *a1 = &off_10003DE40;
}

uint64_t sub_1000252B0(uint64_t a1, uint64_t a2)
{
  return sub_1000248D8(*(_WORD *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(_WORD *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

int64_t sub_1000252D8(void *a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v115 = a4;
  uint64_t v111 = a3;
  LODWORD(v104) = a2;
  uint64_t v7 = sub_10002FAF0();
  __chkstk_darwin(v7 - 8, v8);
  sub_100011978();
  uint64_t v107 = v9;
  id v106 = (id)sub_1000303B0();
  sub_10001193C();
  uint64_t v105 = v10;
  __chkstk_darwin(v11, v12);
  sub_100011978();
  uint64_t v109 = v13;
  uint64_t v112 = sub_10002FC60();
  sub_10001193C();
  uint64_t v15 = v14;
  __chkstk_darwin(v16, v17);
  double v19 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100040638 != -1) {
    swift_once();
  }
  uint64_t v20 = (void *)qword_1000446D8;
  uint64_t v114 = a1;
  id v21 = [(id)v114 assetLocalIdentifier];
  uint64_t v22 = sub_1000305B0();
  unint64_t v24 = v23;

  uint64_t v25 = v20;
  sub_10002FC40();
  sub_100030770();
  sub_10000D85C(&qword_100041340);
  uint64_t v26 = swift_allocObject();
  long long v113 = xmmword_1000311F0;
  *(_OWORD *)(v26 + 16) = xmmword_1000311F0;
  *(void *)(v26 + 56) = &type metadata for String;
  *(void *)(v26 + 64) = sub_100021E54();
  *(void *)(v26 + 32) = v22;
  *(void *)(v26 + 40) = v24;
  swift_bridgeObjectRetain();
  sub_10002FC20();
  swift_bridgeObjectRelease();
  uint64_t v110 = a5;
  id v27 = [a5 librarySpecificFetchOptions];
  [v27 setIncludeGuestAssets:1];
  double v28 = self;
  sub_10000D85C(&qword_100041258);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v113;
  *(void *)&long long v113 = v22;
  *(void *)(v29 + 32) = v22;
  *(void *)(v29 + 40) = v24;
  swift_bridgeObjectRetain();
  Class isa = sub_100030630().super.isa;
  swift_bridgeObjectRelease();
  id v31 = [v28 fetchAssetsWithLocalIdentifiers:isa options:v27];

  id v32 = [v31 firstObject];
  uint64_t v33 = v19;
  if (!v32)
  {
    uint64_t v61 = v115;
    if ((_BYTE)v104)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      os_log_type_t v83 = sub_1000306C0();
      if (os_log_type_enabled(v25, v83))
      {
        swift_bridgeObjectRetain();
        uint64_t v84 = (uint8_t *)swift_slowAlloc();
        *(double *)&uint64_t v85 = COERCE_DOUBLE(swift_slowAlloc());
        uint64_t v100 = v33;
        double v122 = *(double *)&v85;
        *(_DWORD *)uint64_t v84 = 136446210;
        swift_bridgeObjectRetain();
        v116[0] = sub_10001F274(v113, v24, (uint64_t *)&v122);
        sub_1000307C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v25, v83, "Error fetching asset for identifier %{public}s", v84, 0xCu);
        swift_arrayDestroy();
        sub_100022200();
        sub_100022200();

        sub_10002A160();
        id v86 = (id)v114;

        sub_10002A1D0();
        sub_100029900(v115);
        sub_10002A178();
        v87();
        return 0;
      }

      swift_bridgeObjectRelease();
    }
    sub_10002A160();
    id v88 = (id)v114;

    sub_10002A1D0();
    sub_100029900(v61);
    uint64_t v89 = sub_10002A148();
    v90(v89);
    return 0;
  }
  uint64_t v34 = v32;
  sub_100030760();
  sub_10002FC30();
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  uint64_t v35 = v115;
  sub_100024D0C(v115, &v122);
  *(double *)&uint64_t v36 = v122;
  double v37 = v123;
  uint64_t v104 = v124;
  uint64_t v103 = v125;
  long long v102 = v126;
  uint64_t v38 = type metadata accessor for PhotosReliveWidgetSize(0);
  double v39 = sub_10002629C(v34, *(double *)(v35 + *(int *)(v38 + 20)), *(double *)(v35 + *(int *)(v38 + 20) + 8));
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  unint64_t v47 = sub_100026320(v34, v39, v41, v43, v45, *(double *)&v36, v37);
  int v101 = v48;
  if (!v47)
  {
    swift_bridgeObjectRelease();

    sub_10002A160();
    id v62 = (id)v114;

    sub_10002A1D0();
    sub_100029900(v35);
    uint64_t v63 = sub_10002A148();
    v64(v63);
    return (int64_t)v47;
  }
  id v98 = v31;
  uint64_t v49 = v47;
  PFSharedFigDecodeSessionDiscardCachedBuffers();
  int64_t result = CGImageGetWidth(v49);
  id v51 = (id)v114;
  if ((~v36 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (*(double *)&v36 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (*(double *)&v36 >= 9.22337204e18)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v100 = v33;
  uint64_t v97 = v47;
  uint64_t v99 = v49;
  if (result < (uint64_t)*(double *)&v36) {
    goto LABEL_13;
  }
  int64_t result = CGImageGetHeight(v49);
  if ((~*(void *)&v37 & 0x7FF0000000000000) == 0) {
    goto LABEL_33;
  }
  if (v37 <= -9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v37 < 9.22337204e18)
  {
    if (result >= (uint64_t)v37)
    {
LABEL_20:
      id v95 = v27;
      id v65 = [v51 contentType];
      uint64_t v96 = v15;
      if (v65)
      {
        swift_bridgeObjectRelease();
        uint64_t v91 = 0;
        *(double *)&uint64_t v66 = 0.0;
        uint64_t v67 = v35;
        uint64_t v68 = 0;
        uint64_t v94 = 0;
        uint64_t v114 = 1;
        *(void *)&long long v113 = 2;
        uint64_t v93 = 2;
        LODWORD(v92) = 1;
      }
      else
      {
        uint64_t v114 = sub_100029838(v51, (SEL *)&selRef_title);
        sub_100029838(v51, (SEL *)&selRef_subtitle);
        id v69 = [v51 localIdentifier];
        sub_1000305B0();

        sub_1000269DC();
        *(void *)&long long v113 = LOBYTE(v116[0]);
        uint64_t v70 = BYTE1(v116[0]);
        uint64_t v66 = v116[1];
        uint64_t v114 = v117;
        uint64_t v93 = v118;
        uint64_t v71 = v119;
        uint64_t v94 = v120;
        LODWORD(v92) = v121;
        uint64_t v49 = v99;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v91 = v70 << 8;
        uint64_t v67 = v35;
        uint64_t v68 = v71 << 8;
      }
      v101 &= 1u;
      uint64_t v72 = v49;
      uint64_t v99 = (CGImage *)[v51 contentType];
      (*(void (**)(uint64_t, uint64_t, id))(v105 + 16))(v109, v67, v106);
      id v106 = v34;
      id v73 = [v51 deeplink];
      uint64_t v74 = v107;
      sub_10002FAE0();

      uint64_t v105 = sub_100029838(v51, (SEL *)&selRef_title);
      uint64_t v76 = v75;
      uint64_t v77 = sub_100029838(v51, (SEL *)&selRef_subtitle);
      uint64_t v79 = v78;
      *(void *)&double v122 = v91 | v113;
      double v123 = *(double *)&v66;
      uint64_t v124 = v114;
      uint64_t v125 = v68 | v93;
      uint64_t v126 = v94;
      char v127 = v92;
      uint64_t v80 = v51;
      uint64_t v81 = *(uint64_t (**)(CGImage *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, _BYTE, void *, uint64_t, uint64_t, void *, double *))(v108 + 160);
      uint64_t v82 = v72;
      unint64_t v47 = (void *)v81(v99, v109, v34, v74, v105, v76, v77, v79, v97, v101, v97, v104, v103, v102, &v122);

      sub_10002A160();
      sub_10002A1D0();
      sub_100029900(v115);
      (*(void (**)(char *, uint64_t))(v96 + 8))(v100, v112);

      return (int64_t)v47;
    }
LABEL_13:
    uint64_t v94 = v34;
    os_log_type_t v52 = sub_1000306E0();
    uint64_t v53 = v49;
    if (os_log_type_enabled(v25, v52))
    {
      swift_bridgeObjectRetain_n();
      unint64_t v54 = v53;
      LODWORD(v93) = v52;
      unint64_t v55 = v54;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      v116[0] = v92;
      *(_DWORD *)uint64_t v56 = 136446978;
      swift_bridgeObjectRetain();
      double v122 = COERCE_DOUBLE(sub_10001F274(v113, v24, v116));
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v56 + 12) = 2050;
      *(double *)&size_t v57 = COERCE_DOUBLE(CGImageGetWidth(v55));

      double v122 = *(double *)&v57;
      sub_1000307C0();

      *(_WORD *)(v56 + 22) = 2050;
      *(double *)&size_t v58 = COERCE_DOUBLE(CGImageGetHeight(v55));

      double v122 = *(double *)&v58;
      sub_1000307C0();

      *(_WORD *)(v56 + 32) = 2082;
      double v122 = *(double *)&v36;
      double v123 = v37;
      type metadata accessor for CGSize(0);
      uint64_t v59 = sub_1000305C0();
      double v122 = COERCE_DOUBLE(sub_10001F274(v59, v60, v116));
      id v51 = (id)v114;
      sub_1000307C0();
      uint64_t v35 = v115;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, (os_log_type_t)v93, "scaling up image for %{public}s because loaded size %{public}ld,%{public}ld is not targetSize %{public}s", (uint8_t *)v56, 0x2Au);
      swift_arrayDestroy();
      sub_100022200();
      sub_100022200();
    }
    else
    {
    }
    uint64_t v34 = v94;
    uint64_t v49 = v99;
    goto LABEL_20;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_100025FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100029FE0(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v9 = sub_10002A038();
  sub_10002600C(v9, v10, v11, v12, v13, v14, v15, v16, v18, v19, v20, v21, v22, v23);
  return v8;
}

uint64_t sub_10002600C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, long long a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100029898(a14, (uint64_t)v45);
  char v35 = v46;
  unint64_t v43 = v47;
  unint64_t v44 = v45[0];
  uint64_t v37 = v45[1];
  uint64_t v38 = v48;
  char v36 = v49;
  *(void *)(v14 + 16) = a1;
  uint64_t v19 = sub_1000303B0();
  sub_10002A0A4();
  uint64_t v21 = v20;
  sub_1000119DC();
  v22();
  *(void *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_asset) = a3;
  sub_10002FAF0();
  sub_10002A0A4();
  sub_1000119DC();
  v23();
  unint64_t v24 = (void *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  *unint64_t v24 = a5;
  v24[1] = a6;
  uint64_t v25 = (void *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle);
  void *v25 = a7;
  v25[1] = a8;
  *(void *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image) = a9;
  *(unsigned char *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded) = a10;
  uint64_t v26 = v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_layoutDescription;
  *(_OWORD *)uint64_t v26 = a11;
  *(void *)(v26 + 16) = a12;
  *(void *)(v26 + 24) = a13;
  sub_100029898(a14, (uint64_t)v50);
  if ((unint64_t)v50[1] << 8 == 768)
  {
    LOBYTE(v42) = 0;
    uint64_t v27 = 0;
    LOBYTE(v28) = 0;
    uint64_t v29 = 0;
    char v30 = 1;
    LOBYTE(v44) = 2;
    LOBYTE(v43) = 2;
    char v31 = 1;
  }
  else
  {
    unint64_t v42 = v44 >> 8;
    char v30 = v35 & 1;
    unint64_t v28 = v43 >> 8;
    char v31 = v36 & 1;
    uint64_t v27 = v37;
    uint64_t v29 = v38;
  }
  sub_10002A1AC();
  v32();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a2, v19);
  uint64_t v33 = v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout;
  *(unsigned char *)uint64_t v33 = v44;
  *(unsigned char *)(v33 + 1) = v42;
  *(void *)(v33 + 8) = v27;
  *(unsigned char *)(v33 + 16) = v30;
  *(unsigned char *)(v33 + 24) = v43;
  *(unsigned char *)(v33 + 25) = v28;
  *(void *)(v33 + 32) = v29;
  *(unsigned char *)(v33 + 40) = v31;
  return v14;
}

double sub_10002629C(void *a1, double a2, double a3)
{
  double v6 = (double)(uint64_t)[a1 pixelWidth];
  [a1 pixelHeight];
  [a1 suggestedCropForTargetSize:a2, a3];
  return v7 / v6;
}

void *sub_100026320(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v14 = [a1 localIdentifier];
  uint64_t v15 = sub_1000305B0();
  unint64_t v17 = v16;

  uint64_t v18 = sub_1000272D8(a1, a2, a3, a4, a5, a6, a7);
  if (v18)
  {
    uint64_t v20 = v18;
    id v21 = v18;
    os_log_type_t v22 = sub_1000306B0();
    if (qword_100040638 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_1000446D8;
    os_log_type_t v24 = v22;
    if (os_log_type_enabled((os_log_t)qword_1000446D8, v22))
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136446210;
      swift_bridgeObjectRetain();
      sub_10001F274(v15, v17, &v47);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Loaded local image for asset %{public}s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v26 = v19;
    os_log_type_t v27 = sub_1000306B0();
    if (qword_100040638 != -1) {
      swift_once();
    }
    unint64_t v28 = &unk_100044000;
    uint64_t v29 = qword_1000446D8;
    if (os_log_type_enabled((os_log_t)qword_1000446D8, v27))
    {
      swift_bridgeObjectRetain_n();
      char v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)char v30 = 136446210;
      swift_bridgeObjectRetain();
      sub_10001F274(v15, v17, &v47);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v27, "Failed to load local image for asset %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      unint64_t v28 = &unk_100044000;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    os_log_type_t v31 = sub_1000306B0();
    id v32 = qword_1000446D8;
    BOOL v33 = os_log_type_enabled((os_log_t)qword_1000446D8, v31);
    if (v26)
    {
      if (v33)
      {
        swift_bridgeObjectRetain();
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 136446210;
        swift_bridgeObjectRetain();
        sub_10001F274(v15, v17, &v47);
        unint64_t v28 = &unk_100044000;
        sub_1000307C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v32, v31, "Attempting to load cloud image for asset %{public}s", v34, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      char v36 = sub_1000279F4(a1, a2, a3, a4, a5, a6, a7);
      if (v36) {
        return v36;
      }
    }
    else if (v33)
    {
      swift_bridgeObjectRetain();
      char v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)char v35 = 136446210;
      swift_bridgeObjectRetain();
      sub_10001F274(v15, v17, &v47);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v32, v31, "No cloud image available for asset %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    os_log_type_t v37 = sub_1000306C0();
    uint64_t v38 = *((void *)v28 + 219);
    os_log_type_t v39 = v37;
    if (os_log_type_enabled(v38, v37))
    {
      id v40 = a1;
      double v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)double v41 = 136446210;
      id v42 = [v40 localIdentifier];
      uint64_t v43 = sub_1000305B0();
      unint64_t v45 = v44;

      sub_10001F274(v43, v45, &v47);
      sub_1000307C0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Could not load any image for asset %{public}s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    return 0;
  }
  return v20;
}

void sub_1000269DC()
{
  sub_1000221D0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v47 = v5;
  uint64_t v48 = v4;
  uint64_t v7 = v6;
  v46[1] = v8;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = sub_1000303B0();
  sub_10001193C();
  uint64_t v15 = v14;
  uint64_t v18 = __chkstk_darwin(v16, v17);
  uint64_t v20 = (char *)v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v21);
  if (!v10 || !v1) {
    goto LABEL_15;
  }
  sub_1000216F4(0, &qword_1000417A8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v23 = sub_1000297B8(v3, v1, ObjCClassFromMetadata);
  if (!v24)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v25 = v23;
  NSString v26 = sub_100030580();
  v46[0] = v25;
  NSString v27 = sub_100030580();
  uint64_t v28 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID();

  switch(v28)
  {
    case 0:
      swift_bridgeObjectRelease();
LABEL_15:
      char v40 = 0;
      char v36 = 0;
      char v32 = 2;
      char v41 = 2;
      goto LABEL_16;
    case 2:
      uint64_t v49 = v7;
      uint64_t v50 = v47;
      sub_10000F204();
      uint64_t v29 = sub_100030800();
      if ((v29 & 0x8000000000000000) == 0 || (v30 = __OFSUB__(0, v29), uint64_t v29 = -v29, !v30))
      {
        uint64_t v31 = v29 % 4;
        char v32 = v29 % 4 < 3;
        sub_1000119DC();
        v33();
        (*(void (**)(char *, void, uint64_t))(v15 + 104))(v20, enum case for WidgetFamily.systemSmall(_:), v13);
        sub_100029B2C(&qword_1000417B0, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
        char v34 = sub_100030510();
        char v35 = *(void (**)(void))(v15 + 8);
        sub_10002A178();
        v35();
        sub_10002A178();
        v35();
        if (v48 && (v34 & 1) == 0)
        {
          NSString v43 = sub_100030580();
          NSString v44 = sub_100030580();
          swift_bridgeObjectRelease();
          BOOL v45 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID() == 2;

          char v36 = 2 * v45;
        }
        else
        {
          swift_bridgeObjectRelease();
          char v36 = 0;
        }
        char v40 = 2;
        if (v31 >= 3) {
          char v41 = 2;
        }
        else {
          char v41 = 3;
        }
        goto LABEL_16;
      }
      goto LABEL_27;
    case 1:
      if (v48)
      {
        NSString v37 = sub_100030580();
        NSString v38 = sub_100030580();
        swift_bridgeObjectRelease();
        uint64_t v39 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID();

        if (v39 != 1) {
          goto LABEL_15;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v49 = v7;
      uint64_t v50 = v47;
      sub_10000F204();
      uint64_t v42 = sub_100030800();
      if (v42 < 0)
      {
        BOOL v30 = __OFSUB__(0, v42);
        uint64_t v42 = -v42;
        if (v30) {
          goto LABEL_28;
        }
      }
      if (v42 % 4 < 0)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      char v32 = *((unsigned char *)&off_10003DDF0 + v42 % 4 + 32);
      char v40 = 1;
      char v41 = v32;
      char v36 = 1;
LABEL_16:
      *(unsigned char *)uint64_t v12 = v32;
      *(unsigned char *)(v12 + 1) = v40;
      *(void *)(v12 + 8) = 0;
      *(unsigned char *)(v12 + 16) = 1;
      *(unsigned char *)(v12 + 24) = v41;
      *(unsigned char *)(v12 + 25) = v36;
      *(void *)(v12 + 32) = 0;
      *(unsigned char *)(v12 + 40) = 1;
      sub_1000221E8();
      return;
  }
LABEL_30:
  sub_1000308E0();
  __break(1u);
}

id sub_100026DDC(id result)
{
  if (result) {
    return [result CGImage];
  }
  return result;
}

void sub_100026E08(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3)
  {
    char v19 = sub_1000305B0();
    sub_100030860();
    sub_100027274((uint64_t)v21, a3, &v22);
    sub_100029A7C((uint64_t)v21);
    uint64_t v6 = &unk_100044000;
    if (v23)
    {
      if swift_dynamicCast() && (v19)
      {
        os_log_type_t v7 = sub_1000306B0();
        if (qword_100040638 != -1) {
          swift_once();
        }
        uint64_t v8 = qword_1000446D8;
        if (os_log_type_enabled((os_log_t)qword_1000446D8, v7))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          v21[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v9 = 136446210;
          swift_bridgeObjectRetain();
          *(void *)&long long v22 = sub_10001F274(a1, a2, v21);
          sub_1000307C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v8, v7, "Cancelled image load for asset %{public}s", v9, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v6 = &unk_100044000;
          swift_slowDealloc();
        }
      }
    }
    else
    {
      sub_100029A1C((uint64_t)&v22);
    }
    uint64_t v20 = (void *)sub_1000305B0();
    sub_100030860();
    sub_100027274((uint64_t)v21, a3, &v22);
    sub_100029A7C((uint64_t)v21);
    if (v23)
    {
      sub_1000216F4(0, &qword_1000417B8);
      if (swift_dynamicCast())
      {
        os_log_type_t v10 = sub_1000306C0();
        if (qword_100040638 != -1) {
          swift_once();
        }
        uint64_t v11 = *((void *)v6 + 219);
        if (os_log_type_enabled(v11, v10))
        {
          swift_bridgeObjectRetain_n();
          id v12 = v20;
          uint64_t v13 = swift_slowAlloc();
          v21[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v13 = 136446466;
          swift_bridgeObjectRetain();
          *(void *)&long long v22 = sub_10001F274(a1, a2, v21);
          sub_1000307C0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v13 + 12) = 2082;
          id v14 = v12;
          id v15 = [v14 description];
          uint64_t v16 = sub_1000305B0();
          unint64_t v18 = v17;

          *(void *)&long long v22 = sub_10001F274(v16, v18, v21);
          sub_1000307C0();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v11, v10, "Error loading image for asset %{public}s: %{public}s", (uint8_t *)v13, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
      }
    }
    else
    {
      sub_100029A1C((uint64_t)&v22);
    }
  }
}

double sub_100027274@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10002942C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100021EF0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void *sub_1000272D8(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14 = sub_10002FC60();
  uint64_t v53 = *(void *)(v14 - 8);
  uint64_t v54 = v14;
  uint64_t v16 = __chkstk_darwin(v14, v15);
  os_log_type_t v52 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v45 - v19;
  id v51 = a1;
  id v21 = [a1 localIdentifier];
  uint64_t v22 = sub_1000305B0();
  uint64_t v24 = v23;

  uint64_t v25 = swift_allocObject();
  uint64_t v46 = v25;
  *(void *)(v25 + 16) = 0;
  uint64_t v50 = v25 + 16;
  uint64_t v26 = swift_allocObject();
  uint64_t v45 = v26;
  *(unsigned char *)(v26 + 16) = 0;
  uint64_t v49 = v26 + 16;
  id v47 = [self defaultManager];
  id v27 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v27 setSynchronous:1];
  [v27 setNetworkAccessAllowed:0];
  [v27 setNormalizedCropRect:a2, a3, a4, a5];
  [v27 setResizeMode:2];
  [v27 setDeliveryMode:1];
  [v27 setLoadingMode:6291456];
  if (qword_100040638 != -1) {
    swift_once();
  }
  id v28 = (id)qword_1000446D8;
  sub_10002FC40();
  sub_100030770();
  sub_10000D85C(&qword_100041340);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1000311D0;
  *(void *)(v29 + 56) = &type metadata for String;
  unint64_t v30 = sub_100021E54();
  *(void *)(v29 + 64) = v30;
  *(void *)(v29 + 32) = v22;
  *(void *)(v29 + 40) = v24;
  aBlock = *(void ***)&a6;
  uint64_t v56 = *(void *)&a7;
  type metadata accessor for CGSize(0);
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_1000305C0();
  *(void *)(v29 + 96) = &type metadata for String;
  *(void *)(v29 + 104) = v30;
  *(void *)(v29 + 72) = v31;
  *(void *)(v29 + 80) = v32;
  BOOL v33 = v20;
  sub_10002FC20();
  swift_bridgeObjectRelease();
  char v34 = (void *)swift_allocObject();
  v34[2] = v48;
  v34[3] = v22;
  uint64_t v35 = v46;
  v34[4] = v24;
  v34[5] = v35;
  void v34[6] = v45;
  uint64_t v59 = sub_100029BBC;
  unint64_t v60 = v34;
  aBlock = _NSConcreteStackBlock;
  uint64_t v56 = 1107296256;
  size_t v57 = sub_100027948;
  size_t v58 = &unk_10003EA90;
  char v36 = _Block_copy(&aBlock);
  id v37 = v27;
  swift_retain();
  swift_retain();
  swift_release();
  id v38 = v47;
  [v47 requestImageForAsset:v51 targetSize:1 contentMode:v37 options:v36 resultHandler:a6 a7];
  _Block_release(v36);

  sub_100030760();
  uint64_t v39 = v52;
  sub_10002FC50();
  sub_10002FC30();

  uint64_t v40 = v54;
  char v41 = *(void (**)(char *, uint64_t))(v53 + 8);
  v41(v39, v54);
  v41(v33, v40);
  swift_beginAccess();
  uint64_t v42 = *(void **)(v35 + 16);
  swift_beginAccess();
  id v43 = v42;
  swift_release();
  swift_release();
  return v42;
}

uint64_t sub_100027810(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_100026E08(a4, a5, a2);
  id v11 = sub_100026DDC(a1);
  swift_beginAccess();
  id v12 = *(void **)(a6 + 16);
  *(void *)(a6 + 16) = v11;

  if (!a2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    goto LABEL_6;
  }
  *(void *)&long long v17 = sub_1000305B0();
  *((void *)&v17 + 1) = v13;
  sub_100030860();
  sub_100027274((uint64_t)v16, a2, &v17);
  sub_100029A7C((uint64_t)v16);
  if (!*((void *)&v18 + 1))
  {
LABEL_6:
    sub_100029A1C((uint64_t)&v17);
    goto LABEL_7;
  }
  if (!swift_dynamicCast())
  {
LABEL_7:
    char v14 = 0;
    goto LABEL_8;
  }
  char v14 = v16[0];
LABEL_8:
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(a7 + 16) = v14;
  return result;
}

uint64_t sub_100027948(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = sub_1000304E0();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_1000279F4(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  p_Class isa = (void *)sub_1000302C0();
  uint64_t v86 = *(p_isa - 1);
  __chkstk_darwin(p_isa, v14);
  uint64_t v82 = (uint64_t *)((char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v90 = sub_100030330();
  uint64_t v94 = *(void *)(v90 - 8);
  uint64_t v17 = __chkstk_darwin(v90, v16);
  uint64_t v85 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v92 = (char *)&v78 - v20;
  uint64_t v81 = sub_10002FC60();
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81, v21);
  uint64_t v23 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v89 = a1;
  id v24 = [a1 localIdentifier];
  uint64_t v25 = sub_1000305B0();
  unint64_t v27 = v26;

  uint64_t v28 = swift_allocObject();
  uint64_t v95 = v28;
  *(void *)(v28 + 16) = 0;
  uint64_t v93 = (id *)(v28 + 16);
  id v91 = [self defaultManager];
  dispatch_semaphore_t v83 = dispatch_semaphore_create(0);
  if (qword_100040638 != -1) {
    swift_once();
  }
  id v29 = (id)qword_1000446D8;
  sub_10002FC40();
  sub_100030770();
  sub_10000D85C(&qword_100041340);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_1000311D0;
  *(void *)(v30 + 56) = &type metadata for String;
  unint64_t v31 = sub_100021E54();
  *(void *)(v30 + 64) = v31;
  *(void *)(v30 + 32) = v25;
  *(void *)(v30 + 40) = v27;
  uint64_t aBlock = *(void *)&a6;
  uint64_t v99 = *(void *)&a7;
  type metadata accessor for CGSize(0);
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1000305C0();
  *(void *)(v30 + 96) = &type metadata for String;
  *(void *)(v30 + 104) = v31;
  *(void *)(v30 + 72) = v32;
  *(void *)(v30 + 80) = v33;
  uint64_t v79 = v23;
  sub_10002FC20();
  swift_bridgeObjectRelease();
  id v34 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v34 setSynchronous:0];
  [v34 setNetworkAccessAllowed:1];
  [v34 setNormalizedCropRect:a2, a3, a4, a5];
  [v34 setResizeMode:2];
  [v34 setDeliveryMode:0];
  [v34 setAllowSecondaryDegradedImage:1];
  if (qword_100040640 != -1) {
    swift_once();
  }
  [v34 setResultHandlerQueue:qword_1000446E0];
  [v34 setDownloadIntent:1];
  [v34 setLoadingMode:6291456];
  uint64_t v35 = swift_allocObject();
  *(unsigned char *)(v35 + 16) = 0;
  uint64_t v87 = (unsigned char *)(v35 + 16);
  sub_1000306B0();
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1000311F0;
  *(void *)(v36 + 56) = &type metadata for String;
  *(void *)(v36 + 64) = v31;
  *(void *)(v36 + 32) = v25;
  *(void *)(v36 + 40) = v27;
  swift_bridgeObjectRetain();
  sub_10002FC10();
  swift_bridgeObjectRelease();
  id v37 = (void *)swift_allocObject();
  v37[2] = v84;
  v37[3] = v25;
  uint64_t v78 = v25;
  dispatch_semaphore_t v38 = v83;
  v37[4] = v27;
  v37[5] = v38;
  v37[6] = v95;
  v37[7] = v35;
  long long v102 = sub_1000299F4;
  uint64_t v103 = v37;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v99 = 1107296256;
  uint64_t v100 = sub_100027948;
  int v101 = &unk_10003EA40;
  uint64_t v39 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  id v40 = v34;
  char v41 = v38;
  swift_retain();
  uint64_t v84 = v35;
  swift_retain();
  swift_release();
  id v42 = v91;
  id v43 = [v91 requestImageForAsset:v89 targetSize:1 contentMode:v40 options:v39 resultHandler:a6 a7];
  _Block_release(v39);
  id v89 = v40;

  NSString v44 = v85;
  sub_100030320();
  uint64_t v45 = v82;
  *uint64_t v82 = 10;
  uint64_t v46 = v86;
  id v47 = p_isa;
  (*(void (**)(void *, void, void *))(v86 + 104))(v45, enum case for DispatchTimeInterval.seconds(_:), p_isa);
  uint64_t v48 = v92;
  sub_100030340();
  (*(void (**)(void *, void *))(v46 + 8))(v45, v47);
  uint64_t v49 = v94 + 8;
  uint64_t v50 = v90;
  uint64_t v86 = *(void *)(v94 + 8);
  ((void (*)(char *, uint64_t))v86)(v44, v90);
  p_Class isa = &v41->isa;
  sub_100030780();
  if (sub_1000302D0())
  {
    os_log_type_t v51 = sub_1000306C0();
    os_log_type_t v52 = qword_1000446D8;
    os_log_type_t v53 = v51;
    if (os_log_type_enabled((os_log_t)qword_1000446D8, v51))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v94 = v49;
      unint64_t v55 = (uint8_t *)v54;
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)unint64_t v55 = 136446210;
      swift_bridgeObjectRetain();
      v97[3] = sub_10001F274(v78, v27, &aBlock);
      uint64_t v50 = v90;
      id v42 = v91;
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "Timed out loading cloud image for asset %{public}s", v55, 0xCu);
      swift_arrayDestroy();
      uint64_t v48 = v92;
      swift_slowDealloc();
      uint64_t v49 = v94;
      swift_slowDealloc();
    }
    [v42 cancelImageRequest:v43];
  }
  uint64_t v56 = v87;
  swift_beginAccess();
  if (*v56) {
    goto LABEL_10;
  }
  unint64_t v60 = v93;
  swift_beginAccess();
  if (*v60)
  {
    id v61 = *v60;
    os_log_type_t v62 = sub_1000306C0();
    uint64_t v63 = qword_1000446D8;
    id v64 = v61;
    if (os_log_type_enabled(v63, v62))
    {
      id v65 = v64;
      swift_bridgeObjectRetain();
      id v64 = v65;
      uint64_t v66 = swift_slowAlloc();
      uint64_t v94 = v49;
      uint64_t v67 = v66;
      v97[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v67 = 136446722;
      swift_bridgeObjectRetain();
      uint64_t v96 = sub_10001F274(v78, v27, v97);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v67 + 12) = 2050;
      size_t Width = CGImageGetWidth((CGImageRef)v64);

      uint64_t v96 = Width;
      sub_1000307C0();

      *(_WORD *)(v67 + 22) = 2050;
      size_t Height = CGImageGetHeight((CGImageRef)v64);

      uint64_t v96 = Height;
      uint64_t v50 = v90;
      id v42 = v91;
      sub_1000307C0();

      _os_log_impl((void *)&_mh_execute_header, v63, v62, "Using degraded quality for asset %{public}s; variant %{public}ld x %{public}ld",
        (uint8_t *)v67,
        0x20u);
      swift_arrayDestroy();
      uint64_t v48 = v92;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v57 = v81;
    uint64_t v58 = v80;
    uint64_t v59 = v79;
    goto LABEL_19;
  }
  os_log_type_t v70 = sub_1000306C0();
  uint64_t v71 = qword_1000446D8;
  os_log_type_t v72 = v70;
  if (!os_log_type_enabled((os_log_t)qword_1000446D8, v70))
  {
LABEL_10:
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    id v73 = (uint8_t *)swift_slowAlloc();
    v97[0] = swift_slowAlloc();
    *(_DWORD *)id v73 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v96 = sub_10001F274(v78, v27, v97);
    id v42 = v91;
    uint64_t v48 = v92;
    sub_1000307C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v71, v72, "No degraded quality available for asset %{public}s;",
      v73,
      0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v57 = v81;
  uint64_t v58 = v80;
  uint64_t v59 = v79;
LABEL_19:
  sub_100030760();
  sub_10002FC30();

  ((void (*)(char *, uint64_t))v86)(v48, v50);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v57);
  uint64_t v74 = v93;
  swift_beginAccess();
  uint64_t v75 = *v74;
  if (v75) {
    id v76 = v75;
  }
  swift_release();
  swift_release();
  return v75;
}

void sub_100028710(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100026E08(a4, a5, a2);
  if (a1)
  {
    id v14 = sub_100026DDC(a1);
    swift_beginAccess();
    uint64_t v15 = *(void **)(a7 + 16);
    *(void *)(a7 + 16) = v14;

    swift_beginAccess();
    uint64_t v16 = *(void **)(a7 + 16);
    if (!v16) {
      return;
    }
    if (a2)
    {
      sub_1000305B0();
      id v17 = v16;
      sub_100030860();
      sub_100027274((uint64_t)v30, a2, &v31);
      sub_100029A7C((uint64_t)v30);
      if (*((void *)&v32 + 1))
      {
        if swift_dynamicCast() && (v30[0])
        {
          os_log_type_t v18 = sub_1000306B0();
          if (qword_100040638 != -1) {
            swift_once();
          }
          uint64_t v19 = qword_1000446D8;
          id v20 = v17;
          if (os_log_type_enabled(v19, v18))
          {
            swift_bridgeObjectRetain_n();
            id v20 = v20;
            uint64_t v21 = swift_slowAlloc();
            v30[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v21 = 134349570;
            *(void *)&long long v31 = CGImageGetWidth((CGImageRef)v20);
            sub_1000307C0();
            *(_WORD *)(v21 + 12) = 2050;
            size_t Height = CGImageGetHeight((CGImageRef)v20);

            *(void *)&long long v31 = Height;
            sub_1000307C0();

            *(_WORD *)(v21 + 22) = 2082;
            swift_bridgeObjectRetain();
            *(void *)&long long v31 = sub_10001F274(a4, a5, v30);
            sub_1000307C0();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v19, v18, "Recieved degraded quality (%{public}ld x %{public}ld) cloud image for asset %{public}s", (uint8_t *)v21, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          return;
        }
        goto LABEL_18;
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      id v26 = v16;
    }
    sub_100029A1C((uint64_t)&v31);
LABEL_18:
    swift_beginAccess();
    *(unsigned char *)(a8 + 16) = 1;
    os_log_type_t v27 = sub_1000306B0();
    if (qword_100040638 != -1) {
      swift_once();
    }
    uint64_t v28 = qword_1000446D8;
    if (os_log_type_enabled((os_log_t)qword_1000446D8, v27))
    {
      swift_bridgeObjectRetain_n();
      id v29 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v31 = swift_slowAlloc();
      *(_DWORD *)id v29 = 136446210;
      swift_bridgeObjectRetain();
      sub_10001F274(a4, a5, (uint64_t *)&v31);
      sub_1000307C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v28, v27, "Recieved final cloud image for asset %{public}s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    sub_100030790();

    return;
  }
  os_log_type_t v23 = sub_1000306B0();
  if (qword_100040638 != -1) {
    swift_once();
  }
  id v24 = qword_1000446D8;
  if (os_log_type_enabled((os_log_t)qword_1000446D8, v23))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    v30[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)&long long v31 = sub_10001F274(a4, a5, v30);
    sub_1000307C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v24, v23, "Recieved callback but no cloud image for asset %{public}s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  sub_100030790();
}

uint64_t sub_100028CD4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily;
  sub_1000303B0();
  sub_10002A184();
  (*(void (**)(uint64_t))(v2 + 8))(v1);

  uint64_t v3 = v0 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  sub_10002FAF0();
  sub_10002A184();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_100028DBC()
{
  sub_100028CD4();
  sub_10002A0CC();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

uint64_t sub_100028DF4()
{
  return type metadata accessor for PhotosReliveWidgetViewModel(0);
}

uint64_t type metadata accessor for PhotosReliveWidgetViewModel(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_1000414E0);
}

uint64_t sub_100028E1C()
{
  uint64_t result = sub_1000303B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10002FAF0();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_100028F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100029FE0(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v9 = sub_10002A038();
  sub_100028FB0(v9, v10, v11, v12, v13, v14, v15, v16, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35);
  return v8;
}

uint64_t sub_100028F84()
{
  return type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
}

uint64_t type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_1000415D8);
}

void sub_100028FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,long long a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_1000221D0();
  uint64_t v46 = v28;
  uint64_t v47 = v29;
  uint64_t v44 = v30;
  uint64_t v45 = v31;
  uint64_t v42 = v32;
  uint64_t v43 = v33;
  sub_10002FAF0();
  sub_10001193C();
  __chkstk_darwin(v34, v35);
  sub_10002A12C();
  sub_1000303B0();
  sub_10001193C();
  __chkstk_darwin(v36, v37);
  sub_100011A40();
  sub_1000119DC();
  v38();
  sub_1000119DC();
  v39();
  sub_10002600C(v42, v27, v43, v26, v44, v45, v46, v47, a21, a22, a23, a24, a25, a26);
  sub_10002A1AC();
  v40();
  sub_10002A178();
  v41();
  sub_10002A1E8();
  sub_1000221E8();
}

uint64_t sub_100029138()
{
  return type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
}

uint64_t type metadata accessor for PhotosReliveWidgetFallbackViewModel(uint64_t a1)
{
  return sub_10000F5B4(a1, qword_1000416D0);
}

uint64_t sub_100029160()
{
  return swift_updateClassMetadata2();
}

__n128 sub_100029198(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1000291AC(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 1);
      BOOL v4 = v3 >= 3;
      int v2 = v3 - 3;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000291E8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 1) = a2 + 2;
    }
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleSubtitleLayout()
{
}

void sub_100029244(id *a1)
{
}

uint64_t sub_10002924C(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v4 = v3;
  return a1;
}

uint64_t sub_10002928C(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 sub_1000292E8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000292F4(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t sub_10002933C(uint64_t *a1, int a2)
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

uint64_t sub_10002937C(uint64_t result, int a2, int a3)
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

void type metadata accessor for PhotosReliveWidgetViewModel.LayoutDescription()
{
}

uint64_t sub_1000293C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotosReliveWidgetSize(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002942C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100030840(*(void *)(v2 + 40));

  return sub_100029558(a1, v4);
}

unint64_t sub_100029470(char a1)
{
  char v2 = a1 & 1;
  sub_1000309F0();
  sub_100030A00(a1 & 1);
  Swift::Int v3 = sub_100030A10();

  return sub_100029620(v2, v3);
}

unint64_t sub_1000294E0(uint64_t a1, uint64_t a2)
{
  sub_1000309F0();
  sub_1000305E0();
  Swift::Int v4 = sub_100030A10();

  return sub_1000296D4(a1, a2, v4);
}

unint64_t sub_100029558(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100029AD0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100030850();
      sub_100029A7C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100029620(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000296D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000309C0() & 1) == 0)
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
      while (!v14 && (sub_1000309C0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000297B8(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100030580();
  id v5 = [a3 uuidFromLocalIdentifier:v4];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = sub_1000305B0();

  return v6;
}

uint64_t sub_100029838(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_1000305B0();

  return v4;
}

uint64_t sub_100029898(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D85C(&qword_1000417A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100029900(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PhotosReliveWidgetSize(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002995C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100029994()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000299A4()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000299F4(void *a1, uint64_t a2)
{
  sub_100028710(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_100029A04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100029A14()
{
  return swift_release();
}

uint64_t sub_100029A1C(uint64_t a1)
{
  uint64_t v2 = sub_10000D85C(&qword_100041310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100029A7C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100029AD0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100029B2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100029B74()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100029BBC(void *a1, uint64_t a2)
{
  return sub_100027810(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

__n128 sub_100029BCC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_100029BE0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 1);
      BOOL v4 = v3 >= 3;
      int v2 = v3 - 3;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100029C1C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 1) = a2 + 2;
    }
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleLayout()
{
}

unsigned char *sub_100029C6C(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x100029D38);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleLayout.Style()
{
}

uint64_t sub_100029D6C(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_100029DF4(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x100029EC0);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleLayout.Position()
{
}

uint64_t sub_100029EF4()
{
  return sub_10001148C(&qword_1000417D8, &qword_1000417E0);
}

unint64_t sub_100029F34()
{
  unint64_t result = qword_1000417E8;
  if (!qword_1000417E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417E8);
  }
  return result;
}

unint64_t sub_100029F84()
{
  unint64_t result = qword_1000417F0;
  if (!qword_1000417F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417F0);
  }
  return result;
}

uint64_t sub_100029FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 - 96) = a8;
  return swift_allocObject();
}

uint64_t sub_10002A038()
{
  return v0;
}

uint64_t sub_10002A078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100028F2C(a1, a2, a3, a4, a5, a6, a7, a8);
}

double sub_10002A0E0()
{
  return 0.0;
}

uint64_t sub_10002A104()
{
  *(_OWORD *)(v0 - 120) = 0u;
  *(_OWORD *)(v0 - 104) = 0u;
  *(unsigned char *)(v0 - 88) = 0;
  return swift_allocObject();
}

uint64_t sub_10002A12C()
{
  return 0;
}

uint64_t sub_10002A148()
{
  return v0;
}

void sub_10002A160()
{
  int v2 = *(void **)(v0 - 296);
}

uint64_t sub_10002A198()
{
  return v0;
}

uint64_t sub_10002A1B8()
{
  return sub_100030610();
}

uint64_t sub_10002A1D0()
{
  return swift_release();
}

uint64_t sub_10002A1E8()
{
  return v0;
}

Swift::Double __swiftcall Double.init(hours:)(Swift::Int hours)
{
  return _sSd18PhotosReliveWidgetE5hoursS2d_tcfC_0((double)hours);
}

Swift::Double __swiftcall Double.init(minutes:)(Swift::Int minutes)
{
  return _sSd18PhotosReliveWidgetE7minutesS2d_tcfC_0((double)minutes);
}

double Double.minutes.getter(double a1)
{
  return a1 / 60.0;
}

double Double.hours.getter(double a1)
{
  return a1 / 60.0 / 60.0;
}

double _sSd18PhotosReliveWidgetE5hoursS2d_tcfC_0(double a1)
{
  return a1 * 60.0 * 60.0;
}

double _sSd18PhotosReliveWidgetE7minutesS2d_tcfC_0(double a1)
{
  return a1 * 60.0;
}

uint64_t sub_10002A254()
{
  uint64_t v0 = sub_10000D85C(&qword_100041488);
  __chkstk_darwin(v0 - 8, v1);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002FAC0();
  __chkstk_darwin(v4, v5);
  uint64_t v6 = sub_10002F930();
  sub_10000F530(v6, qword_100044730);
  sub_10000F4F8(v6, (uint64_t)qword_100044730);
  sub_10002FA90();
  sub_10000DA40((uint64_t)v3, 1, 1, v4);
  return sub_10002F920();
}

uint64_t sub_10002A388()
{
  if (qword_100040648 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002F930();

  return sub_10000F4F8(v0, (uint64_t)qword_100044730);
}

uint64_t sub_10002A3EC()
{
  sub_10000D85C(&qword_100041860);
  sub_10000D85C(&qword_100041868);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000311F0;
  sub_10002F860();
  sub_10002F8A0();
  sub_10002AAB8();
  uint64_t result = sub_1000304F0();
  qword_100044748 = result;
  return result;
}

uint64_t *sub_10002A4D8()
{
  if (qword_100040650 != -1) {
    swift_once();
  }
  return &qword_100044748;
}

BOOL sub_10002A524(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10003DE68;
  v6._object = a2;
  Swift::Int v4 = sub_100030930(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

unint64_t sub_10002A570()
{
  unint64_t result = qword_1000417F8;
  if (!qword_1000417F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417F8);
  }
  return result;
}

Swift::Int sub_10002A5C0()
{
  return sub_100030A10();
}

uint64_t sub_10002A614()
{
  return sub_1000305E0();
}

Swift::Int sub_10002A62C()
{
  return sub_100030A10();
}

BOOL sub_10002A678@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_10002A524(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10002A6B0(void *a1@<X8>)
{
  *a1 = 0x6D75626C61;
  a1[1] = 0xE500000000000000;
}

unint64_t sub_10002A6CC()
{
  unint64_t result = qword_100041800;
  if (!qword_100041800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041800);
  }
  return result;
}

unint64_t sub_10002A71C()
{
  unint64_t result = qword_100041808;
  if (!qword_100041808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041808);
  }
  return result;
}

unint64_t sub_10002A76C()
{
  unint64_t result = qword_100041810;
  if (!qword_100041810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041810);
  }
  return result;
}

void *sub_10002A7B8()
{
  return &protocol witness table for String;
}

unint64_t sub_10002A7C8()
{
  unint64_t result = qword_100041818;
  if (!qword_100041818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041818);
  }
  return result;
}

unint64_t sub_10002A818()
{
  unint64_t result = qword_100041820;
  if (!qword_100041820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041820);
  }
  return result;
}

unint64_t sub_10002A868()
{
  unint64_t result = qword_100041828;
  if (!qword_100041828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041828);
  }
  return result;
}

unint64_t sub_10002A8B8()
{
  unint64_t result = qword_100041830;
  if (!qword_100041830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041830);
  }
  return result;
}

uint64_t sub_10002A908@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002A388();
  uint64_t v3 = sub_10002F930();
  Swift::Int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10002A978()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002A9C8(uint64_t a1)
{
  unint64_t v2 = sub_100024424();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002AA18()
{
  unint64_t result = qword_100041838;
  if (!qword_100041838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041838);
  }
  return result;
}

unint64_t sub_10002AA68()
{
  unint64_t result = qword_100041840;
  if (!qword_100041840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041840);
  }
  return result;
}

unint64_t sub_10002AAB8()
{
  unint64_t result = qword_100041848;
  if (!qword_100041848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041848);
  }
  return result;
}

uint64_t sub_10002AB04()
{
  sub_10002A4D8();

  return swift_bridgeObjectRetain();
}

uint64_t sub_10002AB34(uint64_t a1)
{
  unint64_t v2 = sub_10002A8B8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10002AB84()
{
  unint64_t result = qword_100041850;
  if (!qword_100041850)
  {
    sub_10000D960(&qword_100041858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041850);
  }
  return result;
}

void sub_10002ABD8(void *a1@<X8>)
{
  *a1 = &off_10003DEA0;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PhotosReliveWidgetType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10002ACD8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002AD00()
{
  return 0;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetType()
{
  return &type metadata for PhotosReliveWidgetType;
}

unint64_t sub_10002AD1C()
{
  unint64_t result = qword_100041870;
  if (!qword_100041870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041870);
  }
  return result;
}

uint64_t sub_10002AD68()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10002AD98()
{
  uint64_t v0 = sub_10000D85C(&qword_100041488);
  __chkstk_darwin(v0 - 8, v1);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002FAC0();
  __chkstk_darwin(v4, v5);
  uint64_t v6 = sub_10002F930();
  sub_10000F530(v6, qword_100044750);
  sub_10000F4F8(v6, (uint64_t)qword_100044750);
  sub_10002FA90();
  sub_10000DA40((uint64_t)v3, 1, 1, v4);
  return sub_10002F920();
}

uint64_t sub_10002AECC()
{
  if (qword_100040658 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10002F930();

  return sub_10000F4F8(v0, (uint64_t)qword_100044750);
}

BOOL sub_10002AF30(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10002AF40(uint64_t a1, char a2)
{
}

Swift::Int sub_10002AF68(char a1)
{
  return sub_100030A10();
}

BOOL sub_10002AFB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10002AF30(*a1, *a2);
}

Swift::Int sub_10002AFBC()
{
  return sub_10002AF68(*v0);
}

void sub_10002AFC4(uint64_t a1)
{
  sub_10002AF40(a1, *v1);
}

uint64_t sub_10002AFCC()
{
  sub_1000216F4(0, &qword_100041238);
  uint64_t result = sub_1000307B0();
  qword_100044768 = result;
  return result;
}

uint64_t sub_10002B044()
{
  sub_100022458();
  v0[2] = v1;
  uint64_t v2 = sub_10000D85C(qword_1000418B8);
  v0[3] = v2;
  sub_10002F0D8(v2);
  v0[4] = v3;
  v0[5] = sub_10002F0F0();
  return _swift_task_switch(sub_10002B0D8, 0, 0);
}

uint64_t sub_10002B0D8()
{
  uint64_t v1 = (void *)v0[2];
  sub_10002B19C(v0[5]);
  uint64_t v2 = sub_10002F840();
  uint64_t v3 = sub_100022410();
  v4(v3);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_10002B94C(v2, v1);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_10002B19C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000D85C(&qword_100041488);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10000D85C(&qword_1000412F0);
  uint64_t v60 = *(void *)(v57 - 8);
  __chkstk_darwin(v57, v6);
  uint64_t v63 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_10002FAA0();
  uint64_t v8 = *(void *)(v58 - 8);
  __chkstk_darwin(v58, v9);
  BOOL v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10002FBC0();
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v14 = sub_100030570();
  __chkstk_darwin(v14 - 8, v15);
  id v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_10002FAC0();
  uint64_t v18 = *(void *)(v64 - 8);
  uint64_t v20 = __chkstk_darwin(v64, v19);
  uint64_t v59 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20, v22);
  os_log_type_t v62 = (char *)&v45 - v23;
  if (([self systemPhotoLibraryIsObtainable] & 1) == 0)
  {
    sub_1000306C0();
    if (qword_100040660 != -1) {
      swift_once();
    }
    sub_10002FC10();
    goto LABEL_19;
  }
  id v24 = sub_100019FBC();
  if (!v24)
  {
LABEL_19:
    sub_10000DA40((uint64_t)v5, 1, 1, v64);
    sub_10002DDC8();
    return sub_10002F830();
  }
  uint64_t v54 = v17;
  uint64_t v46 = v5;
  uint64_t v47 = a1;
  id v61 = v24;
  uint64_t v25 = sub_10002BEFC(v24);
  char v26 = 0;
  uint64_t v27 = 0;
  unsigned int v53 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  unint64_t v55 = (void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v51 = v60 + 32;
  os_log_type_t v52 = (void (**)(char *, void, uint64_t))(v8 + 104);
  uint64_t v56 = (void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v28 = &_swiftEmptyArrayStorage;
  unint64_t v49 = 0x8000000100034100;
  uint64_t v45 = &unk_100032E40;
  unint64_t v50 = 0x8000000100032E40;
  unint64_t v48 = 0x8000000100034120;
  do
  {
    char v29 = v26;
    if (v25[2])
    {
      char v30 = *((unsigned char *)&off_10003DEC8 + v27 + 32);
      unint64_t v31 = sub_100029470(v30);
      if (v32)
      {
        uint64_t v33 = v11;
        unint64_t v34 = *(void *)(v25[7] + 8 * v31);
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_10002C2A4((char)v61, v30, v34);
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_10002CCB4(v34, (uint64_t)v35);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v36[2])
        {
          BOOL v11 = v33;
          sub_100030520();
          sub_10002FBB0();
          (*v52)(v33, v53, v58);
          uint64_t v37 = v62;
          sub_10002FAD0();
          (*v55)(v59, v37, v64);
          sub_10002DDC8();
          sub_10002F820();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            uint64_t v28 = (void *)sub_10002E900(0, v28[2] + 1, 1, (uint64_t)v28, &qword_100041940, &qword_1000412F0, sub_10001ED18);
          }
          unint64_t v40 = v28[2];
          unint64_t v39 = v28[3];
          if (v40 >= v39 >> 1) {
            uint64_t v28 = (void *)sub_10002E900(v39 > 1, v40 + 1, 1, (uint64_t)v28, &qword_100041940, &qword_1000412F0, sub_10001ED18);
          }
          v28[2] = v40 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v60 + 32))((unint64_t)v28+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v40, v63, v57);
          (*v56)(v62, v64);
        }
        else
        {
          swift_bridgeObjectRelease();
          BOOL v11 = v33;
        }
      }
    }
    char v26 = 1;
    uint64_t v27 = &_mh_execute_header.magic + 1;
  }
  while ((v29 & 1) == 0);
  swift_bridgeObjectRelease();
  sub_100030520();
  sub_10002FBB0();
  (*v52)(v11, v53, v58);
  char v41 = v59;
  sub_10002FAD0();
  uint64_t v42 = (uint64_t)v46;
  uint64_t v43 = v64;
  (*v55)(v46, v41, v64);
  sub_10000DA40(v42, 0, 1, v43);
  sub_10002DDC8();
  sub_10002F830();

  return ((uint64_t (*)(char *, uint64_t))*v56)(v41, v43);
}

uint64_t sub_10002B94C(uint64_t result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v27 = *(void *)(result + 16);
  if (v27)
  {
    unint64_t v4 = 0;
    uint64_t v23 = result + 32;
    uint64_t v21 = a2 + 9;
    uint64_t v5 = &_swiftEmptyArrayStorage;
    uint64_t v26 = result;
    while (1)
    {
      uint64_t v22 = v5;
      while (1)
      {
        if (v4 >= *(void *)(v3 + 16)) {
          goto LABEL_37;
        }
        uint64_t v6 = v4++;
        uint64_t v7 = a2[2];
        if (!v7) {
          goto LABEL_26;
        }
        uint64_t v8 = (uint64_t *)(v23 + 40 * v6);
        uint64_t v9 = v8[1];
        uint64_t v10 = v8[2];
        uint64_t v24 = v8[3];
        uint64_t v25 = *v8;
        uint64_t v11 = v8[4];
        if (a2[4] == v9 && a2[5] == v10) {
          break;
        }
        uint64_t result = sub_1000309C0();
        if (result) {
          break;
        }
        if (v7 != 1)
        {
          if (a2[6] == v9 && a2[7] == v10) {
            break;
          }
          uint64_t result = sub_1000309C0();
          if (result) {
            break;
          }
          if (v7 != 2)
          {
            uint64_t v14 = v21;
            uint64_t v15 = 2;
            while (1)
            {
              uint64_t v16 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                break;
              }
              if (*(v14 - 1) == v9 && *v14 == v10) {
                goto LABEL_28;
              }
              uint64_t result = sub_1000309C0();
              if (result) {
                goto LABEL_28;
              }
              v14 += 2;
              ++v15;
              if (v16 == v7) {
                goto LABEL_26;
              }
            }
            __break(1u);
LABEL_37:
            __break(1u);
            return result;
          }
        }
LABEL_26:
        uint64_t v3 = v26;
        if (v4 == v27)
        {
          uint64_t v5 = v22;
          goto LABEL_35;
        }
      }
LABEL_28:
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v5 = v22;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10001FB40(0, v22[2] + 1, 1);
        uint64_t v5 = v22;
      }
      unint64_t v19 = v5[2];
      unint64_t v18 = v5[3];
      if (v19 >= v18 >> 1)
      {
        uint64_t result = (uint64_t)sub_10001FB40((char *)(v18 > 1), v19 + 1, 1);
        uint64_t v5 = v22;
      }
      v5[2] = v19 + 1;
      uint64_t v20 = &v5[5 * v19];
      uint64_t v3 = v26;
      v20[4] = v25;
      v20[5] = v9;
      v20[6] = v10;
      v20[7] = v24;
      v20[8] = v11;
      if (v4 == v27) {
        goto LABEL_35;
      }
    }
  }
  uint64_t v5 = &_swiftEmptyArrayStorage;
LABEL_35:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (uint64_t)v5;
}

uint64_t sub_10002BB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v5 = sub_10000D85C(&qword_1000412F8);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v33 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v7, v9);
  uint64_t v13 = (char *)v26 - v12;
  uint64_t v14 = &_swiftEmptyArrayStorage;
  unint64_t v40 = &_swiftEmptyArrayStorage;
  uint64_t v32 = *(void *)(a1 + 16);
  if (v32)
  {
    unint64_t v15 = 0;
    uint64_t v28 = a1;
    uint64_t v29 = v11 + 16;
    v26[1] = v3;
    uint64_t v27 = (uint64_t (**)(char *, uint64_t))(v11 + 8);
    uint64_t v30 = v11;
    unint64_t v31 = (void (**)(char *, char *, uint64_t))(v11 + 32);
    while (v15 < *(void *)(a1 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      uint64_t v17 = *(void *)(v11 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v13, a1 + v16 + v17 * v15, v5);
      sub_10002F720();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v18 = sub_1000305D0();
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      uint64_t v38 = v18;
      uint64_t v39 = v20;
      uint64_t v36 = sub_1000305D0();
      uint64_t v37 = v21;
      sub_10000F204();
      LOBYTE(v18) = sub_100030810();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18)
      {
        uint64_t v22 = *v31;
        (*v31)(v33, v13, v5);
        uint64_t v23 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10001FB60(0, v23[2] + 1, 1);
          uint64_t v23 = v40;
        }
        unint64_t v25 = v23[2];
        unint64_t v24 = v23[3];
        if (v25 >= v24 >> 1)
        {
          sub_10001FB60(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v40;
        }
        v23[2] = v25 + 1;
        uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v22)((char *)v23 + v16 + v25 * v17, v33, v5);
        a1 = v28;
      }
      else
      {
        uint64_t result = (*v27)(v13, v5);
      }
      ++v15;
      uint64_t v11 = v30;
      if (v32 == v15)
      {
        uint64_t v14 = v40;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v14;
  }
  return result;
}

uint64_t sub_10002BE7C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002BE9C, 0, 0);
}

uint64_t sub_10002BE9C()
{
  sub_100022458();
  sub_10002B19C(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_10002BEFC(void *a1)
{
  id v1 = [a1 librarySpecificFetchOptions];
  uint64_t v2 = self;
  id v3 = [v2 fetchAssetCollectionsWithType:2 subtype:203 options:v1];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = v4;
    sub_100030620();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100030670();
    }
    sub_100030680();
    sub_100030660();
  }
  id v6 = [v2 fetchAssetCollectionsWithType:2 subtype:212 options:v1];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = v7;
    sub_100030620();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100030670();
    }
    sub_100030680();
    sub_100030660();
  }
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000308F0();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_11;
    }
  }
  else if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_10002EC3C((uint64_t)&_swiftEmptyArrayStorage, 0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
LABEL_14:
  sub_10000D85C(&qword_100041268);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100031D30;
  id v12 = objc_allocWithZone((Class)NSSortDescriptor);
  *(void *)(v11 + 32) = sub_10002E894(0x657A696C61636F6CLL, 0xEE00656C74695464, 1);
  sub_100030660();
  sub_10002ED94(v11, v1);
  id v13 = [v2 fetchAssetCollectionsWithType:1 subtype:2 options:v1];
  id v14 = [v13 fetchedObjects];

  if (!v14)
  {
LABEL_20:

    return &_swiftEmptyDictionarySingleton;
  }
  sub_1000216F4(0, &qword_1000417A8);
  unint64_t v15 = sub_100030640();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1000308F0();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_17:
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_10002EC3C(v15, 1, v16);

  swift_bridgeObjectRelease();
  return &_swiftEmptyDictionarySingleton;
}

void *sub_10002C2A4(char a1, char a2, unint64_t a3)
{
  unint64_t v3 = a3;
  LOBYTE(v4) = a2;
  LOBYTE(v5) = a1;
  uint64_t v6 = a3 >> 62;
  if (a3 >> 62) {
    goto LABEL_85;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    return &_swiftEmptyDictionarySingleton;
  }
LABEL_3:
  unint64_t v99 = v3;
  if ((v4 & 1) == 0)
  {
    unint64_t v98 = v3 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    id v5 = &_swiftEmptyDictionarySingleton;
    uint64_t v8 = 4;
    uint64_t v97 = v7;
    while (1)
    {
      uint64_t v4 = v8 - 4;
      if (v98) {
        id v9 = (id)sub_1000308A0();
      }
      else {
        id v9 = *(id *)(v3 + 8 * v8);
      }
      uint64_t v10 = v9;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        swift_bridgeObjectRetain();
        uint64_t v7 = sub_1000308F0();
        swift_bridgeObjectRelease();
        if (!v7) {
          return &_swiftEmptyDictionarySingleton;
        }
        goto LABEL_3;
      }
      uint64_t v103 = v8 - 3;
      id v11 = [v9 assetCollectionSubtype];
      int v101 = v10;
      if (v11 == (id)203)
      {
        uint64_t v4 = (uint64_t)[v10 localIdentifier];
        uint64_t v12 = sub_1000305B0();
        uint64_t v14 = v13;

        uint64_t v15 = sub_1000305B0();
        uint64_t v17 = v16;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v105 = v5;
        LOBYTE(v4) = (_BYTE)v5;
        unint64_t v19 = sub_1000294E0(v12, v14);
        uint64_t v21 = v5[2];
        BOOL v22 = (v20 & 1) == 0;
        id v5 = (void *)(v21 + v22);
        if (__OFADD__(v21, v22)) {
          goto LABEL_80;
        }
        unint64_t v3 = v19;
        uint64_t v6 = v20;
        sub_10000D85C(&qword_100041950);
        uint64_t v4 = (uint64_t)&v105;
        if (sub_1000308C0(isUniquelyReferenced_nonNull_native, (Swift::Int)v5))
        {
          LOBYTE(v4) = (_BYTE)v105;
          unint64_t v23 = sub_1000294E0(v12, v14);
          if ((v6 & 1) != (v24 & 1)) {
            goto LABEL_92;
          }
          unint64_t v3 = v23;
        }
        id v5 = v105;
        if ((v6 & 1) == 0)
        {
          v105[(v3 >> 6) + 8] |= 1 << v3;
          unint64_t v40 = (uint64_t *)(v5[6] + 16 * v3);
          *unint64_t v40 = v12;
          v40[1] = v14;
          char v41 = (uint64_t *)(v5[7] + 16 * v3);
          *char v41 = v15;
          v41[1] = v17;
          uint64_t v42 = v5[2];
          BOOL v43 = __OFADD__(v42, 1);
          uint64_t v44 = v42 + 1;
          if (v43) {
            goto LABEL_82;
          }
LABEL_27:
          v5[2] = v44;
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
        unint64_t v25 = (uint64_t *)(v105[7] + 16 * v3);
        swift_bridgeObjectRelease();
        uint64_t *v25 = v15;
        v25[1] = v17;
      }
      else
      {
        if (v11 != (id)212) {
          goto LABEL_91;
        }
        uint64_t v4 = (uint64_t)[v10 localIdentifier];
        uint64_t v26 = sub_1000305B0();
        uint64_t v28 = v27;

        uint64_t v29 = sub_1000305B0();
        uint64_t v31 = v30;
        char v32 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v105 = v5;
        LOBYTE(v4) = (_BYTE)v5;
        unint64_t v33 = sub_1000294E0(v26, v28);
        uint64_t v35 = v5[2];
        BOOL v36 = (v34 & 1) == 0;
        id v5 = (void *)(v35 + v36);
        if (__OFADD__(v35, v36)) {
          goto LABEL_81;
        }
        unint64_t v3 = v33;
        uint64_t v6 = v34;
        sub_10000D85C(&qword_100041950);
        uint64_t v4 = (uint64_t)&v105;
        if (sub_1000308C0(v32, (Swift::Int)v5))
        {
          LOBYTE(v4) = (_BYTE)v105;
          unint64_t v37 = sub_1000294E0(v26, v28);
          if ((v6 & 1) != (v38 & 1)) {
            goto LABEL_92;
          }
          unint64_t v3 = v37;
        }
        id v5 = v105;
        if ((v6 & 1) == 0)
        {
          v105[(v3 >> 6) + 8] |= 1 << v3;
          uint64_t v45 = (uint64_t *)(v5[6] + 16 * v3);
          uint64_t *v45 = v26;
          v45[1] = v28;
          uint64_t v46 = (uint64_t *)(v5[7] + 16 * v3);
          *uint64_t v46 = v29;
          v46[1] = v31;
          uint64_t v47 = v5[2];
          BOOL v43 = __OFADD__(v47, 1);
          uint64_t v44 = v47 + 1;
          if (v43) {
            goto LABEL_83;
          }
          goto LABEL_27;
        }
        uint64_t v39 = (uint64_t *)(v105[7] + 16 * v3);
        swift_bridgeObjectRelease();
        *uint64_t v39 = v29;
        v39[1] = v31;
      }
LABEL_28:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v3 = v99;
      ++v8;
      if (v103 == v97)
      {
        swift_bridgeObjectRelease();
        return v5;
      }
    }
  }
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000308F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6)
  {
    uint64_t v105 = &_swiftEmptyArrayStorage;
    sub_10001FB20(0, v6 & ~(v6 >> 63), 0);
    if ((v6 & 0x8000000000000000) == 0)
    {
      uint64_t v48 = 0;
      uint64_t v49 = (uint64_t)v105;
      unint64_t v50 = v3 & 0xC000000000000001;
      do
      {
        if (v50) {
          id v51 = (id)sub_1000308A0();
        }
        else {
          id v51 = *(id *)(v3 + 8 * v48 + 32);
        }
        os_log_type_t v52 = v51;
        id v53 = [v51 localIdentifier];
        uint64_t v54 = sub_1000305B0();
        uint64_t v56 = v55;

        uint64_t v105 = (void *)v49;
        unint64_t v58 = *(void *)(v49 + 16);
        unint64_t v57 = *(void *)(v49 + 24);
        if (v58 >= v57 >> 1)
        {
          sub_10001FB20((char *)(v57 > 1), v58 + 1, 1);
          uint64_t v49 = (uint64_t)v105;
        }
        ++v48;
        *(void *)(v49 + 16) = v58 + 1;
        uint64_t v59 = v49 + 16 * v58;
        *(void *)(v59 + 32) = v54;
        *(void *)(v59 + 40) = v56;
        unint64_t v3 = v99;
      }
      while (v6 != v48);
      goto LABEL_42;
    }
  }
  else
  {
LABEL_42:
    LOBYTE(v4) = (_BYTE)v5;
    uint64_t v60 = sub_1000306F0();
    swift_bridgeObjectRelease();
    int64_t v61 = 0;
    uint64_t v102 = v60 + 64;
    uint64_t v62 = 1 << *(unsigned char *)(v60 + 32);
    uint64_t v63 = -1;
    if (v62 < 64) {
      uint64_t v63 = ~(-1 << v62);
    }
    unint64_t v64 = v63 & *(void *)(v60 + 64);
    id v5 = &_swiftEmptyDictionarySingleton;
    int64_t v104 = (unint64_t)(v62 + 63) >> 6;
    uint64_t v100 = v60;
    while (1)
    {
      while (1)
      {
        if (v64)
        {
          unint64_t v65 = __clz(__rbit64(v64));
          v64 &= v64 - 1;
          unint64_t v66 = v65 | (v61 << 6);
        }
        else
        {
          int64_t v67 = v61 + 1;
          if (__OFADD__(v61, 1)) {
            goto LABEL_79;
          }
          if (v67 >= v104) {
            goto LABEL_77;
          }
          unint64_t v68 = *(void *)(v102 + 8 * v67);
          ++v61;
          if (!v68)
          {
            int64_t v61 = v67 + 1;
            if (v67 + 1 >= v104) {
              goto LABEL_77;
            }
            unint64_t v68 = *(void *)(v102 + 8 * v61);
            if (!v68)
            {
              int64_t v61 = v67 + 2;
              if (v67 + 2 >= v104) {
                goto LABEL_77;
              }
              unint64_t v68 = *(void *)(v102 + 8 * v61);
              if (!v68)
              {
                int64_t v69 = v67 + 3;
                if (v69 >= v104) {
                  goto LABEL_77;
                }
                unint64_t v68 = *(void *)(v102 + 8 * v69);
                if (!v68)
                {
                  while (1)
                  {
                    int64_t v61 = v69 + 1;
                    if (__OFADD__(v69, 1)) {
                      goto LABEL_84;
                    }
                    if (v61 >= v104) {
                      break;
                    }
                    unint64_t v68 = *(void *)(v102 + 8 * v61);
                    ++v69;
                    if (v68) {
                      goto LABEL_60;
                    }
                  }
LABEL_77:
                  swift_release();
                  return v5;
                }
                int64_t v61 = v69;
              }
            }
          }
LABEL_60:
          unint64_t v64 = (v68 - 1) & v68;
          unint64_t v66 = __clz(__rbit64(v68)) + (v61 << 6);
        }
        os_log_type_t v70 = (unint64_t *)(*(void *)(v60 + 48) + 16 * v66);
        unint64_t v3 = *v70;
        unint64_t v71 = v70[1];
        uint64_t v72 = *(void *)(v60 + 56) + 16 * v66;
        id v73 = *(void **)v72;
        if ((*(unsigned char *)(v72 + 8) & 1) == 0) {
          break;
        }
        sub_10002EE7C(v73, 1);
        sub_10002EE7C(v73, 1);
        swift_bridgeObjectRetain();
        LOBYTE(v4) = sub_1000306C0();
        if (qword_100040660 != -1) {
          swift_once();
        }
        uint64_t v74 = qword_100044768;
        uint64_t v6 = v4;
        if (os_log_type_enabled((os_log_t)qword_100044768, (os_log_type_t)v4))
        {
          sub_10002EE7C(v73, 1);
          sub_10002EE7C(v73, 1);
          swift_bridgeObjectRetain();
          uint64_t v4 = v3;
          unint64_t v3 = v61;
          uint64_t v75 = swift_slowAlloc();
          uint64_t v105 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v75 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)(v75 + 4) = sub_10001F274(v4, v71, (uint64_t *)&v105);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v75 + 12) = 2080;
          swift_getErrorValue();
          uint64_t v76 = sub_1000309E0();
          LOBYTE(v4) = v77;
          *(void *)(v75 + 14) = sub_10001F274(v76, v77, (uint64_t *)&v105);
          swift_bridgeObjectRelease();
          sub_10002EE88(v73, 1);
          sub_10002EE88(v73, 1);
          _os_log_impl((void *)&_mh_execute_header, v74, (os_log_type_t)v6, "could not get cloud identifier for album %s with error %s", (uint8_t *)v75, 0x16u);
          swift_arrayDestroy();
          uint64_t v60 = v100;
          swift_slowDealloc();
          int64_t v61 = v3;
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        sub_10002EE88(v73, 1);
        sub_10002EE88(v73, 1);
      }
      int64_t v95 = v61;
      sub_10002EE7C(v73, 0);
      sub_10002EE7C(v73, 0);
      swift_bridgeObjectRetain();
      id v78 = [v73 stringValue];
      uint64_t v79 = sub_1000305B0();
      uint64_t v96 = v80;

      uint64_t v6 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v105 = v5;
      unint64_t v81 = sub_1000294E0(v3, v71);
      uint64_t v83 = v5[2];
      BOOL v84 = (v82 & 1) == 0;
      Swift::Int v85 = v83 + v84;
      if (__OFADD__(v83, v84)) {
        break;
      }
      unint64_t v86 = v81;
      char v87 = v82;
      sub_10000D85C(&qword_100041950);
      uint64_t v4 = (uint64_t)&v105;
      if (sub_1000308C0(v6, v85))
      {
        LOBYTE(v4) = (_BYTE)v105;
        unint64_t v88 = sub_1000294E0(v3, v71);
        if ((v87 & 1) != (v89 & 1)) {
          goto LABEL_92;
        }
        unint64_t v86 = v88;
      }
      id v5 = v105;
      if (v87)
      {
        uint64_t v4 = v105[7] + 16 * v86;
        swift_bridgeObjectRelease();
        *(void *)uint64_t v4 = v79;
        *(void *)(v4 + 8) = v96;
      }
      else
      {
        v105[(v86 >> 6) + 8] |= 1 << v86;
        uint64_t v90 = (unint64_t *)(v5[6] + 16 * v86);
        *uint64_t v90 = v3;
        v90[1] = v71;
        id v91 = (uint64_t *)(v5[7] + 16 * v86);
        *id v91 = v79;
        v91[1] = v96;
        uint64_t v92 = v5[2];
        BOOL v43 = __OFADD__(v92, 1);
        uint64_t v93 = v92 + 1;
        if (v43) {
          goto LABEL_89;
        }
        v5[2] = v93;
        swift_bridgeObjectRetain();
      }
      uint64_t v60 = v100;
      int64_t v61 = v95;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002EE88(v73, 0);
      sub_10002EE88(v73, 0);
    }
    __break(1u);
LABEL_89:
    __break(1u);
  }
  __break(1u);
LABEL_91:
  sub_1000308E0();
  __break(1u);
LABEL_92:
  uint64_t result = (void *)sub_1000309D0();
  __break(1u);
  return result;
}

void *sub_10002CCB4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10002FAC0();
  __chkstk_darwin(v6 - 8, v7);
  v44[2] = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D85C(&qword_100041948);
  __chkstk_darwin(v9 - 8, v10);
  id v53 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D85C(&qword_1000412F8);
  uint64_t v49 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  uint64_t v54 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  uint64_t v48 = (char *)v44 - v17;
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1000308F0();
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18)
    {
LABEL_3:
      v44[0] = v3;
      unint64_t v52 = a1 & 0xC000000000000001;
      unint64_t v50 = (void (**)(char *, uint64_t, uint64_t))(v49 + 32);
      unint64_t v19 = &_swiftEmptyArrayStorage;
      uint64_t v20 = 4;
      v44[1] = 0x8000000100034060;
      unint64_t v45 = a1;
      uint64_t v46 = a2;
      uint64_t v51 = v18;
      while (1)
      {
        uint64_t v60 = v19;
        uint64_t v3 = v20 - 4;
        if (v52) {
          id v21 = (id)sub_1000308A0();
        }
        else {
          id v21 = *(id *)(a1 + 8 * v20);
        }
        BOOL v22 = v21;
        uint64_t v23 = v20 - 3;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          goto LABEL_25;
        }
        id v24 = [v21 localIdentifier];
        uint64_t v25 = sub_1000305B0();
        uint64_t v27 = v26;

        if (!*(void *)(a2 + 16)) {
          break;
        }
        unint64_t v28 = sub_1000294E0(v25, v27);
        if ((v29 & 1) == 0) {
          break;
        }
        uint64_t v30 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v28);
        uint64_t v32 = *v30;
        uint64_t v31 = v30[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v33 = sub_10002EE18(v22);
        if (!v34)
        {
          swift_bridgeObjectRelease();
          uint64_t v38 = 1;
          a1 = v45;
          a2 = v46;
          goto LABEL_13;
        }
        uint64_t v35 = v34;
        uint64_t v47 = v33;
        sub_10000D85C(&qword_100041930);
        swift_bridgeObjectRetain();
        sub_10002FA90();
        uint64_t v36 = sub_10002F780();
        uint64_t v55 = v32;
        uint64_t v56 = v31;
        sub_10002F770();
        uint64_t v55 = v36;
        uint64_t v56 = v32;
        uint64_t v57 = v31;
        uint64_t v58 = v47;
        uint64_t v59 = v35;
        sub_10002DDC8();
        uint64_t v37 = (uint64_t)v53;
        sub_10002F730();
        uint64_t v38 = 0;
        a1 = v45;
        a2 = v46;
LABEL_14:
        sub_10000DA40(v37, v38, 1, v12);

        if (sub_10000DA00(v37, 1, v12) == 1)
        {
          sub_10002EE94(v37, &qword_100041948);
          unint64_t v19 = v60;
        }
        else
        {
          uint64_t v39 = *v50;
          unint64_t v40 = v48;
          (*v50)(v48, v37, v12);
          v39(v54, (uint64_t)v40, v12);
          unint64_t v19 = v60;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v19 = (void *)sub_10002E900(0, v19[2] + 1, 1, (uint64_t)v19, &qword_100041308, &qword_1000412F8, sub_10001ED24);
          }
          unint64_t v42 = v19[2];
          unint64_t v41 = v19[3];
          if (v42 >= v41 >> 1) {
            unint64_t v19 = (void *)sub_10002E900(v41 > 1, v42 + 1, 1, (uint64_t)v19, &qword_100041308, &qword_1000412F8, sub_10001ED24);
          }
          void v19[2] = v42 + 1;
          v39((char *)v19+ ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))+ *(void *)(v49 + 72) * v42, (uint64_t)v54, v12);
        }
        ++v20;
        if (v23 == v51)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v19;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v38 = 1;
LABEL_13:
      uint64_t v37 = (uint64_t)v53;
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10002D1B8()
{
  sub_100022458();
  v0[3] = v1;
  v0[4] = v2;
  v0[2] = v3;
  uint64_t v4 = sub_10000D85C(&qword_100041488);
  sub_1000119E8(v4);
  v0[5] = sub_10002F0F0();
  uint64_t v5 = sub_10000D85C(&qword_100041978);
  sub_1000119E8(v5);
  v0[6] = sub_10002F0F0();
  uint64_t v6 = sub_10002FAC0();
  v0[7] = v6;
  sub_10002F0D8(v6);
  v0[8] = v7;
  v0[9] = swift_task_alloc();
  v0[10] = swift_task_alloc();
  uint64_t v8 = sub_10000D85C(&qword_1000412F0);
  v0[11] = v8;
  sub_10002F0D8(v8);
  v0[12] = v9;
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  uint64_t v10 = sub_10000D85C(qword_1000418B8);
  v0[15] = v10;
  sub_10002F0D8(v10);
  v0[16] = v11;
  v0[17] = sub_10002F0F0();
  return _swift_task_switch(sub_10002D32C, 0, 0);
}

uint64_t sub_10002D32C()
{
  sub_10002B19C(v0[17]);
  uint64_t v1 = sub_10002F850();
  uint64_t v2 = sub_100022410();
  v3(v2);
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    uint64_t v5 = v0[12];
    uint64_t v6 = *(void (**)(void, unint64_t, void))(v5 + 16);
    v5 += 16;
    uint64_t v33 = v6;
    unint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
    char v29 = (void (**)(uint64_t, uint64_t, uint64_t))(v0[8] + 32);
    uint64_t v31 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    unint64_t v32 = (*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64);
    uint64_t v34 = (void (**)(uint64_t, uint64_t))(v5 - 8);
    uint64_t v8 = &_swiftEmptyArrayStorage;
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v30 = v9;
    do
    {
      uint64_t v35 = (uint64_t)v8;
      uint64_t v11 = v0[3];
      uint64_t v10 = v0[4];
      v33(v0[14], v7, v0[11]);
      uint64_t v12 = sub_10002F810();
      swift_bridgeObjectRetain();
      if (*(void *)(sub_10002BB84(v12, v11, v10) + 16))
      {
        uint64_t v13 = v0[6];
        sub_10002F800();
        uint64_t v14 = sub_10002F8A0();
        int v15 = sub_10000DA00(v13, 1, v14);
        uint64_t v16 = v0[10];
        if (v15 == 1)
        {
          sub_10002EE94(v0[6], &qword_100041978);
          sub_10002FA90();
        }
        else
        {
          uint64_t v17 = v0[9];
          uint64_t v18 = v0[7];
          sub_10002F880();
          uint64_t v19 = sub_100022410();
          v20(v19);
          (*v29)(v16, v17, v18);
        }
        sub_10002DDC8();
        sub_10002F820();
        uint64_t v8 = (void *)v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v8 = (void *)sub_10002E900(0, *(void *)(v35 + 16) + 1, 1, v35, &qword_100041940, &qword_1000412F0, sub_10001ED18);
        }
        unint64_t v22 = v8[2];
        unint64_t v21 = v8[3];
        if (v22 >= v21 >> 1) {
          uint64_t v8 = (void *)sub_10002E900(v21 > 1, v22 + 1, 1, (uint64_t)v8, &qword_100041940, &qword_1000412F0, sub_10001ED18);
        }
        uint64_t v23 = v0[13];
        uint64_t v24 = v0[14];
        uint64_t v25 = v0[11];
        v8[2] = v22 + 1;
        uint64_t v26 = (char *)v8 + v32 + v22 * v30;
        uint64_t v9 = v30;
        (*v31)(v26, v23, v25);
        (*v34)(v24, v25);
      }
      else
      {
        (*v34)(v0[14], v0[11]);
        swift_bridgeObjectRelease();
        uint64_t v8 = (void *)v35;
      }
      v7 += v9;
      --v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  sub_10000DA40(v0[5], 1, 1, v0[7]);
  sub_10002DDC8();
  sub_10002F830();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t sub_10002D750()
{
  sub_100022458();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_10002FAC0();
  sub_1000119E8(v2);
  *(void *)(v0 + 40) = sub_10002F0F0();
  return _swift_task_switch(sub_10002D7D0, 0, 0);
}

uint64_t sub_10002D7D0()
{
  if ([self systemPhotoLibraryIsObtainable])
  {
    id v1 = sub_100019FBC();
    if (v1)
    {
      uint64_t v2 = v1;
      id v3 = [v1 librarySpecificFetchOptions];
      id v4 = [self fetchAssetCollectionsWithType:2 subtype:203 options:v3];
      id v5 = [v4 firstObject];

      if (v5)
      {
        id v6 = [v5 localizedTitle];
        if (v6)
        {
          unint64_t v7 = v6;
          uint64_t v8 = sub_1000305B0();
          unint64_t v10 = v9;

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
  }
  else
  {
    sub_1000306C0();
    if (qword_100040660 != -1) {
      swift_once();
    }
    sub_10002FC10();
  }
  uint64_t v8 = 0;
  unint64_t v10 = 0xE000000000000000;
LABEL_13:
  uint64_t v11 = (uint64_t *)v0[4];
  uint64_t v12 = sub_1000305B0();
  uint64_t v14 = v13;
  sub_10000D85C(&qword_100041930);
  sub_10002FA90();
  uint64_t v15 = sub_10002F780();
  v0[2] = sub_1000305B0();
  v0[3] = v16;
  sub_10002F770();
  swift_task_dealloc();
  *uint64_t v11 = v15;
  v11[1] = v12;
  v11[2] = v14;
  v11[3] = v8;
  v11[4] = v10;
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_10002DA24()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10002218C;
  return sub_10002D1B8();
}

unint64_t sub_10002DAD8()
{
  unint64_t result = qword_100041880;
  if (!qword_100041880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041880);
  }
  return result;
}

unint64_t sub_10002DB28()
{
  unint64_t result = qword_100041888[0];
  if (!qword_100041888[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100041888);
  }
  return result;
}

uint64_t sub_10002DB78()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10002DC0C;
  return sub_10002B044();
}

uint64_t sub_10002DC0C()
{
  sub_100022458();
  uint64_t v3 = v2;
  sub_100022194();
  uint64_t v4 = *v1;
  sub_100022268();
  *id v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  unint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_10002DCDC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10002218C;
  return sub_10002BE7C(a1);
}

unint64_t sub_10002DD78()
{
  unint64_t result = qword_1000418A0;
  if (!qword_1000418A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418A0);
  }
  return result;
}

unint64_t sub_10002DDC8()
{
  unint64_t result = qword_1000418A8;
  if (!qword_1000418A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418A8);
  }
  return result;
}

uint64_t sub_10002DE14()
{
  return sub_10001148C(&qword_1000418B0, qword_1000418B8);
}

uint64_t sub_10002DE50(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002AD1C();
  *uint64_t v5 = v2;
  v5[1] = sub_10001CD00;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10002DF04(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 64) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10002DFA0;
  return sub_10002D750();
}

uint64_t sub_10002DFA0()
{
  sub_100022458();
  sub_100022194();
  uint64_t v1 = *v0;
  sub_100022268();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = sub_100022410();
  sub_10002E82C(v3, v4);
  uint64_t v5 = *(uint64_t (**)(void))(v1 + 8);
  return v5();
}

unint64_t sub_10002E08C()
{
  unint64_t result = qword_1000418D0;
  if (!qword_1000418D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418D0);
  }
  return result;
}

unint64_t sub_10002E0DC()
{
  unint64_t result = qword_1000418D8;
  if (!qword_1000418D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418D8);
  }
  return result;
}

unint64_t sub_10002E12C()
{
  unint64_t result = qword_1000418E0;
  if (!qword_1000418E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418E0);
  }
  return result;
}

void *sub_10002E178()
{
  return &protocol witness table for String;
}

uint64_t sub_10002E184()
{
  uint64_t v1 = sub_10000D85C(&qword_100041918);
  uint64_t v2 = sub_1000119E8(v1);
  __chkstk_darwin(v2, v3);
  sub_100024524();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_10000D85C(&qword_100041488);
  uint64_t v8 = sub_1000119E8(v7);
  __chkstk_darwin(v8, v9);
  sub_100024524();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_10002FAC0();
  __chkstk_darwin(v13, v14);
  sub_100024524();
  uint64_t v15 = sub_100030560();
  uint64_t v16 = sub_1000119E8(v15);
  __chkstk_darwin(v16, v17);
  sub_100024524();
  sub_100030550();
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  sub_100030540(v20);
  sub_100030530(*(Swift::String *)(v0 + 24));
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  sub_100030540(v21);
  sub_10002FAB0();
  sub_10000DA40(v12, 1, 1, v13);
  uint64_t v18 = sub_10002F870();
  sub_10000DA40(v6, 1, 1, v18);
  return sub_10002F890();
}

unint64_t sub_10002E33C()
{
  unint64_t result = qword_1000418E8;
  if (!qword_1000418E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418E8);
  }
  return result;
}

unint64_t sub_10002E38C()
{
  unint64_t result = qword_1000418F0;
  if (!qword_1000418F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418F0);
  }
  return result;
}

unint64_t sub_10002E3DC()
{
  unint64_t result = qword_1000418F8;
  if (!qword_1000418F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418F8);
  }
  return result;
}

void *sub_10002E428()
{
  return &protocol witness table for String;
}

uint64_t sub_10002E434@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002AD68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002E45C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002AECC();
  uint64_t v3 = sub_10002F930();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_10002E4CC()
{
  return sub_10001148C(&qword_100041900, &qword_100041908);
}

uint64_t sub_10002E508(uint64_t a1)
{
  unint64_t v2 = sub_100024470();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002E558()
{
  unint64_t result = qword_100041910;
  if (!qword_100041910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041910);
  }
  return result;
}

uint64_t sub_10002E5A8(uint64_t a1)
{
  unint64_t v2 = sub_10002E3DC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t destroy for PhotosReliveWidgetAlbum()
{
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PhotosReliveWidgetAlbum(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PhotosReliveWidgetAlbum(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PhotosReliveWidgetAlbum(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for PhotosReliveWidgetAlbum(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetAlbum(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetAlbum(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetAlbum()
{
  return &type metadata for PhotosReliveWidgetAlbum;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider()
{
  return &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider;
}

uint64_t sub_10002E82C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D85C(&qword_100041928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_10002E894(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    NSString v5 = sub_100030580();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [v3 initWithKey:v5 ascending:a3 & 1];

  return v6;
}

uint64_t sub_10002E900(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void (*a7)(unint64_t, uint64_t, unint64_t))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    Swift::String v20 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000D85C(a5);
  uint64_t v15 = sub_10000D85C(a6);
  sub_10002F0D8(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  Swift::String v20 = (void *)swift_allocObject();
  size_t v21 = j__malloc_size(v20);
  if (!v17 || (v21 - v19 == 0x8000000000000000 ? (BOOL v22 = v17 == -1) : (BOOL v22 = 0), v22))
  {
LABEL_24:
    sub_100022278();
    sub_10002F108();
    uint64_t result = sub_1000308D0();
    __break(1u);
    return result;
  }
  v20[2] = v13;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_19:
  uint64_t v23 = *(void *)(sub_10000D85C(a6) - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v25 = (unint64_t)v20 + v24;
  if (a1)
  {
    a7(a4 + v24, v13, v25);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10002EAFC(0, v13, v25, a4, a6);
  }
  return (uint64_t)v20;
}

uint64_t sub_10002EAFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(sub_10000D85C(a5) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  sub_100022278();
  sub_10002F108();
  uint64_t result = sub_100030910();
  __break(1u);
  return result;
}

unint64_t sub_10002EC3C(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v7 = a2 & 1;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_100029470(a2 & 1);
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
  sub_10000D85C(&qword_100041960);
  if (!sub_1000308C0(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_100029470(v7);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    unint64_t result = sub_1000309D0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7];
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    return sub_10002ED4C(v14, v7, a1, v18);
  }
  return result;
}

unint64_t sub_10002ED4C(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2 & 1;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

void sub_10002ED94(uint64_t a1, void *a2)
{
  sub_1000216F4(0, &qword_100041958);
  Class isa = sub_100030630().super.isa;
  swift_bridgeObjectRelease();
  [a2 setSortDescriptors:isa];
}

uint64_t sub_10002EE18(void *a1)
{
  id v1 = [a1 localizedTitle];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1000305B0();

  return v3;
}

id sub_10002EE7C(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_10002EE88(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_10002EE94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000D85C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002F044);
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

unsigned char *sub_10002F06C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType()
{
  return &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType;
}

unint64_t sub_10002F08C()
{
  unint64_t result = qword_100041980;
  if (!qword_100041980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041980);
  }
  return result;
}

uint64_t sub_10002F0D8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10002F0F0()
{
  return swift_task_alloc();
}

uint64_t PXTimelineContentType.description.getter(uint64_t a1)
{
  uint64_t v1 = 0x6465727574616566;
  uint64_t v2 = 0x6E776F6E6B6E75;
  if (!a1) {
    uint64_t v2 = 0x79726F6D656DLL;
  }
  if (a1 != 1) {
    uint64_t v1 = v2;
  }
  if (a1 == 2) {
    return 0x6D75626C61;
  }
  else {
    return v1;
  }
}

uint64_t sub_10002F190()
{
  return PXTimelineContentType.description.getter(*v0);
}

uint64_t sub_10002F198()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10002F1CC()
{
  return sub_10002F378(1);
}

uint64_t sub_10002F1D4(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_100044698 == -1)
  {
    if (qword_1000446A0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_100044698, 0, (dispatch_function_t)sub_10002F370);
    if (qword_1000446A0) {
      return _availability_version_check();
    }
  }
  if (qword_100044690 == -1)
  {
    BOOL v8 = dword_100044680 < a2;
    if (dword_100044680 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100044690, 0, (dispatch_function_t)sub_10002F1CC);
    BOOL v8 = dword_100044680 < a2;
    if (dword_100044680 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_100044684 > a3) {
    return 1;
  }
  return dword_100044684 >= a3 && dword_100044688 >= a4;
}

uint64_t sub_10002F370()
{
  return sub_10002F378(0);
}

uint64_t sub_10002F378(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_1000446A0;
  if (qword_1000446A0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_1000446A0 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        unsigned int v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            BOOL v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  char v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    unint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        BOOL v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          Swift::Int v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            unint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            unint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_100044680, &dword_100044684, &dword_100044688);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                unint64_t v16 = v26;
                              }
                              else
                              {
                                unint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10002F6E0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10002F6F0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10002F700()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10002F710()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10002F720()
{
  return IntentItem.value.getter();
}

uint64_t sub_10002F730()
{
  return IntentItem.init(_:)();
}

uint64_t sub_10002F750()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10002F760()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_10002F770()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_10002F780()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10002F790()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10002F7A0()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10002F7B0()
{
  return IntentParameter<>.init(title:description:pickerMode:selectionLimit:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10002F7C0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10002F7D0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10002F7E0()
{
  return _IntentPhotoItem.identifier.getter();
}

uint64_t sub_10002F7F0()
{
  return type metadata accessor for _IntentPhotoItem();
}

uint64_t sub_10002F800()
{
  return IntentItemSection.description.getter();
}

uint64_t sub_10002F810()
{
  return IntentItemSection.items.getter();
}

uint64_t sub_10002F820()
{
  return IntentItemSection.init(_:items:)();
}

uint64_t sub_10002F830()
{
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
}

uint64_t sub_10002F840()
{
  return IntentItemCollection.items.getter();
}

uint64_t sub_10002F850()
{
  return IntentItemCollection.sections.getter();
}

uint64_t sub_10002F860()
{
  return DisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10002F870()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10002F880()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_10002F890()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10002F8A0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10002F8B0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10002F8C0()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)();
}

uint64_t sub_10002F8D0()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)();
}

uint64_t sub_10002F8F0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10002F910()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10002F920()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10002F930()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10002F950()
{
  return type metadata accessor for _IntentPhotoItemCollection.PickerMode();
}

uint64_t sub_10002F960()
{
  return _IntentPhotoItemCollection.items.getter();
}

uint64_t sub_10002F970()
{
  return type metadata accessor for _IntentPhotoItemCollection();
}

uint64_t sub_10002F990()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_10002F9A0()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t sub_10002F9B0()
{
  return static CharacterSet.punctuationCharacters.getter();
}

uint64_t sub_10002F9C0()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_10002F9D0()
{
  return static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002F9E0()
{
  return CharacterSet.union(_:)();
}

uint64_t sub_10002F9F0()
{
  return CharacterSet.inverted.getter();
}

uint64_t sub_10002FA00()
{
  return CharacterSet.init()();
}

uint64_t sub_10002FA10()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_10002FA20()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_10002FA30()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_10002FA40()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_10002FA50()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_10002FA60()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_10002FA70()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_10002FA80()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10002FA90()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10002FAA0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10002FAB0()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_10002FAC0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10002FAD0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10002FAE0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002FAF0()
{
  return type metadata accessor for URL();
}

NSData sub_10002FB00()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10002FB10()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002FB20()
{
  return Date.description.getter();
}

uint64_t sub_10002FB30()
{
  return static Date.distantFuture.getter();
}

uint64_t sub_10002FB40()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10002FB50()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_10002FB60()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10002FB70()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_10002FB80()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002FB90()
{
  return Date.init()();
}

uint64_t sub_10002FBA0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10002FBB0()
{
  return static Locale.current.getter();
}

uint64_t sub_10002FBC0()
{
  return type metadata accessor for Locale();
}

NSNumber sub_10002FBD0()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_10002FBE0()
{
  return PhotosVerticalTextSpecs.maximumNumberOfLinesForTitle.getter();
}

uint64_t sub_10002FBF0()
{
  return static PhotosVerticalTextSpecs.default.getter();
}

uint64_t sub_10002FC00()
{
  return type metadata accessor for PhotosVerticalTextSpecs();
}

uint64_t sub_10002FC10()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10002FC20()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t sub_10002FC30()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_10002FC40()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_10002FC50()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_10002FC60()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_10002FC70()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10002FC90()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_10002FCA0()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_10002FCB0()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10002FCC0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10002FCD0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10002FCE0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_10002FCF0()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_10002FD00()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_10002FD10()
{
  return type metadata accessor for GeometryReader();
}

uint64_t sub_10002FD30()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_10002FD40()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_10002FD50()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_10002FD60()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_10002FD70()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10002FD80()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10002FD90()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10002FDA0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10002FDB0()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_10002FDC0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_10002FDD0()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10002FDE0()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_10002FDF0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10002FE00()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10002FE10()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10002FE20()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10002FE30()
{
  return static TextJustification.stretched.getter();
}

uint64_t sub_10002FE40()
{
  return type metadata accessor for TextJustification();
}

uint64_t sub_10002FE50()
{
  return static VerticalAlignment.== infix(_:_:)();
}

uint64_t sub_10002FE60()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_10002FE70()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t sub_10002FE80()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10002FE90()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10002FEA0()
{
  return static HorizontalAlignment.== infix(_:_:)();
}

uint64_t sub_10002FEB0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10002FEC0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10002FED0()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t sub_10002FEE0()
{
  return WidgetConfiguration.promptsForUserConfiguration()();
}

uint64_t sub_10002FEF0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10002FF00()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_10002FF10()
{
  return WidgetConfiguration.supportsAccentedContent()();
}

uint64_t sub_10002FF20()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10002FF30()
{
  return WidgetConfiguration._containerBackgroundRemovable(_:)();
}

uint64_t sub_10002FF40()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10002FF50()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_10002FF60()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_10002FF70()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10002FF80()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10002FF90()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10002FFA0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10002FFB0()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10002FFC0()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_10002FFD0()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10002FFE0()
{
  return Font.init(_:)();
}

uint64_t sub_10002FFF0()
{
  return static Text.WritingMode.verticalRightToLeft.getter();
}

uint64_t sub_100030000()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t sub_100030010()
{
  return Text.Measurements.numberOfLines(of:in:writingMode:)();
}

uint64_t sub_100030020()
{
  return Text.Measurements.init()();
}

uint64_t sub_100030030()
{
  return type metadata accessor for Text.Measurements();
}

uint64_t sub_100030040()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_100030050()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100030060()
{
  return Text.font(_:)();
}

uint64_t sub_100030070()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100030080()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100030090()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_1000300A0()
{
  return View.widgetURL(_:)();
}

uint64_t sub_1000300B0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000300C0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000300D0()
{
  return View.writingMode(_:)();
}

uint64_t sub_1000300E0()
{
  return View.justification(_:)();
}

uint64_t sub_1000300F0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100030110()
{
  return View.lineHeightMultiple(_:)();
}

uint64_t sub_100030120()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_100030130()
{
  return View.padding(_:_:)();
}

uint64_t sub_100030140()
{
  return View.redacted(reason:)();
}

uint64_t sub_100030150()
{
  return static Color.gray.getter();
}

uint64_t sub_100030160()
{
  return static Color.black.getter();
}

uint64_t sub_100030170()
{
  return static Color.clear.getter();
}

uint64_t sub_100030180()
{
  return static Color.white.getter();
}

uint64_t sub_100030190()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000301E0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000301F0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100030200()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100030210()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_100030220()
{
  return type metadata accessor for VStack();
}

uint64_t sub_100030230()
{
  return type metadata accessor for ZStack();
}

uint64_t sub_100030240()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_100030250()
{
  return Gradient.init(stops:)();
}

uint64_t sub_100030260()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_100030270()
{
  return static Alignment.center.getter();
}

uint64_t sub_100030280()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_100030290()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_1000302A0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_1000302B0()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_1000302C0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000302D0()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t sub_1000302E0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000302F0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100030300()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t sub_100030310()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100030320()
{
  return static DispatchTime.now()();
}

uint64_t sub_100030330()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100030340()
{
  return + infix(_:_:)();
}

uint64_t sub_100030350()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_100030360()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_100030370()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_100030380()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_100030390()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1000303A0()
{
  return WidgetFamily.rawValue.getter();
}

uint64_t sub_1000303B0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000303C0()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_1000303F0()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_100030400()
{
  return static TimelineReloadPolicy.after(_:)();
}

uint64_t sub_100030410()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100030420()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100030430()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100030440()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_100030450()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_100030460()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_100030470()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_100030490()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_1000304B0()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_1000304C0()
{
  return Timeline.entries.getter();
}

uint64_t sub_1000304E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000304F0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100030500()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_100030510()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100030520()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_100030530(Swift::String a1)
{
}

void sub_100030540(Swift::String a1)
{
}

uint64_t sub_100030550()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100030560()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100030570()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100030580()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100030590()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000305A0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000305B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000305C0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000305D0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_1000305E0()
{
  return String.hash(into:)();
}

void sub_1000305F0(Swift::String a1)
{
}

Swift::Int sub_100030600()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100030610()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100030620()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100030630()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100030640()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100030650()
{
  return Array.description.getter();
}

uint64_t sub_100030660()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100030670()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100030680()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100030690()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000306A0()
{
  return Double.write<A>(to:)();
}

uint64_t sub_1000306B0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000306C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000306D0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000306E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000306F0()
{
  return PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)();
}

uint64_t sub_100030700()
{
  return PHPhotoLibrary.localIdentifierMappings(for:)();
}

uint64_t sub_100030710()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100030720()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100030730()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100030740()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100030750()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100030760()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_100030770()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_100030780()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100030790()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_1000307A0()
{
  return static UIFontDescriptorTraitKey.design.getter();
}

uint64_t sub_1000307B0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_1000307C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000307D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000307E0()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_1000307F0()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_100030800()
{
  return StringProtocol.hash.getter();
}

uint64_t sub_100030810()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100030820()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100030830()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_100030840(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100030850()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100030860()
{
  return AnyHashable.init<A>(_:)();
}

void sub_100030870(Swift::Int a1)
{
}

uint64_t sub_100030880()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_100030890(Swift::Int a1)
{
}

uint64_t sub_1000308A0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000308B0()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_1000308C0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_1000308D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000308E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000308F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100030900()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100030910()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100030930(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100030940()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100030950()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100030960()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100030970()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100030980()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100030990()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000309A0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000309C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000309D0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000309E0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000309F0()
{
  return Hasher.init(_seed:)();
}

void sub_100030A00(Swift::UInt a1)
{
}

Swift::Int sub_100030A10()
{
  return Hasher._finalize()();
}

uint64_t sub_100030A20()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100030A30()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return _CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PFSharedFigDecodeSessionDiscardCachedBuffers()
{
  return _PFSharedFigDecodeSessionDiscardCachedBuffers();
}

uint64_t PXCappedFontWithTextStyleSymbolicTraits()
{
  return _PXCappedFontWithTextStyleSymbolicTraits();
}

uint64_t PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID()
{
  return _PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}