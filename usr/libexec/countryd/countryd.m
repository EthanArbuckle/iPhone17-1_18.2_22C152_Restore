BOOL sub_100002758()
{
  BOOL v0;
  void *v4;
  BOOL v5;

  if (&class metadata base offset for LSKLocalStatusClient) {
    v0 = &type metadata accessor for LSKLocalStatusClient == 0;
  }
  else {
    v0 = 1;
  }
  if (v0
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    sub_10000F510();
    sub_10000A970(0, &qword_100019190);
    v4 = (void *)sub_10000F530();
    sub_10000F420();
  }
  if (&metaclass for LSKLocalStatusClient) {
    v5 = &nominal type descriptor for LSKLocalStatusClient == 0;
  }
  else {
    v5 = 1;
  }
  return !v5
      && &type metadata for LSKLocalStatusClient != 0
      && &type metadata accessor for LSKLocalStatusClient != 0
      && &class metadata base offset for LSKLocalStatusClient != 0;
}

id sub_100002928()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RDSharerAvailability();
  return [super init];
}

uint64_t type metadata accessor for RDSharerAvailability()
{
  return self;
}

id sub_1000029C0(uint64_t a1)
{
  return sub_100007E54(a1, type metadata accessor for RDSharerAvailability);
}

id sub_1000029D8(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_37:
    swift_bridgeObjectRelease();
    return &_swiftEmptyDictionarySingleton;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_10000F5B0();
  if (!v2) {
    goto LABEL_37;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v3 = (id)sub_10000F580();
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_41;
    }
    id v3 = *(id *)(a1 + 32);
  }
  v4 = v3;
  swift_bridgeObjectRelease();
  id v67 = v4;
  id v5 = [v4 countryCode];
  if (v5)
  {
    v6 = v5;
    unint64_t v7 = sub_10000F430();
    unint64_t v9 = v8;

    uint64_t v10 = sub_100003168(v7, v9);
    uint64_t v12 = v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id __src = &_swiftEmptyDictionarySingleton;
    sub_100009348(v10, v12, 0xD000000000000032, 0x8000000100010980, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (v2 < 1) {
LABEL_41:
  }
    __break(1u);
  id v68 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  v15 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v17 = (id)sub_10000F580();
    }
    else {
      id v17 = *(id *)(a1 + 8 * v14 + 32);
    }
    v18 = v17;
    id v19 = [v17 countryCode];
    if (v19)
    {
      v20 = v19;
      uint64_t v21 = sub_10000F430();
      uint64_t v23 = v22;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v15 = sub_100008460(0, *((void *)v15 + 2) + 1, 1, v15);
      }
      unint64_t v25 = *((void *)v15 + 2);
      unint64_t v24 = *((void *)v15 + 3);
      if (v25 >= v24 >> 1) {
        v15 = sub_100008460((char *)(v24 > 1), v25 + 1, 1, v15);
      }
      *((void *)v15 + 2) = v25 + 1;
      v16 = &v15[16 * v25];
      *((void *)v16 + 4) = v21;
      *((void *)v16 + 5) = v23;
    }
    ++v14;
  }
  while (v2 != v14);
  swift_bridgeObjectRelease();
  v26 = self;
  v27 = (void *)sub_10000F4A0();
  swift_bridgeObjectRelease();
  id __src = 0;
  id v28 = [v26 dataWithJSONObject:v27 options:0 error:&__src];

  id v29 = __src;
  if (v28)
  {
    uint64_t v30 = sub_10000F300();
    unint64_t v32 = v31;

    sub_100009CE8(v30, v32);
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    id __src = v68;
    sub_100009348(v30, v32, 0xD000000000000033, 0x8000000100010940, v33);
    id v68 = __src;
    swift_bridgeObjectRelease();
    sub_100009D40(v30, v32);
  }
  else
  {
    v34 = v29;
    sub_10000F2B0();

    swift_willThrow();
    swift_errorRelease();
  }
  uint64_t v35 = sub_10000F360();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(void *)(v36 + 64);
  __chkstk_darwin(v35);
  unint64_t v38 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  v39 = (char *)&v66 - v38;
  id v40 = [v67 timestamp];
  uint64_t v41 = sub_100007F04(&qword_100019198);
  uint64_t v42 = __chkstk_darwin(v41 - 8);
  v44 = (char *)&v66 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v40)
  {
    __chkstk_darwin(v42);
    v45 = (char *)&v66 - v38;
    sub_10000F330();

    v46 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    v46(v44, v45, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v44, 0, 1, v35);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v44, 1, v35) != 1)
    {
      v46(v39, v44, v35);
      sub_10000F310();
      id __src = v47;
      uint64_t v48 = sub_10000992C(&__src, &v73);
      uint64_t v50 = v49 & 0xFFFFFFFFFFFFFFLL;
      id v51 = v68;
      char v52 = swift_isUniquelyReferenced_nonNull_native();
      v69 = v51;
      sub_100009348(v48, v50, 0xD000000000000030, 0x8000000100010900, v52);
      id v68 = v69;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
      goto LABEL_28;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v44, 1, 1, v35);
  }
  sub_10000AB54((uint64_t)v44, &qword_100019198);
LABEL_28:
  LODWORD(v69) = 0;
  int v53 = kRDPrioritySingleLocation;
  id v54 = v67;
  if ([v67 priorityIsAtLeast:kRDPrioritySingleLocation]
    || (int v53 = kRDPriorityNearbyCellsMCC, [v54 priorityIsAtLeast:kRDPriorityNearbyCellsMCC])|| (int v53 = kRDPriorityServingCellMCC, objc_msgSend(v54, "priorityIsAtLeast:", kRDPriorityServingCellMCC))|| (int v53 = kRDPriorityWiFiAP, objc_msgSend(v54, "priorityIsAtLeast:", kRDPriorityWiFiAP)))
  {
    LODWORD(v69) = v53;
  }
  uint64_t v55 = sub_10000992C(&v69, (unsigned char *)&v69 + 4);
  uint64_t v57 = v56 & 0xFFFFFFFFFFFFFFLL;
  v58 = v68;
  char v59 = swift_isUniquelyReferenced_nonNull_native();
  id __src = v58;
  sub_100009348(v55, v57, 0xD00000000000002FLL, 0x8000000100010890, v59);
  id v60 = __src;
  swift_bridgeObjectRelease();
  if ([v54 isInDisputedArea])
  {
    unsigned __int8 v70 = [v54 isInDisputedArea];
    uint64_t v61 = sub_10000992C(&v70, v71);
    uint64_t v63 = v62 & 0xFFFFFFFFFFFFFFLL;
    char v64 = swift_isUniquelyReferenced_nonNull_native();
    id __src = v60;
    sub_100009348(v61, v63, 0xD000000000000031, 0x80000001000108C0, v64);
    id v60 = __src;

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return v60;
}

