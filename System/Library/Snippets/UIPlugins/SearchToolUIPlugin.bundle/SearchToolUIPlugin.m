uint64_t sub_48D0()
{
  uint64_t v0;

  v0 = sub_A3B0();
  sub_4944(v0, qword_10488);
  sub_49A8(v0, (uint64_t)qword_10488);
  return sub_A3A0();
}

uint64_t *sub_4944(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_49A8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_49E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_A5F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    char *v10 = *v11;
    *((void *)v10 + 1) = *((void *)v11 + 1);
    v12 = (char *)a1 + v9;
    v13 = (char *)a2 + v9;
    uint64_t v14 = sub_A330();
    v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_retain();
    v15(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_4B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_A330();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_4BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(unsigned char *)uint64_t v9 = *(unsigned char *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  uint64_t v13 = sub_A330();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_retain();
  v14(v11, v12, v13);
  return a1;
}

uint64_t sub_4CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_retain();
  swift_release();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_A330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_4DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_A330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_4E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_release();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_A330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_4F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_4F54);
}

uint64_t sub_4F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_A5F0();
  sub_8620();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return sub_5014(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_A330();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t sub_5014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_503C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5050);
}

void sub_5050(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_A5F0();
  sub_8620();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
      return;
    }
    uint64_t v10 = sub_A330();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  sub_5100(v11, a2, a2, v10);
}

uint64_t sub_5100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for AttributionView()
{
  uint64_t result = qword_10130;
  if (!qword_10130) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_5170()
{
  uint64_t result = sub_A5F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_A330();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_5240()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_525C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AttributionView();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  sub_6E40(&qword_10170);
  sub_8610();
  __chkstk_darwin(v6);
  sub_8674();
  uint64_t v9 = v8 - v7;
  *(void *)uint64_t v9 = sub_A480();
  *(void *)(v9 + 8) = 0;
  *(unsigned char *)(v9 + 16) = 1;
  uint64_t v10 = sub_6E40(&qword_10178);
  sub_5490(v1, v9 + *(int *)(v10 + 44));
  uint64_t v15 = *(void *)(v1 + *(int *)(v3 + 28) + 8);
  sub_6E40(&qword_10180);
  sub_A570();
  v14[8] = v16;
  sub_821C(v1, (uint64_t)&v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], (void (*)(void))type metadata accessor for AttributionView);
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v12 = swift_allocObject();
  sub_6E88((uint64_t)&v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v12 + v11);
  sub_81D8(&qword_10188, &qword_10170);
  sub_A530();
  swift_release();
  return sub_83C8(v9, &qword_10170);
}

uint64_t sub_5490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_A400();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v43 = v4;
  __chkstk_darwin(v3);
  v37 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AttributionView();
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v36 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = sub_6E40(&qword_101A8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  uint64_t v39 = v9;
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_6E40(&qword_101B0);
  uint64_t v40 = *(void *)(v12 - 8);
  uint64_t v41 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_6E40(&qword_101B8);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v35 - v19;
  uint64_t v21 = type metadata accessor for FeedbackView();
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v26 = (char *)&v35 - v25;
  sub_A5E0();
  sub_821C(a1, (uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for AttributionView);
  unint64_t v27 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v28 = swift_allocObject();
  sub_6E88((uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
  uint64_t v45 = a1;
  sub_6E40(&qword_101C0);
  sub_7D98();
  sub_A590();
  v29 = v37;
  sub_A3F0();
  sub_81D8(&qword_10278, &qword_101A8);
  sub_82D4(&qword_10280, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v30 = v38;
  uint64_t v31 = v42;
  sub_A510();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v31);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v30);
  sub_A5A0();
  sub_8AA4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v18, 0.0, 1, 0.0, 1);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v41);
  sub_831C((uint64_t)v18, (uint64_t)v20, &qword_101B8);
  sub_821C((uint64_t)v26, (uint64_t)v24, (void (*)(void))type metadata accessor for FeedbackView);
  sub_8378((uint64_t)v20, (uint64_t)v18, &qword_101B8);
  uint64_t v32 = v44;
  sub_821C((uint64_t)v24, v44, (void (*)(void))type metadata accessor for FeedbackView);
  uint64_t v33 = sub_6E40(&qword_10288);
  sub_8378((uint64_t)v18, v32 + *(int *)(v33 + 48), &qword_101B8);
  sub_83C8((uint64_t)v20, &qword_101B8);
  sub_8280((uint64_t)v26, (void (*)(void))type metadata accessor for FeedbackView);
  sub_83C8((uint64_t)v18, &qword_101B8);
  return sub_8280((uint64_t)v24, (void (*)(void))type metadata accessor for FeedbackView);
}

