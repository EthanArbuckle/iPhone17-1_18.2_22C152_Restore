void type metadata accessor for Key(uint64_t a1)
{
  sub_100002C00(a1, &qword_10005D458);
}

__n128 initializeWithTake for DismissAction(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002BA4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002BC4(uint64_t result, int a2, int a3)
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

void sub_100002C00(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100002C48@<X0>(char *a1@<X8>)
{
  v39 = a1;
  uint64_t v36 = sub_100049C58();
  uint64_t v1 = *(void *)(v36 - 8);
  ((void (*)(void))__chkstk_darwin)();
  char v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100049768();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005D6B8) - 8;
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v35 = (uint64_t)&v33 - v11;
  uint64_t v12 = sub_100049788();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v34 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v33 - v16;
  sub_100049798();
  sub_100049778();
  uint64_t v18 = v36;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Image.Scale.large(_:), v36);
  uint64_t KeyPath = swift_getKeyPath();
  v20 = (uint64_t *)&v10[*(int *)(v7 + 44)];
  uint64_t v21 = sub_100004334(&qword_10005D6C0);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))((char *)v20 + *(int *)(v21 + 28), v3, v18);
  uint64_t *v20 = KeyPath;
  uint64_t v23 = v37;
  uint64_t v22 = v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v10, v6, v38);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v22);
  uint64_t v24 = v35;
  sub_100005424((uint64_t)v10, v35, &qword_10005D6B8);
  v25 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v26 = v34;
  v25(v34, v17, v12);
  char v40 = 1;
  sub_100005488(v24, (uint64_t)v10, &qword_10005D6B8);
  v27 = v39;
  v25(v39, v26, v12);
  uint64_t v28 = sub_100004334(&qword_10005D6C8);
  v29 = &v27[*(int *)(v28 + 48)];
  char v30 = v40;
  *(void *)v29 = 0;
  v29[8] = v30;
  sub_100005488((uint64_t)v10, (uint64_t)&v27[*(int *)(v28 + 64)], &qword_10005D6B8);
  sub_1000054EC(v24, &qword_10005D6B8);
  v31 = *(void (**)(char *, uint64_t))(v13 + 8);
  v31(v17, v12);
  sub_1000054EC((uint64_t)v10, &qword_10005D6B8);
  return ((uint64_t (*)(char *, uint64_t))v31)(v26, v12);
}

uint64_t sub_10000305C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100049618();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_100004334(&qword_10005D6B0);
  return sub_100002C48((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_1000030AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v72 = a1;
  uint64_t v2 = sub_1000497A8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_100004334(&qword_10005D5F8);
  uint64_t v6 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100004334(&qword_10005D600);
  __chkstk_darwin(v60);
  v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100004334(&qword_10005D608);
  __chkstk_darwin(v61);
  uint64_t v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100004334(&qword_10005D610);
  __chkstk_darwin(v62);
  uint64_t v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_100004334(&qword_10005D618);
  __chkstk_darwin(v64);
  uint64_t v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100004334(&qword_10005D620);
  __chkstk_darwin(v65);
  uint64_t v67 = (uint64_t)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100004334(&qword_10005D628);
  __chkstk_darwin(v66);
  uint64_t v70 = (uint64_t)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100004334(&qword_10005D630);
  __chkstk_darwin(v68);
  uint64_t v69 = (uint64_t)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = v1;
  sub_1000497B8();
  sub_1000040C8(&qword_10005D638, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
  sub_100004E18();
  sub_100049AC8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  LOBYTE(v2) = sub_1000498C8();
  char v20 = sub_100049908();
  sub_100049908();
  if (sub_100049908() != v2) {
    char v20 = sub_100049908();
  }
  sub_1000492D8();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v29 = v63;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v63);
  char v30 = &v10[*(int *)(v60 + 36)];
  *char v30 = v20;
  *((void *)v30 + 1) = v22;
  *((void *)v30 + 2) = v24;
  *((void *)v30 + 3) = v26;
  *((void *)v30 + 4) = v28;
  v30[40] = 0;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v29);
  sub_100049DD8();
  sub_100049428();
  sub_100005488((uint64_t)v10, (uint64_t)v12, &qword_10005D600);
  v31 = &v12[*(int *)(v61 + 36)];
  long long v32 = v78;
  *((_OWORD *)v31 + 4) = v77;
  *((_OWORD *)v31 + 5) = v32;
  *((_OWORD *)v31 + 6) = v79;
  long long v33 = v74;
  *(_OWORD *)v31 = v73;
  *((_OWORD *)v31 + 1) = v33;
  long long v34 = v76;
  *((_OWORD *)v31 + 2) = v75;
  *((_OWORD *)v31 + 3) = v34;
  sub_1000054EC((uint64_t)v10, &qword_10005D600);
  sub_100005488((uint64_t)v12, (uint64_t)v14, &qword_10005D608);
  v14[*(int *)(v62 + 36)] = 0;
  sub_1000054EC((uint64_t)v12, &qword_10005D608);
  uint64_t v35 = v71;
  if (sub_1000497C8())
  {
    id v36 = [self tableCellDefaultSelectionTintColor];
    uint64_t v37 = sub_100049BF8();
  }
  else
  {
    uint64_t v37 = sub_100049C18();
  }
  uint64_t v38 = v37;
  char v39 = sub_1000498D8();
  sub_100005488((uint64_t)v14, (uint64_t)v16, &qword_10005D610);
  char v40 = &v16[*(int *)(v64 + 36)];
  *(void *)char v40 = v38;
  v40[8] = v39;
  sub_1000054EC((uint64_t)v14, &qword_10005D610);
  uint64_t v41 = v35 + *(int *)(type metadata accessor for TranslateActionButtonView() + 20);
  uint64_t v42 = *(void *)v41;
  char v43 = *(unsigned char *)(v41 + 8);
  sub_100004884(*(void *)v41, v43);
  char v44 = sub_100041194(v42, v43);
  sub_10000490C(v42, v43);
  v45 = self;
  v46 = &selRef_labelColor;
  if ((v44 & 1) == 0) {
    v46 = &selRef_secondaryLabelColor;
  }
  id v47 = [v45 *v46];
  uint64_t v48 = sub_100049BF8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v50 = v67;
  sub_100005488((uint64_t)v16, v67, &qword_10005D618);
  v51 = (uint64_t *)(v50 + *(int *)(v65 + 36));
  uint64_t *v51 = KeyPath;
  v51[1] = v48;
  sub_1000054EC((uint64_t)v16, &qword_10005D618);
  LOBYTE(v48) = sub_1000497C8();
  uint64_t v52 = v70;
  sub_100005488(v50, v70, &qword_10005D620);
  uint64_t v53 = v52 + *(int *)(v66 + 36);
  *(void *)uint64_t v53 = 0;
  *(unsigned char *)(v53 + 8) = v48 & 1;
  sub_1000054EC(v50, &qword_10005D620);
  uint64_t v54 = *(void *)v41;
  char v55 = *(unsigned char *)(v41 + 8);
  sub_100004884(*(void *)v41, v55);
  char v56 = sub_100041194(v54, v55);
  sub_10000490C(v54, v55);
  uint64_t v57 = v69;
  sub_100005488(v52, v69, &qword_10005D628);
  uint64_t v58 = v57 + *(int *)(v68 + 36);
  *(void *)uint64_t v58 = 0;
  *(unsigned char *)(v58 + 8) = v56 & 1;
  sub_1000054EC(v52, &qword_10005D628);
  return sub_100005424(v57, v72, &qword_10005D630);
}

uint64_t sub_100003894()
{
  return sub_100049B08();
}

uint64_t sub_1000038B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000497D8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  uint64_t result = type metadata accessor for TranslateActionButtonView();
  uint64_t v10 = a2 + *(int *)(result + 20);
  *(void *)uint64_t v10 = KeyPath;
  *(unsigned char *)(v10 + 8) = 0;
  return result;
}

uint64_t sub_1000039C8@<X0>(uint64_t a1@<X8>)
{
  v34[1] = a1;
  uint64_t v1 = sub_100049408();
  uint64_t v2 = v1 - 8;
  __chkstk_darwin(v1);
  uint64_t v4 = (_OWORD *)((char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100004334(&qword_10005D4F0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004334(&qword_10005D4F8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004334(&qword_10005D500);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004334(&qword_10005D508);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_1000496C8();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  sub_100004334(&qword_10005D510);
  sub_100049808();
  uint64_t v18 = sub_100049DD8();
  sub_1000135A8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v18, v19);
  sub_1000054EC((uint64_t)v7, &qword_10005D4F0);
  id v20 = [self secondarySystemGroupedBackgroundColor];
  uint64_t v21 = sub_100049BF8();
  char v22 = sub_1000498D8();
  sub_100005488((uint64_t)v10, (uint64_t)v14, &qword_10005D4F8);
  uint64_t v23 = &v14[*(int *)(v12 + 44)];
  *(void *)uint64_t v23 = v21;
  v23[8] = v22;
  sub_1000054EC((uint64_t)v10, &qword_10005D4F8);
  uint64_t v24 = (char *)v4 + *(int *)(v2 + 28);
  uint64_t v25 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v26 = sub_100049688();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v24, v25, v26);
  __asm { FMOV            V0.2D, #10.0 }
  *uint64_t v4 = _Q0;
  uint64_t v32 = (uint64_t)&v17[*(int *)(v15 + 36)];
  sub_100004378((uint64_t)v4, v32);
  *(_WORD *)(v32 + *(int *)(sub_100004334(&qword_10005D518) + 36)) = 256;
  sub_100005488((uint64_t)v14, (uint64_t)v17, &qword_10005D500);
  sub_1000043DC((uint64_t)v4);
  sub_1000054EC((uint64_t)v14, &qword_10005D500);
  sub_100004438();
  sub_100004660();
  sub_100049AD8();
  return sub_1000054EC((uint64_t)v17, &qword_10005D508);
}

uint64_t sub_100003D5C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049578();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100003D8C()
{
  return sub_100049588();
}

uint64_t sub_100003DB4(uint64_t a1, uint64_t a2)
{
  return sub_100004128(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003DCC(uint64_t a1, id *a2)
{
  uint64_t result = sub_100049E88();
  *a2 = 0;
  return result;
}

uint64_t sub_100003E44(uint64_t a1, id *a2)
{
  char v3 = sub_100049E98();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003EC4@<X0>(void *a1@<X8>)
{
  sub_100049EA8();
  NSString v2 = sub_100049E78();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003F08@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100049E78();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003F50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049EA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003F7C(uint64_t a1)
{
  uint64_t v2 = sub_1000040C8(&qword_10005D480, type metadata accessor for Key);
  uint64_t v3 = sub_1000040C8(&qword_10005D488, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004038()
{
  return sub_1000040C8(&qword_10005D468, type metadata accessor for Key);
}

uint64_t sub_100004080()
{
  return sub_1000040C8(&qword_10005D470, type metadata accessor for Key);
}

uint64_t sub_1000040C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004110(uint64_t a1, uint64_t a2)
{
  return sub_100004128(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004128(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100049EA8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000416C()
{
  sub_100049EA8();
  sub_100049F08();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000041C0()
{
  sub_100049EA8();
  sub_10004A378();
  sub_100049F08();
  Swift::Int v0 = sub_10004A3A8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004234()
{
  uint64_t v0 = sub_100049EA8();
  uint64_t v2 = v1;
  if (v0 == sub_100049EA8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10004A308();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000042C0()
{
  return sub_1000040C8(&qword_10005D478, type metadata accessor for Key);
}

ValueMetadata *type metadata accessor for ActionGroupStyle()
{
  return &type metadata for ActionGroupStyle;
}

uint64_t sub_100004318()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004334(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004378(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100049408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000043DC(uint64_t a1)
{
  uint64_t v2 = sub_100049408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100004438()
{
  unint64_t result = qword_10005D520;
  if (!qword_10005D520)
  {
    sub_1000044D8(&qword_10005D508);
    sub_100004520();
    sub_100005584(&qword_10005D550, &qword_10005D518);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D520);
  }
  return result;
}

uint64_t sub_1000044D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004520()
{
  unint64_t result = qword_10005D528;
  if (!qword_10005D528)
  {
    sub_1000044D8(&qword_10005D500);
    sub_1000045C0();
    sub_100005584(&qword_10005D540, &qword_10005D548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D528);
  }
  return result;
}

unint64_t sub_1000045C0()
{
  unint64_t result = qword_10005D530;
  if (!qword_10005D530)
  {
    sub_1000044D8(&qword_10005D4F8);
    sub_100005584(&qword_10005D538, &qword_10005D4F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D530);
  }
  return result;
}

unint64_t sub_100004660()
{
  unint64_t result = qword_10005D558;
  if (!qword_10005D558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D558);
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslateActionButtonStyle()
{
  return &type metadata for TranslateActionButtonStyle;
}

uint64_t sub_1000046C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004734()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for TranslateActionButtonView()
{
  uint64_t result = qword_10005D5B8;
  if (!qword_10005D5B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_10000479C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = a3;
    uint64_t v7 = sub_1000497D8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)v10;
    LOBYTE(v6) = v10[8];
    sub_100004884(*(void *)v10, v6);
    *(void *)uint64_t v9 = v11;
    v9[8] = v6;
  }
  return a1;
}

uint64_t sub_100004884(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100004890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000497D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = *(void *)v5;
  char v7 = *(unsigned char *)(v5 + 8);

  return sub_10000490C(v6, v7);
}

uint64_t sub_10000490C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100004918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000497D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  LOBYTE(a2) = *(unsigned char *)(v9 + 8);
  sub_100004884(*(void *)v9, a2);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = a2;
  return a1;
}

uint64_t sub_1000049B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000497D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  LOBYTE(a2) = *(unsigned char *)(v9 + 8);
  sub_100004884(*(void *)v9, a2);
  uint64_t v11 = *(void *)v8;
  char v12 = *(unsigned char *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = a2;
  sub_10000490C(v11, v12);
  return a1;
}

uint64_t sub_100004A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000497D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t sub_100004AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000497D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  uint64_t v11 = *(void *)v8;
  char v12 = *(unsigned char *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  sub_10000490C(v11, v12);
  return a1;
}

uint64_t sub_100004B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004B8C);
}

uint64_t sub_100004B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000497D8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100004C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004C60);
}

uint64_t sub_100004C60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000497D8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_100004D20()
{
  uint64_t result = sub_1000497D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100004DB4()
{
  return sub_1000040C8(&qword_10005D5F0, (void (*)(uint64_t))type metadata accessor for TranslateActionButtonView);
}

uint64_t sub_100004DFC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004E18()
{
  unint64_t result = qword_10005D640;
  if (!qword_10005D640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D640);
  }
  return result;
}

uint64_t sub_100004E6C()
{
  return sub_100049498();
}

uint64_t sub_100004E90(uint64_t a1)
{
  uint64_t v2 = sub_100049C58();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000494A8();
}

ValueMetadata *type metadata accessor for TranslateActionLabelStyle()
{
  return &type metadata for TranslateActionLabelStyle;
}

unint64_t sub_100004F74()
{
  unint64_t result = qword_10005D648;
  if (!qword_10005D648)
  {
    sub_1000044D8(&qword_10005D630);
    sub_100005014();
    sub_100005584(&qword_10005D6A0, &qword_10005D6A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D648);
  }
  return result;
}

unint64_t sub_100005014()
{
  unint64_t result = qword_10005D650;
  if (!qword_10005D650)
  {
    sub_1000044D8(&qword_10005D628);
    sub_1000050B4();
    sub_100005584(&qword_10005D6A0, &qword_10005D6A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D650);
  }
  return result;
}

unint64_t sub_1000050B4()
{
  unint64_t result = qword_10005D658;
  if (!qword_10005D658)
  {
    sub_1000044D8(&qword_10005D620);
    sub_100005154();
    sub_100005584(&qword_10005D690, &qword_10005D698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D658);
  }
  return result;
}

unint64_t sub_100005154()
{
  unint64_t result = qword_10005D660;
  if (!qword_10005D660)
  {
    sub_1000044D8(&qword_10005D618);
    sub_1000051F4();
    sub_100005584(&qword_10005D540, &qword_10005D548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D660);
  }
  return result;
}

unint64_t sub_1000051F4()
{
  unint64_t result = qword_10005D668;
  if (!qword_10005D668)
  {
    sub_1000044D8(&qword_10005D610);
    sub_100005294();
    sub_100005584(&qword_10005D680, &qword_10005D688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D668);
  }
  return result;
}

unint64_t sub_100005294()
{
  unint64_t result = qword_10005D670;
  if (!qword_10005D670)
  {
    sub_1000044D8(&qword_10005D608);
    sub_100005310();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D670);
  }
  return result;
}

unint64_t sub_100005310()
{
  unint64_t result = qword_10005D678;
  if (!qword_10005D678)
  {
    sub_1000044D8(&qword_10005D600);
    sub_1000497A8();
    sub_1000040C8(&qword_10005D638, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    sub_100004E18();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D678);
  }
  return result;
}

uint64_t sub_100005408()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005424(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004334(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005488(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004334(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000054EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004334(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005548()
{
  return sub_100005584(&qword_10005D6D0, &qword_10005D6D8);
}

uint64_t sub_100005584(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000044D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000055C8()
{
  NSString v0 = sub_100049E78();
  sub_10000592C(v19);
  unint64_t v1 = sub_10000A384(v19, v20);
  char v2 = *(unsigned char *)v1;
  char v3 = *((unsigned char *)v1 + 1);
  Swift::Int v4 = v1[1];
  sub_100004334(&qword_10005D8A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004B0B0;
  strcpy((char *)(inited + 32), "sourceEditable");
  *(unsigned char *)(inited + 47) = -18;
  sub_10000A3C8(0, &qword_10005D8B0);
  *(NSNumber *)(inited + 48) = sub_10004A168(v2);
  *(void *)(inited + 56) = 0x6563697665446E6FLL;
  *(void *)(inited + 64) = 0xEF64656C62616E45;
  *(NSNumber *)(inited + 72) = sub_10004A168(v3);
  *(void *)(inited + 80) = 0x4449656C646E7562;
  *(void *)(inited + 88) = 0xE800000000000000;
  swift_bridgeObjectRetain();
  NSString v6 = sub_100049E78();
  swift_bridgeObjectRelease();
  *(void *)(inited + 96) = v6;
  *(void *)(inited + 104) = 0x756F436E656B6F74;
  *(void *)(inited + 112) = 0xEA0000000000746ELL;
  *(NSNumber *)(inited + 120) = sub_10004A178(v4);
  sub_100046B4C(inited);
  sub_10000A3C8(0, (unint64_t *)&qword_10005D8B8);
  Class isa = sub_100049E28().super.isa;
  swift_bridgeObjectRelease();
  sub_10000A404((uint64_t)v19);
  AnalyticsSendEvent();

  if (qword_10005D438 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100049208();
  sub_100009598(v8, (uint64_t)qword_1000605C8);
  uint64_t v9 = sub_1000491E8();
  os_log_type_t v10 = sub_10004A068();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "SELF Invocation log start for presenting system translation", v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = sub_100005ED8();
  sub_10000592C(v19);
  int v13 = *((unsigned __int8 *)sub_10000A384(v19, v20) + 32);
  sub_10000A404((uint64_t)v19);
  if (v13) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 1;
  }
  sub_10000592C(v19);
  int v15 = *((unsigned __int8 *)sub_10000A384(v19, v20) + 33);
  sub_10000A404((uint64_t)v19);
  if (v15) {
    uint64_t v16 = 9;
  }
  else {
    uint64_t v16 = 6;
  }
  id v17 = [self startInvocationWithTask:3 inputMode:v14 invocationType:v16 translateAppContext:0];
  uint64_t v18 = *(void **)(v12 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
  *(void *)(v12 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation) = v17;
  swift_release();
}

uint64_t sub_10000592C@<X0>(uint64_t *a1@<X8>)
{
  char v2 = v1;
  uint64_t v4 = sub_100004334(&qword_10005D898);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  os_log_type_t v10 = (char *)&v29 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  int v13 = (char *)&v29 - v12;
  __chkstk_darwin(v11);
  int v15 = (char *)&v29 - v14;
  sub_10003D5E0([v2 extensionContext], (uint64_t)&v29 - v14);
  sub_100005488((uint64_t)v15, (uint64_t)v13, &qword_10005D898);
  uint64_t v16 = type metadata accessor for TranslationRequestContext();
  id v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  if (v17(v13, 1, v16) == 1)
  {
    sub_1000054EC((uint64_t)v13, &qword_10005D898);
    int v31 = 0;
  }
  else
  {
    int v31 = v13[*(int *)(v16 + 36)];
    sub_10000A310((uint64_t)v13);
  }
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  uint64_t v18 = (void *)sub_10004A0A8();
  int v30 = sub_10004A0B8();

  uint64_t v19 = sub_100005ED8();
  uint64_t v21 = *(void *)(v19 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier);
  unint64_t v20 = *(void *)(v19 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier + 8);
  swift_bridgeObjectRetain();
  swift_release();
  sub_100005488((uint64_t)v15, (uint64_t)v10, &qword_10005D898);
  if (v17(v10, 1, v16) == 1)
  {
    sub_1000054EC((uint64_t)v10, &qword_10005D898);
    BOOL v22 = 0;
  }
  else
  {
    int v23 = v10[*(int *)(v16 + 44)];
    sub_10000A310((uint64_t)v10);
    BOOL v22 = v23 == 1;
  }
  sub_100005488((uint64_t)v15, (uint64_t)v7, &qword_10005D898);
  if (v17(v7, 1, v16) == 1)
  {
    sub_1000054EC((uint64_t)v7, &qword_10005D898);
    BOOL v24 = 0;
  }
  else
  {
    int v25 = v7[*(int *)(v16 + 44)];
    sub_10000A310((uint64_t)v7);
    BOOL v24 = v25 == 2;
  }
  if (v20)
  {
    uint64_t v26 = v21;
  }
  else
  {
    unint64_t v20 = 0xE400000000000000;
    uint64_t v26 = 1819047278;
  }
  a1[3] = (uint64_t)&type metadata for ActionViewController.Data;
  a1[4] = (uint64_t)&off_10005A290;
  uint64_t v27 = swift_allocObject();
  *a1 = v27;
  *(unsigned char *)(v27 + 16) = v31;
  *(unsigned char *)(v27 + 17) = v30 & 1;
  *(void *)(v27 + 24) = 0;
  *(void *)(v27 + 32) = v26;
  *(void *)(v27 + 40) = v20;
  *(unsigned char *)(v27 + 48) = v22;
  *(unsigned char *)(v27 + 49) = v24;
  return sub_1000054EC((uint64_t)v15, &qword_10005D898);
}

id sub_100005E00()
{
  return sub_10000817C(type metadata accessor for SecureNavigationController);
}

uint64_t type metadata accessor for SecureNavigationController()
{
  return self;
}

uint64_t sub_100005E3C()
{
  uint64_t v1 = OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationContext;
  if (*(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationContext))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationContext);
  }
  else
  {
    type metadata accessor for TranslationContext();
    uint64_t v2 = swift_allocObject();
    sub_100049258();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_100005ED8()
{
  uint64_t v1 = OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationModel;
  if (*(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationModel))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationModel);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for TranslationModel(0);
    swift_allocObject();
    uint64_t v2 = sub_100028394();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_100005F54()
{
  uint64_t v1 = OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostController;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostController);
  }
  else
  {
    uint64_t v4 = v0;
    sub_100005ED8();
    sub_100005E3C();
    swift_getKeyPath();
    type metadata accessor for TranslationModel(0);
    sub_100009DF4(&qword_10005D858, 255, (void (*)(uint64_t))type metadata accessor for TranslationModel);
    sub_100049378();
    type metadata accessor for TranslationContext();
    sub_100009DF4(&qword_10005D860, 255, (void (*)(uint64_t))type metadata accessor for TranslationContext);
    sub_100049378();
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    id v5 = objc_allocWithZone((Class)sub_100004334(&qword_10005D868));
    uint64_t v6 = (void *)sub_100049178();
    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

double sub_10000620C@<D0>(_OWORD *a1@<X8>)
{
  return sub_100006468((void (*)(void))sub_10000A0D4, a1);
}

uint64_t sub_10000622C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000064E4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000A0D4);
}

void sub_10000624C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100005ED8();
    sub_100024460();
    swift_release();
    if (qword_10005D438 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100049208();
    sub_100009598(v2, (uint64_t)qword_1000605C8);
    id v3 = sub_1000491E8();
    os_log_type_t v4 = sub_10004A068();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "SELF Invocation log cancelled for presenting system translation", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v6 = (void *)sub_100007E84();
    if (v6)
    {
      [v6 dismiss];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

double sub_1000063B4@<D0>(_OWORD *a1@<X8>)
{
  return sub_100006468((void (*)(void))sub_10000A080, a1);
}

uint64_t sub_1000063D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000064E4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000A080);
}

void sub_1000063F4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100007884();
  }
}

double sub_100006448@<D0>(_OWORD *a1@<X8>)
{
  return sub_100006468((void (*)(void))sub_10000A02C, a1);
}

double sub_100006468@<D0>(void (*a1)(void)@<X3>, _OWORD *a2@<X8>)
{
  a1();
  sub_1000495D8();
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_1000064C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000064E4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000A02C);
}

uint64_t sub_1000064E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  return sub_1000495E8();
}

void sub_100006548(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (void *)Strong;
    sub_1000079EC(a1);
  }
}

uint64_t sub_1000065A4@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v2 = sub_100049478();
  uint64_t v4 = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  *(void *)(result + 24) = v4;
  *a1 = sub_10000A004;
  a1[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_100006608(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  return sub_100049488();
}

void sub_100006674()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100007B68();
  }
}

id sub_1000066C8()
{
  uint64_t v1 = OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostNavigationController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostNavigationController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostNavigationController);
  }
  else
  {
    uint64_t v4 = (void *)sub_100005F54();
    id v5 = [objc_allocWithZone((Class)type metadata accessor for SecureNavigationController()) initWithRootViewController:v4];

    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_100006764()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100049208();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v52 = &v46[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100004334(&qword_10005D898);
  __chkstk_darwin(v5 - 8);
  id v7 = &v46[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v8 = (int *)type metadata accessor for TranslationRequestContext();
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v46[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v14 = &v46[-v13];
  int v15 = (objc_class *)type metadata accessor for ActionViewController();
  v55.receiver = v1;
  v55.super_class = v15;
  objc_msgSendSuper2(&v55, "_willAppearInRemoteViewController");
  sub_10003D5E0([v1 extensionContext], (uint64_t)v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, int *))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1000054EC((uint64_t)v7, &qword_10005D898);
    if (qword_10005D440 != -1) {
      swift_once();
    }
    sub_100009598(v2, (uint64_t)qword_1000605E0);
    uint64_t v16 = sub_1000491E8();
    os_log_type_t v17 = sub_10004A078();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "No request context from NSExtensionItem", v18, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    sub_10000A190((uint64_t)v7, (uint64_t)v14);
    int v19 = v14[8];
    v51 = v12;
    if (v19 == 1)
    {
      uint64_t v20 = sub_100005ED8();
      uint64_t v21 = swift_allocObject();
      swift_unknownObjectWeakInit();
      BOOL v22 = (void (**)())(v20 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_consentHandler);
      uint64_t v23 = *(void *)(v20 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_consentHandler);
      *BOOL v22 = sub_10000A36C;
      v22[1] = (void (*)())v21;
      sub_10000A374(v23);
      swift_release();
    }
    id v24 = [v1 _hostApplicationBundleIdentifier];
    if (v24)
    {
      int v25 = v24;
      uint64_t v26 = sub_100049EA8();
      unint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = 0;
      unint64_t v28 = 0;
    }
    uint64_t v29 = (uint64_t *)(sub_100005ED8() + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier);
    uint64_t v50 = v26;
    uint64_t *v29 = v26;
    v29[1] = v28;
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_100005ED8();
    uint64_t v31 = (uint64_t)&v14[v8[8]];
    uint64_t v32 = v30 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_cplIntervalID;
    swift_beginAccess();
    sub_10000A1F4(v31, v32);
    swift_endAccess();
    swift_release();
    sub_100005ED8();
    char v33 = v14[v8[9]];
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v54[0]) = v33;
    sub_100049288();
    *(unsigned char *)(sub_100005ED8() + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_requestOrigin) = v14[v8[11]];
    swift_release();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_100009598(v2, (uint64_t)qword_1000605E0);
    uint64_t v35 = v52;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v52, v34, v2);
    uint64_t v36 = (uint64_t)v51;
    sub_10000A2AC((uint64_t)v14, (uint64_t)v51);
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_1000491E8();
    os_log_type_t v38 = sub_10004A098();
    int v39 = v38;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v49 = v3;
      uint64_t v41 = v40;
      uint64_t v48 = swift_slowAlloc();
      v54[0] = v48;
      *(_DWORD *)uint64_t v41 = 136446466;
      if (v28) {
        uint64_t v42 = v50;
      }
      else {
        uint64_t v42 = 7104878;
      }
      uint64_t v50 = v2;
      if (v28) {
        unint64_t v43 = v28;
      }
      else {
        unint64_t v43 = 0xE300000000000000;
      }
      int v47 = v39;
      uint64_t v44 = v36;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_1000095FC(v42, v43, v54);
      sub_10004A1A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 1026;
      BOOL v45 = *(unsigned __int8 *)(v36 + v8[11]) == 2;
      sub_10000A310(v44);
      LODWORD(v53) = v45;
      sub_10004A1A8();
      _os_log_impl((void *)&_mh_execute_header, v37, (os_log_type_t)v47, "System-wide translation invoked from bundleID: %{public}s, request developer-originated: %{BOOL,public}d", (uint8_t *)v41, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v52, v50);
    }
    else
    {
      sub_10000A310(v36);

      swift_bridgeObjectRelease_n();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v35, v2);
    }
    sub_100005ED8();
    sub_100024650((uint64_t)v14);
    swift_release();
    sub_1000055C8();
    sub_10000A310((uint64_t)v14);
  }
}

void sub_100006E48()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = (void *)sub_100007E84();

    if (v2)
    {
      [v2 confirmUserConsent];
      swift_unknownObjectRelease();
    }
  }
}

void sub_100006F04()
{
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for ActionViewController();
  objc_msgSendSuper2(&v19, "viewDidLoad");
  id v1 = [v0 view];
  if (!v1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v2 = v1;
  uint64_t v3 = self;
  id v4 = [v3 clearColor];
  [v2 setBackgroundColor:v4];

  id v5 = sub_1000066C8();
  id v6 = [v5 view];

  if (!v6)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v7 = [v3 clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = sub_100005F54();
  id v9 = [v8 view];

  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v10 = [v3 clearColor];
  [v9 setBackgroundColor:v10];

  id v11 = sub_1000066C8();
  id v12 = [v11 view];

  if (v12)
  {
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v13 = self;
    uint64_t v14 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_10000A160;
    *(void *)(v15 + 24) = v14;
    v18[4] = sub_10000A004;
    v18[5] = v15;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256;
    v18[2] = sub_10000769C;
    v18[3] = &unk_10005A1B0;
    uint64_t v16 = _Block_copy(v18);
    swift_retain();
    swift_release();
    [(id)v13 performWithoutAnimation:v16];
    _Block_release(v16);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v13 & 1) == 0)
    {
      id v17 = sub_1000066C8();
      [v0 addChildViewController:v17];
      swift_release();

      return;
    }
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:
  __break(1u);
}

void sub_100007200()
{
  uint64_t Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v1 = [Strong view];

  if (!v1)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v2 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v3 = sub_1000066C8();

  id v4 = [v3 view];
  if (!v4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  [v1 addSubview:v4];

  sub_100004334(&qword_10005D888);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10004B0C0;
  id v6 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v7 = sub_1000066C8();

  id v8 = [v7 view];
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v9 = [v8 topAnchor];

  id v10 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v11 = [v10 view];

  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v12 = [v11 topAnchor];

  id v13 = [v9 constraintEqualToAnchor:v12];
  *(void *)(v5 + 32) = v13;
  uint64_t v14 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v15 = sub_1000066C8();

  id v16 = [v15 view];
  if (!v16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v17 = [v16 bottomAnchor];

  uint64_t v18 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v19 = [v18 view];

  if (!v19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v20 = [v19 bottomAnchor];

  id v21 = [v17 constraintEqualToAnchor:v20];
  *(void *)(v5 + 40) = v21;
  BOOL v22 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v23 = sub_1000066C8();

  id v24 = [v23 view];
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v25 = [v24 leadingAnchor];

  uint64_t v26 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v27 = [v26 view];

  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v28 = [v27 leadingAnchor];

  id v29 = [v25 constraintEqualToAnchor:v28];
  *(void *)(v5 + 48) = v29;
  uint64_t v30 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v31 = sub_1000066C8();

  id v32 = [v31 view];
  if (!v32)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v33 = [v32 trailingAnchor];

  uint64_t v34 = (void *)swift_unknownObjectUnownedLoadStrong();
  id v35 = [v34 view];

  if (!v35)
  {
LABEL_23:
    __break(1u);
    return;
  }
  uint64_t v36 = self;
  id v37 = [v35 trailingAnchor];

  id v38 = [v33 constraintEqualToAnchor:v37];
  *(void *)(v5 + 56) = v38;
  sub_100049F88();
  sub_10000A3C8(0, &qword_10005D890);
  Class isa = sub_100049F58().super.isa;
  swift_bridgeObjectRelease();
  [v36 activateConstraints:isa];
}

uint64_t sub_10000769C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void *sub_100007884()
{
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100049208();
  sub_100009598(v0, (uint64_t)qword_1000605E0);
  id v1 = sub_1000491E8();
  os_log_type_t v2 = sub_10004A058();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Ask host to expand sheet if needed", v3, 2u);
    swift_slowDealloc();
  }

  sub_100005E3C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t result = (void *)swift_release();
  if ((v5 & 1) == 0)
  {
    uint64_t result = (void *)sub_100007E84();
    if (result)
    {
      [result expandSheet];
      return (void *)swift_unknownObjectRelease();
    }
  }
  return result;
}

void *sub_1000079EC(void *a1)
{
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100049208();
  sub_100009598(v2, (uint64_t)qword_1000605E0);
  id v3 = a1;
  id v4 = sub_1000491E8();
  os_log_type_t v5 = sub_10004A058();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 134349056;
    [v3 length];
    sub_10004A1A8();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Finish with replacement of length %{public}ld", v6, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t result = (void *)sub_100007E84();
  if (result)
  {
    [result finishWithTranslation:v3];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_100007B68()
{
  id v1 = v0;
  uint64_t v2 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v2 - 8);
  sub_100005E3C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  id v3 = (void *)sub_10004A0A8();
  sub_10004A0B8();

  id v4 = objc_allocWithZone((Class)sub_100049168());
  os_log_type_t v5 = (void *)sub_100049148();
  sub_100009DF4(&qword_10005D850, v6, (void (*)(uint64_t))type metadata accessor for ActionViewController);
  id v7 = v1;
  sub_100049158();
  sub_100005ED8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  sub_100049128();
  sub_100005ED8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  sub_100049138();
  sub_100005E3C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  if (v9 == 1)
  {
    id v8 = sub_1000066C8();
    [v8 pushViewController:v5 animated:1];
  }
  else
  {
    id v8 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v5];
    [v7 presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t sub_100007E84()
{
  if ([v0 _remoteViewControllerProxy])
  {
    sub_10004A1D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_100009D30((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100004334(&qword_10005D848);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1000054EC((uint64_t)v4, &qword_10005D840);
    return 0;
  }
}

id sub_100007F60(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = [self *a3];

  return v3;
}

id sub_100007FAC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationContext] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationModel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostNavigationController] = 0;
  if (a2)
  {
    NSString v5 = sub_100049E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ActionViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

id sub_1000080BC(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationContext] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___translationModel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostNavigationController] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ActionViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100008164()
{
  return sub_10000817C(type metadata accessor for ActionViewController);
}

id sub_10000817C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ActionViewController()
{
  return self;
}

uint64_t sub_100008244(uint64_t a1)
{
  uint64_t v2 = sub_100048E48();
  uint64_t v55 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v49 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100004334(&qword_10005D810);
  __chkstk_darwin(v52);
  uint64_t v54 = (uint64_t)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004334(&qword_10005D818);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v51 = (uint64_t)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = (char *)&v46 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  id v13 = (char *)&v46 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  id v16 = (char *)&v46 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  id v19 = (char *)&v46 - v18;
  __chkstk_darwin(v17);
  id v21 = (char *)&v46 - v20;
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v50 = v13;
  uint64_t v22 = sub_100049208();
  sub_100009598(v22, (uint64_t)qword_1000605E0);
  sub_100005488(a1, (uint64_t)v21, &qword_10005D818);
  id v23 = sub_1000491E8();
  os_log_type_t v24 = sub_10004A058();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v53 = v16;
  if (v25)
  {
    int v47 = v10;
    uint64_t v48 = a1;
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v58 = v46;
    *(_DWORD *)uint64_t v26 = 136446210;
    sub_100005488((uint64_t)v21, (uint64_t)v19, &qword_10005D818);
    uint64_t v27 = v2;
    uint64_t v28 = v55;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v19, 1, v27) == 1)
    {
      sub_1000054EC((uint64_t)v19, &qword_10005D818);
      uint64_t v29 = 0;
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v29 = sub_100048DB8();
      uint64_t v30 = v33;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v27);
    }
    uint64_t v2 = v27;
    uint64_t v32 = v54;
    uint64_t v56 = v29;
    uint64_t v57 = v30;
    sub_100004334(&qword_10005D830);
    uint64_t v34 = sub_100049EC8();
    uint64_t v56 = sub_1000095FC(v34, v35, &v58);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    sub_1000054EC((uint64_t)v21, &qword_10005D818);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Source locale changed to %{public}s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v31 = (uint64_t)v47;
    a1 = v48;
    id v16 = v53;
  }
  else
  {
    sub_1000054EC((uint64_t)v21, &qword_10005D818);

    uint64_t v31 = (uint64_t)v10;
    uint64_t v32 = v54;
  }
  sub_100005ED8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v36 = v32 + *(int *)(v52 + 48);
  sub_100005488(a1, v32, &qword_10005D818);
  sub_100005488((uint64_t)v16, v36, &qword_10005D818);
  uint64_t v37 = v55;
  id v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48);
  if (v38(v32, 1, v2) == 1)
  {
    sub_1000054EC((uint64_t)v16, &qword_10005D818);
    if (v38(v36, 1, v2) == 1) {
      return sub_1000054EC(v32, &qword_10005D818);
    }
  }
  else
  {
    uint64_t v40 = (uint64_t)v50;
    sub_100005488(v32, (uint64_t)v50, &qword_10005D818);
    if (v38(v36, 1, v2) != 1)
    {
      uint64_t v41 = v31;
      uint64_t v42 = v49;
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v49, v36, v2);
      sub_100009DF4(&qword_10005D828, 255, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v43 = sub_100049E68();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v37 + 8);
      BOOL v45 = v42;
      uint64_t v31 = v41;
      v44(v45, v2);
      sub_1000054EC((uint64_t)v53, &qword_10005D818);
      v44((char *)v40, v2);
      uint64_t result = sub_1000054EC(v54, &qword_10005D818);
      if (v43) {
        return result;
      }
      goto LABEL_16;
    }
    sub_1000054EC((uint64_t)v53, &qword_10005D818);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v40, v2);
  }
  sub_1000054EC(v32, &qword_10005D810);
LABEL_16:
  sub_100005ED8();
  sub_100005488(a1, v31, &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488(v31, v51, &qword_10005D818);
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v56) = 0;
  swift_retain();
  sub_100049288();
  sub_1000054EC(v31, &qword_10005D818);
  return swift_release();
}

void sub_100008990(uint64_t a1)
{
  uint64_t v2 = sub_100048E48();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int v47 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100004334(&qword_10005D810);
  __chkstk_darwin(v51);
  uint64_t v52 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005D818);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v53 = (uint64_t)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v50 = (uint64_t)&v46 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v49 = (uint64_t)&v46 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v46 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  id v21 = (char *)&v46 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)&v46 - v22;
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v55 = v18;
  uint64_t v48 = v15;
  uint64_t v24 = sub_100049208();
  sub_100009598(v24, (uint64_t)qword_1000605E0);
  sub_100005488(a1, (uint64_t)v23, &qword_10005D818);
  BOOL v25 = sub_1000491E8();
  os_log_type_t v26 = sub_10004A058();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v54 = v3;
  if (v27)
  {
    uint64_t v46 = a1;
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136446210;
    sub_100005488((uint64_t)v23, (uint64_t)v21, &qword_10005D818);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v21, 1, v2) == 1)
    {
      sub_1000054EC((uint64_t)v21, &qword_10005D818);
      uint64_t v29 = 0;
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v31 = v3;
      uint64_t v29 = sub_100048DB8();
      uint64_t v30 = v32;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v2);
    }
    uint64_t v56 = v29;
    uint64_t v57 = v30;
    sub_100004334(&qword_10005D830);
    uint64_t v33 = sub_100049EC8();
    uint64_t v56 = sub_1000095FC(v33, v34, &v58);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    sub_1000054EC((uint64_t)v23, &qword_10005D818);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Target locale changed to %{public}s", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v3 = v54;
    a1 = v46;
  }
  else
  {
    sub_1000054EC((uint64_t)v23, &qword_10005D818);
  }
  sub_100005ED8();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v35 = (uint64_t)v55;
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v36 = v52;
  uint64_t v37 = v52 + *(int *)(v51 + 48);
  sub_100005488(a1, v52, &qword_10005D818);
  sub_100005488(v35, v37, &qword_10005D818);
  id v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v38(v36, 1, v2) == 1)
  {
    sub_1000054EC(v35, &qword_10005D818);
    if (v38(v37, 1, v2) == 1)
    {
      sub_1000054EC(v36, &qword_10005D818);
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v39 = (uint64_t)v48;
    sub_100005488(v36, (uint64_t)v48, &qword_10005D818);
    if (v38(v37, 1, v2) != 1)
    {
      uint64_t v40 = v47;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v47, v37, v2);
      sub_100009DF4(&qword_10005D828, 255, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v41 = sub_100049E68();
      uint64_t v42 = *(void (**)(char *, uint64_t))(v3 + 8);
      v42(v40, v2);
      sub_1000054EC((uint64_t)v55, &qword_10005D818);
      v42((char *)v39, v2);
      sub_1000054EC(v36, &qword_10005D818);
      if (v41) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    sub_1000054EC((uint64_t)v55, &qword_10005D818);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v39, v2);
  }
  sub_1000054EC(v36, &qword_10005D810);
LABEL_16:
  sub_100005ED8();
  uint64_t v43 = v49;
  sub_100005488(a1, v49, &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488(v43, v50, &qword_10005D818);
  swift_retain();
  sub_100049288();
  sub_1000054EC(v43, &qword_10005D818);
  swift_release();
LABEL_17:
  uint64_t v44 = v53;
  sub_100005488(a1, v53, &qword_10005D818);
  if (v38(v44, 1, v2) == 1)
  {
    sub_1000054EC(v44, &qword_10005D818);
  }
  else
  {
    sub_100048DB8();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v44, v2);
    sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
    BOOL v45 = (void *)sub_10004A0A8();
    sub_10004A0F8();
  }
}

uint64_t sub_100009158@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_10000916C()
{
  return sub_100009528();
}

uint64_t sub_100009180()
{
  return sub_1000092FC();
}

uint64_t sub_100009194(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D818);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v7 = &v9[-v6];
  sub_100005488(a1, (uint64_t)&v9[-v6], &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488((uint64_t)v7, (uint64_t)v5, &qword_10005D818);
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  v9[15] = 0;
  swift_retain();
  sub_100049288();
  return sub_1000054EC((uint64_t)v7, &qword_10005D818);
}

uint64_t sub_1000092E8()
{
  return sub_1000092FC();
}

uint64_t sub_1000092FC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();

  return swift_release();
}

uint64_t sub_100009374(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D818);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_100005488(a1, (uint64_t)&v9 - v6, &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488((uint64_t)v7, (uint64_t)v5, &qword_10005D818);
  swift_retain();
  sub_100049288();
  return sub_1000054EC((uint64_t)v7, &qword_10005D818);
}

uint64_t sub_100009484@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_100009498@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100009514()
{
  return sub_100009528();
}

uint64_t sub_100009528()
{
  return sub_100049288();
}

uint64_t sub_100009598(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000095D0()
{
  return sub_1000092FC();
}

uint64_t sub_1000095FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000096D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000988C((uint64_t)v12, *a3);
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
      sub_10000988C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A404((uint64_t)v12);
  return v7;
}

uint64_t sub_1000096D0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10004A1B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000098E8(a5, a6);
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
  uint64_t v8 = sub_10004A278();
  if (!v8)
  {
    sub_10004A288();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10004A2C8();
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

uint64_t sub_10000988C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000098E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009980(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100009B60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100009B60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009980(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100009AF8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10004A258();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10004A288();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100049F28();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10004A2C8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10004A288();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100009AF8(uint64_t a1, uint64_t a2)
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
  sub_100004334(&qword_10005D838);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100009B60(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004334(&qword_10005D838);
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
  uint64_t result = sub_10004A2C8();
  __break(1u);
  return result;
}

uint64_t sub_100009CB4()
{
  return sub_1000092FC();
}

uint64_t sub_100009CE0@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_100009D08()
{
  return sub_100009528();
}

uint64_t sub_100009D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005D840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_100009DA0@<D0>(_OWORD *a1@<X8>)
{
  return sub_100006468((void (*)(void))sub_10000A0D4, a1);
}

uint64_t sub_100009DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000064E4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000A0D4);
}

uint64_t sub_100009DF4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009E3C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100009E74()
{
}

double sub_100009E7C@<D0>(_OWORD *a1@<X8>)
{
  return sub_100006468((void (*)(void))sub_10000A080, a1);
}

uint64_t sub_100009E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000064E4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000A080);
}

void sub_100009ED0()
{
}

double sub_100009ED8@<D0>(_OWORD *a1@<X8>)
{
  return sub_100006468((void (*)(void))sub_10000A02C, a1);
}

uint64_t sub_100009EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000064E4(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000A02C);
}

void sub_100009F2C(void *a1)
{
}

uint64_t sub_100009F34@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v2 = sub_100049478();
  uint64_t v4 = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  *(void *)(result + 24) = v4;
  *a1 = sub_10000A004;
  a1[1] = (uint64_t (*)())result;
  return result;
}

void sub_100009F9C()
{
}

uint64_t sub_100009FA4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009FDC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A004()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10000A02C()
{
  unint64_t result = qword_10005D870;
  if (!qword_10005D870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D870);
  }
  return result;
}

unint64_t sub_10000A080()
{
  unint64_t result = qword_10005D878;
  if (!qword_10005D878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D878);
  }
  return result;
}

unint64_t sub_10000A0D4()
{
  unint64_t result = qword_10005D880;
  if (!qword_10005D880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D880);
  }
  return result;
}

uint64_t sub_10000A128()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000A160()
{
}

uint64_t sub_10000A168()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A178(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A188()
{
  return swift_release();
}

uint64_t sub_10000A190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationRequestContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005D8A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A25C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_10000A284()
{
  return sub_100009528();
}

uint64_t sub_10000A2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationRequestContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A310(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranslationRequestContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000A36C()
{
}

uint64_t sub_10000A374(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_10000A384(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000A3C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000A404(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A454()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 50, 7);
}

uint64_t initializeBufferWithCopyOfBuffer for ActionViewController.Data(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ActionViewController.Data()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActionViewController.Data(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActionViewController.Data(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  return a1;
}

__n128 initializeWithTake for ActionViewController.Data(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ActionViewController.Data(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionViewController.Data(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 34)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActionViewController.Data(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 34) = 1;
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
    *(unsigned char *)(result + 34) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActionViewController.Data()
{
  return &type metadata for ActionViewController.Data;
}

unsigned char *initializeBufferWithCopyOfBuffer for TranslationModel.TranslationAnnotation(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TranslationModel.TranslationAnnotation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AnnotationView(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x10000A804);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnnotationView()
{
  return &type metadata for AnnotationView;
}

uint64_t sub_10000A83C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_10000A858@<D0>(char a1@<W0>, _OWORD *a2@<X8>)
{
  sub_10000A9F8(a1 & 1);
  int v30 = sub_100049758();
  uint64_t v3 = sub_100049A38();
  uint64_t v5 = v4;
  char v7 = v6;
  swift_bridgeObjectRelease();
  sub_1000499B8();
  uint64_t v8 = sub_100049A58();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  swift_release();
  sub_10000AAD0(v3, v5, v7 & 1);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_100049DE8();
  sub_100013604(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v26, 0.0, 1, 0.0, 1, v15, v16, v8, v10, v12 & 1, v14);
  sub_10000AAD0(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  long long v18 = v26[5];
  double result = *(double *)&v27;
  long long v19 = v28;
  long long v20 = v29;
  long long v21 = v26[2];
  long long v22 = v26[3];
  long long v23 = v26[4];
  long long v25 = v26[0];
  long long v24 = v26[1];
  a2[6] = v27;
  a2[7] = v19;
  a2[8] = v20;
  a2[2] = v21;
  a2[3] = v22;
  a2[4] = v23;
  a2[5] = v18;
  *a2 = v25;
  a2[1] = v24;
  return result;
}

uint64_t sub_10000A9F8(char a1)
{
  int v2 = (objc_class *)[self mainBundle];
  if (a1)
  {
    v7._countAndFlagsBits = 0xE000000000000000;
    v3._object = (void *)0x8000000100054920;
    v3._countAndFlagsBits = 0xD000000000000014;
  }
  else
  {
    v3._countAndFlagsBits = 0xD00000000000001ALL;
    v7._countAndFlagsBits = 0xE000000000000000;
    v3._object = (void *)0x8000000100054900;
  }
  v8.value._countAndFlagsBits = 0;
  v8.value._object = 0;
  v4.super.Class isa = v2;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  uint64_t v5 = sub_100048D08(v3, v8, v4, v9, v7);

  return v5;
}

double sub_10000AAC8@<D0>(_OWORD *a1@<X8>)
{
  return sub_10000A858(*v1, a1);
}

uint64_t sub_10000AAD0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000AAE4()
{
  unint64_t result = qword_10005D8C0;
  if (!qword_10005D8C0)
  {
    sub_1000044D8(&qword_10005D8C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D8C0);
  }
  return result;
}

uint64_t EnvironmentValues._dismiss.getter()
{
  sub_10000A0D4();
  sub_1000495D8();
  return v1;
}

void sub_10000AB98(void *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

uint64_t EnvironmentValues._dismiss.setter()
{
  return sub_1000495E8();
}

void (*EnvironmentValues._dismiss.modify(void *a1))(uint64_t **a1, char a2)
{
  Swift::String v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_10000A0D4();
  sub_1000495D8();
  *(_OWORD *)Swift::String v3 = *((_OWORD *)v3 + 1);
  return sub_10000AC74;
}

void sub_10000AC74(uint64_t **a1, char a2)
{
  int v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  v2[2] = v4;
  v2[3] = v3;
  if (a2)
  {
    swift_retain();
    sub_1000495E8();
    swift_release();
  }
  else
  {
    sub_1000495E8();
  }

  free(v2);
}

void *initializeBufferWithCopyOfBuffer for DismissAction(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for DismissAction()
{
  return swift_release();
}

void *assignWithCopy for DismissAction(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for DismissAction(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DismissAction(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DismissAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DismissAction()
{
  return &type metadata for DismissAction;
}

ValueMetadata *type metadata accessor for DismissActionKey()
{
  return &type metadata for DismissActionKey;
}

uint64_t *sub_10000AE58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100048E48();
    Swift::String_optional v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    char v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
  }
  swift_retain();
  return a1;
}

uint64_t sub_10000AF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100048E48();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);

  return swift_release();
}

uint64_t sub_10000AFF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_retain();
  return a1;
}

uint64_t sub_10000B0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000B164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10000B208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_10000B2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B2CC);
}

uint64_t sub_10000B2CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000B38C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B3A0);
}

uint64_t sub_10000B3A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100048E48();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for DownloadSelectionView(uint64_t a1)
{
  return sub_100010174(a1, qword_10005D928);
}

uint64_t sub_10000B47C()
{
  uint64_t result = sub_100048E48();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000B518()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v82 = a3;
  uint64_t v83 = a4;
  uint64_t v89 = a2;
  uint64_t v92 = a1;
  uint64_t v6 = type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v87 = *(void *)(v6 - 8);
  uint64_t v7 = (int *)(v6 - 8);
  uint64_t v86 = *(void *)(v87 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v85 = (uint64_t)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100048E48();
  uint64_t v88 = *(void *)(v9 - 8);
  uint64_t v10 = v88;
  uint64_t v84 = *(void *)(v88 + 64);
  uint64_t v11 = __chkstk_darwin(v9);
  v90 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v81 = (char *)&v71 - v13;
  uint64_t v14 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v14 - 8);
  uint64_t v91 = (uint64_t)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_100048E58();
  uint64_t v75 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  long long v74 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100004334(&qword_10005D818);
  uint64_t v18 = __chkstk_darwin(v17);
  long long v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  long long v22 = (char *)&v71 - v21;
  uint64_t v79 = a5 + v7[8];
  uint64_t v24 = v10 + 56;
  long long v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v23((char *)&v71 - v21, 1, 1, v9);
  long long v77 = v23;
  uint64_t v76 = v24;
  sub_100005488((uint64_t)v22, (uint64_t)v20, &qword_10005D818);
  sub_100049C88();
  sub_1000054EC((uint64_t)v22, &qword_10005D818);
  uint64_t v80 = a5 + v7[9];
  v23(v22, 1, 1, v9);
  sub_100005488((uint64_t)v22, (uint64_t)v20, &qword_10005D818);
  sub_100049C88();
  sub_1000054EC((uint64_t)v22, &qword_10005D818);
  uint64_t v25 = v7[10];
  uint64_t v93 = 0;
  sub_100004334(&qword_10005D970);
  sub_100049C88();
  *(_OWORD *)(a5 + v25) = v95;
  uint64_t v26 = a5 + v7[11];
  long long v27 = (objc_class *)[self mainBundle];
  v70._countAndFlagsBits = 0xE000000000000000;
  v97._object = (void *)0x8000000100054940;
  v97._countAndFlagsBits = 0xD000000000000012;
  v98.value._countAndFlagsBits = 0;
  v98.value._object = 0;
  v28.super.Class isa = v27;
  v99._countAndFlagsBits = 0;
  v99._object = (void *)0xE000000000000000;
  uint64_t v29 = sub_100048D08(v97, v98, v28, v99, v70);
  unint64_t v31 = v30;

  uint64_t v93 = v29;
  unint64_t v94 = v31;
  sub_100049C88();
  uint64_t v32 = v96;
  *(_OWORD *)uint64_t v26 = v95;
  *(void *)(v26 + 16) = v32;
  uint64_t v33 = a5 + v7[12];
  LOBYTE(v93) = 0;
  sub_100049C88();
  uint64_t v34 = *((void *)&v95 + 1);
  *(unsigned char *)uint64_t v33 = v95;
  *(void *)(v33 + 8) = v34;
  uint64_t v35 = a5 + v7[13];
  LOBYTE(v93) = 0;
  sub_100049C88();
  uint64_t v36 = *((void *)&v95 + 1);
  *(unsigned char *)uint64_t v35 = v95;
  *(void *)(v35 + 8) = v36;
  uint64_t v37 = a5 + v7[14];
  uint64_t v93 = 0;
  unint64_t v94 = 0xE000000000000000;
  sub_100049C88();
  uint64_t v38 = v96;
  *(_OWORD *)uint64_t v37 = v95;
  *(void *)(v37 + 16) = v38;
  uint64_t v39 = v7[15];
  uint64_t v93 = 0;
  sub_100049C88();
  *(_OWORD *)(a5 + v39) = v95;
  uint64_t v40 = (uint64_t *)(a5 + v7[16]);
  type metadata accessor for TranslationContext();
  sub_1000101AC(&qword_10005D860, (void (*)(uint64_t))type metadata accessor for TranslationContext);
  *uint64_t v40 = sub_100049448();
  v40[1] = v41;
  uint64_t v42 = v7[17];
  long long v73 = v7;
  uint64_t v43 = (uint64_t *)(a5 + v42);
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, enum case for TranslationTaskHint.system(_:), v78);
  sub_100048FE8();
  swift_allocObject();
  sub_100048FC8();
  sub_1000101AC(&qword_10005D978, (void (*)(uint64_t))&type metadata accessor for LanguagesService);
  *uint64_t v43 = sub_100049378();
  v43[1] = v44;
  BOOL v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16);
  uint64_t v72 = a5;
  uint64_t v46 = v92;
  uint64_t v47 = v9;
  v45(a5, v92, v9);
  uint64_t v48 = v89;
  v45(a5 + v7[7], v89, v9);
  v45((uint64_t)v22, v46, v9);
  uint64_t v49 = v77;
  v77(v22, 0, 1, v9);
  uint64_t v50 = v79;
  sub_1000054EC(v79, &qword_10005D980);
  uint64_t v51 = sub_100004334(&qword_10005D980);
  *(void *)(v50 + *(int *)(v51 + 28)) = 0;
  sub_1000101F4((uint64_t)v22, v50);
  v45((uint64_t)v22, v48, v47);
  v49(v22, 0, 1, v47);
  uint64_t v52 = v80;
  sub_1000054EC(v80, &qword_10005D980);
  *(void *)(v52 + *(int *)(v51 + 28)) = 0;
  sub_1000101F4((uint64_t)v22, v52);
  uint64_t v53 = v72;
  uint64_t v54 = (void *)(v72 + v73[18]);
  uint64_t v55 = v83;
  *uint64_t v54 = v82;
  v54[1] = v55;
  uint64_t v56 = sub_10004A018();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v91, 1, 1, v56);
  uint64_t v57 = v81;
  v45((uint64_t)v81, v92, v47);
  v45((uint64_t)v90, v48, v47);
  uint64_t v58 = v85;
  sub_10001025C(v53, v85);
  sub_100049FF8();
  swift_retain();
  uint64_t v59 = sub_100049FE8();
  uint64_t v60 = v88;
  uint64_t v61 = *(unsigned __int8 *)(v88 + 80);
  uint64_t v62 = (v61 + 32) & ~v61;
  uint64_t v63 = (v84 + v61 + v62) & ~v61;
  unint64_t v64 = (v84 + *(unsigned __int8 *)(v87 + 80) + v63) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = v59;
  *(void *)(v65 + 24) = &protocol witness table for MainActor;
  uint64_t v66 = v65 + v62;
  uint64_t v67 = *(void (**)(uint64_t, char *, uint64_t))(v60 + 32);
  v67(v66, v57, v47);
  v67(v65 + v63, v90, v47);
  sub_1000105B8(v58, v65 + v64);
  sub_100025868(v91, (uint64_t)&unk_10005D990, v65);
  swift_release();
  swift_release();
  uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
  v68(v89, v47);
  return ((uint64_t (*)(uint64_t, uint64_t))v68)(v92, v47);
}

uint64_t sub_10000BE24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004334(&qword_10005DAF0);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  int v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_100004334(&qword_10005DC08);
  __chkstk_darwin(v6 - 8);
  uint64_t v29 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049668();
  uint64_t v8 = sub_100049A68();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_100049C38();
  uint64_t v27 = sub_100049A28();
  uint64_t v28 = v13;
  uint64_t v15 = v14;
  char v17 = v16;
  swift_release();
  char v18 = v17 & 1;
  sub_10000AAD0(v8, v10, v12);
  swift_bridgeObjectRelease();
  LOBYTE(v8) = sub_1000498E8();
  uint64_t v19 = sub_100049A48();
  uint64_t v20 = (uint64_t)v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v29, 1, 1, v19);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100005488(v20, (uint64_t)v5 + *(int *)(v3 + 36), &qword_10005DC08);
  *int v5 = KeyPath;
  uint64_t v22 = sub_100004334(&qword_10005DAD0);
  sub_100005488((uint64_t)v5, a1 + *(int *)(v22 + 36), &qword_10005DAF0);
  uint64_t v23 = v27;
  uint64_t v24 = v28;
  *(void *)a1 = v27;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v18;
  *(void *)(a1 + 24) = v24;
  *(unsigned char *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(unsigned char *)(a1 + 72) = 1;
  uint64_t v25 = v23;
  sub_100012B84(v23, v15, v18);
  swift_bridgeObjectRetain();
  sub_1000054EC((uint64_t)v5, &qword_10005DAF0);
  sub_1000054EC(v20, &qword_10005DC08);
  sub_10000AAD0(v25, v15, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000C0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[7] = a4;
  uint64_t v7 = sub_100048F68();
  v6[10] = v7;
  v6[11] = *(void *)(v7 - 8);
  v6[12] = swift_task_alloc();
  v6[13] = sub_100004334(&qword_10005D998);
  v6[14] = swift_task_alloc();
  sub_100004334(&qword_10005D9A0);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  uint64_t v8 = sub_100048E48();
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v9 = sub_100048EA8();
  v6[22] = v9;
  v6[23] = *(void *)(v9 - 8);
  v6[24] = swift_task_alloc();
  sub_100049FF8();
  v6[25] = sub_100049FE8();
  uint64_t v11 = sub_100049FD8();
  v6[26] = v11;
  v6[27] = v10;
  return _swift_task_switch(sub_10000C2FC, v11, v10);
}

uint64_t sub_10000C2FC()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[8];
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[19] + 16);
  v4(v0[21], v0[7], v2);
  v4(v1, v3, v2);
  sub_100048E68();
  int v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *int v5 = v0;
  v5[1] = sub_10000C400;
  uint64_t v6 = v0[24];
  uint64_t v7 = v0[17];
  return static LanguagesStatusService.languagePairState(_:)(v7, v6);
}

uint64_t sub_10000C400()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 208);
    uint64_t v4 = *(void *)(v2 + 216);
    int v5 = sub_10000C934;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 208);
    uint64_t v4 = *(void *)(v2 + 216);
    int v5 = sub_10000C524;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10000C524()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  swift_release();
  uint64_t v4 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56);
  v4(v1, 0, 1, v2);
  uint64_t v6 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 88);
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v6, enum case for LanguageState.installed(_:), v9);
  v4(v6, 0, 1, v9);
  uint64_t v11 = v8 + *(int *)(v7 + 48);
  sub_100005488(v5, v8, &qword_10005D9A0);
  sub_100005488(v6, v11, &qword_10005D9A0);
  char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v12(v8, 1, v9) != 1)
  {
    uint64_t v14 = *(void *)(v0 + 80);
    sub_100005488(*(void *)(v0 + 112), *(void *)(v0 + 120), &qword_10005D9A0);
    int v15 = v12(v11, 1, v14);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v17 = *(void *)(v0 + 128);
    if (v15 != 1)
    {
      uint64_t v20 = *(void *)(v0 + 112);
      uint64_t v22 = *(void *)(v0 + 88);
      uint64_t v21 = *(void *)(v0 + 96);
      uint64_t v23 = *(void *)(v0 + 80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v21, v11, v23);
      sub_1000101AC(&qword_10005D9B0, (void (*)(uint64_t))&type metadata accessor for LanguageState);
      char v24 = sub_100049E68();
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v25(v21, v23);
      sub_1000054EC(v17, &qword_10005D9A0);
      v25(v16, v23);
      sub_1000054EC(v20, &qword_10005D9A0);
      if ((v24 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    uint64_t v18 = *(void *)(v0 + 80);
    uint64_t v19 = *(void *)(v0 + 88);
    sub_1000054EC(*(void *)(v0 + 128), &qword_10005D9A0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    sub_1000054EC(*(void *)(v0 + 112), &qword_10005D998);
    goto LABEL_9;
  }
  uint64_t v13 = *(void *)(v0 + 80);
  sub_1000054EC(*(void *)(v0 + 128), &qword_10005D9A0);
  if (v12(v11, 1, v13) != 1) {
    goto LABEL_6;
  }
  sub_1000054EC(*(void *)(v0 + 112), &qword_10005D9A0);
LABEL_8:
  uint64_t v26 = *(void *)(v0 + 72);
  uint64_t v27 = (objc_class *)[self mainBundle];
  v40._countAndFlagsBits = 0xE000000000000000;
  v42._countAndFlagsBits = 0x54414C534E415254;
  v42._object = (void *)0xE900000000000045;
  v43.value._countAndFlagsBits = 0;
  v43.value._object = 0;
  v28.super.Class isa = v27;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  uint64_t v29 = sub_100048D08(v42, v43, v28, v44, v40);
  uint64_t v31 = v30;

  uint64_t v32 = (long long *)(v26 + *(int *)(type metadata accessor for DownloadSelectionView_iOS(0) + 36));
  long long v33 = *v32;
  uint64_t v34 = *((void *)v32 + 2);
  *(_OWORD *)(v0 + 16) = v33;
  *(void *)(v0 + 32) = v34;
  *(void *)(v0 + 40) = v29;
  *(void *)(v0 + 48) = v31;
  sub_100004334(&qword_10005D9A8);
  sub_100049CA8();
LABEL_9:
  uint64_t v36 = *(void *)(v0 + 184);
  uint64_t v35 = *(void *)(v0 + 192);
  uint64_t v37 = *(void *)(v0 + 176);
  sub_1000054EC(*(void *)(v0 + 136), &qword_10005D9A0);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
  return v38();
}

uint64_t sub_10000C934()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  swift_release();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v4(v1, 1, 1, v2);
  uint64_t v6 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 88);
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v6, enum case for LanguageState.installed(_:), v9);
  v4(v6, 0, 1, v9);
  uint64_t v11 = v8 + *(int *)(v7 + 48);
  sub_100005488(v5, v8, &qword_10005D9A0);
  sub_100005488(v6, v11, &qword_10005D9A0);
  char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v12(v8, 1, v9) != 1)
  {
    uint64_t v14 = *(void *)(v0 + 80);
    sub_100005488(*(void *)(v0 + 112), *(void *)(v0 + 120), &qword_10005D9A0);
    int v15 = v12(v11, 1, v14);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v17 = *(void *)(v0 + 128);
    if (v15 != 1)
    {
      uint64_t v20 = *(void *)(v0 + 112);
      uint64_t v22 = *(void *)(v0 + 88);
      uint64_t v21 = *(void *)(v0 + 96);
      uint64_t v23 = *(void *)(v0 + 80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v21, v11, v23);
      sub_1000101AC(&qword_10005D9B0, (void (*)(uint64_t))&type metadata accessor for LanguageState);
      char v24 = sub_100049E68();
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v25(v21, v23);
      sub_1000054EC(v17, &qword_10005D9A0);
      v25(v16, v23);
      sub_1000054EC(v20, &qword_10005D9A0);
      if ((v24 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    uint64_t v18 = *(void *)(v0 + 80);
    uint64_t v19 = *(void *)(v0 + 88);
    sub_1000054EC(*(void *)(v0 + 128), &qword_10005D9A0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    sub_1000054EC(*(void *)(v0 + 112), &qword_10005D998);
    goto LABEL_9;
  }
  uint64_t v13 = *(void *)(v0 + 80);
  sub_1000054EC(*(void *)(v0 + 128), &qword_10005D9A0);
  if (v12(v11, 1, v13) != 1) {
    goto LABEL_6;
  }
  sub_1000054EC(*(void *)(v0 + 112), &qword_10005D9A0);
LABEL_8:
  uint64_t v26 = *(void *)(v0 + 72);
  uint64_t v27 = (objc_class *)[self mainBundle];
  v40._countAndFlagsBits = 0xE000000000000000;
  v42._countAndFlagsBits = 0x54414C534E415254;
  v42._object = (void *)0xE900000000000045;
  v43.value._countAndFlagsBits = 0;
  v43.value._object = 0;
  v28.super.Class isa = v27;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  uint64_t v29 = sub_100048D08(v42, v43, v28, v44, v40);
  uint64_t v31 = v30;

  uint64_t v32 = (long long *)(v26 + *(int *)(type metadata accessor for DownloadSelectionView_iOS(0) + 36));
  long long v33 = *v32;
  uint64_t v34 = *((void *)v32 + 2);
  *(_OWORD *)(v0 + 16) = v33;
  *(void *)(v0 + 32) = v34;
  *(void *)(v0 + 40) = v29;
  *(void *)(v0 + 48) = v31;
  sub_100004334(&qword_10005D9A8);
  sub_100049CA8();
LABEL_9:
  uint64_t v36 = *(void *)(v0 + 184);
  uint64_t v35 = *(void *)(v0 + 192);
  uint64_t v37 = *(void *)(v0 + 176);
  sub_1000054EC(*(void *)(v0 + 136), &qword_10005D9A0);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
  return v38();
}

uint64_t sub_10000CD44(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D818);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v19 - v5;
  uint64_t v7 = sub_100048E48();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v20 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v12 = (char *)&v19 - v11;
  uint64_t v13 = type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v21 = a1;
  sub_100004334(&qword_10005D980);
  sub_100049C98();
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v14(v6, 1, v7) == 1) {
    return sub_1000054EC((uint64_t)v6, &qword_10005D818);
  }
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v19(v12, v6, v7);
  uint64_t v16 = (uint64_t)v22;
  sub_100049C98();
  if (v14((char *)v16, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    return sub_1000054EC((uint64_t)v22, &qword_10005D818);
  }
  else
  {
    uint64_t v17 = v20;
    v19(v20, v22, v7);
    (*(void (**)(char *, char *))(v21 + *(int *)(v13 + 64)))(v12, v17);
    uint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
    v18(v17, v7);
    return ((uint64_t (*)(char *, uint64_t))v18)(v12, v7);
  }
}

uint64_t sub_10000CFF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v76 = a1;
  uint64_t v2 = type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v77 = v2 - 8;
  uint64_t v75 = v3;
  uint64_t v74 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v73 = (uint64_t)v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100004334(&qword_10005DA88);
  __chkstk_darwin(v72);
  uint64_t v64 = (uint64_t)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005DA90);
  uint64_t v70 = *(void *)(v6 - 8);
  uint64_t v71 = v6;
  __chkstk_darwin(v6);
  uint64_t v69 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004334(&qword_10005DA98);
  __chkstk_darwin(v8 - 8);
  uint64_t v68 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100049728();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004334(&qword_10005DAA0);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004334(&qword_10005DAA8);
  uint64_t v66 = *(void *)(v18 - 8);
  uint64_t v67 = v18;
  __chkstk_darwin(v18);
  uint64_t v62 = (char *)v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100004334(&qword_10005DAB0);
  __chkstk_darwin(v65);
  uint64_t v63 = (char *)v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = v1;
  sub_100004334(&qword_10005DAB8);
  sub_1000121F8();
  sub_1000499D8();
  sub_100049718();
  sub_100005584(&qword_10005DB28, &qword_10005DAA0);
  sub_100049BD8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v59 = sub_100049668();
  uint64_t v58 = v21;
  v56[1] = v22;
  uint64_t v57 = v23;
  uint64_t v61 = v1;
  sub_10000F2E0(v64);
  char v24 = (char *)(v1 + *(int *)(v77 + 52));
  char v25 = *v24;
  uint64_t v26 = *((void *)v24 + 1);
  char v83 = v25;
  uint64_t v84 = v26;
  uint64_t v60 = sub_100004334(&qword_10005DB30);
  sub_100049CB8();
  uint64_t v27 = sub_1000044D8(&qword_10005DB38);
  uint64_t v28 = sub_1000044D8(&qword_10005DB40);
  uint64_t v29 = sub_1000044D8(&qword_10005DB48);
  uint64_t v30 = sub_100005584(&qword_10005DB50, &qword_10005DB48);
  uint64_t v79 = v29;
  uint64_t v80 = v10;
  uint64_t v81 = v30;
  uint64_t v82 = &protocol witness table for InsetGroupedListStyle;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v32 = sub_1000124E8();
  uint64_t v79 = v27;
  uint64_t v80 = v28;
  uint64_t v81 = OpaqueTypeConformance2;
  uint64_t v82 = (void *)v32;
  swift_getOpaqueTypeConformance2();
  long long v33 = v69;
  sub_100049358();
  uint64_t v34 = v70;
  uint64_t v35 = (uint64_t)v68;
  uint64_t v36 = v33;
  uint64_t v37 = v33;
  uint64_t v38 = v71;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v36, v71);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v38);
  uint64_t v39 = sub_100049DC8();
  uint64_t v41 = v40;
  uint64_t v42 = (uint64_t)v63;
  uint64_t v43 = (uint64_t)&v63[*(int *)(v65 + 36)];
  sub_100005488(v35, v43, &qword_10005DA98);
  Swift::String v44 = (uint64_t *)(v43 + *(int *)(sub_100004334(&qword_10005DB68) + 36));
  *Swift::String v44 = v39;
  v44[1] = v41;
  uint64_t v46 = v66;
  uint64_t v45 = v67;
  uint64_t v47 = v62;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v42, v62, v67);
  sub_1000054EC(v35, &qword_10005DA98);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
  uint64_t v48 = v61;
  uint64_t v49 = v61 + *(int *)(v77 + 48);
  char v50 = *(unsigned char *)v49;
  uint64_t v51 = *(void *)(v49 + 8);
  char v83 = v50;
  uint64_t v84 = v51;
  sub_100049CB8();
  uint64_t v52 = v73;
  sub_10001025C(v48, v73);
  unint64_t v53 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
  uint64_t v54 = swift_allocObject();
  sub_1000105B8(v52, v54 + v53);
  sub_100004334(&qword_10005DB70);
  sub_100012600();
  sub_100005584(&qword_10005DB88, &qword_10005DB70);
  sub_100049BA8();
  swift_release();
  swift_release();
  swift_release();
  return sub_1000054EC(v42, &qword_10005DAB0);
}

uint64_t sub_10000D838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v4 = v3 - 8;
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v33 + 64);
  __chkstk_darwin(v3);
  uint64_t v35 = sub_100049018();
  uint64_t v6 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004334(&qword_10005DDC0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100004334(&qword_10005DB10);
  __chkstk_darwin(v34);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100004334(&qword_10005DAD0);
  __chkstk_darwin(v36);
  sub_10000BE24((uint64_t)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(int *)(v4 + 44);
  uint64_t v32 = a1;
  uint64_t v16 = (long long *)(a1 + v15);
  long long v17 = *v16;
  uint64_t v18 = *((void *)v16 + 2);
  long long v39 = v17;
  uint64_t v40 = v18;
  sub_100004334(&qword_10005D9A8);
  sub_100049C98();
  sub_10001025C(a1, (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v19 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v20 = swift_allocObject();
  sub_1000105B8((uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  sub_100049008();
  sub_100049DD8();
  __n128 v21 = sub_1000137F8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v11, 0.0, 1, 0.0, 1);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v35, v21);
  LOBYTE(v8) = sub_100049928();
  sub_1000492D8();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_100005488((uint64_t)v11, (uint64_t)v13, &qword_10005DDC0);
  uint64_t v30 = &v13[*(int *)(v34 + 36)];
  *uint64_t v30 = (char)v8;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_1000054EC((uint64_t)v11, &qword_10005DDC0);
  uint64_t v38 = v32;
  sub_100004334(&qword_10005DB00);
  sub_1000122AC();
  sub_100005584(&qword_10005DAF8, &qword_10005DB00);
  sub_1000123C0();
  return sub_100049D78();
}

uint64_t sub_10000DC64@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005DBC0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v33 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v32 = (char *)&v29 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v31 = (char *)&v29 - v14;
  __chkstk_darwin(v13);
  uint64_t v30 = (char *)&v29 - v15;
  sub_10001025C(a1, (uint64_t)v6);
  uint64_t v16 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  uint64_t v29 = v16 | 7;
  uint64_t v18 = swift_allocObject();
  sub_1000105B8((uint64_t)v6, v18 + v17);
  uint64_t v36 = a1;
  sub_100004334(&qword_10005DBC8);
  sub_100005584(&qword_10005DBD0, &qword_10005DBC8);
  unint64_t v19 = v30;
  sub_100049CD8();
  sub_10001025C(a1, (uint64_t)v6);
  uint64_t v20 = swift_allocObject();
  sub_1000105B8((uint64_t)v6, v20 + v17);
  uint64_t v35 = a1;
  __n128 v21 = v31;
  sub_100049CD8();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v23 = v32;
  v22(v32, v19, v7);
  uint64_t v24 = v33;
  v22(v33, v21, v7);
  uint64_t v25 = v34;
  v22(v34, v23, v7);
  uint64_t v26 = sub_100004334(&qword_10005DBD8);
  v22(&v25[*(int *)(v26 + 48)], v24, v7);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v8 + 8);
  v27(v21, v7);
  v27(v19, v7);
  v27(v24, v7);
  return ((uint64_t (*)(char *, uint64_t))v27)(v23, v7);
}

uint64_t sub_10000E028()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100049DF8();
  uint64_t v30 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100049E18();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v27 = *((void *)v8 - 1);
  uint64_t v9 = *(void *)(v27 + 64);
  __chkstk_darwin(v8);
  uint64_t v10 = (objc_class *)[self mainBundle];
  v26._countAndFlagsBits = 0xE000000000000000;
  v38._countAndFlagsBits = 0x54414C534E415254;
  v38._object = (void *)0xEE004D4F52465F45;
  v39.value._countAndFlagsBits = 0;
  v39.value._object = 0;
  v11.super.Class isa = v10;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  uint64_t v12 = sub_100048D08(v38, v39, v11, v40, v26);
  uint64_t v14 = v13;

  uint64_t v15 = v1 + v8[12];
  long long v16 = *(_OWORD *)v15;
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v15 + 16);
  long long aBlock = v16;
  uint64_t v32 = v17;
  uint64_t v36 = v12;
  uint64_t v37 = v14;
  sub_100004334(&qword_10005D9A8);
  sub_100049CA8();
  long long aBlock = *(_OWORD *)(v1 + v8[13]);
  uint64_t v36 = 0;
  sub_100004334(&qword_10005DBB0);
  sub_100049CA8();
  if (*(void *)(v1 + v8[14]))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    if (aBlock)
    {
      sub_100012C70();
      uint64_t v18 = (void *)sub_10004A108();
      sub_10001025C(v1, (uint64_t)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
      unint64_t v19 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
      uint64_t v20 = swift_allocObject();
      sub_1000105B8((uint64_t)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
      uint64_t v34 = sub_100012CB4;
      uint64_t v35 = v20;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v32 = sub_10004732C;
      uint64_t v33 = &unk_10005A550;
      __n128 v21 = _Block_copy(&aBlock);
      swift_release();
      sub_100049E08();
      *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
      sub_1000101AC((unint64_t *)&qword_10005DBF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100004334(&qword_10005DBF8);
      sub_100005584((unint64_t *)&qword_10005DC00, &qword_10005DBF8);
      sub_10004A1E8();
      sub_10004A118();
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v2);
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v7, v29);
    }
    else
    {
      uint64_t v23 = v1 + v8[10];
      char v24 = *(unsigned char *)v23;
      uint64_t v25 = *(void *)(v23 + 8);
      LOBYTE(aBlock) = v24;
      *((void *)&aBlock + 1) = v25;
      LOBYTE(v36) = 1;
      sub_100004334(&qword_10005DB30);
      return sub_100049CA8();
    }
  }
  else
  {
    type metadata accessor for TranslationContext();
    sub_1000101AC(&qword_10005D860, (void (*)(uint64_t))type metadata accessor for TranslationContext);
    uint64_t result = sub_100049438();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E56C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v3 = sub_100048E48();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  Swift::String v44 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v44 - v7;
  uint64_t v9 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v9 - 8);
  NSBundle v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049668();
  uint64_t v12 = sub_100049A68();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_100049C28();
  uint64_t v17 = sub_100049A28();
  uint64_t v47 = v18;
  uint64_t v48 = v17;
  int v46 = v19;
  uint64_t v49 = v20;
  swift_release();
  sub_10000AAD0(v12, v14, v16);
  swift_bridgeObjectRelease();
  type metadata accessor for DownloadSelectionView_iOS(0);
  sub_100004334(&qword_10005D980);
  sub_100049C98();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1, v3))
  {
    sub_1000054EC((uint64_t)v11, &qword_10005D818);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v11, v3);
    sub_1000054EC((uint64_t)v11, &qword_10005D818);
    uint64_t v25 = v44;
    sub_100048E38();
    uint64_t v26 = sub_100048DD8();
    uint64_t v28 = v27;
    uint64_t v29 = *(void (**)(char *, uint64_t))(v4 + 8);
    v29(v25, v3);
    v29(v8, v3);
    if (v28)
    {
      uint64_t v50 = v26;
      uint64_t v51 = v28;
      sub_100012C1C();
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100049A78();
      uint64_t v32 = v31;
      uint64_t v45 = v33;
      char v35 = v34 & 1;
      sub_100049C08();
      uint64_t v21 = sub_100049A28();
      uint64_t v22 = v36;
      char v38 = v37;
      uint64_t v24 = v39;
      swift_release();
      uint64_t v23 = v38 & 1;
      sub_10000AAD0(v30, v32, v35);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
LABEL_6:
  char v40 = v46 & 1;
  uint64_t v42 = v47;
  uint64_t v41 = v48;
  *(void *)a2 = v48;
  *(void *)(a2 + 8) = v42;
  *(unsigned char *)(a2 + 16) = v40;
  *(void *)(a2 + 24) = v49;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v21;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v23;
  *(void *)(a2 + 72) = v24;
  sub_100012B84(v41, v42, v40);
  swift_bridgeObjectRetain();
  sub_100012B94(v21, v22, v23, v24);
  sub_100012BD8(v21, v22, v23, v24);
  sub_10000AAD0(v41, v42, v40);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E948()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100049DF8();
  uint64_t v30 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100049E18();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v27 = *((void *)v8 - 1);
  uint64_t v9 = *(void *)(v27 + 64);
  __chkstk_darwin(v8);
  uint64_t v10 = (objc_class *)[self mainBundle];
  v26._countAndFlagsBits = 0xE000000000000000;
  v38._countAndFlagsBits = 0x54414C534E415254;
  v38._object = (void *)0xEC0000004F545F45;
  v39.value._countAndFlagsBits = 0;
  v39.value._object = 0;
  v11.super.Class isa = v10;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  uint64_t v12 = sub_100048D08(v38, v39, v11, v40, v26);
  uint64_t v14 = v13;

  uint64_t v15 = v1 + v8[12];
  long long v16 = *(_OWORD *)v15;
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v15 + 16);
  long long aBlock = v16;
  uint64_t v32 = v17;
  uint64_t v36 = v12;
  uint64_t v37 = v14;
  sub_100004334(&qword_10005D9A8);
  sub_100049CA8();
  long long aBlock = *(_OWORD *)(v1 + v8[13]);
  uint64_t v36 = 1;
  sub_100004334(&qword_10005DBB0);
  sub_100049CA8();
  if (*(void *)(v1 + v8[14]))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    if (aBlock)
    {
      sub_100012C70();
      uint64_t v18 = (void *)sub_10004A108();
      sub_10001025C(v1, (uint64_t)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
      unint64_t v19 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
      uint64_t v20 = swift_allocObject();
      sub_1000105B8((uint64_t)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
      char v34 = sub_100012CB4;
      uint64_t v35 = v20;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v32 = sub_10004732C;
      uint64_t v33 = &unk_10005A500;
      uint64_t v21 = _Block_copy(&aBlock);
      swift_release();
      sub_100049E08();
      *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
      sub_1000101AC((unint64_t *)&qword_10005DBF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100004334(&qword_10005DBF8);
      sub_100005584((unint64_t *)&qword_10005DC00, &qword_10005DBF8);
      sub_10004A1E8();
      sub_10004A118();
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v2);
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v7, v29);
    }
    else
    {
      uint64_t v23 = v1 + v8[10];
      char v24 = *(unsigned char *)v23;
      uint64_t v25 = *(void *)(v23 + 8);
      LOBYTE(aBlock) = v24;
      *((void *)&aBlock + 1) = v25;
      LOBYTE(v36) = 1;
      sub_100004334(&qword_10005DB30);
      return sub_100049CA8();
    }
  }
  else
  {
    type metadata accessor for TranslationContext();
    sub_1000101AC(&qword_10005D860, (void (*)(uint64_t))type metadata accessor for TranslationContext);
    uint64_t result = sub_100049438();
    __break(1u);
  }
  return result;
}

__n128 sub_10000EE8C@<Q0>(uint64_t a1@<X0>, void (*a2)(__n128 *__return_ptr, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100049618();
  a2(&v14, a1);
  char v7 = v15;
  uint64_t v8 = v16;
  uint64_t v9 = v17;
  char v10 = v18;
  __n128 result = v14;
  long long v12 = v19;
  long long v13 = v20;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  *(__n128 *)(a3 + 24) = result;
  *(unsigned char *)(a3 + 40) = v7;
  *(void *)(a3 + 48) = v8;
  *(void *)(a3 + 56) = v9;
  *(unsigned char *)(a3 + 64) = v10;
  *(_OWORD *)(a3 + 72) = v12;
  *(_OWORD *)(a3 + 88) = v13;
  return result;
}

uint64_t sub_10000EF14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v3 = sub_100048E48();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  Swift::String v44 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v44 - v7;
  uint64_t v9 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v9 - 8);
  NSBundle v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049668();
  uint64_t v12 = sub_100049A68();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_100049C28();
  uint64_t v17 = sub_100049A28();
  uint64_t v47 = v18;
  uint64_t v48 = v17;
  int v46 = v19;
  uint64_t v49 = v20;
  swift_release();
  sub_10000AAD0(v12, v14, v16);
  swift_bridgeObjectRelease();
  type metadata accessor for DownloadSelectionView_iOS(0);
  sub_100004334(&qword_10005D980);
  sub_100049C98();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1, v3))
  {
    sub_1000054EC((uint64_t)v11, &qword_10005D818);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v11, v3);
    sub_1000054EC((uint64_t)v11, &qword_10005D818);
    uint64_t v25 = v44;
    sub_100048E38();
    uint64_t v26 = sub_100048DD8();
    uint64_t v28 = v27;
    uint64_t v29 = *(void (**)(char *, uint64_t))(v4 + 8);
    v29(v25, v3);
    v29(v8, v3);
    if (v28)
    {
      uint64_t v50 = v26;
      uint64_t v51 = v28;
      sub_100012C1C();
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100049A78();
      uint64_t v32 = v31;
      uint64_t v45 = v33;
      char v35 = v34 & 1;
      sub_100049C08();
      uint64_t v21 = sub_100049A28();
      uint64_t v22 = v36;
      char v38 = v37;
      uint64_t v24 = v39;
      swift_release();
      uint64_t v23 = v38 & 1;
      sub_10000AAD0(v30, v32, v35);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
LABEL_6:
  char v40 = v46 & 1;
  uint64_t v42 = v47;
  uint64_t v41 = v48;
  *(void *)a2 = v48;
  *(void *)(a2 + 8) = v42;
  *(unsigned char *)(a2 + 16) = v40;
  *(void *)(a2 + 24) = v49;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v21;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v23;
  *(void *)(a2 + 72) = v24;
  sub_100012B84(v41, v42, v40);
  swift_bridgeObjectRetain();
  sub_100012B94(v21, v22, v23, v24);
  sub_100012BD8(v21, v22, v23, v24);
  sub_10000AAD0(v41, v42, v40);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F2E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v2 = type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v3 = v2 - 8;
  v33[0] = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v33[1] = v4;
  uint64_t v34 = (uint64_t)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100004334(&qword_10005DB40);
  __chkstk_darwin(v44);
  uint64_t v43 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100049728();
  uint64_t v6 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004334(&qword_10005DB48);
  uint64_t v37 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  NSBundle v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004334(&qword_10005DB38);
  uint64_t v41 = *(void *)(v12 - 8);
  uint64_t v42 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004334(&qword_10005DA88);
  uint64_t v39 = *(void *)(v15 - 8);
  uint64_t v40 = v15;
  __chkstk_darwin(v15);
  char v38 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = v1;
  sub_100004334(&qword_10005DB90);
  uint64_t v17 = sub_1000044D8(&qword_10005DB98);
  uint64_t v18 = sub_100048F88();
  uint64_t v19 = sub_1000101AC(&qword_10005DBA0, (void (*)(uint64_t))&type metadata accessor for LanguagesView);
  uint64_t v47 = v18;
  uint64_t v48 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v47 = v17;
  uint64_t v48 = OpaqueTypeConformance2;
  uint64_t v21 = v36;
  swift_getOpaqueTypeConformance2();
  sub_1000499D8();
  sub_100049718();
  uint64_t v22 = sub_100005584(&qword_10005DB50, &qword_10005DB48);
  sub_100049BD8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
  uint64_t v23 = v35;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v9);
  if (*(void *)(v23 + *(int *)(v3 + 64)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    if (v47)
    {
      uint64_t v24 = v34;
      sub_10001025C(v23, v34);
      unint64_t v25 = (*(unsigned __int8 *)(v33[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33[0] + 80);
      uint64_t v26 = swift_allocObject();
      sub_1000105B8(v24, v26 + v25);
      uint64_t v27 = (uint64_t)v43;
      sub_100048EE8();
      uint64_t v28 = sub_100048EF8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
    }
    else
    {
      uint64_t v29 = sub_100048EF8();
      uint64_t v27 = (uint64_t)v43;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v43, 1, 1, v29);
    }
    uint64_t v47 = v9;
    uint64_t v48 = v21;
    uint64_t v49 = v22;
    uint64_t v50 = &protocol witness table for InsetGroupedListStyle;
    swift_getOpaqueTypeConformance2();
    sub_1000124E8();
    uint64_t v30 = v38;
    uint64_t v31 = v42;
    sub_100049B48();
    sub_1000054EC(v27, &qword_10005DB40);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v31);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v45, v30, v40);
  }
  else
  {
    type metadata accessor for TranslationContext();
    sub_1000101AC(&qword_10005D860, (void (*)(uint64_t))type metadata accessor for TranslationContext);
    uint64_t result = sub_100049438();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F99C()
{
  return sub_100049368();
}

uint64_t sub_10000FADC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_1000495F8();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005DBA8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  __chkstk_darwin(v7);
  uint64_t v8 = sub_100048F88();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  __chkstk_darwin(v8);
  NSBundle v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004334(&qword_10005DB98);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v35 = v12;
  uint64_t v36 = v13;
  __chkstk_darwin(v12);
  uint64_t v30 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DownloadSelectionView_iOS(0);
  sub_100004334(&qword_10005D980);
  sub_100049CB8();
  sub_100049CB8();
  long long v38 = *(_OWORD *)(a1 + *(int *)(v15 + 52));
  sub_100004334(&qword_10005DBB0);
  sub_100049CB8();
  long long v39 = *(_OWORD *)(a1 + *(int *)(v15 + 32));
  sub_100004334(&qword_10005DBB8);
  sub_100049C98();
  sub_100048F78();
  uint64_t v17 = v33;
  uint64_t v16 = v34;
  (*(void (**)(char *, void, uint64_t))(v33 + 104))(v5, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v34);
  uint64_t v18 = sub_1000101AC(&qword_10005DBA0, (void (*)(uint64_t))&type metadata accessor for LanguagesView);
  uint64_t v20 = v30;
  uint64_t v19 = v31;
  sub_100049B98();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v16);
  uint64_t v21 = v19;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v19);
  sub_100049668();
  uint64_t v22 = sub_100049A68();
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  *(void *)&long long v39 = v21;
  *((void *)&v39 + 1) = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v35;
  sub_100049B28();
  sub_10000AAD0(v22, v24, v26);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v20, v27);
}

uint64_t sub_10000FF40()
{
  return sub_100049CA8();
}

uint64_t sub_10000FFA8()
{
  return sub_100049CA8();
}

uint64_t sub_100010018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100048E48();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSBundle v11 = (char *)&v17 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v17 - v10, v2, v5);
  v12(v9, v2 + *(int *)(a1 + 20), v5);
  uint64_t v13 = (uint64_t *)(v2 + *(int *)(a1 + 24));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  swift_retain();
  return sub_10000B534((uint64_t)v11, (uint64_t)v9, v14, v15, a2);
}

uint64_t type metadata accessor for DownloadSelectionView_iOS(uint64_t a1)
{
  return sub_100010174(a1, (uint64_t *)&unk_10005DA10);
}

uint64_t sub_100010174(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000101AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000101F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005D818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001025C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DownloadSelectionView_iOS(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000102C0()
{
  uint64_t v1 = sub_100048E48();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v17 = v3;
  uint64_t v6 = (v5 + v3 + v4) & ~v3;
  uint64_t v7 = (int *)type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v16 = *(unsigned __int8 *)(*((void *)v7 - 1) + 80);
  uint64_t v14 = *(void *)(*((void *)v7 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v0 + v4, v1);
  v8(v0 + v6, v1);
  uint64_t v18 = v0;
  uint64_t v15 = (v6 + v5 + v16) & ~v16;
  uint64_t v9 = v0 + v15;
  v8(v0 + v15, v1);
  v8(v0 + v15 + v7[5], v1);
  uint64_t v10 = v0 + v15 + v7[6];
  NSBundle v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (!v11(v9 + v7[6], 1, v1)) {
    v8(v10, v1);
  }
  sub_100004334(&qword_10005D980);
  swift_release();
  uint64_t v12 = v9 + v7[7];
  if (!v11(v12, 1, v1)) {
    v8(v12, v1);
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v18, v15 + v14, v17 | v16 | 7);
}

uint64_t sub_1000105B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DownloadSelectionView_iOS(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001061C(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(sub_100048E48() - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(type metadata accessor for DownloadSelectionView_iOS(0) - 8) + 80);
  uint64_t v11 = v9 + v8 + v10;
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = v1 + v7;
  uint64_t v15 = v1 + v9;
  uint64_t v16 = v1 + (v11 & ~v10);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  void *v17 = v3;
  v17[1] = sub_100010788;
  return sub_10000C0BC(a1, v12, v13, v14, v15, v16);
}

uint64_t sub_100010788()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *sub_10001087C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100048E48();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(v4, a2, v7);
    v9((uint64_t *)((char *)v4 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v10 = a3[6];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v56 = v8;
    if (v57((char *)a2 + v10, 1, v7))
    {
      uint64_t v13 = sub_100004334(&qword_10005D818);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    uint64_t v15 = sub_100004334(&qword_10005D980);
    *(void *)&v11[*(int *)(v15 + 28)] = *(void *)&v12[*(int *)(v15 + 28)];
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    swift_retain();
    if (v57(v18, 1, v7))
    {
      uint64_t v19 = sub_100004334(&qword_10005D818);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v17, (uint64_t *)v18, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v17, 0, 1, v7);
    }
    *(void *)&v17[*(int *)(v15 + 28)] = *(void *)&v18[*(int *)(v15 + 28)];
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    uint64_t v22 = (uint64_t *)((char *)v4 + v20);
    uint64_t v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v55 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v55;
    uint64_t v24 = (uint64_t *)((char *)v4 + v21);
    char v25 = (uint64_t *)((char *)a2 + v21);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    v24[2] = v25[2];
    uint64_t v27 = a3[10];
    uint64_t v28 = a3[11];
    uint64_t v29 = (char *)v4 + v27;
    uint64_t v30 = (char *)a2 + v27;
    char *v29 = *v30;
    *((void *)v29 + 1) = *((void *)v30 + 1);
    uint64_t v31 = (char *)v4 + v28;
    uint64_t v32 = (char *)a2 + v28;
    char *v31 = *v32;
    *((void *)v31 + 1) = *((void *)v32 + 1);
    uint64_t v33 = a3[12];
    uint64_t v34 = a3[13];
    uint64_t v35 = (uint64_t *)((char *)v4 + v33);
    uint64_t v36 = (uint64_t *)((char *)a2 + v33);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    v35[2] = v36[2];
    long long v38 = (uint64_t *)((char *)v4 + v34);
    long long v39 = (uint64_t *)((char *)a2 + v34);
    uint64_t v40 = v39[1];
    *long long v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = a3[14];
    uint64_t v42 = a3[15];
    uint64_t v43 = (uint64_t *)((char *)v4 + v41);
    uint64_t v44 = (uint64_t *)((char *)a2 + v41);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    *uint64_t v43 = v46;
    v43[1] = v45;
    uint64_t v47 = (uint64_t *)((char *)v4 + v42);
    uint64_t v48 = (uint64_t *)((char *)a2 + v42);
    uint64_t v49 = v48[1];
    *uint64_t v47 = *v48;
    v47[1] = v49;
    uint64_t v50 = a3[16];
    uint64_t v51 = (uint64_t *)((char *)v4 + v50);
    uint64_t v52 = (uint64_t *)((char *)a2 + v50);
    uint64_t v53 = v52[1];
    void *v51 = *v52;
    v51[1] = v53;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100010C40(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100048E48();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v6(a1 + a2[5], v4);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4)) {
    v6(v7, v4);
  }
  sub_100004334(&qword_10005D980);
  swift_release();
  uint64_t v9 = a1 + a2[7];
  if (!v8(v9, 1, v4)) {
    v6(v9, v4);
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100010E50(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v8(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v54 = v7;
  if (v55(a2 + v9, 1, v6))
  {
    uint64_t v12 = sub_100004334(&qword_10005D818);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = sub_100004334(&qword_10005D980);
  *(void *)&v10[*(int *)(v13 + 28)] = *(void *)&v11[*(int *)(v13 + 28)];
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  swift_retain();
  if (v55((uint64_t)v16, 1, v6))
  {
    uint64_t v17 = sub_100004334(&qword_10005D818);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v15, (uint64_t)v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v15, 0, 1, v6);
  }
  *(void *)&v15[*(int *)(v13 + 28)] = *(void *)&v16[*(int *)(v13 + 28)];
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v18);
  uint64_t v21 = (void *)(a2 + v18);
  uint64_t v53 = v21[1];
  void *v20 = *v21;
  v20[1] = v53;
  uint64_t v22 = (void *)(a1 + v19);
  uint64_t v23 = (void *)(a2 + v19);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  v22[2] = v23[2];
  uint64_t v25 = a3[10];
  uint64_t v26 = a3[11];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(void *)(v27 + 8) = *(void *)(v28 + 8);
  uint64_t v29 = a1 + v26;
  uint64_t v30 = a2 + v26;
  *(unsigned char *)uint64_t v29 = *(unsigned char *)v30;
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  uint64_t v31 = a3[12];
  uint64_t v32 = a3[13];
  uint64_t v33 = (void *)(a1 + v31);
  uint64_t v34 = (void *)(a2 + v31);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  void v33[2] = v34[2];
  uint64_t v36 = (void *)(a1 + v32);
  uint64_t v37 = (void *)(a2 + v32);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = a3[14];
  uint64_t v40 = a3[15];
  uint64_t v41 = (void *)(a1 + v39);
  uint64_t v42 = (uint64_t *)(a2 + v39);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  uint64_t v45 = (void *)(a1 + v40);
  uint64_t v46 = (void *)(a2 + v40);
  uint64_t v47 = v46[1];
  void *v45 = *v46;
  v45[1] = v47;
  uint64_t v48 = a3[16];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  uint64_t v51 = v50[1];
  *uint64_t v49 = *v50;
  v49[1] = v51;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000111C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v51 = (void (*)(char *, char *, uint64_t))v8;
  v8(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v8) = v12(a1 + v9, 1, v6);
  int v13 = v12((uint64_t)v11, 1, v6);
  uint64_t v52 = v7;
  if (v8)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v14 = sub_100004334(&qword_10005D818);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v51(v10, v11, v6);
LABEL_7:
  uint64_t v15 = sub_100004334(&qword_10005D980);
  *(void *)&v10[*(int *)(v15 + 28)] = *(void *)&v11[*(int *)(v15 + 28)];
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)(a1 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  int v19 = v12(a1 + v16, 1, v6);
  int v20 = v12((uint64_t)v18, 1, v6);
  if (!v19)
  {
    if (!v20)
    {
      v51(v17, v18, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v17, v6);
    goto LABEL_12;
  }
  if (v20)
  {
LABEL_12:
    uint64_t v21 = sub_100004334(&qword_10005D818);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v17, v18, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v17, 0, 1, v6);
LABEL_13:
  *(void *)&v17[*(int *)(v15 + 28)] = *(void *)&v18[*(int *)(v15 + 28)];
  swift_retain();
  swift_release();
  uint64_t v22 = a3[8];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  swift_retain();
  swift_release();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = a2 + v25;
  void *v26 = *(void *)(a2 + v25);
  v26[1] = *(void *)(a2 + v25 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26[2] = *(void *)(v27 + 16);
  swift_retain();
  swift_release();
  uint64_t v28 = a3[10];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  *(unsigned char *)uint64_t v29 = *(unsigned char *)v30;
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(unsigned char *)uint64_t v32 = *(unsigned char *)v33;
  *(void *)(v32 + 8) = *(void *)(v33 + 8);
  swift_retain();
  swift_release();
  uint64_t v34 = a3[12];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = a2 + v34;
  *uint64_t v35 = *(void *)(a2 + v34);
  v35[1] = *(void *)(a2 + v34 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35[2] = *(void *)(v36 + 16);
  swift_retain();
  swift_release();
  uint64_t v37 = a3[13];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  *uint64_t v38 = *v39;
  v38[1] = v39[1];
  swift_retain();
  swift_release();
  uint64_t v40 = a3[14];
  uint64_t v41 = a1 + v40;
  uint64_t v42 = a2 + v40;
  *(void *)(a1 + v40) = *(void *)(a2 + v40);
  swift_retain();
  swift_release();
  *(void *)(v41 + 8) = *(void *)(v42 + 8);
  uint64_t v43 = a3[15];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (void *)(a2 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_retain();
  swift_release();
  uint64_t v46 = a3[16];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = (void *)(a2 + v46);
  uint64_t v49 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v49;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000116B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v8(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v28 = v7;
  if (v29(a2 + v9, 1, v6))
  {
    uint64_t v12 = sub_100004334(&qword_10005D818);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = sub_100004334(&qword_10005D980);
  *(void *)&v10[*(int *)(v13 + 28)] = *(void *)&v11[*(int *)(v13 + 28)];
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  if (v29(a2 + v14, 1, v6))
  {
    uint64_t v17 = sub_100004334(&qword_10005D818);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v15, (uint64_t)v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v15, 0, 1, v6);
  }
  *(void *)&v15[*(int *)(v13 + 28)] = *(void *)&v16[*(int *)(v13 + 28)];
  uint64_t v18 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(void *)(v19 + 16) = *(void *)(v20 + 16);
  uint64_t v21 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  uint64_t v22 = a3[12];
  uint64_t v23 = a3[13];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  *(_OWORD *)(a1 + v23) = *(_OWORD *)(a2 + v23);
  uint64_t v26 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  return a1;
}

uint64_t sub_100011978(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v54 = (void (*)(char *, char *, uint64_t))v8;
  v8(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(a1 + v9, 1, v6);
  int v14 = v12((uint64_t)v11, 1, v6);
  uint64_t v55 = v7;
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v15 = sub_100004334(&qword_10005D818);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v54(v10, v11, v6);
LABEL_7:
  uint64_t v16 = sub_100004334(&qword_10005D980);
  *(void *)&v10[*(int *)(v16 + 28)] = *(void *)&v11[*(int *)(v16 + 28)];
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)(a1 + v17);
  uint64_t v19 = (char *)(a2 + v17);
  int v20 = v12(a1 + v17, 1, v6);
  int v21 = v12((uint64_t)v19, 1, v6);
  if (!v20)
  {
    if (!v21)
    {
      v54(v18, v19, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v18, v6);
    goto LABEL_12;
  }
  if (v21)
  {
LABEL_12:
    uint64_t v22 = sub_100004334(&qword_10005D818);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v18, v19, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v18, 0, 1, v6);
LABEL_13:
  *(void *)&v18[*(int *)(v16 + 28)] = *(void *)&v19[*(int *)(v16 + 28)];
  swift_release();
  uint64_t v23 = a3[8];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  swift_bridgeObjectRelease();
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_release();
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)(a2 + v26 + 8);
  void *v27 = *(void *)(a2 + v26);
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v27[2] = *(void *)(v28 + 16);
  swift_release();
  uint64_t v30 = a3[10];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  *(unsigned char *)uint64_t v31 = *(unsigned char *)v32;
  *(void *)(v31 + 8) = *(void *)(v32 + 8);
  swift_release();
  uint64_t v33 = a3[11];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  *(unsigned char *)uint64_t v34 = *(unsigned char *)v35;
  *(void *)(v34 + 8) = *(void *)(v35 + 8);
  swift_release();
  uint64_t v36 = a3[12];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)(a2 + v36 + 8);
  *uint64_t v37 = *(void *)(a2 + v36);
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v37[2] = *(void *)(v38 + 16);
  swift_release();
  uint64_t v40 = a3[13];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (uint64_t *)(a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_release();
  uint64_t v45 = a3[14];
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  *(void *)(a1 + v45) = *(void *)(a2 + v45);
  swift_release();
  *(void *)(v46 + 8) = *(void *)(v47 + 8);
  uint64_t v48 = a3[15];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (uint64_t *)(a2 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  *uint64_t v49 = v52;
  v49[1] = v51;
  swift_release();
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  swift_release();
  return a1;
}

uint64_t sub_100011DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011DE8);
}

uint64_t sub_100011DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004334(&qword_10005D980);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_100011F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011F18);
}

uint64_t sub_100011F18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100048E48();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100004334(&qword_10005D980);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100012030()
{
  sub_100048E48();
  if (v0 <= 0x3F)
  {
    sub_100012130();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100012130()
{
  if (!qword_10005DA20)
  {
    sub_1000044D8(&qword_10005D818);
    unint64_t v0 = sub_100049CC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005DA20);
    }
  }
}

uint64_t sub_10001218C()
{
  return sub_1000101AC(&qword_10005DA80, (void (*)(uint64_t))type metadata accessor for DownloadSelectionView_iOS);
}

uint64_t sub_1000121D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000121F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D838(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000121F8()
{
  unint64_t result = qword_10005DAC0;
  if (!qword_10005DAC0)
  {
    sub_1000044D8(&qword_10005DAB8);
    sub_1000122AC();
    sub_100005584(&qword_10005DAF8, &qword_10005DB00);
    sub_1000123C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DAC0);
  }
  return result;
}

unint64_t sub_1000122AC()
{
  unint64_t result = qword_10005DAC8;
  if (!qword_10005DAC8)
  {
    sub_1000044D8(&qword_10005DAD0);
    sub_10001234C();
    sub_100005584(&qword_10005DAE8, &qword_10005DAF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DAC8);
  }
  return result;
}

unint64_t sub_10001234C()
{
  unint64_t result = qword_10005DAD8;
  if (!qword_10005DAD8)
  {
    sub_1000044D8(&qword_10005DAE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DAD8);
  }
  return result;
}

unint64_t sub_1000123C0()
{
  unint64_t result = qword_10005DB08;
  if (!qword_10005DB08)
  {
    sub_1000044D8(&qword_10005DB10);
    sub_10001243C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DB08);
  }
  return result;
}

unint64_t sub_10001243C()
{
  unint64_t result = qword_10005DB18;
  if (!qword_10005DB18)
  {
    sub_1000044D8(&qword_10005DDC0);
    sub_1000101AC(&qword_10005DB20, (void (*)(uint64_t))&type metadata accessor for GrayCapsuleButton);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DB18);
  }
  return result;
}

unint64_t sub_1000124E8()
{
  unint64_t result = qword_10005DB58;
  if (!qword_10005DB58)
  {
    sub_1000044D8(&qword_10005DB40);
    sub_1000101AC(&qword_10005DB60, (void (*)(uint64_t))&type metadata accessor for CloseButton);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DB58);
  }
  return result;
}

uint64_t sub_100012590()
{
  type metadata accessor for DownloadSelectionView_iOS(0);

  return sub_10000F99C();
}

unint64_t sub_100012600()
{
  unint64_t result = qword_10005DB78;
  if (!qword_10005DB78)
  {
    sub_1000044D8(&qword_10005DAB0);
    sub_1000044D8(&qword_10005DAA0);
    sub_100049728();
    sub_100005584(&qword_10005DB28, &qword_10005DAA0);
    swift_getOpaqueTypeConformance2();
    sub_100005584(&qword_10005DB80, &qword_10005DB68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DB78);
  }
  return result;
}

uint64_t sub_100012718@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F2E0(a1);
}

uint64_t sub_10001273C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FADC(*(void *)(v1 + 16), a1);
}

uint64_t sub_100012750()
{
  uint64_t v1 = (int *)type metadata accessor for DownloadSelectionView_iOS(0);
  uint64_t v12 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v10 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v11 = (v12 + 16) & ~v12;
  uint64_t v13 = v0;
  uint64_t v2 = v0 + v11;
  uint64_t v3 = sub_100048E48();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  v5(v2 + v1[5], v3);
  uint64_t v6 = v2 + v1[6];
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (!v7(v6, 1, v3)) {
    v5(v6, v3);
  }
  sub_100004334(&qword_10005D980);
  swift_release();
  uint64_t v8 = v2 + v1[7];
  if (!v7(v8, 1, v3)) {
    v5(v8, v3);
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v13, v11 + v10, v12 | 7);
}

uint64_t sub_1000129D8()
{
  return sub_100012A0C((uint64_t (*)(uint64_t))sub_10000FF40);
}

uint64_t sub_1000129F4()
{
  return sub_100012A0C(sub_10000CD44);
}

uint64_t sub_100012A0C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for DownloadSelectionView_iOS(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_100012A80@<X0>(char *a1@<X8>)
{
  return sub_10000DC64(*(void *)(v1 + 16), a1);
}

uint64_t sub_100012A8C()
{
  return sub_100012AF0(sub_10000E028);
}

double sub_100012AA4@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_10000EE8C(*(void *)(v1 + 16), (void (*)(__n128 *__return_ptr, uint64_t))sub_10000E56C, a1).n128_u64[0];
  return result;
}

uint64_t sub_100012AD8()
{
  return sub_100012AF0(sub_10000E948);
}

uint64_t sub_100012AF0(uint64_t (*a1)(void))
{
  return a1();
}

double sub_100012B54@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_10000EE8C(*(void *)(v1 + 16), (void (*)(__n128 *__return_ptr, uint64_t))sub_10000EF14, a1).n128_u64[0];
  return result;
}

uint64_t sub_100012B84(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100012B94(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100012B84(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100012BD8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000AAD0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100012C1C()
{
  unint64_t result = qword_10005DBE0;
  if (!qword_10005DBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DBE0);
  }
  return result;
}

unint64_t sub_100012C70()
{
  unint64_t result = qword_10005DBE8;
  if (!qword_10005DBE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DBE8);
  }
  return result;
}

uint64_t sub_100012CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012CC8()
{
  return swift_release();
}

uint64_t sub_100012CD4()
{
  return sub_10000FFA8();
}

uint64_t sub_100012D30()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for ErrorView(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain();
  *a1 = v3;
  return a1;
}

uint64_t destroy for ErrorView()
{
  return swift_errorRelease();
}

void *assignWithCopy for ErrorView(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain();
  *a1 = v3;
  swift_errorRelease();
  return a1;
}

void *initializeWithTake for ErrorView(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for ErrorView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_errorRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ErrorView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ErrorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorView()
{
  return &type metadata for ErrorView;
}

uint64_t sub_100012F2C()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_100012F48@<Q0>(uint64_t a1@<X8>)
{
  sub_100049668();
  uint64_t v2 = sub_100049A68();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100049938();
  uint64_t v7 = sub_100049A58();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_10000AAD0(v2, v4, v6);
  swift_bridgeObjectRelease();
  *(void *)&long long v45 = sub_100049C38();
  uint64_t v12 = sub_100049A38();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_10000AAD0(v7, v9, v11 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v2) = sub_1000498D8();
  sub_1000492D8();
  uint64_t v32 = v12;
  uint64_t v33 = v14;
  char v34 = v18;
  uint64_t v35 = v16;
  uint64_t v36 = KeyPath;
  __int16 v37 = 1;
  char v38 = 1;
  char v39 = v2;
  uint64_t v40 = v20;
  uint64_t v41 = v21;
  uint64_t v42 = v22;
  uint64_t v43 = v23;
  char v44 = 0;
  sub_100049DD8();
  sub_1000139E0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v31, 0.0, 1, INFINITY, 0);
  sub_10000AAD0(v12, v14, v18);
  swift_release();
  swift_bridgeObjectRelease();
  long long v55 = v31[10];
  long long v56 = v31[11];
  long long v57 = v31[12];
  long long v51 = v31[6];
  long long v52 = v31[7];
  long long v53 = v31[8];
  long long v54 = v31[9];
  long long v47 = v31[2];
  long long v48 = v31[3];
  long long v49 = v31[4];
  long long v50 = v31[5];
  long long v45 = v31[0];
  __n128 v46 = (__n128)v31[1];
  char v24 = sub_1000498D8();
  long long v25 = v56;
  *(_OWORD *)(a1 + 160) = v55;
  *(_OWORD *)(a1 + 176) = v25;
  *(_OWORD *)(a1 + 192) = v57;
  long long v26 = v52;
  *(_OWORD *)(a1 + 96) = v51;
  *(_OWORD *)(a1 + 112) = v26;
  long long v27 = v54;
  *(_OWORD *)(a1 + 128) = v53;
  *(_OWORD *)(a1 + 144) = v27;
  long long v28 = v48;
  *(_OWORD *)(a1 + 32) = v47;
  *(_OWORD *)(a1 + 48) = v28;
  long long v29 = v50;
  *(_OWORD *)(a1 + 64) = v49;
  *(_OWORD *)(a1 + 80) = v29;
  __n128 result = v46;
  *(_OWORD *)a1 = v45;
  *(__n128 *)(a1 + 16) = result;
  *(unsigned char *)(a1 + 208) = v24;
  return result;
}

uint64_t sub_1000131CC()
{
  return sub_1000132A0(&qword_10005DC10, &qword_10005DC18, (void (*)(void))sub_100013210);
}

uint64_t sub_100013210()
{
  return sub_1000132A0(&qword_10005DC20, &qword_10005DC28, (void (*)(void))sub_100013240);
}

uint64_t sub_100013240()
{
  return sub_1000132A0(&qword_10005DC30, &qword_10005DC38, (void (*)(void))sub_100013270);
}

uint64_t sub_100013270()
{
  return sub_1000132A0(&qword_10005DC40, &qword_10005DC48, (void (*)(void))sub_10001331C);
}

uint64_t sub_1000132A0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000044D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001331C()
{
  unint64_t result = qword_10005DC50;
  if (!qword_10005DC50)
  {
    sub_1000044D8(&qword_10005DC58);
    sub_100013398();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC50);
  }
  return result;
}

unint64_t sub_100013398()
{
  unint64_t result = qword_10005DC60;
  if (!qword_10005DC60)
  {
    sub_1000044D8(&qword_10005DC68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC60);
  }
  return result;
}

uint64_t EnvironmentValues._expandSheet.getter()
{
  sub_10000A080();
  sub_1000495D8();
  return v1;
}

uint64_t EnvironmentValues._expandSheet.setter()
{
  return sub_1000495E8();
}

void (*EnvironmentValues._expandSheet.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_10000A080();
  sub_1000495D8();
  *(_OWORD *)uint64_t v3 = *((_OWORD *)v3 + 1);
  return sub_1000134F4;
}

void sub_1000134F4(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  v2[2] = v4;
  v2[3] = v3;
  if (a2)
  {
    swift_retain();
    sub_1000495E8();
    swift_release();
  }
  else
  {
    sub_1000495E8();
  }

  free(v2);
}

ValueMetadata *type metadata accessor for ExpandSheetAction()
{
  return &type metadata for ExpandSheetAction;
}

ValueMetadata *type metadata accessor for ExpandSheetActionKey()
{
  return &type metadata for ExpandSheetActionKey;
}

double sub_1000135A8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100013DC4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10005D4F0, &qword_10005D4F8).n128_u64[0];
  return result;
}

uint64_t sub_100013604@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
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
    sub_10004A088();
    uint64_t v31 = (void *)sub_1000498A8();
    sub_1000491A8();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_100049428();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_100012B84(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

__n128 sub_1000137F8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004A088();
    uint64_t v23 = (void *)sub_1000498A8();
    sub_1000491A8();
  }
  sub_100049428();
  uint64_t v24 = sub_100049018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  long long v25 = (_OWORD *)(a9 + *(int *)(sub_100004334(&qword_10005DDC0) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *long long v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_1000139E0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004A088();
    uint64_t v23 = (void *)sub_1000498A8();
    sub_1000491A8();
  }
  sub_100049428();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  a9[4] = v13[4];
  *(_OWORD *)((char *)a9 + 73) = *(_OWORD *)((char *)v13 + 73);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[10] = v31;
  a9[11] = v32;
  a9[12] = v33;
  a9[6] = v27;
  a9[7] = v28;
  a9[8] = v29;
  a9[9] = v30;

  return sub_100015664((uint64_t)v13);
}

uint64_t sub_100013BA8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004A088();
    uint64_t v23 = (void *)sub_1000498A8();
    sub_1000491A8();
  }
  sub_100049428();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  long long v25 = v13[5];
  a9[4] = v13[4];
  a9[5] = v25;
  long long v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  a9[10] = v32;
  a9[11] = v33;
  a9[12] = v34;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  a9[9] = v31;

  return sub_1000155D8((uint64_t)v13);
}

double sub_100013D68@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100013DC4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10005DDD8, (uint64_t *)&unk_10005DDE0).n128_u64[0];
  return result;
}

__n128 sub_100013DC4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
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
    sub_10004A088();
    long long v28 = (void *)sub_1000498A8();
    sub_1000491A8();

    uint64_t v19 = a17;
  }
  sub_100049428();
  sub_100005488(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(sub_100004334(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  _OWORD *v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

double sub_100013F94@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100013DC4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10005DDC8, &qword_10005DDD0).n128_u64[0];
  return result;
}

__n128 sub_100013FF0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_10004A088();
    uint64_t v23 = (void *)sub_1000498A8();
    sub_1000491A8();
  }
  sub_100049428();
  uint64_t v24 = sub_100004334(&qword_10005DD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  long long v25 = (_OWORD *)(a9 + *(int *)(sub_100004334(&qword_10005DD80) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *long long v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

id sub_1000141DC()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController();
  id result = objc_msgSendSuper2(&v9, "viewWillLayoutSubviews");
  if (*(void *)&v0[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize
                    + 8])
  {
    swift_retain();
    swift_retain();
    id result = [v0 view];
    if (result)
    {
      uint64_t v2 = result;
      objc_msgSend(result, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
      double v4 = v3;
      double v6 = v5;

      sub_100004334(&qword_10005DD30);
      sub_100049CE8();
      if (v4 != v7 || v6 != v8) {
        sub_100049CF8();
      }
      swift_release();
      return (id)swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

id sub_100014358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v11 = &v7[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
  *(_OWORD *)char v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  if (a1)
  {
    v12.super.Class isa = sub_100049F58().super.isa;
    swift_bridgeObjectRelease();
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    v12.super.Class isa = 0;
    if (a3)
    {
LABEL_3:
      NSString v13 = sub_100049E78();
      swift_bridgeObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      NSString v14 = 0;
      if (a7) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  NSString v13 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  NSString v14 = sub_100049E78();
  swift_bridgeObjectRelease();
  if (a7)
  {
LABEL_5:
    NSString v15 = sub_100049E78();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_9:
  NSString v15 = 0;
LABEL_10:
  v18.receiver = v7;
  v18.super_class = (Class)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController();
  id v16 = objc_msgSendSuper2(&v18, "initWithDomains:explanationText:learnMoreText:continueButtonTitle:", v12.super.isa, v13, v14, v15);

  if (v16) {
  return v16;
  }
}

id sub_100014580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v11 = &v7[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
  *(_OWORD *)char v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  if (a3)
  {
    NSString v12 = sub_100049E78();
    swift_bridgeObjectRelease();
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    NSString v13 = 0;
    if (a7) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  NSString v12 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  NSString v13 = sub_100049E78();
  swift_bridgeObjectRelease();
  if (a7)
  {
LABEL_4:
    NSString v14 = sub_100049E78();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  NSString v14 = 0;
LABEL_8:
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController();
  id v15 = objc_msgSendSuper2(&v17, "initWithSupportedDomains:explanationText:learnMoreText:continueButtonTitle:", a1, v12, v13, v14);

  if (v15) {
  return v15;
  }
}

id sub_100014758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSString v13 = &v8[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
  *(_OWORD *)NSString v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  if (a4)
  {
    NSString v14 = sub_100049E78();
    swift_bridgeObjectRelease();
    if (a6) {
      goto LABEL_3;
    }
LABEL_6:
    NSString v15 = 0;
    if (a8) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  NSString v14 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  NSString v15 = sub_100049E78();
  swift_bridgeObjectRelease();
  if (a8)
  {
LABEL_4:
    NSString v16 = sub_100049E78();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  NSString v16 = 0;
LABEL_8:
  v19.receiver = v8;
  v19.super_class = (Class)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController();
  id v17 = objc_msgSendSuper2(&v19, "initWithStyle:supportedDomains:explanationText:learnMoreText:continueButtonTitle:", a1, a2, v14, v15, v16);

  if (v17) {
  return v17;
  }
}

id sub_100014A74()
{
  return sub_100014BB8(type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController);
}

uint64_t type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController()
{
  return self;
}

id sub_100014BA0()
{
  return sub_100014BB8(type metadata accessor for SearchUIFirstUseView.Coordinator);
}

id sub_100014BB8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SearchUIFirstUseView.Coordinator()
{
  return self;
}

uint64_t sub_100014C28(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100014C38(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for FirstUseExperienceView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for FirstUseExperienceView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SearchUIFirstUseView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FirstUseExperienceView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for FirstUseExperienceView()
{
  return &type metadata for FirstUseExperienceView;
}

uint64_t sub_100014DFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014E18(uint64_t a1)
{
  return sub_100015990(*(double *)(v1 + 16), *(double *)(v1 + 24), a1, *(void *)v1, *(void *)(v1 + 8));
}

void sub_100014E24()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  sub_100004334(&qword_10005DDA0);
  sub_100049898();
  long long v3 = &v5[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction];
  uint64_t v4 = *(void *)&v5[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction];
  *(void *)long long v3 = v2;
  *((void *)v3 + 1) = v1;
  swift_retain();
  sub_10000A374(v4);
}

uint64_t sub_100014EB0@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  double v5 = (char *)[objc_allocWithZone((Class)type metadata accessor for SearchUIFirstUseView.Coordinator()) init];
  double v6 = &v5[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction];
  uint64_t v7 = *(void *)&v5[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction];
  *(void *)double v6 = v4;
  *((void *)v6 + 1) = v3;
  swift_retain();
  uint64_t result = sub_10000A374(v7);
  *a1 = v5;
  return result;
}

uint64_t sub_100014F28()
{
  return sub_100049838();
}

uint64_t sub_100014F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001593C();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100014FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001593C();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001502C()
{
}

__n128 sub_100015054@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  long long v20 = *(_OWORD *)(a1 + 3);
  unint64_t v21 = a1[5];
  long long v22 = *(_OWORD *)(a1 + 3);
  v23.n128_u64[0] = a1[5];
  sub_100004334((uint64_t *)&unk_10005DD60);
  sub_100049CB8();
  long long v4 = v31;
  __n128 v5 = v32;
  uint64_t v19 = *a1;
  unint64_t v6 = (_OWORD *)swift_allocObject();
  long long v7 = *((_OWORD *)a1 + 1);
  v6[1] = *(_OWORD *)a1;
  v6[2] = v7;
  v6[3] = *((_OWORD *)a1 + 2);
  long long v31 = v20;
  v32.n128_u64[0] = v21;
  sub_100015580((uint64_t)&v19);
  swift_retain();
  sub_1000155AC((uint64_t)&v20);
  sub_100049C98();
  long long v31 = v20;
  v32.n128_u64[0] = v21;
  sub_100049C98();
  sub_100049DD8();
  sub_100049308();
  long long v22 = v4;
  __n128 v23 = v5;
  uint64_t v24 = sub_100015578;
  long long v25 = v6;
  uint64_t v26 = v14;
  char v27 = v15;
  uint64_t v28 = v16;
  char v29 = v17;
  long long v30 = v18;
  sub_100049DD8();
  sub_100013BA8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v31, 0.0, 1, 0.0, 1);
  swift_release();
  swift_release();
  swift_release();
  long long v8 = v42;
  *(_OWORD *)(a2 + 160) = v41;
  *(_OWORD *)(a2 + 176) = v8;
  *(_OWORD *)(a2 + 192) = v43;
  long long v9 = v38;
  *(_OWORD *)(a2 + 96) = v37;
  *(_OWORD *)(a2 + 112) = v9;
  long long v10 = v40;
  *(_OWORD *)(a2 + 128) = v39;
  *(_OWORD *)(a2 + 144) = v10;
  long long v11 = v34;
  *(_OWORD *)(a2 + 32) = v33;
  *(_OWORD *)(a2 + 48) = v11;
  long long v12 = v36;
  *(_OWORD *)(a2 + 64) = v35;
  *(_OWORD *)(a2 + 80) = v12;
  __n128 result = v32;
  *(_OWORD *)a2 = v31;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100015280()
{
  NSString v0 = sub_100049E78();
  sub_100046D94();
  sub_100015624();
  Class isa = sub_100049E28().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

  sub_100004334(&qword_10005DD70);
  return sub_100049CF8();
}

uint64_t sub_100015368()
{
  return sub_1000492E8();
}

double sub_100015428@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_100015054((uint64_t *)*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_100015430()
{
  return sub_100015460(&qword_10005DD48, &qword_10005DD50, (void (*)(void))sub_1000154DC);
}

uint64_t sub_100015460(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000044D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000154DC()
{
  unint64_t result = qword_10005DD58;
  if (!qword_10005DD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD58);
  }
  return result;
}

uint64_t sub_100015530()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100015578()
{
  return sub_100015280();
}

uint64_t sub_100015580(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000155AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000155D8(uint64_t a1)
{
  return a1;
}

unint64_t sub_100015624()
{
  unint64_t result = qword_10005D8B8;
  if (!qword_10005D8B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005D8B8);
  }
  return result;
}

uint64_t sub_100015664(uint64_t a1)
{
  return a1;
}

uint64_t _s20TranslationUIService20SearchUIFirstUseViewVwxx_0()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SearchUIFirstUseView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SearchUIFirstUseView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SearchUIFirstUseView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  long long v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_release();
  return a1;
}

uint64_t _s20TranslationUIService20SearchUIFirstUseViewVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100015870(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SearchUIFirstUseView()
{
  return &type metadata for SearchUIFirstUseView;
}

unint64_t sub_1000158D0()
{
  unint64_t result = qword_10005DD88;
  if (!qword_10005DD88)
  {
    sub_1000044D8(&qword_10005DD90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD88);
  }
  return result;
}

void *sub_100015930()
{
  return &protocol witness table for Never;
}

unint64_t sub_10001593C()
{
  unint64_t result = qword_10005DD98;
  if (!qword_10005DD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD98);
  }
  return result;
}

uint64_t sub_100015990(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100049EF8();
  uint64_t v9 = v8;
  long long v10 = self;
  long long v11 = (objc_class *)[v10 mainBundle];
  v37._countAndFlagsBits = 0xD000000000000016;
  v31._countAndFlagsBits = 0xE000000000000000;
  v37._object = (void *)0x8000000100054B40;
  v40.value._countAndFlagsBits = 0;
  v40.value._object = 0;
  v12.super.Class isa = v11;
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  sub_100048D08(v37, v40, v12, v43, v31);

  sub_100004334(&qword_10005DDA8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10004B740;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_100015D40();
  *(void *)(v13 + 32) = v7;
  *(void *)(v13 + 40) = v9;
  sub_100049EB8();
  swift_bridgeObjectRelease();
  sub_100004334(&qword_10005DDB8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004B740;
  *(void *)(v14 + 32) = sub_100049EA8();
  *(void *)(v14 + 40) = v15;
  uint64_t v16 = (objc_class *)[v10 mainBundle];
  v32._countAndFlagsBits = 0xE000000000000000;
  v38._countAndFlagsBits = 0x5F59434156495250;
  v38._object = (void *)0xEE004E4F54545542;
  v41.value._countAndFlagsBits = 0;
  v41.value._object = 0;
  v17.super.Class isa = v16;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_100048D08(v38, v41, v17, v44, v32);

  long long v18 = (objc_class *)[v10 mainBundle];
  v33._countAndFlagsBits = 0xE000000000000000;
  v39._object = (void *)0x8000000100054B60;
  v39._countAndFlagsBits = 0xD000000000000012;
  v42.value._countAndFlagsBits = 0;
  v42.value._object = 0;
  v19.super.Class isa = v18;
  v45._countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  sub_100048D08(v39, v42, v19, v45, v33);

  id v20 = objc_allocWithZone((Class)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController());
  Class isa = sub_100049F58().super.isa;
  swift_bridgeObjectRelease();
  NSString v22 = sub_100049E78();
  swift_bridgeObjectRelease();
  NSString v23 = sub_100049E78();
  swift_bridgeObjectRelease();
  NSString v24 = sub_100049E78();
  swift_bridgeObjectRelease();
  id v25 = [v20 initWithDomains:isa explanationText:v22 learnMoreText:v23 continueButtonTitle:v24];

  if (v25)
  {
    uint64_t v26 = (char *)v25;
    sub_100004334(&qword_10005DDA0);
    sub_100049898();
    [v26 setDelegate:v36];

    char v27 = &v26[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
    uint64_t v28 = *(void *)&v26[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
    uint64_t v29 = *(void *)&v26[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize
                        + 8];
    *(void *)char v27 = a4;
    *((void *)v27 + 1) = a5;
    *((double *)v27 + 2) = a1;
    *((double *)v27 + 3) = a2;
    swift_retain();
    swift_retain();
    sub_100014C38(v28, v29);

    return (uint64_t)v26;
  }
  else
  {
    uint64_t result = sub_10004A298();
    __break(1u);
  }
  return result;
}

unint64_t sub_100015D40()
{
  unint64_t result = qword_10005DDB0;
  if (!qword_10005DDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DDB0);
  }
  return result;
}

uint64_t *sub_100015D98(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100048E48();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100004334(&qword_10005D818);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    uint64_t v13 = (uint64_t *)((char *)a1 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    long long v18 = (uint64_t *)((char *)a1 + v16);
    NSBundle v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *long long v18 = *v19;
    v18[1] = v20;
    unint64_t v21 = (char *)a1 + v17;
    NSString v22 = (char *)a2 + v17;
    *unint64_t v21 = *v22;
    *((void *)v21 + 1) = *((void *)v22 + 1);
    uint64_t v23 = a3[9];
    NSString v24 = (char *)a1 + v23;
    id v25 = (char *)a2 + v23;
    uint64_t v26 = *(uint64_t *)((char *)a2 + v23 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (v26)
    {
      *(void *)NSString v24 = *(void *)v25;
      *((void *)v24 + 1) = v26;
      v24[16] = v25[16];
      swift_retain();
      swift_retain();
    }
    else
    {
      *(_OWORD *)NSString v24 = *(_OWORD *)v25;
      v24[16] = v25[16];
    }
    uint64_t v27 = a3[10];
    uint64_t v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    uint64_t v30 = *(void *)v29;
    uint64_t v31 = *((void *)v29 + 1);
    char v32 = v29[16];
    sub_100015FD8();
    *(void *)uint64_t v28 = v30;
    *((void *)v28 + 1) = v31;
    v28[16] = v32;
  }
  return a1;
}

uint64_t sub_100015FD8()
{
  return swift_retain();
}

uint64_t sub_100015FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100048E48();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(a1 + *(int *)(a2 + 36) + 8))
  {
    swift_release();
    swift_release();
  }

  return sub_100016108();
}

uint64_t sub_100016108()
{
  return swift_release();
}

char *sub_100016114(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100004334(&qword_10005D818);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = v13;
  a1[v10] = a2[v10];
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  uint64_t v18 = *((void *)v17 + 1);
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = v18;
  NSBundle v19 = &a1[v15];
  uint64_t v20 = &a2[v15];
  *NSBundle v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  uint64_t v21 = a3[9];
  NSString v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = *(void *)&a2[v21 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v24)
  {
    *(void *)NSString v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    v22[16] = v23[16];
    swift_retain();
    swift_retain();
  }
  else
  {
    *(_OWORD *)NSString v22 = *(_OWORD *)v23;
    v22[16] = v23[16];
  }
  uint64_t v25 = a3[10];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v28 = *(void *)v27;
  uint64_t v29 = *((void *)v27 + 1);
  char v30 = v27[16];
  sub_100015FD8();
  *(void *)uint64_t v26 = v28;
  *((void *)v26 + 1) = v29;
  v26[16] = v30;
  return a1;
}

char *sub_100016304(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_100004334(&qword_10005D818);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[6]] = a2[a3[6]];
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  NSBundle v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *NSBundle v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_release();
  uint64_t v21 = a3[9];
  uint64_t v22 = (uint64_t)&a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = *(void *)&a1[v21 + 8];
  uint64_t v25 = *(void *)&a2[v21 + 8];
  if (v24)
  {
    if (v25)
    {
      *(void *)uint64_t v22 = *(void *)v23;
      swift_retain();
      swift_release();
      *(void *)(v22 + 8) = *((void *)v23 + 1);
      swift_retain();
      swift_release();
      *(unsigned char *)(v22 + 16) = v23[16];
    }
    else
    {
      sub_1000054EC(v22, &qword_10005DD70);
      char v26 = v23[16];
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      *(unsigned char *)(v22 + 16) = v26;
    }
  }
  else if (v25)
  {
    *(void *)uint64_t v22 = *(void *)v23;
    *(void *)(v22 + 8) = *((void *)v23 + 1);
    *(unsigned char *)(v22 + 16) = v23[16];
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v27 = *(_OWORD *)v23;
    *(unsigned char *)(v22 + 16) = v23[16];
    *(_OWORD *)uint64_t v22 = v27;
  }
  uint64_t v28 = a3[10];
  uint64_t v29 = &a1[v28];
  char v30 = &a2[v28];
  uint64_t v31 = *(void *)v30;
  uint64_t v32 = *((void *)v30 + 1);
  char v33 = v30[16];
  sub_100015FD8();
  *(void *)uint64_t v29 = v31;
  *((void *)v29 + 1) = v32;
  v29[16] = v33;
  sub_100016108();
  return a1;
}

char *sub_100016604(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100004334(&qword_10005D818);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  a1[v9] = a2[v9];
  uint64_t v10 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  uint64_t v11 = a3[9];
  uint64_t v12 = a3[10];
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  uint64_t v15 = &a1[v12];
  uint64_t v16 = &a2[v12];
  v15[16] = v16[16];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  return a1;
}

char *sub_10001677C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_100004334(&qword_10005D818);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v18 = &a1[v17];
  NSBundle v19 = &a2[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  *uint64_t v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_release();
  uint64_t v25 = a3[9];
  uint64_t v26 = (uint64_t)&a1[v25];
  long long v27 = &a2[v25];
  if (!*(void *)&a1[v25 + 8])
  {
LABEL_11:
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    goto LABEL_12;
  }
  if (!*((void *)v27 + 1))
  {
    sub_1000054EC(v26, &qword_10005DD70);
    goto LABEL_11;
  }
  *(void *)uint64_t v26 = *(void *)v27;
  swift_release();
  *(void *)(v26 + 8) = *((void *)v27 + 1);
  swift_release();
LABEL_12:
  *(unsigned char *)(v26 + 16) = v27[16];
  uint64_t v28 = a3[10];
  uint64_t v29 = &a1[v28];
  char v30 = &a2[v28];
  char v31 = v30[16];
  *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
  v29[16] = v31;
  sub_100016108();
  return a1;
}

uint64_t sub_1000169E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000169FC);
}

uint64_t sub_1000169FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004334(&qword_10005D818);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100016AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016AD8);
}

uint64_t sub_100016AD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004334(&qword_10005D818);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for LanguageText()
{
  uint64_t result = qword_10005DE48;
  if (!qword_10005DE48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100016BE8()
{
  sub_100016CA8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100016CA8()
{
  if (!qword_10005DE58)
  {
    sub_100048E48();
    unint64_t v0 = sub_10004A198();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005DE58);
    }
  }
}

uint64_t sub_100016D00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v184 = a1;
  uint64_t v179 = a2;
  uint64_t v185 = type metadata accessor for LanguageText();
  uint64_t v168 = *(void *)(v185 - 8);
  uint64_t v2 = __chkstk_darwin(v185);
  uint64_t v170 = (uint64_t)&v140 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = v3;
  __chkstk_darwin(v2);
  uint64_t v147 = (uint64_t)&v140 - v4;
  uint64_t v177 = sub_100004334(&qword_10005DEA8);
  __chkstk_darwin(v177);
  uint64_t v182 = (uint64_t)&v140 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_100004334(&qword_10005DEB0);
  uint64_t v6 = __chkstk_darwin(v178);
  v149 = (char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v140 - v8;
  uint64_t v167 = sub_100048F08();
  uint64_t v165 = *(void *)(v167 - 8);
  __chkstk_darwin(v167);
  v164 = (char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = sub_100004334(&qword_10005DEB8);
  uint64_t v11 = __chkstk_darwin(v175);
  v163 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v166 = (uint64_t)&v140 - v13;
  uint64_t v161 = sub_100048C78();
  uint64_t v160 = *(void *)(v161 - 8);
  __chkstk_darwin(v161);
  v159 = (char *)&v140 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004334(&qword_10005DEC0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  v176 = (char *)&v140 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v174 = (char *)&v140 - v18;
  uint64_t v153 = sub_100004334(&qword_10005DEC8);
  uint64_t v19 = __chkstk_darwin(v153);
  v145 = (char *)&v140 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v146 = (uint64_t)&v140 - v21;
  uint64_t v151 = sub_100004334(&qword_10005DED0);
  __chkstk_darwin(v151);
  uint64_t v152 = (uint64_t)&v140 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_1000493F8();
  uint64_t v155 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  v154 = (char *)&v140 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_100004334(&qword_10005DED8);
  uint64_t v157 = *(void *)(v172 - 8);
  uint64_t v24 = __chkstk_darwin(v172);
  v148 = (char *)&v140 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v143 = (char *)&v140 - v27;
  __chkstk_darwin(v26);
  v144 = (char *)&v140 - v28;
  uint64_t v29 = sub_100004334(&qword_10005D818);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  v171 = (char *)&v140 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  v162 = (char *)&v140 - v33;
  __chkstk_darwin(v32);
  long long v35 = (char *)&v140 - v34;
  uint64_t v183 = sub_100048E48();
  uint64_t v36 = *(void *)(v183 - 8);
  uint64_t v37 = __chkstk_darwin(v183);
  Swift::String v39 = (char *)&v140 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  Swift::String_optional v41 = (char *)&v140 - v40;
  uint64_t v42 = sub_100004334(&qword_10005DEE0);
  uint64_t v180 = *(void *)(v42 - 8);
  uint64_t v181 = v42;
  __chkstk_darwin(v42);
  v150 = (char *)&v140 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100049038();
  uint64_t v45 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  long long v47 = (char *)&v140 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100004334(&qword_10005DEE8);
  uint64_t v49 = __chkstk_darwin(v48 - 8);
  v173 = (char *)&v140 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v49);
  long long v52 = (char *)&v140 - v51;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v47, enum case for TranslateFeatures.refreshedSystemTranslation(_:), v44);
  char v53 = sub_100049028();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v44);
  uint64_t v158 = v36;
  if (v53)
  {
    uint64_t v54 = 1;
    uint64_t v55 = v182;
    uint64_t v56 = v183;
  }
  else
  {
    v141 = v9;
    v142 = v52;
    sub_100005488(v184, (uint64_t)v35, &qword_10005D818);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v35, 1, v183) == 1)
    {
      sub_1000054EC((uint64_t)v35, &qword_10005D818);
      sub_100049668();
      uint64_t v57 = sub_100049A68();
      uint64_t v59 = v58;
      char v61 = v60 & 1;
      sub_1000499B8();
      sub_100049978();
      sub_1000499A8();
      swift_release();
      uint64_t v62 = (void *)sub_100049A58();
      uint64_t v64 = v63;
      char v66 = v65;
      uint64_t v68 = v67;
      swift_release();
      sub_10000AAD0(v57, v59, v61);
      swift_bridgeObjectRelease();
      v188 = v62;
      v189 = v64;
      char v190 = v66 & 1;
      uint64_t v191 = v68;
      uint64_t v69 = v154;
      sub_1000493E8();
      uint64_t v70 = v143;
      sub_100049BC8();
      (*(void (**)(char *, uint64_t))(v155 + 8))(v69, v156);
      sub_10000AAD0((uint64_t)v188, (uint64_t)v189, v190);
      swift_bridgeObjectRelease();
      uint64_t v71 = v157;
      uint64_t v72 = v144;
      uint64_t v73 = v172;
      (*(void (**)(char *, char *, uint64_t))(v157 + 32))(v144, v70, v172);
      (*(void (**)(uint64_t, char *, uint64_t))(v71 + 16))(v152, v72, v73);
      swift_storeEnumTagMultiPayload();
      sub_100018348();
      v188 = &type metadata for Text;
      v189 = &protocol witness table for Text;
      swift_getOpaqueTypeConformance2();
      uint64_t v74 = v150;
      sub_1000496E8();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
      uint64_t v56 = v183;
    }
    else
    {
      uint64_t v75 = v183;
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v41, v35, v183);
      sub_100048E38();
      uint64_t v76 = sub_100048DD8();
      uint64_t v78 = v77;
      uint64_t v79 = *(char **)(v36 + 8);
      v143 = (char *)(v36 + 8);
      v144 = v79;
      ((void (*)(char *, uint64_t))v79)(v39, v75);
      if (v78) {
        uint64_t v80 = (void *)v76;
      }
      else {
        uint64_t v80 = 0;
      }
      uint64_t v81 = (void *)0xE000000000000000;
      if (v78) {
        uint64_t v81 = v78;
      }
      v188 = v80;
      v189 = v81;
      sub_100012C1C();
      uint64_t v82 = sub_100049A78();
      uint64_t v84 = v83;
      char v86 = v85 & 1;
      sub_1000499B8();
      sub_100049978();
      sub_1000499A8();
      swift_release();
      uint64_t v87 = (void *)sub_100049A58();
      uint64_t v89 = v88;
      char v91 = v90;
      uint64_t v93 = v92;
      swift_release();
      char v94 = v91 & 1;
      sub_10000AAD0(v82, v84, v86);
      swift_bridgeObjectRelease();
      v188 = v87;
      v189 = v89;
      char v190 = v91 & 1;
      uint64_t v191 = v93;
      uint64_t v95 = *(void *)(v184 + *(int *)(v185 + 28) + 8);
      uint64_t v186 = *(void *)(v184 + *(int *)(v185 + 28));
      uint64_t v187 = v95;
      swift_bridgeObjectRetain();
      v192._countAndFlagsBits = 0x6C6562616C5FLL;
      v192._object = (void *)0xE600000000000000;
      sub_100049F18(v192);
      uint64_t v96 = (uint64_t)v145;
      sub_100049B78();
      swift_bridgeObjectRelease();
      sub_10000AAD0((uint64_t)v87, (uint64_t)v89, v94);
      swift_bridgeObjectRelease();
      uint64_t v97 = v146;
      sub_100005424(v96, v146, &qword_10005DEC8);
      sub_100005488(v97, v152, &qword_10005DEC8);
      swift_storeEnumTagMultiPayload();
      sub_100018348();
      v188 = &type metadata for Text;
      v189 = &protocol witness table for Text;
      swift_getOpaqueTypeConformance2();
      uint64_t v74 = v150;
      sub_1000496E8();
      sub_1000054EC(v97, &qword_10005DEC8);
      uint64_t v56 = v183;
      ((void (*)(char *, uint64_t))v144)(v41, v183);
    }
    uint64_t v98 = (uint64_t)v74;
    long long v52 = v142;
    sub_100005424(v98, (uint64_t)v142, &qword_10005DEE0);
    uint64_t v54 = 0;
    uint64_t v55 = v182;
    uint64_t v9 = v141;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v180 + 56))(v52, v54, 1, v181);
  uint64_t v100 = v184;
  Swift::String v99 = (int *)v185;
  uint64_t v101 = v184 + *(int *)(v185 + 20);
  v102 = *(void **)(v101 + 8);
  if (v102)
  {
    v188 = *(void **)v101;
    v189 = v102;
    swift_bridgeObjectRetain();
    v103 = v159;
    sub_100048C68();
    sub_100012C1C();
    uint64_t v104 = sub_10004A1C8();
    uint64_t v180 = v105;
    uint64_t v181 = v104;
    (*(void (**)(char *, uint64_t))(v160 + 8))(v103, v161);
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v100 + v99[6]))
    {
      uint64_t v106 = v56;
      uint64_t v107 = *(void *)(v100 + v99[9] + 8);
      uint64_t v108 = v147;
      sub_1000185F4(v100, v147);
      uint64_t v109 = (uint64_t)v171;
      if (v107)
      {
        swift_retain();
        swift_retain();
      }
      else
      {
        uint64_t v122 = v108 + v99[8];
        char v123 = *(unsigned char *)v122;
        uint64_t v124 = *(void *)(v122 + 8);
        LOBYTE(v186) = v123;
        uint64_t v187 = v124;
        sub_100004334(&qword_10005DB30);
        sub_100049CB8();
      }
      sub_1000188AC(v108);
      uint64_t v56 = v106;
    }
    else
    {
      LOBYTE(v186) = 1;
      sub_100049D28();
      uint64_t v109 = (uint64_t)v171;
    }
    sub_100005488(v100, v109, &qword_10005D818);
    uint64_t v125 = v158;
    int v126 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v158 + 48))(v109, 1, v56);
    v127 = v162;
    v128 = v52;
    if (v126 == 1)
    {
      sub_100048E38();
      sub_1000054EC(v109, &qword_10005D818);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v125 + 32))(v162, v109, v56);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56))(v127, 0, 1, v56);
    uint64_t v129 = v170;
    sub_1000185F4(v100, v170);
    unint64_t v130 = (*(unsigned __int8 *)(v168 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v168 + 80);
    uint64_t v131 = swift_allocObject();
    sub_1000187E8(v129, v131 + v130);
    v132 = v164;
    sub_100048F18();
    sub_1000184D0(&qword_10005DF08, (void (*)(uint64_t))&type metadata accessor for ExpandingText);
    v133 = v163;
    uint64_t v134 = v167;
    sub_100049B78();
    (*(void (**)(char *, uint64_t))(v165 + 8))(v132, v134);
    uint64_t v135 = (uint64_t)v133;
    uint64_t v136 = v166;
    sub_100005424(v135, v166, &qword_10005DEB8);
    sub_100005488(v136, v182, &qword_10005DEB8);
    swift_storeEnumTagMultiPayload();
    sub_1000183F4();
    sub_100018518();
    uint64_t v119 = (uint64_t)v174;
    sub_1000496E8();
    sub_1000054EC(v136, &qword_10005DEB8);
    uint64_t v120 = (uint64_t)v176;
    uint64_t v121 = (uint64_t)v173;
    long long v52 = v128;
  }
  else
  {
    sub_100049668();
    v188 = (void *)sub_100049A68();
    v189 = v110;
    char v190 = v111 & 1;
    uint64_t v191 = v112;
    v113 = v154;
    sub_1000493E8();
    v114 = v148;
    sub_100049BC8();
    (*(void (**)(char *, uint64_t))(v155 + 8))(v113, v156);
    sub_10000AAD0((uint64_t)v188, (uint64_t)v189, v190);
    swift_bridgeObjectRelease();
    uint64_t v115 = v100 + v99[7];
    v116 = *(void **)(v115 + 8);
    v188 = *(void **)v115;
    v189 = v116;
    swift_bridgeObjectRetain();
    v193._countAndFlagsBits = 0x6F686563616C705FLL;
    v193._object = (void *)0xEC0000007265646CLL;
    sub_100049F18(v193);
    v188 = &type metadata for Text;
    v189 = &protocol witness table for Text;
    swift_getOpaqueTypeConformance2();
    uint64_t v117 = (uint64_t)v149;
    uint64_t v118 = v172;
    sub_100049B78();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v157 + 8))(v114, v118);
    sub_100005424(v117, (uint64_t)v9, &qword_10005DEB0);
    sub_100005488((uint64_t)v9, v55, &qword_10005DEB0);
    swift_storeEnumTagMultiPayload();
    sub_1000183F4();
    sub_100018518();
    uint64_t v119 = (uint64_t)v174;
    sub_1000496E8();
    sub_1000054EC((uint64_t)v9, &qword_10005DEB0);
    uint64_t v120 = (uint64_t)v176;
    uint64_t v121 = (uint64_t)v173;
  }
  uint64_t v137 = v179;
  sub_100005488((uint64_t)v52, v121, &qword_10005DEE8);
  sub_100005488(v119, v120, &qword_10005DEC0);
  sub_100005488(v121, v137, &qword_10005DEE8);
  uint64_t v138 = sub_100004334(&qword_10005DF18);
  sub_100005488(v120, v137 + *(int *)(v138 + 48), &qword_10005DEC0);
  sub_1000054EC(v119, &qword_10005DEC0);
  sub_1000054EC((uint64_t)v52, &qword_10005DEE8);
  sub_1000054EC(v120, &qword_10005DEC0);
  return sub_1000054EC(v121, &qword_10005DEE8);
}

uint64_t sub_1000181A8(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for LanguageText() + 40);
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  char v4 = *(unsigned char *)(v1 + 16);
  sub_100015FD8();
  uint64_t v5 = (void (*)(uint64_t))sub_100041398(v2, v3, v4);
  uint64_t v6 = sub_100016108();
  v5(v6);

  return swift_release();
}

uint64_t sub_100018248@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100004334(&qword_10005DDD8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_1000496D8();
  *((void *)v5 + 1) = 0x4010000000000000;
  v5[16] = 0;
  uint64_t v6 = sub_100004334(&qword_10005DEA0);
  sub_100016D1C(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  uint64_t v7 = sub_100049DB8();
  sub_100013D68(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v7, v8);
  return sub_1000054EC((uint64_t)v5, &qword_10005DDD8);
}

unint64_t sub_100018348()
{
  unint64_t result = qword_10005DEF0;
  if (!qword_10005DEF0)
  {
    sub_1000044D8(&qword_10005DEC8);
    sub_1000184D0(&qword_10005DEF8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DEF0);
  }
  return result;
}

unint64_t sub_1000183F4()
{
  unint64_t result = qword_10005DF00;
  if (!qword_10005DF00)
  {
    sub_1000044D8(&qword_10005DEB8);
    sub_1000184D0(&qword_10005DF08, (void (*)(uint64_t))&type metadata accessor for ExpandingText);
    sub_1000184D0(&qword_10005DEF8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DF00);
  }
  return result;
}

uint64_t sub_1000184D0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100018518()
{
  unint64_t result = qword_10005DF10;
  if (!qword_10005DF10)
  {
    sub_1000044D8(&qword_10005DEB0);
    swift_getOpaqueTypeConformance2();
    sub_1000184D0(&qword_10005DEF8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DF10);
  }
  return result;
}

uint64_t sub_1000185F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LanguageText();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018658()
{
  uint64_t v1 = type metadata accessor for LanguageText();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = sub_100048E48();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + v3 + *(int *)(v1 + 36) + 8))
  {
    swift_release();
    swift_release();
  }
  sub_100016108();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000187E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LanguageText();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001884C()
{
  uint64_t v1 = *(void *)(type metadata accessor for LanguageText() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000181A8(v2);
}

uint64_t sub_1000188AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LanguageText();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001890C()
{
  unint64_t result = qword_10005DF20;
  if (!qword_10005DF20)
  {
    sub_1000044D8((uint64_t *)&unk_10005DDE0);
    sub_100018988();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DF20);
  }
  return result;
}

unint64_t sub_100018988()
{
  unint64_t result = qword_10005DF28;
  if (!qword_10005DF28)
  {
    sub_1000044D8(&qword_10005DDD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DF28);
  }
  return result;
}

uint64_t *sub_1000189E4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *uint64_t v4 = *a2;
    v4[1] = v7;
    v4[2] = a2[2];
    uint64_t v8 = a3[6];
    uint64_t v9 = (uint64_t *)((char *)v4 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v12 = sub_100004334(&qword_10005DBA8);
    uint64_t v13 = *(int *)(v12 + 32);
    uint64_t v14 = (char *)v9 + v13;
    uint64_t v15 = &v10[v13];
    uint64_t v16 = sub_100048E48();
    uint64_t v17 = *(void *)(v16 - 8);
    long long v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    if (v35(v15, 1, v16))
    {
      uint64_t v18 = sub_100004334(&qword_10005D818);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      uint64_t v13 = *(int *)(v12 + 32);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = (uint64_t *)((char *)v4 + v20);
    uint64_t v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = (char *)v21 + v13;
    uint64_t v25 = (char *)v22 + v13;
    swift_retain();
    swift_retain();
    if (v35(v25, 1, v16))
    {
      uint64_t v26 = sub_100004334(&qword_10005D818);
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v24, v25, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v24, 0, 1, v16);
    }
    uint64_t v27 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v28 = (char *)v4 + v27;
    uint64_t v29 = (char *)a2 + v27;
    *uint64_t v28 = *v29;
    *((void *)v28 + 1) = *((void *)v29 + 1);
    uint64_t v30 = a3[10];
    uint64_t v31 = (uint64_t *)((char *)v4 + v30);
    uint64_t v32 = (uint64_t *)((char *)a2 + v30);
    uint64_t v33 = v32[1];
    void *v31 = *v32;
    v31[1] = v33;
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100018CBC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v5 = sub_100004334(&qword_10005DBA8);
  uint64_t v6 = v4 + *(int *)(v5 + 32);
  uint64_t v7 = sub_100048E48();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = a1 + *(int *)(a2 + 28);
  swift_release();
  swift_release();
  uint64_t v11 = v10 + *(int *)(v5 + 32);
  if (!v9(v11, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  }
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *sub_100018E3C(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = a2[2];
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v10 = sub_100004334(&qword_10005DBA8);
  uint64_t v11 = *(int *)(v10 + 32);
  uint64_t v12 = (char *)v7 + v11;
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_100048E48();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = sub_100004334(&qword_10005D818);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    uint64_t v11 = *(int *)(v10 + 32);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (char *)v19 + v11;
  uint64_t v23 = (char *)v20 + v11;
  swift_retain();
  swift_retain();
  if (v16(v23, 1, v14))
  {
    uint64_t v24 = sub_100004334(&qword_10005D818);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v22, v23, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v22, 0, 1, v14);
  }
  uint64_t v25 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  char *v26 = *v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  uint64_t v28 = a3[10];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (void *)((char *)a2 + v28);
  uint64_t v31 = v30[1];
  void *v29 = *v30;
  v29[1] = v31;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1000190C8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  swift_retain();
  swift_release();
  uint64_t v9 = sub_100004334(&qword_10005DBA8);
  uint64_t v10 = *(int *)(v9 + 32);
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_100048E48();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    uint64_t v18 = sub_100004334(&qword_10005D818);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v19 = v34[7];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  swift_retain();
  swift_release();
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  uint64_t v22 = *(int *)(v9 + 32);
  uint64_t v23 = &v20[v22];
  uint64_t v24 = &v21[v22];
  LODWORD(v20) = v15(&v20[v22], 1, v13);
  int v25 = v15(v24, 1, v13);
  if (!v20)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v23, v24, v13);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v23, v13);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    uint64_t v26 = sub_100004334(&qword_10005D818);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v23, v24, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v23, 0, 1, v13);
LABEL_13:
  *(void *)((char *)a1 + v34[8]) = *(void *)((char *)a2 + v34[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = v34[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  *uint64_t v28 = *v29;
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_retain();
  swift_release();
  uint64_t v30 = v34[10];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  void *v31 = *v32;
  v31[1] = v32[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10001948C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = a2 + v6;
  uint64_t v9 = *(void *)(a2 + v6 + 8);
  *uint64_t v7 = *(void *)(a2 + v6);
  v7[1] = v9;
  uint64_t v10 = sub_100004334(&qword_10005DBA8);
  uint64_t v11 = *(int *)(v10 + 32);
  uint64_t v12 = (char *)v7 + v11;
  uint64_t v13 = (const void *)(v8 + v11);
  uint64_t v14 = sub_100048E48();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  if (v26(v13, 1, v14))
  {
    uint64_t v16 = sub_100004334(&qword_10005D818);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    uint64_t v11 = *(int *)(v10 + 32);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = (char *)v18 + v11;
  uint64_t v22 = (char *)v19 + v11;
  if (v26((char *)v19 + v11, 1, v14))
  {
    uint64_t v23 = sub_100004334(&qword_10005D818);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v22, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
  }
  uint64_t v24 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v24) = *(_OWORD *)(a2 + v24);
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  return a1;
}

void *sub_1000196C4(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v37 = a3;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_release();
  uint64_t v10 = sub_100004334(&qword_10005DBA8);
  uint64_t v11 = *(int *)(v10 + 32);
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  uint64_t v14 = sub_100048E48();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = sub_100004334(&qword_10005D818);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v12, v13, v14);
LABEL_7:
  uint64_t v20 = v37[7];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  swift_release();
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  uint64_t v23 = *(int *)(v10 + 32);
  uint64_t v24 = &v21[v23];
  int v25 = &v22[v23];
  LODWORD(v22) = v16(v24, 1, v14);
  int v26 = v16(v25, 1, v14);
  if (!v22)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v24, v25, v14);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v24, v14);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    uint64_t v27 = sub_100004334(&qword_10005D818);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v24, v25, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v24, 0, 1, v14);
LABEL_13:
  *(void *)((char *)a1 + v37[8]) = *(void *)((char *)a2 + v37[8]);
  swift_bridgeObjectRelease();
  uint64_t v28 = v37[9];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  char *v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_release();
  uint64_t v31 = v37[10];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_release();
  return a1;
}

uint64_t sub_100019A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019A40);
}

uint64_t sub_100019A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100004334(&qword_10005DBA8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100019AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019B08);
}

uint64_t sub_100019B08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100004334(&qword_10005DBA8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LIDResolutionView()
{
  uint64_t result = qword_10005DF88;
  if (!qword_10005DF88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100019C00()
{
  sub_100019CB4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100019CB4()
{
  if (!qword_10005DF98)
  {
    sub_1000044D8(&qword_10005D818);
    unint64_t v0 = sub_100049D38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005DF98);
    }
  }
}

uint64_t sub_100019D10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100019D2C()
{
  uint64_t v1 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100048E48();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - v9;
  if (!*(void *)(v0 + 8))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  sub_100048DA8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_16:
    sub_1000054EC((uint64_t)v3, &qword_10005D818);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
  if (sub_100048DB8() == 6581877 && v11 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v13 = sub_10004A308();
  swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_18:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    return 0;
  }
  if (sub_100048DB8() == 0x4B485F687ALL && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  char v16 = sub_10004A308();
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_22:
    sub_100049668();
    uint64_t v28 = sub_100049A68();
    uint64_t v35 = v29;
    uint64_t v36 = v30;
    char v32 = v31 & 1;
    sub_100049938();
    sub_100049948();
    swift_release();
    uint64_t v26 = sub_100049A58();
    swift_release();
    sub_10000AAD0(v28, v35, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    return v26;
  }
  sub_100048E38();
  uint64_t v17 = sub_100048DD8();
  uint64_t v19 = v18;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v8, v4);
  if (v19)
  {
    uint64_t v37 = v17;
    uint64_t v38 = v19;
    sub_100012C1C();
    uint64_t v21 = sub_100049A78();
    uint64_t v34 = v22;
    uint64_t v35 = v23;
    char v25 = v24 & 1;
    sub_100049938();
    sub_100049948();
    swift_release();
    uint64_t v26 = sub_100049A58();
    uint64_t v36 = v20;
    swift_release();
    sub_10000AAD0(v21, v34, v25);
    swift_bridgeObjectRelease();
    v36(v10, v4);
  }
  else
  {
    v20(v10, v4);
    return 0;
  }
  return v26;
}

uint64_t sub_10001A1E4()
{
  uint64_t v0 = sub_100049658();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100019D2C();
  if (v4)
  {
    uint64_t v5 = v1;
    uint64_t v6 = v2;
    char v7 = v3;
    uint64_t v8 = v4;
    sub_100049648();
    v11._countAndFlagsBits = 0;
    v11._object = (void *)0xE000000000000000;
    sub_100049638(v11);
    sub_100049628();
    v12._countAndFlagsBits = 95;
    v12._object = (void *)0xE100000000000000;
    sub_100049638(v12);
    sub_100049628();
    v13._countAndFlagsBits = 0x5055535F544F4E5FLL;
    v13._object = (void *)0xEE00444554524F50;
    sub_100049638(v13);
    sub_100049678();
    uint64_t v9 = sub_100049A68();
    sub_100012BD8(v5, v6, v7, v8);
  }
  else
  {
    sub_100049668();
    return sub_100049A68();
  }
  return v9;
}

uint64_t sub_10001A3BC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v43 = a1;
  uint64_t v3 = type metadata accessor for LIDResolutionView();
  uint64_t v4 = v3 - 8;
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v38 = *(void *)(v39 + 64);
  __chkstk_darwin(v3);
  uint64_t v37 = (uint64_t)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100004334(&qword_10005E0A0);
  uint64_t v6 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004334(&qword_10005E0A8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v41 = v9;
  uint64_t v42 = v10;
  __chkstk_darwin(v9);
  uint64_t v36 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004334(&qword_10005E0B0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  char v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v40 = (char *)v35 - v17;
  uint64_t v45 = v2;
  sub_100004334(&qword_10005E0B8);
  sub_10001CF4C();
  sub_100049D88();
  uint64_t v18 = sub_100005584(&qword_10005E0D8, &qword_10005E0A0);
  unint64_t v19 = sub_10001D01C();
  uint64_t v20 = v44;
  sub_100049AF8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v20);
  uint64_t v21 = v2 + *(int *)(v4 + 44);
  char v22 = *(unsigned char *)v21;
  uint64_t v23 = *(void *)(v21 + 8);
  char v50 = v22;
  uint64_t v51 = v23;
  sub_100004334(&qword_10005DB30);
  sub_100049CB8();
  v35[1] = v48;
  uint64_t v24 = v37;
  sub_10001D070(v2, v37);
  unint64_t v25 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v26 = swift_allocObject();
  sub_10001D0D8(v24, v26 + v25);
  sub_100004334(&qword_10005E0E8);
  uint64_t v46 = v44;
  long long v47 = &type metadata for ActionGroupStyle;
  uint64_t v48 = v18;
  unint64_t v49 = v19;
  swift_getOpaqueTypeConformance2();
  sub_100005584(&qword_10005E0F0, &qword_10005E0E8);
  uint64_t v27 = v41;
  uint64_t v28 = v36;
  sub_100049BA8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v28, v27);
  uint64_t v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v40, v16, v12);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v30(v16, v29, v12);
  char v31 = v43;
  v30(v43, v16, v12);
  char v32 = &v31[*(int *)(sub_100004334(&qword_10005E0F8) + 48)];
  *(void *)char v32 = 0;
  v32[8] = 1;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v13 + 8);
  v33(v29, v12);
  return ((uint64_t (*)(char *, uint64_t))v33)(v16, v12);
}

uint64_t sub_10001A8F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LIDResolutionView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_100004334(&qword_10005E0D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D070(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_10001D0D8((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  sub_100004334(&qword_10005E130);
  sub_100005584(&qword_10005E138, &qword_10005E130);
  sub_100049CD8();
  sub_100005584(&qword_10005E0C8, &qword_10005E0D0);
  sub_100049B78();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001AB4C()
{
  return sub_100049CA8();
}

uint64_t sub_10001ABB8()
{
  return Label.init(title:icon:)(sub_10001AC0C, 0, sub_10001AC8C, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_10001AC0C@<X0>(uint64_t a1@<X8>)
{
  sub_100049668();
  uint64_t result = sub_100049A68();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10001AC8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049C48();
  *a1 = result;
  return result;
}

uint64_t sub_10001ACCC()
{
  return sub_100049368();
}

uint64_t sub_10001AE90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = sub_1000495F8();
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3);
  uint64_t v34 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004334(&qword_10005DBA8);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  uint64_t v7 = sub_100048F88();
  uint64_t v30 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004334(&qword_10005E110);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v31 = v10;
  uint64_t v32 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100004334(&qword_10005E108);
  uint64_t v35 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v29 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for LIDResolutionView();
  sub_100049D08();
  sub_100049D08();
  long long v44 = *(_OWORD *)(a1 + *(int *)(v15 + 40));
  sub_100004334(&qword_10005DBB0);
  sub_100049CB8();
  swift_bridgeObjectRetain();
  sub_100048F78();
  uint64_t v39 = a1;
  uint64_t v16 = sub_100004334(&qword_10005E118);
  uint64_t v17 = sub_10001D1C4(&qword_10005DBA0, (void (*)(uint64_t))&type metadata accessor for LanguagesView);
  uint64_t v18 = sub_1000044D8(&qword_10005E120);
  uint64_t v19 = sub_100005584(&qword_10005E128, &qword_10005E120);
  uint64_t v40 = v18;
  uint64_t v41 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_100049BB8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  uint64_t v22 = v36;
  uint64_t v21 = v37;
  uint64_t v23 = v34;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v34, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v37);
  uint64_t v40 = v7;
  uint64_t v41 = v16;
  uint64_t v42 = v17;
  uint64_t v43 = OpaqueTypeConformance2;
  uint64_t v24 = swift_getOpaqueTypeConformance2();
  unint64_t v25 = v29;
  uint64_t v26 = v31;
  sub_100049B98();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v21);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v26);
  sub_100049668();
  uint64_t v40 = v26;
  uint64_t v41 = v24;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v33;
  sub_100049B18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v25, v27);
}

uint64_t sub_10001B428(uint64_t a1)
{
  uint64_t v2 = sub_100049708();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100004334(&qword_10005E120);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000496F8();
  uint64_t v9 = a1;
  sub_100048EF8();
  sub_10001D1C4(&qword_10005DB60, (void (*)(uint64_t))&type metadata accessor for CloseButton);
  sub_100049418();
  sub_100005584(&qword_10005E128, &qword_10005E120);
  sub_100049738();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001B5F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LIDResolutionView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  sub_10001D070(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10001D0D8((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  return sub_100048EE8();
}

uint64_t sub_10001B6FC()
{
  return sub_100049CA8();
}

uint64_t sub_10001B764@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_100049038();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  __chkstk_darwin(v4);
  uint64_t v43 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005E088);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v47 = (uint64_t)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v46 = (char *)v41 - v9;
  v41[1] = a1;
  uint64_t v10 = sub_10001A1E4();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  sub_100049BE8();
  uint64_t v42 = sub_100049A28();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  swift_release();
  sub_10000AAD0(v10, v12, v14);
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_100049DD8();
  uint64_t v40 = v20;
  uint64_t v22 = v42;
  sub_100013604(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v59, 0.0, 1, 0.0, 1, v21, v23, v42, v16, v18 & 1, v40);
  sub_10000AAD0(v22, v16, v18 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = v43;
  uint64_t v25 = v44;
  uint64_t v27 = v45;
  (*(void (**)(char *, void, uint64_t))(v44 + 104))(v43, enum case for TranslateFeatures.lowConfidenceLID(_:), v45);
  LOBYTE(v10) = sub_100049028();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  if (v10)
  {
    uint64_t v28 = sub_100004334(&qword_10005E090);
    uint64_t v29 = v46;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v46, 1, 1, v28);
  }
  else
  {
    uint64_t v29 = v46;
    sub_10001A3BC(v46);
    uint64_t v30 = sub_100004334(&qword_10005E090);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  }
  uint64_t v31 = v47;
  sub_100005488((uint64_t)v29, v47, &qword_10005E088);
  long long v53 = v65;
  long long v54 = v66;
  v55[0] = v67;
  long long v49 = v61;
  long long v50 = v62;
  long long v32 = v64;
  long long v51 = v63;
  long long v52 = v64;
  long long v33 = v60;
  v48[0] = v59;
  v48[1] = v60;
  long long v34 = v66;
  a2[6] = v65;
  a2[7] = v34;
  a2[8] = v55[0];
  long long v35 = v50;
  long long v36 = v51;
  long long v37 = v48[0];
  a2[2] = v49;
  a2[3] = v35;
  *(void *)&v55[1] = KeyPath;
  BYTE8(v55[1]) = 1;
  a2[4] = v36;
  a2[5] = v32;
  *a2 = v37;
  a2[1] = v33;
  *(_OWORD *)((char *)a2 + 137) = *(_OWORD *)((char *)v55 + 9);
  uint64_t v38 = sub_100004334(&qword_10005E098);
  sub_100005488(v31, (uint64_t)a2 + *(int *)(v38 + 48), &qword_10005E088);
  sub_10001CE9C((uint64_t)v48);
  sub_1000054EC((uint64_t)v29, &qword_10005E088);
  sub_1000054EC(v31, &qword_10005E088);
  v56[6] = v65;
  v56[7] = v66;
  v56[8] = v67;
  _DWORD v56[2] = v61;
  v56[3] = v62;
  v56[4] = v63;
  v56[5] = v64;
  v56[0] = v59;
  v56[1] = v60;
  uint64_t v57 = KeyPath;
  char v58 = 1;
  return sub_10001CEF0((uint64_t)v56);
}

uint64_t sub_10001BB94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v34 = sub_100004334(&qword_10005DFE0);
  uint64_t v29 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v28 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100004334(&qword_10005DFE8);
  __chkstk_darwin(v31);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004334(&qword_10005DFF0);
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100004334(&qword_10005DFF8);
  uint64_t v7 = *(void *)(v32 - 8);
  uint64_t v8 = __chkstk_darwin(v32);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = sub_100049038();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for TranslateFeatures.lowConfidenceLID(_:), v13);
  char v17 = sub_100049028();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v35 = v30;
  if (v17)
  {
    sub_100004334(&qword_10005E028);
    sub_100005584(&qword_10005E030, &qword_10005E028);
    sub_1000499D8();
    uint64_t v36 = sub_100049C18();
    uint64_t v18 = sub_100005584(&qword_10005E018, &qword_10005DFF0);
    sub_100049B88();
    swift_release();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
    uint64_t v19 = v32;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v10, v32);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v3, v12, v19);
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = v4;
    long long v37 = &type metadata for Color;
    uint64_t v38 = v18;
    uint64_t v39 = &protocol witness table for Color;
    swift_getOpaqueTypeConformance2();
    sub_100005584(&qword_10005E020, &qword_10005DFE0);
    sub_1000496E8();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v19);
  }
  else
  {
    sub_1000498B8();
    sub_100004334(&qword_10005E000);
    uint64_t v21 = sub_1000044D8(&qword_10005E008);
    uint64_t v22 = sub_100005584(&qword_10005E010, &qword_10005E008);
    uint64_t v36 = v21;
    long long v37 = (void *)v22;
    swift_getOpaqueTypeConformance2();
    uint64_t v23 = v28;
    sub_1000492E8();
    uint64_t v24 = v29;
    uint64_t v25 = v34;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v3, v23, v34);
    swift_storeEnumTagMultiPayload();
    uint64_t v26 = sub_100005584(&qword_10005E018, &qword_10005DFF0);
    uint64_t v36 = v4;
    long long v37 = &type metadata for Color;
    uint64_t v38 = v26;
    uint64_t v39 = &protocol witness table for Color;
    swift_getOpaqueTypeConformance2();
    sub_100005584(&qword_10005E020, &qword_10005DFE0);
    sub_1000496E8();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v23, v25);
  }
}

uint64_t sub_10001C20C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_100004334(&qword_10005DBA8);
  uint64_t v4 = __chkstk_darwin(v3);
  __chkstk_darwin(v4);
  uint64_t v40 = sub_100048F88();
  uint64_t v38 = *(void *)(v40 - 8);
  uint64_t v5 = __chkstk_darwin(v40);
  uint64_t v39 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = sub_100004334(&qword_10005E038);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100004334(&qword_10005E040);
  uint64_t v35 = *(void *)(v37 - 8);
  uint64_t v12 = v35;
  uint64_t v13 = __chkstk_darwin(v37);
  uint64_t v36 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v32 - v15;
  sub_10001C634(a1, (uint64_t)v11);
  sub_10001CB00();
  uint64_t v34 = v16;
  sub_100049D68();
  uint64_t v17 = type metadata accessor for LIDResolutionView();
  sub_100049D08();
  sub_100049D08();
  long long v42 = *(_OWORD *)(a1 + *(int *)(v17 + 40));
  sub_100004334(&qword_10005DBB0);
  sub_100049CB8();
  swift_bridgeObjectRetain();
  uint64_t v33 = v8;
  sub_100048F78();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v19 = v36;
  uint64_t v20 = v16;
  uint64_t v21 = v37;
  v18(v36, v20, v37);
  uint64_t v22 = v38;
  uint64_t v23 = v39;
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  uint64_t v25 = v8;
  uint64_t v26 = v40;
  v24(v39, v25, v40);
  uint64_t v27 = v41;
  v18(v41, v19, v21);
  uint64_t v28 = sub_100004334(&qword_10005E070);
  v24(&v27[*(int *)(v28 + 48)], v23, v26);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v22 + 8);
  v29(v33, v26);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v35 + 8);
  v30(v34, v21);
  v29(v23, v26);
  return ((uint64_t (*)(char *, uint64_t))v30)(v19, v21);
}

uint64_t sub_10001C634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = sub_100004334(&qword_10005E078);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000499C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004334(&qword_10005DC08);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004334(&qword_10005E008);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004334(&qword_10005E058);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v15 = sub_1000496C8();
  *((void *)v15 + 1) = 0x4038000000000000;
  v15[16] = 0;
  uint64_t v20 = sub_100004334(&qword_10005E080);
  sub_10001B764(a1, &v15[*(int *)(v20 + 44)]);
  uint64_t v21 = sub_100049A48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v12, 1, 1, v21);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v23 = (uint64_t *)&v19[*(int *)(v17 + 44)];
  uint64_t v24 = sub_100004334(&qword_10005DAF0);
  sub_100005488((uint64_t)v12, (uint64_t)v23 + *(int *)(v24 + 28), &qword_10005DC08);
  *uint64_t v23 = KeyPath;
  sub_100005488((uint64_t)v15, (uint64_t)v19, &qword_10005E008);
  sub_1000054EC((uint64_t)v12, &qword_10005DC08);
  sub_1000054EC((uint64_t)v15, &qword_10005E008);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Font.TextStyle.body(_:), v6);
  uint64_t v25 = sub_100049968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v5, 1, 1, v25);
  uint64_t v26 = sub_100049988();
  sub_1000054EC((uint64_t)v5, &qword_10005E078);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v27 = swift_getKeyPath();
  uint64_t v28 = v32;
  sub_100005488((uint64_t)v19, v32, &qword_10005E058);
  uint64_t v29 = (uint64_t *)(v28 + *(int *)(sub_100004334(&qword_10005E038) + 36));
  uint64_t *v29 = v27;
  v29[1] = v26;
  return sub_1000054EC((uint64_t)v19, &qword_10005E058);
}

uint64_t sub_10001C9F0(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005E008);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v4 = sub_1000496C8();
  *((void *)v4 + 1) = 0x4038000000000000;
  v4[16] = 0;
  uint64_t v5 = sub_100004334(&qword_10005E080);
  sub_10001B764(a1, &v4[*(int *)(v5 + 44)]);
  sub_100005584(&qword_10005E010, &qword_10005E008);
  sub_100049A98();
  return sub_1000054EC((uint64_t)v4, &qword_10005E008);
}

uint64_t sub_10001CAF0()
{
  return sub_10001C9F0(*(void *)(v0 + 16));
}

uint64_t sub_10001CAF8@<X0>(char *a1@<X8>)
{
  return sub_10001C20C(*(void *)(v1 + 16), a1);
}

unint64_t sub_10001CB00()
{
  unint64_t result = qword_10005E048;
  if (!qword_10005E048)
  {
    sub_1000044D8(&qword_10005E038);
    sub_10001CBA0();
    sub_100005584(&qword_10005E060, &qword_10005E068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E048);
  }
  return result;
}

unint64_t sub_10001CBA0()
{
  unint64_t result = qword_10005E050;
  if (!qword_10005E050)
  {
    sub_1000044D8(&qword_10005E058);
    sub_100005584(&qword_10005E010, &qword_10005E008);
    sub_100005584(&qword_10005DAE8, &qword_10005DAF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E050);
  }
  return result;
}

uint64_t sub_10001CC64()
{
  return sub_100049558();
}

uint64_t sub_10001CC88()
{
  return sub_100049558();
}

uint64_t sub_10001CCAC(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005DC08);
  __chkstk_darwin(v2 - 8);
  sub_100005488(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10005DC08);
  return sub_100049568();
}

uint64_t sub_10001CD44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049518();
  *a1 = result;
  return result;
}

uint64_t sub_10001CD70()
{
  return sub_100049528();
}

uint64_t sub_10001CD98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049538();
  *a1 = result;
  return result;
}

uint64_t sub_10001CDC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049538();
  *a1 = result;
  return result;
}

uint64_t sub_10001CDF0()
{
  return sub_100049548();
}

uint64_t sub_10001CE1C()
{
  return sub_100049548();
}

uint64_t sub_10001CE48@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049518();
  *a1 = result;
  return result;
}

uint64_t sub_10001CE74()
{
  return sub_100049528();
}

uint64_t sub_10001CE9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001CEF0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001CF44()
{
  return sub_10001A8F4(*(void *)(v0 + 16));
}

unint64_t sub_10001CF4C()
{
  unint64_t result = qword_10005E0C0;
  if (!qword_10005E0C0)
  {
    sub_1000044D8(&qword_10005E0B8);
    sub_100005584(&qword_10005E0C8, &qword_10005E0D0);
    sub_10001D1C4(&qword_10005DEF8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E0C0);
  }
  return result;
}

unint64_t sub_10001D01C()
{
  unint64_t result = qword_10005E0E0;
  if (!qword_10005E0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E0E0);
  }
  return result;
}

uint64_t sub_10001D070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LIDResolutionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LIDResolutionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D13C()
{
  type metadata accessor for LIDResolutionView();

  return sub_10001ACCC();
}

uint64_t sub_10001D1AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001AE90(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001D1B4()
{
  return sub_10001B428(*(void *)(v0 + 16));
}

uint64_t sub_10001D1BC()
{
  return sub_10001B5F8(*(void *)(v0 + 16));
}

uint64_t sub_10001D1C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001D210()
{
  return sub_10001D44C((uint64_t (*)(uint64_t))sub_10001B6FC);
}

uint64_t sub_10001D22C()
{
  uint64_t v1 = type metadata accessor for LIDResolutionView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v14 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v15 = v0;
  uint64_t v4 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  swift_release();
  swift_release();
  uint64_t v6 = sub_100004334(&qword_10005DBA8);
  uint64_t v7 = v5 + *(int *)(v6 + 32);
  uint64_t v8 = sub_100048E48();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v11 = v4 + *(int *)(v1 + 28);
  swift_release();
  swift_release();
  uint64_t v12 = v11 + *(int *)(v6 + 32);
  if (!v10(v12, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v15, v3 + v14, v2 | 7);
}

uint64_t sub_10001D434()
{
  return sub_10001D44C((uint64_t (*)(uint64_t))sub_10001AB4C);
}

uint64_t sub_10001D44C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for LIDResolutionView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_10001D4C4()
{
  unint64_t result = qword_10005E140;
  if (!qword_10005E140)
  {
    sub_1000044D8(&qword_10005E148);
    sub_1000044D8(&qword_10005DFF0);
    sub_100005584(&qword_10005E018, &qword_10005DFF0);
    swift_getOpaqueTypeConformance2();
    sub_100005584(&qword_10005E020, &qword_10005DFE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E140);
  }
  return result;
}

uint64_t sub_10001D5D8(uint64_t a1)
{
  return sub_10001D704(a1, qword_100060580);
}

uint64_t sub_10001D5F4(uint64_t a1)
{
  return sub_10001D704(a1, qword_100060598);
}

uint64_t sub_10001D618(uint64_t a1)
{
  return sub_10001D704(a1, qword_1000605B0);
}

uint64_t sub_10001D63C(uint64_t a1)
{
  return sub_10001D704(a1, qword_1000605C8);
}

uint64_t sub_10001D664(uint64_t a1)
{
  return sub_10001D704(a1, qword_1000605E0);
}

uint64_t *sub_10001D688(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001D6EC(uint64_t a1)
{
  return sub_10001D704(a1, qword_1000605F8);
}

uint64_t sub_10001D704(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100049208();
  sub_10001D688(v3, a2);
  sub_100009598(v3, (uint64_t)a2);
  return sub_1000491F8();
}

uint64_t EnvironmentValues._replace.getter()
{
  sub_10000A02C();
  sub_1000495D8();
  return v1;
}

void sub_10001D7B8(void *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

uint64_t EnvironmentValues._replace.setter()
{
  return sub_1000495E8();
}

void (*EnvironmentValues._replace.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_10000A02C();
  sub_1000495D8();
  *(_OWORD *)uint64_t v3 = *((_OWORD *)v3 + 1);
  return sub_10001D890;
}

void sub_10001D890(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  v2[2] = v4;
  v2[3] = v3;
  if (a2)
  {
    swift_retain();
    sub_1000495E8();
    swift_release();
  }
  else
  {
    sub_1000495E8();
  }

  free(v2);
}

ValueMetadata *type metadata accessor for ReplaceAction()
{
  return &type metadata for ReplaceAction;
}

ValueMetadata *type metadata accessor for ReplaceActionKey()
{
  return &type metadata for ReplaceActionKey;
}

uint64_t sub_10001D944(unint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v64 = a3;
  long long v63 = a2;
  uint64_t v4 = sub_100004334(&qword_10005E150);
  __chkstk_darwin(v4 - 8);
  long long v62 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100049A18();
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v70 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049A08();
  sub_100004334(&qword_10005E158);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004BB60;
  sub_100049998();
  uint64_t v8 = sub_100049948();
  swift_release();
  *(void *)(inited + 32) = v8;
  sub_100049938();
  uint64_t v9 = sub_100049948();
  swift_release();
  *(void *)(inited + 40) = v9;
  uint64_t v71 = (char *)inited;
  sub_100049F88();
  int v10 = 0;
  unint64_t v11 = 0;
  long long v65 = v71;
  long long v61 = v71 + 32;
  unint64_t v58 = a1 - 1;
  unint64_t v12 = (a1 - 1) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v57 = v12 | 1;
  unint64_t v59 = v12;
  uint64_t v56 = 16 * v12;
  unint64_t v60 = a1;
  long long v55 = xmmword_10004BB70;
  while (1)
  {
    int v13 = v10;
    if (v11 >= *((void *)v65 + 2)) {
      break;
    }
    if ((a1 & 0x8000000000000000) != 0) {
      goto LABEL_20;
    }
    uint64_t v14 = *(void *)&v61[8 * v11];
    swift_retain();
    int v66 = v13;
    if (!a1)
    {
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_14;
    }
    uint64_t v15 = (void *)sub_100049FB8();
    uint64_t v16 = (char *)v15;
    v15[2] = a1;
    v15[4] = 65;
    v15[5] = 0xE100000000000000;
    if (a1 == 1) {
      goto LABEL_14;
    }
    uint64_t v17 = v15 + 6;
    if (a1 < 5)
    {
      uint64_t v18 = 1;
LABEL_12:
      unint64_t v22 = a1 - v18;
      do
      {
        void *v17 = 65;
        v17[1] = 0xE100000000000000;
        v17 += 2;
        --v22;
      }
      while (v22);
      goto LABEL_14;
    }
    uint64_t v17 = (void *)((char *)v17 + v56);
    uint64_t v19 = (long long *)(v15 + 10);
    unint64_t v20 = v59;
    long long v21 = v55;
    do
    {
      *(v19 - 2) = v21;
      *(v19 - 1) = v21;
      *uint64_t v19 = v21;
      v19[1] = v21;
      v19 += 4;
      v20 -= 4;
    }
    while (v20);
    uint64_t v18 = v57;
    if (v58 != v59) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v71 = v16;
    sub_100004334(&qword_10005E160);
    sub_10001DF78();
    uint64_t v23 = sub_100049E58();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v71 = (char *)v23;
    uint64_t v72 = v25;
    sub_100012C1C();
    uint64_t v26 = sub_100049A78();
    uint64_t v28 = v27;
    char v30 = v29 & 1;
    swift_retain();
    uint64_t v31 = sub_100049A58();
    uint64_t v33 = v32;
    char v35 = v34;
    swift_release();
    sub_10000AAD0(v26, v28, v30);
    swift_bridgeObjectRelease();
    uint64_t v68 = sub_1000499E8();
    uint64_t v36 = *(void *)(v68 - 8);
    long long v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56);
    uint64_t v69 = v36 + 56;
    uint64_t v37 = v14;
    uint64_t v38 = (uint64_t)v62;
    v67(v62, 1, 1, v68);
    sub_1000499F8();
    double v40 = v39;
    sub_10000AAD0(v31, v33, v35 & 1);
    swift_bridgeObjectRelease();
    sub_10001DFD4(v38);
    uint64_t v71 = v63;
    uint64_t v72 = v64;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_100049A78();
    uint64_t v43 = v42;
    LOBYTE(v33) = v44 & 1;
    swift_retain();
    uint64_t v45 = sub_100049A58();
    uint64_t v47 = v46;
    char v49 = v48;
    swift_release();
    sub_10000AAD0(v41, v43, v33);
    swift_bridgeObjectRelease();
    v67((char *)v38, 1, 1, v68);
    sub_1000499F8();
    double v51 = v50;
    sub_10000AAD0(v45, v47, v49 & 1);
    swift_bridgeObjectRelease();
    sub_10001DFD4(v38);
    if (v51 <= v40)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    swift_release();
    int v10 = 1;
    unint64_t v11 = 1;
    a1 = v60;
    if (v66)
    {
      swift_bridgeObjectRelease();
      sub_100049938();
      uint64_t v37 = sub_100049948();
      swift_release();
LABEL_18:
      (*(void (**)(char *, uint64_t))(v53 + 8))(v70, v54);
      return v37;
    }
  }
  __break(1u);
LABEL_20:
  uint64_t result = sub_10004A288();
  __break(1u);
  return result;
}

unint64_t sub_10001DF78()
{
  unint64_t result = qword_10005E168;
  if (!qword_10005E168)
  {
    sub_1000044D8(&qword_10005E160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E168);
  }
  return result;
}

uint64_t sub_10001DFD4(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005E150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001E034()
{
  long long v5 = *v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v5);
  if (!v4) {
    return sub_100049958();
  }
  sub_100004334(&qword_10005E278);
  sub_100049C98();
  uint64_t v1 = sub_10001D944(3uLL, v3, v4);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_10001E118@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100048E48();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v15 = *v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_1000054EC((uint64_t)v9, &qword_10005D818);
LABEL_5:
    unint64_t v11 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_1000054EC((uint64_t)v9, &qword_10005D818);
  BOOL v10 = sub_100048E08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (!v10) {
    goto LABEL_5;
  }
  unint64_t v11 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
LABEL_6:
  uint64_t v12 = *v11;
  uint64_t v13 = sub_1000493A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(a1, v12, v13);
}

uint64_t sub_10001E358(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v5 = sub_100004334(&qword_10005D818);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v11 = &v17[-v10];
  __chkstk_darwin(v9);
  uint64_t v13 = &v17[-v12];
  long long v18 = *a4;
  swift_retain();
  sub_100048F98();
  uint64_t v14 = sub_100048E48();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) == 1)
  {
    sub_100048DA8();
    sub_1000054EC((uint64_t)v11, &qword_10005D818);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 32))(v13, v11, v14);
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488((uint64_t)v13, (uint64_t)v8, &qword_10005D818);
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  v17[15] = 0;
  swift_retain();
  sub_100049288();
  sub_1000054EC((uint64_t)v13, &qword_10005D818);
  return sub_100023568((uint64_t)&v18);
}

uint64_t sub_10001E5B0@<X0>(long long *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v12);
  uint64_t v7 = sub_100048E48();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100048DA8();
    sub_1000054EC((uint64_t)v6, &qword_10005D818);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v6, v7);
  }
  uint64_t v9 = enum case for LanguageOption.locale(_:);
  uint64_t v10 = sub_100048FA8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(a2, v9, v10);
}

uint64_t sub_10001E77C(void (*a1)(char *, char *, uint64_t), uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v45 = a4;
  uint64_t v46 = a1;
  uint64_t v4 = sub_100048E48();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v43 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v44 = (char *)&v41 - v8;
  uint64_t v9 = sub_100004334(&qword_10005D818);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v42 = (uint64_t)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v41 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v41 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  unint64_t v20 = (char *)&v41 - v19;
  __chkstk_darwin(v18);
  unint64_t v22 = (char *)&v41 - v21;
  uint64_t v23 = sub_100049038();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v26, enum case for TranslateFeatures.refreshedSystemTranslation(_:), v23);
  char v27 = sub_100049028();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  if (v27)
  {
    uint64_t v28 = v45;
    sub_100048F98();
    uint64_t v29 = v4;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) == 1)
    {
      char v30 = v44;
      sub_100048DA8();
      sub_1000054EC((uint64_t)v14, &qword_10005D818);
    }
    else
    {
      char v30 = v44;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v44, v14, v29);
    }
    long long v49 = *v28;
    uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v46(v17, v30, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v17, 0, 1, v29);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100005488((uint64_t)v17, v42, &qword_10005D818);
    swift_retain_n();
    sub_100049288();
    sub_1000054EC((uint64_t)v17, &qword_10005D818);
    sub_100023568((uint64_t)&v49);
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_100049208();
    sub_100009598(v31, (uint64_t)qword_1000605E0);
    uint64_t v32 = v43;
    v46(v43, v30, v29);
    uint64_t v33 = sub_1000491E8();
    os_log_type_t v34 = sub_10004A098();
    if (os_log_type_enabled(v33, v34))
    {
      char v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
      char v48 = v46;
      *(_DWORD *)char v35 = 136446210;
      uint64_t v36 = sub_100048DB8();
      uint64_t v47 = sub_1000095FC(v36, v37, (uint64_t *)&v48);
      sub_10004A1A8();
      swift_bridgeObjectRelease();
      uint64_t v38 = *(void (**)(char *, uint64_t))(v5 + 8);
      v38(v32, v29);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Target locale changed using new language picker to %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      char v30 = v44;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v38 = *(void (**)(char *, uint64_t))(v5 + 8);
      v38(v32, v29);
    }

    sub_100023BB4();
    double v40 = (void *)sub_10004A0A8();
    sub_100048DB8();
    sub_10004A0F8();

    return ((uint64_t (*)(char *, uint64_t))v38)(v30, v29);
  }
  else
  {
    long long v49 = *v45;
    swift_retain();
    sub_100048F98();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v20, 1, v4) == 1)
    {
      sub_100048DA8();
      sub_1000054EC((uint64_t)v20, &qword_10005D818);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v22, v20, v4);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v22, 0, 1, v4);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100005488((uint64_t)v22, (uint64_t)v17, &qword_10005D818);
    swift_retain();
    sub_100049288();
    sub_1000054EC((uint64_t)v22, &qword_10005D818);
    return sub_100023568((uint64_t)&v49);
  }
}

void *sub_10001EE58(void (*a1)(uint64_t, uint64_t), const char *a2)
{
  v30[0] = a2;
  uint64_t v39 = sub_100048F68();
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v38 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100048E48();
  uint64_t v6 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v36 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for TranslationModel.LocaleInfo(0);
  uint64_t v8 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100048F38();
  uint64_t v11 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v42 = *v2;
  uint64_t v14 = *((void *)&v42 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t v15 = (uint64_t)v41;
  sub_100023A5C((uint64_t)&v42);
  uint64_t v16 = sub_10002387C(v15, v14, (uint64_t)v40, a1);
  sub_100023568((uint64_t)&v42);
  swift_bridgeObjectRelease();
  sub_100023568((uint64_t)&v42);
  int64_t v17 = v16[2];
  if (!v17)
  {
    swift_bridgeObjectRelease();
    unint64_t v22 = _swiftEmptyArrayStorage;
    if (_swiftEmptyArrayStorage[2]) {
      return v22;
    }
    goto LABEL_14;
  }
  uint64_t v41 = _swiftEmptyArrayStorage;
  sub_100038908(0, v17, 0);
  uint64_t v18 = *(unsigned __int8 *)(v8 + 80);
  v30[1] = (const char *)v16;
  uint64_t v19 = (uint64_t)v16 + ((v18 + 32) & ~v18);
  uint64_t v33 = *(void *)(v8 + 72);
  unsigned int v32 = enum case for LanguageState.availableForDownload(_:);
  unint64_t v20 = (void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v31 = enum case for LanguageState.installed(_:);
  v30[2] = (const char *)(v11 + 32);
  do
  {
    sub_100023A88(v19, (uint64_t)v10, type metadata accessor for TranslationModel.LocaleInfo);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v36, v10, v37);
    if (v10[*(int *)(v35 + 20)]) {
      uint64_t v21 = v31;
    }
    else {
      uint64_t v21 = v32;
    }
    (*v20)(v38, v21, v39);
    sub_100048F28();
    sub_100023AF0((uint64_t)v10, type metadata accessor for TranslationModel.LocaleInfo);
    unint64_t v22 = v41;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100038908(0, v22[2] + 1, 1);
      unint64_t v22 = v41;
    }
    unint64_t v24 = v22[2];
    unint64_t v23 = v22[3];
    if (v24 >= v23 >> 1)
    {
      sub_100038908(v23 > 1, v24 + 1, 1);
      unint64_t v22 = v41;
    }
    v22[2] = v24 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))((unint64_t)v22+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v24, v13, v34);
    uint64_t v41 = v22;
    v19 += v33;
    --v17;
  }
  while (v17);
  swift_bridgeObjectRelease();
  if (!v22[2])
  {
LABEL_14:
    swift_bridgeObjectRelease();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_100049208();
    sub_100009598(v25, (uint64_t)qword_1000605E0);
    uint64_t v26 = sub_1000491E8();
    os_log_type_t v27 = sub_10004A078();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, v30[0], v28, 2u);
      swift_slowDealloc();
    }

    return _swiftEmptyArrayStorage;
  }
  return v22;
}

uint64_t sub_10001F3C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v49 = a1;
  uint64_t v3 = sub_100049408();
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (_OWORD *)((char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100004334(&qword_10005E178);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004334(&qword_10005DDC8);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004334(&qword_10005DDD0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100004334(&qword_10005E180);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  unint64_t v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_1000496C8();
  *((void *)v9 + 1) = 0x4030000000000000;
  unsigned char v9[16] = 0;
  uint64_t v21 = sub_100004334(&qword_10005E188);
  sub_10001F7C0(v2, (uint64_t)&v9[*(int *)(v21 + 44)]);
  LOBYTE(v2) = sub_1000498D8();
  sub_1000492D8();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_100005488((uint64_t)v9, (uint64_t)v13, &qword_10005E178);
  char v30 = &v13[*(int *)(v11 + 44)];
  *char v30 = (char)v2;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_1000054EC((uint64_t)v9, &qword_10005E178);
  uint64_t v31 = sub_100049DB8();
  sub_100013F94(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, 0.0, 1, v31, v32);
  sub_1000054EC((uint64_t)v13, &qword_10005DDC8);
  id v33 = [self secondarySystemGroupedBackgroundColor];
  uint64_t v34 = sub_100049BF8();
  LOBYTE(v13) = sub_1000498D8();
  sub_100005488((uint64_t)v16, (uint64_t)v20, &qword_10005DDD0);
  uint64_t v35 = &v20[*(int *)(v18 + 44)];
  *(void *)uint64_t v35 = v34;
  v35[8] = (char)v13;
  sub_1000054EC((uint64_t)v16, &qword_10005DDD0);
  uint64_t v36 = (char *)v6 + *(int *)(v4 + 28);
  uint64_t v37 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v38 = sub_100049688();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 104))(v36, v37, v38);
  __asm { FMOV            V0.2D, #10.0 }
  _OWORD *v6 = _Q0;
  uint64_t v44 = sub_100004334(&qword_10005E190);
  uint64_t v45 = v49;
  uint64_t v46 = v49 + *(int *)(v44 + 36);
  sub_100023A88((uint64_t)v6, v46, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v46 + *(int *)(sub_100004334(&qword_10005D518) + 36)) = 256;
  sub_100005488((uint64_t)v20, v45, &qword_10005E180);
  sub_100023AF0((uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  return sub_1000054EC((uint64_t)v20, &qword_10005E180);
}

uint64_t sub_10001F7C0@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v3 = sub_100004334(&qword_10005E198);
  __chkstk_darwin(v3 - 8);
  char v85 = (uint64_t *)((char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v81 = sub_100004334(&qword_10005E1A0);
  __chkstk_darwin(v81);
  char v86 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100004334(&qword_10005E1A8);
  uint64_t v6 = __chkstk_darwin(v84);
  uint64_t v90 = (uint64_t)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v89 = (uint64_t)&v71 - v8;
  uint64_t v80 = sub_100049D58();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v77 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100004334(&qword_10005E1B0);
  uint64_t v10 = __chkstk_darwin(v76);
  uint64_t v93 = (uint64_t)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v87 = (uint64_t)&v71 - v12;
  uint64_t v13 = sub_100004334(&qword_10005E1B8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v88 = (uint64_t)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v94 = (uint64_t)&v71 - v16;
  uint64_t v17 = sub_1000493A8();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100004334(&qword_10005E1C0);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100004334(&qword_10005E1C8);
  uint64_t v25 = v24 - 8;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v71 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  char v30 = (char *)&v71 - v29;
  *(void *)uint64_t v23 = sub_100049608();
  *((void *)v23 + 1) = 0x4020000000000000;
  v23[16] = 0;
  uint64_t v31 = sub_100004334(&qword_10005E1D0);
  sub_100020218(a1, (uint64_t)&v23[*(int *)(v31 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  sub_10001E118((uint64_t)v20);
  id v33 = (uint64_t *)&v28[*(int *)(v25 + 44)];
  uint64_t v73 = sub_100004334(&qword_10005E1D8);
  uint64_t v34 = (char *)v33 + *(int *)(v73 + 28);
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v75 = v18 + 16;
  uint64_t v74 = v35;
  v35(v34, v20, v17);
  *id v33 = KeyPath;
  sub_100005488((uint64_t)v23, (uint64_t)v28, &qword_10005E1C0);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v78 = v17;
  uint64_t v72 = v36;
  v36(v20, v17);
  sub_1000054EC((uint64_t)v23, &qword_10005E1C0);
  uint64_t v82 = v28;
  uint64_t v92 = v30;
  sub_100005424((uint64_t)v28, (uint64_t)v30, &qword_10005E1C8);
  uint64_t v83 = a1;
  swift_retain();
  uint64_t v37 = sub_100025BF0();
  swift_release();
  unint64_t v38 = v37[2];
  swift_bridgeObjectRelease();
  if (v38 < 2)
  {
    uint64_t v41 = sub_100049078();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v94, 1, 1, v41);
  }
  else
  {
    swift_retain();
    sub_100025BF0();
    swift_release();
    type metadata accessor for TranslationModel(0);
    sub_1000237D4(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
    sub_100049388();
    swift_getKeyPath();
    sub_100049398();
    swift_release();
    swift_release();
    uint64_t v39 = v94;
    sub_100049068();
    uint64_t v40 = sub_100049078();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
  }
  long long v42 = v77;
  sub_100049D48();
  sub_100049DD8();
  sub_100049308();
  uint64_t v43 = v79;
  uint64_t v44 = v93;
  uint64_t v45 = v80;
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 16))(v93, v42, v80);
  uint64_t v46 = (_OWORD *)(v44 + *(int *)(v76 + 36));
  long long v47 = v97;
  *uint64_t v46 = v96;
  v46[1] = v47;
  v46[2] = v98;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v45);
  uint64_t v48 = v87;
  sub_100005424(v44, v87, &qword_10005E1B0);
  uint64_t v49 = sub_100049608();
  uint64_t v50 = (uint64_t)v85;
  *char v85 = v49;
  *(void *)(v50 + 8) = 0x4020000000000000;
  *(unsigned char *)(v50 + 16) = 0;
  uint64_t v51 = sub_100004334(&qword_10005E1E0);
  sub_100021B7C(v83, v50 + *(int *)(v51 + 44));
  uint64_t v52 = swift_getKeyPath();
  sub_10001E118((uint64_t)v20);
  uint64_t v53 = (uint64_t)v86;
  uint64_t v54 = (uint64_t *)&v86[*(int *)(v81 + 36)];
  uint64_t v55 = v78;
  v74((char *)v54 + *(int *)(v73 + 28), v20, v78);
  *uint64_t v54 = v52;
  sub_100005488(v50, v53, &qword_10005E198);
  v72(v20, v55);
  sub_1000054EC(v50, &qword_10005E198);
  uint64_t v56 = sub_100049C08();
  uint64_t v57 = swift_getKeyPath();
  uint64_t v58 = v90;
  sub_100005488(v53, v90, &qword_10005E1A0);
  unint64_t v59 = (uint64_t *)(v58 + *(int *)(v84 + 36));
  *unint64_t v59 = v57;
  v59[1] = v56;
  sub_1000054EC(v53, &qword_10005E1A0);
  uint64_t v60 = v89;
  sub_100005424(v58, v89, &qword_10005E1A8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  if (v95 == 2) {
    int v61 = 2;
  }
  else {
    int v61 = v95 & 1;
  }
  LODWORD(v86) = v61;
  uint64_t v62 = (uint64_t)v82;
  sub_100005488((uint64_t)v92, (uint64_t)v82, &qword_10005E1C8);
  uint64_t v63 = v94;
  uint64_t v64 = v88;
  sub_100005488(v94, v88, &qword_10005E1B8);
  uint64_t v65 = v48;
  uint64_t v66 = v48;
  uint64_t v67 = v93;
  sub_100005488(v66, v93, &qword_10005E1B0);
  sub_100005488(v60, v58, &qword_10005E1A8);
  uint64_t v68 = v91;
  sub_100005488(v62, v91, &qword_10005E1C8);
  uint64_t v69 = (int *)sub_100004334(&qword_10005E1E8);
  sub_100005488(v64, v68 + v69[12], &qword_10005E1B8);
  sub_100005488(v67, v68 + v69[16], &qword_10005E1B0);
  sub_100005488(v58, v68 + v69[20], &qword_10005E1A8);
  *(unsigned char *)(v68 + v69[24]) = (_BYTE)v86;
  sub_1000054EC(v60, &qword_10005E1A8);
  sub_1000054EC(v65, &qword_10005E1B0);
  sub_1000054EC(v63, &qword_10005E1B8);
  sub_1000054EC((uint64_t)v92, &qword_10005E1C8);
  sub_1000054EC(v58, &qword_10005E1A8);
  sub_1000054EC(v67, &qword_10005E1B0);
  sub_1000054EC(v64, &qword_10005E1B8);
  return sub_1000054EC(v62, &qword_10005E1C8);
}

uint64_t sub_100020218@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v90 = a2;
  uint64_t v3 = sub_1000496B8();
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v85 = v3;
  __chkstk_darwin(v3);
  uint64_t v83 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000497F8();
  uint64_t v81 = *(void *)(v5 - 8);
  uint64_t v82 = v5;
  __chkstk_darwin(v5);
  uint64_t v79 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005E1F0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_100048ED8();
  uint64_t v73 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100004334(&qword_10005E1F8);
  __chkstk_darwin(v69);
  uint64_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100004334(&qword_10005E200);
  __chkstk_darwin(v68);
  uint64_t v70 = (uint64_t)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100004334(&qword_10005E2B0);
  __chkstk_darwin(v74);
  uint64_t v72 = (uint64_t)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004334(&qword_10005E2B8);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  uint64_t v78 = v17;
  __chkstk_darwin(v16);
  uint64_t v71 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100004334(&qword_10005E2C0);
  uint64_t v88 = *(void *)(v19 - 8);
  uint64_t v89 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v76 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v80 = (char *)&v67 - v22;
  uint64_t v23 = sub_100004334(&qword_10005E2C8);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v87 = (uint64_t)&v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v67 - v26;
  uint64_t v28 = sub_100004334(&qword_10005E2D0);
  uint64_t v29 = __chkstk_darwin(v28 - 8);
  uint64_t v86 = (uint64_t)&v67 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)&v67 - v31;
  *(void *)uint64_t v32 = sub_1000496D8();
  *((void *)v32 + 1) = 0;
  uint64_t v33 = 1;
  v32[16] = 1;
  uint64_t v34 = sub_100004334(&qword_10005E2D8);
  sub_100020D18(a1, (uint64_t)&v32[*(int *)(v34 + 44)]);
  long long v94 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v94);
  uint64_t v35 = *((void *)&v93 + 1);
  swift_bridgeObjectRelease();
  if (!v35) {
    goto LABEL_5;
  }
  long long v93 = a1[4];
  sub_100004334(&qword_10005DB30);
  sub_100049C98();
  if (v91 != 1)
  {
    uint64_t v33 = 1;
LABEL_5:
    uint64_t v61 = v89;
    goto LABEL_6;
  }
  long long v93 = a1[1];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v93);
  uint64_t v36 = sub_100048EB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v9, 1, 1, v36);
  uint64_t v37 = (_OWORD *)swift_allocObject();
  long long v38 = a1[3];
  v37[3] = a1[2];
  v37[4] = v38;
  v37[5] = a1[4];
  long long v39 = a1[1];
  v37[1] = *a1;
  v37[2] = v39;
  sub_1000235B0((uint64_t)a1);
  sub_100048EC8();
  uint64_t v40 = sub_10001E034();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v42 = v73;
  uint64_t v43 = v75;
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v13, v11, v75);
  uint64_t v44 = (uint64_t *)&v13[*(int *)(v69 + 36)];
  *uint64_t v44 = KeyPath;
  v44[1] = v40;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v43);
  uint64_t v45 = v70;
  sub_100005488((uint64_t)v13, v70, &qword_10005E1F8);
  *(unsigned char *)(v45 + *(int *)(v68 + 36)) = 0;
  sub_1000054EC((uint64_t)v13, &qword_10005E1F8);
  uint64_t v46 = sub_100049C28();
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = v72;
  sub_100005488(v45, v72, &qword_10005E200);
  uint64_t v49 = v74;
  uint64_t v50 = (uint64_t *)(v48 + *(int *)(v74 + 36));
  *uint64_t v50 = v47;
  v50[1] = v46;
  sub_1000054EC(v45, &qword_10005E200);
  uint64_t v51 = v79;
  sub_1000497E8();
  unint64_t v52 = sub_100023CB0();
  uint64_t v53 = v71;
  sub_100049B68();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v51, v82);
  sub_1000054EC(v48, &qword_10005E2B0);
  sub_100049668();
  uint64_t v91 = v49;
  unint64_t v92 = v52;
  swift_getOpaqueTypeConformance2();
  uint64_t v54 = (uint64_t)v76;
  uint64_t v55 = v77;
  sub_100049B38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v53, v55);
  sub_100004334(&qword_10005E258);
  uint64_t v56 = v84;
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_10004BB60;
  sub_100049698();
  sub_1000496A8();
  uint64_t v91 = v57;
  sub_1000237D4(&qword_10005E260, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_100004334(&qword_10005E268);
  sub_100005584(&qword_10005E270, &qword_10005E268);
  uint64_t v58 = v83;
  uint64_t v59 = v85;
  sub_10004A1E8();
  uint64_t v60 = (uint64_t)v80;
  uint64_t v61 = v89;
  sub_1000493B8();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v59);
  sub_1000054EC(v54, &qword_10005E2C0);
  sub_100005424(v60, (uint64_t)v27, &qword_10005E2C0);
  uint64_t v33 = 0;
LABEL_6:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v88 + 56))(v27, v33, 1, v61);
  uint64_t v62 = v86;
  sub_100005488((uint64_t)v32, v86, &qword_10005E2D0);
  uint64_t v63 = v87;
  sub_100005488((uint64_t)v27, v87, &qword_10005E2C8);
  uint64_t v64 = v90;
  sub_100005488(v62, v90, &qword_10005E2D0);
  uint64_t v65 = sub_100004334(&qword_10005E2E0);
  sub_100005488(v63, v64 + *(int *)(v65 + 48), &qword_10005E2C8);
  sub_1000054EC((uint64_t)v27, &qword_10005E2C8);
  sub_1000054EC((uint64_t)v32, &qword_10005E2D0);
  sub_1000054EC(v63, &qword_10005E2C8);
  return sub_1000054EC(v62, &qword_10005E2D0);
}

uint64_t sub_100020D18@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v111 = a2;
  uint64_t v3 = (int *)type metadata accessor for LanguageText();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005E280);
  uint64_t v108 = *(void *)(v6 - 8);
  uint64_t v109 = v6;
  __chkstk_darwin(v6);
  uint64_t v106 = (char *)v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_100004334(&qword_10005E288);
  uint64_t v8 = __chkstk_darwin(v105);
  uint64_t v110 = (uint64_t)v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v104 = (char *)v86 - v11;
  __chkstk_darwin(v10);
  uint64_t v107 = (uint64_t)v86 - v12;
  uint64_t v13 = sub_100004334(&qword_10005D818);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v102 = (char *)v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  long long v97 = (char *)v86 - v16;
  uint64_t v94 = sub_100048E48();
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v100 = (char *)v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004334(&qword_10005E290);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100049198();
  uint64_t v98 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  long long v96 = (char *)v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100004334(&qword_10005E2F0);
  __chkstk_darwin(v90);
  char v95 = (char *)v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100004334(&qword_10005E2F8);
  uint64_t v101 = *(void *)(v23 - 8);
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v92 = (uint64_t)v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v91 = (uint64_t)v86 - v26;
  uint64_t v27 = sub_100049038();
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)v86 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100004334(&qword_10005E300);
  uint64_t v32 = __chkstk_darwin(v31 - 8);
  uint64_t v103 = (uint64_t)v86 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)v86 - v34;
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v30, enum case for TranslateFeatures.refreshedSystemTranslation(_:), v27);
  char v36 = sub_100049028();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  uint64_t v37 = 1;
  uint64_t v112 = v35;
  if (v36)
  {
    type metadata accessor for TranslationModel(0);
    sub_1000237D4(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
    sub_100049388();
    swift_getKeyPath();
    sub_100049398();
    swift_release();
    swift_release();
    uint64_t v88 = v113;
    uint64_t v87 = v114;
    v86[1] = v115;
    sub_100049FF8();
    sub_1000235B0((uint64_t)a1);
    uint64_t v38 = sub_100049FE8();
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v38;
    *(void *)(v39 + 24) = &protocol witness table for MainActor;
    long long v40 = a1[3];
    *(_OWORD *)(v39 + 64) = a1[2];
    *(_OWORD *)(v39 + 80) = v40;
    *(_OWORD *)(v39 + 96) = a1[4];
    long long v41 = a1[1];
    *(_OWORD *)(v39 + 32) = *a1;
    *(_OWORD *)(v39 + 48) = v41;
    sub_1000235B0((uint64_t)a1);
    uint64_t v42 = sub_100049FE8();
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v42;
    *(void *)(v43 + 24) = &protocol witness table for MainActor;
    long long v44 = a1[3];
    *(_OWORD *)(v43 + 64) = a1[2];
    *(_OWORD *)(v43 + 80) = v44;
    *(_OWORD *)(v43 + 96) = a1[4];
    long long v45 = a1[1];
    *(_OWORD *)(v43 + 32) = *a1;
    *(_OWORD *)(v43 + 48) = v45;
    sub_100048FA8();
    uint64_t v89 = v20;
    sub_100049D18();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    uint64_t v46 = (uint64_t)v97;
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v47 = v93;
    uint64_t v48 = v94;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v46, 1, v94) == 1)
    {
      sub_100048DA8();
      sub_1000054EC(v46, &qword_10005D818);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v100, v46, v48);
    }
    sub_10001EE58((void (*)(uint64_t, uint64_t))sub_100026C74, "Unable to get list of source locales from viewModel");
    uint64_t v49 = v96;
    sub_100049188();
    int v50 = sub_100049748();
    uint64_t v51 = v98;
    uint64_t v52 = (uint64_t)v95;
    uint64_t v53 = v99;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v95, v49, v99);
    *(_DWORD *)(v52 + *(int *)(v90 + 36)) = v50;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v49, v53);
    uint64_t v54 = sub_100049C28();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v56 = v92;
    sub_100005488(v52, v92, &qword_10005E2F0);
    uint64_t v57 = (uint64_t *)(v56 + *(int *)(v23 + 36));
    *uint64_t v57 = KeyPath;
    v57[1] = v54;
    sub_1000054EC(v52, &qword_10005E2F0);
    uint64_t v58 = v91;
    sub_100005424(v56, v91, &qword_10005E2F8);
    uint64_t v35 = v112;
    sub_100005424(v58, (uint64_t)v112, &qword_10005E2F8);
    uint64_t v37 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v101 + 56))(v35, v37, 1, v23);
  long long v117 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v59 = (uint64_t)v102;
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v117);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v117);
  uint64_t v60 = v113;
  uint64_t v61 = v114;
  long long v116 = a1[4];
  sub_100004334(&qword_10005DB30);
  sub_100049CB8();
  uint64_t v62 = v113;
  uint64_t v63 = v114;
  char v64 = v115;
  uint64_t v65 = swift_getKeyPath();
  sub_100005424(v59, (uint64_t)v5, &qword_10005D818);
  uint64_t v66 = &v5[v3[5]];
  *(void *)uint64_t v66 = v60;
  *((void *)v66 + 1) = v61;
  v5[v3[6]] = 1;
  uint64_t v67 = &v5[v3[7]];
  *(void *)uint64_t v67 = 0x6554656372756F53;
  *((void *)v67 + 1) = 0xEA00000000007478;
  uint64_t v68 = &v5[v3[8]];
  LOBYTE(v116) = 0;
  sub_100049C88();
  uint64_t v69 = v114;
  *uint64_t v68 = v113;
  *((void *)v68 + 1) = v69;
  uint64_t v70 = &v5[v3[9]];
  *(void *)uint64_t v70 = v62;
  *((void *)v70 + 1) = v63;
  v70[16] = v64;
  uint64_t v71 = &v5[v3[10]];
  *(void *)uint64_t v71 = v65;
  *((void *)v71 + 1) = 0;
  v71[16] = 0;
  long long v116 = a1[3];
  sub_100004334(&qword_10005E278);
  sub_100049CB8();
  sub_1000237D4(&qword_10005E2A0, (void (*)(uint64_t))type metadata accessor for LanguageText);
  uint64_t v72 = v106;
  sub_100049A88();
  swift_release();
  swift_release();
  sub_100023AF0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for LanguageText);
  uint64_t v73 = sub_10001E034();
  uint64_t v74 = swift_getKeyPath();
  uint64_t v76 = v108;
  uint64_t v75 = v109;
  uint64_t v77 = (uint64_t)v104;
  (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v104, v72, v109);
  uint64_t v78 = (uint64_t *)(v77 + *(int *)(v105 + 36));
  *uint64_t v78 = v74;
  v78[1] = v73;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v72, v75);
  uint64_t v79 = v107;
  sub_100005424(v77, v107, &qword_10005E288);
  uint64_t v80 = (uint64_t)v112;
  uint64_t v81 = v103;
  sub_100005488((uint64_t)v112, v103, &qword_10005E300);
  uint64_t v82 = v110;
  sub_100005488(v79, v110, &qword_10005E288);
  uint64_t v83 = v111;
  sub_100005488(v81, v111, &qword_10005E300);
  uint64_t v84 = sub_100004334(&qword_10005E308);
  sub_100005488(v82, v83 + *(int *)(v84 + 48), &qword_10005E288);
  sub_1000054EC(v79, &qword_10005E288);
  sub_1000054EC(v80, &qword_10005E300);
  sub_1000054EC(v82, &qword_10005E288);
  return sub_1000054EC(v81, &qword_10005E300);
}

uint64_t sub_100021A4C()
{
  return sub_100049318();
}

uint64_t sub_100021A70(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  swift_retain();
  sub_100048510();
  return sub_100023568((uint64_t)&v2);
}

uint64_t sub_100021AB4(uint64_t a1)
{
  uint64_t v2 = sub_1000493A8();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100049508();
}

uint64_t sub_100021B7C@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a2;
  uint64_t v3 = sub_1000496B8();
  uint64_t v76 = *(void *)(v3 - 8);
  uint64_t v77 = v3;
  __chkstk_darwin(v3);
  uint64_t v75 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000497F8();
  uint64_t v71 = *(void *)(v5 - 8);
  uint64_t v72 = v5;
  __chkstk_darwin(v5);
  uint64_t v70 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005E1F0);
  __chkstk_darwin(v7 - 8);
  uint64_t v63 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100048ED8();
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100004334(&qword_10005E1F8);
  __chkstk_darwin(v62);
  uint64_t v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100004334(&qword_10005E200);
  __chkstk_darwin(v66);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100004334(&qword_10005E208);
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v67 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004334(&qword_10005E210);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v79 = v16;
  uint64_t v80 = v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v74 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v73 = (char *)&v61 - v20;
  uint64_t v21 = sub_100004334(&qword_10005E218);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v81 = (uint64_t)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v61 - v24;
  uint64_t v26 = sub_100004334(&qword_10005E220);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  uint64_t v78 = (uint64_t)&v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v61 - v29;
  *(void *)uint64_t v30 = sub_1000496D8();
  *((void *)v30 + 1) = 0;
  uint64_t v31 = 1;
  v30[16] = 1;
  uint64_t v32 = sub_100004334(&qword_10005E228);
  sub_100022590(a1, (uint64_t)&v30[*(int *)(v32 + 44)]);
  long long v86 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v86);
  uint64_t v33 = *((void *)&v85 + 1);
  swift_bridgeObjectRelease();
  if (v33)
  {
    long long v85 = a1[2];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049278();
    swift_release();
    swift_release();
    sub_100023568((uint64_t)&v85);
    uint64_t v34 = sub_100048EB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v63, 1, 1, v34);
    uint64_t v35 = (_OWORD *)swift_allocObject();
    long long v36 = a1[3];
    v35[3] = a1[2];
    v35[4] = v36;
    v35[5] = a1[4];
    long long v37 = a1[1];
    v35[1] = *a1;
    _DWORD v35[2] = v37;
    sub_1000235B0((uint64_t)a1);
    sub_100048EC8();
    uint64_t v38 = sub_10001E034();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v40 = v64;
    uint64_t v41 = v65;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v12, v10, v65);
    uint64_t v42 = (uint64_t *)&v12[*(int *)(v62 + 36)];
    *uint64_t v42 = KeyPath;
    v42[1] = v38;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v41);
    sub_100005488((uint64_t)v12, (uint64_t)v14, &qword_10005E1F8);
    uint64_t v43 = v66;
    v14[*(int *)(v66 + 36)] = 0;
    sub_1000054EC((uint64_t)v12, &qword_10005E1F8);
    long long v44 = v70;
    sub_1000497E8();
    unint64_t v45 = sub_100023624();
    uint64_t v46 = v67;
    sub_100049B68();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v44, v72);
    sub_1000054EC((uint64_t)v14, &qword_10005E200);
    sub_100049668();
    uint64_t v83 = v43;
    unint64_t v84 = v45;
    swift_getOpaqueTypeConformance2();
    uint64_t v47 = (uint64_t)v74;
    uint64_t v48 = v69;
    sub_100049B38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v46, v48);
    sub_100004334(&qword_10005E258);
    uint64_t v49 = v76;
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_10004BB60;
    sub_100049698();
    sub_1000496A8();
    uint64_t v83 = v50;
    sub_1000237D4(&qword_10005E260, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100004334(&qword_10005E268);
    sub_100005584(&qword_10005E270, &qword_10005E268);
    uint64_t v51 = v75;
    uint64_t v52 = v77;
    sub_10004A1E8();
    uint64_t v53 = (uint64_t)v73;
    uint64_t v54 = v79;
    sub_1000493B8();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v52);
    sub_1000054EC(v47, &qword_10005E210);
    sub_100005424(v53, (uint64_t)v25, &qword_10005E210);
    uint64_t v31 = 0;
    uint64_t v55 = v54;
  }
  else
  {
    uint64_t v55 = v79;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v25, v31, 1, v55);
  uint64_t v56 = v78;
  sub_100005488((uint64_t)v30, v78, &qword_10005E220);
  uint64_t v57 = v81;
  sub_100005488((uint64_t)v25, v81, &qword_10005E218);
  uint64_t v58 = v82;
  sub_100005488(v56, v82, &qword_10005E220);
  uint64_t v59 = sub_100004334(&qword_10005E230);
  sub_100005488(v57, v58 + *(int *)(v59 + 48), &qword_10005E218);
  sub_1000054EC((uint64_t)v25, &qword_10005E218);
  sub_1000054EC((uint64_t)v30, &qword_10005E220);
  sub_1000054EC(v57, &qword_10005E218);
  return sub_1000054EC(v56, &qword_10005E220);
}

uint64_t sub_100022590@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v97 = a2;
  uint64_t v3 = (int *)type metadata accessor for LanguageText();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005E280);
  uint64_t v95 = *(void *)(v6 - 8);
  uint64_t v96 = v6;
  __chkstk_darwin(v6);
  uint64_t v93 = (char *)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100004334(&qword_10005E288);
  uint64_t v8 = __chkstk_darwin(v92);
  uint64_t v88 = (char *)v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v91 = (char *)v76 - v11;
  __chkstk_darwin(v10);
  uint64_t v94 = (uint64_t)v76 - v12;
  uint64_t v13 = sub_100004334(&qword_10005D818);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v89 = (char *)v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v83 = (char *)v76 - v16;
  uint64_t v85 = sub_100048E48();
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v82 = (char *)v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004334(&qword_10005E290);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100049198();
  uint64_t v21 = *(void *)(v86 - 8);
  uint64_t v22 = __chkstk_darwin(v86);
  uint64_t v24 = (char *)v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v81 = (char *)v76 - v25;
  uint64_t v26 = sub_100049038();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100004334(&qword_10005E298);
  uint64_t v31 = __chkstk_darwin(v30 - 8);
  uint64_t v90 = (uint64_t)v76 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v87 = (char *)v76 - v33;
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v29, enum case for TranslateFeatures.refreshedSystemTranslation(_:), v26);
  char v34 = sub_100049028();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  if (v34)
  {
    uint64_t v79 = v24;
    LOBYTE(v103) = 0;
    sub_100049D28();
    uint64_t v78 = v99;
    uint64_t v77 = v100;
    v76[1] = v101;
    sub_100049FF8();
    sub_1000235B0((uint64_t)a1);
    uint64_t v35 = sub_100049FE8();
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v35;
    *(void *)(v36 + 24) = &protocol witness table for MainActor;
    long long v37 = a1[3];
    *(_OWORD *)(v36 + 64) = a1[2];
    *(_OWORD *)(v36 + 80) = v37;
    *(_OWORD *)(v36 + 96) = a1[4];
    long long v38 = a1[1];
    *(_OWORD *)(v36 + 32) = *a1;
    *(_OWORD *)(v36 + 48) = v38;
    sub_1000235B0((uint64_t)a1);
    uint64_t v39 = sub_100049FE8();
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v39;
    *(void *)(v40 + 24) = &protocol witness table for MainActor;
    long long v41 = a1[3];
    *(_OWORD *)(v40 + 64) = a1[2];
    *(_OWORD *)(v40 + 80) = v41;
    *(_OWORD *)(v40 + 96) = a1[4];
    long long v42 = a1[1];
    *(_OWORD *)(v40 + 32) = *a1;
    *(_OWORD *)(v40 + 48) = v42;
    sub_100048FA8();
    uint64_t v80 = v20;
    sub_100049D18();
    long long v103 = *a1;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    uint64_t v43 = (uint64_t)v83;
    sub_100049278();
    swift_release();
    swift_release();
    sub_100023568((uint64_t)&v103);
    int v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v43, 1, v85);
    uint64_t v45 = (uint64_t)v88;
    uint64_t v46 = v87;
    uint64_t v47 = v81;
    if (v44 == 1)
    {
      sub_100048DA8();
      sub_1000054EC(v43, &qword_10005D818);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v82, v43, v85);
    }
    sub_10001EE58((void (*)(uint64_t, uint64_t))sub_10002735C, "Unable to get list of target locales from viewModel");
    uint64_t v50 = v79;
    sub_100049188();
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    uint64_t v52 = v50;
    uint64_t v49 = v86;
    v51(v47, v52, v86);
    v51(v46, v47, v49);
    uint64_t v48 = 0;
  }
  else
  {
    uint64_t v48 = 1;
    uint64_t v45 = (uint64_t)v88;
    uint64_t v46 = v87;
    uint64_t v49 = v86;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v46, v48, 1, v49);
  long long v102 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v53 = (uint64_t)v46;
  swift_retain();
  uint64_t v54 = (uint64_t)v89;
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v102);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v102);
  uint64_t v55 = v99;
  uint64_t v56 = v100;
  uint64_t KeyPath = swift_getKeyPath();
  sub_100005424(v54, (uint64_t)v5, &qword_10005D818);
  uint64_t v58 = &v5[v3[5]];
  *(void *)uint64_t v58 = v55;
  *((void *)v58 + 1) = v56;
  v5[v3[6]] = 0;
  uint64_t v59 = &v5[v3[7]];
  *(void *)uint64_t v59 = 0x74616C736E617254;
  *((void *)v59 + 1) = 0xEF747865546E6F69;
  uint64_t v60 = &v5[v3[8]];
  LOBYTE(v98) = 0;
  sub_100049C88();
  uint64_t v61 = v100;
  *uint64_t v60 = v99;
  *((void *)v60 + 1) = v61;
  uint64_t v62 = &v5[v3[9]];
  *(void *)uint64_t v62 = 0;
  *((void *)v62 + 1) = 0;
  v62[16] = 0;
  uint64_t v63 = &v5[v3[10]];
  *(void *)uint64_t v63 = KeyPath;
  *((void *)v63 + 1) = 0;
  v63[16] = 0;
  long long v98 = a1[3];
  sub_100004334(&qword_10005E278);
  sub_100049CB8();
  sub_1000237D4(&qword_10005E2A0, (void (*)(uint64_t))type metadata accessor for LanguageText);
  uint64_t v64 = v93;
  sub_100049A88();
  swift_release();
  swift_release();
  sub_100023AF0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for LanguageText);
  uint64_t v65 = sub_10001E034();
  uint64_t v66 = swift_getKeyPath();
  uint64_t v68 = v95;
  uint64_t v67 = v96;
  uint64_t v69 = (uint64_t)v91;
  (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v91, v64, v96);
  uint64_t v70 = (uint64_t *)(v69 + *(int *)(v92 + 36));
  *uint64_t v70 = v66;
  v70[1] = v65;
  (*(void (**)(char *, uint64_t))(v68 + 8))(v64, v67);
  uint64_t v71 = v94;
  sub_100005424(v69, v94, &qword_10005E288);
  uint64_t v72 = v90;
  sub_100005488(v53, v90, &qword_10005E298);
  sub_100005488(v71, v45, &qword_10005E288);
  uint64_t v73 = v97;
  sub_100005488(v72, v97, &qword_10005E298);
  uint64_t v74 = sub_100004334(&qword_10005E2A8);
  sub_100005488(v45, v73 + *(int *)(v74 + 48), &qword_10005E288);
  sub_1000054EC(v71, &qword_10005E288);
  sub_1000054EC(v53, &qword_10005E298);
  sub_1000054EC(v45, &qword_10005E288);
  return sub_1000054EC(v72, &qword_10005E298);
}

uint64_t sub_1000230D8(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 32);
  swift_retain();
  sub_100048510();
  return sub_100023568((uint64_t)&v2);
}

uint64_t sub_10002311C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001F3C8(a1);
}

uint64_t sub_100023160@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000494D8();
  *a1 = result;
  return result;
}

uint64_t sub_10002318C()
{
  return sub_1000494E8();
}

uint64_t destroy for TranslationCardView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for TranslationCardView(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TranslationCardView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for TranslationCardView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for TranslationCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_release();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationCardView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TranslationCardView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationCardView()
{
  return &type metadata for TranslationCardView;
}

uint64_t sub_1000234B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000234D0()
{
  return sub_1000494F8();
}

uint64_t sub_1000234F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000494D8();
  *a1 = result;
  return result;
}

uint64_t sub_100023524()
{
  return sub_1000494E8();
}

uint64_t sub_100023568(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000235A8()
{
  return sub_1000230D8(v0 + 16);
}

uint64_t sub_1000235B0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100023624()
{
  unint64_t result = qword_10005E238;
  if (!qword_10005E238)
  {
    sub_1000044D8(&qword_10005E200);
    sub_1000236A0();
    sub_100023770();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E238);
  }
  return result;
}

unint64_t sub_1000236A0()
{
  unint64_t result = qword_10005E240;
  if (!qword_10005E240)
  {
    sub_1000044D8(&qword_10005E1F8);
    sub_1000237D4(&qword_10005E248, (void (*)(uint64_t))&type metadata accessor for PlayButton);
    sub_100005584(&qword_10005E060, &qword_10005E068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E240);
  }
  return result;
}

unint64_t sub_100023770()
{
  unint64_t result = qword_10005E250;
  if (!qword_10005E250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E250);
  }
  return result;
}

uint64_t sub_1000237D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100023820@<X0>(uint64_t a1@<X8>)
{
  return sub_10001E5B0((long long *)(v1 + 32), a1);
}

uint64_t sub_100023860(void (*a1)(char *, char *, uint64_t))
{
  return sub_10001E77C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (long long *)(v1 + 32));
}

unint64_t *sub_10002387C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v19 = a2;
  uint64_t v20 = a4;
  uint64_t v5 = v4;
  uint64_t v7 = type metadata accessor for TranslationModel.LocaleInfo(0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v11)
  {
    uint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000388CC(0, v11, 0);
    uint64_t v12 = v21;
    uint64_t v13 = *(void *)(sub_100048E48() - 8);
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    uint64_t v15 = *(void *)(v13 + 72);
    while (1)
    {
      v20(v14, v19);
      if (v5) {
        break;
      }
      uint64_t v5 = 0;
      uint64_t v21 = v12;
      unint64_t v17 = v12[2];
      unint64_t v16 = v12[3];
      if (v17 >= v16 >> 1)
      {
        sub_1000388CC(v16 > 1, v17 + 1, 1);
        uint64_t v12 = v21;
      }
      v12[2] = v17 + 1;
      sub_100023B50((uint64_t)v10, (uint64_t)v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v17);
      v14 += v15;
      if (!--v11) {
        return v12;
      }
    }
    swift_release();
  }
  return v12;
}

uint64_t sub_100023A5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100023A88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100023AF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100023B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationModel.LocaleInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100023BB4()
{
  unint64_t result = qword_10005D820;
  if (!qword_10005D820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005D820);
  }
  return result;
}

uint64_t sub_100023BF8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_100023C50()
{
  return sub_100021A70(v0 + 16);
}

uint64_t sub_100023C58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000494B8();
  *a1 = result;
  return result;
}

uint64_t sub_100023C84()
{
  return sub_1000494C8();
}

unint64_t sub_100023CB0()
{
  unint64_t result = qword_10005E2E8;
  if (!qword_10005E2E8)
  {
    sub_1000044D8(&qword_10005E2B0);
    sub_100023624();
    sub_100005584(&qword_10005D690, &qword_10005D698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E2E8);
  }
  return result;
}

uint64_t sub_100023D5C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001E5B0((long long *)(v1 + 32), a1);
}

uint64_t sub_100023D9C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_100023DFC(uint64_t a1)
{
  return sub_10001E358(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (long long *)(v1 + 32));
}

uint64_t sub_100023E08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049598();
  *a1 = result;
  return result;
}

uint64_t sub_100023E34()
{
  return sub_1000495A8();
}

unint64_t sub_100023E64()
{
  unint64_t result = qword_10005E310;
  if (!qword_10005E310)
  {
    sub_1000044D8(&qword_10005E190);
    sub_100023F04();
    sub_100005584(&qword_10005D550, &qword_10005D518);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E310);
  }
  return result;
}

unint64_t sub_100023F04()
{
  unint64_t result = qword_10005E318;
  if (!qword_10005E318)
  {
    sub_1000044D8(&qword_10005E180);
    sub_100023FA4();
    sub_100005584(&qword_10005D540, &qword_10005D548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E318);
  }
  return result;
}

unint64_t sub_100023FA4()
{
  unint64_t result = qword_10005E320;
  if (!qword_10005E320)
  {
    sub_1000044D8(&qword_10005DDD0);
    sub_100024020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E320);
  }
  return result;
}

unint64_t sub_100024020()
{
  unint64_t result = qword_10005E328;
  if (!qword_10005E328)
  {
    sub_1000044D8(&qword_10005DDC8);
    sub_100005584(&qword_10005E330, &qword_10005E178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E328);
  }
  return result;
}

uint64_t sub_1000240C4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100024138()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20TranslationUIService18TranslationContext__isPopoverPresentation;
  uint64_t v2 = sub_100004334(&qword_10005E428);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000241DC()
{
  return type metadata accessor for TranslationContext();
}

uint64_t type metadata accessor for TranslationContext()
{
  uint64_t result = qword_10005E368;
  if (!qword_10005E368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100024230()
{
  sub_1000242C0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000242C0()
{
  if (!qword_10005E378)
  {
    unint64_t v0 = sub_100049298();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005E378);
    }
  }
}

void *sub_100024318()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100024324@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TranslationContext();
  uint64_t result = sub_100049238();
  *a1 = result;
  return result;
}

uint64_t sub_100024364@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000243E8()
{
  return sub_100049288();
}

void sub_100024460()
{
  uint64_t v1 = sub_100004334(&qword_10005E718);
  __chkstk_darwin(v1 - 8);
  char v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
  if (v4)
  {
    id v5 = v4;
    NSString v6 = sub_100049E78();
    uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest);
    if (v7 && (id v8 = [v7 qssSessionID]) != 0)
    {
      uint64_t v9 = v8;
      sub_100049EA8();

      sub_100048D58();
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_100048D98();
      uint64_t v11 = *(void *)(v10 - 8);
      Class isa = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v3, 1, v10) != 1)
      {
        Class isa = sub_100048D78().super.isa;
        (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v10);
      }
    }
    else
    {
      uint64_t v13 = sub_100048D98();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v3, 1, 1, v13);
      Class isa = 0;
    }
    [v5 cancelWithReason:v6 qssSessionId:isa];
  }
}

void sub_100024650(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100049208();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v132 = (char *)&v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005D818);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v117 = (uint64_t)&v110 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v130 = (uint64_t)&v110 - v10;
  uint64_t v11 = sub_100048E48();
  uint64_t v133 = *(void *)(v11 - 8);
  uint64_t v134 = v11;
  uint64_t v12 = *(void *)(v133 + 64);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v121 = (char *)&v110 - v15;
  __chkstk_darwin(v14);
  uint64_t v129 = (char *)&v110 - v16;
  uint64_t v17 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v110 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = type metadata accessor for TranslationRequestContext();
  uint64_t v122 = *(void *)(v131 - 8);
  uint64_t v20 = __chkstk_darwin(v131);
  uint64_t v120 = (id *)((char *)&v110 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v124 = (uint64_t)&v110 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v127 = (uint64_t)&v110 - v25;
  uint64_t v123 = v26;
  __chkstk_darwin(v24);
  uint64_t v28 = (id *)((char *)&v110 - v27);
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_100009598(v4, (uint64_t)qword_1000605E0);
  sub_10003B57C(a1, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
  uint64_t v119 = v29;
  uint64_t v30 = sub_1000491E8();
  os_log_type_t v31 = sub_10004A068();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v125 = v12;
  int v126 = (char *)&v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = v5;
  if (v32)
  {
    uint64_t v118 = v4;
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134217984;
    long long v116 = (void (*)(char *, char *, uint64_t))a1;
    id v34 = [*v28 length];
    sub_10003A468((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
    v136[0] = (uint64_t)v34;
    uint64_t v4 = v118;
    a1 = (uint64_t)v116;
    sub_10004A1A8();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Starting translation with text of length %ld", v33, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    sub_10003A468((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
  }

  sub_10002E4C4();
  uint64_t v35 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_showConsentOnly;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_showConsentOnly) = *(unsigned char *)(a1 + 8);
  uint64_t v36 = *(void **)a1;
  long long v37 = *(void **)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource);
  *(void *)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource) = *(void *)a1;
  id v38 = v36;

  *(void *)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_ignoredAttributes) = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = v132;
  if (*(unsigned char *)(a1 + 9) == 1)
  {
    if (qword_10005D430 != -1) {
      swift_once();
    }
    sub_100009598(v4, (uint64_t)qword_1000605B0);
    uint64_t v40 = sub_1000491E8();
    os_log_type_t v41 = sub_10004A058();
    if (os_log_type_enabled(v40, v41))
    {
      long long v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Skip first use consent", v42, 2u);
      swift_slowDealloc();
    }

    uint64_t v43 = sub_10004A018();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v19, 1, 1, v43);
    uint64_t v44 = swift_allocObject();
    swift_weakInit();
    sub_100049FF8();
    swift_retain();
    uint64_t v45 = sub_100049FE8();
    uint64_t v46 = (void *)swift_allocObject();
    v46[2] = v45;
    v46[3] = &protocol witness table for MainActor;
    unsigned char v46[4] = v44;
    swift_release();
    sub_100025868((uint64_t)v19, (uint64_t)&unk_10005E800, (uint64_t)v46);
    swift_release();
    goto LABEL_20;
  }
  if ((*(unsigned char *)(v2 + v35) & 1) == 0)
  {
    sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
    uint64_t v52 = (void *)sub_10004A0A8();
    char v53 = sub_10004A0C8();

    if (v53 & 1) != 0 || (uint64_t v54 = (void *)sub_10004A0A8(), v55 = sub_10004A0B8(), v54, (v55))
    {
LABEL_20:
      if (qword_10005D430 != -1) {
        swift_once();
      }
      sub_100009598(v4, (uint64_t)qword_1000605B0);
      uint64_t v56 = sub_1000491E8();
      os_log_type_t v57 = sub_10004A068();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = 67109120;
        sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
        uint64_t v59 = (void *)sub_10004A0A8();
        char v60 = sub_10004A0C8();

        LODWORD(v136[0]) = v60 & 1;
        uint64_t v39 = v132;
        sub_10004A1A8();
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Current user consent: %{BOOL}d", v58, 8u);
        swift_slowDealloc();
      }

      uint64_t v62 = v130;
      uint64_t v61 = v131;
      sub_100005488(a1 + *(int *)(v131 + 48), v130, &qword_10005D818);
      uint64_t v63 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v133 + 48);
      if (v63(v62, 1, v134) == 1)
      {
        sub_1000054EC(v62, &qword_10005D818);
        uint64_t v64 = *(void *)(a1 + *(int *)(v61 + 40) + 8);
        uint64_t v65 = v120;
        sub_10003B57C(a1, (uint64_t)v120, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
        if (!v64)
        {
          id v89 = [*v65 string];
          sub_100049EA8();
        }
        swift_bridgeObjectRetain();
        sub_10003A468((uint64_t)v65, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
        uint64_t v90 = sub_100049ED8();
        uint64_t v92 = v91;
        swift_bridgeObjectRelease();
        uint64_t v93 = sub_10004A018();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v19, 1, 1, v93);
        uint64_t v94 = swift_allocObject();
        swift_weakInit();
        sub_100049FF8();
        swift_retain();
        uint64_t v95 = sub_100049FE8();
        uint64_t v96 = (void *)swift_allocObject();
        v96[2] = v95;
        v96[3] = &protocol witness table for MainActor;
        v96[4] = v90;
        v96[5] = v92;
        v96[6] = v94;
        swift_release();
        sub_100025868((uint64_t)v19, (uint64_t)&unk_10005E7E0, (uint64_t)v96);
        swift_release();
      }
      else
      {
        uint64_t v120 = (id *)v19;
        uint64_t v66 = v133;
        uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v133 + 32);
        uint64_t v68 = v129;
        uint64_t v69 = v62;
        uint64_t v70 = v134;
        uint64_t v130 = v133 + 32;
        long long v116 = v67;
        v67(v129, (char *)v69, v134);
        uint64_t v71 = v128;
        (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v39, v119, v4);
        uint64_t v72 = v66 + 16;
        uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
        uint64_t v74 = v121;
        uint64_t v119 = v72;
        uint64_t v115 = v73;
        v73(v121, v68, v70);
        uint64_t v75 = v127;
        sub_10003B57C(a1, v127, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
        uint64_t v76 = sub_1000491E8();
        int v113 = sub_10004A098();
        if (os_log_type_enabled(v76, (os_log_type_t)v113))
        {
          os_log_t v112 = v76;
          uint64_t v118 = v4;
          uint64_t v77 = swift_slowAlloc();
          uint64_t v111 = swift_slowAlloc();
          v136[0] = v111;
          *(_DWORD *)uint64_t v77 = 136446466;
          uint64_t v78 = sub_100048DB8();
          uint64_t v135 = sub_1000095FC(v78, v79, v136);
          sub_10004A1A8();
          swift_bridgeObjectRelease();
          uint64_t v80 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
          uint64_t v114 = (v133 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          uint64_t v81 = v74;
          uint64_t v82 = v80;
          uint64_t v83 = v134;
          v80((uint64_t)v81, v134);
          *(_WORD *)(v77 + 12) = 2082;
          uint64_t v84 = v117;
          sub_100005488(v75 + *(int *)(v131 + 52), v117, &qword_10005D818);
          if (v63(v84, 1, v83) == 1)
          {
            sub_1000054EC(v84, &qword_10005D818);
            unint64_t v85 = 0xE500000000000000;
            uint64_t v86 = 0x3E6C696E3CLL;
          }
          else
          {
            uint64_t v86 = sub_100048DB8();
            unint64_t v85 = v97;
            v82(v84, v134);
          }
          uint64_t v98 = v128;
          uint64_t v135 = sub_1000095FC(v86, v85, v136);
          sub_10004A1A8();
          swift_bridgeObjectRelease();
          sub_10003A468(v127, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
          os_log_t v99 = v112;
          _os_log_impl((void *)&_mh_execute_header, v112, (os_log_type_t)v113, "Using host specified locales: %{public}s to %{public}s", (uint8_t *)v77, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v98 + 8))(v132, v118);
        }
        else
        {
          uint64_t v87 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
          uint64_t v114 = (v133 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          uint64_t v88 = v74;
          uint64_t v82 = v87;
          v87((uint64_t)v88, v134);
          sub_10003A468(v75, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);

          (*(void (**)(char *, uint64_t))(v71 + 8))(v39, v4);
        }
        uint64_t v100 = sub_10004A018();
        uint64_t v101 = (uint64_t)v120;
        (*(void (**)(id *, uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v120, 1, 1, v100);
        uint64_t v102 = swift_allocObject();
        swift_weakInit();
        long long v103 = v126;
        uint64_t v104 = v129;
        uint64_t v105 = v134;
        v115(v126, v129, v134);
        uint64_t v106 = v124;
        sub_10003B57C(a1, v124, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
        unint64_t v107 = (*(unsigned __int8 *)(v133 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80);
        unint64_t v108 = (v125 + *(unsigned __int8 *)(v122 + 80) + v107) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80);
        uint64_t v109 = (char *)swift_allocObject();
        *((void *)v109 + 2) = 0;
        *((void *)v109 + 3) = 0;
        *((void *)v109 + 4) = v102;
        v116(&v109[v107], v103, v105);
        sub_10000A190(v106, (uint64_t)&v109[v108]);
        sub_10002A5D4(v101, (uint64_t)&unk_10005E7F0, (uint64_t)v109);
        swift_release();
        sub_1000054EC(v101, &qword_10005D968);
        v82((uint64_t)v104, v105);
      }
      return;
    }
  }
  if (qword_10005D430 != -1) {
    swift_once();
  }
  sub_100009598(v4, (uint64_t)qword_1000605B0);
  uint64_t v47 = sub_1000491E8();
  os_log_type_t v48 = sub_10004A098();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Showing first use consent to user", v49, 2u);
    swift_slowDealloc();
  }

  *(unsigned char *)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_waitingForUserConsent) = 1;
  LOBYTE(v136[0]) = 4;
  v136[1] = 0;
  v136[2] = 0xE000000000000000;
  v136[3] = 0;
  v136[4] = 0;
  NSString v50 = sub_100049E78();
  sub_100046D94();
  sub_10000A3C8(0, (unint64_t *)&qword_10005D8B8);
  Class isa = sub_100049E28().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

uint64_t sub_1000256A8()
{
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100049208();
  sub_100009598(v0, (uint64_t)qword_1000605E0);
  uint64_t v1 = sub_1000491E8();
  os_log_type_t v2 = sub_10004A058();
  if (os_log_type_enabled(v1, v2))
  {
    char v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Cancelling TTS audio", v3, 2u);
    swift_slowDealloc();
  }

  swift_retain();
  sub_1000480D8();
  swift_release();
  swift_retain();
  sub_1000480D8();

  return swift_release();
}

uint64_t sub_1000257D0()
{
  return sub_1000257F8();
}

uint64_t sub_1000257E4()
{
  return sub_1000257F8();
}

uint64_t sub_1000257F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();

  return swift_release();
}

uint64_t sub_100025868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004A018();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10004A008();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000054EC(a1, &qword_10005D968);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100049FD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100025A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004A018();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10004A008();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000054EC(a1, &qword_10005D968);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100049FD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_100004334(&qword_10005E818);
  return swift_task_create();
}

uint64_t sub_100025BC8()
{
  return sub_100026294();
}

uint64_t sub_100025BDC()
{
  return sub_100028328();
}

void *sub_100025BF0()
{
  uint64_t v32 = sub_100049058();
  uint64_t v1 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  char v3 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult);
  uint64_t v5 = _swiftEmptyArrayStorage;
  if (!v4) {
    return v5;
  }
  os_log_type_t v31 = v3;
  v28[0] = v4;
  id v6 = [v28[0] translations];
  sub_10000A3C8(0, &qword_10005E7B8);
  unint64_t v7 = sub_100049F68();

  unint64_t v34 = (unint64_t)_swiftEmptyArrayStorage;
  if (v7 >> 62) {
    goto LABEL_24;
  }
  uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = (void *)swift_bridgeObjectRetain();
  if (!v8)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    unint64_t v17 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_26:
    swift_bridgeObjectRelease();
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_10004A2A8();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v18)
      {
LABEL_28:
        unint64_t v34 = (unint64_t)_swiftEmptyArrayStorage;
        uint64_t result = (void *)sub_100038944(0, v18 & ~(v18 >> 63), 0);
        if (v18 < 0) {
          goto LABEL_41;
        }
        uint64_t v19 = 0;
        uint64_t v5 = (void *)v34;
        v28[1] = (id)(v1 + 32);
        unint64_t v29 = v17 & 0xC000000000000001;
        uint64_t v30 = (void *)v17;
        do
        {
          if (v29) {
            id v20 = (id)sub_10004A268();
          }
          else {
            id v20 = *(id *)(v17 + 8 * v19 + 32);
          }
          uint64_t v21 = v20;
          id v22 = [v20 definition];
          sub_100049EA8();

          id v23 = [v21 labels];
          uint64_t v24 = sub_100049F68();

          uint64_t v33 = v24;
          sub_100004334(&qword_10005E160);
          sub_100005584((unint64_t *)&qword_10005E168, &qword_10005E160);
          sub_100049E58();
          swift_bridgeObjectRelease();
          uint64_t v25 = v31;
          sub_100049048();

          unint64_t v34 = (unint64_t)v5;
          unint64_t v27 = v5[2];
          unint64_t v26 = v5[3];
          if (v27 >= v26 >> 1)
          {
            sub_100038944(v26 > 1, v27 + 1, 1);
            uint64_t v5 = (void *)v34;
          }
          ++v19;
          v5[2] = v27 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))((unint64_t)v5+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v27, v25, v32);
          unint64_t v17 = (unint64_t)v30;
        }
        while (v18 != v19);
        swift_bridgeObjectRelease();

        return v5;
      }
    }
    swift_bridgeObjectRelease();

    return _swiftEmptyArrayStorage;
  }
  while (v8 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = (v7 & 0xC000000000000001) != 0 ? (id)sub_10004A268() : *(id *)(v7 + 8 * v10 + 32);
      uint64_t v12 = v11;
      id v13 = [v11 senses];
      sub_10000A3C8(0, &qword_10005E8E8);
      unint64_t v14 = sub_100049F68();

      if (v14 >> 62) {
        break;
      }
      if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_13;
      }
LABEL_6:

      swift_bridgeObjectRelease();
LABEL_7:
      if (v8 == ++v10)
      {
        swift_bridgeObjectRelease();
        unint64_t v17 = v34;
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_10004A2A8();
    swift_bridgeObjectRelease();
    if (!v16) {
      goto LABEL_6;
    }
LABEL_13:
    if ((v14 & 0xC000000000000001) != 0)
    {
      sub_10004A268();
      goto LABEL_16;
    }
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v15 = *(id *)(v14 + 32);
LABEL_16:

      swift_bridgeObjectRelease();
      sub_100049F48();
      if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100049FA8();
      }
      sub_100049FC8();
      sub_100049F88();
      goto LABEL_7;
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_10004A2A8();
    uint64_t v8 = (uint64_t)result;
    if (!result) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100026118()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10002618C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10002620C()
{
  return sub_100049288();
}

uint64_t sub_100026280()
{
  return sub_100026294();
}

uint64_t sub_100026294()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100026300()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100026374()
{
  sub_10000A3C8(0, &qword_10005E8F8);
  uint64_t result = sub_10004A188();
  qword_100060610 = result;
  return result;
}

unint64_t sub_1000263E4()
{
  unint64_t v1 = 0xD000000000000013;
  uint64_t v2 = sub_100048EA8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TranslationModel.TranslationError(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10003B57C(v0, (uint64_t)v8, type metadata accessor for TranslationModel.TranslationError);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, v2);
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_10004A248(38);
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000024;
      unint64_t v15 = 0x8000000100055240;
      sub_100038884(&qword_10005E878, (void (*)(uint64_t))&type metadata accessor for LocalePair);
      v16._countAndFlagsBits = sub_10004A2E8();
      sub_100049F18(v16);
      swift_bridgeObjectRelease();
      unint64_t v1 = v14;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
    case 2u:
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_10004A248(42);
      v17._countAndFlagsBits = 0xD000000000000028;
      v17._object = (void *)0x8000000100055210;
      sub_100049F18(v17);
      sub_10004A048();
      goto LABEL_11;
    case 3u:
      return v1;
    case 4u:
      unint64_t v1 = 0xD000000000000021;
      break;
    default:
      uint64_t v9 = *v8;
      uint64_t v10 = (void *)v8[1];
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_10004A248(23);
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000015;
      unint64_t v15 = 0x8000000100055270;
      if (v10) {
        v11._countAndFlagsBits = v9;
      }
      else {
        v11._countAndFlagsBits = 7104878;
      }
      if (v10) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = (void *)0xE300000000000000;
      }
      v11._object = v12;
      sub_100049F18(v11);
      swift_bridgeObjectRelease();
LABEL_11:
      unint64_t v1 = v14;
      break;
  }
  return v1;
}

uint64_t sub_100026710()
{
  return sub_10002674C();
}

uint64_t sub_100026738()
{
  return sub_10002674C();
}

uint64_t sub_10002674C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

double sub_1000267B8@<D0>(_OWORD *a1@<X8>)
{
  return sub_1000267F4(a1);
}

uint64_t sub_1000267CC()
{
  return sub_100026884();
}

double sub_1000267E0@<D0>(_OWORD *a1@<X8>)
{
  return sub_1000267F4(a1);
}

double sub_1000267F4@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100026870()
{
  return sub_100026884();
}

uint64_t sub_100026884()
{
  return sub_100049288();
}

BOOL sub_100026904(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10002691C()
{
  Swift::UInt v1 = *v0;
  sub_10004A378();
  sub_10004A388(v1);
  return sub_10004A3A8();
}

void sub_100026964()
{
  sub_10004A388(*v0);
}

Swift::Int sub_100026990()
{
  Swift::UInt v1 = *v0;
  sub_10004A378();
  sub_10004A388(v1);
  return sub_10004A3A8();
}

uint64_t sub_1000269D4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100026A54()
{
  return sub_100049288();
}

uint64_t sub_100026AC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100026B3C()
{
  return sub_100028328();
}

uint64_t sub_100026B50()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100048E58();
  __chkstk_darwin(v2);
  uint64_t v5 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___languagesService;
  if (*(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___languagesService))
  {
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___languagesService);
  }
  else
  {
    (*(void (**)(char *, void))(v4 + 104))((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for TranslationTaskHint.system(_:));
    sub_100048FE8();
    swift_allocObject();
    uint64_t v6 = sub_100048FC8();
    *(void *)(v1 + v5) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_100026C74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v52 = sub_100048F68();
  uint64_t v55 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  NSString v50 = &v47[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v54 = sub_100004334(&qword_10005D998);
  __chkstk_darwin(v54);
  uint64_t v58 = &v47[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100004334(&qword_10005D9A0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v51 = &v47[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v47[-v11];
  __chkstk_darwin(v10);
  os_log_type_t v57 = &v47[-v13];
  uint64_t v14 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v14 - 8);
  Swift::String v16 = &v47[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_100048E48();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = &v47[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v53 = a2;
  sub_100049278();
  swift_release();
  swift_release();
  int v21 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  uint64_t v59 = a1;
  if (v21 == 1)
  {
    sub_1000054EC((uint64_t)v16, &qword_10005D818);
    int v22 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 32))(v20, v16, v17);
    id v23 = objc_allocWithZone((Class)_LTLocalePair);
    Class isa = sub_100048E18().super.isa;
    Class v25 = sub_100048E18().super.isa;
    id v26 = [v23 initWithSourceLocale:isa targetLocale:v25];

    LODWORD(v25) = [v26 isVariantPair];
    (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v20, v17);
    int v22 = v25 ^ 1;
  }
  uint64_t v28 = v57;
  unint64_t v27 = v58;
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  unint64_t v29 = (void *)sub_10004A0A8();
  char v30 = sub_10004A0B8();

  if ((v30 & 1) == 0)
  {
    char v38 = v22;
    uint64_t v36 = v56;
    uint64_t v37 = v59;
    goto LABEL_16;
  }
  int v48 = v22;
  uint64_t v49 = v17;
  sub_100026B50();
  sub_100048FD8();
  swift_release();
  sub_100049F98();
  swift_bridgeObjectRelease();
  uint64_t v31 = v55;
  uint64_t v32 = v52;
  (*(void (**)(unsigned char *, void, uint64_t))(v55 + 104))(v12, enum case for LanguageState.installed(_:), v52);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v31 + 56))(v12, 0, 1, v32);
  uint64_t v33 = (uint64_t)&v27[*(int *)(v54 + 48)];
  sub_100005488((uint64_t)v28, (uint64_t)v27, &qword_10005D9A0);
  uint64_t v34 = v31;
  sub_100005488((uint64_t)v12, v33, &qword_10005D9A0);
  uint64_t v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  if (v35((uint64_t)v27, 1, v32) != 1)
  {
    uint64_t v39 = (uint64_t)v27;
    uint64_t v40 = v51;
    sub_100005488(v39, (uint64_t)v51, &qword_10005D9A0);
    if (v35(v33, 1, v32) != 1)
    {
      long long v42 = v40;
      uint64_t v43 = v50;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v34 + 32))(v50, v33, v32);
      sub_100038884(&qword_10005D9B0, (void (*)(uint64_t))&type metadata accessor for LanguageState);
      char v38 = sub_100049E68();
      uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v34 + 8);
      v44(v43, v32);
      os_log_type_t v41 = &qword_10005D9A0;
      sub_1000054EC((uint64_t)v12, &qword_10005D9A0);
      sub_1000054EC((uint64_t)v57, &qword_10005D9A0);
      v44(v42, v32);
LABEL_14:
      uint64_t v36 = v56;
      uint64_t v37 = v59;
      uint64_t v17 = v49;
      char v45 = v48;
      sub_1000054EC((uint64_t)v58, v41);
      if (v45) {
        goto LABEL_16;
      }
LABEL_15:
      char v38 = 0;
      goto LABEL_16;
    }
    sub_1000054EC((uint64_t)v12, &qword_10005D9A0);
    sub_1000054EC((uint64_t)v57, &qword_10005D9A0);
    (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v40, v32);
LABEL_12:
    char v38 = 0;
    os_log_type_t v41 = &qword_10005D998;
    goto LABEL_14;
  }
  sub_1000054EC((uint64_t)v12, &qword_10005D9A0);
  sub_1000054EC((uint64_t)v28, &qword_10005D9A0);
  if (v35(v33, 1, v32) != 1) {
    goto LABEL_12;
  }
  sub_1000054EC((uint64_t)v27, &qword_10005D9A0);
  uint64_t v36 = v56;
  uint64_t v37 = v59;
  uint64_t v17 = v49;
  if ((v48 & 1) == 0) {
    goto LABEL_15;
  }
  char v38 = 1;
LABEL_16:
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v36, v37, v17);
  uint64_t result = type metadata accessor for TranslationModel.LocaleInfo(0);
  *(unsigned char *)(v36 + *(int *)(result + 20)) = v38 & 1;
  return result;
}

uint64_t sub_10002735C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v47 = sub_100048F68();
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v43 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100004334(&qword_10005D998);
  __chkstk_darwin(v46);
  uint64_t v50 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004334(&qword_10005D9A0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v44 = (uint64_t)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v48 = (uint64_t)&v41 - v9;
  __chkstk_darwin(v8);
  uint64_t v49 = (uint64_t)&v41 - v10;
  uint64_t v11 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100048E48();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14);
  uint64_t v52 = a1;
  if (v18 == 1)
  {
    sub_1000054EC((uint64_t)v13, &qword_10005D818);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    id v19 = objc_allocWithZone((Class)_LTLocalePair);
    Class isa = sub_100048E18().super.isa;
    Class v21 = sub_100048E18().super.isa;
    id v22 = [v19 initWithSourceLocale:isa targetLocale:v21];

    LOBYTE(v21) = [v22 isVariantPair];
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if (v21)
    {
      char v23 = 0;
      goto LABEL_16;
    }
  }
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  uint64_t v24 = (void *)sub_10004A0A8();
  char v25 = sub_10004A0B8();

  if (v25)
  {
    uint64_t v42 = v14;
    sub_100026B50();
    sub_100048FD8();
    swift_release();
    uint64_t v26 = v49;
    sub_100049F98();
    swift_bridgeObjectRelease();
    uint64_t v27 = v45;
    uint64_t v29 = v47;
    uint64_t v28 = v48;
    (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v48, enum case for LanguageState.installed(_:), v47);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v28, 0, 1, v29);
    uint64_t v30 = v50;
    uint64_t v31 = v50 + *(int *)(v46 + 48);
    sub_100005488(v26, v50, &qword_10005D9A0);
    sub_100005488(v28, v31, &qword_10005D9A0);
    uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
    if (v32(v30, 1, v29) == 1)
    {
      uint64_t v33 = v28;
      uint64_t v34 = &qword_10005D9A0;
      sub_1000054EC(v33, &qword_10005D9A0);
      sub_1000054EC(v26, &qword_10005D9A0);
      if (v32(v31, 1, v29) == 1)
      {
        char v23 = -1;
      }
      else
      {
        uint64_t v34 = &qword_10005D998;
        char v23 = 0;
      }
      uint64_t v14 = v42;
    }
    else
    {
      uint64_t v35 = v44;
      sub_100005488(v30, v44, &qword_10005D9A0);
      unsigned int v36 = v32(v31, 1, v29);
      uint64_t v14 = v42;
      if (v36 == 1)
      {
        sub_1000054EC(v28, &qword_10005D9A0);
        sub_1000054EC(v49, &qword_10005D9A0);
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v35, v29);
        char v23 = 0;
        uint64_t v34 = &qword_10005D998;
      }
      else
      {
        uint64_t v37 = v43;
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v43, v31, v29);
        sub_100038884(&qword_10005D9B0, (void (*)(uint64_t))&type metadata accessor for LanguageState);
        char v23 = sub_100049E68();
        char v38 = *(void (**)(char *, uint64_t))(v27 + 8);
        v38(v37, v29);
        uint64_t v34 = &qword_10005D9A0;
        sub_1000054EC(v48, &qword_10005D9A0);
        sub_1000054EC(v49, &qword_10005D9A0);
        v38((char *)v35, v29);
      }
    }
    sub_1000054EC(v50, v34);
  }
  else
  {
    char v23 = 1;
  }
LABEL_16:
  uint64_t v39 = v51;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v51, v52, v14);
  uint64_t result = type metadata accessor for TranslationModel.LocaleInfo(0);
  *(unsigned char *)(v39 + *(int *)(result + 20)) = v23 & 1;
  return result;
}

uint64_t sub_100027A1C()
{
  return sub_100028328();
}

id sub_100027A30()
{
  uint64_t v1 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___sharedFavorites;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___sharedFavorites);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___sharedFavorites);
  }
  else
  {
    uint64_t v4 = v0;
    sub_1000490D8();
    uint64_t v5 = (void *)sub_100049088();
    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

uint64_t sub_100027AA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v49 = a1;
  uint64_t v3 = sub_100004334(&qword_10005E9F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v51 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100048C98();
  uint64_t v5 = *(void *)(v46 - 8);
  uint64_t v6 = __chkstk_darwin(v46);
  uint64_t v42 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v40 = (char *)&v39 - v8;
  uint64_t v9 = sub_100048E48();
  uint64_t v52 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004334(&qword_10005D818);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = sub_100048CF8();
  uint64_t v47 = *(void *)(v18 - 8);
  uint64_t v48 = v18;
  __chkstk_darwin(v18);
  id v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100048CE8();
  sub_100048CD8();
  sub_100004334(&qword_10005E8D8);
  uint64_t v44 = *(void *)(v5 + 72);
  uint64_t v45 = v5;
  unint64_t v21 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  unint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_10004B740;
  unint64_t v43 = v21;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100048C88();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v50 = v2;
  sub_100049278();
  uint64_t v23 = v52;
  swift_release();
  swift_release();
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v17, 1, v9);
  uint64_t v41 = v11;
  if (v25)
  {
    sub_1000054EC((uint64_t)v17, &qword_10005D818);
    uint64_t v26 = v23;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v11, v17, v9);
    sub_1000054EC((uint64_t)v17, &qword_10005D818);
    sub_100048DC8();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v23 + 8);
    uint64_t v39 = v9;
    v27(v11, v9);
    uint64_t v28 = v40;
    sub_100048C88();
    swift_bridgeObjectRelease();
    unint64_t v30 = *(void *)(v22 + 16);
    unint64_t v29 = *(void *)(v22 + 24);
    if (v30 >= v29 >> 1) {
      unint64_t v22 = sub_100037E7C(v29 > 1, v30 + 1, 1, v22);
    }
    *(void *)(v22 + 16) = v30 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))(v22 + v43 + v30 * v44, v28, v46);
    uint64_t v26 = v52;
    uint64_t v9 = v39;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  if (v24(v15, 1, v9))
  {
    sub_1000054EC((uint64_t)v15, &qword_10005D818);
    uint64_t v31 = v51;
  }
  else
  {
    uint64_t v32 = v41;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v41, v15, v9);
    sub_1000054EC((uint64_t)v15, &qword_10005D818);
    sub_100048DC8();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v9);
    uint64_t v33 = v42;
    sub_100048C88();
    swift_bridgeObjectRelease();
    unint64_t v35 = *(void *)(v22 + 16);
    unint64_t v34 = *(void *)(v22 + 24);
    if (v35 >= v34 >> 1) {
      unint64_t v22 = sub_100037E7C(v34 > 1, v35 + 1, 1, v22);
    }
    uint64_t v31 = v51;
    *(void *)(v22 + 16) = v35 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))(v22 + v43 + v35 * v44, v33, v46);
  }
  swift_bridgeObjectRetain();
  sub_100048CA8();
  sub_100048CC8();
  uint64_t v36 = sub_100048D48();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v31, 1, v36);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v20, v48);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v49, v31, v36);
  }
  return result;
}

uint64_t sub_1000281C0()
{
  uint64_t v0 = type metadata accessor for TranslationModel.TranslationError(0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  if (v5[1])
  {
    sub_100004334(&qword_10005E858);
    if (swift_dynamicCast())
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 4)
      {
LABEL_6:
        swift_errorRelease();
        return 1;
      }
      if (!EnumCaseMultiPayload)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      sub_10003A468((uint64_t)v2, type metadata accessor for TranslationModel.TranslationError);
    }
    swift_errorRelease();
  }
  return 0;
}

uint64_t sub_100028314()
{
  return sub_100028328();
}

uint64_t sub_100028328()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100028394()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100004334(&qword_10005E720);
  uint64_t v152 = *(void *)(v2 - 8);
  uint64_t v153 = v2;
  __chkstk_darwin(v2);
  uint64_t v151 = (char *)&v118 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_100004334(&qword_10005E728);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  v148 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_100004334(&qword_10005E730);
  uint64_t v142 = *(void *)(v144 - 8);
  uint64_t v5 = __chkstk_darwin(v144);
  v139 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v138 = (char *)&v118 - v7;
  uint64_t v143 = sub_100004334(&qword_10005E738);
  uint64_t v141 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  uint64_t v140 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = sub_100004334(&qword_10005E740);
  uint64_t v146 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  v145 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_10004A148();
  uint64_t v136 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v135 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v11 - 8);
  uint64_t v134 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_100004334(&qword_10005E710);
  uint64_t v132 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  uint64_t v131 = (char *)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_100004334(&qword_10005E708);
  uint64_t v129 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  uint64_t v128 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100004334(&qword_10005E700);
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  uint64_t v124 = (char *)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100049038();
  uint64_t v123 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  uint64_t v122 = (char *)&v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100004334(&qword_10005E428);
  uint64_t v166 = *(void *)(v17 - 8);
  uint64_t v167 = v17;
  __chkstk_darwin(v17);
  uint64_t v161 = (char *)&v118 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_100004334(&qword_10005E6F8);
  uint64_t v163 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  uint64_t v119 = (char *)&v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100004334(&qword_10005E6F0);
  uint64_t v164 = *(void *)(v20 - 8);
  uint64_t v165 = v20;
  __chkstk_darwin(v20);
  uint64_t v155 = (char *)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_100004334(&qword_10005D818);
  uint64_t v22 = __chkstk_darwin(v154);
  uint64_t v120 = (char *)&v118 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v159 = (void (*)(uint64_t, char *, uint64_t))((char *)&v118 - v25);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v118 - v26;
  uint64_t v160 = sub_100004334(&qword_10005E6E8);
  uint64_t v28 = *(void *)(v160 - 8);
  __chkstk_darwin(v160);
  unint64_t v30 = (char *)&v118 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100004334(&qword_10005E6E0);
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  unint64_t v34 = (char *)&v118 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__suggestedLocales;
  uint64_t v168 = 0;
  sub_100004334(&qword_10005D970);
  sub_100049258();
  uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 32);
  v36(v35, v34, v31);
  uint64_t v37 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__lowConfidenceLocales;
  uint64_t v168 = 0;
  sub_100049258();
  v36(v37, v34, v31);
  uint64_t v38 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__error;
  uint64_t v168 = 0;
  sub_100004334(&qword_10005E530);
  sub_100049258();
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v38, v30, v160);
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_ignoredAttributes) = &_swiftEmptyArrayStorage;
  uint64_t v39 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__sourceLocale;
  uint64_t v40 = sub_100048E48();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v43 = 1;
  uint64_t v157 = v40;
  uint64_t v158 = v42;
  uint64_t v160 = v41 + 56;
  ((void (*)(char *, uint64_t, uint64_t))v42)(v27, 1, 1);
  sub_100005488((uint64_t)v27, (uint64_t)v159, &qword_10005D818);
  uint64_t v44 = v155;
  sub_100049258();
  uint64_t v121 = v27;
  sub_1000054EC((uint64_t)v27, &qword_10005D818);
  uint64_t v45 = *(void (**)(uint64_t, char *, uint64_t))(v164 + 32);
  uint64_t v133 = v39;
  v164 += 32;
  v45(v39, v44, v165);
  uint64_t v46 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__sourceText;
  uint64_t v168 = 0;
  uint64_t v169 = 0;
  sub_100004334(&qword_10005D830);
  uint64_t v47 = v119;
  sub_100049258();
  uint64_t v48 = *(void (**)(uint64_t, char *, uint64_t))(v163 + 32);
  uint64_t v49 = v47;
  v163 += 32;
  v48(v46, v47, v156);
  uint64_t v50 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__sourceLocaleWasDetected;
  LOBYTE(v168) = 0;
  uint64_t v51 = v161;
  sub_100049258();
  uint64_t v52 = *(void (**)(uint64_t, char *, uint64_t))(v166 + 32);
  v166 += 32;
  v159 = v52;
  v52(v50, v51, v167);
  uint64_t v53 = v123;
  uint64_t v54 = v122;
  uint64_t v55 = v127;
  (*(void (**)(char *, void, uint64_t))(v123 + 104))(v122, enum case for TranslateFeatures.refreshedSystemTranslation(_:), v127);
  LOBYTE(v50) = sub_100049028();
  uint64_t v56 = v54;
  uint64_t v57 = (uint64_t)v120;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v56, v55);
  if (v50)
  {
    sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
    uint64_t v58 = (void *)sub_10004A0A8();
    sub_10004A0E8();
    uint64_t v60 = v59;

    if (v60)
    {
      sub_100048DA8();
      uint64_t v43 = 0;
    }
    else
    {
      uint64_t v43 = 1;
    }
  }
  v158(v57, v43, 1, v157);
  uint64_t v61 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__targetLocale;
  uint64_t v127 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__targetLocale;
  sub_100005488(v57, (uint64_t)v121, &qword_10005D818);
  uint64_t v62 = v155;
  sub_100049258();
  sub_1000054EC(v57, &qword_10005D818);
  v45(v61, v62, v165);
  uint64_t v63 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__targetText;
  uint64_t v168 = 0;
  uint64_t v169 = 0;
  sub_100049258();
  v48(v63, v49, v156);
  uint64_t v64 = (void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_consentHandler);
  *uint64_t v64 = 0;
  v64[1] = 0;
  uint64_t v65 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__translationAnnotation;
  LOBYTE(v168) = 2;
  sub_100004334(&qword_10005E550);
  uint64_t v66 = v124;
  sub_100049258();
  (*(void (**)(uint64_t, char *, uint64_t))(v125 + 32))(v65, v66, v126);
  uint64_t v67 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__availableLocales;
  uint64_t v168 = &_swiftEmptyArrayStorage;
  sub_100004334(&qword_10005E560);
  uint64_t v68 = v128;
  sub_100049258();
  (*(void (**)(uint64_t, char *, uint64_t))(v129 + 32))(v67, v68, v130);
  uint64_t v69 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__replacementAvailable;
  LOBYTE(v168) = 0;
  uint64_t v70 = v161;
  sub_100049258();
  uint64_t v71 = v167;
  uint64_t v72 = v159;
  v159(v69, v70, v167);
  uint64_t v73 = v72;
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___languagesService) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_showConsentOnly) = 0;
  uint64_t v74 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__firstUseConsent;
  uint64_t v154 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__firstUseConsent;
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  uint64_t v75 = (void *)sub_10004A0A8();
  LOBYTE(v61) = sub_10004A0C8();

  LOBYTE(v168) = v61 & 1;
  sub_100049258();
  v73(v74, v70, v71);
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult) = 0;
  uint64_t v76 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__selectedDisambiguation;
  uint64_t v163 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__selectedDisambiguation;
  uint64_t v168 = 0;
  uint64_t v77 = v131;
  sub_100049258();
  (*(void (**)(uint64_t, char *, uint64_t))(v132 + 32))(v76, v77, v162);
  uint64_t v78 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_cplIntervalID;
  uint64_t v79 = sub_1000491C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v78, 1, 1, v79);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_waitingForUserConsent) = 0;
  uint64_t v164 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_subscriptions;
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_subscriptions) = &_swiftEmptyArrayStorage;
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel____lazy_storage___sharedFavorites) = 0;
  uint64_t v80 = (void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier);
  *uint64_t v80 = 0;
  v80[1] = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_requestOrigin) = 0;
  uint64_t v81 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_originalPlayer;
  uint64_t v156 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_originalPlayer;
  type metadata accessor for VoicePlayback();
  uint64_t v82 = swift_allocObject();
  LOBYTE(v168) = 0;
  sub_100049258();
  uint64_t v83 = (void *)(v82 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier);
  *uint64_t v83 = 0;
  v83[1] = 0;
  uint64_t v84 = (void *)(v82 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation);
  *uint64_t v84 = 0;
  v84[1] = 0;
  unint64_t v85 = (void *)(v82 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_text);
  *unint64_t v85 = 0;
  v85[1] = 0;
  uint64_t v87 = v157;
  uint64_t v86 = v158;
  v158(v82 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale, 1, 1, v157);
  uint64_t v88 = (void *)(v82 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID);
  *uint64_t v88 = 0;
  v88[1] = 0;
  *(void *)(v1 + v81) = v82;
  uint64_t v89 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationPlayer;
  uint64_t v155 = (char *)OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationPlayer;
  uint64_t v90 = swift_allocObject();
  LOBYTE(v168) = 0;
  sub_100049258();
  uint64_t v91 = (void *)(v90 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier);
  *uint64_t v91 = 0;
  v91[1] = 0;
  uint64_t v92 = (void *)(v90 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation);
  *uint64_t v92 = 0;
  v92[1] = 0;
  uint64_t v93 = (void *)(v90 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_text);
  *uint64_t v93 = 0;
  v93[1] = 0;
  v86(v90 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale, 1, 1, v87);
  uint64_t v94 = (void *)(v90 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID);
  *uint64_t v94 = 0;
  v94[1] = 0;
  *(void *)(v1 + v89) = v90;
  uint64_t v95 = v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__isFavorite;
  LOBYTE(v168) = 0;
  sub_100049258();
  v159(v95, v70, v167);
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest) = 0;
  uint64_t v96 = sub_10004A018();
  uint64_t v97 = (uint64_t)v134;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v134, 1, 1, v96);
  sub_100049FF8();
  swift_retain();
  uint64_t v98 = sub_100049FE8();
  os_log_t v99 = (void *)swift_allocObject();
  v99[2] = v98;
  v99[3] = &protocol witness table for MainActor;
  v99[4] = v1;
  sub_100025868(v97, (uint64_t)&unk_10005E750, (uint64_t)v99);
  swift_release();
  id v100 = [self defaultCenter];
  uint64_t v101 = v135;
  sub_10004A158();

  swift_allocObject();
  swift_weakInit();
  sub_100038884(&qword_10005E758, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  uint64_t v102 = v137;
  sub_1000492C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v136 + 8))(v101, v102);
  swift_beginAccess();
  sub_100004334(&qword_10005E760);
  sub_100005584(&qword_10005E768, &qword_10005E760);
  sub_100049218();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  long long v103 = v138;
  sub_100049268();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v104 = v139;
  sub_100049268();
  swift_endAccess();
  sub_100005584(&qword_10005E770, &qword_10005E730);
  uint64_t v105 = v140;
  uint64_t v106 = v144;
  sub_1000492A8();
  unint64_t v107 = *(void (**)(char *, uint64_t))(v142 + 8);
  v107(v104, v106);
  v107(v103, v106);
  sub_100005584(&qword_10005E778, &qword_10005E738);
  unint64_t v108 = v145;
  uint64_t v109 = v143;
  sub_1000492B8();
  (*(void (**)(char *, uint64_t))(v141 + 8))(v105, v109);
  uint64_t v110 = swift_allocObject();
  swift_weakInit();
  uint64_t v111 = swift_allocObject();
  *(void *)(v111 + 16) = sub_1000377A4;
  *(void *)(v111 + 24) = v110;
  sub_100005584(&qword_10005E780, &qword_10005E740);
  uint64_t v112 = v147;
  sub_1000492C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v146 + 8))(v108, v112);
  swift_beginAccess();
  sub_100049218();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  int v113 = v148;
  sub_100049268();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_100005584(&qword_10005E788, &qword_10005E728);
  uint64_t v114 = v150;
  sub_1000492C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v149 + 8))(v113, v114);
  swift_beginAccess();
  sub_100049218();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  uint64_t v115 = v151;
  sub_100049268();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_100005584(&qword_10005E790, &qword_10005E720);
  uint64_t v116 = v153;
  sub_1000492C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v152 + 8))(v115, v116);
  swift_beginAccess();
  sub_100049218();
  swift_endAccess();
  swift_release();
  *(_OWORD *)(*(void *)(v1 + v156) + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation) = xmmword_10004C030;
  swift_bridgeObjectRelease();
  *(_OWORD *)(*(void *)&v155[v1] + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation) = xmmword_10004C040;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_100029BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = sub_100048E48();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  sub_100049FF8();
  v4[23] = sub_100049FE8();
  uint64_t v7 = sub_100049FD8();
  unsigned char v4[24] = v7;
  v4[25] = v6;
  return _swift_task_switch(sub_100029CF8, v7, v6);
}

uint64_t sub_100029CF8()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100029E04;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10002A1DC;
  v0[13] = &unk_10005AE48;
  v0[14] = v2;
  [v1 availableLocalePairsForTask:1 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100029E04()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  uint64_t v2 = *(void *)(*(void *)v0 + 192);
  return _swift_task_switch(sub_100029F0C, v2, v1);
}

uint64_t sub_100029F0C()
{
  uint64_t result = swift_release();
  unint64_t v2 = v0[15];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10004A2A8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_11;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  unint64_t v19 = v2 & 0xC000000000000001;
  unint64_t v20 = v2;
  uint64_t v5 = (void (**)(uint64_t, uint64_t))(v0[20] + 8);
  do
  {
    if (v19) {
      id v6 = (id)sub_10004A268();
    }
    else {
      id v6 = *(id *)(v2 + 8 * v4 + 32);
    }
    uint64_t v7 = v6;
    uint64_t v9 = (char *)v0[21];
    uint64_t v8 = v0[22];
    uint64_t v10 = v0[19];
    ++v4;
    id v11 = objc_msgSend(v6, "sourceLocale", v19);
    sub_100048E28();

    sub_100038BC8(v8, v9);
    uint64_t v12 = *v5;
    (*v5)(v8, v10);
    id v13 = [v7 targetLocale];
    sub_100048E28();

    sub_100038BC8(v8, v9);
    v12(v8, v10);
    unint64_t v2 = v20;
  }
  while (v3 != v4);
LABEL_11:
  swift_bridgeObjectRelease();
  uint64_t v14 = v0[22];
  uint64_t v15 = v0[19];
  uint64_t v16 = v0[20];
  v0[16] = &_swiftEmptySetSingleton;
  sub_100048E38();
  sub_100004334(&qword_10005E920);
  sub_100005584(&qword_10005E928, &qword_10005E920);
  uint64_t v17 = sub_100049F38();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[17] = v17;
  swift_retain();
  sub_100049288();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_10002A1DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_10000A3C8(0, &qword_10005E940);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_100049F68();

  return swift_continuation_resume();
}

uint64_t sub_10002A254()
{
  uint64_t v0 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = 0;
  v5[3] = 0;
  v5[4] = v4;
  sub_10002A5D4((uint64_t)v2, (uint64_t)&unk_10005E910, (uint64_t)v5);
  swift_release();
  return sub_1000054EC((uint64_t)v2, &qword_10005D968);
}

uint64_t sub_10002A3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return _swift_task_switch(sub_10002A3D8, 0, 0);
}

uint64_t sub_10002A3D8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    sub_100049FF8();
    *(void *)(v0 + 64) = sub_100049FE8();
    uint64_t v3 = sub_100049FD8();
    return _swift_task_switch(sub_10002A4D4, v3, v2);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10002A4D4()
{
  swift_release();
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  uint64_t v1 = (void *)sub_10004A0A8();
  char v2 = sub_10004A0C8();

  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 72) = v2 & 1;
  sub_100049288();
  return _swift_task_switch(sub_10002A5AC, 0, 0);
}

uint64_t sub_10002A5AC()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002A5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005488(a1, (uint64_t)v8, &qword_10005D968);
  uint64_t v9 = sub_10004A018();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1000054EC((uint64_t)v8, &qword_10005D968);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_100049FD8();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_10004A008();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  sub_100004334(&qword_10005E818);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_10002A7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005488(a1, (uint64_t)v8, &qword_10005D968);
  uint64_t v9 = sub_10004A018();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1000054EC((uint64_t)v8, &qword_10005D968);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_100049FD8();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_10004A008();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_10002A9C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100048E48();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v59 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004334(&qword_10005D818);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v58 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v60 = (uint64_t)&v56 - v10;
  uint64_t v11 = sub_100004334(&qword_10005D810);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v62 = (uint64_t)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  unint64_t v19 = (char *)&v56 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v56 - v21;
  uint64_t v23 = (char *)&v56 + *(int *)(v20 + 48) - v21;
  uint64_t v63 = a1;
  sub_100005488(a1, (uint64_t)&v56 - v21, &qword_10005D818);
  uint64_t v24 = v4;
  sub_100005488(a2, (uint64_t)v23, &qword_10005D818);
  uint64_t v64 = v5;
  uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  unsigned int v26 = v25(v22, 1, v4);
  uint64_t v65 = (char *)a2;
  uint64_t v61 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v25;
  if (v26 == 1)
  {
    unsigned int v27 = v25(v23, 1, v4);
    if (v27 == 1) {
      uint64_t v28 = &qword_10005D818;
    }
    else {
      uint64_t v28 = &qword_10005D810;
    }
    if (v27 == 1) {
      char v29 = -1;
    }
    else {
      char v29 = 0;
    }
  }
  else
  {
    uint64_t v30 = v60;
    sub_100005488((uint64_t)v22, v60, &qword_10005D818);
    if (v25(v23, 1, v24) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v30, v24);
      char v29 = 0;
      uint64_t v28 = &qword_10005D810;
    }
    else
    {
      uint64_t v31 = v64;
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
      uint64_t v57 = v19;
      uint64_t v33 = v59;
      v32(v59, v23, v24);
      sub_100038884(&qword_10005D828, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v29 = sub_100049E68();
      unint64_t v34 = *(void (**)(char *, uint64_t))(v31 + 8);
      uint64_t v35 = v33;
      unint64_t v19 = v57;
      v34(v35, v24);
      v34((char *)v30, v24);
      uint64_t v28 = &qword_10005D818;
    }
  }
  uint64_t v36 = v63;
  sub_1000054EC((uint64_t)v22, v28);
  uint64_t v37 = *(int *)(v11 + 48);
  uint64_t v38 = (uint64_t)&v19[v37];
  uint64_t v39 = v36 + v37;
  sub_100005488(v36, (uint64_t)v19, &qword_10005D818);
  sub_100005488(v39, v38, &qword_10005D818);
  uint64_t v40 = *(int *)(v11 + 48);
  uint64_t v41 = (uint64_t)&v16[v40];
  uint64_t v42 = (uint64_t)v19;
  uint64_t v43 = (uint64_t)&v65[v40];
  sub_100005488((uint64_t)v65, (uint64_t)v16, &qword_10005D818);
  sub_100005488(v43, v41, &qword_10005D818);
  if ((v29 & 1) == 0)
  {
    sub_1000054EC((uint64_t)v16, &qword_10005D810);
    uint64_t v51 = v42;
LABEL_19:
    sub_1000054EC(v51, &qword_10005D810);
    char v50 = 0;
    return v50 & 1;
  }
  uint64_t v65 = v16;
  uint64_t v44 = v42;
  uint64_t v45 = v64;
  uint64_t v46 = *(int *)(v11 + 48);
  uint64_t v47 = v62;
  uint64_t v48 = v62 + v46;
  sub_100005488(v38, v62, &qword_10005D818);
  sub_100005488(v41, v48, &qword_10005D818);
  uint64_t v49 = v61;
  if (v61(v47, 1, v24) != 1)
  {
    uint64_t v52 = v58;
    sub_100005488(v47, v58, &qword_10005D818);
    if (v49(v48, 1, v24) != 1)
    {
      uint64_t v54 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v59, v48, v24);
      sub_100038884(&qword_10005D828, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v50 = sub_100049E68();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v45 + 8);
      v55(v54, v24);
      sub_1000054EC((uint64_t)v65, &qword_10005D810);
      sub_1000054EC(v44, &qword_10005D810);
      v55((char *)v52, v24);
      sub_1000054EC(v47, &qword_10005D818);
      return v50 & 1;
    }
    sub_1000054EC((uint64_t)v65, &qword_10005D810);
    sub_1000054EC(v44, &qword_10005D810);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v52, v24);
    goto LABEL_18;
  }
  sub_1000054EC((uint64_t)v65, &qword_10005D810);
  sub_1000054EC(v42, &qword_10005D810);
  if (v49(v48, 1, v24) != 1)
  {
LABEL_18:
    uint64_t v51 = v47;
    goto LABEL_19;
  }
  sub_1000054EC(v47, &qword_10005D818);
  char v50 = 1;
  return v50 & 1;
}

uint64_t sub_10002B010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005D818);
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v21 + 64);
  uint64_t v6 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v10 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10004A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  sub_100005488(a1, (uint64_t)v9, &qword_10005D818);
  sub_100005488(a2, (uint64_t)v7, &qword_10005D818);
  sub_100049FF8();
  swift_retain();
  uint64_t v15 = sub_100049FE8();
  uint64_t v16 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v17 = (v16 + 40) & ~v16;
  uint64_t v18 = (v5 + v16 + v17) & ~v16;
  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = v15;
  uint64_t v19[3] = &protocol witness table for MainActor;
  v19[4] = v14;
  sub_100005424((uint64_t)v9, (uint64_t)v19 + v17, &qword_10005D818);
  sub_100005424((uint64_t)v7, (uint64_t)v19 + v18, &qword_10005D818);
  swift_release();
  sub_100025868((uint64_t)v12, (uint64_t)&unk_10005E850, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_10002B2A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  sub_100004334(&qword_10005D818);
  v6[9] = swift_task_alloc();
  v6[10] = swift_task_alloc();
  uint64_t v7 = sub_100048E48();
  v6[11] = v7;
  v6[12] = *(void *)(v7 - 8);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  sub_100049FF8();
  v6[15] = sub_100049FE8();
  uint64_t v9 = sub_100049FD8();
  v6[16] = v9;
  v6[17] = v8;
  return _swift_task_switch(sub_10002B3E8, v9, v8);
}

uint64_t sub_10002B3E8()
{
  uint64_t v33 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[18] = Strong;
  if (!Strong)
  {
LABEL_13:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[10];
  sub_100005488(v0[7], v4, &qword_10005D818);
  uint64_t v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v5(v4, 1, v2) == 1)
  {
    uint64_t v6 = v0[10];
    swift_release();
    sub_1000054EC(v6, &qword_10005D818);
LABEL_12:
    sub_10002C854(v0[7], v0[8]);
    goto LABEL_13;
  }
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[8];
  (*(void (**)(void, void, uint64_t))(v0[12] + 32))(v0[14], v0[10], v7);
  if (v5(v8, 1, v7) != 1 || (sub_1000281C0() & 1) == 0)
  {
    (*(void (**)(void, void))(v0[12] + 8))(v0[14], v0[11]);
    swift_release();
    goto LABEL_12;
  }
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v10 = v0[13];
  uint64_t v9 = v0[14];
  uint64_t v11 = v0[11];
  uint64_t v12 = v0[12];
  uint64_t v13 = sub_100049208();
  sub_100009598(v13, (uint64_t)qword_1000605E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v9, v11);
  uint64_t v14 = sub_1000491E8();
  os_log_type_t v15 = sub_10004A098();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v18 = v0[12];
  uint64_t v17 = v0[13];
  if (v16)
  {
    uint64_t v31 = v0[11];
    unint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)unint64_t v19 = 136446210;
    uint64_t v20 = sub_100048DB8();
    v0[5] = sub_1000095FC(v20, v21, &v32);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(void, void))(v18 + 8);
    uint64_t v23 = v18 + 8;
    uint64_t v22 = v24;
    v24(v17, v31);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "LID resolution to %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    unsigned int v27 = *(void (**)(void, void))(v18 + 8);
    uint64_t v23 = v18 + 8;
    uint64_t v22 = v27;
    v27(v0[13], v0[11]);
  }
  v0[19] = v23;
  v0[20] = v22;
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[12] + 56))(v0[9], 1, 1, v0[11]);
  uint64_t v28 = (void *)swift_task_alloc();
  v0[21] = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_10002B7FC;
  uint64_t v29 = v0[14];
  uint64_t v30 = v0[9];
  return sub_10002BA04(v29, v30);
}

uint64_t sub_10002B7FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  swift_task_dealloc();
  sub_1000054EC(v2, &qword_10005D818);
  uint64_t v3 = *(void *)(v1 + 136);
  uint64_t v4 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_10002B948, v4, v3);
}

uint64_t sub_10002B948()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  swift_release();
  swift_release();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10002BA04(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  sub_100004334(&qword_10005D818);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  uint64_t v4 = sub_100048E48();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  sub_100049FF8();
  v3[16] = sub_100049FE8();
  uint64_t v6 = sub_100049FD8();
  v3[17] = v6;
  v3[18] = v5;
  return _swift_task_switch(sub_10002BB64, v6, v5);
}

uint64_t sub_10002BB64()
{
  uint64_t v47 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  sub_100005488(*(void *)(v1 + 48), v3, &qword_10005D818);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v4) == 1)
  {
    sub_1000054EC(*(void *)(v1 + 80), &qword_10005D818);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v1 + 152) = v5;
    *uint64_t v5 = v1;
    v5[1] = sub_10002C1C8;
    uint64_t v6 = *(void *)(v1 + 120);
    uint64_t v7 = *(void *)(v1 + 40);
    return sub_10002E188(v6, v7);
  }
  else
  {
    uint64_t v9 = *(void *)(v1 + 120);
    uint64_t v10 = *(void *)(v1 + 88);
    uint64_t v11 = *(void *)(v1 + 96);
    uint64_t v12 = *(void *)(v1 + 80);
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v12, v10);
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v13 = *(void *)(v1 + 40);
    uint64_t v15 = *(void *)(v1 + 112);
    uint64_t v14 = *(void *)(v1 + 120);
    uint64_t v17 = *(void *)(v1 + 96);
    uint64_t v16 = *(void *)(v1 + 104);
    uint64_t v18 = *(void *)(v1 + 88);
    uint64_t v19 = sub_100049208();
    sub_100009598(v19, (uint64_t)qword_1000605E0);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    v20(v15, v13, v18);
    uint64_t v45 = v20;
    v20(v16, v14, v18);
    unint64_t v21 = sub_1000491E8();
    os_log_type_t v22 = sub_10004A068();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v25 = *(void *)(v1 + 104);
    uint64_t v24 = *(void *)(v1 + 112);
    uint64_t v27 = *(void *)(v1 + 88);
    uint64_t v26 = *(void *)(v1 + 96);
    if (v23)
    {
      os_log_type_t type = v22;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136446466;
      uint64_t v29 = sub_100048DC8();
      *(void *)(v1 + 24) = sub_1000095FC(v29, v30, &v46);
      sub_10004A1A8();
      swift_bridgeObjectRelease();
      uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v31(v24, v27);
      *(_WORD *)(v28 + 12) = 2082;
      uint64_t v32 = sub_100048DC8();
      *(void *)(v1 + 32) = sub_1000095FC(v32, v33, &v46);
      sub_10004A1A8();
      swift_bridgeObjectRelease();
      uint64_t v44 = v31;
      v31(v25, v27);
      _os_log_impl((void *)&_mh_execute_header, v21, type, "LID resolved locales source: %{public}s target: %{public}s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v34(v24, v27);
      uint64_t v44 = v34;
      v34(v25, v27);
    }
    uint64_t v42 = *(void *)(v1 + 120);
    uint64_t v35 = *(void *)(v1 + 96);
    uint64_t v36 = *(void *)(v1 + 88);
    uint64_t v38 = *(void *)(v1 + 64);
    uint64_t v37 = *(void *)(v1 + 72);
    uint64_t v39 = *(void *)(v1 + 40);
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v1 + 16) = 0;
    swift_retain();
    sub_100049288();
    v45(v37, v39, v36);
    uint64_t v41 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56);
    v41(v37, 0, 1, v36);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100005488(v37, v38, &qword_10005D818);
    swift_retain();
    sub_100049288();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v1 + 160) = 0;
    swift_retain();
    sub_100049288();
    sub_1000054EC(v37, &qword_10005D818);
    v45(v37, v42, v36);
    v41(v37, 0, 1, v36);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100005488(v37, v38, &qword_10005D818);
    swift_retain();
    sub_100049288();
    sub_1000054EC(v37, &qword_10005D818);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v1 + 161) = 1;
    swift_retain();
    sub_100049288();
    sub_10002DE70();
    v44(v42, v36);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v40 = *(uint64_t (**)(void))(v1 + 8);
    return v40();
  }
}

uint64_t sub_10002C1C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return _swift_task_switch(sub_10002C2E8, v3, v2);
}

uint64_t sub_10002C2E8()
{
  uint64_t v39 = v0;
  uint64_t v1 = v0;
  swift_release();
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v6 = v1[12];
  uint64_t v5 = v1[13];
  uint64_t v7 = v1[11];
  uint64_t v8 = sub_100049208();
  sub_100009598(v8, (uint64_t)qword_1000605E0);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v9(v4, v2, v7);
  uint64_t v37 = v9;
  v9(v5, v3, v7);
  uint64_t v10 = sub_1000491E8();
  os_log_type_t v11 = sub_10004A068();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v14 = v1[13];
  uint64_t v13 = v1[14];
  uint64_t v16 = v1[11];
  uint64_t v15 = v1[12];
  if (v12)
  {
    uint64_t v35 = v1[13];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136446466;
    log = v10;
    uint64_t v18 = sub_100048DC8();
    v1[3] = sub_1000095FC(v18, v19, &v38);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(v13, v16);
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v21 = v35;
    uint64_t v22 = sub_100048DC8();
    v1[4] = sub_1000095FC(v22, v23, &v38);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    uint64_t v36 = v20;
    v20(v21, v16);
    _os_log_impl((void *)&_mh_execute_header, log, v11, "LID resolved locales source: %{public}s target: %{public}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v24(v13, v16);
    uint64_t v36 = v24;
    v24(v14, v16);
  }
  uint64_t v33 = v1[15];
  uint64_t v25 = v1[12];
  uint64_t v26 = v1[11];
  uint64_t v28 = v1[8];
  uint64_t v27 = v1[9];
  uint64_t v29 = v1[5];
  swift_getKeyPath();
  swift_getKeyPath();
  v1[2] = 0;
  swift_retain();
  sub_100049288();
  v37(v27, v29, v26);
  uint64_t v32 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56);
  v32(v27, 0, 1, v26);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488(v27, v28, &qword_10005D818);
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  *((unsigned char *)v1 + 160) = 0;
  swift_retain();
  sub_100049288();
  sub_1000054EC(v27, &qword_10005D818);
  v37(v27, v33, v26);
  v32(v27, 0, 1, v26);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488(v27, v28, &qword_10005D818);
  swift_retain();
  sub_100049288();
  sub_1000054EC(v27, &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  *((unsigned char *)v1 + 161) = 1;
  swift_retain();
  sub_100049288();
  sub_10002DE70();
  v36(v33, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v30 = (uint64_t (*)(void))v1[1];
  return v30();
}

uint64_t sub_10002C854(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100004334(&qword_10005D818);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = sub_100048E48();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v26 - v17;
  unint64_t v19 = *(void **)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource);
  if (v19)
  {
    uint64_t v29 = v2;
    uint64_t v20 = a2;
    sub_100005488(a1, (uint64_t)v10, &qword_10005D818);
    uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    if (v21(v10, 1, v11) == 1)
    {
      return sub_1000054EC((uint64_t)v10, &qword_10005D818);
    }
    else
    {
      uint64_t v28 = v15;
      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v27(v18, v10, v11);
      sub_100005488(v20, (uint64_t)v8, &qword_10005D818);
      if (v21(v8, 1, v11) == 1)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
        return sub_1000054EC((uint64_t)v8, &qword_10005D818);
      }
      else
      {
        uint64_t v22 = (uint64_t)v28;
        v27(v28, v8, v11);
        uint64_t v23 = *(void *)(v29 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_ignoredAttributes);
        id v24 = v19;
        swift_bridgeObjectRetain();
        sub_100030218(v24, v23, (uint64_t)v18, v22);

        swift_bridgeObjectRelease();
        uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
        v25(v22, v11);
        return ((uint64_t (*)(char *, uint64_t))v25)(v18, v11);
      }
    }
  }
  return result;
}

uint64_t sub_10002CB18(char *a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v5 = *a1;
  uint64_t v6 = sub_10004A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(unsigned char *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v7;
  sub_10002A7D0((uint64_t)v4, (uint64_t)&unk_10005E7C8, v8);
  swift_release();
  return sub_1000054EC((uint64_t)v4, &qword_10005D968);
}

uint64_t sub_10002CC88(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 40) = a5;
  *(unsigned char *)(v5 + 64) = a4;
  return _swift_task_switch(sub_10002CCAC, 0, 0);
}

uint64_t sub_10002CCAC()
{
  int v1 = *(unsigned __int8 *)(v0 + 64);
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  uint64_t v2 = (void *)sub_10004A0A8();
  int v3 = sub_10004A0C8() & 1;

  if (v1 != v3
    && (int v4 = *(unsigned __int8 *)(v0 + 64), v5 = (void *)sub_10004A0A8(), sub_10004A0D8(), v5, v4 == 1)
    && (swift_beginAccess(), uint64_t Strong = swift_weakLoadStrong(), (*(void *)(v0 + 48) = Strong) != 0))
  {
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_10002CE08;
    return sub_10002CF18();
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_10002CE08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  int v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002CF18()
{
  v1[2] = v0;
  v1[3] = type metadata accessor for TranslationRequestContext();
  v1[4] = swift_task_alloc();
  sub_100049FF8();
  v1[5] = sub_100049FE8();
  uint64_t v3 = sub_100049FD8();
  return _swift_task_switch(sub_10002CFE0, v3, v2);
}

uint64_t sub_10002CFE0()
{
  swift_release();
  if (qword_10005D430 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100049208();
  sub_100009598(v1, (uint64_t)qword_1000605B0);
  uint64_t v2 = sub_1000491E8();
  os_log_type_t v3 = sub_10004A098();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Continue translation with user consent", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 16);

  if (*(unsigned char *)(v5 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_waitingForUserConsent) == 1)
  {
    uint64_t v6 = *(void *)(v0 + 16);
    *(unsigned char *)(v5 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_waitingForUserConsent) = 0;
    if (*(unsigned char *)(v6 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_showConsentOnly) == 1
      && (swift_getKeyPath(),
          swift_getKeyPath(),
          sub_100049278(),
          swift_release(),
          swift_release(),
          *(unsigned char *)(v0 + 48) == 1))
    {
      uint64_t v7 = sub_1000491E8();
      os_log_type_t v8 = sub_10004A098();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Dismiss given we only are interested in user consent currently", v9, 2u);
        swift_slowDealloc();
      }
      uint64_t v10 = *(void *)(v0 + 16);

      uint64_t v11 = *(void (**)(uint64_t))(v10
                                           + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_consentHandler);
      if (v11)
      {
        uint64_t v12 = swift_retain();
        v11(v12);
        sub_10000A374((uint64_t)v11);
      }
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 16);
      uint64_t v14 = *(void **)(v13 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource);
      if (v14)
      {
        uint64_t v15 = *(void *)(v13 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_ignoredAttributes);
        uint64_t v17 = *(int **)(v0 + 24);
        uint64_t v16 = *(void *)(v0 + 32);
        *(void *)uint64_t v16 = v14;
        *(_WORD *)(v16 + 8) = 0;
        *(void *)(v16 + 16) = v15;
        uint64_t v18 = v16 + v17[8];
        uint64_t v19 = sub_1000491C8();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
        *(unsigned char *)(v16 + v17[9]) = 0;
        uint64_t v20 = (void *)(v16 + v17[10]);
        void *v20 = 0;
        v20[1] = 0;
        *(unsigned char *)(v16 + v17[11]) = 0;
        uint64_t v21 = v16 + v17[12];
        uint64_t v22 = sub_100048E48();
        uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
        v23(v21, 1, 1, v22);
        v23(v16 + v17[13], 1, 1, v22);
        id v24 = v14;
        swift_bridgeObjectRetain();
        sub_100024650(v16);

        sub_10003A468(v16, (uint64_t (*)(void))type metadata accessor for TranslationRequestContext);
      }
    }
  }
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_10002D38C(uint64_t *a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *a1;
  uint64_t v6 = sub_10004A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  os_log_type_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v5;
  v8[5] = v7;
  sub_10002A7D0((uint64_t)v4, (uint64_t)&unk_10005E7A0, (uint64_t)v8);
  swift_release();
  return sub_1000054EC((uint64_t)v4, &qword_10005D968);
}

uint64_t sub_10002D4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 88) = a4;
  *(void *)(v5 + 96) = a5;
  return _swift_task_switch(sub_10002D518, 0, 0);
}

uint64_t sub_10002D518()
{
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100049208();
  sub_100009598(v1, (uint64_t)qword_1000605E0);
  uint64_t v2 = sub_1000491E8();
  os_log_type_t v3 = sub_10004A068();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[11];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[2] = v4;
    sub_10004A1A8();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Update disambiguation value: %ld", v5, 0xCu);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[13] = Strong;
  if (Strong)
  {
    v0[14] = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult;
    sub_100049FF8();
    v0[15] = sub_100049FE8();
    uint64_t v7 = sub_100049FD8();
    uint64_t v9 = v8;
    uint64_t v10 = sub_10002D800;
LABEL_11:
    return _swift_task_switch(v10, v7, v9);
  }
  v0[17] = 0;
  v0[18] = 0xE000000000000000;
  swift_beginAccess();
  uint64_t v11 = swift_weakLoadStrong();
  v0[19] = v11;
  if (v11)
  {
    sub_100049FF8();
    v0[20] = sub_100049FE8();
    uint64_t v7 = sub_100049FD8();
    uint64_t v9 = v12;
    uint64_t v10 = sub_10002DC68;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v13 = swift_weakLoadStrong();
  v0[21] = v13;
  if (v13)
  {
    sub_100049FF8();
    v0[22] = sub_100049FE8();
    uint64_t v7 = sub_100049FD8();
    uint64_t v9 = v14;
    uint64_t v10 = sub_10002DE04;
    goto LABEL_11;
  }
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_10002D800()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  swift_release();
  os_log_type_t v3 = *(void **)(v2 + v1);
  v0[16] = v3;
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_10002D894;
  }
  else
  {
    uint64_t v5 = sub_10002DAEC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10002D894()
{
  uint64_t v1 = (void *)v0[16];
  swift_release();
  id v2 = [v1 translations];

  sub_10000A3C8(0, &qword_10005E7B8);
  uint64_t v3 = sub_100049F68();

  uint64_t v6 = (uint64_t (*)())v0[11];
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (((unint64_t)v6 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)v6)
    {
      id v7 = *(id *)(v3 + 8 * (void)v6 + 32);
      goto LABEL_5;
    }
    __break(1u);
    return _swift_task_switch(v6, v4, v5);
  }
  id v7 = (id)sub_10004A268();
LABEL_5:
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  id v9 = [v8 formattedString];

  uint64_t v10 = sub_100049EA8();
  uint64_t v12 = v11;

  v0[17] = v10;
  v0[18] = v12;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[19] = Strong;
  if (Strong)
  {
    sub_100049FF8();
    v0[20] = sub_100049FE8();
    uint64_t v14 = sub_100049FD8();
    uint64_t v16 = v15;
    uint64_t v17 = sub_10002DC68;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v18 = swift_weakLoadStrong();
  v0[21] = v18;
  if (v18)
  {
    sub_100049FF8();
    v0[22] = sub_100049FE8();
    uint64_t v14 = sub_100049FD8();
    uint64_t v16 = v19;
    uint64_t v17 = sub_10002DE04;
LABEL_9:
    uint64_t v6 = v17;
    uint64_t v4 = v14;
    uint64_t v5 = v16;
    return _swift_task_switch(v6, v4, v5);
  }
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_10002DAEC()
{
  swift_release();
  v0[17] = 0;
  v0[18] = 0xE000000000000000;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[19] = Strong;
  if (Strong)
  {
    sub_100049FF8();
    v0[20] = sub_100049FE8();
    uint64_t v2 = sub_100049FD8();
    uint64_t v4 = v3;
    uint64_t v5 = sub_10002DC68;
LABEL_5:
    return _swift_task_switch(v5, v2, v4);
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v6 = swift_weakLoadStrong();
  v0[21] = v6;
  if (v6)
  {
    sub_100049FF8();
    v0[22] = sub_100049FE8();
    uint64_t v2 = sub_100049FD8();
    uint64_t v4 = v7;
    uint64_t v5 = sub_10002DE04;
    goto LABEL_5;
  }
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10002DC68()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[8] = v2;
  v0[9] = v1;
  sub_100049288();
  return _swift_task_switch(sub_10002DD14, 0, 0);
}

uint64_t sub_10002DD14()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[21] = Strong;
  if (Strong)
  {
    sub_100049FF8();
    v0[22] = sub_100049FE8();
    uint64_t v3 = sub_100049FD8();
    return _swift_task_switch(sub_10002DE04, v3, v2);
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_10002DE04()
{
  swift_release();
  sub_10002DE70();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002DE70()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_originalPlayer;
  uint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier + 8);
  uint64_t v8 = (void *)(*(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_originalPlayer)
                + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier);
  *uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier);
  v8[1] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v1 + v5);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t v10 = v24;
  uint64_t v11 = v25;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t v12 = (void *)(v9 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_text);
  *uint64_t v12 = v10;
  v12[1] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = v9 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale;
  swift_beginAccess();
  sub_100038134((uint64_t)v4, v13);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000054EC((uint64_t)v4, &qword_10005D818);
  uint64_t v14 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationPlayer;
  uint64_t v15 = v6[1];
  uint64_t v16 = (void *)(*(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationPlayer)
                 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier);
  *uint64_t v16 = *v6;
  v16[1] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v1 + v14);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t v19 = v24;
  uint64_t v18 = v25;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t v20 = (void *)(v17 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_text);
  void *v20 = v19;
  v20[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v17 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale;
  swift_beginAccess();
  sub_100038134((uint64_t)v4, v21);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1000054EC((uint64_t)v4, &qword_10005D818);
}

uint64_t sub_10002E188(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = sub_100048E48();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  sub_100049FF8();
  v3[10] = sub_100049FE8();
  uint64_t v6 = sub_100049FD8();
  return _swift_task_switch(sub_10002E290, v6, v5);
}

uint64_t sub_10002E290()
{
  swift_release();
  sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
  uint64_t v1 = (void *)sub_10004A0A8();
  sub_10004A0E8();
  uint64_t v3 = v2;

  if (!v3) {
    goto LABEL_6;
  }
  sub_100048DA8();
  id v4 = objc_allocWithZone((Class)_LTLocalePair);
  Class isa = sub_100048E18().super.isa;
  Class v6 = sub_100048E18().super.isa;
  id v7 = [v4 initWithSourceLocale:isa targetLocale:v6];

  if ([v7 isPassthrough])
  {

LABEL_5:
    (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
LABEL_6:
    uint64_t v10 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v11 = v0[6];
    sub_100048E38();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049278();
    swift_release();
    swift_release();
    sub_100048DE8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    goto LABEL_7;
  }
  unsigned __int8 v8 = [v7 isVariantPair];

  if (v8) {
    goto LABEL_5;
  }
  (*(void (**)(void, void, void))(v0[7] + 32))(v0[3], v0[9], v0[6]);
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_10002E4C4()
{
  uint64_t v1 = sub_100004334(&qword_10005D818);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  Class v6 = (char *)&v12 - v5;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v12 = 0;
  swift_retain();
  sub_100049288();
  id v7 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource);
  *(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_attributedSource) = 0;

  *(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_ignoredAttributes) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_waitingForUserConsent) = 0;
  uint64_t v8 = sub_100048E48();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v6, 1, 1, v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488((uint64_t)v6, (uint64_t)v4, &qword_10005D818);
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v12) = 0;
  swift_retain();
  sub_100049288();
  sub_1000054EC((uint64_t)v6, &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v12) = 0;
  swift_retain();
  sub_100049288();
  v9(v6, 1, 1, v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488((uint64_t)v6, (uint64_t)v4, &qword_10005D818);
  swift_retain();
  sub_100049288();
  sub_1000054EC((uint64_t)v6, &qword_10005D818);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  swift_retain();
  sub_100049288();
  uint64_t v10 = *(void **)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult);
  *(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult) = 0;

  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v12 = -1;
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v12) = 0;
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v12) = 2;
  swift_retain();
  sub_100049288();
  return sub_10002DE70();
}

uint64_t sub_10002E8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  sub_100049FF8();
  *(void *)(v4 + 72) = sub_100049FE8();
  uint64_t v6 = sub_100049FD8();
  return _swift_task_switch(sub_10002E978, v6, v5);
}

uint64_t sub_10002E978()
{
  swift_release();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    type metadata accessor for TranslationModel(0);
    sub_100038884(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
    sub_100049238();
    swift_release();
    sub_100049248();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 80) = 1;
    sub_100049288();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002EAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[5] = a1;
  v6[6] = a4;
  return _swift_task_switch(sub_10002EB04, 0, 0);
}

uint64_t sub_10002EB04()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 72) = Strong;
  if (Strong)
  {
    uint64_t v2 = *(void *)(v0 + 64);
    uint64_t v3 = v2 + *(int *)(type metadata accessor for TranslationRequestContext() + 52);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10002EC1C;
    uint64_t v5 = *(void *)(v0 + 56);
    return sub_10002BA04(v5, v3);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_10002EC1C()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10002ED34, 0, 0);
}

uint64_t sub_10002ED34()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 72) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002ED5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[42] = a5;
  v6[43] = a6;
  v6[41] = a4;
  sub_100004334(&qword_10005D818);
  v6[44] = swift_task_alloc();
  v6[45] = swift_task_alloc();
  uint64_t v7 = sub_100048E48();
  v6[46] = v7;
  v6[47] = *(void *)(v7 - 8);
  v6[48] = swift_task_alloc();
  v6[49] = swift_task_alloc();
  v6[50] = swift_task_alloc();
  sub_100049FF8();
  v6[51] = sub_100049FE8();
  uint64_t v9 = sub_100049FD8();
  v6[52] = v9;
  v6[53] = v8;
  return _swift_task_switch(sub_10002EEB0, v9, v8);
}

uint64_t sub_10002EEB0()
{
  uint64_t v2 = v0[41];
  uint64_t v1 = v0[42];
  uint64_t v3 = self;
  sub_100004334(&qword_10005DDB8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10004B740;
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v1;
  swift_bridgeObjectRetain();
  Class isa = sub_100049F58().super.isa;
  v0[54] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 36;
  v0[3] = sub_10002F02C;
  uint64_t v6 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100030120;
  v0[13] = &unk_10005ACA0;
  v0[14] = v6;
  [v3 languagesForText:isa usingModel:1 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10002F02C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 424);
  uint64_t v2 = *(void *)(*(void *)v0 + 416);
  return _swift_task_switch(sub_10002F134, v2, v1);
}

uint64_t sub_10002F134()
{
  uint64_t v94 = v0;
  uint64_t v1 = *(void **)(v0 + 432);
  uint64_t v2 = *(void **)(v0 + 288);
  *(void *)(v0 + 440) = v2;

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 448) = Strong;
  if (!Strong)
  {
    swift_release();

LABEL_53:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v81 = *(uint64_t (**)(void))(v0 + 8);
    return v81();
  }
  uint64_t v4 = Strong;
  if (!v2)
  {
    swift_release();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100049208();
    sub_100009598(v18, (uint64_t)qword_1000605E0);
    uint64_t v19 = sub_1000491E8();
    os_log_type_t v20 = sub_10004A078();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to resolve LID of text content, showing translation unavailable message", v21, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v22 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 280) = v22;
    sub_100049288();
    goto LABEL_53;
  }
  id v5 = v2;
  id v6 = [v5 lowConfidenceLocales];
  uint64_t v91 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    swift_release();
    uint64_t v8 = sub_100049F68();

    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100048FF8();
    uint64_t v10 = sub_100030184(v9, v8);
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    unint64_t v16 = v15;
    if (v15)
    {
      sub_10004A318();
      swift_unknownObjectRetain_n();
      uint64_t v46 = (void *)swift_dynamicCastClass();
      if (!v46)
      {
        swift_unknownObjectRelease();
        uint64_t v46 = _swiftEmptyArrayStorage;
      }
      uint64_t v47 = v46[2];
      swift_release();
      if (__OFSUB__(v16 >> 1, v14))
      {
        __break(1u);
      }
      else if (v47 == (v16 >> 1) - v14)
      {
        uint64_t v17 = (void *)swift_dynamicCastClass();
        if (!v17)
        {
          swift_unknownObjectRelease();
          uint64_t v17 = _swiftEmptyArrayStorage;
        }
        goto LABEL_24;
      }
      swift_unknownObjectRelease();
    }
    uint64_t v17 = sub_100039BDC(v10, v12, v14, v16);
LABEL_24:
    swift_unknownObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 304) = v17;
    swift_retain();
    sub_100049288();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v48 = (uint64_t *)(v0 + 312);
    uint64_t v49 = sub_100049208();
    sub_100009598(v49, (uint64_t)qword_1000605E0);
    swift_bridgeObjectRetain();
    char v50 = sub_1000491E8();
    os_log_type_t v51 = sub_10004A068();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v93 = swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_100049F78();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 320) = sub_1000095FC(v53, v55, &v93);
      sub_10004A1A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Low confidence languages detected: %{public}s", v52, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v48 = (uint64_t *)(v0 + 312);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v56 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    *uint64_t v48 = v56;
    swift_retain();
    sub_100049288();

LABEL_52:
    swift_release();
    goto LABEL_53;
  }
  id v23 = [v5 dominantLocale];
  if (!v23)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 376) + 56))(*(void *)(v0 + 360), 1, 1, *(void *)(v0 + 368));
    goto LABEL_31;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)(v0 + 392);
  uint64_t v26 = *(void *)(v0 + 368);
  uint64_t v27 = *(void *)(v0 + 376);
  uint64_t v28 = *(void *)(v0 + 360);
  sub_100048E28();

  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
  v29(v28, v25, v26);
  unint64_t v30 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56);
  v30(v28, 0, 1, v26);
  uint64_t v31 = v26;
  id v5 = v91;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v28, 1, v31) == 1)
  {
LABEL_31:
    uint64_t v57 = *(void *)(v0 + 360);
    swift_release();
    sub_1000054EC(v57, &qword_10005D818);
    *(void *)(v0 + 232) = 0;
    *(void *)(v0 + 240) = 0;
    id v58 = [v5 unsupportedLanguageCounts];
    id v59 = [v58 allObjects];

    uint64_t v60 = sub_100049F68();
    uint64_t v61 = *(void *)(v60 + 16);
    if (v61)
    {
      id v62 = 0;
      uint64_t v63 = v60 + 32;
      do
      {
        sub_10000988C(v63, v0 + 152);
        id v64 = [v5 unsupportedLanguageCounts];
        sub_10000A384((void *)(v0 + 152), *(void *)(v0 + 176));
        id v65 = [v64 countForObject:sub_10004A2F8()];
        swift_unknownObjectRelease();

        if ((uint64_t)v62 >= (uint64_t)v65)
        {
          sub_10000A404(v0 + 152);
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_10003A11C((_OWORD *)(v0 + 152), (_OWORD *)(v0 + 120));
          int v66 = swift_dynamicCast();
          uint64_t v67 = *(void *)(v0 + 248);
          if (v66)
          {
            uint64_t v68 = *(void *)(v0 + 256);
          }
          else
          {
            uint64_t v67 = 0;
            uint64_t v68 = 0;
          }
          *(void *)(v0 + 232) = v67;
          *(void *)(v0 + 240) = v68;
          id v62 = v65;
        }
        v63 += 32;
        --v61;
        id v5 = v91;
      }
      while (v61);
    }
    swift_bridgeObjectRelease();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v69 = (uint64_t *)(v0 + 264);
    uint64_t v70 = sub_100049208();
    sub_100009598(v70, (uint64_t)qword_1000605E0);
    uint64_t v71 = *(void *)(v0 + 232);
    unint64_t v72 = *(void *)(v0 + 240);
    swift_bridgeObjectRetain_n();
    uint64_t v73 = sub_1000491E8();
    os_log_type_t v74 = sub_10004A068();
    if (os_log_type_enabled(v73, v74))
    {
      uint64_t v75 = (uint8_t *)swift_slowAlloc();
      uint64_t v93 = swift_slowAlloc();
      *(_DWORD *)uint64_t v75 = 136446210;
      if (v72) {
        uint64_t v76 = v71;
      }
      else {
        uint64_t v76 = 0xD000000000000010;
      }
      if (v72) {
        unint64_t v77 = v72;
      }
      else {
        unint64_t v77 = 0x80000001000550E0;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 272) = sub_1000095FC(v76, v77, &v93);
      sub_10004A1A8();
      uint64_t v69 = (uint64_t *)(v0 + 264);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "Unsupported languages detected: %{public}s", v75, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v78 = swift_allocError();
    uint64_t v80 = v79;
    swift_beginAccess();
    *uint64_t v80 = *(_OWORD *)(v0 + 232);
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    *uint64_t v69 = v78;
    swift_retain();
    sub_100049288();

    goto LABEL_52;
  }
  uint64_t v92 = v30;
  v29(*(void *)(v0 + 400), *(void *)(v0 + 360), *(void *)(v0 + 368));
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v32 = *(void *)(v0 + 400);
  uint64_t v34 = *(void *)(v0 + 376);
  uint64_t v33 = *(void *)(v0 + 384);
  uint64_t v35 = *(void *)(v0 + 368);
  uint64_t v36 = sub_100049208();
  sub_100009598(v36, (uint64_t)qword_1000605E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v33, v32, v35);
  uint64_t v37 = sub_1000491E8();
  os_log_type_t v38 = sub_10004A098();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v40 = *(void *)(v0 + 376);
  uint64_t v41 = *(void *)(v0 + 384);
  if (v39)
  {
    uint64_t v90 = *(void *)(v0 + 368);
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 136446210;
    uint64_t v43 = sub_100048DB8();
    *(void *)(v0 + 296) = sub_1000095FC(v43, v44, &v93);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v45(v41, v90);
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Primary detected locale is %{public}s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v45(*(void *)(v0 + 384), *(void *)(v0 + 368));
  }

  *(void *)(v0 + 456) = v45;
  uint64_t v83 = *(void **)(v4 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
  if (v83)
  {
    id v84 = v83;
    Class isa = sub_100048E18().super.isa;
    Class v86 = sub_100049F58().super.isa;
    [v84 languageIdentificationCompletedWithInputSource:1 topLocale:isa lowConfidenceLocales:v86];
  }
  v92(*(void *)(v0 + 352), 1, 1, *(void *)(v0 + 368));
  uint64_t v87 = (void *)swift_task_alloc();
  *(void *)(v0 + 464) = v87;
  *uint64_t v87 = v0;
  v87[1] = sub_10002FF00;
  uint64_t v88 = *(void *)(v0 + 400);
  uint64_t v89 = *(void *)(v0 + 352);
  return sub_10002BA04(v88, v89);
}

uint64_t sub_10002FF00()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 352);
  swift_task_dealloc();
  sub_1000054EC(v2, &qword_10005D818);
  uint64_t v3 = *(void *)(v1 + 424);
  uint64_t v4 = *(void *)(v1 + 416);
  return _swift_task_switch(sub_10003004C, v4, v3);
}

uint64_t sub_10003004C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[57];
  uint64_t v2 = (void *)v0[55];
  uint64_t v3 = v0[50];
  uint64_t v4 = v0[46];
  swift_release();
  swift_release();

  v1(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100030120(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_100005424((uint64_t)&v6, v3, &qword_10005E840);
  return swift_continuation_resume();
}

uint64_t sub_100030184(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_100048E48();
      return a2;
    }
  }
  __break(1u);
  return result;
}

void sub_100030218(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v44 = a2;
  id v45 = a1;
  uint64_t v43 = sub_100048E48();
  uint64_t v6 = *(void *)(v43 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(v43);
  uint64_t v47 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v46 = (char *)&v40 - v9;
  uint64_t v10 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  swift_retain();
  sub_100049288();
  id v13 = objc_allocWithZone((Class)_LTLocalePair);
  Class isa = sub_100048E18().super.isa;
  uint64_t v15 = a4;
  Class v16 = sub_100048E18().super.isa;
  id v17 = [v13 initWithSourceLocale:isa targetLocale:v16];

  if ([v17 isPassthrough])
  {
    id v18 = v45;
    id v19 = [v45 string];
    uint64_t v20 = sub_100049EA8();
    uint64_t v22 = v21;

    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v48 = v20;
    uint64_t v49 = v22;
    swift_retain();
    sub_100049288();
    id v23 = [v18 string];
    uint64_t v24 = sub_100049EA8();
    uint64_t v26 = v25;

    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v48 = v24;
    uint64_t v49 = v26;
    swift_retain();
    sub_100049288();
    sub_10002DE70();
  }
  else
  {
    uint64_t v27 = sub_10004A018();
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56);
    uint64_t v42 = v12;
    v28(v12, 1, 1, v27);
    uint64_t v29 = swift_allocObject();
    swift_weakInit();
    unint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v31 = v43;
    v30(v46, a3, v43);
    v30(v47, v15, v31);
    sub_100049FF8();
    swift_retain();
    id v41 = v45;
    uint64_t v32 = v44;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_100049FE8();
    uint64_t v34 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v35 = (v34 + 40) & ~v34;
    uint64_t v36 = (v7 + v34 + v35) & ~v34;
    unint64_t v37 = (v7 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
    id v45 = v17;
    os_log_type_t v38 = (char *)swift_allocObject();
    *((void *)v38 + 2) = v33;
    *((void *)v38 + 3) = &protocol witness table for MainActor;
    *((void *)v38 + 4) = v29;
    BOOL v39 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v39(&v38[v35], v46, v31);
    v39(&v38[v36], v47, v31);
    *(void *)&v38[v37] = v41;
    *(void *)&v38[(v37 + 15) & 0xFFFFFFFFFFFFFFF8] = v32;
    id v17 = v45;
    swift_release();
    sub_100034770((uint64_t)v42, (uint64_t)&unk_10005E868, (uint64_t)v38);
    swift_release();
  }
}

uint64_t sub_100030684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[43] = a7;
  v8[44] = a8;
  v8[41] = a5;
  v8[42] = a6;
  v8[40] = a4;
  uint64_t v9 = sub_100048D98();
  v8[45] = v9;
  v8[46] = *(void *)(v9 - 8);
  v8[47] = swift_task_alloc();
  uint64_t v10 = sub_100048F68();
  v8[48] = v10;
  v8[49] = *(void *)(v10 - 8);
  v8[50] = swift_task_alloc();
  v8[51] = swift_task_alloc();
  v8[52] = swift_task_alloc();
  v8[53] = swift_task_alloc();
  uint64_t v11 = sub_100048E48();
  v8[54] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v8[55] = v12;
  v8[56] = *(void *)(v12 + 64);
  v8[57] = swift_task_alloc();
  v8[58] = swift_task_alloc();
  v8[59] = swift_task_alloc();
  uint64_t v13 = sub_100048EA8();
  v8[60] = v13;
  v8[61] = *(void *)(v13 - 8);
  v8[62] = swift_task_alloc();
  v8[63] = swift_task_alloc();
  sub_100049FF8();
  v8[64] = sub_100049FE8();
  uint64_t v15 = sub_100049FD8();
  v8[65] = v15;
  v8[66] = v14;
  return _swift_task_switch(sub_1000308F4, v15, v14);
}

uint64_t sub_1000308F4()
{
  uint64_t v106 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 536) = Strong;
  if (Strong)
  {
    *(void *)(v0 + 544) = sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
    uint64_t v2 = (void *)sub_10004A0A8();
    char v3 = sub_10004A0B8();

    if (v3)
    {
      uint64_t v4 = *(void *)(v0 + 464);
      uint64_t v5 = *(void *)(v0 + 432);
      uint64_t v6 = *(void *)(v0 + 336);
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 440) + 16);
      v7(*(void *)(v0 + 472), *(void *)(v0 + 328), v5);
      v7(v4, v6, v5);
      sub_100048E68();
      uint64_t v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 552) = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_100031548;
      uint64_t v9 = *(void *)(v0 + 504);
      uint64_t v10 = *(void *)(v0 + 424);
      return static LanguagesStatusService.languagePairState(_:)(v10, v9);
    }
    swift_release();
    Swift::Int v11 = sub_100049EE8();
    char v12 = sub_10004A128(v11);
    uint64_t v14 = v13;
    char v103 = v12;
    if (v12)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      *(unsigned char *)(v0 + 572) = 1;
      swift_retain();
      sub_100049288();
      id v15 = [v14 string];
      uint64_t v16 = sub_100049EA8();
      uint64_t v18 = v17;

      v105[0] = v16;
      v105[1] = v18;
      swift_bridgeObjectRetain();
      v108._countAndFlagsBits = 10911970;
      v108._object = (void *)0xA300000000000000;
      sub_100049F18(v108);
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 232) = v16;
      *(void *)(v0 + 240) = v18;
    }
    else
    {
      id v19 = [v13 string];
      uint64_t v20 = sub_100049EA8();
      uint64_t v22 = v21;

      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 216) = v20;
      *(void *)(v0 + 224) = v22;
    }
    swift_retain();
    sub_100049288();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    id v23 = *(void **)(v0 + 344);
    uint64_t v24 = sub_100049208();
    sub_100009598(v24, (uint64_t)qword_1000605E0);
    swift_retain_n();
    id v25 = v14;
    id v26 = v23;
    swift_bridgeObjectRetain_n();
    id v27 = v25;
    id v28 = v26;
    uint64_t v29 = sub_1000491E8();
    os_log_type_t v30 = sub_10004A098();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v32 = *(void *)(v0 + 536);
    uint64_t v33 = &unk_100060000;
    uint64_t v34 = *(void **)(v0 + 344);
    uint64_t v104 = v27;
    if (v31)
    {
      os_log_type_t type = v30;
      uint64_t v95 = v0 + 248;
      uint64_t v35 = swift_slowAlloc();
      v105[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 134218754;
      id v36 = [v27 length];

      *(void *)(v0 + 280) = v36;
      id v27 = v104;
      sub_10004A1A8();

      *(_WORD *)(v35 + 12) = 2048;
      id v37 = [v34 length];

      *(void *)(v0 + 248) = v37;
      sub_10004A1A8();

      *(_WORD *)(v35 + 22) = 1024;
      int v38 = *(unsigned __int8 *)(v32 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_requestOrigin);
      swift_release();
      *(_DWORD *)(v0 + 568) = v38 == 1;
      sub_10004A1A8();
      swift_release();
      *(_WORD *)(v35 + 28) = 2082;
      type metadata accessor for Key(0);
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_100049F78();
      unint64_t v41 = v40;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 264) = sub_1000095FC(v39, v41, v105);
      sub_10004A1A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, type, "Translating %ld characters (original %ld, image based: %{BOOL}d, ignored attributes: %{public}s", (uint8_t *)v35, 0x26u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v33 = (void *)&unk_100060000;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    uint64_t v42 = *(void *)(v0 + 536);
    id v43 = objc_allocWithZone((Class)_LTTextTranslationRequest);
    Class isa = sub_100048E18().super.isa;
    Class v45 = sub_100048E18().super.isa;
    id v46 = [v43 initWithSourceLocale:isa targetLocale:v45];

    [v46 setTaskHint:5];
    [v46 setText:v27];
    type metadata accessor for Key(0);
    Class v47 = sub_100049F58().super.isa;
    [v46 setIgnoringAttributes:v47];

    if (*(void *)(v42 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier + 8))
    {
      id v48 = v46;
      swift_bridgeObjectRetain();
      NSString v49 = sub_100049E78();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v50 = v46;
      NSString v49 = 0;
    }
    uint64_t v51 = *(void *)(v0 + 536);
    objc_msgSend(v46, "setAppIdentifier:", v49, v95);

    [v46 setSourceOrigin:*(unsigned __int8 *)(v51 + v33[199]) == 1];
    [v46 setIsFinal:1];
    uint64_t v52 = *(void **)(v51 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
    if (v52)
    {
      id v53 = v52;
      unint64_t v54 = sub_1000491E8();
      os_log_type_t v55 = sub_10004A068();
      uint64_t v56 = &LTUIViewServiceExtensionHostProtocol__prots;
      if (os_log_type_enabled(v54, v55))
      {
        os_log_type_t v101 = v55;
        uint64_t v57 = *(void *)(v0 + 368);
        uint64_t v58 = *(void *)(v0 + 376);
        uint64_t v96 = *(void *)(v0 + 360);
        id v59 = (uint8_t *)swift_slowAlloc();
        v105[0] = swift_slowAlloc();
        *(_DWORD *)id v59 = 136446210;
        id v60 = [v53 invocationId];
        sub_100048D88();

        uint64_t v61 = sub_100048D68();
        unint64_t v63 = v62;
        uint64_t v64 = v58;
        uint64_t v56 = &LTUIViewServiceExtensionHostProtocol__prots;
        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v64, v96);
        *(void *)(v0 + 312) = sub_1000095FC(v61, v63, v105);
        sub_10004A1A8();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v54, v101, "Setting logIdentifier on session to %{public}s", v59, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v69 = *(void *)(v0 + 368);
      uint64_t v68 = *(void *)(v0 + 376);
      uint64_t v70 = *(void *)(v0 + 360);
      id v71 = v46;
      id v72 = [v53 (SEL)v56[465].count];
      sub_100048D88();

      id v65 = sub_100048D78().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
      [v71 setLogIdentifier:v65];
    }
    else
    {
      id v65 = sub_1000491E8();
      os_log_type_t v66 = sub_10004A078();
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v67 = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Unable to obtain sessionID from invocation log", v67, 2u);
        swift_slowDealloc();
      }
    }

    uint64_t v73 = (void *)sub_10004A0A8();
    char v74 = sub_10004A0B8();

    if (v74) {
      [v46 setForcedOfflineTranslation:1];
    }
    uint64_t v75 = *(void *)(v0 + 464);
    uint64_t v76 = *(void *)(v0 + 472);
    uint64_t v98 = v76;
    *(void *)typea = *(void *)(v0 + 536);
    uint64_t v102 = v46;
    uint64_t v77 = *(void *)(v0 + 440);
    uint64_t v78 = *(void *)(v0 + 448);
    uint64_t v79 = *(void *)(v0 + 432);
    uint64_t v80 = *(void *)(v0 + 328);
    uint64_t v97 = *(void *)(v0 + 336);
    uint64_t v81 = swift_allocObject();
    swift_weakInit();
    uint64_t v82 = *(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16);
    v82(v76, v80, v79);
    v82(v75, v97, v79);
    uint64_t v83 = *(unsigned __int8 *)(v77 + 80);
    uint64_t v84 = (v83 + 25) & ~v83;
    uint64_t v85 = (v78 + v83 + v84) & ~v83;
    uint64_t v86 = swift_allocObject();
    *(void *)(v86 + 16) = v81;
    *(unsigned char *)(v86 + 24) = v103 & 1;
    uint64_t v87 = v86 + v84;
    uint64_t v88 = *(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32);
    v88(v87, v98, v79);
    v88(v86 + v85, v75, v79);
    *(void *)(v0 + 176) = sub_10003A83C;
    *(void *)(v0 + 184) = v86;
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 1107296256;
    *(void *)(v0 + 160) = sub_1000346C8;
    *(void *)(v0 + 168) = &unk_10005AD30;
    uint64_t v89 = _Block_copy((const void *)(v0 + 144));
    swift_release();
    [v102 setTextTranslationHandler:v89];
    _Block_release(v89);
    uint64_t v90 = *(void **)(*(void *)typea + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest);
    *(void *)(*(void *)typea + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest) = v102;
    id v91 = v102;

    id v92 = [objc_allocWithZone((Class)_LTTranslator) init];
    [v92 translate:v91];
    swift_release();
  }
  else
  {
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v93 = *(uint64_t (**)(void))(v0 + 8);
  return v93();
}

uint64_t sub_100031548()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 560) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 528);
  uint64_t v4 = *(void *)(v2 + 520);
  if (v0) {
    uint64_t v5 = sub_1000329CC;
  }
  else {
    uint64_t v5 = sub_100031684;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100031684()
{
  uint64_t v172 = v0;
  swift_release();
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 496);
  uint64_t v1 = *(void *)(v0 + 504);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v4 = *(void *)(v0 + 488);
  uint64_t v6 = *(void *)(v0 + 416);
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v7 = *(void *)(v0 + 392);
  uint64_t v154 = sub_100049208();
  sub_100009598(v154, (uint64_t)qword_1000605E0);
  uint64_t v157 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v157(v2, v1, v3);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v9(v6, v5, v8);
  uint64_t v10 = sub_1000491E8();
  os_log_type_t v11 = sub_10004A098();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v14 = *(void *)(v0 + 488);
  uint64_t v13 = *(void *)(v0 + 496);
  uint64_t v15 = *(void *)(v0 + 480);
  uint64_t v16 = *(void *)(v0 + 416);
  uint64_t v17 = *(void *)(v0 + 392);
  id v163 = *(id *)(v0 + 384);
  if (v12)
  {
    os_log_type_t type = v11;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v170 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136446466;
    sub_100038884(&qword_10005E878, (void (*)(uint64_t))&type metadata accessor for LocalePair);
    uint64_t v19 = sub_10004A2E8();
    *(void *)(v0 + 296) = sub_1000095FC(v19, v20, &v170);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    uint64_t v168 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v168(v13, v15);
    *(_WORD *)(v18 + 12) = 2082;
    uint64_t v21 = sub_100048F48();
    *(void *)(v0 + 272) = sub_1000095FC(v21, v22, &v170);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    id v23 = *(void (**)(uint64_t, id))(v17 + 8);
    v23(v16, v163);
    _os_log_impl((void *)&_mh_execute_header, v10, type, "On-device mode enabled, current pair: %{public}s state: %{public}s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v168 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v168(v13, v15);
    id v23 = *(void (**)(uint64_t, id))(v17 + 8);
    v23(v16, v163);
  }
  uint64_t v24 = *(void *)(v0 + 408);
  id v25 = *(void **)(v0 + 384);
  (*(void (**)(uint64_t, void, void *))(*(void *)(v0 + 392) + 104))(v24, enum case for LanguageState.availableForDownload(_:), v25);
  char v26 = sub_100048F58();
  v23(v24, v25);
  if (v26)
  {
    uint64_t v164 = (void (*)(uint64_t, uint64_t))v23;
    uint64_t v27 = *(void *)(v0 + 536);
    uint64_t v28 = *(void *)(v0 + 504);
    uint64_t v29 = *(void *)(v0 + 480);
    uint64_t v30 = *(void *)(v0 + 456);
    uint64_t v31 = *(void *)(v0 + 440);
    uint64_t v155 = *(void *)(v0 + 432);
    uint64_t v156 = *(void *)(v0 + 472);
    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v32 = swift_allocError();
    v157(v33, v28, v29);
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 304) = v32;
    uint64_t v161 = v27;
    swift_retain();
    sub_100049288();
    sub_100049EA8();
    sub_100004334(&qword_10005E870);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004BB60;
    *(void *)(inited + 32) = 0x656372756F73;
    *(void *)(inited + 40) = 0xE600000000000000;
    sub_100048E78();
    uint64_t v35 = sub_100048DF8();
    uint64_t v37 = v36;
    int v38 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v38(v30, v155);
    *(void *)(inited + 48) = v35;
    *(void *)(inited + 56) = v37;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 80) = 0x746567726174;
    *(void *)(inited + 88) = 0xE600000000000000;
    sub_100048E88();
    uint64_t v39 = sub_100048DF8();
    uint64_t v41 = v40;
    v38(v156, v155);
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 96) = v39;
    *(void *)(inited + 104) = v41;
    sub_100046C68(inited);
    id v42 = objc_allocWithZone((Class)NSError);
    NSString v43 = sub_100049E78();
    swift_bridgeObjectRelease();
    Class isa = sub_100049E28().super.isa;
    swift_bridgeObjectRelease();
    id v45 = [v42 initWithDomain:v43 code:11 userInfo:isa];

    id v46 = *(void **)(v161 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
    uint64_t v47 = *(void *)(v0 + 504);
    uint64_t v48 = *(void *)(v0 + 480);
    uint64_t v49 = *(void *)(v0 + 424);
    uint64_t v50 = *(void *)(v0 + 384);
    if (v46)
    {
      id v51 = v46;
      id v52 = v45;
      id v53 = (void *)sub_100048D18();

      [v51 endWithError:v53 qssSessionId:0];
      swift_release();
    }
    else
    {

      swift_release();
    }
    v164(v49, v50);
    uint64_t v65 = v47;
    uint64_t v66 = v48;
    goto LABEL_15;
  }
  uint64_t v55 = *(void *)(v0 + 392);
  uint64_t v54 = *(void *)(v0 + 400);
  uint64_t v56 = *(void *)(v0 + 384);
  v9(v54, *(void *)(v0 + 424), v56);
  int v57 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 88))(v54, v56);
  uint64_t v58 = *(void *)(v0 + 504);
  uint64_t v59 = *(void *)(v0 + 480);
  id v165 = *(id *)(v0 + 424);
  id v60 = *(uint64_t **)(v0 + 400);
  if (v57 == enum case for LanguageState.downloading(_:))
  {
    uint64_t v61 = *(void **)(v0 + 384);
    (*(void (**)(void, void *))(*(void *)(v0 + 392) + 96))(*(void *)(v0 + 400), v61);
    uint64_t v62 = *v60;
    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v63 = swift_allocError();
    *uint64_t v64 = v62;
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 256) = v63;
    swift_retain();
    sub_100049288();
    sub_100032AE8(v58);
    swift_release();
    v23((uint64_t)v165, v61);
    uint64_t v65 = v58;
    uint64_t v66 = v59;
LABEL_15:
    v168(v65, v66);
    goto LABEL_35;
  }
  uint64_t v67 = *(void **)(v0 + 384);
  v23((uint64_t)v60, v67);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 288) = 0;
  swift_retain();
  sub_100049288();
  v23((uint64_t)v165, v67);
  v168(v58, v59);
  Swift::Int v68 = sub_100049EE8();
  char v69 = sub_10004A128(v68);
  id v71 = v70;
  char v167 = v69;
  if (v69)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 572) = 1;
    swift_retain();
    sub_100049288();
    id v72 = [v71 string];
    uint64_t v73 = sub_100049EA8();
    uint64_t v75 = v74;

    uint64_t v170 = v73;
    uint64_t v171 = v75;
    swift_bridgeObjectRetain();
    v174._countAndFlagsBits = 10911970;
    v174._object = (void *)0xA300000000000000;
    sub_100049F18(v174);
    swift_bridgeObjectRelease();
    uint64_t v76 = v170;
    uint64_t v77 = v171;
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 232) = v76;
    *(void *)(v0 + 240) = v77;
  }
  else
  {
    id v78 = [v70 string];
    uint64_t v79 = sub_100049EA8();
    uint64_t v81 = v80;

    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 216) = v79;
    *(void *)(v0 + 224) = v81;
  }
  swift_retain();
  sub_100049288();
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v82 = *(void **)(v0 + 344);
  sub_100009598(v154, (uint64_t)qword_1000605E0);
  swift_retain_n();
  id v83 = v71;
  id v84 = v82;
  swift_bridgeObjectRetain_n();
  id v85 = v83;
  id v86 = v84;
  uint64_t v87 = sub_1000491E8();
  os_log_type_t v88 = sub_10004A098();
  BOOL v89 = os_log_type_enabled(v87, v88);
  uint64_t v90 = *(void *)(v0 + 536);
  id v91 = *(void **)(v0 + 344);
  id v169 = v85;
  if (v89)
  {
    uint64_t v92 = swift_slowAlloc();
    uint64_t v170 = swift_slowAlloc();
    *(_DWORD *)uint64_t v92 = 134218754;
    os_log_type_t v153 = v88;
    id v93 = [v169 length];

    *(void *)(v0 + 280) = v93;
    sub_10004A1A8();

    *(_WORD *)(v92 + 12) = 2048;
    id v94 = [v91 length];

    *(void *)(v0 + 248) = v94;
    sub_10004A1A8();

    *(_WORD *)(v92 + 22) = 1024;
    LODWORD(v93) = *(unsigned __int8 *)(v90 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_requestOrigin);
    swift_release();
    *(_DWORD *)(v0 + 568) = v93 == 1;
    sub_10004A1A8();
    swift_release();
    *(_WORD *)(v92 + 28) = 2082;
    type metadata accessor for Key(0);
    swift_bridgeObjectRetain();
    uint64_t v95 = sub_100049F78();
    unint64_t v97 = v96;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 264) = sub_1000095FC(v95, v97, &v170);
    sub_10004A1A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v87, v153, "Translating %ld characters (original %ld, image based: %{BOOL}d, ignored attributes: %{public}s", (uint8_t *)v92, 0x26u);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v85 = v169;
    swift_slowDealloc();

    uint64_t v98 = (void *)&unk_100060000;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    uint64_t v98 = &unk_100060000;
  }
  uint64_t v99 = *(void *)(v0 + 536);
  id v100 = objc_allocWithZone((Class)_LTTextTranslationRequest);
  Class v101 = sub_100048E18().super.isa;
  Class v102 = sub_100048E18().super.isa;
  id v103 = [v100 initWithSourceLocale:v101 targetLocale:v102];

  [v103 setTaskHint:5];
  [v103 setText:v85];
  type metadata accessor for Key(0);
  Class v104 = sub_100049F58().super.isa;
  [v103 setIgnoringAttributes:v104];

  if (*(void *)(v99 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier + 8))
  {
    id v105 = v103;
    swift_bridgeObjectRetain();
    NSString v106 = sub_100049E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v107 = v103;
    NSString v106 = 0;
  }
  uint64_t v108 = *(void *)(v0 + 536);
  [v103 setAppIdentifier:v106];

  [v103 setSourceOrigin:*(unsigned __int8 *)(v108 + v98[199]) == 1];
  [v103 setIsFinal:1];
  uint64_t v109 = *(void **)(v108 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
  if (v109)
  {
    id v110 = v109;
    uint64_t v111 = sub_1000491E8();
    os_log_type_t v112 = sub_10004A068();
    int v113 = &LTUIViewServiceExtensionHostProtocol__prots;
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v115 = *(void *)(v0 + 368);
      uint64_t v114 = *(void *)(v0 + 376);
      uint64_t v158 = *(void *)(v0 + 360);
      uint64_t v116 = (uint8_t *)swift_slowAlloc();
      uint64_t v170 = swift_slowAlloc();
      *(_DWORD *)uint64_t v116 = 136446210;
      id v117 = [v110 invocationId];
      sub_100048D88();

      uint64_t v118 = sub_100048D68();
      unint64_t v120 = v119;
      uint64_t v121 = v114;
      int v113 = &LTUIViewServiceExtensionHostProtocol__prots;
      (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v121, v158);
      *(void *)(v0 + 312) = sub_1000095FC(v118, v120, &v170);
      sub_10004A1A8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v111, v112, "Setting logIdentifier on session to %{public}s", v116, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v126 = *(void *)(v0 + 368);
    uint64_t v125 = *(void *)(v0 + 376);
    uint64_t v127 = *(void *)(v0 + 360);
    id v128 = v103;
    id v129 = [v110 (SEL)v113[465].count];
    sub_100048D88();

    uint64_t v122 = sub_100048D78().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v125, v127);
    [v128 setLogIdentifier:v122];
  }
  else
  {
    uint64_t v122 = sub_1000491E8();
    os_log_type_t v123 = sub_10004A078();
    if (os_log_type_enabled(v122, v123))
    {
      uint64_t v124 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v124 = 0;
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "Unable to obtain sessionID from invocation log", v124, 2u);
      swift_slowDealloc();
    }
  }

  uint64_t v130 = (void *)sub_10004A0A8();
  char v131 = sub_10004A0B8();

  if (v131) {
    [v103 setForcedOfflineTranslation:1];
  }
  uint64_t v133 = *(uint8_t **)(v0 + 464);
  uint64_t v132 = *(uint8_t **)(v0 + 472);
  buf = v132;
  uint64_t v162 = *(void *)(v0 + 536);
  id v166 = v103;
  uint64_t v134 = *(void *)(v0 + 440);
  uint64_t v135 = *(void *)(v0 + 448);
  uint64_t v136 = *(void *)(v0 + 432);
  uint64_t v137 = *(void *)(v0 + 328);
  uint64_t v159 = *(void *)(v0 + 336);
  uint64_t v138 = swift_allocObject();
  swift_weakInit();
  v139 = *(void (**)(uint8_t *, uint64_t, uint64_t))(v134 + 16);
  v139(v132, v137, v136);
  v139(v133, v159, v136);
  uint64_t v140 = *(unsigned __int8 *)(v134 + 80);
  uint64_t v141 = (v140 + 25) & ~v140;
  uint64_t v142 = (v135 + v140 + v141) & ~v140;
  uint64_t v143 = swift_allocObject();
  *(void *)(v143 + 16) = v138;
  *(unsigned char *)(v143 + 24) = v167 & 1;
  uint64_t v144 = v143 + v141;
  v145 = *(void (**)(uint64_t, uint8_t *, uint64_t))(v134 + 32);
  v145(v144, buf, v136);
  v145(v143 + v142, v133, v136);
  *(void *)(v0 + 176) = sub_10003A83C;
  *(void *)(v0 + 184) = v143;
  *(void *)(v0 + 144) = _NSConcreteStackBlock;
  *(void *)(v0 + 152) = 1107296256;
  *(void *)(v0 + 160) = sub_1000346C8;
  *(void *)(v0 + 168) = &unk_10005AD30;
  uint64_t v146 = _Block_copy((const void *)(v0 + 144));
  swift_release();
  [v166 setTextTranslationHandler:v146];
  _Block_release(v146);
  uint64_t v147 = *(void **)(v162 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest);
  *(void *)(v162 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest) = v166;
  id v148 = v166;

  id v149 = [objc_allocWithZone((Class)_LTTranslator) init];
  [v149 translate:v148];
  swift_release();

LABEL_35:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v150 = *(uint64_t (**)(void))(v0 + 8);
  return v150();
}

uint64_t sub_1000329CC()
{
  uint64_t v1 = v0[63];
  uint64_t v2 = v0[61];
  uint64_t v3 = v0[60];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100032AE8(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100048EA8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v8;
  __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)&v27 - v10;
  if (qword_10005D420 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100049208();
  sub_100009598(v12, (uint64_t)qword_100060580);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v32 = v6 + 16;
  v31(v11, a1, v5);
  uint64_t v13 = sub_1000491E8();
  os_log_type_t v14 = sub_10004A068();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v30 = v4;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v28 = v9;
    uint64_t v29 = v6;
    *(_DWORD *)uint64_t v16 = 136446210;
    uint64_t v17 = sub_100048E98();
    uint64_t v34 = sub_1000095FC(v17, v18, &v35);
    uint64_t v9 = v28;
    uint64_t v6 = v29;
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Download language pair: %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v30;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }

  type metadata accessor for TranslationModel.TranslationError(0);
  sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
  uint64_t v19 = swift_allocError();
  void *v20 = 0;
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v35 = v19;
  swift_retain();
  sub_100049288();
  uint64_t v21 = sub_10004A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  uint64_t v22 = swift_allocObject();
  swift_weakInit();
  v31(v9, a1, v5);
  sub_100049FF8();
  swift_retain();
  uint64_t v23 = sub_100049FE8();
  unint64_t v24 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  id v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = v23;
  *((void *)v25 + 3) = &protocol witness table for MainActor;
  *((void *)v25 + 4) = v22;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v25[v24], v9, v5);
  swift_release();
  sub_100025868((uint64_t)v4, (uint64_t)&unk_10005E888, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_100032FA0(void *a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, char *a7)
{
  uint64_t v40 = a6;
  uint64_t v41 = a7;
  int v43 = a5;
  uint64_t v10 = sub_100048E48();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v17 = sub_100004334(&qword_10005D968);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v20 = [a1 string];
    uint64_t v21 = sub_100049EA8();
    uint64_t v38 = v22;
    uint64_t v39 = v21;
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v39 = 0;
  }
  uint64_t v23 = sub_10004A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v19, 1, 1, v23);
  uint64_t v24 = swift_allocObject();
  uint64_t v37 = v19;
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  id v25 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v25(v16, v40, v10);
  v25(v14, (uint64_t)v41, v10);
  sub_100049FF8();
  swift_retain();
  swift_errorRetain();
  id v26 = a2;
  uint64_t v27 = sub_100049FE8();
  uint64_t v28 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v29 = (v28 + 73) & ~v28;
  uint64_t v41 = v14;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = (v42 + v28 + v29) & ~v28;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v27;
  *(void *)(v33 + 24) = &protocol witness table for MainActor;
  *(void *)(v33 + 32) = v24;
  *(void *)(v33 + 40) = v31;
  uint64_t v34 = v39;
  *(void *)(v33 + 48) = v30;
  *(void *)(v33 + 56) = v34;
  *(void *)(v33 + 64) = v38;
  *(unsigned char *)(v33 + 72) = v43 & 1;
  uint64_t v35 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v35(v33 + v29, v16, v10);
  v35(v33 + v32, v41, v10);
  swift_release();
  sub_100025868((uint64_t)v37, (uint64_t)&unk_10005E8D0, v33);
  return swift_release();
}

uint64_t sub_1000332D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 152) = v16;
  *(void *)(v8 + 160) = v17;
  *(unsigned char *)(v8 + 289) = v15;
  *(void *)(v8 + 136) = a7;
  *(void *)(v8 + 144) = a8;
  *(void *)(v8 + 120) = a5;
  *(void *)(v8 + 128) = a6;
  *(void *)(v8 + 112) = a4;
  sub_100004334(&qword_10005D8A0);
  *(void *)(v8 + 168) = swift_task_alloc();
  uint64_t v9 = sub_1000491C8();
  *(void *)(v8 + 176) = v9;
  *(void *)(v8 + 184) = *(void *)(v9 - 8);
  *(void *)(v8 + 192) = swift_task_alloc();
  uint64_t v10 = sub_100048CF8();
  *(void *)(v8 + 200) = v10;
  *(void *)(v8 + 208) = *(void *)(v10 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  sub_100004334(&qword_10005E718);
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = swift_task_alloc();
  *(void *)(v8 + 240) = swift_task_alloc();
  sub_100049FF8();
  *(void *)(v8 + 248) = sub_100049FE8();
  uint64_t v12 = sub_100049FD8();
  *(void *)(v8 + 256) = v12;
  *(void *)(v8 + 264) = v11;
  return _swift_task_switch(sub_1000334C0, v12, v11);
}

void sub_1000334C0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 272) = Strong;
  if (!Strong)
  {
    swift_release();
LABEL_26:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v37 = *(void (**)(void))(v0 + 8);
    v37();
    return;
  }
  uint64_t v2 = Strong;
  uint64_t v3 = OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest;
  uint64_t v4 = *(void **)(Strong + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_inProgressRequest);
  if (v4 && (id v5 = [v4 qssSessionID]) != 0)
  {
    uint64_t v6 = v5;
    sub_100049EA8();

    sub_100048D58();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 240);
    uint64_t v8 = sub_100048D98();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  }
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v10 = *(void **)(v2 + v3);
  *(void *)(v2 + v3) = 0;

  if (v9)
  {
    swift_errorRetain();
    swift_release();
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100049208();
    sub_100009598(v11, (uint64_t)qword_1000605E0);
    swift_errorRetain();
    uint64_t v12 = sub_1000491E8();
    os_log_type_t v13 = sub_10004A078();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      int v57 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      uint64_t v15 = sub_100048D18();
      *(void *)(v0 + 104) = v15;
      sub_10004A1A8();
      *int v57 = v15;
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to translate: %@", v14, 0xCu);
      sub_100004334(&qword_10005E8A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
    }
    uint64_t v25 = *(void *)(v0 + 120);

    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 96) = v25;
    swift_errorRetain();
    swift_retain();
    sub_100049288();
    id v26 = *(void **)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
    uint64_t v27 = *(void *)(v0 + 240);
    if (v26)
    {
      uint64_t v28 = *(void *)(v0 + 232);
      id v29 = v26;
      uint64_t v30 = (void *)sub_100048D18();
      sub_100005488(v27, v28, &qword_10005E718);
      uint64_t v31 = sub_100048D98();
      uint64_t v32 = *(void *)(v31 - 8);
      Class isa = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v28, 1, v31) != 1)
      {
        uint64_t v34 = *(void *)(v0 + 232);
        Class isa = sub_100048D78().super.isa;
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v31);
      }
      uint64_t v35 = *(void *)(v0 + 240);
      [v29 endWithError:v30 qssSessionId:isa];

      swift_release();
      swift_errorRelease();
      uint64_t v36 = v35;
    }
    else
    {
      swift_release();
      swift_errorRelease();
      uint64_t v36 = v27;
    }
    sub_1000054EC(v36, &qword_10005E718);
    goto LABEL_26;
  }
  uint64_t v16 = *(void **)(v0 + 128);
  if (v16)
  {
    uint64_t v17 = *(void **)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult);
    *(void *)(v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_translationResult) = v16;
    id v18 = v16;

    unint64_t v19 = sub_100025BF0()[2];
    swift_bridgeObjectRelease();
    if (v19 > 1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 88) = 0;
      swift_retain();
      sub_100049288();
    }
    if (qword_10005D440 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_100049208();
    sub_100009598(v20, (uint64_t)qword_1000605E0);
    swift_retain_n();
    uint64_t v21 = sub_1000491E8();
    os_log_type_t v22 = sub_10004A068();
    if (os_log_type_enabled(v21, v22))
    {
      id v60 = v18;
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 134217984;
      uint64_t v24 = sub_100025BF0()[2];
      swift_bridgeObjectRelease();
      swift_release();
      *(void *)(v0 + 80) = v24;
      sub_10004A1A8();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Disambiguation items: %ld", v23, 0xCu);
      id v18 = v60;
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    id v38 = [v18 translations];
    sub_10000A3C8(0, &qword_10005E7B8);
    unint64_t v39 = sub_100049F68();

    if (v39 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_10004A2A8();
      swift_bridgeObjectRelease();
      if (v42) {
        goto LABEL_32;
      }
    }
    else if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_32:
      if ((v39 & 0xC000000000000001) != 0)
      {
        id v40 = (id)sub_10004A268();
      }
      else
      {
        if (!*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v40 = *(id *)(v39 + 32);
      }
      uint64_t v41 = v40;
      swift_bridgeObjectRelease();
      if ([v41 isLowConfidence])
      {
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 288) = 0;
        swift_retain();
        sub_100049288();
      }

      goto LABEL_40;
    }
    swift_bridgeObjectRelease();
  }
LABEL_40:
  uint64_t v43 = *(void *)(v0 + 144);
  if (!v43)
  {
LABEL_44:
    uint64_t v44 = *(void *)(v0 + 136);
    goto LABEL_45;
  }
  if (*(unsigned char *)(v0 + 289) != 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_44;
  }
  uint64_t v61 = *(void *)(v0 + 136);
  swift_bridgeObjectRetain();
  v63._countAndFlagsBits = 10911970;
  v63._object = (void *)0xA300000000000000;
  sub_100049F18(v63);
  uint64_t v44 = v61;
LABEL_45:
  uint64_t v45 = *(void *)(v0 + 184);
  uint64_t v58 = *(void *)(v0 + 168);
  uint64_t v59 = *(void *)(v0 + 176);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 64) = v44;
  *(void *)(v0 + 72) = v43;
  swift_retain();
  sub_100049288();
  sub_10002DE70();
  sub_100004334(&qword_10005E8D8);
  sub_100048C98();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10004BB60;
  sub_100048DB8();
  sub_100048C88();
  swift_bridgeObjectRelease();
  sub_100048DB8();
  sub_100048C88();
  swift_bridgeObjectRelease();
  sub_100048CE8();
  sub_100048CA8();
  uint64_t v46 = sub_100048CB8();
  if (v47) {
    uint64_t v48 = v46;
  }
  else {
    uint64_t v48 = 0;
  }
  if (v47) {
    unint64_t v49 = v47;
  }
  else {
    unint64_t v49 = 0xE000000000000000;
  }
  uint64_t v50 = v2 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_cplIntervalID;
  swift_beginAccess();
  sub_100005488(v50, v58, &qword_10005D8A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v58, 1, v59) == 1)
  {
    uint64_t v51 = *(void *)(v0 + 168);
    swift_bridgeObjectRelease();
    sub_1000054EC(v51, &qword_10005D8A0);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 184) + 32))(*(void *)(v0 + 192), *(void *)(v0 + 168), *(void *)(v0 + 176));
    sub_10004A138();
    if (qword_10005D450 != -1) {
      swift_once();
    }
    uint64_t v53 = *(void *)(v0 + 184);
    uint64_t v52 = *(void *)(v0 + 192);
    uint64_t v54 = *(void *)(v0 + 176);
    sub_100004334(&qword_10005DDA8);
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_10004B740;
    *(void *)(v55 + 56) = &type metadata for String;
    *(void *)(v55 + 64) = sub_100015D40();
    *(void *)(v55 + 32) = v48;
    *(void *)(v55 + 40) = v49;
    sub_1000491B8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
  }
  uint64_t v56 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v56;
  *uint64_t v56 = v0;
  v56[1] = sub_10003401C;
  sub_100034308();
}

uint64_t sub_10003401C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 264);
  uint64_t v3 = *(void *)(v1 + 256);
  return _swift_task_switch(sub_10003413C, v3, v2);
}

uint64_t sub_10003413C()
{
  uint64_t v1 = v0[34];
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_selfInvocation);
  if (v2)
  {
    uint64_t v3 = v0[28];
    sub_100005488(v0[30], v3, &qword_10005E718);
    uint64_t v4 = sub_100048D98();
    uint64_t v5 = *(void *)(v4 - 8);
    int v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
    id v7 = v2;
    Class isa = 0;
    if (v6 != 1)
    {
      uint64_t v9 = v0[28];
      Class isa = sub_100048D78().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v4);
    }
    [v7 endSuccessfullyWithQSSSessionId:isa];
  }
  swift_release();
  uint64_t v10 = v0[30];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  sub_1000054EC(v10, &qword_10005E718);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100034308()
{
  v1[2] = v0;
  sub_100004334(&qword_10005E900);
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_1000490B8();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  sub_100049FF8();
  v1[7] = sub_100049FE8();
  uint64_t v4 = sub_100049FD8();
  return _swift_task_switch(sub_10003442C, v4, v3);
}

uint64_t sub_10003442C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_release();
  sub_1000348F8(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1000054EC(*(void *)(v0 + 24), &qword_10005E900);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 68) = 0;
    swift_retain();
    sub_100049288();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 40) + 32))(*(void *)(v0 + 48), *(void *)(v0 + 24), *(void *)(v0 + 32));
    id v4 = sub_100027A30();
    char v5 = sub_1000490C8();

    if (qword_10005D428 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100049208();
    sub_100009598(v6, (uint64_t)qword_100060598);
    id v7 = sub_1000491E8();
    os_log_type_t v8 = sub_10004A068();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      *(_DWORD *)(v0 + 64) = v5 & 1;
      sub_10004A1A8();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "TranslationModel isFavorite: %{BOOL}d", v9, 8u);
      swift_slowDealloc();
    }

    uint64_t v11 = *(void *)(v0 + 40);
    uint64_t v10 = *(void *)(v0 + 48);
    uint64_t v12 = *(void *)(v0 + 32);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 69) = v5 & 1;
    swift_retain();
    sub_100049288();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

void sub_1000346C8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(a2, a3, a4);
  swift_release();
}

uint64_t sub_100034770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10004A018();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_10004A008();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1000054EC(a1, &qword_10005D968);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100049FD8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1000348F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100004334(&qword_10005D818);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  id v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v33 - v8;
  uint64_t v10 = sub_100048E48();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v36 = (char *)&v33 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  id v18 = (char *)&v33 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v33 - v19;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v38 = v2;
  sub_100049278();
  swift_release();
  swift_release();
  uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v21(v9, 1, v10) == 1)
  {
    sub_1000054EC((uint64_t)v9, &qword_10005D818);
  }
  else
  {
    uint64_t v34 = v18;
    uint64_t v35 = a1;
    os_log_type_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v22(v20, v9, v10);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049278();
    swift_release();
    swift_release();
    if (v21(v7, 1, v10) == 1)
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v10);
      sub_1000054EC((uint64_t)v7, &qword_10005D818);
    }
    else
    {
      uint64_t v23 = v34;
      v22(v34, v7, v10);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100049278();
      swift_release();
      swift_release();
      if (v40)
      {
        uint64_t v24 = v39;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100049278();
        swift_release();
        swift_release();
        if (v40)
        {
          uint64_t v38 = v39;
          uint64_t v33 = v24;
          uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
          v25(v36, v20, v10);
          id v26 = v34;
          v25(v37, v34, v10);
          uint64_t v27 = v35;
          sub_1000490A8();
          uint64_t v28 = *(void (**)(char *, uint64_t))(v11 + 8);
          v28(v26, v10);
          v28(v20, v10);
          uint64_t v29 = sub_1000490B8();
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v27, 0, 1, v29);
        }
        swift_bridgeObjectRelease();
        uint64_t v31 = *(void (**)(char *, uint64_t))(v11 + 8);
        v31(v34, v10);
      }
      else
      {
        uint64_t v31 = *(void (**)(char *, uint64_t))(v11 + 8);
        v31(v23, v10);
      }
      v31(v20, v10);
    }
    a1 = v35;
  }
  uint64_t v32 = sub_1000490B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(a1, 1, 1, v32);
}

uint64_t sub_100034DD4()
{
  uint64_t v0 = sub_100004334(&qword_10005E900);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000490B8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000348F8((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_1000054EC((uint64_t)v2, &qword_10005E900);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = sub_100027A30();
  char v9 = sub_1000490C8();

  if (v9)
  {
    if (qword_10005D428 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100049208();
    sub_100009598(v10, (uint64_t)qword_100060598);
    uint64_t v11 = sub_1000491E8();
    os_log_type_t v12 = sub_10004A068();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Skip adding to favorite, already done so", v13, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    char v18 = 1;
    swift_retain();
    sub_100049288();
    id v14 = sub_100027A30();
    sub_100049098();

    char v18 = 2;
    uint64_t v19 = 0x6D6574737973;
    unint64_t v20 = 0xE600000000000000;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    NSString v15 = sub_100049E78();
    sub_100046D94();
    sub_10000A3C8(0, (unint64_t *)&qword_10005D8B8);
    Class isa = sub_100049E28().super.isa;
    swift_bridgeObjectRelease();
    AnalyticsSendEvent();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10003511C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v6 = sub_100048F68();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  sub_100004334(&qword_10005D9A0);
  v5[19] = swift_task_alloc();
  uint64_t v7 = sub_100004334(&qword_10005E890);
  v5[20] = v7;
  v5[21] = *(void *)(v7 - 8);
  v5[22] = swift_task_alloc();
  uint64_t v8 = sub_100004334(&qword_10005E898);
  v5[23] = v8;
  v5[24] = *(void *)(v8 - 8);
  v5[25] = swift_task_alloc();
  v5[26] = sub_100049FF8();
  v5[27] = sub_100049FE8();
  uint64_t v10 = sub_100049FD8();
  v5[28] = v10;
  v5[29] = v9;
  return _swift_task_switch(sub_100035320, v10, v9);
}

uint64_t sub_100035320()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 240) = Strong;
  if (Strong)
  {
    uint64_t v3 = *(void *)(v0 + 168);
    uint64_t v2 = *(void *)(v0 + 176);
    uint64_t v4 = *(void *)(v0 + 160);
    sub_100049118();
    sub_10004A028();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    *(_DWORD *)(v0 + 280) = enum case for LanguageState.downloading(_:);
    *(_DWORD *)(v0 + 284) = enum case for LanguageState.installed(_:);
    *(_DWORD *)(v0 + 288) = enum case for LanguageState.availableForDownload(_:);
    uint64_t v5 = sub_100049FE8();
    *(void *)(v0 + 248) = v5;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v6;
    void *v6 = v0;
    v6[1] = sub_100035510;
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v8 = *(void *)(v0 + 152);
    return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF(v8, v5, &protocol witness table for MainActor, v7, v0 + 40);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_100035510()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 224);
  uint64_t v4 = *(void *)(v2 + 232);
  if (v0) {
    uint64_t v5 = sub_100035FE4;
  }
  else {
    uint64_t v5 = sub_100035630;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100035630()
{
  uint64_t v54 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 120);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
    swift_release();
    if (qword_10005D420 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100049208();
    sub_100009598(v4, (uint64_t)qword_100060580);
    uint64_t v5 = sub_1000491E8();
    os_log_type_t v6 = sub_10004A058();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Download language pair finish", v7, 2u);
      swift_slowDealloc();
    }

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(*(void *)(v0 + 144), v1, v2);
  if (qword_10005D420 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v11 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 112);
  uint64_t v13 = *(void *)(v0 + 120);
  uint64_t v14 = sub_100049208();
  sub_100009598(v14, (uint64_t)qword_100060580);
  NSString v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v15(v10, v11, v12);
  uint64_t v16 = sub_1000491E8();
  os_log_type_t v17 = sub_10004A058();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v19 = *(void *)(v0 + 136);
  uint64_t v20 = *(void *)(v0 + 112);
  uint64_t v21 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 120) + 8);
  if (v18)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136446210;
    uint64_t v23 = sub_100048F48();
    *(void *)(v22 + 4) = sub_1000095FC(v23, v24, &v53);
    swift_bridgeObjectRelease();
    uint64_t v25 = *v21;
    (*v21)(v19, v20);
    id v26 = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Download language yield: %{public}s", (uint8_t *)v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v27 = *v21;
    (*v21)(*(void *)(v0 + 136), *(void *)(v0 + 112));
    id v26 = v27;
  }

  *(void *)(v0 + 264) = v26;
  int v28 = *(_DWORD *)(v0 + 280);
  uint64_t v30 = *(void *)(v0 + 120);
  uint64_t v29 = *(void *)(v0 + 128);
  uint64_t v31 = *(void *)(v0 + 112);
  v15(v29, *(void *)(v0 + 144), v31);
  int v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 88))(v29, v31);
  if (v32 == v28)
  {
    uint64_t v33 = *(void *)(v0 + 144);
    uint64_t v34 = *(uint64_t **)(v0 + 128);
    uint64_t v35 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v0 + 120) + 96))(v34, v35);
    uint64_t v36 = *v34;
    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v37 = swift_allocError();
    *uint64_t v38 = v36;
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 80) = v37;
    swift_retain();
    sub_100049288();
    v26(v33, v35);
LABEL_23:
    uint64_t v48 = sub_100049FE8();
    *(void *)(v0 + 248) = v48;
    unint64_t v49 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v49;
    *unint64_t v49 = v0;
    v49[1] = sub_100035510;
    uint64_t v50 = *(void *)(v0 + 184);
    uint64_t v51 = *(void *)(v0 + 152);
    return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF(v51, v48, &protocol witness table for MainActor, v50, v0 + 40);
  }
  int v39 = v32;
  if (v32 != *(_DWORD *)(v0 + 284))
  {
    int v42 = *(_DWORD *)(v0 + 288);
    type metadata accessor for TranslationModel.TranslationError(0);
    sub_100038884(&qword_10005E830, (void (*)(uint64_t))type metadata accessor for TranslationModel.TranslationError);
    uint64_t v44 = swift_allocError();
    uint64_t v45 = *(void *)(v0 + 144);
    if (v39 == v42)
    {
      uint64_t v46 = *(void *)(v0 + 112);
      *uint64_t v43 = 0;
      swift_storeEnumTagMultiPayload();
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 88) = v44;
      swift_retain();
      sub_100049288();
      v26(v45, v46);
    }
    else
    {
      uint64_t v52 = *(void *)(v0 + 128);
      uint64_t v47 = *(void *)(v0 + 112);
      swift_storeEnumTagMultiPayload();
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 64) = v44;
      swift_retain();
      sub_100049288();
      v26(v45, v47);
      v26(v52, v47);
    }
    goto LABEL_23;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 72) = 0;
  swift_retain();
  sub_100049288();
  uint64_t v40 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v40;
  *uint64_t v40 = v0;
  v40[1] = sub_100035DDC;
  uint64_t v41 = *(void *)(v0 + 104);
  return sub_100036248(v41);
}

uint64_t sub_100035DDC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 232);
  uint64_t v3 = *(void *)(v1 + 224);
  return _swift_task_switch(sub_100035EFC, v3, v2);
}

uint64_t sub_100035EFC()
{
  (*(void (**)(void, void))(v0 + 264))(*(void *)(v0 + 144), *(void *)(v0 + 112));
  uint64_t v1 = sub_100049FE8();
  *(void *)(v0 + 248) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100035510;
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 152);
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF(v4, v1, &protocol witness table for MainActor, v3, v0 + 40);
}

uint64_t sub_100035FE4()
{
  uint64_t v2 = v0[24];
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[23];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[5];
  if (qword_10005D420 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100049208();
  sub_100009598(v5, (uint64_t)qword_100060580);
  swift_errorRetain();
  uint64_t v6 = sub_1000491E8();
  os_log_type_t v7 = sub_10004A078();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    uint64_t v10 = sub_100048D18();
    v0[7] = v10;
    sub_10004A1A8();
    *uint64_t v9 = v10;
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Download language pair failure: %@", v8, 0xCu);
    sub_100004334(&qword_10005E8A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
  }

  swift_getKeyPath();
  swift_getKeyPath();
  v0[6] = v4;
  sub_100049288();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100036248(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  sub_100004334(&qword_10005D968);
  v2[6] = swift_task_alloc();
  sub_100004334(&qword_10005D818);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  uint64_t v3 = sub_100048EA8();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = sub_100049FF8();
  v2[13] = sub_100049FE8();
  uint64_t v5 = sub_100049FD8();
  return _swift_task_switch(sub_1000363B0, v5, v4);
}

uint64_t sub_1000363B0()
{
  uint64_t v28 = v0;
  swift_release();
  if (qword_10005D420 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = sub_100049208();
  sub_100009598(v5, (uint64_t)qword_100060580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  uint64_t v6 = sub_1000491E8();
  os_log_type_t v7 = sub_10004A058();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = *(void *)(v0 + 80);
  uint64_t v9 = *(void *)(v0 + 88);
  if (v8)
  {
    uint64_t v26 = *(void *)(v0 + 72);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v12 = sub_100048E98();
    *(void *)(v0 + 24) = sub_1000095FC(v12, v13, &v27);
    sub_10004A1A8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v26);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Complete download for pair: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  }

  uint64_t v15 = *(void *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 64);
  uint64_t v25 = *(void *)(v0 + 48);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 16) = 0;
  swift_retain();
  sub_100049288();
  sub_100048E88();
  uint64_t v16 = sub_100048E48();
  os_log_type_t v17 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v14, 0, 1, v16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488(v14, v15, &qword_10005D818);
  swift_retain();
  sub_100049288();
  sub_1000054EC(v14, &qword_10005D818);
  sub_100048E78();
  v17(v14, 0, 1, v16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100005488(v14, v15, &qword_10005D818);
  swift_retain();
  sub_100049288();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v18 = v0;
  *(unsigned char *)(v0 + 112) = 0;
  swift_retain();
  sub_100049288();
  sub_1000054EC(v14, &qword_10005D818);
  uint64_t v19 = sub_10004A018();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v25, 1, 1, v19);
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  uint64_t v21 = sub_100049FE8();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v21;
  v22[3] = &protocol witness table for MainActor;
  v22[4] = v20;
  swift_release();
  sub_100025A14(v25, (uint64_t)&unk_10005E8B8, (uint64_t)v22);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v18 + 8);
  return v23();
}

uint64_t sub_10003689C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a1;
  v4[12] = a4;
  sub_100004334(&qword_10005D818);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  sub_100049FF8();
  v4[15] = sub_100049FE8();
  uint64_t v6 = sub_100049FD8();
  return _swift_task_switch(sub_100036974, v6, v5);
}

uint64_t sub_100036974()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    swift_beginAccess();
    uint64_t v2 = swift_weakLoadStrong();
    uint64_t v3 = *(void *)(v0 + 112);
    if (v2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100049278();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      uint64_t v4 = sub_100048E48();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    }
    swift_beginAccess();
    uint64_t v5 = swift_weakLoadStrong();
    uint64_t v6 = *(void *)(v0 + 104);
    if (v5)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100049278();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      uint64_t v7 = sub_100048E48();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
    }
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 112);
    sub_10002C854(v8, v9);
    swift_release();
    sub_1000054EC(v9, &qword_10005D818);
    sub_1000054EC(v8, &qword_10005D818);
  }
  **(unsigned char **)(v0 + 88) = Strong == 0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100036BE8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__suggestedLocales;
  uint64_t v2 = sub_100004334(&qword_10005E6E0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__lowConfidenceLocales, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__error;
  uint64_t v5 = sub_100004334(&qword_10005E6E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__sourceLocale;
  uint64_t v7 = sub_100004334(&qword_10005E6F0);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  uint64_t v9 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__sourceText;
  uint64_t v10 = sub_100004334(&qword_10005E6F8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  uint64_t v12 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__sourceLocaleWasDetected;
  uint64_t v13 = sub_100004334(&qword_10005E428);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  uint64_t v15 = v12;
  uint64_t v16 = v13;
  ((void (*)(uint64_t))v14)(v15);
  v8(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__targetLocale, v7);
  v11(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__targetText, v10);
  sub_10000A374(*(void *)(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_consentHandler));
  uint64_t v17 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__translationAnnotation;
  uint64_t v18 = sub_100004334(&qword_10005E700);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  uint64_t v19 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__availableLocales;
  uint64_t v20 = sub_100004334(&qword_10005E708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  v14(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__replacementAvailable, v16);
  swift_release();
  v14(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__firstUseConsent, v16);

  uint64_t v21 = v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__selectedDisambiguation;
  uint64_t v22 = sub_100004334(&qword_10005E710);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  sub_1000054EC(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_cplIntervalID, &qword_10005D8A0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v14(v0 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel__isFavorite, v16);

  return v0;
}

uint64_t sub_100037000()
{
  sub_100036BE8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100037058()
{
  return type metadata accessor for TranslationModel(0);
}

uint64_t type metadata accessor for TranslationModel(uint64_t a1)
{
  return sub_100010174(a1, (uint64_t *)&unk_10005E510);
}

void sub_100037080()
{
  sub_1000373E4(319, &qword_10005E520, &qword_10005D970);
  if (v0 <= 0x3F)
  {
    sub_1000373E4(319, &qword_10005E528, &qword_10005E530);
    if (v1 <= 0x3F)
    {
      sub_1000373E4(319, &qword_10005E538, &qword_10005D818);
      if (v2 <= 0x3F)
      {
        sub_1000373E4(319, &qword_10005E540, &qword_10005D830);
        if (v3 <= 0x3F)
        {
          sub_100037434(319, (unint64_t *)&qword_10005E378);
          if (v4 <= 0x3F)
          {
            sub_1000373E4(319, &qword_10005E548, &qword_10005E550);
            if (v5 <= 0x3F)
            {
              sub_1000373E4(319, &qword_10005E558, &qword_10005E560);
              if (v6 <= 0x3F)
              {
                sub_100037434(319, &qword_10005E568);
                if (v7 <= 0x3F)
                {
                  sub_10003747C();
                  if (v8 <= 0x3F) {
                    swift_updateClassMetadata2();
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

void sub_1000373E4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_1000044D8(a3);
    unint64_t v4 = sub_100049298();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_100037434(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_100049298();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_10003747C()
{
  if (!qword_10005E570)
  {
    sub_1000491C8();
    unint64_t v0 = sub_10004A198();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005E570);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for TranslationModel.TranslationAnnotation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000375A0);
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

uint64_t sub_1000375C8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000375D0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TranslationModel.TranslationAnnotation()
{
  return &type metadata for TranslationModel.TranslationAnnotation;
}

unint64_t sub_1000375F0()
{
  unint64_t result = qword_10005E6D8;
  if (!qword_10005E6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E6D8);
  }
  return result;
}

uint64_t sub_100037644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049238();
  *a1 = result;
  return result;
}

uint64_t sub_1000376B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_10003BCC4;
  return sub_100029BF4(a1, v4, v5, v6);
}

uint64_t sub_100037764()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003779C()
{
  return sub_10002A254();
}

uint64_t sub_1000377A4(uint64_t a1, uint64_t a2)
{
  return sub_10002B010(a1, a2);
}

uint64_t sub_1000377AC(uint64_t a1)
{
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = sub_100004334(&qword_10005D810);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_1000377F8(char *a1)
{
  return sub_10002CB18(a1);
}

uint64_t sub_100037800(uint64_t *a1)
{
  return sub_10002D38C(a1);
}

uint64_t sub_10003780C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10003BCC4;
  v4[11] = v2;
  v4[12] = v3;
  return _swift_task_switch(sub_10002D518, 0, 0);
}

uint64_t sub_1000378B8@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_1000378CC()
{
  return sub_100009528();
}

uint64_t sub_1000378E0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100037960()
{
  return sub_100049288();
}

uint64_t sub_1000379DC@<X0>(void *a1@<X8>)
{
  return sub_100037AA8(a1);
}

uint64_t sub_1000379F0()
{
  return sub_100049288();
}

uint64_t sub_100037A6C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_100037A80()
{
  return sub_100009528();
}

uint64_t sub_100037A94@<X0>(void *a1@<X8>)
{
  return sub_100037AA8(a1);
}

uint64_t sub_100037AA8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100037B24()
{
  return sub_100049288();
}

uint64_t sub_100037BA0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100037C7C;
  return v6(a1);
}

uint64_t sub_100037C7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100037D74(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10003BCC4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005E7A8 + dword_10005E7A8);
  return v6(a1, v4);
}

double sub_100037E2C@<D0>(_OWORD *a1@<X8>)
{
  return sub_1000267F4(a1);
}

uint64_t sub_100037E54()
{
  return sub_100026884();
}

uint64_t sub_100037E7C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004334(&qword_10005E8D8);
  uint64_t v10 = *(void *)(sub_100048C98() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_10004A288();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100048C98() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10003B5E4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

double sub_1000380E4@<D0>(_OWORD *a1@<X8>)
{
  return sub_1000267F4(a1);
}

uint64_t sub_10003810C()
{
  return sub_100026884();
}

uint64_t sub_100038134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005D818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000381A0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000381E0()
{
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_10003BCC4;
  *(void *)(v4 + 40) = v3;
  *(unsigned char *)(v4 + 64) = v2;
  return _swift_task_switch(sub_10002CCAC, 0, 0);
}

uint64_t sub_100038294@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_1000382BC()
{
  return sub_100009528();
}

uint64_t sub_1000382E4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003832C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10003BCC4;
  return sub_10002ED5C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000383F4()
{
  uint64_t v1 = sub_100048E48();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v18 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v18 + 40) & ~v18;
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = (int *)type metadata accessor for TranslationRequestContext();
  uint64_t v6 = *(unsigned __int8 *)(*((void *)v5 - 1) + 80);
  uint64_t v16 = *(void *)(*((void *)v5 - 1) + 64);
  swift_unknownObjectRelease();
  swift_release();
  BOOL v15 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v15(v0 + v3, v1);
  uint64_t v17 = (v3 + v4 + v6) & ~v6;
  uint64_t v7 = v0 + v17;

  swift_bridgeObjectRelease();
  uint64_t v8 = v0 + v17 + v5[8];
  uint64_t v9 = sub_1000491C8();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v7 + v5[12];
  unint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (!v12(v11, 1, v1)) {
    v15(v11, v1);
  }
  uint64_t v13 = v7 + v5[13];
  if (!v12(v13, 1, v1)) {
    v15(v13, v1);
  }

  return _swift_deallocObject(v0, v17 + v16, v18 | v6 | 7);
}

uint64_t sub_100038674(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(sub_100048E48() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(type metadata accessor for TranslationRequestContext() - 8) + 80);
  unint64_t v9 = v6 + v7 + v8;
  uint64_t v10 = *(void *)(v1 + 32);
  uint64_t v11 = v1 + v6;
  uint64_t v12 = v1 + (v9 & ~v8);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v13;
  *uint64_t v13 = v3;
  v13[1] = sub_10003BCC4;
  v13[7] = v11;
  v13[8] = v12;
  v13[5] = a1;
  v13[6] = v10;
  return _swift_task_switch(sub_10002EB04, 0, 0);
}

uint64_t sub_1000387D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10003BCC4;
  return sub_10002E8E0(a1, v4, v5, v6);
}

uint64_t sub_100038884(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000388CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100038980(a1, a2, a3, (void *)*v3, &qword_10005EA00, type metadata accessor for TranslationModel.LocaleInfo);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100038908(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100038980(a1, a2, a3, (void *)*v3, &qword_10005E9F8, (uint64_t (*)(void))&type metadata accessor for LanguageModel);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100038944(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100038980(a1, a2, a3, (void *)*v3, &qword_10005E8F0, (uint64_t (*)(void))&type metadata accessor for DisambiguationView.Item);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100038980(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004334(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  unint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_10004A2C8();
  __break(1u);
  return result;
}

uint64_t sub_100038BC8(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_100038884(&qword_10005E930, (void (*)(uint64_t))&type metadata accessor for Locale);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_100049E48();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    size_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      unint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_100038884(&qword_10005D828, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v21 = sub_100049E68();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1000392E8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_100038EEC()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_100048E48();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_100004334(&qword_10005E938);
  uint64_t v5 = sub_10004A238();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_100038884(&qword_10005E930, (void (*)(uint64_t))&type metadata accessor for Locale);
      uint64_t result = sub_100049E48();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_1000392E8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100038EEC();
  }
  else
  {
    if (v11 > v10)
    {
      sub_100039588();
      goto LABEL_12;
    }
    sub_10003982C();
  }
  uint64_t v12 = *v3;
  sub_100038884(&qword_10005E930, (void (*)(uint64_t))&type metadata accessor for Locale);
  uint64_t v13 = sub_100049E48();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_100038884(&qword_10005D828, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v21 = sub_100049E68();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_10004A328();
  __break(1u);
  return result;
}

void *sub_100039588()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100048E48();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004334(&qword_10005E938);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_10004A228();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_10003982C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100048E48();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100004334(&qword_10005E938);
  uint64_t v7 = sub_10004A238();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_100038884(&qword_10005E930, (void (*)(uint64_t))&type metadata accessor for Locale);
    uint64_t result = sub_100049E48();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_100039BDC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(sub_100048E48() - 8);
      unint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      unint64_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_100004334(&qword_10005E838);
  uint64_t v8 = *(void *)(sub_100048E48() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = (void *)sub_10004A2C8();
  __break(1u);
  return result;
}

uint64_t sub_100039E1C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100039EFC;
  return v5(v2 + 32);
}

uint64_t sub_100039EFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10003A010(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10003BCC4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005E808 + dword_10005E808);
  return v6(a1, v4);
}

uint64_t sub_10003A0C8@<X0>(void *a1@<X8>)
{
  return sub_100037AA8(a1);
}

uint64_t type metadata accessor for TranslationModel.TranslationError(uint64_t a1)
{
  return sub_100010174(a1, qword_10005E9B8);
}

_OWORD *sub_10003A11C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10003A12C@<X0>(void *a1@<X8>)
{
  return sub_100037AA8(a1);
}

uint64_t sub_10003A160@<X0>(unsigned char *a1@<X8>)
{
  return sub_100009498(a1);
}

uint64_t sub_10003A188()
{
  return sub_100009528();
}

uint64_t sub_10003A1B8()
{
  uint64_t v1 = *(void *)(sub_100004334(&qword_10005D818) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = (v4 + v2 + v3) & ~v2;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_100048E48();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  if (!v9(v0 + v5, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v5, v7);
  }

  return _swift_deallocObject(v0, v5 + v4, v2 | 7);
}

uint64_t sub_10003A338(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100004334(&qword_10005D818) - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 40) & ~v5;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = (uint64_t)v1 + v6;
  uint64_t v11 = (uint64_t)v1 + ((*(void *)(v4 + 64) + v5 + v6) & ~v5);
  size_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *size_t v12 = v2;
  v12[1] = sub_10003BCC4;
  return sub_10002B2A0(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_10003A468(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003A4C8()
{
  uint64_t v1 = sub_100048E48();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  unint64_t v8 = (v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v6);
}

uint64_t sub_10003A5F0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100048E48() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 40) & ~v5;
  uint64_t v7 = *(void *)(v4 + 64);
  uint64_t v8 = (v7 + v5 + v6) & ~v5;
  unint64_t v9 = (v7 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  uint64_t v13 = (uint64_t)v1 + v6;
  uint64_t v14 = (uint64_t)v1 + v8;
  uint64_t v15 = *(void *)((char *)v1 + v9);
  uint64_t v16 = *(void *)((char *)v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  void *v17 = v2;
  v17[1] = sub_100010788;
  return sub_100030684(a1, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_10003A748()
{
  uint64_t v1 = sub_100048E48();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 25) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  swift_release();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v6);
}

uint64_t sub_10003A83C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_100048E48() - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 + 25) & ~v8;
  uint64_t v10 = *(void *)(v3 + 16);
  int v11 = *(unsigned __int8 *)(v3 + 24);
  uint64_t v12 = (char *)(v3 + ((*(void *)(v7 + 64) + v8 + v9) & ~v8));

  return sub_100032FA0(a1, a2, a3, v10, v11, v3 + v9, v12);
}

uint64_t sub_10003A8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003A908()
{
  return swift_release();
}

uint64_t sub_10003A910()
{
  uint64_t v1 = sub_100048EA8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003A9E4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100048EA8() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10003BCC4;
  return sub_10003511C(a1, v5, v6, v7, v8);
}

uint64_t sub_10003AAE4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10003BCC4;
  return sub_10003689C(a1, v4, v5, v6);
}

uint64_t sub_10003AB98()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003ABD0()
{
  uint64_t v1 = sub_100048E48();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 73) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  swift_unknownObjectRelease();
  swift_release();
  swift_errorRelease();

  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v6);
}

uint64_t sub_10003ACE4(uint64_t a1)
{
  sub_100048E48();
  uint64_t v3 = v1[3];
  uint64_t v11 = v1[2];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = v1[8];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100010788;
  return sub_1000332D8(a1, v11, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10003AE48()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003AE88(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10003BCC4;
  v5[5] = a1;
  v5[6] = v4;
  return _swift_task_switch(sub_10002A3D8, 0, 0);
}

uint64_t *sub_10003AF40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_100048EA8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_10003B060(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_100048EA8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (!result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_10003B100(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_100048EA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10003B1DC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10003A468((uint64_t)a1, type metadata accessor for TranslationModel.TranslationError);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_100048EA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_10003B2E4(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100048EA8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10003B39C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10003A468((uint64_t)a1, type metadata accessor for TranslationModel.TranslationError);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100048EA8();
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

uint64_t sub_10003B478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10003B4A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10003B4CC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10003B4DC()
{
  uint64_t result = sub_100048EA8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_10003B57C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003B5E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_100048C98() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_10004A2C8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TranslationModel.LocaleInfo(uint64_t a1)
{
  return sub_100010174(a1, qword_10005EA60);
}

void *sub_10003B75C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100048E48();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_10003B828(uint64_t a1)
{
  uint64_t v2 = sub_100048E48();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10003B88C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003B908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003B984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003BA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003BA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003BA90);
}

uint64_t sub_10003BA90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100048E48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_10003BB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003BB74);
}

uint64_t sub_10003BB74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100048E48();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t sub_10003BC30()
{
  uint64_t result = sub_100048E48();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_10003BCD8(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *((_WORD *)a1 + 4) = *((_WORD *)a2 + 4);
    *((void *)a1 + 2) = a2[2];
    uint64_t v8 = a3[8];
    __dst = &a1[v8];
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = sub_1000491C8();
    uint64_t v11 = *(void *)(v10 - 8);
    unint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v13 = v4;
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v14 = sub_100004334(&qword_10005D8A0);
      memcpy(__dst, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v15 = a3[10];
    v7[a3[9]] = *((unsigned char *)a2 + a3[9]);
    uint64_t v16 = &v7[v15];
    unint64_t v17 = (char **)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *(void *)uint64_t v16 = *v17;
    *((void *)v16 + 1) = v18;
    uint64_t v19 = a3[12];
    v7[a3[11]] = *((unsigned char *)a2 + a3[11]);
    unint64_t v20 = &v7[v19];
    unint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = sub_100048E48();
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    swift_bridgeObjectRetain();
    if (v24(v21, 1, v22))
    {
      uint64_t v25 = sub_100004334(&qword_10005D818);
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    uint64_t v26 = a3[13];
    unint64_t v27 = &v7[v26];
    unint64_t v28 = (char *)a2 + v26;
    if (v24(v28, 1, v22))
    {
      uint64_t v29 = sub_100004334(&qword_10005D818);
      memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v27, v28, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v27, 0, 1, v22);
    }
  }
  return v7;
}

uint64_t sub_10003C01C(id *a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)a1 + a2[8];
  uint64_t v5 = sub_1000491C8();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = (char *)a1 + a2[12];
  uint64_t v8 = sub_100048E48();
  uint64_t v13 = *(void *)(v8 - 8);
  uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (!v9(v7, 1, v8)) {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v8);
  }
  uint64_t v10 = (char *)a1 + a2[13];
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v9)(v10, 1, v8);
  if (!result)
  {
    unint64_t v12 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
    return v12(v10, v8);
  }
  return result;
}

uint64_t sub_10003C1D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = a3[8];
  __dst = (void *)(a1 + v7);
  uint64_t v8 = (const void *)(a2 + v7);
  uint64_t v9 = sub_1000491C8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  id v12 = v6;
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v13 = sub_100004334(&qword_10005D8A0);
    memcpy(__dst, v8, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v14 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v19 = (void *)(a1 + v18);
  unint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = sub_100048E48();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
  swift_bridgeObjectRetain();
  if (v23(v20, 1, v21))
  {
    uint64_t v24 = sub_100004334(&qword_10005D818);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)(a1 + v25);
  unint64_t v27 = (const void *)(a2 + v25);
  if (v23(v27, 1, v21))
  {
    uint64_t v28 = sub_100004334(&qword_10005D818);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v26, v27, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v26, 0, 1, v21);
  }
  return a1;
}

uint64_t sub_10003C4D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[8];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_1000491C8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_6:
    uint64_t v17 = sub_100004334(&qword_10005D8A0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v10, v11, v12);
LABEL_7:
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  unint64_t v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v21 = a3[12];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_100048E48();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
LABEL_12:
    uint64_t v29 = sub_100004334(&qword_10005D818);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v22, v23, v24);
LABEL_13:
  uint64_t v30 = a3[13];
  BOOL v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  int v33 = v26((void *)(a1 + v30), 1, v24);
  int v34 = v26(v32, 1, v24);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v31, v32, v24);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v31, v24);
    goto LABEL_18;
  }
  if (v34)
  {
LABEL_18:
    uint64_t v35 = sub_100004334(&qword_10005D818);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v31, v32, v24);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v31, 0, 1, v24);
  return a1;
}

uint64_t sub_10003C900(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  id v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1000491C8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100004334(&qword_10005D8A0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v14 = (void *)(a1 + v13);
  int v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_100048E48();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  if (v18(v15, 1, v16))
  {
    uint64_t v19 = sub_100004334(&qword_10005D818);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v20 = a3[13];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  if (v18(v22, 1, v16))
  {
    uint64_t v23 = sub_100004334(&qword_10005D818);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v21, v22, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_10003CBCC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[8];
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1000491C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100004334(&qword_10005D8A0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_100048E48();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
LABEL_12:
    uint64_t v29 = sub_100004334(&qword_10005D818);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v22, v23, v24);
LABEL_13:
  uint64_t v30 = a3[13];
  BOOL v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  int v33 = v26((void *)(a1 + v30), 1, v24);
  int v34 = v26(v32, 1, v24);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v31, v32, v24);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v31, v24);
    goto LABEL_18;
  }
  if (v34)
  {
LABEL_18:
    uint64_t v35 = sub_100004334(&qword_10005D818);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v31, v32, v24);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v31, 0, 1, v24);
  return a1;
}

uint64_t sub_10003CFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003CFEC);
}

uint64_t sub_10003CFEC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100004334(&qword_10005D8A0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 32);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100004334(&qword_10005D818);
      int v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 48);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_10003D120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003D134);
}

void *sub_10003D134(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100004334(&qword_10005D8A0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 32);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100004334(&qword_10005D818);
      int v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 48);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for TranslationRequestContext()
{
  uint64_t result = qword_10005EAF0;
  if (!qword_10005EAF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003D2B4()
{
  sub_10003D3F0(319, (unint64_t *)&qword_10005E570, (void (*)(uint64_t))&type metadata accessor for OSSignpostID);
  if (v0 <= 0x3F)
  {
    sub_10003D3F0(319, (unint64_t *)&qword_10005DE58, (void (*)(uint64_t))&type metadata accessor for Locale);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10003D3F0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004A198();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for TranslationRequestContext.Origin(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TranslationRequestContext.Origin(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10003D5A0);
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

unsigned char *sub_10003D5C8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TranslationRequestContext.Origin()
{
  return &type metadata for TranslationRequestContext.Origin;
}

uint64_t sub_10003D5E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = (int *)type metadata accessor for TranslationRequestContext();
  uint64_t v5 = *((void *)v4 - 1);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = [a1 inputItems];
    uint64_t v9 = sub_100049F68();

    if (*(void *)(v9 + 16))
    {
      sub_10000988C(v9 + 32, (uint64_t)&v94);
      swift_bridgeObjectRelease();
      if (*((void *)&v95 + 1))
      {
        sub_10003E498();
        if ((swift_dynamicCast() & 1) == 0)
        {
LABEL_30:

          goto LABEL_13;
        }
        uint64_t v10 = (void *)v96;
        id v11 = [(id)v96 userInfo];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = sub_100049E38();

          *(void *)&long long v96 = sub_100049EA8();
          *((void *)&v96 + 1) = v14;
          sub_10004A218();
          if (*(void *)(v13 + 16) && (unint64_t v15 = sub_100047078((uint64_t)&v94), (v16 & 1) != 0))
          {
            sub_10000988C(*(void *)(v13 + 56) + 32 * v15, (uint64_t)&v96);
          }
          else
          {
            long long v96 = 0u;
            long long v97 = 0u;
          }
          sub_10003E4D8((uint64_t)&v94);
          swift_bridgeObjectRelease();
          if (*((void *)&v97 + 1))
          {
            if (swift_dynamicCast())
            {
              int v19 = v94;
LABEL_22:
              v7[8] = v19;
              id v20 = [v10 attributedContentText];
              if (!v20)
              {
                if (!v19
                  || (id v28 = objc_allocWithZone((Class)NSAttributedString),
                      NSString v29 = sub_100049E78(),
                      id v20 = [v28 initWithString:v29],
                      v29,
                      !v20))
                {

                  goto LABEL_30;
                }
              }
              *(void *)BOOL v7 = v20;
              id v21 = v20;
              id v22 = [v10 userInfo];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = sub_100049E38();

                *(void *)&long long v96 = sub_100049EA8();
                *((void *)&v96 + 1) = v25;
                sub_10004A218();
                if (*(void *)(v24 + 16) && (unint64_t v26 = sub_100047078((uint64_t)&v94), (v27 & 1) != 0))
                {
                  sub_10000988C(*(void *)(v24 + 56) + 32 * v26, (uint64_t)&v96);
                }
                else
                {
                  long long v96 = 0u;
                  long long v97 = 0u;
                }
                sub_10003E4D8((uint64_t)&v94);
                swift_bridgeObjectRelease();
                if (*((void *)&v97 + 1))
                {
                  if (swift_dynamicCast())
                  {
                    char v30 = v94;
                    goto LABEL_38;
                  }
LABEL_37:
                  char v30 = 0;
LABEL_38:
                  v7[9] = v30;
                  id v31 = [v10 userInfo];
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    uint64_t v33 = sub_100049E38();

                    uint64_t v92 = sub_100049EA8();
                    uint64_t v93 = v34;
                    sub_10004A218();
                    if (*(void *)(v33 + 16) && (unint64_t v35 = sub_100047078((uint64_t)&v94), (v36 & 1) != 0))
                    {
                      sub_10000988C(*(void *)(v33 + 56) + 32 * v35, (uint64_t)&v96);
                    }
                    else
                    {
                      long long v96 = 0u;
                      long long v97 = 0u;
                    }
                    sub_10003E4D8((uint64_t)&v94);
                    swift_bridgeObjectRelease();
                    if (*((void *)&v97 + 1))
                    {
                      sub_100004334(&qword_10005EB60);
                      if (swift_dynamicCast())
                      {
                        uint64_t v37 = (void *)v94;
                        goto LABEL_49;
                      }
LABEL_48:
                      uint64_t v37 = &_swiftEmptyArrayStorage;
LABEL_49:
                      *((void *)v7 + 2) = v37;
                      id v38 = [v10 userInfo];
                      if (v38)
                      {
                        uint64_t v39 = v38;
                        uint64_t v40 = sub_100049E38();

                        uint64_t v92 = sub_100049EA8();
                        uint64_t v93 = v41;
                        sub_10004A218();
                        if (*(void *)(v40 + 16) && (unint64_t v42 = sub_100047078((uint64_t)&v94), (v43 & 1) != 0))
                        {
                          sub_10000988C(*(void *)(v40 + 56) + 32 * v42, (uint64_t)&v96);
                        }
                        else
                        {
                          long long v96 = 0u;
                          long long v97 = 0u;
                        }
                        sub_10003E4D8((uint64_t)&v94);
                        swift_bridgeObjectRelease();
                        if (*((void *)&v97 + 1))
                        {
                          if (swift_dynamicCast())
                          {
                            uint64_t v44 = &v7[v4[8]];
                            sub_1000491D8();
                            uint64_t v45 = sub_1000491C8();
                            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
                            goto LABEL_60;
                          }
LABEL_59:
                          uint64_t v46 = &v7[v4[8]];
                          uint64_t v47 = sub_1000491C8();
                          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 1, 1, v47);
LABEL_60:
                          id v48 = [v10 userInfo];
                          if (v48)
                          {
                            unint64_t v49 = v48;
                            uint64_t v50 = sub_100049E38();

                            *(void *)&long long v96 = sub_100049EA8();
                            *((void *)&v96 + 1) = v51;
                            sub_10004A218();
                            if (*(void *)(v50 + 16) && (unint64_t v52 = sub_100047078((uint64_t)&v94), (v53 & 1) != 0))
                            {
                              sub_10000988C(*(void *)(v50 + 56) + 32 * v52, (uint64_t)&v96);
                            }
                            else
                            {
                              long long v96 = 0u;
                              long long v97 = 0u;
                            }
                            sub_10003E4D8((uint64_t)&v94);
                            swift_bridgeObjectRelease();
                            if (*((void *)&v97 + 1))
                            {
                              if (swift_dynamicCast())
                              {
                                char v54 = v94;
                                goto LABEL_71;
                              }
LABEL_70:
                              char v54 = 0;
LABEL_71:
                              v7[v4[9]] = v54;
                              id v55 = [v10 userInfo];
                              if (v55)
                              {
                                uint64_t v56 = v55;
                                uint64_t v57 = sub_100049E38();

                                uint64_t v92 = sub_100049EA8();
                                uint64_t v93 = v58;
                                sub_10004A218();
                                if (*(void *)(v57 + 16) && (unint64_t v59 = sub_100047078((uint64_t)&v94), (v60 & 1) != 0))
                                {
                                  sub_10000988C(*(void *)(v57 + 56) + 32 * v59, (uint64_t)&v96);
                                }
                                else
                                {
                                  long long v96 = 0u;
                                  long long v97 = 0u;
                                }
                                sub_10003E4D8((uint64_t)&v94);
                                swift_bridgeObjectRelease();
                                if (*((void *)&v97 + 1))
                                {
                                  sub_100004334(&qword_10005EB58);
                                  if (swift_dynamicCast())
                                  {
                                    uint64_t v61 = v94;
                                    if ((void)v94)
                                    {
                                      if (*(void *)(v94 + 16))
                                      {
                                        swift_bridgeObjectRetain();
                                        unint64_t v62 = sub_100047000(0x747865746E6F63, 0xE700000000000000);
                                        if (v63)
                                        {
                                          sub_10000988C(*(void *)(v61 + 56) + 32 * v62, (uint64_t)&v94);
                                        }
                                        else
                                        {
                                          long long v94 = 0u;
                                          long long v95 = 0u;
                                        }
                                        swift_bridgeObjectRelease();
                                        if (*((void *)&v95 + 1))
                                        {
                                          if (swift_dynamicCast())
                                          {
                                            uint64_t v66 = *((void *)&v96 + 1);
                                            uint64_t v67 = &v7[v4[10]];
                                            *(void *)uint64_t v67 = v96;
                                            *((void *)v67 + 1) = v66;
                                          }
                                          else
                                          {
                                            Swift::Int v68 = &v7[v4[10]];
                                            *(void *)Swift::Int v68 = 0;
                                            *((void *)v68 + 1) = 0;
                                          }
                                          goto LABEL_96;
                                        }
                                        int v64 = 0;
LABEL_87:
                                        sub_10003E438((uint64_t)&v94);
                                        uint64_t v65 = &v7[v4[10]];
                                        *(void *)uint64_t v65 = 0;
                                        *((void *)v65 + 1) = 0;
                                        if (v64)
                                        {
                                          long long v94 = 0u;
                                          long long v95 = 0u;
                                          goto LABEL_105;
                                        }
LABEL_96:
                                        if (*(void *)(v61 + 16)
                                          && (unint64_t v69 = sub_100047000(0x6E696769726FLL, 0xE600000000000000), (v70 & 1) != 0))
                                        {
                                          sub_10000988C(*(void *)(v61 + 56) + 32 * v69, (uint64_t)&v94);
                                        }
                                        else
                                        {
                                          long long v94 = 0u;
                                          long long v95 = 0u;
                                        }
                                        swift_bridgeObjectRelease();
                                        if (*((void *)&v95 + 1))
                                        {
                                          if (swift_dynamicCast())
                                          {
                                            if ((void)v96 == 2) {
                                              char v71 = 2;
                                            }
                                            else {
                                              char v71 = (void)v96 == 1;
                                            }
LABEL_107:
                                            v7[v4[11]] = v71;
                                            id v72 = [v10 userInfo];
                                            if (v72)
                                            {
                                              uint64_t v73 = v72;
                                              uint64_t v74 = sub_100049E38();

                                              uint64_t v92 = sub_100049EA8();
                                              uint64_t v93 = v75;
                                              sub_10004A218();
                                              if (*(void *)(v74 + 16)
                                                && (unint64_t v76 = sub_100047078((uint64_t)&v94), (v77 & 1) != 0))
                                              {
                                                sub_10000988C(*(void *)(v74 + 56) + 32 * v76, (uint64_t)&v96);
                                              }
                                              else
                                              {
                                                long long v96 = 0u;
                                                long long v97 = 0u;
                                              }
                                              sub_10003E4D8((uint64_t)&v94);
                                              swift_bridgeObjectRelease();
                                              if (*((void *)&v97 + 1))
                                              {
                                                if (swift_dynamicCast())
                                                {
                                                  id v78 = &v7[v4[12]];
                                                  sub_100048DA8();
                                                  uint64_t v79 = sub_100048E48();
                                                  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v78, 0, 1, v79);
                                                  goto LABEL_118;
                                                }
LABEL_117:
                                                uint64_t v80 = &v7[v4[12]];
                                                uint64_t v81 = sub_100048E48();
                                                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v80, 1, 1, v81);
LABEL_118:
                                                id v82 = [v10 userInfo];
                                                if (v82)
                                                {
                                                  id v83 = v82;
                                                  uint64_t v84 = sub_100049E38();

                                                  uint64_t v92 = sub_100049EA8();
                                                  uint64_t v93 = v85;
                                                  sub_10004A218();
                                                  if (*(void *)(v84 + 16)
                                                    && (unint64_t v86 = sub_100047078((uint64_t)&v94), (v87 & 1) != 0))
                                                  {
                                                    sub_10000988C(*(void *)(v84 + 56) + 32 * v86, (uint64_t)&v96);
                                                  }
                                                  else
                                                  {
                                                    long long v96 = 0u;
                                                    long long v97 = 0u;
                                                  }
                                                  sub_10003E4D8((uint64_t)&v94);
                                                  swift_bridgeObjectRelease();
                                                  if (*((void *)&v97 + 1))
                                                  {
                                                    if (swift_dynamicCast())
                                                    {
                                                      os_log_type_t v88 = &v7[v4[13]];
                                                      sub_100048DA8();

                                                      uint64_t v89 = sub_100048E48();
                                                      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v88, 0, 1, v89);
LABEL_130:
                                                      sub_10000A190((uint64_t)v7, a2);
                                                      uint64_t v17 = 0;
                                                      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v17, 1, v4);
                                                    }

LABEL_129:
                                                    uint64_t v90 = &v7[v4[13]];
                                                    uint64_t v91 = sub_100048E48();
                                                    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v90, 1, 1, v91);
                                                    goto LABEL_130;
                                                  }
                                                }
                                                else
                                                {
                                                  long long v96 = 0u;
                                                  long long v97 = 0u;
                                                }

                                                sub_10003E438((uint64_t)&v96);
                                                goto LABEL_129;
                                              }
                                            }
                                            else
                                            {
                                              long long v96 = 0u;
                                              long long v97 = 0u;
                                            }
                                            sub_10003E438((uint64_t)&v96);
                                            goto LABEL_117;
                                          }
LABEL_106:
                                          char v71 = 0;
                                          goto LABEL_107;
                                        }
LABEL_105:
                                        sub_10003E438((uint64_t)&v94);
                                        goto LABEL_106;
                                      }
                                      int v64 = 0;
LABEL_86:
                                      long long v94 = 0u;
                                      long long v95 = 0u;
                                      goto LABEL_87;
                                    }
LABEL_85:
                                    int v64 = 1;
                                    goto LABEL_86;
                                  }
LABEL_84:
                                  uint64_t v61 = 0;
                                  goto LABEL_85;
                                }
                              }
                              else
                              {
                                long long v96 = 0u;
                                long long v97 = 0u;
                              }
                              sub_10003E438((uint64_t)&v96);
                              goto LABEL_84;
                            }
                          }
                          else
                          {
                            long long v96 = 0u;
                            long long v97 = 0u;
                          }
                          sub_10003E438((uint64_t)&v96);
                          goto LABEL_70;
                        }
                      }
                      else
                      {
                        long long v96 = 0u;
                        long long v97 = 0u;
                      }
                      sub_10003E438((uint64_t)&v96);
                      goto LABEL_59;
                    }
                  }
                  else
                  {
                    long long v96 = 0u;
                    long long v97 = 0u;
                  }
                  sub_10003E438((uint64_t)&v96);
                  goto LABEL_48;
                }
              }
              else
              {
                long long v96 = 0u;
                long long v97 = 0u;
              }
              sub_10003E438((uint64_t)&v96);
              goto LABEL_37;
            }
LABEL_21:
            int v19 = 0;
            goto LABEL_22;
          }
        }
        else
        {
          long long v96 = 0u;
          long long v97 = 0u;
        }
        sub_10003E438((uint64_t)&v96);
        goto LABEL_21;
      }
    }
    else
    {
      long long v94 = 0u;
      long long v95 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    long long v94 = 0u;
    long long v95 = 0u;
  }
  sub_10003E438((uint64_t)&v94);
LABEL_13:
  uint64_t v17 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v17, 1, v4);
}

BOOL sub_10003E2F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10003E304()
{
  Swift::UInt64 v1 = *v0;
  sub_10004A378();
  sub_10004A398(v1);
  return sub_10004A3A8();
}

void sub_10003E34C()
{
  sub_10004A398(*v0);
}

Swift::Int sub_10003E378()
{
  Swift::UInt64 v1 = *v0;
  sub_10004A378();
  sub_10004A398(v1);
  return sub_10004A3A8();
}

uint64_t *sub_10003E3BC@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_10003E3D4(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_10003E3E4()
{
  unint64_t result = qword_10005EB48;
  if (!qword_10005EB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EB48);
  }
  return result;
}

uint64_t sub_10003E438(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10003E498()
{
  unint64_t result = qword_10005EB50;
  if (!qword_10005EB50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005EB50);
  }
  return result;
}

uint64_t sub_10003E4D8(uint64_t a1)
{
  return a1;
}

uint64_t destroy for TranslationServiceView()
{
  swift_release();
  swift_release();

  return sub_100016108();
}

uint64_t initializeWithCopy for TranslationServiceView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  sub_100015FD8();
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for TranslationServiceView(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = v2[2];
  *(void *)(a1 + 24) = v2[3];
  swift_retain();
  swift_release();
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_100015FD8();
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_100016108();
  return a1;
}

__n128 initializeWithTake for TranslationServiceView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TranslationServiceView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_release();
  char v6 = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = v6;
  sub_100016108();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationServiceView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TranslationServiceView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationServiceView()
{
  return &type metadata for TranslationServiceView;
}

uint64_t sub_10003E7A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003E7C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v73 = a1;
  uint64_t v72 = sub_100004334(&qword_10005DB40);
  __chkstk_darwin(v72);
  char v71 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004334(&qword_10005EB68);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  char v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100049DA8();
  uint64_t v7 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004334(&qword_10005EB70);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  unint64_t v59 = (uint64_t *)((char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_100004334(&qword_10005EB78);
  __chkstk_darwin(v13);
  unint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004334(&qword_10005EB80);
  uint64_t v67 = *(void *)(v16 - 8);
  uint64_t v68 = v16;
  __chkstk_darwin(v16);
  uint64_t v65 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004334(&qword_10005EB88);
  uint64_t v69 = *(void *)(v18 - 8);
  uint64_t v70 = v18;
  __chkstk_darwin(v18);
  uint64_t v66 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100004334(&qword_10005EB90);
  __chkstk_darwin(v62);
  char v63 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)unint64_t v15 = sub_1000496C8();
  *((void *)v15 + 1) = 0;
  v15[16] = 1;
  uint64_t v21 = sub_100004334(&qword_10005EB98);
  sub_10003EFEC(v1, (uint64_t)&v15[*(int *)(v21 + 44)]);
  uint64_t v58 = sub_100049DD8();
  uint64_t v57 = v22;
  uint64_t v64 = v13;
  uint64_t v23 = *(int *)(v13 + 36);
  uint64_t v61 = v15;
  uint64_t v24 = (uint64_t)&v15[v23];
  uint64_t v25 = sub_100049C18();
  sub_100049D98();
  char v26 = sub_1000498D8();
  uint64_t v27 = v60;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v6, v9, v60);
  uint64_t v28 = (uint64_t)v6;
  v6[*(int *)(v4 + 44)] = v26;
  NSString v29 = v59;
  uint64_t v30 = (uint64_t)v59 + *(int *)(v11 + 44);
  uint64_t v31 = v28;
  sub_100005488(v28, v30, &qword_10005EB68);
  uint64_t *v29 = v25;
  swift_retain();
  uint64_t v32 = v31;
  uint64_t v33 = v1;
  sub_1000054EC(v32, &qword_10005EB68);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  swift_release();
  uint64_t v34 = sub_1000493C8();
  LOBYTE(v27) = sub_1000498D8();
  sub_100005488((uint64_t)v29, v24, &qword_10005EB70);
  uint64_t v35 = v24 + *(int *)(sub_100004334(&qword_10005EBA0) + 36);
  *(void *)uint64_t v35 = v34;
  *(unsigned char *)(v35 + 8) = v27;
  sub_1000054EC((uint64_t)v29, &qword_10005EB70);
  char v36 = (uint64_t *)(v24 + *(int *)(sub_100004334(&qword_10005EBA8) + 36));
  uint64_t v37 = v57;
  *char v36 = v58;
  v36[1] = v37;
  v79[0] = *(_OWORD *)v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)v79);
  sub_100049668();
  unint64_t v38 = sub_1000410D0();
  uint64_t v39 = v65;
  uint64_t v40 = v64;
  uint64_t v41 = (uint64_t)v61;
  sub_100049B18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000054EC(v41, &qword_10005EB78);
  long long v78 = *((_OWORD *)v33 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  sub_100023568((uint64_t)&v78);
  if (v76 == 1)
  {
    uint64_t v42 = sub_100048EF8();
    uint64_t v43 = (uint64_t)v71;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v71, 1, 1, v42);
  }
  else
  {
    long long v76 = *((_OWORD *)v33 + 2);
    char v77 = *((unsigned char *)v33 + 48);
    uint64_t v44 = swift_allocObject();
    long long v45 = *((_OWORD *)v33 + 1);
    *(_OWORD *)(v44 + 16) = *(_OWORD *)v33;
    *(_OWORD *)(v44 + 32) = v45;
    *(_OWORD *)(v44 + 48) = *((_OWORD *)v33 + 2);
    *(unsigned char *)(v44 + 64) = *((unsigned char *)v33 + 48);
    sub_100023A5C((uint64_t)v79);
    sub_100023A5C((uint64_t)&v78);
    sub_100041B68((uint64_t)&v76);
    uint64_t v43 = (uint64_t)v71;
    sub_100048EE8();
    uint64_t v46 = sub_100048EF8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v43, 0, 1, v46);
  }
  uint64_t v74 = v40;
  unint64_t v75 = v38;
  swift_getOpaqueTypeConformance2();
  sub_1000124E8();
  uint64_t v47 = v66;
  uint64_t v48 = v68;
  sub_100049B48();
  sub_1000054EC(v43, &qword_10005DB40);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v39, v48);
  uint64_t v49 = sub_1000493D8();
  char v50 = sub_1000498D8();
  uint64_t v52 = v69;
  uint64_t v51 = v70;
  uint64_t v53 = (uint64_t)v63;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v63, v47, v70);
  uint64_t v54 = v53 + *(int *)(v62 + 36);
  *(void *)uint64_t v54 = v49;
  *(unsigned char *)(v54 + 8) = v50;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v47, v51);
  return sub_100005424(v53, v73, &qword_10005EB90);
}

uint64_t sub_10003EFEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v157 = a2;
  uint64_t v158 = type metadata accessor for TranslationView();
  __chkstk_darwin(v158);
  uint64_t v4 = (char *)&v113 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = sub_100004334(&qword_10005EBD0);
  uint64_t v144 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  char v6 = (char *)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_100004334(&qword_10005EBD8);
  __chkstk_darwin(v154);
  uint64_t v156 = (uint64_t)&v113 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100004334(&qword_10005EBE0);
  __chkstk_darwin(v149);
  uint64_t v150 = (uint64_t)&v113 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_100004334(&qword_10005EBE8);
  __chkstk_darwin(v155);
  uint64_t v151 = (char *)&v113 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_1000490F8();
  uint64_t v124 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  os_log_type_t v123 = (char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_100004334(&qword_10005EBF0);
  __chkstk_darwin(v134);
  uint64_t v135 = (uint64_t)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100004334(&qword_10005EBF8);
  __chkstk_darwin(v142);
  uint64_t v136 = (char *)&v113 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_100048E48();
  uint64_t v117 = *(void *)(v118 - 8);
  uint64_t v13 = __chkstk_darwin(v118);
  uint64_t v116 = (char *)&v113 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v114 = (char *)&v113 - v15;
  uint64_t v115 = type metadata accessor for DownloadSelectionView(0);
  __chkstk_darwin(v115);
  unint64_t v120 = (char *)&v113 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_100004334(&qword_10005EC00);
  uint64_t v17 = __chkstk_darwin(v133);
  uint64_t v119 = (uint64_t)&v113 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v122 = (uint64_t)&v113 - v19;
  uint64_t v132 = sub_100048EA8();
  uint64_t v131 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  uint64_t v121 = (char *)&v113 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_100004334(&qword_10005EC08);
  __chkstk_darwin(v146);
  id v148 = (uint64_t *)((char *)&v113 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v138 = sub_100004334(&qword_10005EC10);
  __chkstk_darwin(v138);
  uint64_t v140 = (uint64_t)&v113 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100004334(&qword_10005EC18);
  __chkstk_darwin(v127);
  uint64_t v128 = (uint64_t)&v113 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100004334(&qword_10005EC20);
  __chkstk_darwin(v139);
  id v129 = (char *)&v113 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = sub_100004334(&qword_10005EC28);
  __chkstk_darwin(v147);
  uint64_t v141 = (char *)&v113 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100004334(&qword_10005DBA8);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  uint64_t v125 = (char *)&v113 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v113 - v29;
  uint64_t v126 = type metadata accessor for LIDResolutionView();
  __chkstk_darwin(v126);
  uint64_t v130 = (uint64_t *)((char *)&v113 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = type metadata accessor for TranslationModel.TranslationError(0);
  __chkstk_darwin(v32);
  uint64_t v34 = (uint64_t *)((char *)&v113 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v153 = sub_100004334(&qword_10005EC30);
  __chkstk_darwin(v153);
  char v36 = (char *)&v113 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1[1];
  uint64_t v143 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  if ((void)v159)
  {
    id v163 = (ValueMetadata *)v159;
    uint64_t v38 = v159;
    swift_errorRetain();
    sub_100004334(&qword_10005E858);
    char v39 = swift_dynamicCast();
    uint64_t v40 = v36;
    uint64_t v145 = v38;
    if (v39)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v74 = v121;
          (*(void (**)(char *, uint64_t *, uint64_t))(v131 + 32))(v121, v34, v132);
          unint64_t v75 = v114;
          sub_100048E78();
          long long v76 = v116;
          sub_100048E88();
          long long v77 = *((_OWORD *)a1 + 2);
          long long v165 = *((_OWORD *)a1 + 1);
          uint64_t v144 = *((void *)&v165 + 1);
          long long v159 = v77;
          LOBYTE(v160) = *((unsigned char *)a1 + 48);
          uint64_t v78 = swift_allocObject();
          long long v79 = *((_OWORD *)a1 + 1);
          *(_OWORD *)(v78 + 16) = *(_OWORD *)a1;
          *(_OWORD *)(v78 + 32) = v79;
          *(_OWORD *)(v78 + 48) = *((_OWORD *)a1 + 2);
          *(unsigned char *)(v78 + 64) = *((unsigned char *)a1 + 48);
          uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v117 + 32);
          uint64_t v81 = (uint64_t)v120;
          id v82 = v75;
          uint64_t v83 = v118;
          v80(v120, v82, v118);
          uint64_t v84 = v115;
          v80((char *)(v81 + *(int *)(v115 + 20)), v76, v83);
          uint64_t v85 = (uint64_t (**)(uint64_t, uint64_t))(v81 + *(int *)(v84 + 24));
          *uint64_t v85 = sub_100042174;
          v85[1] = (uint64_t (*)(uint64_t, uint64_t))v78;
          type metadata accessor for TranslationContext();
          sub_100023A5C((uint64_t)&v165);
          swift_retain();
          sub_100023A5C((uint64_t)&v165);
          sub_100041B68((uint64_t)&v159);
          sub_10004217C(&qword_10005D860, (void (*)(uint64_t))type metadata accessor for TranslationContext);
          uint64_t v86 = sub_100049228();
          uint64_t v87 = v119;
          sub_1000421DC(v81, v119, type metadata accessor for DownloadSelectionView);
          os_log_type_t v88 = (uint64_t *)(v87 + *(int *)(v133 + 36));
          uint64_t v89 = v144;
          *os_log_type_t v88 = v86;
          v88[1] = v89;
          sub_100042244(v81, type metadata accessor for DownloadSelectionView);
          uint64_t v90 = v122;
          sub_100005424(v87, v122, &qword_10005EC00);
          sub_100005488(v90, v135, &qword_10005EC00);
          swift_storeEnumTagMultiPayload();
          sub_100041ED4();
          sub_10004217C(&qword_10005EC88, (void (*)(uint64_t))&type metadata accessor for LanguagesProgressView);
          uint64_t v91 = (uint64_t)v136;
          sub_1000496E8();
          sub_100005488(v91, v140, &qword_10005EBF8);
          swift_storeEnumTagMultiPayload();
          sub_100041D84();
          sub_100041E28();
          uint64_t v92 = (uint64_t)v141;
          sub_1000496E8();
          sub_1000054EC(v91, &qword_10005EBF8);
          sub_100005488(v92, (uint64_t)v148, &qword_10005EC28);
          swift_storeEnumTagMultiPayload();
          sub_100041D48();
          sub_100041FA4();
          sub_1000496E8();
          sub_1000054EC(v92, &qword_10005EC28);
          sub_1000054EC(v90, &qword_10005EC00);
          (*(void (**)(char *, uint64_t))(v131 + 8))(v74, v132);
          goto LABEL_17;
        case 2u:
          long long v93 = *((_OWORD *)a1 + 2);
          long long v165 = *((_OWORD *)a1 + 1);
          long long v159 = v93;
          LOBYTE(v160) = *((unsigned char *)a1 + 48);
          uint64_t v94 = swift_allocObject();
          long long v95 = *((_OWORD *)a1 + 1);
          *(_OWORD *)(v94 + 16) = *(_OWORD *)a1;
          *(_OWORD *)(v94 + 32) = v95;
          *(_OWORD *)(v94 + 48) = *((_OWORD *)a1 + 2);
          *(unsigned char *)(v94 + 64) = *((unsigned char *)a1 + 48);
          swift_retain();
          sub_100023A5C((uint64_t)&v165);
          sub_100041B68((uint64_t)&v159);
          long long v96 = v123;
          sub_1000490E8();
          uint64_t v97 = v124;
          uint64_t v98 = v137;
          (*(void (**)(uint64_t, char *, uint64_t))(v124 + 16))(v135, v96, v137);
          swift_storeEnumTagMultiPayload();
          sub_100041ED4();
          sub_10004217C(&qword_10005EC88, (void (*)(uint64_t))&type metadata accessor for LanguagesProgressView);
          uint64_t v99 = (uint64_t)v136;
          sub_1000496E8();
          sub_100005488(v99, v140, &qword_10005EBF8);
          swift_storeEnumTagMultiPayload();
          sub_100041D84();
          sub_100041E28();
          uint64_t v100 = (uint64_t)v141;
          sub_1000496E8();
          sub_1000054EC(v99, &qword_10005EBF8);
          sub_100005488(v100, (uint64_t)v148, &qword_10005EC28);
          swift_storeEnumTagMultiPayload();
          sub_100041D48();
          sub_100041FA4();
          sub_1000496E8();
          sub_1000054EC(v100, &qword_10005EC28);
          (*(void (**)(char *, uint64_t))(v97 + 8))(v96, v98);
          goto LABEL_17;
        case 3u:
          sub_100042244((uint64_t)v34, type metadata accessor for TranslationModel.TranslationError);
          uint64_t v38 = v145;
          goto LABEL_14;
        case 4u:
          type metadata accessor for TranslationModel(0);
          sub_10004217C(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
          sub_100049388();
          swift_getKeyPath();
          sub_100049398();
          swift_release();
          swift_release();
          sub_100049388();
          swift_getKeyPath();
          uint64_t v101 = (uint64_t)v125;
          sub_100049398();
          swift_release();
          swift_release();
          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          sub_100049278();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v102 = v159;
          uint64_t v45 = (uint64_t)v130;
          *uint64_t v130 = 0;
          *(void *)(v45 + 8) = 0;
          *(void *)(v45 + 16) = _swiftEmptyArrayStorage;
          id v103 = (int *)v126;
          sub_100005424((uint64_t)v30, v45 + *(int *)(v126 + 24), &qword_10005DBA8);
          sub_100005424(v101, v45 + v103[7], &qword_10005DBA8);
          *(void *)(v45 + v103[8]) = v102;
          uint64_t v104 = v45 + v103[9];
          LOBYTE(v165) = 0;
          sub_100049C88();
          uint64_t v105 = *((void *)&v159 + 1);
          *(unsigned char *)uint64_t v104 = v159;
          *(void *)(v104 + 8) = v105;
          uint64_t v106 = v103[10];
          *(void *)&long long v165 = 0;
          sub_100049C88();
          *(_OWORD *)(v45 + v106) = v159;
          sub_1000421DC(v45, v128, (uint64_t (*)(void))type metadata accessor for LIDResolutionView);
          goto LABEL_16;
        default:
          uint64_t v41 = v34[1];
          uint64_t v38 = v145;
          if (!v41) {
            goto LABEL_14;
          }
          uint64_t v42 = *v34;
          type metadata accessor for TranslationModel(0);
          sub_10004217C(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
          sub_100049388();
          swift_getKeyPath();
          sub_100049398();
          swift_release();
          swift_release();
          sub_100049388();
          swift_getKeyPath();
          uint64_t v43 = (uint64_t)v125;
          sub_100049398();
          swift_release();
          swift_release();
          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          sub_100049278();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v44 = v159;
          uint64_t v45 = (uint64_t)v130;
          *uint64_t v130 = v42;
          *(void *)(v45 + 8) = v41;
          *(void *)(v45 + 16) = _swiftEmptyArrayStorage;
          uint64_t v46 = (int *)v126;
          sub_100005424((uint64_t)v30, v45 + *(int *)(v126 + 24), &qword_10005DBA8);
          sub_100005424(v43, v45 + v46[7], &qword_10005DBA8);
          *(void *)(v45 + v46[8]) = v44;
          uint64_t v47 = v45 + v46[9];
          LOBYTE(v165) = 0;
          sub_100049C88();
          uint64_t v48 = *((void *)&v159 + 1);
          *(unsigned char *)uint64_t v47 = v159;
          *(void *)(v47 + 8) = v48;
          uint64_t v49 = v46[10];
          *(void *)&long long v165 = 0;
          sub_100049C88();
          *(_OWORD *)(v45 + v49) = v159;
          sub_1000421DC(v45, v128, (uint64_t (*)(void))type metadata accessor for LIDResolutionView);
LABEL_16:
          swift_storeEnumTagMultiPayload();
          sub_10004217C(&qword_10005EC58, (void (*)(uint64_t))type metadata accessor for LIDResolutionView);
          uint64_t v107 = (uint64_t)v129;
          sub_1000496E8();
          sub_100005488(v107, v140, &qword_10005EC20);
          swift_storeEnumTagMultiPayload();
          sub_100041D84();
          sub_100041E28();
          uint64_t v108 = (uint64_t)v141;
          sub_1000496E8();
          sub_1000054EC(v107, &qword_10005EC20);
          sub_100005488(v108, (uint64_t)v148, &qword_10005EC28);
          swift_storeEnumTagMultiPayload();
          sub_100041D48();
          sub_100041FA4();
          sub_1000496E8();
          sub_1000054EC(v108, &qword_10005EC28);
          sub_100042244(v45, (uint64_t (*)(void))type metadata accessor for LIDResolutionView);
LABEL_17:
          swift_errorRelease();
          break;
      }
    }
    else
    {
LABEL_14:
      swift_errorRelease();
      void *v148 = v38;
      swift_storeEnumTagMultiPayload();
      swift_errorRetain();
      sub_100041D48();
      sub_100041FA4();
      sub_1000496E8();
    }
    uint64_t v109 = v156;
    uint64_t v110 = (uint64_t)v40;
    uint64_t v111 = (uint64_t)v151;
    sub_100005488(v110, v150, &qword_10005EC30);
    swift_storeEnumTagMultiPayload();
    sub_100041CC0(&qword_10005EC40, &qword_10005EC30, (void (*)(void))sub_100041D48, (void (*)(void))sub_100041FA4);
    unint64_t v112 = sub_100041C6C();
    id v163 = &type metadata for FirstUseExperienceView;
    unint64_t v164 = v112;
    swift_getOpaqueTypeConformance2();
    sub_1000496E8();
    sub_100005488(v111, v109, &qword_10005EBE8);
    swift_storeEnumTagMultiPayload();
    sub_100041FF8();
    sub_10004217C(&qword_10005ECA0, (void (*)(uint64_t))type metadata accessor for TranslationView);
    sub_1000496E8();
    swift_errorRelease();
    sub_1000054EC(v111, &qword_10005EBE8);
    return sub_1000054EC(v110, &qword_10005EC30);
  }
  else
  {
    uint64_t v50 = v144;
    if (*(unsigned char *)(v37 + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_showConsentOnly)) {
      goto LABEL_10;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    if ((v159 & 1) != 0
      || (sub_100023BB4(), v51 = (void *)sub_10004A0A8(), char v52 = sub_10004A0B8(), v51, (v52 & 1) != 0))
    {
      long long v159 = *((_OWORD *)a1 + 1);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100023A5C((uint64_t)&v159);
      sub_100049278();
      swift_release();
      swift_release();
      sub_100023568((uint64_t)&v159);
      char v53 = v165;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v55 = swift_getKeyPath();
      uint64_t v56 = swift_getKeyPath();
      uint64_t v57 = swift_getKeyPath();
      uint64_t v58 = v158;
      *(void *)&v4[*(int *)(v158 + 36)] = v57;
      sub_100004334(&qword_10005ECA8);
      swift_storeEnumTagMultiPayload();
      type metadata accessor for TranslationModel(0);
      sub_10004217C(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
      *(void *)uint64_t v4 = sub_100049378();
      *((void *)v4 + 1) = v59;
      v4[16] = v53;
      *((void *)v4 + 3) = KeyPath;
      *((void *)v4 + 4) = 0;
      v4[40] = 0;
      *((void *)v4 + 6) = v55;
      *((void *)v4 + 7) = 0;
      v4[64] = 0;
      *((void *)v4 + 9) = v56;
      *((void *)v4 + 10) = 0;
      v4[88] = 0;
      uint64_t v60 = &v4[*(int *)(v58 + 40)];
      LOBYTE(v163) = 0;
      sub_100049C88();
      uint64_t v61 = *((void *)&v165 + 1);
      *uint64_t v60 = v165;
      *((void *)v60 + 1) = v61;
      uint64_t v62 = &v4[*(int *)(v58 + 44)];
      LOBYTE(v163) = 0;
      sub_100049C88();
      uint64_t v63 = *((void *)&v165 + 1);
      *uint64_t v62 = v165;
      *((void *)v62 + 1) = v63;
      sub_1000421DC((uint64_t)v4, v156, (uint64_t (*)(void))type metadata accessor for TranslationView);
      swift_storeEnumTagMultiPayload();
      sub_100041FF8();
      sub_10004217C(&qword_10005ECA0, (void (*)(uint64_t))type metadata accessor for TranslationView);
      sub_1000496E8();
      return sub_100042244((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for TranslationView);
    }
    else
    {
LABEL_10:
      type metadata accessor for TranslationModel(0);
      sub_10004217C(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
      sub_100049388();
      swift_getKeyPath();
      sub_100049398();
      swift_release();
      swift_release();
      long long v65 = v165;
      char v66 = v166;
      type metadata accessor for CGSize(0);
      id v163 = 0;
      unint64_t v164 = 0;
      sub_100049C88();
      uint64_t v67 = v160;
      long long v68 = v159;
      long long v159 = v65;
      LOBYTE(v160) = v66;
      long long v161 = v68;
      uint64_t v162 = v67;
      long long v165 = *((_OWORD *)a1 + 1);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049278();
      swift_release();
      swift_release();
      sub_100023568((uint64_t)&v165);
      unint64_t v69 = sub_100041C6C();
      uint64_t v70 = v6;
      sub_100049B58();
      swift_release();
      swift_release();
      swift_release();
      char v71 = v6;
      uint64_t v72 = v152;
      (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v150, v71, v152);
      swift_storeEnumTagMultiPayload();
      sub_100041CC0(&qword_10005EC40, &qword_10005EC30, (void (*)(void))sub_100041D48, (void (*)(void))sub_100041FA4);
      *(void *)&long long v159 = &type metadata for FirstUseExperienceView;
      *((void *)&v159 + 1) = v69;
      swift_getOpaqueTypeConformance2();
      uint64_t v73 = (uint64_t)v151;
      sub_1000496E8();
      sub_100005488(v73, v156, &qword_10005EBE8);
      swift_storeEnumTagMultiPayload();
      sub_100041FF8();
      sub_10004217C(&qword_10005ECA0, (void (*)(uint64_t))type metadata accessor for TranslationView);
      sub_1000496E8();
      sub_1000054EC(v73, &qword_10005EBE8);
      return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v70, v72);
    }
  }
}

uint64_t sub_100040CF0(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v19 = a2;
  uint64_t v5 = sub_100048E48();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = sub_100048EA8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *a3;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v16(v11, a1, v5);
  v16(v9, v19, v5);
  swift_retain();
  sub_100048E68();
  sub_100032AE8((uint64_t)v15);
  sub_100023568((uint64_t)&v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_100040ED4(_OWORD *a1)
{
  Swift::UInt64 v1 = a1;
  long long v7 = *a1;
  swift_retain();
  sub_100026B50();
  sub_100048FB8();
  swift_release();
  sub_100023568((uint64_t)&v7);
  uint64_t v2 = *((void *)v1 + 4);
  uint64_t v3 = *((void *)v1 + 5);
  LOBYTE(v1) = *((unsigned char *)v1 + 48);
  sub_100015FD8();
  uint64_t v4 = (void (*)(uint64_t))sub_100041438(v2, v3, (char)v1, 0x417373696D736944, 0xED00006E6F697463, (void (*)(void, void, void))sub_100016108);
  uint64_t v5 = sub_100016108();
  v4(v5);
  return swift_release();
}

uint64_t sub_100040FC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 48);
  sub_100015FD8();
  uint64_t v4 = (void (*)(uint64_t))sub_100041438(v1, v2, v3, 0x417373696D736944, 0xED00006E6F697463, (void (*)(void, void, void))sub_100016108);
  uint64_t v5 = sub_100016108();
  v4(v5);

  return swift_release();
}

uint64_t sub_100041084@<X0>(uint64_t a1@<X8>)
{
  return sub_10003E7C4(a1);
}

unint64_t sub_1000410D0()
{
  unint64_t result = qword_10005EBB0;
  if (!qword_10005EBB0)
  {
    sub_1000044D8(&qword_10005EB78);
    sub_100005584(&qword_10005EBB8, &qword_10005EBC0);
    sub_100005584(&qword_10005EBC8, &qword_10005EBA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EBB0);
  }
  return result;
}

uint64_t sub_100041194(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000495C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_10004A088();
  uint64_t v9 = sub_1000498A8();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_1000095FC(1819242306, 0xE400000000000000, &v14);
    sub_10004A1A8();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000495B8();
  swift_getAtKeyPath();
  sub_10000490C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_100041398(uint64_t a1, uint64_t a2, char a3)
{
  return sub_100041438(a1, a2, a3, 0xD000000000000011, 0x8000000100055310, (void (*)(void, void, void))sub_100016108);
}

uint64_t sub_1000413C8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_100041438(a1, a2, a3, 0x417373696D736944, 0xED00006E6F697463, (void (*)(void, void, void))sub_100016108);
}

uint64_t sub_100041400(uint64_t a1, uint64_t a2, char a3)
{
  return sub_100041438(a1, a2, a3, 0x416563616C706552, 0xED00006E6F697463, (void (*)(void, void, void))sub_1000423B0);
}

uint64_t sub_100041438(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, void (*a6)(void, void, void))
{
  uint64_t v12 = sub_1000495C8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_retain();
  }
  else
  {
    uint64_t v25 = a4;
    swift_retain();
    os_log_type_t v16 = sub_10004A088();
    uint64_t v17 = sub_1000498A8();
    if (os_log_type_enabled(v17, v16))
    {
      uint64_t v18 = swift_slowAlloc();
      unint64_t v23 = a5;
      uint64_t v19 = (uint8_t *)v18;
      uint64_t v20 = swift_slowAlloc();
      uint64_t v24 = a6;
      uint64_t v27 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      v22[1] = v19 + 4;
      uint64_t v26 = sub_1000095FC(v25, v23, &v27);
      sub_10004A1A8();
      _os_log_impl((void *)&_mh_execute_header, v17, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v19, 0xCu);
      swift_arrayDestroy();
      a6 = v24;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000495B8();
    swift_getAtKeyPath();
    a6(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return v27;
  }
  return a1;
}

uint64_t sub_100041670(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_1000495C8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v9 = sub_10004A088();
    os_log_type_t v10 = sub_1000498A8();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      v14[0] = v12 + 4;
      v14[1] = sub_1000095FC(0x2928203E2D202928, 0xE800000000000000, &v15);
      sub_10004A1A8();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000495B8();
    swift_getAtKeyPath();
    sub_100016108();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v15;
  }
  return a1;
}

uint64_t sub_100041894@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000495C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004334(&qword_10005ECA8);
  __chkstk_darwin(v8);
  os_log_type_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005488(v2, (uint64_t)v10, &qword_10005ECA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100049338();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_10004A088();
    uint64_t v14 = sub_1000498A8();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)os_log_type_t v16 = 136315138;
      v18[2] = sub_1000095FC(0x414C52556E65704FLL, 0xED00006E6F697463, &v19);
      sub_10004A1A8();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000495B8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100041B60()
{
  return sub_100040FC4(v0 + 16);
}

uint64_t sub_100041B68(uint64_t a1)
{
  return a1;
}

uint64_t sub_100041B9C(uint64_t a1)
{
  uint64_t v2 = sub_100049338();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100049468();
}

unint64_t sub_100041C6C()
{
  unint64_t result = qword_10005EC38;
  if (!qword_10005EC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC38);
  }
  return result;
}

uint64_t sub_100041CC0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000044D8(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100041D48()
{
  return sub_100041CC0(&qword_10005EC48, &qword_10005EC28, (void (*)(void))sub_100041D84, (void (*)(void))sub_100041E28);
}

unint64_t sub_100041D84()
{
  unint64_t result = qword_10005EC50;
  if (!qword_10005EC50)
  {
    sub_1000044D8(&qword_10005EC20);
    sub_10004217C(&qword_10005EC58, (void (*)(uint64_t))type metadata accessor for LIDResolutionView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC50);
  }
  return result;
}

unint64_t sub_100041E28()
{
  unint64_t result = qword_10005EC60;
  if (!qword_10005EC60)
  {
    sub_1000044D8(&qword_10005EBF8);
    sub_100041ED4();
    sub_10004217C(&qword_10005EC88, (void (*)(uint64_t))&type metadata accessor for LanguagesProgressView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC60);
  }
  return result;
}

unint64_t sub_100041ED4()
{
  unint64_t result = qword_10005EC68;
  if (!qword_10005EC68)
  {
    sub_1000044D8(&qword_10005EC00);
    sub_10004217C(&qword_10005EC70, (void (*)(uint64_t))type metadata accessor for DownloadSelectionView);
    sub_100005584(&qword_10005EC78, &qword_10005EC80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC68);
  }
  return result;
}

unint64_t sub_100041FA4()
{
  unint64_t result = qword_10005EC90;
  if (!qword_10005EC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC90);
  }
  return result;
}

unint64_t sub_100041FF8()
{
  unint64_t result = qword_10005EC98;
  if (!qword_10005EC98)
  {
    sub_1000044D8(&qword_10005EBE8);
    sub_100041CC0(&qword_10005EC40, &qword_10005EC30, (void (*)(void))sub_100041D48, (void (*)(void))sub_100041FA4);
    sub_100041C6C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC98);
  }
  return result;
}

uint64_t sub_1000420F0()
{
  return sub_100049458();
}

uint64_t sub_10004211C()
{
  return sub_100040ED4((_OWORD *)(v0 + 16));
}

uint64_t sub_100042128()
{
  swift_release();
  swift_release();
  sub_100016108();

  return _swift_deallocObject(v0, 65, 7);
}

uint64_t sub_100042174(uint64_t a1, uint64_t a2)
{
  return sub_100040CF0(a1, a2, (long long *)(v2 + 16));
}

uint64_t sub_10004217C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000421DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100042244(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000422A8()
{
  unint64_t result = qword_10005ECB0;
  if (!qword_10005ECB0)
  {
    sub_1000044D8(&qword_10005EB90);
    sub_1000044D8(&qword_10005EB80);
    sub_1000044D8(&qword_10005DB40);
    sub_1000044D8(&qword_10005EB78);
    sub_1000410D0();
    swift_getOpaqueTypeConformance2();
    sub_1000124E8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005ECB0);
  }
  return result;
}

void *sub_1000423B4(void *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *uint64_t v4 = *a2;
    v4[1] = v7;
    *((unsigned char *)v4 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[3];
    uint64_t v9 = a2[4];
    char v10 = *((unsigned char *)a2 + 40);
    swift_retain();
    sub_100015FD8();
    v4[3] = v8;
    v4[4] = v9;
    *((unsigned char *)v4 + 40) = v10;
    uint64_t v11 = a2[6];
    uint64_t v12 = a2[7];
    char v13 = *((unsigned char *)a2 + 64);
    sub_100015FD8();
    v4[6] = v11;
    v4[7] = v12;
    *((unsigned char *)v4 + 64) = v13;
    uint64_t v14 = a2[9];
    uint64_t v15 = a2[10];
    char v16 = *((unsigned char *)a2 + 88);
    sub_100015FD8();
    v4[9] = v14;
    v4[10] = v15;
    *((unsigned char *)v4 + 88) = v16;
    uint64_t v17 = a3[9];
    uint64_t v18 = (void *)((char *)v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    sub_100004334(&qword_10005ECA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_100049338();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = a3[10];
    uint64_t v23 = a3[11];
    uint64_t v24 = (char *)v4 + v22;
    uint64_t v25 = (char *)a2 + v22;
    *uint64_t v24 = *v25;
    *((void *)v24 + 1) = *((void *)v25 + 1);
    uint64_t v26 = (char *)v4 + v23;
    uint64_t v27 = (char *)a2 + v23;
    char *v26 = *v27;
    *((void *)v26 + 1) = *((void *)v27 + 1);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100042580(uint64_t a1, uint64_t a2)
{
  swift_release();
  sub_100016108();
  sub_100016108();
  sub_100016108();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  sub_100004334(&qword_10005ECA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049338();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

uint64_t sub_100042670(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  swift_retain();
  sub_100015FD8();
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  char v12 = *(unsigned char *)(a2 + 64);
  sub_100015FD8();
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(unsigned char *)(a1 + 64) = v12;
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  char v15 = *(unsigned char *)(a2 + 88);
  sub_100015FD8();
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(unsigned char *)(a1 + 88) = v15;
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  sub_100004334(&qword_10005ECA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_100049338();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    void *v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  uint64_t v24 = a1 + v21;
  uint64_t v25 = a2 + v21;
  *(unsigned char *)uint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000427F0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_100015FD8();
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_100016108();
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  char v11 = *(unsigned char *)(a2 + 64);
  sub_100015FD8();
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_100016108();
  uint64_t v12 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 80);
  char v14 = *(unsigned char *)(a2 + 88);
  sub_100015FD8();
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v13;
  *(unsigned char *)(a1 + 88) = v14;
  sub_100016108();
  if (a1 != a2)
  {
    uint64_t v15 = a3[9];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (void *)(a2 + v15);
    sub_1000054EC(a1 + v15, &qword_10005ECA8);
    sub_100004334(&qword_10005ECA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_100049338();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[11];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(unsigned char *)uint64_t v23 = *(unsigned char *)v24;
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000429D8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v6 = a3[9];
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (const void *)(a2 + v6);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v9 = sub_100004334(&qword_10005ECA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100049338();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_100042B08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v7;
  sub_100016108();
  char v8 = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = v8;
  sub_100016108();
  char v9 = *(unsigned char *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = v9;
  sub_100016108();
  if (a1 != a2)
  {
    uint64_t v10 = a3[9];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (const void *)(a2 + v10);
    sub_1000054EC(a1 + v10, &qword_10005ECA8);
    uint64_t v13 = sub_100004334(&qword_10005ECA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100049338();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = a3[10];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(unsigned char *)uint64_t v16 = *(unsigned char *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  swift_release();
  uint64_t v18 = a3[11];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(unsigned char *)uint64_t v19 = *(unsigned char *)v20;
  *(void *)(v19 + 8) = *(void *)(v20 + 8);
  swift_release();
  return a1;
}

uint64_t sub_100042CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100042CC4);
}

uint64_t sub_100042CC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100004334(&qword_10005ECB8);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100042D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100042D8C);
}

uint64_t sub_100042D8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100004334(&qword_10005ECB8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for TranslationView()
{
  uint64_t result = qword_10005ED18;
  if (!qword_10005ED18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100042E84()
{
  sub_100042F40();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100042F40()
{
  if (!qword_10005ED28)
  {
    sub_100049338();
    unint64_t v0 = sub_1000492F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005ED28);
    }
  }
}

uint64_t sub_100042F98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100042FB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v13 = a1;
  uint64_t v2 = sub_100004334(&qword_10005ED70);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004334(&qword_10005DD78);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v1;
  sub_1000498B8();
  sub_100004334(&qword_10005ED78);
  sub_100005584(&qword_10005ED80, &qword_10005ED78);
  sub_1000492E8();
  sub_100005584(&qword_10005ED88, &qword_10005ED70);
  sub_10001D01C();
  sub_100049AF8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100049DB8();
  __n128 v10 = sub_100013FF0(0.0, 1, 0.0, 1, INFINITY, 0, 260.0, 0, v13, 0.0, 1, INFINITY, 0);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v7 + 8))(v9, v6, v10);
}

uint64_t sub_100043240@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_100004334(&qword_10005ED90);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = (char *)sub_100004334(&qword_10005ED98);
  uint64_t v7 = __chkstk_darwin(v72);
  uint64_t v79 = (uint64_t)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v67 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v67 - v12;
  *(void *)&long long v87 = 0;
  swift_retain();
  sub_100049C88();
  uint64_t v78 = v97;
  uint64_t v77 = v98;
  LOBYTE(v87) = 0;
  sub_100049C88();
  int v75 = v97;
  uint64_t v76 = v98;
  type metadata accessor for TranslationModel(0);
  sub_100046584(&qword_10005D858, (void (*)(uint64_t))type metadata accessor for TranslationModel);
  swift_retain();
  uint64_t v74 = sub_100049378();
  uint64_t v86 = v14;
  type metadata accessor for VoicePlayback();
  sub_100046584(&qword_10005E170, (void (*)(uint64_t))type metadata accessor for VoicePlayback);
  swift_retain();
  uint64_t v73 = sub_100049378();
  uint64_t v85 = v15;
  swift_retain();
  uint64_t v16 = sub_100049378();
  uint64_t v81 = v17;
  uint64_t v82 = v16;
  swift_release();
  int v84 = sub_1000498C8();
  sub_1000492D8();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  unsigned __int8 v123 = 0;
  int v83 = sub_100049928();
  sub_1000492D8();
  uint64_t v70 = v27;
  uint64_t v71 = v26;
  uint64_t v68 = v29;
  uint64_t v69 = v28;
  int v80 = v123;
  char v126 = 0;
  *(void *)uint64_t v6 = sub_1000496C8();
  *((void *)v6 + 1) = 0x4020000000000000;
  v6[16] = 0;
  uint64_t v30 = sub_100004334(&qword_10005EDA0);
  sub_100043890(a1, &v6[*(int *)(v30 + 44)]);
  unsigned __int8 v31 = sub_1000498F8();
  unsigned __int8 v32 = sub_100049918();
  unsigned __int8 v33 = sub_1000498E8();
  char v34 = sub_100049908();
  sub_100049908();
  if (sub_100049908() != v31) {
    char v34 = sub_100049908();
  }
  sub_100049908();
  if (sub_100049908() != v32) {
    char v34 = sub_100049908();
  }
  sub_100049908();
  if (sub_100049908() != v33) {
    char v34 = sub_100049908();
  }
  sub_1000492D8();
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  sub_100005488((uint64_t)v6, (uint64_t)v11, &qword_10005ED90);
  uint64_t v43 = &v11[*((int *)v72 + 9)];
  *uint64_t v43 = v34;
  *((void *)v43 + 1) = v36;
  *((void *)v43 + 2) = v38;
  *((void *)v43 + 3) = v40;
  *((void *)v43 + 4) = v42;
  v43[40] = 0;
  sub_1000054EC((uint64_t)v6, &qword_10005ED90);
  sub_100005424((uint64_t)v11, (uint64_t)v13, &qword_10005ED98);
  char v44 = v126;
  uint64_t v45 = v79;
  sub_100005488((uint64_t)v13, v79, &qword_10005ED98);
  uint64_t v72 = v13;
  uint64_t v47 = v73;
  uint64_t v46 = v74;
  *(void *)&long long v87 = v74;
  *((void *)&v87 + 1) = v86;
  *(void *)&long long v88 = v73;
  *((void *)&v88 + 1) = v85;
  *(void *)&long long v89 = v82;
  *((void *)&v89 + 1) = v81;
  uint64_t v48 = v78;
  *(void *)&long long v90 = v78;
  uint64_t v50 = v76;
  uint64_t v49 = v77;
  *((void *)&v90 + 1) = v77;
  char v51 = v75;
  LOBYTE(v91) = v75;
  *(_DWORD *)((char *)&v91 + 1) = *(_DWORD *)v125;
  DWORD1(v91) = *(_DWORD *)&v125[3];
  *((void *)&v91 + 1) = v76;
  LOBYTE(v92) = v84;
  *(_DWORD *)((char *)&v92 + 1) = *(_DWORD *)v124;
  DWORD1(v92) = *(_DWORD *)&v124[3];
  *((void *)&v92 + 1) = v19;
  *(void *)&long long v93 = v21;
  *((void *)&v93 + 1) = v23;
  *(void *)&long long v94 = v25;
  BYTE8(v94) = v80;
  *(_DWORD *)((char *)&v94 + 9) = v128[0];
  HIDWORD(v94) = *(_DWORD *)((char *)v128 + 3);
  LOBYTE(v95) = v83;
  DWORD1(v95) = *(_DWORD *)&v127[3];
  *(_DWORD *)((char *)&v95 + 1) = *(_DWORD *)v127;
  uint64_t v53 = v70;
  uint64_t v52 = v71;
  *((void *)&v95 + 1) = v71;
  *(void *)&v96[0] = v70;
  uint64_t v54 = v69;
  uint64_t v67 = v25;
  uint64_t v55 = v23;
  uint64_t v56 = v21;
  uint64_t v57 = v19;
  uint64_t v58 = v68;
  *((void *)&v96[0] + 1) = v69;
  *(void *)&v96[1] = v68;
  BYTE8(v96[1]) = v44;
  long long v59 = v88;
  *a2 = v87;
  a2[1] = v59;
  long long v60 = v90;
  a2[2] = v89;
  a2[3] = v60;
  long long v61 = v92;
  a2[4] = v91;
  a2[5] = v61;
  long long v62 = v93;
  long long v63 = v94;
  *(_OWORD *)((char *)a2 + 153) = *(_OWORD *)((char *)v96 + 9);
  long long v64 = v96[0];
  a2[8] = v95;
  a2[9] = v64;
  a2[6] = v62;
  a2[7] = v63;
  uint64_t v65 = sub_100004334(&qword_10005EDA8);
  sub_100005488(v45, (uint64_t)a2 + *(int *)(v65 + 48), &qword_10005ED98);
  sub_1000235B0((uint64_t)&v87);
  sub_1000054EC((uint64_t)v72, &qword_10005ED98);
  sub_1000054EC(v45, &qword_10005ED98);
  uint64_t v97 = v46;
  uint64_t v98 = v86;
  uint64_t v99 = v47;
  uint64_t v100 = v85;
  uint64_t v101 = v82;
  uint64_t v102 = v81;
  uint64_t v103 = v48;
  uint64_t v104 = v49;
  char v105 = v51;
  *(_DWORD *)uint64_t v106 = *(_DWORD *)v125;
  *(_DWORD *)&v106[3] = *(_DWORD *)&v125[3];
  uint64_t v107 = v50;
  char v108 = v84;
  *(_DWORD *)uint64_t v109 = *(_DWORD *)v124;
  *(_DWORD *)&v109[3] = *(_DWORD *)&v124[3];
  uint64_t v110 = v57;
  uint64_t v111 = v56;
  uint64_t v112 = v55;
  uint64_t v113 = v67;
  char v114 = v80;
  *(_DWORD *)&v115[3] = *(_DWORD *)((char *)v128 + 3);
  *(_DWORD *)uint64_t v115 = v128[0];
  char v116 = v83;
  *(_DWORD *)&v117[3] = *(_DWORD *)&v127[3];
  *(_DWORD *)uint64_t v117 = *(_DWORD *)v127;
  uint64_t v118 = v52;
  uint64_t v119 = v53;
  uint64_t v120 = v54;
  uint64_t v121 = v58;
  char v122 = v44;
  return sub_100046508((uint64_t)&v97);
}

id sub_100043890@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v3 = sub_100004334(&qword_10005EDB0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v68 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v73 = (uint64_t)&v61 - v6;
  uint64_t v7 = sub_100049038();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004334(&qword_10005EDB8);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  char v66 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v71 = (uint64_t)&v61 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  long long v63 = (char *)&v61 - v17;
  __chkstk_darwin(v16);
  uint64_t v74 = (uint64_t)&v61 - v18;
  uint64_t v19 = sub_100004334(&qword_10005EDC0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v70 = (char *)&v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v61 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v61 - v26;
  uint64_t v72 = a1;
  uint64_t v75 = a1;
  sub_100004334(&qword_10005EDC8);
  sub_100005584(&qword_10005EDD0, &qword_10005EDC8);
  sub_100049D88();
  uint64_t v64 = v20;
  uint64_t v65 = v19;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  uint64_t v69 = v27;
  v28(v27, v25, v19);
  uint64_t v29 = enum case for TranslateFeatures.refreshedSystemTranslation(_:);
  long long v62 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v62(v10, enum case for TranslateFeatures.refreshedSystemTranslation(_:), v7);
  LOBYTE(v25) = sub_100049028();
  long long v61 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  uint64_t v30 = v61(v10, v7);
  if ((v25 & 1) != 0
    || (unsigned __int8 v31 = (void *)(*(void *)(v72 + 8)
                       + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier),
        (uint64_t v32 = v31[1]) != 0)
    && (*v31 == 0xD000000000000013 && v32 == 0x8000000100055330 || (uint64_t v30 = sub_10004A308(), (v30 & 1) != 0)))
  {
    uint64_t v33 = sub_100004334(&qword_10005E0A0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v74, 1, 1, v33);
  }
  else
  {
    __chkstk_darwin(v30);
    *(&v61 - 2) = (uint64_t (*)(char *, uint64_t))v72;
    sub_100004334(&qword_10005E0B8);
    sub_10001CF4C();
    uint64_t v34 = v74;
    sub_100049D88();
    uint64_t v35 = sub_100004334(&qword_10005E0A0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 0, 1, v35);
  }
  uint64_t v36 = self;
  swift_retain();
  id result = [v36 defaultWorkspace];
  if (result)
  {
    uint64_t v38 = result;
    NSString v39 = sub_100049E78();
    unsigned int v40 = [v38 applicationIsInstalled:v39];
    swift_release();

    if (v40)
    {
      __chkstk_darwin(v41);
      *(&v61 - 2) = (uint64_t (*)(char *, uint64_t))v72;
      sub_100004334(&qword_10005EDE8);
      sub_100005584(&qword_10005EDF0, &qword_10005EDE8);
      uint64_t v42 = v73;
      sub_100049D88();
      uint64_t v43 = sub_100004334(&qword_10005EDD8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
    }
    else
    {
      uint64_t v44 = sub_100004334(&qword_10005EDD8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v73, 1, 1, v44);
    }
    uint64_t v45 = (uint64_t)v63;
    uint64_t v46 = v61;
    v62(v10, v29, v7);
    char v47 = sub_100049028();
    uint64_t v48 = v46(v10, v7);
    if (v47)
    {
      __chkstk_darwin(v48);
      *(&v61 - 2) = (uint64_t (*)(char *, uint64_t))v72;
      sub_100004334(&qword_10005E0B8);
      sub_10001CF4C();
      sub_100049D88();
      uint64_t v49 = sub_100004334(&qword_10005E0A0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v45, 0, 1, v49);
    }
    else
    {
      uint64_t v50 = sub_100004334(&qword_10005E0A0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v45, 1, 1, v50);
    }
    char v51 = v67;
    uint64_t v52 = (uint64_t)v68;
    uint64_t v53 = v65;
    uint64_t v54 = (uint64_t)v66;
    uint64_t v55 = v64;
    uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
    uint64_t v57 = v70;
    v56(v70, v69, v65);
    sub_100005488(v74, v71, &qword_10005EDB8);
    sub_100005488(v73, v52, &qword_10005EDB0);
    sub_100005488(v45, v54, &qword_10005EDB8);
    v56(v51, v57, v53);
    uint64_t v58 = (int *)sub_100004334(&qword_10005EDE0);
    uint64_t v59 = v71;
    sub_100005488(v71, (uint64_t)&v51[v58[12]], &qword_10005EDB8);
    sub_100005488(v52, (uint64_t)&v51[v58[16]], &qword_10005EDB0);
    sub_100005488(v54, (uint64_t)&v51[v58[20]], &qword_10005EDB8);
    sub_1000054EC(v45, &qword_10005EDB8);
    sub_1000054EC(v73, &qword_10005EDB0);
    sub_1000054EC(v74, &qword_10005EDB8);
    long long v60 = *(void (**)(char *, uint64_t))(v55 + 8);
    v60(v69, v53);
    sub_1000054EC(v54, &qword_10005EDB8);
    sub_1000054EC(v52, &qword_10005EDB0);
    sub_1000054EC(v59, &qword_10005EDB8);
    return (id)((uint64_t (*)(char *, uint64_t))v60)(v70, v53);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100044184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v90 = a2;
  uint64_t v3 = sub_100049D58();
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v85 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  int v83 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v82 = (char *)&v75 - v6;
  uint64_t v7 = type metadata accessor for TranslationView();
  uint64_t v93 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v93 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004334(&qword_10005E0D0);
  uint64_t v95 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  long long v91 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  int v80 = (char *)&v75 - v13;
  uint64_t v14 = sub_100004334(&qword_10005E0B8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  long long v88 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v81 = (char *)&v75 - v17;
  uint64_t v97 = sub_100004334(&qword_10005EE20);
  uint64_t v18 = __chkstk_darwin(v97);
  long long v87 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  long long v89 = (char *)&v75 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v86 = (uint64_t)&v75 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v75 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v75 - v27;
  uint64_t v29 = sub_100004334(&qword_10005EE28);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v94 = (uint64_t)&v75 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v75 - v32;
  uint64_t v34 = a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  long long v96 = v33;
  uint64_t v92 = v10;
  if (v98)
  {
    uint64_t v76 = v26;
    uint64_t v77 = v28;
    sub_1000465DC(a1, (uint64_t)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v35 = (*(unsigned __int8 *)(v93 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
    uint64_t v78 = v8;
    uint64_t v36 = swift_allocObject();
    uint64_t v79 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_100046644((uint64_t)v79, v36 + v35);
    sub_100004334(&qword_10005E130);
    sub_100005584(&qword_10005E138, &qword_10005E130);
    uint64_t v37 = v80;
    sub_100049CD8();
    sub_100005584(&qword_10005E0C8, &qword_10005E0D0);
    uint64_t v38 = (uint64_t)v81;
    sub_100049AE8();
    (*(void (**)(char *, uint64_t))(v95 + 8))(v37, v10);
    int v80 = (char *)a1;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v39 = v99;
    if (v99) {
      swift_bridgeObjectRelease();
    }
    BOOL v40 = v39 == 0;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = v40;
    uint64_t v43 = (uint64_t)v76;
    sub_100005488(v38, (uint64_t)v76, &qword_10005E0B8);
    uint64_t v44 = (uint64_t *)(v43 + *(int *)(v97 + 36));
    *uint64_t v44 = KeyPath;
    v44[1] = (uint64_t)sub_100046B48;
    v44[2] = v42;
    sub_1000054EC(v38, &qword_10005E0B8);
    uint64_t v45 = (uint64_t)v77;
    sub_100005424(v43, (uint64_t)v77, &qword_10005EE20);
    uint64_t v46 = v82;
    sub_100049D48();
    uint64_t v47 = v86;
    sub_100005488(v45, v86, &qword_10005EE20);
    uint64_t v49 = v83;
    uint64_t v48 = v84;
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
    uint64_t v51 = v85;
    v50(v83, v46, v85);
    uint64_t v52 = v94;
    sub_100005488(v47, v94, &qword_10005EE20);
    uint64_t v53 = sub_100004334(&qword_10005EE40);
    v50((char *)(v52 + *(int *)(v53 + 48)), v49, v51);
    uint64_t v54 = *(void (**)(char *, uint64_t))(v48 + 8);
    v54(v46, v51);
    sub_1000054EC(v45, &qword_10005EE20);
    v54(v49, v51);
    sub_1000054EC(v47, &qword_10005EE20);
    uint64_t v55 = sub_100004334(&qword_10005EE30);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v52, 0, 1, v55);
    sub_100005424(v52, (uint64_t)v96, &qword_10005EE28);
    uint64_t v57 = (uint64_t)v89;
    uint64_t v56 = v90;
    uint64_t v9 = v79;
    uint64_t v34 = (uint64_t)v80;
    uint64_t v59 = (uint64_t)v87;
    uint64_t v58 = (uint64_t)v88;
  }
  else
  {
    uint64_t v60 = sub_100004334(&qword_10005EE30);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v33, 1, 1, v60);
    uint64_t v57 = (uint64_t)v89;
    uint64_t v56 = v90;
    uint64_t v59 = (uint64_t)v87;
    uint64_t v58 = (uint64_t)v88;
    uint64_t v47 = v86;
  }
  uint64_t v61 = v93;
  sub_1000465DC(v34, (uint64_t)v9);
  unint64_t v62 = (*(unsigned __int8 *)(v61 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  uint64_t v63 = swift_allocObject();
  sub_100046644((uint64_t)v9, v63 + v62);
  sub_100004334(&qword_10005E130);
  sub_100005584(&qword_10005E138, &qword_10005E130);
  uint64_t v64 = v91;
  sub_100049CD8();
  sub_100005584(&qword_10005E0C8, &qword_10005E0D0);
  uint64_t v65 = v92;
  sub_100049AE8();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v64, v65);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v66 = v99;
  if (v99) {
    swift_bridgeObjectRelease();
  }
  BOOL v67 = v66 == 0;
  uint64_t v68 = swift_getKeyPath();
  uint64_t v69 = swift_allocObject();
  *(unsigned char *)(v69 + 16) = v67;
  sub_100005488(v58, v59, &qword_10005E0B8);
  uint64_t v70 = (uint64_t *)(v59 + *(int *)(v97 + 36));
  *uint64_t v70 = v68;
  v70[1] = (uint64_t)sub_100046B48;
  v70[2] = v69;
  sub_1000054EC(v58, &qword_10005E0B8);
  sub_100005424(v59, v57, &qword_10005EE20);
  uint64_t v71 = (uint64_t)v96;
  uint64_t v72 = v94;
  sub_100005488((uint64_t)v96, v94, &qword_10005EE28);
  sub_100005488(v57, v47, &qword_10005EE20);
  sub_100005488(v72, v56, &qword_10005EE28);
  uint64_t v73 = sub_100004334(&qword_10005EE38);
  sub_100005488(v47, v56 + *(int *)(v73 + 48), &qword_10005EE20);
  sub_1000054EC(v57, &qword_10005EE20);
  sub_1000054EC(v71, &qword_10005EE28);
  sub_1000054EC(v47, &qword_10005EE20);
  return sub_1000054EC(v72, &qword_10005EE28);
}

void sub_100044C38()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  if (v8)
  {
    uint64_t v1 = *(void *)(v0 + 24);
    uint64_t v2 = *(void *)(v0 + 32);
    char v3 = *(unsigned char *)(v0 + 40);
    sub_100015FD8();
    uint64_t v4 = (void (*)(id))sub_100041400(v1, v2, v3);
    sub_100016108();
    id v5 = objc_allocWithZone((Class)NSAttributedString);
    NSString v6 = sub_100049E78();
    swift_bridgeObjectRelease();
    id v7 = [v5 initWithString:v6];

    v4(v7);
    swift_release();
  }
}

uint64_t sub_100044D74()
{
  return sub_1000464A8();
}

uint64_t sub_100044DAC()
{
  uint64_t v1 = v0;
  if (qword_10005D440 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100049208();
  sub_100009598(v2, (uint64_t)qword_1000605E0);
  char v3 = sub_1000491E8();
  os_log_type_t v4 = sub_10004A068();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Copy translation", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = [self generalPasteboard];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  if (v14)
  {
    NSString v7 = sub_100049E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  [v6 setString:v7];

  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  sub_100015FD8();
  uint64_t v11 = (void (*)(uint64_t))sub_1000413C8(v8, v9, v10);
  uint64_t v12 = sub_100016108();
  v11(v12);
  return swift_release();
}

uint64_t sub_100044FA8()
{
  return sub_1000464A8();
}

uint64_t sub_100044FDC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranslationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_100004334(&qword_10005E0D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000465DC(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_100046644((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  sub_100004334(&qword_10005E130);
  sub_100005584(&qword_10005E138, &qword_10005E130);
  sub_100049CD8();
  sub_100005584(&qword_10005E0C8, &qword_10005E0D0);
  sub_100049B78();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100045234(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  uint64_t v2 = *(void *)(a1 + 80);
  char v3 = *(unsigned char *)(a1 + 88);
  sub_100015FD8();
  uint64_t v4 = (void (*)(uint64_t))sub_100041670(v1, v2, v3);
  uint64_t v5 = sub_100016108();
  v4(v5);

  return swift_release();
}

uint64_t sub_1000452C0()
{
  return Label.init(title:icon:)(sub_100045314, 0, sub_10001AC8C, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_100045314@<X0>(uint64_t a1@<X8>)
{
  sub_100049668();
  uint64_t result = sub_100049A68();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100045394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v3 = sub_100049D58();
  uint64_t v76 = *(void *)(v3 - 8);
  uint64_t v77 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  int v83 = (char *)v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v82 = (char *)v71 - v6;
  uint64_t v7 = sub_100004334(&qword_10005EDF8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  int v80 = (char *)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v79 = (uint64_t)v71 - v10;
  uint64_t v11 = type metadata accessor for TranslationView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11 - 8);
  uint64_t v73 = (void (*)(void, void))((char *)v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v71 - v15;
  uint64_t v84 = sub_100004334(&qword_10005E0D0);
  uint64_t v17 = *(void *)(v84 - 8);
  uint64_t v18 = __chkstk_darwin(v84);
  uint64_t v75 = (char *)v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v74 = (char *)v71 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)v71 - v22;
  uint64_t v24 = sub_100004334(&qword_10005EE00);
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v78 = (uint64_t)v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)v71 - v28;
  __chkstk_darwin(v27);
  uint64_t v85 = (uint64_t)v71 - v30;
  sub_1000465DC(a1, (uint64_t)v16);
  uint64_t v31 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v32 = (v31 + 16) & ~v31;
  v71[4] = v31 | 7;
  v71[5] = v32 + v13;
  uint64_t v33 = swift_allocObject();
  uint64_t v72 = v32;
  sub_100046644((uint64_t)v16, v33 + v32);
  uint64_t v86 = a1;
  uint64_t v34 = sub_100004334(&qword_10005E130);
  uint64_t v35 = sub_100005584(&qword_10005E138, &qword_10005E130);
  v71[3] = v34;
  v71[2] = v35;
  sub_100049CD8();
  uint64_t v36 = a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v37 = v87;
  if (v87) {
    swift_bridgeObjectRelease();
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = v37 == 0;
  uint64_t v40 = v17 + 16;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v42 = v84;
  v41(v29, v23, v84);
  uint64_t v43 = (uint64_t *)&v29[*(int *)(v24 + 36)];
  *uint64_t v43 = KeyPath;
  v43[1] = (uint64_t)sub_100046738;
  v43[2] = v39;
  uint64_t v46 = *(void (**)(void, void))(v17 + 8);
  uint64_t v45 = v17 + 8;
  uint64_t v44 = v46;
  v46(v23, v42);
  sub_100005424((uint64_t)v29, v85, &qword_10005EE00);
  uint64_t v47 = (void *)(*(void *)(v36 + 8) + OBJC_IVAR____TtC20TranslationUIService16TranslationModel_hostBundleIdentifier);
  uint64_t v48 = v47[1];
  if (v48 && (*v47 == 0xD000000000000013 && v48 == 0x8000000100055330 || (sub_10004A308() & 1) != 0))
  {
    uint64_t v49 = sub_100004334(&qword_10005EE10);
    uint64_t v50 = v79;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v79, 1, 1, v49);
    uint64_t v52 = (uint64_t)v80;
    uint64_t v51 = v81;
  }
  else
  {
    v71[1] = v45;
    sub_100049D48();
    uint64_t v53 = v73;
    sub_1000465DC(v36, (uint64_t)v73);
    uint64_t v54 = swift_allocObject();
    sub_100046644((uint64_t)v53, v54 + v72);
    uint64_t v55 = v74;
    sub_100049CD8();
    uint64_t v73 = v44;
    uint64_t v56 = v76;
    uint64_t v57 = *(void (**)(void))(v76 + 16);
    v71[0] = v40;
    uint64_t v58 = v83;
    uint64_t v59 = v77;
    v57();
    uint64_t v60 = v41;
    uint64_t v61 = v75;
    uint64_t v62 = v84;
    v60(v75, v55, v84);
    uint64_t v52 = (uint64_t)v80;
    ((void (*)(char *, char *, uint64_t))v57)(v80, v58, v59);
    uint64_t v63 = sub_100004334(&qword_10005EE08);
    v60((char *)(v52 + *(int *)(v63 + 48)), v61, v62);
    uint64_t v64 = (void (*)(char *, uint64_t))v73;
    v73(v55, v62);
    uint64_t v65 = *(void (**)(char *, uint64_t))(v56 + 8);
    v65(v82, v59);
    v64(v61, v62);
    v65(v83, v59);
    uint64_t v66 = sub_100004334(&qword_10005EE10);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v52, 0, 1, v66);
    uint64_t v50 = v79;
    sub_100005424(v52, v79, &qword_10005EDF8);
    uint64_t v51 = v81;
  }
  uint64_t v67 = v78;
  uint64_t v68 = v85;
  sub_100005488(v85, v78, &qword_10005EE00);
  sub_100005488(v50, v52, &qword_10005EDF8);
  sub_100005488(v67, v51, &qword_10005EE00);
  uint64_t v69 = sub_100004334(&qword_10005EE18);
  sub_100005488(v52, v51 + *(int *)(v69 + 48), &qword_10005EDF8);
  sub_1000054EC(v50, &qword_10005EDF8);
  sub_1000054EC(v68, &qword_10005EE00);
  sub_1000054EC(v52, &qword_10005EDF8);
  return sub_1000054EC(v67, &qword_10005EE00);
}

uint64_t sub_100045C04()
{
  swift_retain();
  sub_100034DD4();

  return swift_release();
}

uint64_t sub_100045C44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v1 = sub_100004334(&qword_10005E130);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049668();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049278();
  swift_release();
  swift_release();
  swift_release();
  sub_100049C78();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v2 + 32))(v6, v4, v1);
}

uint64_t sub_100045DFC()
{
  uint64_t v0 = sub_100048D48();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100049338();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11[8] = 3;
  uint64_t v12 = 0x6D6574737973;
  unint64_t v13 = 0xE600000000000000;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  NSString v8 = sub_100049E78();
  sub_100046D94();
  sub_100015624();
  Class isa = sub_100049E28().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

  type metadata accessor for TranslationView();
  sub_100041894((uint64_t)v7);
  swift_retain();
  sub_100027AA0((uint64_t)v3);
  swift_release();
  sub_100049328();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100046034()
{
  sub_100049668();

  return sub_100049C78();
}

uint64_t sub_1000460A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranslationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_100004334(&qword_10005E0D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000465DC(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_100046644((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  sub_100004334(&qword_10005E130);
  sub_100005584(&qword_10005E138, &qword_10005E130);
  sub_100049CD8();
  sub_100005584(&qword_10005E0C8, &qword_10005E0D0);
  sub_100049B78();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000462F8()
{
  uint64_t v0 = sub_100048D48();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100049338();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationView();
  sub_100041894((uint64_t)v7);
  sub_100048D38();
  sub_100049328();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100046480()
{
  return sub_1000464A8();
}

uint64_t sub_1000464A8()
{
  sub_100049668();

  return sub_100049C78();
}

uint64_t sub_100046500@<X0>(_OWORD *a1@<X8>)
{
  return sub_100043240(*(void *)(v1 + 16), a1);
}

uint64_t sub_100046508(uint64_t a1)
{
  return a1;
}

uint64_t sub_100046574@<X0>(uint64_t a1@<X8>)
{
  return sub_100044184(*(void *)(v1 + 16), a1);
}

uint64_t sub_10004657C()
{
  return sub_100044FDC(*(void *)(v0 + 16));
}

uint64_t sub_100046584(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000465CC()
{
  return sub_1000460A8(*(void *)(v0 + 16));
}

uint64_t sub_1000465D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100045394(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000465DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100046644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000466A8()
{
  return sub_1000467AC((uint64_t (*)(uint64_t))sub_100045C04);
}

uint64_t sub_1000466C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100045C44(a1);
}

uint64_t sub_1000466D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049578();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100046700()
{
  return sub_100049588();
}

uint64_t sub_100046728()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100046738(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_100046754()
{
  return sub_1000467AC((uint64_t (*)(uint64_t))sub_100045DFC);
}

uint64_t sub_100046778()
{
  return sub_1000467AC((uint64_t (*)(uint64_t))sub_1000462F8);
}

uint64_t sub_100046794()
{
  return sub_1000467AC(sub_100045234);
}

uint64_t sub_1000467AC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TranslationView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_10004682C()
{
  return sub_1000469E0(sub_100044DAC);
}

uint64_t sub_100046844()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100046858()
{
  uint64_t v1 = type metadata accessor for TranslationView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  sub_100016108();
  sub_100016108();
  sub_100016108();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 36);
  sub_100004334(&qword_10005ECA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100049338();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000469C8()
{
  return sub_1000469E0((uint64_t (*)(void))sub_100044C38);
}

uint64_t sub_1000469E0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100046A44()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100046A58()
{
  unint64_t result = qword_10005EE48;
  if (!qword_10005EE48)
  {
    sub_1000044D8(&qword_10005DD80);
    sub_1000044D8(&qword_10005ED70);
    sub_100005584(&qword_10005ED88, &qword_10005ED70);
    sub_10001D01C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EE48);
  }
  return result;
}

unint64_t sub_100046B4C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004334(&qword_10005EE50);
  uint64_t v2 = (void *)sub_10004A2B8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100047000(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_100046C68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004334(&qword_10005EE58);
  uint64_t v2 = sub_10004A2B8();
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
    sub_1000471A0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100047000(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10003A11C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
    v6 += 48;
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

unint64_t sub_100046D94()
{
  if (!*(void *)(v0 + 32))
  {
    id v1 = [self mainBundle];
    id v2 = [v1 bundleIdentifier];

    if (!v2)
    {
      id v3 = [self processInfo];
      id v2 = [v3 processName];
    }
    sub_100049EA8();
  }
  sub_100004334(&qword_10005D8A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004CB40;
  *(void *)(inited + 32) = 0x6D614E746E657665;
  *(void *)(inited + 40) = 0xE900000000000065;
  uint64_t v5 = (void *)inited;
  swift_bridgeObjectRetain();
  NSString v6 = sub_100049E78();
  swift_bridgeObjectRelease();
  v5[6] = v6;
  v5[7] = 0x4E737365636F7270;
  v5[8] = 0xEB00000000656D61;
  NSString v7 = sub_100049E78();
  swift_bridgeObjectRelease();
  v5[9] = v7;
  v5[10] = 0x6E6F697461636F6CLL;
  v5[11] = 0xE800000000000000;
  v5[12] = sub_100049E78();
  return sub_100046B4C((uint64_t)v5);
}

unint64_t sub_100047000(uint64_t a1, uint64_t a2)
{
  sub_10004A378();
  sub_100049F08();
  Swift::Int v4 = sub_10004A3A8();

  return sub_1000470BC(a1, a2, v4);
}

unint64_t sub_100047078(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10004A1F8(*(void *)(v2 + 40));

  return sub_100047208(a1, v4);
}

unint64_t sub_1000470BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10004A308() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10004A308() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000471A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005EE60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100047208(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000472D0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10004A208();
      sub_10003E4D8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000472D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10004732C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100047370()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  return v1;
}

void sub_1000473E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100048E48();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005D448 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100049208();
  sub_100009598(v9, (uint64_t)qword_1000605F8);
  char v10 = sub_1000491E8();
  os_log_type_t v11 = sub_10004A058();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Requested voice playback", v12, 2u);
    swift_slowDealloc();
  }

  id v13 = [self sharedInstance];
  if (*(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_text + 8))
  {
    id v59 = v13;
    uint64_t v14 = v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale;
    swift_beginAccess();
    sub_100048A74(v14, (uint64_t)v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {

      sub_100048ADC((uint64_t)v4);
    }
    else
    {
      uint64_t v57 = v6;
      uint64_t v58 = v5;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = 1;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_100049288();
      id v15 = objc_allocWithZone((Class)_LTLocalePair);
      Class isa = sub_100048E18().super.isa;
      Class v17 = sub_100048E18().super.isa;
      id v18 = [v15 initWithSourceLocale:isa targetLocale:v17];

      id v19 = [objc_allocWithZone((Class)_LTSpeakRequest) initWithLocalePair:v18];
      NSString v20 = sub_100049E78();
      swift_bridgeObjectRelease();
      [v19 setText:v20];

      id v21 = [v19 uniqueID];
      uint64_t v22 = sub_100049EA8();
      uint64_t v24 = v23;

      uint64_t v25 = (uint64_t *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID);
      *uint64_t v25 = v22;
      v25[1] = v24;
      swift_bridgeObjectRelease();
      sub_10000A3C8(0, (unint64_t *)&qword_10005D820);
      id v26 = v19;
      uint64_t v27 = (void *)sub_10004A0A8();
      LOBYTE(v22) = sub_10004A0B8();

      [v26 setForcedOfflineTranslation:v22 & 1];
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v1;
      *(void *)(v28 + 24) = v26;
      uint64_t v64 = sub_100048B40;
      uint64_t v65 = v28;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      unint64_t v61 = 1107296256;
      uint64_t v62 = sub_10004806C;
      uint64_t v63 = &unk_10005B180;
      uint64_t v29 = _Block_copy(&aBlock);
      swift_retain();
      id v30 = v26;
      swift_release();
      [v30 setCompletionHandler:v29];
      _Block_release(v29);
      uint64_t aBlock = 0;
      unsigned int v31 = [v59 setCategory:AVAudioSessionCategoryPlayback withOptions:40 error:&aBlock];
      id v32 = (id)aBlock;
      if (v31
        && (uint64_t aBlock = 0,
            id v33 = v32,
            unsigned int v34 = [v59 setActive:1 withOptions:0 error:&aBlock],
            id v32 = (id)aBlock,
            v34))
      {
        id v35 = (id)aBlock;
      }
      else
      {
        id v36 = v32;
        sub_100048D28();

        swift_willThrow();
        swift_errorRetain();
        uint64_t v37 = sub_1000491E8();
        os_log_type_t v38 = sub_10004A078();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = swift_slowAlloc();
          id v56 = v18;
          uint64_t v40 = (uint8_t *)v39;
          uint64_t v55 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = 138412290;
          uint64_t v41 = sub_100048D18();
          uint64_t aBlock = v41;
          sub_10004A1A8();
          *uint64_t v55 = v41;
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to change audio category: %@", v40, 0xCu);
          sub_100004334(&qword_10005E8A0);
          swift_arrayDestroy();
          swift_slowDealloc();
          id v18 = v56;
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
        }
      }
      uint64_t v42 = v57;
      id v43 = [objc_allocWithZone((Class)_LTTranslator) init];
      [v43 translate:v30];

      uint64_t v44 = sub_100048DB8();
      uint64_t v46 = v45;
      if (*(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation + 8))
      {
        uint64_t v47 = *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation);
        uint64_t v48 = *(void **)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation + 8);
      }
      else
      {
        uint64_t v47 = 0x6E776F6E6B6E75;
        uint64_t v48 = (void *)0xE700000000000000;
      }
      uint64_t aBlock = 0x2F6D6574737973;
      unint64_t v61 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      v67._countAndFlagsBits = v44;
      v67._object = v46;
      sub_100049F18(v67);
      swift_bridgeObjectRelease();
      v68._countAndFlagsBits = 47;
      v68._object = (void *)0xE100000000000000;
      sub_100049F18(v68);
      v69._countAndFlagsBits = v47;
      v69._object = v48;
      sub_100049F18(v69);
      swift_bridgeObjectRelease();
      uint64_t v49 = aBlock;
      uint64_t v50 = (void (*)(uint64_t, void *))v61;
      uint64_t v51 = *(void **)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier);
      uint64_t v52 = *(uint64_t (**)(uint64_t))(v1
                                              + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier
                                              + 8);
      LOBYTE(aBlock) = 0;
      unint64_t v61 = v49;
      uint64_t v62 = v50;
      uint64_t v63 = v51;
      uint64_t v64 = v52;
      swift_bridgeObjectRetain();
      NSString v53 = sub_100049E78();
      sub_100046D94();
      sub_10000A3C8(0, (unint64_t *)&qword_10005D8B8);
      Class v54 = sub_100049E28().super.isa;
      swift_bridgeObjectRelease();
      AnalyticsSendEvent();

      (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v58);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
  }
}

uint64_t sub_100047C7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_100049DF8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100049E18();
  uint64_t v9 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  os_log_type_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A3C8(0, (unint64_t *)&qword_10005DBE8);
  uint64_t v12 = (void *)sub_10004A108();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  aBlock[4] = sub_100048BA4;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10004732C;
  aBlock[3] = &unk_10005B1D0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  id v15 = a3;
  swift_release();
  sub_100049E08();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100048BAC();
  sub_100004334(&qword_10005DBF8);
  sub_100048C04();
  sub_10004A1E8();
  sub_10004A118();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_100047F14(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID);
  uint64_t v5 = *(void *)(a1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID + 8);
  swift_bridgeObjectRetain();
  id v6 = [a2 uniqueID];
  uint64_t v7 = sub_100049EA8();
  uint64_t v9 = v8;

  if (v4)
  {
    if (v5 == v7 && v4 == v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_10004A308();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        return result;
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049288();
    *uint64_t v3 = 0;
    v3[1] = 0;
    return swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void sub_10004806C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000480D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100048E48();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v27[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100004334(&qword_10005D818);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_10005D448 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100049208();
  sub_100009598(v9, (uint64_t)qword_1000605F8);
  uint64_t v10 = sub_1000491E8();
  os_log_type_t v11 = sub_10004A058();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Pausing voice playback", v12, 2u);
    swift_slowDealloc();
  }
  uint64_t v13 = 0x6E776F6E6B6E75;

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v28) = 0;
  swift_retain();
  sub_100049288();
  uint64_t v14 = (void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_requestID);
  *uint64_t v14 = 0;
  v14[1] = 0;
  swift_bridgeObjectRelease();
  id v15 = [objc_allocWithZone((Class)_LTTranslator) init];
  [v15 cleanup];

  uint64_t v16 = v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale;
  swift_beginAccess();
  sub_100048A74(v16, (uint64_t)v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
  {
    sub_100048ADC((uint64_t)v8);
    uint64_t v17 = (void *)0xE700000000000000;
    uint64_t v18 = 0x6E776F6E6B6E75;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_100048ADC((uint64_t)v8);
    uint64_t v18 = sub_100048DB8();
    uint64_t v17 = v19;
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation + 8))
  {
    uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation);
    NSString v20 = *(void **)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_loggingLocation + 8);
  }
  else
  {
    NSString v20 = (void *)0xE700000000000000;
  }
  uint64_t v28 = 0x2F6D6574737973;
  unint64_t v29 = 0xE700000000000000;
  swift_bridgeObjectRetain();
  v33._countAndFlagsBits = v18;
  v33._object = v17;
  sub_100049F18(v33);
  swift_bridgeObjectRelease();
  v34._countAndFlagsBits = 47;
  v34._object = (void *)0xE100000000000000;
  sub_100049F18(v34);
  v35._countAndFlagsBits = v13;
  v35._object = v20;
  sub_100049F18(v35);
  swift_bridgeObjectRelease();
  unint64_t v21 = v28;
  unint64_t v22 = v29;
  uint64_t v23 = *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier);
  uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_processBundleIdentifier + 8);
  LOBYTE(v28) = 1;
  unint64_t v29 = v21;
  unint64_t v30 = v22;
  uint64_t v31 = v23;
  uint64_t v32 = v24;
  swift_bridgeObjectRetain();
  NSString v25 = sub_100049E78();
  sub_100046D94();
  sub_10000A3C8(0, (unint64_t *)&qword_10005D8B8);
  Class isa = sub_100049E28().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_100048510()
{
  if (qword_10005D448 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100049208();
  sub_100009598(v0, (uint64_t)qword_1000605F8);
  swift_retain_n();
  uint64_t v1 = sub_1000491E8();
  os_log_type_t v2 = sub_10004A058();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67240192;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049278();
    swift_release();
    swift_release();
    swift_release();
    sub_10004A1A8();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Requested toggling voice playback; previously playing: %{BOOL,public}d",
      v3,
      8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  swift_release();
  if (v4 == 1) {
    sub_1000480D8();
  }
  else {
    sub_1000473E4();
  }
}

uint64_t sub_100048708()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback__isPlaying;
  uint64_t v2 = sub_100004334(&qword_10005E428);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100048ADC(v0 + OBJC_IVAR____TtC20TranslationUIService13VoicePlayback_locale);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10004880C()
{
  return type metadata accessor for VoicePlayback();
}

uint64_t type metadata accessor for VoicePlayback()
{
  uint64_t result = qword_10005EEB0;
  if (!qword_10005EEB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100048860()
{
  sub_1000242C0();
  if (v0 <= 0x3F)
  {
    sub_100016CA8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_100048938@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for VoicePlayback();
  uint64_t result = sub_100049238();
  *a1 = result;
  return result;
}

uint64_t sub_100048978@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049278();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000489F8()
{
  return sub_100049288();
}

uint64_t sub_100048A74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004334(&qword_10005D818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100048ADC(uint64_t a1)
{
  uint64_t v2 = sub_100004334(&qword_10005D818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100048B40(uint64_t a1)
{
  return sub_100047C7C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100048B48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100048B58()
{
  return swift_release();
}

uint64_t sub_100048B64()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100048BA4()
{
  return sub_100047F14(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_100048BAC()
{
  unint64_t result = qword_10005DBF0;
  if (!qword_10005DBF0)
  {
    sub_100049DF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DBF0);
  }
  return result;
}

unint64_t sub_100048C04()
{
  unint64_t result = qword_10005DC00;
  if (!qword_10005DC00)
  {
    sub_1000044D8(&qword_10005DBF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC00);
  }
  return result;
}

uint64_t sub_100048C68()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_100048C78()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_100048C88()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_100048C98()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100048CA8()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_100048CB8()
{
  return URLComponents.percentEncodedQuery.getter();
}

uint64_t sub_100048CC8()
{
  return URLComponents.url.getter();
}

uint64_t sub_100048CD8()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_100048CE8()
{
  return URLComponents.init()();
}

uint64_t sub_100048CF8()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100048D08(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100048D18()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100048D28()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100048D38()
{
  return static URL.downloadLanguagesURL.getter();
}

uint64_t sub_100048D48()
{
  return type metadata accessor for URL();
}

uint64_t sub_100048D58()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_100048D68()
{
  return UUID.uuidString.getter();
}

NSUUID sub_100048D78()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100048D88()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100048D98()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100048DA8()
{
  return Locale.init(identifier:)();
}

uint64_t sub_100048DB8()
{
  return Locale.identifier.getter();
}

uint64_t sub_100048DC8()
{
  return Locale.ltIdentifier.getter();
}

uint64_t sub_100048DD8()
{
  return Locale.sqDisplayName(context:in:)();
}

uint64_t sub_100048DE8()
{
  return Locale.ltDefaultTarget(for:availableLocales:map:)();
}

uint64_t sub_100048DF8()
{
  return Locale.languageIdentifier.getter();
}

BOOL sub_100048E08()
{
  return Locale.isRTL()();
}

NSLocale sub_100048E18()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_100048E28()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100048E38()
{
  return static Locale.current.getter();
}

uint64_t sub_100048E48()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100048E58()
{
  return type metadata accessor for TranslationTaskHint();
}

uint64_t sub_100048E68()
{
  return LocalePair.init(sourceLocale:targetLocale:)();
}

uint64_t sub_100048E78()
{
  return LocalePair.sourceLocale.getter();
}

uint64_t sub_100048E88()
{
  return LocalePair.targetLocale.getter();
}

uint64_t sub_100048E98()
{
  return LocalePair.identifier.getter();
}

uint64_t sub_100048EA8()
{
  return type metadata accessor for LocalePair();
}

uint64_t sub_100048EB8()
{
  return type metadata accessor for PlayButton.Size();
}

uint64_t sub_100048EC8()
{
  return PlayButton.init(isPlaying:size:action:)();
}

uint64_t sub_100048ED8()
{
  return type metadata accessor for PlayButton();
}

uint64_t sub_100048EE8()
{
  return CloseButton.init(action:)();
}

uint64_t sub_100048EF8()
{
  return type metadata accessor for CloseButton();
}

uint64_t sub_100048F08()
{
  return type metadata accessor for ExpandingText();
}

uint64_t sub_100048F18()
{
  return ExpandingText.init(_:isExpanded:_:buttonAction:)();
}

uint64_t sub_100048F28()
{
  return LanguageModel.init(locale:state:)();
}

uint64_t sub_100048F38()
{
  return type metadata accessor for LanguageModel();
}

uint64_t sub_100048F48()
{
  return LanguageState.description.getter();
}

uint64_t sub_100048F58()
{
  return static LanguageState.== infix(_:_:)();
}

uint64_t sub_100048F68()
{
  return type metadata accessor for LanguageState();
}

uint64_t sub_100048F78()
{
  return LanguagesView.init(sourceLocale:targetLocale:selection:showsManageLanguages:requiresOnDeviceAvailability:suggestedLocales:)();
}

uint64_t sub_100048F88()
{
  return type metadata accessor for LanguagesView();
}

uint64_t sub_100048F98()
{
  return LanguageOption.locale.getter();
}

uint64_t sub_100048FA8()
{
  return type metadata accessor for LanguageOption();
}

void sub_100048FB8()
{
}

uint64_t sub_100048FC8()
{
  return LanguagesService.init(task:)();
}

uint64_t sub_100048FD8()
{
  return LanguagesService.models.getter();
}

uint64_t sub_100048FE8()
{
  return type metadata accessor for LanguagesService();
}

uint64_t sub_100048FF8()
{
  return static LowConfidenceLID.maxLocalesToSuggest.getter();
}

uint64_t sub_100049008()
{
  return GrayCapsuleButton.init(title:action:)();
}

uint64_t sub_100049018()
{
  return type metadata accessor for GrayCapsuleButton();
}

uint64_t sub_100049028()
{
  return TranslateFeatures.isEnabled.getter();
}

uint64_t sub_100049038()
{
  return type metadata accessor for TranslateFeatures();
}

uint64_t sub_100049048()
{
  return DisambiguationView.Item.init(title:description:)();
}

uint64_t sub_100049058()
{
  return type metadata accessor for DisambiguationView.Item();
}

uint64_t sub_100049068()
{
  return DisambiguationView.init(items:selection:)();
}

uint64_t sub_100049078()
{
  return type metadata accessor for DisambiguationView();
}

uint64_t sub_100049088()
{
  return static SharedTranslations.translationGroupSharedTranslations()();
}

uint64_t sub_100049098()
{
  return dispatch thunk of SharedTranslations.addTranslation(_:)();
}

uint64_t sub_1000490A8()
{
  return SharedTranslations.Translation.init(sourceLocale:targetLocale:sourceText:targetText:)();
}

uint64_t sub_1000490B8()
{
  return type metadata accessor for SharedTranslations.Translation();
}

uint64_t sub_1000490C8()
{
  return dispatch thunk of SharedTranslations.contains(translation:)();
}

uint64_t sub_1000490D8()
{
  return type metadata accessor for SharedTranslations();
}

uint64_t sub_1000490E8()
{
  return LanguagesProgressView.init(progress:action:)();
}

uint64_t sub_1000490F8()
{
  return type metadata accessor for LanguagesProgressView();
}

uint64_t sub_100049118()
{
  return static LanguagesInstallService.add(pair:useCellular:)();
}

uint64_t sub_100049128()
{
  return dispatch thunk of LanguagesViewController.sourceLocale.setter();
}

uint64_t sub_100049138()
{
  return dispatch thunk of LanguagesViewController.targetLocale.setter();
}

uint64_t sub_100049148()
{
  return LanguagesViewController.init(initialSelection:showsCloseButton:requireOnDevice:)();
}

uint64_t sub_100049158()
{
  return dispatch thunk of LanguagesViewController.delegate.setter();
}

uint64_t sub_100049168()
{
  return type metadata accessor for LanguagesViewController();
}

uint64_t sub_100049178()
{
  return SecureHostingController.init(rootView:)();
}

uint64_t sub_100049188()
{
  return DetectableLanguagePicker.init(isDetected:selectedOption:preferredLocales:oppositeLocale:languageModels:sourceUsesOCR:)();
}

uint64_t sub_100049198()
{
  return type metadata accessor for DetectableLanguagePicker();
}

uint64_t sub_1000491A8()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000491B8()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t sub_1000491C8()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_1000491D8()
{
  return OSSignpostID.init(_:)();
}

uint64_t sub_1000491E8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000491F8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100049208()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100049218()
{
  return AnyCancellable.store<A>(in:)();
}

uint64_t sub_100049228()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_100049238()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_100049248()
{
}

uint64_t sub_100049258()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100049268()
{
  return Published.projectedValue.getter();
}

uint64_t sub_100049278()
{
  return static Published.subscript.getter();
}

uint64_t sub_100049288()
{
  return static Published.subscript.setter();
}

uint64_t sub_100049298()
{
  return type metadata accessor for Published();
}

uint64_t sub_1000492A8()
{
  return Publisher.combineLatest<A>(_:)();
}

uint64_t sub_1000492B8()
{
  return Publisher.removeDuplicates(by:)();
}

uint64_t sub_1000492C8()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1000492D8()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000492E8()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_1000492F8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100049308()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100049318()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100049328()
{
  return OpenURLAction.callAsFunction(_:)();
}

uint64_t sub_100049338()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_100049348()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_100049358()
{
  return NavigationLink<>.init(_:destination:isActive:)();
}

uint64_t sub_100049368()
{
  return NavigationView.init(content:)();
}

uint64_t sub_100049378()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_100049388()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_100049398()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_1000493A8()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_1000493B8()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t sub_1000493C8()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_1000493D8()
{
  return static SafeAreaRegions.keyboard.getter();
}

uint64_t sub_1000493E8()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_1000493F8()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_100049408()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100049418()
{
  return ToolbarItemGroup.init(placement:content:)();
}

uint64_t sub_100049428()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100049438()
{
  return EnvironmentObject.error()();
}

uint64_t sub_100049448()
{
  return EnvironmentObject.init()();
}

uint64_t sub_100049458()
{
  return EnvironmentValues.unlockAndOpenURL.getter();
}

uint64_t sub_100049468()
{
  return EnvironmentValues.unlockAndOpenURL.setter();
}

uint64_t sub_100049478()
{
  return EnvironmentValues.presentLanguageSelection.getter();
}

uint64_t sub_100049488()
{
  return EnvironmentValues.presentLanguageSelection.setter();
}

uint64_t sub_100049498()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000494A8()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_1000494B8()
{
  return EnvironmentValues.accentColor.getter();
}

uint64_t sub_1000494C8()
{
  return EnvironmentValues.accentColor.setter();
}

uint64_t sub_1000494D8()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000494E8()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000494F8()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100049508()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_100049518()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100049528()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100049538()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100049548()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100049558()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_100049568()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_100049578()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100049588()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100049598()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_1000495A8()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1000495B8()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000495C8()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000495D8()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000495E8()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000495F8()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_100049608()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t sub_100049618()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100049628()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

void sub_100049638(Swift::String a1)
{
}

uint64_t sub_100049648()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100049658()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_100049668()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100049678()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_100049688()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100049698()
{
  return static AccessibilityTraits.playsSound.getter();
}

uint64_t sub_1000496A8()
{
  return static AccessibilityTraits.startsMediaSession.getter();
}

uint64_t sub_1000496B8()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_1000496C8()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000496D8()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000496E8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000496F8()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t sub_100049708()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_100049718()
{
  return InsetGroupedListStyle.init()();
}

uint64_t sub_100049728()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t sub_100049738()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100049748()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_100049758()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_100049768()
{
  return type metadata accessor for LabelStyleConfiguration.Icon();
}

uint64_t sub_100049778()
{
  return LabelStyleConfiguration.icon.getter();
}

uint64_t sub_100049788()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t sub_100049798()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t sub_1000497A8()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t sub_1000497B8()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t sub_1000497C8()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t sub_1000497D8()
{
  return type metadata accessor for ButtonStyleConfiguration();
}

uint64_t sub_1000497E8()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_1000497F8()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_100049808()
{
  return GroupBoxStyleConfiguration.content.getter();
}

uint64_t sub_100049818()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_100049828()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_100049838()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_100049858()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_100049868()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_100049878()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_100049898()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_1000498A8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000498B8()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_1000498C8()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000498D8()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000498E8()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1000498F8()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100049908()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_100049918()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100049928()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_100049938()
{
  return static Font.body.getter();
}

uint64_t sub_100049948()
{
  return Font.bold()();
}

uint64_t sub_100049958()
{
  return static Font.title.getter();
}

uint64_t sub_100049968()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100049978()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_100049988()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_100049998()
{
  return static Font.title3.getter();
}

uint64_t sub_1000499A8()
{
  return Font.weight(_:)();
}

uint64_t sub_1000499B8()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000499C8()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_1000499D8()
{
  return List<>.init(content:)();
}

uint64_t sub_1000499E8()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t sub_1000499F8()
{
  return Text.Measurements.size(of:in:writingMode:)();
}

uint64_t sub_100049A08()
{
  return Text.Measurements.init()();
}

uint64_t sub_100049A18()
{
  return type metadata accessor for Text.Measurements();
}

uint64_t sub_100049A28()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100049A38()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100049A48()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_100049A58()
{
  return Text.font(_:)();
}

uint64_t sub_100049A68()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100049A78()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100049A88()
{
  return View.bindGeometry(to:reader:)();
}

uint64_t sub_100049A98()
{
  return View.containerPadding()();
}

uint64_t sub_100049AA8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100049AB8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100049AC8()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_100049AD8()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_100049AE8()
{
  return View.accessibility(identifier:)();
}

uint64_t sub_100049AF8()
{
  return View.groupBoxStyle<A>(_:)();
}

uint64_t sub_100049B08()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100049B18()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_100049B28()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_100049B38()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_100049B48()
{
  return View.navigationBarItems<A>(trailing:)();
}

uint64_t sub_100049B58()
{
  return View.navigationBarHidden(_:)();
}

uint64_t sub_100049B68()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_100049B78()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_100049B88()
{
  return View.scrollContentBackground<A>(_:)();
}

uint64_t sub_100049B98()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_100049BA8()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t sub_100049BB8()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_100049BC8()
{
  return View.redacted(reason:)();
}

uint64_t sub_100049BD8()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_100049BE8()
{
  return static Color.tertiarySourceTextColor.getter();
}

uint64_t sub_100049BF8()
{
  return Color.init(uiColor:)();
}

uint64_t sub_100049C08()
{
  return static Color.accentColor.getter();
}

uint64_t sub_100049C18()
{
  return static Color.clear.getter();
}

uint64_t sub_100049C28()
{
  return static Color.primary.getter();
}

uint64_t sub_100049C38()
{
  return static Color.secondary.getter();
}

uint64_t sub_100049C48()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100049C58()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100049C78()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100049C88()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100049C98()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100049CA8()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100049CB8()
{
  return State.projectedValue.getter();
}

uint64_t sub_100049CC8()
{
  return type metadata accessor for State();
}

uint64_t sub_100049CD8()
{
  return Button.init(action:label:)();
}

uint64_t sub_100049CE8()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_100049CF8()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100049D08()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_100049D18()
{
  return Binding.init(get:set:)();
}

uint64_t sub_100049D28()
{
  return static Binding.constant(_:)();
}

uint64_t sub_100049D38()
{
  return type metadata accessor for Binding();
}

uint64_t sub_100049D48()
{
  return Divider.init()();
}

uint64_t sub_100049D58()
{
  return type metadata accessor for Divider();
}

uint64_t sub_100049D68()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_100049D78()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_100049D88()
{
  return GroupBox<>.init(content:)();
}

uint64_t sub_100049D98()
{
  return static Material.thick.getter();
}

uint64_t sub_100049DA8()
{
  return type metadata accessor for Material();
}

uint64_t sub_100049DB8()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_100049DC8()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_100049DD8()
{
  return static Alignment.center.getter();
}

uint64_t sub_100049DE8()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100049DF8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100049E08()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100049E18()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100049E28()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100049E38()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100049E48()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100049E58()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100049E68()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100049E78()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100049E88()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100049E98()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100049EA8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100049EB8()
{
  return String.init(format:_:)();
}

uint64_t sub_100049EC8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100049ED8()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100049EE8()
{
  return static String.TRANSLATION_LIMIT.getter();
}

uint64_t sub_100049EF8()
{
  return static String.localizedSettingsAppName.getter();
}

uint64_t sub_100049F08()
{
  return String.hash(into:)();
}

void sub_100049F18(Swift::String a1)
{
}

Swift::Int sub_100049F28()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100049F38()
{
  return Sequence<>.sortedLocalized(for:)();
}

uint64_t sub_100049F48()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100049F58()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100049F68()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100049F78()
{
  return Array.description.getter();
}

uint64_t sub_100049F88()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100049F98()
{
  return Array<A>.localeState(_:)();
}

uint64_t sub_100049FA8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100049FB8()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100049FC8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100049FD8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100049FE8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100049FF8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10004A008()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10004A018()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10004A028()
{
  return AsyncThrowingStream.makeAsyncIterator()();
}

uint64_t sub_10004A048()
{
  return Double.write<A>(to:)();
}

uint64_t sub_10004A058()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10004A068()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10004A078()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10004A088()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10004A098()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10004A0A8()
{
  return static NSUserDefaults.translationGroupDefaults.getter();
}

uint64_t sub_10004A0B8()
{
  return NSUserDefaults.onDeviceOnly.getter();
}

uint64_t sub_10004A0C8()
{
  return NSUserDefaults.firstUseConsent.getter();
}

uint64_t sub_10004A0D8()
{
  return NSUserDefaults.firstUseConsent.setter();
}

uint64_t sub_10004A0E8()
{
  return NSUserDefaults.lastUsedLocaleIdentifier.getter();
}

uint64_t sub_10004A0F8()
{
  return NSUserDefaults.lastUsedLocaleIdentifier.setter();
}

uint64_t sub_10004A108()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10004A118()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10004A128(Swift::Int limit)
{
  return *(_OWORD *)&NSAttributedString.truncated(limit:)(limit);
}

uint64_t sub_10004A138()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_10004A148()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_10004A158()
{
  return NSNotificationCenter.publisher(for:object:)();
}

NSNumber sub_10004A168(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_10004A178(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_10004A188()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10004A198()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10004A1A8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10004A1B8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10004A1C8()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_10004A1D8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10004A1E8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_10004A1F8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10004A208()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10004A218()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10004A228()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10004A238()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_10004A248(Swift::Int a1)
{
}

uint64_t sub_10004A258()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10004A268()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10004A278()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10004A288()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10004A298()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10004A2A8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10004A2B8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10004A2C8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10004A2E8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10004A2F8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10004A308()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10004A318()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10004A328()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10004A338()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10004A348()
{
  return Error._code.getter();
}

uint64_t sub_10004A358()
{
  return Error._domain.getter();
}

uint64_t sub_10004A368()
{
  return Error._userInfo.getter();
}

uint64_t sub_10004A378()
{
  return Hasher.init(_seed:)();
}

void sub_10004A388(Swift::UInt a1)
{
}

void sub_10004A398(Swift::UInt64 a1)
{
}

Swift::Int sub_10004A3A8()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
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