uint64_t sub_100003168(unint64_t a1, unint64_t a2)
{
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  sub_100007F04(&qword_100019380);
  if (swift_dynamicCast())
  {
    sub_10000AC30(v38, (uint64_t)&v41);
    sub_10000AC48(&v41, v43);
    sub_10000F290();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    sub_10000AC8C((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_10000AB54((uint64_t)v38, &qword_100019388);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      unint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_10000F590();
      }
      if (v4) {
        v6 = (unsigned char *)(v4 + v5);
      }
      else {
        v6 = 0;
      }
      unint64_t v7 = (uint64_t *)v4;
    }
    unint64_t v8 = sub_100009AF0(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = sub_10000F450();
    goto LABEL_17;
  }
LABEL_69:
  unint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_100009B54(v11);
  *((void *)&v38[0] + 1) = v12;
  __chkstk_darwin(*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_100008C44((void *(*)(uint64_t *__return_ptr, char *, char *))sub_10000ABB0);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_10000F2E0();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_100008A78(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_10000F480();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_10000F590();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_100008A78(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_10000F460();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_10000F2F0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  unint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_10000F2F0();
    sub_10000AC1C(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_10000AC1C((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_100003698()
{
  return 0;
}

uint64_t sub_1000036A0()
{
  return swift_retain();
}

uint64_t sub_1000036EC(uint64_t a1)
{
  unint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_100003740())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000379C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000F3F0();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_100003808@<X0>(uint64_t a1@<X8>)
{
  return sub_1000038AC(&OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_1000191A8, a1);
}

uint64_t sub_10000381C(uint64_t a1)
{
  return sub_100003920(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_1000191A8);
}

uint64_t (*sub_100003830())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000388C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000039F0(&qword_1000191B0, a1);
}

uint64_t sub_100003898@<X0>(uint64_t a1@<X8>)
{
  return sub_1000038AC(&OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_1000191B8, a1);
}

uint64_t sub_1000038AC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  return sub_10000A1B0(v6, a3, a2);
}

uint64_t sub_10000390C(uint64_t a1)
{
  return sub_100003920(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_1000191B8);
}

uint64_t sub_100003920(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  sub_100009D98(a1, v6, a3);
  return swift_endAccess();
}

uint64_t (*sub_100003988())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1000039E4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000039F0(&qword_1000191C0, a1);
}

uint64_t sub_1000039F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_100007F04(a1);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);

  return v4(a2, 1, 1, v3);
}

uint64_t sub_100003A58@<X0>(uint64_t a1@<X8>)
{
  return sub_1000038AC(&OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_1000191C8, a1);
}

uint64_t sub_100003A6C(uint64_t a1)
{
  return sub_100003920(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_1000191C8);
}

uint64_t (*sub_100003A80())()
{
  return j__swift_endAccess;
}

id sub_100003AE0()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_100003B14()
{
  *(void *)&v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient] = 0;
  id v1 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_options];
  uint64_t v2 = sub_10000F3F0();
  uint64_t v50 = *(uint64_t **)(*(void *)(v2 - 8) + 56);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v50)(v1, 1, 1, v2);
  uint64_t v3 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey];
  uint64_t v4 = sub_100007F04(&qword_1000191B0);
  uint64_t v5 = *(void *)(v4 - 8);
  char v52 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 56);
  uint64_t v53 = v4;
  uint64_t v51 = v5 + 56;
  v52(v3, 1, 1);
  uint64_t v6 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey];
  uint64_t v7 = sub_100007F04(&qword_1000191C0);
  uint64_t v8 = *(void *)(v7 - 8);
  unint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  uint64_t v10 = v8 + 56;
  v9(v6, 1, 1, v7);
  v54.receiver = v0;
  v54.super_class = (Class)type metadata accessor for RDStatusSharer();
  id v11 = [super init];
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v12 = &type metadata accessor for LSKLocalStatusClient == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12
    && &type metadata for LSKLocalStatusClient != 0
    && &nominal type descriptor for LSKLocalStatusClient != 0
    && &metaclass for LSKLocalStatusClient != 0)
  {
    sub_10000F3B0();
    swift_allocObject();
    v45 = (char *)v11;
    uint64_t v16 = sub_10000F3A0();
    uint64_t v17 = (uint64_t *)&v45[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient];
    swift_beginAccess();
    *uint64_t v17 = v16;
    swift_release();
    sub_100007F04(&qword_1000191A8);
    id v49 = v11;
    ((void (*)(void))__chkstk_darwin)();
    unint64_t v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10000F3D0();
    ((void (*)(void))__chkstk_darwin)();
    uint64_t v48 = v9;
    (*(void (**)(char *, void))(v21 + 104))((char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for LSKStatusOptions.Scope.sameAccount(_:));
    sub_100007F04(&qword_1000191D0);
    uint64_t v47 = v10;
    uint64_t v22 = sub_10000F3C0();
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v46 = v7;
    uint64_t v24 = v23;
    unint64_t v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_100010770;
    (*(void (**)(unint64_t, void, uint64_t))(v24 + 104))(v26 + v25, enum case for LSKStatusOptions.DeviceType.n301(_:), v22);
    sub_10000F3E0();
    ((void (*)(char *, void, uint64_t, uint64_t))v50)(v19, 0, 1, v2);
    uint64_t v27 = v45;
    uint64_t v28 = (uint64_t)&v45[OBJC_IVAR____TtC8countryd14RDStatusSharer_options];
    swift_beginAccess();
    sub_100009D98((uint64_t)v19, v28, &qword_1000191A8);
    swift_endAccess();
    sub_100007F04(&qword_1000191B8);
    uint64_t v50 = &v43;
    ((void (*)(void))__chkstk_darwin)();
    unint64_t v30 = (char *)&v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = sub_10000F410();
    uint64_t v43 = (uint64_t)&v43;
    uint64_t v32 = *(void *)(v31 - 8);
    uint64_t v33 = *(void *)(v32 + 64);
    __chkstk_darwin(v31);
    unint64_t v44 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v34 = enum case for LSKDomain.regulatory(_:);
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 104);
    v35((char *)&v43 - v44, enum case for LSKDomain.regulatory(_:), v31);
    sub_100007F04(&qword_1000191D8);
    sub_100009ED8(&qword_1000191E0, (void (*)(void))sub_100009E90);
    sub_100009ED8(&qword_1000191F0, (void (*)(void))sub_100009F54);
    sub_10000F400();
    ((void (*)(char *, void, uint64_t, uint64_t))v52)(v30, 0, 1, v53);
    uint64_t v36 = (uint64_t)v27 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey;
    swift_beginAccess();
    sub_100009D98((uint64_t)v30, v36, &qword_1000191B8);
    swift_endAccess();
    uint64_t v37 = sub_100007F04(&qword_1000191C8);
    uint64_t v38 = __chkstk_darwin(v37 - 8);
    long long v40 = (char *)&v43 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    __chkstk_darwin(v38);
    v35((char *)&v43 - v44, v34, v31);
    sub_100007F04(&qword_100019200);
    sub_100009F9C();
    sub_10000A048();
    id v11 = v49;
    sub_10000F400();

    v48(v40, 0, 1, v46);
    uint64_t v41 = (uint64_t)v27 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey;
    swift_beginAccess();
    sub_100009D98((uint64_t)v40, v41, &qword_1000191C8);
    swift_endAccess();
  }
  return v11;
}

uint64_t sub_1000042CC(uint64_t a1)
{
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = v1;
  return _swift_task_switch(sub_1000042EC, 0, 0);
}