uint64_t sub_5A28()
{
  return swift_release();
}

uint64_t sub_5ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_6E40(&qword_101F8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6E40(&qword_101E8);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_6E40(&qword_101D8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5CC0(a1, (uint64_t)v6);
  uint64_t KeyPath = swift_getKeyPath();
  sub_8378((uint64_t)v6, (uint64_t)v10, &qword_101F8);
  uint64_t v16 = &v10[*(int *)(v8 + 44)];
  *(void *)uint64_t v16 = KeyPath;
  v16[8] = 0;
  sub_83C8((uint64_t)v6, &qword_101F8);
  int v17 = sub_A4A0();
  sub_8378((uint64_t)v10, (uint64_t)v14, &qword_101E8);
  *(_DWORD *)&v14[*(int *)(v12 + 44)] = v17;
  sub_83C8((uint64_t)v10, &qword_101E8);
  uint64_t v18 = sub_A4C0();
  uint64_t v19 = swift_getKeyPath();
  sub_8378((uint64_t)v14, a2, &qword_101D8);
  v20 = (uint64_t *)(a2 + *(int *)(sub_6E40(&qword_101C0) + 36));
  uint64_t *v20 = v19;
  v20[1] = v18;
  return sub_83C8((uint64_t)v14, &qword_101D8);
}

uint64_t sub_5CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AttributionView() - 8;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A5B0();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v45 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6E40(&qword_10238);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v44 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v48 = (uint64_t)&v44 - v12;
  uint64_t v50 = sub_6E40(&qword_10290);
  __chkstk_darwin(v50);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_A3E0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v44 - v20;
  uint64_t v22 = a1 + *(int *)(v4 + 28);
  char v23 = *(unsigned char *)v22;
  uint64_t v24 = *(void *)(v22 + 8);
  char v52 = v23;
  uint64_t v53 = v24;
  sub_6E40(&qword_10180);
  sub_A570();
  uint64_t v51 = v9;
  uint64_t v49 = a2;
  if (v54 == 1)
  {
    sub_A470();
    type metadata accessor for SearchToolUIPlugin();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v26 = [self bundleForClass:ObjCClassFromMetadata];
    uint64_t v27 = sub_A4D0();
    uint64_t v29 = v28;
    char v31 = v30;
    uint64_t v33 = v32;
    sub_A3D0();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    sub_82D4(&qword_10298, (void (*)(uint64_t))&type metadata accessor for MoveTransition);
    uint64_t v34 = sub_A3C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    *(void *)uint64_t v14 = v27;
    *((void *)v14 + 1) = v29;
    unsigned char v14[16] = v31 & 1;
    *((void *)v14 + 3) = v33;
    *((void *)v14 + 4) = v34;
    swift_storeEnumTagMultiPayload();
    sub_6E40(&qword_10218);
    sub_8068();
    sub_8108();
    return sub_A490();
  }
  else
  {
    sub_62D4();
    uint64_t v37 = v36;
    sub_821C(a1, (uint64_t)v6, (void (*)(void))type metadata accessor for AttributionView);
    if (!v37) {
      sub_6588();
    }
    sub_8280((uint64_t)v6, (void (*)(void))type metadata accessor for AttributionView);
    uint64_t v38 = v45;
    sub_A5C0();
    sub_A3D0();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    sub_82D4(&qword_10298, (void (*)(uint64_t))&type metadata accessor for MoveTransition);
    uint64_t v39 = sub_A3C0();
    uint64_t v41 = v46;
    uint64_t v40 = v47;
    uint64_t v42 = (uint64_t)v44;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v44, v38, v47);
    *(void *)(v42 + *(int *)(v51 + 36)) = v39;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v38, v40);
    uint64_t v43 = v48;
    sub_831C(v42, v48, &qword_10238);
    sub_8378(v43, (uint64_t)v14, &qword_10238);
    swift_storeEnumTagMultiPayload();
    sub_6E40(&qword_10218);
    sub_8068();
    sub_8108();
    sub_A490();
    return sub_83C8(v43, &qword_10238);
  }
}

