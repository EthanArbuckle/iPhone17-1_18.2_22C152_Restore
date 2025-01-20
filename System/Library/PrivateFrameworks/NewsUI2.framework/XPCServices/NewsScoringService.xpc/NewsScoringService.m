int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v22;
  objc_super v23;
  void v24[4];

  v3 = sub_10000BFD0();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005594(0, &qword_100016348, &qword_100016350);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10000CB20;
  v8 = (objc_class *)sub_10000C090();
  v9 = [objc_allocWithZone(v8) init];
  *(void *)(v7 + 56) = v8;
  *(void *)(v7 + 64) = sub_10000563C(&qword_100016358, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v7 + 32) = v9;
  v10 = (objc_class *)sub_10000C030();
  v11 = [objc_allocWithZone(v10) init];
  *(void *)(v7 + 96) = v10;
  *(void *)(v7 + 104) = sub_10000563C(&qword_100016360, (void (*)(uint64_t))&type metadata accessor for NewsAppPersonalizationAssembly);
  *(void *)(v7 + 72) = v11;
  sub_100005594(0, &qword_100016368, &qword_100016370);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10000CB30;
  v13 = type metadata accessor for Assembly();
  v14 = swift_allocObject();
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = sub_10000563C(&qword_100016378, (void (*)(uint64_t))type metadata accessor for Assembly);
  *(void *)(v12 + 32) = v14;
  sub_10000BF00();
  swift_allocObject();
  sub_10000BEF0();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Container.Environment.normal(_:), v3);
  sub_10000C000();
  swift_allocObject();
  qword_100016DE8 = sub_10000BFE0();
  sub_10000BFF0();
  v15 = (objc_class *)type metadata accessor for ScoringServiceListenerDelegate();
  v16 = objc_allocWithZone(v15);
  sub_100005684(v24, v24[3]);
  type metadata accessor for ScoringEngine();
  v17 = (char *)v16;
  v18 = sub_10000BED0();
  if (v18)
  {
    *(void *)&v17[OBJC_IVAR____TtC18NewsScoringService30ScoringServiceListenerDelegate_scoringEngine] = v18;

    v23.receiver = v17;
    v23.super_class = v15;
    v19 = objc_msgSendSuper2(&v23, "init");
    sub_1000056C8((uint64_t)v24);
    qword_100016DF0 = (uint64_t)v19;
    v20 = [self serviceListener];
    qword_100016DF8 = (uint64_t)v20;
    [v20 setDelegate:qword_100016DF0];
    [v20 resume];
    LODWORD(v18) = 0;
  }
  else
  {
    __break(1u);
  }
  return v18;
}

void sub_100005594(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1000055EC(255, a3);
    unint64_t v4 = sub_10000C380();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000055EC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000563C(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_100005684(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000056C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_100016620)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100016620);
    }
  }
}

uint64_t sub_100005770(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100008480();
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000C330();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_10000C3A0();
    sub_100008480();
    return a1;
  }
}

