void type metadata accessor for VRXIdiom()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_18160)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18160);
    }
  }
}

BOOL sub_51EC(uint64_t *a1, uint64_t *a2)
{
  return sub_D4E8(*a1, *a2);
}

void sub_51F8(uint64_t a1@<X8>)
{
  sub_522C();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_5234@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t *sub_5264(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_11950();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    void *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_533C(uint64_t a1)
{
  uint64_t v2 = sub_11950();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_53B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_543C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_54D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_5554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_55E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_55F4);
}

uint64_t sub_55F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_11950();
  sub_5B8C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_5684(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_5684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_56AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_56C0);
}

void sub_56C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_11950();
  sub_5B8C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_574C(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_574C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for BadgedImageView()
{
  uint64_t result = qword_181C0;
  if (!qword_181C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_57BC()
{
  uint64_t result = sub_11950();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_5850()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_586C@<X0>(uint64_t a1@<X8>)
{
  v16[1] = a1;
  sub_11970();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = sub_118F0();
  sub_5B70();
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_11950();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, v1, v8);
  uint64_t v9 = *(uint64_t (**)(char *, void, uint64_t))(v4 + 104);
  uint64_t v10 = v9(v7, enum case for ImageElement.SourceType.contact(_:), v2);
  __chkstk_darwin(v10);
  type metadata accessor for BadgedImageView();
  sub_118E0();
  sub_5B70();
  __chkstk_darwin(v11);
  (*(void (**)(char *, void))(v13 + 104))((char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for ImageElement.ImageStyle.default(_:));
  swift_bridgeObjectRetain();
  sub_11900();
  v9(v7, enum case for ImageElement.SourceType.appIcon(_:), v2);
  sub_118C0();
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v2);
  v14(v7, v2);
  return sub_11E10();
}

uint64_t sub_5AD8()
{
  return sub_11D10();
}

uint64_t sub_5AF0()
{
  return sub_11D20();
}

uint64_t sub_5B08()
{
  return sub_11D30();
}

unint64_t sub_5B2C()
{
  unint64_t result = qword_181F8;
  if (!qword_181F8)
  {
    sub_11E00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_181F8);
  }
  return result;
}

uint64_t *sub_5BA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_11A30();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_11E80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (char *)a2 + v12;
    v16 = *(void **)v14;
    uint64_t v15 = *((void *)v14 + 1);
    *uint64_t v13 = v16;
    v13[1] = v15;
    id v17 = v16;
  }
  return a1;
}

void sub_5CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_11A30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_5D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  uint64_t v15 = *(void **)v13;
  uint64_t v14 = *(void *)(v13 + 8);
  *uint64_t v12 = v15;
  v12[1] = v14;
  id v16 = v15;
  return a1;
}

uint64_t sub_5E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void **)(a1 + v11);
  uint64_t v15 = *(void **)v13;
  *uint64_t v12 = *(void *)v13;
  id v16 = v15;

  v12[1] = *(void *)(v13 + 8);
  return a1;
}

uint64_t sub_5F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_6014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = *(void **)(a1 + v11);
  *uint64_t v12 = *v13;

  v12[1] = v13[1];
  return a1;
}

uint64_t sub_60F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_610C);
}

uint64_t sub_610C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_11A30();
  sub_5B8C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return sub_5684(v9, a2, v8);
  }
  sub_11E80();
  sub_5B8C();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t sub_61CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_61E0);
}

void sub_61E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_11A30();
  sub_5B8C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_11E80();
    sub_5B8C();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  sub_574C(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ContactConfirmationView()
{
  uint64_t result = qword_18258;
  if (!qword_18258) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_62D8()
{
  uint64_t result = sub_11A30();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_11E80();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_63A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_63C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v52 = a1;
  type metadata accessor for ContactConfirmationView();
  sub_7924();
  uint64_t v47 = v4;
  __chkstk_darwin(v5);
  uint64_t v48 = v6;
  uint64_t v49 = (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_119D0();
  sub_5B70();
  uint64_t v50 = v8;
  uint64_t v51 = v7;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_119E0();
  uint64_t v11 = sub_11A00();
  uint64_t v45 = v12;
  uint64_t v46 = v11;
  uint64_t v13 = sub_118E0();
  sub_5B70();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_7974();
  uint64_t v17 = *(int *)(v1 + 32);
  v41 = (uint64_t *)v2;
  uint64_t v18 = *(void **)(v2 + v17);
  if (v18)
  {
    id v19 = v18;
    sub_11F40();

    char v20 = sub_11FB0();
    v21 = (unsigned int *)&enum case for ImageElement.ImageStyle.contactImage4(_:);
    if (v20) {
      v21 = (unsigned int *)&enum case for ImageElement.ImageStyle.contactImage3(_:);
    }
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v3, *v21, v13);
    uint64_t v22 = sub_11DB0();
    uint64_t v43 = v13;
    v44 = &v39;
    sub_5B70();
    uint64_t v24 = v23;
    uint64_t v26 = *(void *)(v25 + 64);
    __chkstk_darwin(v27);
    v28 = (char *)&v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    type metadata accessor for PresentationUtilities();
    uint64_t v40 = v3;
    sub_119B0();
    v42 = v10;
    sub_EACC(v3, (uint64_t)v28);
    swift_bridgeObjectRelease();
    uint64_t v29 = v49;
    uint64_t v30 = sub_72D8((uint64_t)v41, v49);
    v41 = &v39;
    __chkstk_darwin(v30);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v28, v28, v22);
    unint64_t v31 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    unint64_t v32 = (v48 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v33 = (*(unsigned __int8 *)(v24 + 80) + v32 + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    uint64_t v34 = swift_allocObject();
    sub_74A0(v29, v34 + v31);
    v35 = (uint64_t *)(v34 + v32);
    uint64_t v36 = v45;
    uint64_t *v35 = v46;
    v35[1] = v36;
    (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v34 + v33, v28, v22);
    sub_75CC(&qword_182A0);
    sub_78E0(&qword_182A8, &qword_182A0);
    sub_11DD0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v22);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v40, v43);
    sub_7968();
    return v37();
  }
  else
  {
    sub_11F50();
    sub_7294();
    uint64_t result = sub_11B70();
    __break(1u);
  }
  return result;
}

uint64_t sub_67A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  v75 = a5;
  uint64_t v9 = type metadata accessor for ContactConfirmationView();
  uint64_t v63 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v63 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v74 = sub_11EA0();
  v78 = *(void **)(v74 - 8);
  uint64_t v72 = v78[8];
  __chkstk_darwin(v74);
  unint64_t v73 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v77 = (char *)&v56 - v73;
  uint64_t v12 = sub_119F0();
  v92 = &type metadata for String;
  v93 = &protocol witness table for String;
  uint64_t v90 = v12;
  uint64_t v91 = v13;
  v88 = &type metadata for String;
  v89 = &protocol witness table for String;
  uint64_t v86 = a2;
  uint64_t v87 = a3;
  uint64_t v85 = 0;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v82 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v14 = sub_11DB0();
  v79[3] = v14;
  v79[4] = (uint64_t)&protocol witness table for RFImageView;
  uint64_t v15 = sub_7658(v79);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v15, a4, v14);
  swift_bridgeObjectRetain();
  sub_11E90();
  uint64_t v71 = sub_11DF0();
  uint64_t v70 = *(void *)(v71 - 8);
  uint64_t v68 = *(void *)(v70 + 64);
  __chkstk_darwin(v71);
  unint64_t v69 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  v76 = (char *)&v56 - v69;
  uint64_t v66 = sub_75CC(&qword_182B0);
  uint64_t v67 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_75CC(&qword_182B8);
  uint64_t v57 = *(void *)(v19 - 8);
  uint64_t v64 = *(void *)(v57 + 64);
  __chkstk_darwin(v19);
  unint64_t v65 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  v21 = (char *)&v56 - v65;
  uint64_t v60 = a1;
  uint64_t v90 = sub_11A20();
  uint64_t v91 = v22;
  uint64_t v58 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_72D8(a1, v58);
  uint64_t v23 = *(unsigned __int8 *)(v63 + 80);
  uint64_t v62 = ((v23 + 16) & ~v23) + v10;
  uint64_t v24 = (v23 + 16) & ~v23;
  uint64_t v63 = v24;
  uint64_t v61 = v23 | 7;
  uint64_t v25 = swift_allocObject();
  sub_74A0((uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
  unint64_t v59 = sub_76EC();
  sub_11D70();
  uint64_t v26 = sub_11DA0();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v56 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v29, enum case for ButtonItemButtonStyle.Role.preferred(_:), v26);
  uint64_t v90 = sub_11D60();
  sub_11B60();
  uint64_t v90 = sub_11D50();
  sub_11B60();
  uint64_t v30 = sub_78E0(&qword_182C8, &qword_182B8);
  sub_11CE0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  unint64_t v31 = *(void (**)(char *, uint64_t))(v57 + 8);
  v31(v21, v19);
  uint64_t v90 = v19;
  uint64_t v91 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = v66;
  uint64_t v33 = sub_11CD0();
  uint64_t v34 = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v18, v32);
  v92 = &type metadata for AnyView;
  v93 = &protocol witness table for AnyView;
  uint64_t v90 = v33;
  __chkstk_darwin(v34);
  v35 = (char *)&v56 - v65;
  uint64_t v36 = v60;
  uint64_t v86 = sub_11A10();
  uint64_t v87 = v37;
  uint64_t v38 = v58;
  sub_72D8(v36, v58);
  uint64_t v39 = swift_allocObject();
  sub_74A0(v38, v39 + v63);
  sub_11D70();
  uint64_t v40 = sub_11CD0();
  v31(v35, v19);
  v88 = &type metadata for AnyView;
  v89 = &protocol witness table for AnyView;
  uint64_t v86 = v40;
  v41 = v76;
  uint64_t v42 = sub_11DE0();
  __chkstk_darwin(v42);
  uint64_t v43 = (char *)&v56 - v73;
  v44 = (uint64_t (*)(char *, char *, uint64_t))v78[2];
  uint64_t v45 = v74;
  uint64_t v46 = v44((char *)&v56 - v73, v77, v74);
  __chkstk_darwin(v46);
  uint64_t v47 = (char *)&v56 - v69;
  uint64_t v48 = v70;
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  uint64_t v50 = v71;
  v49((char *)&v56 - v69, v41, v71);
  uint64_t v51 = v75;
  v44(v75, v43, v45);
  uint64_t v52 = sub_75CC(&qword_182D0);
  v49(&v51[*(int *)(v52 + 48)], v47, v50);
  v53 = *(void (**)(char *, uint64_t))(v48 + 8);
  v53(v76, v50);
  v54 = (void (*)(char *, uint64_t))v78[1];
  v54(v77, v45);
  v53(v47, v50);
  return ((uint64_t (*)(char *, uint64_t))v54)(v43, v45);
}