uint64_t sub_1000042EC()
{
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v1 = &type metadata accessor for LSKLocalStatusClient == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    sub_10000F510();
    sub_10000A970(0, &qword_100019190);
    id v11 = (void *)sub_10000F530();
    sub_10000F420();

    goto LABEL_18;
  }
  uint64_t v5 = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 112)) + 0x70))();
  *(void *)(v0 + 120) = v5;
  if (!v5)
  {
LABEL_18:
    BOOL v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
  uint64_t v6 = *(void **)(v0 + 112);
  uint64_t v7 = sub_100007F04(&qword_1000191B0);
  *(void *)(v0 + 128) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v0 + 136) = v8;
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 144) = v9;
  sub_100007F04(&qword_1000191B8);
  uint64_t v10 = swift_task_alloc();
  (*(void (**)(void))((swift_isaMask & *v6) + 0xA0))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v7) == 1)
  {
    swift_release();
    sub_10000AB54(v10, &qword_1000191B8);
    swift_task_dealloc();
    swift_task_dealloc();
    goto LABEL_18;
  }
  unint64_t v14 = *(void **)(v0 + 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v9, v10, v7);
  swift_task_dealloc();
  uint64_t v33 = v9;
  uint64_t v15 = sub_10000F3F0();
  *(void *)(v0 + 152) = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  *(void *)(v0 + 160) = v16;
  uint64_t v32 = swift_task_alloc();
  *(void *)(v0 + 168) = v32;
  sub_100007F04(&qword_1000191A8);
  uint64_t v17 = swift_task_alloc();
  (*(void (**)(void))((swift_isaMask & *v14) + 0x88))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v15) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v33, v7);
    swift_release();
    sub_10000AB54(v17, &qword_1000191A8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    goto LABEL_18;
  }
  uint64_t v18 = *(void *)(v0 + 104);
  uint64_t v19 = v32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v32, v17, v15);
  swift_task_dealloc();
  uint64_t v20 = sub_100007F04(&qword_100019220);
  *(void *)(v0 + 176) = v20;
  *(void *)(v0 + 184) = *(void *)(*(void *)(v20 - 8) + 64);
  uint64_t v21 = swift_task_alloc();
  *(void *)(v0 + 192) = v21;
  if (v18)
  {
    uint64_t v22 = *(void **)(v0 + 104);
    sub_100007F04(&qword_100019288);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100010780;
    *(void *)(inited + 32) = v22;
    unint64_t v35 = inited;
    sub_10000F4C0();
    id v24 = v22;
    uint64_t v19 = v32;
    unint64_t v25 = (unint64_t)sub_1000029D8(v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v25 = sub_100005C0C((uint64_t)&_swiftEmptyArrayStorage);
  }
  *(void *)(v0 + 200) = v25;
  uint64_t v26 = *(int *)(v20 + 48);
  *(_DWORD *)(v0 + 328) = v26;
  uint64_t v27 = v21 + v26;
  *(void *)(v0 + 72) = v25;
  uint64_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v28;
  uint64_t v29 = sub_100007F04(&qword_1000191D8);
  uint64_t v30 = sub_100009ED8(&qword_1000191E0, (void (*)(void))sub_100009E90);
  uint64_t v31 = sub_100009ED8(&qword_1000191F0, (void (*)(void))sub_100009F54);
  sub_10000A0F4();
  *uint64_t v28 = v0;
  v28[1] = sub_100004920;
  return LSKLocalStatusClient.publish<A>(_:for:options:)(v21, v27, v0 + 72, v33, v19, v29, v30, v31);
}

uint64_t sub_100004920()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_100005B3C;
  }
  else {
    uint64_t v2 = sub_100004A50;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004A50()
{
  uint64_t v56 = v0;
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = v1 + *(int *)(v0 + 328);
  uint64_t v4 = sub_100007F04(&qword_100019238);
  *(void *)(v0 + 224) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v0 + 232) = v5;
  uint64_t v54 = swift_task_alloc();
  *(void *)(v0 + 240) = v54;
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = v6 + *(int *)(v2 + 48);
  uint64_t v8 = sub_100007F04(&qword_100019240);
  *(void *)(v0 + 248) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v0 + 256) = v9;
  uint64_t v53 = *(void (**)(void))(v9 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v53)(v6, v1, v8);
  sub_10000A1B0(v3, v7, &qword_100019248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 176);
    uint64_t v11 = *(void *)(v0 + 192) + *(int *)(v0 + 328);
    sub_10000AB54(v7, &qword_100019248);
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v51(v6, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v12 = sub_10000F520();
    uint64_t v13 = swift_task_alloc();
    uint64_t v14 = v13 + *(int *)(v10 + 48);
    v53();
    sub_10000A1B0(v11, v14, &qword_100019248);
    uint64_t v15 = swift_task_alloc();
    uint64_t v16 = v13;
    uint64_t v17 = v15;
    sub_10000A214(v16, v15);
    sub_10000A970(0, &qword_100019190);
    uint64_t v18 = sub_10000F530();
    BOOL v19 = os_log_type_enabled(v18, v12);
    uint64_t v52 = *(void *)(v0 + 192);
    if (v19)
    {
      log = v18;
      uint64_t v20 = *(void *)(v0 + 176);
      uint64_t v46 = *(void *)(v0 + 152);
      uint64_t v47 = *(void *)(v0 + 168);
      uint64_t v48 = *(void *)(v0 + 136);
      uint64_t v49 = *(void *)(v0 + 128);
      uint64_t v50 = *(void *)(v0 + 144);
      uint64_t v45 = *(void *)(v0 + 160);
      os_log_type_t type = v12;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v22 = swift_task_alloc();
      uint64_t v23 = *(int *)(v20 + 48);
      uint64_t v24 = v22 + v23;
      uint64_t v25 = v17 + v23;
      v53();
      sub_10000A1B0(v25, v24, &qword_100019248);
      uint64_t v26 = sub_10000F370();
      unint64_t v28 = v27;
      v51(v22, v8);
      sub_10000AB54(v24, &qword_100019248);
      swift_task_dealloc();
      *(void *)(v0 + 80) = sub_100008570(v26, v28, &v55);
      sub_10000F550();
      swift_bridgeObjectRelease();
      sub_10000AB54(v17, &qword_100019220);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Not scanning for deliveries? %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      sub_10000AB54(v52, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v46);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v50, v49);
      swift_task_dealloc();
      swift_task_dealloc();
    }
    else
    {
      uint64_t v36 = *(void *)(v0 + 160);
      uint64_t v35 = *(void *)(v0 + 168);
      uint64_t v38 = *(void *)(v0 + 144);
      uint64_t v37 = *(void *)(v0 + 152);
      uint64_t v39 = *(void *)(v0 + 128);
      uint64_t v40 = *(void *)(v0 + 136);

      swift_release();
      sub_10000AB54(v17, &qword_100019220);
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10000AB54(v52, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v54, v7, v4);
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    *(void *)(v0 + 264) = v29;
    *(void *)(v0 + 272) = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v29(v6, v8);
    swift_task_dealloc();
    uint64_t v30 = sub_100007F04(&qword_100019250);
    *(void *)(v0 + 280) = v30;
    *(void *)(v0 + 288) = *(void *)(v30 - 8);
    *(void *)(v0 + 296) = swift_task_alloc();
    sub_10000F380();
    sub_100007F04(&qword_100019258);
    *(void *)(v0 + 304) = swift_task_alloc();
    unint64_t v31 = sub_10000A27C();
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_100005128;
    uint64_t v33 = *(void *)(v0 + 304);
    uint64_t v34 = *(void *)(v0 + 280);
    return dispatch thunk of AsyncIteratorProtocol.next()(v33, v34, v31);
  }
}