void sub_100005810(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    sub_1000084D8(0, (unint64_t *)&qword_100016A40);
    Class isa = sub_10000C190().super.isa;
  }
  if (a2) {
    uint64_t v6 = sub_10000BDE0();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

uint64_t sub_1000058E0(void *a1, int a2, int a3, uint64_t a4, void *aBlock, unint64_t *a6)
{
  v9 = _Block_copy(aBlock);
  sub_1000084D8(0, a6);
  unint64_t v10 = sub_10000C210();
  _Block_copy(v9);
  id v11 = a1;
  unint64_t v12 = sub_100005770(v10);
  sub_100007D34(v12, a4, (uint64_t)v11, (uint64_t)v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();
  _Block_release(v9);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000059A8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v66 = a2;
  uint64_t v67 = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_10000BEB0();
  uint64_t v73 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v73 + 64);
  uint64_t v8 = __chkstk_darwin(v6);
  v65 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v59 - v9;
  id v64 = [objc_allocWithZone((Class)NSDate) init];
  sub_10000BEA0();
  v77 = &_swiftEmptyArrayStorage;
  sub_100005594(0, &qword_100016A00, &qword_100016A08);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10000CB20;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_10000C340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v72 = (id)a1;
  *(void *)(v11 + 56) = &type metadata for Int;
  *(void *)(v11 + 64) = &protocol witness table for Int;
  *(void *)(v11 + 32) = v12;
  sub_100007BE0(&qword_100016A10, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = sub_10000C370();
  uint64_t v15 = v14;
  *(void *)(v11 + 96) = &type metadata for String;
  *(void *)(v11 + 104) = sub_100007510();
  *(void *)(v11 + 72) = v13;
  *(void *)(v11 + 80) = v15;
  sub_1000084D8(0, &qword_100016A20);
  v16 = (void *)sub_10000C2C0();
  sub_10000C260();
  sub_10000C0A0();
  swift_bridgeObjectRelease();

  sub_100005684((void *)(v4 + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_notificationScoringService), *(void *)(v4 + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_notificationScoringService + 24));
  sub_10000BE90();
  sub_10000C060();
  swift_bridgeObjectRelease();
  v17 = sub_100006F5C(0, 1, 1, &_swiftEmptyArrayStorage);
  v77 = v17;
  unint64_t v19 = v17[2];
  unint64_t v18 = v17[3];
  if (v19 >= v18 >> 1) {
    v77 = sub_100006F5C((void *)(v18 > 1), v19 + 1, 1, v17);
  }
  uint64_t v20 = v75;
  uint64_t v21 = (uint64_t)v76;
  uint64_t v22 = sub_100007564((uint64_t)&v74, v75);
  __chkstk_darwin(v22);
  v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v25 + 16))(v24);
  sub_1000070B4(v19, (uint64_t)v24, (uint64_t *)&v77, v20, v21);
  sub_1000056C8((uint64_t)&v74);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v26 = sub_10000C0B0();
  swift_allocObject();
  uint64_t v27 = sub_10000C0C0();
  v28 = v77;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v28 = sub_100006F5C(0, v28[2] + 1, 1, v28);
  }
  unint64_t v30 = v28[2];
  unint64_t v29 = v28[3];
  if (v30 >= v29 >> 1) {
    v28 = sub_100006F5C((void *)(v29 > 1), v30 + 1, 1, v28);
  }
  uint64_t v75 = v26;
  v76 = &protocol witness table for InterestToken;
  *(void *)&long long v74 = v27;
  v28[2] = v30 + 1;
  uint64_t v31 = sub_1000075F4(&v74, (uint64_t)&v28[5 * v30 + 4]);
  v77 = v28;
  __chkstk_darwin(v31);
  uint64_t v32 = (uint64_t)v72;
  *(&v59 - 4) = v4;
  *(&v59 - 3) = v32;
  *(&v59 - 2) = (uint64_t)v10;
  sub_10000767C();
  sub_10000BFC0();
  v33 = v10;
  v60 = v10;
  uint64_t v34 = v73;
  v35 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  uint64_t v70 = v73 + 16;
  v71 = v35;
  v36 = v65;
  uint64_t v37 = v6;
  v35(v65, v33, v6);
  v38 = v77;
  uint64_t v39 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v69 = v39 | 7;
  uint64_t v59 = v7 + 7;
  unint64_t v61 = (v7 + 7 + ((v39 + 16) & ~v39)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v62 = (v39 + 16) & ~v39;
  uint64_t v40 = swift_allocObject();
  uint64_t v68 = v37;
  v41 = *(void (**)(uint64_t, char *, uint64_t))(v34 + 32);
  v41(v40 + ((v39 + 16) & ~v39), v36, v37);
  *(void *)(v40 + ((v7 + 7 + ((v39 + 16) & ~v39)) & 0xFFFFFFFFFFFFFFF8)) = v38;
  v42 = (void *)sub_10000BF70();
  uint64_t ObjectType = sub_10000BFB0();
  swift_release();
  swift_release();

  v43 = v60;
  uint64_t v44 = v68;
  v71(v36, v60, v68);
  uint64_t v45 = (v39 + 32) & ~v39;
  unint64_t v46 = (v59 + v45) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v47 = swift_allocObject();
  v48 = v64;
  *(void *)(v47 + 16) = v72;
  *(void *)(v47 + 24) = v48;
  v41(v47 + v45, v36, v44);
  v49 = (void *)(v47 + v46);
  uint64_t v51 = v66;
  uint64_t v50 = v67;
  void *v49 = v66;
  v49[1] = v50;
  swift_bridgeObjectRetain();
  id v72 = v48;
  swift_retain();
  v52 = (void *)sub_10000BF70();
  sub_10000BF80();
  swift_release();
  swift_release();

  uint64_t v53 = v68;
  v71(v36, v43, v68);
  unint64_t v54 = v61;
  uint64_t v55 = swift_allocObject();
  v41(v55 + v62, v36, v53);
  v56 = (void *)(v55 + v54);
  void *v56 = v51;
  v56[1] = v50;
  swift_retain();
  v57 = (void *)sub_10000BF70();
  sub_10000BF90();
  swift_release();
  swift_release();
  swift_release();

  return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v43, v53);
}