uint64_t sub_7074(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v5 = sub_11AA0();
  sub_5B70();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_11F30();
  sub_5B70();
  uint64_t v21 = v11;
  __chkstk_darwin(v12);
  sub_7974();
  type metadata accessor for ContactConfirmationView();
  uint64_t v13 = sub_11E60();
  a2(v13);
  sub_75CC(&qword_182D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_12520;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for ContactResolutionCommonKeys.button(_:), v5);
  uint64_t v15 = sub_11A90();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  uint64_t v25 = v15;
  uint64_t v26 = v17;
  sub_11FC0();
  *(void *)(inited + 96) = &type metadata for String;
  uint64_t v18 = v23;
  *(void *)(inited + 72) = v22;
  *(void *)(inited + 80) = v18;
  sub_11F60();
  sub_11F20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_7968();
  return v19();
}

unint64_t sub_7294()
{
  unint64_t result = qword_18298;
  if (!qword_18298)
  {
    sub_11F50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18298);
  }
  return result;
}

uint64_t sub_72D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_733C()
{
  type metadata accessor for ContactConfirmationView();
  sub_7924();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v6 = (*(void *)(v5 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = sub_11DB0();
  sub_5B70();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (v6 + v12 + 16) & ~v12;
  uint64_t v14 = v13 + *(void *)(v11 + 64);
  uint64_t v15 = v3 | v12 | 7;
  sub_11A30();
  sub_7940();
  sub_7968();
  v16();
  sub_11E80();
  sub_7940();
  sub_7968();
  v17();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1 + v13, v7);

  return _swift_deallocObject(v1, v14, v15);
}

uint64_t sub_74A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_7504@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ContactConfirmationView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_11DB0();
  sub_7954(v6);
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v5 + 8);
  uint64_t v10 = v1 + ((v5 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_67A4(v1 + v4, v8, v9, v10, a1);
}

uint64_t sub_75CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7610(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_7658(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_76C0()
{
  return sub_7854((void (*)(uint64_t))&ContactConfirmationModel.primaryButtonInvocationID.getter, 0x7972616D697270, 0xE700000000000000);
}

unint64_t sub_76EC()
{
  unint64_t result = qword_182C0;
  if (!qword_182C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_182C0);
  }
  return result;
}

uint64_t sub_773C()
{
  type metadata accessor for ContactConfirmationView();
  sub_7924();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v1 + v7;
  sub_11A30();
  sub_7940();
  sub_7968();
  v11();
  sub_11E80();
  sub_7940();
  sub_7968();
  v12();

  return _swift_deallocObject(v1, v8, v9);
}

uint64_t sub_7824()
{
  return sub_7854((void (*)(uint64_t))&ContactConfirmationModel.secondaryButtonInvocationID.getter, 0x7261646E6F636573, 0xE900000000000079);
}

uint64_t sub_7854(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for ContactConfirmationView();
  sub_7954(v7);
  return sub_7074(v3 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), a1, a2, a3);
}

uint64_t sub_78B0()
{
  return sub_78E0(&qword_182E0, &qword_182E8);
}

uint64_t sub_78E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_7610(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_7954(uint64_t a1)
{
  return a1 - 8;
}

uint64_t *sub_798C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_11A80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_11E80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v16 = *(void **)v14;
    uint64_t v15 = *((void *)v14 + 1);
    *uint64_t v13 = v16;
    v13[1] = v15;
    id v17 = v16;
  }
  return a1;
}

void sub_7AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_11A80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_7B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  uint64_t v15 = *(void **)v13;
  uint64_t v14 = *(void *)(v13 + 8);
  *uint64_t v12 = v15;
  v12[1] = v14;
  id v16 = v15;
  return a1;
}

uint64_t sub_7C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void **)(a1 + v11);
  uint64_t v15 = *(void **)v13;
  *uint64_t v12 = *(void *)v13;
  id v16 = v15;

  v12[1] = *(void *)(v13 + 8);
  return a1;
}

uint64_t sub_7D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_7DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11A80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = *(void **)(a1 + v11);
  *uint64_t v12 = *v13;

  v12[1] = v13[1];
  return a1;
}

uint64_t sub_7EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7EF4);
}

uint64_t sub_7EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_11A80();
  sub_5B8C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return sub_5684(v9, a2, v8);
  }
  sub_11E80();
  sub_5B8C();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t sub_7FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7FC8);
}