uint64_t sub_100005128()
{
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100005960;
  }
  else {
    uint64_t v2 = sub_10000523C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000523C()
{
  uint64_t v52 = v0;
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[32];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[36] + 8))(v0[37], v0[35]);
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v4 = sub_10000F510();
    sub_10000A970(0, &qword_100019190);
    uint64_t v48 = sub_10000F530();
    os_log_type_t type = v4;
    BOOL v5 = os_log_type_enabled(v48, v4);
    uint64_t v6 = v0[29];
    uint64_t v7 = v0[30];
    uint64_t v50 = v0[28];
    uint64_t v8 = v0[24];
    uint64_t v10 = v0[20];
    uint64_t v9 = v0[21];
    uint64_t v11 = v0[18];
    uint64_t v12 = v0[19];
    uint64_t v14 = v0[16];
    uint64_t v13 = v0[17];
    if (v5)
    {
      uint64_t v45 = v0[17];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      buf = v15;
      uint64_t v43 = v7;
      uint64_t v44 = v12;
      uint64_t v16 = sub_10000F360();
      uint64_t v17 = *(void *)(v16 - 8);
      uint64_t v18 = swift_task_alloc();
      sub_10000F340();
      uint64_t v40 = v8;
      uint64_t v19 = sub_10000F320();
      uint64_t v42 = v14;
      uint64_t v20 = *(void *)(v19 - 8);
      uint64_t v41 = v11;
      uint64_t v21 = swift_task_alloc();
      sub_10000F210();
      sub_10000A2CC();
      sub_10000F350();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v19);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v16);
      swift_task_dealloc();
      swift_task_dealloc();
      v0[12] = sub_100008570(v0[7], v0[8], &v51);
      sub_10000F550();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v48, type, "Deliveries completed at %s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v43, v50);
      sub_10000AB54(v40, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v44);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v41, v42);
    }
    else
    {

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v50);
      sub_10000AB54(v8, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v12);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v14);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v37 = (uint64_t (*)(void))v0[1];
    return v37();
  }
  else
  {
    uint64_t v49 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t typea = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(typea, v1, v2);
    sub_10000F510();
    sub_100007F04(&qword_100019278);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100010790;
    uint64_t v23 = sub_10000F360();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = swift_task_alloc();
    sub_10000F340();
    uint64_t v26 = sub_10000F320();
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = swift_task_alloc();
    sub_10000F210();
    *(void *)(v22 + 56) = &type metadata for String;
    unint64_t v29 = sub_10000A318();
    *(void *)(v22 + 64) = v29;
    sub_10000A2CC();
    sub_10000F350();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v26);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = sub_10000F370();
    *(void *)(v22 + 96) = &type metadata for String;
    *(void *)(v22 + 104) = v29;
    *(void *)(v22 + 72) = v30;
    *(void *)(v22 + 80) = v31;
    sub_10000A970(0, &qword_100019190);
    uint64_t v32 = (void *)sub_10000F530();
    sub_10000F420();

    swift_bridgeObjectRelease();
    v49(typea, v2);
    swift_task_dealloc();
    unint64_t v33 = sub_10000A27C();
    uint64_t v34 = (void *)swift_task_alloc();
    v0[39] = v34;
    void *v34 = v0;
    v34[1] = sub_100005128;
    uint64_t v35 = v0[38];
    uint64_t v36 = v0[35];
    return dispatch thunk of AsyncIteratorProtocol.next()(v35, v36, v33);
  }
}

uint64_t sub_100005960()
{
  *(void *)(v0 + 88) = *(void *)(v0 + 320);
  sub_100007F04(&qword_100019268);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_1000059EC, 0, 0);
}

uint64_t sub_1000059EC()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[35];
  uint64_t v3 = v0[36];
  uint64_t v4 = v0[29];
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[28];
  uint64_t v7 = v0[24];
  uint64_t v8 = v0[20];
  uint64_t v12 = v0[19];
  uint64_t v13 = v0[21];
  uint64_t v9 = v0[17];
  uint64_t v15 = v0[18];
  uint64_t v14 = v0[16];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_10000AB54(v7, &qword_100019220);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v15, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100005B3C()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

unint64_t sub_100005C0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007F04(&qword_100019378);
  uint64_t v2 = (void *)sub_10000F5E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_100009CE8(v7, v8);
    unint64_t result = sub_100008FC0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_100005EB0(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  unint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *unint64_t v8 = v3;
  v8[1] = sub_100005F88;
  v8[13] = a1;
  v8[14] = v7;
  return _swift_task_switch(sub_1000042EC, 0, 0);
}

uint64_t sub_100005F88()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v9 = (void *)sub_10000F2A0();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_100006124(uint64_t a1)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = v1;
  return _swift_task_switch(sub_100006144, 0, 0);
}

uint64_t sub_100006144()
{
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v1 = &type metadata accessor for LSKLocalStatusClient == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    sub_10000F510();
    sub_10000A970(0, &qword_100019190);
    uint64_t v11 = (void *)sub_10000F530();
    sub_10000F420();

    goto LABEL_18;
  }
  uint64_t v5 = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 72)) + 0x70))();
  *(void *)(v0 + 80) = v5;
  if (!v5)
  {
LABEL_18:
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
  id v6 = *(void **)(v0 + 72);
  uint64_t v7 = sub_100007F04(&qword_1000191B0);
  *(void *)(v0 + 88) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v0 + 96) = v8;
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 104) = v9;
  sub_100007F04(&qword_1000191B8);
  uint64_t v10 = swift_task_alloc();
  (*(void (**)(void))((swift_isaMask & *v6) + 0xA0))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v7) == 1)
  {
    swift_release();
    sub_10000AB54(v10, &qword_1000191B8);
    swift_task_dealloc();
    swift_task_dealloc();
    goto LABEL_18;
  }
  BOOL v14 = *(void **)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v9, v10, v7);
  swift_task_dealloc();
  uint64_t v30 = v9;
  uint64_t v15 = sub_10000F3F0();
  *(void *)(v0 + 112) = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  *(void *)(v0 + 120) = v16;
  uint64_t v17 = swift_task_alloc();
  *(void *)(v0 + 128) = v17;
  sub_100007F04(&qword_1000191A8);
  uint64_t v18 = swift_task_alloc();
  (*(void (**)(void))((swift_isaMask & *v14) + 0x88))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v18, 1, v15) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v30, v7);
    swift_release();
    sub_10000AB54(v18, &qword_1000191A8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    goto LABEL_18;
  }
  uint64_t v19 = *(void *)(v0 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v17, v18, v15);
  swift_task_dealloc();
  uint64_t v20 = sub_100007F04(&qword_100019220);
  *(void *)(v0 + 136) = v20;
  *(void *)(v0 + 144) = *(void *)(*(void *)(v20 - 8) + 64);
  uint64_t v21 = swift_task_alloc();
  *(void *)(v0 + 152) = v21;
  if (v19) {
    unint64_t v22 = (unint64_t)sub_1000029D8(*(void *)(v0 + 64));
  }
  else {
    unint64_t v22 = sub_100005C0C((uint64_t)&_swiftEmptyArrayStorage);
  }
  *(void *)(v0 + 160) = v22;
  uint64_t v23 = *(int *)(v20 + 48);
  *(_DWORD *)(v0 + 288) = v23;
  uint64_t v24 = v21 + v23;
  *(void *)(v0 + 32) = v22;
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v25;
  uint64_t v26 = sub_100007F04(&qword_1000191D8);
  uint64_t v27 = sub_100009ED8(&qword_1000191E0, (void (*)(void))sub_100009E90);
  uint64_t v28 = sub_100009ED8(&qword_1000191F0, (void (*)(void))sub_100009F54);
  sub_10000A0F4();
  *uint64_t v25 = v0;
  v25[1] = sub_10000672C;
  return LSKLocalStatusClient.publish<A>(_:for:options:)(v21, v24, v0 + 32, v30, v17, v26, v27, v28);
}