uint64_t sub_100006168(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v27 = sub_10000C110();
  uint64_t v30 = *(void *)(v27 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000C140();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000C160();
  uint64_t v25 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v23 - v12;
  sub_10000BE90();
  id v14 = objc_allocWithZone((Class)NDAssertion);
  NSString v15 = sub_10000C1B0();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithName:v15];

  v23[1] = *(void *)((char *)v24 + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_cooldownQueue);
  sub_10000C150();
  sub_10000C170();
  v24 = *(void (**)(char *, uint64_t))(v8 + 8);
  v24(v11, v7);
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v26;
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v18;
  aBlock[4] = nullsub_1;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CC4;
  aBlock[3] = &unk_100010AE0;
  unint64_t v19 = _Block_copy(aBlock);
  id v20 = v16;
  swift_bridgeObjectRetain();
  sub_10000C120();
  uint64_t v31 = &_swiftEmptyArrayStorage;
  sub_100007BE0(&qword_100016A48, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007C28(0, &qword_100016A50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007C7C(&qword_100016A58, &qword_100016A50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v21 = v27;
  sub_10000C2F0();
  sub_10000C280();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v21);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v29);
  v24(v13, v25);
  return swift_release();
}

uint64_t sub_100006590(uint64_t *a1, unint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v8 = *a1;
  sub_100005594(0, &qword_100016A00, &qword_100016A08);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10000CB70;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10000C340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v9 + 56) = &type metadata for Int;
  *(void *)(v9 + 64) = &protocol witness table for Int;
  *(void *)(v9 + 32) = v10;
  uint64_t v11 = *(void *)(v8 + 16);
  *(void *)(v9 + 96) = &type metadata for Int;
  *(void *)(v9 + 104) = &protocol witness table for Int;
  *(void *)(v9 + 72) = v11;
  id v12 = objc_msgSend(a3, "fc_millisecondTimeIntervalUntilNow");
  *(void *)(v9 + 136) = &type metadata for UInt64;
  *(void *)(v9 + 144) = &protocol witness table for UInt64;
  *(void *)(v9 + 112) = v12;
  sub_10000BEB0();
  sub_100007BE0(&qword_100016A10, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = sub_10000C370();
  uint64_t v15 = v14;
  *(void *)(v9 + 176) = &type metadata for String;
  *(void *)(v9 + 184) = sub_100007510();
  *(void *)(v9 + 152) = v13;
  *(void *)(v9 + 160) = v15;
  sub_1000084D8(0, &qword_100016A20);
  id v16 = (void *)sub_10000C2C0();
  sub_10000C260();
  sub_10000C0A0();
  swift_bridgeObjectRelease();

  sub_10000679C(v8);
  a5();
  return swift_bridgeObjectRelease();
}

void sub_10000679C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100007B04();
    uint64_t v2 = (void *)sub_10000C350();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v26) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v26) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v26) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v26) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v26)
          {
            unint64_t v12 = *(void *)(v27 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v26) {
                break;
              }
              unint64_t v12 = *(void *)(v27 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_100007B7C();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain();
    v18.super.super.Class isa = sub_10000C230().super.super.isa;
    unint64_t v19 = sub_100006E00(v17, v16);
    unint64_t v20 = v19;
    if (v21)
    {
      uint64_t v7 = (uint64_t *)(v2[6] + 16 * v19);
      swift_bridgeObjectRelease();
      *uint64_t v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(NSNumber *)(v8 + 8 * v20) = v18;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v19;
    uint64_t v22 = (uint64_t *)(v2[6] + 16 * v19);
    *uint64_t v22 = v17;
    v22[1] = v16;
    *(NSNumber *)(v2[7] + 8 * v19) = v18;
    uint64_t v23 = v2[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_34;
    }
    v2[2] = v25;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_100006A48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t))
{
  sub_100005594(0, &qword_100016A00, &qword_100016A08);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000CB20;
  sub_1000055EC(0, &qword_100016A30);
  sub_10000C310();
  *(void *)(v5 + 56) = &type metadata for String;
  unint64_t v6 = sub_100007510();
  *(void *)(v5 + 64) = v6;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0xE000000000000000;
  sub_10000BEB0();
  sub_100007BE0(&qword_100016A10, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v7 = sub_10000C370();
  *(void *)(v5 + 96) = &type metadata for String;
  *(void *)(v5 + 104) = v6;
  *(void *)(v5 + 72) = v7;
  *(void *)(v5 + 80) = v8;
  sub_1000084D8(0, &qword_100016A20);
  unint64_t v9 = (void *)sub_10000C2C0();
  sub_10000C260();
  sub_10000C0A0();
  swift_bridgeObjectRelease();

  return a3(0, a1);
}

uint64_t sub_100006CC4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_100006D38()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ScoringEngine()
{
  return self;
}

unint64_t sub_100006E00(uint64_t a1, uint64_t a2)
{
  sub_10000C3F0();
  sub_10000C1F0();
  Swift::Int v4 = sub_10000C410();
  return sub_100006E78(a1, a2, v4);
}

unint64_t sub_100006E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000C390() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000C390() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100006F5C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005594(0, &qword_100016A60, &qword_100016A68);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_1000055EC(0, &qword_100016A68);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000070B4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v9 = sub_100007CCC((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_1000075F4(&v12, v10 + 40 * a1 + 32);
}

id sub_10000714C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  char v21 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v20 = sub_10000C290();
  uint64_t v4 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000C270();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_10000C140();
  __chkstk_darwin(v8 - 8);
  uint64_t v19 = OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_cooldownQueue;
  v18[1] = sub_1000084D8(0, &qword_1000169D8);
  uint64_t v9 = v3;
  sub_10000C130();
  int64_t v26 = &_swiftEmptyArrayStorage;
  sub_100007BE0(&qword_1000169E0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100007C28(0, &qword_1000169E8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100007C7C(&qword_1000169F0, &qword_1000169E8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000C2F0();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v20);
  *(void *)(v18[2] + v19) = sub_10000C2A0();
  uint64_t v10 = &v9[OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_tabiScoringService];
  *((void *)v10 + 3) = sub_10000C080();
  *((void *)v10 + 4) = &protocol witness table for TabiUserEventHistoryScoringService;
  long long v12 = v21;
  uint64_t v11 = v22;
  *(void *)uint64_t v10 = v21;
  sub_10000746C(v11, (uint64_t)&v9[OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_notificationScoringService]);
  uint64_t v13 = v23;
  *(void *)&v9[OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_bundleSubscriptionManager] = v23;
  id v14 = v12;
  id v15 = v13;

  v25.receiver = v9;
  v25.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v25, "init");
  sub_1000056C8(v11);
  return v16;
}

uint64_t sub_10000746C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000074D0()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007508(objc_class *a1, uint64_t a2)
{
  sub_100005810(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_100007510()
{
  unint64_t result = qword_100016A18;
  if (!qword_100016A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016A18);
  }
  return result;
}

uint64_t sub_100007564(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000075B4()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000075EC()
{
  return sub_10000AE48();
}

uint64_t sub_1000075F4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000760C()
{
  sub_100005684((void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_notificationScoringService), *(void *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_notificationScoringService+ 24));
  return sub_10000C070();
}

void sub_10000767C()
{
  if (!qword_100016A28)
  {
    unint64_t v0 = sub_10000C1A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016A28);
    }
  }
}

uint64_t sub_1000076E4()
{
  uint64_t v1 = sub_10000BEB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100007788()
{
  uint64_t v1 = *(void *)(sub_10000BEB0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_100006168(v0 + v2, *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_100007818()
{
  uint64_t v1 = sub_10000BEB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000790C(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_10000BEB0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100006590(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), v1 + v4, *(void (**)(void))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000079BC()
{
  uint64_t v1 = sub_10000BEB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100007A64(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10000BEB0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(uint64_t (**)(void, uint64_t))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_100006A48(a1, v1 + v4, v5);
}

void sub_100007B04()
{
  if (!qword_100016A38)
  {
    sub_1000084D8(255, (unint64_t *)&qword_100016A40);
    unint64_t v0 = sub_10000C360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016A38);
    }
  }
}

uint64_t sub_100007B7C()
{
  return swift_release();
}

uint64_t sub_100007B84()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007BD8()
{
  return swift_release();
}

uint64_t sub_100007BE0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100007C28(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10000C220();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100007C7C(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007C28(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100007CCC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100007D34(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v65 = a4;
  uint64_t v57 = a2;
  uint64_t v6 = sub_10000C180();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000BEB0();
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  long long v12 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v14 = (char *)v52 - v13;
  id v61 = [objc_allocWithZone((Class)NSDate) init];
  sub_10000BEA0();
  uint64_t v69 = &_swiftEmptyArrayStorage;
  sub_100005594(0, &qword_100016A00, &qword_100016A08);
  uint64_t v56 = v15;
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10000CB20;
  unint64_t v58 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10000C340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v16 + 56) = &type metadata for Int;
  *(void *)(v16 + 64) = &protocol witness table for Int;
  uint64_t v55 = v17;
  *(void *)(v16 + 32) = v17;
  uint64_t v18 = sub_100007BE0(&qword_100016A10, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v62 = v9;
  uint64_t v54 = v18;
  uint64_t v19 = sub_10000C370();
  uint64_t v21 = v20;
  *(void *)(v16 + 96) = &type metadata for String;
  unint64_t v53 = sub_100007510();
  *(void *)(v16 + 104) = v53;
  *(void *)(v16 + 72) = v19;
  *(void *)(v16 + 80) = v21;
  v52[1] = sub_1000084D8(0, &qword_100016A20);
  uint64_t v22 = (void *)sub_10000C2C0();
  sub_10000C260();
  sub_10000C0A0();
  swift_bridgeObjectRelease();

  uint64_t v23 = (void *)(a3 + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_tabiScoringService);
  uint64_t v24 = a3;
  sub_100005684((void *)(a3 + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_tabiScoringService), *(void *)(a3 + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_tabiScoringService + 24));
  sub_10000BE90();
  sub_10000C040();
  swift_bridgeObjectRelease();
  objc_super v25 = sub_100006F5C(0, 1, 1, &_swiftEmptyArrayStorage);
  uint64_t v69 = v25;
  unint64_t v27 = v25[2];
  unint64_t v26 = v25[3];
  if (v27 >= v26 >> 1) {
    uint64_t v69 = sub_100006F5C((void *)(v26 > 1), v27 + 1, 1, v25);
  }
  uint64_t v28 = v67;
  uint64_t v29 = (uint64_t)v68;
  uint64_t v30 = sub_100007564((uint64_t)&v66, v67);
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v33 + 16))(v32);
  sub_1000070B4(v27, (uint64_t)v32, (uint64_t *)&v69, v28, v29);
  sub_1000056C8((uint64_t)&v66);
  uint64_t v63 = v24;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v34 = sub_10000C0B0();
  swift_allocObject();
  uint64_t v35 = sub_10000C0C0();
  v36 = v69;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v36 = sub_100006F5C(0, v36[2] + 1, 1, v36);
  }
  uint64_t v37 = v62;
  unint64_t v39 = v36[2];
  unint64_t v38 = v36[3];
  if (v39 >= v38 >> 1) {
    v36 = sub_100006F5C((void *)(v38 > 1), v39 + 1, 1, v36);
  }
  uint64_t v67 = v34;
  uint64_t v68 = &protocol witness table for InterestToken;
  *(void *)&long long v66 = v35;
  v36[2] = v39 + 1;
  sub_1000075F4(&v66, (uint64_t)&v36[5 * v39 + 4]);
  uint64_t v69 = v36;
  sub_100005684(v23, v23[3]);
  sub_10000C2B0();
  sub_10000BEA0();
  uint64_t v40 = sub_10000C050();
  v41 = *(void (**)(char *, uint64_t))(v64 + 8);
  v41(v12, v37);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v8, v60);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_10000CB70;
  *(void *)(v42 + 56) = &type metadata for Int;
  *(void *)(v42 + 64) = &protocol witness table for Int;
  *(void *)(v42 + 32) = v55;
  uint64_t v43 = *(void *)(v40 + 16);
  *(void *)(v42 + 96) = &type metadata for Int;
  *(void *)(v42 + 104) = &protocol witness table for Int;
  *(void *)(v42 + 72) = v43;
  id v44 = v61;
  id v45 = objc_msgSend(v61, "fc_millisecondTimeIntervalUntilNow");
  *(void *)(v42 + 136) = &type metadata for UInt64;
  *(void *)(v42 + 144) = &protocol witness table for UInt64;
  *(void *)(v42 + 112) = v45;
  uint64_t v46 = sub_10000C370();
  unint64_t v47 = v53;
  *(void *)(v42 + 176) = &type metadata for String;
  *(void *)(v42 + 184) = v47;
  *(void *)(v42 + 152) = v46;
  *(void *)(v42 + 160) = v48;
  v49 = (void *)sub_10000C2C0();
  sub_10000C260();
  sub_10000C0A0();
  swift_bridgeObjectRelease();

  sub_100006168((uint64_t)v14, (uint64_t)v69);
  swift_bridgeObjectRelease();
  sub_10000679C(v40);
  swift_bridgeObjectRelease();
  sub_1000084D8(0, (unint64_t *)&qword_100016A40);
  Class isa = sub_10000C190().super.isa;
  (*(void (**)(uint64_t, Class, void))(v65 + 16))(v65, isa, 0);

  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v41)(v14, v37);
}

unint64_t sub_100008480()
{
  unint64_t result = qword_100016A78;
  if (!qword_100016A78)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100016A78);
  }
  return result;
}

uint64_t sub_1000084D8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100008514(void *a1)
{
  sub_100005684(a1, a1[3]);
  sub_10000C080();
  uint64_t result = sub_10000BED0();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v3 = (void *)result;
  sub_100005684(a1, a1[3]);
  sub_1000055EC(0, &qword_100016CD8);
  uint64_t result = sub_10000BEE0();
  if (!v8)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005684(a1, a1[3]);
  type metadata accessor for DropboxBundleSubscriptionManager();
  uint64_t result = sub_10000BED0();
  if (result)
  {
    unint64_t v4 = (void *)result;
    id v5 = objc_allocWithZone((Class)type metadata accessor for ScoringEngine());
    id v6 = sub_10000714C(v3, (uint64_t)v7, v4);

    return (uint64_t)v6;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100008634()
{
  uint64_t v0 = sub_10000C0D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000C0E0();
  __chkstk_darwin(v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for WorkServiceSettings.PerformanceOptimizationPolicy.memoryAggressive(_:));
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for WorkServiceSettings.StorageMode.readOnly(_:), v0);
  return sub_10000C0F0();
}

uint64_t sub_1000087B0(void *a1)
{
  sub_100005684(a1, a1[3]);
  type metadata accessor for DropboxBundleSubscriptionManager();
  uint64_t result = sub_10000BED0();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100008804@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005684(a1, a1[3]);
  uint64_t v3 = type metadata accessor for DropboxBundleSubscriptionManager();
  uint64_t result = sub_10000BED0();
  if (result)
  {
    uint64_t v5 = result;
    a2[3] = v3;
    uint64_t result = sub_10000A8F0(&qword_100016CD0, (void (*)(uint64_t))type metadata accessor for DropboxBundleSubscriptionManager);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000088AC()
{
  uint64_t v0 = sub_10000BDF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000BE50();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100016340 != -1) {
    swift_once();
  }
  sub_10000A800(v4, (uint64_t)qword_100016A90);
  v9[0] = 0xD000000000000012;
  v9[1] = 0x800000010000F770;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.isDirectory(_:), v0);
  sub_10000A89C();
  sub_10000BE30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  id v7 = objc_allocWithZone((Class)type metadata accessor for NoopUserEventHistoryStorage());
  return sub_100009C10((uint64_t)v6);
}

uint64_t sub_100008A84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NoopResourceService();
  uint64_t v3 = swift_allocObject();
  a1[3] = v2;
  uint64_t result = sub_10000A8F0(&qword_100016CC8, (void (*)(uint64_t))type metadata accessor for NoopResourceService);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_100008B08()
{
  uint64_t v0 = sub_10000BDF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100016340 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000BE50();
  sub_10000A800(v4, (uint64_t)qword_100016A90);
  v6[0] = 0xD000000000000019;
  v6[1] = 0x800000010000F750;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.notDirectory(_:), v0);
  sub_10000A89C();
  sub_10000BE40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100008C88@<X0>(uint64_t a1@<X8>)
{
  if (qword_100016340 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000BE50();
  uint64_t v3 = sub_10000A800(v2, (uint64_t)qword_100016A90);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100008D30(void *a1)
{
  sub_100005684(a1, a1[3]);
  sub_1000084D8(0, &qword_100016C98);
  uint64_t result = sub_10000BED0();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100008D94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005684(a1, a1[3]);
  sub_10000A7AC(0, &qword_100016C80);
  uint64_t result = sub_10000BED0();
  if (result)
  {
    uint64_t v4 = (objc_class *)sub_10000C020();
    id v5 = objc_allocWithZone(v4);
    uint64_t result = sub_10000C010();
    a2[3] = (uint64_t)v4;
    a2[4] = (uint64_t)&protocol witness table for NewsAppConfigurationManager;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100008E38()
{
  uint64_t v0 = sub_10000BF60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DropboxBundleSubscriptionManager();
  sub_10000BF40();
  uint64_t v4 = enum case for Scope.singleton(_:);
  id v5 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v5(v3, enum case for Scope.singleton(_:), v0);
  sub_10000BEC0();
  swift_release();
  swift_release();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  sub_1000084D8(0, &qword_100016C90);
  sub_10000BF40();
  v5(v3, v4, v0);
  sub_10000BEC0();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_1000084D8(0, &qword_100016C98);
  sub_10000BF40();
  v5(v3, v4, v0);
  sub_10000BEC0();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v6)(v3, v0);
}

id sub_100009094(void *a1)
{
  sub_100005684(a1, a1[3]);
  sub_1000084D8(0, &qword_100016C90);
  id result = (id)sub_10000BED0();
  if (result)
  {
    id v2 = result;
    uint64_t v3 = (objc_class *)type metadata accessor for DropboxBundleSubscriptionManager();
    uint64_t v4 = (char *)objc_allocWithZone(v3);
    uint64_t v5 = OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_lazyDropboxData;
    sub_10000A6DC();
    uint64_t v6 = swift_allocObject();
    *(_DWORD *)(v6 + 24) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)&v4[v5] = v6;
    *(void *)&v4[OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_entitlementsOverrideProvider] = 0;
    *(void *)&v4[OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_todayDropbox] = v2;
    v7.receiver = v4;
    v7.super_class = v3;
    return objc_msgSendSuper2(&v7, "init");
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100009170()
{
  uint64_t v0 = sub_10000BE50();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A678(0, &qword_100016CA0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v15 - v5;
  id v7 = (id)FCURLForTodayDropbox();
  if (v7)
  {
    uint64_t v8 = v7;
    sub_10000BE20();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
    if (result != 1)
    {
      id v10 = objc_allocWithZone((Class)FCFileCoordinatedTodayDropbox);
      sub_10000BE00(v11);
      uint64_t v13 = v12;
      id v14 = [v10 initWithFileURL:v12];

      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      return (uint64_t)v14;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009388()
{
  uint64_t v0 = sub_10000BE50();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A678(0, &qword_100016CA0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v18 - v5;
  id v7 = (id)FCURLForAppConfigurationMirror();
  if (v7)
  {
    uint64_t v8 = v7;
    sub_10000BE20();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
    if (result != 1)
    {
      id v10 = [self sharedAccount];
      id v11 = [v10 supportedContentStoreFrontID];

      sub_10000C1C0();
      id v12 = objc_allocWithZone((Class)FCFileCoordinatedAppConfigurationManager);
      sub_10000BE00(v13);
      uint64_t v15 = v14;
      NSString v16 = sub_10000C1B0();
      swift_bridgeObjectRelease();
      id v17 = [v12 initWithFileURL:v15 storefrontID:v16];

      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      return (uint64_t)v17;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000961C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Assembly()
{
  return self;
}

uint64_t sub_100009654()
{
  uint64_t v0 = sub_10000BE50();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A838(v2, qword_100016A90);
  sub_10000A800(v0, (uint64_t)qword_100016A90);
  id v5 = [self newsdCachesURL];
  sub_10000BE20();

  sub_10000BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_10000976C()
{
  return 1;
}

Swift::Int sub_100009774()
{
  return sub_10000C410();
}

void sub_1000097B8()
{
}

Swift::Int sub_1000097E0()
{
  return sub_10000C410();
}

uint64_t type metadata accessor for NoopResourceService()
{
  return self;
}

uint64_t sub_100009854()
{
  return sub_10000BFA0();
}

id sub_100009C10(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_sessionIDs] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_sessions] = 0;
  id v5 = &v2[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_earliestSessionDate];
  uint64_t v6 = sub_10000BE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(void *)&v2[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_size] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_prunedSessionIDs] = &_swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_prunedSessionSize] = 0;
  uint64_t v7 = OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_metadata;
  uint64_t v8 = self;
  uint64_t v9 = v2;
  *(void *)&v2[v7] = [v8 emptyWithSessionsOnDiskSize:0 personalizationAnalyticsEnabled:0];
  id v10 = &v9[OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_baseDirectoryURL];
  uint64_t v11 = sub_10000BE50();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, a1, v11);

  v15.receiver = v9;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, "init");
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v13;
}

uint64_t sub_100009F68()
{
  return type metadata accessor for NoopUserEventHistoryStorage();
}

uint64_t type metadata accessor for NoopUserEventHistoryStorage()
{
  uint64_t result = qword_100016C40;
  if (!qword_100016C40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100009FBC()
{
  sub_10000A678(319, &qword_100016C50, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F)
  {
    sub_10000BE50();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_10000A0E8()
{
  uint64_t v0 = sub_10000BF60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BF10();
  type metadata accessor for ScoringEngine();
  sub_10000BF40();
  swift_release();
  swift_release();
  sub_10000BF10();
  sub_10000C100();
  sub_10000BF50();
  swift_release();
  swift_release();
  sub_10000BF10();
  sub_10000A7AC(0, &qword_100016C58);
  sub_10000BF40();
  swift_release();
  swift_release();
  sub_10000BF10();
  sub_10000A7AC(0, &qword_100016C60);
  sub_10000BF40();
  swift_release();
  swift_release();
  sub_10000BF10();
  sub_1000055EC(0, &qword_100016C68);
  sub_10000BF50();
  swift_release();
  swift_release();
  sub_10000BF10();
  sub_10000A7AC(0, &qword_100016C70);
  sub_10000BF40();
  swift_release();
  uint64_t v4 = enum case for Scope.singleton(_:);
  id v5 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v5(v3, enum case for Scope.singleton(_:), v0);
  sub_10000BEC0();
  swift_release();
  swift_release();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  v8[1] = v1 + 8;
  sub_10000BF10();
  sub_1000055EC(0, &qword_100016C78);
  sub_10000BF50();
  swift_release();
  v5(v3, v4, v0);
  sub_10000BEC0();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_10000BF10();
  sub_10000BE50();
  sub_10000C1D0();
  sub_10000BF50();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000BF10();
  sub_10000C1E0();
  sub_10000BF50();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000BF10();
  sub_10000A7AC(0, &qword_100016C80);
  sub_10000BF40();
  swift_release();
  swift_release();
  sub_10000BF10();
  sub_1000055EC(0, &qword_100016C88);
  sub_10000BF50();
  swift_release();
  v5(v3, v4, v0);
  sub_10000BEC0();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_10000BF20();
  sub_10000BF30();
  return swift_release();
}

void sub_10000A678(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_10000A6DC()
{
  if (!qword_100016CA8)
  {
    sub_10000A744();
    type metadata accessor for os_unfair_lock_s();
    unint64_t v0 = sub_10000C300();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016CA8);
    }
  }
}

void sub_10000A744()
{
  if (!qword_100016CB0)
  {
    sub_10000A7AC(255, &qword_100016CB8);
    unint64_t v0 = sub_10000C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016CB0);
    }
  }
}

uint64_t sub_10000A7AC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000A800(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000A838(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10000A89C()
{
  unint64_t result = qword_100016CC0;
  if (!qword_100016CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016CC0);
  }
  return result;
}

uint64_t sub_10000A8F0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000A938()
{
  unint64_t result = qword_100016CE0;
  if (!qword_100016CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016CE0);
  }
  return result;
}

void sub_10000A98C()
{
  if (!qword_100016CF0)
  {
    sub_1000084D8(255, &qword_100016CF8);
    unint64_t v0 = sub_10000C1A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016CF0);
    }
  }
}

uint64_t sub_10000AA04(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000AA5C(uint64_t a1, uint64_t a2)
{
  sub_10000A678(0, &qword_100016C50, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AAF0(uint64_t a1)
{
  sub_10000A678(0, &qword_100016C50, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for NoopResourceService.Errors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NoopResourceService.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000AC70);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000AC98()
{
  return 0;
}

ValueMetadata *type metadata accessor for NoopResourceService.Errors()
{
  return &type metadata for NoopResourceService.Errors;
}

unint64_t sub_10000ACB4()
{
  unint64_t result = qword_100016D08;
  if (!qword_100016D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016D08);
  }
  return result;
}

id sub_10000ADE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScoringServiceListenerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ScoringServiceListenerDelegate()
{
  return self;
}

uint64_t sub_10000AE48()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void *)(result + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_lazyDropboxData);
    swift_retain();

    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
    sub_10000AEEC((void *)(v2 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
    return swift_release();
  }
  return result;
}

uint64_t sub_10000AEEC(void *a1)
{
  uint64_t result = swift_unknownObjectRelease();
  *a1 = 0;
  return result;
}

uint64_t sub_10000AF20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    uint64_t v6 = 0;
    *a3 = v5;
LABEL_6:
    swift_unknownObjectRetain();
    return sub_10000BDB4((uint64_t)v6);
  }
  uint64_t v7 = *(void **)(a2 + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_todayDropbox);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10000BD24;
  *(void *)(v9 + 24) = v8;
  v12[4] = sub_10000BD74;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000B0DC;
  v12[3] = &unk_100010BE8;
  id v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v7 peekSyncWithAccessor:v10];
  _Block_release(v10);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v7)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = *a1;
    if (*a1)
    {
      *a3 = result;
      swift_unknownObjectRetain();
      uint64_t v6 = sub_10000BD24;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B0DC(uint64_t a1, uint64_t a2)
{
  int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_10000B174()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_lazyDropboxData);
  uint64_t v2 = (uint64_t *)&v1[4];
  int v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_10000BC0C(v2, (uint64_t *)&v8);
  os_unfair_lock_unlock(v3);
  id v4 = [v8 bundleSubscription];
  swift_unknownObjectRelease();
  if (v4) {
    return v4;
  }
  Class isa = sub_10000C200().super.isa;
  id v7 = sub_10000BC28(isa);

  return v7;
}

uint64_t sub_10000B718()
{
  uint64_t v0 = (char *)sub_10000B174();
  if (objc_getAssociatedObject(v0, v0 + 1))
  {
    sub_10000C2E0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_10000BAB0((uint64_t)&v8, (uint64_t)v10);
  if (!v11)
  {
    sub_10000BB70((uint64_t)v10);
    goto LABEL_9;
  }
  sub_10000BBCC();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    uint64_t v1 = 0;
    unint64_t v2 = 0;
    goto LABEL_10;
  }
  uint64_t v1 = v7;
  unint64_t v2 = (unint64_t)[v7 integerValue];
  if (v2 == -1) {
    goto LABEL_17;
  }
LABEL_10:
  if (objc_getAssociatedObject(v0, (const void *)~v2))
  {
    sub_10000C2E0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_10000BAB0((uint64_t)&v8, (uint64_t)v10);
  if (!v11)
  {
    sub_10000BB70((uint64_t)v10);
    goto LABEL_17;
  }
  sub_10000BBCC();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_17:

    int v5 = -136;
    return (v5 ^ v2) & 1;
  }
  id v3 = v7;
  unsigned int v4 = [v3 integerValue];

  int v5 = v4 - 136;
  return (v5 ^ v2) & 1;
}

uint64_t sub_10000B924()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_lazyDropboxData);
  unint64_t v2 = (uint64_t *)&v1[4];
  id v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_10000BDC8(v2, (uint64_t *)&v7);
  os_unfair_lock_unlock(v3);
  id v4 = [v7 purchasedTagIDs];
  swift_unknownObjectRelease();
  uint64_t v5 = sub_10000C250();

  return v5;
}

uint64_t type metadata accessor for DropboxBundleSubscriptionManager()
{
  return self;
}

uint64_t sub_10000BA88()
{
  return sub_10000B718() & 1;
}

uint64_t sub_10000BAB0(uint64_t a1, uint64_t a2)
{
  sub_10000BB14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000BB14()
{
  if (!qword_100016DE0)
  {
    unint64_t v0 = sub_10000C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016DE0);
    }
  }
}

uint64_t sub_10000BB70(uint64_t a1)
{
  sub_10000BB14();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000BBCC()
{
  unint64_t result = qword_100016A40;
  if (!qword_100016A40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100016A40);
  }
  return result;
}

uint64_t sub_10000BC0C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000AF20(a1, *(void *)(v2 + 16), a2);
}

id sub_10000BC28(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[FCBundleSubscription subscriptionWithSubscriptionState:3 bundleChannelIDs:v1];
  id v3 = (id)v2;
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:v2 + 1];
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:~v2];
  objc_setAssociatedObject(v3, (const void *)(v2 + 1), v4, (void *)1);
  objc_setAssociatedObject(v3, (const void *)(-2 - v2), v5, (void *)1);

  return v3;
}

uint64_t sub_10000BD14()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BD24(uint64_t a1)
{
  **(void **)(v1 + 16) = a1;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_10000BD64()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BD74()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000BD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BDAC()
{
  return swift_release();
}

uint64_t sub_10000BDB4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000BDC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000BC0C(a1, a2);
}

uint64_t sub_10000BDE0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000BDF0()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_10000BE00(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000BE10()
{
  return URL.resolvingSymlinksInPath()();
}

uint64_t sub_10000BE20()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000BE30()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10000BE40()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_10000BE50()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000BE60()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_10000BE70()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10000BE80()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000BE90()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10000BEA0()
{
  return UUID.init()();
}

uint64_t sub_10000BEB0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000BEC0()
{
  return Definition.inScope(_:)();
}

uint64_t sub_10000BED0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_10000BEE0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_10000BEF0()
{
  return SingletonPool.init()();
}

uint64_t sub_10000BF00()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_10000BF10()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_10000BF20()
{
  return ProxyContainer.private.getter();
}

uint64_t sub_10000BF30()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t sub_10000BF40()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_10000BF50()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_10000BF60()
{
  return type metadata accessor for Scope();
}

uint64_t sub_10000BF70()
{
  return zalgo.getter();
}

uint64_t sub_10000BF80()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_10000BF90()
{
  return Promise.error(on:closure:)();
}

uint64_t sub_10000BFA0()
{
  return Promise.init(error:)();
}

uint64_t sub_10000BFB0()
{
  return Promise.always<A>(on:disposeOn:closure:)();
}

uint64_t sub_10000BFC0()
{
  return firstly<A>(closure:)();
}

uint64_t sub_10000BFD0()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_10000BFE0()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t sub_10000BFF0()
{
  return Container.resolver.getter();
}

uint64_t sub_10000C000()
{
  return type metadata accessor for Container();
}

uint64_t sub_10000C010()
{
  return NewsAppConfigurationManager.init(appConfigurationManager:transform:)();
}

uint64_t sub_10000C020()
{
  return type metadata accessor for NewsAppConfigurationManager();
}

uint64_t sub_10000C030()
{
  return type metadata accessor for NewsAppPersonalizationAssembly();
}

uint64_t sub_10000C040()
{
  return dispatch thunk of TabiScoringServiceType.addInterest(id:)();
}

uint64_t sub_10000C050()
{
  return dispatch thunk of TabiScoringServiceType.score(items:context:shadowMode:identifiedBy:)();
}

uint64_t sub_10000C060()
{
  return dispatch thunk of NotificationScoringServiceType.addInterest(id:)();
}

uint64_t sub_10000C070()
{
  return dispatch thunk of NotificationScoringServiceType.score(items:identifiedBy:)();
}

uint64_t sub_10000C080()
{
  return type metadata accessor for TabiUserEventHistoryScoringService();
}

uint64_t sub_10000C090()
{
  return type metadata accessor for Assembly();
}

uint64_t sub_10000C0A0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_10000C0B0()
{
  return type metadata accessor for InterestToken();
}

uint64_t sub_10000C0C0()
{
  return InterestToken.init(_:)();
}

uint64_t sub_10000C0D0()
{
  return type metadata accessor for WorkServiceSettings.StorageMode();
}

uint64_t sub_10000C0E0()
{
  return type metadata accessor for WorkServiceSettings.PerformanceOptimizationPolicy();
}

uint64_t sub_10000C0F0()
{
  return WorkServiceSettings.init(performanceOptimizationPolicy:storageMode:)();
}

uint64_t sub_10000C100()
{
  return type metadata accessor for WorkServiceSettings();
}

uint64_t sub_10000C110()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000C120()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000C130()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_10000C140()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10000C150()
{
  return static DispatchTime.now()();
}

uint64_t sub_10000C160()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10000C170()
{
  return + infix(_:_:)();
}

uint64_t sub_10000C180()
{
  return type metadata accessor for FeedScoringContext();
}

NSDictionary sub_10000C190()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000C1A0()
{
  return type metadata accessor for Dictionary();
}

NSString sub_10000C1B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000C1C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000C1D0()
{
  return static String.scoringContextURL.getter();
}

uint64_t sub_10000C1E0()
{
  return static String.userEmbeddingManagerDirectory.getter();
}

uint64_t sub_10000C1F0()
{
  return String.hash(into:)();
}

NSArray sub_10000C200()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000C210()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000C220()
{
  return type metadata accessor for Array();
}

NSNumber sub_10000C230()
{
  return Double._bridgeToObjectiveC()();
}

NSSet sub_10000C240()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10000C250()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000C260()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000C270()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10000C280()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10000C290()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10000C2A0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10000C2B0()
{
  return FCFeedPersonalizationConfigurationSet.context.getter();
}

uint64_t sub_10000C2C0()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_10000C2D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10000C2E0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000C2F0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10000C300()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t sub_10000C310()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000C320()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000C330()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10000C340()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000C350()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000C360()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t sub_10000C370()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000C380()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_10000C390()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000C3A0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_10000C3B0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000C3C0()
{
  return Error._code.getter();
}

uint64_t sub_10000C3D0()
{
  return Error._domain.getter();
}

uint64_t sub_10000C3E0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000C3F0()
{
  return Hasher.init(_seed:)();
}

void sub_10000C400(Swift::UInt a1)
{
}

Swift::Int sub_10000C410()
{
  return Hasher._finalize()();
}

uint64_t FCURLForAppConfigurationMirror()
{
  return _FCURLForAppConfigurationMirror();
}

uint64_t FCURLForTodayDropbox()
{
  return _FCURLForTodayDropbox();
}

uint64_t NDScoringServiceXPCInterface()
{
  return _NDScoringServiceXPCInterface();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_subscriptionWithSubscriptionState_bundleChannelIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionWithSubscriptionState:bundleChannelIDs:");
}