void sub_7FC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_11A80();
  sub_5B8C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_11E80();
    sub_5B8C();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  sub_574C(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ContactDisambiguationView()
{
  uint64_t result = qword_18348;
  if (!qword_18348) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_80C0()
{
  uint64_t result = sub_11A80();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_11E80();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_8190()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_81AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v29 = a1;
  uint64_t v4 = type metadata accessor for ContactDisambiguationView();
  uint64_t v5 = v4 - 8;
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v28 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_118E0();
  sub_9734();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v12);
  unint64_t v27 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)&v26 - v27;
  int v14 = *(void **)(v3 + *(int *)(v5 + 32));
  if (v14)
  {
    id v15 = v14;
    sub_11F40();

    char v16 = sub_11FB0();
    id v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
    uint64_t v18 = (unsigned int *)&enum case for ImageElement.ImageStyle.contactImage4(_:);
    if (v16) {
      uint64_t v18 = (unsigned int *)&enum case for ImageElement.ImageStyle.image3(_:);
    }
    uint64_t v19 = *v18;
    uint64_t v26 = v13;
    v17(v13, v19, v2);
    sub_8E4C(v3, (uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v20 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v28 = swift_allocObject();
    sub_8F98((uint64_t)v7, v28 + v20);
    uint64_t v21 = sub_8E4C(v3, (uint64_t)v7);
    __chkstk_darwin(v21);
    uint64_t v22 = (char *)&v26 - v27;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v26 - v27, v13, v2);
    unint64_t v23 = (v20 + v6 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v24 = swift_allocObject();
    sub_8F98((uint64_t)v7, v24 + v20);
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v24 + v23, v22, v2);
    sub_11E30();
    sub_75CC(&qword_18388);
    sub_9224(&qword_18390, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    sub_926C();
    sub_11F10();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v26, v2);
  }
  else
  {
    sub_11F50();
    sub_9224((unint64_t *)&qword_18298, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_11B70();
    __break(1u);
  }
  return result;
}

uint64_t sub_84F8()
{
  return sub_11E20();
}

uint64_t sub_85BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v20[0] = a3;
  uint64_t v5 = type metadata accessor for ContactDisambiguationView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = sub_11A40();
  size_t v9 = sub_D4F4(v8);
  swift_bridgeObjectRelease();
  v20[3] = v9;
  swift_getKeyPath();
  uint64_t v10 = sub_118E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v10);
  sub_8E4C(a1, (uint64_t)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = (v12 + *(unsigned __int8 *)(v6 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15 + v13, (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  sub_8F98((uint64_t)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_9450;
  *(void *)(v16 + 24) = v15;
  sub_75CC(&qword_183A0);
  sub_75CC(&qword_183A8);
  sub_9538();
  uint64_t v17 = sub_11E30();
  uint64_t v18 = sub_9224(&qword_18390, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  v20[1] = v17;
  v20[2] = v18;
  swift_getOpaqueTypeConformance2();
  return sub_11D90();
}

uint64_t sub_8888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v28 = a1;
  uint64_t v29 = a4;
  uint64_t v5 = type metadata accessor for ContactDisambiguationView();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v25 = *(void *)(v26 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v24 = (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_11DB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PresentationUtilities();
  sub_119B0();
  sub_EACC(a2, (uint64_t)v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_11E30();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_119C0();
  v54 = &type metadata for String;
  v55 = &protocol witness table for String;
  uint64_t v52 = v15;
  uint64_t v53 = v16;
  uint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v42 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = v7;
  v30[3] = v7;
  v30[4] = (uint64_t)&protocol witness table for RFImageView;
  uint64_t v17 = sub_7658(v30);
  (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 16))(v17, v10, v7);
  sub_11E20();
  uint64_t v18 = v24;
  sub_8E4C(v27, v24);
  unint64_t v19 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v20 = (v25 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  sub_8F98(v18, v21 + v19);
  *(void *)(v21 + v20) = v28;
  sub_9224(&qword_18390, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  sub_11D00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v23);
}

uint64_t sub_8C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_11F30();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ContactDisambiguationView();
  sub_11E60();
  sub_11A50();
  sub_75CC(&qword_182D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_12520;
  uint64_t v8 = sub_11A60();
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0x7865646E69;
  }
  if (v9) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = 0xE500000000000000;
  }
  v13[1] = v10;
  v13[2] = v11;
  sub_11FC0();
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = a2;
  sub_11F60();
  sub_11F20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_8DE4(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_75CC(&qword_183B8);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_8E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8EB0()
{
  type metadata accessor for ContactDisambiguationView();
  sub_7924();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v1 + v7;
  sub_11A80();
  sub_7940();
  sub_7968();
  v11();
  sub_11E80();
  sub_7940();
  sub_7968();
  v12();

  return _swift_deallocObject(v1, v8, v9);
}

uint64_t sub_8F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8FFC()
{
  uint64_t v0 = type metadata accessor for ContactDisambiguationView();
  sub_7954(v0);

  return sub_84F8();
}

uint64_t sub_904C()
{
  type metadata accessor for ContactDisambiguationView();
  sub_7924();
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  sub_118E0();
  sub_9734();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (v5 + v7 + v12) & ~v12;
  uint64_t v14 = v13 + *(void *)(v11 + 64);
  uint64_t v15 = v4 | v12 | 7;
  sub_11A80();
  sub_7940();
  sub_7968();
  v16();
  sub_11E80();
  sub_7940();
  sub_7968();
  v17();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1 + v13, v2);

  return _swift_deallocObject(v1, v14, v15);
}

uint64_t sub_9194@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ContactDisambiguationView();
  sub_9754(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_118E0();
  sub_7954(v8);
  uint64_t v10 = v1 + ((v5 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_85BC(v1 + v5, v10, a1);
}

uint64_t sub_9224(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_926C()
{
  unint64_t result = qword_18398;
  if (!qword_18398)
  {
    sub_7610(&qword_18388);
    sub_11E30();
    sub_9224(&qword_18390, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18398);
  }
  return result;
}

uint64_t sub_9310()
{
  sub_118E0();
  sub_9734();
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (v5 + 16) & ~v5;
  uint64_t v8 = *(void *)(v7 + 64);
  type metadata accessor for ContactDisambiguationView();
  sub_7924();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v6 + v8 + v13) & ~v13;
  uint64_t v15 = v14 + *(void *)(v12 + 64);
  uint64_t v16 = v5 | v13 | 7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1 + v6, v2);
  sub_11A80();
  sub_7940();
  sub_7968();
  v17();
  sub_11E80();
  sub_7940();
  sub_7968();
  v18();

  return _swift_deallocObject(v1, v15, v16);
}

uint64_t sub_9450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_118E0();
  sub_9754(v5);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = type metadata accessor for ContactDisambiguationView();
  sub_7954(v10);
  uint64_t v12 = v2 + ((v7 + v9 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));

  return sub_8888(a1, v2 + v7, v12, a2);
}

uint64_t sub_94F8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_9530(char *a1)
{
  return sub_8DE4(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

unint64_t sub_9538()
{
  unint64_t result = qword_183B0;
  if (!qword_183B0)
  {
    sub_7610(&qword_183A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_183B0);
  }
  return result;
}

uint64_t sub_958C()
{
  type metadata accessor for ContactDisambiguationView();
  sub_7924();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = ((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v10 = v1 + v7;
  sub_11A80();
  sub_7940();
  sub_7968();
  v11();
  sub_11E80();
  sub_7940();
  sub_7968();
  v12();

  return _swift_deallocObject(v1, v9, v8);
}

uint64_t sub_9680()
{
  uint64_t v1 = type metadata accessor for ContactDisambiguationView();
  sub_9754(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_8C20(v0 + v6, v7);
}

unint64_t sub_96EC()
{
  unint64_t result = qword_183C0;
  if (!qword_183C0)
  {
    sub_7610(&qword_183C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_183C0);
  }
  return result;
}

uint64_t sub_9754(uint64_t a1)
{
  return a1 - 8;
}

uint64_t *sub_976C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_11B10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_11E80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (uint64_t *)((char *)a1 + v12);
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v17 = *(void **)v15;
    uint64_t v16 = *((void *)v15 + 1);
    void *v14 = v17;
    v14[1] = v16;
    uint64_t v18 = (uint64_t *)((char *)a1 + v13);
    unint64_t v19 = (uint64_t *)((char *)a2 + v13);
    id v20 = v17;
    sub_75CC(&qword_183D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_11B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v18, v19, v21);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = a3[8];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = *(void *)v25;
    char v27 = v25[8];
    sub_9948(*(void *)v25, v27);
    *(void *)uint64_t v24 = v26;
    v24[8] = v27;
  }
  return a1;
}

uint64_t sub_9948(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_9954(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_11B10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  uint64_t v7 = a1 + a2[7];
  sub_75CC(&qword_183D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_11B40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[8];
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);

  return sub_9A90(v10, v11);
}

uint64_t sub_9A90(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_9A9C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_11B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = a2 + v11;
  uint64_t v16 = *(void **)v14;
  uint64_t v15 = *(void *)(v14 + 8);
  *uint64_t v13 = v16;
  v13[1] = v15;
  uint64_t v17 = (void *)(a1 + v12);
  uint64_t v18 = (void *)(a2 + v12);
  id v19 = v16;
  sub_75CC(&qword_183D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_11B40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v17, v18, v20);
  }
  else
  {
    *uint64_t v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)v23;
  char v25 = *(unsigned char *)(v23 + 8);
  sub_9948(*(void *)v23, v25);
  *(void *)uint64_t v22 = v24;
  *(unsigned char *)(v22 + 8) = v25;
  return a1;
}

uint64_t sub_9C28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_11B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void **)(a1 + v11);
  uint64_t v15 = *(void **)(a2 + v11);
  *uint64_t v12 = v15;
  id v16 = v15;

  v12[1] = *(void *)(v13 + 8);
  if (a1 != a2)
  {
    uint64_t v17 = a3[7];
    uint64_t v18 = (void *)(a1 + v17);
    id v19 = (void *)(a2 + v17);
    sub_9DE4(a1 + v17);
    sub_75CC(&qword_183D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_11B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)v23;
  char v25 = *(unsigned char *)(v23 + 8);
  sub_9948(*(void *)v23, v25);
  uint64_t v26 = *(void *)v22;
  char v27 = *(unsigned char *)(v22 + 8);
  *(void *)uint64_t v22 = v24;
  *(unsigned char *)(v22 + 8) = v25;
  sub_9A90(v26, v27);
  return a1;
}

uint64_t sub_9DE4(uint64_t a1)
{
  uint64_t v2 = sub_75CC(&qword_183D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9E44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_11B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_75CC(&qword_183D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_11B40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  return a1;
}

uint64_t sub_9FC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_11B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_11E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = *(void **)(a1 + v11);
  *uint64_t v12 = *v13;

  v12[1] = v13[1];
  if (a1 != a2)
  {
    uint64_t v15 = a3[7];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (const void *)(a2 + v15);
    sub_9DE4(a1 + v15);
    uint64_t v18 = sub_75CC(&qword_183D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_11B40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v23 = *v22;
  LOBYTE(v22) = *((unsigned char *)v22 + 8);
  uint64_t v24 = *(void *)v21;
  char v25 = *(unsigned char *)(v21 + 8);
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = (_BYTE)v22;
  sub_9A90(v24, v25);
  return a1;
}

uint64_t sub_A184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_A198);
}

uint64_t sub_A198(uint64_t a1, uint64_t a2, int *a3)
{
  sub_11B10();
  sub_5B8C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_13:
    return sub_5684(v9, a2, v8);
  }
  sub_11E80();
  sub_5B8C();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[5];
LABEL_12:
    uint64_t v9 = a1 + v12;
    goto LABEL_13;
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_75CC(&qword_183D8);
    uint64_t v12 = a3[7];
    goto LABEL_12;
  }
  unint64_t v13 = *(void *)(a1 + a3[6]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t sub_A27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_A290);
}

void sub_A290(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_11B10();
  sub_5B8C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_11E80();
    sub_5B8C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(void *)(a1 + a4[6]) = a2;
        return;
      }
      uint64_t v10 = sub_75CC(&qword_183D8);
      uint64_t v14 = a4[7];
    }
    uint64_t v11 = a1 + v14;
  }

  sub_574C(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ContactHandleDisambiguationView(uint64_t a1)
{
  return sub_C3A0(a1, (uint64_t *)&unk_18438);
}

void sub_A384()
{
  sub_11B10();
  if (v0 <= 0x3F)
  {
    sub_11E80();
    if (v1 <= 0x3F)
    {
      sub_A498();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_A498()
{
  if (!qword_18448)
  {
    sub_11B40();
    unint64_t v0 = sub_11B50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18448);
    }
  }
}

uint64_t sub_A4F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_A50C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v56 = a1;
  uint64_t v3 = type metadata accessor for ContactHandleDisambiguationView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v50 = *(void *)(v3 - 8);
  uint64_t v46 = *(void *)(v50 + 64);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v53 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v48 = (uint64_t)&v43 - v7;
  uint64_t v8 = type metadata accessor for ContactHandleDisambiguationStyle(0);
  sub_EA6C();
  __chkstk_darwin(v9);
  sub_EAB0();
  sub_119D0();
  sub_5B70();
  uint64_t v54 = v11;
  uint64_t v55 = v10;
  __chkstk_darwin(v10);
  long long v49 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = v1;
  sub_11AB0();
  uint64_t v13 = sub_118E0();
  sub_5B70();
  uint64_t v15 = v14;
  uint64_t v51 = v16;
  uint64_t v52 = v14;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v1 + *(int *)(v4 + 40);
  uint64_t v20 = *(void *)v19;
  LOBYTE(v4) = *(unsigned char *)(v19 + 8);
  sub_9948(*(void *)v19, v4);
  sub_C71C(v20, v4);
  sub_9A90(v20, v4);
  sub_C8F4();
  sub_11EF0();
  uint64_t v21 = v2 + *(int *)(v8 + 32);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  long long v47 = v18;
  v22(v18, v21, v13);
  sub_C944(v2);
  uint64_t v23 = sub_11DB0();
  sub_5B70();
  uint64_t v25 = v24;
  uint64_t v27 = *(void *)(v26 + 64);
  __chkstk_darwin(v28);
  uint64_t v29 = (char *)&v43 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PresentationUtilities();
  sub_119B0();
  uint64_t v45 = v29;
  sub_EACC((uint64_t)v18, (uint64_t)v29);
  swift_bridgeObjectRelease();
  long long v43 = type metadata accessor for ContactHandleDisambiguationView;
  uint64_t v30 = v44;
  uint64_t v31 = v48;
  uint64_t v32 = sub_E950(v44, v48, (void (*)(void))type metadata accessor for ContactHandleDisambiguationView);
  __chkstk_darwin(v32);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v29, v29, v23);
  unint64_t v33 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  unint64_t v34 = (v33 + v46 + *(unsigned __int8 *)(v25 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v35 = swift_allocObject();
  sub_CB70(v31, v35 + v33);
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v35 + v34, v29, v23);
  uint64_t v36 = v53;
  sub_E950(v30, v53, (void (*)(void))v43);
  uint64_t v37 = swift_allocObject();
  sub_CB70(v36, v37 + v33);
  sub_75CC(&qword_18490);
  sub_75CC(&qword_18498);
  uint64_t v38 = sub_11E50();
  uint64_t v39 = sub_CDC4(&qword_184A0, (void (*)(uint64_t))&type metadata accessor for DisambiguationTitle);
  uint64_t v57 = v38;
  uint64_t v58 = v39;
  swift_getOpaqueTypeConformance2();
  sub_CCB8();
  sub_11F10();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v45, v23);
  sub_7968();
  v40();
  sub_7968();
  return v41();
}

uint64_t sub_A9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_11E50();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_11AF0();
  uint64_t v7 = sub_AC7C();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  v22[8] = (uint64_t)&type metadata for Text;
  v22[9] = (uint64_t)&protocol witness table for Text;
  uint64_t v14 = swift_allocObject();
  v22[5] = v14;
  *(void *)(v14 + 16) = v7;
  *(void *)(v14 + 24) = v9;
  *(unsigned char *)(v14 + 32) = v11 & 1;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_11DB0();
  v22[3] = v15;
  v22[4] = (uint64_t)&protocol witness table for RFImageView;
  uint64_t v16 = sub_7658(v22);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v16, a2, v15);
  sub_11E40();
  uint64_t v17 = sub_11980();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, enum case for SeparatorStyle.remove(_:), v17);
  sub_CDC4(&qword_184A0, (void (*)(uint64_t))&type metadata accessor for DisambiguationTitle);
  sub_11CF0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_AC7C()
{
  sub_76EC();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_11CC0();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  sub_11C90();
  uint64_t v5 = sub_11CB0();
  swift_release();
  sub_DB5C(v0, v2, v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_AD58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v22[2] = a2;
  uint64_t v3 = type metadata accessor for ContactHandleDisambiguationView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = sub_11AC0();
  uint64_t v8 = sub_75CC(&qword_184B8);
  v22[1] = v22;
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_11B00();
  size_t v13 = sub_D51C(v12, &qword_184E8, (uint64_t (*)(void))&type metadata accessor for ContactHandle, &qword_184F8);
  swift_bridgeObjectRelease();
  v22[5] = v13;
  swift_getKeyPath();
  sub_E950(a1, (uint64_t)v6, (void (*)(void))type metadata accessor for ContactHandleDisambiguationView);
  unint64_t v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = swift_allocObject();
  sub_CB70((uint64_t)v6, v15 + v14);
  uint64_t v16 = swift_allocObject();
  if (v7) {
    *(void *)(v16 + 16) = sub_DA84;
  }
  else {
    *(void *)(v16 + 16) = sub_D9D4;
  }
  *(void *)(v16 + 24) = v15;
  sub_75CC(&qword_184C8);
  sub_75CC(&qword_184D0);
  sub_DA2C();
  uint64_t v17 = sub_11EA0();
  uint64_t v18 = sub_CDC4(&qword_184C0, (void (*)(uint64_t))&type metadata accessor for SummaryItemStandardView);
  v22[3] = v17;
  v22[4] = v18;
  swift_getOpaqueTypeConformance2();
  sub_11D90();
  uint64_t v19 = sub_75CC(&qword_184E0);
  __chkstk_darwin(v19);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v22 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v8);
  swift_storeEnumTagMultiPayload();
  sub_CD20();
  sub_11BF0();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_B2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v24 = a1;
  uint64_t v25 = a3;
  uint64_t v3 = type metadata accessor for ContactHandleDisambiguationView(0);
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v23 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = sub_11EA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_11990();
  uint64_t v11 = sub_B594(v9, v10);
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v39 = &type metadata for Text;
  long long v40 = &protocol witness table for Text;
  uint64_t v18 = swift_allocObject();
  uint64_t v38 = v18;
  *(void *)(v18 + 16) = v11;
  *(void *)(v18 + 24) = v13;
  *(unsigned char *)(v18 + 32) = v15 & 1;
  *(void *)(v18 + 40) = v17;
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v31 = 0;
  long long v30 = 0u;
  long long v29 = 0u;
  uint64_t v28 = 0;
  long long v27 = 0u;
  long long v26 = 0u;
  sub_11E90();
  sub_E950(v22, (uint64_t)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ContactHandleDisambiguationView);
  unint64_t v19 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v20 = swift_allocObject();
  sub_CB70((uint64_t)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  *(void *)(v20 + ((v4 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  sub_CDC4(&qword_184C0, (void (*)(uint64_t))&type metadata accessor for SummaryItemStandardView);
  sub_11D00();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_B594(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ContactHandleDisambiguationStyle(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v2 + *(int *)(type metadata accessor for ContactHandleDisambiguationView(0) + 32);
  uint64_t v9 = *(void *)v8;
  char v10 = *(unsigned char *)(v8 + 8);
  sub_9948(*(void *)v8, v10);
  uint64_t v11 = sub_C71C(v9, v10);
  sub_9A90(v9, v10);
  v28[4] = a1;
  v28[5] = a2;
  sub_76EC();
  swift_bridgeObjectRetain();
  if (v11 == 4)
  {
    uint64_t v12 = sub_11CC0();
    uint64_t v14 = v13;
    char v16 = v15 & 1;
    sub_11C70();
    uint64_t v17 = sub_11C50();
    uint64_t v18 = *(void *)(v17 - 8);
    __chkstk_darwin(v17);
    uint64_t v20 = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, enum case for Font.Leading.tight(_:), v17);
    sub_11C80();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    uint64_t v21 = sub_11CB0();
    swift_release();
    sub_DB5C(v12, v14, v16);
  }
  else
  {
    uint64_t v22 = sub_11CC0();
    uint64_t v24 = v23;
    char v26 = v25 & 1;
    sub_9948(v9, v10);
    sub_C71C(v9, v10);
    sub_9A90(v9, v10);
    sub_C8F4();
    sub_11EF0();
    swift_retain();
    sub_C944((uint64_t)v7);
    uint64_t v21 = sub_11CB0();
    sub_DB5C(v22, v24, v26);
    swift_release();
  }
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_B8C4(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_75CC(&qword_184E8);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_B928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v37 = a3;
  uint64_t v4 = type metadata accessor for ContactHandleDisambiguationView(0);
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v33 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v34 = sub_11EA0();
  uint64_t v35 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_11990();
  uint64_t v10 = sub_B594(v8, v9);
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  uint64_t v51 = &type metadata for Text;
  uint64_t v52 = &protocol witness table for Text;
  uint64_t v17 = swift_allocObject();
  uint64_t v50 = v17;
  *(void *)(v17 + 16) = v10;
  *(void *)(v17 + 24) = v12;
  *(unsigned char *)(v17 + 32) = v14 & 1;
  *(void *)(v17 + 40) = v16;
  uint64_t v18 = sub_119A0();
  uint64_t v20 = sub_BC80(v18, v19);
  uint64_t v22 = v21;
  char v24 = v23;
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v48 = &type metadata for Text;
  long long v49 = &protocol witness table for Text;
  uint64_t v27 = swift_allocObject();
  uint64_t v46 = 0;
  uint64_t v47 = v27;
  *(void *)(v27 + 16) = v20;
  *(void *)(v27 + 24) = v22;
  *(unsigned char *)(v27 + 32) = v24 & 1;
  *(void *)(v27 + 40) = v26;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v43 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v40 = 0;
  long long v39 = 0u;
  long long v38 = 0u;
  sub_11E90();
  sub_E950(a2, (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ContactHandleDisambiguationView);
  unint64_t v28 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v29 = swift_allocObject();
  sub_CB70((uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28);
  *(void *)(v29 + ((v5 + v28 + 7) & 0xFFFFFFFFFFFFFFF8)) = v36;
  sub_CDC4(&qword_184C0, (void (*)(uint64_t))&type metadata accessor for SummaryItemStandardView);
  uint64_t v30 = v34;
  sub_11D00();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v30);
}

uint64_t sub_BC80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  uint64_t v4 = type metadata accessor for ContactHandleDisambiguationStyle(0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_11B40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ContactHandleDisambiguationView(0);
  uint64_t v12 = sub_CE0C((uint64_t)v10);
  __chkstk_darwin(v12);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for ColorScheme.dark(_:), v7);
  char v13 = sub_11B30();
  char v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v10, v7);
  v14(v10, v7);
  uint64_t v15 = v2 + *(int *)(v11 + 32);
  uint64_t v16 = *(void *)v15;
  LOBYTE(v7) = *(unsigned char *)(v15 + 8);
  sub_9948(*(void *)v15, v7);
  sub_C71C(v16, v7);
  sub_9A90(v16, v7);
  sub_C8F4();
  sub_11EF0();
  uint64_t v17 = 56;
  if (v13) {
    uint64_t v17 = 16;
  }
  sub_DD44((uint64_t)&v6[v17], (uint64_t)v59);
  sub_C944((uint64_t)v6);
  uint64_t v18 = v3 + *(int *)(v11 + 32);
  uint64_t v19 = *(void *)v18;
  char v20 = *(unsigned char *)(v18 + 8);
  sub_9948(*(void *)v18, v20);
  uint64_t v21 = sub_C71C(v19, v20);
  sub_9A90(v19, v20);
  uint64_t v55 = v61;
  uint64_t v56 = v60;
  uint64_t v54 = sub_DDA8(v59, v60);
  uint64_t v57 = v52;
  uint64_t v58 = v53;
  sub_76EC();
  swift_bridgeObjectRetain();
  if (v21 == 4)
  {
    uint64_t v22 = sub_11CC0();
    uint64_t v24 = v23;
    char v26 = v25 & 1;
    sub_11C60();
    sub_11C30();
    sub_11C40();
    swift_release();
    uint64_t v27 = sub_11C50();
    uint64_t v28 = *(void *)(v27 - 8);
    __chkstk_darwin(v27);
    uint64_t v30 = (char *)&v51 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v28 + 104))(v30, enum case for Font.Leading.tight(_:), v27);
    sub_11C80();
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
    uint64_t v31 = sub_11CB0();
    uint64_t v33 = v32;
    LOBYTE(v27) = v34;
    swift_release();
    char v35 = v27 & 1;
    sub_DB5C(v22, v24, v26);
    swift_bridgeObjectRelease();
    uint64_t v36 = sub_11CA0();
    uint64_t v37 = v31;
    uint64_t v38 = v33;
    char v39 = v35;
  }
  else
  {
    uint64_t v40 = sub_11CC0();
    uint64_t v42 = v41;
    char v44 = v43 & 1;
    sub_9948(v19, v20);
    sub_C71C(v19, v20);
    sub_9A90(v19, v20);
    sub_11EF0();
    swift_retain();
    sub_C944((uint64_t)v6);
    uint64_t v45 = sub_11CB0();
    uint64_t v47 = v46;
    char v49 = v48 & 1;
    sub_DB5C(v40, v42, v44);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v36 = sub_11CA0();
    uint64_t v37 = v45;
    uint64_t v38 = v47;
    char v39 = v49;
  }
  sub_DB5C(v37, v38, v39);
  swift_bridgeObjectRelease();
  sub_DE54((uint64_t)v59);
  return v36;
}

uint64_t sub_C1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_11F30();
  sub_5B70();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v8 = sub_EAB0();
  type metadata accessor for ContactHandleDisambiguationView(v8);
  sub_11E60();
  sub_11AD0();
  sub_75CC(&qword_182D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_12520;
  sub_11AE0();
  sub_11FC0();
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = a2;
  sub_11F60();
  sub_11F20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t type metadata accessor for ContactHandleDisambiguationStyle(uint64_t a1)
{
  return sub_C3A0(a1, qword_18560);
}

uint64_t sub_C3A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_C3D4(uint64_t a1)
{
  return sub_C40C(a1, qword_19150, (uint64_t (*)(void))&static Color.blue.getter, (unsigned int *)&enum case for ImageElement.ImageStyle.contactImage4(_:));
}

uint64_t sub_C3F0(uint64_t a1)
{
  return sub_C40C(a1, qword_19168, (uint64_t (*)(void))&static Color.cyan.getter, &enum case for ImageElement.ImageStyle.contactImage3(_:));
}

uint64_t sub_C40C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), unsigned int *a4)
{
  uint64_t v7 = type metadata accessor for ContactHandleDisambiguationStyle(0);
  sub_E9E8(v7, a2);
  uint64_t v8 = (void *)sub_E9B0(v7, (uint64_t)a2);
  uint64_t v9 = sub_11C10();
  uint64_t v10 = sub_11C20();
  uint64_t v17 = &type metadata for Color;
  uint64_t v18 = &protocol witness table for Color;
  *(void *)&long long v16 = a3();
  uint64_t v11 = sub_11D40();
  v8[10] = &type metadata for Color;
  v8[11] = &protocol witness table for Color;
  v8[7] = v11;
  uint64_t v12 = (char *)v8 + *(int *)(v7 + 32);
  uint64_t v13 = *a4;
  sub_118E0();
  sub_EA6C();
  (*(void (**)(char *, uint64_t))(v14 + 104))(v12, v13);
  *uint64_t v8 = v9;
  v8[1] = v10;
  return sub_EA4C(&v16, (uint64_t)(v8 + 2));
}

uint64_t sub_C504(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ContactHandleDisambiguationStyle(0);

  return sub_E9B0(v3, a2);
}

uint64_t sub_C558(uint64_t a1)
{
  return sub_C40C(a1, qword_19180, (uint64_t (*)(void))&static Color.cyan.getter, (unsigned int *)&enum case for ImageElement.ImageStyle.contactImage4(_:));
}

uint64_t sub_C574@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_C504(&qword_18148, (uint64_t)qword_19150);
  return sub_E950(v2, a1, (void (*)(void))type metadata accessor for ContactHandleDisambiguationStyle);
}

uint64_t sub_C5D4()
{
  return sub_11EE0();
}

uint64_t sub_C5EC()
{
  return sub_11ED0();
}

uint64_t sub_C604@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_C504(&qword_18150, (uint64_t)qword_19168);
  return sub_E950(v2, a1, (void (*)(void))type metadata accessor for ContactHandleDisambiguationStyle);
}

uint64_t sub_C66C()
{
  return sub_11EC0();
}

uint64_t sub_C684()
{
  return sub_11EB0();
}

uint64_t sub_C69C()
{
  return sub_11F00();
}

uint64_t sub_C6B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_C504(&qword_18158, (uint64_t)qword_19180);
  return sub_E950(v2, a1, (void (*)(void))type metadata accessor for ContactHandleDisambiguationStyle);
}

uint64_t sub_C71C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v3 = sub_11FA0();
    uint64_t v4 = sub_11C00();
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      *(void *)(v5 + 4) = sub_D08C(0x6D6F696449585256, 0xE800000000000000, &v12);
      _os_log_impl(&dword_0, v4, v3, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v6 = sub_11BE0();
    uint64_t v7 = *(void *)(v6 - 8);
    __chkstk_darwin(v6);
    uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_11BD0();
    swift_getAtKeyPath();
    sub_9A90(a1, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v12;
  }
  return a1;
}

unint64_t sub_C8F4()
{
  unint64_t result = qword_18488;
  if (!qword_18488)
  {
    type metadata accessor for ContactHandleDisambiguationStyle(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18488);
  }
  return result;
}

uint64_t sub_C944(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactHandleDisambiguationStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_C9A0()
{
  sub_EA7C();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v18 = *(void *)(v5 + 64);
  uint64_t v6 = sub_11DB0();
  sub_5B70();
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = v1 + v4;
  sub_11B10();
  sub_EA6C();
  sub_7968();
  v13();
  sub_11E80();
  sub_EA6C();
  sub_7968();
  v14();

  sub_75CC(&qword_183D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_11B40();
    sub_EA6C();
    sub_7968();
    v15();
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = (v4 + v18 + v9) & ~v9;
  sub_9A90(*(void *)(v12 + *(int *)(v0 + 32)), *(unsigned char *)(v12 + *(int *)(v0 + 32) + 8));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1 + v16, v6);

  return _swift_deallocObject(v1, v16 + v11, v3 | v9 | 7);
}

uint64_t sub_CB70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactHandleDisambiguationView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_CBD4()
{
  uint64_t v1 = type metadata accessor for ContactHandleDisambiguationView(0);
  sub_9754(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = sub_11DB0();
  sub_7954(v6);
  uint64_t v8 = v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_A9EC(v0 + v3, v8);
}

uint64_t sub_CC68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ContactHandleDisambiguationView(0);
  sub_7954(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_AD58(v5, a1);
}

unint64_t sub_CCB8()
{
  unint64_t result = qword_184A8;
  if (!qword_184A8)
  {
    sub_7610(&qword_18498);
    sub_CD20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_184A8);
  }
  return result;
}

unint64_t sub_CD20()
{
  unint64_t result = qword_184B0;
  if (!qword_184B0)
  {
    sub_7610(&qword_184B8);
    sub_11EA0();
    sub_CDC4(&qword_184C0, (void (*)(uint64_t))&type metadata accessor for SummaryItemStandardView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_184B0);
  }
  return result;
}

uint64_t sub_CDC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_CE0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_75CC(&qword_183D0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DDEC(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_11B40();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v6, v7);
  }
  else
  {
    os_log_type_t v9 = sub_11FA0();
    uint64_t v10 = sub_11C00();
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      *(void *)(v11 + 4) = sub_D08C(0x686353726F6C6F43, 0xEB00000000656D65, &v17);
      _os_log_impl(&dword_0, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v12 = sub_11BE0();
    uint64_t v13 = *(void *)(v12 - 8);
    __chkstk_darwin(v12);
    uint64_t v15 = (char *)&v16 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_11BD0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

unint64_t sub_D08C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_D160(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_DEA4((uint64_t)v12, *a3);
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
      sub_DEA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_DE54((uint64_t)v12);
  return v7;
}

unint64_t sub_D160(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = (unint64_t)sub_D260(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_11FF0();
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

char *sub_D260(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_D2F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_D3FC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_D3FC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_D2F8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_D394(v2, 0);
      unint64_t result = (void *)sub_11FE0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_11F90();
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

void *sub_D394(uint64_t a1, uint64_t a2)
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
  sub_75CC(&qword_184F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_D3FC(char *result, int64_t a2, char a3, char *a4)
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
    sub_75CC(&qword_184F0);
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

BOOL sub_D4E8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

size_t sub_D4F4(uint64_t a1)
{
  return sub_D51C(a1, &qword_183B8, (uint64_t (*)(void))&type metadata accessor for EncodedContact, &qword_18500);
}

size_t sub_D51C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v51 = a4;
  uint64_t v52 = a2;
  uint64_t v62 = sub_75CC(a2);
  sub_5B70();
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v61 = (char *)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v60 = (void *)((char *)v50 - v10);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v50 - v11;
  uint64_t v63 = v13;
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v16 = &_swiftEmptyArrayStorage;
  uint64_t v59 = v15;
  v50[1] = a1;
  if (v15)
  {
    uint64_t v53 = (v14 + 32) & ~v14;
    uint64_t v17 = (char *)&_swiftEmptyArrayStorage + v53;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v58 = a3(0);
    sub_EA6C();
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    uint64_t v56 = v20 + 16;
    uint64_t v57 = v21;
    uint64_t v22 = a1 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    uint64_t v54 = *(void *)(v20 + 72);
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v20 + 32);
    v50[2] = v14 | 7;
    uint64_t v23 = &_swiftEmptyArrayStorage;
    uint64_t v24 = v52;
    while (1)
    {
      uint64_t v25 = v62;
      char v26 = &v61[*(int *)(v62 + 48)];
      uint64_t v27 = v58;
      v57(v26, v22, v58);
      uint64_t v28 = *(int *)(v25 + 48);
      uint64_t v29 = v60;
      uint64_t v30 = (char *)v60 + v28;
      *uint64_t v60 = v18;
      (*v55)(v30, v26, v27);
      uint64_t v31 = (uint64_t)v29;
      uint64_t v32 = (uint64_t)v12;
      size_t result = sub_DF04(v31, (uint64_t)v12, v24);
      if (v19)
      {
        uint64_t v16 = v23;
      }
      else
      {
        unint64_t v34 = v23[3];
        if ((uint64_t)((v34 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_34;
        }
        int64_t v35 = v34 & 0xFFFFFFFFFFFFFFFELL;
        if (v35 <= 1) {
          uint64_t v36 = 1;
        }
        else {
          uint64_t v36 = v35;
        }
        sub_75CC(v51);
        uint64_t v37 = *(void *)(v63 + 72);
        uint64_t v38 = v53;
        uint64_t v16 = (void *)swift_allocObject();
        size_t result = j__malloc_size(v16);
        if (!v37) {
          goto LABEL_35;
        }
        int64_t v39 = result - v38;
        if (result - v38 == 0x8000000000000000 && v37 == -1) {
          goto LABEL_36;
        }
        uint64_t v41 = v39 / v37;
        void v16[2] = v36;
        v16[3] = 2 * (v39 / v37);
        uint64_t v42 = (char *)v16 + v38;
        unint64_t v43 = v23[3];
        uint64_t v44 = (v43 >> 1) * v37;
        if (v23[2])
        {
          if (v16 < v23 || v42 >= (char *)v23 + v53 + v44)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v16 != v23)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v23[2] = 0;
        }
        uint64_t v17 = &v42[v44];
        uint64_t v19 = (v41 & 0x7FFFFFFFFFFFFFFFLL) - (v43 >> 1);
        size_t result = swift_release();
        uint64_t v24 = v52;
      }
      BOOL v46 = __OFSUB__(v19--, 1);
      if (v46) {
        break;
      }
      ++v18;
      uint64_t v12 = (char *)v32;
      sub_DF04(v32, (uint64_t)v17, v24);
      v17 += *(void *)(v63 + 72);
      v22 += v54;
      uint64_t v23 = v16;
      if (v59 == v18) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v19 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v47 = v16[3];
  if (v47 < 2) {
    return (size_t)v16;
  }
  unint64_t v48 = v47 >> 1;
  BOOL v46 = __OFSUB__(v48, v19);
  unint64_t v49 = v48 - v19;
  if (!v46)
  {
    void v16[2] = v49;
    return (size_t)v16;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_D870()
{
  sub_EA7C();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  sub_11B10();
  sub_EA6C();
  sub_7968();
  v7();
  sub_11E80();
  sub_EA6C();
  sub_7968();
  v8();

  sub_75CC(&qword_183D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_11B40();
    sub_EA6C();
    sub_7968();
    v9();
  }
  else
  {
    swift_release();
  }
  sub_9A90(*(void *)(v1 + v4 + *(int *)(v0 + 32)), *(unsigned char *)(v1 + v4 + *(int *)(v0 + 32) + 8));

  return _swift_deallocObject(v1, v4 + v6, v3 | 7);
}

uint64_t sub_D9D4(uint64_t a1, uint64_t a2)
{
  return sub_DA9C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_B928);
}

uint64_t sub_D9EC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DA24(char *a1)
{
  return sub_B8C4(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

unint64_t sub_DA2C()
{
  unint64_t result = qword_184D8;
  if (!qword_184D8)
  {
    sub_7610(&qword_184C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_184D8);
  }
  return result;
}

uint64_t sub_DA84(uint64_t a1, uint64_t a2)
{
  return sub_DA9C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_B2A4);
}

uint64_t sub_DA9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = type metadata accessor for ContactHandleDisambiguationView(0);
  sub_7954(v6);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a3(a1, a2, v8);
}

uint64_t sub_DB18()
{
  sub_DB5C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_DB5C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_DB78()
{
  sub_EA7C();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  sub_11B10();
  sub_EA6C();
  sub_7968();
  v7();
  sub_11E80();
  sub_EA6C();
  sub_7968();
  v8();

  sub_75CC(&qword_183D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_11B40();
    sub_EA6C();
    sub_7968();
    v9();
  }
  else
  {
    swift_release();
  }
  sub_9A90(*(void *)(v1 + v4 + *(int *)(v0 + 32)), *(unsigned char *)(v1 + v4 + *(int *)(v0 + 32) + 8));

  return _swift_deallocObject(v1, ((v6 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_DCE8()
{
  uint64_t v1 = type metadata accessor for ContactHandleDisambiguationView(0);
  sub_9754(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_C1F4(v0 + v6, *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_DD44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_DDA8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_DDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75CC(&qword_183D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_DE54(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_DEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_DF04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_75CC(a3);
  sub_EA6C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_DF60(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    uint64_t v8 = a2 + 2;
    long long v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    uint64_t v10 = v9;
    uint64_t v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_retain();
    swift_retain();
    v11(a1 + 16, v8, v10);
    long long v12 = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 80) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 56, (uint64_t)(a2 + 7));
    uint64_t v13 = *(int *)(a3 + 32);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_118E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_E0F0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  sub_DE54(a1 + 16);
  sub_DE54(a1 + 56);
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_118E0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_E180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = a2 + 16;
  long long v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_retain();
  swift_retain();
  v10(a1 + 16, v7, v9);
  long long v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, a2 + 56);
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_118E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

void *sub_E2C0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  sub_E384(a1 + 2, a2 + 2);
  sub_E384(a1 + 7, a2 + 7);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  long long v8 = (char *)a2 + v6;
  uint64_t v9 = sub_118E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t *sub_E384(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t v3 = *a2;
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

uint64_t sub_E5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = a2 + v5;
  uint64_t v7 = a1 + v5;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = sub_118E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
  return a1;
}

uint64_t sub_E658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  sub_DE54(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  sub_DE54(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_118E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_E72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_E740);
}

uint64_t sub_E740(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_118E0();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 32);
    return sub_5684(v9, a2, v8);
  }
}

uint64_t sub_E7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_E7DC);
}

void *sub_E7DC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_118E0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 32);
    return (void *)sub_574C(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_E85C()
{
  uint64_t result = sub_118E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_E908()
{
  unint64_t result = qword_185A8;
  if (!qword_185A8)
  {
    sub_7610(&qword_185B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185A8);
  }
  return result;
}

uint64_t sub_E950(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_EA6C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_E9B0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_E9E8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_EA4C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_EA7C()
{
  return type metadata accessor for ContactHandleDisambiguationView(0);
}

uint64_t sub_EAB0()
{
  return 0;
}

uint64_t sub_EACC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_F01C(v54);
  sub_F144((uint64_t)v54, (uint64_t)&v55);
  unint64_t v4 = v56;
  if (!v56) {
    goto LABEL_4;
  }
  uint64_t v53 = a2;
  uint64_t v5 = v55;
  uint64_t v7 = v57;
  unint64_t v6 = v58;
  uint64_t v50 = v59;
  uint64_t v8 = sub_11950();
  uint64_t v52 = &v43;
  sub_5B70();
  uint64_t v51 = v9;
  __chkstk_darwin(v10);
  sub_F6DC();
  uint64_t v12 = v11;
  uint64_t v13 = sub_75CC(&qword_18660);
  __chkstk_darwin(v13 - 8);
  sub_F6CC();
  uint64_t v16 = v15 - v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10954(v5, v4, v7, v6, a1);
  sub_574C(v16, 0, 1, v8);
  sub_F4CC(v54);
  if (sub_5684(v16, 1, v8) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_F554(v16);
LABEL_4:
    uint64_t v17 = sub_11970();
    __chkstk_darwin(v17 - 8);
    sub_F6CC();
    sub_75CC(&qword_18658);
    uint64_t v18 = sub_118B0();
    sub_5B70();
    uint64_t v20 = v19;
    unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_12520;
    (*(void (**)(unint64_t, void, uint64_t))(v20 + 104))(v22 + v21, enum case for _ProtoIdiom.default(_:), v18);
    sub_F1AC(v22);
    sub_118D0();
    swift_bridgeObjectRelease();
    return sub_11DC0();
  }
  uint64_t v24 = v51;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32);
  unint64_t v47 = v6;
  uint64_t v26 = v12;
  uint64_t v44 = v12;
  v25(v12, v16, v8);
  uint64_t v27 = sub_11970();
  unint64_t v49 = &v43;
  __chkstk_darwin(v27 - 8);
  sub_F6DC();
  uint64_t v46 = v28;
  uint64_t v29 = sub_118F0();
  unint64_t v48 = &v43;
  sub_5B70();
  uint64_t v31 = v30;
  uint64_t v33 = *(void *)(v32 + 64);
  __chkstk_darwin(v34);
  int64_t v35 = (char *)&v43 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v35, v26, v8);
  uint64_t v36 = *(uint64_t (**)(char *, void, uint64_t))(v31 + 104);
  uint64_t v37 = v36(v35, enum case for ImageElement.SourceType.contact(_:), v29);
  uint64_t v45 = &v43;
  __chkstk_darwin(v37);
  sub_118E0();
  uint64_t v43 = (uint64_t)&v43;
  sub_5B70();
  __chkstk_darwin(v38);
  sub_F6CC();
  (*(void (**)(uint64_t, void))(v41 + 104))(v40 - v39, enum case for ImageElement.ImageStyle.default(_:));
  swift_bridgeObjectRetain();
  sub_11900();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v36(v35, enum case for ImageElement.SourceType.appIcon(_:), v29);
  sub_118C0();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v31 + 8);
  v42(v35, v29);
  v42(v35, v29);
  sub_11DC0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v44, v8);
}

void sub_F01C(void *a1@<X8>)
{
  sub_118A0();
  sub_F6B0();
  if (v3 >> 60 != 15)
  {
    uint64_t v10 = v2;
    unint64_t v11 = v3;
    sub_11890();
    swift_allocObject();
    sub_11880();
    sub_F5F8();
    sub_11870();
    swift_release();
    sub_F644(v10, v11);
    uint64_t v4 = v12;
    uint64_t v5 = v13;
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    uint64_t v9 = v17;
  }
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
}

uint64_t sub_F110()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for PresentationUtilities()
{
  return self;
}

uint64_t sub_F144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75CC(&qword_18650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_F1AC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }
  sub_75CC(&qword_18668);
  uint64_t v2 = sub_11FD0();
  unint64_t v3 = (unsigned char *)v2;
  uint64_t v28 = *(void *)(v1 + 16);
  if (!v28)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  uint64_t v33 = v2 + 56;
  uint64_t result = sub_118B0();
  uint64_t v5 = result;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)(result - 8);
  uint64_t v26 = v1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v27 = v7;
  uint64_t v31 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v32 = v7 + 16;
  uint64_t v24 = v1;
  uint64_t v25 = (uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32);
  while (v6 < *(void *)(v1 + 16))
  {
    uint64_t v8 = *(void *)(v27 + 64);
    uint64_t v34 = *(void *)(v27 + 72);
    __chkstk_darwin(result);
    uint64_t v10 = *(void (**)(char *))(v9 + 16);
    v10((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_F5B4(&qword_18670);
    int64_t v35 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = sub_11F70();
    uint64_t v12 = -1 << v3[32];
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)(v33 + 8 * (v13 >> 6));
    uint64_t v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      uint64_t v29 = &v24;
      unint64_t v30 = v6;
      uint64_t v17 = v3;
      uint64_t v18 = ~v12;
      while (1)
      {
        __chkstk_darwin(v11);
        ((void (*)(char *, unint64_t, uint64_t))v10)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17[6] + v13 * v34, v5);
        sub_F5B4(&qword_18678);
        char v19 = sub_11F80();
        uint64_t v20 = *v31;
        uint64_t v11 = (*v31)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
        if (v19) {
          break;
        }
        unint64_t v13 = (v13 + 1) & v18;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)(v33 + 8 * (v13 >> 6));
        uint64_t v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0)
        {
          uint64_t v1 = v24;
          unint64_t v3 = v17;
          unint64_t v6 = v30;
          goto LABEL_10;
        }
      }
      uint64_t result = v20(v35, v5);
      uint64_t v1 = v24;
      unint64_t v3 = v17;
      unint64_t v6 = v30;
    }
    else
    {
LABEL_10:
      *(void *)(v33 + 8 * v14) = v16 | v15;
      uint64_t result = (*v25)(*((void *)v3 + 6) + v13 * v34, v35, v5);
      uint64_t v21 = *((void *)v3 + 2);
      BOOL v22 = __OFADD__(v21, 1);
      uint64_t v23 = v21 + 1;
      if (v22) {
        goto LABEL_18;
      }
      *((void *)v3 + 2) = v23;
    }
    if (++v6 == v28) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t *sub_F4CC(uint64_t *a1)
{
  return a1;
}

uint64_t sub_F504(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_F554(uint64_t a1)
{
  uint64_t v2 = sub_75CC(&qword_18660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_F5B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_118B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_F5F8()
{
  unint64_t result = qword_18680;
  if (!qword_18680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18680);
  }
  return result;
}

uint64_t sub_F644(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_F658(a1, a2);
  }
  return a1;
}

uint64_t sub_F658(uint64_t a1, unint64_t a2)
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

BOOL sub_F6F0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_F700(uint64_t a1, char a2)
{
}

Swift::Int sub_F728(char a1)
{
  return sub_120A0();
}

BOOL sub_F770(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_F6F0(*a1, *a2);
}

Swift::Int sub_F77C()
{
  return sub_F728(*v0);
}

void sub_F784(uint64_t a1)
{
  sub_F700(a1, *v1);
}

Swift::Int sub_F78C()
{
  Swift::UInt v1 = *v0;
  sub_12080();
  sub_12090(v1);
  return sub_120A0();
}

uint64_t sub_F7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0xEF77656956656761;
  uint64_t v7 = type metadata accessor for BadgedImageView();
  sub_EA6C();
  __chkstk_darwin(v8);
  sub_10924();
  BOOL v9 = a1 == 0x6D49646567646142 && a2 == 0xEF77656956656761;
  if (!v9 && (sub_12030() & 1) == 0)
  {
    sub_10490();
    swift_allocError();
    char v11 = 0;
    goto LABEL_10;
  }
  sub_11890();
  swift_allocObject();
  sub_11880();
  sub_F5F8();
  sub_11870();
  if (v2)
  {
    swift_errorRelease();
    swift_release();
    sub_10490();
    swift_allocError();
    char v11 = 1;
LABEL_10:
    char *v10 = v11;
    swift_willThrow();
    return v6;
  }
  swift_release();
  unint64_t v58 = v53;
  uint64_t v41 = (uint64_t *)v54;
  uint64_t v42 = (uint64_t *)v52;
  unint64_t v51 = v55;
  uint64_t v47 = v56;
  uint64_t v43 = v57;
  sub_11950();
  unint64_t v48 = &v37;
  sub_5B70();
  uint64_t v49 = v13;
  uint64_t v50 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v12);
  uint64_t v16 = sub_118E0();
  uint64_t v38 = &v37;
  sub_5B70();
  uint64_t v18 = v17;
  uint64_t v45 = v3;
  uint64_t v20 = *(void *)(v19 + 64);
  __chkstk_darwin(v21);
  unint64_t v40 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  BOOL v22 = (char *)&v37 - v40;
  uint64_t v46 = v7;
  uint64_t v39 = *(void (**)(char *, void, uint64_t))(v18 + 104);
  v39((char *)&v37 - v40, enum case for ImageElement.ImageStyle.contactImage4(_:), v16);
  uint64_t v44 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10954((uint64_t)v42, v58, (uint64_t)v41, v51, (uint64_t)v22);
  uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v22, v16);
  uint64_t v42 = &v37;
  __chkstk_darwin(v23);
  sub_1093C();
  uint64_t v25 = v24();
  uint64_t v41 = &v37;
  __chkstk_darwin(v25);
  uint64_t v26 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_11920();
  uint64_t v38 = &v37;
  __chkstk_darwin(v27 - 8);
  sub_F6CC();
  uint64_t v28 = v43;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_11930();
  __chkstk_darwin(v29);
  v39((char *)&v37 - v40, enum case for ImageElement.ImageStyle.image3(_:), v16);
  sub_11960();
  uint64_t v30 = v49;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v32 = v50;
  v31(v26, v50);
  uint64_t v33 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 32);
  uint64_t v34 = v45;
  v33(v45, v26, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v35 = (void *)(v34 + *(int *)(v46 + 20));
  void *v35 = v47;
  v35[1] = v28;
  sub_10668(&qword_18738, (void (*)(uint64_t))type metadata accessor for BadgedImageView);
  uint64_t v6 = sub_11D80();
  v31(v44, v32);
  return v6;
}

uint64_t sub_FCF4(uint64_t a1)
{
  uint64_t v77 = a1;
  uint64_t v76 = type metadata accessor for ContactConfirmationView();
  sub_EA6C();
  __chkstk_darwin(v2);
  sub_F6DC();
  uint64_t v74 = v3;
  sub_10948();
  uint64_t v75 = sub_11A30();
  sub_5B70();
  uint64_t v73 = v4;
  __chkstk_darwin(v5);
  sub_F6DC();
  uint64_t v68 = v6;
  uint64_t v7 = sub_10948();
  uint64_t v72 = type metadata accessor for ContactHandleDisambiguationView(v7);
  sub_EA6C();
  __chkstk_darwin(v8);
  sub_F6DC();
  uint64_t v70 = v9;
  sub_10948();
  uint64_t v71 = sub_11B10();
  sub_5B70();
  uint64_t v69 = v10;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v67 = (char *)&v66 - v15;
  sub_10948();
  uint64_t v16 = type metadata accessor for ContactDisambiguationView();
  sub_EA6C();
  __chkstk_darwin(v17);
  sub_F6CC();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_11A80();
  sub_5B70();
  uint64_t v23 = v22;
  __chkstk_darwin(v24);
  sub_10924();
  uint64_t v25 = sub_11B20();
  sub_5B70();
  uint64_t v27 = v26;
  __chkstk_darwin(v28);
  sub_F6CC();
  uint64_t v31 = v30 - v29;
  sub_1093C();
  v32();
  int v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 88))(v31, v25);
  if (v33 == enum case for ContactDisambiguationSnippetPluginModel.contactDisambiguation(_:))
  {
    uint64_t v34 = sub_1090C();
    v35(v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v1, v31, v21);
    sub_1093C();
    v36();
    sub_11E70();
    uint64_t v37 = (uint64_t *)(v20 + *(int *)(v16 + 24));
    sub_11F50();
    sub_104DC((unint64_t *)&qword_18298, (void (*)(uint64_t))&type metadata accessor for Context);
    *uint64_t v37 = sub_11B80();
    v37[1] = v38;
    sub_10668(&qword_18750, (void (*)(uint64_t))type metadata accessor for ContactDisambiguationView);
    uint64_t v39 = sub_11CD0();
    sub_106B0(v20, (void (*)(void))type metadata accessor for ContactDisambiguationView);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v1, v21);
    return v39;
  }
  if (v33 == enum case for ContactDisambiguationSnippetPluginModel.contactHandleDisambiguation(_:))
  {
    uint64_t v40 = sub_1090C();
    v41(v40);
    uint64_t v42 = v69;
    uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 32);
    uint64_t v44 = v67;
    uint64_t v45 = v71;
    v43(v67, v31, v71);
    uint64_t v46 = v44;
    sub_1093C();
    v47();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v49 = v70;
    v43((char *)v70, (uint64_t)v14, v45);
    uint64_t v50 = (int *)v72;
    sub_11E70();
    unint64_t v51 = (uint64_t *)(v49 + v50[6]);
    sub_11F50();
    sub_104DC((unint64_t *)&qword_18298, (void (*)(uint64_t))&type metadata accessor for Context);
    *unint64_t v51 = sub_11B80();
    v51[1] = v52;
    unint64_t v53 = (uint64_t *)(v49 + v50[7]);
    *unint64_t v53 = swift_getKeyPath();
    sub_75CC(&qword_183D0);
    swift_storeEnumTagMultiPayload();
    uint64_t v54 = v49 + v50[8];
    *(void *)uint64_t v54 = KeyPath;
    *(unsigned char *)(v54 + 8) = 0;
    sub_10668(&qword_18748, (void (*)(uint64_t))type metadata accessor for ContactHandleDisambiguationView);
    uint64_t v39 = sub_11CD0();
    sub_106B0(v49, (void (*)(void))type metadata accessor for ContactHandleDisambiguationView);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v46, v45);
    return v39;
  }
  if (v33 == enum case for ContactDisambiguationSnippetPluginModel.contactConfirmation(_:))
  {
    uint64_t v55 = sub_1090C();
    v56(v55);
    uint64_t v57 = v73;
    uint64_t v58 = v68;
    uint64_t v59 = v75;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v68, v31, v75);
    uint64_t v60 = v74;
    sub_1093C();
    v61();
    uint64_t v62 = v76;
    sub_11E70();
    uint64_t v63 = (uint64_t *)(v60 + *(int *)(v62 + 24));
    sub_11F50();
    sub_104DC((unint64_t *)&qword_18298, (void (*)(uint64_t))&type metadata accessor for Context);
    *uint64_t v63 = sub_11B80();
    v63[1] = v64;
    sub_10668(&qword_18740, (void (*)(uint64_t))type metadata accessor for ContactConfirmationView);
    uint64_t v39 = sub_11CD0();
    sub_106B0(v60, (void (*)(void))type metadata accessor for ContactConfirmationView);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
    return v39;
  }
  uint64_t result = sub_12020();
  __break(1u);
  return result;
}

uint64_t sub_10374()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SiriInferenceFlowsUIPlugin()
{
  return self;
}

uint64_t sub_103D0()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0xE000000000000000;
  return result;
}

uint64_t sub_103FC()
{
  return sub_104DC(&qword_18728, (void (*)(uint64_t))&type metadata accessor for ContactDisambiguationSnippetPluginModel);
}

uint64_t sub_10438(uint64_t a1, uint64_t a2)
{
  return sub_F7E0(a1, a2);
}

uint64_t sub_10450@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_103D0();
  *a1 = result;
  return result;
}