uint64_t sub_10000672C()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_100007948;
  }
  else {
    uint64_t v2 = sub_10000685C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000685C()
{
  uint64_t v56 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = v1 + *(int *)(v0 + 288);
  uint64_t v4 = sub_100007F04(&qword_100019238);
  *(void *)(v0 + 184) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v0 + 192) = v5;
  uint64_t v54 = swift_task_alloc();
  *(void *)(v0 + 200) = v54;
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = v6 + *(int *)(v2 + 48);
  uint64_t v8 = sub_100007F04(&qword_100019240);
  *(void *)(v0 + 208) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v0 + 216) = v9;
  uint64_t v53 = *(void (**)(void))(v9 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v53)(v6, v1, v8);
  sub_10000A1B0(v3, v7, &qword_100019248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 136);
    uint64_t v11 = *(void *)(v0 + 152) + *(int *)(v0 + 288);
    sub_10000AB54(v7, &qword_100019248);
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v51(v6, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v12 = sub_10000F520();
    uint64_t v13 = swift_task_alloc();
    uint64_t v14 = v13 + *(int *)(v10 + 48);
    v53();
    sub_10000A1B0(v11, v14, &qword_100019248);
    uint64_t v15 = swift_task_alloc();
    uint64_t v16 = v13;
    uint64_t v17 = v15;
    sub_10000A214(v16, v15);
    sub_10000A970(0, &qword_100019190);
    uint64_t v18 = sub_10000F530();
    BOOL v19 = os_log_type_enabled(v18, v12);
    uint64_t v52 = *(void *)(v0 + 152);
    if (v19)
    {
      log = v18;
      uint64_t v20 = *(void *)(v0 + 136);
      uint64_t v46 = *(void *)(v0 + 112);
      uint64_t v47 = *(void *)(v0 + 128);
      uint64_t v48 = *(void *)(v0 + 96);
      uint64_t v49 = *(void *)(v0 + 88);
      uint64_t v50 = *(void *)(v0 + 104);
      uint64_t v45 = *(void *)(v0 + 120);
      os_log_type_t type = v12;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v22 = swift_task_alloc();
      uint64_t v23 = *(int *)(v20 + 48);
      uint64_t v24 = v22 + v23;
      uint64_t v25 = v17 + v23;
      v53();
      sub_10000A1B0(v25, v24, &qword_100019248);
      uint64_t v26 = sub_10000F370();
      unint64_t v28 = v27;
      v51(v22, v8);
      sub_10000AB54(v24, &qword_100019248);
      swift_task_dealloc();
      *(void *)(v0 + 40) = sub_100008570(v26, v28, &v55);
      sub_10000F550();
      swift_bridgeObjectRelease();
      sub_10000AB54(v17, &qword_100019220);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Not scanning for deliveries? %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      sub_10000AB54(v52, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v46);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v50, v49);
      swift_task_dealloc();
      swift_task_dealloc();
    }
    else
    {
      uint64_t v36 = *(void *)(v0 + 120);
      uint64_t v35 = *(void *)(v0 + 128);
      uint64_t v38 = *(void *)(v0 + 104);
      uint64_t v37 = *(void *)(v0 + 112);
      uint64_t v39 = *(void *)(v0 + 88);
      uint64_t v40 = *(void *)(v0 + 96);

      swift_release();
      sub_10000AB54(v17, &qword_100019220);
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10000AB54(v52, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v54, v7, v4);
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    *(void *)(v0 + 224) = v29;
    *(void *)(v0 + 232) = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v29(v6, v8);
    swift_task_dealloc();
    uint64_t v30 = sub_100007F04(&qword_100019250);
    *(void *)(v0 + 240) = v30;
    *(void *)(v0 + 248) = *(void *)(v30 - 8);
    *(void *)(v0 + 256) = swift_task_alloc();
    sub_10000F380();
    sub_100007F04(&qword_100019258);
    *(void *)(v0 + 264) = swift_task_alloc();
    unint64_t v31 = sub_10000A27C();
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_100006F34;
    uint64_t v33 = *(void *)(v0 + 264);
    uint64_t v34 = *(void *)(v0 + 240);
    return dispatch thunk of AsyncIteratorProtocol.next()(v33, v34, v31);
  }
}

uint64_t sub_100006F34()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000776C;
  }
  else {
    uint64_t v2 = sub_100007048;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007048()
{
  uint64_t v52 = v0;
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v4 = sub_10000F510();
    sub_10000A970(0, &qword_100019190);
    uint64_t v48 = sub_10000F530();
    os_log_type_t type = v4;
    BOOL v5 = os_log_type_enabled(v48, v4);
    uint64_t v6 = v0[24];
    uint64_t v7 = v0[25];
    uint64_t v50 = v0[23];
    uint64_t v8 = v0[19];
    uint64_t v10 = v0[15];
    uint64_t v9 = v0[16];
    uint64_t v11 = v0[13];
    uint64_t v12 = v0[14];
    uint64_t v14 = v0[11];
    uint64_t v13 = v0[12];
    if (v5)
    {
      uint64_t v45 = v0[12];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      buf = v15;
      uint64_t v43 = v7;
      uint64_t v44 = v12;
      uint64_t v16 = sub_10000F360();
      uint64_t v17 = *(void *)(v16 - 8);
      uint64_t v18 = swift_task_alloc();
      sub_10000F340();
      uint64_t v40 = v8;
      uint64_t v19 = sub_10000F320();
      uint64_t v42 = v14;
      uint64_t v20 = *(void *)(v19 - 8);
      uint64_t v41 = v11;
      uint64_t v21 = swift_task_alloc();
      sub_10000F210();
      sub_10000A2CC();
      sub_10000F350();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v19);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v16);
      swift_task_dealloc();
      swift_task_dealloc();
      v0[7] = sub_100008570(v0[2], v0[3], &v51);
      sub_10000F550();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v48, type, "Deliveries completed at %s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v43, v50);
      sub_10000AB54(v40, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v44);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v41, v42);
    }
    else
    {

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v50);
      sub_10000AB54(v8, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v12);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v14);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v37 = (uint64_t (*)(void))v0[1];
    return v37();
  }
  else
  {
    uint64_t v49 = (void (*)(uint64_t, uint64_t))v0[28];
    uint64_t typea = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(typea, v1, v2);
    sub_10000F510();
    sub_100007F04(&qword_100019278);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100010790;
    uint64_t v23 = sub_10000F360();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = swift_task_alloc();
    sub_10000F340();
    uint64_t v26 = sub_10000F320();
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = swift_task_alloc();
    sub_10000F210();
    *(void *)(v22 + 56) = &type metadata for String;
    unint64_t v29 = sub_10000A318();
    *(void *)(v22 + 64) = v29;
    sub_10000A2CC();
    sub_10000F350();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v26);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = sub_10000F370();
    *(void *)(v22 + 96) = &type metadata for String;
    *(void *)(v22 + 104) = v29;
    *(void *)(v22 + 72) = v30;
    *(void *)(v22 + 80) = v31;
    sub_10000A970(0, &qword_100019190);
    uint64_t v32 = (void *)sub_10000F530();
    sub_10000F420();

    swift_bridgeObjectRelease();
    v49(typea, v2);
    swift_task_dealloc();
    unint64_t v33 = sub_10000A27C();
    uint64_t v34 = (void *)swift_task_alloc();
    v0[34] = v34;
    void *v34 = v0;
    v34[1] = sub_100006F34;
    uint64_t v35 = v0[33];
    uint64_t v36 = v0[30];
    return dispatch thunk of AsyncIteratorProtocol.next()(v35, v36, v33);
  }
}