uint64_t sub_62D4()
{
  type metadata accessor for AttributionView();
  uint64_t v0 = sub_A320();
  uint64_t v1 = sub_6CFC(v0);
  if (*(void *)(v1 + 16) == 1)
  {
    uint64_t v2 = sub_6DB0(v1);
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    if (!v4) {
      return 0;
    }
    id v5 = objc_allocWithZone((Class)LSApplicationRecord);
    swift_bridgeObjectRetain();
    id v6 = sub_6F94(v2, (uint64_t)v4, 1);
    uint64_t v8 = v6;
    if (v6)
    {
      type metadata accessor for SearchToolUIPlugin();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v10 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
      v21._countAndFlagsBits = 0xD000000000000015;
      v20._countAndFlagsBits = 0x800000000000ABC0;
      v21._object = (void *)0x800000000000ABA0;
      v24.value._countAndFlagsBits = 0;
      v24.value._object = 0;
      v11.super.isa = v10;
      v25._countAndFlagsBits = 0;
      v25._object = (void *)0xE000000000000000;
      sub_A280(v21, v24, v11, v25, v20);

      sub_6E40(&qword_102A0);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_ADA0;
      uint64_t v13 = *(void *)(sub_A320() + 16);
      swift_bridgeObjectRelease();
      *(void *)(v12 + 56) = &type metadata for Int;
      *(void *)(v12 + 64) = &protocol witness table for Int;
      *(void *)(v12 + 32) = v13;
      sub_A6F0(23);
      swift_bridgeObjectRelease();
      v22._countAndFlagsBits = v2;
      v22._object = v4;
      sub_A660(v22);
      swift_bridgeObjectRelease();
      v23._countAndFlagsBits = 10535;
      v23._object = (void *)0xE200000000000000;
      sub_A660(v23);
      *(void *)(v12 + 96) = &type metadata for String;
      unint64_t v14 = sub_8418();
      *(void *)(v12 + 104) = v14;
      *(void *)(v12 + 72) = 0xD000000000000013;
      *(void *)(v12 + 80) = 0x800000000000AC90;
      id v15 = [v8 localizedName];
      uint64_t v16 = sub_A630();
      uint64_t v18 = v17;

      *(void *)(v12 + 136) = &type metadata for String;
      *(void *)(v12 + 144) = v14;
      *(void *)(v12 + 112) = v16;
      *(void *)(v12 + 120) = v18;
      uint64_t v7 = sub_A640();

      swift_bridgeObjectRelease();
      return v7;
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_6588()
{
  type metadata accessor for SearchToolUIPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v7._countAndFlagsBits = 0x800000000000AB40;
  v8._countAndFlagsBits = 0x535F444E41505845;
  v8._object = (void *)0xEE0053454352554FLL;
  v9.value._countAndFlagsBits = 0;
  v9.value._object = 0;
  v2.super.isa = v1;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  sub_A280(v8, v9, v2, v10, v7);

  sub_6E40(&qword_102A0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_ADB0;
  type metadata accessor for AttributionView();
  uint64_t v4 = *(void *)(sub_A320() + 16);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 56) = &type metadata for Int;
  *(void *)(v3 + 64) = &protocol witness table for Int;
  *(void *)(v3 + 32) = v4;
  uint64_t v5 = sub_A640();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_66D0(uint64_t a1, char *a2)
{
  uint64_t v3 = sub_A610();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *a2;
  id v8 = sub_69A4(*a2);
  if (v8)
  {
    Swift::String_optional v9 = v8;
    if (qword_100D0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_A3B0();
    sub_49A8(v10, (uint64_t)qword_10488);
    NSBundle v11 = sub_A390();
    os_log_type_t v12 = sub_A680();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 67109120;
      int v20 = v7;
      sub_A6C0();
      _os_log_impl(&dword_0, v11, v12, "Sending command to update expansion to: %{BOOL}d", v13, 8u);
      swift_slowDealloc();
    }

    sub_A5D0();
    id v14 = v9;
    sub_A600();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    if (qword_100D0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_A3B0();
    sub_49A8(v15, (uint64_t)qword_10488);
    os_log_t v19 = (os_log_t)sub_A390();
    os_log_type_t v16 = sub_A690();
    if (os_log_type_enabled(v19, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v19, v16, "Unable to build snippet update command", v17, 2u);
      swift_slowDealloc();
    }
    os_log_t v18 = v19;
  }
}

id sub_69A4(char a1)
{
  sub_A360();
  sub_85F4();
  v33[1] = v2;
  v33[2] = v3;
  __chkstk_darwin(v2);
  sub_8674();
  v33[0] = v5 - v4;
  uint64_t v6 = sub_A300();
  sub_85F4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_8674();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_A340();
  sub_85F4();
  uint64_t v15 = v14;
  uint64_t v17 = __chkstk_darwin(v16);
  os_log_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  Swift::String v21 = (char *)v33 - v20;
  Swift::String v22 = (unsigned int *)&enum case for UpdatePresentation.PresentationStyle.expanded(_:);
  if ((a1 & 1) == 0) {
    Swift::String v22 = (unsigned int *)&enum case for UpdatePresentation.PresentationStyle.collapsed(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v15 + 104))((char *)v33 - v20, *v22, v13);
  id v23 = [objc_allocWithZone((Class)SAUIUpdateVisualResponseSnippet) init];
  sub_A2F0();
  uint64_t v24 = sub_A2E0();
  uint64_t v26 = v25;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  sub_7B6C(v24, v26, v23, (SEL *)&selRef_setAceId_);

  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v21, v13);
  sub_A350();
  sub_82D4(&qword_10190, (void (*)(uint64_t))&type metadata accessor for UpdatePresentation);
  sub_82D4(&qword_10198, (void (*)(uint64_t))&type metadata accessor for UpdatePresentation);
  sub_82D4(&qword_101A0, (void (*)(uint64_t))&type metadata accessor for UpdatePresentation);
  uint64_t v27 = sub_A370();
  unint64_t v29 = v28;
  uint64_t v30 = sub_864C();
  v31(v30);
  sub_7B14(v27, v29, v23);
  sub_7B6C(0xD000000000000033, 0x800000000000AAA0, v23, (SEL *)&selRef_setViewId_);
  sub_7BD8(v27, v29);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v13);
  return v23;
}

uint64_t sub_6CFC(uint64_t a1)
{
  uint64_t v2 = sub_A670();
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
      sub_7070(&v9, v5, v6);
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

uint64_t sub_6DB0(uint64_t a1)
{
  uint64_t result = sub_84E0(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  else {
    return sub_8464(result, v3, 0, a1);
  }
}

uint64_t sub_6E20()
{
  return sub_A520();
}

uint64_t sub_6E40(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_6EEC(uint64_t a1, char *a2)
{
  uint64_t v4 = type metadata accessor for AttributionView();
  sub_8638(v4);

  sub_66D0(a1, a2);
}

uint64_t sub_6F4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_6F94(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_A620();
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
    sub_A290();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_7070(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_A760();
  swift_bridgeObjectRetain();
  sub_A650();
  Swift::Int v8 = sub_A780();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_A700() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_A700() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_74FC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_7220()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_6E40(&qword_102B0);
  uint64_t v3 = sub_A6E0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
      sub_A760();
      sub_A650();
      uint64_t result = sub_A780();
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
      *unint64_t v28 = v18;
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
                sub_7698(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
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
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_74FC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_7220();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_76B4();
      goto LABEL_22;
    }
    sub_7868();
  }
  uint64_t v11 = *v4;
  sub_A760();
  sub_A650();
  uint64_t result = sub_A780();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_A700(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_A710();
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
          uint64_t result = sub_A700();
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
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

uint64_t sub_7698(uint64_t result, uint64_t a2, void *a3)
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

void *sub_76B4()
{
  uint64_t v1 = v0;
  sub_6E40(&qword_102B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_A6D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
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

uint64_t sub_7868()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_6E40(&qword_102B0);
  uint64_t v3 = sub_A6E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_A760();
    swift_bridgeObjectRetain();
    sub_A650();
    uint64_t result = sub_A780();
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
    *unint64_t v28 = v18;
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

void sub_7B14(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_A2D0().super.isa;
  [a3 setStateData:isa];
}

void sub_7B6C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6 = sub_A620();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_7BD8(uint64_t a1, unint64_t a2)
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

uint64_t sub_7C34()
{
  uint64_t v1 = *(void *)(type metadata accessor for AttributionView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_A5F0();
  sub_8610();
  sub_8668();
  v5();
  swift_release();
  sub_A330();
  sub_8610();
  sub_8668();
  v6();

  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_7D50()
{
  uint64_t v0 = type metadata accessor for AttributionView();
  sub_8638(v0);

  return sub_5A28();
}

uint64_t sub_7D90@<X0>(uint64_t a1@<X8>)
{
  return sub_5ACC(*(void *)(v1 + 16), a1);
}

unint64_t sub_7D98()
{
  unint64_t result = qword_101C8;
  if (!qword_101C8)
  {
    sub_6F4C(&qword_101C0);
    sub_7E38();
    sub_81D8(&qword_10268, &qword_10270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_101C8);
  }
  return result;
}

unint64_t sub_7E38()
{
  unint64_t result = qword_101D0;
  if (!qword_101D0)
  {
    sub_6F4C(&qword_101D8);
    sub_7ED8();
    sub_81D8(&qword_10258, &qword_10260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_101D0);
  }
  return result;
}

unint64_t sub_7ED8()
{
  unint64_t result = qword_101E0;
  if (!qword_101E0)
  {
    sub_6F4C(&qword_101E8);
    sub_7F78();
    sub_81D8(&qword_10248, &qword_10250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_101E0);
  }
  return result;
}

unint64_t sub_7F78()
{
  unint64_t result = qword_101F0;
  if (!qword_101F0)
  {
    sub_6F4C(&qword_101F8);
    sub_7FEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_101F0);
  }
  return result;
}

unint64_t sub_7FEC()
{
  unint64_t result = qword_10200;
  if (!qword_10200)
  {
    sub_6F4C(&qword_10208);
    sub_8068();
    sub_8108();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10200);
  }
  return result;
}

unint64_t sub_8068()
{
  unint64_t result = qword_10210;
  if (!qword_10210)
  {
    sub_6F4C(&qword_10218);
    sub_81D8(&qword_10220, &qword_10228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10210);
  }
  return result;
}

unint64_t sub_8108()
{
  unint64_t result = qword_10230;
  if (!qword_10230)
  {
    sub_6F4C(&qword_10238);
    sub_82D4(&qword_10240, (void (*)(uint64_t))&type metadata accessor for RichTextView);
    sub_81D8(&qword_10220, &qword_10228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10230);
  }
  return result;
}

uint64_t sub_81D8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6F4C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_821C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_8610();
  uint64_t v4 = sub_8684();
  v5(v4);
  return a2;
}

uint64_t sub_8280(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_8610();
  sub_8668();
  v3();
  return a1;
}

uint64_t sub_82D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_831C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_6E40(a3);
  sub_8610();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_8378(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_6E40(a3);
  sub_8610();
  uint64_t v4 = sub_8684();
  v5(v4);
  return a2;
}

uint64_t sub_83C8(uint64_t a1, uint64_t *a2)
{
  sub_6E40(a2);
  sub_8610();
  sub_8668();
  v3();
  return a1;
}

unint64_t sub_8418()
{
  unint64_t result = qword_102A8;
  if (!qword_102A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_102A8);
  }
  return result;
}

uint64_t sub_8464(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    uint64_t v4 = *(void *)(*(void *)(a4 + 48) + 16 * result);
    swift_bridgeObjectRetain();
    return v4;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_84E0(uint64_t a1)
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
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_8560()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_8638(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_864C()
{
  return v0;
}

uint64_t sub_8684()
{
  return v0;
}

uint64_t sub_8698(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();
  char v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_8704(uint64_t a1)
{
  uint64_t v2 = sub_A5F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_8768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_87CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_8830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_8894(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_88F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_890C);
}

uint64_t sub_890C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();

  return sub_5014(a1, a2, v4);
}

uint64_t sub_8954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8968);
}

uint64_t sub_8968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A5F0();

  return sub_5100(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FeedbackView()
{
  uint64_t result = qword_10310;
  if (!qword_10310) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_89FC()
{
  uint64_t result = sub_A5F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_8A88()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_8AA4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_A6A0();
    unint64_t v23 = (void *)sub_A4B0();
    sub_A380();
  }
  sub_A410();
  uint64_t v24 = sub_6E40(&qword_101B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = sub_6E40(&qword_101B8);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

uint64_t sub_8C70@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_A6A0();
    unint64_t v23 = (void *)sub_A4B0();
    sub_A380();
  }
  sub_A410();
  memcpy((void *)a9, v13, 0x51uLL);
  memcpy((void *)(a9 + 88), __src, 0x70uLL);

  return sub_98C8((uint64_t)v13);
}

uint64_t sub_8E18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FeedbackView();
  uint64_t v4 = sub_9A44(v3);
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v4);
  if AFIsInternalInstall() && (sub_93E0(), (sub_A6B0()))
  {
    sub_9420(v1, (uint64_t)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v10 = swift_allocObject();
    sub_9538((uint64_t)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
    sub_6E40(&qword_10358);
    sub_95FC();
    sub_A590();
    uint64_t v11 = sub_6E40(&qword_10348);
    return sub_5100(a1, 0, 1, v11);
  }
  else
  {
    uint64_t v13 = sub_6E40(&qword_10348);
    return sub_5100(a1, 1, 1, v13);
  }
}

uint64_t sub_8FAC()
{
  uint64_t v0 = sub_A610();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_6E40(&qword_10398);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
  sub_A2B0();
  uint64_t v8 = sub_A2C0();
  uint64_t v10 = 0;
  if (sub_5014((uint64_t)v6, 1, v8) != 1)
  {
    sub_A2A0(v9);
    uint64_t v10 = v11;
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  [v7 setPunchOutUri:v10];

  sub_A5D0();
  id v12 = v7;
  sub_A600();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void *sub_9198@<X0>(uint64_t a1@<X8>)
{
  sub_A460();
  sub_92D0((uint64_t)__src);
  uint64_t v2 = __src[2];
  uint64_t v3 = __src[3];
  char v4 = __src[4];
  sub_A5A0();
  sub_8C70(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1);
  swift_release();
  swift_release();
  sub_97DC(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  int v5 = sub_A4A0();
  uint64_t v6 = sub_A4C0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = memcpy((void *)a1, __src, 0xC8uLL);
  *(_DWORD *)(a1 + 200) = v5;
  *(void *)(a1 + 208) = KeyPath;
  *(void *)(a1 + 216) = v6;
  return result;
}

uint64_t sub_92D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_A550();
  uint64_t v3 = sub_A540();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = 0xD000000000000023;
  *(void *)(a1 + 24) = 0x800000000000AD00;
  *(unsigned char *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 48) = KeyPath;
  *(unsigned char *)(a1 + 56) = 0;
  swift_retain();
  swift_retain();
  sub_9944(0xD000000000000023, 0x800000000000AD00, 0);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_97DC(0xD000000000000023, 0x800000000000AD00, 0);
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_93E0()
{
  unint64_t result = qword_10350;
  if (!qword_10350)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10350);
  }
  return result;
}

uint64_t sub_9420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeedbackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_9484()
{
  uint64_t v1 = type metadata accessor for FeedbackView();
  sub_9A44(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;
  uint64_t v11 = sub_A5F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);

  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_9538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeedbackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_959C()
{
  type metadata accessor for FeedbackView();

  return sub_8FAC();
}

unint64_t sub_95FC()
{
  unint64_t result = qword_10360;
  if (!qword_10360)
  {
    sub_6F4C(&qword_10358);
    sub_969C();
    sub_81D8(&qword_10268, &qword_10270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10360);
  }
  return result;
}

unint64_t sub_969C()
{
  unint64_t result = qword_10368;
  if (!qword_10368)
  {
    sub_6F4C(&qword_10370);
    sub_973C();
    sub_81D8(&qword_10258, &qword_10260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10368);
  }
  return result;
}

unint64_t sub_973C()
{
  unint64_t result = qword_10378;
  if (!qword_10378)
  {
    sub_6F4C(&qword_10380);
    sub_81D8(&qword_10388, &qword_10390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10378);
  }
  return result;
}

uint64_t sub_97DC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_97EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_A420();
  *a1 = result;
  return result;
}

uint64_t sub_9818()
{
  return sub_A430();
}

uint64_t sub_9840@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A440();
  *a1 = result;
  return result;
}

uint64_t sub_986C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A440();
  *a1 = result;
  return result;
}

uint64_t sub_9898()
{
  return sub_A450();
}

uint64_t sub_98C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(unsigned char *)(a1 + 56);
  swift_retain();
  swift_retain();
  sub_9944(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_9944(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_9954@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_A420();
  *a1 = result;
  return result;
}

uint64_t sub_9980()
{
  return sub_A430();
}

unint64_t sub_99AC()
{
  unint64_t result = qword_103A0;
  if (!qword_103A0)
  {
    sub_6F4C(&qword_103A8);
    sub_81D8(&qword_103B0, &qword_10348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_103A0);
  }
  return result;
}

uint64_t sub_9A44(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_9A5C()
{
  return swift_allocObject();
}

uint64_t sub_9A6C(uint64_t a1)
{
  sub_9AE4(a1, v4);
  if (!v2)
  {
    sub_A004(v4, v4[3]);
    uint64_t v1 = sub_A4E0();
    sub_A048((uint64_t)v4);
  }
  return v1;
}

uint64_t sub_9AE4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_A330();
  sub_85F4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_A310();
  sub_85F4();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  unint64_t v15 = &v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, v10);
  int v16 = (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 88))(v15, v10);
  if (v16 == enum case for SearchToolSnippetPluginModel.attribution(_:))
  {
    (*(void (**)(unsigned char *, uint64_t))(v12 + 96))(v15, v10);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v9, v15, v4);
    uint64_t v17 = type metadata accessor for AttributionView();
    a2[3] = v17;
    a2[4] = sub_9FBC(&qword_10478, (void (*)(uint64_t))type metadata accessor for AttributionView);
    uint64_t v18 = sub_9F58(a2);
    (*(void (**)(char *, unsigned char *, uint64_t))(v6 + 16))((char *)v18 + *(int *)(v17 + 24), v9, v4);
    sub_A5E0();
    uint64_t v19 = (char *)v18 + *(int *)(v17 + 20);
    char v24 = 0;
    sub_A560();
    uint64_t v20 = v23;
    *uint64_t v19 = v22[0];
    *((void *)v19 + 1) = v20;
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v4);
  }
  else if (v16 == enum case for SearchToolSnippetPluginModel.feedback(_:))
  {
    a2[3] = type metadata accessor for FeedbackView();
    a2[4] = sub_9FBC(&qword_10470, (void (*)(uint64_t))type metadata accessor for FeedbackView);
    sub_9F58(a2);
    return sub_A5E0();
  }
  else
  {
    sub_9F0C();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v15, v10);
  }
}

uint64_t sub_9DD8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SearchToolUIPlugin()
{
  return self;
}

uint64_t sub_9E0C()
{
  return sub_9FBC(&qword_10460, (void (*)(uint64_t))&type metadata accessor for SearchToolSnippetPluginModel);
}

void sub_9E54()
{
}

Swift::Int sub_9E7C()
{
  return sub_A780();
}

uint64_t sub_9EC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9A5C();
  *a1 = result;
  return result;
}

uint64_t sub_9EE8(uint64_t a1)
{
  return sub_9A6C(a1);
}

unint64_t sub_9F0C()
{
  unint64_t result = qword_10468;
  if (!qword_10468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10468);
  }
  return result;
}

uint64_t *sub_9F58(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_9FBC(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_A004(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_A048(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t getEnumTagSinglePayload for SearchToolUIPluginError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SearchToolUIPluginError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0xA18CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_A1B4()
{
  return 0;
}

ValueMetadata *type metadata accessor for SearchToolUIPluginError()
{
  return &type metadata for SearchToolUIPluginError;
}

unint64_t sub_A1D4()
{
  unint64_t result = qword_10480;
  if (!qword_10480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10480);
  }
  return result;
}

uint64_t sub_A220()
{
  return 1;
}

Swift::Int sub_A230()
{
  return sub_A780();
}

uint64_t sub_A280(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_A290()
{
  return _convertNSErrorToError(_:)();
}

void sub_A2A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_A2B0()
{
  return URL.init(string:)();
}

uint64_t sub_A2C0()
{
  return type metadata accessor for URL();
}

NSData sub_A2D0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_A2E0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_A2F0()
{
  return UUID.init()();
}

uint64_t sub_A300()
{
  return type metadata accessor for UUID();
}

uint64_t sub_A310()
{
  return type metadata accessor for SearchToolSnippetPluginModel();
}

uint64_t sub_A320()
{
  return AttributionViewModel.sourceBundles.getter();
}

uint64_t sub_A330()
{
  return type metadata accessor for AttributionViewModel();
}

uint64_t sub_A340()
{
  return type metadata accessor for UpdatePresentation.PresentationStyle();
}

uint64_t sub_A350()
{
  return UpdatePresentation.init(style:)();
}

uint64_t sub_A360()
{
  return type metadata accessor for UpdatePresentation();
}

uint64_t sub_A370()
{
  return UpdateResponseCommand<>.serializeData()();
}

uint64_t sub_A380()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_A390()
{
  return Logger.logObject.getter();
}

uint64_t sub_A3A0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_A3B0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_A3C0()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t sub_A3D0()
{
  return MoveTransition.init(edge:)();
}

uint64_t sub_A3E0()
{
  return type metadata accessor for MoveTransition();
}

uint64_t sub_A3F0()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_A400()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_A410()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_A420()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_A430()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_A440()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_A450()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_A460()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_A470()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_A480()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_A490()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_A4A0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_A4B0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_A4C0()
{
  return static Font.callout.getter();
}

uint64_t sub_A4D0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_A4E0()
{
  return View.eraseToAnyView()();
}

uint64_t sub_A4F0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_A500()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_A510()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_A520()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_A530()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_A540()
{
  return static Color.yellow.getter();
}

uint64_t sub_A550()
{
  return Image.init(systemName:)();
}

uint64_t sub_A560()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_A570()
{
  return State.wrappedValue.getter();
}

uint64_t sub_A580()
{
  return State.wrappedValue.setter();
}

uint64_t sub_A590()
{
  return Button.init(action:label:)();
}

uint64_t sub_A5A0()
{
  return static Alignment.leading.getter();
}

uint64_t sub_A5B0()
{
  return type metadata accessor for RichTextView();
}

uint64_t sub_A5C0()
{
  return RichTextView.init(_:)();
}

uint64_t sub_A5D0()
{
  return InteractionDelegate.wrappedValue.getter();
}

uint64_t sub_A5E0()
{
  return InteractionDelegate.init()();
}

uint64_t sub_A5F0()
{
  return type metadata accessor for InteractionDelegate();
}

uint64_t sub_A600()
{
  return InteractionDelegateWrapper.perform(aceCommand:)();
}

uint64_t sub_A610()
{
  return type metadata accessor for InteractionDelegateWrapper();
}

NSString sub_A620()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A630()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A640()
{
  return String.init(format:_:)();
}

uint64_t sub_A650()
{
  return String.hash(into:)();
}

void sub_A660(Swift::String a1)
{
}

uint64_t sub_A670()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_A680()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_A690()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_A6A0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_A6B0()
{
  return static NSUserDefaults.allowFeedbackUI.getter();
}

uint64_t sub_A6C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A6D0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_A6E0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_A6F0(Swift::Int a1)
{
}

uint64_t sub_A700()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A710()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_A720()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_A730()
{
  return Error._code.getter();
}

uint64_t sub_A740()
{
  return Error._domain.getter();
}

uint64_t sub_A750()
{
  return Error._userInfo.getter();
}

uint64_t sub_A760()
{
  return Hasher.init(_seed:)();
}

void sub_A770(Swift::UInt a1)
{
}

Swift::Int sub_A780()
{
  return Hasher._finalize()();
}

uint64_t AFIsInternalInstall()
{
  return _AFIsInternalInstall();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}