uint64_t sub_10478(uint64_t a1)
{
  return sub_FCF4(a1);
}

unint64_t sub_10490()
{
  unint64_t result = qword_18730;
  if (!qword_18730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18730);
  }
  return result;
}

uint64_t sub_104DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10524(uint64_t a1)
{
  uint64_t v2 = sub_11B40();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_11BC0();
}

uint64_t sub_105EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_11B90();
  *a1 = result;
  return result;
}

uint64_t sub_10618()
{
  return sub_11BA0();
}

uint64_t sub_10640()
{
  return sub_11BB0();
}

uint64_t sub_10668(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_106B0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_EA6C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for SiriInferenceFlowsUIPlugin.Error(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriInferenceFlowsUIPlugin.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriInferenceFlowsUIPlugin.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1086CLL);
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

uint64_t sub_10894(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1089C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriInferenceFlowsUIPlugin.Error()
{
  return &type metadata for SiriInferenceFlowsUIPlugin.Error;
}

unint64_t sub_108BC()
{
  unint64_t result = qword_18758;
  if (!qword_18758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18758);
  }
  return result;
}

uint64_t sub_1090C()
{
  return v0;
}

uint64_t sub_10948()
{
  return 0;
}

uint64_t sub_10954(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t v8 = a2;
    uint64_t v10 = sub_11920();
    sub_5B70();
    uint64_t v12 = v11;
    __chkstk_darwin(v13);
    sub_11840();
    sub_75CC(&qword_18760);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_12520;
    *(void *)(v14 + 32) = a1;
    *(void *)(v14 + 40) = v8;
    swift_bridgeObjectRetain();
    sub_11910();
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v5, enum case for ImageElement.Contact.Content.avatar(_:), v10);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0) {
      uint64_t v15 = HIBYTE(a4) & 0xF;
    }
    else {
      uint64_t v15 = a3 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v8 = sub_11920();
    sub_5B70();
    uint64_t v17 = v16;
    __chkstk_darwin(v18);
    sub_11840();
    if (v15)
    {
      swift_bridgeObjectRetain();
      sub_11940();
      uint64_t v19 = (unsigned int *)&enum case for ImageElement.Contact.Content.monogram(_:);
    }
    else
    {
      sub_11910();
      uint64_t v19 = (unsigned int *)&enum case for ImageElement.Contact.Content.avatar(_:);
    }
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v5, *v19, v8);
  }
  sub_118E0();
  sub_5B70();
  __chkstk_darwin(v20);
  sub_11858();
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v8, a5);
  return sub_11960();
}