uint64_t sub_10000776C()
{
  *(void *)(v0 + 48) = *(void *)(v0 + 280);
  sub_100007F04(&qword_100019268);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_1000077F8, 0, 0);
}

uint64_t sub_1000077F8()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[24];
  uint64_t v5 = v0[25];
  uint64_t v6 = v0[23];
  uint64_t v7 = v0[19];
  uint64_t v8 = v0[15];
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[16];
  uint64_t v9 = v0[12];
  uint64_t v15 = v0[13];
  uint64_t v14 = v0[11];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_10000AB54(v7, &qword_100019220);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v15, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100007948()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[12];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100007B94(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  if (a1)
  {
    sub_10000A970(0, &qword_100019348);
    a1 = sub_10000F4B0();
  }
  v3[4] = a1;
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100007C98;
  v7[8] = a1;
  v7[9] = v6;
  return _swift_task_switch(sub_100006144, 0, 0);
}

uint64_t sub_100007C98()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_10000F2A0();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

id sub_100007E38()
{
  return sub_100007E54(0, type metadata accessor for RDStatusSharer);
}

id sub_100007E54(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t sub_100007F04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007F48(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000AD04;
  return v6();
}

uint64_t sub_100008014(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000AD04;
  return v7();
}

uint64_t sub_1000080E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000AB54(a1, &qword_100019300);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000F4D0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000828C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100008368;
  return v6(a1);
}