uint64_t initializeBufferWithCopyOfBuffer for SiriInferenceFlowsDataModels.ViewData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriInferenceFlowsDataModels.ViewData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriInferenceFlowsDataModels.ViewData(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriInferenceFlowsDataModels.ViewData(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SiriInferenceFlowsDataModels.ViewData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for SiriInferenceFlowsDataModels.ViewData(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriInferenceFlowsDataModels.ViewData(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for SiriInferenceFlowsDataModels.ViewData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriInferenceFlowsDataModels.ViewData()
{
  return &type metadata for SiriInferenceFlowsDataModels.ViewData;
}

BOOL sub_10DE4(char a1, char a2)
{
  return a1 == a2;
}

void sub_10DF4(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_10E1C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000000013A80 || (sub_12030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x49746361746E6F63 && a2 == 0xEF736C616974696ELL;
    if (v5 || (sub_12030() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_12030();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_10F8C()
{
  return 3;
}

Swift::Int sub_10F94(unsigned __int8 a1)
{
  return sub_120A0();
}

uint64_t sub_10FDC()
{
  return 0;
}

uint64_t sub_10FE8(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0x49746361746E6F63;
  }
  return 0x6449656C646E7562;
}

BOOL sub_11050(char *a1, char *a2)
{
  return sub_10DE4(*a1, *a2);
}

Swift::Int sub_1105C()
{
  return sub_10F94(*v0);
}

void sub_11064(uint64_t a1)
{
  sub_10DF4(a1, *v1);
}

uint64_t sub_1106C()
{
  return sub_10FE8(*v0);
}

uint64_t sub_11074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10E1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1109C()
{
  return sub_10FDC();
}

uint64_t sub_110BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10F8C();
  *a1 = result;
  return result;
}

uint64_t sub_110E4(uint64_t a1)
{
  unint64_t v2 = sub_11530();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_11120(uint64_t a1)
{
  unint64_t v2 = sub_11530();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1115C(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_75CC(&qword_18778);
  sub_5B70();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_11858();
  sub_DDA8(a1, a1[3]);
  sub_11530();
  sub_120C0();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  char v19 = 0;
  sub_11824(v10, v11, (uint64_t)&v19);
  if (!v2)
  {
    uint64_t v12 = v4[2];
    uint64_t v13 = v4[3];
    char v18 = 1;
    sub_11824(v12, v13, (uint64_t)&v18);
    uint64_t v14 = v4[4];
    uint64_t v15 = v4[5];
    char v17 = 2;
    sub_11824(v14, v15, (uint64_t)&v17);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v3, v6);
}

uint64_t sub_11288@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_75CC(&qword_18768);
  sub_5B70();
  __chkstk_darwin(v5);
  sub_DDA8(a1, a1[3]);
  sub_11530();
  sub_120B0();
  if (v2) {
    return sub_DE54((uint64_t)a1);
  }
  uint64_t v6 = sub_12000();
  uint64_t v8 = v7;
  uint64_t v21 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_12000();
  uint64_t v11 = v10;
  uint64_t v19 = v9;
  swift_bridgeObjectRetain();
  uint64_t v20 = v11;
  uint64_t v12 = sub_12000();
  uint64_t v14 = v13;
  uint64_t v15 = v12;
  uint64_t v16 = sub_11810();
  v17(v16);
  swift_bridgeObjectRetain();
  sub_DE54((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v21;
  a2[1] = v8;
  a2[2] = v19;
  a2[3] = v20;
  a2[4] = v15;
  a2[5] = v14;
  return result;
}

double sub_114D4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_11288(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_11518(void *a1)
{
  return sub_1115C(a1);
}

unint64_t sub_11530()
{
  unint64_t result = qword_18770;
  if (!qword_18770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18770);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriInferenceFlowsDataModels()
{
  return &type metadata for SiriInferenceFlowsDataModels;
}

uint64_t getEnumTagSinglePayload for SiriInferenceFlowsDataModels.ViewData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriInferenceFlowsDataModels.ViewData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x116E0);
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

unsigned char *sub_11708(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriInferenceFlowsDataModels.ViewData.CodingKeys()
{
  return &type metadata for SiriInferenceFlowsDataModels.ViewData.CodingKeys;
}

unint64_t sub_11724()
{
  unint64_t result = qword_18780;
  if (!qword_18780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18780);
  }
  return result;
}

unint64_t sub_11774()
{
  unint64_t result = qword_18788;
  if (!qword_18788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18788);
  }
  return result;
}

unint64_t sub_117C4()
{
  unint64_t result = qword_18790;
  if (!qword_18790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18790);
  }
  return result;
}

uint64_t sub_11810()
{
  return v0;
}

uint64_t sub_11824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_11870()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_11880()
{
  return JSONDecoder.init()();
}

uint64_t sub_11890()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_118A0()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_118B0()
{
  return type metadata accessor for _ProtoIdiom();
}

uint64_t sub_118C0()
{
  return static ImageElement.badgedImage(image:badge:)();
}

uint64_t sub_118D0()
{
  return static ImageElement.contactImageAvatar(contactIds:imageStyle:idioms:)();
}

uint64_t sub_118E0()
{
  return type metadata accessor for ImageElement.ImageStyle();
}

uint64_t sub_118F0()
{
  return type metadata accessor for ImageElement.SourceType();
}

uint64_t sub_11900()
{
  return ImageElement.AppIcon.init(_:imageStyle:)();
}

uint64_t sub_11910()
{
  return ImageElement.Contact.Avatar.init(contactIds:)();
}

uint64_t sub_11920()
{
  return type metadata accessor for ImageElement.Contact.Content();
}

uint64_t sub_11930()
{
  return ImageElement.Contact.content.getter();
}

uint64_t sub_11940()
{
  return ImageElement.Contact.Monogram.init(letters:)();
}

uint64_t sub_11950()
{
  return type metadata accessor for ImageElement.Contact();
}

uint64_t sub_11960()
{
  return ImageElement.Contact.init(_:imageStyle:)();
}

uint64_t sub_11970()
{
  return type metadata accessor for ImageElement();
}

uint64_t sub_11980()
{
  return type metadata accessor for SeparatorStyle();
}

uint64_t sub_11990()
{
  return ContactHandle.label.getter();
}

uint64_t sub_119A0()
{
  return ContactHandle.method.getter();
}

uint64_t sub_119B0()
{
  return EncodedContact.base64EncodedViewData.getter();
}

uint64_t sub_119C0()
{
  return EncodedContact.fullName.getter();
}

uint64_t sub_119D0()
{
  return type metadata accessor for EncodedContact();
}

uint64_t sub_119E0()
{
  return ContactConfirmationModel.encodedContact.getter();
}

uint64_t sub_119F0()
{
  return ContactConfirmationModel.displayName()()._countAndFlagsBits;
}

uint64_t sub_11A00()
{
  return ContactConfirmationModel.contactLabel.getter();
}

uint64_t sub_11A10()
{
  return ContactConfirmationModel.changeButtonLabel.getter();
}

uint64_t sub_11A20()
{
  return ContactConfirmationModel.primaryActionButtonLabel.getter();
}

uint64_t sub_11A30()
{
  return type metadata accessor for ContactConfirmationModel();
}

uint64_t sub_11A40()
{
  return ContactDisambiguationModel.encodedContacts.getter();
}

uint64_t sub_11A50()
{
  return ContactDisambiguationModel.contactSelectionDirectInvocationID.getter();
}

uint64_t sub_11A60()
{
  return ContactDisambiguationModel.contactSelectionDirectInvocationKey.getter();
}

uint64_t sub_11A70()
{
  return ContactDisambiguationModel.prompt.getter();
}

uint64_t sub_11A80()
{
  return type metadata accessor for ContactDisambiguationModel();
}

uint64_t sub_11A90()
{
  return ContactResolutionCommonKeys.rawValue.getter();
}

uint64_t sub_11AA0()
{
  return type metadata accessor for ContactResolutionCommonKeys();
}

uint64_t sub_11AB0()
{
  return ContactHandleDisambiguationModel.encodedContact.getter();
}

uint64_t sub_11AC0()
{
  return ContactHandleDisambiguationModel.isDeviceLocked.getter();
}

uint64_t sub_11AD0()
{
  return ContactHandleDisambiguationModel.contactSelectionDirectInvocationID.getter();
}

uint64_t sub_11AE0()
{
  return ContactHandleDisambiguationModel.contactSelectionDirectInvocationKey.getter();
}

uint64_t sub_11AF0()
{
  return ContactHandleDisambiguationModel.prompt.getter();
}

uint64_t sub_11B00()
{
  return ContactHandleDisambiguationModel.handles.getter();
}

uint64_t sub_11B10()
{
  return type metadata accessor for ContactHandleDisambiguationModel();
}

uint64_t sub_11B20()
{
  return type metadata accessor for ContactDisambiguationSnippetPluginModel();
}

uint64_t sub_11B30()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_11B40()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_11B50()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_11B60()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_11B70()
{
  return EnvironmentObject.error()();
}

uint64_t sub_11B80()
{
  return EnvironmentObject.init()();
}

uint64_t sub_11B90()
{
  return EnvironmentValues.currentIdiom.getter();
}

uint64_t sub_11BA0()
{
  return EnvironmentValues.currentIdiom.setter();
}

uint64_t sub_11BB0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_11BC0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_11BD0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_11BE0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_11BF0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_11C00()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_11C10()
{
  return static Font.subheadline.getter();
}

uint64_t sub_11C20()
{
  return static Font.body.getter();
}

uint64_t sub_11C30()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_11C40()
{
  return Font.weight(_:)();
}

uint64_t sub_11C50()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_11C60()
{
  return static Font.callout.getter();
}

uint64_t sub_11C70()
{
  return static Font.caption.getter();
}

uint64_t sub_11C80()
{
  return Font.leading(_:)();
}

uint64_t sub_11C90()
{
  return static Font.headline.getter();
}

uint64_t sub_11CA0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_11CB0()
{
  return Text.font(_:)();
}

uint64_t sub_11CC0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_11CD0()
{
  return View.eraseToAnyView()();
}

uint64_t sub_11CE0()
{
  return View.buttonRole(_:foreground:background:)();
}

uint64_t sub_11CF0()
{
  return View.separators(_:isOverride:)();
}

uint64_t sub_11D00()
{
  return View.componentTapped(isNavigation:perform:)();
}

uint64_t sub_11D10()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_11D20()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_11D30()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_11D40()
{
  return static Color.blue.getter();
}

uint64_t sub_11D50()
{
  return static Color.green.getter();
}

uint64_t sub_11D60()
{
  return static Color.white.getter();
}

uint64_t sub_11D70()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_11D80()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_11D90()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_11DA0()
{
  return type metadata accessor for ButtonItemButtonStyle.Role();
}

uint64_t sub_11DB0()
{
  return type metadata accessor for RFImageView();
}

uint64_t sub_11DC0()
{
  return RFImageView.init(_:)();
}

uint64_t sub_11DD0()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_11DE0()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t sub_11DF0()
{
  return type metadata accessor for BinaryButtonView();
}

uint64_t sub_11E00()
{
  return type metadata accessor for ImageElementView();
}

uint64_t sub_11E10()
{
  return ImageElementView.init(_:)();
}

uint64_t sub_11E20()
{
  return SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
}

uint64_t sub_11E30()
{
  return type metadata accessor for SimpleItemRichView();
}

uint64_t sub_11E40()
{
  return DisambiguationTitle.init(text1:thumbnail:)();
}

uint64_t sub_11E50()
{
  return type metadata accessor for DisambiguationTitle();
}

uint64_t sub_11E60()
{
  return InteractionDelegate.wrappedValue.getter();
}

uint64_t sub_11E70()
{
  return InteractionDelegate.init()();
}

uint64_t sub_11E80()
{
  return type metadata accessor for InteractionDelegate();
}

uint64_t sub_11E90()
{
  return SummaryItemStandardView.init(text1:text2:text3:text4:thumbnail:)();
}

uint64_t sub_11EA0()
{
  return type metadata accessor for SummaryItemStandardView();
}

uint64_t sub_11EB0()
{
  return static IdiomDependentStaticValue.tv.getter();
}

uint64_t sub_11EC0()
{
  return static IdiomDependentStaticValue.mac.getter();
}

uint64_t sub_11ED0()
{
  return static IdiomDependentStaticValue.pad.getter();
}

uint64_t sub_11EE0()
{
  return static IdiomDependentStaticValue.pod.getter();
}

uint64_t sub_11EF0()
{
  return static IdiomDependentStaticValue.value(for:)();
}

uint64_t sub_11F00()
{
  return static IdiomDependentStaticValue.watch.getter();
}

uint64_t sub_11F10()
{
  return DisambiguationStandardView.init(header:content:)();
}

uint64_t sub_11F20()
{
  return InteractionDelegateWrapper.perform(directInvocation:payload:)();
}

uint64_t sub_11F30()
{
  return type metadata accessor for InteractionDelegateWrapper();
}

uint64_t sub_11F40()
{
  return dispatch thunk of Context.currentIdiom.getter();
}

uint64_t sub_11F50()
{
  return type metadata accessor for Context();
}

uint64_t sub_11F60()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_11F70()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_11F80()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

Swift::Int sub_11F90()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_11FA0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_11FB0()
{
  return VRXIdiom.isCarPlay.getter();
}

uint64_t sub_11FC0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_11FD0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_11FE0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_11FF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_12000()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_12020()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_12030()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_12040()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_12050()
{
  return Error._code.getter();
}

uint64_t sub_12060()
{
  return Error._domain.getter();
}

uint64_t sub_12070()
{
  return Error._userInfo.getter();
}

uint64_t sub_12080()
{
  return Hasher.init(_seed:)();
}

void sub_12090(Swift::UInt a1)
{
}

Swift::Int sub_120A0()
{
  return Hasher._finalize()();
}

uint64_t sub_120B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_120C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}