uint64_t sub_100008368()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_100008460(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100007F04(&qword_100019390);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100009BF4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008570(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008644(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000AAF4((uint64_t)v12, *a3);
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
      sub_10000AAF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AC8C((uint64_t)v12);
  return v7;
}

uint64_t sub_100008644(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000F560();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008800(a5, a6);
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
  uint64_t v8 = sub_10000F590();
  if (!v8)
  {
    sub_10000F5A0();
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

uint64_t sub_100008800(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008898(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008AF4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008AF4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008898(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008A10(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000F570();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000F5A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000F450();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000F5F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000F5A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008A10(uint64_t a1, uint64_t a2)
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
  sub_100007F04(&qword_100019370);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008A78(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_10000F490();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_10000F470();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100008AF4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007F04(&qword_100019370);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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

char *sub_100008C44(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_1000107A0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_10000F240() && __OFSUB__((int)v4, sub_10000F270())) {
        goto LABEL_24;
      }
      sub_10000F280();
      swift_allocObject();
      uint64_t v13 = sub_10000F220();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_1000097EC((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_10000F2C0();
      uint64_t result = sub_1000097EC(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_100008F48@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_10000992C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1000099F0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_100009A6C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

unint64_t sub_100008FC0(uint64_t a1, uint64_t a2)
{
  sub_10000F620();
  sub_10000F440();
  Swift::Int v4 = sub_10000F630();

  return sub_1000094D0(a1, a2, v4);
}

uint64_t sub_100009038(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007F04(&qword_100019378);
  char v6 = a2;
  uint64_t v7 = sub_10000F5D0();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_100009CE8(v37, *((unint64_t *)&v37 + 1));
      }
      sub_10000F620();
      sub_10000F440();
      uint64_t result = sub_10000F630();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      uint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      void *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v8;
  return result;
}

uint64_t sub_100009348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100008FC0(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1000095B4();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_100009D40(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100009038(v17, a5 & 1);
  unint64_t v23 = sub_100008FC0(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_10000F610();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *int64_t v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

unint64_t sub_1000094D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000F600() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000F600() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1000095B4()
{
  uint64_t v1 = v0;
  sub_100007F04(&qword_100019378);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000F5C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_100009CE8(v24, *((unint64_t *)&v24 + 1));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000977C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1000097EC(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_10000F240();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_10000F270();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_10000F260();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_1000098A0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10000F570();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000992C(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1000099F0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_10000F280();
  swift_allocObject();
  uint64_t result = sub_10000F230();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_10000F2D0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_100009A6C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_10000F280();
  swift_allocObject();
  uint64_t result = sub_10000F230();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_100009AF0(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_10000992C(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_1000099F0((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_100009A6C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_100009B54(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_10000F280();
      swift_allocObject();
      sub_10000F250();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_10000F2D0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_100009BF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10000F5F0();
  __break(1u);
  return result;
}

uint64_t sub_100009CE8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100009D40(uint64_t a1, unint64_t a2)
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

uint64_t sub_100009D98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007F04(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for RDStatusSharer()
{
  uint64_t result = qword_100019610;
  if (!qword_100019610) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009E48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009E90()
{
  unint64_t result = qword_1000191E8;
  if (!qword_1000191E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000191E8);
  }
  return result;
}

uint64_t sub_100009ED8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009E48(&qword_1000191D8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100009F54()
{
  unint64_t result = qword_1000191F8;
  if (!qword_1000191F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000191F8);
  }
  return result;
}

unint64_t sub_100009F9C()
{
  unint64_t result = qword_100019208;
  if (!qword_100019208)
  {
    sub_100009E48(&qword_100019200);
    sub_100009ED8(&qword_1000191E0, (void (*)(void))sub_100009E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019208);
  }
  return result;
}

unint64_t sub_10000A048()
{
  unint64_t result = qword_100019210;
  if (!qword_100019210)
  {
    sub_100009E48(&qword_100019200);
    sub_100009ED8(&qword_1000191F0, (void (*)(void))sub_100009F54);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019210);
  }
  return result;
}

unint64_t sub_10000A0F4()
{
  unint64_t result = qword_100019228;
  if (!qword_100019228)
  {
    sub_100009E48(&qword_1000191D8);
    sub_10000A168();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019228);
  }
  return result;
}

unint64_t sub_10000A168()
{
  unint64_t result = qword_100019230;
  if (!qword_100019230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019230);
  }
  return result;
}

uint64_t sub_10000A1B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007F04(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F04(&qword_100019220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000A27C()
{
  unint64_t result = qword_100019260;
  if (!qword_100019260)
  {
    sub_100009E48(&qword_100019250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019260);
  }
  return result;
}

unint64_t sub_10000A2CC()
{
  unint64_t result = qword_100019270;
  if (!qword_100019270)
  {
    sub_10000F320();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019270);
  }
  return result;
}

unint64_t sub_10000A318()
{
  unint64_t result = qword_100019280;
  if (!qword_100019280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019280);
  }
  return result;
}

uint64_t sub_10000A360()
{
  return type metadata accessor for RDStatusSharer();
}

void sub_10000A368()
{
  sub_10000A498();
  if (v0 <= 0x3F)
  {
    sub_10000A4F0(319, &qword_1000192F0, &qword_1000191B0);
    if (v1 <= 0x3F)
    {
      sub_10000A4F0(319, &qword_1000192F8, &qword_1000191C0);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10000A498()
{
  if (!qword_1000192E8)
  {
    sub_10000F3F0();
    unint64_t v0 = sub_10000F540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000192E8);
    }
  }
}

void sub_10000A4F0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_100009E48(a3);
    unint64_t v4 = sub_10000F540();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10000A544()
{
  uint64_t v2 = v0[2];
  char v3 = (void *)v0[3];
  unint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000AD04;
  unint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100019308 + dword_100019308);
  return v6(v2, v3, v4);
}

uint64_t sub_10000A5FC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000AD04;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100019318 + dword_100019318);
  return v6(v2, v3, v4);
}

uint64_t sub_10000A6C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_10000AD04;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100019328 + dword_100019328);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000A78C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A7C4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A87C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100019338 + dword_100019338);
  return v6(a1, v4);
}

uint64_t sub_10000A87C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A970(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000A9B0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A9F8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000A87C;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100019350 + dword_100019350);
  return v6(v2, v3, v4);
}

uint64_t sub_10000AAB4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000AAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AB54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007F04(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_10000ABB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_10000977C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10000ACDC, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_10000AC1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100009D40(a1, a2);
  }
  return a1;
}

uint64_t sub_10000AC30(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000AC48(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000AC8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000ACDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1000098A0(a1, a2);
}

void start()
{
  if (qword_100019398 != -1) {
    dispatch_once(&qword_100019398, &stru_1000149D0);
  }
  uint64_t v0 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    uint64_t v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting countryd\"}", (uint8_t *)v4, 0x12u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100014990);
  long long v2 = objc_alloc_init(RDCommServer);
  long long v3 = (void *)qword_100019620;
  qword_100019620 = (uint64_t)v2;

  dispatch_main();
}

void sub_10000AE04(id a1, OS_xpc_object *a2)
{
  long long v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_1000149D0);
    }
    uint64_t v4 = qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = string;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Got Darwin notification\", \"notification\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }
    if (!strcmp("com.apple.os-eligibility-domain.input-needed", string))
    {
      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_1000149D0);
      }
      __int16 v5 = qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        uint64_t v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"eligibility engine wants input\"}", (uint8_t *)&v7, 0x12u);
      }
      uint64_t v6 = +[RDCachedData loadCache];
      [v6 postResultsToEligibilityEngine];
    }
  }
}

void sub_10000AFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AFF0(id a1)
{
  qword_1000193A0 = (uint64_t)os_log_create("com.apple.countryd", "Daemon");

  _objc_release_x1();
}

uint64_t sub_10000B7F4()
{
  uint64_t v0 = +[NSXPCConnection currentConnection];
  uint64_t v1 = [v0 valueForEntitlement:@"com.apple.countryd.contribute"];
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v1 BOOLValue] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    long long v3 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = v3;
      int v9 = 68289538;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "com.apple.countryd.contribute";
      __int16 v15 = 1026;
      unsigned int v16 = [v0 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"peer process is missing entitlement to contribute data\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v9, 0x22u);

      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
    }
    __int16 v5 = (void *)qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      uint64_t v6 = v5;
      unsigned int v7 = [v0 processIdentifier];
      int v9 = 68289538;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "com.apple.countryd.contribute";
      __int16 v15 = 1026;
      unsigned int v16 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "peer process is missing entitlement to contribute data", "{\"msg%{public}.0s\":\"peer process is missing entitlement to contribute data\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v9, 0x22u);
    }
    uint64_t v2 = 0;
  }

  return v2;
}

id sub_10000BA2C()
{
  id v0 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.RegulatoryDomain"];
  id v1 = [v0 BOOLForKey:@"UpdatesLocked"];

  return v1;
}

void sub_10000CD74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = [*(id *)(a1 + 40) dataCache];
  uint64_t v4 = [v3 getEstimateForPeerDeviceWithID:*(void *)(a1 + 48)];
  __int16 v5 = v4;
  if (v2)
  {
    uint64_t v6 = *(void **)(a1 + 32);

    if (v5 != v6)
    {
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
      unsigned int v7 = (void *)qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
      {
        id v8 = *(id *)(a1 + 48);
        int v9 = v7;
        id v10 = [v8 UTF8String];
        uint64_t v11 = *(void *)(a1 + 32);
        int v21 = 68289538;
        int v22 = 0;
        __int16 v23 = 2082;
        long long v24 = "";
        __int16 v25 = 2082;
        id v26 = v10;
        __int16 v27 = 2114;
        uint64_t v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updating estimate for peer\", \"peer\":%{public, location:escape_only}s, \"estimate\":%{public, location:escape_only}@}", (uint8_t *)&v21, 0x26u);
      }
      uint64_t v12 = [*(id *)(a1 + 40) dataCache];
      [v12 setEstimate:*(void *)(a1 + 32) forPeerDeviceWithID:*(void *)(a1 + 48)];
      goto LABEL_23;
    }
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    unsigned int v16 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
    {
      id v17 = *(id *)(a1 + 48);
      uint64_t v12 = v16;
      int v21 = 68289282;
      int v22 = 0;
      __int16 v23 = 2082;
      long long v24 = "";
      __int16 v25 = 2082;
      id v26 = [v17 UTF8String];
      uint64_t v18 = "{\"msg%{public}.0s\":\"estimate for peer unchanged, ignoring\", \"peer\":%{public, location:escape_only}s}";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0x1Cu);
LABEL_23:
    }
  }
  else
  {

    if (v5)
    {
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
      __int16 v13 = (void *)qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
      {
        id v14 = *(id *)(a1 + 48);
        __int16 v15 = v13;
        int v21 = 68289282;
        int v22 = 0;
        __int16 v23 = 2082;
        long long v24 = "";
        __int16 v25 = 2082;
        id v26 = [v14 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"peer went away\", \"peer\":%{public, location:escape_only}s}", (uint8_t *)&v21, 0x1Cu);
      }
      uint64_t v12 = [*(id *)(a1 + 40) dataCache];
      [v12 removeEstimateForPeerDeviceWithID:*(void *)(a1 + 48)];
      goto LABEL_23;
    }
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    uint64_t v19 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
    {
      id v20 = *(id *)(a1 + 48);
      uint64_t v12 = v19;
      int v21 = 68289282;
      int v22 = 0;
      __int16 v23 = 2082;
      long long v24 = "";
      __int16 v25 = 2082;
      id v26 = [v20 UTF8String];
      uint64_t v18 = "{\"msg%{public}.0s\":\"peer already not used, nothing to do\", \"peer\":%{public, location:escape_only}s}";
      goto LABEL_22;
    }
  }
}

void sub_10000D1BC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_100014AB8);
    }
    long long v3 = (void *)qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = v3;
      __int16 v5 = [(NSError *)v2 description];
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to share status with peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);

      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_100014AB8);
      }
    }
    uint64_t v6 = (void *)qword_1000193A0;
    if (os_signpost_enabled((os_log_t)qword_1000193A0))
    {
      unsigned int v7 = v6;
      id v8 = [(NSError *)v2 description];
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      id v14 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to share status with peers", "{\"msg%{public}.0s\":\"failed to share status with peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_10000D3E4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_100014AB8);
    }
    long long v3 = (void *)qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = v3;
      __int16 v5 = [(NSError *)v2 description];
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to clear status to peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);

      if (qword_100019398 != -1) {
        dispatch_once(&qword_100019398, &stru_100014AB8);
      }
    }
    uint64_t v6 = (void *)qword_1000193A0;
    if (os_signpost_enabled((os_log_t)qword_1000193A0))
    {
      unsigned int v7 = v6;
      id v8 = [(NSError *)v2 description];
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      id v14 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to clear status to peers", "{\"msg%{public}.0s\":\"failed to clear status to peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_10000E0CC(id a1)
{
  qword_1000193B0 = (uint64_t)os_log_create("com.apple.countryd", "Shared");

  _objc_release_x1();
}

void sub_10000E110(id a1)
{
  long long v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.countryd.serialqueue", v3);
  uint64_t v2 = (void *)qword_100019628;
  qword_100019628 = (uint64_t)v1;
}

void sub_10000E174(id a1)
{
  qword_1000193A0 = (uint64_t)os_log_create("com.apple.countryd", "Daemon");

  _objc_release_x1();
}

void sub_10000F1CC(id a1)
{
  qword_1000193A0 = (uint64_t)os_log_create("com.apple.countryd", "Daemon");

  _objc_release_x1();
}

uint64_t sub_10000F210()
{
  return static FormatStyle<>.iso8601.getter();
}

uint64_t sub_10000F220()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t sub_10000F230()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_10000F240()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_10000F250()
{
  return __DataStorage.init(length:)();
}

uint64_t sub_10000F260()
{
  return __DataStorage._length.getter();
}

uint64_t sub_10000F270()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_10000F280()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_10000F290()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t sub_10000F2A0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000F2B0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000F2C0()
{
  return Data.LargeSlice.ensureUniqueReference()();
}

uint64_t sub_10000F2D0()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t sub_10000F2E0()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t sub_10000F2F0()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t sub_10000F300()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F310()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_10000F320()
{
  return type metadata accessor for Date.ISO8601FormatStyle();
}

uint64_t sub_10000F330()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F340()
{
  return static Date.now.getter();
}

uint64_t sub_10000F350()
{
  return Date.formatted<A>(_:)();
}

uint64_t sub_10000F360()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000F370()
{
  return LSKPublishedStatus.debugDescription.getter();
}

uint64_t sub_10000F380()
{
  return LSKPublishedStatusSequence.makeAsyncIterator()();
}

uint64_t sub_10000F3A0()
{
  return LSKLocalStatusClient.init()();
}

uint64_t sub_10000F3B0()
{
  return type metadata accessor for LSKLocalStatusClient();
}

uint64_t sub_10000F3C0()
{
  return type metadata accessor for LSKStatusOptions.DeviceType();
}

uint64_t sub_10000F3D0()
{
  return type metadata accessor for LSKStatusOptions.Scope();
}

uint64_t sub_10000F3E0()
{
  return LSKStatusOptions.init(scope:publishToDeviceTypes:)();
}

uint64_t sub_10000F3F0()
{
  return type metadata accessor for LSKStatusOptions();
}

uint64_t sub_10000F400()
{
  return LSKKey.init(domain:name:)();
}

uint64_t sub_10000F410()
{
  return type metadata accessor for LSKDomain();
}

uint64_t sub_10000F420()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10000F430()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F440()
{
  return String.hash(into:)();
}

Swift::Int sub_10000F450()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000F460()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_10000F470()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_10000F480()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_10000F490()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_10000F4A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000F4B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F4C0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000F4D0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
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
  return static OS_os_log.default.getter();
}

uint64_t sub_10000F540()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10000F550()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000F560()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000F570()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000F580()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000F590()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000F5A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000F5B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000F5C0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000F5D0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000F5E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000F5F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000F600()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000F610()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000F620()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000F630()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFGetProgname()
{
  return __CFGetProgname();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uid_t geteuid(void)
{
  return _geteuid();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:")];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_BOOLValueSafe(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValueSafe];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_clearStatusSharedWithPeers(void *a1, const char *a2, ...)
{
  return _[a1 clearStatusSharedWithPeers];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_createNewDataCache(void *a1, const char *a2, ...)
{
  return _[a1 createNewDataCache];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_dataCache(void *a1, const char *a2, ...)
{
  return _[a1 dataCache];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:x0 options:x1 error:x2];
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
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getCacheDirPath(void *a1, const char *a2, ...)
{
  return _[a1 getCacheDirPath];
}

id objc_msgSend_getCachePath(void *a1, const char *a2, ...)
{
  return _[a1 getCachePath];
}

id objc_msgSend_getEstimateForPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return [a1 getEstimateForPeerDeviceWithID:];
}

id objc_msgSend_getLocalOnlyEstimates(void *a1, const char *a2, ...)
{
  return _[a1 getLocalOnlyEstimates];
}

id objc_msgSend_hasLocalStatusKit(void *a1, const char *a2, ...)
{
  return _[a1 hasLocalStatusKit];
}

id objc_msgSend_initWithCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithCache:];
}

id objc_msgSend_initWithCountryCode_andDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithCountryCode:andDate:];
}

id objc_msgSend_initWithCountryCode_priority_timestamp_inDisputedArea_(void *a1, const char *a2, ...)
{
  return [a1 initWithCountryCode:x0 priority:x1 timestamp:x2 inDisputedArea:x3];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_lastShareDate(void *a1, const char *a2, ...)
{
  return _[a1 lastShareDate];
}

id objc_msgSend_loadCache(void *a1, const char *a2, ...)
{
  return _[a1 loadCache];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return [a1 pathWithComponents:];
}

id objc_msgSend_postResultsToEligibilityEngine(void *a1, const char *a2, ...)
{
  return _[a1 postResultsToEligibilityEngine];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_recompute(void *a1, const char *a2, ...)
{
  return _[a1 recompute];
}

id objc_msgSend_removeEstimateForPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return [a1 removeEstimateForPeerDeviceWithID:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setCountriesFromLocation_(void *a1, const char *a2, ...)
{
  return [a1 setCountriesFromLocation:];
}

id objc_msgSend_setCountriesFromLocation_isInDisputedArea_(void *a1, const char *a2, ...)
{
  return [a1 setCountriesFromLocation:isInDisputedArea:];
}

id objc_msgSend_setCountriesFromNearbyCells_(void *a1, const char *a2, ...)
{
  return [a1 setCountriesFromNearbyCells:];
}

id objc_msgSend_setCountriesFromServingCell_(void *a1, const char *a2, ...)
{
  return [a1 setCountriesFromServingCell:];
}

id objc_msgSend_setCountriesFromWiFiAPs_(void *a1, const char *a2, ...)
{
  return [a1 setCountriesFromWiFiAPs:];
}

id objc_msgSend_setCountryFromLocation_(void *a1, const char *a2, ...)
{
  return [a1 setCountryFromLocation:];
}

id objc_msgSend_setCountryFromMCC_(void *a1, const char *a2, ...)
{
  return [a1 setCountryFromMCC:];
}

id objc_msgSend_setCountryFromWiFiAPs_(void *a1, const char *a2, ...)
{
  return [a1 setCountryFromWiFiAPs:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setEstimate_forPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return [a1 setEstimate:forPeerDeviceWithID:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_shareStatusWithEstimate_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 shareStatusWithEstimate:x0 completionHandler:x1];
}

id objc_msgSend_shareStatusesWithEstimates_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 shareStatusesWithEstimates:x0 completionHandler:x1];
}

id objc_msgSend_sharedCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 sharedCountryCode];
}

id objc_msgSend_sharer(void *a1, const char *a2, ...)
{
  return _[a1 sharer];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_updatePeer_withEstimate_(void *a1, const char *a2, ...)
{
  return [a1 updatePeer:withEstimate:];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}